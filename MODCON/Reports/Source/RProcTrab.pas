unit RProcTrab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  DBTables, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db,
  Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppMemo, ppModule,
  uCmRptManager, TXComp, CmParamReport, DBClient, uCMClientDataSet, Wwquery, uCmSqlParams,
  uCtrlCustomProcTrab, uCtrlRateioProcTrab, IvDictio, IvMulti, TXRB;

type
  TArrayUnidadeProc = array of record
    ID, Nome: string;
  end;

  TRptProcTrab = class(TFrmCmReport)
    CdsProcesso: TCMClientDataSet;
    sqlProcesso: TCMSqlParams;
    CdsObj: TCMClientDataSet;
    sqlObj: TCMSqlParams;
    rpProcTrab: TppReport;
    rpProcTrabHdrBnd: TppHeaderBand;
    rpProcTrabLbl9: TppLabel;
    rpProcTrabLbl7: TppLabel;
    rpProcTrabLbl1: TppLabel;
    rpProcTrabDBTxt1: TppDBText;
    rpProcTrabLbl4: TppLabel;
    rpProcTrabLbl5: TppLabel;
    rpProcTrabLbl6: TppLabel;
    rpProcTrabLbl8: TppLabel;
    rpProcTrabLbl11: TppLabel;
    rpProcTrabLbl12: TppLabel;
    rpProcTrabLbl13: TppLabel;
    rpProcTrabLbl14: TppLabel;
    rpProcTrabLbl16: TppLabel;
    rpProcTrabLbl15: TppLabel;
    rpProcTrabLbl3: TppLabel;
    rpProcTrabLbl2: TppLabel;
    rpProcTrabSysVar1: TppSystemVariable;
    rpProcTrabSysVar2: TppSystemVariable;
    rpProcTrabLbl17: TppLabel;
    rpProcTrabLbl19: TppLabel;
    rpProcTrabLbl18: TppLabel;
    rpProcTrabLbl20: TppLabel;
    rpProcTrabLbl21: TppLabel;
    rpProcTrabDtlBnd: TppDetailBand;
    rpProcTrabFootBnd: TppFooterBand;
    rpProcTrabSmryBnd: TppSummaryBand;
    rpProcTrabGrp0: TppGroup;
    rpProcTrabGrpHdrBnd0: TppGroupHeaderBand;
    rpProcTrabGrpFootBnd0: TppGroupFooterBand;
    rpProcTrabLbl22: TppLabel;
    rpProcTrabDBCalc1: TppDBCalc;
    rpProcTrabLbl23: TppLabel;
    rpProcTrabDBCalc2: TppDBCalc;
    rpProcTrabDBCalc3: TppDBCalc;
    rpProcTrabDBCalc4: TppDBCalc;
    rpProcTrabDBCalc5: TppDBCalc;
    rpProcTrabDBCalc6: TppDBCalc;
    rpProcTrabGrp1: TppGroup;
    rpProcTrabGrpHdrBnd1: TppGroupHeaderBand;
    rpProcTrabShape1: TppShape;
    rpProcTrabDBTxt2: TppDBText;
    rpProcTrabDBTxt3: TppDBText;
    rpProcTrabDBTxt4: TppDBText;
    rpProcTrabDBTxt5: TppDBText;
    rpProcTrabDBTxt6: TppDBText;
    rpProcTrabDBTxt7: TppDBText;
    rpProcTrabDBTxt9: TppDBText;
    rpProcTrabDBTxt10: TppDBText;
    rpProcTrabDBTxt11: TppDBText;
    rpProcTrabDBTxtCARGO: TppDBText;
    rpProcTrabDBTxt12: TppDBText;
    rpProcTrabDBTxt13: TppDBText;
    rpProcTrabDBTxt14: TppDBText;
    rpProcTrabDBTxt15: TppDBText;
    rpProcTrabGrpFootBnd2: TppGroupFooterBand;
    rpProcTrabGrp2: TppGroup;
    rpProcTrabGrpHdrBnd2: TppGroupHeaderBand;
    rpProcTrabLbl24: TppLabel;
    rpProcTrabDBTxt16: TppDBText;
    rpProcTrabDBTxt17: TppDBText;
    rpProcTrabDBTxt18: TppDBText;
    rpProcTrabDBTxt19: TppDBText;
    rpProcTrabGrpFootBnd1: TppGroupFooterBand;
    rpProcTrabSubRep1: TppSubReport;
    rpProcTrabChildRep1: TppChildReport;
    rpProcTrabSubRep1TitBnd: TppTitleBand;
    rpProcTrabSubRep1Lbl1: TppLabel;
    rpProcTrabSubRep1Lbl2: TppLabel;
    ppLabel1: TppLabel;
    rpProcTrabSubRep1DtlBnd: TppDetailBand;
    rpProcTrabSubRep1DBTxt1: TppDBText;
    rpProcTrabSubRep1DBTxt2: TppDBText;
    ppDBText1: TppDBText;
    rpProcTrabSubRep1SmryBnd1: TppSummaryBand;
    ppProcTrab: TppBDEPipeline;
    ppProcTrabppField1: TppField;
    ppProcTrabppField2: TppField;
    ppProcTrabppField3: TppField;
    ppProcTrabppField4: TppField;
    ppProcTrabppField5: TppField;
    ppProcTrabppField6: TppField;
    ppProcTrabppField7: TppField;
    ppProcTrabppField8: TppField;
    ppProcTrabppField9: TppField;
    ppProcTrabppField10: TppField;
    ppProcTrabppField11: TppField;
    ppProcTrabppField12: TppField;
    ppProcTrabppField13: TppField;
    ppProcTrabppField14: TppField;
    ppProcTrabppField15: TppField;
    ppProcTrabppField16: TppField;
    ppProcTrabppField17: TppField;
    ppProcTrabppField18: TppField;
    ppProcTrabppField19: TppField;
    ppProcTrabppField20: TppField;
    ppProcTrabppField21: TppField;
    ppProcTrabppField22: TppField;
    ppProcTrabppField23: TppField;
    ppProcTrabppField24: TppField;
    ppProcTrabppField25: TppField;
    ppProcTrabppField26: TppField;
    ppProcTrabppField27: TppField;
    dsProcTrab: TwwDataSource;
    qryProcTrab: TwwQuery;
    ppProcTrab1: TppBDEPipeline;
    ppProcTrab1ppField1: TppField;
    ppProcTrab1ppField2: TppField;
    ppProcTrab1ppField3: TppField;
    dsProcTrab1: TwwDataSource;
    qryProcTrab1: TwwQuery;
    qryProcTrab1Aux: TwwQuery;
    updProcTrab: TUpdateSQL;
    ppProcTrab2: TppBDEPipeline;
    dsProcTrab2: TwwDataSource;
    qryProcTrab2: TwwQuery;
    rpProcTrabSubRep2: TppSubReport;
    rpProcTrabChildRep2: TppChildReport;
    rpProcTrabSubRep2TitBnd: TppTitleBand;
    rpProcTrabSubRep2Lbl1: TppLabel;
    rpProcTrabSubRep2Lbl2: TppLabel;
    rpProcTrabSubRep2DtlBnd: TppDetailBand;
    rpProcTrabSubRep2DBTxt1: TppDBText;
    rpProcTrabSubRep2DBTxt2: TppDBText;
    rpProcTrabSubRep2DBMemo1: TppDBMemo;
    rpProcTrabSubRep2SmryBnd: TppSummaryBand;
    ppProcTrab3: TppBDEPipeline;
    dsProcTrab3: TwwDataSource;
    qryProcTrab3: TwwQuery;
    rpProcTrabSubRep3: TppSubReport;
    rpProcTrabChildRep3: TppChildReport;
    rpProcTrabSubRep3TitBnd: TppTitleBand;
    rpProcTrabSubRep3Lbl1: TppLabel;
    rpProcTrabSubRep3DtlBnd: TppDetailBand;
    rpProcTrabSubRep3DBTxt1: TppDBText;
    rpProcTrabSubRep3LblRiscoMax: TppLabel;
    rpProcTrabSubRep3LblRiscoProv: TppLabel;
    rpProcTrabSubRep3LblValorReal: TppLabel;
    rpProcTrabSubRep3LblEconomia1: TppLabel;
    rpProcTrabSubRep3LblEconomia2: TppLabel;
    rpProcTrabSubRep3SmryBnd: TppSummaryBand;
    ppProcTrab4: TppBDEPipeline;
    ppProcTrab4ppField1: TppField;
    ppProcTrab4ppField2: TppField;
    ppProcTrab4ppField3: TppField;
    ppProcTrab4ppField4: TppField;
    ppProcTrab4ppField5: TppField;
    ppProcTrab4ppField6: TppField;
    ppProcTrab4ppField7: TppField;
    ppProcTrab4ppField8: TppField;
    ppProcTrab4ppField9: TppField;
    dsProcTrab4: TwwDataSource;
    qryProcTrab4: TwwQuery;
    updProcTrab4: TUpdateSQL;
    ppProcTrab5: TppBDEPipeline;
    ppProcTrab5ppField1: TppField;
    ppProcTrab5ppField2: TppField;
    ppProcTrab5ppField3: TppField;
    ppProcTrab5ppField4: TppField;
    ppProcTrab5ppField5: TppField;
    ppProcTrab5ppField6: TppField;
    ppProcTrab5ppField7: TppField;
    dsProcTrab5: TwwDataSource;
    qryProcTrab5: TwwQuery;
    updProcTrab5: TUpdateSQL;
    rpProcTrabSubRepRateio: TppSubReport;
    rpProcTrabChildRepRateio: TppChildReport;
    rpProcTrabSubRepRateioTitBnd1: TppTitleBand;
    rpProcTrabSubRepRateioLbl1: TppLabel;
    rpProcTrabSubRepRateioDtlBnd1: TppDetailBand;
    rpProcTrabSubRepRateioDBTxt1: TppDBText;
    rpProcTrabSubRepRateioDBTxt2: TppDBText;
    rpProcTrabSubRepRateioDBTxt3: TppDBText;
    rpProcTrabSubRepRateioDBTxt4: TppDBText;
    rpProcTrabSubRep4: TppSubReport;
    rpProcTrabChildRep4: TppChildReport;
    rpProcTrabSubRep4TitBnd: TppTitleBand;
    rpProcTrabSubRep4Shape1: TppShape;
    rpProcTrabSubRep4Lbl1: TppLabel;
    rpProcTrabSubRep4DBTxt1: TppDBText;
    rpProcTrabSubRep4Lbl2: TppLabel;
    rpProcTrabSubRep4Lbl3: TppLabel;
    rpProcTrabSubRep4SysVar1: TppSystemVariable;
    rpProcTrabSubRep4SysVar2: TppSystemVariable;
    rpProcTrabSubRep4Lbl6: TppLabel;
    rpProcTrabSubRep4Lbl4: TppLabel;
    rpProcTrabSubRep4Lbl5: TppLabel;
    rpProcTrabSubRep4Lbl7: TppLabel;
    rpProcTrabSubRep4Lbl8: TppLabel;
    rpProcTrabSubRep4Lbl9: TppLabel;
    rpProcTrabSubRep4Lbl10: TppLabel;
    rpProcTrabSubRep4Lbl11: TppLabel;
    rpProcTrabSubRep4Line1: TppLine;
    rpProcTrabSubRep4Line4: TppLine;
    rpProcTrabSubRep4Line2: TppLine;
    rpProcTrabSubRep4Line3: TppLine;
    rpProcTrabSubRep4DtlBnd: TppDetailBand;
    rpProcTrabSubRep4ShapeShape2: TppShape;
    rpProcTrabSubRep4DBTxt2: TppDBText;
    rpProcTrabSubRep4DBTxt4: TppDBText;
    rpProcTrabSubRep4DBTxt3: TppDBText;
    rpProcTrabSubRep4DBTxt5: TppDBText;
    rpProcTrabSubRep4DBTxt6: TppDBText;
    rpProcTrabSubRep4Line5: TppLine;
    rpProcTrabSubRep4Line6: TppLine;
    rpProcTrabSubRep4Line7: TppLine;
    rpProcTrabSubRep4Line8: TppLine;
    rpProcTrabSubRep4DBTxt7: TppDBText;
    rpProcTrabSubRep4DBTxt8: TppDBText;
    rpProcTrabSubRep4Grp1: TppGroup;
    rpProcTrabSubRep4GrpHdrBnd: TppGroupHeaderBand;
    rpProcTrabSubRep4GrpFootBnd: TppGroupFooterBand;
    rpProcTrabSubRep4Shape3: TppShape;
    rpProcTrabSubRep4Lbl12: TppLabel;
    rpProcTrabSubRep4DBCalc1: TppDBCalc;
    rpProcTrabSubRep4DBCalc2: TppDBCalc;
    rpProcTrabSubRep4DBCalc3: TppDBCalc;
    rpProcTrabSubRep4DBCalc4: TppDBCalc;
    rpProcTrabSubRep4DBCalc5: TppDBCalc;
    rpProcTrabSubRep4DBCalc6: TppDBCalc;
    rpProcTrabSubRep4Line9: TppLine;
    rpProcTrabSubRep4Line10: TppLine;
    rpProcTrabSubRep4Line11: TppLine;
    rpProcTrabSubRep4Line12: TppLine;
    CdsRateio: TCMClientDataSet;
    sqlRateio: TCMSqlParams;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    rpProcJudSubRep2Valor: TppDBText;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    rpProcJudSubRep2Lbl3: TppLabel;
    rpProcJudSubRep2DBTxt3: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rpProcTrabSmryBndAfterPrint(Sender: TObject);
    procedure rpProcTrabSubRep1TitBndBeforePrint(Sender: TObject);
    procedure rpProcTrabGrpHdrBnd1BeforePrint(Sender: TObject);
    procedure rpProcTrabGrpHdrBnd2BeforePrint(Sender: TObject);
    procedure rpProcTrabGrpFootBnd0BeforePrint(Sender: TObject);
    procedure rpProcTrabSubRepRateioDtlBnd1BeforePrint(Sender: TObject);
    procedure rpProcTrabBeforePrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsProcTrabAfterScroll(DataSet: TDataSet);
    procedure qryProcTrab1AfterOpen(DataSet: TDataSet);
    procedure rpProcTrabSubRep2TitBndBeforePrint(Sender: TObject);
    procedure rpProcTrabSubRep3DtlBndBeforePrint(Sender: TObject);
    procedure rpProcTrabSubRep3TitBndBeforePrint(Sender: TObject);
  private
    CtrlCustomProcTrab: TCtrlCustomProcTrab;
    CtrlRateioProcTrab: TCtrlRateioProcTrab;

    bImprimeEconomiaRateio: boolean;
    UnidadeProc: TArrayUnidadeProc;

    procedure HabilitarImpressaoRelat;
    procedure GerarDadosRelat;
    procedure ConfigImpressaoRelat;
    //procedure SelDadosParticipantes(NumProcTrab: string);
    procedure GerarListaUnidadeProc;
    procedure GerarValoresProcTrab;
    procedure InitRateio;
    procedure GerarRateio;
    procedure GerarValoresResumoProcTrab;
  end;

