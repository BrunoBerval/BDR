-- Exercícios banco: 'limnologia_db'

-- 1. Verificando o nome do parâmetro
-- (Usado para confirmar que o nome é 'Oxigênio Dissolido')
SELECT * FROM parametro;


-- 2. Subconsulta isolada (para usar com IN)
-- Lista IDs únicos de reservatórios que mediram 'Oxigênio Dissolido'.
SELECT DISTINCT s.id_reservatorio -- DISTINCT evita IDs duplicados
FROM series_temporais s
INNER JOIN parametro p ON s.id_parametro = p.id_parametro
WHERE p.nome = 'Oxigênio Dissolido';


-- 3. Consulta principal usando IN
-- Busca nomes de reservatórios cujo ID está na lista da subconsulta anterior.
SELECT r.nome AS reservatorio
FROM reservatorio r
WHERE r.id_reservatorio IN (
    -- Início da subconsulta
    SELECT s.id_reservatorio
    FROM series_temporais s
    INNER JOIN parametro p ON s.id_parametro = p.id_parametro
    WHERE p.nome = 'Oxigênio Dissolido'
    -- Fim da subconsulta
);


-- 4. Consulta principal reescrita com EXISTS
-- Busca nomes de reservatórios onde 'EXISTE' ao menos uma medição
-- de 'Oxigênio Dissolido'.
SELECT r.nome AS reservatorio
FROM reservatorio r
WHERE EXISTS (
    -- Início da subconsulta correlacionada
    SELECT 1 -- 'SELECT 1' é otimizado, apenas checa a existência
    FROM series_temporais s
    INNER JOIN parametro p ON s.id_parametro = p.id_parametro
    WHERE s.id_reservatorio = r.id_reservatorio -- Condição de correlação (liga à consulta principal)
      AND p.nome = 'Oxigênio Dissolido'
    -- Fim da subconsulta
);


-- 5. Opcional: Comparação de desempenho (EXPLAIN ANALYZE)
-- (EXISTS é geralmente mais eficiente, pois para na primeira correspondência,
--  enquanto o IN precisa avaliar a lista inteira da subconsulta).

/*
EXPLAIN ANALYZE
SELECT r.nome AS reservatorio
FROM reservatorio r
WHERE r.id_reservatorio IN (
    SELECT s.id_reservatorio
    FROM series_temporais s
    INNER JOIN parametro p ON s.id_parametro = p.id_parametro
    WHERE p.nome = 'Oxigênio Dissolido'
);

EXPLAIN ANALYZE
SELECT r.nome AS reservatorio
FROM reservatorio r
WHERE EXISTS (
    SELECT 1
    FROM series_temporais s
    INNER JOIN parametro p ON s.id_parametro = p.id_parametro
    WHERE s.id_reservatorio = r.id_reservatorio
      AND p.nome = 'Oxigênio Dissolido'
);
*/