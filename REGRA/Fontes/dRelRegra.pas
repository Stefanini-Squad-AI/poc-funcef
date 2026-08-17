// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//  Autor      : Camille
//  Data       : 09.08.2004
//  Pendência  : 17226
//  Descrição  : Acerto na qryRegrasUtilizadas
//------------------------------------------------------------------------------
unit dRelRegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppVar,
  ppRelatv, ppDBPipe, ppModule, daDataModule, ppStrtch, ppSubRpt, Grids,
  DBGrids;

type
  TdtmRelRegra = class(TdtmReports)
    pprFormula: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppCalc1: TppSystemVariable;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppCalc2: TppSystemVariable;
    ppBdeFormula: TppBDEPipeline;
    dsFormula: TwwDataSource;
    QryFormula: TwwQuery;
    pprFormulaLabel1: TppLabel;
    pprFormulaDBText1: TppDBText;
    pprFormulaLabel2: TppLabel;
    pprFormulaDBText2: TppDBText;
    pprVariaveis: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine4: TppLine;
    ppLabel9: TppLabel;
    ppBdeVariaveis: TppBDEPipeline;
    dsVariaveis: TwwDataSource;
    qryVariaveis: TwwQuery;
    pprCampos: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel8: TppLabel;
    ppLine5: TppLine;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine6: TppLine;
    ppLabel13: TppLabel;
    ppBdeCampo: TppBDEPipeline;
    dsCampos: TwwDataSource;
    qryCampos: TwwQuery;
    pprCamposDBText1: TppDBText;
    pprCamposDBText2: TppDBText;
    pprCamposLabel1: TppLabel;
    pprCamposLabel2: TppLabel;
    pprRegras: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel14: TppLabel;
    ppLine7: TppLine;
    ppLabel15: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppLine8: TppLine;
    ppLabel20: TppLabel;
    ppBdeRegras: TppBDEPipeline;
    dsRegras: TwwDataSource;
    QryRegras: TwwQuery;
    pprRegrasDBText4: TppDBText;
    pprRegrasDBText5: TppDBText;
    pprRegrasLabel1: TppLabel;
    pprRegrasLabel2: TppLabel;
    pprRegrasDBText1: TppDBText;
    pprRegrasDBText2: TppDBText;
    pprRegrasLabel3: TppLabel;
    pprRegrasDBText3: TppDBText;
    pprRegrasLabel4: TppLabel;
    pprRegrasLabel5: TppLabel;
    pprRegrasLine1: TppLine;
    pprFormulaDBText4: TppDBText;
    pprFormulaLabel4: TppLabel;
    pprFormulaDBText3: TppDBText;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    ppCalc7: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    ppBdeSRB: TppBDEPipeline;
    DsSRB: TwwDataSource;
    QrySRB: TwwQuery;
    ppSRB: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel16: TppLabel;
    ppLine9: TppLine;
    ppLabel17: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppFooterBand5: TppFooterBand;
    ppLine10: TppLine;
    ppLabel18: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine11: TppLine;
    ppLabel19: TppLabel;
    ppDBText5: TppDBText;
    ppLabel21: TppLabel;
    ppDBText6: TppDBText;
    ppLabel22: TppLabel;
    ppDBText7: TppDBText;
    ppLine12: TppLine;
    ppLabel23: TppLabel;
    ppDBText8: TppDBText;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppDBText9: TppDBText;
    ppLabel26: TppLabel;
    ppDBText10: TppDBText;
    ppLabel27: TppLabel;
    ppDBText11: TppDBText;
    ppLine13: TppLine;
    QryRubricasA: TwwQuery;
    UpdSRB: TUpdateSQL;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand6: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBText12: TppDBText;
    DsSRBAux: TDataSource;
    ppBdeSRBAux: TppBDEPipeline;
    ppLabel29: TppLabel;
    ppLine15: TppLine;
    ppLabel30: TppLabel;
    ppDBText13: TppDBText;
    ppLabel31: TppLabel;
    ppDBText14: TppDBText;
    ppLabel32: TppLabel;
    ppDBText15: TppDBText;
    ppLabel33: TppLabel;
    ppDBText16: TppDBText;
    ppLabel34: TppLabel;
    ppDBText17: TppDBText;
    ppLabel35: TppLabel;
    ppDBText18: TppDBText;
    ppLabel36: TppLabel;
    ppDBText19: TppDBText;
    ppLine16: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel37: TppLabel;
    ppLine17: TppLine;
    QrySRBAux: TwwQuery;
    QryAux: TwwQuery;
    ppDBText20: TppDBText;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppDBCalc2: TppDBCalc;
    DsSRBParcelaB: TDataSource;
    ppBdeSRBAuxB: TppBDEPipeline;
    QrySRBAuxB: TwwQuery;
    QryRubricasB: TwwQuery;
    UpdSRBAux: TUpdateSQL;
    UpdSRBParcelaB: TUpdateSQL;
    ppSRBB: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel40: TppLabel;
    ppLine18: TppLine;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppDBText21: TppDBText;
    ppLabel43: TppLabel;
    ppDBText22: TppDBText;
    ppLabel44: TppLabel;
    ppDBText23: TppDBText;
    ppLine20: TppLine;
    ppLabel45: TppLabel;
    ppDBText24: TppDBText;
    ppLabel46: TppLabel;
    ppLine22: TppLine;
    ppDetailBand7: TppDetailBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel51: TppLabel;
    ppLine23: TppLine;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppLine24: TppLine;
    ppDBCalc3: TppDBCalc;
    ppLabel60: TppLabel;
    ppLine25: TppLine;
    ppFooterBand6: TppFooterBand;
    ppLine26: TppLine;
    ppLabel62: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText25: TppDBText;
    ppLabel47: TppLabel;
    ppDBText26: TppDBText;
    ppLine19: TppLine;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel54: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppLine21: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    DataSource1: TDataSource;
    ppDBText27: TppDBText;
    ppDBText37: TppDBText;
    qryRegrasUtilizadas: TwwQuery;
    dsRegrasUtilizadas: TwwDataSource;
    ppRegrasUtilizadas: TppBDEPipeline;
    rpRegrasUtilizadas: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel28: TppLabel;
    ppLine14: TppLine;
    ppLabel61: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppFooterBand7: TppFooterBand;
    ppLine34: TppLine;
    ppLabel63: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel64: TppLabel;
    ppDBText38: TppDBText;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLine35: TppLine;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppLabel68: TppLabel;
    ppDBText41: TppDBText;
    ppLabel69: TppLabel;
    ppDBText42: TppDBText;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    procedure ppSRBBeforePrint(Sender: TObject);
    procedure ppSRBBBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sNomeIndiceTeto, sNomeIndiceReaj, sAnoMesRef, sDataReferencia,
    sGrupoRubrica : String;
    iIdPessoa, iIdPessJur, iIdCalculo, iIdBeneficio : Integer;

    Function MostraParam(Form: string): boolean; OverRide;
    Function AcertaHistorico(sAnoMesRef, sNomeIndiceReaj :String): String;
  end;

