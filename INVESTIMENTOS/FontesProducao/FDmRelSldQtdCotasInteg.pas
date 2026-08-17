//******************************************************************************
// Rotina     : QryTotalMovOutro, QryTotIntegr
// SOL        : 166338.6801
// Kintana    : 1451970
// Data       : 01/11/2011
// Responsável: Otacilio aquino
// Descrição  : Permitir mais de uma integralização para o mesmo fundo e na
//              mesma data
//******************************************************************************
// Rotina     : QrySldQtdCotasInteg
// SOL        : 99876
// Kintana    : 441255  
// Data       : 28/11/2008  
// Responsável: Ricardo Cristiano
// Descrição  : Implementação para unificar as subscrições quando ocorrer a operação 
//              de transferência entre planos
//******************************************************************************
// Data     : 18/05/2007
// Código   : AL_10
// Pendencia: 25404
// SOL      : 60573
// Motivo   : Implementação na QrySldQtdCotasInteg para trazer as variações das
//            aplicações por idoperacaofundo, devido a alteração na subscrição para permitir
//             aceitar "n" subscrições com a mesma data de subscrição.
//******************************************************************************
// Data     : 17/04/2007
// Código   : AL_9
// Pendencia:
// SOL      :
// Motivo   : Implementação na QrySldQtdCotasInteg para trazer as aplicações por
//             idoperacaofundo, devido a alteração na subscrição para permitir
//             aceitar "n" subscrições com a mesma data de subscrição.
//******************************************************************************
// Data     : 08/03/2007
// Código   : AL_8
// Pendencia: 24658
// SOL      : 55067
// Motivo   : Implementações na totalização por fundo e plano
//******************************************************************************
// Data      : 04/01/2006
// Código    : AL_7
// Pendencia : 23857
// SOL       :
// Motivo    : Implementação de ajustes para mostra as "n" subscrições com a mesma
//             data de subscrição que poderão ocorrer, diferenciando pelo "IDOPERACAOFUNDO".
//******************************************************************************
// Data      : 26/09/2006
// Código    : AL_6
// Pendencia :
// SOL       :
// Motivo    : Implementação para tratar o IDTIPOCOTA com valor NULL
//******************************************************************************
// Data      : 25/09/2006
// Código    : AL_5
// Pendencia :
// SOL       :
// Motivo    : Implementação da apuração de variação do saldo de fundos mesmo que
//             tenha operação no dia
//******************************************************************************
// Data      : 21/08/2006
// Código    : AL_4
// Pendencia : 22946
// SOL       : 45112
// Motivo    : Implementação para utilização do Fundo de Inv. em Participação
//******************************************************************************
// Data     : 12/12/2005
// Linha(s) : Al_3
// Motivo   : Implementação do tratamento de saldo sintetico conforme a susbcrição
//******************************************************************************
// Data     : 24/11/2005
// Linha(s) : AL_2
// Motivo   : Acerto na data do fluxo, antes mostrava a data da atualização
//******************************************************************************
// Data     : 20/10/2005
// Linha(s) : AL_1
// Motivo   : Implementado o totalizador geral
//******************************************************************************

unit FDmRelSldQtdCotasInteg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt;

