unit RProcPrev;
            
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  DBTables, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db,
  Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppMemo, TXComp, 
  uCmSqlParams, DBClient, uCMClientDataSet, uCmRptManager, CmParamReport, Wwquery,
  uCtrlCustomProcTrab, TXRB;

type
  TArrayEstadoProc = array of record
    ID, UF, Nome: string;
  end;

  TArrayPatrocProc = array of record
    ID, Nome: string;
  end;

  TRptProcPrev = class(TFrmCmReport)
    rpProcPrev: TppReport;
    ppProcPrev: TppBDEPipeline;
    dsProcPrev: TwwDataSource;
    qryProcPrev: TwwQuery;
    updProcPrev: TUpdateSQL;
    ppProcPrev1: TppBDEPipeline;
    dsProcPrev1: TwwDataSource;
    qryProcPrev1: TwwQuery;
    rpProcPrevHdrBnd: TppHeaderBand;
    rpProcPrevDtlBnd: TppDetailBand;
    rpProcPrevFootBnd: TppFooterBand;
    rpProcPrevSmryBnd: TppSummaryBand;
    rpProcPrevLbl7: TppLabel;
    rpProcPrevLbl1: TppLabel;
    rpProcPrevDBTxt1: TppDBText;
    rpProcPrevLbl4: TppLabel;
    rpProcPrevLbl5: TppLabel;
    rpProcPrevLbl6: TppLabel;
    rpProcPrevLbl8: TppLabel;
    rpProcPrevLbl9: TppLabel;
    rpProcPrevLbl10: TppLabel;
    rpProcPrevLbl11: TppLabel;
    rpProcPrevLbl12: TppLabel;
    rpProcPrevLbl13: TppLabel;
    rpProcPrevLbl14: TppLabel;
    rpProcPrevLbl16: TppLabel;
    rpProcPrevLbl15: TppLabel;
    rpProcPrevLbl3: TppLabel;
    rpProcPrevLbl2: TppLabel;
    rpProcPrevSysVar1: TppSystemVariable;
    rpProcPrevSysVar2: TppSystemVariable;
    rpProcPrevLbl17: TppLabel;
    rpProcPrevLbl19: TppLabel;
    rpProcPrevLbl18: TppLabel;
    rpProcPrevLbl20: TppLabel;
    rpProcPrevLbl21: TppLabel;
    rpProcPrevGrp0: TppGroup;
    rpProcPrevGrpHdrBnd0: TppGroupHeaderBand;
    rpProcPrevGrpFootBnd0: TppGroupFooterBand;
    rpProcPrevGrp1: TppGroup;
    rpProcPrevGrpHdrBnd1: TppGroupHeaderBand;
    rpProcPrevGrpFootBnd1: TppGroupFooterBand;
    rpProcPrevShape1: TppShape;
    rpProcPrevDBTxt2: TppDBText;
    rpProcPrevDBTxt3: TppDBText;
    rpProcPrevDBTxt4: TppDBText;
    rpProcPrevDBTxt5: TppDBText;
    rpProcPrevDBTxt6: TppDBText;
    rpProcPrevDBTxt7: TppDBText;
    rpProcPrevDBTxt8: TppDBText;
    rpProcPrevDBTxt9: TppDBText;
    rpProcPrevDBTxt10: TppDBText;
    rpProcPrevDBTxt11: TppDBText;
    rpProcPrevDBTxtCARGO: TppDBText;
    rpProcPrevDBTxt12: TppDBText;
    rpProcPrevDBTxt13: TppDBText;
    rpProcPrevDBTxt14: TppDBText;
    rpProcPrevDBTxt15: TppDBText;
    rpProcPrevSubRep1: TppSubReport;
    rpProcPrevChildRep1: TppChildReport;
    rpProcPrevSubRep1TitBnd: TppTitleBand;
    rpProcPrevSubRep1DtlBnd: TppDetailBand;
    rpProcPrevSubRep1Lbl1: TppLabel;
    rpProcPrevSubRep1Lbl2: TppLabel;
    rpProcPrevSubRep1DBTxt1: TppDBText;
    rpProcPrevSubRep1DBTxt2: TppDBText;
    ppProcPrev2: TppBDEPipeline;
    dsProcPrev2: TwwDataSource;
    qryProcPrev2: TwwQuery;
    ppProcPrev3: TppBDEPipeline;
    dsProcPrev3: TwwDataSource;
    qryProcPrev3: TwwQuery;
    rpProcPrevSubRep2: TppSubReport;
    rpProcPrevChildRep2: TppChildReport;
    rpProcPrevSubRep2TitBnd: TppTitleBand;
    rpProcPrevSubRep2DtlBnd: TppDetailBand;
    rpProcPrevSubRep2Lbl1: TppLabel;
    rpProcPrevSubRep2Lbl2: TppLabel;
    rpProcPrevSubRep2DBTxt1: TppDBText;
    rpProcPrevSubRep2DBTxt2: TppDBText;
    rpProcPrevSubRep2DBMemo1: TppDBMemo;
    rpProcPrevSubRep2SmryBnd: TppSummaryBand;
    rpProcPrevLbl22: TppLabel;
    rpProcPrevDBCalc1: TppDBCalc;
    rpProcPrevLbl23: TppLabel;
    rpProcPrevDBCalc2: TppDBCalc;
    rpProcPrevDBCalc3: TppDBCalc;
    rpProcPrevDBCalc4: TppDBCalc;
    rpProcPrevDBCalc5: TppDBCalc;
    rpProcPrevDBCalc6: TppDBCalc;
    rpProcPrevSubRep3: TppSubReport;
    rpProcPrevChildRep3: TppChildReport;
    rpProcPrevSubRep3TitBnd: TppTitleBand;
    rpProcPrevSubRep3Lbl1: TppLabel;
    rpProcPrevSubRep3Lbl2: TppLabel;
    rpProcPrevSubRep3DtlBnd: TppDetailBand;
    rpProcPrevSubRep3DBTxt1: TppDBText;
    rpProcPrevSubRep3DBTxt3: TppDBText;
    rpProcPrevSubRep3SmryBnd: TppSummaryBand;
    rpProcPrevSubRep3DBTxt2: TppDBText;
    rpProcPrevSubRep3LblRiscoMax: TppLabel;
    rpProcPrevSubRep3LblRiscoProv: TppLabel;
    rpProcPrevSubRep3LblValorReal: TppLabel;
    rpProcPrevSubRep3LblEconomia1: TppLabel;
    rpProcPrevSubRep3LblEconomia2: TppLabel;
    ppProcPrev4: TppBDEPipeline;
    dsProcPrev4: TwwDataSource;
    qryProcPrev4: TwwQuery;
    updProcPrev4: TUpdateSQL;
    rpProcPrevSubRep4: TppSubReport;
    rpProcPrevChildRep4: TppChildReport;
    rpProcPrevSubRep4TitBnd: TppTitleBand;
    rpProcPrevSubRep4DtlBnd: TppDetailBand;
    rpProcPrevSubRep4DBTxt2: TppDBText;
    rpProcPrevSubRep4DBTxt4: TppDBText;
    rpProcPrevSubRep4DBTxt3: TppDBText;
    rpProcPrevSubRep4Lbl6: TppLabel;
    rpProcPrevSubRep4Lbl1: TppLabel;
    rpProcPrevSubRep4DBTxt1: TppDBText;
    rpProcPrevSubRep4Lbl4: TppLabel;
    rpProcPrevSubRep4Lbl5: TppLabel;
    rpProcPrevSubRep4Lbl7: TppLabel;
    rpProcPrevSubRep4Lbl8: TppLabel;
    rpProcPrevSubRep4Lbl9: TppLabel;
    rpProcPrevSubRep4Lbl10: TppLabel;
    rpProcPrevSubRep4Lbl2: TppLabel;
    rpProcPrevSubRep4Lbl3: TppLabel;
    rpProcPrevSubRep4SysVar1: TppSystemVariable;
    rpProcPrevSubRep4SysVar2: TppSystemVariable;
    rpProcPrevSubRep4Lbl11: TppLabel;
    rpProcPrevSubRep4DBTxt5: TppDBText;
    rpProcPrevSubRep4DBTxt6: TppDBText;
    rpProcPrevSubRep4Line5: TppLine;
    rpProcPrevSubRep4Line6: TppLine;
    rpProcPrevSubRep4Line7: TppLine;
    rpProcPrevSubRep4Line8: TppLine;
    rpProcPrevSubRep4DBTxt7: TppDBText;
    rpProcPrevSubRep4DBTxt8: TppDBText;
    rpProcPrevSubRep4Line1: TppLine;
    rpProcPrevSubRep4Line4: TppLine;
    rpProcPrevSubRep4Shape1: TppShape;
    rpProcPrevSubRep4Line2: TppLine;
    rpProcPrevSubRep4Line3: TppLine;
    rpProcPrevSubRep4ShapeShape2: TppShape;
    rpProcPrevSubRep4Grp1: TppGroup;
    rpProcPrevSubRep4GrpHdrBnd: TppGroupHeaderBand;
    rpProcPrevSubRep4GrpFootBnd: TppGroupFooterBand;
    rpProcPrevSubRep4Lbl12: TppLabel;
    rpProcPrevSubRep4DBCalc1: TppDBCalc;
    rpProcPrevSubRep4DBCalc2: TppDBCalc;
    rpProcPrevSubRep4DBCalc3: TppDBCalc;
    rpProcPrevSubRep4DBCalc4: TppDBCalc;
    rpProcPrevSubRep4DBCalc5: TppDBCalc;
    rpProcPrevSubRep4DBCalc6: TppDBCalc;
    rpProcPrevSubRep4Shape3: TppShape;
    rpProcPrevSubRep4Line9: TppLine;
    rpProcPrevSubRep4Line10: TppLine;
    rpProcPrevSubRep4Line11: TppLine;
    rpProcPrevSubRep4Line12: TppLine;
    qryProcPrev1Aux: TwwQuery;
    ppSummaryBand1: TppSummaryBand;
    CdsProcesso: TCMClientDataSet;
    sqlProcesso: TCMSqlParams;
    CdsObj: TCMClientDataSet;
    sqlObj: TCMSqlParams;
    ppLabel1: TppLabel;
    rpProcPrevSubRep2DBNumSeq: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    rpProcJudSubRep2Lbl3: TppLabel;
    rpProcJudSubRep2Valor: TppDBText;
    ppDBText1: TppDBText;
    rpProcJudSubRep2DBTxt3: TppDBText;
    VALORCUSTAS: TppField;
    procedure rpProcPrevSmryBndAfterPrint(Sender: TObject);
    procedure rpProcPrevSubRep1TitBndBeforePrint(Sender: TObject);
    procedure qryProcPrevAfterScroll(DataSet: TDataSet);
    procedure rpProcPrevSubRep2TitBndBeforePrint(Sender: TObject);
    procedure rpProcPrevGrpHdrBnd1BeforePrint(Sender: TObject);
    procedure rpProcPrevSubRep3DtlBndBeforePrint(Sender: TObject);
    procedure qryProcPrev1AfterOpen(DataSet: TDataSet);
    procedure rpProcPrevSubRep3TitBndBeforePrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    CtrlCustomProcTrab: TCtrlCustomProcTrab;

    EstadoProc: TArrayEstadoProc;
    PatrocProc: TArrayPatrocProc;

    procedure HabilitarImpressaoRelat;
    procedure GerarDadosRelat;
    procedure ConfigImpressaoRelat;
    procedure GerarListaEstadoProc;
    procedure GerarListaPatrocProc;
    procedure GerarValoresProcPrev;
    procedure GerarValoresResumoProcPrev;
  end;

