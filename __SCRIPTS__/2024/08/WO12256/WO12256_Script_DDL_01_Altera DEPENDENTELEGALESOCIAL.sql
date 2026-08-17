-- OWNER-->CM 
-- Add/modify columns 
alter table cm.DEPENDENTELEGALESOCIAL add FLGATIVO number default 1;

-- Add comments to the columns 
comment on column cm.DEPENDENTELEGALESOCIAL.FLGATIVO
  is 'Dependente Legal ativo(1) ou inativo(0)';

