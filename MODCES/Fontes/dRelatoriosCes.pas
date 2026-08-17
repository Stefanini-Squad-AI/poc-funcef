unit dRelatoriosCes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppVar,
  ppRelatv, ppDBPipe, ppEndUsr;

type
  TdtmRelatoriosCes = class(TdtmReports)
    rpInconsistSal: TppReport;
    InconsistSalHdrBnd1: TppHeaderBand;
    InconsistSalLbl1: TppLabel;
    InconsistSalLbl2: TppLabel;
    InconsistSalLbl3: TppLabel;
    InconsistSalLbl4: TppLabel;
    InconsistSalLbl5: TppLabel;
    InconsistSalLine1: TppLine;
    InconsistSalDBTxt1: TppDBText;
    InconsistSalLbl6: TppLabel;
    InconsistSalLbl7: TppLabel;
    InconsistSalDtlBnd1: TppDetailBand;
    InconsistSalDBTxt2: TppDBText;
    InconsistSalDBTxt3: TppDBText;
    InconsistSalDBTxt4: TppDBText;
    InconsistSalDBTxt5: TppDBText;
    InconsistSalDBTxt6: TppDBText;
    InconsistSalFootBnd1: TppFooterBand;
    ppInconsistSal: TppBDEPipeline;
    dsInconsistSal: TwwDataSource;
    qryInconsistSal: TwwQuery;
    rpInconsistSalLabel1: TppLabel;
    rpInconsistSalDBCalc1: TppDBCalc;
    rpInconsistSalLabel2: TppLabel;
    rpInconsistSalLabel3: TppLabel;
    InconsistSalGrpFootBnd1: TppGroupFooterBand;
    InconsistSalGrpHdrBnd1: TppGroupHeaderBand;
    rpPesqSal: TppReport;
    rpPesqSalHdrBnd: TppHeaderBand;
    rpPesqSalLblTITULO: TppLabel;
    rpPesqSalLbl1: TppLabel;
    rpPesqSalLbl2: TppLabel;
    rpPesqSalLbl3: TppLabel;
    rpPesqSalLbl4: TppLabel;
    rpPesqSalLine1: TppLine;
    rpPesqSalLblMODA1: TppLabel;
    rpPesqSalDBTxt1: TppDBText;
    rpPesqSalLbl5: TppLabel;
    rpPesqSalLbl6: TppLabel;
    rpPesqSalLbl7: TppLabel;
    rpPesqSalLbl8: TppLabel;
    rpPesqSalLbl9: TppLabel;
    rpPesqSalLbl10: TppLabel;
    rpPesqSalLblMENOR1: TppLabel;
    rpPesqSalLblPRIQUA1: TppLabel;
    rpPesqSalDtlBnd: TppDetailBand;
    rpPesqSalDBTxt2: TppDBText;
    rpPesqSalDBTxt3: TppDBText;
    rpPesqSalDBTxt4: TppDBText;
    rpPesqSalDBTxt6: TppDBText;
    rpPesqSalFootBnd: TppFooterBand;
    rpPesqSalSmryBnd: TppSummaryBand;
    ppPesqSal: TppBDEPipeline;
    dsPesqSal: TwwDataSource;
    qryPesqSal: TwwQuery;
    rpPesqSalLbl13: TppLabel;
    rpPesqSalLine3: TppLine;
    InconsistSalCalc1: TppSystemVariable;
    InconsistSalCalc2: TppSystemVariable;
    rpPesqSalCalc1: TppSystemVariable;
    rpPesqSalCalc2: TppSystemVariable;
    rpPesqSalDBTxt5: TppDBText;
    rpPesqSalLine2: TppLine;
    rpPesqSalLbl11: TppLabel;
    rpPesqSalLbl12: TppLabel;
    rpPesqSalLblMEDIA1: TppLabel;
    rpPesqSalLblMEDIANA1: TppLabel;
    rpPesqSalLblTERQUA1: TppLabel;
    rpPesqSalLblMAIOR1: TppLabel;
    rpPesqSalLblMENOR2: TppLabel;
    rpPesqSalLblPRIQUA2: TppLabel;
    rpPesqSalLblMODA2: TppLabel;
    rpPesqSalLblMEDIA2: TppLabel;
    rpPesqSalLblMEDIANA2: TppLabel;
    rpPesqSalLblTERQUA2: TppLabel;
    rpPesqSalLblMAIOR2: TppLabel;
    rpPesqSalLbl14: TppLabel;
    rpPesqSalLbl15: TppLabel;
    rpPesqSalLine4: TppLine;
    rpPesqSalLblMENOR1_TOT: TppLabel;
    rpPesqSalLblMENOR2_TOT: TppLabel;
    rpPesqSalLblMEDIA1_TOT: TppLabel;
    rpPesqSalLblMEDIA2_TOT: TppLabel;
    rpPesqSalLblMAIOR1_TOT: TppLabel;
    rpPesqSalLblMAIOR2_TOT: TppLabel;
    rpPesqSalDBCalc1: TppDBCalc;
    rpPesqSalGrpHdrBnd: TppGroupHeaderBand;
    rpPesqSalGrpFootBnd: TppGroupFooterBand;
    updSQL: TUpdateSQL;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    rpInconsistSalSmryBnd: TppSummaryBand;
    dsgnRelatorios: TppDesigner;
    procedure qryPesqSalBeforeOpen(DataSet: TDataSet);
    procedure qryPesqSalAfterOpen(DataSet: TDataSet);
    procedure rpPesqSalDtlBndBeforePrint(Sender: TObject);
    procedure rpPesqSalGrpFootBndBeforePrint(Sender: TObject);
    procedure rpPesqSalGrpFootBndAfterPrint(Sender: TObject);
    procedure rpFaixaSalBeforePrint(Sender: TObject);
  public
    iTotFreq: integer;
    rTotMenor, rTotMedia, rTotMaior, rTotMenorR, rTotMaiorR, rTotMediaR: real;
    sTitulo: string;

    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelatoriosCes: TdtmRelatoriosCes;

