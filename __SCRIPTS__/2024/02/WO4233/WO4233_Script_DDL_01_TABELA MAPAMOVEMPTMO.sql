-- OWNER --> CM 
-- Add/modify columns 
alter table cm.MAPAMOVEMPTMO add DTPERIODOINICIAL DATE;
alter table cm.MAPAMOVEMPTMO add DTPERIODOFINAL DATE;

-- Add comments to the columns 
COMMENT ON COLUMN CM.DOCUMENTOXCODBARRAS.FLGIMPORTADO IS 'Data inicial do periodo do relatório.';
COMMENT ON COLUMN CM.DOCUMENTOXCODBARRAS.FLGIMPORTADO IS 'Data final do periodo do relatório.';