type
  TDmRelSldQtdCotasInteg = class(TDmRelatoriosInv)
    pplSldQtdCotasInteg: TppBDEPipeline;
    DsSldQtdCotasInteg: TwwDataSource;
    QrySldQtdCotasInteg: TwwQuery;
    rpSldQtdCotasIntegX: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    //AL_4
    ppDBImage1: TppDBImage;
    lblPeriodoRefx: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppShape2: TppShape;
    shpDetalhe: TppShape;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    //AL_4
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDbQtd: TppDBText;
    ppDbDtaFlx: TppDBText;
    ppDbDtaCta: TppDBText;
    ppDbVlrCta: TppDBText;
    ppDbVlrAtu: TppDBText;
    ppDbVarDia: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    DbVarTotal: TppDBCalc;
    DbVlrTotal: TppDBCalc;
    dbQtdTotal: TppDBCalc;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppTipoCota: TppLabel;
    ppDbTipoCota: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDbFundos: TppDBText;
    ppDBText29: TppDBText;
    ppLine7: TppLine;
    ppLine8: TppLine;
    pplPlanox: TppLabel;
    ppDBText2: TppDBText;
    ppLine5: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel4: TppLabel;
    ppLabel13: TppLabel;
    pplSomatorio: TppLine;
    dbcVar: TppDBCalc;
    dbcVlrAtu: TppDBCalc;
    dbcQtd: TppDBCalc;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    rpSldQtdCotasIntegXX: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppDBImage2: TppDBImage;
    ppLabel16: TppLabel;
    ppShape1: TppShape;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppDBText1: TppDBText;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLine6: TppLine;
    ppLabel26: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLabel27: TppLabel;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppDBText10: TppDBText;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLine13: TppLine;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppLabel28: TppLabel;
    ppLine14: TppLine;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLine15: TppLine;
    ppLabel29: TppLabel;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppShape6: TppShape;
    ppDetailBand5: TppDetailBand;
    ppShape7: TppShape;
    ppSummaryBand3: TppSummaryBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    pplSldQtdCotasIntegAn: TppBDEPipeline;
    DsSldQtdCotasIntegAn: TwwDataSource;
    QrySldQtdCotasIntegAn: TwwQuery;
    ppDBText12: TppDBText;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    QrySldQtdCotasIntegAnID: TStringField;
    QrySldQtdCotasIntegAnDESCFUNDOINVEST: TStringField;
    QrySldQtdCotasIntegAnQTDHISTCOTAINTEGR: TFloatField;
    QrySldQtdCotasIntegAnDATAAPLICACAO: TDateTimeField;
    QrySldQtdCotasIntegAnDATAHISTCOTAINTEG: TDateTimeField;
    QrySldQtdCotasIntegAnVLRCOTAINTEGR: TFloatField;
    QrySldQtdCotasIntegAnVLRHISTCOTAINTEGR: TFloatField;
    QrySldQtdCotasIntegAnVLRVARIACAODIA: TFloatField;
    QrySldQtdCotasIntegAnDESCTIPOCOTA: TStringField;
    QrySldQtdCotasIntegAnQTDDECQTD: TFloatField;
    QrySldQtdCotasIntegAnQTDDECVALOR: TFloatField;
    QrySldQtdCotasIntegAnPLANPRVCONTABPATRO: TStringField;
    QrySldQtdCotasIntegAnDESCTIPOFUNDOINV: TStringField;
    QrySldQtdCotasIntegID: TStringField;
    QrySldQtdCotasIntegDESCFUNDOINVEST: TStringField;
    QrySldQtdCotasIntegQTDHISTCOTAINTEGR: TFloatField;
    QrySldQtdCotasIntegVLRHISTCOTAINTEGR: TFloatField;
    QrySldQtdCotasIntegVLRVARIACAODIA: TFloatField;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    QrySldQtdCotasIntegPLANPRVCONTABPATRO: TStringField;
    rpSldQtdCotasInteg: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppDBImage3: TppDBImage;
    lblPeriodoRef: TppLabel;
    ppShape3: TppShape;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    pplPlano: TppLabel;
    ppDBText15: TppDBText;
    ppDetailBand3: TppDetailBand;
    ppDBText16: TppDBText;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppFooterBand3: TppFooterBand;
    ppLine16: TppLine;
    ppLabel56: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppSummaryBand5: TppSummaryBand;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLabel57: TppLabel;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppDBText24: TppDBText;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppLine21: TppLine;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppLabel58: TppLabel;
    ppLine22: TppLine;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppLine23: TppLine;
    ppLabel59: TppLabel;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppShape4: TppShape;
    QrySldQtdCotasIntegDESCTIPOFUNDOINV: TStringField;
    procedure shpDetalhePrint(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure rpSldQtdCotasIntegXStartPage(Sender: TObject);
    //AL_4
    procedure dbcQtdGetText(Sender: TObject; var Text: String);
    //AL_4
    procedure ppGroupFooterBand3AfterGenerate(Sender: TObject);
    procedure ppGroupFooterBand3BeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand3BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand2BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand2AfterGenerate(Sender: TObject);
    procedure QrySldQtdCotasIntegAfterScroll(DataSet: TDataSet);
    function FilterCount(Qry: twwQuery): Integer;
  private
    { Private declarations }
    cCorZebra : TColor;
    wCount      : Integer;
    wCountPlano : Integer;
    wCountCart  : Integer;
  public
    { Public declarations }
  end;

var
  DmRelSldQtdCotasInteg: TDmRelSldQtdCotasInteg;

implementation

{$R *.DFM}

procedure TDmRelSldQtdCotasInteg.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  (Sender as TppShape).Brush.Color := cCorZebra;
end;

procedure TDmRelSldQtdCotasInteg.ppDetailBand1BeforePrint(Sender: TObject);
begin
  inherited;
  If (QrySldQtdCotasIntegAnDESCFUNDOINVEST.OldValue =  QrySldQtdCotasIntegAnDESCFUNDOINVEST.Value) Then
     wCount := wCount + 1
  else
     wCount := 0;

  wCountCart := wCountCart+1;
end;

procedure TDmRelSldQtdCotasInteg.rpSldQtdCotasIntegXStartPage(
  Sender: TObject);
begin
  inherited;
  // wCount := 0;
end;

//AL_4

procedure TDmRelSldQtdCotasInteg.dbcQtdGetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  // dbcQtd.Visible       := (wCount > 1);
  // dbcVlrAtu.Visible    := (wCount > 1);
  // dbcVar.Visible       := (wCount > 1);
  // pplSomatorio.Visible := (wCount > 1);
end;

//AL_4
procedure TDmRelSldQtdCotasInteg.ppGroupFooterBand3AfterGenerate(
  Sender: TObject);
begin
  inherited;
  // wCountCart := 0;
end;

procedure TDmRelSldQtdCotasInteg.ppGroupFooterBand3BeforePrint(
  Sender: TObject);
begin
  inherited;
   ppGroupFooterBand3.Visible := not(wCountCart > 1);
   wCountCart := 0;
end;

procedure TDmRelSldQtdCotasInteg.ppGroupHeaderBand3BeforePrint(
  Sender: TObject);
begin
  inherited;
  // wCountPlano:= wCountPlano+1;
end;

procedure TDmRelSldQtdCotasInteg.ppGroupFooterBand2BeforePrint(
  Sender: TObject);
begin
  inherited;
  // ppGroupFooterBand2.Visible := (wCountPlano > 1);
  // wCountPlano   := 0;
end;

procedure TDmRelSldQtdCotasInteg.ppGroupFooterBand2AfterGenerate(
  Sender: TObject);
begin
  inherited;
  // wCountPlano := 0;
end;

procedure TDmRelSldQtdCotasInteg.QrySldQtdCotasIntegAfterScroll(
  DataSet: TDataSet);
var
i: integer;
begin
  inherited;

  if not QrySldQtdCotasIntegAn.IsEmpty then
  begin
    QrySldQtdCotasIntegAn.DisableControls;
    if not QrySldQtdCotasIntegID.IsNull then begin
      QrySldQtdCotasIntegAn.Filter   := 'ID = ' + QrySldQtdCotasIntegID.AsString;
      //(FilterCount(QrySldQtdCotasIntegAn) > 1);
    end else
      QrySldQtdCotasIntegAn.Filter   := 'ID = ' + QuotedStr('0');
    QrySldQtdCotasIntegAn.Filtered    := True;
    QrySldQtdCotasIntegAn.EnableControls;
  end;

end;

function TDmRelSldQtdCotasInteg.FilterCount(Qry: twwQuery): Integer;
begin
  Result := 0;
  while not Qry.Eof do begin
    Result := Result + 1;
    Qry.Next;
  end;
end;

end.
