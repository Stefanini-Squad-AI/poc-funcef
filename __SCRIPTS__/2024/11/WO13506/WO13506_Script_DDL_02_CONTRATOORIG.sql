-- OWNER --> CM    

-- Adicionando coluna
alter table CM.CONTRATOORIG add JUSTIFOPCAONAOSEAPLICA VARCHAR2(500);

-- Adicionando descrição da coluna 
COMMENT ON COLUMN CM.CONTRATOORIG.JUSTIFOPCAONAOSEAPLICA IS 'Justificativa da opção "não se aplica" no valor orçado/aprovado';

-- Adicionando nova coluna no log da tabela
alter table LOGPLANUS.LOG_PLANUS_CONTRATOORIG add JUSTIFOPCAONAOSEAPLICA VARCHAR2(500);
