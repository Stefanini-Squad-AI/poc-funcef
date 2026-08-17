unit dRel2ViaCChequeMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppModule, raCodMod,
  ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport,
  ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient,
  uCMClientDataSet, uCtrl2ViaContraCheque, usistema, uCmTypes, dBaseDados,
  uCmSqlParams;

type
  TDtmRel2ViaCChequeMT = class(TFrmCmReport)
    CdsFundacao: TCMClientDataSet;
    cdsDemonstpag: TCMClientDataSet;
    dsFundacao: TwwDataSource;
    dsdemonstpag: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    ppdemonstpag: TppBDEPipeline;
    rpdemonstpag: TppReport;
    CMSqlParams2: TCMSqlParams;
    CMSqlParams1: TCMSqlParams;
    ppHeaderBandRel: TppHeaderBand;
    ppShape1: TppShape;
    pplTituloRelat: TppLabel;
    ppdbNomeFundacao: TppDBText;
    ppdbCepFund: TppDBText;
    ppdbRazaoSocial: TppDBText;
    ppdbImagem: TppDBImage;
    ppdbEnderecoFund: TppDBText;
    ppdbBarIDUF: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppDetailBand22: TppDetailBand;
    ppRectRubricas: TppShape;
    ppdbDescricaoRub: TppDBText;
    ppdbValorRubrica: TppDBText;
    ppdbCodigoRub: TppDBText;
    ppdbMesRub: TppDBText;
    ppLabelDataInicio: TppLabel;
    VarResiduo: TppVariable;
    ppFooterBand: TppFooterBand;
    ppLine38: TppLine;
    ppLabelSistema: TppLabel;
    ppCalc33: TppSystemVariable;
    ppCalc34: TppSystemVariable;
    rpdemonstpagSummaryBand1: TppSummaryBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppRectDados: TppShape;
    pplNome: TppLabel;
    pplDataNasc: TppLabel;
    pplMatricula: TppLabel;
    pplEndereco: TppLabel;
    pplInscricao: TppLabel;
    ppdbNome: TppDBText;
    ppdbLogra: TppDBText;
    ppDBText44: TppDBText;
    pplBairro: TppLabel;
    ppdbBairro: TppDBText;
    pplCidade: TppLabel;
    pplNumDep: TppLabel;
    ppdbCidade: TppDBText;
    ppdbDatanasc: TppDBText;
    ppdbNumDep: TppDBText;
    pplEstado: TppLabel;
    ppdbEstado: TppDBText;
    pplCEP: TppLabel;
    ppdbCep: TppDBText;
    ppDBText52: TppDBText;
    ppdbmespag: TppDBText;
    pplMesPagto: TppLabel;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel7: TppLabel;
    ppDBText6: TppDBText;
    ppGroupFooterBandTotal: TppGroupFooterBand;
    ppRectTotal: TppShape;
    pplTotalProvento: TppLabel;
    pplTotalDesconto: TppLabel;
    pplLiquido: TppLabel;
    pplBanco: TppLabel;
    pplAgencia: TppLabel;
    pplContaCorrente: TppLabel;
    ppdbProvento: TppDBCalc;
    ppdbDesconto: TppDBCalc;
    ppdbBanco: TppDBText;
    ppdbAgencia: TppDBText;
    ppdbContaCorrente: TppDBText;
    pplValorLiquido: TppLabel;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLbTotalResiduo: TppLabel;
    ppDBCalcTotalResiduo: TppDBCalc;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppRectCabecRubricas: TppShape;
    ppDbTextPD: TppDBText;
    pplCodigoRub: TppLabel;
    pplDescricaoRub: TppLabel;
    pplValorRubrica: TppLabel;
    pplMesRub: TppLabel;
    ppLbDataInicio: TppLabel;
    ppLabelResiduo: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;
    procedure ppLabelDataInicioPrint(Sender: TObject);
    procedure cdsDemonstpagBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rpdemonstpagSummaryBand1AfterPrint(Sender: TObject);
    procedure pplValorLiquidoPrint(Sender: TObject);
  private
    { Private declarations }
    Ctrl2ViaContraCheque : TCtrl2ViaContraCheque;
    procedure MsgErro(sMsg: String);
  public
    { Public declarations }
  end;

var
  DtmRel2ViaCChequeMT: TDtmRel2ViaCChequeMT;
implementation

uses fAguarde;

{$R *.DFM}


procedure TDtmRel2ViaCChequeMT.ppLabelDataInicioPrint(Sender: TObject);
begin
  inherited;
  If ppDemonstPag['FLGDESCONTO'] = '0' then
  begin
    ppLabelDataInicio.Caption := Ctrl2ViaContraCheque.BuscaDataInicio(ppDemonstPag['IDPROVENTO'], ppDemonstPag['IDPLANOPREV'],
                                                                      ppDemonstPag['IDRESPONSAVEL'], ppDemonstPag['IDPESSJUR']);
    ppLbDataInicio.Caption:='Data Início';
  end else ppLabelDataInicio.Caption:='';
end;

procedure TDtmRel2ViaCChequeMT.cdsDemonstpagBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  cdsFundacao.Data := Ctrl2ViaContraCheque.BuscaDadosFundacao(sistema.IdEmpresa);
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TDtmRel2ViaCChequeMT.FormCreate(Sender: TObject);
begin
  inherited;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;


procedure TDtmRel2ViaCChequeMT.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;



procedure TDtmRel2ViaCChequeMT.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;

  Ctrl2ViaContraCheque := TCtrl2ViaContraCheque.Create;
  Ctrl2ViaContraCheque.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                  Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

//  chamar o control Object passando os parâmetros
   frmAguarde.Mostra('Aguarde... Montando Relatório.');
   cdsFundacao.Close;
   cdsDemonstpag.Close;
   cdsFundacao.data   := Ctrl2ViaContraCheque.BuscaDadosFundacao(sistema.IdEmpresa);
   frmAguarde.Repaint;

   cdsDemonstpag.Data := Ctrl2ViaContraCheque.BuscaDadosRelatorio(Ctrl2ViaContraCheque.BuscaFLGUSACODRUBEXT,
                                                  Ctrl2ViaContraCheque.AgrupaRubrica,
                                                  CmpRptCM.ParamValues[1].asString,
                                                  CmpRptCM.ParamValues[2].asString,
                                                  CmpRptCM.ParamValues[0].asString);
end;

procedure TDtmRel2ViaCChequeMT.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(Ctrl2ViaContraCheque);
end;



procedure TDtmRel2ViaCChequeMT.rpdemonstpagSummaryBand1AfterPrint(
  Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TDtmRel2ViaCChequeMT.pplValorLiquidoPrint(Sender: TObject);
begin
  inherited;
  pplValorLiquido.Caption := FormatFloat('#,##0.00', ppdbProvento.Value - ppdbDesconto.Value);
end;

end.
