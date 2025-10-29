--Inserção de dados na tabela loja
INSERT INTO loja (nome, cidade) VALUES
('GameVerse', 'São Paulo'),
('Pixel Play', 'Rio de Janeiro'),
('Next Level Games', 'Curitiba'),
('StartZone', 'Belo Horizonte'),
('Joystick Mania', 'Porto Alegre');

--Inserção de dados na tabela cliente
INSERT INTO cliente (nome, email, cidade) VALUES
('Lucas Moretti', 'lucas.moretti@email.com', 'São Paulo'),
('Aline Costa', 'aline.costa@email.com', 'Curitiba'),
('Renato Silva', 'renato.silva@email.com', 'Rio de Janeiro'),
('Bianca Ferreira', 'bianca.ferreira@email.com', 'Recife'),
('Carlos Tavares', 'carlos.tavares@email.com', 'Porto Alegre'),
('Juliana Rocha', 'juliana.rocha@email.com', 'Fortaleza'),
('Felipe Andrade', 'felipe.andrade@email.com', 'Belo Horizonte');

--Inserção de dados na tabela jogo
INSERT INTO jogo (titulo, ano_lancamento, genero) VALUES
('Shadow Legends', 2023, 'Ação'),
('Kingdoms of Terra', 2021, 'RPG'),
('Drift Rush Turbo', 2022, 'Corrida'),
('Galaxy Frontier', 2019, 'Ficção Científica'),
('Mystic Realms', 2018, 'Aventura');

--Inserção de dados na tabela compra
INSERT INTO compra (data_compra, id_cliente, id_loja) VALUES
('2025-08-01', 1, 1),
('2025-08-02', 2, 2),
('2025-08-03', 3, 3),
('2025-08-04', 4, 4),
('2025-08-05', 5, 5),
('2025-08-06', 6, 1),
('2025-08-07', 7, 2),
('2025-08-08', 1, 3);


--Inserção de dados na tabela compra_jogo

-- Compra 1
INSERT INTO compra_jogo (id_compra, id_jogo, quantidade) VALUES
(1, 1, 1),
(1, 2, 2);

-- Compra 2
INSERT INTO compra_jogo (id_compra, id_jogo, quantidade) VALUES
(2, 2, 1),
(2, 3, 1);

-- Compra 3
INSERT INTO compra_jogo (id_compra, id_jogo, quantidade) VALUES
(3, 3, 2),
(3, 4, 1);

-- Compra 4
INSERT INTO compra_jogo (id_compra, id_jogo, quantidade) VALUES
(4, 4, 1),
(4, 5, 1);

-- Compra 5
INSERT INTO compra_jogo (id_compra, id_jogo, quantidade) VALUES
(5, 5, 2),
(5, 1, 1);

-- Compra 6
INSERT INTO compra_jogo (id_compra, id_jogo, quantidade) VALUES
(6, 1, 1),
(6, 3, 2);

-- Compra 7
INSERT INTO compra_jogo (id_compra, id_jogo, quantidade) VALUES
(7, 2, 1),
(7, 5, 2);

-- Compra 8
INSERT INTO compra_jogo (id_compra, id_jogo, quantidade) VALUES
(8, 4, 1),
(8, 3, 1);
