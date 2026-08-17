-- Alter table
ALTER TABLE CM.HSTPRAZOACUMULACAOFOLHA
   ADD IDBENEFICIO  NUMBER;
   
-- Add comments to the columns 
comment on column cm.HSTPRAZOACUMULACAOFOLHA.IDBENEFICIO
  is 'Identificador do beneficio';
