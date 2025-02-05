DROP DATABASE IF EXISTS Avaliacao_BD_A1_Cliente;
CREATE DATABASE Avaliacao_BD_A1_Cliente;
USE Avaliacao_BD_A1_Cliente;

/*
	CRIAÇÃO DE TABELAS
*/

CREATE TABLE Cliente (
    CodigoCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(40),
    CPF CHAR(11) UNIQUE,
    DDD DEC(2),
    NumeroTelefone DEC(10)
);

CREATE TABLE ENDERECO (
    CodigoCliente INT,
    IdEndereco INT,
    Rua VARCHAR(40),
    CEP DEC(8),
    PRIMARY KEY (CodigoCliente , IdEndereco),
    CONSTRAINT FK_CodigoCliente FOREIGN KEY (CodigoCliente)
        REFERENCES Cliente (CodigoCliente)
);

CREATE TABLE Gerente (
    CPF CHAR(11) PRIMARY KEY,
    Nome VARCHAR(40)
);

CREATE TABLE Conta (
    IdConta INT AUTO_INCREMENT PRIMARY KEY,
    DataAbertura DATE,
    CodigoCliente INT,
    CPFGerente CHAR(11),
    FOREIGN KEY (CodigoCliente)
        REFERENCES Cliente (CodigoCliente),
    FOREIGN KEY (CPFGerente)
        REFERENCES Gerente (CPF)
);

CREATE TABLE TransacaoFinanceira (
    IdTransacao INT AUTO_INCREMENT PRIMARY KEY,
    DATA DATE,
    VALOR FLOAT
);

CREATE TABLE Conta_Transacao (
    IdConta INT,
    IdTransacao INT,
    Tipo ENUM('Saque', 'Deposito'),
    PRIMARY KEY (IdConta , IdTransacao),
    FOREIGN KEY (IdConta)
        REFERENCES Conta (IdConta),
    FOREIGN KEY (IdTransacao)
        REFERENCES TransacaoFinanceira (IdTransacao)
);

/*
	INSERÇÃO DE DADOS
*/
INSERT INTO Cliente (Nome, CPF, DDD, NumeroTelefone) VALUES
('João Silva', '12345678901', 41, 999999999),
('Maria Santos', '23456789012', 41, 999999998),
('José Souza', '34567890123', 41, 999999997),
('Ana Oliveira', '45678901234', 41, 999999996),
('Luiz Pereira', '56789012345', 41, 999999995),
('Fernanda Costa', '67890123456', 41, 999999994),
('Ricardo Santos', '78901234567', 41, 999999993),
('Mariana Souza', '89012345678', 41, 999999992),
('Pedro Oliveira', '90123456789', 41, 999999991),
('Juliana Pereira', '10234567890', 41, 999999990),
('Lucas Silva', '11223344556', 41, 999999989),
('Amanda Santos', '22334455667', 41, 999999988),
('Roberto Souza', '33445566778', 41, 999999987),
('Carla Oliveira', '44556677889', 41, 999999986),
('Gustavo Pereira', '55667788990', 41, 999999985),
('Larissa Silva', '66778899011', 41, 999999984),
('Bruno Santos', '77889900122', 41, 999999983),
('Isabela Souza', '88990011233', 41, 999999982),
('Rafael Oliveira', '99001122344', 41, 999999981),
('Rafael Da Silva', '79001122344', 41, 99999281);

