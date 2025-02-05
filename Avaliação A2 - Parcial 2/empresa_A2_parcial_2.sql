drop schema if exists empresa;

create database empresa;

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
    CONSTRAINT func_dept foreign key (iddept)
		references departamento(idDepartamento)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


/* Inserção de valores na tabela departamento*/    
INSERT INTO DEPARTAMENTO
(nome)
VALUES
("RH"),
("FINANÇAS"),
("TI"),
("Pequisa e Desenvolvimento");


Insert INTO funcionario
(iddept, nome, cpf, salario)
VALUES
(4,"Felipe",         "11122233344", 10000),
(1,"Aline",          "22233344455", 8000),
(2,"José",           "33344455566", 5000),
(3,"Ricardo",        "44455566677", 2000),
(2,"Luis Felipe",    "55566677788", 6000),
(1,"Luis",           "66677788899", 7000),
(3,"Antônio",        "77788899900", 4000),
(1,"Marlon",         "12345678901", 2050),
(2,"Maria",          "23456789012", 6800),
(3,"Giovana",        "34567890123", 4030),
(4,"Ronaldo",        "45678901234", 4200),
(3,"Marocos",        "77888999009", 4000),
(1,"Marlon",         "23456789019", 2050),
(2,"Maria Antonieta","34567890129", 6800),
(3,"Maria Fernanda", "45678901239", 4030),
(4,"Maria Cristina", "56789012349", 4200),
(3,"Antônio",        "77888999007", 4000),
(1,"Marlon",         "23456789029", 2050),
(2,"José Antonieta","34567890139", 6800),
(3,"Maria Fernanda", "45678971239", 4030),
(4,"Maria Cristina", "56789012949", 4200);

SELECT * FROM funcionario;