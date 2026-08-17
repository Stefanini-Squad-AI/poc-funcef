//******************************************************************************
// Rotina     : QryTotalMovOutro, QryTotIntegr
// SOL        : 166338.6801
// Kintana    : 1451970
// Data       : 01/11/2011
// Responsável: Otacilio aquino
// Descrição  : Permitir mais de uma integralização para o mesmo fundo e na
//              mesma data
//******************************************************************************
// Data      : 11/06/2007
// Código    : AL_6
// Pendencia : 25594
// SOL       : 56257
// Motivo    : Implementação da taxa de despesa conforme especificação para as operações
//             de aplicação, resgate, amortização e integralização
//******************************************************************************
// Data      : 20/11/2006
// Código    : AL_5
// Pendencia : 23349/23787
// SOL       : 43633
// Motivo    : Implementação da transferência entre Tipos de Fundo.
//******************************************************************************
// Data      : 22/08/2006
// Código    : AL_4
// Pendencia : 23122
// SOL       : 45112
// Motivo    : Implementação para utilização do Fundo de Inv. em Participação
//******************************************************************************
// Data      : 10/07/2006
// Pendencia : 22808
// Motivo    : Ajuste na busca da aplicação resgatada, foi incluida a data da operação no join
//******************************************************************************
// Data      : 03/07/2006
// Motivo    : Ajuste na layout com a dedução do IOF para operação de aplicação e transferencia
//******************************************************************************
// Data      : 28/06/2006
// Motivo    : Ajuste na layout com a dedução do IOF para operação de resgate e transferencia
//******************************************************************************
// Data      : 23/06/2006
// Motivo    : Ajuste na busca da operação de transf. por plano
//******************************************************************************
// Data      : 21/02/2005
// Pendencia : 22446
// Motivo    : Ajuste no layout do relatório de movimentação
//******************************************************************************
// Data     : 25/10/2005
// Código   : QryTotalMovOutro e QryTotAmortRec
// Motivo   : Implementação do tratamento de bloqueio para outras operações
//******************************************************************************
// Data     : 21/10/2005
// Código   : QryTotAmortRec e QryTotAmort
// Motivo   : Implementação a coluna Amortização a Receber
//******************************************************************************
// Data     : 21/10/2005
// Linha(s) : QryConsMovFundos, QryTotAmort e QryTotResg
// Motivo   : Implementação do tratamento para a operação -143(Amortização a Receber)
//******************************************************************************
// Data     : 20/10/2005
// Linha(s) : QryTotSub, QryTotIntegr, QryTotApl, QryTotAmort e QryTotResg
// Motivo   : Implementação e alteração do layout com redução de fontes e implementação de campos:
//            totalizado de Subscrição, Amortização e Integralização de Cotas.
//******************************************************************************
// Data     : 17/08/2005
// Linha(s) : QryConsMovFundos, QryTotalMovOutro
// Motivo   : MELHORA DE PERFOMARCE DAS QUERY´S
//******************************************************************************
// Data     : 12/07/2005
// Código   : AL_3
// Motivo   : Acerto na Busca de Operações de Amortização na QryConsMovFundos
//******************************************************************************
// Data     : 08/06/2005
// Código   : AL_2
// Motivo   : Acerto na QryConsMovFundos para trazer corretamente a data da aplicação das operações
//******************************************************************************
// Data     : 10/01/2005
// Código   : AL_1
// Motivo   : Inclusão do Totalisador Outros no relatório. (Somente DFM)
//******************************************************************************
// Data     : 12/01/2005
// Linha(s) : QryConsMovFundos
// Motivo   : Ajuste na busca da DTAVIGENCIA da tabela FUNDOINVEST, não trazia o mais recente
//            registro
//******************************************************************************
                          
unit FDmRelFundosConsMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, Db, DBTables, ppBands, ppClass, ppCtrls, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppRegion, ppRichTx, ppSubRpt, ppMemo,
  ppModule, daDataModule;

