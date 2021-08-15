DELIMITER $$
CREATE PROCEDURE `rhdb`.`pcr_historico_carreira`(cpf varchar(11), data_solicitacao datetime, id_escolaridade int)
BEGIN
	DECLARE id_pessoa_fisica int;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
	
	IF data_solicitacao IS NULL THEN
		SET data_solicitacao = (SELECT DATE(NOW()));
	END IF;

	SET id_pessoa_fisica = (SELECT pf.id FROM rhdb.pessoa_fisica pf WHERE pf.cpf = cpf);
	
	UPDATE 	rhdb.historico_carreira hc SET hc.data_fim = data_solicitacao
	 WHERE hc.id_pessoa_fisica = id_pessoa_fisica;
								
	INSERT INTO 
	rhdb.historico_carreira (
		id_pessoa_fisica, 
		data_inicio, 
		data_fim, 
		salario_atual, 
		id_escolaridade)
	VALUES ( 
		id_pessoa_fisica, 
		data_solicitacao, 
		NULL,
		(select sb.salario * (select (e.percentual_acrecimo/100) + 1 from rhdb.escolaridade e where e.id = id_escolaridade) from rhdb.salario_base sb), 
		id_escolaridade);
    
END $$