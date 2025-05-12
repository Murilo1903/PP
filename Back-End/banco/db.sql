CREATE DATABASE SpeechToon;
USE SpeechToon;

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    foto VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Preferencias (
	id_preferencias INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    genero VARCHAR(255) NOT NULL,
    empresa VARCHAR(255) NOT NULL,
    cultura VARCHAR(255) NOT NULL,
    tempo VARCHAR(255) NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Seguidor (
	id_registroSeguidor INT AUTO_INCREMENT PRIMARY KEY,
    id_seguidor INT NOT NULL,
    id_seguido INT NOT NULL,
    FOREIGN KEY (id_seguidor) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_seguido) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Postagens (
    id_postagem INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    conteudo VARCHAR(255) NOT NULL,
    tag VARCHAR(255) NOT NULL,
    enviado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE curtidasPostagens (
	id_registroCurtidas INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_postagem INT NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
	FOREIGN KEY (id_postagem) REFERENCES Postagens(id_postagem)
);

CREATE TABLE comentariosPostagens(
    id_comentarioPOST INT AUTO_INCREMENT PRIMARY KEY,
    id_postagem INT NOT NULL,
    id_usuario INT NOT NULL,
    comentario VARCHAR(255) NOT NULL,
    enviado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_postagem) REFERENCES Postagens(id_postagem),
	FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE curtidasComentarios (
	id_registroCurtidas INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_comentarioPOST INT NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
	FOREIGN KEY (id_comentarioPOST) REFERENCES comentariosPostagens(id_comentarioPOST)
);


CREATE TABLE Comunidades(
	id_comunidade INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    tag VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    foto VARCHAR (255) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Membros(
	id_registroMembro INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_comunidade INT NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_comunidade) REFERENCES Comunidades(id_comunidade)
);

CREATE TABLE postComunidade(
	id_postComunidade INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_comunidade INT NOT NULL,
    conteudo VARCHAR(255) NOT NULL,
    enviado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
	FOREIGN KEY (id_comunidade) REFERENCES Comunidades(id_comunidade)
);

CREATE TABLE curtidasComunidade (
	id_registroCurtidas INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_postComunidade INT NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
	FOREIGN KEY (id_postComunidade) REFERENCES postComunidade(id_postComunidade)
);

CREATE TABLE Comentarios_Comunidades(
	id_comentarioComunidade INT AUTO_INCREMENT PRIMARY KEY,
	id_postComunidade INT NOT NULL,
    id_usuario INT NOT NULL,
	comentario VARCHAR(255) NOT NULL,
	enviado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
	FOREIGN KEY (id_postComunidade) REFERENCES postComunidade(id_postComunidade)
);

CREATE TABLE curtidasComunidade_comentario (
	id_registroCurtidas INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_comentarioComunidade INT NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
	FOREIGN KEY (id_comentarioComunidade) REFERENCES Comentarios_Comunidades(id_comentarioComunidade)
);

CREATE TABLE Mensagens (
    id_mensagens INT AUTO_INCREMENT PRIMARY KEY,
    id_remetente INT NOT NULL,
    id_destinatario INT NOT NULL,
    conteudo VARCHAR(255) NOT NULL,
    enviado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_remetente) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_destinatario) REFERENCES Usuarios(id_usuario)
);