var
  RptProcPrev: TRptProcPrev;

implementation

uses printers, ppTypes, uSistema, uCtrlPadroes, fAguarde, uCtrlFuncoesRH, dCds;

const
  TIPO_SIT_PROC: array[0..1] of string[3] = ('Abr', 'Enc');

{$R *.DFM}

procedure TRptProcPrev.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  CtrlCustomProcTrab := TCtrlCustomProcTrab.Create(Sistema.IdEmpresa, Sistema.TipoEmpresa);
  CtrlCustomProcTrab.InitializeAs(Padroes);

  frmAguarde.Update;
  qryProcPrev.AfterScroll := nil;

  HabilitarImpressaoRelat;
  GerarDadosRelat;
  ConfigImpressaoRelat;

  qryProcPrev.First;
  qryProcPrev.AfterScroll := qryProcPrevAfterScroll;

  FreeAndNil(CtrlCustomProcTrab);
end;

procedure TRptProcPrev.qryProcPrevAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptProcPrev.qryProcPrev1AfterOpen(DataSet: TDataSet);
begin
  if (qryProcPrev1.IsEmpty) then
  begin
    qryProcPrev1Aux.Open;
    dsProcPrev1.DataSet := qryProcPrev1Aux;
  end
  else
    dsProcPrev1.DataSet := qryProcPrev1;
