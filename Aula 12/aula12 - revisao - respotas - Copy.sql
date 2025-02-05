DROP schema if exists aula12 ;
create schema aula12;

use aula12;

/* Criação das tabelas */    
create table Membro
(
	idMembro INT PRIMARY KEY AUTO_INCREMENT,
    pnome VARCHAR(30),
    sobrenome VARCHAR(30),
    data_nascimento DATE
);


create table Telefone
(
	idTelefone INT AUTO_INCREMENT,
    idMembro INT,
    ddd DEC(3,0),
    numero DEC(9,0),
    primary key(idTelefone,idMembro),
	CONSTRAINT fk_tel_membro foreign key (idMembro)
		references Membro(idMembro)
        ON DELETE cascade
        ON UPDATE cascade
);

create table Emprestimo
(
	idEmprestimo INT AUTO_INCREMENT PRIMARY KEY,
    dataEmprestimo DATE NOT NULL,
    dataDevolucao DATE,
    idMembro INT,
    CONSTRAINT fk_emprestimo_membro foreign key (idMembro)
		references Membro(idMembro)
        ON DELETE SET NULL
        ON UPDATE SET NULL
);

create table Livro
(
	idLivro INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30),
    autor varchar(30),
    categoria set('drama', 'comedia', 'scifi', 'romance')
);

create table LivroEmprestimo
(
	idLivro INT,
    idEmprestimo INT,
    Primary Key(idLivro, idEmprestimo),
    CONSTRAINT fk_emprestimo_livro foreign key (idEmprestimo)
		references Emprestimo(idEmprestimo)
        ON DELETE cascade
        ON UPDATE cascade,
	CONSTRAINT fk_livro_emprestimo foreign key (idLivro)
		references Livro(idLivro)
        ON DELETE cascade
        ON UPDATE cascade
);

INSERT INTO membro
(pnome,sobrenome,data_nascimento)
VALUES
('João', 'Silva', '1980-05-01'),
('Maria', 'Pereira', '1990-10-12'),
('Carlos', 'Oliveira', '1975-07-24'),
('Ana', 'Fernandes', '1985-06-30'),
('Pedro', 'Alves', '1992-11-15'),
('Lucas', 'Mendes', '1978-03-22'),
('Paula', 'Barros', '1987-04-28'),
('Luís', 'Rocha', '1991-12-19'),
('Adriana', 'Teixeira', '1982-08-05'),
('Rafael', 'Martins', '1976-02-14'),
('Patrícia', 'Santos', '1989-09-07'),
('Bruno', 'Lima', '1993-10-31'),
('Mariana', 'Ferreira', '1984-07-26'),
('Felipe', 'Gomes', '1977-01-03'),
('Aline', 'Ribeiro', '1988-06-18'),
('Guilherme', 'Costa', '1992-05-09'),
('Juliana', 'Cavalcanti', '1983-04-21'),
('Gustavo', 'Cardoso', '1979-03-13'),
('Camila', 'Dias', '1990-02-02'),
('Rodrigo', 'Pinto', '1981-01-24');

Insert INTO livro
(nome, autor, categoria)
values
('O Alquimista', 'Paulo Coelho', 'drama'),
('Dom Casmurro', 'Machado de Assis', 'drama'),
('1984', 'George Orwell', 'scifi'),
('Orgulho e Preconceito', 'Jane Austen', 'romance'),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'drama'),
('Moby Dick', 'Herman Melville', 'drama'),
('Guerra dos Mundos', 'H.G. Wells', 'scifi'),
('Romeu e Julieta', 'William Shakespeare', 'romance'),
('A Revolução dos Bichos', 'George Orwell', 'drama'),
('Admirável Mundo Novo', 'Aldous Huxley', 'scifi'),
('Emma', 'Jane Austen', 'romance'),
('O Hobbit', 'J.R.R. Tolkien', 'drama'),
('Duna', 'Frank Herbert', 'scifi'),
('Wuthering Heights', 'Emily Bronte', 'romance'),
('O Senhor dos Anéis', 'J.R.R. Tolkien', 'drama'),
('Neuromancer', 'William Gibson', 'scifi'),
('Pride and Prejudice', 'Jane Austen', 'romance'),
('To Kill a Mockingbird', 'Harper Lee', 'drama'),
('Fahrenheit 451', 'Ray Bradbury', 'scifi'),
('Sense and Sensibility', 'Jane Austen', 'romance');

select * from emprestimo;


