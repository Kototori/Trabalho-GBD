SELECT pf.nome, 
	CONCAT(ed.logradouro, ' ', ed.numero, ' ', ed.complemento ,', ', b.nome,' ', cid.nome,'/',uf.sigla, ' - ', b.cep) AS endereco
FROM rhdb.pessoa_fisica pf
	INNER JOIN enderecodb.endereco ed ON pf.id_endereco = ed.id
	INNER JOIN enderecodb.bairro b ON ed.bairro_id = b.id
	INNER JOIN enderecodb.cidade cid ON b.cidade_id = cid.id
	INNER JOIN enderecodb.unidade_federativa uf ON cid.uf_id = uf.id
WHERE pf.id_situacao_funcional = 3;

SELECT * FROM rhdb.vw_pessoa_fisica_contato vpfc;