end;

procedure TRptProcPrev.rpProcPrevGrpHdrBnd1BeforePrint(Sender: TObject);
begin
  if (CmpRptCM.ParamByName('ImprimirCargo').asBoolean) and
     (Trim(qryProcPrev.FieldByName('CARGO').asString) <> '') then
  begin
    rpProcPrevGrpHdrBnd1.Height := 10.054;
    rpProcPrevDBTxtCARGO.Visible := true;
    rpProcPrevDBTxtCARGO.Top := 5.821;
  end
  else
  begin
    rpProcPrevGrpHdrBnd1.Height := 5.556;
    rpProcPrevGrpHdrBnd0.Height := 5.027;
    rpProcPrevDBTxtCARGO.Visible := false;
  end;
end;

procedure TRptProcPrev.rpProcPrevSubRep1TitBndBeforePrint(Sender: TObject);
begin
  TppBand(Sender).Visible := not(dsProcPrev1.DataSet.IsEmpty) and
    (dsProcPrev1.DataSet.FieldByName('LITISCONSORTE').asString <> 'Indefinido');
end;

procedure TRptProcPrev.rpProcPrevSubRep2TitBndBeforePrint(Sender: TObject);
begin
  rpProcPrevSubRep2TitBnd.Visible := (rpProcPrevSubRep2.Visible) and not(qryProcPrev2.IsEmpty);
  rpProcPrevSubRep2DtlBnd.Visible := (rpProcPrevSubRep2.Visible) and not(qryProcPrev2.IsEmpty);
  rpProcPrevSubRep2SmryBnd.Visible := (rpProcPrevSubRep2.Visible) and not(qryProcPrev2.IsEmpty);

  rpProcPrevSubRep2DBMemo1.Visible := CmpRptCM.ParamByName('ImprimirObsEtapa').asBoolean;
  if (CmpRptCM.ParamByName('ImprimirObsEtapa').asBoolean) then
  begin
    rpProcPrevSubRep2DBMemo1.Left := 37.306;
    rpProcPrevSubRep2DBMemo1.Top := 3.704;
  end;
end;

procedure TRptProcPrev.rpProcPrevSubRep3TitBndBeforePrint(Sender: TObject);
begin
  rpProcPrevSubRep3TitBnd.Visible := (rpProcPrevSubRep3.Visible) and not(qryProcPrev3.IsEmpty);
  rpProcPrevSubRep3DtlBnd.Visible := (rpProcPrevSubRep3.Visible) and not(qryProcPrev3.IsEmpty);
  rpProcPrevSubRep3SmryBnd.Visible := (rpProcPrevSubRep3.Visible) and not(qryProcPrev3.IsEmpty);
end;

procedure TRptProcPrev.rpProcPrevSubRep3DtlBndBeforePrint(Sender: TObject);
var
  rValTemp1, rValTemp2, rValTemp3: real;
