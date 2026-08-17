//******************************************************************************
// Data     : 28/09/2006
// Código   : AL_2
// Pendencia: 22967
// Desc     : Retirada da Implementação de CC e CCI nos saldos de Custódia
//******************************************************************************
// Data     : 25/04/2006
// Código   : AL_1
// Desc     : Implementação de CC e CCI nos saldos de Custódia
//******************************************************************************
unit RHistCustodia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppDB, ppDBPipe, ppDBBDE,
  ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, Db, uCmSqlParams, DBClient, uCMClientDataSet, uCtrlCustodia,
  uCtrlPadroes, TXRB;

type
  TRelHistCustodia = class(TFrmCmReport)
    cdsHistCustodia: TCMClientDataSet;
    sprHistCustodia: TCMSqlParams;
    dsHistCustodia: TDataSource;
    pplHistCustodia: TppBDEPipeline;
    rptHistCustodia: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblTituloRelatorio: TppLabel;
    lblEmpresa: TppLabel;
    ppDBImage1: TppDBImage;
    lblPeriodo: TppLabel;
    lblCarteira: TppDBText;
    ppDetailBand1: TppDetailBand;
    shpDetalhe: TppShape;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    lblSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppDBText6: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    grpRodapeCarteira: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    grpRodapeCustodiante: TppGroupFooterBand;
    shpCustodiante: TppShape;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    shpCabecalho: TppShape;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText9: TppDBText;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    grpRodapeInvestimento: TppGroupFooterBand;
    linCabecalho: TppLine;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppDBText11: TppDBText;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    lblPlanoPatro: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
    procedure rptHistCustodiaStartPage(Sender: TObject);
    procedure grpRodapeInvestimentoBeforePrint(Sender: TObject);
    procedure grpRodapeCustodianteBeforePrint(Sender: TObject);
    procedure grpRodapeCarteiraBeforePrint(Sender: TObject);
    procedure lblPlanoPatroGetText(Sender: TObject; var Text: String);
    procedure lblCarteiraGetText(Sender: TObject; var Text: String);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
    CtrlCustodia: TCtrlCustodia;
  end;

var
  RelHistCustodia: TRelHistCustodia;

implementation

{$R *.DFM}

procedure TRelHistCustodia.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlCustodia := TCtrlCustodia.Create;
   CtrlCustodia.InitializeAs(Padroes);
end;

procedure TRelHistCustodia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(CtrlCustodia);
   inherited;
end;

procedure TRelHistCustodia.CrmRptCMBeforePrint(Sender: TObject);
var iPlanPrev, iCarteira, iCustodiante, iInvestimento, iMotBloq: Integer;
begin
   inherited;
   //AL_2 - Ini
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

   lblPeriodo.Caption := CmpRptCM.ParamByName('DataIni').AsString + ' a ' + CmpRptCM.ParamByName('DataFim').AsString;

   cdsHistCustodia.Data := CtrlCustodia.ListaRelHistCustodia(CmpRptCM.ParamByName('DataIni').AsDateTime,
                                                             CmpRptCM.ParamByName('DataFim').AsDateTime,
                                                             iPlanPrev, iCarteira, iCustodiante, iInvestimento, iMotBloq);
   //AL_2 - Fim
end;

procedure TRelHistCustodia.shpDetalhePrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TRelHistCustodia.rptHistCustodiaStartPage(Sender: TObject);
begin
   lblTituloRelatorio.Caption := rptHistCustodia.PrinterSetup.DocumentName;
   inherited;
   cCorZebra := $00E3E3E3
end;

procedure TRelHistCustodia.grpRodapeInvestimentoBeforePrint(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3
end;

procedure TRelHistCustodia.grpRodapeCustodianteBeforePrint(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3
end;

procedure TRelHistCustodia.grpRodapeCarteiraBeforePrint(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3
end;

procedure TRelHistCustodia.lblPlanoPatroGetText(Sender: TObject; var Text: String);
begin
   Text := 'Plano / Patrocinadora: ' + Text;
   inherited;
end;

procedure TRelHistCustodia.lblCarteiraGetText(Sender: TObject;  var Text: String);
begin
   Text := 'Carteira: ' + Text;
   inherited;
end;

end.
