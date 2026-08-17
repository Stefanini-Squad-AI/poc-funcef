unit dRelPerformance;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppCtrls, ppBands, ppVar, ppPrnabl, ppCache, uCtrlRelIndicadores,
  ExtCtrls, ppModule, raCodMod, TXRB;

type
  TdtmRelPerformance = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppPerformance: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppDetailBand1: TppDetailBand;
    pplSeparador: TppLine;
    ppsCor: TppShape;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppVar: TppVariable;
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
    ppLabel4: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel5: TppLabel;
    ppLine3: TppLine;
    ppLabel11: TppLabel;
    ppLine4: TppLine;
    ppLabel16: TppLabel;
    ppDBText9: TppDBText;
    ppLine6: TppLine;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelIndicadores    : TCtrlRelIndicadores;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;
  public
    { Public declarations }
  end;

var
  dtmRelPerformance: TdtmRelPerformance;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento, uModuloIndicadores;

{$R *.DFM}

procedure TdtmRelPerformance.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor :Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelIndicadores := TCtrlRelIndicadores.Create;
  CtrlRelIndicadores.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  // Carrega dados no Cds
  cds.Data := CtrlRelIndicadores.BuscaRelPerformance(
                                   CmpRptCM.ParamValues[0].AsInteger,    // idImovel
                                   CmpRptCM.ParamValues[1].AsInteger,    // Mes de Inicio
                                   CmpRptCM.ParamValues[2].AsInteger,    // Ano de Inicio
                                   CmpRptCM.ParamValues[3].AsInteger,    // Mes de Termino
                                   CmpRptCM.ParamValues[4].AsInteger,    // Ano de Termino
                                   ModuloIndicadores.iIdIndABL,
                                   ModuloIndicadores.iIdIndVenda,
                                   ModuloIndicadores.iIdIndAluguel,
                                   ModuloIndicadores.iIdIndOverage,
                                   ModuloIndicadores.iMoeCodigoUPV);

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[5].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[6].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[7].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;

procedure TdtmRelPerformance.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlRelIndicadores);
end;


procedure TdtmRelPerformance.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

procedure TdtmRelPerformance.ppsCorPrint(Sender: TObject);
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

end.
