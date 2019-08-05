CREATE DATABASE M_DPS

USE M_DPS


CREATE TABLE Habilidades(
	IdHabilidade INT PRIMARY KEY IDENTITY,
	Habilidade VARCHAR(200)
)

CREATE TABLE Departamentos(
	IdDepartamento INT PRIMARY KEY IDENTITY,
	Departamento VARCHAR(200)
)

CREATE TABLE Funcionarios(
	IdFuncionario INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(200),
	Contato	VARCHAR(200),
	IdDepartamento INT FOREIGN KEY REFERENCES Departamentos(IdDepartamento)
)

CREATE TABLE FuncionariosHabilidades(
	IdFuncionario INT FOREIGN KEY REFERENCES Funcionarios(IdFuncionario),
	IdHabilidade INT FOREIGN KEY REFERENCES Habilidades(IdHabilidade)
)



INSERT Departamentos(Departamento)
	VALUES('RH'),('Gerencia'),('Seguranca')

SELECT *
FROM Departamentos

INSERT Habilidades(Habilidade)
	VALUES('Forte'),('Lindo'),('Unteligente')
SELECT *
FROM Habilidades


INSERT Funcionarios(Nome, Contato, IdDepartamento)
	VALUES('Cleiton',111,3),('Joao',222,3),('Luiz',333,1),('Jesus',444,2)

SELECT *
FROM Funcionarios

INSERT FuncionariosHabilidades(IdFuncionario,IdHabilidade)
	VALUES(1,1),(2,1),(2,3),(3,2),(3,3),(4,1),(4,2),(4,3)

SELECT F.IdFuncionario ID,F.Nome,F.Funcao,F.Salario, D.Departamento
FROM Funcionarios F
	FULL JOIN Departamentos D ON F.IdDepartamento = D.IdDepartamento

SELECT F.IdFuncionario ID,F.Nome,F.Funcao,F.Salario, H.Habilidade
FROM FuncionariosHabilidades FH
	FULL JOIN Funcionarios F ON F.IdFuncionario= FH.IdFuncionario
	FULL JOIN Habilidades H ON H.IdHabilidade= FH.IdHabilidade

SELECT F.IdFuncionario ID, F.Nome,F.Funcao,F.Salario, D.Departamento, H.Habilidade
FROM FuncionariosHabilidades FH
	FULL JOIN Funcionarios F ON F.IdFuncionario= FH.IdFuncionario
	FULL JOIN Habilidades H ON H.IdHabilidade= FH.IdHabilidade
	FULL JOIN Departamentos D ON D.IdDepartamento = F.IdDepartamento


ALTER TABLE Funcionarios ADD Funcao VARCHAR(200)

UPDATE Funcionarios
SET Funcao = 'Psicologo Industrial'
WHERE IdFuncionario = 3

ALTER TABLE Funcionarios ADD Salario INT DEFAULT 1200

UPDATE Funcionarios
SET Salario= 4000
WHERE IdFuncionario = 4

ALTER TABLE Habilidades ADD Descricao VARCHAR(200)

UPDATE Habilidades
SET Descricao= 'Ahh para né'
WHERE IdHabilidade = 3


SELECT *
FROM Habilidades

SELECT F.Nome, H.Habilidade
FROM FuncionariosHabilidades FH
	JOIN Habilidades H ON FH.IdHabilidade = H.IdHabilidade
	JOIN Funcionarios F ON FH.IdFuncionario = F.IdFuncionario
WHERE FH.IdFuncionario = 3