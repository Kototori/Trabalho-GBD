SELECT DISTINCT pf.nome,
    c.cargo,
    se.setor_empresa,
    e.escolaridade,
    CONCAT(ed.logradouro, ' ', ed.numero, ' ', ed.complemento ,', ', b.nome,' ', cid.nome,'/',uf.sigla, ' - ', b.cep) AS endereco
FROM rhdb.pessoa_fisica pf
    INNER JOIN rhdb.cargo c ON pf.id_cargo = c.id
    INNER JOIN rhdb.situacao_funcional sf ON pf.id_situacao_funcional = sf.id AND sf.id = 1
    INNER JOIN rhdb.historico_carreira hc ON pf.id = hc.id_pessoa_fisica AND hc.data_fim IS NULL
    INNER JOIN rhdb.escolaridade e ON hc.id_escolaridade = e.id
    INNER JOIN rhdb.setor_empresa_pessoas sep ON pf.id = sep.id_pessoa_fisica
    INNER JOIN rhdb.setor_empresa se ON sep.id_setor_empresa = se.id
    INNER JOIN enderecodb.endereco ed ON se.id_endereco = ed.id
    INNER JOIN enderecodb.bairro b ON ed.bairro_id = b.id
    INNER JOIN enderecodb.cidade cid ON b.cidade_id = cid.id
    INNER JOIN enderecodb.unidade_federativa uf ON cid.uf_id = uf.id;


SELECT se.setor_empresa,
    SUM(hc.salario_atual)
FROM rhdb.setor_empresa se
    INNER JOIN rhdb.setor_empresa_pessoas sep ON se.id = sep.id_setor_empresa
    INNER JOIN rhdb.historico_carreira hc ON sep.id_pessoa_fisica = hc.id_pessoa_fisica AND hc.data_fim IS NULL
GROUP BY se.setor_empresa;