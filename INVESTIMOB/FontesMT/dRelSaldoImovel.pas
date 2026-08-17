unit dRelSaldoImovel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppDB, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, ppModule, raCodMod, ppCtrls, ppBands, ppVar, ppPrnabl,
  ppCache, uCtrlRelInvestimob;

type
  TdtmRelSaldoImovel = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppSaldoImovel: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    lblTitulo: TppLabel;
    ppOrcamentoLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppLogoTipo: TppImage;
    ppDetailBand1: TppDetailBand;
    pplSeparador: TppLine;
    ppsCor: TppShape;
    pptImovel: TppDBText;
    ppDBText4: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLabel5: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    gfbMestre: TppGroupFooterBand;
    ppDBCalc2: TppDBCalc;
    ppOrcamentoLine2: TppLine;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    gfbImovel: TppGroupFooterBand;
    ppShape1: TppShape;
    ppDBCalc1: TppDBCalc;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
    procedure gfbMestreBeforePrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelInvestimob     : TCtrlRelInvestimob;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;

  public
    { Public declarations }
  end;

var
  dtmRelSaldoImovel: TdtmRelSaldoImovel;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento,
     uModuloImobiliario;

{$R *.DFM}

procedure TdtmRelSaldoImovel.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelInvestimob := TCtrlRelInvestimob.Create;
  CtrlRelInvestimob.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  // Carrega dados no Cds
  cds.Data := CtrlRelInvestimob.BuscaRelSaldoImovel(CmpRptCM.ParamValues[0].AsInteger,   // idMestre
                                                    CmpRptCM.ParamValues[1].AsInteger,   // idImovel
                                                    Sistema.IdEmpresa,
                                                    ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                                    ModuloImobiliario.InvestImob.iIdPaisCAF,
                                                    CmpRptCM.ParamValues[2].AsDateTime); // DataBase

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[3].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[4].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[5].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);

  // Carrega o Logotipo
  if ModuloImobiliario.InvestImob.bFlgLogoRelat then
       ppLogoTipo.Picture := ModuloImobiliario.InvestImob.LogoTipo.Picture
  else ppLogotipo.Picture := nil;

  // Define o Título
  lblTitulo.Caption := 'Saldo Contábil por Imóvel em ' + FormatDateTime('DD/MM/YYYY',CmpRptCM.ParamValues[2].AsDateTime);
end;

procedure TdtmRelSaldoImovel.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlRelInvestimob );
  inherited;  
end;

procedure TdtmRelSaldoImovel.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelSaldoImovel.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

procedure TdtmRelSaldoImovel.gfbMestreBeforePrint(Sender: TObject);
begin
  inherited;
  // Se for exibir apenas um imóvel, inibe o rodapé com o total do imovel mestre
  if CmpRptCM.ParamValues[1].AsInteger > 0 then
       gfbMestre.Visible := False
  else gfbMestre.Visible := True;
end;

end.