begin
  rpProcPrevSubRep3LblRiscoMax.Caption := '';
  rpProcPrevSubRep3LblRiscoProv.Caption := '';
  rpProcPrevSubRep3LblValorReal.Caption := '';
  rpProcPrevSubRep3LblEconomia1.Caption := '';
  rpProcPrevSubRep3LblEconomia2.Caption := '';

  if (CmpRptCM.ParamByName('ImprimirObj').asBoolean) and
     (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0) and
     not(qryProcPrev3.IsEmpty) then
  begin
    rValTemp1 := CtrlCustomProcTrab.GetValorAtual(
      qryProcPrev3.FieldByName('VALORRECL').asFloat,
      CtrlCustomProcTrab.GetDataHist(qryProcPrev.FieldByName('DATANOTIF')),
      qryProcPrev.FieldByName('MOEDAPROCTRAB').asInteger,
      qryProcPrev.FieldByName('IDREGRA').asFloat,
      qryProcPrev.FieldByName('NUMPROCTRAB').asFloat,
      qryProcPrev.FieldByName('INDTAXACONV').asInteger);
    rValTemp2 := rValTemp1 * qryProcPrev3.FieldByName('PERCPROB').asFloat / 100;

    if not(CmpRptCM.ParamByName('ExibirRelatRiscoMax').asBoolean) then
      rValTemp1 := rValTemp1 * qryProcPrev3.FieldByName('PERCORIG').asFloat / 100;

    rpProcPrevSubRep3LblRiscoMax.Caption := FormatFloat('###,###,##0',rValTemp1);

    if (rValTemp2 = 0) then
      rpProcPrevSubRep3LblRiscoProv.Caption := ''
    else
      rpProcPrevSubRep3LblRiscoProv.Caption := FormatFloat('###,###,##0',rValTemp2);

    if (qryProcPrev.FieldByName('FLGSITPROC').asInteger = 1) then
    begin
      rValTemp3 := CtrlCustomProcTrab.GetValorAtual(
        qryProcPrev3.FieldByName('VALORSENTENCA').asFloat,
        CtrlCustomProcTrab.GetDataHist(qryProcPrev.FieldByName('DATAEFETENC')),
        qryProcPrev.FieldByName('MOEDAPROCTRAB').asInteger,
        qryProcPrev.FieldByName('IDREGRA').asFloat,
        qryProcPrev.FieldByName('NUMPROCTRAB').asFloat,
        qryProcPrev.FieldByName('INDTAXACONV').asInteger);

      if (rValTemp3 = 0) then
        rpProcPrevSubRep3LblValorReal.Caption := ''
      else
        rpProcPrevSubRep3LblValorReal.Caption := FormatFloat('###,###,##0',rValTemp3);

      if ((rValTemp1 - rValTemp3) = 0) then
        rpProcPrevSubRep3LblEconomia1.Caption := ''
      else
        rpProcPrevSubRep3LblEconomia1.Caption := FormatFloat('###,###,##0',rValTemp1 - rValTemp3);

      if ((rValTemp2 - rValTemp3) = 0) then
        rpProcPrevSubRep3LblEconomia2.Caption := ''
      else
        rpProcPrevSubRep3LblEconomia2.Caption := FormatFloat('###,###,##0',rValTemp2 - rValTemp3);
    end;
  end;
end;

procedure TRptProcPrev.rpProcPrevSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TRptProcPrev.HabilitarImpressaoRelat;
begin
  // Habilitar impressão dos Litisconsortes
  rpProcPrevSubRep1.Visible := (CmpRptCM.ParamByName('ImprimirLitis').asInteger < 2);
  if (rpProcPrevSubRep1.Visible) then
  begin
    rpProcPrevSubRep1.DataPipeline := ppProcPrev1;
    rpProcPrevSubRep1Lbl2.Visible := (CmpRptCM.ParamByName('ImprimirLitis').asInteger = 0);
    rpProcPrevSubRep1DBTxt2.Visible := (CmpRptCM.ParamByName('ImprimirLitis').asInteger = 0);
  end
  else
    rpProcPrevSubRep1.DataPipeline := nil;

  // Habilitar impressão das Etapas
  rpProcPrevSubRep2.Visible := CmpRptCM.ParamByName('ImprimirEtapa').asBoolean;
  if (rpProcPrevSubRep2.Visible) then
  begin
    rpProcPrevSubRep2.DataPipeline := ppProcPrev2;
    qryProcPrev2.SQL[9] := '';
  end
  else
    rpProcPrevSubRep2.DataPipeline := nil;

  if (CmpRptCM.ParamByName('ImprimirEtapaSel').asBoolean) and
     (Trim(CmpRptCM.ParamByName('ListaCodEtapa').asString) <> '') then
    qryProcPrev2.SQL[9] := '  (E.CODTIPORECURSO ' +CmpRptCM.ParamByName('ListaCodEtapa').asString+ ') AND';

  if not(CmpRptCM.ParamByName('ImprimirEtapa').asBoolean) or
    ((CmpRptCM.ParamByName('ImprimirEtapaSel').asBoolean) and
     (Trim(CmpRptCM.ParamByName('ListaCodEtapa').asString) = '')) then
    qryProcPrev2.SQL[9] := '  (1 = 2) AND'; // Não deve ser mostrado

  // Habilitar impressão dos Objetos
  rpProcPrevSubRep3.Visible := CmpRptCM.ParamByName('ImprimirObj').asBoolean;
  if (rpProcPrevSubRep3.Visible) then
  begin
    rpProcPrevSubRep3.DataPipeline := ppProcPrev3;
    qryProcPrev3.SQL[8] := '';
  end
  else
    rpProcPrevSubRep3.DataPipeline := nil;

  if (CmpRptCM.ParamByName('ImprimirObjSel').asBoolean) and
     (Trim(CmpRptCM.ParamByName('ListaCodObjeto').asString) <> '') then
    qryProcPrev3.SQL[8] := '  (O.CODTIPOOBJETO ' +CmpRptCM.ParamByName('ListaCodObjeto').asString+ ') AND';

  if not(rpProcPrevSubRep3.Visible) or
     ((CmpRptCM.ParamByName('ImprimirObjSel').asBoolean) and
      (Trim(CmpRptCM.ParamByName('ListaCodObjeto').asString) = '')) then
    qryProcPrev3.SQL[8] := '  (1 = 2) AND'; // Não deve ser mostrado

  // Habilitar impressão do Resumo
  rpProcPrevSubRep4.Visible := CmpRptCM.ParamByName('ImprimirResumo').asBoolean;
  if (rpProcPrevSubRep4.Visible) then
  begin
    if not(qryProcPrev4.IsEmpty) then
      qryProcPrev4.CancelUpdates;
    qryProcPrev4.Close;
    qryProcPrev4.Open;
    rpProcPrevSubRep4.DataPipeline := ppProcPrev4;
  end
  else
    rpProcPrevSubRep4.DataPipeline := nil;
