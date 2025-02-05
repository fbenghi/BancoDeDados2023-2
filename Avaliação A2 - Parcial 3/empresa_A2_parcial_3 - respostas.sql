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
    beneficios DEC(10,2),
    CONSTRAINT func_dept foreign key (iddept)
		references departamento(idDepartamento)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

create table Projeto
(
	idProjeto INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30),
    orcamento DEC(10,2),
    iddept INT,
    idgestor INT,
    CONSTRAINT func_dept_projeto foreign key (iddept)
		references departamento(idDepartamento)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

create table funcionario_projeto
(
	idProjetoFuncionario INT AUTO_INCREMENT,
    idProjeto INT,
    idFuncionario INT,
    primary key(idProjetoFuncionario,idProjeto,idFuncionario)
);


/* Inserção de valores na tabela departamento*/    
INSERT INTO DEPARTAMENTO
(nome)
VALUES
("RH"),
("Financeiro"),
("TI"),
("Pequisa e Desenvolvimento"),
("Marketing"),
("Produção");


Insert INTO funcionario
(iddept, nome, cpf, salario, beneficios)
VALUES
(4,"Felipe",         "11122233344", 10000, 1000),
(5,"Aline",          "22233344455", 8000, 1000),
(2,"José",           "33344455566", 5000, 1000),
(3,"Ricardo",        "44455566677", 2000, 1000),
(2,"Luis Felipe",    "55566677788", 6000, 1000),
(1,"Luis",           "66677788899", 7000, 1000),
(3,"Luis Antônio",        "77788899900", 4000, 1000),
(1,"Marlon Luis",         "12345678901", 2050, 1000),
(2,"Maria",          "23456789012", 6800, 1000),
(3,"Giovana",        "34567890123", 4030, 1000),
(5,"Ronaldo",        "45678901234", 4200, 1000),
(6,"Marcos",        "77888999009", 4000, 1000),
(1,"Rodrigo",         "23456789019", 2050, 1000),
(2,"Maria Antonieta","34567890129", 6800, 1000),
(5,"Maria José", "45678901239", 4030, 1000),
(4,"Maria Cristina", "56789012349", 4200, 1000),
(3,"Antônio",        "77888999007", 4000, 1000),
(6,"Marlon José",         "23456789029", 2050, 1000),
(2,"José Antonieta","34567890139", 6800, 1000),
(3,"Maria Fernanda", "45678971239", 4030, 1000),
(6,"Maria Cristina", "56789012949", 4200, 1000);


insert into projeto
(Nome, orcamento, iddept, idgestor)
VALues
("Modernização PCs",  5000,   3, 7),
("Novo Produto",      80000,  5, 15),
("Consultoria",         7000, 2, 3),
("Nova fábrica",      300000, 6, 12);



insert funcionario_projeto
(idFuncionario, idProjeto)
VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 2),
(5, 3),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 1),
(11, 2),
(12, 1),
(13, 2),
(15, 4),
(16, 3),
(17, 4),
(18, 2),
(19, 2),
(20, 2),
(21, 1),
(2,  2),
(3,  3),
(2,  4),
(3,  1),
(4,  1),
(5,  2),
(6,  3),
(7,  1),
(8,  4),
(9,  4),
(10, 4);

/*
select
*
from
funcionario
Inner join projeto
on projeto.idgestor = funcionario.idfuncionario;
*/

/* Qual departamento tem o maior gasto com salario? Qual o valor? */
select
departamento.nome, sum(salario) AS SOMA_SALARIO
from
funcionario
Inner join departamento
on departamento.iddepartamento = funcionario.iddept
Group by iddepartamento
order by SOMA_SALARIO DESC
LIMIT 1;


/* Qual departamento tem o maior gasto total com funcionarios (salario + beneficio)? Qual o valor? */
select
departamento.nome, sum(salario+beneficios) AS SOMA_SALARIO
from
funcionario
Inner join departamento
on departamento.iddepartamento = funcionario.iddept
Group by iddepartamento
order by SOMA_SALARIO DESC
LIMIT 1;

/* Quais departamentos tem folha salarial + beneficios superior a 15000 reais */
select
departamento.nome, sum(salario+beneficios)
from
funcionario
Inner join departamento
on departamento.iddepartamento = funcionario.iddept
Group by iddepartamento
having sum(salario+beneficios) > 15000;



/*Liste o nome dos funcionarios que trabalham no projeto "novo produto"*/
select projeto.nome, funcionario.nome
from projeto
inner join funcionario_projeto
ON funcionario_projeto.idProjeto = projeto.idprojeto
right join funcionario
ON funcionario_projeto.idfuncionario = funcionario.idfuncionario
Where projeto.nome = "Novo Produto"
Order by projeto.idProjeto;


/*
  Qual projeto tem o gestor com menor salario? Qual o nome do gestor?
*/
Select projeto.nome, funcionario.nome
FROM projeto
Inner join funcionario
on projeto.idgestor = funcionario.idfuncionario;

/*
  Algum funcionario nao está alocado a nenhum projeto
*/
Select * from funcionario
left join funcionario_projeto
ON funcionario_projeto.idfuncionario = funcionario.idfuncionario
WHERE funcionario_projeto.idprojeto IS NULL;



/* Quais departamentos tem mais do que 2 funcionarios em um mesmo projeto */
select projeto.idprojeto, projeto.nome, funcionario.iddept, COUNT(funcionario.idfuncionario) AS Proj_departamento
from projeto
inner join funcionario_projeto
ON funcionario_projeto.idProjeto = projeto.idprojeto
right join funcionario
ON funcionario_projeto.idfuncionario = funcionario.idfuncionario
group by projeto.idprojeto, funcionario.iddept
having COUNT(funcionario.idfuncionario) > 2
order by  projeto.idprojeto;


