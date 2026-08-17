-- Alter table
ALTER TABLE CM.HSTCALCULOPMPFOLHA
   ADD SEQRESGATE   NUMBER;

ALTER TABLE CM.HSTCALCULOPMPFOLHA
   ADD IDBENEFICIO  NUMBER;


-- Add comments to the columns 
comment on column cm.HSTCALCULOPMPFOLHA.SEQRESGATE
  is 'Sequencial de resgate';   

comment on column cm.HSTCALCULOPMPFOLHA.IDBENEFICIO
  is 'Identificador do beneficio';
