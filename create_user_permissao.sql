# EXECUTAR COMO ROOT
CREATE USER 'dba'@'%' IDENTIFIED BY 'dba.123';

GRANT ALL ON *.* TO 'dba'@'%' WITH GRANT OPTION;

# EXECUTAR COMO DBA
CREATE USER 'analista'@'%' IDENTIFIED BY 'analista.123';

GRANT CREATE, SELECT, SUPER, ALTER, TRIGGER, INSERT, UPDATE, REFERENCES, CREATE ROUTINE, ALTER ROUTINE, TRIGGER ON *.* TO 'analista'@'%';

CREATE USER 'usuario1'@'%' IDENTIFIED BY 'usuario1.123';

GRANT UPDATE ON rhdb.historico_carreira TO 'usuario1'@'%';

#GRANTS PARA QUEBRAR A BASE
GRANT SELECT ON rhdb.pessoa_fisica TO 'usuario1'@'%';
GRANT SELECT ON rhdb.escolaridade TO 'usuario1'@'%';
GRANT SELECT ON rhdb.salario_base TO 'usuario1'@'%';
GRANT INSERT ON rhdb.historico_carreira TO 'usuario1'@'%';

CREATE USER 'usuario2'@'%' IDENTIFIED BY 'usuario2.123';