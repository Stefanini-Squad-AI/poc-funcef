unit dRelVendaLoja;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppCtrls, ppVar, ppPrnabl, ppBands, ppCache, ppModule,
  raCodMod, uCtrlRelIndicadores;

type
  TdtmRelVendaLoja = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppVendaLoja: TppReport;
    CMspLojasVagas: TCMSqlParams;
    cdsLojasVagas: TClientDataSet;
    dsLojasVagas: TDataSource;
    pplLojasVagas: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    vTotAlug: TppVariable;
    ppDBText9: TppDBText;
    ppDBText14: TppDBText;
    vTotUPV: TppVariable;
    vPerVenda: TppVariable;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLine5: TppLine;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel5: TppLabel;
    ppLine6: TppLine;
    ppLabel11: TppLabel;
    ppLabel18: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppDBText18: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    lblTxtCota: TppLabel;
    ppLabel16: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppDBCalc1: TppDBCalc;
    vcTotVenda: TppDBCalc;
    cvTotMin: TppDBCalc;
    cvTotOver: TppDBCalc;
    vTotGAlug: TppVariable;
    ppLabel17: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel19: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    vGUPVm2: TppVariable;
    vTotGUPVm2: TppVariable;
    ppsCor: TppShape;
    pplSeparador: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelIndicadores    : TCtrlRelIndicadores;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;
  public
    { Public declarations }
  end;

var
  dtmRelVendaLoja: TdtmRelVendaLoja;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento, uModuloIndicadores;

{$R *.DFM}

procedure TdtmRelVendaLoja.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelIndicadores := TCtrlRelIndicadores.Create;
  CtrlRelIndicadores.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  // Carrega dados no Cds
  cds.Data := CtrlRelIndicadores.BuscaRelVendaLoja(
                                   CmpRptCM.ParamValues[0].AsInteger,    // idImovel
                                   ModuloIndicadores.iIdIndVenda,
                                   ModuloIndicadores.iIdIndOverage,
                                   ModuloIndicadores.iIdIndAluguel,
                                   ModuloIndicadores.iIdIndABL,
                                   ModuloIndicadores.iMoeCodigoUPV,
                                   CmpRptCM.ParamValues[1].AsInteger,    // Mes Competencia
                                   CmpRptCM.ParamValues[2].AsInteger);   // Ano Competencia

  cdsLojasVagas.Data := CtrlRelIndicadores.BuscaLojasVagas(
                                   CmpRptCM.ParamValues[0].AsInteger,    // idImovel
                                   CmpRptCM.ParamValues[1].AsInteger,    // Mes Competencia
                                   CmpRptCM.ParamValues[2].AsInteger);   // Ano Competencia

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[3].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[4].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[5].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;

procedure TdtmRelVendaLoja.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlRelIndicadores);
  inherited;
end;

procedure TdtmRelVendaLoja.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelVendaLoja.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

end.
