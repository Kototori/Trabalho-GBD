# EXECUTAR COMO analista
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

CREATE TABLE rhdb.cargo(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   cargo varchar(255) NOT NULL
);

CREATE TABLE rhdb.cor_raca(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   cor_raca varchar(255) NOT NULL
);

CREATE TABLE rhdb.escolaridade(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   escolaridade varchar(255) NOT NULL,
   percentual_acrecimo int NOT NULL
);

CREATE TABLE rhdb.situacao_funcional(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   situacao_funcional varchar(255) NOT NULL
);

CREATE TABLE rhdb.pessoa_fisica(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(255) NOT NULL,
   cpf VARCHAR(11) NOT NULL,
   telefone varbinary(255),
   celular varbinary(255),
   id_endereco INT,
   id_situacao_funcional INT,
   id_cargo INT,
   id_cor_raca INT,
   CONSTRAINT FK_PF_Endereco FOREIGN KEY (id_endereco) REFERENCES enderecodb.endereco(id),
   CONSTRAINT FK_PF_SituacaoFuncional FOREIGN KEY (id_situacao_funcional) REFERENCES rhdb.situacao_funcional(id),
   CONSTRAINT FK_PF_Cargo FOREIGN KEY (id_cargo) REFERENCES rhdb.cargo(id),
   CONSTRAINT FK_PF_CorRaca FOREIGN KEY (id_cor_raca) REFERENCES rhdb.cor_raca(id),
   UNIQUE KEY (nome),
   UNIQUE KEY (cpf)
);

CREATE TABLE rhdb.pessoa_juridica(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   nome_fantasia VARCHAR(255) NOT NULL,
   data_fundacao DATE NOT NULL,
   cnpj VARCHAR(14) NOT NULL,
   url_site VARCHAR(255),
   id_endereco INT,
   CONSTRAINT FK_PJ_Endereco FOREIGN KEY (id_endereco) REFERENCES enderecodb.endereco(id)
);

CREATE TABLE rhdb.setor_empresa(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   setor_empresa varchar(255) NOT NULL,
   id_pessoa_juridica int,
   id_endereco INT,
   CONSTRAINT FK_SE_Pessoa_juridica FOREIGN KEY (id_pessoa_juridica) REFERENCES rhdb.pessoa_juridica(id),
   CONSTRAINT FK_SE_Endereco FOREIGN KEY (id_endereco) REFERENCES enderecodb.endereco(id)
);

CREATE TABLE rhdb.historico_carreira(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_pessoa_fisica int,
	data_inicio DATE NOT NULL,
	data_fim DATE,
	salario_atual DOUBLE(16,2),
	id_escolaridade int,
   CONSTRAINT FK_HT_Pessoa_Fisica FOREIGN KEY (id_pessoa_fisica) REFERENCES rhdb.pessoa_fisica(id),
   CONSTRAINT FK_HT_Escolaridade FOREIGN KEY (id_escolaridade) REFERENCES rhdb.escolaridade(id)
);

CREATE TABLE rhdb.historico_exclusao_pessoa_fisica(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   id_pessoa_fisica int NOT NULL,
   nome VARCHAR(255),
   cpf VARCHAR(11),
   telefone varbinary(255),
   celular varbinary(255),
   id_endereco INT,
   id_situacao_funcional INT,
   id_cargo INT,
   id_cor_raca INT,
   data_exclusao DATETIME NOT NULL
);

CREATE TABLE rhdb.historico_exclusao_pessoa_juridica(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   id_pessoa_juridica int NOT NULL,
   nome_fantasia VARCHAR(255),
   data_fundacao DATE,
   cnpj VARCHAR(14),
   url_site VARCHAR(255),
   id_endereco INT,
   data_exclusao DATETIME NOT NULL
);

CREATE TABLE rhdb.salario_base(
   id int AUTO_INCREMENT PRIMARY KEY,
   salario DOUBLE(16,2) NOT NULL,
   data_reajuste DATETIME NOT NULL
);

CREATE TABLE rhdb.setor_empresa_pessoas(
    id_setor_empresa int,
    id_pessoa_fisica int,
    CONSTRAINT FK_SEP_Setor_Empresa FOREIGN KEY (id_setor_empresa) REFERENCES rhdb.setor_empresa(id),
    CONSTRAINT FK_SE_Pessoa_Fisica FOREIGN KEY (id_pessoa_fisica) REFERENCES rhdb.pessoa_fisica(id)
);