end;

procedure TRptProcPrev.GerarDadosRelat;
var
  c: integer;
  sNum: string;
begin
  frmAguarde.Update;
  sqlProcesso.SQL.Text := CmpRptCM.ParamByName('SQL').asString;
  sqlProcesso.Open;
  frmAguarde.Update;

  if not(qryProcPrev.IsEmpty) then
    qryProcPrev.CancelUpdates;
  qryProcPrev.Open;
  if not(CdsProcesso.IsEmpty) then
  begin
    frmAguarde.Min := 0;
    frmAguarde.Max := CdsProcesso.RecordCount;

    GerarListaEstadoProc;
    CdsProcesso.First;
    GerarListaPatrocProc;

    sNum := '';
    CdsProcesso.First;
    repeat
      if (CdsProcesso.FieldByName('NUMPROCTRAB').asString = sNum) then
      begin
        CdsProcesso.Next;
        Continue;
      end;
      sNum := CdsProcesso.FieldByName('NUMPROCTRAB').asString;
      qryProcPrev.Insert;
      qryProcPrev.FieldByName('EMPRESA').asString := Sistema.NomeEmpresa;
      qryProcPrev.FieldByName('CONTRAPARTE').asString := CdsProcesso.FieldByName('NOME').asString;
      qryProcPrev.FieldByName('NUMVARAJUSTICA').asString := CdsProcesso.FieldByName('NUMVARAJUSTICA').asString;
      qryProcPrev.FieldByName('DATANOTIF').asString := CdsProcesso.FieldByName('DATANOTIF').asString;

      if (CmpRptCM.ParamByName('ImprimirNumProcVara').asBoolean) then
        qryProcPrev.FieldByName('PROCJCJNUM').asString := CdsProcesso.FieldByName('PROCJCJNUM').asString
      else
        qryProcPrev.FieldByName('PROCJCJNUM').asString := CdsProcesso.FieldByName('NUMPROCTRAB').asString;

      qryProcPrev.FieldByName('NUMPROCTRAB').asFloat := CdsProcesso.FieldByName('NUMPROCTRAB').asFloat;
      qryProcPrev.FieldByName('MOEDAPROCTRAB').asInteger := CdsProcesso.FieldByName('MOEDAPROCTRAB').asInteger;
      qryProcPrev.FieldByName('IDREGRA').asString := CdsProcesso.FieldByName('IDREGRA').asString;
      qryProcPrev.FieldByName('INDTAXACONV').asString := CdsProcesso.FieldByName('INDTAXACONV').asString;
      qryProcPrev.FieldByName('DATAEFETENC').asString := CdsProcesso.FieldByName('DATAEFETENC').asString;
      qryProcPrev.FieldByName('FLGSITPROC').asString := CdsProcesso.FieldByName('FLGSITPROC').asString;

      if (High(PatrocProc)+1 > 0) then
        for c:=0 to High(PatrocProc) do
          if (CdsProcesso.FieldByName('IDPESSJUR').asString = PatrocProc[c].ID) then
          begin
            qryProcPrev.FieldByName('PATROCINADORA').asString := PatrocProc[c].Nome;
            break;
          end;

      if (High(EstadoProc)+1 > 0) then
        for c:=0 to High(EstadoProc) do
          if (CdsProcesso.FieldByName('IDESTADO').asString = EstadoProc[c].ID) then
          begin
            qryProcPrev.FieldByName('UF').asString := EstadoProc[c].UF;
            break;
          end;

      if (CdsProcesso.Fields.FindField('NOMEVARA') <> nil) then
        qryProcPrev.FieldByName('NOMEVARA').asString := CdsProcesso.FieldByName('NOMEVARA').asString;
      if (CdsProcesso.Fields.FindField('DATAADMISSAO') <> nil) then
        qryProcPrev.FieldByName('DATAADMISSAO').asString := CdsProcesso.FieldByName('DATAADMISSAO').asString;
      if (CdsProcesso.Fields.FindField('DATADEMISSAO') <> nil) then
        qryProcPrev.FieldByName('DATADEMISSAO').asString := CdsProcesso.FieldByName('DATADEMISSAO').asString;
      if (CdsProcesso.Fields.FindField('TITULO') <> nil) then
        qryProcPrev.FieldByName('CARGO').asString := CdsProcesso.FieldByName('TITULO').asString;

      qryProcPrev.FieldByName('SITUACAO').asString := TIPO_SIT_PROC[CdsProcesso.FieldByName('FLGSITPROC').asInteger];

      if (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0) then
        GerarValoresProcPrev;

      if (CmpRptCM.ParamByName('ImprimirResumo').asBoolean) then
        GerarValoresResumoProcPrev;

      qryProcPrev.Post;
      CdsProcesso.Next;
    until (CdsProcesso.EOF);

    if (CmpRptCM.ParamByName('ImprimirResumo').asBoolean) then
      qryProcPrev4.Post;

    SetLength(EstadoProc,0);
    SetLength(PatrocProc,0);
  end
  else
  begin
    rpProcPrevDBCalc1.Visible := false;
    qryProcPrev.Insert;
    qryProcPrev.Post;
  end;
