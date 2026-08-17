//******************************************************************************
// Data      : 24/01/2008
// Código    : AL_15
// Pendencia : 27146
// SOL       :
// Desc      : Implementação do "Cód.ISIN" do papel
//******************************************************************************
// Data      : 26/12/2007
// Código    : AL_14
// Pendencia : 25948
// SOL       :
// Desc      : Acerto no cálculo do saldo liquido de título com deságio
//******************************************************************************
// Data      : 26/10/2007
// Código    : AL_13
// Pendencia : 26732
// SOL       :
// Desc      : Acerto na duplicidade do histórico do relatório após compra de títulos
//             quando o título possui item de Agio ou Desagio
//******************************************************************************
// Data      : 02/08/2007
// Código    : AL_12
// Pendencia : 24957
// SOL       : 56201
// Desc      : Implementacao de Saldo Consolidado por Investimento
//********************************************************************************************************
//Data	     : 11/07/2007
//Codigo     : AL_11
//Pendência  : 25874
//SOL        :
//Função     : Implementação da coluna de Ágio e Deságio
//********************************************************************************************************
// Data      : 29/01/2007
// Código    : AL_10
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementacao de Penhora do Juridico na qryTipoOperacao
//********************************************************************************************************
// Data      : 05/09/2006
// Código    : AL_9
// Pendencia : 23245
// SOL       :
// Desc      : Acerto na qryHistorico para trazer as posições de Poupança mesmo com a quantidade zerada
//             pois para Poupança não é utilizada a quantidade para os calculos
//********************************************************************************************************
// Data      : 04/09/2006
// Código    : AL_8
// Pendencia : 23245
// SOL       :
// Desc      : Acerto na qryHistorico que não estava trazendo as Operações de TRC no Destino na Abertura
//********************************************************************************************************
// Data      : 07/08/2006
// Código    : AL_7
// Pendencia : 23008
// SOL       :
// Desc      : Acerto na qryHistorico que estava apresentando cartesiano com as TRC de Planos
//********************************************************************************************************
// Data      : 07/08/2006
// Código    : AL_6
// Pendencia : 23008
// SOL       :
// Desc      : Implementação de TRC Planos antes do registro de ATU
//********************************************************************************************************
//Data	     : 26/05/2006
//Codigo     : AL_5
//Pendência  : 22480
//SOL        : 43633
//Função     : Implementação da Funcionalidade de Transferência entre Planos
//********************************************************************************************************
//Data	    : 23/11/2005
//Código    : AL_35
//Motivo(S) : Ajuste nas qry para captar saldo da sexta feira para títulos que não tenham
//               saldos no fim de semana
//********************************************************************************************************
//Data	    : 23/09/2005
//Código    : AL_34
//Motivo(S) : Ajuste na qryItens para melhora nos Decodes de Provisao de Perda (-15)
//********************************************************************************************************
//Data	    : 13/09/2005
//Código    : AL_3
//Motivo(S) : Ajuste na qryItens para melhora nos Decodes
//            Ajuste na qryHistorico para mostrar IOF
//********************************************************************************************************
//Data	    : 24/08/2005
//Código    : AL_2
//Motivo(S) : Ajuste no relatório para implementação de repactuação (PAS e DFM)
//********************************************************************************************************
//Data	    : 20/07/2005
//Código    : AL_1
//Motivo(S) : Inclusão de Campo de Valor Líquido no relatório e melhoria de lay-out
//********************************************************************************************************
//Data	    : 01/06/2005
//Query     : QryHistorico
//Motivo(S) : Alteração da QryHistorico para trazer o IOF e Saldo Líquido
//********************************************************************************************************
//Data	    : 31/04/2005
//Query     : qryItens
//Motivo(S) : Alteração da qryItens para trazer o PUACUMULADO da HISTRENFIXXITENS para atendender a a
//            Atualização de Poupança Mensal (os itens ficam zerados em datas diferente do aniversário)
//********************************************************************************************************
//Data	    : 19/04/2005
//Query     : QryHistorico
//Motivo(S) : Acerto no outerjoin AND CS.IDCARTEIRASPC(+) = IV.IDCARTEIRASPC
//********************************************************************************************************
//Data	    : 30/03/2005
//Query     : QryItens
//Motivo(S) : Implementação dos novos campos VLRITEM e VLRACUITEM. (DFM)
//********************************************************************************************************
//Data	    : 29/03/2005
//Query     : qryHistorico
//Motivo(S) : Inclusão da Carteira SPC. (DFM)
//********************************************************************************************************
//Data	    : 27/10/2004
//Query     : qryHistorico
//Motivo(S) : Acerto na dataaplicacao de operacaoes de TRC Planos (dfm)
//********************************************************************************************************
// Data     : 27/09/2004
// Descrição: Implementacao do Paramentro TIPOMAIOR E TIPOMENOR para buscar operacoes
//            conforme o parametro na qryHistorico
//********************************************************************************************************
// Data     : 10/08/2004
// Código   : AL_1
// Descrição: Inclusão do tratamento do novo tipo de item Cotação (DFM - SQL)
//********************************************************************************************************
// Data     : 16/04/2004
// Origem   : CM
// Função   : bbtnConfirmarClick
// Linha(s) : 145
// Motivo   : Inclusão do Parâmetro bAbertura na qryHistorico e qryItens
//********************************************************************************************************

