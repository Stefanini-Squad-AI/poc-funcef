{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 17/10/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlSelEstTrein;

interface

uses Classes, Db, SysUtils, uCmDbObject, uCmControlObject, IvDictio, 
  uCtrlCustomRH;

type
  TCtrlSelEstTrein = class(TCtrlCustomRH)
  public
    function ListHistorico(IdPessoa: double; AnoInicial, AnoFinal: word;
      ComCurso: boolean): OleVariant;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlSelEstTrein }

function TCtrlSelEstTrein.ListHistorico(IdPessoa: double; AnoInicial, AnoFinal: word;
  ComCurso: boolean): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  H.DUR_TOT, H.DATREFIM,'+IFF(ComCurso, ' C.CODGRPTREIN,', '')+CR_LF+
    '  (NVL(H.VALOR,0) + NVL(H.DESP_VIAG,0) + NVL(H.DESP_ESTAD,0) + NVL(H.DESP_OUTR,0)) AS TOT_CUSTO'+CR_LF+
    'FROM'+CR_LF+
    '  HSTTRN H'+IFF(ComCurso, ', CURSO C', '')+CR_LF+
    'WHERE'+CR_LF+
    '  (H.IDPESSOA    = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (H.FLGCONTROLE = 1) AND'+CR_LF+
    '  (TO_NUMBER(TO_CHAR(H.DATREFIM,''YYYY'')) >= ' +IntToStr(AnoInicial)+ ') AND'+CR_LF+
    '  (TO_NUMBER(TO_CHAR(H.DATREFIM,''YYYY'')) <= ' +IntToStr(AnoFinal)+ ')'+
    IFF(ComCurso, ' AND' +CR_LF+ '  (H.IDCURSO     = C.IDCURSO)', ''));
end;

end.
