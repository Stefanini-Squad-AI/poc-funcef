unit RProcJud;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, CmParamReport,
  DBTables, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db,
  Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppMemo,
  FCmReport, uCmRptManager, TXComp, uCmSqlParams, DBClient, uCMClientDataSet,
  uCtrlCustomProcTrab, uCtrlGlobalRH, TXRB;

type
  TArrayEstadoProc = array of record
    ID, UF, Nome: string;
  end;

  TRptProcJud = class(TFrmCmReport)
    rpProcJud: TppReport;
    ppProcJud: TppBDEPipeline;
    dsProcJud: TwwDataSource;
    qryProcJud: TwwQuery;
    updProcJud: TUpdateSQL;
    ppProcJud1: TppBDEPipeline;
    dsProcJud1: TwwDataSource;
    qryProcJud1: TwwQuery;
    rpProcJudHdrBnd: TppHeaderBand;
    rpProcJudDtlBnd: TppDetailBand;
    rpProcJudFootBnd: TppFooterBand;
    rpProcJudSmryBnd: TppSummaryBand;
    rpProcJudLbl7: TppLabel;
    rpProcJudLbl1: TppLabel;
    rpProcJudDBTxt1: TppDBText;
    rpProcJudLbl4: TppLabel;
    rpProcJudLbl5: TppLabel;
    rpProcJudLbl6: TppLabel;
    rpProcJudLbl8: TppLabel;
    rpProcJudLbl9: TppLabel;
    rpProcJudLbl10: TppLabel;
    rpProcJudLbl11: TppLabel;
    rpProcJudLbl13: TppLabel;
    rpProcJudLbl12: TppLabel;
    rpProcJudLbl3: TppLabel;
    rpProcJudLbl2: TppLabel;
    rpProcJudSysVar1: TppSystemVariable;
    rpProcJudSysVar2: TppSystemVariable;
    rpProcJudLbl14: TppLabel;
    rpProcJudLbl16: TppLabel;
    rpProcJudLbl15: TppLabel;
    rpProcJudLbl17: TppLabel;
    rpProcJudLbl18: TppLabel;
    rpProcJudGrp0: TppGroup;
    rpProcJudGrpHdrBnd0: TppGroupHeaderBand;
    rpProcJudGrpFootBnd0: TppGroupFooterBand;
    rpProcJudGrp1: TppGroup;
    rpProcJudGrpHdrBnd1: TppGroupHeaderBand;
    rpProcJudGrpFootBnd1: TppGroupFooterBand;
    rpProcJudShape1: TppShape;
    rpProcJudDBTxt2: TppDBText;
    rpProcJudDBTxt3: TppDBText;
    rpProcJudDBTxt4: TppDBText;
    rpProcJudDBTxt5: TppDBText;
    rpProcJudDBTxtNumVara: TppDBText;
    rpProcJudDBTxt6: TppDBText;
    rpProcJudDBTxt7: TppDBText;
    rpProcJudDBTxtRiscoMax: TppDBText;
    rpProcJudDBTxt9: TppDBText;
    rpProcJudDBTxt10: TppDBText;
    rpProcJudDBTxtEconomia1: TppDBText;
    rpProcJudDBTxt11: TppDBText;
    ppProcJud2: TppBDEPipeline;
    dsProcJud2: TwwDataSource;
    qryProcJud2: TwwQuery;
    ppProcJud3: TppBDEPipeline;
    dsProcJud3: TwwDataSource;
    qryProcJud3: TwwQuery;
    rpProcJudLbl19: TppLabel;
    rpProcJudDBCalc1: TppDBCalc;
    rpProcJudLbl20: TppLabel;
    rpProcJudDBCalc2: TppDBCalc;
    rpProcJudDBCalc3: TppDBCalc;
    rpProcJudDBCalc4: TppDBCalc;
    rpProcJudDBCalc5: TppDBCalc;
    rpProcJudDBCalc6: TppDBCalc;
    ppProcJud4: TppBDEPipeline;
    dsProcJud4: TwwDataSource;
    qryProcJud4: TwwQuery;
    updProcJud4: TUpdateSQL;
    rpProcJudSubRep4: TppSubReport;
    rpProcJudChildRep4: TppChildReport;
    rpProcJudSubRep4TitBnd: TppTitleBand;
    rpProcJudSubRep4DtlBnd: TppDetailBand;
    rpProcJudSubRep4DBTxt2: TppDBText;
    rpProcJudSubRep4DBTxt4: TppDBText;
    rpProcJudSubRep4DBTxt3: TppDBText;
    rpProcJudSubRep4Lbl6: TppLabel;
    rpProcJudSubRep4Lbl1: TppLabel;
    rpProcJudSubRep4DBTxt1: TppDBText;
    rpProcJudSubRep4Lbl4: TppLabel;
    rpProcJudSubRep4Lbl5: TppLabel;
    rpProcJudSubRep4Lbl7: TppLabel;
    rpProcJudSubRep4Lbl8: TppLabel;
    rpProcJudSubRep4Lbl9: TppLabel;
    rpProcJudSubRep4Lbl10: TppLabel;
    rpProcJudSubRep4Lbl2: TppLabel;
    rpProcJudSubRep4Lbl3: TppLabel;
    rpProcJudSubRep4SysVar1: TppSystemVariable;
    rpProcJudSubRep4SysVar2: TppSystemVariable;
    rpProcJudSubRep4Lbl11: TppLabel;
    rpProcJudSubRep4DBTxt5: TppDBText;
    rpProcJudSubRep4DBTxt6: TppDBText;
    rpProcJudSubRep4Line5: TppLine;
    rpProcJudSubRep4Line6: TppLine;
    rpProcJudSubRep4Line7: TppLine;
    rpProcJudSubRep4Line8: TppLine;
    rpProcJudSubRep4DBTxt7: TppDBText;
    rpProcJudSubRep4DBTxt8: TppDBText;
    rpProcJudSubRep4Line1: TppLine;
    rpProcJudSubRep4Line4: TppLine;
    rpProcJudSubRep4Shape1: TppShape;
    rpProcJudSubRep4Line2: TppLine;
    rpProcJudSubRep4Line3: TppLine;
    rpProcJudSubRep4ShapeShape2: TppShape;
    rpProcJudSubRep4Grp1: TppGroup;
    rpProcJudSubRep4GrpHdrBnd: TppGroupHeaderBand;
    rpProcJudSubRep4GrpFootBnd: TppGroupFooterBand;
    rpProcJudSubRep4Lbl12: TppLabel;
    rpProcJudSubRep4DBCalc1: TppDBCalc;
    rpProcJudSubRep4DBCalc2: TppDBCalc;
    rpProcJudSubRep4DBCalc3: TppDBCalc;
    rpProcJudSubRep4DBCalc4: TppDBCalc;
    rpProcJudSubRep4DBCalc5: TppDBCalc;
    rpProcJudSubRep4DBCalc6: TppDBCalc;
    rpProcJudSubRep4Shape3: TppShape;
    rpProcJudSubRep4Line9: TppLine;
    rpProcJudSubRep4Line10: TppLine;
    rpProcJudSubRep4Line11: TppLine;
    rpProcJudSubRep4Line12: TppLine;
    rpProcJudDBTxtNomeVara: TppDBText;
    rpProcJudSubRep1: TppSubReport;
    ppChildReport1: TppChildReport;
    rpProcJudSubRep1TitBnd: TppTitleBand;
    rpProcJudSubRep1DtlBnd: TppDetailBand;
    rpProcJudSubRep1SmryBnd: TppSummaryBand;
    rpProcJudSubRep1Lbl1: TppLabel;
    rpProcJudSubRep1Lbl2: TppLabel;
    rpProcJudSubRep1DBTxt1: TppDBText;
    rpProcJudSubRep1DBTxt2: TppDBText;
    rpProcJudSubRep2: TppSubReport;
    ppChildReport2: TppChildReport;
    rpProcJudSubRep2TitBnd: TppTitleBand;
    rpProcJudSubRep2DtlBnd: TppDetailBand;
    rpProcJudSubRep2SmryBnd: TppSummaryBand;
    rpProcJudSubRep2Lbl1: TppLabel;
    rpProcJudSubRep2Lbl2: TppLabel;
    rpProcJudSubRep2Lbl3: TppLabel;
    rpProcJudSubRep2DBTxt1: TppDBText;
    rpProcJudSubRep2DBTxt2: TppDBText;
    rpProcJudSubRep2DBTxt3: TppDBText;
    rpProcJudSubRep2DBMemo1: TppDBMemo;
    qryProcJud1Aux: TwwQuery;
    rpProcJudSubRep3: TppSubReport;
    ppChildReport3: TppChildReport;
    rpProcJudSubRep3TitBnd: TppTitleBand;
    rpProcJudSubRep3DtlBnd: TppDetailBand;
    rpProcJudSubRep3SmryBnd: TppSummaryBand;
    rpProcJudSubRep3Lbl1: TppLabel;
    rpProcJudSubRep3Lbl2: TppLabel;
    rpProcJudSubRep3DBTxt1: TppDBText;
    rpProcJudSubRep3DBTxt3: TppDBText;
    rpProcJudSubRep3DBTxt2: TppDBText;
    rpProcJudSubRep3LblRiscoMax: TppLabel;
    rpProcJudSubRep3LblRiscoProv: TppLabel;
    rpProcJudSubRep3LblValorReal: TppLabel;
    rpProcJudSubRep3LblEconomia1: TppLabel;
    rpProcJudSubRep3LblEconomia2: TppLabel;
    CdsProcesso: TCMClientDataSet;
    sqlProcesso: TCMSqlParams;
    CdsObj: TCMClientDataSet;
    sqlObj: TCMSqlParams;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    CdsParamRH: TCMClientDataSet;
    ppLabel1: TppLabel;
    rpProcJudSubRep2Valor: TppDBText;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    VALORCUSTAS: TppField;
    ppLabel4: TppLabel;
    rpProcJudSubRep2RefValor: TppDBText;
    REFVALOR: TppField;
    procedure rpProcJudSmryBndAfterPrint(Sender: TObject);
    procedure qryProcJudAfterScroll(DataSet: TDataSet);
    procedure rpProcJudSubRep3DtlBndBeforePrint(Sender: TObject);
    procedure rpProcJudSubRep2TitBndBeforePrint(Sender: TObject);
    procedure qryProcJud1AfterOpen(DataSet: TDataSet);
    procedure rpProcJudSubRep1TitBndBeforePrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpProcJudSubRep3TitBndBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    CtrlCustomProcTrab: TCtrlCustomProcTrab;
    CtrlGlobalRH: TCtrlGlobalRH;

    EstadoProc: TArrayEstadoProc;

    procedure HabilitarImpressaoRelat;
    procedure GerarDadosRelat;
    procedure ConfigImpressaoRelat;
    procedure GerarListaEstadoProc;
    procedure GerarValoresProcJud;
    procedure GerarValoresResumoProcJud;
  end;