implementation

uses uSistema, fAguarde, fParamInconsistSal, fParamPesqSal;

{$R *.DFM}

function TdtmRelatoriosCes.MostraParam(Form: string): boolean;
var
  frm: TForm;
begin
  if (UPPERCASE(Form) = 'FRMPARAMINCONSISTSAL') then
    frm := TfrmParamInconsistSal.Create(Application)
  else
  if (UPPERCASE(Form) = 'FRMPARAMPESQSAL') then
    frm := TfrmParamPesqSal.Create(Application)
  else
  if (UPPERCASE(Form) = '') then
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

procedure TdtmRelatoriosCes.rpFaixaSalBeforePrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

// *************************************************************************************
// *************************************************************************************
// Listagem de Inconsistências Salariais
// *************************************************************************************
// *************************************************************************************
// SEM CÓDIGO

// *************************************************************************************
// *************************************************************************************
// Pesquisa Salarial
// *************************************************************************************
// *************************************************************************************
procedure TdtmRelatoriosCes.qryPesqSalBeforeOpen(DataSet: TDataSet);
begin
  frmAguarde.Mostra(sTitulo);
  frmAguarde.Pos := 0;
end;

procedure TdtmRelatoriosCes.qryPesqSalAfterOpen(DataSet: TDataSet);
begin
  rpPesqSalLblTITULO.Caption := sTitulo;
  frmAguarde.Max := qryPesqSal.RecordCount;
  frmAguarde.Min := 0;

  rpPesqSalGrpFootBndAfterPrint(nil);
end;

procedure TdtmRelatoriosCes.rpPesqSalDtlBndBeforePrint(Sender: TObject);
var
  rFatAjus: real;
