--CRIAÇÃO DA TABELA.
CREATE TABLE CM.CONTRATO_AREATECNICA (
    IDCONTRATO       Number Not Null,
    CODCENTROCUSTO   Char(10) Not Null,
    IDEMPRESA        Number Not Null,
	TRGDTINCLUSAO    DATE        DEFAULT SYSDATE,
	TRGUSERINCLUSAO  VARCHAR(30) DEFAULT USER
); 

-- CRIAÇÃO DA CHAVE PRIMARIA DA TABELA 
ALTER TABLE CM.CONTRATO_AREATECNICA
  ADD CONSTRAINT XPKCONTRATO_AREATECNICA PRIMARY KEY (IDCONTRATO,CODCENTROCUSTO,IDEMPRESA)
  USING INDEX 
  TABLESPACE INDICES
  PCTFREE 10
  INITRANS 2
  MAXTRANS 255
  STORAGE
  (
    INITIAL 3208K
    MINEXTENTS 1
    MAXEXTENTS UNLIMITED
  ); 

-- Add comments to table
comment on table cm.CONTRATO_AREATECNICA is 'Centro de Custos da Área Técnica';

-- Add comments to the columns 
COMMENT ON COLUMN CM.CONTRATO_AREATECNICA.IDCONTRATO IS 'Código do Contrato que o Centro de Custo da Área Técnica está vinculado' ;
COMMENT ON COLUMN CM.CONTRATO_AREATECNICA.CODCENTROCUSTO IS 'Centro de Custo da Área Técnica' ;
COMMENT ON COLUMN CM.CONTRATO_AREATECNICA.IDEMPRESA IS 'Identificador da Empresa' ;
COMMENT ON COLUMN CM.CONTRATO_AREATECNICA.TRGDTINCLUSAO IS 'Data da inclusão do registro. Evento de auditoria preenchido no momento da última alteração do registro no banco de dados.' ;
COMMENT ON COLUMN CM.CONTRATO_AREATECNICA.TRGUSERINCLUSAO IS 'Usuário responsável pela inclusão do registro. Evento de auditoria preenchido no momento da última alteração do registro no banco de dados.' ;

create public synonym CONTRATO_AREATECNICA for CM.CONTRATO_AREATECNICA;
