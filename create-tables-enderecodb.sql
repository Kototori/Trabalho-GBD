CREATE TABLE enderecodb.pais (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome varchar(255)
);

CREATE TABLE enderecodb.unidade_federativa (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome varchar(255),
	sigla varchar(2),
	pais_id int,
	CONSTRAINT FK_UF_Pais FOREIGN KEY (pais_id) REFERENCES enderecodb.pais(id)
);

CREATE TABLE enderecodb.cidade (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome varchar(255),
	uf_id int,
	CONSTRAINT FK_Cidade_UF FOREIGN KEY (uf_id) REFERENCES enderecodb.unidade_federativa(id)
);

CREATE TABLE enderecodb.bairro (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome varchar(255),
	cep varchar(255),
	cidade_id int,
	CONSTRAINT FK_Bairo_Cidade FOREIGN KEY (cidade_id) REFERENCES enderecodb.cidade(id)
);

CREATE TABLE enderecodb.endereco (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	logradouro varchar(255),
	numero varchar(255),
	complemento varchar(255),
	bairro_id int,
	CONSTRAINT FK_Endereco_Bairro FOREIGN KEY (bairro_id) REFERENCES enderecodb.bairro(id)
);