unit RAval3C;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, ppBands, ppCache, ppClass, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  ppCtrls, ppPrnabl, ppVar, ppStrtch, ppSubRpt, ppRegion, ppMemo;

type
  TRptAval3C = class(TFrmCmReport)
    sqlAval: TCMSqlParams;
    CdsAval: TCMClientDataSet;
    dsAval: TwwDataSource;
    ppAval: TppBDEPipeline;
    rpAval: TppReport;
    rpAtivPessDtlBnd: TppDetailBand;
    rpAtivPessSmryBnd: TppSummaryBand;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBCalc4: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLabel9: TppLabel;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    ppLabel2: TppLabel;
    ppDBText10: TppDBText;
    ppLabel10: TppLabel;
    rpTabCursosLbl1: TppLabel;
    rpTabCursosLbl2: TppLabel;
    rpTabCursosCalc1: TppSystemVariable;
    rpTabCursosCalc2: TppSystemVariable;
    ppDBText38: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText9: TppDBText;
    ppShape1: TppShape;
    ppLabel7: TppLabel;
    ppDBText11: TppDBText;
    ppLabel11: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBText12: TppDBText;
    ppShape2: TppShape;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    sAno1, sAno2: string;
  end;

var
  RptAval3C: TRptAval3C;

implementation

//uses fAguarde;

{$R *.DFM}