begin
  if (qryPesqSal.FieldByName('IDEMPRESAPARTIC').asInteger <> Sistema.IdEmpresa) and
     (qryPesqSal.FieldByName('FATOR').asFloat <> 0) then
    rFatAjus := qryPesqSal.FieldByName('FATOR').asFloat
  else
    rFatAjus := 1;

  rpPesqSalLblMENOR1.Caption := IntToStr(Round(rFatAjus * qryPesqSal.FieldByName('MENOR').asFloat));
  rpPesqSalLblMENOR2.Caption := IntToStr(Round(rFatAjus * qryPesqSal.FieldByName('MENOR_R').asFloat));
  rpPesqSalLblMAIOR1.Caption := IntToStr(Round(rFatAjus * qryPesqSal.FieldByName('MAIOR').asFloat));
  rpPesqSalLblMAIOR2.Caption := IntToStr(Round(rFatAjus * qryPesqSal.FieldByName('MAIOR_R').asFloat));
  rpPesqSalLblMEDIA1.Caption := IntToStr(Round(rFatAjus * qryPesqSal.FieldByName('MEDIA').asFloat));
  rpPesqSalLblMEDIA2.Caption := IntToStr(Round(rFatAjus * qryPesqSal.FieldByName('MEDIA_R').asFloat));
  rpPesqSalLblMODA1.Caption := IntToStr(Round(rFatAjus * qryPesqSal.FieldByName('MODA').asFloat));
  rpPesqSalLblMODA2.Caption := IntToStr(Round(rFatAjus * qryPesqSal.FieldByName('MODA_R').asFloat));
  rpPesqSalLblMEDIANA1.Caption := IntToStr(Round(rFatAjus * qryPesqSal.FieldByName('MEDIANA').asFloat));
  rpPesqSalLblMEDIANA2.Caption := IntToStr(Round(rFatAjus * qryPesqSal.FieldByName('MEDIANA_R').asFloat));
  rpPesqSalLblPRIQUA1.Caption := IntToStr(Round(rFatAjus * qryPesqSal.FieldByName('PRIMQUA').asFloat));
  rpPesqSalLblPRIQUA2.Caption := IntToStr(Round(rFatAjus * qryPesqSal.FieldByName('PRIMQUA_R').asFloat));
  rpPesqSalLblTERQUA1.Caption := IntToStr(Round(rFatAjus * qryPesqSal.FieldByName('TERCQUA').asFloat));
  rpPesqSalLblTERQUA2.Caption := IntToStr(Round(rFatAjus * qryPesqSal.FieldByName('TERCQUA_R').asFloat));

  // Se não entra na Média, aborta a execução
  if (Copy(qryPesqSal.FieldByName('DESCRICAO').asString, 1, 4) <> '* - ') then
  begin
    iTotFreq := iTotFreq + qryPesqSal.FieldByName('FREQ').asInteger;
    if (StrToInt(rpPesqSalLblMENOR1.Caption) < rTotMenor) then
      rTotMenor := StrToInt(rpPesqSalLblMENOR1.Caption);

    rTotMedia := rTotMedia + qryPesqSal.FieldByName('FREQ').asInteger *
      StrToInt(rpPesqSalLblMEDIA1.Caption);
    if (StrToInt(rpPesqSalLblMAIOR1.Caption) > rTotMaior) then
      rTotMaior := StrToInt(rpPesqSalLblMAIOR1.Caption);

    if (StrToInt(rpPesqSalLblMENOR2.Caption) < rTotMenorR) then
      rTotMenorR := StrToInt(rpPesqSalLblMENOR2.Caption);

    rTotMediaR := rTotMediaR + qryPesqSal.FieldByName('FREQ').asInteger *
      StrToInt(rpPesqSalLblMEDIA2.Caption);
    if (StrToInt(rpPesqSalLblMAIOR2.Caption) > rTotMaiorR) then
      rTotMaiorR := StrToInt(rpPesqSalLblMAIOR2.Caption);
  end;
end;

procedure TdtmRelatoriosCes.rpPesqSalGrpFootBndBeforePrint(Sender: TObject);
begin
  if (iTotFreq = 0) then
  begin
    rTotMenor  := 0;
    rTotMenorR := 0;
  end;

  rpPesqSalLblMENOR1_TOT.Caption := FloatToStrF(rTotMenor, ffFixed, 12, 0);
  rpPesqSalLblMAIOR1_TOT.Caption := FloatToStrF(rTotMaior, ffFixed, 12, 0);

  if (iTotFreq > 0) then
    rpPesqSalLblMEDIA1_TOT.Caption := FloatToStrF(rTotMedia / iTotFreq, ffFixed, 12, 0)
  else
    rpPesqSalLblMEDIA1_TOT.Caption := '0';

  rpPesqSalLblMENOR2_TOT.Caption := FloatToStrF(rTotMenorR, ffFixed, 12, 0);
  rpPesqSalLblMAIOR2_TOT.Caption := FloatToStrF(rTotMaiorR, ffFixed, 12, 0);

  if (iTotFreq > 0) then
    rpPesqSalLblMEDIA2_TOT.Caption := FloatToStrF(rTotMediaR / iTotFreq, ffFixed, 12, 0)
  else
    rpPesqSalLblMEDIA2_TOT.Caption := '0';
end;

procedure TdtmRelatoriosCes.rpPesqSalGrpFootBndAfterPrint(Sender: TObject);
begin
  iTotFreq := 0;
  rTotMenor := (9999 * 9999);
  rTotMedia := 0;
  rTotMaior := 0;
  rTotMenorR := (9999 * 9999);
  rTotMediaR := 0;
  rTotMaiorR := 0;
end;

end.
