-- OWNER --> CM 
-- Add/modify columns 
alter table cm.PARAMEMPTMO add HORAENCERRADEBITO varchar2(5);

-- Add comments to the columns 
comment on column cm.PARAMEMPTMO.HORAENCERRADEBITO
  is 'Horário de encerramento diário para os Débitos';

