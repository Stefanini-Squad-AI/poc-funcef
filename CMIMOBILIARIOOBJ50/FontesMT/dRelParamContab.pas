unit dRelParamContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppBands, ppCache, ppPrnabl, ppCtrls, ppVar, myChkBox,
  uCtrlRelComunsImobiliario, uModuloImobiliario, TXRB;

type
  TdtmRelParamContab = class(TfrmCMReportImob)
    ppParamContab: TppReport;
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
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel1: TppLabel;
    ppDBText4: TppDBText;
    ppLabel4: TppLabel;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    ppDBText6: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppdbtCCDebito: TppDBText;
    ppdbtCCCredito: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLine4: TppLine;
    ppLine5: TppLine;
    myDBCheckBox1: TmyDBCheckBox;
    ppLabel8: TppLabel;
    ppsCor: TppShape;
    pplSeparador: TppLine;
    ppLogoTipo: TppImage;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelComunsImobiliario : TCtrlRelComunsImobiliario;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;
  public
    { Public declarations }
  end;

var dtmRelParamContab: TdtmRelParamContab;

implementation

uses dBaseDados, uSistema, uMensErro, uVerificaPreenchimento, uIntegraBack, uComunsImobiliario;

{$R *.DFM}

procedure TdtmRelParamContab.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Carrega o Logotipo - Marcio Motta - 08/08/2004
  if ModuloImobiliario.AdminImob.bFlgLogoRelat then
     ppLogotipo.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
  else
     ppLogotipo.Picture := nil;

  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelComunsImobiliario := TCtrlRelComunsImobiliario.Create;
  CtrlRelComunsImobiliario.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                      ComunsImobiliario.MensErroMT);

  cds.Data := CtrlRelComunsImobiliario.SelecionaRelParamContab(Sistema.IdModulo,
                               CmpRptCM.ParamValues[0].AsInteger,    // idTipoCustoRecImov
                               CmpRptCM.ParamValues[2].AsInteger,    // idImovel
                               CmpRptCM.ParamValues[3].AsInteger,    // idContrato
                               CmpRptCM.ParamValues[1].AsString,     // idTipoImovel
                               CmpRptCM.ParamValues[4].AsBoolean,    // bReceita
                               CmpRptCM.ParamValues[5].AsBoolean,    // bDespesa
                               CmpRptCM.ParamValues[6].AsInteger,    // iTipoContab (1-Diario,2-Normal,3-Todos)
                               CmpRptCM.ParamValues[7].AsInteger);   // iOrdem

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[8].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[9].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[10].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);

  // Carrega Mascaras das contas
  ppdbtCCCredito.DisplayFormat := trim(IntegraBack.MascaraPlano) + ';0;_';
  ppdbtCCDebito.DisplayFormat  := trim(IntegraBack.MascaraPlano) + ';0;_';
end;

procedure TdtmRelParamContab.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelParamContab.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

end.
