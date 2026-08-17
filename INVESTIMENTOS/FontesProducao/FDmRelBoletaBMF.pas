//******************************************************************************
// Data      : 19/12/2007
// Código    : AL_1
// Pendencia : 27124
// Desc      : Ajuste pata retirada de cartesiano na qryBuscaOperacoes
//******************************************************************************
unit FDmRelBoletaBMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppDB, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE;

type
  TDmRelBoletaBMF = class(TDmRelatoriosInv)
    RpBoletaBMF: TppReport;
    ppHeaderBand26: TppHeaderBand;
    ppShape27: TppShape;
    ppLabel250: TppLabel;
    lblVlrOperacao: TppLabel;
    ppLine106: TppLine;
    lblDtOper: TppLabel;
    ppLabel253: TppLabel;
    ppLabel257: TppLabel;
    lblDtLiquid: TppLabel;
    ppLabel226: TppLabel;
    ppLabel252: TppLabel;
    ppDBImage4: TppDBImage;
    ppLine55: TppLine;
    ppDetailBand26: TppDetailBand;
    ppShape28: TppShape;
    ppDBText105: TppDBText;
    ppDBText106: TppDBText;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppFooterBand25: TppFooterBand;
    ppLine107: TppLine;
    ppSystemVariable18: TppSystemVariable;
    ppLabel258: TppLabel;
    ppSystemVariable19: TppSystemVariable;
    ppLabel259: TppLabel;
    ppSystemVariable20: TppSystemVariable;
    ppSummaryBand9: TppSummaryBand;
    ppLine108: TppLine;
    lblVlrNegocios: TppLabel;
    ppLine109: TppLine;
    lblTxReg: TppLabel;
    lblTxOper: TppLabel;
    lblVlrLiqNota: TppLabel;
    blTxBolsa: TppLabel;
    lblTtDesp: TppLabel;
    pplVlrNegocios: TppLabel;
    pplAjustePosicao: TppLabel;
    lblAjustePosicao: TppLabel;
    ppBDEBoletaBMF: TppBDEPipeline;
    lblNumDocumento: TppLabel;
    ppdbeSglCorretora: TppDBText;
    pplDtOper: TppLabel;
    pplDtLiquid: TppLabel;
    ppDBText1: TppDBText;
    lblPrecoAjuste: TppLabel;
    pplVlrLiqNota: TppLabel;
    pplTxOper: TppLabel;
    pplTxReg: TppLabel;
    pplTxBolsa: TppLabel;
    pplTtDesp: TppLabel;
    pplNumDocumento: TppLabel;
    lblPUAjuste: TppLabel;
    pplPUAjuste: TppLabel;
    ppLabel1: TppLabel;
    RptBoletaRenFixaShape21: TppShape;
    RptBoletaRenFixaShape22: TppShape;
    RptBoletaRenFixaShape25: TppShape;
    RptBoletaRenFixaLabel32: TppLabel;
    RptBoletaRenFixaLabel21: TppLabel;
    RptBoletaRenFixaLabel20: TppLabel;
    RptBoletaRenFixaLabel24: TppLabel;
    RptBoletaRenFixaLabel27: TppLabel;
    RptBoletaRenFixaLabel28: TppLabel;
    RptBoletaRenFixaLabel25: TppLabel;
    RptBoletaRenFixaLabel34: TppLabel;
    RptBoletaRenFixaLabel33: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    qryBuscaOperacoes: TwwQuery;
    qryBuscaOperacoesIDHISTCARTINV: TFloatField;
    qryBuscaOperacoesIDOPERACAOINVEST: TFloatField;
    qryBuscaOperacoesIDCARTEIRAINVEST: TFloatField;
    qryBuscaOperacoesIDTIPOOPERACAO: TFloatField;
    qryBuscaOperacoesIDDESPOPERINVEST: TFloatField;
    qryBuscaOperacoesIDINVESTIMENTO: TFloatField;
    qryBuscaOperacoesQTDEMOVINVCART: TFloatField;
    qryBuscaOperacoesNATURMOVCARTINV: TStringField;
    qryBuscaOperacoesIDLOTE: TStringField;
    qryBuscaOperacoesVLRMOVCARTINV: TFloatField;
    qryBuscaOperacoesPLANO: TFloatField;
    qryBuscaOperacoesPLNCODIGO: TFloatField;
    qryBuscaOperacoesCODDOCUMENTO: TFloatField;
    qryBuscaOperacoesDESCINVESTIMENTO: TStringField;
    qryBuscaOperacoesDESCTIPOOPERACAO: TStringField;
    qryBuscaOperacoesDATAVENCOPER: TDateTimeField;
    qryBuscaOperacoesIDCARTEIRAGERENC: TFloatField;
    qryBuscaOperacoesNUMDOCUMENTO: TStringField;
    qryBuscaOperacoesSGLCORRETVALORES: TStringField;
    qryBuscaOperacoesPESOCONTRATO: TFloatField;
    qryBuscaOperacoesVLRAJOPER: TFloatField;
    qryBuscaOperacoesVLRAJUSTE: TFloatField;
    qryBuscaOperacoesVRLPUOPER: TFloatField;
    dsBuscaOperacoes: TwwDataSource;
    procedure RpBoletaBMFStartPage(Sender: TObject);
    procedure ppShape28Print(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;    
  public
    { Public declarations }
  end;

var
  DmRelBoletaBMF: TDmRelBoletaBMF;

implementation

uses FFechaBoletaBMF;

{$R *.DFM}

procedure TDmRelBoletaBMF.RpBoletaBMFStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TDmRelBoletaBMF.ppShape28Print(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra
end;

end.