unit FDMRelRenFixSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppViewr;

type
  TDmRelRenFixSaldo = class(TdtmReports)
    rptRenFixSaldo: TppReport;
    ppHeaderBand1: TppHeaderBand;
    bndDetalhe: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    pplHistorico: TppBDEPipeline;
    pplItems: TppBDEPipeline;
    dsHistorico: TwwDataSource;
    dsItens: TwwDataSource;
    qryHistorico: TwwQuery;
    qryItens: TwwQuery;
    shpCabecalho: TppShape;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    dbtDescInvestimento: TppDBText;
    dbDataOper: TppDBText;
    ppLabel8: TppLabel;
    dbQuantidade: TppDBText;
    pplblVlrBruto: TppLabel;
    dbValorOperacao: TppDBText;
    srptRenFixSaldo: TppSubReport;
    ppChildReport1: TppChildReport;
    ppLabel11: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppShape1: TppShape;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppShape2: TppShape;
    ppDBText2: TppDBText;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText3: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppDBText4: TppDBText;
    shpRenFixSaldoDetPai: TppShape;
    shpRenFixSaldoDetFilho: TppShape;
    qryItensIDHISTRENFIX: TFloatField;
    qryItensDESCCURVARENFIX: TStringField;
    qryItensDESCITEMRENFIX: TStringField;
    qryItensSEQCALCULO: TFloatField;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    bndSumario: TppSummaryBand;
    ppShape4: TppShape;
    ppLabel7: TppLabel;
    ppDBCalc2: TppDBCalc;
    qryItensNOMEREGRA: TStringField;
    dbtValorItem: TppDBText;
    qryItensIDITEMRENFIX: TFloatField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    bndRodapeSigla: TppGroupFooterBand;
    shpTitEmissor: TppShape;
    ppLabel4: TppLabel;
    ppDBText6: TppDBText;
    qryItensPUITEM: TFloatField;
    qryItensVLRITEM: TFloatField;
    ppLabel9: TppLabel;
    ppDBPUItem: TppDBText;
    qryItensPUACUITEM: TFloatField;
    qryHistoricoDATAHISTRENFIX: TDateTimeField;
    qryHistoricoSIGLAEMISSOR: TStringField;
    qryHistoricoDESCINVESTIMENTO: TStringField;
    qryHistoricoDATAOPERACAO: TDateTimeField;
    qryHistoricoSALDOQTDHISTRENFI: TFloatField;
    qryHistoricoSALDOVLRHISTRENFI: TFloatField;
    qryHistoricoIDHISTRENFIX: TFloatField;
    ppLine1: TppLine;
    cabSubRelItens: TppHeaderBand;
    rptRenFixSaldoTitulo: TppLabel;
    ppLabel16: TppLabel;
    ppLPeriodo: TppLabel;
    ppDbLogo: TppDBImage;
    qryHistoricoCORCLASSRISCO: TFloatField;
    qryClasseRisco: TwwQuery;
    qryClasseRiscoIDCLASSRISCORENFIX: TFloatField;
    qryClasseRiscoNOMECLASSRISCO: TStringField;
    qryClasseRiscoCORCLASSRISCO: TFloatField;
    dsClasseRisco: TwwDataSource;
    pplClasseRisco: TppBDEPipeline;
    dbtNomeClassRisco: TppDBText;
    qryHistoricoNIVELCLASSRISCO: TFloatField;
    qryClasseRiscoNIVELCLASSRISCO: TStringField;
    shpTotalEmissor: TppShape;
    ppLabel2: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel17: TppLabel;
    ppDBText1: TppDBText;
    qryHistoricoQTDCARTHIPO: TFloatField;
    ppLCarteiraEx: TppLabel;
    ppDBImage1: TppDBImage;
    ppLabel20: TppLabel;
    ppLCarteira: TppDBText;
    qryHistoricoPLANPRVCONTABPATRO: TStringField;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    bndRodapePlano: TppGroupFooterBand;
    shpTotalPlano: TppShape;
    ppLabel18: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLabel19: TppLabel;
    qryHistoricoFLGNEGOCIACAO: TStringField;
    qryHistoricoVLRCARTHIPO: TFloatField;
    ppLabel23: TppLabel;
    ppLabel22: TppLabel;
    ppDBText9: TppDBText;
    qryHistoricoNOMECLASSRISCO: TStringField;
    qryHistoricoDESCCLASSETIT: TStringField;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    bndRodapeClasse: TppGroupFooterBand;
    ppShape3: TppShape;
    shpClasseTit: TppShape;
    ppLabel1: TppLabel;
    ppDBText7: TppDBText;
    ppShape7: TppShape;
    ppLabel25: TppLabel;
    ppDBCalc5: TppDBCalc;
    qryHistoricoVENCOPERACAO: TDateTimeField;
    ppLabel26: TppLabel;
    ppDBText10: TppDBText;
    qryHistoricoDESCARTEIRASPC: TStringField;
    ppLabel27: TppLabel;
    ppDBText11: TppDBText;
    qryHistoricoSALDOVLRHISTLIQ: TFloatField;
    ppLabel10: TppLabel;
    ppLabel28: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBCalc9: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppLabel29: TppLabel;
    ppDBText14: TppDBText;
    qryHistoricoDATAVIGENCIA: TDateTimeField;
    qryHistoricoCONTADORPLANPATRO: TFloatField;
    qryHistoricoCONTADORDATA: TFloatField;
    qryHistoricoCONTADORCLASSE: TFloatField;
    qryHistoricoCONTADOREMISSOR: TFloatField;
    qryHistoricoVLRIOF: TFloatField;
    pplPerPenhora: TppLabel;
    pplQtdPenhora: TppLabel;
    qryHistoricoQTDPENHORA: TFloatField;
    qryHistoricoPERCPENHORA: TFloatField;
    ppdbPercPenhora: TppDBText;
    ppdbQtdPenhora: TppDBText;
    //AL_11
    ppLabel24: TppLabel;
    qryHistoricoVLRAGDESAG: TFloatField;
    ppDBCalc4: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    //AL_12
    ppDBCalc8: TppDBCalc;
    pplSaldoRenFixCons: TppBDEPipeline;
    DtsSaldoRenFixCons: TwwDataSource;
    QrySaldoRenFixCons: TwwQuery;
    qryHistoricoINVESTIMENTO: TStringField;
    ppDBText15: TppDBText;
    rptRenFixSaldoCons: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape5: TppShape;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppDBImage2: TppDBImage;
    ppLabel37: TppLabel;
    ppDBText16: TppDBText;
    ppLabel38: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape6: TppShape;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel55: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLine4: TppLine;
    ppSystemVariable4: TppSystemVariable;
    ppSummaryBand3: TppSummaryBand;
    Titulo: TppLabel;
    QrySaldoRenFixConsINVESTIMENTO: TStringField;
    QrySaldoRenFixConsDATAHISTRENFIX: TDateTimeField;
    QrySaldoRenFixConsFLGNEGOCIACAO: TStringField;
    QrySaldoRenFixConsDESCARTEIRASPC: TStringField;
    QrySaldoRenFixConsDATAOPERACAO: TDateTimeField;
    QrySaldoRenFixConsVENCOPERACAO: TDateTimeField;
    QrySaldoRenFixConsDATAVIGENCIA: TDateTimeField;
    QrySaldoRenFixConsSALDOVLRHISTRENFI: TFloatField;
    QrySaldoRenFixConsSALDOQTDHISTRENFI: TFloatField;
    QrySaldoRenFixConsVLRIOF: TFloatField;
    QrySaldoRenFixConsQTDPENHORA: TFloatField;
    QrySaldoRenFixConsPERCPENHORA: TFloatField;
    QrySaldoRenFixConsSALDOVLRHISTLIQ: TFloatField;
    QrySaldoRenFixConsQTDCARTHIPO: TFloatField;
    QrySaldoRenFixConsVLRCARTHIPO: TFloatField;
    QrySaldoRenFixConsDESCCLASSETIT: TStringField;
    QrySaldoRenFixConsSIGLAEMISSOR: TStringField;
    ppLabel34: TppLabel;
    ppShape8: TppShape;
    ppDBCalc10: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppShape9: TppShape;
    ppLabel50: TppLabel;
    ppShape10: TppShape;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppDBCalc24: TppDBCalc;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppLabel53: TppLabel;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppDBCalc27: TppDBCalc;
    ppDBCalc28: TppDBCalc;
    ppLabel39: TppLabel;
    ppLabel54: TppLabel;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppLabel5: TppLabel;
    ppLabel21: TppLabel;
    ppDBText8: TppDBText;
    ppDBText23: TppDBText;
    qryHistoricoCODISIN: TStringField;
    procedure srptRenFixSaldoPrint(Sender: TObject);
    procedure qryHistoricoAfterScroll(DataSet: TDataSet);
    procedure rptRenFixSaldoStartPage(Sender: TObject);
    procedure rptRenFixSaldoBeforePrint(Sender: TObject);
    procedure shpRenFixSaldoDetPaiPrint(Sender: TObject);
    procedure shpRenFixSaldoDetFilhoPrint(Sender: TObject);
    procedure dbtValorItemPrint(Sender: TObject);
    procedure dbtNomeClassRiscoPrint(Sender: TObject);
    procedure srptLegendaRiscoPrint(Sender: TObject);
    procedure rptRenFixSaldoAfterPrint(Sender: TObject);
    procedure ppDBPUItemPrint(Sender: TObject);
    procedure bndDetalheAfterPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelRenFixSaldo: TDmRelRenFixSaldo;

