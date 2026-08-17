{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 17/10/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlSelEstAval;

interface

uses Classes, Controls, Db, SysUtils, uSistema, uCmDbObject, uCmControlObject, uCtrlCustomRH;

type
  TCtrlSelEstAval = class(TCtrlCustomRH)
  public
    function ListHistorico(ListaIdPessoa: string; CodTipoAval: double; DataInicial,
      DataFinal: TDate): OleVariant;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlSelEstAval }

function TCtrlSelEstAval.ListHistorico(ListaIdPessoa: string; CodTipoAval: double;
  DataInicial, DataFinal: TDate): OleVariant;
var
  sSQL: string;
begin
  sSQL :=
    'SELECT'+CR_LF+
    '  AVALIACAO'+CR_LF+
    'FROM'+CR_LF+
    '  HSTAVAL'+CR_LF+
    'WHERE'+CR_LF+
    '  (CODTIPOAVAL = ' +FloatToStr(CodTipoAval)+ ') AND'+CR_LF;

  if (Pos(',', ListaIdPessoa) > 0) then
    sSQL := sSQL + '  (IDPESSOA   IN (' +ListaIdPessoa+ ')) AND'+CR_LF
  else
    sSQL := sSQL + '  (IDPESSOA    = ' +ListaIdPessoa+ ') AND'+CR_LF;

  sSQL := sSQL +
    '  (DATAREAL BETWEEN TO_DATE(' +QuotedStr(DateToStr(DataInicial))+ ',''DD/MM/YYYY'') AND '+
      'TO_DATE(' +QuotedStr(DateToStr(DataFinal))+ ',''DD/MM/YYYY''))'+CR_LF;

  Result := GetDataPacket(sSQL);
end;

end.
