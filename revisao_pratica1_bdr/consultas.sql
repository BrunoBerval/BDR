--Consulta para listar todos os clientes cadastrados
SELECT id_cliente, nome, cidade
FROM cliente;

--Consulta para listar todos os jogos lançados após 2020
SELECT titulo, ano_lancamento
FROM jogo
WHERE ano_lancamento > 2020;

--Consulta para somar quantos jogos foram comprados no total pela rede
SELECT SUM(quantidade) AS total_jogos_comprados
FROM compra_jogo;