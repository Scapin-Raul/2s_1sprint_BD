CREATE DATABASE M_Moda

USE M_Moda

CREATE TABLE Cores(
	IdCor INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(200) 
)

CREATE TABLE Tamanhos(
	IdTamanho INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(200) 
)

CREATE TABLE Marcas(
	IdMarca INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(200) 
)

CREATE TABLE Camisetas(
	IdCamiseta INT PRIMARY KEY IDENTITY,
	IdMarca INT FOREIGN KEY REFERENCES Marcas(IdMarca) ,
	Nome VARCHAR(200), 
	Descricao VARCHAR(200) 
)

CREATE TABLE CamisetasCores(
	IdCamiseta INT FOREIGN KEY REFERENCES Camisetas(IdCamiseta),
	IdCor INT FOREIGN KEY REFERENCES Cores(IdCor)	
)

CREATE TABLE CamisetasTamanhos(
	IdCamiseta INT FOREIGN KEY REFERENCES Camisetas(IdCamiseta),
	IdTamanho INT FOREIGN KEY REFERENCES Tamanhos(IdTamanho)	
)

DROP TABLE CamisetasTamanhos

INSERT Cores(Nome)
	VALUES ('Azul'), ('Verde'), ('Vermelho'), ('Amarelo'), ('Branco'), ('Preto')

INSERT Marcas(Nome)
	VALUES ('Adidas'), ('Kappa'), ('Nike'), ('Xesque')

INSERT Tamanhos(Nome)
	VALUES ('PP'), ('P'), ('M'), ('G'), ('GG')

INSERT Camisetas(Nome, IdMarca)
	VALUES('C1', 2), ('C2', 4), ('C3', 4), ('C4', 3), ('C5', 1), ('C6', 2) 

UPDATE Camisetas
SET Descricao = 'Bla bla bla'

INSERT CamisetasCores(IdCamiseta, IdCor)
	VALUES(1,5),(1,6),(2,1),(3,1),(3,2),(3,3),(4,4),(5,4),(6,5),(6,6),(6,3)

INSERT CamisetasTamanhos(IdCamiseta, IdTamanho)
	VALUES(1,2),(1,3),(1,4),(2,1),(2,2),(3,3),(3,4),(3,5),(4,3),(5,2),(5,3),(5,4),(6,2),(6,3),(6,4)

SELECT *
FROM Cores

SELECT *
FROM Marcas

SELECT *
FROM Tamanhos

SELECT *
FROM Camisetas

SELECT Camisetas.Nome, Marcas.Nome Marca
FROM Camisetas
	JOIN Marcas ON Camisetas.IdMarca = Marcas.IdMarca

SELECT Camisetas.Nome,Marcas.Nome Marca, Tamanhos.Nome Tamanho
FROM CamisetasTamanhos 
	JOIN Camisetas ON CamisetasTamanhos.IdCamiseta = Camisetas.IdCamiseta
	JOIN Marcas ON Camisetas.IdMarca = Marcas.IdMarca
	JOIN Tamanhos ON CamisetasTamanhos.IdTamanho = Tamanhos.IdTamanho 

SELECT Camisetas.Nome, Marcas.Nome Marca, Cores.Nome Cor
FROM CamisetasCores
	JOIN Camisetas ON CamisetasCores.IdCamiseta = Camisetas.IdCamiseta
	JOIN Marcas ON Camisetas.IdMarca = Marcas.IdMarca
	JOIN Cores ON CamisetasCores.IdCor = Cores.IdCor

DELETE CamisetasTamanhos
WHERE IdCamiseta = 3

DELETE CamisetasCores
WHERE IdCamiseta = 3

DELETE Camisetas
WHERE IdCamiseta = 3

SELECT Camisetas.IdCamiseta ID,Camisetas.Nome, Marcas.Nome Marca, Cores.Nome Cor, Tamanhos.Nome Tamanho
FROM CamisetasCores
	FULL JOIN Camisetas ON CamisetasCores.IdCamiseta = Camisetas.IdCamiseta
	FULL JOIN Marcas ON Camisetas.IdMarca = Marcas.IdMarca
	FULL JOIN Cores ON CamisetasCores.IdCor = Cores.IdCor
	FULL JOIN CamisetasTamanhos ON Camisetas.IdCamiseta = CamisetasTamanhos.IdCamiseta
	FULL JOIN Tamanhos ON Tamanhos.IdTamanho = CamisetasTamanhos.IdTamanho