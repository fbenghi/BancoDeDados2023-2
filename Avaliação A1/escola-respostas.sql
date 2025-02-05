DROP DATABASE IF EXISTS Avaliacao_BD_A1_Escola;
CREATE DATABASE Avaliacao_BD_A1_Escola;
USE Avaliacao_BD_A1_Escola;

-- Cria a tabela Aluno
CREATE TABLE Aluno (
    CodigoMatricula INT AUTO_INCREMENT PRIMARY KEY,
    CPF CHAR(11) UNIQUE,
    Nome VARCHAR(40),
    CEP DEC(8 , 0 ),
    Rua VARCHAR(40),
    Cidade VARCHAR(40)
);

CREATE TABLE Curriculo (
    idCurriculo INT AUTO_INCREMENT PRIMARY KEY,
    graduacao VARCHAR(40),
    mestrado VARCHAR(40),
    doutorado VARCHAR(40)
);



CREATE TABLE Professor (
    IdProfessor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40),
    idCurriculo INT,
    CONSTRAINT fk_professor_cv FOREIGN KEY (idCurriculo)
        REFERENCES Curriculo (idCurriculo)
);

CREATE TABLE Disciplina (
    IdDisciplina INT AUTO_INCREMENT PRIMARY KEY,
    Ano DEC(4 , 0 ),
    Semestre INT,
    IdProfessor INT,
    Nome VARCHAR(40),
    CONSTRAINT fk_disciplina_prof FOREIGN KEY (IdProfessor)
        REFERENCES Professor (IdProfessor)
);

CREATE TABLE Aluno_Disciplina (
    IdDisciplina INT,
    CodigoMatricula INT,
    nota INT,
    PRIMARY KEY (IdDisciplina , CodigoMatricula),
    CONSTRAINT fk_IdDisciplina FOREIGN KEY (IdDisciplina)
        REFERENCES Disciplina (IdDisciplina),
    CONSTRAINT fk_CodigoMatricula FOREIGN KEY (CodigoMatricula)
        REFERENCES Aluno (CodigoMatricula)
);


-- Inserir dados
INSERT INTO Aluno (CPF, Nome, CEP, Rua, Cidade) VALUES
("12345678901", 'João Silva', 80010000, 'Rua da Paz', 'Curitiba'),
("23456789012", 'Maria Santos', 80230020, 'Rua XV de Novembro', 'Curitiba'),
("34567890123", 'José Souza', 80510000, 'Rua Padre Anchieta', 'Curitiba'),
("45678901234", 'Ana Oliveira', 80330040, 'Rua Marechal Deodoro', 'Curitiba'),
("56789012345", 'Luiz Pereira', 80410100, 'Rua Almirante Gonçalves', 'Curitiba'),
("67890123456", 'Fernanda Costa', 80020000, 'Rua das Flores', 'Curitiba'),
("78901234567", 'Ricardo Santos', 80240030, 'Rua das Araucárias', 'Curitiba'),
("89012345678", 'Mariana Souza', 80520000, 'Rua do Herval', 'Curitiba'),
("90123456789", 'Pedro Oliveira', 80340050, 'Rua das Palmeiras', 'Curitiba'),
("10234567890", 'Juliana Pereira', 80420100, 'Rua das Orquídeas', 'Curitiba'),
("11223344556", 'Lucas Silva', 80030000, 'Rua do Sol', 'Curitiba'),
("22334455667", 'Amanda Santos', 80250040, 'Rua das Hortências', 'Curitiba'),
("33445566778", 'Roberto Souza', 80530000, 'Rua do Bosque', 'Curitiba'),
("44556677889", 'Carla Oliveira', 80350060, 'Rua das Acácias', 'Curitiba'),
("55667788990", 'Gustavo Pereira', 80430100, 'Rua das Margaridas', 'Curitiba'),
("66778899011", 'Larissa Silva', 80040000, 'Rua da Lua', 'Curitiba'),
("77889900122", 'Bruno Santos', 80260050, 'Rua das Bromélias', 'Curitiba'),
("88990011233", 'Isabela Souza', 80540000, 'Rua do Lago', 'Curitiba'),
("99001122344", 'Rafael Oliveira', 80360070, 'Rua das Violetas', 'Curitiba'),
("10011223345", 'Mariana Pereira', 80440100, 'Rua das Tulipas', 'Curitiba');

