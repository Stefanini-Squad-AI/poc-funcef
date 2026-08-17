//******************************************************************************
//Rotina      : Consulta\Renda Varialvel\Direito\Direitos de Exercicio
//SOL         : 121533
//Kintana     : 589718
//Data        : 15/07/2009
//Responsável : Renan Cristiano
//Problema    : Correção na consulta de relatorio
//Solução     : Ajuste no relatório de Direitos de Exercicios para filtrar somente
//              Dividendos e Juros.
//******************************************************************************
//Data	     : 30/10/2006
//Código     : AL_6
//Pendência  : 23667
//Motivo(S)  : Implementação de Plano e Patrocinadora
//******************************************************************************
//Data	     : 18/04/2006
//Código     : AL_5
//Pendência  : 22049
//SOL        : 42036
//Motivo(S)  : Inversão de sinal VLRVARIACAO da qryOperacoes
//******************************************************************************
//Data	     : 11/04/2006
//Código     : AL_4
//Pendência  : 20192
//Motivo(S)  : Ajuste no SQL para acertar os totalizadores de Conpras e Vendas
//             Melhoria de lay-out
//             Acerto na filtragem por boleta (tb nas queries de Sld ini e final)
//******************************************************************************
//Data	     : 13/03/2006
//Código     : AL_4
//Pendência  : 20192
//Motivo(S)  : Acerto na impressâo do somatório de compras e venda quando faz a quebra
//             de pagina;
//             Melhoria de lay-out e filtragem por boleta
//******************************************************************************
//Data	          : 12/12/2005
//Código 	  : AL_3
//Motivo(S)       : Ajuste nas queries de saldo INI e FINAL, acerto no grupamento
//                    para mostrar as posioções abertas por: Carteira, Bloqueio e
//                    Custodiante.
//******************************************************************************
//Data	          : 20/07/2005
//Código 	  : AL_2
//Motivo(S)       : Inserido o campos VLRVARIACAO na QryOperacoes e no relatório
//******************************************************************************
//Data	          : 13/07/2005
//Código 	  : AL_1
//Motivo(S)       : Inserido os campos DESPESAS e LUCPREJ na QryOperacoes
//******************************************************************************

unit FDmRelExtratoInvRV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt;

