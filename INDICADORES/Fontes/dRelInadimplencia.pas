unit dRelInadimplencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppPrnabl, ppCtrls, ppBands, ppCache, ppVar, ppModule,
  raCodMod, uCtrlRelIndicadores, TXRB;

type
  TdtmRelInadimplencia = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppInadimplencia: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppDetailBand1: TppDetailBand;
    pplSeparador: TppLine;
    ppsCor: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    vTotDet: TppVariable;
    ppDBText10: TppDBText;
    ppFooterBand1: TppFooterBand;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText4: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText11: TppDBText;
    ppOrcamentoLine1: TppLine;
    ppOrcamentoLine2: TppLine;
    ppLabel1: TppLabel;
    ppOrcamentoLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel21: TppLabel;
    ppDBText18: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel10: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    dbcTotAlug: TppDBCalc;
    dbcTotEnc: TppDBCalc;
    dbcTotFund: TppDBCalc;
    dbcTotLuv: TppDBCalc;
    vTotShop: TppVariable;
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
  dtmRelInadimplencia: TdtmRelInadimplencia;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento, uModuloIndicadores;

{$R *.DFM}

procedure TdtmRelInadimplencia.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelIndicadores := TCtrlRelIndicadores.Create;
  CtrlRelIndicadores.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  // Carrega dados no Cds
  cds.Data := CtrlRelIndicadores.BuscaRelInadimplencia(3465,             // ID report no SAD
                                   CmpRptCM.ParamValues[0].AsInteger,    // idImovel
                                   CmpRptCM.ParamValues[3].AsInteger,    // idGrpApuracao
                                   CmpRptCM.ParamValues[1].AsInteger,    // Mes Competencia
                                   CmpRptCM.ParamValues[2].AsInteger,    // Ano Competencia
                                   ModuloIndicadores.iIdIndNDMeses,
                                   ModuloIndicadores.iIdIndNDAluguel,
                                   ModuloIndicadores.iIdIndNDEncargos,
                                   ModuloIndicadores.iIdIndNDFundo,
                                   ModuloIndicadores.iIdIndNDLuva,
                                   ModuloIndicadores.iIdIndNDTpProvidencia,
                                   ModuloIndicadores.iIdIndNDDtProvidencia);

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[4].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[5].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[6].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;

procedure TdtmRelInadimplencia.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlRelIndicadores);
  inherited;
end;

procedure TdtmRelInadimplencia.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelInadimplencia.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

end.
