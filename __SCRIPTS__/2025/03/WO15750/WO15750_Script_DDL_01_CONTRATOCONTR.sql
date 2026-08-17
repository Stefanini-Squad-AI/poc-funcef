-- OWNER --> CM   

-- Adicionando coluna
alter table CM.CONTRATOCONTR add FLGSALDOTRANSFERIDO CHAR(1) DEFAULT 'N';  
COMMENT ON COLUMN CM.CONTRATOCONTR.FLGSALDOTRANSFERIDO IS 'Indica se o saldo do contrato foi transferido ou não para um novo aditamento';

-- Adicionando coluna 
alter table CM.ADITAMENTO add FLGSALDOTRANSFERIDO CHAR(1) DEFAULT 'N'; 
COMMENT ON COLUMN CM.ADITAMENTO.FLGSALDOTRANSFERIDO IS 'Indica se o saldo do contrato foi transferido ou não para um novo aditamento';
alter table CM.ADITAMENTO add FLGREINICIODASPARCELAS CHAR(1) DEFAULT 'S'; 
COMMENT ON COLUMN CM.ADITAMENTO.FLGREINICIODASPARCELAS IS 'Indica se o aditamento teve reinicio ou não das parcelas'; 

alter table CM.ADITAMENTO add ORIGEMVALORTRANSF CHAR(1); 
COMMENT ON COLUMN CM.ADITAMENTO.ORIGEMVALORTRANSF IS 'Indica a origem do valor transferido - (C)ontrato ou (A)ditamento'; 
alter table CM.ADITAMENTO add IDDOCCEDEUSALDO NUMBER; 
COMMENT ON COLUMN CM.ADITAMENTO.IDDOCCEDEUSALDO IS 'Id do contrato ou aditamento que cedeu o saldo para virar valor do aditamento corrente';  


