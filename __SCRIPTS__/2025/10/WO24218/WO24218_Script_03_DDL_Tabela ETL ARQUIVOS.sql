CREATE TABLE CM.PARAM_ETL_ARQUIVO (
    IDPARAMETLARQ    NUMBER   not null,
    IDPARAMETL       NUMBER   not null,
    ORDEM            NUMBER   not null,
    FLGUSAPREFIXO    NUMBER   not null,
    NOMEETLARQUIVO   VARCHAR(60)   not null,
    TRGDTINCLUSAO    DATE          DEFAULT SYSDATE,      
    TRGUSERINCLUSAO  VARCHAR(60)   DEFAULT USER,
    TRGDTALTERACAO   DATE,
    TRGUSERALTERACAO VARCHAR(60)
  ); 


ALTER TABLE CM.PARAM_ETL_ARQUIVO ADD CONSTRAINT PK_PARAM_ETL_ARQUIVO
PRIMARY KEY (IDPARAMETLARQ);

-- CRIAÇÃO DA CHAVE ESTRANGEIRA DA TABELA 
ALTER TABLE CM.PARAM_ETL_ARQUIVO ADD CONSTRAINT FK_PARAMETLPLANUS
  FOREIGN KEY (IDPARAMETL) REFERENCES CM.PARAMETLPLANUS(IDPARAMETL);

-- Add comments to table
comment on table CM.PARAM_ETL_ARQUIVO
  is 'Relação de arquivos gerados por processo para uso interno no ETL';


-- Add comments to the columns 
comment on column CM.PARAM_ETL_ARQUIVO.IDPARAMETLARQ
  is 'Identificador único do arquivo de parametro para ETL';

comment on column CM.PARAM_ETL_ARQUIVO.IDPARAMETL
  is 'Identificador único do tipo de processo disponível para ETL';

comment on column CM.PARAM_ETL_ARQUIVO.ORDEM
  is 'Ordem de criação do arquivo de parametro para ETL por tipo de processo';

comment on column CM.PARAM_ETL_ARQUIVO.FLGUSAPREFIXO
  is 'Flag que indica se o nome do arquivo deve incluir o Identificação de Execução do ETL (IDExecucao)';

comment on column CM.PARAM_ETL_ARQUIVO.NOMEETLARQUIVO
  is 'Nome do arquivo com extensão';
