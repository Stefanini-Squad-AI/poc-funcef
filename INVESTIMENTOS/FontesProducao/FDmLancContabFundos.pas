//******************************************************************************
// Data      : 14/02/2007
// Alteração : AL_3
// Motivo    : Retirado o numero do modulo do filtro da tabela lancamento, para trazer
//             os registros do modulo = 1
//******************************************************************************
// Data      : 24/01/2006
// Alteração : AL_2
// Pendencia : 21263
// SOL       : 39850
// Motivo    : Melhora na performance e ajuste para evitar erro Type Mismatch
//****************************************************************************//
// Data     : 02/03/2005                                                      //
// Linha(s) : AL_1                                                            //
// Motivo   : Inclusão da Data, período e o tipo de operação "Atulização".    //
//****************************************************************************//

unit FDmLancContabFundos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppDB, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE;

type
  TDmLancContabFundos = class(TDmRelatoriosInv)
    pplLancContabFundos: TppBDEPipeline;
    DsLancContabFundos: TwwDataSource;
    QryLancContabFundos: TwwQuery;
    rpLancContabFundos: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBImage1: TppDBImage;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    QryLancContabFundosDATA: TDateTimeField;
    QryLancContabFundosPLANPRVCONTABPATRO: TStringField;
    QryLancContabFundosDESCFUNDOINVEST: TStringField;
    QryLancContabFundosDESCTIPOOPERACAO: TStringField;
    QryLancContabFundosHISTORICO: TStringField;
    QryLancContabFundosPLANO: TFloatField;
    QryLancContabFundosPLNCODIGO: TFloatField;
    QryLancContabFundosPLNPLANIL: TFloatField;
    QryLancContabFundosIDPLANPREVCTBPATR: TFloatField;
    QryLancContabFundosCOR: TFloatField;
    ppLancCtbFdoAtu: TppBDEPipeline;
    DsLancCtbFdoAtu: TwwDataSource;
    QryLancCtbFdoAtu: TwwQuery;
    rpLancCtbFdoAtu: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBImage2: TppDBImage;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLine4: TppLine;
    ppLabel10: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    QryLancContabFundosCTADEBITO: TStringField;
    QryLancContabFundosCTACREDITO: TStringField;
    QryLancContabFundosVLRDEBITO: TFloatField;
    QryLancContabFundosVLRCREDITO: TFloatField;
    QryLancContabFundosVALOROPERACAO: TFloatField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    RpConsCartRendVarShape2: TppShape;
    ppDbTipoOperaccao: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDbVlrDebito: TppDBText;
    ppDbVlrCredito: TppDBText;
    ppDbVlrOperacao: TppDBText;
    ppDBText5: TppDBText;
    shpCabecalho: TppShape;
    ppLabel4: TppLabel;
    ppLabel3: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppShape1: TppShape;
    ppDbPlanoPrevCtb: TppDBText;
    ppLine1: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppLlData: TppLabel;
    ppDbFundoInvest: TppDBText;
    ppDBText1: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppShape2: TppShape;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    pplDataPer: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppShape3: TppShape;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine3: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLine5: TppLine;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLine7: TppLine;
    QryLancCtbFdoAtuDATA: TDateTimeField;
    QryLancCtbFdoAtuHISTORICO: TStringField;
    QryLancCtbFdoAtuCTADEBITO: TStringField;
    QryLancCtbFdoAtuCTACREDITO: TStringField;
    QryLancCtbFdoAtuVLRDEBITO: TFloatField;
    QryLancCtbFdoAtuVLRCREDITO: TFloatField;
    QryLancCtbFdoAtuPLANO: TFloatField;
    QryLancCtbFdoAtuPLNCODIGO: TFloatField;
    QryLancCtbFdoAtuPLNPLANIL: TFloatField;
    ppShape4: TppShape;
    ppDBText10: TppDBText;
    ppDBText8: TppDBText;
    ppLabel9: TppLabel;
    ppLabel21: TppLabel;
    QryLancContabFundosDATA_INI: TDateTimeField;
    QryLancContabFundosDATA_FIM: TDateTimeField;
    procedure RpConsCartRendVarShape2Print(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand3BeforePrint(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand3AfterPrint(Sender: TObject);
    procedure rpLancCtbFdoAtuBeforePrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
    wcont     : double;    
  public
    { Public declarations }
  end;

var
  DmLancContabFundos: TDmLancContabFundos;

implementation

{$R *.DFM}

procedure TDmLancContabFundos.RpConsCartRendVarShape2Print(
  Sender: TObject);
begin
  inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;
   (Sender as TppShape).Brush.Color := cCorZebra;
end;

procedure TDmLancContabFundos.ppHeaderBand1BeforePrint(Sender: TObject);
begin
   inherited;

   //AL_1
   ppLlData.Caption := 'Período: ' + QryLancContabFundosDATA_INI.AsString + ' a ' +
                                     QryLancContabFundosDATA_FIM.AsString;
end;

procedure TDmLancContabFundos.ppGroupFooterBand3BeforePrint(
  Sender: TObject);
begin
  inherited;
   if wcont <= 1 then
      ppGroupFooterBand3.Visible := false
   else if wcont > 1 then
      ppGroupFooterBand3.Visible := true;
end;

procedure TDmLancContabFundos.ppDetailBand2BeforePrint(Sender: TObject);
begin
  inherited;
   wcont := wcont + 1;
end;

procedure TDmLancContabFundos.ppGroupFooterBand3AfterPrint(
  Sender: TObject);
begin
  inherited;
   wcont := 0;
end;

procedure TDmLancContabFundos.rpLancCtbFdoAtuBeforePrint(Sender: TObject);
begin
  inherited;
   wcont := 0;
end;

end.