type
  TDmRelFundosConsMov = class(TDmRelatoriosInv)
    RpConsMovFundos: TppReport;
    ppHeaderBand18: TppHeaderBand;
    ppShape2: TppShape;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLabel127: TppLabel;
    ppLabel125: TppLabel;
    ppLabel128: TppLabel;
    ppLabel129: TppLabel;
    ppLabel135: TppLabel;
    ppLabel130: TppLabel;
    LblPlanoMov: TppLabel;
    ppLabel3: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    //AL_4
    ppPeriodo: TppLabel;
    ppDBImage23: TppDBImage;
    dtbDetalhe: TppDetailBand;
    shpDetalhe: TppShape;
    ppDBText43: TppDBText;
    ppDBText59: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText112: TppDBText;
    ppDBText10: TppDBText;
    ppFooterBand17: TppFooterBand;
    ppLine52: TppLine;
    ppLabel132: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand3: TppSummaryBand;
    ppLabel133: TppLabel;
    ppLabel136: TppLabel;
    ppLine93: TppLine;
    ppLine53: TppLine;                         
    ppLine54: TppLine;
    ppGroup6: TppGroup;
    ghbDataOperacao: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppGroup7: TppGroup;
    ghbFundo: TppGroupHeaderBand;
    gfbFundo: TppGroupFooterBand;
    dbcVlrOperacao: TppDBCalc;
    dbcVlrIR: TppDBCalc;
    dbcQtdOperacao: TppDBCalc;
    dbcVlrIOF: TppDBCalc;
    dbcVlrLiquido: TppDBCalc;
    pplSomatorio: TppLine;
    ppBDEConsMovFundos: TppBDEPipeline;
    dsConsMovFundos: TwwDataSource;
    QryConsMovFundos: TwwQuery;
    QryConsMovFundosPLANPRVCONTABPATRO: TStringField;
    QryConsMovFundosDESCFUNDOINVEST: TStringField;
    QryConsMovFundosDESCTIPOOPERACAO: TStringField;
    QryConsMovFundosDATAOPERACAO: TDateTimeField;
    QryConsMovFundosDATAAPLICACAO: TDateTimeField;
    QryConsMovFundosDATALIQUIDACAO: TDateTimeField;
    QryConsMovFundosVLRCOTA: TFloatField;
    QryConsMovFundosVLRTOTAL: TFloatField;
    QryConsMovFundosQTDOPERACAO: TFloatField;
    QryConsMovFundosVLROPERACAO: TFloatField;
    QryConsMovFundosVLRIR: TFloatField;
    QryConsMovFundosVLRIOF: TFloatField;
    QryConsMovFundosVLRLIQUIDO: TFloatField;
    s: TStringField;
    QryConsMovFundosIDOPERACAOFUNDO: TFloatField;
    QryConsMovFundosIDCARTEIRAINVEST: TFloatField;
    QryConsMovFundosIDPEDIDOFUNDO: TFloatField;
    QryConsMovFundosIDTIPOINVEST: TFloatField;
    QryConsMovFundosIDTIPOOPERACAO: TFloatField;
    QryConsMovFundosIDFUNDOINVEST: TFloatField;
    QryConsMovFundosVLRRENDIMENTO: TFloatField;
    QryConsMovFundosIDGESTORCARTEIRA: TFloatField;
    QryConsMovFundosMOECODIGO: TFloatField;
    QryConsMovFundosIDTIPOFUNDOINVEST: TFloatField;
    QryConsMovFundosCNPJFUNDO: TStringField;
    QryConsMovFundosSTAEXCLUSIVO: TStringField;
    QryConsMovFundosPZOCARENCIA: TFloatField;
    QryConsMovFundosPZOANIVERSARIO: TFloatField;
    QryConsMovFundosPZOLIQAPLIC: TFloatField;
    QryConsMovFundosPZOLIQRESG: TFloatField;
    QryConsMovFundosQTDDECQTD: TFloatField;
    QryConsMovFundosQTDDECVALOR: TFloatField;
    QryConsMovFundosSTAFUNDO: TStringField;
    QryConsMovFundosPZOAMORTIZACAO: TFloatField;
    QryConsMovFundosPERCTXPERFORM: TFloatField;
    QryConsMovFundosPERCTXADM: TFloatField;
    QryConsMovFundosCODFUNCETIP: TStringField;
    QryConsMovFundosSTAPROVISIONAIR: TStringField;
    QryConsMovFundosSTAPROVISIONAIOF: TStringField;
    QryConsMovFundosCONTRCETIP: TStringField;
    QryConsMovFundosNATUREZAOPERACAO: TStringField;
    QryConsMovFundosQTDAPLICADA: TFloatField;
    QryConsMovFundosVALORAPLICADO: TFloatField;
    QryConsMovFundosVALORIRAPLICADO: TFloatField;
    QryConsMovFundosVALORIOFAPLICADO: TFloatField;
    QryConsMovFundosVALORLIQAPLICADO: TFloatField;
    QryConsMovFundosQTDRESGATE: TFloatField;
    QryConsMovFundosVALORRESGATE: TFloatField;
    QryConsMovFundosVALORIRRESGATE: TFloatField;
    QryConsMovFundosVALORIOFRESGATE: TFloatField;
    QryConsMovFundosVALORLIQRESGATE: TFloatField;
    QryConsMovFundosQTDTOTAL: TFloatField;
    QryConsMovFundosVLRIRTOTAL: TFloatField;
    QryConsMovFundosVLRIOFTOTAL: TFloatField;
    QryConsMovFundosVLRLIQTOTAL: TFloatField;
    QryConsMovFundosOBSERVACAO: TMemoField;
    ppBDEObservacoes: TppBDEPipeline;
    dsObservacoes: TwwDataSource;
    qryObservacoes: TwwQuery;
    FloatField8: TFloatField;
    MemoField1: TMemoField;
    srptObservacoes: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand1: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    shpObservacao: TppShape;
    lblObs: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    gfbTipoOperacao: TppGroupFooterBand;
    qryObservacoesIDTIPOOPERACAO: TFloatField;
    ppdbObservacao: TppDBText;
    ppLabel1: TppLabel;
    qryObservacoesNATUREZAOPERACAO: TStringField;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    QryTotalMovOutro: TwwQuery;
    //AL_4
    QryTotalMovOutroVLRIR: TFloatField;
    QryTotalMovOutroVLRIOF: TFloatField;
    QryTotalMovOutroVLRLIQUIDO: TFloatField;
    QryTotalMovOutroQTDOPERACAO: TFloatField;
    QryTotalMovOutroVLROPERACAO: TFloatField;
    QryTotalMovOutroVLRRENDIMENTO: TFloatField;
    DsTotalMovOutro: TwwDataSource;
    ppBDETotOutro: TppBDEPipeline;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppBDETotSub: TppBDEPipeline;
    QryTotSub: TwwQuery;
    //AL_4
    DsTotSub: TwwDataSource;
    ppBDETotIntegr: TppBDEPipeline;
    QryTotIntegr: TwwQuery;
    //AL_4
    DsTotIntegr: TwwDataSource;
    ppBDETotApl: TppBDEPipeline;
    QryTotApl: TwwQuery;
    //AL_4
    DsTotApl: TwwDataSource;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppBDETotAmort: TppBDEPipeline;
    QryTotAmort: TwwQuery;
    //AL_4
    DsTotAmort: TwwDataSource;
    ppBDETotResg: TppBDEPipeline;
    QryTotResg: TwwQuery;
    //AL_4
    DsTotResg: TwwDataSource;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppLine4: TppLine;
    ppDBText22: TppDBText;
    ppDBText26: TppDBText;
    ppLabel6: TppLabel;
    ppDBText60: TppDBText;
    ppDBTDescTpoOper: TppDBText;
    ppBDETotAmortRec: TppBDEPipeline;
    QryTotAmortRec: TwwQuery;
    //AL_4
    DsTotAmortRec: TwwDataSource;
    ppLine6: TppLine;
    ppLabel7: TppLabel;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    QryConsMovFundosSTAOBS: TStringField;
    ppLine5: TppLine;
    ppDBText61: TppDBText;
    ppDBText25: TppDBText;
    ppDBText27: TppDBText;
    //AL_4    
    QryConsMovFundosDESCTIPOCOTA: TStringField;
    QryConsMovFundosDESCTIPOFUNDOINV: TStringField;
    ppDBText28: TppDBText;
    ppGroup2: TppGroup;
    ghbPlano: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText29: TppDBText;
    ppBDETotTransfEntr: TppBDEPipeline;
    QryTotTransfEntr: TwwQuery;
    DsTotTransfEntr: TwwDataSource;
    QryTotTransfEntrQTDOPERACAO: TFloatField;
    QryTotTransfEntrVLROPERACAO: TFloatField;
    QryTotTransfEntrVLRIR: TFloatField;
    QryTotTransfEntrVLRIOF: TFloatField;
    QryTotTransfEntrVLRRENDIMENTO: TFloatField;
    QryTotTransfEntrVLRLIQUIDO: TFloatField;
    ppBDETotTransfSaida: TppBDEPipeline;
    QryTotTransfSaida: TwwQuery;
    DsTotTransfSaida: TwwDataSource;
    QryTotTransfSaidaQTDOPERACAO: TFloatField;
    QryTotTransfSaidaVLROPERACAO: TFloatField;
    QryTotTransfSaidaVLRIR: TFloatField;
    QryTotTransfSaidaVLRIOF: TFloatField;
    QryTotTransfSaidaVLRRENDIMENTO: TFloatField;
    QryTotTransfSaidaVLRLIQUIDO: TFloatField;
    ppLabel8: TppLabel;
    ppLine7: TppLine;    
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppLabel9: TppLabel;
    ppLine8: TppLine;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    QryTotSubQTDOPERACAO: TFloatField;
    QryTotSubVLROPERACAO: TFloatField;
    QryTotSubVLRIR: TFloatField;
    QryTotSubVLRIOF: TFloatField;
    QryTotSubVLRRENDIMENTO: TFloatField;
    QryTotSubVLRLIQUIDO: TFloatField;
    QryTotIntegrQTDOPERACAO: TFloatField;
    QryTotIntegrVLROPERACAO: TFloatField;
    QryTotIntegrVLRIR: TFloatField;
    QryTotIntegrVLRIOF: TFloatField;
    QryTotIntegrVLRRENDIMENTO: TFloatField;
    QryTotIntegrVLRLIQUIDO: TFloatField;
    QryTotAplQTDOPERACAO: TFloatField;
    QryTotAplVLROPERACAO: TFloatField;
    QryTotAplVLRIR: TFloatField;
    QryTotAplVLRIOF: TFloatField;
    QryTotAplVLRRENDIMENTO: TFloatField;
    QryTotAplVLRLIQUIDO: TFloatField;
    QryTotAmortQTDOPERACAO: TFloatField;
    QryTotAmortVLROPERACAO: TFloatField;
    QryTotAmortVLRIR: TFloatField;
    QryTotAmortVLRIOF: TFloatField;
    QryTotAmortVLRRENDIMENTO: TFloatField;
    QryTotAmortVLRLIQUIDO: TFloatField;
    QryTotResgQTDOPERACAO: TFloatField;
    QryTotResgVLROPERACAO: TFloatField;
    QryTotResgVLRIR: TFloatField;
    QryTotResgVLRIOF: TFloatField;
    QryTotResgVLRRENDIMENTO: TFloatField;
    QryTotResgVLRLIQUIDO: TFloatField;
    QryTotAmortRecQTDOPERACAO: TFloatField;
    QryTotAmortRecVLROPERACAO: TFloatField;
    QryTotAmortRecVLRIR: TFloatField;
    QryTotAmortRecVLRIOF: TFloatField;
    QryTotAmortRecVLRRENDIMENTO: TFloatField;
    QryTotAmortRecVLRLIQUIDO: TFloatField;
    ppGroup3: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText40: TppDBText;
    ppLine10: TppLine;
    //AL_6
    QryTotResgVLRTAXAS: TFloatField;
    QryTotAmortVLRTAXAS: TFloatField;
    QryTotAplVLRTAXAS: TFloatField;
    QryTotIntegrVLRTAXAS: TFloatField;
    QryConsMovFundosVLRTAXAS: TFloatField;
    ppDBText8: TppDBText;
    ppLabel10: TppLabel;
    dbcVlrTaxa: TppDBCalc;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    procedure shpDetalhePrint(Sender: TObject);
    procedure dtbDetalheBeforePrint(Sender: TObject);
    procedure dbcVlrOperacaoGetText(Sender: TObject; var Text: String);
    procedure srptObservacoesPrint(Sender: TObject);
    procedure gfbTipoOperacaoAfterPrint(Sender: TObject);
    procedure RpConsMovFundosStartPage(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
    wCountFdo : Integer;

  public
    { Public declarations }
  end;

var
  DmRelFundosConsMov: TDmRelFundosConsMov;

implementation

{$R *.DFM}            

procedure TDmRelFundosConsMov.RpConsMovFundosStartPage(Sender: TObject);
begin
   inherited;
   wCountFdo := 0;
end;

procedure TDmRelFundosConsMov.dtbDetalheBeforePrint(Sender: TObject);
begin
  inherited;
  If (QryConsMovFundosDESCTIPOOPERACAO.OldValue =
      QryConsMovFundosDESCTIPOOPERACAO.Value) Then
     wCountFdo := wCountFdo + 1
  else
     wCountFdo := 0;
end;

procedure TDmRelFundosConsMov.dbcVlrOperacaoGetText(Sender: TObject; var Text: String);
begin
  inherited;
  If wCountFdo = 1 Then
  begin
     dbcQtdOperacao.Visible := False;
     dbcVlrOperacao.Visible := False;
     dbcVlrIR.Visible       := False;
     dbcVlrIOF.Visible      := False;
     dbcVlrLiquido.Visible  := False;
     //AL_6
     dbcVlrTaxa.Visible     := False;
     pplSomatorio.Visible   := False;
  end
  Else
  begin
     dbcQtdOperacao.Visible := True;
     dbcVlrOperacao.Visible := True;
     dbcVlrIR.Visible       := True;
     dbcVlrIOF.Visible      := True;
     dbcVlrLiquido.Visible  := True;
     //AL_6
     dbcVlrTaxa.Visible     := True;
     pplSomatorio.Visible   := True;
  end;
end;

procedure TDmRelFundosConsMov.gfbTipoOperacaoAfterPrint(Sender: TObject);
begin
   inherited;
   wCountFdo := 0;
end;

procedure TDmRelFundosConsMov.srptObservacoesPrint(Sender: TObject);
begin
  inherited;
  qryObservacoes.Filter := 'IDOPERACAOFUNDO = ' + QryConsMovFundos.FieldByName('IDOPERACAOFUNDO').AsString;
end;

procedure TDmRelFundosConsMov.shpDetalhePrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   (Sender as TppShape).Brush.Color := cCorZebra;
   shpObservacao.Brush.Color := cCorZebra;
   ppdbObservacao.Color := cCorZebra;

   if QryConsMovFundosOBSERVACAO.IsNull then
      srptObservacoes.Visible := False
   else
      srptObservacoes.Visible := True;
end;

end.
