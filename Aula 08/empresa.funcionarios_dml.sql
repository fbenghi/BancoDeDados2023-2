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
    CONSTRAINT func_dept foreign key (iddept)
		references departamento(idDepartamento)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

select * from funcionario;

/* Inserção de valores */    

INSERT INTO DEPARTAMENTO
(nome)
VALUES
("P&D");

select * from departamento;

Insert INTO funcionario
(iddept, nome, cpf, salario)
VALUES
(NULL,"ROBERTO", "77781299900", 4000);



/* Liste o salário e o CPF de todos os funcionários */
Select cpf, salario
FROM funcionario;

/* Liste o nome, salario dos funcionários que ganham mais do que R$5.000 */
SELECT nome, salario
from Funcionario
WHERE salario > 5000;

/* Liste o nome, salario dos funcionários que ganham entre R$2.000 e R$6.000*/
SELECT nome, salario
from Funcionario
WHERE salario between 2000 and 6000;

SELECT nome, salario
from Funcionario
WHERE salario >= 2000 AND SALARIO <= 6000;

/* Listar salarios sem repeticao em ordem decrescente*/
SELECT DISTINCT salario
from Funcionario
order by salario DESC;

/* Encontre os funcionarios que tem "felipe" no nome */
Select * 
from funcionario 
where nome = 'felipe';

SELECT *
FROM funcionario
WHERE nome like '%felipe%';

/* Atualize o CPF do Antônio que tem o id 7
update nome da tabela
set col = valor
where condicao
 */
update funcionario
set cpf = '12345678956'
where idfuncionario = 7;

 select * from funcionario ;

/* 2. Corrija o Salário da Aline (id = 2) para 7500 */
update funcionario
set salario = 7500
where idfuncionario = 2 OR idfuncionario = 3;

/* 3. Apague a departamento P&D */
DELETE FROM departamento
Where iddepartamento = 4;

SELECT * FROM funcionario;

/*Liste o nome de todos os funcionários e todas seus respectivos departamentos*/
SELECT * 
FROM funcionario INNER JOIN departamento
on iddept = iddepartamento;

