-- ATENCAO -------------------------------------------------------------------------------------
  -- nome de TABELA nao exceder 18 caracteres
  -- nome de CAMPOS nao exceder 23 caracteres
  -- primeiro campo será PK da tabela de log, em seguida replicar estrutura da tabela auditada
  -- se preferir, substitua as tags abaixo para gerar o script
  -- #nometabela#   {nao precisa ser o mesmo nome da tabela auditada}
  -- #camposchaveauditada#  {campo(s) que compoe a chave da tabela auditada}
------------------------------------------------------------------------------------------------

-- CRIAÇÃO DE CAMPO NOVO CONTRATOCONTR
ALTER TABLE CM.CONTRATOCONTR
   ADD FLGFASE_ENCERRAMENTO  VARCHAR2(1) DEFAULT 'N';
  
ALTER TABLE CM.CONTRATOCONTR
   ADD RESPFASE_ENCERRAMENTO VARCHAR2(60) NULL;
  
-- ADD COMMENTS TO THE COLUMNS
COMMENT ON COLUMN CM.CONTRATOCONTR.FLGFASE_ENCERRAMENTO
  IS 'Indica se contrato esta em fase de Encerramento';  
 
COMMENT ON COLUMN CM.CONTRATOCONTR.RESPFASE_ENCERRAMENTO
  IS 'Responsavel pela Alteracao do campo FLGFASE_ENCERRAMENTO'; 

