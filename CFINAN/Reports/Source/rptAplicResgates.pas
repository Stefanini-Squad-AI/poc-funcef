unit rptAplicResgates;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  Db, DBClient, uCMClientDataSet, uCmSqlParams, uCmRptManager, TXComp,
  TXRB, CmParamReport, ppCtrls, ppPrnabl, ppBands, ppCache, ppVar,
  uCtrlRptAplicResgates, uCtrlPadroes, usistema, ppStrtch, ppSubRpt;

type
  TfrmAplicResgate = class(TFrmCmReport)
    cdsPrincipal: TCMClientDataSet;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage3: TppDBImage;
    ppDBText28: TppDBText;
    LblTitulo: TppLabel;
    PerIni: TppLabel;
    PerFim: TppLabel;
    dsPrincipal: TDataSource;
    cdsLogo: TCMClientDataSet;
    ppLogo: TppDBPipeline;
    dsLogo: TDataSource;
    ppLine13: TppLine;
    lblSistema: TppLabel;
    ppCalc11: TppSystemVariable;
    ppCalc12: TppSystemVariable;
    ppTitulo: TppShape;
    ppLine4: TppLine;
    ppLabel5: TppLabel;
    rptDetalhe: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel7: TppLabel;
    lblPlanoPatro: TppLabel;
    ppLabel31: TppLabel;
    ppLine16: TppLine;
    ppZebra: TppShape;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText24: TppDBText;
    ppDBText4: TppDBText;
    ppLabel1: TppLabel;
    cdsdetalhe: TCMClientDataSet;
    dsdetalhe: TDataSource;
    ppDBText1: TppDBText;
    ppDetalhe: TppDBPipeline;
    shpMaozinha: TppShape;
    ppDBCalc1: TppDBCalc;
    ppLabel2: TppLabel;
    ppPrincipal: TppDBPipeline;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppPortadorConta: TppLabel;
    ppBanco: TppLabel;
    ppAgencia: TppLabel;
    pphistorico: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;

    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rptDetalhePrint(Sender: TObject);
    procedure ppZebraPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);


  private { Private declarations }
    CtrlRptAplicResgates : TCtrlRptAplicResgates;
    CdsDescHist : TCMClientDataSet;
    CdsPortConta : TCMClientDataSet;


  public  { Public declarations }


  end;



var
  frmAplicResgate: TfrmAplicResgate;



implementation
{$R *.DFM}



procedure TfrmAplicResgate.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;

  if CmpRptCM.ParamValues[6].AsBoolean then
     rptDetalhe.ExpandAll := True;

  CtrlRptAplicResgates := TCtrlRptAplicResgates.Create;
  CtrlRptAplicResgates.InitializeAs(Padroes);
  cdsLogo.data := CtrlRptAplicResgates.Logo(Sistema.IdEmpresa);

  cdsPrIncipal.data := CtrlRptAplicResgates.RelAplicacaoResgate(CmpRptCM.ParamValues[2].AsInteger,
                                                                CmpRptCM.ParamValues[3].AsInteger,
                                                                CmpRptCM.ParamValues[4].AsInteger,
                                                                CmpRptCM.ParamValues[5].AsInteger,
                                                                CmpRptCM.ParamValues[0].AsString,
                                                                CmpRptCM.ParamValues[1].AsString);

  if CmpRptCM.ParamValues[2].AsInteger <> 0 then
     ppBanco.Caption := CmpRptCM.ParamValues[2].AsString;

  if CmpRptCM.ParamValues[3].AsInteger <> 0 then
     ppAgencia.Caption := CmpRptCM.ParamValues[3].AsString;

  if CmpRptCM.ParamValues[4].AsInteger <> 0 then
  begin
     CdsPortConta.data := CtrlRptAplicResgates.descPortForma(CmpRptCM.ParamValues[4].AsInteger);
     ppPortadorConta.Caption := CdsPortConta.fieldbyname('DESCRICAO').AsString;

  end;

  if CmpRptCM.ParamValues[5].AsInteger <> 0 then
  begin
     CdsDescHist.data := CtrlRptAplicResgates.DescHistorico(CmpRptCM.ParamValues[5].AsInteger);
     pphistorico.Caption := CdsDescHist.fieldbyname('DESCRICAO').AsString;

  end;

  if CmpRptCM.ParamValues[0].AsDateTime <> 0 then
     PerIni.Caption := DateToStr( CmpRptCM.ParamValues[0].AsDateTime )
  else
     PerIni.Caption := 'Período inicial não informado.';
  if CmpRptCM.ParamValues[1].AsDateTime <> 0 then
     PerFim.Caption := DateToStr( CmpRptCM.ParamValues[1].AsDateTime )
  else
     PerFim.Caption := 'Período final não informado.';

  cdsdetalhe.data := cdsPrincipal.data;
end;



procedure TfrmAplicResgate.rptDetalhePrint(Sender: TObject);
begin
  inherited;

  cdsdetalhe.Filtered := False;

  if not (cdsdetalhe.IsEmpty) then
  begin
    cdsdetalhe.Filter := 'CODLANCFINANC = ' + cdsPrincipal.fieldbyName('CODLANCFINANC').AsString;
    cdsdetalhe.Filtered := True;
  end;
end;



procedure TfrmAplicResgate.ppZebraPrint(Sender: TObject);
begin
  inherited;
  if ppZebra.Brush.Color = $00C8D0D4 then
     ppZebra.Brush.Color := clWhite
  else
     ppZebra.Brush.Color := $00C8D0D4;
end;



procedure TfrmAplicResgate.FormCreate(Sender: TObject);
begin
  inherited;
  CdsDescHist  := TCMClientDataSet.Create(nil);
  CdsPortConta := TCMClientDataSet.Create(nil);
end;



procedure TfrmAplicResgate.FormDestroy(Sender: TObject);
begin
  inherited;
  CdsDescHist.Free;
  CdsPortConta.Free;
end;



end.
