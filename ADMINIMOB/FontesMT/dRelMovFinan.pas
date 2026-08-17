unit dRelMovFinan;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppModule, raCodMod, ppBands, ppClass, ppVar, ppCtrls,
  ppPrnabl, ppCache, ppDB, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe,
  ppDBBDE, ppStrtch, ppRegion, uCtrlRelAdminimob, uModuloImobiliario;

type
  TdtmRelMovFinan = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppMovFinan: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine4: TppLine;
    ppLabel8: TppLabel;
    ppLabel6: TppLabel;
    lblCabDesp: TppLabel;
    ppLabel9: TppLabel;
    lblCabRec: TppLabel;
    ppLabel11: TppLabel;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppLine5: TppLine;
    ppLabel1: TppLabel;
    ppDetailBand1: TppDetailBand;
    pplSeparador: TppLine;
    ppsCor: TppShape;
    dbtTipoCustoRecImo: TppDBText;
    ppDBText3: TppDBText;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    lblSistema: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppRegion3: TppRegion;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLabel4: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText7: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppRegion2: TppRegion;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppLabel3: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText10: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppRegion1: TppRegion;
    ppDBCalc4: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc1: TppDBCalc;
    ppLabel2: TppLabel;
    ppLine6: TppLine;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine7: TppLine;
    ppLine8: TppLine;
    lblSldCtb: TppLabel;
    lblReceita: TppLabel;
    lblDespesas: TppLabel;
    ppLabel7: TppLabel;
    ppDBText2: TppDBText;
    ppLogoMovFinan: TppImage;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelAdminimob : TCtrlRelAdminimob;

    bSeparador, bCorLinha    : boolean;
    CorLinha, CorAtual       : TColor;
  public
    { Public declarations }
  end;

var
  dtmRelMovFinan: TdtmRelMovFinan;

implementation

uses dBaseDados, uSistema, uMensErro, UComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TdtmRelMovFinan.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Carrega o Logotipo - Marcio Motta - 05/08/2004
  if ModuloImobiliario.AdminImob.bFlgLogoRelat then
     ppLogoMovFinan.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
  else
     ppLogoMovFinan.Picture := nil;

  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelAdminimob := TCtrlRelAdminimob.Create;
  CtrlRelAdminimob.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                      ComunsImobiliario.MensErroMT);

  cds.Data := CtrlRelAdminimob.SelecionaRelMovFinan(
                                 CmpRptCM.ParamValues[0].AsString,      // sTipoImovel
                                 Sistema.IdEmpresa,                     // Id Empresa
                                 CmpRptCM.ParamValues[1].AsInteger,     // iMes Ini
                                 CmpRptCM.ParamValues[2].AsInteger,     // iAno Ini
                                 CmpRptCM.ParamValues[3].AsInteger,     // iMes Fim
                                 CmpRptCM.ParamValues[4].AsInteger,     // iAno Fim
                                 CmpRptCM.ParamValues[5].AsDateTime,    // data Contábil
                                 CmpRptCM.ParamValues[6].AsBoolean,     // Previsão de Rec
                                 CmpRptCM.ParamValues[7].AsBoolean);    // Previsão de Desp

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[8].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[9].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[10].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);

  // Carrega label de parametros
  if CmpRptCM.ParamValues[6].AsBoolean then begin
    lblReceita.Text := 'Receitas Previstas';
    lblCabRec.Text  := 'Vencimento';
  end else begin
    lblReceita.Text := 'Receitas Realizadas';
    lblCabRec.Text  := 'Recebimento';
  end;
  if CmpRptCM.ParamValues[7].AsBoolean then begin
    lblDespesas.Text := 'Despesas Previstas';
    lblCabDesp.Text  := 'Vencimento';
  end else begin
    lblDespesas.Text := 'Despesas Realizadas';
    lblCabDesp.Text  := 'Pagamento';
  end;
  lblSldCtb.Text := 'Saldo Contábil em: ' + FormatDateTime('DD/MM/YYYY',CmpRptCM.ParamValues[5].AsDateTime);
end;

procedure TdtmRelMovFinan.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlRelAdminimob );
  inherited;
end;

procedure TdtmRelMovFinan.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelMovFinan.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

end.
