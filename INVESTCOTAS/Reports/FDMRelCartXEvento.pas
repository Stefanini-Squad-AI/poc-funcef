unit FDMRelCartXEvento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReportInv, ppCtrls, ppVar, ppBands, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCmRptManager, TXComp, TXRB,
  CmParamReport;

type
  TRelCartXEvento = class(TFrmCmReportInv)
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    procedure shpDetalhePrint(Sender: TObject);
    procedure rptReportStartPage(Sender: TObject);
    procedure rptReportBeforePrint(Sender: TObject);
  private
    { Private declarations }
     cCorZebra : TColor; 
  public
    { Public declarations }
  end;

var
  RelCartXEvento: TRelCartXEvento;

implementation

{$R *.DFM}

procedure TRelCartXEvento.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TRelCartXEvento.rptReportStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TRelCartXEvento.rptReportBeforePrint(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
end;

end.
