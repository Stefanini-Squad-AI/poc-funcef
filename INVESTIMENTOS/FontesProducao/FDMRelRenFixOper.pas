//******************************************************************************
// Rotina     : qryOperacoes
// SOL        : 103947
// Kintana    : 477638 
// Data       : 19/01/2009
// Responsável: Ricardo Cristiano
// Motivo     : Implementação para tratar divisão por zero 
//******************************************************************************
// Data      : 24/01/2008
// Código    : AL_18
// Pendencia : 27146
// SOL       : 103383 (CBS)
// Desc      : Implementação do "Cód.ISIN" do papel
//******************************************************************************
// Data	     : 27/12/2007
// Codigo    : AL_17
// Pendência : 24943
// SOL       : 55188
//Função     : Exibir PU de transferência das operações de transferência
//******************************************************************************
//Data	     : 14/03/2006
//Codigo     : AL_16
// Pendência : 24740
// SOL       : 55666
//Função     : Tratar operacoes de Transf. Planos para ficar com o valor negativo
//******************************************************************************
//Data	     : 21/07/2006
//Codigo     : AL_15
// Pendência : 22779
// SOL       :
//Função     : Ajuste nas queries para operação de transferência em lote.
//******************************************************************************
//Data	     : 16/05/2006
//Codigo     : AL_14
// Pendência : 21650 e 20988
// SOL       : 40682
//Função     : Implementação do Campo Data de Liquidação para substituicao do
//               VENCOPERACAO
//******************************************************************************
// Data     : 04/01/2006
// Código   : AL_3
// Pendencia: 21180
// Sol      : 39553
// Motivo   : Ajuste para não utilizar o campo VENCOPERACAO no cálculo do regime
//               caixa/competencia nas operações de aplicação e resgate
//******************************************************************************
// Data     : 12/12/2005
// Código   : AL_2
// Pendencia: 20901
// Sol      : 38821
// Motivo   : Criação do campo FLGREGIMECXCOMP na PARAMINVEST
//            para testar a utilização de regime de Caixa ou Competência nas
//            Operações de Renda Fixa
//******************************************************************************
//Data	    : 24/08/2005
//Código    : AL_1
//Motivo(S) : Ajuste no relatório para implementação de repactuação (PAS e DFM)
//******************************************************************************
//Data	    : 27/10/2004
//Query     : qryOperacoes
//Motivo(S) : Acerto na dataaplicacao de operacaoes de TRC Planos (dfm)
//******************************************************************************
//Data	    : 29/06/2004
//Origem    : FUNCEF
//Query     : qryOperacoes, qryItens
//Motivo(S) : Passado o Active da qry para 'False'
//******************************************************************************

unit FDMRelRenFixOper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppViewr;

