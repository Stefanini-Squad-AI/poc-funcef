unit dRelatoriosAsm2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TdtmRelatoriosAsm2 = class(TdtmReports)
    rpOcorrPess: TppReport;
    rpOcorrPessHdrBnd: TppHeaderBand;
    ppLabel1: TppLabel;
    rpOcorrPessLbl2: TppLabel;
    rpOcorrPessLbl3: TppLabel;
    rpOcorrPessDBTxt1: TppDBText;
    rpOcorrPessSysVar1: TppSystemVariable;
    rpOcorrPessSysVar2: TppSystemVariable;
    rpOcorrPessLbl4: TppLabel;
    rpOcorrPessLblDATAINI: TppLabel;
    rpOcorrPessLbl5: TppLabel;
    rpOcorrPessLblDATAFINAL: TppLabel;
    rpOcorrPessDtlBnd: TppDetailBand;
    rpOcorrPessDBTxt6: TppDBText;
    rpOcorrPessDBTxt9: TppDBText;
    rpOcorrPessDBTxt8: TppDBText;
    rpOcorrPessDBTxt10: TppDBText;
    rpOcorrPessDBTxt7: TppDBText;
    rpOcorrPessSmryBnd: TppSummaryBand;
    rpOcorrPessGrp1: TppGroup;
    rpOcorrPessGrpHdrBnd1: TppGroupHeaderBand;
    rpOcorrPessGrpFootBnd1: TppGroupFooterBand;
    rpOcorrPessLbl14: TppLabel;
    rpOcorrPessLbl15: TppLabel;
    rpOcorrPessLbl16: TppLabel;
    ppDBCalc1: TppDBCalc;
    rpOcorrPessLblNumPessoas: TppLabel;
    rpOcorrPessdbCalcLicenca: TppDBCalc;
    rpOcorrPessGrp2: TppGroup;
    rpOcorrPessGrpHdrBnd2: TppGroupHeaderBand;
    rpOcorrPessLbl6: TppLabel;
    rpOcorrPessLbl7: TppLabel;
    rpOcorrPessLbl8: TppLabel;
    ppShape1: TppShape;
    rpOcorrPessDBTxt3: TppDBText;
    rpOcorrPessDBTxt4: TppDBText;
    rpOcorrPessDBTxt5: TppDBText;
    rpOcorrPessLbl9: TppLabel;
    rpOcorrPessLbl10: TppLabel;
    rpOcorrPessLbl11: TppLabel;
    rpOcorrPessLbl12: TppLabel;
    rpOcorrPessLbl13: TppLabel;
    rpOcorrPessGrpFootBnd2: TppGroupFooterBand;
    ppOcorrPess: TppBDEPipeline;
    dsOcorrPess: TwwDataSource;
    qryOcorrPess: TwwQuery;
    rpOcorrTipo: TppReport;
    rpOcorrTipoHdrBnd: TppHeaderBand;
    rpOcorrTipoLbl1: TppLabel;
    rpOcorrTipoLbl2: TppLabel;
    rpOcorrTipoLbl3: TppLabel;
    rpOcorrTipoDBTxt1: TppDBText;
    rpOcorrTipoSysVar1: TppSystemVariable;
    rpOcorrTipoSysVar2: TppSystemVariable;
    rpOcorrTipoLbl4: TppLabel;
    rpOcorrTipoLblDATAINI: TppLabel;
    rpOcorrTipoLbl5: TppLabel;
    rpOcorrTipoLblDATAFINAL: TppLabel;
    rpOcorrTipoDtlBnd: TppDetailBand;
    rpOcorrTipoDBTxt3: TppDBText;
    rpOcorrTipoSmryBnd: TppSummaryBand;
    rpOcorrTipoGrp1: TppGroup;
    rpOcorrTipoGrpHdrBnd1: TppGroupHeaderBand;
    rpOcorrTipoGrpFootBnd1: TppGroupFooterBand;
    rpOcorrTipoLbl13: TppLabel;
    rpOcorrTipoLbl14: TppLabel;
    rpOcorrTipoLbl15: TppLabel;
    rpOcorrTipoLblNumTipos: TppLabel;
    rpOcorrTipodbCalcLicenca: TppDBCalc;
    rpOcorrTipoLine2: TppLine;
    rpOcorrTipoGrp2: TppGroup;
    rpOcorrTipoGrpHdrBnd2: TppGroupHeaderBand;
    rpOcorrTipoLbl6: TppLabel;
    rpOcorrTipoDBTxt2: TppDBText;
    rpOcorrTipoLine1: TppLine;
    rpOcorrTipoGrpFootBnd2: TppGroupFooterBand;
    rpOcorrTipoLbl11: TppLabel;
    rpOcorrTipoLbl12: TppLabel;
    rpOcorrTipoDBCalc1: TppDBCalc;
    rpOcorrTipoLblAvalMedia: TppLabel;
    ppOcorrTipo: TppBDEPipeline;
    ppOcorrTipoppField1: TppField;
    ppOcorrTipoppField2: TppField;
    ppOcorrTipoppField3: TppField;
    ppOcorrTipoppField4: TppField;
    ppOcorrTipoppField5: TppField;
    ppOcorrTipoppField6: TppField;
    ppOcorrTipoppField7: TppField;
    ppOcorrTipoppField8: TppField;
    ppOcorrTipoppField9: TppField;
    ppOcorrTipoppField10: TppField;
    ppOcorrTipoppField11: TppField;
    dsOcorrTipo: TwwDataSource;
    qryOcorrTipo: TwwQuery;
    ppDBCalc2: TppDBCalc;
    rpOcorrPessLblAbsenteismo: TppLabel;
    ppLabel3: TppLabel;
    ppLabel2: TppLabel;
    rpOcorrTipoLblAbsenteismo: TppLabel;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppLabel5: TppLabel;
    ppDBText2: TppDBText;
    ppLabel6: TppLabel;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel15: TppLabel;
    procedure FormDestroy(Sender: TObject);
    procedure qryOcorrPessBeforeOpen(DataSet: TDataSet);
    procedure qryOcorrPessAfterOpen(DataSet: TDataSet);
    procedure qryOcorrPessAfterScroll(DataSet: TDataSet);
    procedure rpOcorrPessGrpFootBnd2AfterPrint(Sender: TObject);
    procedure rpOcorrPessGrpFootBnd1BeforePrint(Sender: TObject);
    procedure qryOcorrTipoBeforeOpen(DataSet: TDataSet);
    procedure qryOcorrTipoAfterOpen(DataSet: TDataSet);
    procedure rpOcorrTipoGrpHdrBnd2BeforePrint(Sender: TObject);
    procedure rpOcorrTipoDtlBndAfterPrint(Sender: TObject);
    procedure rpOcorrTipoGrpFootBnd2BeforePrint(Sender: TObject);
    procedure rpOcorrTipoGrpFootBnd2AfterPrint(Sender: TObject);
    procedure rpOcorrTipoGrpFootBnd1BeforePrint(Sender: TObject);
    procedure rpOcorrPessSmryBndAfterPrint(Sender: TObject);
    procedure rpOcorrTipoSmryBndAfterPrint(Sender: TObject);
    procedure qryOcorrTipoAfterScroll(DataSet: TDataSet);
  private
    lstPessoa: TStringList;
    iQuociente, iDivisor, iNumPessoas, iDiasMes, iNumAnos, iNumMeses, iNumDias,
    iNumTipos: integer;
  public
    bPrimeiraVez, bRelatAnalitico: boolean;

    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelatoriosAsm2: TdtmRelatoriosAsm2;

