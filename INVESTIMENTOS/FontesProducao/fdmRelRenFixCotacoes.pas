//******************************************************************************
//Data	          : 29/06/2004
//Origem	  : FUNCEF
//Query 	  : qryCotacoes
//Motivo(S)       : Passado o Active da qry para 'False'
//******************************************************************************

unit FdmRelRenFixCotacoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosRendaFixa, ppStrtch, ppCTMain, ppDB, ppVar, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDBPipe, ppDBBDE;

type
  TdmRelRenFixCotacoes = class(TDmRelatoriosRendaFixa)
    pplCotacoes: TppBDEPipeline;
    dsCotacoes: TwwDataSource;
    qryCotacoes: TwwQuery;
    rptCotacoesRenFix: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLine1: TppLine;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppDBImage4: TppDBImage;
    ppLabel64: TppLabel;
    ppLabel63: TppLabel;
    ppLCarteiraAcoesEmiBolsa: TppLabel;
    qryCotacoesDESCINVESTIMENTO: TStringField;
    qryCotacoesDATAVENCTO: TDateTimeField;
    qryCotacoesDATACOTACAO: TDateTimeField;
    qryCotacoesVLRCOTACAO: TFloatField;
    qryCotacoesIDINVESTIMENTO: TFloatField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    shpDetalhe: TppShape;
    shpTitInvestimento: TppShape;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    shpTitDataVenc: TppShape;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    lblPeriodo: TppLabel;
    procedure rptCotacoesRenFixStartPage(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  dmRelRenFixCotacoes: TdmRelRenFixCotacoes;

implementation

{$R *.DFM}

procedure TdmRelRenFixCotacoes.rptCotacoesRenFixStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TdmRelRenFixCotacoes.shpDetalhePrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

end.
