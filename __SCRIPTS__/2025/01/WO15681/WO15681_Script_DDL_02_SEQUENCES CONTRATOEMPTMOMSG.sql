-- ATENCAO -------------------------------------------------------------------------------------
  --Criação de sequences para tabelas dos owners CM e LOGPLANUS 
  -- nome de TABELA nao exceder 18 caracteres
  -- se preferir, substitua as tags abaixo para gerar o script
  -- #nometabela#      {nome da tabela auditada, owner CM}
  -- #nometabelalog#   {nao precisa ser o mesmo nome da tabela auditada}
------------------------------------------------------------------------------------------------

-- SEQUENCE DA CHAVE PRIMARIA DA TABELA CM
-- drop sequence CM.SEQ#nometabela#;
create sequence CM.SEQCONTRATOEMPTMOMSG
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;





 
