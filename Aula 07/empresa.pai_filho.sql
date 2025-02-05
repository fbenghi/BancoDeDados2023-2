/* Cria a tabela pai */
CREATE TABLE IF NOT EXISTS pai (
    pai_id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (pai_id)
);

/* Cria a tabela filho */
CREATE TABLE IF NOT EXISTS filho (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_pai_id INT,
    FOREIGN KEY (fk_pai_id)
        REFERENCES pai(pai_id)
);

/*
NÃO FUNCIONA!!!
Tentativa de inserir dados na tabela filho, sem que exista um registro na 
tabela pai.   
*/
INSERT INTO filho
(id, fk_pai_id)
VALUES
(1,1);

/* Inserção de dados na tabela PAI*/
INSERT INTO PAI
(pai_id)
VALUES
(1);

/* 
Inserção de dados na tabela FILHO. Agora funciona, porque o já existe um valor
a referencia para outras tabelas já existe fk_pai_id = 1
*/
INSERT INTO filho
(id, fk_pai_id)
VALUES
(1,1);

/* 
NÃO FUNCIONA!!!
Tentativa de deletar um registro da tabela pai que é referenciado pela tabela filho 
Não permite que seja apagado um registro que é referenciado em outra tabela
*/
DELETE FROM pai WHERE pai_id = 1;

/* Descobre o nome dado a chave estrangeira automaticamente pelo SGBD */
select CONSTRAINT_NAME
from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where TABLE_NAME = 'filho';


/* Apaga a tabela filho*/
drop table filho;

/* Recria a tabela filho, adicionando nome a foreign key e uma regra de referencia*/
CREATE TABLE IF NOT EXISTS filho (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_pai_id INT,
    CONSTRAINT filho_fk_pai
    FOREIGN KEY (fk_pai_id)
        REFERENCES pai(pai_id)
        ON DELETE CASCADE
);

/* Insere dado na tabela filho fazendo referencia a tabela pai*/
INSERT INTO filho
(id, fk_pai_id)
VALUES
(1,1);

/* Tabela filho com 1 registro*/
SELECT * FROM FILHO;

/* Deleta o registro da tabela pai*/
DELETE FROM pai WHERE pai_id = 1;

/* Tabela filho com 0 registro, isto porque o registro da tabela pai foi deletado*/
SELECT * FROM FILHO;


describe pai;
describe filho;