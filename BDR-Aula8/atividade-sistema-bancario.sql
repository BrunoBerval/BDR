-- Cria o banco de dados
CREATE DATABASE sistema_bancario;

-- Conecta ao banco de dados recém-criado
\c sistema_bancario

-- Criação da tabela clientes
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    endereco TEXT,
    telefone VARCHAR(15)
);

-- Criação da tabela contas
-- Esta tabela é necessária para a tabela 'transacoes' funcionar
CREATE TABLE contas (
    id_conta SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente) ON DELETE CASCADE,
    numero_conta VARCHAR(20) UNIQUE NOT NULL,
    saldo DECIMAL(15, 2) DEFAULT 0.00
);

-- Criação da tabela transacoes
CREATE TABLE transacoes (
    id_transacao SERIAL PRIMARY KEY,
    id_conta INT REFERENCES contas(id_conta) ON DELETE CASCADE,
    tipo VARCHAR(15) CHECK (tipo IN ('Depósito', 'Saque', 'Transferência')),
    valor DECIMAL(10,2) NOT NULL CHECK (valor > 0),
    data_transacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    destino_transferencia INT REFERENCES contas(id_conta)
);

-- Inserção de 7 clientes
INSERT INTO clientes (nome, cpf, endereco, telefone) VALUES
    ('João Silva', '12345678900', 'Rua A, 123', '11999990000'),
    ('Maria Oliveira', '98765432100', 'Rua B, 456', '11988887777'),
    ('Carlos Santos', '45678912300', 'Av. C, 789', '21977776666'),
    ('Ana Souza', '65432198700', 'Rua D, 101', '31966665555'),
    ('Pedro Pereira', '11122233344', 'Rua E, 202', '41955554444'),
    ('Juliana Costa', '55566677788', 'Av. F, 303', '51944443333'),
    ('Fernanda Lima', '99988877766', 'Rua G, 404', '61933332222');

-- Inserção de 7 contas, ligadas aos clientes
INSERT INTO contas (id_cliente, numero_conta, saldo) VALUES
    (1, '0001-5', 1500.00),
    (2, '0002-3', 2500.00),
    (3, '0003-1', 500.00),
    (4, '0004-9', 3000.00),
    (5, '0005-7', 800.00),
    (6, '0006-5', 4500.00),
    (7, '0007-3', 100.00);

-- Inserção de 7 transações
INSERT INTO transacoes (id_conta, tipo, valor, destino_transferencia) VALUES
    (1, 'Depósito', 500.00, NULL),
    (2, 'Saque', 200.00, NULL),
    (1, 'Transferência', 300.00, 2),
    (3, 'Depósito', 150.00, NULL),
    (4, 'Saque', 50.00, NULL),
    (5, 'Transferência', 100.00, 6),
    (7, 'Depósito', 250.00, NULL);

-- Listar todos os clientes cadastrados
SELECT * FROM clientes;

-- Listar todas as contas e seus respectivos clientes
SELECT
    c.numero_conta,
    cl.nome,
    c.saldo
FROM
    contas AS c
INNER JOIN
    clientes AS cl ON c.id_cliente = cl.id_cliente;

-- Listar todas as transações
SELECT
    t.tipo,
    t.valor,
    t.data_transacao,
    c_origem.numero_conta AS origem,
    c_destino.numero_conta AS destino
FROM
    transacoes AS t
INNER JOIN
    contas AS c_origem ON t.id_conta = c_origem.id_conta
LEFT JOIN
    contas AS c_destino ON t.destino_transferencia = c_destino.id_conta;

-- Atualizar o saldo de uma conta (exemplo de um depósito)
-- Aumenta o saldo da conta 1 em 500.00
UPDATE contas
SET
    saldo = saldo + 500.00
WHERE
    id_conta = 1;

-- Excluir um cliente e suas contas
-- Exclui o cliente com id_cliente = 2 e, devido ao ON DELETE CASCADE, suas contas e transações também serão excluídas
DELETE FROM clientes
WHERE
    id_cliente = 2;

    

/*
===================================================================================
ATIVIDADE
===================================================================================

*/
-- Insere um novo cliente
INSERT INTO clientes (nome, cpf, endereco, telefone)
VALUES ('Roberto Santos', '12312312300', 'Rua Nova, 505', '11991112222');

-- Cria uma nova conta para o cliente recém-inserido
-- (Supondo que o ID do novo cliente seja 8, que seria o próximo serial)
INSERT INTO contas (id_cliente, numero_conta, saldo)
VALUES (8, '000789', 500.00);

-- Realiza uma transferência de R$ 100,00 da conta '0001-5' (que você inseriu anteriormente) para a nova conta '000789'
-- Passo 1: Atualiza o saldo da conta de origem (0001-5)
UPDATE contas
SET saldo = saldo - 100.00
WHERE numero_conta = '0001-5';

-- Passo 2: Atualiza o saldo da conta de destino (000789)
UPDATE contas
SET saldo = saldo + 100.00
WHERE numero_conta = '000789';

-- Passo 3: Insere o registro da transação
INSERT INTO transacoes (id_conta, tipo, valor, destino_transferencia)
VALUES (
    (SELECT id_conta FROM contas WHERE numero_conta = '0001-5'),
    'Transferência',
    100.00,
    (SELECT id_conta FROM contas WHERE numero_conta = '000789')
);

-- Lista todas as contas e seus saldos atualizados
SELECT
    c.numero_conta,
    cl.nome,
    c.saldo
FROM
    contas AS c
INNER JOIN
    clientes AS cl ON c.id_cliente = cl.id_cliente;