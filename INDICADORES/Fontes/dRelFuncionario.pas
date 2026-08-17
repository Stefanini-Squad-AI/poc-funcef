unit dRelFuncionario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, ppDB, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppBands, ppCtrls, ppPrnabl, ppCache, ppVar, uCtrlRelIndicadores,
  TXRB;

type
  TdtmRelFuncionario = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppFuncionario: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppOrcamentoLine1: TppLine;
    ppOrcamentoLabel2: TppLabel;
    ppOrcamentoLabel3: TppLabel;
    ppOrcamentoLabel4: TppLabel;
    ppOrcamentoLabel5: TppLabel;
    ppOrcamentoLabel6: TppLabel;
    ppOrcamentoLabel7: TppLabel;
    ppOrcamentoLabel8: TppLabel;
    ppOrcamentoLabel9: TppLabel;
    ppOrcamentoLabel10: TppLabel;
    ppOrcamentoLabel11: TppLabel;
    ppOrcamentoLabel12: TppLabel;
    ppOrcamentoLine2: TppLine;
    ppDBText4: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBText3: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppDBText5: TppDBText;
    ppLabel1: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel3: TppLabel;
    ppLine3: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppLine4: TppLine;
    ppLabel4: TppLabel;
    ppLine5: TppLine;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppDBCalc24: TppDBCalc;
    ppLine6: TppLine;
    ppDBText17: TppDBText;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppDBText18: TppDBText;
    ppLabel5: TppLabel;
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
  dtmRelFuncionario: TdtmRelFuncionario;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TdtmRelFuncionario.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelIndicadores := TCtrlRelIndicadores.Create;
  CtrlRelIndicadores.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  // Carrega dados no Cds
  cds.Data := CtrlRelIndicadores.BuscaRelFuncionario(
                                    3441,                                 // idReport
                                    CmpRptCM.ParamValues[0].AsInteger,    // idImovel
                                    CmpRptCM.ParamValues[1].AsInteger,    // Ano Referencia
                                    CmpRptCM.ParamValues[2].AsInteger);   // idIndicador

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[3].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[4].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[5].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;

procedure TdtmRelFuncionario.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlRelIndicadores);
  inherited;
end;


procedure TdtmRelFuncionario.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;


procedure TdtmRelFuncionario.ppsCorPrint(Sender: TObject);
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