INSERT INTO ENDERECO (CodigoCliente, IdEndereco, Rua, CEP) VALUES
(3, 1, 'Rua das Flores', 80010000),
(4, 2, 'Rua XV de Novembro', 80230020),
(3, 3, 'Rua Padre Anchieta', 80510000),
(4, 4, 'Rua Marechal Deodoro', 80330040),
(3, 5, 'Rua Almirante Gonçalves', 80410100),
(4, 6, 'Rua das Flores', 80020000),
(3, 7, 'Rua das Araucárias', 80240030),
(4, 8, 'Rua do Herval', 80520000),
(3, 9, 'Rua das Palmeiras', 80340050),
(4, 10, 'Rua das Orquídeas', 80420100),
(3, 11, 'Rua do Sol', 80030000),
(4, 12, 'Rua das Hortências', 80250040),
(3, 13, 'Rua do Bosque', 80530000),
(4, 14, 'Rua das Acácias', 80350060),
(3, 15, 'Rua das Margaridas', 80430100),
(4, 16, 'Rua da Lua', 80040000),
(3, 17, 'Rua das Bromélias', 80260050),
(4, 18, 'Rua do Lago', 80540000),
(3, 19, 'Rua das Violetas', 80360070),
(4, 20, 'Rua das Tulipas', 80440100),
(3, 21, 'Rua das Flores', 80010000),
(4, 22, 'Rua XV de Novembro', 80230020),
(3, 23, 'Rua Padre Anchieta', 80510000),
(4, 24, 'Rua Marechal Deodoro', 80330040),
(3, 25, 'Rua Almirante Gonçalves', 80410100),
(4, 26, 'Rua das Flores', 80020000),
(3, 27, 'Rua das Araucárias', 80240030),
(4, 28, 'Rua do Herval', 80520000),
(3, 29, 'Rua das Palmeiras', 80340050),
(4, 30, 'Rua das Orquídeas', 80420100);


INSERT INTO Gerente (CPF, Nome) VALUES
('12345678901', 'João Silva'),
('23456789012', 'Maria Santos'),
('34567890123', 'José Souza'),
('45678901234', 'Ana Oliveira'),
('56789012345', 'Luiz Pereira'),
('67890123456', 'Fernanda Costa'),
('78901234567', 'Ricardo Santos'),
('89012345678', 'Mariana Souza'),
('90123456789', 'Pedro Oliveira'),
('10234567890', 'Juliana Pereira');

INSERT INTO Conta (DataAbertura, CodigoCliente, CPFGerente) VALUES
('2021-01-01', 17, '12345678901'),
('2021-02-01', 16, '23456789012'),
('2021-03-01', 15, '34567890123'),
('2021-04-01', 14, '45678901234'),
('2021-05-01', 13, '56789012345'),
('2021-06-01', 20, '67890123456'),
('2021-07-01', 19, '34567890123'),
('2021-08-01', 18, '89012345678'),
('2021-09-01', 17, '90123456789'),
('2021-10-01', 16, '34567890123'),
('2021-11-01', 15, '12345678901'),
('2021-12-01', 14, '10234567890'),
('2022-01-01', 13, '10234567890'),
('2022-02-01', 20, '12345678901'),
('2022-03-01', 19, '12345678901'),
('2022-04-01', 18, '67890123456');

INSERT INTO TransacaoFinanceira (DATA, VALOR) VALUES
('2021-01-01', 1000),
('2021-02-01', 2000),
('2021-03-01', 3000),
('2021-04-01', 4000),
('2021-05-01', 5000),
('2021-06-01', 6000),
('2021-07-01', 7000),
('2021-08-01', 8000),
('2021-09-01', 9000),
('2021-10-01', 10000),
('2021-11-01', 11000),
('2021-12-01', 12000),
('2022-01-01', 13000),
('2022-02-01', 14000),
('2022-03-01', 15000),
('2022-04-01', 16000),
('2022-05-01', 17000),
('2022-06-01', 18000),
('2022-07-01', 19000),
('2022-08-01', 20000);


INSERT INTO Conta_Transacao (IdConta, IdTransacao, Tipo) VALUES
(13, 1, 'Saque'),
(14, 2, 'Deposito'),
(15, 3, 'Saque'),
(16, 4, 'Deposito'),
(15, 5, 'Saque'),
(8, 6, 'Deposito'),
(9, 7, 'Saque'),
(13, 8, 'Deposito'),
(13, 9, 'Saque'),
(14, 10, 'Deposito'),
(15, 11, 'Saque'),
(16, 12, 'Deposito'),
(7, 13, 'Saque'),
(8, 14, 'Deposito'),
(9, 15, 'Saque'),
(10, 16, 'Deposito'),
(3, 17, 'Saque'),
(14, 18, 'Deposito'),
(15, 19, 'Saque'),
(6, 20, 'Deposito'),
(7, 1, 'Saque'),
(8, 2, 'Deposito'),
(9, 3, 'Saque'),
(11, 4, 'Deposito'),
(13, 5, 'Saque');

