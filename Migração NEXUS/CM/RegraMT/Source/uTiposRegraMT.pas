{==============================================================================}
{  REGRA                                                                       }
{  Unit    - uTiposRegraMT                                                     }
{  Data    - 17/11/00                                                          }
{  Objetivo: Guardar os Tipos e Classes utilizados no componente Regra,        }
{            diminuindo assim o tamanho da unit uRegraMT, uCtrlRegra           }
{------------------------------------------------------------------------------}
{  Alterações:                                                                 }
{                                                                              }
{==============================================================================}
unit uTiposRegraMT;

interface

uses
  SysUtils, DB, uCMClientDataSet, Classes, wwQuery, ADODb,
  uCMTypes,
  Provider;

Type

  { Tipo de dados da Regra }
  TRegraExecutada = Record
    RuleNumber,
    RegraChamada   : String;
    DataSet        : OleVariant;
    iContRegQryIn,
    iAlgorAtual,
    iNumPassoExecutado,
    iTipoPassoExecutado : integer;
    bRetornando    : Boolean;
  End;


  { Tipo de Registro Genérico }
  TRegistro = Record
                Valor1,
                Valor2  :Integer;
              End;

  { Tipo de Cliente, utilizado em pequisas na HISTRUBSAL, pois os clientes que }
  { não são fundação posseum campos de pesquisa diferente.                     }
  TTipoCliente=(tcFundacao, tcOutros);

implementation



end.