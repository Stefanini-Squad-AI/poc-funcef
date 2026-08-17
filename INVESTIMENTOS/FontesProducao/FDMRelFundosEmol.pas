//******************************************************************************
// Data      : 22/08/2006
// Código    : AL_1
// Pendencia : 23122
// SOL       : 45112
// Motivo    : Implementação para utilização do Fundo de Inv. em Participação
//******************************************************************************

unit FDmRelFundosEmol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmRelFundosEmol = class(TDmRelatoriosInv)
    RpConsFundoEmol: TppReport;
    ppHeaderBand29: TppHeaderBand;
    ppShape40: TppShape;
    ppLine144: TppLine;
    ppLabel284: TppLabel;
    ppLabel285: TppLabel;
    ppLabel295: TppLabel;
    ppLine148: TppLine;
    ppLabel299: TppLabel;
    ppLabel301: TppLabel;
    ppLabel303: TppLabel;
    ppLabel304: TppLabel;
    ppLabel305: TppLabel;
    ppLabel306: TppLabel;
    ppLabel307: TppLabel;
    LblPlanoMovEmol: TppLabel;
    ppLabel300: TppLabel;
    ppLabel308: TppLabel;
    ppLabel111: TppLabel;
    ppLabel119: TppLabel;
    ppLabel223: TppLabel;
    ppPeriodoEmol: TppLabel;
    ppDBImage1: TppDBImage;
    ppDetailBand31: TppDetailBand;
    shpDetalhe: TppShape;
    ppDBText147: TppDBText;
    ppDBText148: TppDBText;
    ppDBText149: TppDBText;
    ppDBText150: TppDBText;
    ppDBText151: TppDBText;
    ppDBText152: TppDBText;
    ppDBText153: TppDBText;
    ppDBText154: TppDBText;
    ppDBText155: TppDBText;
    ppDBText157: TppDBText;
    ppDBText158: TppDBText;
    ppFooterBand28: TppFooterBand;
    ppLine149: TppLine;
    ppLabel309: TppLabel;
    ppSystemVariable24: TppSystemVariable;
    ppSystemVariable25: TppSystemVariable;
    ppGroup12: TppGroup;
    ppGroupHeaderBand12: TppGroupHeaderBand;
    ppDBText156: TppDBText;
    ppGroupFooterBand12: TppGroupFooterBand;
    ppBDEConsFundoEmol: TppBDEPipeline;
    DsConsFundoEmol: TwwDataSource;
    QryConsFundoEmol: TwwQuery;
    QryConsFundoEmolDESCFUNDOINVEST: TStringField;
    QryConsFundoEmolDESCTIPOOPERACAO: TStringField;
    QryConsFundoEmolDATA: TDateTimeField;
    QryConsFundoEmolVLRCOTA: TFloatField;
    QryConsFundoEmolDATACOTIZACAO: TDateTimeField;
    QryConsFundoEmolDATALIQUIDACAO: TDateTimeField;
    QryConsFundoEmolVALOR: TFloatField;
    QryConsFundoEmolVLRCOLOCACAO: TFloatField;
    QryConsFundoEmolVLRTAXAS: TFloatField;
    QryConsFundoEmolVLRCORRETAGEM: TFloatField;
    QryConsFundoEmolVLRTOTAL: TFloatField;
    QryConsFundoEmolIDTIPOOPERACAO: TFloatField;
    QryConsFundoEmolPLANPRVCONTABPATRO: TStringField;
    QryConsFundoEmolDESCTIPOCOTA: TStringField;
    procedure shpDetalhePrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelFundosEmol: TDmRelFundosEmol;

implementation

{$R *.DFM}

procedure TDmRelFundosEmol.shpDetalhePrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   (Sender as TppShape).Brush.Color := cCorZebra;
end;

end.
