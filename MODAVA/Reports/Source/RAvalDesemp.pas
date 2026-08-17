unit RAvalDesemp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, ppBands, ppCache, ppClass, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  ppCtrls, ppPrnabl, ppVar, ppStrtch, ppSubRpt, ppRegion, ppMemo;

type
  TRptAvalDesemp = class(TFrmCmReport)
    sqlAvalDesemp: TCMSqlParams;
    CdsAvalDesemp: TCMClientDataSet;
    dsAvalDesemp: TwwDataSource;
    ppAvalDesemp: TppBDEPipeline;
    rpAvalDesemp: TppReport;
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
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBCalc3: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppShape2: TppShape;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    sAno1, sAno2: string;
  end;

var
  RptAvalDesemp: TRptAvalDesemp;

implementation

//uses fAguarde;

{$R *.DFM}

procedure TRptAvalDesemp.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlAvalDesemp.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO, F.MATRICULA,');
    Add('  FA.DESCRFATORAVAL AS DESCRICAO, FA.IDFATORAVAL, NVL(HD.GRAU,0) AS NOTA,');
    Add('  PS.PESO, NVL(HD.GRAU,0) * NVL(PS.PESO,0) AS AVALIACAO,');
    Add('  H.AVALIADOR, ROUND(NVL(HD.GRAU,0) * 100 / '+
      CmpRptCM.ParamByName('MaxPonto').asString+ ',2) AS PERCENTUAL,');
    Add('  ' +CmpRptCM.ParamByName('MaxPonto').asString+ ' AS MAXPONTO,');
    Add('  CC.NOME AS CENTROCUSTO, H.DATAREAL, H.DATAPLAN,');
    Add('  ''Período: '' || ' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+
        ' ||'' a ''|| ' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ' AS PERIODO');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, HSTAVAL H, FUNCIONARIO F, HSTDESEMP HD,');
    Add('  CARGO C, CENTCUST CC, FATORAVAL FA, PESOFATGRP PS');
    Add('WHERE');

    if (CmpRptCM.ParamByName('ListaFatorAval').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaFatorAval').asString) > 0) then
        Add('  (FA.IDFATORAVAL IN (' +CmpRptCM.ParamByName('ListaFatorAval').asString+ ')) AND')
      else
        Add('  (FA.IDFATORAVAL  = ' +CmpRptCM.ParamByName('ListaFatorAval').asString+ ') AND');

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
    Add('  (HD.IDFATORAVAL   = FA.IDFATORAVAL) AND');
    Add('  (H.IDPESSOA       = HD.IDPESSOA) AND');
    Add('  (H.NUMSEQ         = HD.NUMSEQ) AND');
    Add('  (H.CODTIPOAVAL    = HD.CODTIPOAVAL) AND');
    Add('  (H.IDPESSOA       = F.IDPESSOA) AND');
    Add('  (F.IDEMPRESA      = CC.IDEMPRESA) AND');
    Add('  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
    Add('  (C.CODGRPFUNC     = PS.CODGRPFUNC) AND');
    Add('  (HD.IDFATORAVAL   = PS.IDFATORAVAL)');
    Add('ORDER BY');

    case (CmpRptCM.ParamByName('SeqRelat').asInteger) of
      0 : Add('  DESCRICAO, EMPREGADO, H.DATAREAL');
      1 : Add('  DESCRICAO, F.MATRICULA, H.DATAREAL');
      2 : Add('  DESCRICAO, CENTROCUSTO, EMPREGADO, H.DATAREAL');
      3 : Add('  DESCRICAO, CENTROCUSTO, F.MATRICULA, H.DATAREAL');
    end;

    SaveToFile('c:\qry.txt');
  end;
  sqlAvalDesemp.Open;
end;

end.
