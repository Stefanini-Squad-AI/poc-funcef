//******************************************************************************
// Data     : 20/03/2007
// Código   : AL_2
// Pendencia: 24771
// SOL      : 55874
// Desc     : Aumento do tamanho do campo de quantidade transferida
//******************************************************************************
// Data     : 22/11/2006
// Pendencia: 23787
// SOL      : 43633
// Desc     : Implementação do Relatório
//******************************************************************************

unit RConsTransPlanosRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppDB, ppDBPipe, ppDBBDE, ppBands, ppClass, ppVar, ppCtrls,
  ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, uCmRptManager, TXComp, TXRB,
  CmParamReport, uCtrlPadroes, uCtrlRendaFixa, uMensErro;

type
  TRelConsTransPlanosRF = class(TFrmCmReport)
    sprConsTransPlanosRFMT: TCMSqlParams;
    CdsConsTransPlanosRFMT: TCMClientDataSet;
    dsConsTransPlanosRFMT: TDataSource;
    rptConsTransPlanosRFMT: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    lblTituloRelatorio: TppLabel;
    lblEmpresa: TppLabel;
    ppDBImage1: TppDBImage;
    lblPeriodo: TppLabel;
    pplPlanoOrig: TppLabel;
    pplData: TppLabel;
    pplBoleta: TppLabel;
    pplClassetit: TppLabel;
    pplPlanoDest: TppLabel;
    pplQtdTransf: TppLabel;
    pplPercentual: TppLabel;
    ppLabel1: TppLabel;
    ppDetailBand1: TppDetailBand;
    shpDetalhe: TppShape;
    ppdbCarteira: TppDBText;
    ppdbData: TppDBText;
    ppdbBoleta: TppDBText;
    ppdbSldAntDest: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel2: TppLabel;
    ppFooterBand1: TppFooterBand;
    lblSistema: TppLabel;
    ppLine2: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable1: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    pplConsTransPlanosRFMT: TppBDEPipeline;
    CdsConsTransPlanosRFMTBOLETA: TStringField;
    CdsConsTransPlanosRFMTPLANOPATROORIG: TStringField;
    CdsConsTransPlanosRFMTPLANOPATRODEST: TStringField;
    CdsConsTransPlanosRFMTDESCCLASSETIT: TStringField;
    CdsConsTransPlanosRFMTDESCINVESTIMENTO: TStringField;
    CdsConsTransPlanosRFMTDATAOPERACAO: TDateTimeField;
    CdsConsTransPlanosRFMTVENCOPERACAO: TDateTimeField;
    CdsConsTransPlanosRFMTQTDEOPERACAO: TFloatField;
    CdsConsTransPlanosRFMTVLROPERACAO: TFloatField;
    CdsConsTransPlanosRFMTIDPLANPREVCTBPATR: TFloatField;
    CdsConsTransPlanosRFMTIDPLANPREVCTBPATR_1: TFloatField;
    CdsConsTransPlanosRFMTIDCLASSETIT: TFloatField;
    CdsConsTransPlanosRFMTIDINVESTIMENTO: TFloatField;
    CdsConsTransPlanosRFMTPERCTRANSF: TFloatField;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure shpDetalhePrint(Sender: TObject);
    procedure rptConsTransPlanosRFMTStartPage(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
    CtrlRendaFixa : TCtrlRendaFixa;
  public
    { Public declarations }
  end;

var
  RelConsTransPlanosRF: TRelConsTransPlanosRF;
  iClasseTit, iPlanPrevOrig, iInvestimento : Integer;

implementation

{$R *.DFM}

procedure TRelConsTransPlanosRF.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  iClasseTit := -1;
  iInvestimento := -1;
  iPlanPrevOrig := -1;

  if not CmpRptCM.ParamByName('Classe').IsNull then
     iClasseTit := CmpRptCM.ParamByName('Classe').AsInteger;

  if not CmpRptCM.ParamByName('Investimento').IsNull then
     iInvestimento := CmpRptCM.ParamByName('Investimento').AsInteger;

  if not CmpRptCM.ParamByName('PlanPrevOrig').IsNull then
     iPlanPrevOrig := CmpRptCM.ParamByName('PlanPrevOrig').AsInteger;

  lblPeriodo.Caption := CmpRptCM.ParamByName('DataIni').AsString + ' a ' + CmpRptCM.ParamByName('DataFinal').AsString;

  CdsConsTransPlanosRFMT.Data := CtrlRendaFixa.ListOperTrcPlanos(CmpRptCM.ParamByName('DataIni').AsDateTime,
                                                                 CmpRptCM.ParamByName('DataFinal').AsDateTime,
                                                                 iInvestimento,
                                                                 iClasseTit,
                                                                 iPlanPrevOrig);
end;

procedure TRelConsTransPlanosRF.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlRendaFixa := TCtrlRendaFixa.Create;
   CtrlRendaFixa.InitializeAs(Padroes);
end;

procedure TRelConsTransPlanosRF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlRendaFixa);
end;

procedure TRelConsTransPlanosRF.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TRelConsTransPlanosRF.rptConsTransPlanosRFMTStartPage(
  Sender: TObject);
begin
   lblTituloRelatorio.Caption := rptConsTransPlanosRFMT.PrinterSetup.DocumentName;
   inherited;
   cCorZebra := $00E3E3E3
end;

end.