end;

procedure TRptProcPrev.ConfigImpressaoRelat;
begin
  // Título do Relatório
  rpProcPrevLbl1.Caption := CmpRptCM.ParamByName('TituloRelatorio').asString;

  if (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0) then
    rpProcPrev.PrinterSetup.Orientation := poLandscape
  else
    rpProcPrev.PrinterSetup.Orientation := poPortrait;

  if (CmpRptCM.ParamByName('ImprimirNumProcVara').asBoolean) then
  begin
    rpProcPrevGrp1.BreakName := 'PROCJCJNUM';
    rpProcPrevDBTxt2.DataField := 'PROCJCJNUM';
  end
  else
  begin
    rpProcPrevGrp1.BreakName := 'NUMPROCTRAB';
    rpProcPrevDBTxt2.DataField := 'NUMPROCTRAB';
  end;

  if (CmpRptCM.ParamByName('ImprimirLitis').asInteger < 2) then
    rpProcPrevLbl6.Caption := 'Contraparte e Litisconsortes'
  else
    rpProcPrevLbl6.Caption := 'Contraparte';

  rpProcPrevLbl14.Caption := FU.IFF(CmpRptCM.ParamByName('ExibirRelatRiscoMax').asBoolean, 'Máximo', 'Original');
  rpProcPrevLbl19.Caption := FU.IFF(CmpRptCM.ParamByName('ExibirRelatRiscoMax').asBoolean, 's/Máximo', 's/Original');
  rpProcPrevSubRep4Lbl6.Caption := FU.IFF(CmpRptCM.ParamByName('ExibirRelatRiscoMax').asBoolean, 'Risco Máximo', 'Risco Original');
  rpProcPrevSubRep4Lbl10.Caption := FU.IFF(CmpRptCM.ParamByName('ExibirRelatRiscoMax').asBoolean, 'Sobre Máximo', 'Sobre Original');

  if (CmpRptCM.ParamByName('OpcaoImpressao').asInteger > 0) then
  begin
    rpProcPrevLbl7.Caption := 'Órgão Jurisdicional (Vara)';
    rpProcPrevLbl7.TextAlignment := taLeftJustified;
    rpProcPrevLbl7.Left := 105.881;
    rpProcPrevLbl7.Width := 48.575;
    rpProcPrevDBTxt5.Left := 105.881;
    rpProcPrevDBTxt5.Width := 48.575;
    rpProcPrevDBTxt5.DataField := 'NOMEVARA';
    rpProcPrevLbl2.Left := 140.636;
    rpProcPrevLbl3.Left := 140.636;
    rpProcPrevSysVar1.Left := 168.946;
    rpProcPrevSysVar2.Left := 168.946;
  end
  else
  begin
    rpProcPrevLbl7.Caption := 'Admissão';
    rpProcPrevLbl7.TextAlignment := taRightJustified;
    rpProcPrevLbl7.Left := 90.488;
    rpProcPrevLbl7.Width := 15.61;
    rpProcPrevDBTxt5.Left := 90.488;
    rpProcPrevDBTxt5.Width := 15.61;
    rpProcPrevDBTxt5.DataField := 'DATAADMISSAO';
    rpProcPrevLbl2.Left := 215.636;
    rpProcPrevLbl3.Left := 215.636;
    rpProcPrevSysVar1.Left := 243.946;
    rpProcPrevSysVar2.Left := 243.946;
  end;

  rpProcPrevHdrBnd.Visible := CmpRptCM.ParamByName('ImprimirCabRod').asBoolean;
  rpProcPrevGrpFootBnd0.Visible := CmpRptCM.ParamByName('ImprimirCabRod').asBoolean;
  rpProcPrevShape1.Visible :=
    (CmpRptCM.ParamByName('ImprimirLitis').asInteger < 2) or
    (CmpRptCM.ParamByName('ImprimirEtapa').asBoolean) or
    (CmpRptCM.ParamByName('ImprimirObj').asBoolean);

  rpProcPrevLbl8.Visible  := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcPrevLbl9.Visible  := rpProcPrevLbl8.Visible;
  rpProcPrevLbl10.Visible := not(rpProcPrevLbl8.Visible);
  rpProcPrevLbl13.Visible := rpProcPrevLbl8.Visible;
  rpProcPrevLbl14.Visible := rpProcPrevLbl8.Visible;
  rpProcPrevLbl15.Visible := rpProcPrevLbl8.Visible;
  rpProcPrevLbl16.Visible := rpProcPrevLbl8.Visible;
  rpProcPrevLbl17.Visible := rpProcPrevLbl8.Visible;
  rpProcPrevLbl18.Visible := rpProcPrevLbl8.Visible;
  rpProcPrevLbl19.Visible := rpProcPrevLbl8.Visible;
  rpProcPrevLbl20.Visible := rpProcPrevLbl8.Visible;
  rpProcPrevLbl21.Visible := rpProcPrevLbl8.Visible;
  rpProcPrevLbl23.Visible := rpProcPrevLbl8.Visible;
  rpProcPrevDBCalc2.Visible := rpProcPrevLbl8.Visible;
  rpProcPrevDBCalc3.Visible := rpProcPrevLbl8.Visible;
  rpProcPrevDBCalc4.Visible := rpProcPrevLbl8.Visible;
  rpProcPrevDBCalc5.Visible := rpProcPrevLbl8.Visible;
  rpProcPrevDBCalc6.Visible := rpProcPrevLbl8.Visible;
  rpProcPrevDBTxt6.Visible  := rpProcPrevLbl8.Visible;
  rpProcPrevDBTxt7.Visible  := rpProcPrevLbl8.Visible;
  rpProcPrevDBTxt8.Visible  := not(rpProcPrevLbl8.Visible);
  rpProcPrevDBTxt11.Visible := rpProcPrevLbl8.Visible;
  rpProcPrevDBTxt12.Visible := rpProcPrevLbl8.Visible;
  rpProcPrevDBTxt13.Visible := rpProcPrevLbl8.Visible;
  rpProcPrevDBTxt14.Visible := rpProcPrevLbl8.Visible;
  rpProcPrevDBTxt15.Visible := rpProcPrevLbl8.Visible;

  rpProcPrevDBTxt1.Width := rpProcPrev.PrinterSetup.PaperWidth -
    (rpProcPrev.PrinterSetup.MarginLeft * 2) - (rpProcPrevDBTxt1.Left * 2);
  rpProcPrevLbl1.Width := rpProcPrevDBTxt1.Width;
  rpProcPrevShape1.Width := rpProcPrev.PrinterSetup.PaperWidth -
    (rpProcPrev.PrinterSetup.MarginLeft * 2) - (rpProcPrevShape1.Left * 2);

  // Habilitações no Resumo por UF
  rpProcPrevSubRep4Lbl6.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcPrevSubRep4Lbl6.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcPrevSubRep4Lbl7.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcPrevSubRep4Lbl8.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcPrevSubRep4Lbl9.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcPrevSubRep4Lbl10.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcPrevSubRep4Lbl11.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcPrevSubRep4DBTxt4.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcPrevSubRep4DBTxt5.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcPrevSubRep4DBTxt6.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcPrevSubRep4DBTxt7.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcPrevSubRep4DBTxt8.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcPrevSubRep4DBCalc2.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcPrevSubRep4DBCalc3.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcPrevSubRep4DBCalc4.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcPrevSubRep4DBCalc5.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcPrevSubRep4DBCalc6.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
