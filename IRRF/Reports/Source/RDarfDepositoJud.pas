unit RDarfDepositoJud;

// Alterações:
{---------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Pendencia :
Descrição :
----------------------------------------------------------------------------------------------------
Rotina    : CrmRptCMBeforePrint(...)
Data      : 03/08/2007
Autor     : André Pontes
Pendencia : 25375
Descrição : Alterada query para pegar novo campo CLASSEACAO da ProcJud, se esse estiver cadastrado
----------------------------------------------------------------------------------------------------
Rotina    : CrmRptCMBeforePrint
Data      : 10/07/2007
Autor     : Bruno Bastos
Pendencia : 20091
Descrição : Alteração no join da LancIRRF com a ProcJud.
----------------------------------------------------------------------------------------------------
Rotina    : CrmRptCMBeforePrint(...)
Data      : 02/05/2007
Autor     : André Pontes
Pendencia : 17104
Descrição : Alterada a query para permitir impressão de DARFs mesmo que a conta corrente não esteja
            cadastrada na procjud
----------------------------------------------------------------------------------------------------
Autor     : Paulo Ramos
Rotina    : Objeto rpDarf
Pendência : 23773
Data      : 22/11/2006
Descrição : Alteração no layout para incluir campo 14 - Num referencia (sem dados)
----------------------------------------------------------------------------------------------------
Autor     : Bruno Bastos
Rotina    : Várias
Pendência : 19450
Data      : 22/06/2005
Descrição : Criação de uma rotina para colocar a máscara na conta e na agência.
---------------------------------------------------------------------------------------------------}



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe,
  ppDBBDE, ppBands, ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, uCmSqlParams, uCmRptManager, TXComp,
  CmParamReport, jpeg, ppVar, TXRB, ppModule, daDataModule;

