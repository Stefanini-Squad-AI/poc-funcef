-- ATENCAO -------------------------------------------------------------------------------------
  --Criação de sinonimos para objetos: tables, sequences
  -- nome de TABELA nao exceder 18 caracteres
  -- se preferir, substitua as tags abaixo para gerar o script
  -- #nometabela#      {nome da tabela auditada, owner CM}
  -- #nometabelalog#   {nao precisa ser o mesmo nome da tabela auditada}
------------------------------------------------------------------------------------------------

-- drop public synonym CM
create public synonym CONTRATOEMPTMOMSG for CM.CONTRATOEMPTMOMSG; 
create public synonym SEQCONTRATOEMPTMOMSG for CM.SEQCONTRATOEMPTMOMSG; 

