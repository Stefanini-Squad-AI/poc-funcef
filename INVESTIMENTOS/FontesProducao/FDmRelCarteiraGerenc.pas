//******************************************************************************
// Data      : 29/03/2007
// Codigo    : AL_6
// Pendência : 24934
// Sol       : 55882
// Motivo    : Ajuste na query qryCartGerencialDet, para buscar os cancelamentos
//             de anúncios no caixa e mostrar no a pagar/receber. Ajuste para
//             identificar os anuncios corretos devido a transferência do dia 01/09/2006
//             tratando pela dataoperacao(OPERACAOINVEST)
//******************************************************************************
// Data      : 13/11/2006
// Codigo    : AL_5
// Motivo    : Ajuste no totalizador do valor a pagar/receber
//******************************************************************************
// Data      : 31/08/2006
// Codigo    : AL_4
// Motivo    :  Implementação do plano/patrocinador
// ******************************************************************************
// Data      : 15/08/2006
// Código    : AL_3
// Motivo    : Ajuste na busca do recebimento parcial de anúncio com cancelamento (qryCartGerencialDet)
//******************************************************************************
// Data      : 13/07/2006
// Código    : AL_2
// Pendencia : 22845
// Motivo    : Ajuste na busca das vendas de ações - CC, o FLGCONTAINVEST estava
//             sendo tratado apenas qdo NULL, agora é buscado qdo for = zero ou NULL
//******************************************************************************
// Data      : 21/06/2006
// Código    : AL_1
// Motivo    : Ajuste na qryCartGerencialDet para buscar o valor de provisão negativo
// ******************************************************************************
// Data      : 10/11/2005
// Código    : qryCartGerencialDet
// Motivo    : Ajuste nos valores a receber e a pagar para o cancelamento de recebimento
// ******************************************************************************
// Data      : 03/10/2005
// Código    : qryCartGerencialDet
// Motivo    : Ajuste no recebimento parcial para Anúncio de Proventos totalizando
//             o por idoperacaodireito e idcarteiragerenc. E implemenatdo o
//             tratamento para recebimento de anuncio por subscrição
// ******************************************************************************
// Data      : 28/09/2005
// Código    : qryCartGerencialDet
// Motivo    : Implementação do recebimento parcial para Anúncio de Proventos
// ******************************************************************************
// Data      : 27/09/2005
// Código    : qryCartGerencialDet
// Motivo    : Implementação do cancelamento de Anúncio de Proventos
// ******************************************************************************
// Data      : 13/06/2005
// Código    : Al_2
// Motivo    : Padronização da estrutura de quebra de linha e da condição "AND" no inico do filtro
// ******************************************************************************
// Data      : 07/06/2005
// Código    : Al_1
// Motivo    : Implementação no layout do rel. item analitica de Vendas/Compras e Depesas a "Data da Operacao" e
//             nas implementado a "DATAOPERACAO" qryAnaliticoCompra, qryAnaliticoVenda e qryAnaliticoDesp
// ******************************************************************************
// Data      : 06/06/2005
// Motivo    : Ajuste na QryTotalPagarReceber, essa a despesas estava trazendo o total de todas as
//             carteiras gerenciais operadas.
// Código    : qryCartGerencialDet
// ******************************************************************************
// Data      : 30/05/2005
// Motivo    : Implementação da busca de venda de ações CCI, separada da normal,
//             para ter saldos independentes;
//             Implementação do "Valor" zerado para o evento "SALDO ANTERIOR"
// Código    : qryCartGerencialDet
// ******************************************************************************
// Data      : 20/05/2005
// Motivo    : Simplificação da busca dos anuncios em aberto
// Código    : qryCartGerencialDet
// ******************************************************************************
// Data      : 17/05/2005
// Motivo    : RETIRADO UM ITEM IDENTIFICADO COMO TRAZER O RESGATE E APLICAÇÃO, ONDE ESSE JA
//             ERA TRAZIDO NA BUSCA DAS OPERAÇÕES GERADAS A PARTIR DE REGISTRO DIRETO NO CAIXA
// Código    : qryCartGerencialDet
// ******************************************************************************
// Data      : 17/05/2005
// Motivo    : Na "BUSCA DAS OPERAÇÕES GERADAS A PARTIR DE REGISTRO DIRETO NO CAIXA",
//             ajustei o codigo para buscar o maior id da histcaixa, esse estava se referindo ao de fora "HC"
// Código    : qryCartGerencialDet
// ******************************************************************************
// Data      : 16/05/2005
// Motivo    : Implementação da critica do id do tipo de subscrição para trazer no item especifico
// Código    : qryCartGerencialDet
// ******************************************************************************
// Data      : 09/05/2005
// Motivo    : Implementação do filtro IDOPERACAODIREITO qdo for null, para não duplicar
//             os anúncios de proventos devido a nova concepção e nessa caso está sendo gravado
//             a OPERACAOINVEST
// Código    : qryCartGerencialDet
// ******************************************************************************
// Data      : 09/05/2005
// Motivo    : Retirado do filtro o parametro "FLGCORRET" por esse não oferecer
//             um objetivo concreto qdo tem referencia a tabela HISTCAIXA. E por estar
//             impedido de trazer itens da CCI nesse momento.
// Código    : qryCartGerencialDet
// ******************************************************************************
// Data      : 28/04/2005
// Motivo    : Ajuste da busca dos Anuncios em aberto
// Código    : qryCartGerencialDet
// ******************************************************************************
// Data      : 13/04/2005
// Motivo    : Alterações em todas as Querys para unificar o SQL em uma query só
//             QryCartGerencialDet. (PAS e DFM)
// Código:   : AL_2
// ******************************************************************************
// Data      : 07/04/2005
// Motivo    : Ajuste do Sql para ficar igual a da Grid do form, na parte dos Anúncios
// Código    : qryCartGerencialDet
// ******************************************************************************
// Data      : 28/02/2005
// Motivo    : Implementação do tratamento PARA AS OPERAÇÕES QUE SE ENCONTRAM NA PASTA OUTROS
//             DA OPERAÇÃO GERENCIAL
// Código    : qryCartGerencialDet
// ******************************************************************************
// Data      : 21/02/2005
// Motivo    : Retirada a implementação do tratamento da provisao da subscrição por
//             anuncio de proventos, no momento da baixa de compensação
// Código    : qryCartGerencialDet
// ******************************************************************************
// Data      : 17/02/2005
// Motivo    : Implementação do tratamento da provisao da subscrição por anuncio de proventos,
//             no momento da baixa de compensação
// Código    : qryCartGerencialDet
// ******************************************************************************
// Data      : 06/01/2005
// Motivo    : Implementação da busca dos Anúncios vencidos e não recebidos
// Código:   : qryCartGerencialDet
// ******************************************************************************
// Data      : 10/11/2004
// Motivo    : Implementação da Opção de Abertura dos Valores de COMPRA, VENDA e DESPESAS A PAGAR.
// Código    : AL_1
//******************************************************************************
// Data	     : 29/04/2004
// Função    : qryCartGerencialDet
// Motivo(S) : Ajustes
//******************************************************************************

