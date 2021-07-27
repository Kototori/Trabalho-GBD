CREATE DATABASE rhbd; 

create table rhbd.pessoa_fisica(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   endereco_residencial INT
   sistema_funcional INT,
   cargo INT,
   cor_raca INT,
   escolaridade INT,
   CONSTRAINT FK_Pessoa_Fisica_SistemaFuncional FOREIGN KEY (sistema_funcional) REFERENCES rhbd.sistema_funcional(id),
   CONSTRAINT FK_Pessoa_Fisica_Cargo FOREIGN KEY (cargo) REFERENCES rhbd.cargo(id),
   CONSTRAINT FK_Pessoa_Fisica_CorRaca FOREIGN KEY (cor_raca) REFERENCES rhbd.cor_raca(id),
   CONSTRAINT FK_Pessoa_Fisica_Escolaridade FOREIGN KEY (escolaridade) REFERENCES rhbd.escolaridade(id)
);

create table rhbd.pessoa_juridica(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   nome_fantasia VARCHAR(100) NOT NULL,
   data_fundacao DATE NOT NULL,
   cnpj VARCHAR(20) NOT NULL,
   site VARCHAR(255) NOT NULL,
   endereco_comercial INT
);

create table rhbd.cargo(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   cargo varchar(75)
);

create table rhbd.escolaridade(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   escolaridade varchar(50)
);

create table rhbd.cor_raca(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   cor_raca varchar(50)
);

create table rhbd.setor_da_empresa(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   setor_da_empresa varchar(75),
   endereco int,
   CONSTRAINT FK_SetorEmpresa_Endereco FOREIGN KEY (endereco) REFERENCES enderecodb.endereco(id),
);

create table rhbd.sistema_funcional(
   id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   sistema_funcional varchar(75)
);


