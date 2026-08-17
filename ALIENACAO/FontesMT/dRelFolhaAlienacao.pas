unit dRelFolhaAlienacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppBands, ppCache, ppPrnabl, ppCtrls, ppVar, myChkBox,
  uCtrlRelAlienacao, TXRB;

type
  TdtmRelFolhaAlienacao = class(TFrmCmReportImob)
    rptFolhaAlienacao: TppReport;
    ppl: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppDBText4: TppDBText;
    ppLine5: TppLine;
    ppLabel8: TppLabel;
    ppsCor: TppShape;
    pplSeparador: TppLine;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppLine2: TppLine;
    ppLabel1: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel4: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel5: TppLabel;
    ppDBText10: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel6: TppLabel;
    ppDBText11: TppDBText;
    ppLine6: TppLine;
    ppLabel7: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLabel15: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppLine7: TppLine;
    ppLabel16: TppLabel;
    ppDBText12: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelAlienacao : TCtrlRelAlienacao;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;
  public
    { Public declarations }
  end;

var dtmRelFolhaAlienacao: TdtmRelFolhaAlienacao;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TdtmRelFolhaAlienacao.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelAlienacao := TCtrlRelAlienacao.Create;
  CtrlRelAlienacao.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                              ComunsImobiliario.MensErroMT);

  cds.Data := CtrlRelAlienacao.SelecionaRelFolhaAlienacao(
                                  CmpRptCM.ParamValues[0].AsInteger,    // Mes
                                  CmpRptCM.ParamValues[1].AsInteger,    // Ano
                                  CmpRptCM.ParamValues[2].AsInteger,    // id Responsavel
                                  CmpRptCM.ParamValues[3].AsInteger,
                                  CmpRptCM.ParamValues[7].AsBoolean,
                                  CmpRptCM.ParamValues[8].AsBoolean);

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[4].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[5].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[6].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;

procedure TdtmRelFolhaAlienacao.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelFolhaAlienacao.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

end.