type
  TDmRelRenFixOper = class(TdtmReports)
    rptRenFixOper: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    bndDetalhe: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    pplOperacoes: TppBDEPipeline;
    pplItems: TppBDEPipeline;
    dsOperacoes: TwwDataSource;
    dsItens: TwwDataSource;
    qryOperacoes: TwwQuery;
    qryItens: TwwQuery;
    qryOperacoesDATAOPERACAO: TDateTimeField;
    qryOperacoesDESCINVESTIMENTO: TStringField;
    qryOperacoesDESCTIPOOPERACAO: TStringField;
    qryOperacoesVENCOPERACAO: TDateTimeField;
    qryOperacoesPUEMISSAO: TFloatField;
    qryOperacoesQTDEOPERACAO: TFloatField;
    qryOperacoesPUOPERACAO: TFloatField;
    qryOperacoesVLROPERACAO: TFloatField;
    qryItensIDOPERRENFIX: TFloatField;
    qryItensDESCCURVARENFIX: TStringField;
    qryItensDESCITEMRENFIX: TStringField;
    qryItensPERCCURVA: TFloatField;
    qryItensSEQCALCULO: TFloatField;
    shpCabecalho: TppShape;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    bndRodapeDataOper: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    shpCabInestimento: TppShape;
    ppDBText1: TppDBText;
    ppLabel4: TppLabel;
    dbDataOper: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    dbDtVencimento: TppDBText;
    dbPuEmissao: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    dbQuantidade: TppDBText;
    dbPUOperacao: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    dbValorOperacao: TppDBText;
    srptRenFixOper: TppSubReport;
    ppChildReport1: TppChildReport;
    ppLabel11: TppLabel;
    dbOperacao: TppDBText;
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
    qryOperacoesIDOPERRENFIX: TFloatField;
    qryItensVLRCURVA: TFloatField;
    qryItensMOEDESC: TStringField;
    shpRenFixOperDetPai: TppShape;
    shpRenFixOperDetFilho: TppShape;
    qryItensMOECODIGO: TFloatField;
    lblEmissor: TppLabel;
    ppDBText5: TppDBText;
    qryItensPUITEM: TFloatField;
    qryItensVLRITEM: TFloatField;
    qryItensTXITEM: TFloatField;
    qryItensTIPOITEM: TStringField;
    dbtPUItem: TppDBText;
    bdtVlrItem: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    dbtTXItem: TppDBText;
    ppLabel18: TppLabel;
    linRodapeCurvas: TppLine;
    qryItensIDITEMRENFIX: TFloatField;
    qryOperacoesSIGLAEMISSOR: TStringField;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    shpCabEmissor: TppShape;
    ppLabel19: TppLabel;
    ppDBText6: TppDBText;
    qryOperacoesSALDO: TFloatField;
    ppDBText7: TppDBText;
    ppLabel20: TppLabel;
    cabSubRelItensOper: TppHeaderBand;
    dbiLogoEmpresa: TppDBImage;
    qryOperacoesPLANPRVCONTABPATRO: TStringField;
    grupoEmissor: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    bndRodapeEmissor: TppGroupFooterBand;
    ppDBText8: TppDBText;
    ppLCarteira: TppLabel;
    ppLPeriodo: TppLabel;
    ppDbLogo: TppDBImage;
    qryOperacoesNOMECLASSRISCO: TStringField;
    ppDBText9: TppDBText;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppDBText10: TppDBText;
    qryOperacoesFLGNEGOCIACAO: TStringField;
    qryOperacoesQTDCARTHIPO: TFloatField;
    qryOperacoesVALCARTHIPO: TFloatField;
    ppLabel24: TppLabel;
    ppDBText11: TppDBText;
    ppLabel25: TppLabel;
    ppDBText12: TppDBText;
    ppShape3: TppShape;
    ppLabel26: TppLabel;
    qryOperacoesPLANPATRO: TStringField;
    ppLabel27: TppLabel;
    ppDBText14: TppDBText;
    qryOperacoesDATAAPLICACAO: TDateTimeField;
    lblTotalEmissor: TppLabel;
    qryOperacoesDATAVIGENCIA: TDateTimeField;
    qryOperacoesCONTADORDATAOPE: TFloatField;
    srptVencimentos: TppSubReport;
    ppChildReport2: TppChildReport;
    pplVencimentos: TppBDEPipeline;
    dsVencimentos: TwwDataSource;
    qryVencimentos: TwwQuery;
    qryVencimentosIDOPERRENFIX: TFloatField;
    qryVencimentosDATAVIGENCIA: TDateTimeField;
    qryVencimentosDATAVENCTOANT: TDateTimeField;
    qryVencimentosDATAVENCTOATU: TDateTimeField;
    ppTitleBand1: TppTitleBand;
    ppDetailBand1: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    bndCabVencimentos: TppHeaderBand;
    shpDetVencimentos: TppShape;
    ppShape4: TppShape;
    ppDBText13: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLine3: TppLine;
    lblPeriodo: TppLabel;
    qryOperacoesCONTADOREMISSOR: TFloatField;
    ppLabel31: TppLabel;
    ppDBText17: TppDBText;
    qryOperacoesCODISIN: TStringField;
    pplDatas: TppLine;
    procedure srptRenFixOperPrint(Sender: TObject);
    procedure qryOperacoesAfterScroll(DataSet: TDataSet);
    procedure rptRenFixOperStartPage(Sender: TObject);
    procedure shpRenFixOperDetPaiPrint(Sender: TObject);
    procedure shpRenFixOperDetFilhoPrint(Sender: TObject);
    procedure bdtVlrItemPrint(Sender: TObject);
    procedure shpCabInestimentoPrint(Sender: TObject);
    procedure grupoEmissorAfterGroupBreak(Sender: TObject);
    procedure ppDBText7Print(Sender: TObject);
    procedure lblTotalEmissorPrint(Sender: TObject);
    procedure shpDetVencimentosPrint(Sender: TObject);
    procedure srptVencimentosPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
    cCorZebraItens : TColor;
    cCorZebraVenc : TColor;
    fTotalEmissor: Double;
  public
    { Public declarations }
  end;