var
  RptProcTrab: TRptProcTrab;

implementation

uses ppTypes, uSistema, uCtrlPadroes, fAguarde, uCtrlFuncoesRH, dCds;

const
  TIPO_SIT_PROC: array[0..1] of string[3] = ('Abr', 'Enc');

{$R *.DFM}

procedure TRptProcTrab.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRateioProcTrab := TCtrlRateioProcTrab.Create;
  CtrlRateioProcTrab.InitializeAs(Padroes);
end;

procedure TRptProcTrab.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlRateioProcTrab);
  inherited;
end;

procedure TRptProcTrab.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  CtrlCustomProcTrab := TCtrlCustomProcTrab.Create(Sistema.IdEmpresa, Sistema.TipoEmpresa);
  CtrlCustomProcTrab.InitializeAs(Padroes);

  frmAguarde.Update;
  qryProcTrab.AfterScroll := nil;

  HabilitarImpressaoRelat;
  GerarDadosRelat;
  ConfigImpressaoRelat;

  qryProcTrab.First;
  qryProcTrab.AfterScroll := CdsProcTrabAfterScroll;
  
  FreeAndNil(CtrlCustomProcTrab);
end;

procedure TRptProcTrab.CdsProcTrabAfterScroll(DataSet: TDataSet);
begin
//  SelDadosParticipantes(CdsProcTrab.FieldByName('NUMPROCTRAB').asString);
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptProcTrab.qryProcTrab1AfterOpen(DataSet: TDataSet);
begin
  if (qryProcTrab1.IsEmpty) then
  begin
    qryProcTrab1Aux.Open;
    dsProcTrab1.DataSet := qryProcTrab1Aux;
  end
  else
    dsProcTrab1.DataSet := qryProcTrab1;