var
  RptProcJud: TRptProcJud;

implementation

uses ppTypes, uSistema, uCtrlPadroes, fAguarde, uModulo, uCtrlFuncoesRH, dCds;

const
  TIPO_SIT_PROC: array[0..1] of string[3] = ('Abr', 'Enc');
  STATUS_PROC: array[0..2] of string[7] = ('Passiva', 'Ativa', 'Ñ Parte');

{$R *.DFM}

procedure TRptProcJud.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlCustomProcTrab := TCtrlCustomProcTrab.Create(Sistema.IdEmpresa, Sistema.TipoEmpresa);
  CtrlCustomProcTrab.InitializeAs(Padroes);
end;

procedure TRptProcJud.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlCustomProcTrab);
  FreeAndNil(CtrlGlobalRH);
  inherited;
end;

procedure TRptProcJud.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  CdsParamRH.Data := CtrlGlobalRH.GetParamRH('FLGPERCPROB');

  frmAguarde.Update;
  qryProcJud.AfterScroll := nil;

  HabilitarImpressaoRelat;
  GerarDadosRelat;
  ConfigImpressaoRelat;

  qryProcJud.First;
  qryProcJud.AfterScroll := qryProcJudAfterScroll;
end;

procedure TRptProcJud.qryProcJudAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;                  
end;