end;

procedure TRptProcPrev.GerarListaEstadoProc;
var
  c: byte;
  sListaEstado: string;
begin
  sListaEstado := '';
  while not(CdsProcesso.EOF) do
  begin
    if (sListaEstado = '') then
      sListaEstado := CdsProcesso.FieldByName('IDESTADO').asString
    else
    if (FU.VerificaCodigoEm(sListaEstado,CdsProcesso.FieldByName('IDESTADO').asString,',') = 0) then
      sListaEstado := sListaEstado +','+ CdsProcesso.FieldByName('IDESTADO').asString;

    CdsProcesso.Next;
  end;

  if (sListaEstado <> '') then
  begin
    with (dmCds.sql.SQL) do
    begin
      Clear;
      Add('SELECT IDESTADO, RTRIM(CODESTADO) AS UF,');
      Add('       RTRIM(CODESTADO) ||'' - ''|| NOMEESTADO AS NOME');
      Add('FROM   ESTADO');
      Add('WHERE');
      if (sListaEstado <> '')  then
      begin
        if (Pos(',',sListaEstado) > 0) then
          Add('  (IDESTADO IN (' +sListaEstado+ '))')
        else
          Add('  (IDESTADO = ' +sListaEstado+ ')');
      end;
      Add('ORDER BY IDESTADO');
    end;
    dmCds.sql.Open;
    SetLength(EstadoProc, dmCds.Cds.RecordCount);
    c := 0;
    repeat
      EstadoProc[c].ID := dmCds.Cds.FieldByName('IDESTADO').asString;
      EstadoProc[c].UF := dmCds.Cds.FieldByName('UF').asString;
      EstadoProc[c].Nome := dmCds.Cds.FieldByName('NOME').asString;
      Inc(c);
      dmCds.Cds.Next;
    until (dmCds.Cds.EOF);
  end
  else
    SetLength(EstadoProc,0);
