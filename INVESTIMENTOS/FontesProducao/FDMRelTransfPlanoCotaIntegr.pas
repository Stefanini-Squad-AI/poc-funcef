//******************************************************************************
// Data     : 07/03/2007
// Pendencia: 24658
// SOL      : 55067
// Motivo   : Implementações da consulta de transferência de integralização de cotas
//******************************************************************************

unit FDMRelTransfPlanoCotaIntegr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmTransfPlanoCotaIntegr = class(TDmRelatoriosInv)
    pplTransfPlanoCotaIntegr: TppBDEPipeline;
    pprTransfPlanoCotaIntegr: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBImage1: TppDBImage;
    pplPeriodoFDO: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    DsTransfPlanoCotaIntegr: TwwDataSource;
    QryTransfPlanoCotaIntegr: TwwQuery;
    QryTransfPlanoCotaIntegrDATAOPERACAO: TDateTimeField;
    QryTransfPlanoCotaIntegrIDLOTE: TStringField;
    QryTransfPlanoCotaIntegrDESCFUNDOINVEST: TStringField;
    QryTransfPlanoCotaIntegrPLANOPATROORIG: TStringField;
    QryTransfPlanoCotaIntegrPLANOPATRODEST: TStringField;
    QryTransfPlanoCotaIntegrDATALIQUIDACAO: TDateTimeField;
    QryTransfPlanoCotaIntegrQTDOPERACAO: TFloatField;
    QryTransfPlanoCotaIntegrVLROPERACAO: TFloatField;
    QryTransfPlanoCotaIntegrPERCENTUAL: TFloatField;
    QryTransfPlanoCotaIntegrVLRIOF: TFloatField;
    QryTransfPlanoCotaIntegrVLRRENDIMENTO: TFloatField;
    QryTransfPlanoCotaIntegrDESCTIPOFUNDOINV: TStringField;
    QryTransfPlanoCotaIntegrIDPLANPREVCTBPATRO: TFloatField;
    QryTransfPlanoCotaIntegrIDPLANPREVCTBPATRD: TFloatField;
    QryTransfPlanoCotaIntegrIDTIPOFUNDOINVEST: TFloatField;
    QryTransfPlanoCotaIntegrIDFUNDOINVEST: TFloatField;
    QryTransfPlanoCotaIntegrDTAINIPROC: TDateTimeField;
    ppShape2: TppShape;
    ppLabel4: TppLabel;
    ppLabel7: TppLabel;
    ppLabel3: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    shpDetalhe: TppShape;
    ppdbtQtde: TppDBText;
    ppdbtValor: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppdbtDataOper: TppDBText;
    ppdbtLote: TppDBText;
    ppdbtFundo: TppDBText;
    ppdbtPlanoO: TppDBText;
    ppdbtPlanoD: TppDBText;
    ppLine4: TppLine;
    ppdbcQtde: TppDBCalc;
    ppdbcValor: TppDBCalc;
    ppdbtPerc: TppDBText;
    ppDBText2: TppDBText;
    ppLine3: TppLine;
    QryTransfPlanoCotaIntegrDATAAPLICACAO: TDateTimeField;
    ppdbtDataAplic: TppDBText;
    ppLabel13: TppLabel;
    ppDBText1: TppDBText;
    QryTransfPlanoCotaIntegrDESCTIPOCOTA: TStringField;
    ppTipoCota: TppLabel;
    procedure shpDetalhePrint(Sender: TObject);
    //AL_2
    procedure ppGroupFooterBand2AfterGenerate(Sender: TObject);
    procedure ppGroupFooterBand2BeforePrint(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;    
  public
    { Public declarations }
  end;

var
  DmTransfPlanoCotaIntegr: TDmTransfPlanoCotaIntegr;
  //AL_2
  wCount : Integer;

implementation

{$R *.DFM}

procedure TDmTransfPlanoCotaIntegr.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;                                                     

  (Sender as TppShape).Brush.Color := cCorZebra;
end;

//AL_2
procedure TDmTransfPlanoCotaIntegr.ppGroupFooterBand2AfterGenerate(
  Sender: TObject);
begin
  inherited;
   wCount    := 0;
end;

//AL_2
procedure TDmTransfPlanoCotaIntegr.ppGroupFooterBand2BeforePrint(
  Sender: TObject);
begin
  inherited;
   ppGroupFooterBand2.Visible := (wCount > 1);
   wCount   := 0;
end;

//AL_2
procedure TDmTransfPlanoCotaIntegr.ppDetailBand1BeforePrint(Sender: TObject);
begin
  inherited;
   wCount   := wCount + 1;
end;

end.