procedure TRptProcJud.qryProcJud1AfterOpen(DataSet: TDataSet);
begin
  if (qryProcJud1.IsEmpty) then
  begin
    qryProcJud1Aux.Open;
    dsProcJud1.DataSet := qryProcJud1Aux;
  end
  else
    dsProcJud1.DataSet := qryProcJud1;
end;

procedure TRptProcJud.rpProcJudSubRep1TitBndBeforePrint(Sender: TObject);
begin
  TppBand(Sender).Visible := not(dsProcJud1.DataSet.IsEmpty) and
    (dsProcJud1.DataSet.FieldByName('LITISCONSORTE').asString <> 'Indefinido');
end;

procedure TRptProcJud.rpProcJudSubRep2TitBndBeforePrint(Sender: TObject);
begin
  rpProcJudSubRep2TitBnd.Visible := (rpProcJudSubRep2.Visible) and not(qryProcJud2.IsEmpty);
  rpProcJudSubRep2DtlBnd.Visible := (rpProcJudSubRep2.Visible) and not(qryProcJud2.IsEmpty);
  rpProcJudSubRep2SmryBnd.Visible := (rpProcJudSubRep2.Visible) and not(qryProcJud2.IsEmpty);

  rpProcJudSubRep2DBMemo1.Visible := CmpRptCM.ParamByName('ImprimirObsEtapa').asBoolean;
  if (CmpRptCM.ParamByName('ImprimirObsEtapa').asBoolean) then
  begin
    rpProcJudSubRep2DBMemo1.Left := 37.306;
    rpProcJudSubRep2DBMemo1.Top := 3.704;
  end;
end;

