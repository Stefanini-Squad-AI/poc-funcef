-- OWNER --> CM 
-- Add/modify columns 
alter table cm.CONTRATOCONTR add FLGVIGENCIAINDETERMINADA    VARCHAR2(1) default 'N';

-- Add comments to the columns 
comment on column cm.CONTRATOCONTR.FLGVIGENCIAINDETERMINADA
  is 'Vigencia Indeterminada do Contrato (S)im (N)ão';

