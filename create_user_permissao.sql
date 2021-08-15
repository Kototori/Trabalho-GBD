# EXECUTAR COMO ROOT
CREATE USER 'dba' @'%' IDENTIFIED BY 'dba.123';
GRANT ALL ON *.* TO 'dba' @'%' WITH GRANT OPTION;

# EXECUTAR COMO DBA
CREATE USER 'analista' @'%' IDENTIFIED BY 'analista.123';
CREATE USER 'usuario1' @'%' IDENTIFIED BY 'usuario1.123';
CREATE USER 'usuario2' @'%' IDENTIFIED BY 'usuario2.123';

GRANT CREATE,
    CREATE VIEW,
    SELECT,
    SUPER,
    ALTER,
    TRIGGER,
    INSERT,
    UPDATE,
    REFERENCES,
    CREATE ROUTINE,
    ALTER ROUTINE,
    TRIGGER ON *.* TO 'analista' @'%';

# EXECUTAR COMO DBA APOS CRIACAO DOS OBJETOS
GRANT SELECT ON rhdb.pessoa_fisica TO 'usuario1' @'%';
GRANT SELECT ON rhdb.cargo TO 'usuario1' @'%'; 
GRANT SELECT ON rhdb.situacao_funcional TO 'usuario1' @'%'; 
GRANT SELECT ON rhdb.historico_carreira TO 'usuario1' @'%'; 
GRANT SELECT ON rhdb.escolaridade TO 'usuario1' @'%'; 
GRANT SELECT ON rhdb.setor_empresa_pessoas TO 'usuario1' @'%'; 
GRANT SELECT ON rhdb.setor_empresa TO 'usuario1' @'%'; 
GRANT SELECT ON enderecodb.endereco TO 'usuario1' @'%'; 
GRANT SELECT ON enderecodb.bairro TO 'usuario1' @'%'; 
GRANT SELECT ON enderecodb.cidade TO 'usuario1' @'%'; 
GRANT SELECT ON enderecodb.unidade_federativa TO 'usuario1' @'%'; 
GRANT SELECT ON rhdb.salario_base TO 'usuario1' @'%';
GRANT INSERT ON rhdb.historico_carreira TO 'usuario1' @'%';
GRANT EXECUTE ON PROCEDURE rhdb.pcr_historico_carreira TO 'usuario1' @'%';

GRANT SELECT ON rhdb.vw_pessoa_fisica_contato TO 'usuario2' @'%';
GRANT SELECT ON enderecodb.endereco TO 'usuario2' @'%';
GRANT SELECT ON enderecodb.bairro TO 'usuario2' @'%';
GRANT SELECT ON enderecodb.cidade TO 'usuario2' @'%';
GRANT SELECT ON enderecodb.unidade_federativa TO 'usuario2' @'%';
GRANT SELECT ON rhdb.pessoa_fisica TO 'usuario2' @'%';