procedure TRptAval3C.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlAval.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO, F.MATRICULA,');
    Add('  T.DESCRTIPOAVAL AS DESCRICAO, T.CODTIPOAVAL, NVL(H.AVALIACAO,0) AS AVALIACAO,');
    Add('  H.AVALIADOR, '''' AS PENDENTE, ROUND(NVL(H.AVALIACAO,0) * 100 / '+
      CmpRptCM.ParamByName('MaxPonto').asString+ ',2) AS PERCENTUAL,');
    Add('  ' +CmpRptCM.ParamByName('MaxPonto').asString+ ' AS MAXPONTO,');
    Add('  CC.NOME AS CENTROCUSTO, H.DATAREAL, H.DATAPLAN,');
    Add('  ''Período: '' || ' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+
        ' ||'' a ''|| ' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ' AS PERIODO');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, HSTAVAL H, FUNCIONARIO F, CARGO C, TIPOAVAL T, CENTCUST CC');
    Add('WHERE');

    if (CmpRptCM.ParamByName('ListaTipoAval').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaTipoAval').asString) > 0) then
        Add('  (T.CODTIPOAVAL IN (' +CmpRptCM.ParamByName('ListaTipoAval').asString+ ')) AND')
      else
        Add('  (T.CODTIPOAVAL  = ' +CmpRptCM.ParamByName('ListaTipoAval').asString+ ') AND');

    if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
      Add('  (F.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
    else
      Add('  (F.IDPESSOA  = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');

    Add('  (H.DATAREAL IS NOT NULL) AND');
    Add('  (H.DATAREAL BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+
        ',''DD/MM/YYYY'') AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+
        ',''DD/MM/YYYY'')) AND');

    Add('  (F.IDPESSOA       = PF.IDPESSOA) AND');
    Add('  (F.IDESTAB        = PJ.IDPESSOA) AND');
    Add('  (F.IDCARGO        = C.IDCARGO) AND');
    Add('  (H.CODTIPOAVAL    = T.CODTIPOAVAL) AND');
    Add('  (H.IDPESSOA       = F.IDPESSOA) AND');
    Add('  (F.IDEMPRESA      = CC.IDEMPRESA) AND');
    Add('  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO)');

    if CmpRptCM.ParamByName('IncluiPend').asInteger = 0 then
    begin
      Add('UNION');
      Add('SELECT');
      Add('  PJ.RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO,');
      Add('  F.MATRICULA, T.DESCRTIPOAVAL AS DESCRICAO, T.CODTIPOAVAL,');
      Add('  0 AS AVALIACAO, RTRIM(H.AVALIADOR) AS AVALIADOR,'' PENDENTE'' AS PENDENTE,');
      Add('  0 AS PERCENTUAL,');
      Add('  ' +CmpRptCM.ParamByName('MaxPonto').asString+ ' AS MAXPONTO,');
      Add('  CC.NOME AS CENTROCUSTO, H.DATAPLAN AS DATAREAL, H.DATAPLAN,');
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

      Add('  (H.DATAREAL IS NULL) AND');
      Add('  (H.DATAPLAN IS NOT NULL) AND');
      Add('  (F.IDPESSOA  = PF.IDPESSOA) AND');

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
      Add('  0 AS AVALIACAO, '''' AS AVALIADOR,'' PENDENTE'' AS PENDENTE,');
      Add('  0 AS PERCENTUAL,');
      Add('  ' +CmpRptCM.ParamByName('MaxPonto').asString+ ' AS MAXPONTO,');
      Add('  CC.NOME AS CENTROCUSTO,');

      Add('  ADD_MONTHS(H.DATAPLAN, TRUNC((TO_DATE('+
            QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+
            ',''DD/MM/YYYY'') - H.DATAPLAN + 1)'+
            ' / 365.25 * 12 /G.INTERVALO) * G.INTERVALO) AS DATAREAL,');

      Add('  ADD_MONTHS(H.DATAPLAN, TRUNC((TO_DATE('+
            QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+
            ',''DD/MM/YYYY'') - H.DATAPLAN + 1)'+
            ' / 365.25 * 12 /G.INTERVALO) * G.INTERVALO) AS DATAPLAN,');

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

      Add('  (NOT EXISTS (SELECT IDPESSOA');
      Add('               FROM   HSTAVAL H3');
      Add('               WHERE  (H3.DATAREAL IS NOT NULL) AND');
      Add('                      (H3.DATAREAL BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+
          ',''DD/MM/YYYY'') AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+
          ',''DD/MM/YYYY'')) AND');

      Add('                      (H3.IDPESSOA = F.IDPESSOA) AND');
      Add('                      (H3.CODTIPOAVAL = T.CODTIPOAVAL))) AND');

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
      Add('  0 AS AVALIACAO, '''' AS AVALIADOR,'' PENDENTE'' AS PENDENTE,');
      Add('  0 AS PERCENTUAL,');
      Add('  ' +CmpRptCM.ParamByName('MaxPonto').asString+ ' AS MAXPONTO,');
      Add('  CC.NOME AS CENTROCUSTO, ');

      Add('  ADD_MONTHS(F.DATAADMISSAO, TRUNC((TO_DATE(' +
          QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+
          ',''DD/MM/YYYY'') - F.DATAADMISSAO + 1)'+
          ' / 365.25 * 12 /G.INTERVALO) * G.INTERVALO) AS DATAREAL,');

      Add('  ADD_MONTHS(F.DATAADMISSAO, TRUNC((TO_DATE(' +
          QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+
          ',''DD/MM/YYYY'') - F.DATAADMISSAO + 1)'+
          ' / 365.25 * 12 /G.INTERVALO) * G.INTERVALO) AS DATAPLAN,');

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

      Add('  (F.IDPESSOA    = PF.IDPESSOA) AND');
      Add('  (NOT EXISTS (SELECT IDPESSOA');
      Add('               FROM   HSTAVAL H2');
      Add('               WHERE  (H2.IDPESSOA    = F.IDPESSOA) AND');
      Add('                      (H2.CODTIPOAVAL = T.CODTIPOAVAL))) AND');

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

    end;

    Add('ORDER BY');

    case (CmpRptCM.ParamByName('SeqRelat').asInteger) of
      0 : Add('  5, 2, 13');
    //0 : Add('  DESCRICAO, EMPREGADO, H.DATAREAL');
      1 : Add('  5, 4, 13');
    //1 : Add('  DESCRICAO, F.MATRICULA, H.DATAREAL');
      2 : Add('  5, 12, 2, 13');
    //2 : Add('  DESCRICAO, CENTROCUSTO, EMPREGADO, H.DATAREAL');
      3 : Add('  5, 12, 4, 13');
    //3 : Add('  DESCRICAO, CENTROCUSTO, F.MATRICULA, H.DATAREAL');
    end;

    SaveToFile('c:\qry.txt');
  end;
  sqlAval.Open;
end;

end.
