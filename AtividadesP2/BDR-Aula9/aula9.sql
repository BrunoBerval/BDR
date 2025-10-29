-- Consulta A: Título do evento e nome do tipo_evento (INNER JOIN).
-- (Mostra apenas eventos que possuem um tipo correspondente).
SELECT 
    e.titulo AS evento,
    te.nome AS tipo_evento
FROM evento e
INNER JOIN tipo_evento te ON e.id_tipo_evento = te.id_tipo_evento;


-- Consulta B: Título do evento, cidade e estado (INNER JOIN).
-- (Mostra apenas eventos que possuem uma localização correspondente).
SELECT 
    e.titulo AS evento,
    l.cidade,
    l.sigla_estado
FROM evento e
INNER JOIN localizacao l ON e.id_localizacao = l.id_localizacao;


--
-- PREPARAÇÃO PARA CONSULTA C (Testar joins com dados nulos)
--
-- Altera a tabela 'evento' para permitir 'id_localizacao' nulo.
ALTER TABLE evento
ALTER COLUMN id_localizacao DROP NOT NULL;

-- Insere dois eventos de teste com 'id_localizacao' NULO.
INSERT INTO evento (titulo, descricao, data_hora, status, id_tipo_evento, id_localizacao) VALUES
('Incêndio Misterioso', 'Fogo reportado, localização exata pendente.', '2025-09-10 10:00:00', 'Ativo', 
 (SELECT id_tipo_evento FROM tipo_evento WHERE nome = 'Queimada'), 
 NULL);

INSERT INTO evento (titulo, descricao, data_hora, status, id_tipo_evento, id_localizacao) VALUES
('Alerta de Deslizamento', 'Risco detectado por satélite, local a confirmar.', '2025-09-11 11:00:00', 'Em Monitoramento', 
 (SELECT id_tipo_evento FROM tipo_evento WHERE nome = 'Deslizamento'), 
 NULL);
--
-- FIM DA PREPARAÇÃO
--


-- Consulta C: Título, tipo e localização de TODOS os eventos.
-- (Usa LEFT JOIN para incluir eventos mesmo que 'id_localizacao' seja nulo).
SELECT 
    e.titulo AS evento,
    te.nome AS tipo_evento,
    l.cidade,
    l.sigla_estado
FROM evento e
INNER JOIN tipo_evento te ON e.id_tipo_evento = te.id_tipo_evento -- Um evento SEMPRE tem um tipo
LEFT JOIN localizacao l ON e.id_localizacao = l.id_localizacao;   -- Um evento PODE NÃO ter uma localização


-- Consulta D: Título do evento, cidade e estado (usando RIGHT JOIN).
-- (Esta consulta retorna o mesmo resultado da Consulta C, mas sem o tipo_evento.
--  Ela garante que TODOS os eventos da tabela 'evento' (à direita) sejam listados,
--  tenham eles uma localização correspondente ou não).
SELECT 
    e.titulo AS evento,
    l.cidade,
    l.sigla_estado
FROM localizacao l
RIGHT JOIN evento e ON l.id_localizacao = e.id_localizacao;


-- Consulta E: Contagem de eventos por cidade.
-- (Usa INNER JOIN para contar apenas eventos que TÊM uma cidade).
SELECT 
    l.cidade,
    COUNT(e.id_evento) AS quantidade_de_eventos
FROM evento e
INNER JOIN localizacao l ON e.id_localizacao = l.id_localizacao
GROUP BY l.cidade
ORDER BY quantidade_de_eventos DESC;