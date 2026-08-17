//******************************************************************************
// Rotina     : QryTransfPlanoLoteFDO
// SOL        : 98279
// Kintana    : 428095
// Data       : 13/10/2008  
// Responsável: Ricardo Cristiano
// Descrição  : Implementação para tratar apenas os registros de transferência,
//               não mais os gerados pela a unificação de transferências
//******************************************************************************
// Data      : 09/03/2007
// Código    : AL_3
//Pendencia  :
// SOL       :
// Motivo    : Implementaçãos do tipo de cotas
//******************************************************************************
// Data      : 12/12/2006
// Código    : AL_2
//Pendencia  : 23954
// SOL       :
// Motivo    : Implementações para o Fundo de Participações
//******************************************************************************
// Data     : 03/11/2006
// Código   : AL_1
// Pendencia: 23787
// SOL      : 43633
// Motivo   : Implementação do relatório de transferência entre plano
//******************************************************************************

unit FDMRelTransfPlanoLoteFDO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmTransfPlanoLoteFDO = class(TDmRelatoriosInv)
    pplTransfPlanoLoteFDO: TppBDEPipeline;
    pprTransfPlanoLoteFDO: TppReport;
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
    DsTransfPlanoLoteFDO: TwwDataSource;
    QryTransfPlanoLoteFDO: TwwQuery;
    QryTransfPlanoLoteFDODATAOPERACAO: TDateTimeField;
    QryTransfPlanoLoteFDOIDLOTE: TStringField;
    QryTransfPlanoLoteFDODESCFUNDOINVEST: TStringField;
    QryTransfPlanoLoteFDOPLANOPATROORIG: TStringField;
    QryTransfPlanoLoteFDOPLANOPATRODEST: TStringField;
    QryTransfPlanoLoteFDODATALIQUIDACAO: TDateTimeField;
    QryTransfPlanoLoteFDOQTDOPERACAO: TFloatField;
    QryTransfPlanoLoteFDOVLROPERACAO: TFloatField;
    QryTransfPlanoLoteFDOPERCENTUAL: TFloatField;
    QryTransfPlanoLoteFDOVLRIOF: TFloatField;
    QryTransfPlanoLoteFDOVLRRENDIMENTO: TFloatField;
    QryTransfPlanoLoteFDODESCTIPOFUNDOINV: TStringField;
    QryTransfPlanoLoteFDOIDPLANPREVCTBPATRO: TFloatField;
    QryTransfPlanoLoteFDOIDPLANPREVCTBPATRD: TFloatField;
    QryTransfPlanoLoteFDOIDTIPOFUNDOINVEST: TFloatField;
    QryTransfPlanoLoteFDOIDFUNDOINVEST: TFloatField;
    QryTransfPlanoLoteFDODTAINIPROC: TDateTimeField;
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
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    ppdbtPerc: TppDBText;
    ppDBText2: TppDBText;
    ppLine3: TppLine;
    QryTransfPlanoLoteFDODATAAPLICACAO: TDateTimeField;
    ppdbtDataAplic: TppDBText;
    ppLabel13: TppLabel;
    ppTipoCota: TppLabel;
    ppDBText3: TppDBText;
    QryTransfPlanoLoteFDODESCTIPOCOTA: TStringField;
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
  DmTransfPlanoLoteFDO: TDmTransfPlanoLoteFDO;
  //AL_2
  wCount : Integer;

implementation

{$R *.DFM}

procedure TDmTransfPlanoLoteFDO.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  (Sender as TppShape).Brush.Color := cCorZebra;
end;

//AL_2
procedure TDmTransfPlanoLoteFDO.ppGroupFooterBand2AfterGenerate(
  Sender: TObject);
begin
  inherited;
   wCount    := 0;
end;

//AL_2
procedure TDmTransfPlanoLoteFDO.ppGroupFooterBand2BeforePrint(
  Sender: TObject);
begin
  inherited;
   ppGroupFooterBand2.Visible := (wCount > 1);
   wCount   := 0;
end;

//AL_2
procedure TDmTransfPlanoLoteFDO.ppDetailBand1BeforePrint(Sender: TObject);
begin
  inherited;
   wCount   := wCount + 1;
end;

end.
