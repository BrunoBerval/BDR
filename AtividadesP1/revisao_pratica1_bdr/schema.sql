-- Criação do banco de dados
CREATE DATABASE rede_games;

-- Tabela: loja
CREATE TABLE loja (
    id_loja SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL
);

-- Tabela: jogo
CREATE TABLE jogo (
    id_jogo SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ano_lancamento INT NOT NULL,
    genero VARCHAR(50) NOT NULL
);

-- Tabela: cliente
CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    cidade VARCHAR(100) NOT NULL
);

-- Tabela: compra
CREATE TABLE compra (
    id_compra SERIAL PRIMARY KEY,
    data_compra DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_loja INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_loja) REFERENCES loja(id_loja)
);

-- Tabela associativa: compra_jogo
CREATE TABLE compra_jogo (
    id_compra INT NOT NULL,
    id_jogo INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    PRIMARY KEY (id_compra, id_jogo),
    FOREIGN KEY (id_compra) REFERENCES compra(id_compra),
    FOREIGN KEY (id_jogo) REFERENCES jogo(id_jogo)
);
