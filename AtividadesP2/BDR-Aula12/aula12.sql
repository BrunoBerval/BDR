--Exercícios Banco "limnologia_db" 

-- Calcula a média, mínimo e máximo do pH para cada reservatório,
-- usando subconsultas correlacionadas no SELECT.
SELECT
    r.nome AS reservatorio,

    -- Subconsulta 1: Média de 'pH' para o reservatório 'r' da consulta principal.
    (SELECT AVG(s.valor)
     FROM series_temporais s
     INNER JOIN parametro p ON s.id_parametro = p.id_parametro
     WHERE s.id_reservatorio = r.id_reservatorio -- Correlaciona com a tabela 'r'
       AND p.nome = 'pH'
    ) AS media_ph,

    -- Subconsulta 2: Valor mínimo de 'pH' para o reservatório 'r'.
    (SELECT MIN(s.valor)
     FROM series_temporais s
     INNER JOIN parametro p ON s.id_parametro = p.id_parametro
     WHERE s.id_reservatorio = r.id_reservatorio -- Correlaciona com a tabela 'r'
       AND p.nome = 'pH'
    ) AS ph_minimo,

    -- Subconsulta 3: Valor máximo de 'pH' para o reservatório 'r'.
    (SELECT MAX(s.valor)
     FROM series_temporais s
     INNER JOIN parametro p ON s.id_parametro = p.id_parametro
     WHERE s.id_reservatorio = r.id_reservatorio -- Correlaciona com a tabela 'r'
       AND p.nome = 'pH'
    ) AS ph_maximo

-- Tabela principal (externa)
FROM reservatorio r
ORDER BY r.nome;