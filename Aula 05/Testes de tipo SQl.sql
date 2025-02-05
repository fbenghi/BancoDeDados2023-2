/* Exclui o banco de dados "test_data_types", caso o banco de dados exista */
drop database if exists test_data_types;

/* Cria o banco de dados "test_data_types" */
create database test_data_types;

/* Define o banco de dados atual */
use test_data_types;


/*
Cria tabela com diferentes tamanhos de inteiros +
- unsigned
- zerofill
*/
CREATE TABLE `test_int` (
  `idtest_int` int NOT NULL,
  `bigint` bigint(20) unsigned unsigned zerofill DEFAULT NULL,
  `int` int(10) unsigned zerofill DEFAULT NULL,
  `tinyint` tinyint(3) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`idtest_int`)
);

/* Descreve a estrutura da tabela de dependentes*/
describe test_int;

/* Insercao valida para mostrar a diferenca que zerofill e o argumento size fazem*/
INSERT INTO `test_data_types`.`test_int`
(`idtest_int`,
`bigint`,
`int`,
`tinyint`)
VALUES
(1,1,1,1);

/* Insercao no limite dos tipos */
INSERT INTO `test_data_types`.`test_int`
(`idtest_int`,
`bigint`,
`int`,
`tinyint`)
VALUES
(2,
4294967295,
16777215,
255);


/* Erro - Insercao fora do limite do tiny */
INSERT INTO `test_data_types`.`test_int`
(`idtest_int`,
`bigint`,
`int`,
`tinyint`)
VALUES
(3,
256,
256,
256);




/* ------------- ENUM -------------------- */
/* Cria tabela com enums */
CREATE TABLE `test_enum` (
  `idtest_enum` INT NOT NULL,
  `test_enum_genero` ENUM('Masculino', 'Feminino') NULL,
  `test_enum_tam_roupa` ENUM('P', 'M', 'G') NULL,
  PRIMARY KEY (`idtest_enum`));

/* Insercao valida */
INSERT INTO `test_data_types`.`test_enum`
(`idtest_enum`,
`test_enum_genero`,
`test_enum_tam_roupa`)
VALUES
(2,'Masculino','M');


/* Insercao valida */
INSERT INTO `test_data_types`.`test_enum`
(`idtest_enum`,
`test_enum_genero`,
`test_enum_tam_roupa`)
VALUES
(2,'Masculino','M,F');


/* ------------- SET -------------------- */

/* Nova tabela com set e AUTO_INCREMENT*/
CREATE TABLE test_set(  
    `Id` INT NOT NULL AUTO_INCREMENT,  
    `test_set_linguagem_prog` SET('Java','Python','Android','PHP'),
    PRIMARY KEY(`Id`)
  );  

/* Insere na tabela com set */
/* nao faz diferenca a ordem de insercao ou se tem dublicados */
INSERT INTO `test_set`
(`test_set_linguagem_prog`)
VALUES 
('Java,PHP'), 
('PHP,Java'),   
('Java,PHP,Java'), 
('Java,PHP,PHP'), 
('Python,Java,PHP');  