Insert INTO Emprestimo 
(dataEmprestimo, dataDevolucao, idMembro)
VALUES
('2023-01-01', '2023-01-31', 1),
('2023-01-02', '2023-02-01', 2),
('2023-01-03', '2023-02-02', 3),
('2023-01-04', '2023-02-03', 4),
('2023-01-05', '2023-02-04', 5),
('2023-01-06', '2023-02-05', 6),
('2023-01-07', '2023-02-06', 7),
('2023-01-08', '2023-02-07', 8),
('2023-01-09', '2023-02-08', 9),
('2023-01-10', '2023-02-09', 10),
('2023-01-11', '2023-02-10', 11),
('2023-01-12', '2023-02-11', 12),
('2023-01-13', '2023-02-12', 13),
('2023-01-14', '2023-02-13', 14),
('2023-01-15', '2023-02-14', 5),
('2023-01-16', '2023-02-15', 6),
('2023-01-17', '2023-02-16', 7),
('2023-01-18', '2023-02-17', 8),
('2023-01-19', '2023-02-18', 9),
('2023-01-20', '2023-02-19', 10),
('2023-01-21', '2023-02-20', 1),
('2023-01-22', '2023-02-21', 2),
('2023-01-23', '2023-02-22', 3),
('2023-01-24', '2023-02-23', 4),
('2023-01-25', '2023-02-24', 5),
('2023-01-26', NULL, 6),
('2023-01-27', NULL, 7),
('2023-01-28', NULL, 8),
('2023-01-29', NULL, 9),
('2023-01-30', NULL, 1),
('2023-01-31', NULL, 1),
('2023-02-01', NULL, 1),
('2023-02-02', NULL, 1),
('2023-02-03', NULL, 1),
('2023-02-04', '2023-03-06', 1),
('2023-02-05', '2023-03-07', 16),
('2023-02-06', '2023-03-08', 17),
('2023-02-07', '2023-03-09', 18),
('2023-02-08', '2023-03-10', 19),
('2023-02-09', '2023-03-11', 20);

INSERT INTO Telefone
(idMembro, ddd, numero)
Values
(1, 041, 987654321),
(2, 021, 876543210),
(3, 031, 765432109),
(4, 041, 654321098),
(5, 051, 543210987),
(6, 061, 432109876),
(7, 071, 321098765),
(8, 081, 210987654),
(9, 091, 109876543),
(10, 101, 098765432),
(11, 111, 987654321),
(12, 121, 876543210),
(13, 131, 765432109),
(14, 141, 654321098),
(15, 151, 543210987),
(16, 161, 432109876),
(1, 211, 987654321),
(2, 221, 876543210),
(3, 231, 765432109),
(4, 241, 654321098),
(5, 251, 543210987),
(6, 261, 432109876),
(7, 271, 321098765),
(8, 281, 210987654),
(9, 291, 109876543),
(10, 301, 098765432),
(11, 311, 987654321),
(12, 321, 876543210),
(13, 331, 765432109),
(14, 341, 654321098),
(15, 351, 543210987),
(16, 361, 432109876),
(17, 371, 321098765);

Insert into LivroEmprestimo
Values
(1, 20),
(2, 19),
(3, 18),
(4, 17),
(5, 16),
(6, 15),
(7, 14),
(8, 13),
(9, 12),
(10, 11),
(11, 10),
(12, 9),
(13, 8),
(14, 7),
(15, 6),
(16, 5),
(17, 4),
(18, 3),
(19, 2),
(20, 1),
(20, 1),
(19, 2),
(1, 18),
(2, 17),
(18, 3),
(17, 4),
(3, 16),
(4, 15),
(16, 5),
(15, 6),
(5, 14),
(6, 13),
(14, 7),
(13, 8),
(7, 12),
(8, 11),
(12, 9),
(11, 10),
(9, 20),
(10, 19),
(20, 8),
(19, 7),
(8, 18),
(7, 17),
(18, 6),
(17, 5),
(6, 16),
(5, 15),
(16, 4),
(15, 3);


/* 4.	Descubra a data de nascimento do membro mais novo?  */
SELECT max(data_nascimento) FROM Membro;

/* 5.	Qual o nome do membro mais velho? */
SELECT Pnome, sobrenome, data_nascimento from membro where data_nascimento = (SELECT min(data_nascimento) FROM Membro LIMIT 1);

/* 6. Qual é o membro com mais empréstimos? */
SELECT emprestimo.idMembro, membro.pnome, membro.sobrenome, Count(*) AS num_emprestimo
FROM emprestimo 
Inner join membro
on membro.idmembro = emprestimo.idmembro
group by emprestimo.Idmembro
LIMIT 1;

/* 7.	Quais empréstimos não foram devolvidos  */
SELECT * FROM emprestimo where datadevolucao IS NULL;

/* 8.	Quantos livros temos por categoria */ 
SELECT categoria, count(*)  FROM livro group by categoria;

/* 9.	Quais categorias de livros têm mais do que 7 livros disponíveis? */
SELECT categoria, count(*)  FROM livro group by categoria having count(*) > 7;

/*10.	Qual o nome dos membros que não ainda tem livros a devolver?*/
SELECT membro.pnome, membro.sobrenome FROM emprestimo
INNER JOIN membro
ON membro.idmembro = emprestimo.idmembro
where datadevolucao IS NULL;

/* 10.	Quais os nomes dos livros que o membro chamado Pedro Alves emprestou? */
SELECT 
    *
FROM
    membro
        INNER JOIN
    emprestimo ON membro.idmembro = emprestimo.idmembro
        INNER JOIN
    livroEmprestimo ON livroEmprestimo.idemprestimo = emprestimo.idemprestimo
        INNER JOIN
    livro ON livroEmprestimo.idlivro = livro.idlivro
WHERE
    membro.pnome = 'Pedro'
        AND membro.sobrenome = 'Alves';