CREATE TABLE pais (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome varchar(255)
);

CREATE TABLE unidade_federativa (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome varchar(255),
	sigla varchar(2),
	pais_id int,
	CONSTRAINT FK_UF_Pais FOREIGN KEY (pais_id) REFERENCES pais(id)
);

CREATE TABLE cidade (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome varchar(255),
	uf_id int,
	CONSTRAINT FK_Cidade_UF FOREIGN KEY (uf_id) REFERENCES unidade_federativa(id)
);

CREATE TABLE bairro (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome varchar(255),
	cep varchar(255),
	cidade_id int,
	CONSTRAINT FK_Bairo_Cidade FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

CREATE TABLE endereco (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	logradouro varchar(255),
	numero varchar(255),
	complemento varchar(255),
	bairro_id int,
	CONSTRAINT FK_Endereco_Bairro FOREIGN KEY (bairro_id) REFERENCES bairro(id)
);
