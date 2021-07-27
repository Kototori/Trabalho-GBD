# BACKUP FROM DOCKER CONTAINER
# SUBSTITUIR <container_id> PELO ID DO CONTAINER
# SUBSTITUIR <data_e_hora_da_maquina> PELO DATA E HORA DO BACKUP

# NECESSARIO CONCEDER PERMISSAO PARA EXECUTAR OS ARQUIVO COMO PROGRAMA
# DEIXAR SCRIPT E BACKUP NA MESMA PASTA PARA EXECUTAR

#!/bin/bash
docker exec <container_id> /usr/bin/mysqldump -u DBA --password=dba.123 enderecodb > backup_enderecodb_<data_e_hora_da_maquina>.sql

docker exec <container_id> /usr/bin/mysqldump -u DBA --password=dba.123 rhdb > backup_rhdb_<data_e_hora_da_maquina>.sql
