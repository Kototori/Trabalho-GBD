CREATE VIEW rhdb.vw_pessoa_fisica_contato AS
SELECT pf.nome AS Nome,
    CAST(
        AES_DECRYPT(pf.celular, 'trabalhogdb') AS CHAR(50)
    ) AS Celular,
    CAST(
        AES_DECRYPT(pf.telefone, 'trabalhogdb') AS CHAR(50)
    ) AS Telefone
FROM rhdb.pessoa_fisica pf;