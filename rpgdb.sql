CREATE DATABASE rpgdb
USE rpgdb

CREATE TABLE Usuarios (
	IDUsuario INT PRIMARY KEY IDENTITY,
	Email VARCHAR (255) UNIQUE NOT NULL,
	Senha VARCHAR (255) NOT NULL
)
CREATE TABLE Classes(
	IDClasse INT PRIMARY KEY IDENTITY,
	Nome_Classe VARCHAR (63) UNIQUE NOT NULL,
	Descricao VARCHAR (255),
)
CREATE TABLE Personagens (
	IDPersonagem INT PRIMARY KEY IDENTITY,
	Nome_Personagem VARCHAR (31) UNIQUE NOT NULL,
	Usuario INT UNIQUE FOREIGN KEY REFERENCES Usuarios(IDusuario),
	Classe INT FOREIGN KEY REFERENCES Classes(IDClasse)
)
CREATE TABLE Habilidades(
	IDHabilidade INT PRIMARY KEY IDENTITY,
	Nome_Habilidade VARCHAR (127) UNIQUE NOT NULL
)
CREATE TABLE ClasseHabilidade(
	Classe INT FOREIGN KEY REFERENCES Classes(IDClasse),
	Habilidade INT FOREIGN KEY REFERENCES Habilidades(IDHabilidade)
)
--DML
INSERT INTO Usuarios VALUES ('email@teste.com', '1234')
SELECT * FROM Usuarios
INSERT INTO Classes VALUES ('Bárbaro','abcde')
INSERT INTO Habilidades VALUES ('Lança Mortal'), ('Escudo Supremo')
INSERT INTO Personagens (Nome_Personagem, Usuario, Classe) VALUES ('DeuBug', 1, 1 )
INSERT INTO ClasseHabilidade VALUES (1,1),(1,2)

INSERT INTO Usuarios VALUES ('email@email.com', '12345')
INSERT INTO Classes VALUES ('Monge','abcdef')
INSERT INTO Habilidades VALUES ('Recuperar Vida')
INSERT INTO Personagens (Nome_Personagem, Usuario, Classe) VALUES ('BitBug', 2, 2 )
INSERT INTO ClasseHabilidade VALUES (2,2),(2,3)

UPDATE Usuarios
SET Senha = 2048
WHERE IDUsuario = 2

SELECT * FROM Classes
SELECT * FROM Habilidades
SELECT * FROM Personagens
SELECT * FROM ClasseHabilidade

SELECT * FROM Personagens
INNER JOIN Classes
ON Personagens.Classe = Classes.IDClasse

SELECT P.Nome_Personagem, C.Nome_Classe,C.Descricao 'Descricao da Classe' FROM Personagens P
INNER JOIN Classes C
ON P.Classe = C.IDClasse

