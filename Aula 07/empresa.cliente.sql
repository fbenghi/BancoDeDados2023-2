/* Criação do schema/database */
CREATE SCHEMA IF NOT EXISTS EMPRESA;

/* define que o esquema criado será utilizado */
use empresa;

/* Cria a tabela de clientes */
CREATE TABLE IF NOT EXISTS cliente (
    IdCliente INT PRIMARY KEY,
    NOME VARCHAR(100),
    sexo ENUM('M', 'F'),
    DtaNascimento DATETIME
);

/* Detalha a tabela de clientes */
describe cliente;

/* Cria tabela para projetos */
CREATE TABLE IF NOT EXISTS Projeto (
    IdProjeto INT AUTO_INCREMENT,
    Nome VARCHAR(45),
    horas FLOAT CHECK (horas > 0),
    Primary key (IdProjeto, Nome)
);

/* Detalha a tabela de projetos */
describe Projeto;

/* Aciona a coluna CPF como atributo único*/
Alter table cliente
add cpf CHAR(11) UNIQUE;

/* altera o nome da coluna nome para sobrenome na tabela cliente*/
alter table cliente
change column nome sobrenome Varchar(100);

/* altera o nome da coluna primeiro_nome para sobrenome na tabela cliente*/
alter table cliente
add column primeiro_nome VARCHAR(50);

/* Remove a coluna CPF da tabela cliente*/
alter table cliente
drop column cpf;

/* Modifica o enum na tabela Cliente */
alter table cliente
change sexo genero enum('Masculino','Feminino','Outros');

describe cliente;


/* Apaga as tabelas  */
/* drop table if exists projeto, cliente; */

/* Apaga o schema */
/* drop schema if exists empresa; *;