unit FDmRelCarteiraGerenc;

interface

uses                                                                              
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosRendaFixa, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppViewr,
  FDMRelatoriosInv, ppModule, daDataModule;

type
  TDmRelCarteiraGerenc = class(TDmRelatoriosInv)
    pprCompCarteiraGerenc: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    pplCartGerencial: TppBDEPipeline;
    qryCartGerencial: TwwQuery;
    dsCartGerencial: TwwDataSource;
    qryCartGerencialTIPOREL: TFloatField;
    ppDBImage1: TppDBImage;
    lblCarteira: TppLabel;
    ppGroup1: TppGroup;
    ppbCabTipoRel: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    qryCartGerencialNOMEREL: TStringField;
    shpCabecalho: TppShape;
    ppdbNomeRel: TppDBText;
    srptRendaVariavel: TppSubReport;
    ppcrRV: TppChildReport;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    pphCabRV: TppHeaderBand;
    shpDetRV: TppShape;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    srptEventoCota: TppSubReport;
    ppcrEventoCota: TppChildReport;
    ppDetailBand4: TppDetailBand;
    pphCabEventoCota: TppHeaderBand;
    ppFooterBand4: TppFooterBand;
    shpCabEventoCota: TppShape;
    shpDetEventoCota: TppShape;
    ppDBText15: TppDBText;
    ppLabel17: TppLabel;
    ppDBText16: TppDBText;
    ppLabel18: TppLabel;
    pplCartGerencialDet: TppBDEPipeline;
    qryCartGerencialDet: TwwQuery;
    dsCartGerencialDet: TwwDataSource;
    qryCartGerencialDetTIPOREL: TFloatField;
    qryCartGerencialDetCARTEIRA: TStringField;
    qryCartGerencialDetCODISIN: TStringField;
    qryCartGerencialDetINVESTIMENTO: TStringField;
    qryCartGerencialDetDATAOPER: TDateTimeField;
    qryCartGerencialDetVALOR: TFloatField;
    qryCartGerencialDetQUANTIDADE: TFloatField;
    qryCartGerencialDetCOTACAO: TFloatField;
    qryCartGerencialDetLOTE: TFloatField;
    qryCartGerencialDetIDCARTEIRAINVEST: TFloatField;
    qryCartGerencialDetIDINVESTIMENTO: TFloatField;
    qryCartGerencialDetIDLOTE: TStringField;
    qryCartGerencialDetOPERACAO: TStringField;
    qryCartGerencialDetVENCIMENTO: TDateTimeField;
    qryCartGerencialDetCORRETORA: TStringField;
    srptResumo: TppSubReport;
    ppChildReport1: TppChildReport;
    pplResumoCota: TppBDEPipeline;
    pptResumo: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    pplRentabilidade: TppBDEPipeline;
    ppSummaryBand2: TppSummaryBand;
    srptEventoCaixa: TppSubReport;
    ppChildReport2: TppChildReport;
    pphCabEventoCaixa: TppHeaderBand;
    shpCabEventoCaixa: TppShape;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppDetailBand6: TppDetailBand;
    shpDetEventoCaixa: TppShape;
    ppFooterBand5: TppFooterBand;
    qryCartGerencialDetSALDO: TFloatField;
    qryCartGerencialDetIDEVENTOCAIXACOTA: TFloatField;
    ppLabel25: TppLabel;
    ppSummaryBand3: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLine3: TppLine;
    ppShape2: TppShape;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    qryCartGerencialDetIDCOR: TFloatField;
    qryCartGerencialDetIDHISTCAIXA: TFloatField;
    ppShape3: TppShape;
    shpSaldo: TppShape;
    ppLabel19: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLValorPl: TppLabel;
    ppLQtdCotas: TppLabel;
    ppLValorCota: TppLabel;
    ppShape4: TppShape;
    ppLabel21: TppLabel;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    shpRentPriIndicador: TppShape;
    lblNomePriIndicador: TppLabel;
    lblVarPriIndMensal: TppLabel;
    lblVarPriIndAnual: TppLabel;
    lblNomeSegIndicador: TppLabel;
    lblVarSegIndMensal: TppLabel;
    lblVarSegIndAnual: TppLabel;
    ppShape5: TppShape;
    ppLabel4: TppLabel;
    ppLabel22: TppLabel;
    ppLine1: TppLine;
    ppLabel11: TppLabel;
    ppDBText1: TppDBText;
    ppShape1: TppShape;
    ppLabel20: TppLabel;
    lblData: TppLabel;
    ppSummaryBand4: TppSummaryBand;
    ppDBCalc2: TppDBCalc;
    ppLine4: TppLine;
    ppLabel218: TppLabel;
    ppLabel219: TppLabel;
    ppLine5: TppLine;
    qryCartGerencialDetDATAMOVCARTINV: TDateTimeField;
    qryCartGerencialDetREG: TFloatField;
    shpCabRV: TppShape;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel1: TppLabel;
    ppDBText3: TppDBText;
    ppChildReport3: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDBAnalitico: TppDetailBand;
    ppSummaryBand5: TppSummaryBand;
    qryAnaliticoCompra: TwwQuery;
    qryAnaliticoCompraNUMDOCUMENTO: TStringField;
    qryAnaliticoCompraDESCINVESTIMENTO: TStringField;
    qryAnaliticoCompraQTDE: TFloatField;
    qryAnaliticoCompraPRECO: TFloatField;
    qryAnaliticoCompraVLROPERACAO: TFloatField;
    pplAnaliticoCompra: TppBDEPipeline;
    dsAnaliticoCompra: TwwDataSource;
    DbtBoleta: TppDBText;
    DbtInv: TppDBText;
    DbtQtd: TppDBText;
    srptAnalitico: TppSubReport;
    DbtPreco: TppDBText;
    DbtValor: TppDBText;
    qryAnaliticoVenda: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    pplAnaliticoVenda: TppBDEPipeline;
    dsAnaliticoVenda: TwwDataSource;
    ppLine6: TppLine;
    qryAnaliticoDesp: TwwQuery;
    pplAnaliticoDesp: TppBDEPipeline;
    dsAnaliticoDesp: TwwDataSource;
    qryAnaliticoDespNUMDOCUMENTO: TStringField;
    qryAnaliticoDespDESCINVESTIMENTO: TStringField;
    qryAnaliticoDespRATEIO: TFloatField;
    qryAnaliticoDespQTDE: TFloatField;
    qryAnaliticoDespPRECO: TFloatField;
    qryAnaliticoDespTOTDESP: TFloatField;
    qryAnaliticoDespTOTQTD: TFloatField;
    qryAnaliticoDespVLROPERACAO: TFloatField;
    qryAnaliticoVendaRATEIO: TFloatField;
    qryAnaliticoVendaTOTDESP: TFloatField;
    qryAnaliticoVendaTOTQTD: TFloatField;
    qryAnaliticoCompraRATEIO: TFloatField;
    qryAnaliticoCompraTOTDESP: TFloatField;
    qryAnaliticoCompraTOTQTD: TFloatField;
    DbtRateio: TppDBText;
    DbtTotQtd: TppDBText;
    DbtTotDesp: TppDBText;
    ppsAnalitico: TppShape;
    qryResumoCota: TwwQuery;
    qryResumoCotaDESCCAIXACOTA: TStringField;
    qryResumoCotaVLRHISTCOTA: TFloatField;
    qryResumoCotaIDEVENTOCAIXACOTA: TFloatField;
    dsResumoCota: TwwDataSource;
    qryRentabilidadeCota: TwwQuery;
    qryRentabilidadeCotaVLRZMES: TFloatField;
    qryRentabilidadeCotaVLRZANO: TFloatField;
    qryRentabilidadeCotaVLRZDIA: TFloatField;
    dsRentabilidadeCota: TwwDataSource;
    //Al_1
    qryAnaliticoCompraDATAOPERACAO: TDateTimeField;
    qryAnaliticoDespDATAOPERACAO: TDateTimeField;
    qryAnaliticoVendaDATAOPERACAO: TDateTimeField;
    //Al_1 Fim
    ppGroup2: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppShape6: TppShape;
    LbBoleta: TppLabel;
    LbInv: TppLabel;
    LbQtd: TppLabel;
    LbPreco: TppLabel;
    LbValor: TppLabel;
    LbRateio: TppLabel;
    LbTotQtd: TppLabel;
    LbTotDesp: TppLabel;
    ppDBText9: TppDBText;
    //AL_4
    lblPlano: TppLabel;
    procedure pprCompCarteiraGerencStartPage(Sender: TObject);
    procedure shpDetBMFPrint(Sender: TObject);
    procedure shpDetEventoCotaPrint(Sender: TObject);
    procedure shpDetRVPrint(Sender: TObject);
    procedure ppbCabTipoRelBeforePrint(Sender: TObject);
    procedure ppcrEventoCotaStartPage(Sender: TObject);
    procedure ppcrBMFStartPage(Sender: TObject);
    procedure ppcrRVStartPage(Sender: TObject);
    procedure srptResumoPrint(Sender: TObject);
    procedure shpDetResumoPrint(Sender: TObject);
    procedure ppShape2Print(Sender: TObject);
    procedure srptAnaliticoPrint(Sender: TObject);
    procedure HabCompraVenda;
    procedure HabDesp;
    procedure ppDBAnaliticoBeforePrint(Sender: TObject);

  private
    { Private declarations }
    cCorZebra  : TColor;
    cCorZebra2 : TColor;
  public
    { Public declarations }
  end;

