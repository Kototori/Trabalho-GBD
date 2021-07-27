# RESTORE BACKUP INTO DOCKER CONTAINER
# SUBSTITUIR <nome_backup> PELO NOME DO BACKUP
# SUBSTITUIR <container_id> PELO ID DO CONTAINER

# NECESSARIO CONCEDER PERMISSAO PARA EXECUTAR OS ARQUIVO COMO PROGRAMA
# DEIXAR SCRIPT E BACKUP NA MESMA PASTA PARA EXECUTAR
# CRIAR O BANCO DE DESTINO NO SERVIDOR ANTES DE EXECUTAR O RESTORE

#!/bin/bash
cat <nome_backup>.sql | docker exec -i <container_id> /usr/bin/mysql -u DBA --password=dba.123 enderecodb

cat <nome_backup>.sql | docker exec -i <container_id> /usr/bin/mysql -u DBA --password=dba.123 rhdb