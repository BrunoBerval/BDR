-- Exercícios do "BD Biblioteca"

-- 1. Contar quantos livros cada autor possui.
SELECT 
    a.nome AS autor, 
    COUNT(l.id_livro) AS total_livros
FROM autor a
INNER JOIN livro l ON a.id_autor = l.id_autor
GROUP BY a.nome
ORDER BY total_livros DESC;


-- 2. Calcular a média de páginas dos livros por editora.
--
-- NOTA: Consulta hipotética.
-- O schema original do BD Biblioteca não incluía 'editora' ou 'paginas'.
/*
SELECT 
    ed.nome AS editora,
    AVG(l.paginas) AS media_de_paginas
FROM livro l
INNER JOIN editora ed ON l.id_editora = ed.id_editora
GROUP BY ed.nome;
*/


-- ==============================================
-- Exercícios do "limnologia_db"
-- ==============================================
-- NOTA: O schema completo não foi fornecido.
-- As consultas abaixo são hipotéticas, baseadas nos exemplos do PDF.

-- 3. Contar o total de campanhas por reservatório.
SELECT 
    r.nome AS reservatorio, 
    COUNT(c.id_campanha) AS total_campanhas
FROM reservatorio r
INNER JOIN campanha c ON r.id_reservatorio = c.id_reservatorio
GROUP BY r.nome
ORDER BY total_campanhas DESC;


-- 4. Calcular a média de valores de cada parâmetro (em séries temporais).
SELECT 
    p.nome AS parametro,
    AVG(st.valor) AS media_de_valor
FROM series_temporais st
INNER JOIN parametro p ON st.id_parametro = p.id_parametro
GROUP BY p.nome;


-- 5. Listar instituições com MAIS DE 3 campanhas (usando HAVING).
SELECT 
    i.nome AS instituicao,
    COUNT(c.id_campanha) AS total_campanhas
FROM instituicao i
INNER JOIN campanha c ON i.id_instituicao = c.id_instituicao
GROUP BY i.nome
HAVING COUNT(c.id_campanha) > 3
ORDER BY total_campanhas DESC;