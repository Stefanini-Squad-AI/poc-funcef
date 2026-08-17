   
create sequence CM.SEQETL_FOLHA_PREVIA
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;
   

create sequence CM.SEQPARAM_ETL_ARQUIVO
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;


create sequence CM.SEQPARAM_ETL_ARQDET
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;


create sequence CM.SEQDEPARAEXTERNO
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;


-- SEQUENCE DA CHAVE PRIMARIA DA TABELA DE LOG.  
create sequence LOGPLANUS.SEQLOGPLANUS_PARAM_ETL_ARQUIVO
minvalue 1                                       
maxvalue 999999999999999999999999999             
start with 1                                     
increment by 1                                   
nocache;                                         


-- SEQUENCE DA CHAVE PRIMARIA DA TABELA DE LOG.  
create sequence LOGPLANUS.SEQLOGPLANUS_PARAM_ETL_ARQUIVODET
minvalue 1                                       
maxvalue 999999999999999999999999999             
start with 1                                     
increment by 1                                   
nocache;                                         


-- SEQUENCE DA CHAVE PRIMARIA DA TABELA DE LOG.  
create sequence LOGPLANUS.SEQLOGPLANUS_DEPARAEXTERNO
minvalue 1                                       
maxvalue 999999999999999999999999999             
start with 1                                     
increment by 1                                   
nocache;                                         


