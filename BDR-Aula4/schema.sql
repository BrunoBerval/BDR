-- Tabela de usuários
CREATE TABLE IF NOT EXISTS tbUser (
    idUser INT PRIMARY KEY,
    nomeUser VARCHAR(150),
    emailUser VARCHAR(200),
    senhaHash TEXT,
    id_Categoria INT,
    FOREIGN KEY (id_Categoria) REFERENCES categoria_usuario(idCategoria)
);

-- Tabela de localizações
CREATE TABLE IF NOT EXISTS tbLoc (
    idLoc INT PRIMARY KEY,
    Lat TEXT,
    Lon TEXT,
    cidadeLoc VARCHAR(250),
    estadoLoc VARCHAR(100)
);

-- Tabela de tipos de evento
CREATE TABLE IF NOT EXISTS tbTE (
    idTE INT PRIMARY KEY,
    nomeTE VARCHAR(250),
    descrTE TEXT
);

-- Tabela de eventos
CREATE TABLE IF NOT EXISTS tbEvent (
    idEvent INT PRIMARY KEY,
    nomeEvent VARCHAR(200),
    descrEvent TEXT,
    dataHora TIMESTAMP,
    status VARCHAR(50) CHECK (status IN ('Ativo', 'Em monitoramento', 'Finalizado')),
    id_TE INT REFERENCES tbTE(idTE),
    id_Loc INT REFERENCES tbLoc(idLoc)
);

-- Tabela de relatos
CREATE TABLE IF NOT EXISTS tbRelato (
    idRelato INT PRIMARY KEY,
    relato TEXT,
    dataHora TIMESTAMP,
    id_Event INT REFERENCES tbEvent(idEvent),
    id_User INT REFERENCES tbUser(idUser)
);

-- Tabela de alertas
CREATE TABLE IF NOT EXISTS tbAlert (
    idAlert INT PRIMARY KEY,
    msg TEXT,
    dataHora TIMESTAMP,
    levelAlert INT,
    id_Event INT REFERENCES tbEvent(idEvent)
);

-- NOVA TABELA: Categorias de usuário
CREATE TABLE IF NOT EXISTS categoria_usuario (
    idCategoria INT PRIMARY KEY,
    nomeCategoria VARCHAR(100) NOT NULL,
    descricaoCategoria TEXT
);

-- NOVA TABELA: Histórico de eventos
CREATE TABLE IF NOT EXISTS historico_evento (
    idHistorico INT PRIMARY KEY,
    id_Event INT REFERENCES tbEvent(idEvent),
    id_User INT REFERENCES tbUser(idUser),
    dataHora TIMESTAMP NOT NULL,
    acao TEXT NOT NULL,
    observacao TEXT
);
