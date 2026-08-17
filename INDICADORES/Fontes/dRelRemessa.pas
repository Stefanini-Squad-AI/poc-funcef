unit dRelRemessa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppCtrls, ppVar, ppPrnabl, ppBands, ppCache, ppModule,
  raCodMod, ppStrtch, ppCTMain, uCtrlRelIndicadores, TXRB;

type
  TdtmRelRemessa = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppRemessa: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppDetailBand1: TppDetailBand;
    pplSeparador: TppLine;
    ppsCor: TppShape;
    dbtIndicador: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText4: TppDBText;
    ppOrcamentoLine1: TppLine;
    ppOrcamentoLine2: TppLine;
    ppLabel1: TppLabel;
    ppOrcamentoLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText18: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel5: TppLabel;
    vTotLiquido: TppVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppLine2: TppLine;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    vTotGValor: TppVariable;
    vTotGPrev: TppVariable;
    fTotPerc: TppVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppShape1: TppShape;
    dbtPrevisao: TppDBText;
    vTotValor: TppVariable;
    ppLine1: TppLine;
    fPerc: TppVariable;
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
  dtmRelRemessa: TdtmRelRemessa;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TdtmRelRemessa.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelIndicadores := TCtrlRelIndicadores.Create;
  CtrlRelIndicadores.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  cds.Data := CtrlRelIndicadores.BuscaRelRemessa(3471,                    // idReport no SAD
                                    CmpRptCM.ParamValues[0].AsInteger,    // idImovel
                                    CmpRptCM.ParamValues[1].AsInteger,    // Mes Referencia
                                    CmpRptCM.ParamValues[2].AsInteger);   // Ano Referencia

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[3].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[4].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[5].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;

procedure TdtmRelRemessa.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlRelIndicadores);
end;

procedure TdtmRelRemessa.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelRemessa.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

end.
