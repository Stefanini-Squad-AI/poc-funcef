//************************************************************************************************//
// Data      : 18/07/2007
// Código    : AL_3
// Pendencia : 25909
// SOL       :
// Descrição : Criação do fluxo de memória de cálculo da cota
//************************************************************************************************//
// Data     : 12/08/2005
// Código   : AL_2
// Descrição: Ajuste na ordem de impressão das partes do relatório
//            Ajuste geral no lay-out
//************************************************************************************************//
// Data     : 04/08/2005
// Código   : AL_1
// Descrição: Ajuste de LayOut para o Gráfico não sobrepor-se ao subrelatório de
//            composição do perfil
//            Ajuste na organizaçãso dos componentes no form
//************************************************************************************************//
// 26/01/2005                                                                                     //
// Incluído os campos "Plano", "Patricinadora" e "Plano SPC" no título do relatório               //
//************************************************************************************************//
unit dRelPerfilConsolidado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, uCMClientDataSet, dLookCota, fConsultaPerfil, TXComp,
  DBClient, TeEngine, Series, ExtCtrls, TeeProcs, Chart, ppChrtDP, ppChrt,
  ppRegion, ppModule, raCodMod, ppParameter, uCmSqlParams;

type
  TdtmRelPerfilConsolidado = class(TdtmReports)
    plAtivosEspecif: TppDBPipeline;
    plAtivosConsolidados: TppDBPipeline;
    pplDadosFundacao: TppDBPipeline;
    ppDbCompPerfil: TppDBPipeline;
    dsCompPerfil: TwwDataSource;
    CdsCompPerfil: TCMClientDataSet;
    CdsCompPerfilTIPOATIVO: TStringField;
    CdsCompPerfilATIVO: TStringField;
    CdsAtivosEspecif: TCMClientDataSet;
    CdsAtivosEspecifDATA: TDateTimeField;
    CdsAtivosEspecifATIVO: TStringField;
    CdsAtivosEspecifQTDCOTA: TFloatField;
    CdsAtivosEspecifVLRCOTA: TFloatField;
    CdsAtivosEspecifVLRCOTIZADO: TFloatField;
    CdsAtivosEspecifVLRPATRIMONIO: TFloatField;
    CdsAtivosEspecifORIGEMATIVO: TStringField;
    CdsAtivosEspecifPATRO: TStringField;
    CdsAtivosEspecifPLANO: TStringField;
    dsAtivosEspecif: TwwDataSource;
    CdsAtivosConsolidados: TCMClientDataSet;
    CdsAtivosConsolidadosDATA: TDateTimeField;
    CdsAtivosConsolidadosVLRPATRIMONIOINI: TFloatField;
    CdsAtivosConsolidadosVLRPATRIMONIOFIM: TFloatField;
    CdsAtivosConsolidadosQTDCOTAFIM: TFloatField;
    CdsAtivosConsolidadosVLRCOTA: TFloatField;
    CdsAtivosConsolidadosVLRCOTIZADO: TFloatField;
    CdsAtivosConsolidadosQTDCOTAINI: TFloatField;
    CdsAtivosConsolidadosPERCENTDIA: TFloatField;
    CdsAtivosConsolidadosPERCENTPERIODO: TFloatField;
    dsAtivosConsolidados: TwwDataSource;
    CdsAtivosConsolidadosVLRRENTABILIZADO: TFloatField;
    CdsAtivosEspecifVLRRENTABILIZADO: TFloatField;
    CdsAtivosConsolidadosGRUPO: TFloatField;
    rpRelPerfilConsolidado: TppReport;
    ppDbCompPerfilDet: TppDBPipeline;
    ppField1: TppField;
    ppField2: TppField;
    dsCompPerfilDet: TwwDataSource;
    CdsCompPerfilDet: TCMClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    plFluxoCota: TppDBPipeline;
    cdsFluxoCota: TCMClientDataSet;
    dsFluxoCota: TwwDataSource;
    CMSqlParams1: TCMSqlParams;
    cdsFluxoCotaIDCOTACOTACAO: TFloatField;
    cdsFluxoCotaHISTORICO: TStringField;
    cdsFluxoCotaVALORCOTIZADO: TFloatField;
    cdsFluxoCotaVALORRENTABILIZADO: TFloatField;
    cdsFluxoCotaVALOR: TFloatField;
    cdsFluxoCotaFLGCOTA: TStringField;
    ppParameterList1: TppParameterList;
    ppHeaderBand2: TppHeaderBand;
    ppLabel50: TppLabel;
    ppDBImage1: TppDBImage;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLbDescPerfil: TppLabel;
    ppLbPeriodo: TppLabel;
    lnCabecalho: TppLine;
    ppLPlano: TppLabel;
    ppLPatro: TppLabel;
    ppLPlanoSPC: TppLabel;
    ppDetailBand3: TppDetailBand;
    srptMovimentacao: TppSubReport;
    ppChildReport4: TppChildReport;
    ppDetailBand7: TppDetailBand;
    ppSummaryBand5: TppSummaryBand;
    bndCabMovimentacao: TppHeaderBand;
    ppLabel64: TppLabel;
    ppLine11: TppLine;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    srptDetDrillMov: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand6: TppTitleBand;
    ppShape25: TppShape;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    srptFluxoCota: TppSubReport;
    ppChildReport5: TppChildReport;
    bndCabFluxoCota: TppTitleBand;
    ppShape1: TppShape;
    ppLabel7: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppShape4: TppShape;
    ppDBText2: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppLine2: TppLine;
    raCodeModule1: TraCodeModule;
    ppSummaryBand3: TppSummaryBand;
    ppLine8: TppLine;
    shpDetMovimento: TppShape;
    linDrilDowMovimento: TppLine;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText38: TppDBText;
    lnDrillFluxo: TppLine;
    raCodeModule2: TraCodeModule;
    raCodeModule3: TraCodeModule;
    srptComposicao: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppShape21: TppShape;
    ppLbIndicador: TppLabel;
    ppLabel14: TppLabel;
    ppShape22: TppShape;
    ppLbTxJuros: TppLabel;
    ppLbIndJuros: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppShape23: TppShape;
    ppLbVlrCota: TppLabel;
    ppLbSobreInd: TppLabel;
    ppLabel22: TppLabel;
    bndCabPerfil: TppHeaderBand;
    ppLabel52: TppLabel;
    ppLine6: TppLine;
    ppLabel51: TppLabel;
    ppDetailBand2: TppDetailBand;
    shpDetComposicao: TppShape;
    srptComposicaoDet: TppSubReport;
    ppChildReport3: TppChildReport;
    bndCabCompDet: TppHeaderBand;
    shpCabCompDet: TppShape;
    ppLabel1: TppLabel;
    ppDetailBand1: TppDetailBand;
    shpDetCompDet: TppShape;
    ppDBText1: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    dbtTipoAtivo: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel62: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLine10: TppLine;
    ppSummaryBand4: TppSummaryBand;
    ppDPTeeChart2: TppDPTeeChart;
    ppLabel63: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    raCodeModule4: TraCodeModule;
    CdsAtivosEspecifIDCOTACOTACAO: TFloatField;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    bndCabMovimento: TppHeaderBand;
    bndCabFluxo: TppHeaderBand;
    procedure ppLabel12Print(Sender: TObject);
    procedure srptDetalheCotaPrint(Sender: TObject);
    procedure rpRelPerfilConsolidado1StartPage(Sender: TObject);
    procedure ShapePrint(Sender: TObject);
    procedure rpRelPerfilConsolidado1EndPage(Sender: TObject);
    procedure srptComposicaoPrint(Sender: TObject);
    procedure srptMovimentacaoPrint(Sender: TObject);
    procedure srptComposicaoDetPrint(Sender: TObject);
    procedure srptFluxoCotaPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;

  public
    { Public declarations }
  end;

