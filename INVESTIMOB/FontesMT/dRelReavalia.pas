unit dRelReavalia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppDB, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, ppModule, raCodMod, ppCtrls, ppBands, ppVar, ppPrnabl,
  ppCache, uCtrlRelInvestimob, ppSubRpt, ppStrtch, ppRegion;

type
  TdtmRelReavalia = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppReavalia: TppReport;
    cdsIDIMOVELMESTRE: TFloatField;
    cdsIDIMOVEL: TFloatField;
    cdsNOME_MESTRE: TStringField;
    cdsNOME_IMOVEL: TStringField;
    cdsCODTIPIMOVEL: TStringField;
    cdsDESCTIPOIMOVEL: TStringField;
    cdsIMOCODIGO: TStringField;
    cdsTIPO_BEM: TStringField;
    cdsVIDAUTIL: TFloatField;
    cdsDATA_ULT_REAVAL: TDateTimeField;
    cdsVLR_ULT_REAVAL: TFloatField;
    cdsVLR_ULT_ANTERIOR: TFloatField;
    cdsVLR_VAR_SALDO: TFloatField;
    cdsDATA_PEN_REAVAL: TDateTimeField;
    cdsVLR_PEN_REAVAL: TFloatField;
    cdsVLR_VAR_REAV: TFloatField;
    CDSNaoReavalia: TClientDataSet;
    DSNaoReavalia: TDataSource;
    ppBDNaoReavalia: TppBDEPipeline;
    CDSNaoReavaliaIDIMOVEL: TFloatField;
    CDSNaoReavaliaIMOCODIGO: TStringField;
    CDSNaoReavaliaDSC_IMOVEL: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppLine5: TppLine;
    ppLine3: TppLine;
    lblEmpresa: TppLabel;
    lblTitulo: TppLabel;
    ppOrcamentoLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel5: TppLabel;
    ppLine4: TppLine;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel10: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDetailBand1: TppDetailBand;
    pplSeparador: TppLine;
    ppsCor: TppShape;
    ppNomeImovel: TppDBText;
    ppVlrPenReaval: TppDBText;
    ppImoCodigo: TppDBText;
    ppTipoBem: TppDBText;
    ppDataPenReaval: TppDBText;
    ppVidaUtil: TppDBText;
    ppDBText8: TppDBText;
    ppDataUltReaval: TppDBText;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppRegion2: TppRegion;
    ppLabel21: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppSubNaoReavalia: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLine2: TppLine;
    ppLabelTitulo: TppLabel;
    ppLine6: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppLabel20: TppLabel;
    ppDBCalc11: TppDBCalc;
    ppLine7: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppLabel19: TppLabel;
    gfbMestre: TppGroupFooterBand;
    ppRegion1: TppRegion;
    ppLabel4: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText9: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel18: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel17: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppShape1: TppShape;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelInvestimob     : TCtrlRelInvestimob;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;

  public
    { Public declarations }
  end;

var
  dtmRelReavalia: TdtmRelReavalia;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento,
     uModuloImobiliario;

{$R *.DFM}

procedure TdtmRelReavalia.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelInvestimob := TCtrlRelInvestimob.Create;
  CtrlRelInvestimob.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                               ComunsImobiliario.MensErroMT);

  // Carrega dados no Cds do Relatório principal
  cds.Data := CtrlRelInvestimob.BuscaRelReavalia(CmpRptCM.ParamValues[6].AsDateTime,
                                                 ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                                 ModuloImobiliario.InvestImob.iIdPaisCAF,
                                                 CmpRptCM.ParamValues[0].AsInteger,  // idMestre
                                                 CmpRptCM.ParamValues[1].AsString);  // CodTipoImovel
  // Carrega dados no Cds do Sub Relatório
  If CmpRptCM.ParamByName('iAno').AsInteger > 0 then
   begin
    ppSubNaoReavalia.Visible := True;
    ppLabelTitulo.Caption    := 'Imóveis não reavaliados em: ' + CmpRptCM.ParamByName('iAno').AsString;
    CDSNaoReavalia.Data      := CtrlRelInvestimob.BucaRelNaoReavalia(CmpRptCM.ParamByName('iAno').AsInteger)
   end
  else
    ppSubNaoReavalia.Visible := False;

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[2].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[3].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[4].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;

procedure TdtmRelReavalia.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlRelInvestimob );
  inherited;
end;

procedure TdtmRelReavalia.ppsCorPrint(Sender: TObject);
begin
  inherited;
  if bCorLinha then begin
     if CorAtual = clWhite then begin
        CorAtual := CorLinha;
     end else begin
        CorAtual := clWhite;
     end;
  end else begin
     CorAtual := clWhite;
  end;
  (Sender as TppShape).Brush.Color := CorAtual;
end;

procedure TdtmRelReavalia.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

end.