end;

procedure TRptProcTrab.rpProcTrabBeforePrint(Sender: TObject);
begin
  bImprimeEconomiaRateio := false;
end;

procedure TRptProcTrab.rpProcTrabGrpHdrBnd2BeforePrint(Sender: TObject);
begin
  rpProcTrabDBTxt19.Visible := (qryProcTrab.FieldByName('SITUACAO').asString = 'Enc');
  rpProcTrabGrpHdrBnd2.Visible :=
    (qryProcTrab.FieldByName('RISCOMAXIMO_RATEIO').asFloat <> 0) or
    (qryProcTrab.FieldByName('RISCOPROVAVEL_RATEIO').asFloat <> 0) or
    (qryProcTrab.FieldByName('VALORREAL_RATEIO').asFloat <> 0);
end;

procedure TRptProcTrab.rpProcTrabGrpHdrBnd1BeforePrint(Sender: TObject);
begin
  if (qryProcTrab.FieldByName('SITUACAO').asString = 'Enc') then
    bImprimeEconomiaRateio := true;

  rpProcTrabDBTxt13.Visible := (qryProcTrab.FieldByName('SITUACAO').asString = 'Enc');
  rpProcTrabDBTxt14.Visible := (qryProcTrab.FieldByName('SITUACAO').asString = 'Enc');
  rpProcTrabDBTxt15.Visible := (qryProcTrab.FieldByName('SITUACAO').asString = 'Enc');

  if (CmpRptCM.ParamByName('ImprimirCargo').asBoolean) and
     (Trim(qryProcTrab.FieldByName('CARGO').asString) <> '') then
  begin
    rpProcTrabGrpHdrBnd1.Height := 10.054;
    rpProcTrabDBTxtCARGO.Top := 5.821;
    rpProcTrabDBTxtCARGO.Visible := true;
  end
  else
  begin
    rpProcTrabGrpHdrBnd1.Height := 5.556;
    rpProcTrabGrpHdrBnd0.Height := 5.027;
    rpProcTrabDBTxtCARGO.Visible := false;
  end;
end;

procedure TRptProcTrab.rpProcTrabSubRep1TitBndBeforePrint(Sender: TObject);
begin
  TppBand(Sender).Visible := not(dsProcTrab1.Dataset.IsEmpty) and
    (dsProcTrab1.Dataset.FieldByName('LITISCONSORTE').asString <> 'Indefinido');
