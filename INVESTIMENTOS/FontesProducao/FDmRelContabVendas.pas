//******************************************************************************
// Data     : 07/01/2005
// Motivo   : Implementação do Relatório de Lancamentos Contábeis de OPE de RV
//******************************************************************************

unit FDmRelContabVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosRendaFixa, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, TeEngine, Series,
  ExtCtrls, TeeProcs, Chart, ppChrtDP, ppChrt, ppViewr, FDMRelatoriosInv;

type
  TDmRelContabVendas = class(TDmRelatoriosInv)
    rptContabVendas: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    pplOrdens: TppBDEPipeline;
    qryOrdens: TwwQuery;
    qryOrdensDESCINVESTIMENTO: TStringField;
    qryOrdensQTDEORDMOVINV: TFloatField;
    qryOrdensPUORDMOVINV: TFloatField;
    qryOrdensVLRVENDA: TFloatField;
    qryOrdensPUCUSTO: TFloatField;
    qryOrdensVLRCUSTO: TFloatField;
    qryOrdensVARIACAO: TFloatField;
    qryOrdensDATAORDMOVINV: TDateTimeField;
    dsOrdens: TwwDataSource;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    shpCabInvestimento: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    shpDetalhe: TppShape;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
    ppDBText5: TppDBText;
    ppLabel8: TppLabel;
    ppDBText6: TppDBText;
    ppLabel9: TppLabel;
    ppDBText7: TppDBText;
    ppLabel10: TppLabel;
    ppLine1: TppLine;
    shpRodapeInvestimento: TppShape;
    ppLabel11: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppDBImage1: TppDBImage;
    lblDataOper: TppLabel;
    qryCarteira: TwwQuery;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryInvestimento: TwwQuery;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    procedure rptContabVendasStartPage(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
    function MostraParam(Form: String): boolean; OverRide;
  end;

var
  DmRelContabVendas: TDmRelContabVendas;

implementation

{$R *.DFM}

procedure TDmRelContabVendas.rptContabVendasStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   shpDetalhe.Brush.Color := clWhite;
end;

procedure TDmRelContabVendas.shpDetalhePrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

function TDmRelContabVendas.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios
   frm := nil;

   if frm = nil then begin
      Result := False;
      Exit;
   end;
   with frm do begin
      Result := (ShowModal = mrOk);
      Free;
   end;
end;

end.
