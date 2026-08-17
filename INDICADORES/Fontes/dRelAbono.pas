unit dRelAbono;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppCtrls, ppVar, ppPrnabl, ppCache, ppModule,
  raCodMod, uCtrlRelIndicadores, TXRB;

type
  TdtmRelAbono = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppAbono: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    vTotDev: TppVariable;
    vTotAbono: TppVariable;
    vPerda: TppVariable;
    ppFooterBand1: TppFooterBand;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText4: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine3: TppLine;
    ppLabel14: TppLabel;
    ppLine4: TppLine;
    dbcFaturadoG: TppDBCalc;
    dbcCMG: TppDBCalc;
    dbcMultaG: TppDBCalc;
    dbcPagoG: TppDBCalc;
    vTotGeralDev: TppVariable;
    vTotGeralAbono: TppVariable;
    vPerdaGeral: TppVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppOrcamentoLine1: TppLine;
    ppOrcamentoLine2: TppLine;
    ppLabel1: TppLabel;
    ppOrcamentoLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText1: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel21: TppLabel;
    ppDBText18: TppDBText;
    ppDBText13: TppDBText;
    ppLabel15: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine1: TppLine;
    ppLabel12: TppLabel;
    ppLine2: TppLine;
    dbcFaturado: TppDBCalc;
    dbcCM: TppDBCalc;
    dbcMulta: TppDBCalc;
    dbcPago: TppDBCalc;
    vTotGrpDev: TppVariable;
    vTotGrpAbono: TppVariable;
    vPerdaGrp: TppVariable;
    ppsCor: TppShape;
    pplSeparador: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelIndicadores : TCtrlRelIndicadores;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;
  public
    { Public declarations }
  end;

var
  dtmRelAbono: TdtmRelAbono;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento, uModuloIndicadores;

{$R *.DFM}

procedure TdtmRelAbono.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelIndicadores := TCtrlRelIndicadores.Create;
  CtrlRelIndicadores.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  cds.Data := CtrlRelIndicadores.BuscaRelAbono(3469,                      // idReport no SAD
                                    CmpRptCM.ParamValues[0].AsInteger,    // idImovel
                                    CmpRptCM.ParamValues[1].AsInteger,    // idGrpApuracao
                                    ModuloIndicadores.iIdIndAbDtVencto,
                                    ModuloIndicadores.iIdIndAbDtPagto,
                                    ModuloIndicadores.iIdIndAbVlrFaturado,
                                    ModuloIndicadores.iIdIndAbVlrCM,
                                    ModuloIndicadores.iIdIndAbVlrJuros,
                                    ModuloIndicadores.iIdIndAbVlrPagto,
                                    CmpRptCM.ParamValues[2].AsDateTime,   // Data Inicio
                                    CmpRptCM.ParamValues[3].AsDateTime);  // Data Fim

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[4].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[5].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[6].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;

procedure TdtmRelAbono.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlRelIndicadores);
  inherited;
end;

procedure TdtmRelAbono.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

procedure TdtmRelAbono.ppsCorPrint(Sender: TObject);
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
