unit dRelatoriosProcPrev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dReports,
  DBTables, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db,
  Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppMemo;

type
  TdtmRelatoriosProcPrev = class(TdtmReports)
    rpProcTrab: TppReport;
    ppProcTrab: TppBDEPipeline;
    dsProcTrab: TwwDataSource;
    qryProcTrab: TwwQuery;
    updProcTrab: TUpdateSQL;
    ppProcTrab1: TppBDEPipeline;
    dsProcTrab1: TwwDataSource;
    qryProcTrab1: TwwQuery;
    rpProcTrabHdrBnd: TppHeaderBand;
    rpProcTrabDtlBnd: TppDetailBand;
    rpProcTrabFootBnd: TppFooterBand;
    rpProcTrabSmryBnd: TppSummaryBand;
    rpProcTrabLbl7: TppLabel;
    rpProcTrabLbl1: TppLabel;
    rpProcTrabDBTxt1: TppDBText;
    rpProcTrabLbl4: TppLabel;
    rpProcTrabLbl5: TppLabel;
    rpProcTrabLbl6: TppLabel;
    rpProcTrabLbl8: TppLabel;
    rpProcTrabLbl9: TppLabel;
    rpProcTrabLbl10: TppLabel;
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
    rpProcTrabGrp0: TppGroup;
    rpProcTrabGrpHdrBnd0: TppGroupHeaderBand;
    rpProcTrabGrpFootBnd0: TppGroupFooterBand;
    rpProcTrabGrp1: TppGroup;
    rpProcTrabGrpHdrBnd1: TppGroupHeaderBand;
    rpProcTrabGrpFootBnd1: TppGroupFooterBand;
    rpProcTrabShape1: TppShape;
    rpProcTrabDBTxt2: TppDBText;
    rpProcTrabDBTxt3: TppDBText;
    rpProcTrabDBTxt4: TppDBText;
    rpProcTrabDBTxt5: TppDBText;
    rpProcTrabDBTxt6: TppDBText;
    rpProcTrabDBTxt7: TppDBText;
    rpProcTrabDBTxt8: TppDBText;
    rpProcTrabDBTxt9: TppDBText;
    rpProcTrabDBTxt10: TppDBText;
    rpProcTrabDBTxt11: TppDBText;
    rpProcTrabDBTxtCARGO: TppDBText;
    rpProcTrabDBTxt12: TppDBText;
    rpProcTrabDBTxt13: TppDBText;
    rpProcTrabDBTxt14: TppDBText;
    rpProcTrabDBTxt15: TppDBText;
    rpProcTrabSubRep1: TppSubReport;
    rpProcTrabChildRep1: TppChildReport;
    rpProcTrabSubRep1TitBnd: TppTitleBand;
    rpProcTrabSubRep1DtlBnd: TppDetailBand;
    rpProcTrabSubRep1Lbl1: TppLabel;
    rpProcTrabSubRep1Lbl2: TppLabel;
    rpProcTrabSubRep1DBTxt1: TppDBText;
    rpProcTrabSubRep1DBTxt2: TppDBText;
    ppProcTrab2: TppBDEPipeline;
    dsProcTrab2: TwwDataSource;
    qryProcTrab2: TwwQuery;
    ppProcTrab3: TppBDEPipeline;
    dsProcTrab3: TwwDataSource;
    qryProcTrab3: TwwQuery;
    rpProcTrabSubRep2: TppSubReport;
    rpProcTrabChildRep2: TppChildReport;
    rpProcTrabSubRep2TitBnd: TppTitleBand;
    rpProcTrabSubRep2DtlBnd: TppDetailBand;
    rpProcTrabSubRep2Lbl1: TppLabel;
    rpProcTrabSubRep2Lbl2: TppLabel;
    rpProcTrabSubRep2Lbl3: TppLabel;
    rpProcTrabSubRep2DBTxt1: TppDBText;
    rpProcTrabSubRep2DBTxt2: TppDBText;
    rpProcTrabSubRep2DBTxt3: TppDBText;
    rpProcTrabSubRep2DBMemo1: TppDBMemo;
    rpProcTrabSubRep2SmryBnd: TppSummaryBand;
    rpProcTrabLbl22: TppLabel;
    rpProcTrabDBCalc1: TppDBCalc;
    rpProcTrabLbl23: TppLabel;
    rpProcTrabDBCalc2: TppDBCalc;
    rpProcTrabDBCalc3: TppDBCalc;
    rpProcTrabDBCalc4: TppDBCalc;
    rpProcTrabDBCalc5: TppDBCalc;
    rpProcTrabDBCalc6: TppDBCalc;
    rpProcTrabSubRep3: TppSubReport;
    rpProcTrabChildRep3: TppChildReport;
    rpProcTrabSubRep3TitBnd: TppTitleBand;
    rpProcTrabSubRep3Lbl1: TppLabel;
    rpProcTrabSubRep3Lbl2: TppLabel;
    rpProcTrabSubRep3DtlBnd: TppDetailBand;
    rpProcTrabSubRep3DBTxt1: TppDBText;
    rpProcTrabSubRep3DBTxt3: TppDBText;
    rpProcTrabSubRep3SmryBnd: TppSummaryBand;
    rpProcTrabSubRep3DBTxt2: TppDBText;
    rpProcTrabSubRep3LblRiscoMax: TppLabel;
    rpProcTrabSubRep3LblRiscoProv: TppLabel;
    rpProcTrabSubRep3LblValorReal: TppLabel;
    rpProcTrabSubRep3LblEconomia1: TppLabel;
    rpProcTrabSubRep3LblEconomia2: TppLabel;
    ppProcTrab4: TppBDEPipeline;
    dsProcTrab4: TwwDataSource;
    qryProcTrab4: TwwQuery;
    updProcTrab4: TUpdateSQL;
    rpProcTrabSubRep4: TppSubReport;
    rpProcTrabChildRep4: TppChildReport;
    rpProcTrabSubRep4TitBnd: TppTitleBand;
    rpProcTrabSubRep4DtlBnd: TppDetailBand;
    rpProcTrabSubRep4DBTxt2: TppDBText;
    rpProcTrabSubRep4DBTxt4: TppDBText;
    rpProcTrabSubRep4DBTxt3: TppDBText;
    rpProcTrabSubRep4Lbl6: TppLabel;
    rpProcTrabSubRep4Lbl1: TppLabel;
    rpProcTrabSubRep4DBTxt1: TppDBText;
    rpProcTrabSubRep4Lbl4: TppLabel;
    rpProcTrabSubRep4Lbl5: TppLabel;
    rpProcTrabSubRep4Lbl7: TppLabel;
    rpProcTrabSubRep4Lbl8: TppLabel;
    rpProcTrabSubRep4Lbl9: TppLabel;
    rpProcTrabSubRep4Lbl10: TppLabel;
    rpProcTrabSubRep4Lbl2: TppLabel;
    rpProcTrabSubRep4Lbl3: TppLabel;
    rpProcTrabSubRep4SysVar1: TppSystemVariable;
    rpProcTrabSubRep4SysVar2: TppSystemVariable;
    rpProcTrabSubRep4Lbl11: TppLabel;
    rpProcTrabSubRep4DBTxt5: TppDBText;
    rpProcTrabSubRep4DBTxt6: TppDBText;
    rpProcTrabSubRep4Line5: TppLine;
    rpProcTrabSubRep4Line6: TppLine;
    rpProcTrabSubRep4Line7: TppLine;
    rpProcTrabSubRep4Line8: TppLine;
    rpProcTrabSubRep4DBTxt7: TppDBText;
    rpProcTrabSubRep4DBTxt8: TppDBText;
    rpProcTrabSubRep4Line1: TppLine;
    rpProcTrabSubRep4Line4: TppLine;
    rpProcTrabSubRep4Shape1: TppShape;
    rpProcTrabSubRep4Line2: TppLine;
    rpProcTrabSubRep4Line3: TppLine;
    rpProcTrabSubRep4ShapeShape2: TppShape;
    rpProcTrabSubRep4Grp1: TppGroup;
    rpProcTrabSubRep4GrpHdrBnd: TppGroupHeaderBand;
    rpProcTrabSubRep4GrpFootBnd: TppGroupFooterBand;
    rpProcTrabSubRep4Lbl12: TppLabel;
    rpProcTrabSubRep4DBCalc1: TppDBCalc;
    rpProcTrabSubRep4DBCalc2: TppDBCalc;
    rpProcTrabSubRep4DBCalc3: TppDBCalc;
    rpProcTrabSubRep4DBCalc4: TppDBCalc;
    rpProcTrabSubRep4DBCalc5: TppDBCalc;
    rpProcTrabSubRep4DBCalc6: TppDBCalc;
    rpProcTrabSubRep4Shape3: TppShape;
    rpProcTrabSubRep4Line9: TppLine;
    rpProcTrabSubRep4Line10: TppLine;
    rpProcTrabSubRep4Line11: TppLine;
    rpProcTrabSubRep4Line12: TppLine;
    qryProcTrab1Aux: TwwQuery;
    ppSummaryBand1: TppSummaryBand;
    procedure rpProcTrabSmryBndAfterPrint(Sender: TObject);
    procedure rpProcTrabSubRep1TitBndBeforePrint(Sender: TObject);
    procedure qryProcTrabAfterScroll(DataSet: TDataSet);
    procedure rpProcTrabSubRep2TitBndBeforePrint(Sender: TObject);
    procedure rpProcTrabGrpHdrBnd1BeforePrint(Sender: TObject);
    procedure rpProcTrabSubRep3DtlBndBeforePrint(Sender: TObject);
    procedure qryProcTrab1AfterOpen(DataSet: TDataSet);
  public
    bImprimeLitis, bImprimeEtapa, bImprimeObj, bImprimeObsEtapa, bImprimeCargo,
    bImprimeOpcao, bExibeRelatRiscoMax: boolean;

    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelatoriosProcPrev: TdtmRelatoriosProcPrev;