end;

procedure TRptProcTrab.rpProcTrabSubRep2TitBndBeforePrint(Sender: TObject);
begin
  rpProcTrabSubRep2TitBnd.Visible := (rpProcTrabSubRep2.Visible) and not(qryProcTrab2.IsEmpty);
  rpProcTrabSubRep2DtlBnd.Visible := (rpProcTrabSubRep2.Visible) and not(qryProcTrab2.IsEmpty);
  rpProcTrabSubRep2SmryBnd.Visible := (rpProcTrabSubRep2.Visible) and not(qryProcTrab2.IsEmpty);

  rpProcTrabSubRep2DBMemo1.Visible := CmpRptCM.ParamByName('ImprimirObsEtapa').asBoolean;
  if (CmpRptCM.ParamByName('ImprimirObsEtapa').asBoolean) then
  begin
    rpProcTrabSubRep2DBMemo1.Left := 37.306;
    rpProcTrabSubRep2DBMemo1.Top := 3.704;
  end;
end;

procedure TRptProcTrab.rpProcTrabSubRep3TitBndBeforePrint(Sender: TObject);
begin
  rpProcTrabSubRep3TitBnd.Visible := (rpProcTrabSubRep3.Visible) and not(qryProcTrab3.IsEmpty);
  rpProcTrabSubRep3DtlBnd.Visible := (rpProcTrabSubRep3.Visible) and not(qryProcTrab3.IsEmpty);
  rpProcTrabSubRep3SmryBnd.Visible := (rpProcTrabSubRep3.Visible) and not(qryProcTrab3.IsEmpty);
end;

procedure TRptProcTrab.rpProcTrabSubRep3DtlBndBeforePrint(Sender: TObject);
var
  rValTemp1, rValTemp2, rValTemp3: real;
begin
  if (CmpRptCM.ParamByName('ImprimirObj').asBoolean) and not(qryProcTrab3.IsEmpty) then
  begin
    rValTemp1 := CtrlCustomProcTrab.GetValorAtual(
      qryProcTrab3.FieldByName('VALORRECL').asFloat,
      FU.IFF(CtrlCustomProcTrab.GetDataHist(qryProcTrab.FieldByName('DATADESLIGAMENTO')) > 0,
             CtrlCustomProcTrab.GetDataHist(qryProcTrab.FieldByName('DATADESLIGAMENTO')),
             CtrlCustomProcTrab.GetDataHist(qryProcTrab.FieldByName('DATANOTIF'))),
      qryProcTrab.FieldByName('MOEDAPROCTRAB').asInteger,
      qryProcTrab.FieldByName('IDREGRA').asFloat,
      qryProcTrab.FieldByName('NUMPROCTRAB').asFloat,
      qryProcTrab.FieldByName('INDTAXACONV').asInteger);
    rValTemp2 := rValTemp1 * qryProcTrab3.FieldByName('PERCPROB').asFloat / 100;

    if (CmpRptCM.ParamByName('ExibirRelatRiscoMax').asBoolean) then
      rpProcTrabSubRep3LblRiscoMax.Caption := FormatFloat('###,###,##0',rValTemp1)
    else
      rpProcTrabSubRep3LblRiscoMax.Caption := FormatFloat('###,###,##0',rValTemp1 *
        qryProcTrab3.FieldByName('PERCORIG').asFloat / 100);

    rpProcTrabSubRep3LblRiscoProv.Caption := FormatFloat('###,###,##0',rValTemp2);

    if (qryProcTrab.FieldByName('FLGSITPROC').asInteger = 1) then
    begin
      rValTemp3 := CtrlCustomProcTrab.GetValorAtual(
        qryProcTrab3.FieldByName('VALORSENTENCA').asFloat,
        CtrlCustomProcTrab.GetDataHist(qryProcTrab.FieldByName('DATAEFETENC')),
        qryProcTrab.FieldByName('MOEDAPROCTRAB').asInteger,
        qryProcTrab.FieldByName('IDREGRA').asFloat,
        qryProcTrab.FieldByName('NUMPROCTRAB').asFloat,
        qryProcTrab.FieldByName('INDTAXACONV').asInteger);

      rpProcTrabSubRep3LblValorReal.Caption := FormatFloat('###,###,##0',rValTemp3);
      rpProcTrabSubRep3LblEconomia1.Caption := FormatFloat('###,###,##0',rValTemp1 - rValTemp3);
      rpProcTrabSubRep3LblEconomia2.Caption := FormatFloat('###,###,##0',rValTemp2 - rValTemp3);
    end;
  end;
end;

procedure TRptProcTrab.rpProcTrabGrpFootBnd0BeforePrint(Sender: TObject);
begin
  rpProcTrabDBCalc4.Visible := bImprimeEconomiaRateio;
  rpProcTrabDBCalc5.Visible := bImprimeEconomiaRateio;
  rpProcTrabDBCalc6.Visible := bImprimeEconomiaRateio;
end;

procedure TRptProcTrab.rpProcTrabSubRepRateioDtlBnd1BeforePrint(Sender: TObject);
begin
  rpProcTrabSubRepRateioDBTxt4.Visible := bImprimeEconomiaRateio;
end;