implementation

uses dOperComum;

{$R *.DFM}

procedure TDmRelRenFixSaldo.srptRenFixSaldoPrint(Sender: TObject);
begin
  inherited;
  cabSubRelItens.Visible := True;
end;

procedure TDmRelRenFixSaldo.qryHistoricoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryItens.Filter := 'IDHISTRENFIX = ' + qryHistoricoIDHISTRENFIX.AsString;
end;

procedure TDmRelRenFixSaldo.rptRenFixSaldoStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
   shpRenFixSaldoDetPai.Brush.Color := clWhite;
   shpRenFixSaldoDetFilho.Brush.Color := clWhite;
end;

procedure TDmRelRenFixSaldo.rptRenFixSaldoBeforePrint(Sender: TObject);
begin
   inherited;
   dtmOperComum.qryEmpresa.Open;
end;

procedure TDmRelRenFixSaldo.shpRenFixSaldoDetPaiPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra

end;

procedure TDmRelRenFixSaldo.shpRenFixSaldoDetFilhoPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra

end;

procedure TDmRelRenFixSaldo.dbtValorItemPrint(Sender: TObject);
begin
  if qryItensIDITEMRENFIX.AsInteger = -2 then
     dbtValorItem.DisplayFormat := '###,###,###,###,##0'
  else
     dbtValorItem.DisplayFormat := '###,###,###,###,##0.00';

  inherited;
