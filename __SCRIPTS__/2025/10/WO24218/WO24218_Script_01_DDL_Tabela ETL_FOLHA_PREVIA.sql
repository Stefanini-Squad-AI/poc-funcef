CREATE TABLE CM.ETL_FOLHA_PREVIA (  
      ID               NUMBER        NOT NULL,
      IDPREVIABENEF    NUMBER        NOT NULL,      
      IDEXECUCAO       VARCHAR(60)   NOT NULL,
      MESCOBRANCA      VARCHAR(7)    NOT NULL,
      ANOMESCOBRANCA   VARCHAR(4)    NOT NULL,
      DATAPAGTO        DATE          NOT NULL, 
      IDLOTE_LISTA     VARCHAR(4000) NOT NULL,  
      DTPAGTO_D1       VARCHAR(10)   NOT NULL,
      DTPAGTO_D2       VARCHAR(10)   NOT NULL,
      DTPAGTO_D3       VARCHAR(10)   NOT NULL,  
      IDUSUARIO        NUMBER,
      DATA_INICIO      DATE          DEFAULT SYSDATE,
      DATA_FIM         DATE,
      ETAPA            NUMBER,
      TRGDTINCLUSAO    DATE          DEFAULT SYSDATE,      
      TRGUSERINCLUSAO  VARCHAR(60)   DEFAULT USER,
      TRGDTALTERACAO   DATE,
      TRGUSERALTERACAO VARCHAR(60)
     );
    	 	 
ALTER TABLE CM.ETL_FOLHA_PREVIA ADD CONSTRAINT PK_ETL_FOLHA_PREVIA
PRIMARY KEY (ID);     

-- CRIAÇÃO DA CHAVE ESTRANGEIRA DA TABELA 
ALTER TABLE CM.ETL_FOLHA_PREVIA ADD CONSTRAINT FK_ETLFBXPREVIABENEF
  FOREIGN KEY (IDPREVIABENEF) REFERENCES CM.PREVIABENEF(IDPREVIABENEF);


-- Add comments to table
comment on table cm.ETL_FOLHA_PREVIA 
  is 'Controle de execução ETL da Prévia da Folha de Benefícios';


-- Add comments to the columns 
comment on column cm.ETL_FOLHA_PREVIA.ID
  is 'Identificador único do processo de execução do ETL da prévia da Folha de Benefícios';

comment on column cm.ETL_FOLHA_PREVIA.IDPREVIABENEF 
  is 'Código interno de identificação única do processamento da prévia da Folha de Benefícios';
     
comment on column cm.ETL_FOLHA_PREVIA.IDEXECUCAO    
  is 'Código interno dos arquivos ETL que identifica a execução atual, formado pelo ID + MESCOBRANCA + DATA E HORA DO INICIO DO PROCESSO';

comment on column cm.ETL_FOLHA_PREVIA.MESCOBRANCA   
  is 'Mês Cobrança de processamento da prévia da Folha de Benefícios';
      
comment on column cm.ETL_FOLHA_PREVIA.ANOMESCOBRANCA
  is 'Ano do Mês Cobrança de processamento da prévia da Folha de Benefícios';
      
comment on column cm.ETL_FOLHA_PREVIA.DATAPAGTO
  is 'Data de Pagamento informada no processamento da prévia da Folha de Benefícios';
      
comment on column cm.ETL_FOLHA_PREVIA.IDLOTE_LISTA
  is 'Lista de lotes que serão processados pela prévia da Folha de Benefícios';
           
comment on column cm.ETL_FOLHA_PREVIA.DTPAGTO_D1
  is 'Floating D+0 da data de pagamento informada no processamento da prévia da Folha de Benefícios';
             
comment on column cm.ETL_FOLHA_PREVIA.DTPAGTO_D2
  is 'Floating D-1 da data de pagamento informada no processamento da prévia da Folha de Benefícios';
        
comment on column cm.ETL_FOLHA_PREVIA.DTPAGTO_D3
  is 'Floating D-2 da data de pagamento informada no processamento da prévia da Folha de Benefícios';

comment on column cm.ETL_FOLHA_PREVIA.DATA_INICIO
  is 'Data e hora de início do processo';

comment on column cm.ETL_FOLHA_PREVIA.DATA_FIM
  is 'Data e hora de término do processo';

comment on column cm.ETL_FOLHA_PREVIA.ETAPA
  is 'ID da Etapa em que a rotina ETL está sendo executada';    

comment on column cm.ETL_FOLHA_PREVIA.IDUSUARIO     
  is 'Identificador do usuário que está processando a Prévia via ETL';
            

