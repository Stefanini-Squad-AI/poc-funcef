-- ATENCAO -------------------------------------------------------------------------------------
  -- nome de TABELA nao exceder 18 caracteres
  -- nome de CAMPOS nao exceder 23 caracteres
  -- primeiro campo será PK da tabela de log, em seguida replicar estrutura da tabela auditada
  -- se preferir, substitua as tags abaixo para gerar o script
  -- #nometabela#   {nao precisa ser o mesmo nome da tabela auditada}
  -- #camposchaveauditada#  {campo(s) que compoe a chave da tabela auditada}
------------------------------------------------------------------------------------------------

-- CRIAÇÃO DE UM CAMPO NOVO DA MOVDIVIDA 
alter table CM.MOVDIVIDA
  add PARCELA varchar2(4000) NULL;
 
-- Add comments to the columns 
comment on column cm.MOVDIVIDA.PARCELA
  is 'Registrar as alterações na HSTDIVIDABENEFICIO.';