type
  TfrmRptDarfDepositoJud = class(TFrmCmReport)
    sqlDarf: TCMSqlParams;
    rpDarf: TppReport;
    ppDetailBand1: TppDetailBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    rpDarfShape1: TppShape;
    rpDarfShape12: TppShape;
    rpDarfShape13: TppShape;
    rpDarfShape10: TppShape;
    rpDarfShape11: TppShape;
    rpDarfShape8: TppShape;
    rpDarfShape9: TppShape;
    rpDarfImage1: TppImage;
    rpDarfLabel1: TppLabel;
    rpDarfLabel2: TppLabel;
    rpDarfShape3: TppShape;
    rpDarfLabel5: TppLabel;
    rpDarfLabel6: TppLabel;
    rpDarfShape4: TppShape;
    rpDarfShape5: TppShape;
    rpDarfShape6: TppShape;
    rpDarfShape7: TppShape;
    rpDarfLabel10: TppLabel;
    rpDarfLabel11: TppLabel;
    rpDarfLabel12: TppLabel;
    rpDarfLabel13: TppLabel;
    rpDarfLabel14: TppLabel;
    rpDarfLabel15: TppLabel;
    rpDarfLabel16: TppLabel;
    rpDarfLabel17: TppLabel;
    rpDarfShape14: TppShape;
    rpDarfShape15: TppShape;
    rpDarfLabel18: TppLabel;
    rpDarfLabel19: TppLabel;
    rpDarfShape16: TppShape;
    rpDarfShape17: TppShape;
    rpDarfLabel20: TppLabel;
    rpDarfLabel21: TppLabel;
    rpDarfShape18: TppShape;
    rpDarfShape19: TppShape;
    rpDarfLabel22: TppLabel;
    rpDarfLabel23: TppLabel;
    rpDarfShape20: TppShape;
    rpDarfShape21: TppShape;
    rpDarfLabel25: TppLabel;
    rpDarfDBText2: TppDBText;
    rpDarfDBText3: TppDBText;
    rpDarfDBText4: TppDBText;
    rpDarfDBText5: TppDBText;
    rpDarfDBText6: TppDBText;
    rpDarfDBText7: TppDBText;
    rpDarfDBText10: TppDBText;
    rpDarfDBText11: TppDBText;
    rpDarfShape22: TppShape;
    rpDarfShape23: TppShape;
    rpDarfLabel26: TppLabel;
    rpDarfLabel27: TppLabel;
    rpDarfLabel28: TppLabel;
    rpDarfLabel29: TppLabel;
    rpDarfDBText8: TppDBText;
    rpDarfDBText9: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    pplDarf: TppBDEPipeline;
    dsDarf: TwwDataSource;
    cdsDarf: TCMClientDataSet;
    ppLabel1: TppLabel;
    rpDarfLabel41: TppLabel;
    rpDarfDBText12: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppLabel5: TppLabel;
    ppLine2: TppLine;
    ppLabel6: TppLabel;
    ppDBText2: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppShape1: TppShape;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBText6: TppDBText;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText7: TppDBText;
    ppShape5: TppShape;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppDBText18: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText19: TppDBText;
    ppLine3: TppLine;
    ppLabel18: TppLabel;
    ppImage2: TppImage;
    ppImage3: TppImage;
    ppImage4: TppImage;
    ppImage5: TppImage;
    ppImage6: TppImage;
    ppImage7: TppImage;
    ppImage8: TppImage;
    ppImage9: TppImage;
    ppImage10: TppImage;
    ppImage11: TppImage;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppImage1: TppImage;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppImage12: TppImage;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppShape12: TppShape;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppLabel41: TppLabel;
    ppDBText3: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppShape23: TppShape;
    ppShape24: TppShape;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppDBText17: TppDBText;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLine4: TppLine;
    ppLabel51: TppLabel;
    ppLine5: TppLine;
    ppLabel52: TppLabel;
    ppDBText21: TppDBText;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppShape25: TppShape;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppDBText24: TppDBText;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppDBText25: TppDBText;
    ppShape26: TppShape;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppDBText26: TppDBText;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppDBText27: TppDBText;
    ppLine6: TppLine;
    ppLabel64: TppLabel;
    ppImage13: TppImage;
    ppImage14: TppImage;
    ppImage15: TppImage;
    ppImage16: TppImage;
    ppImage17: TppImage;
    ppImage18: TppImage;
    ppImage19: TppImage;
    ppImage20: TppImage;
    ppImage21: TppImage;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel65: TppLabel;
    ppDBText28: TppDBText;
    ppLabel71: TppLabel;
    ppDBText29: TppDBText;
    ppCalc1: TppSystemVariable;
    ppSystemVariable1: TppSystemVariable;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    pplblNumReferencia1: TppLabel;
    ppLabel76: TppLabel;
    ppShape27: TppShape;
    ppImage22: TppImage;
    ppShape28: TppShape;
    ppShape29: TppShape;
    ppShape30: TppShape;
    ppLabel75: TppLabel;
    ppLabel77: TppLabel;
    ppImage23: TppImage;
    daDataModule1: TdaDataModule;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppLabel73Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Formatar(Origem, Formato: String): String;
  end;

var
  frmRptDarfDepositoJud: TfrmRptDarfDepositoJud;

implementation

{$R *.DFM}

procedure TfrmRptDarfDepositoJud.CrmRptCMBeforePrint(Sender: TObject);
var
  sSQL : string;
