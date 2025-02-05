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

/* Revisão */
/* 1- Qual tem o salario mais alto da empresa? E o mais baixo? 
   Qual a media salarial da empresa? */
SELECT MAX(salario), MIN(salario), AVG(Salario)
FROM funcionario;
   
/* Qual a folha de pagamento da empresa*/
SELECT SUM(salario) AS FOLHA_PAGAMENTO_MENSAL
FROM funcionario;

/* Qual o nome do departamento que o "Luis Felipe" trabalha? */
SELECT departamento.nome, funcionario.nome
FROM departamento INNER JOIN FUNCIONARIO
ON departamento.iddepartamento = funcionario.iddept
WHERE FUNCIONARIO.nome = "luis Felipe";


/* Quantos Funcionarios que trabalham para o departamento RH? */

SELECT departamento.nome, COUNT(*)
FROM departamento INNER JOIN FUNCIONARIO
ON departamento.iddepartamento = funcionario.iddept
WHERE departamento.nome = "RH";


/* Aula 10 */
/* 1. Qual o salário médio por cargo? */
SELECT cargo, avg(salario)
FROM funcionario
where cargo Is not null
group by cargo;

/* 2. Qual o salário médio, min e máximo por cargo?*/
SELECT 
    cargo, AVG(salario), MIN(salario), MAX(salario)
FROM
    funcionario
WHERE
    cargo IS NOT NULL
GROUP BY cargo;


/* 3. Quantos funcionários trabalham por departamento?*/
SELECT FUNCIONARIO.iddept, departamento.nome, COUNT(*) AS FUNC_POR_DEPARTAMENTO
FROM FUNCIONARIO
INNER JOIN departamento 
ON departamento.iddepartamento = funcionario.iddept
group by FUNCIONARIO.iddept;

/* 5. Qual a média dos salários dos cargos por departamento?*/
SELECT 
	FUNCIONARIO.iddept, 
    departamento.nome, 
    FUNCIONARIO.cargo, 
    AVG(salario) AS SALARIO_POR_CARGO_DEPARTAMENTO
FROM FUNCIONARIO
INNER JOIN departamento 
ON departamento.iddepartamento = funcionario.iddept
group by FUNCIONARIO.iddept, FUNCIONARIO.cargo;

/* 6. O que acontece se tentarmos agregar os dados por CPF?*/
SELECT FUNCIONARIO.cpf
FROM FUNCIONARIO
group by FUNCIONARIO.cpf;

/* Quais cargos tem mais do que 4 funcionarios */
SELECT FUNCIONARIO.cargo ,COUNT(*) AS FUNC_POR_DEPARTAMENTO
FROM FUNCIONARIO
group by FUNCIONARIO.cargo
HAVING COUNT(*) > 4;

/* Quais cargos tem salário médio maior do que 5000 */
SELECT FUNCIONARIO.cargo, AVG(salario)
FROM FUNCIONARIO
group by FUNCIONARIO.cargo
HAVING AVG(salario) > 5000;

/* Qual o departamento que tem o maior salário? */






SELECT FUNCIONARIO.iddept, departamento.nome, MAX(salario) AS MAX_SALARIO
FROM FUNCIONARIO
INNER JOIN departamento 
ON departamento.iddepartamento = funcionario.iddept
group by FUNCIONARIO.iddept
ORDER BY MAX_SALARIO DESC
LIMIT 1;

SELECT FUNCIONARIO.iddept, departamento.nome, salario
FROM FUNCIONARIO
INNER JOIN departamento 
ON departamento.iddepartamento = funcionario.iddept
WHERE SALARIO = (SELECT MAX(SALARIO) FROM FUNCIONARIO);

SELECT FUNCIONARIO.iddept, departamento.nome, salario
FROM FUNCIONARIO
INNER JOIN departamento 
ON departamento.iddepartamento = funcionario.iddept
ORDER BY SALARIO DESC
LIMIT 1;