procedure TRptProcTrab.rpProcTrabSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TRptProcTrab.HabilitarImpressaoRelat;
begin
  // Habilitar impressão dos Litisconsortes
  rpProcTrabSubRep1.Visible := (CmpRptCM.ParamByName('ImprimirLitis').asInteger < 2);
  if (rpProcTrabSubRep1.Visible) then
  begin
    rpProcTrabSubRep1.DataPipeline := ppProcTrab1;
    rpProcTrabSubRep1Lbl2.Visible := (CmpRptCM.ParamByName('ImprimirLitis').asInteger = 0);
    rpProcTrabSubRep1DBTxt2.Visible := (CmpRptCM.ParamByName('ImprimirLitis').asInteger = 0);
  end
  else
    rpProcTrabSubRep1.DataPipeline := nil;

  // Habilitar impressão das Etapas
  rpProcTrabSubRep2.Visible := CmpRptCM.ParamByName('ImprimirEtapa').asBoolean;
  if (rpProcTrabSubRep2.Visible) then
  begin
    rpProcTrabSubRep2.DataPipeline := ppProcTrab2;
    qryProcTrab2.SQL[9] := '';
  end
  else
    rpProcTrabSubRep2.DataPipeline := nil;

  if (CmpRptCM.ParamByName('ImprimirEtapaSel').asBoolean) and
     (Trim(CmpRptCM.ParamByName('ListaCodEtapa').asString) <> '') then
    qryProcTrab2.SQL[9] := '  (E.CODTIPORECURSO ' +CmpRptCM.ParamByName('ListaCodEtapa').asString+ ') AND';

  if not(rpProcTrabSubRep2.Visible) or
    ((CmpRptCM.ParamByName('ImprimirEtapaSel').asBoolean) and
     (Trim(CmpRptCM.ParamByName('ListaCodEtapa').asString) = '')) then
    qryProcTrab2.SQL[9] := '  (1 = 2) AND'; // Não deve ser mostrado

  // Habilitar impressão dos Objetos
  rpProcTrabSubRep3.Visible := CmpRptCM.ParamByName('ImprimirObj').asBoolean;
  if (rpProcTrabSubRep3.Visible) then
  begin
    rpProcTrabSubRep3.DataPipeline := ppProcTrab3;
    qryProcTrab3.SQL[8] := '';
  end
  else
    rpProcTrabSubRep3.DataPipeline := nil;

  if (CmpRptCM.ParamByName('ImprimirObjSel').asBoolean) and
     (Trim(CmpRptCM.ParamByName('ListaCodObjeto').asString) <> '') then
    qryProcTrab3.SQL[8] := '  (O.CODTIPOOBJETO ' +CmpRptCM.ParamByName('ListaCodObjeto').asString+ ') AND';

  if not(rpProcTrabSubRep3.Visible) or
     ((CmpRptCM.ParamByName('ImprimirObjSel').asBoolean) and
      (Trim(CmpRptCM.ParamByName('ListaCodObjeto').asString) = '')) then
    qryProcTrab3.SQL[8] := '  (1 = 2) AND'; // Não deve ser mostrado

  // Habilitar impressão de Rateios
  rpProcTrabSubRepRateio.Visible := CmpRptCM.ParamByName('ImprimirRateio').asBoolean;
  if (rpProcTrabSubRepRateio.Visible) then
    rpProcTrabSubRepRateio.DataPipeline := ppProcTrab5
  else
    rpProcTrabSubRepRateio.DataPipeline := nil;

  InitRateio;

  // Habilitar impressão do Resumo
  rpProcTrabSubRep4.Visible := CmpRptCM.ParamByName('ImprimirResumo').asBoolean;
  if (rpProcTrabSubRep4.Visible) then
  begin
    if not(qryProcTrab4.IsEmpty) then
      qryProcTrab4.CancelUpdates;
    qryProcTrab4.Close;
    qryProcTrab4.Open;
    rpProcTrabSubRep4.DataPipeline := ppProcTrab4;
  end
  else
    rpProcTrabSubRep4.DataPipeline := nil;
end;

procedure TRptProcTrab.GerarDadosRelat;
var
  c: integer;
begin
  frmAguarde.Update;
  sqlProcesso.SQL.Text := CmpRptCM.ParamByName('SQL').asString;
  sqlProcesso.Open;
  frmAguarde.Update;

  if not(qryProcTrab.IsEmpty) then
    qryProcTrab.CancelUpdates;
  qryProcTrab.Open;
  if not(CdsProcesso.IsEmpty) then
  begin
    frmAguarde.Min := 0;
    frmAguarde.Max := CdsProcesso.RecordCount;

    GerarListaUnidadeProc;

    CdsProcesso.First;
    repeat
      qryProcTrab.Insert;
      qryProcTrab.FieldByName('EMPRESA').asString := Sistema.NomeEmpresa;
      qryProcTrab.FieldByName('JCJ').asString := CdsProcesso.FieldByName('JCJ').asString;
      qryProcTrab.FieldByName('NUMPROCTRAB').asString := CdsProcesso.FieldByName('NUMPROCTRAB').asString;
      qryProcTrab.FieldByName('NUMPROC').asString := CdsProcesso.FieldByName('NUMPROCTRAB').asString;

      if (CmpRptCM.ParamByName('ImprimirNumProcVara').asBoolean) then
        qryProcTrab.FieldByName('PROCJCJNUM').asString := CdsProcesso.FieldByName('PROCJCJNUM').asString
      else
        qryProcTrab.FieldByName('PROCJCJNUM').asString := CdsProcesso.FieldByName('NUMPROCTRAB').asString;

      qryProcTrab.FieldByName('RECLAMANTE').asString := CdsProcesso.FieldByName('NOME').asString;
      qryProcTrab.FieldByName('DATANOTIF').asString := CdsProcesso.FieldByName('DATANOTIF').asString;
      qryProcTrab.FieldByName('MOEDAPROCTRAB').asInteger := CdsProcesso.FieldByName('MOEDAPROCTRAB').asInteger;
      qryProcTrab.FieldByName('IDREGRA').asString := CdsProcesso.FieldByName('IDREGRA').asString;
      qryProcTrab.FieldByName('INDTAXACONV').asString := CdsProcesso.FieldByName('INDTAXACONV').asString;
      qryProcTrab.FieldByName('DATAEFETENC').asString := CdsProcesso.FieldByName('DATAEFETENC').asString;
      qryProcTrab.FieldByName('FLGSITPROC').asString := CdsProcesso.FieldByName('FLGSITPROC').asString;

      if (High(UnidadeProc)+1 > 0) then
        for c:=0 to High(UnidadeProc) do
          if (CdsProcesso.FieldByName('IDESTAB').asString = UnidadeProc[c].ID) then
          begin
            qryProcTrab.FieldByName('UNIDADE').asString := UnidadeProc[c].Nome;
            break;
          end;

      if (CdsProcesso.Fields.FindField('DATAADMISSAO') <> nil) then
        qryProcTrab.FieldByName('DATAADMISSAO').asString := CdsProcesso.FieldByName('DATAADMISSAO').asString;
      if (CdsProcesso.Fields.FindField('DATADESLIGAMENTO') <> nil) then
        qryProcTrab.FieldByName('DATADESLIGAMENTO').asString := CdsProcesso.FieldByName('DATADESLIGAMENTO').asString;
      if (CdsProcesso.Fields.FindField('TITULO') <> nil) then
        qryProcTrab.FieldByName('CARGO').asString := CdsProcesso.FieldByName('TITULO').asString;

      qryProcTrab.FieldByName('SITUACAO').asString := TIPO_SIT_PROC[CdsProcesso.FieldByName('FLGSITPROC').asInteger];

      GerarValoresProcTrab;

      if (CmpRptCM.ParamByName('ImprimirResumo').asBoolean) then
        GerarValoresResumoProcTrab;
        
      if (CmpRptCM.ParamByName('ImprimirRateio').asBoolean) then
        GerarRateio;

      qryProcTrab.Post;
      CdsProcesso.Next;
    until (CdsProcesso.EOF);

    if (CmpRptCM.ParamByName('ImprimirResumo').asBoolean) then
      qryProcTrab4.Post;

    SetLength(UnidadeProc,0);
  end
  else
  begin
    rpProcTrabDBCalc1.Visible := false;
    qryProcTrab.Insert;
    qryProcTrab.Post;
  end;