implementation

uses fAguarde, uValorAtual, fParamProcTrab;

{$R *.DFM}

function TdtmRelatoriosProcPrev.MostraParam(Form: string): boolean;
var
  frm: TForm;
begin
  if (AnsiUpperCase(Form) = 'FRMPARAMPROCTRAB') then
    frm := TfrmParamProcTrab.Create(Application)
  else
  if (AnsiUpperCase(Form) = '') then
  begin
    Result := true;
    exit;
  end
  else
    frm := nil;

  if (frm = nil) then
    Result := false
  else
  begin
    with (frm) do
    begin
      Result := (ShowModal = mrOk);
      free;
    end;
  end;
end;

procedure TdtmRelatoriosProcPrev.qryProcTrabAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TdtmRelatoriosProcPrev.qryProcTrab1AfterOpen(DataSet: TDataSet);
begin
  if (qryProcTrab1.IsEmpty) then
  begin
    qryProcTrab1Aux.Open;
    dsProcTrab1.DataSet := qryProcTrab1Aux;
  end
  else
    dsProcTrab1.DataSet := qryProcTrab1;
end;

procedure TdtmRelatoriosProcPrev.rpProcTrabGrpHdrBnd1BeforePrint(Sender: TObject);
begin
  if (bImprimeCargo) and (Trim(qryProcTrab.FieldByName('CARGO').asString) <> '') then
  begin
    rpProcTrabGrpHdrBnd1.Height  := 10.054;
    rpProcTrabDBTxtCARGO.Visible := true;
    rpProcTrabDBTxtCARGO.Top     := 5.821;
  end
  else
  begin
    rpProcTrabGrpHdrBnd1.Height  := 5.556;
    rpProcTrabGrpHdrBnd0.Height  := 5.027;
    rpProcTrabDBTxtCARGO.Visible := false;
  end;
