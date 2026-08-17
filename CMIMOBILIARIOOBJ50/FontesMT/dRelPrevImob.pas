unit dRelPrevImob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppDB, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, ppCtrls, ppVar, ppPrnabl, ppBands, ppCache, ppStrtch,
  ppSubRpt, ppModule, raCodMod, uCtrlRelComunsImobiliario, uModuloImobiliario,
  TXRB;

type
  TdtmRelPrevImob = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppPrevImob: TppReport;
    CMspImovel: TCMSqlParams;
    cdsImovel: TClientDataSet;
    dsImovel: TDataSource;
    pplImovel: TppBDEPipeline;
    CMspMestre: TCMSqlParams;
    cdsMestre: TClientDataSet;
    dsMestre: TDataSource;
    pplMestre: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine4: TppLine;
    ppLabel8: TppLabel;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppDBText7: TppDBText;
    ppLabel5: TppLabel;
    ppDetailBand1: TppDetailBand;
    pplSeparador: TppLine;
    ppsCor: TppShape;
    dbtTipoCustoRecImo: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppSubReportMestre: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppLine6: TppLine;
    ppShape1: TppShape;
    dbtMestre: TppDBText;
    ppDBText6: TppDBText;
    ppSubReportImovel: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppLine7: TppLine;
    ppShape2: TppShape;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppLine5: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLine3: TppLine;
    lblAnual: TppLabel;
    ppFooterBand1: TppFooterBand;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLogoTipo: TppImage;
    procedure ppSubReportMestrePrint(Sender: TObject);
    procedure ppSubReportImovelPrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelComunsImobiliario : TCtrlRelComunsImobiliario;
    bSeparador, bCorLinha    : boolean;
    CorLinha, CorAtual       : TColor;
  public
    { Public declarations }
  end;

var
  dtmRelPrevImob: TdtmRelPrevImob;

implementation

uses dBaseDados, uSistema, uMensErro, uVerificaPreenchimento, uComunsImobiliario;

{$R *.DFM}


procedure TdtmRelPrevImob.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Carrega o Logotipo - Marcio Motta - 08/08/2004
  if ModuloImobiliario.AdminImob.bFlgLogoRelat then
     ppLogotipo.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
  else
     ppLogotipo.Picture := nil;

  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelComunsImobiliario := TCtrlRelComunsImobiliario.Create;
  CtrlRelComunsImobiliario.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                      ComunsImobiliario.MensErroMT);

  cds.Data := CtrlRelComunsImobiliario.SelecionaRelPrevImob(Sistema.IdModulo,
                                 CmpRptCM.ParamValues[0].AsInteger,    // iMes
                                 CmpRptCM.ParamValues[1].AsInteger,    // iAno
                                 CmpRptCM.ParamValues[2].AsInteger,    // iTipoCustoRecImo
                                 CmpRptCM.ParamValues[3].AsString,     // sTipoImovel
                                 CmpRptCM.ParamValues[4].AsInteger);   // iOrdem

  cdsMestre.Data := CtrlRelComunsImobiliario.SelecionaRelPrevImobMes(
                                 CmpRptCM.ParamValues[0].AsInteger,    // iMes
                                 CmpRptCM.ParamValues[1].AsInteger,    // iAno
                                 CmpRptCM.ParamValues[2].AsInteger,    // iTipoCustoRecImo
                                 CmpRptCM.ParamValues[3].AsString);    // sTipoImovel

  cdsImovel.Data := CtrlRelComunsImobiliario.SelecionaRelPrevImobImo(
                                 CmpRptCM.ParamValues[0].AsInteger,    // iMes
                                 CmpRptCM.ParamValues[1].AsInteger,    // iAno
                                 CmpRptCM.ParamValues[2].AsInteger,    // iTipoCustoRecImo
                                 CmpRptCM.ParamValues[3].AsString);    // sTipoImovel

  // Expande Arvore
  if (CmpRptCM.ParamValues[5].AsBoolean) or (CmpRptCM.ParamValues[6].AsBoolean) then
    ppSubReportMestre.ExpandAll := True;
  if CmpRptCM.ParamValues[6].AsBoolean then
    ppSubReportImovel.ExpandAll := True;

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[7].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[8].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[9].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;


procedure TdtmRelPrevImob.ppSubReportMestrePrint(Sender: TObject);
begin
  // Define Filtro do imovel mestre
  cdsMestre.Filtered := False;
  cdsMestre.Filter   := 'CODTIPIMOVEL = ' + QuotedStr(cds.FieldByName('CODTIPIMOVEL').AsString) +
                        ' AND IDTIPOCUSTORECIMO = ' + IntToStr(cds.FieldByName('IDTIPOCUSTORECIMO').AsInteger) +
                        ' AND FLGAJUSTEANUAL = ' + QuotedStr(cds.FieldByName('FLGAJUSTEANUAL').AsString);
  cdsMestre.Filtered := True;
  inherited;
end;

procedure TdtmRelPrevImob.ppSubReportImovelPrint(Sender: TObject);
begin
  // Define Filtro do imóvel
  cdsImovel.Filtered := False;
  cdsImovel.Filter   := 'CODTIPIMOVEL = ' + QuotedStr(cdsMestre.FieldByName('CODTIPIMOVEL').AsString) +
                        ' AND IDTIPOCUSTORECIMO = ' + IntToStr(cdsMestre.FieldByName('IDTIPOCUSTORECIMO').AsInteger) +
                        ' AND IDIMOVELMESTRE = ' + IntToStr(cdsMestre.FieldByName('IDMESTRE').AsInteger);
  cdsImovel.Filtered := True;
  inherited;
end;

procedure TdtmRelPrevImob.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlRelComunsImobiliario );
  inherited;
end;

procedure TdtmRelPrevImob.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelPrevImob.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

end.
