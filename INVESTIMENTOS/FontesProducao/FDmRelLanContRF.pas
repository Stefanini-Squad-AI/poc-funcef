//************************************************************************************************//
// Data      : 01/04/2005                                                                         //
// Alteracao : DFM                                                                                //
// Motivo    : Inclusão do Filtro de Plano/Patrocinadora na query qryLancContATURF                //
//************************************************************************************************//
unit FDmRelLanContRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmRelLanContRF = class(TDmRelatoriosInv)
    dsLanContRF: TwwDataSource;
    pplLanContRF: TppBDEPipeline;
    pprLanContRF: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    grpCabPlano: TppGroupHeaderBand;
    grpRodapePlano: TppGroupFooterBand;
    ppDBText1: TppDBText;
    shpCabInvestimento: TppShape;
    shpCabecalho: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel8: TppLabel;
    ppDBText5: TppDBText;
    shpDetalhe: TppShape;
    ppDBText6: TppDBText;
    ppLine1: TppLine;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBText7: TppDBText;
    dblValLanc: TppDBText;
    ppLine3: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel12: TppLabel;
    ppLine4: TppLine;
    ppDBText9: TppDBText;
    updLanContATURF: TUpdateSQL;
    lblAlerta: TppLabel;
    ppGroup2: TppGroup;
    grpCabInvestimento: TppGroupHeaderBand;
    grpRodapeInvestimento: TppGroupFooterBand;
    rptRenFixSaldoTitulo: TppLabel;
    ppLabel16: TppLabel;
    ppLabel14: TppLabel;
    ppDBImage1: TppDBImage;
    ppDBText8: TppDBText;
    ppDBCalc2: TppDBCalc;
    ppLabel1: TppLabel;
    qryLancContATURF: TwwQuery;
    qryLancContATURFDATA: TDateTimeField;
    qryLancContATURFPLANPRVCONTABPATRO: TStringField;
    qryLancContATURFDESCINVESTIMENTO: TStringField;
    qryLancContATURFDATAOPERACAO: TDateTimeField;
    qryLancContATURFPLNCODIGO: TFloatField;
    qryLancContATURFPLNPLANIL: TFloatField;
    qryLancContATURFHISTORICO: TStringField;
    qryLancContATURFLACVALOR: TFloatField;
    qryLancContATURFSLDATUAL: TFloatField;
    qryLancContATURFSLDANT: TFloatField;
    qryLancContATURFVARIACAO: TFloatField;
    qryLancContATURFIDINVESTIMENTO: TStringField;
    qryLancContATURFIDPLANPREVCTBPATR: TFloatField;
    qryLancContATURFCOR: TFloatField;
    qryPlanoConta: TwwQuery;
    qryLancContATURFPLANO: TFloatField;
    qryLancContATURFPLACONTA: TStringField;
    qryPlanoContaPLANATUREZA: TStringField;
    procedure dblValLancPrint(Sender: TObject);
    procedure grpCabInvestimentoAfterPrint(Sender: TObject);
    procedure grpRodapeInvestimentoBeforePrint(Sender: TObject);
  private
    { Private declarations }
    fTotLanc: Double;
  public
    { Public declarations }
  end;

var
  DmRelLanContRF: TDmRelLanContRF;

implementation

uses uSistema;

{$R *.DFM}

procedure TDmRelLanContRF.grpCabInvestimentoAfterPrint(Sender: TObject);
begin
  inherited;
  fTotLanc := 0;
end;

procedure TDmRelLanContRF.dblValLancPrint(Sender: TObject);
begin
  inherited;
  fTotLanc := fTotLanc + qryLancContATURFLACVALOR.AsFloat;
end;

procedure TDmRelLanContRF.grpRodapeInvestimentoBeforePrint(Sender: TObject);
begin
  inherited;
  if Abs(Abs(qryLancContATURFVARIACAO.AsFloat) - Abs(fTotLanc)) >= 0.02 then
     lblAlerta.Visible := True
  else
     lblAlerta.Visible := False;
end;

end.
