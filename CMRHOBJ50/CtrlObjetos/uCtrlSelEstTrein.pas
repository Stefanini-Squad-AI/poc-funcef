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

uses Classes, Db, SysUtils, uSistema, uCmDbObject, uCmControlObject, uCtrlCustomRH;

type
  TCtrlSelEstTrein = class(TCtrlCustomRH)
  public
    function ListHistorico(IdPessoa: double; AnoInicial, AnoFinal: word;
      TipoEst: integer): OleVariant;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlSelEstTrein }

function TCtrlSelEstTrein.ListHistorico(IdPessoa: double; AnoInicial, AnoFinal: word;
  TipoEst: integer): OleVariant;
var
  sSql: string;
begin
  sSql :=
    'SELECT'+IFF(TipoEst = 4, ' 2 AS TIPOCALC,', '')+CR_LF+
    '  H.DUR_TOT, H.DATREFIM,'+IFF(TipoEst in [2,3], ' C.CODGRPTREIN, C.IDTIPOCURSO,', '')+CR_LF+
    '  (NVL(H.VALOR,0) + NVL(H.DESP_VIAG,0) + NVL(H.DESP_ESTAD,0) + NVL(H.DESP_OUTR,0)) AS TOT_CUSTO'+CR_LF+
    'FROM'+CR_LF+
    '  HSTTRN H'+IFF(TipoEst in [2,3], ', CURSO C', '')+CR_LF+
    'WHERE'+CR_LF+
    '  (H.IDPESSOA    = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (TO_NUMBER(TO_CHAR(H.DATREFIM,''YYYY'')) BETWEEN ' +IntToStr(AnoInicial)+ ' AND ' +
      IntToStr(AnoFinal)+ ') AND'+CR_LF+
    '  (H.FLGCONTROLE = 1)'+
      IFF(TipoEst in [2,3], ' AND'+CR_LF+'  (H.IDCURSO = C.IDCURSO)', '');

  if (TipoEst = 4) then
    sSql := sSql +
      'UNION SELECT 1 AS TIPOCALC,'+CR_LF+
      '  H.DUR_TOT, H.DATPLFIM AS DATREFIM,'+CR_LF+
      '  (NVL(H.VALOR,0) + NVL(H.DESP_VIAG,0) + NVL(H.DESP_ESTAD,0) + NVL(H.DESP_OUTR,0)) AS TOT_CUSTO'+CR_LF+
      'FROM'+CR_LF+
      '  HSTTRN H'+CR_LF+
      'WHERE'+CR_LF+
      '  (H.IDPESSOA    = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
      '  (TO_NUMBER(TO_CHAR(H.DATPLFIM,''YYYY'')) BETWEEN ' +IntToStr(AnoInicial)+ ' AND ' +
        IntToStr(AnoFinal)+ ') AND'+CR_LF+
      '  (H.FLGCONTROLE = 1)';


  Result := GetDataPacket(sSql);
end;

end.
