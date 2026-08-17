//******************************************************************************//
// Data      : 13/08/2007
// Código    : AL_3
// Pendência : 24957
// SOL       : 56201
// Motivo    : Implementação do Relatório Consolidado por Investimento
//             Quando existir uma linha detalhe não será impresso Subgrupo Totais/
//             Total da Operação
//******************************************************************************
// Data     : 01/11/2006
// Código   : AL_2
// Pendencia: 23670
// Desc     : Segregação de Planos
//******************************************************************************
// Data     : 22/05/2006
// Código   : AL_1
// Pendencia: 22375
// SOL      : 43236
// Desc     : Desmenbramento do Relatório de Cancelamento de Anúncios
//******************************************************************************

unit RAnunciosCanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppCtrls, ppBands,
  ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBTables, Wwquery, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlPadroes, uCtrlDireitos, uMensErro,
  TXRB, ppParameter;

type
  TRelAnunciosCanc = class(TFrmCmReport)
    pplAnunciosCanc: TppBDEPipeline;
    sprAnunciosCanc: TCMSqlParams;
    cdsAnunciosCanc: TCMClientDataSet;
    dsAnunciosCanc: TDataSource;
    rptAnunciosCanc: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblNomeRelatorio: TppLabel;
    LblEmpresa: TppLabel;
    ppDBImage1: TppDBImage;
    lblPeriodo: TppLabel;
    shpCabecalho: TppShape;
    ppLabel4: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel18: TppLabel;
    ppDetailBand1: TppDetailBand;
    shpDetalhe: TppShape;
    ppDBText2: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText15: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    LblSistema: TppLabel;
    ppLine2: TppLine;
    ppSystemVariable2: TppSystemVariable;
    shpGrupo: TppShape;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppLabel6: TppLabel;
    ppDBText3: TppDBText;
    ppLabel7: TppLabel;
    ppDBText4: TppDBText;
    ppLabel8: TppLabel;
    ppDBText5: TppDBText;
    shpTotal: TppShape;
    dbtTotQtdPrev: TppDBCalc;
    dbtTotQtdRec: TppDBCalc;
    dbtTotQtdRest: TppDBCalc;
    pplTotal: TppLine;
    lblTotais: TppLabel;
    dbcCount: TppDBCalc;
    dbtTotQtdCan: TppDBCalc;
    ppLabel1: TppLabel;
    ppDBText10: TppDBText;
    cdsAnunciosCancBOLETA: TStringField;
    cdsAnunciosCancDESCTIPOOPERACAO: TStringField;
    cdsAnunciosCancDESCINVESTIMENTO: TStringField;
    cdsAnunciosCancDESCCARTINVEST: TStringField;
    cdsAnunciosCancSIGLAMOTBLOQ: TStringField;
    cdsAnunciosCancDESCMOTBLOQ: TStringField;
    cdsAnunciosCancDATAEX: TDateTimeField;
    cdsAnunciosCancDATAPREVISTA: TDateTimeField;
    cdsAnunciosCancDATABASE: TDateTimeField;
    cdsAnunciosCancDATAOPERACAO: TDateTimeField;
    cdsAnunciosCancCONTA: TStringField;
    cdsAnunciosCancQTDPREVISTA: TFloatField;
    cdsAnunciosCancVALORPREVISTO: TFloatField;
    cdsAnunciosCancQTDRECEBIDA: TFloatField;
    cdsAnunciosCancQTDCANCELADA: TFloatField;
    cdsAnunciosCancPRECOUNITOPERACAO: TFloatField;
    cdsAnunciosCancVLROPERACAO: TFloatField;
    cdsAnunciosCancGRUPO: TStringField;
    ppGroup2: TppGroup;
    rdpGroupGrupo: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    cdsAnunciosCancPLANPRVCONTABPATRO: TStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape1: TppShape;
    ppDBText11: TppDBText;
    ppShape2: TppShape;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    CdsAnunciosCancCon: TCMClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    StringField7: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField8: TStringField;
    StringField9: TStringField;
    DsAnunciosCancCon: TDataSource;
    pplAnunciosCancCon: TppBDEPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppField3: TppField;
    ppField4: TppField;
    ppField5: TppField;
    ppField6: TppField;
    ppField7: TppField;
    ppField8: TppField;
    ppField9: TppField;
    ppField10: TppField;
    ppField11: TppField;
    ppField12: TppField;
    ppField13: TppField;
    ppField14: TppField;
    ppField15: TppField;
    ppField16: TppField;
    ppField17: TppField;
    ppField18: TppField;
    ppField19: TppField;
    rptAnunciosCancCon: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel2: TppLabel;
    ppLabel5: TppLabel;
    ppDBImage2: TppDBImage;
    ppLabel12: TppLabel;
    ppShape3: TppShape;
    ppLabel13: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape4: TppShape;
    ppDBText14: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppLabel25: TppLabel;
    ppDBText23: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable3: TppSystemVariable;
    ppLabel26: TppLabel;
    ppLine1: TppLine;
    ppSystemVariable4: TppSystemVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape5: TppShape;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppShape6: TppShape;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppGroup4: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLabel27: TppLabel;
    ppDBText25: TppDBText;
    ppLabel28: TppLabel;
    ppDBText26: TppDBText;
    ppLabel29: TppLabel;
    ppDBText27: TppDBText;
    ppLabel30: TppLabel;
    ppDBText28: TppDBText;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLabel31: TppLabel;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppParameterList1: TppParameterList;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppLabel17: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLabel32: TppLabel;
    ppShape7: TppShape;
    ppLabel33: TppLabel;
    ppDBText24: TppDBText;
    ppLine8: TppLine;
    ppLabel34: TppLabel;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppSummaryBand2: TppSummaryBand;
    ppShape10: TppShape;
    ppLabel35: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
    procedure rptAnunciosCancStartPage(Sender: TObject);
    procedure rdpGroupGrupoBeforePrint(Sender: TObject);
    procedure ppGroupFooterBand4BeforePrint(Sender: TObject);
    procedure rptAnunciosCancConStartPage(Sender: TObject);
    procedure ppGroupFooterBand2BeforePrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
    //AL_3
    iQdade : Integer;
  public
    { Public declarations }
    CtrlDireitos: TCtrlDireitos;
  end;

