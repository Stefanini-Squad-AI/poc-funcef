-- Alter table
ALTER TABLE CM.PRAZOACUMULACAO  
   ADD  IDBENEFICIO  NUMBER;

-- Add comments to the columns 
comment on column CM.PRAZOACUMULACAO.IDBENEFICIO
  is 'Identificador do beneficio';