end;

procedure TRptProcTrab.ConfigImpressaoRelat;
begin
  // Título do Relatório
  rpProcTrabLbl1.Caption := CmpRptCM.ParamByName('TituloRelatorio').asString;

  rpProcTrabLbl14.Caption :=
    FU.IFF(CmpRptCM.ParamByName('ExibirRelatRiscoMax').asBoolean,'Máximo', 'Original');
  rpProcTrabSubRep4Lbl6.Caption :=
    FU.IFF(CmpRptCM.ParamByName('ExibirRelatRiscoMax').asBoolean, 'Risco Máximo', 'Risco Original');
  rpProcTrabSubRep4Lbl10.Caption :=
    FU.IFF(CmpRptCM.ParamByName('ExibirRelatRiscoMax').asBoolean, 'Sobre Máximo', 'Sobre Original');

  rpProcTrabShape1.Visible :=
    (CmpRptCM.ParamByName('ImprimirLitis').asInteger < 2) or
    (CmpRptCM.ParamByName('ImprimirEtapa').asBoolean) or
    (CmpRptCM.ParamByName('ImprimirObj').asBoolean);
  rpProcTrabLbl17.Visible := CmpRptCM.ParamByName('ImprimirSomenteProcAbertos').asBoolean;
  rpProcTrabLbl18.Visible := CmpRptCM.ParamByName('ImprimirSomenteProcAbertos').asBoolean;
  rpProcTrabLbl19.Visible := CmpRptCM.ParamByName('ImprimirSomenteProcAbertos').asBoolean;
  rpProcTrabLbl20.Visible := CmpRptCM.ParamByName('ImprimirSomenteProcAbertos').asBoolean;
  rpProcTrabLbl21.Visible := CmpRptCM.ParamByName('ImprimirSomenteProcAbertos').asBoolean;
  rpProcTrabHdrBnd.Visible := CmpRptCM.ParamByName('ImprimirCabRod').asBoolean;
  rpProcTrabGrpFootBnd0.Visible := CmpRptCM.ParamByName('ImprimirCabRod').asBoolean;
  rpProcTrabGrpHdrBnd2.Visible := CmpRptCM.ParamByName('ImprimirRateio').asBoolean;

  rpProcTrabDBTxt1.Width := rpProcTrab.PrinterSetup.PaperWidth -
    (rpProcTrab.PrinterSetup.MarginLeft * 2) - (rpProcTrabDBTxt1.Left * 2);
  rpProcTrabLbl1.Width := rpProcTrabDBTxt1.Width;
  rpProcTrabShape1.Width := rpProcTrab.PrinterSetup.PaperWidth -
    (rpProcTrab.PrinterSetup.MarginLeft * 2) - (rpProcTrabShape1.Left * 2);
end;

