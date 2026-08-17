unit dRelHistoricoContratual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppVar, ppCtrls, ppPrnabl, ppBands, ppCache, ppStrtch,
  ppRegion, uModuloImobiliario, uCtrlRelAdminImob;

type
  TdtmRelHistoricoContratual = class(TFrmCmReportImob)
    ppHistotico: TppBDEPipeline;
    rptHistorico: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLogoTipo: TppImage;
    lblEmpresa: TppLabel;
    ppLabel148: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBText11: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppRegion1: TppRegion;
    ppLabel12: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc1: TppDBCalc;
    ppRegion2: TppRegion;
    ppLabel13: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppRegion3: TppRegion;
    ppLabel14: TppLabel;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppLine2: TppLine;
    ppShape1: TppShape;
    ppLine3: TppLine;
    ppDBText12: TppDBText;
    ppLabel15: TppLabel;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLabel16: TppLabel;
    ppLine6: TppLine;
    ppDBText13: TppDBText;
    ppLabel17: TppLabel;
    lblSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine7: TppLine;
    ppLabel18: TppLabel;
    ppDBText14: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    CtrlRelAdminImob : TCtrlRelAdminImob;
    procedure ConvertePlanoEconomico;
  public

  end;

var
  dtmRelHistoricoContratual: TdtmRelHistoricoContratual;

implementation

uses
  uFuncoesImob, uSistema, dBaseDados, cRelExtrato, UComunsImobiliario,
  uVerificaPreenchimento;


{$R *.DFM}

{ TdtmRelHistoricoContratual }


procedure TdtmRelHistoricoContratual.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRelAdminImob := TCtrlRelAdminImob.Create;
  CtrlRelAdminImob.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                            ComunsImobiliario.MensErroMT);
end;

procedure TdtmRelHistoricoContratual.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlRelAdminImob);
end;

procedure TdtmRelHistoricoContratual.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  // Carrega o Logotipo - Marcio Motta - 30/07/2004
  if ModuloImobiliario.AdminImob.bFlgLogoRelat then
     ppLogotipo.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
  else
     ppLogotipo.Picture := nil;

  cds.Data := CtrlRelAdminImob.SelecionaHistorico(Sistema.IdEmpresa,
                                      CmpRptCM.ParamValues[0].AsInteger,   // idImovelMestre
                                      CmpRptCM.ParamValues[1].AsInteger,   // idContrato
                                      CmpRptCM.ParamValues[5].AsInteger,   // idLocatario
                                      CmpRptCM.ParamValues[2].AsInteger,   // iAnoInicial
                                      CmpRptCM.ParamValues[3].AsInteger,   // iAnoFinal
                                      CmpRptCM.ParamValues[4].AsBoolean);  // Receita sem Contrato

  if CmpRptCM.ParamByName('bConverte').AsBoolean = True then ConvertePlanoEconomico;
end;

procedure TdtmRelHistoricoContratual.ConvertePlanoEconomico;
var fVlrReceb, fVlrPago, fVlrJuros, fVlrMulta, fVlrCorr, fVlrOutro : Extended;
begin
   cds.First;
   while not cds.Eof do begin
      fVlrReceb := ComunsImobiliario.ConvPlanoEconomico(cds.FieldByName('DATALANCTO').AsDateTime,
                                                        cds.FieldByName('VLRRECEB').AsFloat);
      fVlrPago  := ComunsImobiliario.ConvPlanoEconomico(cds.FieldByName('DATALANCTO').AsDateTime,
                                                        cds.FieldByName('VLRPAGO').AsFloat);
      fVlrMulta := ComunsImobiliario.ConvPlanoEconomico(cds.FieldByName('DATALANCTO').AsDateTime,
                                                        cds.FieldByName('MULTA').AsFloat);
      fVlrJuros := ComunsImobiliario.ConvPlanoEconomico(cds.FieldByName('DATALANCTO').AsDateTime,
                                                        cds.FieldByName('JUROS').AsFloat);
      fVlrCorr  := ComunsImobiliario.ConvPlanoEconomico(cds.FieldByName('DATALANCTO').AsDateTime,
                                                        cds.FieldByName('CORRECAO').AsFloat);
      fVlrOutro := ComunsImobiliario.ConvPlanoEconomico(cds.FieldByName('DATALANCTO').AsDateTime,
                                                        cds.FieldByName('OUTROS').AsFloat);

      cds.Edit;
      if fVlrReceb <> cds.FieldByName('VLRRECEB').AsFloat then
         cds.FieldByName('VLRRECEB').AsFloat := fVlrReceb;
      if fVlrPago <> cds.FieldByName('VLRPAGO').AsFloat then
         cds.FieldByName('VLRPAGO').AsFloat := fVlrPago;
      if fVlrMulta <> cds.FieldByName('MULTA').AsFloat then
         cds.FieldByName('MULTA').AsFloat := fVlrMulta;
      if fVlrJuros <> cds.FieldByName('JUROS').AsFloat then
         cds.FieldByName('JUROS').AsFloat := fVlrJuros;
      if fVlrCorr <> cds.FieldByName('CORRECAO').AsFloat then
         cds.FieldByName('CORRECAO').AsFloat := fVlrCorr;
      if fVlrOutro <> cds.FieldByName('OUTROS').AsFloat then
         cds.FieldByName('OUTROS').AsFloat := fVlrOutro;
      cds.Post;

      cds.Next;
   end;
end;


end.
