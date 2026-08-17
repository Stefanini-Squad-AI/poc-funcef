unit FDmRelConsPosAltCestaOpcInd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppCtrls, ppDB, ppVar, ppBands, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt;

type
  TDmRelConsPosAltCestaOpcInd = class(TDmRelatoriosInv)
    pplConsAltCestaOpcInd: TppBDEPipeline;
    ppRConsAltCestaOpcInd: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBImage1: TppDBImage;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppShape8: TppShape;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLine1: TppLine;
    ppLine5: TppLine;
    shpDetalhe: TppShape;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDataVigencia: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel16: TppLabel;
    ppLVlrMin: TppLabel;
    ppLabel17: TppLabel;
    ppLVlrMax: TppLabel;
    ppLabel18: TppLabel;
    ppLVlrAtual: TppLabel;
    ppOpcao: TppLabel;
    procedure rpConsMovOpcIndStartPage(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelConsPosAltCestaOpcInd: TDmRelConsPosAltCestaOpcInd;

implementation

Uses uBibliotecaInvest, FCadOrdemOpcInd, UOperComum, UOpcaoIndice,
     UOperacaoInvest, FCadCestaOpcInd;

{$R *.DFM}

procedure TDmRelConsPosAltCestaOpcInd.rpConsMovOpcIndStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;

end;

procedure TDmRelConsPosAltCestaOpcInd.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra;

end;

end.
