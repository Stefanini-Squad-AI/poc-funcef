CREATE TABLE CM.IRRF_REDUCAO
  ADD (
   FAIXA_TRIBUTAVEL   NUMBER(17,2) not null,
   REDUCAO            NUMBER(17,2) not null,
   FATOR              NUMBER(17,6) not null,
   DATAINIVIGENCIA    DATE         not null
  )
TABLESPACE DADOS;

-- INDICE  
CREATE INDEX XAK1IRREDUCAO ON CM.IRRF_REDUCAO (DATAINIVIGENCIA, FAIXA_TRIBUTAVEL) tablespace INDICES;

-- CRIAÇÃO DA CHAVE PRIMARIA DA TABELA 
alter table CM.IRRF_REDUCAO
  add constraint XPKIRREDUCAO primary key (FAIXA_TRIBUTAVEL, DATAINIVIGENCIA);

  
-- Add comments to the columns 
comment on column cm.irrf_reducao.FAIXA_TRIBUTAVEL
  is 'Limite do valor tributável da faixa de redução a ser aplicada no IR apurado';

comment on column cm.irrf_reducao.REDUCAO
  is 'Redução a ser aplicada no IR apurado';

comment on column cm.irrf_reducao.fator
  is 'Fator para cálculo da Redução a ser aplicada no IR apurado';

comment on column cm.irrf_reducao.datainivigencia
  is 'Data de início da vigência da faixa de redução';