type
  TDmRelExtratoInvRV = class(TdtmReports)
    rptHistInvRenVar: TppReport;
    ppHeaderBand1: TppHeaderBand;
    shpCabecalho: TppShape;
    lblDtOper: TppLabel;
    lblDescCorretora: TppLabel;
    lblSldQtd: TppLabel;
    lblQtd: TppLabel;
    ppLabel9: TppLabel;
    lblVlrOper: TppLabel;
    lblDescOper: TppLabel;
    ppDetailBand1: TppDetailBand;
    shpOperacao: TppShape;
    dbDataOper: TppDBText;
    dbCorretora: TppDBText;
    dbQuantOper: TppDBText;
    dbPUOper: TppDBText;
    dbValorOpe: TppDBText;
    dbSaldoQtd: TppDBText;
    srptSaldoFinal: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    shpSaldoFinal: TppShape;
    ppSummaryBand1: TppSummaryBand;
    dbOperacao: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    shpCabInestimento: TppShape;
    ppDBText1: TppDBText;
    ppLabel4: TppLabel;
    pplOperacoes: TppBDEPipeline;
    pplEstoqueFim: TppBDEPipeline;
    dsOperacoes: TwwDataSource;
    dsEstoqueFim: TwwDataSource;
    qryOperacoes: TwwQuery;
    qryEstoqueIni: TwwQuery;
    pplEstoqueIni: TppBDEPipeline;
    dsEstoqueIni: TwwDataSource;
    qryEstoqueIniDATAMOVCUSTOD: TDateTimeField;
    qryEstoqueIniSGLCUSTODIANTE: TStringField;
    qryEstoqueIniDESCCARTINVEST: TStringField;
    qryEstoqueIniDESCINVESTIMENTO: TStringField;
    qryEstoqueIniSALDOLIBERADO: TFloatField;
    qryEstoqueIniSALDOBLOQUEADO: TFloatField;
    qryEstoqueIniSALDOTOTAL: TFloatField;
    qryOperacoesIDCARTEIRAINVEST: TFloatField;
    qryOperacoesDATAMOVCARTINV: TDateTimeField;
    qryOperacoesVLRMOVCARTINV: TFloatField;
    qryOperacoesSALDOVLRINVCART: TFloatField;
    qryOperacoesQTDEMOVINVCART: TFloatField;
    qryOperacoesSALDOQTDEINVCART: TFloatField;
    qryOperacoesHISTMOVCARTINV: TStringField;
    qryOperacoesTIPMOVCARTINV: TStringField;
    qryOperacoesIDLOTE: TStringField;
    qryOperacoesDESCINVESTIMENTO: TStringField;
    qryOperacoesCOTASMOVCARTINV: TFloatField;
    qryOperacoesSALDOCOTASCARTINV: TFloatField;
    qryOperacoesIDOPERACAOINVEST: TFloatField;
    qryOperacoesMOVIMATU: TFloatField;
    qryOperacoesSALDOATU: TFloatField;
    qryOperacoesMOVIMCAR: TFloatField;
    qryOperacoesSALDOCAR: TFloatField;
    qryOperacoesMOVIMAQUI: TFloatField;
    qryOperacoesSALDOAQUI: TFloatField;
    qryOperacoesSALDOREND: TFloatField;
    qryOperacoesNATURMOVCARTINV: TStringField;
    qryOperacoesIDINVESTIMENTO: TFloatField;
    qryOperacoesIDTIPOOPERACAO: TFloatField;
    qryOperacoesDESCTIPOOPERACAO: TStringField;
    qryOperacoesSGLCORRETVALORES: TStringField;
    qryOperacoesPRECOUNITOPERACAO: TFloatField;
    lblVlrVariacao: TppLabel;
    lblLucPrej: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText9: TppDBText;
    ppLabel12: TppLabel;
    qryEstoqueIniIDCARTEIRAINVEST: TFloatField;
    qryEstoqueIniIDINVESTIMENTO: TFloatField;
    ppShape1: TppShape;
    ppShape2: TppShape;
    lblTotComprasTit: TppLabel;
    lblTotVendasTit: TppLabel;
    lblTotComprasQtd: TppLabel;
    lblTotVendasQtd: TppLabel;
    lblTotComprasVal: TppLabel;
    lblTotVendasVal: TppLabel;
    qryEstoqueFim: TwwQuery;
    qryEstoqueFimSGLCUSTODIANTE: TStringField;
    qryEstoqueFimDESCCARTINVEST: TStringField;
    qryEstoqueFimDESCINVESTIMENTO: TStringField;
    qryEstoqueFimSALDOLIBERADO: TFloatField;
    qryEstoqueFimSALDOBLOQUEADO: TFloatField;
    qryEstoqueFimSALDOTOTAL: TFloatField;
    qryEstoqueFimDATAMOVCUSTOD: TDateTimeField;
    qryEstoqueFimIDCARTEIRAINVEST: TFloatField;
    qryEstoqueFimIDINVESTIMENTO: TFloatField;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel13: TppLabel;
    ppDBText10: TppDBText;
    qryOperacoesDESCCARTINVEST: TStringField;
    srptSaldoInicial: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    shpSaldoIni: TppShape;
    ppDBText5: TppDBText;
    ppLabel16: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    shpTitCarteira: TppShape;
    ppLCarteiraEx: TppLabel;
    ppLPeriodo: TppLabel;
    ppDbLogo: TppDBImage;
    ppLabel2: TppLabel;
    ppLabel14: TppLabel;
    lblPeriodo: TppLabel;
    ppDBImage1: TppDBImage;
    //AL_1 Ini
    qryOperacoesDESPESAS: TFloatField;
    qryOperacoesLUCPREJ: TFloatField;
    dbDespesas: TppDBText;
    dbLucPrej: TppDBText;
    pplVlrLiberado: TppLabel;
    pplVlrBloqueado: TppLabel;
    pplSldTotal: TppLabel;
    ppLabel1: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine1: TppLine;
    qryOperacoesVLRVARIACAO: TFloatField;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    lblVlrCusto: TppLabel;
    lblVlrDespesa: TppLabel;
    qryOperacoesNUMDOCUMENTO: TStringField;
    ppDBText13: TppDBText;
    ppLabel7: TppLabel;
    ppCalcCusto: TppDBCalc;
    lblTotais: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppShape3: TppShape;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel15: TppLabel;
    ppSummaryBand3: TppSummaryBand;
    pplBoleta: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    qryOperacoesQTDECOMPRAS: TFloatField;
    qryOperacoesVLRCOMPRAS: TFloatField;
    qryOperacoesQTDEVENDAS: TFloatField;
    qryOperacoesVLRVENDAS: TFloatField;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    qryEstoqueIniPLANPRVCONTABPATRO: TStringField;
    qryOperacoesPLANPRVCONTABPATRO: TStringField;
    qryEstoqueFimPLANPRVCONTABPATRO: TStringField;
    ppLabel19: TppLabel;
    ppDBText14: TppDBText;
    ppLabel20: TppLabel;
    ppDBText15: TppDBText;
    ppLabel21: TppLabel;
    ppDBText16: TppDBText;
    ppLabel22: TppLabel;
    ppDBText17: TppDBText;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLabel23: TppLabel;
    ppDBText18: TppDBText;
    //AL_1 Fim
    procedure srptSaldoInicialPrint(Sender: TObject);
    procedure srptSaldoFinalPrint(Sender: TObject);
    procedure rptHistInvRenVarStartPage(Sender: TObject);
    procedure shpOperacaoPrint(Sender: TObject);
    procedure shpSaldoIniPrint(Sender: TObject);
    procedure ppShape1Print(Sender: TObject);
    procedure shpSaldoFinalPrint(Sender: TObject);
    procedure shpCabInestimentoPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
    fTotComprasQtd, fTotComprasVal, fTotVendasQtd, fTotVendasVal: Double;
  public
    { Public declarations }
  end;

