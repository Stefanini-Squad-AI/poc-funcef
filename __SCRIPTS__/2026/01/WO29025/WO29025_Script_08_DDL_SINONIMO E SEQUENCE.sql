-- SEQUENCE DA CHAVE PRIMARIA DA TABELA DE LOG.  
create sequence LOGPLANUS.SEQLOGPLANUS_IRRF_REDUCAO
minvalue 1                                       
maxvalue 999999999999999999999999999             
start with 1                                     
increment by 1                                   
nocache;                                         

CREATE PUBLIC SYNONYM IRRF_REDUCAO FOR CM.IRRF_REDUCAO;

CREATE PUBLIC SYNONYM SEQLOGPLANUS_IRRF_REDUCAO  FOR LOGPLANUS.SEQLOGPLANUS_IRRF_REDUCAO;

