unit FDmRelLanContRV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, DBTables, ppCtrls, ppBands, ppClass, Db, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmRelLanContRV = class(TDmRelatoriosInv)
    pplLanContRV: TppBDEPipeline;
    pprLanContRV: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    shpCabecalho: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel13: TppLabel;
    ppDBText9: TppDBText;
    ppDetailBand1: TppDetailBand;
    shpDetalhe: TppShape;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    dblValLanc: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    shpDet: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText5: TppDBText;
    ppDBText8: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel11: TppLabel;
    ppDBText10: TppDBText;
    procedure pprLanContRVStartPage(Sender: TObject);
    procedure shpDetPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelLanContRV: TDmRelLanContRV;

implementation

uses fConsLanContRV;
{$R *.DFM}

procedure TDmRelLanContRV.pprLanContRVStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   shpDet.Brush.Color := clWhite;
end;

procedure TDmRelLanContRV.shpDetPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

end.