procedure TRptProcJud.rpProcJudSubRep3TitBndBeforePrint(Sender: TObject);
begin
  rpProcJudSubRep3TitBnd.Visible := (rpProcJudSubRep3.Visible) and not(qryProcJud3.IsEmpty);
  rpProcJudSubRep3DtlBnd.Visible := (rpProcJudSubRep3.Visible) and not(qryProcJud3.IsEmpty);
  rpProcJudSubRep3SmryBnd.Visible := (rpProcJudSubRep3.Visible) and not(qryProcJud3.IsEmpty);
end;

procedure TRptProcJud.rpProcJudSubRep3DtlBndBeforePrint(Sender: TObject);
var
  rValTemp1, rValTemp2, rValTemp3: real;
begin
  rpProcJudSubRep3LblRiscoMax.Caption := '';
  rpProcJudSubRep3LblRiscoProv.Caption := '';
  rpProcJudSubRep3LblValorReal.Caption := '';
  rpProcJudSubRep3LblEconomia1.Caption := '';
  rpProcJudSubRep3LblEconomia2.Caption := '';

  if (CmpRptCM.ParamByName('ImprimirObj').asBoolean) and
     (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0) and
     not(qryProcJud3.IsEmpty) then
  begin
    if (Modulo.IdContraCheque = FUNCEF) then
      rValTemp1 := qryProcJud3.FieldByName('VALORRECL').asFloat
    else
      rValTemp1 := CtrlCustomProcTrab.GetValorAtual(
        qryProcJud3.FieldByName('VALORRECL').asFloat,
        CtrlCustomProcTrab.GetDataHist(qryProcJud.FieldByName('DATANOTIF')),
        qryProcJud.FieldByName('MOEDAPROCTRAB').asInteger,
        qryProcJud.FieldByName('IDREGRA').asFloat,
        qryProcJud.FieldByName('NUMPROCTRAB').asFloat,
        qryProcJud.FieldByName('INDTAXACONV').asInteger);

    rValTemp2 := rValTemp1 * qryProcJud3.FieldByName('PERCPROB').asFloat / 100;
    if (CdsParamRH.FieldByName('FLGPERCPROB').asInteger = 1) then  // sobre Estim.Original
      rValTemp2 := rValTemp2 * qryProcJud3.FieldByName('PERCORIG').asFloat / 100;

    if not(CmpRptCM.ParamByName('ExibirRelatRiscoMax').asBoolean) then
      rValTemp1 := rValTemp1 * qryProcJud3.FieldByName('PERCORIG').asFloat / 100;

    rpProcJudSubRep3LblRiscoMax.Caption := FormatFloat('###,###,##0.00',rValTemp1);

    if (rValTemp2 = 0) then
      rpProcJudSubRep3LblRiscoProv.Caption := ''
    else
      rpProcJudSubRep3LblRiscoProv.Caption := FormatFloat('###,###,##0.00',rValTemp2);

    if (qryProcJud.FieldByName('FLGSITPROC').asInteger = 1) then
    begin
      if (Modulo.IdContraCheque = FUNCEF) then
        rValTemp3 := qryProcJud3.FieldByName('VALORSENTENCA').asFloat
      else
        rValTemp3 := CtrlCustomProcTrab.GetValorAtual(
          qryProcJud3.FieldByName('VALORSENTENCA').asFloat,
          CtrlCustomProcTrab.GetDataHist(qryProcJud.FieldByName('DATAEFETENC')),
          qryProcJud.FieldByName('MOEDAPROCTRAB').asInteger,
          qryProcJud.FieldByName('IDREGRA').asFloat,
          qryProcJud.FieldByName('NUMPROCTRAB').asFloat,
          qryProcJud.FieldByName('INDTAXACONV').asInteger);

      if (rValTemp3 = 0) then
        rpProcJudSubRep3LblValorReal.Caption := ''
      else
        rpProcJudSubRep3LblValorReal.Caption := FormatFloat('###,###,##0.00',rValTemp3);

      if ((rValTemp1 - rValTemp3) = 0) then
        rpProcJudSubRep3LblEconomia1.Caption := ''
      else
        rpProcJudSubRep3LblEconomia1.Caption := FormatFloat('###,###,##0.00',rValTemp1 - rValTemp3);

      if ((rValTemp2 - rValTemp3) = 0) then
        rpProcJudSubRep3LblEconomia2.Caption := ''
      else
        rpProcJudSubRep3LblEconomia2.Caption := FormatFloat('###,###,##0.00',rValTemp2 - rValTemp3);
    end;
  end;
end;