SELECT * FROM TransacaoFinanceira;
SELECT * FROM Conta;

-- A)	Qual o nome dos Clientes ordenados em ordem alfabética?
SELECT NOME FROM Cliente order by nome;

-- B)	Quantos Gerentes estão cadastrados?
SELECT COUNT(*) FROM GERENTE;

-- C)	Quais Gerentes têm sobrenome Santos?
SELECT nome from GERENTE WHERE NOME LIKE "%Santos";

-- D)	Qual o nome dos clientes que não tem endereço cadastrado?
SELECT * FROM CLIENTE
LEFT JOIN Endereco
ON CLIENTE.CodigoCliente = Endereco.CodigoCliente
WHERE IdEndereco is NULL;


-- E)	Qual a soma de TODAS transacoes feitas pelo Rafael Oliveira do tipo Saque?
SELECT SUM(valor) FROM CLIENTE
inner JOIN CONTA ON CONTA.CodigoCliente = CLIENTE.CodigoCliente
INNER JOIN CONTA_TRANSACAO ON CONTA.idConta = CONTA_TRANSACAO.idConta
INNER JOIN TransacaoFinanceira ON TransacaoFinanceira.IdTransacao = CONTA_TRANSACAO.IdTransacao
WHERE CLIENTE.nome = "Rafael Oliveira" And CONTA_TRANSACAO.tipo = "Saque";


-- F)	Quantas transações financeiras aconteceram antes de 2022?
SELECT COUNT(*) FROM TRANSACAOFINANCEIRA WHERE DATA < "2022-01-01";

-- G)	Qual a média de valor das Transações Financeiras do tipo Depósito?
SELECT AVG(valor) FROM CONTA_TRANSACAO
INNER JOIN TransacaoFinanceira ON TransacaoFinanceira.IdTransacao = CONTA_TRANSACAO.IdTransacao
WHERE CONTA_TRANSACAO.tipo = "Deposito";


-- H)	Atualize o valor da transação com id 13 para 11.85.
Update TRANSACAOFINANCEIRA
SET Valor = 11.85
WHERE IdTransacao = 13;


-- I)	Qual o nome dos gerentes administram mais do que 2 Contas?
SELECT GERENTE.Nome, COUNT(*) FROM GERENTE
INNER JOIN CONTA 
ON GERENTE.CPF = CONTA.CPFGerente
GROUP BY GERENTE.CPF
HAVING COUNT(*) > 2;

-- J) Calcule a soma total para cada tipo de transacao - Saque ou Depósito
SELECT CONTA_TRANSACAO.tipo, SUM(valor) FROM CONTA_TRANSACAO
INNER JOIN TransacaoFinanceira ON TransacaoFinanceira.IdTransacao = CONTA_TRANSACAO.IdTransacao
GROUP BY CONTA_TRANSACAO.tipo;

-- K)	Crie um registro para um novo cliente e cadastre um novo endereço para ele. 
INSERT INTO Cliente (Nome, CPF, DDD, NumeroTelefone) VALUES
('Klaus Silva', '88345678901', 41, 999999944);

INSERT INTO ENDERECO (CodigoCliente, IdEndereco, Rua, CEP) VALUES
((SELECT CodigoCliente FROM CLiente WHERE Nome = 'Klaus Silva'), 1, 'Rua das Flores', 80010000);


-- L)	Crie uma conta para o cliente cadastrado no exercício anterior, com todas as colunas preenchidas
INSERT INTO Conta (DataAbertura, CodigoCliente, CPFGerente) VALUES
('2021-01-01', (SELECT CodigoCliente FROM CLiente WHERE Nome = 'Klaus Silva'), '12345678901');


