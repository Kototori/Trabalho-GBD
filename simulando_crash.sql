#RODAR COM USUARIO ANALISTA1
INSERT INTO rhdb.historico_carreira (
        id_pessoa_fisica,
        data_inicio,
        data_fim,
        salario_atual,
        id_escolaridade
    )
SELECT pf.id,
    (
        SELECT DATE(NOW())
    ),
    NULL,
    (
        SELECT sb.salario * (
                SELECT (e.percentual_acrecimo / 100) + 1
                FROM rhdb.escolaridade e
                WHERE e.id = 5
            )
        FROM rhdb.salario_base sb
    ),
    5
FROM rhdb.pessoa_fisica pf;