unit dRelLojasLivres;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppBands, ppCache, ppCtrls, ppVar, ppPrnabl, uCtrlRelIndicadores,
  TXRB;

type
  TdtmRelLojasLivres = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppLojasLivres: TppReport;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine3: TppLine;
    ppLabel4: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLine4: TppLine;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppDBCalc3: TppDBCalc;
    ppDBText18: TppDBText;
    ppLabel6: TppLabel;
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
  dtmRelLojasLivres: TdtmRelLojasLivres;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento, uModuloIndicadores;

{$R *.DFM}

procedure TdtmRelLojasLivres.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelIndicadores := TCtrlRelIndicadores.Create;
  CtrlRelIndicadores.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  cds.Data := CtrlRelIndicadores.BuscaRelLojasLivres(3435,                // IdReport de Orçamento no SAD
                                    CmpRptCM.ParamValues[0].AsInteger,    // idImovel
                                    CmpRptCM.ParamValues[1].AsInteger,    // Mes Competencia
                                    CmpRptCM.ParamValues[2].AsInteger,    // Ano Competencia
                                    ModuloIndicadores.iIdIndABL);

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[3].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[4].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[5].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;

procedure TdtmRelLojasLivres.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlRelIndicadores);
end;

procedure TdtmRelLojasLivres.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelLojasLivres.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

end.
