//********************************************************************************************************
//Data	 	: 07/07/2004
//Função	: Alteração na query qryBoletaOper - Incluido o Campo DIAS (Prazo)
//********************************************************************************************************
unit FDMRelBoletaRenFixOper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppMemo, ppRptExp;

type
  TDMRelBoletaRenFixOper = class(TDmRelatoriosInv)
    pplBoletaRenFix: TppBDEPipeline;
    rptBoletaRenFix: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    rptRenFixSaldoTitulo: TppLabel;
    lblNomeEmpresa: TppLabel;
    ppDBImage1: TppDBImage;
    pplblDataLiquidacao: TppLabel;
    ppdbBoleta: TppDBText;
    ppdbDataOperacao: TppDBText;
    pplblDataOperacao: TppLabel;
    ppLine1: TppLine;
    ppbBandaDetalhe: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel7: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine2: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    qryBoletaOper: TwwQuery;
    dsBoletaOper: TwwDataSource;
    ppdbDescOperacao: TppDBText;
    ppdbDesInvestimento: TppDBText;
    ppLabel13: TppLabel;
    ppLine3: TppLine;
    pplblBoleta: TppLabel;
    pplblTitulo: TppLabel;
    ppLabel18: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppdbDescEmissor: TppDBText;
    ppdbDescCustodiante: TppDBText;
    pplblEmissor: TppLabel;
    pplblCustodiante: TppLabel;
    pplblQuantidade: TppLabel;
    pplblValor: TppLabel;
    ppdbQuantidade: TppDBText;
    ppDBText12: TppDBText;
    pplblPrazo: TppLabel;
    ppLabel4: TppLabel;
    ppDBText14: TppDBText;
    pplblPuOperacao: TppLabel;
    ppdbPuOperacao: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppSystemVariable3: TppSystemVariable;
    qryBoletaOperPLANPRVCONTABPATRO: TStringField;
    qryBoletaOperPLANPATRO: TStringField;
    qryBoletaOperSIGLAEMISSOR: TStringField;
    qryBoletaOperDESCINVESTIMENTO: TStringField;
    qryBoletaOperDATAAPLICACAO: TDateTimeField;
    qryBoletaOperDATAOPERACAO: TDateTimeField;
    qryBoletaOperDESCTIPOOPERACAO: TStringField;
    qryBoletaOperVENCOPERACAO: TDateTimeField;
    qryBoletaOperPUEMISSAO: TFloatField;
    qryBoletaOperQTDEOPERACAO: TFloatField;
    qryBoletaOperPUOPERACAO: TFloatField;
    qryBoletaOperVLROPERACAO: TFloatField;
    qryBoletaOperIDOPERRENFIX: TFloatField;
    qryBoletaOperSALDO: TFloatField;
    qryBoletaOperFLGNEGOCIACAO: TStringField;
    qryBoletaOperNOMECLASSRISCO: TStringField;
    qryBoletaOperQTDCARTHIPO: TFloatField;
    qryBoletaOperVALCARTHIPO: TFloatField;
    qryBoletaOperSGLCUSTODIANTE: TStringField;
    ppdbDtaLiq: TppDBText;
    qryBoletaOperNATUREZAOPERACAO: TStringField;
    ppLine4: TppLine;
    qryBoletaOperOBSERVACAO: TStringField;
    qryBoletaOperBOLETA: TStringField;
    qryBoletaOperDIAS: TFloatField;
    ppDBPrazo: TppDBText;
  private
    { Private declarations }
  public
    { Public declarations }
    function MostraParam(Form: String): boolean; OverRide;

  end;

var
  DMRelBoletaRenFixOper: TDMRelBoletaRenFixOper;

implementation

uses FConsBoletaOperRenFix, FTelaAut;

{$R *.DFM}

{ TDMRelBoletaRenFixOper }

function TDMRelBoletaRenFixOper.MostraParam(Form: String): boolean;
begin
   try
      AbrirForm(frmConsBoletaOperRenFix,TfrmConsBoletaOperRenFix, false);
      frmConsBoletaOperRenFix.fModal := True;
      frmConsBoletaOperRenFix.WindowState := wsNormal;
      Result := True
   except
      Result := False;
   end;
end;

end.