procedure TRptProcJud.rpProcJudSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TRptProcJud.HabilitarImpressaoRelat;
begin
  // Habilitar impressão dos Litisconsortes
  rpProcJudSubRep1.Visible := (CmpRptCM.ParamByName('ImprimirLitis').asInteger < 2);
  if (rpProcJudSubRep1.Visible) then
  begin
    rpProcJudSubRep1.DataPipeline := ppProcJud1;
    rpProcJudSubRep1Lbl2.Visible := (CmpRptCM.ParamByName('ImprimirLitis').asInteger = 0);
    rpProcJudSubRep1DBTxt2.Visible := (CmpRptCM.ParamByName('ImprimirLitis').asInteger = 0);
  end
  else
    rpProcJudSubRep1.DataPipeline := nil;

  // Habilitar impressão das Etapas
  rpProcJudSubRep2.Visible := CmpRptCM.ParamByName('ImprimirEtapa').asBoolean;
  if (rpProcJudSubRep2.Visible) then
  begin
    rpProcJudSubRep2.DataPipeline := ppProcJud2;
    qryProcJud2.SQL[10] := '';
  end
  else
    rpProcJudSubRep2.DataPipeline := nil;

  if (CmpRptCM.ParamByName('ImprimirEtapaSel').asBoolean) and
     (Trim(CmpRptCM.ParamByName('ListaCodEtapa').asString) <> '') then
    qryProcJud2.SQL[10] := '  (E.CODTIPORECURSO ' +CmpRptCM.ParamByName('ListaCodEtapa').asString+ ') AND';

  if not(CmpRptCM.ParamByName('ImprimirEtapa').asBoolean) or
    ((CmpRptCM.ParamByName('ImprimirEtapaSel').asBoolean) and
     (Trim(CmpRptCM.ParamByName('ListaCodEtapa').asString) = '')) then
    qryProcJud2.SQL[10] := '  (1 = 2) AND'; // Não deve ser mostrado

  // Habilitar impressão dos Objetos
  rpProcJudSubRep3.Visible := CmpRptCM.ParamByName('ImprimirObj').asBoolean;
  if (rpProcJudSubRep3.Visible) then
  begin
    rpProcJudSubRep3.DataPipeline := ppProcJud3;
    qryProcJud3.SQL[8] := '';
  end
  else
    rpProcJudSubRep3.DataPipeline := nil;

  if (CmpRptCM.ParamByName('ImprimirObjSel').asBoolean) and
     (Trim(CmpRptCM.ParamByName('ListaCodObjeto').asString) <> '') then
    qryProcJud3.SQL[8] := '  (O.CODTIPOOBJETO ' +CmpRptCM.ParamByName('ListaCodObjeto').asString+ ') AND';

  if not(rpProcJudSubRep3.Visible) or
     ((CmpRptCM.ParamByName('ImprimirObjSel').asBoolean) and
      (Trim(CmpRptCM.ParamByName('ListaCodObjeto').asString) = '')) then
    qryProcJud3.SQL[8] := '  (1 = 2) AND'; // Não deve ser mostrado

  // Habilitar impressão do Resumo
  rpProcJudSubRep4.Visible := CmpRptCM.ParamByName('ImprimirResumo').asBoolean;
  if (rpProcJudSubRep4.Visible) then
  begin
    if not(qryProcJud4.IsEmpty) then
      qryProcJud4.CancelUpdates;
    qryProcJud4.Close;
    qryProcJud4.Open;
    rpProcJudSubRep4.DataPipeline := ppProcJud4;
  end
  else
    rpProcJudSubRep4.DataPipeline := nil;
end;

procedure TRptProcJud.GerarDadosRelat;
var
  c: integer;