var
  DmRelExtratoInvRV: TDmRelExtratoInvRV;

implementation

{$R *.DFM}

procedure TDmRelExtratoInvRV.srptSaldoInicialPrint(Sender: TObject);
begin
  qryEstoqueIni.Filter := 'IDCARTEIRAINVEST = ' + qryOperacoesIDCARTEIRAINVEST.AsString + ' AND ' +
                          'IDINVESTIMENTO = ' + qryOperacoesIDINVESTIMENTO.AsString;
  fTotComprasQtd := 0;
  fTotComprasVal := 0;
  fTotVendasQtd := 0;
  fTotVendasVal := 0;
  inherited;
end;

procedure TDmRelExtratoInvRV.srptSaldoFinalPrint(Sender: TObject);
begin
  qryEstoqueFim.Filter := 'IDCARTEIRAINVEST = ' + qryOperacoesIDCARTEIRAINVEST.AsString + ' AND ' +
                          'IDINVESTIMENTO = ' + qryOperacoesIDINVESTIMENTO.AsString;

  lblTotComprasQtd.Caption := FormatFloat('###,###,###,###,##0',fTotComprasQtd);
  lblTotComprasVal.Caption := FormatFloat('###,###,###,###,##0.00',fTotComprasVal);
  lblTotVendasQtd.Caption := FormatFloat('###,###,###,###,##0',fTotVendasQtd);
  lblTotVendasVal.Caption := FormatFloat('###,###,###,###,##0.00',fTotVendasVal);
  inherited;
end;

procedure TDmRelExtratoInvRV.rptHistInvRenVarStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TDmRelExtratoInvRV.shpOperacaoPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra;

   if qryOperacoesNATURMOVCARTINV.AsString = 'A' then
   begin
      fTotComprasQtd := fTotComprasQtd + qryOperacoesQTDEMOVINVCART.AsFloat;
      fTotComprasVal := fTotComprasVal + qryOperacoesVLRMOVCARTINV.AsFloat;
   end else if qryOperacoesNATURMOVCARTINV.AsString = 'D' then
   begin
      fTotVendasQtd := fTotVendasQtd + qryOperacoesQTDEMOVINVCART.AsFloat;
      fTotVendasVal := fTotVendasVal + qryOperacoesVLRMOVCARTINV.AsFloat;
   end;
end;

procedure TDmRelExtratoInvRV.shpSaldoIniPrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelExtratoInvRV.ppShape1Print(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelExtratoInvRV.shpSaldoFinalPrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelExtratoInvRV.shpCabInestimentoPrint(Sender: TObject);
begin
  inherited;
  cCorZebra := ClWhite;
end;

end.

