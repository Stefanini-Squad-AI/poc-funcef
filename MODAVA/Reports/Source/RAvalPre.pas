unit RAvalPre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, uCmRptManager, TXComp, CmParamReport, ppBands, ppCtrls,
  ppPrnabl, ppCache, ppRegion, ppVar, ppStrtch, ppMemo, ppSubRpt, uCtrlGlobalRH;

type
  TrptAvalPre = class(TFrmCmReport)
    rpAvalPre: TppReport;
    ppAvalPre: TppBDEPipeline;
    dsAvalPre: TwwDataSource;
    CdsAvalPre: TCMClientDataSet;
    sqlAvalPre: TCMSqlParams;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    rpFormAvalBrancoLbl1: TppLabel;
    rpFormAvalBrancoLbl2: TppLabel;
    rpFormAvalBrancoCalc1: TppSystemVariable;
    rpFormAvalBrancoCalc2: TppSystemVariable;
    rpAvalPreRegiaoObserv: TppRegion;
    rpAvalPreObservAval: TppMemo;
    ppSummaryBand1: TppSummaryBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppLabel11: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppLabel13: TppLabel;
    ppDBMemo3: TppDBMemo;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppLabel15: TppLabel;
    ppDBMemo5: TppDBMemo;
    ppSubReport4: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppLabel12: TppLabel;
    ppDBMemo2: TppDBMemo;
    ppSubReport5: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppDetailBand6: TppDetailBand;
    ppLabel14: TppLabel;
    ppDBMemo4: TppDBMemo;
    ppSubReport6: TppSubReport;
    ppChildReport6: TppChildReport;
    ppTitleBand6: TppTitleBand;
    ppDetailBand7: TppDetailBand;
    ppLabel16: TppLabel;
    ppDBMemo8: TppDBMemo;
    ppSubReport7: TppSubReport;
    ppChildReport7: TppChildReport;
    ppTitleBand7: TppTitleBand;
    ppDetailBand8: TppDetailBand;
    ppLabel18: TppLabel;
    rpAvalPreComent: TppMemo;
    ppSubReport8: TppSubReport;
    ppChildReport8: TppChildReport;
    ppTitleBand8: TppTitleBand;
    ppDetailBand9: TppDetailBand;
    ppLabel17: TppLabel;
    ppDBMemo6: TppDBMemo;
    rpLblFator: TppLabel;
    rpLblGrau: TppLabel;
    rpLblPeso: TppLabel;
    rpLblNota: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    rpAvalPreRegiaoObservGrupo: TppRegion;
    rpFormAvalPreDBObservGrupo: TppDBMemo;
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppSummaryBand1BeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    FlgFiltraFator: integer;
  end;

var
  rptAvalPre: TrptAvalPre;

implementation

uses uCtrlPadroes, dCds;

{$R *.DFM}

procedure TrptAvalPre.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGFILTRAFATOR');
  FlgFiltraFator := dmCds.Cds.FieldByName('FLGFILTRAFATOR').asInteger;
end;