begin
  frmAguarde.Update;
  sqlProcesso.SQL.Text := CmpRptCM.ParamByName('SQL').asString;
  sqlProcesso.Open;
  frmAguarde.Update;

  if not(qryProcJud.IsEmpty) then
    qryProcJud.CancelUpdates;
  qryProcJud.Open;
  if not(CdsProcesso.IsEmpty) then
  begin
    frmAguarde.Min := 0;
    frmAguarde.Max := CdsProcesso.RecordCount;

    GerarListaEstadoProc;

    CdsProcesso.First;
    repeat
      qryProcJud.Insert;
      qryProcJud.FieldByName('EMPRESA').asString := Sistema.NomeEmpresa;
      qryProcJud.FieldByName('CONTRAPARTE').asString := CdsProcesso.FieldByName('NOME').asString;
      qryProcJud.FieldByName('NUMVARAJUSTICA').asString := CdsProcesso.FieldByName('NUMVARAJUSTICA').asString;
      qryProcJud.FieldByName('DATANOTIF').asString := CdsProcesso.FieldByName('DATANOTIF').asString;

      if (CmpRptCM.ParamByName('ImprimirNumProcVara').asBoolean) then
        qryProcJud.FieldByName('PROCJCJNUM').asString := CdsProcesso.FieldByName('PROCJCJNUM').asString
      else
        qryProcJud.FieldByName('PROCJCJNUM').asString := CdsProcesso.FieldByName('NUMPROCTRAB').asString;

      qryProcJud.FieldByName('NUMPROCTRAB').asFloat := CdsProcesso.FieldByName('NUMPROCTRAB').asFloat;
      qryProcJud.FieldByName('MOEDAPROCTRAB').asInteger := CdsProcesso.FieldByName('MOEDAPROCTRAB').asInteger;
      qryProcJud.FieldByName('IDREGRA').asString := CdsProcesso.FieldByName('IDREGRA').asString;
      qryProcJud.FieldByName('INDTAXACONV').asString := CdsProcesso.FieldByName('INDTAXACONV').asString;
      qryProcJud.FieldByName('DATAEFETENC').asString := CdsProcesso.FieldByName('DATAEFETENC').asString;
      qryProcJud.FieldByName('FLGSITPROC').asString := CdsProcesso.FieldByName('FLGSITPROC').asString;

      if (High(EstadoProc)+1 > 0) then
        for c:=0 to High(EstadoProc) do
          if (CdsProcesso.FieldByName('IDESTADO').asString = EstadoProc[c].ID) then
          begin
            qryProcJud.FieldByName('UF').asString := EstadoProc[c].UF;
            break;
          end;

      if (CdsProcesso.Fields.FindField('NOMEVARA') <> nil) then
        qryProcJud.FieldByName('NOMEVARA').asString := CdsProcesso.FieldByName('NOMEVARA').asString;

      qryProcJud.FieldByName('SITUACAO').asString := TIPO_SIT_PROC[CdsProcesso.FieldByName('FLGSITPROC').asInteger];
      qryProcJud.FieldByName('PARTE').asString := STATUS_PROC[CdsProcesso.FieldByName('FLGPARTEATIVA').asInteger];

      if (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0) then
        GerarValoresProcJud;

      if (CmpRptCM.ParamByName('ImprimirResumo').asBoolean) then
        GerarValoresResumoProcJud;

      qryProcJud.Post;
      CdsProcesso.Next;
    until (CdsProcesso.EOF);

    if (CmpRptCM.ParamByName('ImprimirResumo').asBoolean) then
      qryProcJud4.Post;

    SetLength(EstadoProc,0);
  end
  else
  begin
    rpProcJudDBCalc1.Visible := false;
    qryProcJud.Insert;
    qryProcJud.Post;
  end;
end;

procedure TRptProcJud.ConfigImpressaoRelat;
var
  sLabel11, sLabel16, sLabel17: string;
