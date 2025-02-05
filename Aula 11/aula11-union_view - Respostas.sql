DROP schema if exists empresa ;
create schema empresa;

use empresa;

/* Criação das tabelas */    
create table departamento
(
	idDepartamento INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(30)
);


create table funcionario
(
	idFuncionario INT AUTO_INCREMENT PRIMARY KEY,
	iddept INT,
    Nome VARCHAR(30),
    CPF CHAR(11) UNIQUE,
    SALARIO DEC(10,2),
    Cargo Varchar(30),
    Contratacao DATE,
    CONSTRAINT func_dept foreign key (iddept)
		references departamento(idDepartamento)
        ON DELETE SET NULL
        ON UPDATE SET NULL
);

Create table cliente
(
	idcliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30),
    id_funcionario_responsavel INT NOT NULL,
    CONSTRAINT func_cliente foreign key(id_funcionario_responsavel)
		references funcionario(idFuncionario)
        ON DELETE restrict
        ON UPDATE restrict
);

Create table Pessoa_Fisica
(
	cpf CHAR(11),
    idcliente INT,
    dataNascimento DATE,
    primary key(cpf, idcliente),
    CONSTRAINT pf_cliente foreign key(idcliente)
		references cliente(idcliente)
);

Create table Pessoa_Juridica
(
	CNPJ CHAR(14),
    idcliente INT,
    
    primary key(CNPJ, idcliente),
    CONSTRAINT pj_cliente foreign key(idcliente)
		references cliente(idcliente)
);


/* Inserção de valores */    
INSERT INTO DEPARTAMENTO
(nome)
VALUES
("RH"),
("Financeiro"),
("Vendas"),
("Pesquisa e Desenvolvimento"),
("Controladoria"),
('Presidência');

Insert INTO funcionario
(iddept, nome, cpf, salario, Cargo, Contratacao)
VALUES
(4,"Felipe",            "11122233344", 10000, "Analista",    "2001-11-17"),
(1,"Aline",             "22233344455", 8000, "Analista",     "2002-01-18"),
(3,"José",              "33344455566", 5000, "Analista",     "2003-02-19"),
(3,"Ricardo",           "44455566677", 2000, "Analista",     "2004-03-10"),
(3,"Luis Felipe",       "55566677788", 6000, "Analista",     "2005-01-11"),
(1,"Luis",              "66677788899", 7000, "Analista",     "2006-02-12"),
(3,"Antônio",           "77788899900", 1000, "Estagiário",   "2017-03-13"),
(1,"Marlon",            "12345678901", 1050, "Estagiário",   "2018-04-14"),
(1,"Maria",             "23456789012", 1800, "Estagiário",   "2019-05-17"),
(1,"Giovana",           "34567890123", 1030, "Estagiário",   "2010-06-18"),
(4,"Ronaldo",           "45678901234", 1200, "Estagiário",   "2011-01-19"),
(1,"Marcos",            "12385999009", 1000, "Estagiário",   "2012-02-17"),
(1,"Marlon",            "23456789019", 12050, "Gerente",     "2013-03-18"),
(2,"Maria Antonieta",   "34567890129", 16800, "Gerente",     "2014-01-17"),
(3,"Maria Fernanda",    "45678901239", 14030, "Gerente",     "2015-02-18"),
(4,"Maria Cristina",    "56789012349", 14200, "Gerente",     "2016-03-19"),
(3,"Antônio",           "77888999009", 4000, "Consultor",    "2022-04-10"),
(1,"Marlon",            "23488801019", 2050, "Consultor",    "2022-05-11"),
(2,"José Antonieta",    "77167890129", 6800, "Consultor",    "2022-06-12"),
(3,"Maria Fernanda",    "45678904559", 4030, "Consultor",    "2022-12-13"),
(4,"Maria Cristina",    "56432432349", 4200, NULL,           "2022-12-14"),
(NULL,"Rosana da Silva","88882890129", 6800, NULL,           "2022-12-15"),
(NULL,"Silvino André",  "44646901239", 4030, NULL,           "2022-12-16"),
(NULL,"Paulo Gustavo",  "56877872249", 4200, NULL,           "2022-12-22");

INSERT INTO CLIENTE
(Nome, id_funcionario_responsavel)
VALUES
("Rodrigo", 1),
("Ana", 1),
("Jão", 3),
("Copel SA", 4),
("Sanepar", 4);