var
  dtmRelRegra: TdtmRelRegra;
  TipoRel : LongInt;

implementation

uses fParamRelatRegra, uBiblioteca, fAguarde, FPARAMRELATREGRA5;

{$R *.DFM}

function TdtmRelRegra.MostraParam(Form: string): boolean;
var frm : TForm;
begin
     frm := nil;
     if UpperCase(Form)= 'FRMPARAMRELATREGRA1'
     then begin //Relat. Formulas
        TipoRel := 1;
        frm := TfrmParamRelatRegra.Create(Application);
        frm.Caption := 'Seleção de Fórmulas para Impressão';
     end
     else if UpperCase(Form)= 'FRMPARAMRELATREGRA2'
          then begin //Relat. Variaveis
             TipoRel := 2;
             frm := TfrmParamRelatRegra.Create(Application);
             frm.Caption := 'Seleção de Variáveis para Impressão';
          end
     else if UpperCase(Form)= 'FRMPARAMRELATREGRA3'
          then begin //Relat. Campos
             TipoRel := 3;
             frm := TfrmParamRelatRegra.Create(Application);
             frm.Caption := 'Seleção de Campos para Impressão';
          end
     else if UpperCase(Form)= 'FRMPARAMRELATREGRA4'
          then begin //Relat. Regras
             TipoRel := 4;
             frm := TfrmParamRelatRegra.Create(Application);
             frm.Caption := 'Seleção de Regras para Impressão';
          end
     else if UpperCase(Form)= 'FRMPARAMRELATREGRA5'
          then begin //Relat. Regras Parametrizaveis
             frm := TfrmParamRelatRegra5.Create(Application);
             frm.Caption := 'Relação de Regras Parametrizadas';
          end;

     if frm = nil then Result := False
     else begin
          with frm do begin
               Result := (Showmodal = mrOk);
               Free;
          end;
     end;

