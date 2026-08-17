//******************************************************************************
// Data      : 31/08/2006
// Codigo    : AL_2
// Motivo    : Implementação do plano/patrocinador
//******************************************************************************
// Data      : 08/02/2006
// Código    : AL_1
// SOL       : 35066
// Motivo    : Ajuste no layout e implementação do zebrado
//******************************************************************************

unit RMovOperVirtual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands, ppClass, ppVar,
  ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, Db, uCmSqlParams, DBClient, uCMClientDataSet,
  uCtrlPadroes, uCtrlCarteiraGerenc, TXRB;

type
  TRelMovOperVirtual = class(TFrmCmReport)
    cdsMovOperVirtual: TCMClientDataSet;
    sprMovOperVirtual: TCMSqlParams;
    dsMovOperVirtual: TDataSource;
    pplMovOperVirtual: TppBDEPipeline;
    rptMovOperVirtual: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblTituloRelatorio: TppLabel;
    lblEmpresa: TppLabel;
    ppDBImage1: TppDBImage;
    lblPeriodo: TppLabel;
    linCabecalho: TppLine;
    ppDetailBand1: TppDetailBand;
    shpDetalhe: TppShape;
    ppDBText4: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    lblSistema: TppLabel;
    ppLine2: TppLine;
    shpCustodiante: TppShape;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    ppLabel1: TppLabel;
    ppDBText6: TppDBText;
    ppLine3: TppLine;
    ppLine1: TppLine;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBText5: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    //AL_1
    procedure shpDetalhePrint(Sender: TObject);
    procedure rptMovOperVirtualStartPage(Sender: TObject);
    procedure rptMovOperVirtualBeforePrint(Sender: TObject);
  private
    { Private declarations }
    //AL_1
    cCorZebra : TColor;
  public
    { Public declarations }
    CtrlCarteiraGerenc : TCtrlCarteiraGerenc;
  end;

var
  RelMovOperVirtual: TRelMovOperVirtual;

implementation

{$R *.DFM}

procedure TRelMovOperVirtual.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlCarteiraGerenc := TCtrlCarteiraGerenc.Create;
   CtrlCarteiraGerenc.InitializeAs(Padroes);
end;

procedure TRelMovOperVirtual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil(CtrlCarteiraGerenc);
  inherited;
end;

procedure TRelMovOperVirtual.CrmRptCMBeforePrint(Sender: TObject);
var iCarteira, iEvento, iInvestimento, iTipoInvest, iTipoOper, iTipoDesp, iPlanoPrev : Integer;
begin
  inherited;
  iEvento       := -1;
  iCarteira     := -1;
  iTipoDesp     := -1;
  iTipoOper     := -1;
  iTipoInvest   := -1;
  iInvestimento := -1;
  iPlanoPrev    := -1;

  if not CmpRptCM.ParamByName('Carteira').IsNull then
     iCarteira := CmpRptCM.ParamByName('Carteira').AsInteger;

  if not CmpRptCM.ParamByName('Evento').IsNull then
     iEvento   := CmpRptCM.ParamByName('Evento').AsInteger;

  if not CmpRptCM.ParamByName('Investimento').IsNull then
     iInvestimento := CmpRptCM.ParamByName('Investimento').AsInteger;

  if not CmpRptCM.ParamByName('TipoInvest').IsNull then
     iTipoInvest := CmpRptCM.ParamByName('TipoInvest').AsInteger;

  if not CmpRptCM.ParamByName('TipoOper').IsNull then
     iTipoOper := CmpRptCM.ParamByName('TipoOper').AsInteger;

  if not CmpRptCM.ParamByName('TipoDesp').IsNull then
     iTipoDesp := CmpRptCM.ParamByName('TipoDesp').AsInteger;

  if not CmpRptCM.ParamByName('Plano').IsNull then
     iPlanoPrev := CmpRptCM.ParamByName('Plano').AsInteger;

  lblPeriodo.Caption := CmpRptCM.ParamByName('DataIni').AsString + ' a ' + CmpRptCM.ParamByName('DataFim').AsString;

  cdsMovOperVirtual.Data := CtrlCarteiraGerenc.ListMovOperVirtual(CmpRptCM.ParamByName('DataIni').AsDateTime,
                                                                  CmpRptCM.ParamByName('DataFim').AsDateTime,
                                                                  iEvento, iTipoInvest, iTipoOper, iTipoDesp,
                                                                  iCarteira, iInvestimento, iPlanoPrev);
end;

//AL_1
procedure TRelMovOperVirtual.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TRelMovOperVirtual.rptMovOperVirtualStartPage(Sender: TObject);
begin
  inherited;                                         
   cCorZebra := $00E3E3E3;
end;

procedure TRelMovOperVirtual.rptMovOperVirtualBeforePrint(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
end;
//AL_1 - Fim

end.
