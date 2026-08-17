unit RProgAval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, ppBands, ppCache, ppClass, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  ppCtrls, ppPrnabl, ppVar, ppStrtch, ppSubRpt, ppRegion, ppMemo;

type
  TRptProgAval = class(TFrmCmReport)
    sqlProgAval: TCMSqlParams;
    CdsProgAval: TCMClientDataSet;
    dsProgAval: TwwDataSource;
    ppProgAval: TppBDEPipeline;
    rpProgAval: TppReport;
    rpAtivPessDtlBnd: TppDetailBand;
    rpAtivPessSmryBnd: TppSummaryBand;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppLabel5: TppLabel;
    ppLabel8: TppLabel;
    rpProgAvalPeriodo: TppDBText;
    ppDBText10: TppDBText;
    rpTabCursosLbl1: TppLabel;
    rpTabCursosLbl2: TppLabel;
    rpTabCursosCalc1: TppSystemVariable;
    rpTabCursosCalc2: TppSystemVariable;
    ppDBText38: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText9: TppDBText;
    ppLabel2: TppLabel;
    ppDBCalc1: TppDBCalc;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    sAno1, sAno2: string;  
  end;

var
  RptProgAval: TRptProgAval;

implementation

{$R *.DFM}

procedure TRptProgAval.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  rpProgAvalPeriodo.Visible := (CmpRptCM.ParamByName('SelPeriodo').asInteger = 0);

  with (sqlProgAval.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO,');
    Add('  F.MATRICULA, T.DESCRTIPOAVAL AS DESCRICAO, T.CODTIPOAVAL,');
    Add('  CC.NOME AS CENTROCUSTO, H.DATAPLAN,');
    Add('  ''Período: '' || ' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+
        ' ||'' a ''|| ' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ' AS PERIODO');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, HSTAVAL H, FUNCIONARIO F, CARGO C, TIPOAVAL T, CENTCUST CC');
    Add('WHERE');
    Add('  (T.FLGTIPOAVAL < 2) AND');

    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('  (F.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('  (F.IDPESSOA  = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');

    if (CmpRptCM.ParamByName('ListaTipoAval').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaTipoAval').asString) > 0) then
        Add('  (T.CODTIPOAVAL IN (' +CmpRptCM.ParamByName('ListaTipoAval').asString+ ')) AND')
      else
        Add('  (T.CODTIPOAVAL  = ' +CmpRptCM.ParamByName('ListaTipoAval').asString+ ') AND');

    if (CmpRptCM.ParamByName('IndMesAdmis').AsInteger > 0) then
      Add('  (TO_CHAR(F.DATAADMISSAO,''MM'')  = ' +CmpRptCM.ParamByName('IndMesAdmis').asString+ ') AND');

    Add('  (H.DATAREAL IS NULL) AND');
    Add('  (H.DATAPLAN IS NOT NULL) AND');
    Add('  (F.IDPESSOA  = PF.IDPESSOA) AND');

    if (CmpRptCM.ParamByName('SelPeriodo').asInteger = 0) then
      Add('  (H.DATAPLAN BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+
          ',''DD/MM/YYYY'') AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+
          ',''DD/MM/YYYY'')) AND');

    Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('  (F.IDCARGO         = C.IDCARGO) AND');
    Add('  (H.CODTIPOAVAL     = T.CODTIPOAVAL) AND');
    Add('  (H.IDPESSOA        = F.IDPESSOA) AND');
    Add('  (F.IDEMPRESA       = CC.IDEMPRESA) AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO)');
    Add('UNION');
    Add('SELECT');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO,');
    Add('  F.MATRICULA, T.DESCRTIPOAVAL AS DESCRICAO, T.CODTIPOAVAL,');
    Add('  CC.NOME AS CENTROCUSTO,');

    if (CmpRptCM.ParamByName('SelPeriodo').AsInteger = 0) then
      Add('  ADD_MONTHS(H.DATAPLAN, TRUNC((TO_DATE('+
          QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+
          ',''DD/MM/YYYY'') - H.DATAPLAN + 1)'+
          ' / 365.25 * 12 /G.INTERVALO) * G.INTERVALO) AS DATAPLAN,')
    else
      Add('  ADD_MONTHS(H.DATAPLAN,G.INTERVALO) AS DATAPLAN,');

    Add('  ''Período: ''|| ' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+
        ' ||'' a ''|| ' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ' AS PERIODO');

    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F, CARGO C, TIPOAVAL T, CENTCUST CC, GRUPFUNC G,');
    Add('  (SELECT');
    Add('     H.IDPESSOA, H.CODTIPOAVAL, MAX(H.DATAREAL) AS DATAPLAN');
    Add('   FROM');
    Add('     HSTAVAL H, TIPOAVAL T');
    Add('   WHERE');
    Add('     (T.FLGTIPOAVAL < 2) AND');
    Add('     (H.CODTIPOAVAL = T.CODTIPOAVAL)');    
    Add('   GROUP BY');
    Add('     H.IDPESSOA, H.CODTIPOAVAL) H');
    Add('WHERE');
    Add('  (T.FLGTIPOAVAL < 2) AND');

    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('  (F.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('  (F.IDPESSOA  = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');

    if (CmpRptCM.ParamByName('ListaTipoAval').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaTipoAval').asString) > 0) then
        Add('  (T.CODTIPOAVAL IN (' +CmpRptCM.ParamByName('ListaTipoAval').asString+ ')) AND')
      else
        Add('  (T.CODTIPOAVAL  = ' +CmpRptCM.ParamByName('ListaTipoAval').asString+ ') AND');

    if (CmpRptCM.ParamByName('IndMesAdmis').AsInteger > 0) then
      Add('  (TO_CHAR(F.DATAADMISSAO,''MM'')  = ' +CmpRptCM.ParamByName('IndMesAdmis').asString+ ') AND');

    Add('  (F.IDPESSOA    = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA    = H.IDPESSOA) AND');
    Add('  (T.CODTIPOAVAL = H.CODTIPOAVAL) AND');
    Add('  (C.CODGRPFUNC  = G.CODGRPFUNC) AND');
    Add('  (NOT EXISTS (SELECT IDPESSOA');
    Add('               FROM   HSTAVAL H2');
    Add('               WHERE  (H2.DATAREAL IS NULL) AND');
    Add('                      (H2.DATAPLAN IS NOT NULL) AND');
    Add('                      (H2.IDPESSOA = F.IDPESSOA) AND');
    Add('                      (H2.CODTIPOAVAL = T.CODTIPOAVAL))) AND');

    if (CmpRptCM.ParamByName('SelPeriodo').AsInteger = 0) then
    begin
      Add('  (NOT EXISTS (SELECT IDPESSOA');
      Add('               FROM   HSTAVAL H3');
      Add('               WHERE  (H3.DATAREAL IS NOT NULL) AND');
      Add('                      (H3.DATAREAL BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+
          ',''DD/MM/YYYY'') AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+
          ',''DD/MM/YYYY'')) AND');

      Add('                      (H3.IDPESSOA = F.IDPESSOA) AND');
      Add('                      (H3.CODTIPOAVAL = T.CODTIPOAVAL))) AND');
    end;

    if (CmpRptCM.ParamByName('SelPeriodo').AsInteger = 0) then
      Add('  (ADD_MONTHS(H.DATAPLAN, TRUNC((TO_DATE(' +
          QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+
          ',''DD/MM/YYYY'') - H.DATAPLAN + 1)'+
          ' / 365.25 * 12 /G.INTERVALO) * G.INTERVALO) BETWEEN TO_DATE(' +
          QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'') AND'+
          ' TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY'')) AND');

    Add('  (F.IDESTAB        = PJ.IDPESSOA) AND');
    Add('  (F.IDCARGO        = C.IDCARGO) AND');
    Add('  (H.CODTIPOAVAL    = T.CODTIPOAVAL) AND');
    Add('  (H.IDPESSOA       = F.IDPESSOA) AND');
    Add('  (F.IDEMPRESA      = CC.IDEMPRESA) AND');
    Add('  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO)');
    Add('UNION');
    Add('SELECT');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO,');
    Add('  F.MATRICULA, T.DESCRTIPOAVAL AS DESCRICAO, T.CODTIPOAVAL,');
    Add('  CC.NOME AS CENTROCUSTO, ');

    if (CmpRptCM.ParamByName('SelPeriodo').AsInteger = 0) then
      Add('  ADD_MONTHS(F.DATAADMISSAO, TRUNC((TO_DATE(' +
          QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+
          ',''DD/MM/YYYY'') - F.DATAADMISSAO + 1)'+
          ' / 365.25 * 12 /G.INTERVALO) * G.INTERVALO) AS DATAPLAN,')
    else
      Add('  ADD_MONTHS(F.DATAADMISSAO,G.INTERVALO) AS DATAPLAN,');

    Add('  ''Período: '' || ' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+
        ' ||'' a ''|| ' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ' AS PERIODO');

    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F, CARGO C, TIPOAVAL T, CENTCUST CC, GRUPFUNC G');
    Add('WHERE');
    Add('  (T.FLGTIPOAVAL < 2) AND');

    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('  (F.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('  (F.IDPESSOA  = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');

    if (CmpRptCM.ParamByName('ListaTipoAval').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaTipoAval').asString) > 0) then
        Add('  (T.CODTIPOAVAL IN (' +CmpRptCM.ParamByName('ListaTipoAval').asString+ ')) AND')
      else
        Add('  (T.CODTIPOAVAL  = ' +CmpRptCM.ParamByName('ListaTipoAval').asString+ ') AND');

    if (CmpRptCM.ParamByName('IndMesAdmis').AsInteger > 0) then
      Add('  (TO_CHAR(F.DATAADMISSAO,''MM'')  = ' +CmpRptCM.ParamByName('IndMesAdmis').asString+ ') AND');

    Add('  (F.IDPESSOA    = PF.IDPESSOA) AND');
    Add('  (NOT EXISTS (SELECT IDPESSOA');
    Add('               FROM   HSTAVAL H2');
    Add('               WHERE  (H2.IDPESSOA    = F.IDPESSOA) AND');
    Add('                      (H2.CODTIPOAVAL = T.CODTIPOAVAL))) AND');

    if (CmpRptCM.ParamByName('SelPeriodo').asInteger = 0) then
      Add('  (ADD_MONTHS(F.DATAADMISSAO, TRUNC((TO_DATE(' +
          QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+
          ',''DD/MM/YYYY'') - F.DATAADMISSAO + 1)'+
          ' / 365.25 * 12 /G.INTERVALO) * G.INTERVALO) BETWEEN TO_DATE(' +
          QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'') AND'+
          ' TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY'')) AND');

    Add('  (C.CODGRPFUNC     = G.CODGRPFUNC) AND');
    Add('  (F.IDESTAB        = PJ.IDPESSOA) AND');
    Add('  (F.IDCARGO        = C.IDCARGO) AND');
    Add('  (F.IDEMPRESA      = CC.IDEMPRESA) AND');
    Add('  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO)');
    Add('ORDER BY');

    case (CmpRptCM.ParamByName('SeqRelat').asInteger) of
      0 : Add('  5, 2, 8');
      1 : Add('  5, 4, 8');
      2 : Add('  5, 7, 2, 8');
      3 : Add('  5, 7, 4, 8');
      4 : Add('  5, 8, 2');
      5 : Add('  5, 8, 4');
      6 : Add('  5, 8, 7, 2');
     else Add('  5, 8, 7, 4');
    end;

    SaveToFile('c:\qry.txt');
  end;
  sqlProgAval.Open;
end;

end.