var
  DmRelCarteiraGerenc: TDmRelCarteiraGerenc;

implementation

uses dOperComum, FConsCartGerenc;

{$R *.DFM}

procedure TDmRelCarteiraGerenc.pprCompCarteiraGerencStartPage(
   Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
   shpDetRV.Brush.Color := clWhite;
   shpDetEventoCota.Brush.Color := clWhite;

   // AL_1
   cCorZebra2 := $00E3E3E3;
   ppsAnalitico.Brush.Color := clWhite;
end;

procedure TDmRelCarteiraGerenc.shpDetBMFPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelCarteiraGerenc.shpDetEventoCotaPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelCarteiraGerenc.shpDetRVPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelCarteiraGerenc.ppbCabTipoRelBeforePrint(Sender: TObject);
var sFiltro: String;
begin
  inherited;
  sFiltro := 'TIPOREL = ' + qryCartGerencialTIPOREL.AsString;
  qryCartGerencialDet.Filter := sFiltro;
  case qryCartGerencialTIPOREL.AsInteger of
  1: begin
        srptRendaVariavel.Visible := True;
        pphCabRV.Visible := True;
        srptEventoCota.Visible := False;
        srptEventoCaixa.Visible := False;
        srptResumo.Visible := False;
     end;
  2: begin
        srptRendaVariavel.Visible := False;
        srptEventoCota.Visible := False;
        srptEventoCaixa.Visible := False;
        srptResumo.Visible := False;
     end;
  3: begin
        srptRendaVariavel.Visible := False;
        srptEventoCota.Visible := True;
        pphCabEventoCota.Visible := True;
        srptEventoCaixa.Visible := False;
        srptResumo.Visible := False;
     end;
  4: begin
        srptRendaVariavel.Visible := False;
        srptEventoCota.Visible := False;
        srptEventoCaixa.Visible := True;
        pphCabEventoCaixa.Visible := True;
        srptResumo.Visible := False;
     end;
  5: begin
        srptRendaVariavel.Visible := False;
        srptEventoCota.Visible    := False;
        srptEventoCaixa.Visible   := False;
        srptResumo.Visible        := True;
        While Not QryResumoCota.Eof Do
        Begin
           case qryResumoCotaIDEVENTOCAIXACOTA.AsInteger of
           -1: ppLValorPl.Caption   := FloatToStrF(qryResumoCotaVLRHISTCOTA.AsFloat, ffNumber, 18, 2);
           -2: ppLValorCota.Caption := FloatToStrF(qryResumoCotaVLRHISTCOTA.AsFloat, ffNumber, 21, 9);
           -3: ppLQtdCotas.Caption  := FloatToStrF(qryResumoCotaVLRHISTCOTA.AsFloat, ffNumber, 21, 9);
           end;
           qryResumoCota.Next;
        End;
     end;
  end;
end;

procedure TDmRelCarteiraGerenc.ppcrEventoCotaStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TDmRelCarteiraGerenc.ppcrBMFStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TDmRelCarteiraGerenc.ppcrRVStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TDmRelCarteiraGerenc.srptResumoPrint(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TDmRelCarteiraGerenc.shpDetResumoPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelCarteiraGerenc.ppShape2Print(Sender: TObject);
begin
  inherited;
   cCorZebra := qryCartGerencialDet.FieldByName('IDCOR').AsInteger;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelCarteiraGerenc.srptAnaliticoPrint(Sender: TObject);
begin
  inherited;

   // AL_1
  srptAnalitico.Visible := False;

  if qryCartGerencialDetINVESTIMENTO.AsString = 'COMPRA' then
  begin
       srptAnalitico.DataPipeLine := pplAnaliticoCompra;
       HabCompraVenda;
       srptAnalitico.Visible      := True;
  end;

  if qryCartGerencialDetINVESTIMENTO.AsString = 'VENDA' then
  begin
       srptAnalitico.DataPipeLine := pplAnaliticoVenda;
       HabCompraVenda;
       srptAnalitico.Visible      := True;
  end;

  if qryCartGerencialDetINVESTIMENTO.AsString = 'DESPESAS A PAGAR' then
  begin
       srptAnalitico.DataPipeLine := pplAnaliticoDesp;
       HabDesp;
       srptAnalitico.Visible      := True;
  end;
end;

// AL_1
procedure TDmRelCarteiraGerenc.HabCompraVenda;
begin
     LbBoleta.Width    := 0.7917;
     LbBoleta.Left     := 0.0313;
     LbBoleta.Visible  := True;
     DbtBoleta.Width   := 0.7917;
     DbtBoleta.Left    := 0.0313;
     DbtBoleta.Visible := True;

     LbInv.Width    := 2.1042;
     LbInv.Left     := 0.8542;
     LbInv.Visible  := True;
     DbtInv.Width   := 2.1042;
     DbtInv.Left    := 0.8542;
     DbtInv.Visible := True;

     LbQtd.Width    := 1.4063;
     LbQtd.Left     := 3;
     LbQtd.Visible  := True;
     DbtQtd.Width   := 1.4063;
     DbtQtd.Left    := 3;
     DbtQtd.Visible := True;

     LbPreco.Width    := 1.2396;
     LbPreco.Left     := 4.4479;
     LbPreco.Visible  := True;
     DbtPreco.Width   := 1.2396;
     DbtPreco.Left    := 4.4479;
     DbtPreco.Visible := True;

     LbValor.Width    := 1.2604;
     LbValor.Left     := 5.7396;
     LbValor.Visible  := True;
     DbtValor.Width   := 1.2604;
     DbtValor.Left    := 5.7396;
     DbtValor.Visible := True;

     DbtRateio.Visible  := False;
     DbtTotQtd.Visible  := False;
     DbtTotDesp.Visible := False;
     LbRateio.Visible   := False;
     LbTotQtd.Visible   := False;
     LbTotDesp.Visible  := False;
end;

// AL_1
procedure TDmRelCarteiraGerenc.HabDesp;
begin
     LbBoleta.Width    := 0.7187;
     LbBoleta.Left     := 0.0313;
     LbBoleta.Visible  := True;
     DbtBoleta.Width   := 0.7187;
     DbtBoleta.Left    := 0.0313;
     DbtBoleta.Visible := True;

     LbInv.Width    := 1.5;
     LbInv.Left     := 0.7813;
     LbInv.Visible  := True;
     DbtInv.Width   := 1.5;
     DbtInv.Left    := 0.7813;
     DbtInv.Visible := True;

     LbRateio.Width    := 0.75;
     LbRateio.Left     := 2.3125;
     LbRateio.Visible  := True;
     DbtRateio.Width   := 0.75;
     DbtRateio.Left    := 2.3125;
     DbtRateio.Visible := True;

     LbQtd.Width    := 0.9167;
     LbQtd.Left     := 3.1042;
     LbQtd.Visible  := True;
     DbtQtd.Width   := 0.9167;
     DbtQtd.Left    := 3.1042;
     DbtQtd.Visible := True;

     LbPreco.Width    := 0.9063;
     LbPreco.Left     := 4.0625;
     LbPreco.Visible  := True;
     DbtPreco.Width   := 0.9063;
     DbtPreco.Left    := 4.0625;
     DbtPreco.Visible := True;

     DbtTotQtd.Width   := 0.8542;
     DbtTotQtd.Left    := 5.125;
     DbtTotQtd.Visible := True;
     LbTotQtd.Width    := 0.8542;
     LbTotQtd.Left     := 5.125;
     LbTotQtd.Visible  := True;

     DbtTotDesp.Width   := 0.8854;
     DbtTotDesp.Left    := 6.125;
     DbtTotDesp.Visible := True;
     LbTotDesp.Width    := 0.8854;
     LbTotDesp.Left     := 6.125;
     LbTotDesp.Visible  := True;

     LbValor.Visible  := False;
     DbtValor.Visible := False;
end;

procedure TDmRelCarteiraGerenc.ppDBAnaliticoBeforePrint(Sender: TObject);
begin
  inherited;
   // AL_1
   if cCorZebra2 = ClWhite then
      cCorZebra2 := $00E3E3E3
   else
      cCorZebra2 := ClWhite;

   ppsAnalitico.Brush.Color := cCorZebra2;
end;

end.
