//******************************************************************************
// Data      : 07/04/2006
// Pendência :
// SOL       :
// Código    : AL_1
// Motivo    : Implementado do somatorio por data de operacao
//******************************************************************************
// Data      : 29/03/2006
// Pendência : 21266
// SOL       : 36904
// Código    : AL_25
// Motivo    : Retirada do relatório RPMapaCorret para o FDMRelMapaCorret
//******************************************************************************

unit FDmRelMapaCorret;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmRelMapaCorret = class(TDmRelatoriosInv)
    ppBdeMapaCorret: TppBDEPipeline;
    RpMapaCorret: TppReport;
    ppHeaderBand15: TppHeaderBand;
    ppLInicio: TppLabel;
    ppLFim: TppLabel;
    RpMapaCorretShape1: TppShape;
    ppLine37: TppLine;
    RpMapaCorretLabel3: TppLabel;
    RpMapaCorretLabel4: TppLabel;
    RpMapaCorretLabel6: TppLabel;
    RpMapaCorretLine1: TppLine;
    RpMapaCorretLabel1: TppLabel;
    RpMapaCorretLabel10: TppLabel;
    ppLabel210: TppLabel;
    ppLabel211: TppLabel;
    ppLabel212: TppLabel;
    ppLabel213: TppLabel;
    ppLabel214: TppLabel;
    ppLabel215: TppLabel;
    ppLabel216: TppLabel;
    ppLabel59: TppLabel;
    ppLabel61: TppLabel;
    ppDBImage18: TppDBImage;
    ppLabel121: TppLabel;
    ppDetailBand15: TppDetailBand;
    shpDetalhe: TppShape;
    RpMapaCorretDBText1: TppDBText;
    RpMapaCorretDBText2: TppDBText;
    RpMapaCorretDBText5: TppDBText;
    RpMapaCorretDBText8: TppDBText;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppDBText94: TppDBText;
    ppDBText109: TppDBText;
    ppDBText110: TppDBText;
    ppDBText111: TppDBText;
    ppDBText64: TppDBText;
    ppFooterBand14: TppFooterBand;
    ppLine41: TppLine;
    ppLabel102: TppLabel;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    RpMapaCorretSummaryBand1: TppSummaryBand;
    RpMapaCorretLine2: TppLine;
    RpMapaCorretDBCalc1: TppDBCalc;
    RpMapaCorretDBCalc2: TppDBCalc;
    RpMapaCorretDBCalc3: TppDBCalc;
    RpMapaCorretLabel9: TppLabel;
    RpMapaCorretDBCalc4: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppLine2: TppLine;
    procedure shpDetalhePrint(Sender: TObject);
    procedure RpMapaCorretStartPage(Sender: TObject);
    procedure ppDetailBand15BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1AfterGenerate(Sender: TObject);
    procedure RpMapaCorretBeforePrint(Sender: TObject);
  private
    { Private declarations }
    wCount    : Integer;    
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelMapaCorret: TDmRelMapaCorret;

implementation

uses FConsMovCorretora;

{$R *.DFM}


procedure TDmRelMapaCorret.shpDetalhePrint(Sender: TObject);
begin
   inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;
   (Sender as TppShape).Brush.Color := cCorZebra;
end;

procedure TDmRelMapaCorret.RpMapaCorretStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
   shpDetalhe.Brush.Color := $00E3E3E3;
end;

procedure TDmRelMapaCorret.ppDetailBand15BeforePrint(Sender: TObject);
begin
  inherited;
   wCount := wCount + 1;
end;

procedure TDmRelMapaCorret.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
  inherited;
  If wCount <= 1 Then
     ppGroupFooterBand1.Visible := False
  else
     ppGroupFooterBand1.Visible := True;
   wCount    := 0;          
end;

procedure TDmRelMapaCorret.ppGroupFooterBand1AfterGenerate(
  Sender: TObject);
begin
  inherited;
   wCount    := 0;
end;

procedure TDmRelMapaCorret.RpMapaCorretBeforePrint(Sender: TObject);
begin
  inherited;
   wCount    := 0;
   ppGroupFooterBand1.Visible := True;
end;

end.
