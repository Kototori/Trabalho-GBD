# BACKUP FROM DOCKER CONTAINER
# SUBSTITUIR <container_id> PELO ID DO CONTAINER

# NECESSARIO CONCEDER PERMISSAO PARA EXECUTAR OS ARQUIVO COMO PROGRAMA
# DEIXAR SCRIPT E BACKUP NA MESMA PASTA PARA EXECUTAR

#!/bin/bash
docker exec <container_id> /usr/bin/mysqldump -u DBA --password=dba.123 enderecodb > backup_enderecodb.sql

docker exec <container_id> /usr/bin/mysqldump -u DBA --password=dba.123 rhdb > backup_rhdb.sql