procedure TrptAvalPre.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  rpAvalPreRegiaoObserv.Visible := (CmpRptCM.ParamByName('ComObserv').asInteger = 0);
  rpAvalPreRegiaoObservGrupo.Visible := (CmpRptCM.ParamByName('ComObserv').asInteger = 0);

  with (sqlAvalPre.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  FA.IDGRUPOFATORAVAL, FA.IDFATORAVAL, G.DESCRICAO, FA.DESCRFATORAVAL,');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO, F.MATRICULA,');
    Add('  CC.NOME AS CENTROCUSTO, H.METAS, H.MEDIDAS, H.RESUMO, H.AVALIADOR, H.FORTES,');
    Add('  H.LIMITACOES, H.DATAREAL, H.FRACOS, H.AVALIACAO, H.OBSERVAVAL,');
    Add('  HD.GRAU, T.DESCRTIPOAVAL, PS.PESO, NVL(HD.GRAU,0) * NVL(PS.PESO,0) AS NOTA,');
    Add('  G.OBSGRUPOFATOR');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, HSTAVAL H, FUNCIONARIO F, CARGO C, CENTCUST CC,');
    Add('  PESOFATGRP PS, FATORAVAL FA, HSTDESEMP HD, GRUPOFATORAVAL G, TIPOAVAL T');
    Add('WHERE');
    Add('  (F.IDPESSOA          = ' +CmpRptCM.ParamByName('IdPessoa').asString+ ') AND');
    Add('  (HD.IDPESSOA         = ' +CmpRptCM.ParamByName('IdPessoa').asString+ ') AND');
    Add('  (HD.CODTIPOAVAL      = ' +CmpRptCM.ParamByName('TipoAval').asString+ ') AND');
    Add('  (HD.NUMSEQ           = ' +CmpRptCM.ParamByName('NumSeq').asString+ ') AND');
    Add('  (H.CODTIPOAVAL       = ' +CmpRptCM.ParamByName('TipoAval').asString+ ') AND');
    Add('  (H.NUMSEQ            = ' +CmpRptCM.ParamByName('NumSeq').asString+ ') AND');
    Add('  (H.DATAREAL     IS NOT NULL) AND');
    Add('  (F.IDPESSOA          = PF.IDPESSOA) AND');
    Add('  (F.IDESTAB           = PJ.IDPESSOA) AND');
    Add('  (F.IDCARGO           = C.IDCARGO) AND');
    Add('  (H.CODTIPOAVAL       = T.CODTIPOAVAL) AND');
    Add('  (H.IDPESSOA          = F.IDPESSOA) AND');
    Add('  (F.IDEMPRESA         = CC.IDEMPRESA) AND');
    Add('  (F.CODCENTROCUSTO    = CC.CODCENTROCUSTO) AND');
    Add('  (HD.IDFATORAVAL      = FA.IDFATORAVAL) AND');
    Add('  (C.CODGRPFUNC        = PS.CODGRPFUNC) AND');
    Add('  (FA.IDFATORAVAL      = PS.IDFATORAVAL) AND');
    if (FlgFiltraFator = 1) then
      Add('  (NVL(PS.PESO,0)      > 0) AND');
    Add('  (FA.IDGRUPOFATORAVAL = G.IDGRUPOFATORAVAL(+))');
    if (FlgFiltraFator = 0) then
    begin
      Add('UNION');
      Add('SELECT');
      Add('  FA.IDGRUPOFATORAVAL, FA.IDFATORAVAL, G.DESCRICAO, FA.DESCRFATORAVAL,');
      Add('  PJ.RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO, F.MATRICULA,');
      Add('  CC.NOME AS CENTROCUSTO, H.METAS, H.MEDIDAS, H.RESUMO, H.AVALIADOR, H.FORTES,');
      Add('  H.LIMITACOES, H.DATAREAL, H.FRACOS, H.AVALIACAO, H.OBSERVAVAL, HD.GRAU,');
      Add('  T.DESCRTIPOAVAL, 0 AS PESO, 0 AS NOTA,');
      Add('  G.OBSGRUPOFATOR');
      Add('FROM');
      Add('  PESSOA PJ, PESSOA PF, HSTAVAL H, FUNCIONARIO F, CARGO C, CENTCUST CC,');
      Add('  FATORAVAL FA, HSTDESEMP HD, GRUPOFATORAVAL G, TIPOAVAL T');
      Add('WHERE');
      Add('  (F.IDPESSOA          = ' +CmpRptCM.ParamByName('IdPessoa').asString+ ') AND');
      Add('  (HD.IDPESSOA         = ' +CmpRptCM.ParamByName('IdPessoa').asString+ ') AND');
      Add('  (HD.CODTIPOAVAL      = ' +CmpRptCM.ParamByName('TipoAval').asString+ ') AND');
      Add('  (HD.NUMSEQ           = ' +CmpRptCM.ParamByName('NumSeq').asString+ ') AND');
      Add('  (H.CODTIPOAVAL       = ' +CmpRptCM.ParamByName('TipoAval').asString+ ') AND');
      Add('  (H.NUMSEQ            = ' +CmpRptCM.ParamByName('NumSeq').asString+ ') AND');
      Add('  (H.DATAREAL     IS NOT NULL) AND');
      Add('  (F.IDPESSOA          = PF.IDPESSOA) AND');
      Add('  (F.IDESTAB           = PJ.IDPESSOA) AND');
      Add('  (F.IDCARGO           = C.IDCARGO) AND');
      Add('  (H.CODTIPOAVAL       = T.CODTIPOAVAL) AND');
      Add('  (H.IDPESSOA          = F.IDPESSOA) AND');
      Add('  (F.IDEMPRESA         = CC.IDEMPRESA) AND');
      Add('  (F.CODCENTROCUSTO    = CC.CODCENTROCUSTO) AND');
      Add('  (HD.IDFATORAVAL      = FA.IDFATORAVAL) AND');
      Add('  (NOT EXISTS (SELECT PS.CODGRPFUNC');
      Add('               FROM   PESOFATGRP PS');
      Add('               WHERE  (C.CODGRPFUNC   = PS.CODGRPFUNC) AND');
      Add('                      (FA.IDFATORAVAL = PS.IDFATORAVAL))) AND');
      Add('  (FA.IDGRUPOFATORAVAL = G.IDGRUPOFATORAVAL(+))');
    end;
    Add('ORDER BY');

    if (CmpRptCM.ParamByName('SeqRelat').asInteger = 0) then
      Add('  1, 2')
    else
      Add('  3, 4');

    SaveToFile('c:\qry.txt');
  end;
  sqlAvalPre.Open;
end;

procedure TrptAvalPre.ppDetailBand1BeforePrint(Sender: TObject);
begin
  with (dmCds.SQL) do
  begin
    Sql.Clear;
    Sql.Add('SELECT OBSFATORAVAL FROM FATORAVAL WHERE IDFATORAVAL = ' +
            CdsAvalPre.FieldByName('IDFATORAVAL').asString);
    Open;
  end;

  rpAvalPreRegiaoObserv.Visible := (CmpRptCM.ParamByName('ComObserv').asInteger = 0) and
    (dmCds.Cds.FieldByName('OBSFATORAVAL').asString <> '');
  rpAvalPreObservAval.Lines.Clear;

  if (dmCds.Cds.FieldByName('OBSFATORAVAL').asString <> '') then
    rpAvalPreObservAval.Lines.Add(dmCds.Cds.FieldByName('OBSFATORAVAL').asString);
end;

procedure TrptAvalPre.ppSummaryBand1BeforePrint(Sender: TObject);
begin
  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  COMENT');
    Add('FROM');
    Add('  HSTAVAL');
    Add('WHERE');
    Add('  (IDPESSOA    = ' +CmpRptCM.ParamByName('IdPessoa').asString+ ') AND');
    Add('  (CODTIPOAVAL = ' +CmpRptCM.ParamByName('TipoAval').asString+ ') AND');
    Add('  (NUMSEQ      = ' +CmpRptCM.ParamByName('NumSeq').asString+ ')');
  end;
  dmCds.sql.Open;

  rpAvalPreComent.Lines.Clear;
  if (dmCds.Cds.FieldByName('COMENT').asString <> '') then
    rpAvalPreComent.Lines.Add(dmCds.Cds.FieldByName('COMENT').asString);
end;

procedure TrptAvalPre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlGlobalRH);
end;

end.
