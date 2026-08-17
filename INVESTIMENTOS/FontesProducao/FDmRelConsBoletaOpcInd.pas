unit FDmRelConsBoletaOpcInd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppCtrls, ppDB, ppVar, ppBands, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt;

type
  TDmRelConsBoletaOpcInd = class(TDmRelatoriosInv)
    rpConsBoletaOpcInd: TppReport;
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
    pplConsBoletaOperOpcInd: TppBDEPipeline;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDespOperacao: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    pplDespOperacao: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppShape1: TppShape;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLine6: TppLine;
    pplConsBoletaDespOpcInd: TppBDEPipeline;
    ppLine1: TppLine;
    ppShape34: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLabel11: TppLabel;
    ppShape2: TppShape;
    pplVlrDesp: TppLabel;
    pplVlrTotal: TppLabel;
    ppShape3: TppShape;
    pplLabelDesp: TppLabel;
    pplLabTotal: TppLabel;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine3: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    procedure ppDespOperacaoPrint(Sender: TObject);
    procedure pplDespOperacaoBeforeGenerate(Sender: TObject);
    procedure ppSummaryBand1AfterPrint(Sender: TObject);
  private
    { Private declarations }        
  public
    { Public declarations }
  end;

var
  DmRelConsBoletaOpcInd: TDmRelConsBoletaOpcInd;
  iRecDesp : Integer;

implementation

Uses uBibliotecaInvest, dOpcoesIndice;

{$R *.DFM}

procedure TDmRelConsBoletaOpcInd.ppDespOperacaoPrint(Sender: TObject);
begin
  inherited;
    iRecDesp := 0; 
end;

procedure TDmRelConsBoletaOpcInd.pplDespOperacaoBeforeGenerate(
  Sender: TObject);
begin
  inherited;
    iRecDesp := iRecDesp + 1;
end;

procedure TDmRelConsBoletaOpcInd.ppSummaryBand1AfterPrint(Sender: TObject);
begin
  inherited;
   If iRecDesp = 1 Then
      ppSummaryBand1.Visible := False
   Else
      ppSummaryBand1.Visible := True;      
end;

end.
