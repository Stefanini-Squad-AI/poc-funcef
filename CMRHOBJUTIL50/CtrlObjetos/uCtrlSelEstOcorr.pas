{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 17/10/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlSelEstOcorr;

interface

uses Classes, Db, SysUtils, uCmDbObject, IvDictio,  uCmControlObject,
  uCtrlCustomRH;

type
  TCtrlSelEstOcorr = class(TCtrlCustomRH)
  public
    function ListHistorico(ListaIdPessoa, ListaCodOcorr: string;
      AnoInicial, AnoFinal: integer): OleVariant;
  end;

implementation

uses uCtrlFuncoesRH, uCMTypes;

{ TCtrlSelEstOcorr }

function TCtrlSelEstOcorr.ListHistorico(ListaIdPessoa, ListaCodOcorr: string;
  AnoInicial, AnoFinal: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL :=
    'SELECT'+CR_LF+
    '  AUX.CODTIPOOCMED,'+CR_LF+
    '  SUBSTR(AUX.MES,5,2) AS MES,'+CR_LF+
    '  SUBSTR(AUX.MES,1,4) AS ANO,'+CR_LF+
    '  COUNT(*) AS NUM'+CR_LF+
    'FROM'+CR_LF+
    '  (SELECT'+CR_LF+
    '     CODTIPOOCMED, TO_CHAR(DATAREAL,''YYYYMM'') AS MES'+CR_LF+
    '   FROM'+CR_LF+
    '     HSTASMED'+CR_LF+
    '   WHERE'+CR_LF;

  if (Pos(',', ListaIdPessoa) > 0) then
    sSQL := sSQL + '     (IDPESSOA     IN (' +ListaIdPessoa+ ')) AND'+CR_LF
  else
    sSQL := sSQL + '     (IDPESSOA      = ' +ListaIdPessoa+ ') AND'+CR_LF;

  if (Pos(',', ListaCodOcorr) > 0) then
    sSQL := sSQL + '     (CODTIPOOCMED IN (' +ListaCodOcorr+ ')) AND'+CR_LF
  else
    sSQL := sSQL + '     (CODTIPOOCMED  = ' +ListaCodOcorr+ ') AND'+CR_LF;

  sSQL := sSQL +
    '     (DATAREAL IS NOT NULL) AND'+CR_LF+
    '     (TO_NUMBER(TO_CHAR(DATAREAL,''YYYY'')) >= ' +IntToStr(AnoInicial)+ ') AND'+CR_LF+
    '     (TO_NUMBER(TO_CHAR(DATAREAL,''YYYY'')) <= ' +IntToStr(AnoInicial)+ ')) AUX'+CR_LF+
    'GROUP BY'+CR_LF+
    '  MES, CODTIPOOCMED';

  Result := GetDataPacket(sSQL);
end;

end.
