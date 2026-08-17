unit FDmRelHistCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmRelHistCota = class(TDmRelatoriosInv)
    RptHistoricoCota: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppRepExeDireitoShape1: TppShape;
    ppLine6: TppLine;
    ppLData: TppLabel;
    ppLabel94: TppLabel;
    ppLabel97: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel108: TppLabel;
    ppLabel112: TppLabel;
    ppLabel133: TppLabel;
    ppDBImage1: TppDBImage;
    ppLine38: TppLine;
    ppLine56: TppLine;
    ppLine58: TppLine;
    ppLine60: TppLine;
    ppLine61: TppLine;
    ppLine62: TppLine;
    ppLine63: TppLine;
    ppLine64: TppLine;
    lblCartGerenc: TppLabel;
    lblPlan: TppLabel;
    ppDetailBand22: TppDetailBand;
    pspHistCota: TppShape;
    ppDBText12: TppDBText;
    ppDBText27: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText51: TppDBText;
    ppLine41: TppLine;
    ppLine55: TppLine;
    ppLine57: TppLine;
    ppLine59: TppLine;
    ppLine65: TppLine;
    ppLine66: TppLine;
    ppLine67: TppLine;
    ppLine68: TppLine;
    ppLine69: TppLine;
    ppFooterBand4: TppFooterBand;
    ppLine7: TppLine;
    ppLabel11: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppSystemVariable12: TppSystemVariable;
    ppSummaryBand5: TppSummaryBand;
    ppShape5: TppShape;
    ppShape7: TppShape;
    ppShape9: TppShape;
    ppShape32: TppShape;
    ppShape33: TppShape;
    ppShape35: TppShape;
    lblTitPersInd: TppLabel;
    ppLabel260: TppLabel;
    ppShape37: TppShape;
    ppLabel218: TppLabel;
    lblIndicador: TppLabel;
    lblValorizacao: TppLabel;
    lblPerIndicador: TppLabel;
    lblPerSind: TppLabel;
    ppLine121: TppLine;
    ppLine122: TppLine;
    ppLine125: TppLine;
    ppLabel261: TppLabel;
    ppLine130: TppLine;
    ppShape8: TppShape;
    ppLabel127: TppLabel;
    ppLine44: TppLine;
    ppLine53: TppLine;
    lblEqmCab: TppLabel;
    lblEQM: TppLabel;
    BdeHistoricoCota: TppBDEPipeline;
    BdeHitoricoCotappField1: TppField;
    BdeHitoricoCotappField2: TppField;
    BdeHitoricoCotappField3: TppField;
    BdeHitoricoCotappField4: TppField;
    BdeHitoricoCotappField5: TppField;
    BdeHitoricoCotappField6: TppField;
    BdeHitoricoCotappField7: TppField;
    BdeHitoricoCotappField8: TppField;
    DsHistoricoCota: TwwDataSource;
    procedure pspHistCotaPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;    
  public
    { Public declarations }
  end;

var
  DmRelHistCota: TDmRelHistCota;

implementation

{$R *.DFM}

procedure TDmRelHistCota.pspHistCotaPrint(Sender: TObject);
begin
  inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;
   (Sender as TppShape).Brush.Color := cCorZebra;
end;

end.
