{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 24879
Responsável : Daniel Simões
Data        : 12/07/2007
Descrição   : Implementação do relatório de Resumo da Folha de Receita por
              Vencimento.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit dRelFolhaRecVencimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, uCmSqlParams, Db,
  Wwdatsrc, DBClient, uCMClientDataSet, ppDB, ppDBPipe, ppDBBDE,
  ppParameter, ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppRegion,
  ppReport, ppStrtch, ppSubRpt, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, uCtrlRelAdminImob, uModuloImobiliario;

type
  TdtmRelFolhaRecVencimento = class(TFrmCmReport)
    rptFolhaRecVencimento: TppReport;
    ppParameterList1: TppParameterList;
    ppl: TppBDEPipeline;
    cds: TCMClientDataSet;
    ds: TwwDataSource;
    CMSql: TCMSqlParams;
    cdsDATAVENCIMENTO: TDateTimeField;
    cdsQTDE: TFloatField;
    cdsVLR_ALUGUEL: TFloatField;
    cdsVLR_IPTU: TFloatField;
    cdsVLR_SEGURO: TFloatField;
    cdsVLR_OUTRO: TFloatField;
    cdsVLR_TOTAL: TFloatField;
    cdsPER_REC: TFloatField;
    cdsVLR_PAGO: TFloatField;
    cdsPER_PAGO: TFloatField;
    cdsVLR_ABERTO: TFloatField;
    cdsPER_ABERTO: TFloatField;
    cdsGRUPO: TFloatField;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppLabel148: TppLabel;
    ppLogoTipo: TppImage;
    ppLine2: TppLine;
    lblImovelMestre: TppLabel;
    lblPeriodoVenc: TppLabel;
    lblCompetencia: TppLabel;
    ppDBandaDetalhe: TppDetailBand;
    ppsCor: TppShape;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText1: TppDBText;
    ppFooterBand1: TppFooterBand;
    lblSistema: TppLabel;
    ppLine41: TppLine;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    ppLine6: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLine4: TppLine;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel9: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppRegion1: TppRegion;
    ppLabel11: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBCalc1: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppVlrTotal: TppDBCalc;
    ppVlrPago: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppvPerPago: TppVariable;
    ppvPerAberto: TppVariable;
    ppLine1: TppLine;
    raCodeModule2: TraCodeModule;
    ppDBCalc5: TppDBCalc;
    procedure FormCreate(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
  private
    { Private declarations }

    CtrlRelAdminImob : TCtrlRelAdminImob;

  public
    { Public declarations }

    bSeparador : Boolean;
    bCorLinha  : Boolean;
    CorLinha   : TColor;
    CorAtual   : TColor;
  end;

var
  dtmRelFolhaRecVencimento: TdtmRelFolhaRecVencimento;

implementation

uses uFuncoesImob, uSistema, dBaseDados, UComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TdtmRelFolhaRecVencimento.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlRelAdminImob := TCtrlRelAdminImob.Create;
  CtrlRelAdminImob.Initialize(dtmBaseDados.DbBaseDados,
                              True,
                              Sistema.ConnectionType,
                              Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,
                              True,
                              ComunsImobiliario.MensErroMT);

end;

procedure TdtmRelFolhaRecVencimento.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;

{ CmpRptCM.ParamValues - Descrição
  [0] IdImovelMestre - ID do Imóvel Mestre
  [1] dAnoComp       - Ano da Competência
  [2] dMesComp       - Mês da Competência
  [3] dVencInicial   - Data de Vencimento Inicial
  [4] dVencFinal     - Data de Vencimento Final
  [5] IdModulo       - Id do Módulo que está sendo executado
  [6] bSeparador     - Variável booleana do separador de linhas do relatório
  [7] bCorLinha      - Variável booleana da cor do detalhe do relatório
  [8] iCorLinha      - Variável que recebe a posição da linha do detalhe
  [9] sNomeImovel    - Nome do Imóvel Mestre }

  if ModuloImobiliario.AdminImob.bFlgLogoRelat then
     ppLogotipo.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
  else
     ppLogotipo.Picture := nil;

  Cds.Data := CtrlRelAdminImob.SelecionaRelFolhaVencimento( CmpRptCM.ParamValues[0].AsInteger,    // IdImovelMestre
                                                            CmpRptCM.ParamValues[2].AsInteger,    // dMesComp
                                                            CmpRptCM.ParamValues[1].AsInteger,    // dAnoComp
                                                            CmpRptCM.ParamValues[5].AsInteger,    // IdModulo
                                                            CmpRptCM.ParamValues[3].AsDateTime,   // dVencInicial
                                                            CmpRptCM.ParamValues[4].AsDateTime ); // dVencFinal

  bSeparador := CmpRptCM.ParamValues[6].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[7].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[8].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor,CorLinha);

  if ( CmpRptCM.ParamValues[9].AsString<>'' ) then
    lblImovelMestre.Caption := 'Imóvel Mestre: '+CmpRptCM.ParamValues[9].AsString
  else
    lblImovelMestre.Caption := 'Imóvel Mestre: <Todos>';

  if (CmpRptCM.ParamValues[3].AsDateTime>0) and (CmpRptCM.ParamValues[4].AsDateTime>0) then begin
    lblPeriodoVenc.Caption := 'Período de Vencimento de: '+DateToStr(CmpRptCM.ParamValues[3].AsDateTime)+' a '+
                                                           DateToStr(CmpRptCM.ParamValues[4].AsDateTime);
  end else begin
    if (CmpRptCM.ParamValues[3].AsDateTime>0) and (CmpRptCM.ParamValues[4].AsDateTime<=0) then
      lblPeriodoVenc.Caption := 'Período de Vencimento a partir de: '+DateToStr(CmpRptCM.ParamValues[3].AsDateTime)
    else begin
      if (CmpRptCM.ParamValues[3].AsDateTime<=0) and (CmpRptCM.ParamValues[4].AsDateTime>0) then
        lblPeriodoVenc.Caption := 'Período de Vencimento até: '+DateToStr(CmpRptCM.ParamValues[4].AsDateTime)
      else
        lblPeriodoVenc.Caption := '';
    end;
  end;

  if (CmpRptCM.ParamValues[1].AsInteger>0) and (CmpRptCM.ParamValues[2].AsInteger>0) then
    lblCompetencia.Caption := 'Competência: '+MesExtenso(CmpRptCM.ParamValues[2].AsInteger)+' de '+
                                              IntToStr(CmpRptCM.ParamValues[1].AsInteger)
  else
    lblCompetencia.Caption := 'Competência: <Todas>';

end;

procedure TdtmRelFolhaRecVencimento.ppsCorPrint(Sender: TObject);
begin
  inherited;

  if bCorLinha then begin
    if CorAtual = clWhite then
      CorAtual := CorLinha
    else
      CorAtual := clWhite;
  end else begin
    CorAtual := clWhite;
  end;

  (Sender as TppShape).Brush.Color := CorAtual;
end;

end.