implementation

uses fTelaAut, fAguarde, fParamOcorrPess, fParamOcorrTipo, UFuncoesUteis, dBaseDados;

{$R *.DFM}

function TdtmRelatoriosAsm2.MostraParam(Form: string): boolean;
var
  frm: TForm;
begin
  if (UpperCase(Form) = 'FRMPARAMOCORRPESS') then
    frm := TfrmParamOcorrPess.Create(Application)
  else
  if (UpperCase(Form) = 'FRMPARAMOCORRTIPO') then
    frm := TfrmParamOcorrTipo.Create(Application)
  else
  if (UpperCase(Form) = '') then
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
    Result := (frm.ShowModal = mrOk);
    frm.free;
  end;
end;

procedure TdtmRelatoriosAsm2.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(lstPessoa) then
    lstPessoa.Free;
end;

// *************************************************************************************
// *************************************************************************************
// Ocorrências Médicas por Pessoa
// *************************************************************************************
// *************************************************************************************
procedure TdtmRelatoriosAsm2.qryOcorrPessBeforeOpen(DataSet: TDataSet);
begin
  frmAguarde.Mostra ('Ocorrências Médicas por Pessoa');
  frmAguarde.Pos := 0;
end;

procedure TdtmRelatoriosAsm2.qryOcorrPessAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;

  rpOcorrPessGrpHdrBnd2.Visible  := bRelatAnalitico;
  rpOcorrPessDtlBnd.Visible      := bRelatAnalitico;
  rpOcorrPessGrpFootBnd2.Visible := bRelatAnalitico;

  if Assigned(lstPessoa) then
    lstPessoa.Clear
  else
    lstPessoa := TStringList.Create;

  iNumPessoas := 0;
  iDiasMes    := 0;
  CalculaDifData(rpOcorrPessLblDATAINI.Caption,rpOcorrPessLblDATAFINAL.Caption,iNumDias,iNumMeses,iNumAnos);