end;

procedure TDmRelRenFixSaldo.dbtNomeClassRiscoPrint(Sender: TObject);
begin
  inherited;
  if qryHistoricoCORCLASSRISCO.AsInteger = 0 then
     dbtNomeClassRisco.Font.Color := clBlack
  else dbtNomeClassRisco.Font.Color := qryHistoricoCORCLASSRISCO.AsInteger;
end;

procedure TDmRelRenFixSaldo.srptLegendaRiscoPrint(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TDmRelRenFixSaldo.rptRenFixSaldoAfterPrint(Sender: TObject);
begin
  inherited;
  dtmOperComum.qryEmpresa.Close;
end;

procedure TDmRelRenFixSaldo.ppDBPUItemPrint(Sender: TObject);
begin
  if qryItensIDITEMRENFIX.AsInteger = -15 then
     ppDBPUItem.DisplayFormat := '###,###,###,###,##0.00 %'
  else
     ppDBPUItem.DisplayFormat := '###,###,###,###,##0.00#######';

  inherited;

end;

procedure TDmRelRenFixSaldo.bndDetalheAfterPrint(Sender: TObject);
begin
  inherited;
  bndRodapeClasse.Visible := (qryHistoricoCONTADORCLASSE.AsInteger > 1);
  bndRodapeSigla.Visible  := (qryHistoricoCONTADOREMISSOR.AsInteger > 1);
  bndRodapePlano.Visible  := (qryHistoricoCONTADORPLANPATRO.AsInteger > 1);
  bndSumario.Visible      := (qryHistoricoCONTADORDATA.AsInteger > 1);
end;

end.