begin
  if (Modulo.IdContraCheque = REFER) or (Modulo.IdContraCheque = FUNCEF) then
  begin
    sLabel11 := 'da Causa';
    sLabel16 := 's/Causa';
    sLabel17 := 'Valor da Causa';
  end
  else
  begin
    sLabel11 := 'Reclamado';
    sLabel16 := 'S/Reclamado';
    sLabel17 := 'Valor Reclamado';
  end;

  // Título do Relatório
  rpProcJudLbl1.Caption := CmpRptCM.ParamByName('TituloRelatorio').asString;

  if (CmpRptCM.ParamByName('ImprimirLitis').asInteger < 2) then
    rpProcJudLbl6.Caption := 'Contraparte e Litisconsortes'
  else
    rpProcJudLbl6.Caption := 'Contraparte';

  rpProcJudLbl11.Caption :=
    FU.IFF(CmpRptCM.ParamByName('ExibirRelatRiscoMax').asBoolean,sLabel11, 'Original');
  rpProcJudSubRep4Lbl7.Caption :=
    FU.IFF(CmpRptCM.ParamByName('ExibirRelatRiscoMax').asBoolean, sLabel17, 'Valor Original');
  rpProcJudSubRep4Lbl10.Caption :=
    FU.IFF(CmpRptCM.ParamByName('ExibirRelatRiscoMax').asBoolean, sLabel16, 'S/Original');

  if (CmpRptCM.ParamByName('OpcaoImpressao').asInteger > 0) then
  begin
    rpProcJudLbl11.Caption := 'Órgão Jurisdicional (Vara de Justiça)';
    rpProcJudLbl11.TextAlignment := taLeftJustified;
    rpProcJudLbl11.Width := rpProcJudDBTxtNomeVara.Width;
    rpProcJudLbl16.Left  := rpProcJudDBTxtNumVara.Left;
    rpProcJudLbl16.Width := rpProcJudDBTxtNumVara.Width;
    rpProcJudLbl16.Caption := 'Nº';
    rpProcJudLbl16.TextAlignment := taCentered;
  end
  else
  begin
    rpProcJudLbl11.Caption :=
      FU.IFF(CmpRptCM.ParamByName('ExibirRelatRiscoMax').asBoolean,sLabel11,'Original');
    rpProcJudLbl11.TextAlignment := taCentered;
    rpProcJudLbl11.Width := rpProcJudDBTxtRiscoMax.Width;
    rpProcJudLbl16.Left  := 242.623;
    rpProcJudLbl16.Width := 16.404;
    rpProcJudLbl16.Caption :=
      FU.IFF(CmpRptCM.ParamByName('ExibirRelatRiscoMax').asBoolean,sLabel16,'s/Original');
    rpProcJudLbl16.TextAlignment := taCentered;
  end;

  rpProcJudHdrBnd.Visible := CmpRptCM.ParamByName('ImprimirCabRod').asBoolean;
  rpProcJudGrpFootBnd0.Visible := CmpRptCM.ParamByName('ImprimirCabRod').asBoolean;
  rpProcJudShape1.Visible :=
    (CmpRptCM.ParamByName('ImprimirLitis').asInteger < 2) or
    (CmpRptCM.ParamByName('ImprimirEtapa').asBoolean) or
    (CmpRptCM.ParamByName('ImprimirObj').asBoolean);
  rpProcJudLbl10.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcJudLbl12.Visible := rpProcJudLbl10.Visible;
  rpProcJudLbl13.Visible := rpProcJudLbl10.Visible;
  rpProcJudLbl14.Visible := rpProcJudLbl10.Visible;
  rpProcJudLbl15.Visible := rpProcJudLbl10.Visible;
  rpProcJudLbl17.Visible := rpProcJudLbl10.Visible;
  rpProcJudLbl18.Visible := rpProcJudLbl10.Visible;
  rpProcJudLbl20.Visible := rpProcJudLbl10.Visible;
  rpProcJudDBTxtRiscoMax.Visible := rpProcJudLbl10.Visible;
  rpProcJudDBTxtNomeVara.Visible := not(rpProcJudLbl10.Visible);
  rpProcJudDBTxt9.Visible := rpProcJudLbl10.Visible;
  rpProcJudDBTxt10.Visible := rpProcJudLbl10.Visible;
  rpProcJudDBTxtEconomia1.Visible := rpProcJudLbl10.Visible;
  rpProcJudDBTxtNumVara.Visible := not(rpProcJudLbl10.Visible);
  rpProcJudDBTxt11.Visible := rpProcJudLbl10.Visible;
  rpProcJudDBCalc2.Visible := rpProcJudLbl10.Visible;
  rpProcJudDBCalc3.Visible := rpProcJudLbl10.Visible;
  rpProcJudDBCalc4.Visible := rpProcJudLbl10.Visible;
  rpProcJudDBCalc5.Visible := rpProcJudLbl10.Visible;
  rpProcJudDBCalc6.Visible := rpProcJudLbl10.Visible;

  rpProcJudDBTxt1.Width := rpProcJud.PrinterSetup.PaperWidth -
    (rpProcJud.PrinterSetup.MarginLeft * 2) - (rpProcJudDBTxt1.Left * 2);
  rpProcJudLbl1.Width := rpProcJudDBTxt1.Width;

  // Habilitações no Resumo por UF
  rpProcJudSubRep4Lbl6.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcJudSubRep4Lbl7.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcJudSubRep4Lbl8.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcJudSubRep4Lbl9.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcJudSubRep4Lbl10.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcJudSubRep4Lbl11.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcJudSubRep4DBTxt4.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcJudSubRep4DBTxt5.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcJudSubRep4DBTxt6.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcJudSubRep4DBTxt7.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcJudSubRep4DBTxt8.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcJudSubRep4DBCalc2.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcJudSubRep4DBCalc3.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcJudSubRep4DBCalc4.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcJudSubRep4DBCalc5.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
  rpProcJudSubRep4DBCalc6.Visible := (CmpRptCM.ParamByName('OpcaoImpressao').asInteger = 0);
end;

procedure TRptProcJud.GerarListaEstadoProc;
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

