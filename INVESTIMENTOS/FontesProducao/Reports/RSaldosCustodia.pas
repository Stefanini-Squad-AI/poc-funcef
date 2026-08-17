//******************************************************************************
// Data     : 28/09/2006
// Código   : AL_2
// Pendencia: 22967
// Desc     : Retirada da Implementação de CC e CCI nos saldos de Custódia
//******************************************************************************
// Data     : 26/04/2006
// Código   : AL_1
// Desc     : Implementação de saldos CC e CCI
//******************************************************************************
unit RSaldosCustodia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands, ppClass, ppVar,
  ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, Db, uCmSqlParams, DBClient, uCMClientDataSet, uCtrlCustodia,
  uCtrlPadroes, TXRB;

type
  TRelSaldosCustodia = class(TFrmCmReport)
    cdsSaldosCustodia: TCMClientDataSet;
    dsSaldosCustodia: TDataSource;
    pplSaldosCustodia: TppBDEPipeline;
    sprSaldosCustodia: TCMSqlParams;
    rptSaldosCustodia: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblNomeRelatorio: TppLabel;
    LblEmpresa: TppLabel;
    ppDBImage1: TppDBImage;
    lblPeriodo: TppLabel;
    shpCabecalho: TppShape;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDetailBand1: TppDetailBand;
    shpDetalhe: TppShape;
    ppDBText1: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    LblSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    shpCustodiante: TppShape;
    ppDBText2: TppDBText;
    ppLabel6: TppLabel;
    rdpCustodiante: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    rdpInvestimento: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    lblCarteira: TppDBText;
    ppDBText3: TppDBText;
    ppLabel1: TppLabel;
    ppDBText7: TppDBText;
    ppLabel2: TppLabel;
    lblPlanoPatro: TppDBText;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
    procedure rptSaldosCustodiaStartPage(Sender: TObject);
    procedure rdpCustodianteBeforePrint(Sender: TObject);
    procedure rdpInvestimentoBeforePrint(Sender: TObject);
    procedure lblCarteiraGetText(Sender: TObject; var Text: String);
    procedure lblPlanoPatroGetText(Sender: TObject; var Text: String);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
    CtrlCustodia: TCtrlCustodia;
  end;

var
  RelSaldosCustodia: TRelSaldosCustodia;

implementation

{$R *.DFM}

procedure TRelSaldosCustodia.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlCustodia := TCtrlCustodia.Create;
   CtrlCustodia.InitializeAs(Padroes);
end;

procedure TRelSaldosCustodia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(CtrlCustodia);
   inherited;
end;

procedure TRelSaldosCustodia.CrmRptCMBeforePrint(Sender: TObject);
var iPlanPrev, iCarteira, iCustodiante, iInvestimento, iMotBloq: Integer;
begin
  inherited;
  //AL_2
  iPlanPrev := -1;
  iCarteira := -1;
  iInvestimento := -1;
  iCustodiante := -1;
  iMotBloq := -1;

  if not CmpRptCM.ParamByName('PlanoPatro').IsNull then
     iPlanPrev := CmpRptCM.ParamByName('PlanoPatro').AsInteger;

  if not CmpRptCM.ParamByName('Carteira').IsNull then
     iCarteira := CmpRptCM.ParamByName('Carteira').AsInteger;

  if not CmpRptCM.ParamByName('Investimento').IsNull then
     iInvestimento := CmpRptCM.ParamByName('Investimento').AsInteger;

  if not CmpRptCM.ParamByName('Custodiante').IsNull then
     iCustodiante := CmpRptCM.ParamByName('Custodiante').AsInteger;

  if not CmpRptCM.ParamByName('MotBloq').IsNull then
     iMotBloq := CmpRptCM.ParamByName('MotBloq').AsInteger;

  lblPeriodo.Caption := CmpRptCM.ParamByName('DataBase').AsString;

  cdsSaldosCustodia.Data := CtrlCustodia.ListaRelSaldoCustodia(CmpRptCM.ParamByName('DataBase').AsDateTime,
                                                               iPlanPrev, iCarteira, iCustodiante, iInvestimento, iMotBloq);
  //AL_2 - Fim
end;

procedure TRelSaldosCustodia.shpDetalhePrint(Sender: TObject);
begin
   inherited;
   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TRelSaldosCustodia.rptSaldosCustodiaStartPage(Sender: TObject);
begin
   lblNomeRelatorio.Caption := rptSaldosCustodia.PrinterSetup.DocumentName;
   inherited;
   cCorZebra := ClWhite;
end;

procedure TRelSaldosCustodia.rdpCustodianteBeforePrint(Sender: TObject);
begin
   inherited;
   cCorZebra := ClWhite;
end;

procedure TRelSaldosCustodia.rdpInvestimentoBeforePrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;
end;

procedure TRelSaldosCustodia.lblCarteiraGetText(Sender: TObject; var Text: String);
begin
   Text := 'Carteira: ' + Text;
   inherited;
end;

procedure TRelSaldosCustodia.lblPlanoPatroGetText(Sender: TObject; var Text: String);
begin
   Text := 'Plano/Patrocinadora: ' + Text;
   inherited;
end;

end.
