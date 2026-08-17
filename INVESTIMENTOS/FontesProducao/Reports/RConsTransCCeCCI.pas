//******************************************************************************
// Data      : 18/10/2006
// Codigo    : AL_1
// Pendência : 23582
// Motivo    : Implementação de Transferência entre CC e CCI
//******************************************************************************

unit RConsTransCCeCCI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppCtrls, ppBands,
  ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  uCtrlPadroes, uCtrlRendaVariavel, uMensErro;

type
  TRelConsTransCCeCCI = class(TFrmCmReport)
    sprConsTransCCeCCIMT: TCMSqlParams;
    CdsConsTransCCeCCIMT: TCMClientDataSet;
    dsConsTransCCeCCIMT: TDataSource;
    pplConsTransCCeCCIMT: TppBDEPipeline;
    rptConsTransCCeCCIMT: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    lblTituloRelatorio: TppLabel;
    lblEmpresa: TppLabel;
    ppDBImage1: TppDBImage;
    lblPeriodo: TppLabel;
    pplOperacao: TppLabel;
    pplPlanoPatro: TppLabel;
    pplData: TppLabel;
    pplCarteira: TppLabel;
    pplBoleta: TppLabel;
    pplInvestimento: TppLabel;
    plQuantidade: TppLabel;
    pplPercentual: TppLabel;
    ppDetailBand1: TppDetailBand;
    shpDetalhe: TppShape;
    ppFooterBand1: TppFooterBand;
    lblSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine2: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    CdsConsTransCCeCCIMTIDTIPOOPERACAO: TFloatField;
    CdsConsTransCCeCCIMTDATAOPERACAO: TDateTimeField;
    CdsConsTransCCeCCIMTNUMDOCUMENTO: TStringField;
    CdsConsTransCCeCCIMTQTDEOPERACAO: TFloatField;
    CdsConsTransCCeCCIMTIDINVESTIMENTO: TFloatField;
    CdsConsTransCCeCCIMTIDCARTEIRAINVEST: TFloatField;
    CdsConsTransCCeCCIMTPERCENTUAL: TFloatField;
    CdsConsTransCCeCCIMTIDCARTEIRAGERENC: TFloatField;
    CdsConsTransCCeCCIMTIDPLANPREVCTBPATR: TFloatField;
    CdsConsTransCCeCCIMTDESCCARTINVEST: TStringField;
    CdsConsTransCCeCCIMTPLANPRVCONTABPATRO: TStringField;
    CdsConsTransCCeCCIMTDESCINVESTIMENTO: TStringField;
    CdsConsTransCCeCCIMTDESCTIPOOPERACAO: TStringField;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure shpDetalhePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rptConsTransCCeCCIMTStartPage(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
    CtrlRendaVariavel : TCtrlRendaVariavel;
  public
    { Public declarations }
  end;

var
  RelConsTransCCeCCI: TRelConsTransCCeCCI;
  iCarteira, iPlanPrev, iInvestimento, iTipoOper : Integer;

implementation

{$R *.DFM}

procedure TRelConsTransCCeCCI.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  iCarteira := -1;
  iInvestimento := -1;
  iPlanPrev := -1;
  iTipoOper := -1;

  if not CmpRptCM.ParamByName('Carteira').IsNull then
     iCarteira := CmpRptCM.ParamByName('Carteira').AsInteger;

  if not CmpRptCM.ParamByName('Investimento').IsNull then
     iInvestimento := CmpRptCM.ParamByName('Investimento').AsInteger;

  if not CmpRptCM.ParamByName('PlanoPrev').IsNull then
     iPlanPrev := CmpRptCM.ParamByName('PlanoPrev').AsInteger;

  if not CmpRptCM.ParamByName('Operacao').IsNull then
     iTipoOper := CmpRptCM.ParamByName('Operacao').AsInteger;

  lblPeriodo.Caption := CmpRptCM.ParamByName('DataIni').AsString + ' a ' + CmpRptCM.ParamByName('DataFinal').AsString;

  CdsConsTransCCeCCIMT.Data := CtrlRendaVariavel.ListOperTrcCCeCCI(CmpRptCM.ParamByName('DataIni').AsDateTime,
                                                                   CmpRptCM.ParamByName('DataFinal').AsDateTime,
                                                                   iInvestimento,
                                                                   iCarteira,
                                                                   iPlanPrev,
                                                                   iTipoOper);

end;

procedure TRelConsTransCCeCCI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil(CtrlRendaVariavel);
  inherited;
end;

procedure TRelConsTransCCeCCI.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TRelConsTransCCeCCI.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlRendaVariavel := TCtrlRendaVariavel.Create;
   CtrlRendaVariavel.InitializeAs(Padroes);
end;

procedure TRelConsTransCCeCCI.rptConsTransCCeCCIMTStartPage(
  Sender: TObject);
begin
   lblTituloRelatorio.Caption := rptConsTransCCeCCIMT.PrinterSetup.DocumentName;
   inherited;
   cCorZebra := $00E3E3E3
end;

end.

