CREATE TABLE CM.PARAMETLCONEXAO (
    IDPARAMETL         NUMBER        NOT NULL,
    CONEXAO_PLANUS     VARCHAR(100)  NOT NULL,
    CONEXAO_ETL        VARCHAR(100)  NOT NULL,
    FLGPRODUCAO        NUMBER
);

ALTER TABLE CM.PARAMETLCONEXAO ADD CONSTRAINT PK_ETL_CONEXAS
PRIMARY KEY (IDPARAMETL, FLGPRODUCAO);    

ALTER TABLE CM.PARAMETLCONEXAO ADD CONSTRAINT CHK_PARAMETLCNX
CHECK (FLGPRODUCAO IN (0, 1));

-- Add comments to table
comment on table CM.PARAMETLCONEXAO
  is 'De/para do nome de conexões Planus x ETL por processo ETL';


-- Add comments to the columns 

comment on column CM.PARAMETLCONEXAO.IDPARAMETL
  is 'Identificador único do tipo de processo disponível para ETL';

comment on column CM.PARAMETLCONEXAO.CONEXAO_PLANUS
  is 'Nome da conexão no Planus';

comment on column CM.PARAMETLCONEXAO.CONEXAO_ETL
  is 'De/para do nome da conexão usada no ETL';