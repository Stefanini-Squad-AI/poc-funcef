-- OWNER --> CM 
-- Add/modify columns 
alter table cm.DOCUMENTO add NUMPROCESSO varchar2(50);
alter table cm.DOCUMENTO add PARTEFUNCEF VARCHAR2(1);
alter table cm.DOCUMENTO add PARTECONTRARIA VARCHAR2(100);

-- Add comments to the columns 
comment on column cm.DOCUMENTO.NUMPROCESSO
  is 'Numero do processo Judicial';
comment on column cm.DOCUMENTO.PARTEFUNCEF
  is 'Funcef faz parte do processo (S)im ou (N)ão';
comment on column cm.DOCUMENTO.PARTECONTRARIA
  is 'Parte contraria do processo';

