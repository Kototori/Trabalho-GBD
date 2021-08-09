CREATE VIEW rhdb.vw_pessoa_fisica_contato as 
select pf.nome as Nome,
AES_DECRYPT(pf.celular, 'trabalhogdb') as Celular,
AES_DECRYPT(pf.telefone, 'trabalhogdb') as Telefone
from rhdb.pessoa_fisica pf 
