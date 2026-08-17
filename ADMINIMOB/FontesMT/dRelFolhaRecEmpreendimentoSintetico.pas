{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 24880
Responsável : Daniel Simões
Data        : 30/07/2007
Descrição   : Implementação do relatório de Folha de Receitas por Empreendimento
              ( Sintética )
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit dRelFolhaRecEmpreendimentoSintetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, uCtrlRelAdminImob,
  uModuloImobiliario, ppCtrls, ppRegion, ppBands, ppClass, ppVar, ppStrtch,
  ppMemo, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, uCmSqlParams,
  Db, DBClient, uCMClientDataSet, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc, ppSubRpt,
  ppModule, raCodMod, ppParameter;

type
  TdtmRelFolhaRecEmpreendimentoSintetico = class(TFrmCmReport)
    ppl: TppBDEPipeline;
    cds: TCMClientDataSet;
    ds: TwwDataSource;
    CMSql: TCMSqlParams;
    rptFolhaRecEmpreendimentoSint: TppReport;
    ppParameterList1: TppParameterList;
    cdsCODTIPIMOVEL: TStringField;
    cdsIDIMOVELMESTRE: TFloatField;
    cdsNOME_MESTRE: TStringField;
    cdsQTDE: TFloatField;
    cdsIDPESSOA: TFloatField;
    cdsDESCTIPOIMOVEL: TStringField;
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
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppLabel148: TppLabel;
    ppLogoTipo: TppImage;
    ppLine2: TppLine;
    lblPeriodoVenc: TppLabel;
    lblCompetencia: TppLabel;
    ppLabel4: TppLabel;
    ppLabel2: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel1: TppLabel;
    ppLabel13: TppLabel;
    ppLabel3: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLabel9: TppLabel;
    ppLine4: TppLine;
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
    ppRegion2: TppRegion;
    ppLabel14: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppVariable1: TppVariable;
    ppVariable2: TppVariable;
    ppDBCalc16: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText13: TppDBText;
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
    ppDBCalc5: TppDBCalc;
    ppLine1: TppLine;
    raCodeModule1: TraCodeModule;
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
  dtmRelFolhaRecEmpreendimentoSintetico: TdtmRelFolhaRecEmpreendimentoSintetico;

implementation

uses uFuncoesImob, uSistema, dBaseDados, UComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TdtmRelFolhaRecEmpreendimentoSintetico.FormCreate(Sender:TObject);
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

procedure TdtmRelFolhaRecEmpreendimentoSintetico.CrmRptCMBeforePrint(Sender:TObject);
var iPosCor : Integer;
begin
  inherited;

{ CmpRptCM.ParamValues  - Descrição
   [0] IdImovelMestre   - ID do Imóvel Mestre
   [1] IdContratoImovel - ID do Contrato
   [2] sCodTipoImovel   - Código do Tipo de Imóvel
   [3] dAnoComp         - Ano da Competência
   [4] dMesComp         - Mês da Competência
   [5] dVencInicial     - Data de Vencimento Inicial
   [6] dVencFinal       - Data de Vencimento Final
   [7] IdModulo         - Id do Módulo que está sendo executado
   [8] bSeparador       - Variável booleana do separador de linhas do relatório
   [9] bCorLinha        - Variável booleana da cor do detalhe do relatório
  [10] iCorLinha        - Variável que recebe a posição da linha do detalhe
  [11] sNomeImovel      - Nome do Imóvel Mestre
  [12] sDescTipoImovel  - Descrição do Tipo de Imóvel }

  if ModuloImobiliario.AdminImob.bFlgLogoRelat then
     ppLogotipo.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
  else
     ppLogotipo.Picture := nil;

  Cds.Data := CtrlRelAdminImob.SelecionaRelFolhaRecSint( CmpRptCM.ParamValues[0].AsInteger,   // IdImovelMestre
                                                         CmpRptCM.ParamValues[1].AsInteger,   // IdContratoImovel
                                                         CmpRptCM.ParamValues[4].AsInteger,   // dMesComp
                                                         CmpRptCM.ParamValues[3].AsInteger,   // dAnoComp
                                                         CmpRptCM.ParamValues[7].AsInteger,   // IdModulo
                                                         CmpRptCM.ParamValues[5].AsDateTime,  // dVencInicial
                                                         CmpRptCM.ParamValues[6].AsDateTime,  // dVencFinal
                                                         CmpRptCM.ParamValues[2].AsString );  // sCodTipoImovel

  bSeparador := CmpRptCM.ParamValues[8].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[9].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[10].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor,CorLinha);

  if (CmpRptCM.ParamValues[5].AsDateTime>0) and (CmpRptCM.ParamValues[6].AsDateTime>0) then begin
    lblPeriodoVenc.Caption := 'Período de Vencimento de: '+DateToStr(CmpRptCM.ParamValues[5].AsDateTime)+' a '+
                                                           DateToStr(CmpRptCM.ParamValues[6].AsDateTime);
  end else begin
    if (CmpRptCM.ParamValues[5].AsDateTime>0) and (CmpRptCM.ParamValues[6].AsDateTime<=0) then
      lblPeriodoVenc.Caption := 'Período de Vencimento a partir de: '+DateToStr(CmpRptCM.ParamValues[5].AsDateTime)
    else begin
      if (CmpRptCM.ParamValues[5].AsDateTime<=0) and (CmpRptCM.ParamValues[6].AsDateTime>0) then
        lblPeriodoVenc.Caption := 'Período de Vencimento até: '+DateToStr(CmpRptCM.ParamValues[6].AsDateTime)
      else
        lblPeriodoVenc.Caption := '';
    end;
  end;

  if (CmpRptCM.ParamValues[3].AsInteger>0) and (CmpRptCM.ParamValues[4].AsInteger>0) then
    lblCompetencia.Caption := 'Competência: '+MesExtenso(CmpRptCM.ParamValues[4].AsInteger)+' de '+
                                              IntToStr(CmpRptCM.ParamValues[3].AsInteger)
  else
    lblCompetencia.Caption := 'Competência: <Todas>';

end;

procedure TdtmRelFolhaRecEmpreendimentoSintetico.ppsCorPrint(Sender: TObject);
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