end;

procedure TdtmRelatoriosAsm2.qryOcorrPessAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TdtmRelatoriosAsm2.rpOcorrPessGrpFootBnd2AfterPrint(Sender: TObject);
begin
  if (lstPessoa.IndexOf(qryOcorrPess.FieldByName('IDPESSOA').asString) = -1) then
  begin
    lstPessoa.Add(qryOcorrPess.FieldByName('IDPESSOA').asString);
    Inc(iNumPessoas);
    dtmBaseDados.qry.Close;
    dtmBaseDados.qry.Sql.Clear;
    dtmBaseDados.qry.Sql.Add('SELECT ROUND(COUNT(T.IDDIASEMANA)*30/7,0) AS DIASMES');
    dtmBaseDados.qry.Sql.Add('FROM TURNOSEM T, FUNCIONARIO F');
    dtmBaseDados.qry.Sql.Add('WHERE F.IDHORARIO = T.IDHORARIO');
    dtmBaseDados.qry.Sql.Add('AND   F.IDPESSOA = ' +
                              qryOcorrPess.FieldByName('IDPESSOA').asString);
    dtmBaseDados.qry.Open;
    iDiasMes := iDiasMes + dtmBaseDados.qry.FieldByName('DIASMES').asInteger;
  end;
end;

procedure TdtmRelatoriosAsm2.rpOcorrPessGrpFootBnd1BeforePrint(Sender: TObject);
var
  sDiasLicenca : String;
begin
  rpOcorrPessLblNumPessoas.Caption := IntToStr(iNumPessoas);
  sDiasLicenca := rpOcorrPessdbCalcLicenca.GetText;
  rpOcorrPessLblAbsenteismo.Caption:= FloatToStrF(StrToInt(sDiasLicenca)
                                      *100/iDiasMes/iNumMeses,ffFixed,5,2);
end;

procedure TdtmRelatoriosAsm2.rpOcorrPessSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

// *************************************************************************************
// *************************************************************************************
// Ocorrências Médicas por Tipo
// *************************************************************************************
// *************************************************************************************
procedure TdtmRelatoriosAsm2.qryOcorrTipoBeforeOpen(DataSet: TDataSet);
begin
  frmAguarde.Mostra ('Ocorrências Médicas por Tipo');
  frmAguarde.Pos := 0;
