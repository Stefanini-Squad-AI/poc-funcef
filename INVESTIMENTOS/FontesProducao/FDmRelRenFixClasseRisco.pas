unit FDmRelRenFixClasseRisco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmRelRenFixClasseRisco = class(TDmRelatoriosInv)
    pplClasseRiscoRenFix: TppBDEPipeline;
    dsClasseRiscoRenFix: TwwDataSource;
    qryClasseRiscoRenFix: TwwQuery;
    rptClasseRiscoRenFix: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBImage1: TppDBImage;
    ppLabel4: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    shpDetalhe: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    shpCORCLASSRISCO: TppShape;
    shpCabecalho: TppShape;
    qryClasseRiscoRenFixNOMECLASSRISCO: TStringField;
    qryClasseRiscoRenFixNIVELCLASSRISCO: TFloatField;
    qryClasseRiscoRenFixCORCLASSRISCO: TFloatField;
    procedure shpDetalhePrint(Sender: TObject);
    procedure rptClasseRiscoRenFixStartPage(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelRenFixClasseRisco: TDmRelRenFixClasseRisco;

implementation

{$R *.DFM}

procedure TDmRelRenFixClasseRisco.rptClasseRiscoRenFixStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TDmRelRenFixClasseRisco.shpDetalhePrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra;

   if qryClasseRiscoRenFixCORCLASSRISCO.AsInteger = 0 then
      shpCORCLASSRISCO.Brush.Color := clWhite
   else
      shpCORCLASSRISCO.Brush.Color := qryClasseRiscoRenFixCORCLASSRISCO.AsInteger;

end;


end.
