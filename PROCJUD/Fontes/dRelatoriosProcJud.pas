unit dRelatoriosProcJud;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dReports,
  DBTables, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db,
  Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppMemo;

type
  TdtmRelatoriosProcJud = class(TdtmReports)
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
    procedure rpProcJudSmryBndAfterPrint(Sender: TObject);
    procedure qryProcJudAfterScroll(DataSet: TDataSet);
    procedure rpProcJudSubRep3DtlBndBeforePrint(Sender: TObject);
    procedure rpProcJudSubRep2TitBndBeforePrint(Sender: TObject);
    procedure qryProcJud1AfterOpen(DataSet: TDataSet);
    procedure rpProcJudSubRep1TitBndBeforePrint(Sender: TObject);
  public
    bImprimeLitis, bImprimeEtapa, bImprimeObj, bImprimeObsEtapa, bImprimeOpcao,
    bExibeRelatRiscoMax: boolean;

    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelatoriosProcJud: TdtmRelatoriosProcJud;

implementation

uses fAguarde, uValorAtual, fParamProcJud;

{$R *.DFM}

function TdtmRelatoriosProcJud.MostraParam(Form: string): boolean;
var
  frm: TForm;
begin
  if (AnsiUpperCase(Form) = 'FRMPARAMPROCJUD') then
    frm := TfrmParamProcJud.Create(Application)
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

procedure TdtmRelatoriosProcJud.qryProcJudAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TdtmRelatoriosProcJud.qryProcJud1AfterOpen(DataSet: TDataSet);
begin
  if (qryProcJud1.IsEmpty) then
  begin
    qryProcJud1Aux.Open;
    dsProcJud1.DataSet := qryProcJud1Aux;
  end
  else
    dsProcJud1.DataSet := qryProcJud1;
end;

procedure TdtmRelatoriosProcJud.rpProcJudSubRep1TitBndBeforePrint(Sender: TObject);
begin
  TppBand(Sender).Visible := not(dsProcJud1.DataSet.IsEmpty) and
    (dsProcJud1.DataSet.FieldByName('LITISCONSORTE').asString <> 'Indefinido');
end;

procedure TdtmRelatoriosProcJud.rpProcJudSubRep2TitBndBeforePrint(Sender: TObject);
begin
  TppBand(Sender).Visible := (bImprimeEtapa) and not(qryProcJud2.IsEmpty);
  rpProcJudSubRep2DBMemo1.Visible := (bImprimeObsEtapa);
  if (bImprimeObsEtapa) then
  begin
    rpProcJudSubRep2DBMemo1.Left := 37.306;
    rpProcJudSubRep2DBMemo1.Top  := 3.704;
  end;
end;

procedure TdtmRelatoriosProcJud.rpProcJudSubRep3DtlBndBeforePrint(Sender: TObject);
var
  rValTemp1,rValTemp2,rValTemp3: real;
begin
  rpProcJudSubRep3LblRiscoMax.Caption := '';
  rpProcJudSubRep3LblRiscoProv.Caption := '';
  rpProcJudSubRep3LblValorReal.Caption := '';
  rpProcJudSubRep3LblEconomia1.Caption := '';
  rpProcJudSubRep3LblEconomia2.Caption := '';
  
  if (bImprimeObj) and (bImprimeOpcao) and not(qryProcJud3.IsEmpty) then
  begin
    rValTemp1 := ValorAtual(qryProcJud3.FieldByName('VALORRECL').asFloat,
      qryProcJud.FieldByName('DATANOTIF').asString,
      qryProcJud.FieldByName('MOEDAPROCTRAB').asString,
      qryProcJud.FieldByName('IDREGRA').asString,
      qryProcJud.FieldByName('NUMPROCTRAB').asString,
      qryProcJud.FieldByName('INDTAXACONV').asInteger);
    rValTemp2 := rValTemp1 * qryProcJud3.FieldByName('PERCPROB').asFloat / 100;

    if not (bExibeRelatRiscoMax) then
      rValTemp1 := rValTemp1 * qryProcJud3.FieldByName('PERCORIG').asFloat / 100;

    rpProcJudSubRep3LblRiscoMax.Caption := FormatFloat('###,###,##0',rValTemp1);

    if (rValTemp2 = 0) then
      rpProcJudSubRep3LblRiscoProv.Caption := ''
    else
      rpProcJudSubRep3LblRiscoProv.Caption := FormatFloat('###,###,##0',rValTemp2);

    if (qryProcJud.FieldByName('FLGSITPROC').asInteger = 1) then
    begin
      rValTemp3 := ValorAtual(qryProcJud3.FieldByName('VALORSENTENCA').asFloat,
        qryProcJud.FieldByName('DATAEFETENC').asString,
        qryProcJud.FieldByName('MOEDAPROCTRAB').asString,
        qryProcJud.FieldByName('IDREGRA').asString,
        qryProcJud.FieldByName('NUMPROCTRAB').asString,
        qryProcJud.FieldByName('INDTAXACONV').asInteger);

      if (rValTemp3 = 0) then
        rpProcJudSubRep3LblValorReal.Caption := ''
      else
        rpProcJudSubRep3LblValorReal.Caption := FormatFloat('###,###,##0',rValTemp3);

      if ((rValTemp1 - rValTemp3) = 0) then
        rpProcJudSubRep3LblEconomia1.Caption := ''
      else
        rpProcJudSubRep3LblEconomia1.Caption := FormatFloat('###,###,##0',rValTemp1 - rValTemp3);

      if ((rValTemp2 - rValTemp3) = 0) then
        rpProcJudSubRep3LblEconomia2.Caption := ''
      else
        rpProcJudSubRep3LblEconomia2.Caption := FormatFloat('###,###,##0',rValTemp2 - rValTemp3);
    end;
  end;
end;

procedure TdtmRelatoriosProcJud.rpProcJudSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
