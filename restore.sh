# RESTORE BACKUP INTO DOCKER CONTAINER
# SUBSTITUIR <container_id> PELO ID DO CONTAINER

# NECESSARIO CONCEDER PERMISSAO PARA EXECUTAR OS ARQUIVO COMO PROGRAMA
# DEIXAR SCRIPT E BACKUP NA MESMA PASTA PARA EXECUTAR
# CRIAR O BANCO DE DESTINO NO SERVIDOR ANTES DE EXECUTAR O RESTORE

#!/bin/bash
cat backup_enderecodb.sql | docker exec -i <container_id> /usr/bin/mysql -u DBA --password=dba.123 enderecodb

cat backup_rhdb.sql | docker exec -i <container_id> /usr/bin/mysql -u DBA --password=dba.123 rhdb