var
  RelAnunciosCanc: TRelAnunciosCanc;

implementation

{$R *.DFM}

procedure TRelAnunciosCanc.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlDireitos := TCtrlDireitos.Create;
   CtrlDireitos.InitializeAs(Padroes);
end;

procedure TRelAnunciosCanc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlDireitos);
  inherited;
end;

procedure TRelAnunciosCanc.CrmRptCMBeforePrint(Sender: TObject);
//AL_2
var iInvestimento, iTipoOper, iPlanPatro : Integer;
begin
  inherited;
  //AL_2
  iPlanPatro := -1;
  iInvestimento := -1;
  iTipoOper := -1;
  //AL_2
  if not CmpRptCM.ParamByName('iPlanoPatro').IsNull then
     iPlanPatro := CmpRptCM.ParamByName('iPlanoPatro').AsInteger;

  if not CmpRptCM.ParamByName('iInvestimento').IsNull then
     iInvestimento := CmpRptCM.ParamByName('iInvestimento').AsInteger;

  if not CmpRptCM.ParamByName('iTipoOper').IsNull then
     iTipoOper := CmpRptCM.ParamByName('iTipoOper').AsInteger;

  lblPeriodo.Caption := 'Período :' + CmpRptCM.ParamByName('DtIni').AsString + ' a ' + CmpRptCM.ParamByName('DtFim').AsString;

  //AL_2
  cdsAnunciosCanc.Data := CtrlDireitos.ListaRelAnunciosCanc(CmpRptCM.ParamByName('DtIni').AsDateTime,
                                                            CmpRptCM.ParamByName('DtFim').AsDateTime,
                                                            iPlanPatro,
                                                            iInvestimento,
                                                            iTipoOper);
end;

procedure TRelAnunciosCanc.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   //AL_3
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite; // Fim AL_3
   TppShape(Sender).Brush.Color := cCorZebra;
   // AL_3
   iqdade := iqdade + 1; // Fim AL_3
end;

procedure TRelAnunciosCanc.rptAnunciosCancStartPage(Sender: TObject);
begin
   lblNomeRelatorio.Caption := rptAnunciosCanc.PrinterSetup.DocumentName;
   inherited;
   cCorZebra := ClWhite;
   //AL_3
   iqdade := 0; // Fim AL_3
end;

procedure TRelAnunciosCanc.rdpGroupGrupoBeforePrint(Sender: TObject);
begin
  inherited;
   //AL_3
   iqdade := 0; // Fim AL_3
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;
end;

//AL_3
procedure TRelAnunciosCanc.ppGroupFooterBand4BeforePrint(Sender: TObject);
begin
  inherited;
  If iqdade > 1 then
     ppGroupFooterBand4.Visible := True
  else
     ppGroupFooterBand4.Visible := False;
end;

//AL_3
procedure TRelAnunciosCanc.rptAnunciosCancConStartPage(Sender: TObject);
begin
  inherited;
  iqdade := 0;
  cCorZebra := ClWhite;
end;

//AL_3
procedure TRelAnunciosCanc.ppGroupFooterBand2BeforePrint(Sender: TObject);
begin
  inherited;
  If iqdade > 1 then
     ppGroupFooterBand2.Visible := True
  else
     ppGroupFooterBand2.Visible := False;
end;

end.
