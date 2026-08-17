alter table cm.percfaixa add PERCPARTAT13 number;
alter table cm.percfaixa add PERCPATROAT13 number;
alter table cm.percfaixa add PERCPARTAS13 number;
alter table cm.percfaixa add PERCPATROAS13 number;

COMMENT ON COLUMN CM.PERCFAIXA.PERCPARTAT13 IS 'Percentual do participante ativo sobre abono';
COMMENT ON COLUMN CM.PERCFAIXA.PERCPATROAT13 IS 'Percentual da patrocinadora ativo sobre abono';
COMMENT ON COLUMN CM.PERCFAIXA.PERCPARTAS13 IS 'Percentual do participante assistido sobre abono';
COMMENT ON COLUMN CM.PERCFAIXA.PERCPATROAS13 IS 'Percentual da patrocinadora assistido sobre abono';