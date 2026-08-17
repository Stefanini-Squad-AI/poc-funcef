unit dRelPerdasDiario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppDB, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, ppCtrls, ppVar, ppPrnabl, ppBands, ppCache, ppStrtch,
  ppSubRpt, ppModule, raCodMod, uCtrlRelComunsImobiliario, uModuloImobiliario,
  TXRB, ppParameter;

type
  TdtmRelPerdasDiario = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppPerdasDiario: TppReport;
    CMspImovel: TCMSqlParams;
    cdsImovel: TClientDataSet;
    dsImovel: TDataSource;
    pplImovel: TppBDEPipeline;
    CMspContrato: TCMSqlParams;
    cdsContrato: TClientDataSet;
    dsContrato: TDataSource;
    pplContrato: TppBDEPipeline;
    pfldContratoppField6: TppField;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine4: TppLine;
    ppLabel8: TppLabel;
    ppLabel1: TppLabel;
    ppLabel5: TppLabel;
    ppLogoTipo: TppImage;
    plbl1: TppLabel;
    ppDetailBand1: TppDetailBand;
    pplSeparador: TppLine;
    ppsCor: TppShape;
    dbtTipoCustoRecImo: TppDBText;
    ppDBText3: TppDBText;
    ppSubReportContrato: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppLine6: TppLine;
    ppShape1: TppShape;
    dbtMestre: TppDBText;
    ppDBText6: TppDBText;
    ppDBText4: TppDBText;
    pdbtxtsITcONTR1: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine3: TppLine;
    raCodeModule1: TraCodeModule;
    ppDBText2: TppDBText;
    ppFooterBand1: TppFooterBand;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppLine5: TppLine;
    procedure ppSubReportContratoPrint(Sender: TObject);
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
  dtmRelPerdasDiario: TdtmRelPerdasDiario;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}


procedure TdtmRelPerdasDiario.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor, iIdPerdas : Integer;
begin
  inherited;
  // Carrega o Logotipo - Marcio Motta - 08/08/2004

  if ModuloImobiliario.AdminImob.bFlgLogoRelat then
     ppLogotipo.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
  else
     ppLogotipo.Picture := nil;

  if Sistema.IdModulo = 135 then
       iIdPerdas := ModuloImobiliario.Alienacao.iTipoOperProvPerdas
  else iIdPerdas := ModuloImobiliario.Adminimob.iTipoOperProvPerdas;

  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelComunsImobiliario := TCtrlRelComunsImobiliario.Create;
  CtrlRelComunsImobiliario.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                      ComunsImobiliario.MensErroMT);

  cds.Data := CtrlRelComunsImobiliario.SelecionaProvPerdaTipoImo(Sistema.IdModulo,
                                                                 iIdPerdas,
                                                                 CmpRptCM.ParamValues[0].AsDateTime,   // dDataIni
                                                                 CmpRptCM.ParamValues[1].AsDateTime,   // dDataFim
                                                                 CmpRptCM.ParamValues[2].AsString,
                                                                 CmpRptCM.ParamValues[3].AsString);    // sTipoImovel

  cdsContrato.Data := CtrlRelComunsImobiliario.SelecionaProvPerdaContrato(Sistema.IdModulo,
                                                                          iIdPerdas,
                                                                          CmpRptCM.ParamValues[0].AsDateTime,   // dDataIni
                                                                          CmpRptCM.ParamValues[1].AsDateTime,   // dDataFim
                                                                          CmpRptCM.ParamValues[2].AsString,     // sTipoImovel
                                                                          CmpRptCM.ParamValues[3].AsString);    // sSitContratual
end;


procedure TdtmRelPerdasDiario.ppSubReportContratoPrint(Sender: TObject);
begin
  // Define Filtro do imovel mestre
  cdsContrato.Filtered := False;
  cdsContrato.Filter   := 'CODTIPIMOVEL = ' + QuotedStr(cds.FieldByName('CODTIPIMOVEL').AsString) +
                          ' AND DATAOPER  = ' + QuotedStr(cds.FieldByName('DATAOPER').AsString);
  cdsContrato.Filtered := True;
  inherited;
end;

procedure TdtmRelPerdasDiario.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlRelComunsImobiliario );
  inherited;
end;

procedure TdtmRelPerdasDiario.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelPerdasDiario.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

end.