{procedure TRptProcTrab.SelDadosParticipantes(NumProcTrab: string);
begin
  if (CmpRptCM.ParamByName('ImprimirLitis').asInteger < 2) and (NumProcTrab <> '') then
  begin
    with (qryProcTrab1.SQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  DECODE(P.TIPO,''F'', P.NOME, P.RAZAOSOCIAL) AS LITISCONSORTE,');
      Add('  DECODE(NVL(C.INDTESTEMUNHA,0),0,''Listisconsorte'',1,');
      Add('    ''Testemunha C.Parte'',''Nossa Testemunha'') AS CATEGORIA,');
      Add('  DECODE(C.IDMOTIVO,NULL,''Normal'', M.DESCRICAO) AS SITUACAO');
      Add('FROM');
      Add('  PESSOA P, COPARTPROCTRAB C, MOTIVO M');
      Add('WHERE');
      Add('  (C.NUMPROCTRAB = ' +NumProcTrab+ ') AND');
      Add('  (C.IDPESSOA    = P.IDPESSOA) AND');
      Add('  (C.IDMOTIVO    = M.IDMOTIVO(+))');
      Add('ORDER BY');
      Add('  LITISCONSORTE');
    end;
    qryProcTrab1.Open;
  end;

  if (qryProcTrab1.IsEmpty) or (NumProcTrab = '') or
     not(CmpRptCM.ParamByName('ImprimirLitis').asInteger < 2) then
  begin
    with (qryProcTrab1.sql) do
    begin
      Clear;
      Add('SELECT');
      Add('  ''Indefinido'' AS LITISCONSORTE,');
      Add('  ''Indefinida'' AS CATEGORIA,');
      Add('  ''Indefinida'' AS SITUACAO');
      Add('FROM');
      Add('  DUAL');
      if not(CmpRptCM.ParamByName('ImprimirLitis').asInteger < 2) then
      begin
        Add('WHERE');
        Add('  (1 = 2)');
      end;
    end;
    qryProcTrab1.Open;
  end;
end;}

procedure TRptProcTrab.GerarListaUnidadeProc;
var
  c: byte;
  sListaUnidade: string;
begin
  sListaUnidade := '';
  while not(CdsProcesso.EOF) do
  begin
    if (sListaUnidade = '') then
      sListaUnidade := CdsProcesso.FieldByName('IDESTAB').asString
    else
    if (FU.VerificaCodigoEm(sListaUnidade,CdsProcesso.FieldByName('IDESTAB').asString,',') = 0) then
      sListaUnidade := sListaUnidade +','+ CdsProcesso.FieldByName('IDESTAB').asString;

    CdsProcesso.Next;
  end;

  if (sListaUnidade <> '') then
  begin
    with (dmCds.sql.SQL) do
    begin
      Clear;
      Add('SELECT IDPESSOA, NOME');
      Add('FROM   PESSOA');
      Add('WHERE');
      if (Pos(',',sListaUnidade) > 0) then
        Add('  (IDPESSOA IN (' +sListaUnidade+ '))')
      else
        Add('  (IDPESSOA = ' +sListaUnidade+ ')');
    end;
    dmCds.sql.Open;
    SetLength(UnidadeProc, dmCds.Cds.RecordCount);
    c := 0;
    repeat
      UnidadeProc[c].ID := dmCds.Cds.FieldByName('IDPESSOA').asString;
      UnidadeProc[c].Nome := dmCds.Cds.FieldByName('NOME').asString;
      Inc(c);
      dmCds.Cds.Next;
    until (dmCds.Cds.EOF);
  end
  else
    SetLength(UnidadeProc,0);
end;

procedure TRptProcTrab.GerarValoresProcTrab;
var
  dRiscoMax, dRiscoProv, dValReal, dValorReclamado: double;
begin
  dRiscoMax := 0;
  dRiscoProv := 0;
  dValReal := 0;

  sqlObj.Prepare;
  sqlObj.ParamByName('NUMPROCTRAB').asString := CdsProcesso.FieldByName('NUMPROCTRAB').asString;
  sqlObj.Open;
  while not(CdsObj.EOF) do
  begin
    dValorReclamado := CtrlCustomProcTrab.GetValorAtual(
      CdsObj.FieldByName('VALORRECL').asFloat,
      FU.IFF(CtrlCustomProcTrab.GetDataHist(CdsProcesso.FieldByName('DATADESLIGAMENTO')) > 0,
             CtrlCustomProcTrab.GetDataHist(CdsProcesso.FieldByName('DATADESLIGAMENTO')),
             CtrlCustomProcTrab.GetDataHist(CdsProcesso.FieldByName('DATANOTIF'))),
      CdsProcesso.FieldByName('MOEDAPROCTRAB').asInteger,
      CdsProcesso.FieldByName('IDREGRA').asFloat,
      CdsProcesso.FieldByName('NUMPROCTRAB').asFloat,
      CdsProcesso.FieldByName('INDTAXACONV').asInteger);

    dValReal := dValReal + CtrlCustomProcTrab.GetValorAtual(
      CdsObj.FieldByName('VALORSENTENCA').asFloat,
      CtrlCustomProcTrab.GetDataHist(CdsProcesso.FieldByName('DATAEFETENC')),
      CdsProcesso.FieldByName('MOEDAPROCTRAB').asInteger,
      CdsProcesso.FieldByName('IDREGRA').asFloat,
      CdsProcesso.FieldByName('NUMPROCTRAB').asFloat,
      CdsProcesso.FieldByName('INDTAXACONV').asInteger);

    dRiscoProv := dRiscoProv + dValorReclamado -
      ((100 - CdsObj.FieldByName('PERCPROB').asFloat) * dValorReclamado / 100);

    if (CmpRptCM.ParamByName('ExibirRelatRiscoMax').asBoolean) then
      dRiscoMax := dRiscoMax + dValorReclamado
    else
      dRiscoMax := dRiscoMax + dValorReclamado -
        ((100 - CdsObj.FieldByName('PERCORIG').asFloat) * dValorReclamado / 100);

    CdsObj.Next;
  end;
  CdsObj.First;

  qryProcTrab.FieldByName('RISCOMAXIMO').asFloat := dRiscoMax;
  qryProcTrab.FieldByName('RISCOPROVAVEL').asFloat := dRiscoProv;

  if (CdsProcesso.FieldByName('FLGSITPROC').asInteger = 1) then
  begin
    qryProcTrab.FieldByName('VALORREAL').asFloat := dValReal;
    qryProcTrab.FieldByName('ECONOMIA1').asFloat := dRiscoMax  - dValReal;
    qryProcTrab.FieldByName('ECONOMIA2').asFloat := dRiscoProv - dValReal;
  end
  else
  begin
    qryProcTrab.FieldByName('VALORREAL').asFloat := 0;
    qryProcTrab.FieldByName('ECONOMIA1').asFloat := 0;
    qryProcTrab.FieldByName('ECONOMIA2').asFloat := 0;
  end;
end;

procedure TRptProcTrab.InitRateio;
begin
  if not(qryProcTrab5.IsEmpty) then
    qryProcTrab5.CancelUpdates;
  qryProcTrab5.Close;
  qryProcTrab5.Open;

  if (rpProcTrabSubRepRateio.Visible) then
  begin
    sqlRateio.Open;
    while not(CdsRateio.EOF) do
    begin
      qryProcTrab5.Insert;
      qryProcTrab5.FieldByName('IDFILIALPESSOA').asString :=
        CdsRateio.FieldByName('IDPESSOA').asString;
      qryProcTrab5.FieldByName('EMPRESA').asString :=
        CdsRateio.FieldByName('NOME').asString;
      qryProcTrab5.FieldByName('RISCOMAXIMO').asFloat := 0;
      qryProcTrab5.FieldByName('RISCOPROVAVEL').asFloat := 0;
      qryProcTrab5.FieldByName('VALORREAL').asFloat := 0;
      qryProcTrab5.Post;

      CdsRateio.Next;
    end;
    CdsRateio.First;
  end;
end;

procedure TRptProcTrab.GerarRateio;
const
  arrCampoTot: array [1..5] of string = (
    'RISCOMAXIMO', 'RISCOPROVAVEL', 'VALORREAL','ECONOMIA1','ECONOMIA2');
  arrCampo: array [1..3] of string = (
    'RISCOMAXIMO_RATEIO','RISCOPROVAVEL_RATEIO','VALORREAL_RATEIO');
var
  c: byte;
  dPercRateio: double;
  bGerouRateio: boolean;
  dtDataAdm, dtDataDem: TDate;
begin
  bGerouRateio := false;
  if (CdsRateio.Locate('IDFILIALPESSOA', CdsProcesso.FieldByName('IDESTAB').asFloat,[])) and
     (qryProcTrab5.Locate('IDFILIALPESSOA', CdsRateio.FieldByName('IDPESSOA').asString,[])) then
  begin
    for c:=1 to 3 do
      qryProcTrab.FieldByName(arrCampo[c]).asFloat := 0;

    if not(CdsProcesso.FieldByName('DATAADMISSAO').IsNull) then
      dtDataAdm := CdsProcesso.FieldByName('DATAADMISSAO').asDateTime
    else
      dtDataAdm := Date - (365 * 20);

    if (CdsProcesso.FieldByName('TIPOSIT').asString = 'D') and
       not(CdsProcesso.FieldByName('DATADESLIGAMENTO').IsNull) then
      dtDataDem := CdsProcesso.FieldByName('DATADESLIGAMENTO').asDateTime
    else
      dtDataDem := Date;

    if (CdsRateio.FieldByName('TIPORATEIO').asInteger = 1) then // Processo Encerrado
    begin
      dPercRateio := CtrlRateioProcTrab.RateioCusto(
        0,
        dtDataAdm,
        dtDataDem,
        CdsProcesso.FieldByName('DATANOTIF').asDateTime,
        CdsRateio.FieldByName('DATABASE').asDateTime,
        CdsRateio.FieldByName('TIPORATEIO').asInteger,
        CdsRateio.FieldByName('PERIODO').asInteger,
        CdsRateio.FieldByName('PERCENT1').asFloat,
        CdsRateio.FieldByName('VALORBASE1').asFloat,
        CdsRateio.FieldByName('PERCENT2').asFloat,
        CdsRateio.FieldByName('VALORBASE2').asFloat,
        CdsRateio.FieldByName('PERCENT3').asFloat,
        CdsRateio.FieldByName('VALORBASE3').asFloat,
        CdsRateio.FieldByName('PERCENT4').asFloat,
        CdsRateio.FieldByName('VALORBASE4').asFloat,
        CdsRateio.FieldByName('PERCENT5').asFloat,
        CdsRateio.FieldByName('VALORBASE5').asFloat);

      if (dPercRateio > 0) then
      begin
        qryProcTrab5.Edit;
        qryProcTrab5.FieldByName('RISCOMAXIMO').asFloat :=
          qryProcTrab.FieldByName('RISCOMAXIMO').asFloat * dPercRateio / 100;
        qryProcTrab5.FieldByName('RISCOPROVAVEL').asFloat :=
          qryProcTrab.FieldByName('RISCOPROVAVEL').asFloat * dPercRateio / 100;
        qryProcTrab5.FieldByName('VALORREAL').asFloat :=
          qryProcTrab5.FieldByName('VALORREAL').asFloat * dPercRateio / 100;
        qryProcTrab5.Post;
        bGerouRateio := true;
      end;
    end
    else // Processo Aberto
    for c:=1 to 3 do
    begin
      dPercRateio := CtrlRateioProcTrab.RateioCusto(
        qryProcTrab.FieldByName(arrCampoTot[c]).asFloat,
        dtDataAdm,
        dtDataDem,
        CdsProcesso.FieldByName('DATANOTIF').asDateTime,
        CdsRateio.FieldByName('DATABASE').asDateTime,
        CdsRateio.FieldByName('TIPORATEIO').asInteger,
        CdsRateio.FieldByName('PERIODO').asInteger,
        CdsRateio.FieldByName('PERCENT1').asFloat,
        CdsRateio.FieldByName('VALORBASE1').asFloat,
        CdsRateio.FieldByName('PERCENT2').asFloat,
        CdsRateio.FieldByName('VALORBASE2').asFloat,
        CdsRateio.FieldByName('PERCENT3').asFloat,
        CdsRateio.FieldByName('VALORBASE3').asFloat,
        CdsRateio.FieldByName('PERCENT4').asFloat,
        CdsRateio.FieldByName('VALORBASE4').asFloat,
        CdsRateio.FieldByName('PERCENT5').asFloat,
        CdsRateio.FieldByName('VALORBASE5').asFloat);

      if (dPercRateio > 0) then
      begin
        qryProcTrab5.Edit;
        qryProcTrab5.FieldByName(arrCampoTot[c]).asFloat :=
          qryProcTrab5.FieldByName(arrCampoTot[c]).asFloat + dPercRateio;
        qryProcTrab5.Post;
        bGerouRateio := true;
      end;
    end;

    if (bGerouRateio) then
    begin
      // Atribuo valores ao processo atual
      qryProcTrab.FieldByName('EMPRESA_RATEIO').asString :=
        CdsRateio.FieldByName('NOME').asString;
      qryProcTrab.FieldByName('RISCOMAXIMO_RATEIO').asFloat :=
        qryProcTrab5.FieldByName('RISCOMAXIMO').asFloat;
      qryProcTrab.FieldByName('RISCOPROVAVEL_RATEIO').asFloat :=
        qryProcTrab5.FieldByName('RISCOPROVAVEL').asFloat;
      qryProcTrab.FieldByName('VALORREAL_RATEIO').asFloat :=
        qryProcTrab5.FieldByName('VALORREAL').asFloat;
    end;
  end;
end;

procedure TRptProcTrab.GerarValoresResumoProcTrab;
var
  c: integer;
begin
  if not(qryProcTrab4.Locate('IDESTAB',CdsProcesso.FieldByName('IDESTAB').asFloat,[])) then
  begin
    qryProcTrab4.Insert;
    qryProcTrab4.FieldByName('IDESTAB').asFloat := CdsProcesso.FieldByName('IDESTAB').asFloat;
    qryProcTrab4.FieldByName('EMPRESA').asString := qryProcTrab.FieldByName('EMPRESA').asString;

    if (High(UnidadeProc)+1 > 0) then
      for c:=0 to High(UnidadeProc) do
        if (CdsProcesso.FieldByName('IDESTAB').asString = UnidadeProc[c].ID) then
        begin
          qryProcTrab4.FieldByName('UNIDADE').asString := UnidadeProc[c].Nome;
          break;
        end;
  end
  else
    qryProcTrab4.Edit;

  qryProcTrab4.FieldByName('QTDPROC').asInteger := qryProcTrab4.FieldByName('QTDPROC').asInteger + 1;
  qryProcTrab4.FieldByName('VALRECLAMADO').asFloat := qryProcTrab4.FieldByName('VALRECLAMADO').asFloat +
    qryProcTrab.FieldByName('RISCOMAXIMO').asFloat;
  qryProcTrab4.FieldByName('VALESTIMADO').asFloat := qryProcTrab4.FieldByName('VALESTIMADO').asFloat +
    qryProcTrab.FieldByName('RISCOPROVAVEL').asFloat;
  qryProcTrab4.FieldByName('VALREAL').asFloat := qryProcTrab4.FieldByName('VALREAL').asFloat +
    qryProcTrab.FieldByName('VALORREAL').asFloat;
  qryProcTrab4.FieldByName('ECONRECLAMADO').asFloat := qryProcTrab4.FieldByName('ECONRECLAMADO').asFloat +
    qryProcTrab.FieldByName('ECONOMIA1').asFloat;
  qryProcTrab4.FieldByName('ECONESTIMADO').asFloat := qryProcTrab4.FieldByName('ECONESTIMADO').asFloat +
    qryProcTrab.FieldByName('ECONOMIA2').asFloat;
end;

end.