var
  DmRelRenFixOper: TDmRelRenFixOper;

implementation

uses dOperComum;

{$R *.DFM}

procedure TDmRelRenFixOper.srptRenFixOperPrint(Sender: TObject);
begin
  inherited;
  cabSubRelItensOper.Visible := True;
  cCorZebraItens := ClWhite;
end;

procedure TDmRelRenFixOper.srptVencimentosPrint(Sender: TObject);
begin
  inherited;
  bndCabVencimentos.Visible := True;
  cCorZebraVenc := ClWhite;
end;

procedure TDmRelRenFixOper.qryOperacoesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryItens.Filter := 'IDOPERRENFIX = ' + qryOperacoesIDOPERRENFIX.AsString;
  qryVencimentos.Filter := 'IDOPERRENFIX = ' + qryOperacoesIDOPERRENFIX.AsString;
end;

procedure TDmRelRenFixOper.rptRenFixOperStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
   cCorZebraItens := $00E3E3E3;
   cCorZebraVenc := $00E3E3E3;
   shpRenFixOperDetPai.Brush.Color := clWhite;
   shpRenFixOperDetFilho.Brush.Color := clWhite;
   shpDetVencimentos.Brush.Color := clWhite;
end;

procedure TDmRelRenFixOper.shpRenFixOperDetPaiPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra;
end;

procedure TDmRelRenFixOper.shpRenFixOperDetFilhoPrint(Sender: TObject);
begin
   inherited;
   if cCorZebraItens = ClWhite then
      cCorZebraItens := $00E3E3E3
   else
      cCorZebraItens := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebraItens;
end;

procedure TDmRelRenFixOper.shpDetVencimentosPrint(Sender: TObject);
begin
   inherited;
   if cCorZebraVenc = ClWhite then
      cCorZebraVenc := $00E3E3E3
   else
      cCorZebraVenc := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebraVenc;
end;

procedure TDmRelRenFixOper.bdtVlrItemPrint(Sender: TObject);
begin
  inherited;
  if qryItensIDITEMRENFIX.AsInteger = -2 then
     bdtVlrItem.DisplayFormat := '###,###,###,##0'
  else bdtVlrItem.DisplayFormat := '###,###,###,###,##0.00';
end;

procedure TDmRelRenFixOper.shpCabInestimentoPrint(Sender: TObject);
begin
  inherited;
  cCorZebra := ClWhite;
end;

procedure TDmRelRenFixOper.grupoEmissorAfterGroupBreak(Sender: TObject);
begin
  inherited;
  fTotalEmissor := 0;
end;

procedure TDmRelRenFixOper.ppDBText7Print(Sender: TObject);
begin
  inherited;
  fTotalEmissor := fTotalEmissor + qryOperacoesSALDO.AsFloat;
end;

procedure TDmRelRenFixOper.lblTotalEmissorPrint(Sender: TObject);
begin
  lblTotalEmissor.Caption := FormatFloat('###,###,###,##0.00', fTotalEmissor);
  inherited;
end;

end.


