#EXECUTAR COMO ANALISTA
DELIMITER $$
CREATE TRIGGER rhdb.trg_exclusao_pf BEFORE
DELETE ON rhdb.pessoa_fisica FOR EACH ROW
BEGIN
	INSERT INTO rhdb.historico_exclusao_pessoa_fisica(id_pessoa_fisica, nome, cpf, telefone, celular, id_endereco, id_situacao_funcional, id_cargo, id_cor_raca, data_exclusao)
	VALUES(OLD.id, OLD.nome, OLD.cpf, OLD.telefone, OLD.celular, OLD.id_endereco, OLD.id_situacao_funcional, OLD.id_cargo, OLD.id_cor_raca, now());
END$$    

DELIMITER ;

DELIMITER $$
CREATE TRIGGER rhdb.trg_exclusao_pj BEFORE
DELETE ON rhdb.pessoa_juridica FOR EACH ROW
BEGIN
	INSERT INTO rhdb.historico_exclusao_pessoa_juridica (id_pessoa_juridica, nome_fantasia, data_fundacao, cnpj, url_site, id_endereco, data_exclusao)
	VALUES(OLD.id, OLD.nome_fantasia, OLD.data_fundacao, OLD.cnpj, OLD.url_site, OLD.id_endereco, now());
END$$    

DELIMITER ;

DELIMITER $$
CREATE TRIGGER rhdb.trg_criptografar_numero BEFORE 
INSERT
ON 
rhdb.pessoa_fisica FOR EACH ROW
begin
	SET new.telefone = aes_encrypt(new.telefone, 'trabalhogdb');	
	SET new.celular = aes_encrypt(new.celular, 'trabalhogdb');	
end$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER rhdb.trg_reajusta_salario AFTER 
UPDATE ON rhdb.salario_base FOR EACH ROW
BEGIN 
	UPDATE 	rhdb.historico_carreira hc 
	   SET	hc.salario_atual = (SELECT new.salario * (SELECT (e.percentual_acrecimo / 100) + 1
														FROM rhdb.escolaridade e
                                                       WHERE e.id = hc.id_escolaridade)
								  FROM rhdb.salario_base sb)
	 WHERE hc.data_fim IS NULL;

END$$
DELIMITER ;
