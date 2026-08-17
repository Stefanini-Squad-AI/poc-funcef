{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 24881
Responsável : Daniel Simões
Data        : 06/07/2007
Descrição   : Implementação do relatório de Resumo da Folha de Alugueis por
              Empreendimento ( Imóvel Mestre ) e Segmento ( Tipo de Imóvel ).
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit dRelFolhaRecEmpreendimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, uCtrlRelAdminImob,
  uModuloImobiliario, ppCtrls, ppRegion, ppBands, ppClass,
  ppVar, ppStrtch, ppMemo, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc,
  ppSubRpt, ppModule, raCodMod, ppParameter;

type
  TdtmRelFolhaRecEmpreendimento = class(TFrmCmReport)
    rptFolhaRecEmpreendimento: TppReport;
    ppl: TppBDEPipeline;
    cds: TCMClientDataSet;
    ds: TwwDataSource;
    CMSql: TCMSqlParams;
    cdsResumoSegmento: TCMClientDataSet;
    dsResumoSegmento: TwwDataSource;
    CMSqlRSeg: TCMSqlParams;
    pplResumoSegmento: TppBDEPipeline;
    cdsResumoSegmentoCODTIPIMOVEL: TStringField;
    cdsResumoSegmentoDESCTIPOIMOVEL: TStringField;
    cdsResumoSegmentoVLR_ALUGUEL: TFloatField;
    cdsResumoSegmentoVLR_IPTU: TFloatField;
    cdsResumoSegmentoVLR_SEGURO: TFloatField;
    cdsResumoSegmentoVLR_OUTRO: TFloatField;
    cdsResumoSegmentoVLR_TOTAL: TFloatField;
    ppParameterList1: TppParameterList;
    cdsIDIMOVELMESTRE: TFloatField;
    cdsNOME_MESTRE: TStringField;
    cdsIDCONTRATOIMOVEL: TFloatField;
    cdsCONNUMERO: TStringField;
    cdsCONNOME: TStringField;
    cdsDATAVENCIMENTO: TDateTimeField;
    cdsVLR_ALUGUEL: TFloatField;
    cdsVLR_IPTU: TFloatField;
    cdsVLR_SEGURO: TFloatField;
    cdsVLR_OUTRO: TFloatField;
    cdsVLR_TOTAL: TFloatField;
    cdsIDPESSOA: TFloatField;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppLabel148: TppLabel;
    ppLogoTipo: TppImage;
    ppLine2: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel1: TppLabel;
    ppDBandaDetalhe: TppDetailBand;
    ppsCor: TppShape;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppFooterBand1: TppFooterBand;
    lblSistema: TppLabel;
    ppLine41: TppLine;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    ppLine6: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppSResumoSegmento: TppSubReport;
    ppCResumoSegmento: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel193: TppLabel;
    ppLine46: TppLine;
    ppLine8: TppLine;
    ppDetailBand11: TppDetailBand;
    ppShapeResumoFolha: TppShape;
    ppDBText87: TppDBText;
    ppDBText8: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppRegion2: TppRegion;
    ppLabel15: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    raCodeModule1: TraCodeModule;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppRegion3: TppRegion;
    ppLabel16: TppLabel;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppLine4: TppLine;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppRegion1: TppRegion;
    ppLabel11: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBCalc1: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    raCodeModule2: TraCodeModule;
    ppLine1: TppLine;
    ppLine9: TppLine;
    ppLine3: TppLine;
    procedure FormCreate(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);

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
  dtmRelFolhaRecEmpreendimento: TdtmRelFolhaRecEmpreendimento;

implementation

uses uFuncoesImob, uSistema, dBaseDados, UComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TdtmRelFolhaRecEmpreendimento.FormCreate(Sender: TObject);
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

procedure TdtmRelFolhaRecEmpreendimento.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;

{ CmpRptCM.ParamValues - Descrição
   [0] IdImovelMestre   - ID do Imóvel Mestre
   [1] IdContratoImovel - ID do Contrato
   [2] sCodTipoImovel   - Descrição do Segmento ( Tipo de Imóvel )
   [3] dAnoComp         - Ano da Competência
   [4] dMesComp         - Mês da Competência
   [5] dVencInicial     - Data de Vencimento Inicial
   [6] dVencFinal       - Data de Vencimento Final
   [7] IdModulo         - Id do Módulo que está sendo executado
   [8] bSeparador       - Variável booleana do separador de linhas do relatório
   [9] bCorLinha        - Variável booleana da cor do detalhe do relatório
  [10] iCorLinha        - Variável que recebe a posição da linha do detalhe }

  if ModuloImobiliario.AdminImob.bFlgLogoRelat then
     ppLogotipo.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
  else
     ppLogotipo.Picture := nil;

  Cds.Data := CtrlRelAdminImob.SelecionaRelFolhaRec( CmpRptCM.ParamValues[0].AsInteger,   // IdImovelMestre
                                                     CmpRptCM.ParamValues[1].AsInteger,   // IdContratoImovel
                                                     CmpRptCM.ParamValues[4].AsInteger,   // dMesComp
                                                     CmpRptCM.ParamValues[3].AsInteger,   // dAnoComp
                                                     CmpRptCM.ParamValues[7].AsInteger,   // IdModulo
                                                     CmpRptCM.ParamValues[5].AsDateTime,  // dVencInicial
                                                     CmpRptCM.ParamValues[6].AsDateTime,  // dVencFinal
                                                     CmpRptCM.ParamValues[2].AsString );  // sCodTipoImovel

  cdsResumoSegmento.Data := CtrlRelAdminImob.SelecionaSegmento( CmpRptCM.ParamValues[0].AsInteger,   // IdImovelMestre
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
end;

procedure TdtmRelFolhaRecEmpreendimento.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelFolhaRecEmpreendimento.pplSeparadorPrint(Sender: TObject);
begin
  inherited;

  (Sender as TppLine).Visible := bSeparador;
end;

end.
