CREATE TABLE CM.PARAM_ETL_ARQUIVODET (
    IDPARAMETLARQ    NUMBER         NOT NULL,
    IDPARAMETL       NUMBER         NOT NULL,
    IDSEQSESSAO      NUMBER         NOT NULL,
    ORDEM            NUMBER         NOT NULL,
    NOMESESSAO       VARCHAR(200),
    BLOCO            VARCHAR(4000)  NOT NULL,    
    TRGDTINCLUSAO    DATE           DEFAULT SYSDATE,      
    TRGUSERINCLUSAO  VARCHAR(60)    DEFAULT USER,
    TRGDTALTERACAO   DATE,
    TRGUSERALTERACAO VARCHAR(60)
);


ALTER TABLE CM.PARAM_ETL_ARQUIVODET ADD CONSTRAINT PK_PARAMETL_ARQDET
PRIMARY KEY (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO);


-- CRIAÇÃO DA CHAVE ESTRANGEIRA DA TABELA 
ALTER TABLE CM.PARAM_ETL_ARQUIVODET ADD CONSTRAINT FK_PARAMETLARQ
  FOREIGN KEY (IDPARAMETLARQ) REFERENCES CM.PARAM_ETL_ARQUIVO(IDPARAMETLARQ);

ALTER TABLE CM.PARAM_ETL_ARQUIVODET ADD CONSTRAINT FK_ETLARQPARAM
  FOREIGN KEY (IDPARAMETL) REFERENCES CM.PARAMETLPLANUS(IDPARAMETL);


-- Add comments to table
comment on table CM.PARAM_ETL_ARQUIVODET
  is 'Detalhamento dos arquivos gerados para uso interno no ETL';


-- Add comments to the columns 
comment on column CM.PARAM_ETL_ARQUIVODET.IDPARAMETLARQ
  is 'Identificador único do arquivo de parametro para ETL';

comment on column CM.PARAM_ETL_ARQUIVODET.IDPARAMETL
  is 'Identificador único do tipo de processo disponível para ETL';

comment on column CM.PARAM_ETL_ARQUIVODET.IDSEQSESSAO
  is 'Identificador único da sessão ou conteúdo do arquivo';

comment on column CM.PARAM_ETL_ARQUIVODET.ORDEM
  is 'Ordem de criação do conteúdo do arquivo';

comment on column CM.PARAM_ETL_ARQUIVODET.NOMESESSAO
  is 'Nome da sessão do arquivo, se houver';

comment on column CM.PARAM_ETL_ARQUIVODET.BLOCO
  is 'Conteúdo que será inserido no arquivo logo abaixo da sessão, se houver';
