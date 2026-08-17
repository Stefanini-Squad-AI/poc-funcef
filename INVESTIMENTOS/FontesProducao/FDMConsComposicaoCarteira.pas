//******************************************************************************
// Data     : 28/06/2005
// Código   : AL_1
// Motivo   : Implementação do Relatório de Consulta à Composição da Carteira
//******************************************************************************

unit FDMConsComposicaoCarteira;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDMConsComposicaoCarteira = class(TDmRelatoriosInv)
    qryPlanPrevCtbPatr: TwwQuery;
    qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField;
    qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField;
    qryConsCompCarteira: TwwQuery;
    dsConsCompCarteira: TwwDataSource;
    pplConsCompCarteira: TppBDEPipeline;
    rptComposicaoCarteira: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBImage1: TppDBImage;
    lblPeriodo: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    pplDescInvestimento: TppLabel;
    pplDesEmissor: TppLabel;
    pplDtEmissao: TppLabel;
    pplDtVencto: TppLabel;
    shpCabecalho: TppShape;
    pplQuantidade: TppLabel;
    ppdbQuantidade: TppDBText;
    ppdbVencto: TppDBText;
    ppdbDtEmisssao: TppDBText;
    ppdbDescEmissor: TppDBText;
    ppdbDescInvestimento: TppDBText;
    shpDetalhe: TppShape;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppdbTipoModulo: TppDBText;
    pplVlrMercado: TppLabel;
    ppdbVlrMercado: TppDBText;
    qryConsCompCarteiraDATAOPERACAO: TDateTimeField;
    qryConsCompCarteiraDATAVENCTO: TDateTimeField;
    qryConsCompCarteiraQUANTIDADE: TFloatField;
    qryConsCompCarteiraVALORMERCADO: TFloatField;
    qryConsCompCarteiraATIVO: TStringField;
    qryConsCompCarteiraEMISSOR: TStringField;
    qryConsCompCarteiraIDCLASSE: TFloatField;
    qryConsCompCarteiraCLASSETITULO: TStringField;
    qryConsCompCarteiraPLANPATRO: TStringField;
    qryConsCompCarteiraTIPOMODULO: TStringField;
    procedure shpDetalhePrint(Sender: TObject);
    procedure rptComposicaoCarteiraStartPage(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DMConsComposicaoCarteira: TDMConsComposicaoCarteira;

implementation

{$R *.DFM}

procedure TDMConsComposicaoCarteira.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra

end;

procedure TDMConsComposicaoCarteira.rptComposicaoCarteiraStartPage(
  Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   shpDetalhe.Brush.Color := clWhite;
end;

end.
