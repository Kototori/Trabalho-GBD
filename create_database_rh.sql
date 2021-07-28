CREATE DATABASE rhdb; 

create table rhdb.pessoa_fisica(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   endereco_residencial INT,
   sistema_funcional INT,
   cargo INT,
   cor_raca INT,
   escolaridade INT,
   CONSTRAINT FK_Pessoa_Fisica_SistemaFuncional FOREIGN KEY (sistema_funcional) REFERENCES rhdb.sistema_funcional(id),
   CONSTRAINT FK_Pessoa_Fisica_Cargo FOREIGN KEY (cargo) REFERENCES rhdb.cargo(id),
   CONSTRAINT FK_Pessoa_Fisica_CorRaca FOREIGN KEY (cor_raca) REFERENCES rhdb.cor_raca(id),
   CONSTRAINT FK_Pessoa_Fisica_Escolaridade FOREIGN KEY (escolaridade) REFERENCES rhdb.escolaridade(id)
);

create table rhdb.pessoa_juridica(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   nome_fantasia VARCHAR(100) NOT NULL,
   data_fundacao DATE NOT NULL,
   cnpj VARCHAR(20) NOT NULL,
   site VARCHAR(255) NOT NULL,
   endereco_comercial INT
);

create table rhdb.cargo(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   cargo varchar(75)
);

create table rhdb.escolaridade(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   escolaridade varchar(50)
);

create table rhdb.cor_raca(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   cor_raca varchar(50)
);

create table rhdb.setor_da_empresa(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   setor_da_empresa varchar(75),
   endereco int,
   CONSTRAINT FK_SetorEmpresa_Endereco FOREIGN KEY (endereco) REFERENCES enderecodb.endereco(id)
);

create table rhdb.sistema_funcional(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   sistema_funcional varchar(75)
);

# create_table_historico_trabalho
create table rhdb.historico_trabalho(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	pessoa varchar(255),
	data_inicio_escolaridade DATE,
	data_fim_escolaridade DATE,
	salario_atual INT,
	escolaridade varchar(255)	
);

# create_table_historico_exclusao
create table rhdb.historico_exclusao_pessoa_fisica(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   	nome VARCHAR(100) NOT NULL,
   	endereco_residencial INT,
   	sistema_funcional INT,
   	cargo INT,
   	cor_raca INT,
   	escolaridade INT,
   	data_exclusao DATE
);

create table rhdb.historico_exclusao_pessoa_juridica(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_fantasia VARCHAR(100) NOT NULL,
   	data_fundacao DATE NOT NULL,
   	cnpj VARCHAR(20) NOT NULL,
   	site VARCHAR(255) NOT NULL,
   	endereco_comercial INT,
   	data_exclusao DATE
);