var
  dtmRelPerfilConsolidado: TdtmRelPerfilConsolidado;

implementation

{$R *.DFM}

procedure TdtmRelPerfilConsolidado.ppLabel12Print(Sender: TObject);
begin
  inherited;
  TppLabel(Sender).Caption := TppHeaderBand(TppLabel(Sender).Parent).report.printersetup.documentname;
end;

procedure TdtmRelPerfilConsolidado.rpRelPerfilConsolidado1StartPage(Sender: TObject);
begin
  inherited;
  cCorZebra := $00C6F9CC;
  shpDetMovimento.Brush.Color := clWhite;
  shpDetCompDet.Brush.Color := clWhite;
  CdsAtivosEspecif.Filtered := True;
  CdsCompPerfilDet.Filtered := True;
  //AL_3
  cdsFluxoCota.Filtered := True;
end;

procedure TdtmRelPerfilConsolidado.rpRelPerfilConsolidado1EndPage(Sender: TObject);
begin
  inherited;
  CdsAtivosEspecif.Filter := '';
  CdsAtivosEspecif.Filtered := False;
  CdsCompPerfilDet.Filter := '';
  CdsCompPerfilDet.Filtered := True;
  //AL_3
  cdsFluxoCota.Filter := '';
  cdsFluxoCota.Filtered := True;

end;

procedure TdtmRelPerfilConsolidado.ShapePrint(Sender: TObject);
begin
   if TppShape(Sender).Brush.Color = clWhite then
      TppShape(Sender).Brush.Color := cCorZebra
   else
      TppShape(Sender).Brush.Color := clWhite;
end;

procedure TdtmRelPerfilConsolidado.srptDetalheCotaPrint(Sender: TObject);
begin
   inherited;
   CdsAtivosEspecif.Filter := 'DATA = ' + QuotedStr(CdsAtivosConsolidadosDATA.AsString);
end;

procedure TdtmRelPerfilConsolidado.srptComposicaoPrint(Sender: TObject);
begin
   bndCabPerfil.Visible := True;
   inherited;
end;

procedure TdtmRelPerfilConsolidado.srptMovimentacaoPrint(Sender: TObject);
begin
   bndCabMovimentacao.Visible := True;
   inherited;
end;

procedure TdtmRelPerfilConsolidado.srptComposicaoDetPrint(Sender: TObject);
begin
   CdsCompPerfilDet.Filter := 'TIPOATIVO = ' + QuotedStr(CdsCompPerfilTIPOATIVO.AsString);
   bndCabCompDet.Visible := True;
   bndCabMovimento.Visible := True;
   inherited;
end;

//AL_3
procedure TdtmRelPerfilConsolidado.srptFluxoCotaPrint(Sender: TObject);
begin
  inherited;
  cdsFluxoCota.Filter := 'IDCOTACOTACAO = ' + CdsAtivosEspecif.FieldByName('IDCOTACOTACAO').AsString;
  bndCabFluxoCota.Visible := True;
  bndCabFluxo.Visible := True;

end;

end.
