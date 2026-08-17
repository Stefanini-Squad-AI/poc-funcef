//******************************************************************************
// Data      : 16/02/2007
// Pendencia : 22229
// SOL       : 42585
// Motivo    : Implementação de Consulta de Amortização Bloqueada (3 camadas)
// Desc      : A quandidade de decimal das cotas está sendo construído de acordo
//             com a dade de decimal do Fundo em HistFundo de acordo com a data
//             de operacao
//******************************************************************************
unit RConsAmortizacaoBloq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppDB, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, uCmSqlParams, Db, DBClient, uCMClientDataSet,
  ppProd, ppClass, ppReport, ppCtrls, ppBands, ppVar, ppPrnabl, ppCache,
  ppParameter;

type
  TRelConsAmortizacaoBloq = class(TFrmCmReport)
    pplAmortizacaoBloq: TppBDEPipeline;
    rptAmortizacaoBloq: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblTituloRelatorio: TppLabel;
    lblEmpresa: TppLabel;
    ppDBImage1: TppDBImage;
    lblPeriodo: TppLabel;
    ppShape1: TppShape;
    shpCustodiante: TppShape;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDetailBand1: TppDetailBand;
    shpDetalhe: TppShape;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    lblSistema: TppLabel;
    ppLine2: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText29: TppDBText;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine1: TppLine;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    dsAmortizacaoBloq: TDataSource;
    cdsAmortizacaoBloq: TCMClientDataSet;
    sprAmortizacaoBloq: TCMSqlParams;
    ppDBText4: TppDBText;
    ppParameterList1: TppParameterList;
    ppDBTipoCota: TppDBText;
    pplTipoCota: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine3: TppLine;
    procedure ppDBText4GetText(Sender: TObject; var Text: String);
    procedure shpDetalhePrint(Sender: TObject);
    procedure rptAmortizacaoBloqBeforePrint(Sender: TObject);
    procedure rptAmortizacaoBloqStartPage(Sender: TObject);
    procedure ppGroupFooterBand2AfterGenerate(Sender: TObject);
    procedure ppGroupFooterBand2BeforePrint(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
     cCorZebra : TColor;
     wCount    : Integer;
  public
    { Public declarations }
  end;

var
  RelConsAmortizacaoBloq: TRelConsAmortizacaoBloq;

implementation

{$R *.DFM}

procedure TRelConsAmortizacaoBloq.ppDBText4GetText(Sender: TObject;  var Text: String);
var sMascara: String;
    i: Byte;
begin
   sMascara := '#,##0.';
   for i := 1 to (cdsAmortizacaoBloq.FieldByName('QTDDECQTD').AsInteger -1) do
      sMascara := sMascara + '#';
   sMascara := sMascara + '0';
   Text := FormatFloat( sMascara, cdsAmortizacaoBloq.FieldByName('QTDOPERACAO').AsFloat);
end;

procedure TRelConsAmortizacaoBloq.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TRelConsAmortizacaoBloq.rptAmortizacaoBloqBeforePrint(
  Sender: TObject);
begin
  inherited;
  cCorZebra := $00E3E3E3;
end;

procedure TRelConsAmortizacaoBloq.rptAmortizacaoBloqStartPage(
  Sender: TObject);
begin
  inherited;
  cCorZebra := $00E3E3E3;
end;

procedure TRelConsAmortizacaoBloq.ppGroupFooterBand2AfterGenerate(
  Sender: TObject);
begin
  inherited;
  wCount    := 0;
end;

procedure TRelConsAmortizacaoBloq.ppGroupFooterBand2BeforePrint(
  Sender: TObject);
begin
  inherited;
  ppGroupFooterBand3.Visible := (wCount > 1);
   wCount   := 0;
end;

procedure TRelConsAmortizacaoBloq.ppDetailBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
  wCount   := wCount + 1;
end;

end.
