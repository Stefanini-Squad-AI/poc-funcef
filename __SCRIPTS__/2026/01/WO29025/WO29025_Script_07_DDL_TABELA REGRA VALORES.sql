CREATE GLOBAL TEMPORARY TABLE CM.REGRA_IRRF_REDUCAO 
   (	
    SEQ               NUMBER,
    VALOR_TRIBUTAVEL  NUMBER(17,2), 
    VALOR_TRIBUTINSS  NUMBER(17,2), 
    VALOR_TRIBUTTOTAL NUMBER(17,2),     
    VALOR_FUNCEF      NUMBER,
    VALOR_INSS        NUMBER,
    SOMA_FONTES       NUMBER,
    DEDUCOES          NUMBER,
    DEDUCOES_EQUA     NUMBER,
	VALOR_IMPOSTO     NUMBER, 
	VALOR_REDUCAO     NUMBER,
    VALOR_REDUCAOINSS NUMBER,
    VALOR_REDUCAOTOT  NUMBER,
	TRGUSERINCLUSAO   VARCHAR2(30 CHAR) DEFAULT USER, 
	TRGDTINCLUSAO     DATE DEFAULT SYSDATE 
   ) ON COMMIT DELETE ROWS ;
   
 COMMENT ON COLUMN CM.REGRA_IRRF_REDUCAO.SEQ IS 'Sequencial de inclusao na tabela temporaria.';
 COMMENT ON COLUMN CM.REGRA_IRRF_REDUCAO.VALOR_TRIBUTAVEL IS 'Valor base usado no calculo da redução';
 COMMENT ON COLUMN CM.REGRA_IRRF_REDUCAO.VALOR_TRIBUTINSS IS 'Valor base usado no calculo da redução INSS';
 COMMENT ON COLUMN CM.REGRA_IRRF_REDUCAO.VALOR_TRIBUTTOTAL IS 'Valor base usado no calculo da redução TOTAL';
 COMMENT ON COLUMN CM.REGRA_IRRF_REDUCAO.VALOR_FUNCEF IS 'Valor tributável da FUNCEF';
 COMMENT ON COLUMN CM.REGRA_IRRF_REDUCAO.VALOR_INSS IS 'Valor tributável do INSS';
 COMMENT ON COLUMN CM.REGRA_IRRF_REDUCAO.SOMA_FONTES IS 'Indica se o cálculo do imposto utiliza soma de fontes pagadoras';
 COMMENT ON COLUMN CM.REGRA_IRRF_REDUCAO.DEDUCOES IS 'Valor das deduções legias aplicáveis ao cálculo do imposto de renda'; 
 COMMENT ON COLUMN CM.REGRA_IRRF_REDUCAO.DEDUCOES_EQUA IS 'Valor das deduções referente ao equacionamento';  
 COMMENT ON COLUMN CM.REGRA_IRRF_REDUCAO.VALOR_REDUCAO IS 'Valor de redução aplicpara cálculo do imposto de renda';
 COMMENT ON COLUMN CM.REGRA_IRRF_REDUCAO.VALOR_REDUCAOINSS IS 'Valor de redução para cálculo do imposto de renda'; 
 COMMENT ON COLUMN CM.REGRA_IRRF_REDUCAO.VALOR_REDUCAOTOT IS 'Valor de redução para cálculo do imposto de renda com soma de fontes'; 
 COMMENT ON COLUMN CM.REGRA_IRRF_REDUCAO.VALOR_IMPOSTO IS 'Valor do imposto de renda';
 COMMENT ON COLUMN CM.REGRA_IRRF_REDUCAO.TRGUSERINCLUSAO IS 'Usuário responsável pelo cadastro do registro. Evento de auditoria preenchido no momento da inclusão do registro no banco de dados.';
 COMMENT ON COLUMN CM.REGRA_IRRF_REDUCAO.TRGDTINCLUSAO IS 'Data do cadastro do registro. Evento de auditoria preenchido no momento da inclusão do registro no banco de dados.';
   