end;

procedure TdtmRelatoriosProcPrev.rpProcTrabSubRep1TitBndBeforePrint(Sender: TObject);
begin
  TppBand(Sender).Visible := not(dsProcTrab1.DataSet.IsEmpty) and
    (dsProcTrab1.DataSet.FieldByName('LITISCONSORTE').asString <> 'Indefinido');
end;

procedure TdtmRelatoriosProcPrev.rpProcTrabSubRep2TitBndBeforePrint(Sender: TObject);
begin
  TppBand(Sender).Visible := (bImprimeEtapa) and not(qryProcTrab2.IsEmpty);
  rpProcTrabSubRep2DBMemo1.Visible := (bImprimeObsEtapa);
  if (bImprimeObsEtapa) then
  begin
    rpProcTrabSubRep2DBMemo1.Left := 37.306;
    rpProcTrabSubRep2DBMemo1.Top  := 3.704;
  end;
end;

procedure TdtmRelatoriosProcPrev.rpProcTrabSubRep3DtlBndBeforePrint(Sender: TObject);
var
  rValTemp1,rValTemp2,rValTemp3: real;
begin
  rpProcTrabSubRep3LblRiscoMax.Caption := '';
  rpProcTrabSubRep3LblRiscoProv.Caption := '';
  rpProcTrabSubRep3LblValorReal.Caption := '';
  rpProcTrabSubRep3LblEconomia1.Caption := '';
  rpProcTrabSubRep3LblEconomia2.Caption := '';
  
  if (bImprimeObj) and (bImprimeOpcao) and not(qryProcTrab3.IsEmpty) then
  begin
    rValTemp1 := ValorAtual(qryProcTrab3.FieldByName('VALORRECL').asFloat,
      qryProcTrab.FieldByName('DATANOTIF').asString,
      qryProcTrab.FieldByName('MOEDAPROCTRAB').asString,
      qryProcTrab.FieldByName('IDREGRA').asString,
      qryProcTrab.FieldByName('NUMPROCTRAB').asString,
      qryProcTrab.FieldByName('INDTAXACONV').asInteger);
    rValTemp2 := rValTemp1 * qryProcTrab3.FieldByName('PERCPROB').asFloat / 100;

    if not (bExibeRelatRiscoMax) then
      rValTemp1 := rValTemp1 * qryProcTrab3.FieldByName('PERCORIG').asFloat / 100;

    rpProcTrabSubRep3LblRiscoMax.Caption := FormatFloat('###,###,##0',rValTemp1);

    if (rValTemp2 = 0) then
      rpProcTrabSubRep3LblRiscoProv.Caption := ''
    else
      rpProcTrabSubRep3LblRiscoProv.Caption := FormatFloat('###,###,##0',rValTemp2);

    if (qryProcTrab.FieldByName('FLGSITPROC').asInteger = 1) then
    begin
      rValTemp3 := ValorAtual(qryProcTrab3.FieldByName('VALORSENTENCA').asFloat,
        qryProcTrab.FieldByName('DATAEFETENC').asString,
        qryProcTrab.FieldByName('MOEDAPROCTRAB').asString,
        qryProcTrab.FieldByName('IDREGRA').asString,
        qryProcTrab.FieldByName('NUMPROCTRAB').asString,
        qryProcTrab.FieldByName('INDTAXACONV').asInteger);

      if (rValTemp3 = 0) then
        rpProcTrabSubRep3LblValorReal.Caption := ''
      else
        rpProcTrabSubRep3LblValorReal.Caption := FormatFloat('###,###,##0',rValTemp3);

      if ((rValTemp1 - rValTemp3) = 0) then
        rpProcTrabSubRep3LblEconomia1.Caption := ''
      else
        rpProcTrabSubRep3LblEconomia1.Caption := FormatFloat('###,###,##0',rValTemp1 - rValTemp3);

      if ((rValTemp2 - rValTemp3) = 0) then
        rpProcTrabSubRep3LblEconomia2.Caption := ''
      else
        rpProcTrabSubRep3LblEconomia2.Caption := FormatFloat('###,###,##0',rValTemp2 - rValTemp3);
    end;
  end;
end;

procedure TdtmRelatoriosProcPrev.rpProcTrabSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