end;

procedure TRptProcPrev.GerarListaPatrocProc;
var
  c: byte;
  sListaPatroc: string;
begin
  sListaPatroc := '';
  while not(CdsProcesso.EOF) do
  begin
    if (sListaPatroc = '') then
      sListaPatroc := CdsProcesso.FieldByName('IDPESSJUR').asString
    else
    if (Trim(CdsProcesso.FieldByName('IDPESSJUR').asString) <> '') and
       (FU.VerificaCodigoEm(sListaPatroc,CdsProcesso.FieldByName('IDPESSJUR').asString,',') = 0) then
      sListaPatroc := sListaPatroc +','+ CdsProcesso.FieldByName('IDPESSJUR').asString;

    CdsProcesso.Next;
  end;

  if (sListaPatroc <> '') then
  begin
    with (dmCds.sql.SQL) do
    begin
      Clear;
      Add('SELECT IDPESSOA, NOME');
      Add('FROM   PESSOA');
      Add('WHERE');
      if (sListaPatroc <> '')  then
      begin
        if (Pos(',', sListaPatroc) > 0) then
          Add('  (IDPESSOA IN (' +sListaPatroc+ '))')
        else
          Add('  (IDPESSOA = ' +sListaPatroc+ ')');
      end;
      Add('ORDER BY IDPESSOA');
    end;
    dmCds.sql.Open;
    SetLength(PatrocProc, dmCds.Cds.RecordCount);
    c := 0;
    while not(dmCds.Cds.EOF) do
    begin
      PatrocProc[c].ID := dmCds.Cds.FieldByName('IDPESSOA').asString;
      PatrocProc[c].Nome := dmCds.Cds.FieldByName('NOME').asString;
      Inc(c);
      dmCds.Cds.Next;
    end;
  end
  else
    SetLength(PatrocProc,0);
end;

procedure TRptProcPrev.GerarValoresProcPrev;
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
      CtrlCustomProcTrab.GetDataHist(CdsProcesso.FieldByName('DATANOTIF')),
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

  qryProcPrev.FieldByName('RISCOMAXIMO').asFloat := dRiscoMax;
  qryProcPrev.FieldByName('RISCOPROVAVEL').asFloat := dRiscoProv;

  if (CdsProcesso.FieldByName('FLGSITPROC').asInteger = 1) then
  begin
    qryProcPrev.FieldByName('VALORREAL').asFloat := dValReal;
    qryProcPrev.FieldByName('ECONOMIA1').asFloat := dRiscoMax  - dValReal;
    qryProcPrev.FieldByName('ECONOMIA2').asFloat := dRiscoProv - dValReal;
  end
  else
  begin
    qryProcPrev.FieldByName('VALORREAL').asFloat := 0;
    qryProcPrev.FieldByName('ECONOMIA1').asFloat := 0;
    qryProcPrev.FieldByName('ECONOMIA2').asFloat := 0;
  end;
end;

procedure TRptProcPrev.GerarValoresResumoProcPrev;
var
  c: integer;
begin
  if not(qryProcPrev4.Locate('IDESTADO',CdsProcesso.FieldByName('IDESTADO').asFloat,[])) then
  begin
    qryProcPrev4.Insert;
    qryProcPrev4.FieldByName('IDESTADO').asFloat := CdsProcesso.FieldByName('IDESTADO').asFloat;
    qryProcPrev4.FieldByName('EMPRESA').asString := qryProcPrev.FieldByName('EMPRESA').asString;

    if (High(EstadoProc)+1 > 0) then
      for c:=0 to High(EstadoProc) do
        if (CdsProcesso.FieldByName('IDESTADO').asString = EstadoProc[c].ID) then
        begin
          qryProcPrev4.FieldByName('ESTADO').asString := EstadoProc[c].Nome;
          break;
        end;
  end
  else
    qryProcPrev4.Edit;

  qryProcPrev4.FieldByName('QTDPROC').asInteger := qryProcPrev4.FieldByName('QTDPROC').asInteger + 1;
  qryProcPrev4.FieldByName('VALRECLAMADO').asFloat := qryProcPrev4.FieldByName('VALRECLAMADO').asFloat +
    qryProcPrev.FieldByName('RISCOMAXIMO').asFloat;
  qryProcPrev4.FieldByName('VALESTIMADO').asFloat := qryProcPrev4.FieldByName('VALESTIMADO').asFloat +
    qryProcPrev.FieldByName('RISCOPROVAVEL').asFloat;
  qryProcPrev4.FieldByName('VALREAL').asFloat := qryProcPrev4.FieldByName('VALREAL').asFloat +
    qryProcPrev.FieldByName('VALORREAL').asFloat;
  qryProcPrev4.FieldByName('ECONRECLAMADO').asFloat := qryProcPrev4.FieldByName('ECONRECLAMADO').asFloat +
    qryProcPrev.FieldByName('ECONOMIA1').asFloat;
  qryProcPrev4.FieldByName('ECONESTIMADO').asFloat := qryProcPrev4.FieldByName('ECONESTIMADO').asFloat +
    qryProcPrev.FieldByName('ECONOMIA2').asFloat;
end;

end.