end;

{------------------------------------------------------------------------------}
procedure TdtmRelRegra.ppSRBBeforePrint(Sender: TObject);
Var
  sMesAno, sAnoMesIndice, sSQL : String;
  dTotalRubrica : Double;
begin
  inherited;
  { Tabela Virtual }
  QrySRBAux.Close;
  QrySRBAux.Open;
  QrySRBAux.Delete;

  {----------------------------------------------------------------------------}
  { PROCESSAMENTO PARCELA "A"                                                  }
  {----------------------------------------------------------------------------}

  { Rubricas da Media }
  QryRubricasA.Close;
  QryRubricasA.SQL.Clear;
  sSQL := 'SELECT TO_CHAR(TO_DATE(MES,''YYYY/MM''),''MON/YYYY'') AS MESANO,  '+
          '       P.IDGRUPORUBRICA, H.IDPESSJUR, H.IDRUBRICA, H.CODPROVDESC, '+
          '       H.VALORPROVENTO,  H.MES '+
          'FROM HISTRUBSAL H, PROVDESC P  '+
          'WHERE H.IDPESSOA  = '+ IntToStr(iIdPessoa)  +'  AND '+
          '      H.IDPESSJUR = '+ IntToStr(iIdPessJur) +'  AND '+
          '      H.MES < '+ QuotedStr(sAnoMesRef) +'  AND '+
          '      H.MES >= TO_CHAR(ADD_MONTHS(TO_DATE('+ QuotedStr(sAnoMesRef) +
                                  ', ''YYYY/MM''),-12), ''YYYY/MM'') AND '+
          '      P.IDGRUPORUBRICA IN ('+ QuotedStr(sGrupoRubrica) +')   AND '+
          '      H.IDRUBRICA = P.IDPROVENTO '+
          'ORDER BY '+
          '  H.MES ';
  QryRubricasA.SQL.Add(sSQL);
  QryRubricasA.Open;

  { Varre as rubricas da media preenchendo a qry virtual }
  sMesAno := QryRubricasA.FieldByName('MESANO').AsString;
  While Not QryRubricasA.Eof Do Begin
    dTotalRubrica := 0;

    { Transfere dados para qry virtual }
    QrySRBAux.Append;

    { Zera campos }
    QrySRBAux.FieldByName('FERIAS').AsFloat    := 0;
    QrySRBAux.FieldByName('ANUENIO').AsFloat   := 0;
    QrySRBAux.FieldByName('SALBASICO').AsFloat := 0;
    QrySRBAux.FieldByName('DIFERENCA').AsFloat := 0;
    QrySRBAux.FieldByName('INDICE').AsFloat    := 0;
    QrySRBAux.FieldByName('DATA').AsString :=
      QryRubricasA.FieldByName('MESANO').AsString;

    { Busca Teto }
    sAnoMesIndice := QryRubricasA.FieldByName('MES').AsString;
    sSQL := 'SELECT '+
            '  1 AS REGRA, C.COTVALOR, C.COTMESREF AS MES '+
            'FROM   '+
            '  MOEDA M, COTACAOMOEDA C  '+
            'WHERE  '+
            '  M.MOESIGLA  = '''+sNomeIndiceTeto+''' AND '+
            '  M.MOECODIGO = C.MOECODIGO             AND '+
            '  SUBSTR(C.COTMESREF,3,4)||''/''||SUBSTR(C.COTMESREF,1,2) <= '+
            QuotedStr(Copy(sAnoMesIndice,1,4)+'/'+Copy(sAnoMesIndice,6,2)) +' '+
            'ORDER BY SUBSTR(C.COTMESREF,3,4)||''/''||SUBSTR(C.COTMESREF,1,2) DESC ';

    { Guarda Teto caso encontre algum }
    If FazQuery(QryAux, sSQL) Then
      QrySRBAux.FieldByName('LIMITANTE').AsFloat := QryAux.FieldByName('COTVALOR').AsFloat
    Else
      QrySRBAux.FieldByName('LIMITANTE').AsFloat := 0;

    { Processa todas as rubricas do Mês }
    While (QryRubricasA.FieldByName('MESANO').AsString = sMesAno) And
          (Not QryRubricasA.EOF) Do Begin

      { Preenche campos com valores }
      If QryRubricasA.FieldByName('IDRUBRICA').AsString = '1000' Then Begin
        QrySRBAux.FieldByName('SALBASICO').AsFloat :=
          QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
      End Else If QryRubricasA.FieldByName('IDRUBRICA').AsString = '1120' Then Begin
        QrySRBAux.FieldByName('ANUENIO').AsFloat :=
          QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
      End Else If QryRubricasA.FieldByName('IDRUBRICA').AsString = '1194' Then Begin
        QrySRBAux.FieldByName('FERIAS').AsFloat :=
          QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
      End;

      dTotalRubrica := dTotalRubrica + QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
      QryRubricasA.Next;
    End;
    QrySRBAux.FieldByName('SOMAPARCELAS').AsFloat := dTotalRubrica;
    { Guarda Teto caso encontre algum }
    If (QrySRBAux.FieldByName('SOMAPARCELAS').AsFloat >
        QrySRBAux.FieldByName('LIMITANTE').AsFloat) And (sNomeIndiceTeto <> '')
    Then Begin
      QrySRBAux.FieldByName('SOMACORRIGIDA').AsFloat := QrySRBAux.FieldByName('LIMITANTE').AsFloat;
    End Else Begin
      QrySRBAux.FieldByName('SOMACORRIGIDA').AsFloat := QrySRBAux.FieldByName('SOMAPARCELAS').AsFloat;
    End;
    sMesAno := QryRubricasA.FieldByName('MESANO').AsString;
    QrySRBAux.Post;
  End;
  QrySRBAux.First;

end;

{------------------------------------------------------------------------------}
procedure TdtmRelRegra.ppSRBBBeforePrint(Sender: TObject);
Var
  Formato, sMesAno, sAnoMesIndice, sAnoMesProc, sAnoMesIni, sSQL : String;
  dTotalRubrica : Double;
  iNumPassada, iAnoProc, iMesProc, iIdRubrica : Integer;
begin
  inherited;

  {----------------------------------------------------------------------------}
  { PROCESSAMENTO PARCELA "B"                                                  }
  {----------------------------------------------------------------------------}
  QrySRBAuxB.Close;
  QrySRBAuxB.Open;
  QrySRBAuxB.Delete;

  { Rubricas da Media }
  QryRubricasB.Close;
  QryRubricasB.SQL.Clear;
   sSQL := 'SELECT '+
           '  TO_CHAR(TO_DATE(MES,'' YYYY/MM''),''MON/YYYY'') AS MESANO, '+
           '  H.IDRUBRICA, H.MES, H.VALORPROVENTO, TO_DATE(H.MES,''YYYY/MM'') AS DATARUBRICA, '+
           '  D.TIPOCALCULO, D.IDRUBRICA, D.ANOMESREF, D.VLRCORRIGIDO, D.VLRCALCULO, '+
           '  D.VLRINDICE, D.FATOR, '+
           '  C.IDBENEFICIO,        '+
           '  P.DESCRICAO           '+
           'FROM  '+
           '  HISTRUBSAL H,  DETCALCULO D, CALCULO C, PROVDESC P '+
           'WHERE '+
           '  H.IDPESSOA  = '+ IntToStr(iIdPessoa)  +'  AND '+
           '  ( (C.IDBENEFICIO = '+IntToStr(iIdBeneficio)+') OR (C.IDBENEFICIO IS NULL) )  AND '+

           '  D.IDCALCULO = C.IDCALCULO(+)  AND '+

           '  H.IDRUBRICA = D.IDRUBRICA(+)  AND '+
           '  H.MES       = D.ANOMESREF(+)  AND '+
           '  H.IDRUBRICA = P.IDPROVENTO    AND '+
           '  P.IDGRUPORUBRICA IN ('+ QuotedStr(sGrupoRubrica) +') '+
           'ORDER BY '+
           '  H.IDRUBRICA, H.MES, D.TIPOCALCULO ';
  QryRubricasB.SQL.Add(sSQL);
  QryRubricasB.Open;

  { Calcula data de Inicio do Processamento }
  sSQL := 'SELECT TO_CHAR('+
          '         ADD_MONTHS( '+
          '           TO_DATE('''+sAnoMesRef+''', ''YYYY/MM''),-60 ),''YYYY/MM'') AS ANOMESPROC '+
          'FROM DUAL ';

  FazQuery(QryAux, sSQL);
  sAnoMesIni  := QryAux.FieldByName('ANOMESPROC').AsString;
  sAnoMesProc := sAnoMesIni; 

  {------------------------------------------------------}
  { Varre as rubricas da media preenchendo a qry virtual }
  sMesAno    := QryRubricasB.FieldByName('MESANO').AsString;
  iIdRubrica := QryRubricasB.FieldByName('IDRUBRICA').AsInteger;
  While Not QryRubricasB.Eof Do Begin
    { Caso Troque a Rubrica, Reinicia data inicial de processamento }
    If iIdRubrica <> QryRubricasB.FieldByName('IDRUBRICA').AsInteger Then begin
      sAnoMesProc := sAnoMesIni;
      iIdRubrica  := QryRubricasB.FieldByName('IDRUBRICA').AsInteger;
    End;

    dTotalRubrica := 0;

    { Transfere dados para qry virtual }
    QrySRBAuxB.Append;

    { Zera campos }
    QrySRBAuxB.FieldByName('VALORREAL').AsFloat      := 0;
    QrySRBAuxB.FieldByName('VALORLIMITADO1').AsFloat := 0;
    QrySRBAuxB.FieldByName('VALORLIMITADO2').AsFloat := 0;
    QrySRBAuxB.FieldByName('INDICE').AsFloat         := 0;
    QrySRBAuxB.FieldByName('FATOR').AsFloat          := 0;
    QrySRBAuxB.FieldByName('VALORCORRIGIDO1').AsFloat := 0;
    QrySRBAuxB.FieldByName('VALORCORRIGIDO2').AsFloat := 0;
    QrySRBAuxB.FieldByName('VALORPROPORCAO1').AsFloat := 0;
    QrySRBAuxB.FieldByName('VALORPROPORCAO2').AsFloat := 0;
    QrySRBAuxB.FieldByName('DATA').AsString :=
      QryRubricasB.FieldByName('MESANO').AsString;
    QrySRBAuxB.FieldByName('IDRUBRICA').AsInteger :=
      QryRubricasB.FieldByName('IDRUBRICA').AsInteger;
    QrySRBAuxB.FieldByName('NOME').AsString       :=
      QryRubricasB.FieldByName('DESCRICAO').AsString;

    {--------------------------------------------------------------------------}
    { Caso proximo Mes na sequencia não esteja no historico inclui linha       }
    { zerada na tabela com o Indice, caso tenha.                               }
    While (sAnoMesProc <> QryRubricasB.FieldByName('MES').AsString) And
           (sAnoMesProc <= sAnoMesRef) Do Begin
      sAnoMesProc := AcertaHistorico(sAnoMesProc, sNomeIndiceReaj);
    End;
    {--------------------------------------------------------------------------}
    { Processa todas as rubricas do Mês                                        }
    iNumPassada := 1;
    While (QryRubricasB.FieldByName('MESANO').AsString = sMesAno) And
          (Not QryRubricasB.EOF) Do Begin

      { Preenche campos com valores }
      QrySRBAuxB.FieldByName('IDRUBRICA').AsInteger := QryRubricasB.FieldByName('IDRUBRICA').AsInteger;
      QrySRBAuxB.FieldByName('NOME').AsString       := QryRubricasB.FieldByName('DESCRICAO').AsString;
      QrySRBAuxB.FieldByName('VALORREAL').AsFloat   := QryRubricasB.FieldByName('VALORPROVENTO').AsFloat;
      QrySRBAuxB.FieldByName('INDICE').AsFloat   := QryRubricasB.FieldByName('VLRINDICE').AsFloat;
      QrySRBAuxB.FieldByName('FATOR').AsFloat    := QryRubricasB.FieldByName('FATOR').AsFloat;

      If iNumPassada = 1 Then Begin
        QrySRBAuxB.FieldByName('VALORLIMITADO1').AsFloat   := 0; //QryRubricasB.FieldByName('VALORPROVENTO').AsFloat;
        QrySRBAuxB.FieldByName('VALORCORRIGIDO1').AsFloat  := QryRubricasB.FieldByName('VLRCORRIGIDO').AsFloat;
        QrySRBAuxB.FieldByName('VALORPROPORCAO1').AsFloat  := QryRubricasB.FieldByName('VLRCALCULO').AsFloat;
        Inc(iNumPassada);
      End Else If iNumPassada = 2 Then Begin
        QrySRBAuxB.FieldByName('VALORLIMITADO2').AsFloat   := 0; //QryRubricasB.FieldByName('VALORPROVENTO').AsFloat;
        QrySRBAuxB.FieldByName('VALORCORRIGIDO2').AsFloat  := QryRubricasB.FieldByName('VLRCORRIGIDO').AsFloat;
        QrySRBAuxB.FieldByName('VALORPROPORCAO2').AsFloat  := QryRubricasB.FieldByName('VLRCALCULO').AsFloat;
      End;

      QryRubricasB.Next;

    End;
    {--------------------------------------------------------------------------}

    { Calcula Proximo Ano/Mes de processamento }
    iAnoProc := StrToInt(Copy(sAnoMesProc,1,4));
    iMesProc := (StrToInt(Copy(sAnoMesProc,6,2))+1);
    { Caso Ano pulado recalcula }
    If iMesProc > 12 Then Begin
      iAnoProc := iAnoProc + 1;
      iMesProc := 1;
    End;
    { Acerta casas }
    If iMesProc < 10 Then Begin
      sAnoMesProc := IntToStr(iAnoProc)+'/0'+IntToStr(iMesProc);
    End Else Begin
      sAnoMesProc := IntToStr(iAnoProc)+'/'+IntToStr(iMesProc);
    End;
    {------------------------------------------}

    sMesAno := QryRubricasB.FieldByName('MESANO').AsString;
    QrySRBAuxB.Post;

  End; { While Not QryRubricasB.Eof }

  sAnoMesProc := DateToStr(IncMonth(QryRubricasB.FieldByName('DATARUBRICA').AsDateTime, 1));
  sAnoMesProc := Copy(sAnoMesProc,7,4)+'/'+Copy(sAnoMesProc,4,2);

  {--------------------------------------------------------------------------}
  { Preenche histórico até a data de processo caso não esteja                }
  While sAnoMesProc < sAnoMesRef Do Begin

    { Transfere dados para qry virtual }
    QrySRBAuxB.Append;
    QrySRBAuxB.FieldByName('IDRUBRICA').AsInteger :=
      QryRubricasB.FieldByName('IDRUBRICA').AsInteger;
    QrySRBAuxB.FieldByName('NOME').AsString       :=
      QryRubricasB.FieldByName('DESCRICAO').AsString;
    { Preenche histórico }
    sAnoMesProc := AcertaHistorico(sAnoMesProc, sNomeIndiceReaj);
    QrySRBAuxB.Cancel;
  End;
  QrySRBAuxB.First;

  {****************************************************************************}

end;

Function TdtmRelRegra.AcertaHistorico(sAnoMesRef, sNomeIndiceReaj :String): String;
Var
  sAnoMesIndice, sSQL : String;
  iAnoProc, iMesProc : Integer;
Begin
  { Busca Teto }
  sAnoMesIndice := sAnoMesRef;
  sSQL := 'SELECT '+
          '  1 AS REGRA, C.COTVALOR, C.COTMESREF AS MES '+
          'FROM   '+
          '  MOEDA M, COTACAOMOEDA C  '+
          'WHERE  '+
          '  M.MOESIGLA  = '''+sNomeIndiceReaj+''' AND '+
          '  M.MOECODIGO = C.MOECODIGO         AND '+
          '  SUBSTR(C.COTMESREF,3,4)||''/''||SUBSTR(C.COTMESREF,1,2) = '+
          QuotedStr(Copy(sAnoMesIndice,1,4)+'/'+Copy(sAnoMesIndice,6,2));

  { Preenche Indice caso encontre algum }
  If FazQuery(QryAux, sSQL) Then Begin
    QrySRBAuxB.FieldByName('INDICE').AsFloat   := ( (QryAux.FieldByName('COTVALOR').AsFloat/100)+1 );
    QrySRBAuxB.FieldByName('FATOR').AsFloat    := 0;
  End Else Begin
    QrySRBAuxB.FieldByName('INDICE').AsFloat   := 1;
    QrySRBAuxB.FieldByName('FATOR').AsFloat    := 0;
  End;
  { Preenche o resto dos dados }
  QrySRBAuxB.FieldByName('DATA').AsString :=
    UpperCase(FormatDateTime('MMM/YYYY', StrToDate('01/'+ Copy(sAnoMesRef,6,2) +'/'+ Copy(sAnoMesRef,1,4)) ));

  QrySRBAuxB.FieldByName('IDRUBRICA').AsInteger :=
    QryRubricasB.FieldByName('IDRUBRICA').AsInteger;
  QrySRBAuxB.FieldByName('NOME').AsString       :=
    QryRubricasB.FieldByName('DESCRICAO').AsString;

  { Calcula proximo Ano/Mes de processamento }
  iAnoProc := StrToInt(Copy(sAnoMesRef,1,4));
  iMesProc := (StrToInt(Copy(sAnoMesRef,6,2))+1);
  { Caso Ano pulado recalcula }
  If iMesProc > 12 Then Begin
    iAnoProc := iAnoProc + 1;
    iMesProc := 1;
  End;
  { Acerta casas }
  If iMesProc < 10 Then Begin
    sAnoMesRef := IntToStr(iAnoProc)+'/0'+IntToStr(iMesProc);
  End Else Begin
    sAnoMesRef := IntToStr(iAnoProc)+'/'+IntToStr(iMesProc);
  End;
  {------------------------------------------}
  QrySRBAuxB.Post;

  QrySRBAuxB.Append;

  { Zera campos }
  QrySRBAuxB.FieldByName('VALORREAL').AsFloat      := 0;
  QrySRBAuxB.FieldByName('VALORLIMITADO1').AsFloat := 0;
  QrySRBAuxB.FieldByName('VALORLIMITADO2').AsFloat := 0;
  QrySRBAuxB.FieldByName('INDICE').AsFloat         := 0;
  QrySRBAuxB.FieldByName('FATOR').AsFloat          := 0;
  QrySRBAuxB.FieldByName('VALORCORRIGIDO1').AsFloat := 0;
  QrySRBAuxB.FieldByName('VALORCORRIGIDO2').AsFloat := 0;
  QrySRBAuxB.FieldByName('VALORPROPORCAO1').AsFloat := 0;
  QrySRBAuxB.FieldByName('VALORPROPORCAO2').AsFloat := 0;
  QrySRBAuxB.FieldByName('DATA').AsString :=
    QryRubricasB.FieldByName('MESANO').AsString;
  {-----------------------------------------------------}

  Result := sAnoMesRef;
End;

end.