INSERT INTO Curriculo (graduacao, mestrado, doutorado) VALUES
('Engenharia Civil', 'Engenharia de Produção', 'Engenharia Mecânica'),
('Engenharia Elétrica', 'Engenharia de Computação', 'Engenharia de Telecomunicações'),
('Engenharia Química', 'Engenharia de Alimentos', 'Engenharia de Materiais'),
('Engenharia Ambiental', 'Engenharia Sanitária', 'Engenharia de Petróleo'),
('Engenharia de Minas', 'Engenharia Metalúrgica', 'Engenharia de Controle e Automação'),
('Arquitetura e Urbanismo', 'Design Gráfico', 'Design de Interiores'),
('Ciência da Computação', 'Sistemas de Informação', 'Engenharia de Software'),
('Matemática', 'Estatística', 'Física'),
('Química', 'Farmácia', 'Biologia'),
('Geologia', 'Geografia', 'Meteorologia'),
('História', 'Geografia', 'Sociologia'),
('Filosofia', 'Letras', 'Psicologia'),
('Direito', 'Administração', 'Ciências Contábeis'),
('Educação Física', 'Fisioterapia', 'Nutrição'),
('Enfermagem', 'Medicina', 'Odontologia'),
('Psicologia', 'Serviço Social', 'Pedagogia'),
('Jornalismo', 'Publicidade e Propaganda', 'Relações Públicas'),
('Turismo', 'Hotelaria', 'Gastronomia'),
('Artes Cênicas', 'Música', 'Artes Visuais'),
('Dança', 'Teatro', 'Cinema');


INSERT INTO Professor (IdProfessor, nome, idCurriculo) VALUES
(1, 'Maria Santos', 2),
(2, 'José Souza', 3),
(3, 'Ana Oliveira', 4),
(4, 'Luiz Pereira', 5),
(5, 'Souza Costa', 6),
(6, 'Ricardo Santos', 7),
(7, 'Mariana Souza', 8),
(8, 'Pedro Oliveira', 9),
(9, 'Juliana Pereira', 10),
(10, 'Lucas Silva', 11),
(11, 'Amanda Santos', 12),
(12, 'Roberto Souza', 13),
(13, 'Carla Oliveira', 14),
(14, 'Gustavo Pereira', 15),
(15, 'Larissa Silva', 16),
(16, 'Bruno Santos', 17),
(17, 'Isabela Souza', 18),
(18, 'Rafael Oliveira', 19),
(19, 'Mariana Pereira', 20),
(20, 'João Silva', 1);


-- Disciplina
INSERT INTO Disciplina (Ano, Semestre, IdProfessor, Nome) VALUES
(2023, 1, 5, 'Matemática'),
(2023, 2, 7, 'Física'),
(2023, 1, 8, 'Química'),
(2023, 2, 3, 'Biologia'),
(2023, 1, 1, 'História'),
(2023, 2, 2, 'Geografia'),
(2023, 1, 4, 'Sociologia'),
(2023, 2, 6, 'Sociologia'),
(2023, 1, 9, 'Artes'),
(2022, 2, 10, 'Educação Física'),
(2021, 1, 11, 'Inglês'),
(2023, 2, 12, 'Espanhol'),
(2021, 1, 13, 'Francês'),
(2023, 2, 14, 'Alemão'),
(2021, 1, 15, 'Italiano'),
(2024, 2, 1, 'Mandarim'),
(2023, 1, 1, 'Japonês'),
(2023, 2, 2, 'Coreano'),
(2023, 1, 3, 'Russo'),
(2023, 2, 4, 'Árabe');

INSERT INTO Aluno_Disciplina (IdDisciplina, CodigoMatricula, nota) VALUES
(2, 4, 75),
(2, 3, 85),
(3, 5, 92),
(3, 14, 60),
(4, 3, 48),
(4, 4, 63),
(5, 5, 98),
(5, 3, 70),
(6, 4, 80),
(6, 5, 50),
(7, 3, 90),
(7, 4, 40),
(8, 5, 55),
(8, 3, 75),
(2, 10, 65),
(2, 13, 70),
(3, 15, 95),
(3, 4, 50),
(4, 13, 55),
(4, 14, 70),
(5, 15, 85),
(5, 13, 80),
(6, 14, 90),
(6, 15, 45),
(7, 13, 80),
(7, 14, 35),
(8, 15, 60),
(8, 13, 70),
(2, 19, 70),
(2, 16, 75);

-- Questões
