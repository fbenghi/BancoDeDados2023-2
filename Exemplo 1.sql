/* Exclui o banco de dados "empresa", caso o banco de dados exista */
drop database if exists empresa;

/* Cria o banco de dados "empresa" */
create database empresa;

/* Define o banco de dados atual */
use empresa;

/* 
	Criar tabela departamentos visualmente
	- inserir dados
*/


/* Criar tabela projetos*/
create table projetos(
	id int not null auto_increment,
	nome varchar (40) not null,
	orcamento float,
	primary key (id)
);

INSERT INTO `aula01`.`projetos`
(`id`,
`nome`,
`orcamento`)
VALUES
(1,
"Expansão Fábrica",
3000.00);

/* Mostra todos os registros da tabela de projetos */
select * from projetos;

/* Cria a tabela de clientes (observe as constraints "not null", "auto_increment" e "primary key") */
create table funcionarios(
	id int not null auto_increment,
	nome varchar (40) not null,
	cpf varchar (14) not null,
	salario float,
	genero enum ('M', 'F'),
	primary key (id)
);

INSERT INTO `aula01`.`funcionarios`
(`id`,
`nome`,
`cpf`,
`salario`,
`genero`)
VALUES
(1,
"Felipe",
"111.222.333-12",
1232.12,
'M');

/* Descreve a estrutura da tabela de funcionarios*/
describe funcionarios;

/* Mostra todos os registros da tabela de clientes */
select * from funcionarios;

/* Insere um registro na tabela  de funcionarios, omitindo o campo "id", já que é auto_increment */
-----


insert into clientes
(nome, genero, nascimento, cidade, uf)
value
('Beatriz', 'F', '1990-07-15', 'Campo Largo', 'PR');

/* Mostra todos os registros da tabela de clientes */
select * from clientes;

insert into clientes
(nome, genero, nascimento, cidade, uf)
values
('Carlos', 'F', '1995-09-21', 'Curitiba', 'PR'),
('Elaine', 'M', '1995-12-22', 'Ponta Grossa', 'PR'),
('Fábio', 'M', '1996-11-23', 'Santo André', 'SP');

/* Mostra todos os registros da tabela de clientes */
select * from clientes;

/* Tenta violar  a regra de preenchimento do campo "gênero", que aceita apenas "M" ou "F" (o MySQL apresentará uma mensagem de erro) */
insert into clientes
(nome, genero, nascimento, cidade, uf)
values
('Gilberto', 'A', '1977-11-25', 'Curitiba', 'PR');

/* Inclui o registro corretamente */
insert into clientes
(nome, genero, nascimento, cidade, uf)
values
('Gilberto', 'M', '1977-11-25', 'Curitiba', 'PR');

/* Mostra todos os registros da tabela de clientes */
select * from clientes;

/* Exclui a tabela de clientes */
drop table clientes;

/* Exclui o banco de dados */
drop database empresa;