INSERT INTO Pessoa_Fisica
(cpf, idcliente, dataNascimento)
VALUES
("12345678901", 1, "1998-11-8"),
("12345458901", 2, "1988-11-8"),
("12376767891", 3, "1978-11-8");

INSERT INTO Pessoa_Juridica
(cnpj, idcliente)
VALUES
("12345678901234", 4),
("52345458901234", 5);

/* ---------------------- Revisão ------------------------*/
/* Exercício: Descubra quem são os funcionários responsáveis por cada cliente */
SELECT  FUNCIONARIO.NOME, CLIENTE.NOME
FROM CLIENTE
INNER JOIN FUNCIONARIO 
on CLIENTE.id_funcionario_responsavel = FUNCIONARIO.IDfuncionario;

/* Exercício: Quais são os funcionários com mais clientes? */
SELECT  FUNCIONARIO.NOME, COUNT(*)
FROM CLIENTE
INNER JOIN FUNCIONARIO 
on CLIENTE.id_funcionario_responsavel = FUNCIONARIO.IDfuncionario
GROUP BY CLIENTE.id_funcionario_responsavel;

/* Exercício: Quais são os funcionários que tem mais do que 1 cliente? */
SELECT  FUNCIONARIO.NOME, COUNT(*) AS COUNT_CLIENTE
FROM CLIENTE
INNER JOIN FUNCIONARIO 
on CLIENTE.id_funcionario_responsavel = FUNCIONARIO.IDfuncionario
GROUP BY CLIENTE.id_funcionario_responsavel
having COUNT_CLIENTE>1;

/* ---------------------- UNION ------------------------*/
/* Exercício: Liste os nomes dos funcionários e departamentos em uma única tabela */
SELECT
	nome
FROM 
	funcionario
UNION 
select
	NOME
FROM
	departamento;
    
/* Exercício: Liste o nome dos funcionarios e dos clientes em uma unica tabela */
SELECT
	nome
FROM 
	funcionario
UNION 
select
	NOME
FROM
	cliente;
    
/* Exercício: adicione uma coluna para indicar se é cliente ou se é funcionario */    
SELECT
	nome,
    "Funcionario" AS tipo
FROM 
	funcionario
UNION 
select
	NOME,
    "Cliente" AS tipo
FROM
	cliente;    
    
    
/* Exercício: Liste os nomes dos documentos (CNPJ e CPF) em uma única tabela */
SELECT 
    cpf AS idDocumento, idcliente
FROM
    Pessoa_Fisica 
UNION SELECT 
    cnpj, idcliente
FROM
    Pessoa_Juridica;


/* Exercício: Usando Union, liste o nome do cliente (PF ou PJ), document_id e id do funcionario responsável */
SELECT 
    *
FROM
    CLIENTE
        INNER JOIN
    (SELECT 
        cpf AS idDocumento, idcliente
    FROM
        Pessoa_Fisica UNION SELECT 
        cnpj, idcliente
    FROM
        Pessoa_Juridica) AS PF_PF ON PF_PF.idCliente = CLIENTE.idcliente;



/* Exercício:  Crie uma view que exiba: id do funcionário, id do departamento, o nome do funcionário, nome do departamento */
CREATE VIEW funcionario_cargo as
SELECT 
	cpf,
	cargo, 
    salario
FROM
	funcionario;

/* Exercício:  O que acontece com a View quando eu atualizo a tabela original (funcionario)? */


/* Exercício:  Crie uma view que exiba: id do funcionário, id do departamento, o nome do funcionário, nome do departamento */
CREATE VIEW funcionario_departamento (idfuncionario , iddepartamento , func_nome , dept_nome) AS
    SELECT 
        idfuncionario,
        funcionario.iddept,
        funcionario.nome,
        departamento.nome
    FROM
        funcionario
            INNER JOIN
        departamento ON funcionario.iddept = departamento.iddepartamento;

select * from funcionario_departamento;

/* Exercício:  Atualize o nome do funcionário "Aline" pela view */
Update funcionario_departamento
set func_nome = "Alline"
Where idfuncionario = 2;


/* Exercício:  Atualize o nome departamento do funcionário Aline (RH) para "Recursos Humanos" usando view */
Update funcionario_departamento
set dept_nome = "Recursos Humanos"
Where idfuncionario = 2;



/* Exercício: Insira novo funcionario através da view */
Insert INTO funcionario_departamento
(iddepartamento, func_nome)
VALUES
(3,"Jorgina");

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
Select * from funcionario_departamento;


