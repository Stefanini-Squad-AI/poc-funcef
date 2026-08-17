{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
CONST
  CMsgDeleteEmpty = 'SQL de Delete não informado';
  CMsgInsertEmpty = 'SQL de Insert não informado';
  CMsgUpdateEmpty = 'SQL de Update não informado';
  CMsgUserEmpty = 'Usuário não informado';
  CMsgPasswordEmpty = 'Senha não informada';
  CMsgDbnNotFound = 'DataBaseName não informado';
  CMsgErrorDelete = 'Erro ao executar o metodo Delete';
  CMsgErrorInsert = 'Erro ao executar o metodo Insert';
  CMsgErrorUpdate = 'Erro ao executar o metodo Update';
  CMsgErrorConnectDB = 'Erro ao conecatar com o DataBase';
  CMsgErrorRowsAffectedDelete = 'O Delete não afetou nenhum registro. Verifique a cláusula where';
  CMsgErrorRowsAffectedUpdate = 'O Update não afetou nenhum registro. Verifique a cláusula where';
  CMsgFieldNameNotFound = 'Nome de coluna não encontrado no ResultSet';
  CMsgFieldIndexNotFound = 'Indíce de coluna inválido';