begin
  inherited;

  sSQL :=
  'SELECT '                                                                                         + #13 +
  '  D.IDDARF, '                                                                                    + #13 +

  '  LTRIM(RTRIM(A.NUMAGENCIA)) AS AGENCIA, '                                                       + #13 +
  '  B.MASCARAAGENCIA, '                                                                            + #13 +
  '  LTRIM(RTRIM(C.CONTACORRENTE)) AS CONTACORRENTE, '                                              + #13 +
  '  B.MASCARACC, '                                                                                 + #13 +

  '  PE.NOME AS CONTRIBUINTE, (P.UFSECAO) AS SESSAO, P.CODVARA, '                                   + #13 +

  '  NVL(P.CLASSEACAO, ''02.100'') AS ACAO_CLASSE, P.AUTORACAO, '                                   + #13 +

  '  ''UNIÃO FEDERAL/DELEGACIA DA RECEITA'' AS REU, '                                               + #13 +
  '  D.VLRBASECALCULO, NVL(D.PERCIRRF, 0) AS PERCIRRF, D.DATAFINALAPURACAO, '                       + #13 +

  '  SUBSTR(PE.NUMDOCUMENTO, 1, 3) || ''.'' || '                                                    + #13 +
    'SUBSTR(PE.NUMDOCUMENTO, 4, 3) || ''.'' || '                                                    + #13 +
    'SUBSTR(PE.NUMDOCUMENTO, 7, 3) || ''-'' || '                                                    + #13 +
    'SUBSTR(PE.NUMDOCUMENTO, 10, 2) AS NUMDOCUMENTO, '                                              + #13 +

  '  DT.MATRICULA, D.CODNATUREZA, P.NUMEROPROCESSO, D.DATAVENCDARF, '                               + #13 +
  '  NVL(D.VLRIRRF, 0) AS VLRIRRF, NVL(D.VLRMULTA, 0) AS VLRMULTA, '                                + #13 +
  '  NVL(D.VLRJUROS, 0) AS VLRJUROS, NVL(D.VLRTOTAL, 0) AS VLRTOTAL, T.NUMERO AS TELEFONE '         + #13 +

  'FROM                    '                                                                        + #13 +
  '  BANCO            B,   '                                                                        + #13 +
  '  AGENCIABANCARIA  A,   '                                                                        + #13 +
  '  CONTABANCARIA    C,   '                                                                        + #13 +
  '  PROCJUD          P,   '                                                                        + #13 +
  '  PESSOA           PE,  '                                                                        + #13 +
  '  DARF             D,   '                                                                        + #13 +
  '  LANCIRRF         L,   '                                                                        + #13 +
  '  NATURENDIMENTO   N,   '                                                                        + #13 +
  '  TELENDPESS       T,   '                                                                        + #13 +
  '  DEPENTIT         DT,  '                                                                        + #13 +
  '  ELEGPATRO        E,   '                                                                        + #13 +

  '  ( '                                                                                            + #13 +
  '  SELECT '                                                                                       + #13 +
  '    MAX(T.IDTELEFONE) AS IDTELEFONE '                                                            + #13 +
  '  FROM '                                                                                         + #13 +
  '    PESSOA     P, '                                                                              + #13 +
  '    TELENDPESS T  '                                                                              + #13 +
  '  WHERE '                                                                                        + #13 +
  '        (P.IDPESSOA        = ' + FloatTostr(CrmRptCM.IdEmpresa) + ') '                           + #13 +
  '    AND (P.IDENDCOMERCIAL  = T.IDENDERECO) '                                                     + #13 +
  '    AND (T.TIPO            LIKE ''%C%'' ) '                                                      + #13 +
  '  ) TM '                                                                                         + #13 +

  'WHERE '                                                                                          + #13 +
  '      (D.IDPESSOA      = ' + FloatTostr(CrmRptCM.IdEmpresa) + ') '                               + #13;

  if trim(CmpRptCM.ParamValues[3].AsString) <> '' then sSQL := sSQL +
  '  AND ( '                                                                                        + #13 +
  '      (E.MATRICULA     = ' + QuotedStr(trim(CmpRptCM.ParamValues[3].AsString)) + ') OR '         + #13 +
  '      (DT.MATRICULA    = ' + QuotedStr(trim(CmpRptCM.ParamValues[3].AsString)) + ') '            + #13 +
  '      ) '                                                                                        + #13;

  if trim(CmpRptCM.ParamValues[0].AsString) <> '' then sSQL := sSQL +
  '  AND (D.DATAEMISDARF >= TO_DATE(''' + trim(CmpRptCM.ParamValues[0].AsString) + ''',''DD/MM/YYYY'')) '   + #13;

  if trim(CmpRptCM.ParamValues[1].AsString) <> '' then sSQL := sSQL +
  '  AND (D.DATAEMISDARF <= TO_DATE(''' + trim(CmpRptCM.ParamValues[1].AsString) + ''',''DD/MM/YYYY'')) '   + #13;

  if trim(CmpRptCM.ParamValues[2].AsString) <> '' then sSQL := sSQL +
  '  AND (D.CODNATUREZA   = ''' + CmpRptCM.ParamValues[2].AsString + ''') '                                 + #13;

  sSQL := sSQL +
  '  AND (D.VLRIRRF           > 0) '                                                                + #13 +
  '  AND (D.CODNATUREZA       = N.CODNATUREZA) '                                                    + #13 +
  '  AND (N.FLGDEPOSITOJUDIC  = ''S'') '                                                            + #13 +
  '  AND (D.IDDARF            = L.IDDARF) '                                                         + #13 +
  '  AND (L.IDPROCJUD         = P.IDPROCJUD) '                                                      + #13 + 
  '  AND (E.IDPESSOA(+)       = P.IDPESSOA) '                                                       + #13 +
  '  AND (DT.IDPESSOA(+)      = P.IDPESSOA) '                                                       + #13 +
  '  AND (P.IDPESSOA          = PE.IDPESSOA) '                                                      + #13 +
  '  AND P.IDAGENCIABANCARIA  = A.IDPESSOA(+) '                                                     + #13 +
  '  AND P.IDBANCO            = A.IDBANCO(+) '                                                      + #13 +
  '  AND A.IDBANCO            = B.IDPESSOA(+) '                                                     + #13 +

  '  AND (P.IDCBANCARIA       IS NULL OR P.IDCBANCARIA = C.IDCBANCARIA) '                           + #13 +

  '  AND (P.SITPROCESSO       = 0) '                                                                + #13 +
  '  AND (PE.IDENDCOMERCIAL   = T.IDENDERECO(+)) '                                                  + #13 +
  '  AND (T.IDTELEFONE        = TM.IDTELEFONE(+)) '                                                 + #13 +

  'ORDER BY '                                                                                       + #13 +
  '  P.AUTORACAO, CONTRIBUINTE '; 

  with sqlDARF do
  begin
    SQL.Clear;
    SQL.Text := sSQL;
    Prepare;
    Open;
  end;
// -------------------------------------------------------------------------------------------------
end;


function TfrmRptDarfDepositoJud.Formatar(Origem, Formato: String): String;
Var
  I, W : Integer;

begin
  If (Origem <> '') And (Formato <> '') Then
  Begin
    W      := 1;
    Result := '';

    If Origem = '' Then
      Exit;

    For I := 1 To Length(Formato) Do
    Begin
      If Origem[W] = '' Then
        Break;

      If Pos(Formato[I], '.-/') > 0 Then
      Begin
        Result := Result + Formato[I];
        Continue;
      End
      Else
        Result := Result + Origem[W];
      Inc(W)
    End;
  End
  Else
    Result := Origem;
end;

procedure TfrmRptDarfDepositoJud.ppLabel73Print(Sender: TObject);
Var
  sAgencia, sConta : String;

begin
  inherited;
  sAgencia       := Formatar(cdsDarf.FieldByName('AGENCIA').AsString, cdsDarf.FieldByName('MASCARAAGENCIA').AsString);
  sConta         := Formatar(cdsDarf.FieldByName('CONTACORRENTE').AsString, cdsDarf.FieldByName('MASCARACC').AsString);
  ppLabel73.Text := sAgencia + ' / ' + sConta;
  ppLabel74.Text := sAgencia + ' / ' + sConta;
end;

end.
