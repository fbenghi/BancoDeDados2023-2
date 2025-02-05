drop schema if exists liga_basquete;
create database liga_basquete;
use liga_basquete;

Create table `time`
(
	TimeId INT AUTO_INCREMENT PRIMARY KEY,
    Nome varchar(30)
);


Create table Jogador
(
	JogadorId INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30),
    TimeId INT,
    CONSTRAINT fk_timeid foreign key(TimeId)
		references `Time`(TimeId)
);

CREATE TABLE Jogo
(
	JogoId INT AUTO_INCREMENT Primary key, 
    `Local` VARCHAR(30),
    `Data` DATE
);

CREATE TABLE Jogador_Jogo
(
	JogadorId INT,
    JogoId INT,
    PRIMARY KEY(JogadorId, JogoId),
    Constraint fk_jogo foreign key (JogoId)
		references Jogo(jogoId),
	Constraint fk_jogador foreign key (JogadorId)
		references Jogador(JogadorId)
);

CREATE TABLE TIME_JOGO
(
	TimeId INT,
    JogoId INT,
    PRIMARY KEY(TimeId, JogoId),
    Constraint fk_jogo_2 foreign key (JogoId)
		references Jogo(jogoId),
	Constraint fk_time foreign key (TimeId)
		references Time(TimeId)
);

INSERT INTO `Time`
(nome)
Values
('Operário'),
('Paranavai'),
('Foz do Iguaçu');

Insert INTO `Jogador`
(nome, TimeId)
VALUES
('Keirrison', 1),
('Dida', 2),
('Wagner', 3);

Insert Into Jogo
(`Local`, `Data`)
Values
('Ponta Grossa', '2023-11-11'),
('Foz do Iguaçu', '2023-11-09'),
('Curitiba', '2023-10-11');


INSERT INTO Jogador_Jogo
VALUES
(1,1),
(1,2),
(1,3);

INSERT INTO Time_Jogo
VALUES
(1,1),
(1,2),
(1,3);


/* EXERCICIO 2 */

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
SELECT * FROM departamento;

/* 2 */
-- a.	[10%] Liste os CPFs dos funcionários que recebem um salário entre R$ 3.000,00 e R$ 6.000,00, ordenados em ordem crescente de salário.
-- CRITERIOS: WHERE Com AND, ORDER BY, SELECT CPF + SALARIO
SELECT 
    CPF, Salario
FROM
    funcionario
WHERE
    salario > 3000 AND SALARIO < 6000
ORDER BY salario ASC;


-- b.	[10%] Liste todos os salários dos funcionários da empresa sem repetir valores e em ordem decrescente.
-- Criterios: Distinct
SELECT DISTINCT
    SALARIO
FROM
    FUNCIONARIO
Order by SALARIO DESC;

-- c.	[10%] Liste o nome de todos os funcionários que não trabalhem para o departamento de TI.
-- Criterio: <> de TI
SELECT NOME
FROM FUNCIONARIO
WHERE IDdept <> 3;


-- d.	[10%] Liste o nome das funcionárias que têm “Maria” como primeiro nome.
-- Criterio: LIKE "MARIA%";
SELECT Nome
FROM Funcionario
WHERE NOME LIKE "MARIA%";

-- e.	[10%] Liste o nome dos funcionários que tem “Felipe” no nome (em qualquer posição).
-- Criterio: LIKE "%Felipe%";
SELECT Nome
FROM Funcionario
WHERE NOME LIKE "%Felipe%";


-- f.	[10%] Indique o comando SQL para alterar a tabela Funcionário de modo que esta tabela tenha também uma coluna que armazene a data em que os funcionários entraram na empresa. Esta coluna deve se chamar “dataInicio”.
-- Criterio: alter table - coluna date
alter table funcionario
add column dataInicio Date;

-- g.	[10%] Indique o comando SQL para incluir na tabela DEPARTAMENTO uma coluna como chave estrangeira que indique qual funcionário é o gerente do departamento. A coluna deve se chamar “Gerente”.
-- Criterio add column + criterio add constraint
Alter table departamento
add column Gerente int;

ALTER TABLE departamento
ADD CONSTRAINT fk_gerente
  FOREIGN KEY (Gerente)
  REFERENCES funcionario (idFuncionario)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
    


-- h.	[10%] Atualize o nome do funcionário que tenha idFuncionario com o valor 14 com o seu nome completo.
-- Criterio: nome é o do aluno
UPDATE funcionario
SET
	nome = "Felipe Marx Benghi"
WHERE
	idFuncionario = 14;


-- i.	[10%] Crie um registro para o Departamento “Controladoria” e realoque (atualize o registro) de três funcionários para este novo departamento.
-- Criterio: criar departamento  e atualizar dados
INSERT INTO Departamento
(nome)
VALUES
('Controladoria');

UPDATE funcionario 
SET 
    iddept = 5
WHERE
    idfuncionario < 4;


-- j.	[10%] Apague os registros de todos os funcionários que recebem salário menor do que R$ 4.000,00.
-- delete from
DELETE FROM funcionario 
WHERE
    salario < 4000;

