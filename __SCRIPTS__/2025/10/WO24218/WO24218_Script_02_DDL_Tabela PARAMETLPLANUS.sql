-- conexao parametrizavel  (conexoes default)
ALTER TABLE CM.PARAMETLPLANUS
  ADD  CONEXAO_PROD   VARCHAR(60);

ALTER TABLE CM.PARAMETLPLANUS
  ADD  CONEXAO_DEV    VARCHAR(60);



-- Add comments to table
comment on table CM.PARAMETLPLANUS
  is 'Parametros para processamentos via ETL';


-- Add comments to the columns 
comment on column CM.PARAMETLPLANUS.CONEXAO_PROD
  is 'Parametro de conexao com banco para processamento em PRODUCAO';

comment on column CM.PARAMETLPLANUS.CONEXAO_DEV
  is 'Parametro de conexao com banco para processamento em ambiente de teste';

