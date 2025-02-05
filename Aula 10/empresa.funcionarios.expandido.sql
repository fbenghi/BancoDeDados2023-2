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
        ON UPDATE CASCADE
);

select * from funcionario;

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