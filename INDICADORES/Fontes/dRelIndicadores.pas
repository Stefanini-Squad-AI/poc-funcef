unit dRelIndicadores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, myChkBox, ppCtrls, ppBands, ppVar, ppPrnabl, ppCache,
  uCtrlRelIndicadores, TXRB;

type
  TdtmRelIndicadores = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppIndicadores: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLine2: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    myDBCheckBox1: TmyDBCheckBox;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine3: TppLine;
    ppLabel8: TppLabel;
    ppDBText7: TppDBText;
    lblCodigo: TppLabel;
    dbtCodigo: TppDBText;
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
  dtmRelIndicadores: TdtmRelIndicadores;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TdtmRelIndicadores.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto Lojas
  CtrlRelIndicadores := TCtrlRelIndicadores.Create;
  CtrlRelIndicadores.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  // Carrega dados no Cds
  cds.Data := CtrlRelIndicadores.BuscaRelIndicadores(CmpRptCM.ParamValues[0].AsString);

  if CmpRptCM.ParamValues[1].AsBoolean then begin
    lblCodigo.Visible := True;
    dbtCodigo.Visible := True;
  end else begin
    lblCodigo.Visible := False;
    dbtCodigo.Visible := False;
  end;

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[2].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[3].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[4].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;

procedure TdtmRelIndicadores.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil( CtrlRelIndicadores );
end;

procedure TdtmRelIndicadores.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelIndicadores.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

end.