end;

procedure TdtmRelatoriosAsm2.qryOcorrTipoAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;

  if Assigned(lstPessoa) then
    lstPessoa.Clear
  else
    lstPessoa := TStringList.Create;

  rpOcorrTipoGrpHdrBnd2.Visible  := bRelatAnalitico;
  rpOcorrTipoDtlBnd.Visible      := bRelatAnalitico;
  rpOcorrTipoGrpFootBnd2.Visible := bRelatAnalitico;

  iNumTipos := 0;
  bPrimeiraVez := true;
  iDiasMes    := 0;
  CalculaDifData(rpOcorrTipoLblDATAINI.Caption,rpOcorrTipoLblDATAFINAL.Caption,iNumDias,iNumMeses,iNumAnos);

end;

procedure TdtmRelatoriosAsm2.rpOcorrTipoGrpHdrBnd2BeforePrint(Sender: TObject);
begin
  iQuociente := 0;
  iDivisor := 0;
end;

procedure TdtmRelatoriosAsm2.rpOcorrTipoDtlBndAfterPrint(Sender: TObject);
begin
  if (StrToIntDef(qryOcorrTipo.FieldByName('AVALIACAO').asString,-777) <> -777) then
  begin
    Inc(iQuociente);
    iDivisor := iDivisor + qryOcorrTipo.FieldByName('AVALIACAO').asInteger;
  end;
end;

procedure TdtmRelatoriosAsm2.rpOcorrTipoGrpFootBnd2BeforePrint(Sender: TObject);
begin
  if (iQuociente > 0) then
    rpOcorrTipoLblAvalMedia.Caption := FloatToStrF(iDivisor / iQuociente,ffFixed,10,0)
  else
    rpOcorrTipoLblAvalMedia.Caption := '0';
end;

procedure TdtmRelatoriosAsm2.rpOcorrTipoGrpFootBnd2AfterPrint(Sender: TObject);
begin
  if (bPrimeiraVez) then
    Inc(iNumTipos);
end;

procedure TdtmRelatoriosAsm2.rpOcorrTipoGrpFootBnd1BeforePrint(Sender: TObject);
var
  sDiasLicenca : String;
begin
  rpOcorrTipoLblNumTipos.Caption := IntToStr(iNumTipos);
  sDiasLicenca := rpOcorrTipodbCalcLicenca.GetText;
  rpOcorrTipoLblAbsenteismo.Caption:= FloatToStrF(StrToInt(sDiasLicenca)
                                      *100/iDiasMes/iNumMeses,ffFixed,5,2);
end;

procedure TdtmRelatoriosAsm2.rpOcorrTipoSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
  bPrimeiraVez := false;
end;

procedure TdtmRelatoriosAsm2.qryOcorrTipoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
  if (bPrimeiraVez) and (lstPessoa.IndexOf(qryOcorrTipo.FieldByName('IDPESSOA').asString) = -1) then
  begin
    lstPessoa.Add(qryOcorrTipo.FieldByName('IDPESSOA').asString);
    dtmBaseDados.qry.Close;
    dtmBaseDados.qry.Sql.Clear;
    dtmBaseDados.qry.Sql.Add('SELECT ROUND(COUNT(T.IDDIASEMANA)*30/7,0) AS DIASMES');
    dtmBaseDados.qry.Sql.Add('FROM TURNOSEM T, FUNCIONARIO F');
    dtmBaseDados.qry.Sql.Add('WHERE F.IDHORARIO = T.IDHORARIO');
    dtmBaseDados.qry.Sql.Add('AND   F.IDPESSOA = ' +
                              qryOcorrTipo.FieldByName('IDPESSOA').asString);
    dtmBaseDados.qry.Open;
    iDiasMes := iDiasMes + dtmBaseDados.qry.FieldByName('DIASMES').asInteger;
  end;
end;

end.
