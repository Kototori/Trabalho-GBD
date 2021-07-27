# EXECUTAR COMO ROOT
CREATE USER 'DBA'@'%' IDENTIFIED BY 'dba.123';

CREATE USER 'DBA'@'localhost' IDENTIFIED BY 'dba.123';

GRANT ALL ON *.* TO 'DBA'@'%';

GRANT GRANT OPTION ON *.* TO 'DBA'@'%';

GRANT ALL ON *.* TO 'DBA'@'localhost';

GRANT GRANT OPTION ON *.* TO 'DBA'@'localhost';

# EXECUTAR COMO DBA
CREATE USER 'analista'@'%' IDENTIFIED BY 'analista.123';

GRANT ALL ON enderecodb.* TO 'analista'@'%';

GRANT ALL ON rhdb.* TO 'analista'@'%';

CREATE USER 'usuario1'@'%' IDENTIFIED BY 'usuario1.123';

CREATE USER 'usuario2'@'%' IDENTIFIED BY 'usuario2.123';