procedure TRptProcJud.GerarValoresProcJud;
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
    if (Modulo.IdContraCheque = FUNCEF) then
      dValorReclamado := CdsObj.FieldByName('VALORRECL').asFloat
    else
      dValorReclamado := CtrlCustomProcTrab.GetValorAtual(
        CdsObj.FieldByName('VALORRECL').asFloat,
        CtrlCustomProcTrab.GetDataHist(CdsProcesso.FieldByName('DATANOTIF')),
        CdsProcesso.FieldByName('MOEDAPROCTRAB').asInteger,
        CdsProcesso.FieldByName('IDREGRA').asFloat,
        CdsProcesso.FieldByName('NUMPROCTRAB').asFloat,
        CdsProcesso.FieldByName('INDTAXACONV').asInteger);

    if (Modulo.IdContraCheque = FUNCEF) then
      dValReal := CdsObj.FieldByName('VALORSENTENCA').asFloat
    else
      dValReal := dValReal + CtrlCustomProcTrab.GetValorAtual(
        CdsObj.FieldByName('VALORSENTENCA').asFloat,
        CtrlCustomProcTrab.GetDataHist(CdsProcesso.FieldByName('DATAEFETENC')),
        CdsProcesso.FieldByName('MOEDAPROCTRAB').asInteger,
        CdsProcesso.FieldByName('IDREGRA').asFloat,
        CdsProcesso.FieldByName('NUMPROCTRAB').asFloat,
        CdsProcesso.FieldByName('INDTAXACONV').asInteger);

    if (CdsParamRH.FieldByName('FLGPERCPROB').asInteger = 1) then  // sobre Estim.Original
      dRiscoProv := dRiscoProv + dValorReclamado * CdsObj.FieldByName('PERCPROB').asFloat *
                CdsObj.FieldByName('PERCORIG').asFloat / 10000
    else
      dRiscoProv := dRiscoProv + dValorReclamado * CdsObj.FieldByName('PERCPROB').asFloat / 100;

    if (CmpRptCM.ParamByName('ExibirRelatRiscoMax').asBoolean) then
      dRiscoMax := dRiscoMax + dValorReclamado
    else
      dRiscoMax := dRiscoMax + dValorReclamado -
        ((100 - CdsObj.FieldByName('PERCORIG').asFloat) * dValorReclamado / 100);

    CdsObj.Next;
  end;
  CdsObj.First;

  qryProcJud.FieldByName('RISCOMAXIMO').asFloat := dRiscoMax;
  qryProcJud.FieldByName('RISCOPROVAVEL').asFloat := dRiscoProv;

  if (CdsProcesso.FieldByName('FLGSITPROC').asInteger = 1) then
  begin
    qryProcJud.FieldByName('VALORREAL').asFloat := dValReal;
    qryProcJud.FieldByName('ECONOMIA1').asFloat := dRiscoMax  - dValReal;
    qryProcJud.FieldByName('ECONOMIA2').asFloat := dRiscoProv - dValReal;
  end
  else
  begin
    qryProcJud.FieldByName('VALORREAL').asFloat := 0;
    qryProcJud.FieldByName('ECONOMIA1').asFloat := 0;
    qryProcJud.FieldByName('ECONOMIA2').asFloat := 0;
  end;
end;

procedure TRptProcJud.GerarValoresResumoProcJud;
var
  c: integer;
begin
  if not(qryProcJud4.Locate('IDESTADO',CdsProcesso.FieldByName('IDESTADO').asFloat,[])) then
  begin
    qryProcJud4.Insert;
    qryProcJud4.FieldByName('IDESTADO').asFloat := CdsProcesso.FieldByName('IDESTADO').asFloat;
    qryProcJud4.FieldByName('EMPRESA').asString := qryProcJud.FieldByName('EMPRESA').asString;

    if (High(EstadoProc)+1 > 0) then
      for c:=0 to High(EstadoProc) do
        if (CdsProcesso.FieldByName('IDESTADO').asString = EstadoProc[c].ID) then
        begin
          qryProcJud4.FieldByName('ESTADO').asString := EstadoProc[c].Nome;
          break;
        end;
  end
  else
    qryProcJud4.Edit;

  qryProcJud4.FieldByName('QTDPROC').asInteger := qryProcJud4.FieldByName('QTDPROC').asInteger + 1;
  qryProcJud4.FieldByName('VALRECLAMADO').asFloat := qryProcJud4.FieldByName('VALRECLAMADO').asFloat +
    qryProcJud.FieldByName('RISCOMAXIMO').asFloat;
  qryProcJud4.FieldByName('VALESTIMADO').asFloat := qryProcJud4.FieldByName('VALESTIMADO').asFloat +
    qryProcJud.FieldByName('RISCOPROVAVEL').asFloat;
  qryProcJud4.FieldByName('VALREAL').asFloat := qryProcJud4.FieldByName('VALREAL').asFloat +
    qryProcJud.FieldByName('VALORREAL').asFloat;
  qryProcJud4.FieldByName('ECONRECLAMADO').asFloat := qryProcJud4.FieldByName('ECONRECLAMADO').asFloat +
    qryProcJud.FieldByName('ECONOMIA1').asFloat;
  qryProcJud4.FieldByName('ECONESTIMADO').asFloat := qryProcJud4.FieldByName('ECONESTIMADO').asFloat +
    qryProcJud.FieldByName('ECONOMIA2').asFloat;
end;

end.
