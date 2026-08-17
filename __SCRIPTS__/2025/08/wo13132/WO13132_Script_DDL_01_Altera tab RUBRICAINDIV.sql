-- OWNER --> CM 
-- Add/modify columns 
alter table cm.RUBRICAINDIV add IDSEQDETCONCINSS varchar2(50);

-- Add comments to the columns 
comment on column cm.RUBRICAINDIV.IDSEQDETCONCINSS
  is 'Identificador unico na tabela DETCONCINSS';
