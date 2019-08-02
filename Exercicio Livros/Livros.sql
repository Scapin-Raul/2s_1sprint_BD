CREATE DATABASE M_Livros

USE M_Livros

CREATE TABLE Generos (
	IdGenero INT PRIMARY KEY IDENTITY,
	Descricao VARCHAR(100) UNIQUE NOT NULL
)

SELECT * FROM Generos

CREATE TABLE Autores (
	IdAutor INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(100) UNIQUE NOT NULL,
	Email VARCHAR(100),
	Ativo BIT,
	DataNascimento DATE
)

CREATE TABLE Livros (
	IdLivro INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(100) UNIQUE NOT NULL,
	IdAutor INT FOREIGN KEY REFERENCES Autores(IdAutor),
	IdGenero INT FOREIGN KEY REFERENCES Generos(IdGenero)
)



INSERT Autores(Nome)
	VALUES('Machado de Assis'), ('Cleitinho'), ('Lula')

INSERT Generos(Descricao)
	VALUES ('Suspense'),('Romance'),('Terror'),('Ficcao')

INSERT Livros(Nome,IdAutor,IdGenero)
	VALUES('A perda filosofal', 3,4), ('Memorias postumas',1,1), ('Livro do Rezende',2,4), ('ViihTube',2,2),('Comunismo e seus benefificos',3,1)

UPDATE	Livros
SET Nome = UPPER(Nome)

DELETE Livros
	WHERE IdLivro = 4

SELECT * FROM Autores

SELECT * FROM Generos

SELECT * FROM Livros

SELECT L.IdLivro,L.Nome NomeLivro, A.Nome NomeAutor
FROM Livros L 
	JOIN Autores A ON L.IdAutor = A.IdAutor

SELECT L.IdLivro,L.Nome NomeLivro, G.Descricao Genero
FROM Livros L 
	JOIN Generos G ON L.IdGenero = G.IdGenero


	-- Tabela clean --
SELECT L.IdLivro,L.Nome NomeLivro, G.Descricao Genero, A.Nome NomeAutor
FROM Livros L 
	JOIN Generos G ON L.IdGenero = G.IdGenero
	JOIN Autores A ON L.IdAutor = A.IdAutor
	-- Tabela clean --

SELECT L.*, G.Descricao Genero, A.Nome NomeAutor
FROM Livros L 
	JOIN Generos G ON L.IdGenero = G.IdGenero
	JOIN Autores A ON L.IdAutor = A.IdAutor

ALTER TABLE Livros
	ADD Sinopse VARCHAR(200)

ALTER TABLE Livros
	ADD DataLancamento DATE

ALTER TABLE Livros
	ADD Veiculado BIT

UPDATE Livros
	SET Veiculado = 0
	WHERE IdLivro = 2

UPDATE Livros
	SET Sinopse = 'Sei lá mano ele fala de minecraft'
	WHERE IdLivro = 3

UPDATE Livros
	SET DataLancamento = convert(datetime,'03-03-17')
	WHERE IdLivro = 3

INSERT Livros(Nome,IdAutor,IdGenero,Sinopse,DataLancamento)
	VALUES('A Bela entorpecida', 3,2,'Apos uma rave a Bela se encontra perdida na floresta de cogumelos',convert(datetime,'02-02-02'))

SELECT L.IdLivro, L.Nome NomeLivro, L.Sinopse, L.DataLancamento, G.Descricao Genero, A.Nome NomeAutor
FROM Livros L 
	FULL JOIN Generos G ON L.IdGenero = G.IdGenero
	FULL JOIN Autores A ON L.IdAutor = A.IdAutor
