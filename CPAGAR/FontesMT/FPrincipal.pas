// Alterações:
{-------------------------------------------------------------------------------
 N. Solicitação: WO7933 - WO8229
 Dt Alteração..: 11/12/2024
 Responsável...: Luis Ferrari
 Descrição.....: Tela para gerar planilha modelo com todas as abas e dados atualizados para importação do rateio
                 de lançamentos de documentos.
--------------------------------------------------------------------------------
 Atender.....: WO11554
 Data........: 09/07/2024
 Responsável.: Luis Ferrari
 Descrição...: Novo relatorio Cofin conforme modelo com campos dos Alteradores e data Emissão.IdReport 4643  
--------------------------------------------------------------------------------
//Rotina.............: mnuAtivProdServClick
//N. SIG.............: 133236
//Data da Alteração..: 27/04/2023 
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Criação da funcionalidade Cadastro de Atividades, Produtos e Serviços
//***************************************************************************************
Nº SIG.....: 117206
Responsável: Everson Cunha
Data.......: 24/01/2022
Descrição..: Criação da funcionalidade FAgrupaDocumento
             Baseado em C:\ProjetosCM5\CRECEBER\FontesMT\FAgrupaCnabMT.pas
             Atender a AP AGRUPADA DCTFWeb - INSS
--------------------------------------------------------------------------------
//Rotina........: AppPadraoShowParamReportPadrao
//N. SIG........: 120794
//Data..........: 29/11/2021
//Responsável...: Edilaine
//Descrição.....: Autoria Pagto - Modelo Cofin
--------------------------------------------------------------------------------
//Rotina.............: mnuAtuNFSDocClick
//N. SIG.............: 88813
//Data da Alteração..: 12/07/2019
//Alteração Form.....: FPrincipal
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção na chamada da funcionalidade "Atualização de Dados de NFS"
//***************************************************************************************
//Rotina......: -
//SOL..........: 212845
//Data.........: 01/03/2016
//Responsável..: Paulo nobre
//Descrição....: Criação de Menu
//----------------------------------------------------------------------------------------------------
//Rotina......: -
//SOL..........: 188852
//Kintana......: 1784376
//Data.........: 22/03/2013
//Responsável..: higor Nayde Ferreira
//Descrição....: Aviso para avaliação de fornecedores para pagamentos feitos antes da execução do serviço.
//----------------------------------------------------------------------------------------------------
// Data      : 16/01/2008
// Autor     : Hugo Luna
// Pendência : 18332 e 23815
// Descrição : Foram criadas as chamadas para o Relatório de Envio de Documentos para a Contabilidade.
{ ------------------------------------------------------------------------------
// Data      : 03/04/2007
// Autor     : Antonio Marcos (amf)
// Pendência : 24704
// Descrição : A tela de consulta documentos agora é a mesma do RAD+ (FRADConsultadoc) 
{ ------------------------------------------------------------------------------
// Data      : 16/06/2006
// Autor     : Catia Azevedo
// Pendência : 21698
// Descrição : Criação de atalho para a tela de lançamento de Documentos (sBtnLancDoc)
{ ------------------------------------------------------------------------------
// Rotinas   :
// Data      : 15/09/2004
// Autor     : andre tavares
// Pendência : 17619
// Descrição :
{ -----------------------------------------------------------------------------}
// Rotinas   : mnuRetencaoOutrasEmpresasClick
// Data      : 16/01/2004 (término)
// Autor     : David Ayrolla
// Pendência : 14393
// Descrição : Incluído item de menu mnuRetencaoOutrasEmpresas e seu código
{ ------------------------------------------------------------------------------
Rotina    : -
Data      : 27/06/2003
Autor     : André Pontes
Descrição : Pendência 14178: tornar menus invisíveis.
            ClassificaoFiscal1
            ClassificaoFiscalXImpostosAgregados1
            TransfernciadeClassificaoAutomtica1
            TransfernciadeClassificao1
-------------------------------------------------------------------------------}

(*******************************************************************************
 20/01/1999
 Inicialização de Parametro para indicação de impressora default para Cheque/Bloqueto
 25/02/1999
 Criação do Parâmentro para indicação do Tipo de CLiente Para Adiantamento;
 Criação do Método Modulo.BuscaParamCap;
 15/03/1999 - 02.05.09
 Alteração da Chamada dos Forms de Agrupa Parcela para configurar a tela de acordo
 com o Documento ou Previsão;
 *******************************************************************************)

unit FPrincipal;

interface                                                                                  

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,dbTables,
  uMensErro,  TB97, Db, Wwquery, Wwdatsrc, wwdblook, StdCtrls, Mask,
  wwdbedit, DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, Printers,
  IvDictio, IvAMulti, IvBinDic, IvMulti, IvEMulti, pptypes, uGimp, pputils,
  CorreioCM, fcLabel, Wwtable, ppReport, StdActns, ActnList, ImgList,
  fcStatusBar, AppEvnts, CMApplicationEvents, SConnect, MConnect, DBClient,
  CMProcuraMask, Provider, Grids, DBGrids, uCMClientDataSet, uResource,
  dCapCarMT, FCadConvenioBancoMT, CMNetUsers, FRelApGr4, uCtrlPlacontasCapCar, fFiltroAtosGestaoAP,
  uCmSqlParams, wwstorep,
  FRemessaEletronica, FAtualizaNFS, FAgrupaDocumento;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuDocRegistraB: TMenuItem;
    ParcelasDoc: TMenuItem;
    mnu1Alteradores1: TMenuItem;
    mnu1DoctopPagamento1: TMenuItem;
    mnu1Emissodechequebordero1: TMenuItem;
    mnu1Cancelaprocessopagamento1: TMenuItem;
    mnu1PagamentoAutomtico1: TMenuItem;
    mnu2pordocumento1: TMenuItem;
    mnu1Portadores1: TMenuItem;
    mnu1FormasdePagamento1: TMenuItem;
    mnu1PortadorxFormadePagamento1: TMenuItem;
    mnu1TiposdeAlteradores1_: TMenuItem;
    mnu1TiposdeDocumentos1: TMenuItem;
    mnu1TipodeDesembolso1_: TMenuItem;
    mnu2Automtico1: TMenuItem;
    mnu2Manual1: TMenuItem;
    mnuTesouraria: TMenuItem;
    mnu1PorDatadeLanamento1: TMenuItem;
    mnu1ContaCorrenteFornecedor1: TMenuItem;
    mnu1PosioporFornecedor1: TMenuItem;
    mnu1EntradadeDocumentos1: TMenuItem;
    mnu1PagamentodeDocumentos1: TMenuItem;
    mnu1AlteradoresLanamento1: TMenuItem;
    mnu1Gerencialportipo1: TMenuItem;
    mnuLancamento: TMenuItem;
    Previses1: TMenuItem;
    Teste1: TMenuItem;
    mnuPrevRegistra: TMenuItem;
    ParcelasPrev: TMenuItem;
    Adiantamentos1: TMenuItem;
    Movimento1: TMenuItem;
    N4: TMenuItem;
    Oramento1: TMenuItem;
    Cadastros1: TMenuItem;
    Operacionais1: TMenuItem;
    Gerenciais1: TMenuItem;
    Bancos2: TMenuItem;
    Portadores1: TMenuItem;
    FormasdePagamento1: TMenuItem;
    PortadorxFormadePagamento1: TMenuItem;
    N5: TMenuItem;
    TipodeDesembolso1: TMenuItem;
    TiposdeAlteradores1: TMenuItem;
    TiposdeDocumentos1: TMenuItem;
    N6: TMenuItem;
    Fornecedores2: TMenuItem;
    OradoxRealizado1: TMenuItem;
    MaioresFornecedores2: TMenuItem;
    SaldoaPagar1: TMenuItem;
    Pagamentos1: TMenuItem;
    SimulaodeCculos1: TMenuItem;
    CalculodeVariaoMonetriaCambial1: TMenuItem;
    ExclusodeMovimentos1: TMenuItem;
    Cheque1: TMenuItem;
    Border1: TMenuItem;
    Pagamento1: TMenuItem;
    N3: TMenuItem;
    AlteraLote1: TMenuItem;
    Banco1: TMenuItem;
    Agncia1: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    Cliente1_b: TMenuItem;
    TipodeCliente1_b: TMenuItem;
    Configurao1: TMenuItem;
    N11: TMenuItem;
    CdigosBancriosParaPagamentos1: TMenuItem;
    PagamentoEletrnico1: TMenuItem;
    ToolbarSep971: TToolbarSep97;
    Eletrnico1: TMenuItem;
    N10: TMenuItem;
    Exclui1: TMenuItem;
    N8: TMenuItem;
    ImportaodeLanamentos1: TMenuItem;
    AlteraVencimento1: TMenuItem;
    Documentos1: TMenuItem;
    N12: TMenuItem;
    Fornecedores1: TMenuItem;
    RegularizaAdiantamentos1: TMenuItem;
    N13: TMenuItem;
    Etiquetas1: TMenuItem;
    Configura1: TMenuItem;
    Imprime1: TMenuItem;
    RamodoFornecedorXTipodeDesembolso1_b: TMenuItem;
    N14: TMenuItem;
    ImpostoscomTabeladeReteno1: TMenuItem;
    Lote1: TMenuItem;
    Documento1: TMenuItem;
    TransfernciadeClassificao1: TMenuItem;
    N16: TMenuItem;
    Acera1: TMenuItem;
    ControledeTalesdeCheque1: TMenuItem;
    N15: TMenuItem;
    Lotes1: TMenuItem;
    TiposdeFatura1: TMenuItem;
    ClassificaoFiscal1: TMenuItem;
    CertificadosdeReteno1: TMenuItem;
    Configura2: TMenuItem;
    Imprime2: TMenuItem;
    Configura3: TMenuItem;
    Imprime3: TMenuItem;
    Recibo1: TMenuItem;
    Confiura1: TMenuItem;
    Imprime4: TMenuItem;
    N17: TMenuItem;
    Altera1: TMenuItem;
    N18: TMenuItem;
    ClassificaoFiscalXImpostosAgregados1: TMenuItem;
    mnu1: TMenuItem;
    TiposdeDesembolsoxCentrodeCustoXContaContbil1_: TMenuItem;
    Regulariza1: TMenuItem;
    EstornaExclui1: TMenuItem;
    AlteraDadosBancrios1: TMenuItem;
    N19: TMenuItem;
    ExportaodeLanc1: TMenuItem;
    OrdemdePagamento1: TMenuItem;
    PagamentosxRecebimentos1: TMenuItem;
    ConciliaodeCPMF1: TMenuItem;
    N20: TMenuItem;
    UsurioxTipodeDocumento1: TMenuItem;
    PlanoPrevidncirio1: TMenuItem;
    Analtico1: TMenuItem;
    Sinttico1: TMenuItem;
    teste2: TMenuItem;
    DocumentosPendentesdeCPMF1: TMenuItem;
    MnuAlteradorXRelacionamentos_: TMenuItem;
    N1: TMenuItem;
    AjustarSaldoAtravsdeLanamentos1: TMenuItem;
    MnuHistoricosContabeis: TMenuItem;
    N2: TMenuItem;
    mnuCadPadraoRateio: TMenuItem;
    mnuRetencaoOutrasEmpresas: TMenuItem;
    mnuConveniosBancrios: TMenuItem;
    mnu1TipodeDesembolso1: TMenuItem;
    TiposdeDesembolsoxCentrodeCustoXContaContbil1: TMenuItem;
    mnu1TiposdeAlteradores1: TMenuItem;
    MnuAlteradorXRelacionamentos: TMenuItem;
    TiposdeDesembolsoXImpostosAgregados1: TMenuItem;
    ToolbarSep972: TToolbarSep97;
    sBtnLancDoc: TToolbarButton97;
    Fornecedores3: TMenuItem;
    TipodeCliente1: TMenuItem;
    RamodoFornecedorXTipodeDesembolso1: TMenuItem;
    Cliente1: TMenuItem;
    mnudocregistra: TAction;
    MnuEventos: TMenuItem;
    MnuTipodeEvento: TMenuItem;
    DocumentosPendentesAvaliacao: TMenuItem;
    spAux: TCMSqlParams;
    N21: TMenuItem;
    mnuRemessaEletronica: TMenuItem;
    mnuAtuNFSDoc: TMenuItem;
    mnuAgrupaDocumento: TMenuItem;
    mnuAtivProdServ: TMenuItem;
    mnuPlanilhaModeloRateio1: TMenuItem;
    procedure mnu1FormasdePagamento1Click(Sender: TObject);
    procedure mnu1PortadorxFormadePagamento1Click(Sender: TObject);
    procedure mnu1TiposdeDocumentos1Click(Sender: TObject);
    procedure mnu2pordocumento1Click(Sender: TObject);
    procedure mnu1Alteradores1Click(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure mnu1Portadores1Click(Sender: TObject);
    procedure mnu1Cancelaprocessopagamento1Click(Sender: TObject);
    procedure Cheque1Click(Sender: TObject);
    procedure Border1Click(Sender: TObject);
    procedure Adiantamentos1Click(Sender: TObject);
    procedure mnu2Automtico1Click(Sender: TObject);
    procedure AlteraLote1Click(Sender: TObject);
    procedure Banco1Click(Sender: TObject);
    procedure Agncia1Click(Sender: TObject);
    procedure mnuPrevRegistraClick(Sender: TObject);
    procedure Configurao1Click(Sender: TObject);
    procedure CdigosBancriosParaPagamentos1Click(Sender: TObject);
    procedure PagamentoEletrnico1Click(Sender: TObject);
    procedure Eletrnico1Click(Sender: TObject);
    procedure Relatorios1Click(Sender: TObject);
    procedure ImportaodeLanamentos1Click(Sender: TObject);
    procedure AlteraVencimento1Click(Sender: TObject);
    procedure Documentos1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Configura1Click(Sender: TObject);
    procedure Imprime1Click(Sender: TObject);
    procedure ImpostoscomTabeladeReteno1Click(Sender: TObject);
    procedure Lote1Click(Sender: TObject);
    procedure Documento1Click(Sender: TObject);
    procedure TransfernciadeClassificao1Click(Sender: TObject);
    procedure Acera1Click(Sender: TObject);
    procedure ControledeTalesdeCheque1Click(Sender: TObject);
    procedure Lotes1Click(Sender: TObject);
    procedure ClassificaoFiscal1Click(Sender: TObject);
    procedure Configura2Click(Sender: TObject);
    procedure Imprime2Click(Sender: TObject);
    procedure Configura3Click(Sender: TObject);
    procedure Imprime3Click(Sender: TObject);
    procedure Confiura1Click(Sender: TObject);
    procedure Imprime4Click(Sender: TObject);
    procedure Altera1Click(Sender: TObject);
    procedure ClassificaoFiscalXImpostosAgregados1Click(Sender: TObject);
    procedure AlteraDadosBancrios1Click(Sender: TObject);
    procedure ExportaodeLanc1Click(Sender: TObject);
    procedure OrdemdePagamento1Click(Sender: TObject);
    procedure PagamentosxRecebimentos1Click(Sender: TObject);
    procedure ConciliaodeCPMF1Click(Sender: TObject);
    procedure UsurioxTipodeDocumento1Click(Sender: TObject);
    procedure DocumentosPendentesdeCPMF1Click(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure AjustarSaldoAtravsdeLanamentos1Click(Sender: TObject);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure ParcelasDocClick(Sender: TObject);
    procedure ParcelasPrevClick(Sender: TObject);
    procedure Regulariza1Click(Sender: TObject);
    procedure EstornaExclui1Click(Sender: TObject);
    procedure mnu2Manual1Click(Sender: TObject);
    procedure MnuHistoricosContabeisClick(Sender: TObject);
    procedure mnuCadPadraoRateioClick(Sender: TObject);
    procedure mnuRetencaoOutrasEmpresasClick(
      Sender: TObject);
    procedure mnuConveniosBancriosClick(Sender: TObject);
    procedure mnu1TipodeDesembolso1Click(Sender: TObject);
    procedure TiposdeDesembolsoxCentrodeCustoXContaContbil1Click(
      Sender: TObject);
    procedure TiposdeDesembolsoXImpostosAgregados1Click(Sender: TObject);
    procedure mnu1TiposdeAlteradores1Click(Sender: TObject);
    procedure MnuAlteradorXRelacionamentosClick(Sender: TObject);
    procedure TipodeCliente1Click(Sender: TObject);
    procedure RamodoFornecedorXTipodeDesembolso1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure mnudocregistraExecute(Sender: TObject);
    procedure MnuEventosClick(Sender: TObject);
    procedure MnuTipodeEventoClick(Sender: TObject);
    procedure DocumentosPendentesAvaliacaoClick(Sender: TObject);
    procedure mnuRemessaEletronicaClick(Sender: TObject);
    procedure mnuAtuNFSDocClick(Sender: TObject);   // higor Nayde Ferreira SOL  188852  TKN 1784376
    procedure mnuAgrupaDocumentoClick(Sender: TObject);
    procedure mnuAtivProdServClick(Sender: TObject);
    procedure mnuPlanilhaModeloRateio1Click(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  {** units 3 camadas **}
  uSistema,
  ufuncaogeral,
  uModulo,
  uDataBase,
  uEtiquetaCm,
  uCtrlParamIntegra,
  uCtrlRptCAP,
  uCtrlLancDocCapCar,
  uFormManager,

  {** Telas de operação 3 camadas **}
  FFormaRecPagMT,
  fCadContasMT,
  FCadTipoDocMT,
  FCadTipoDesembMT,
  FCadAlteradoresMT,
  FPortadorFormaMT,
  FparamcapMT,
  FConfigCheqMT,
  FAlteraVencMT,
  FCadRamoxDesembMT,
  FTransfClassMT,
  FCadBanco,
  fCadAgencia,
  fCadForne,
  FAcertaBaixaMT,
  FCadTalaoChequeMT,
  FCadCladFisCliForMT,
  fCadCertifRetencaoMT,
  fConfigFatNotaReciboMT,
  FConfigReciboMT,
  FAtualizaOperacaoMT,
  FCadClasFisXImpostoMT,
  fCadRecDesXAgregMT,
  FTrdxCCxContaMT,
  FCadUsuxTpdpctoMT,
  FCadBancosxCodigosMT,
  FTipoAlteradorxCCxContaMT,
  FAltdadosbancdocMT,
  fLancAlteradoresMT,
  FRegAdiantoMT,
  FEstAdiantamentoMT,
  FLancDocCapCarMT,
  FAgrupaParcelaMT,
  FBaixaAutomaticaMT,
  FBaixaManualMT,
  FConsultaDocMT,
  FConsFornMT,
  FConsLoteMT,
  FConsOrdemPagoMT,
  FConsDoctosCpmfMT,
  FListaRetencoesMT,
  FCadRamoFornecedorMT,
  FConciliaCPMFMT,
  fBaixaRecXPagtoMT,
  FBaixaIntBancoMT,
  FEstornaBaixaDocsMT,
  FExcluiEstornaBaixaLoteMT,
  FAjusteSaldoLancamentoMT,
  FCadImpAgregMT,
  FExpLanctoMT,
  FPagEletronicoMT,
  FAlteraLoteMT,
  FEmissChequeMT,
  FGeraLotePgtoMT,
  FCancelaLoteMT,
  FCadHistoContabilMT,
  FCadAtivProdServMT,

  {** Telas personalizadas de relatórios 3 camadas **}
  FRelAprovaDocs,
  FRelEmisCheque,
  FRelDemosSint,
  FRelFichaPag,
  FRelOrdemDePago,
  FRelSlip,
  FRelAutPag,
  FRelEmissBordero,
  FRelApGr,
  FRelApGr3,
  FRelEmisEtiq,
  FRelDemGestAutPag,
  fCadRetInssOutros,
  fDocPendenteAvaliacao,//Flg para tratamento de pendentes de avaliação higor Nayde Ferreira SOL  188852  TKN 1784376


  fImportaLancamentoMT,


  {** Verificar se realmente falta converter **}
  uIntegraBack,
  FCadGrupoRateioDocMT, frParamRecEncargos, dRelCPMFPlanoxPatro, frParamRecEncargosPlanoxPatro,

 // Pendência: 22213 - Marcos Topini
    FTipoEventoMT,

    //amf 03.04.20007 - passa a usar a consulta do documentos do RAD+.
    FRADConsultaDOC,

    FLancEventosMT,
 // Fim Pendência: 22213

    UGeraPlanilhaModelo;  //fPlanilhaModelo;  // WO7933 - WO8229



{$R *.DFM}

procedure TfrmPrincipal.mnu1FormasdePagamento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmFormaRecPagMT, TfrmFormaRecPagMT,false);
end;

procedure TfrmPrincipal.mnu1PortadorxFormadePagamento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPortadorFormaMT, TfrmPortadorFormaMT,false);
end;

procedure TfrmPrincipal.mnu1TiposdeDocumentos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadTipoDocMt,TfrmCadTipoDocMT,False);
end;

procedure TfrmPrincipal.mnu2pordocumento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmGeraLotePgtoMT, TfrmGeraLotePgtoMT, false);
end;

procedure TfrmPrincipal.mnu1Alteradores1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmLancAlteradores, TFrmLancAlteradores, false);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmParamCapMT, TfrmParamCapMT, false);
end;

procedure TfrmPrincipal.mnu1Portadores1Click(Sender: TObject);
begin
  inherited;
  If Modulo.ExisteParametros Then
     AbrirForm(frmCadContasMT, TfrmCadContasMT, false)
  Else
     MsgDlg('Cadastro dos Parâmetros deve ser feito previamente','Aviso',mtError,[mbOk],0);
end;


procedure TfrmPrincipal.mnu1Cancelaprocessopagamento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCancelaLoteMT, TFrmCancelaLoteMT, false);
end;

procedure TfrmPrincipal.Cheque1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmEmissChequeMT, TFrmEmissChequeMT, false);
end;

procedure TfrmPrincipal.Border1Click(Sender: TObject);
begin
  inherited;
  MsgDlg('Para Borderô, Selecione a opção ''Borderô'' no Grupo Emissões Diversas.','Aviso',mtinformation,[mbOk],0);
  Relatorios1Click(Self);
end;

procedure TfrmPrincipal.Adiantamentos1Click(Sender: TObject);
begin
  inherited;
  TfrmLancDocCAPCAR.AbrirForm(opldAdiantamento);

end;

procedure TfrmPrincipal.mnu2Automtico1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmBaixaAutomaticaMT,TFrmBaixaAutomaticaMT,False);
end;

procedure TfrmPrincipal.AlteraLote1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmAlteraLoteMT, TFrmAlteraLoteMT, false);
end;

procedure TfrmPrincipal.Banco1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadBanco, TfrmCadBanco, false);
end;

procedure TfrmPrincipal.Agncia1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadAgencia, TfrmCadAgencia, false);
end;

procedure TfrmPrincipal.mnuPrevRegistraClick(Sender: TObject);
begin
  inherited;
  TfrmLancDocCAPCAR.AbrirForm(opldContratoPrevisao);
end;

procedure TfrmPrincipal.Configurao1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConfigCheqMT, TFrmConfigCheqMT, false);
end;

procedure TfrmPrincipal.CdigosBancriosParaPagamentos1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadBancosxCodigosMT,TFrmCadBancosxCodigosMT,False)
end;

procedure TfrmPrincipal.PagamentoEletrnico1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmPagEletronicoMT, TFrmPagEletronicoMT,False);
end;

Procedure TfrmPrincipal.Eletrnico1Click(Sender: TObject);
Begin
  Inherited;
  AbrirForm( FrmBaixaIntBancoMT, TFrmBaixaIntBancoMT, False );
End;

procedure TfrmPrincipal.Relatorios1Click(Sender: TObject);
begin
  Modulo.TipoBordero := False;
  inherited;
end;

procedure TfrmPrincipal.ImportaodeLanamentos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmImportaLancamentoMT,TfrmImportaLancamentoMT,False);
end;

procedure TfrmPrincipal.AlteraVencimento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAlteraVencMT,TfrmAlteraVencMT,False);
end;

procedure TfrmPrincipal.Documentos1Click(Sender: TObject);
begin
  inherited;

  //amf 03.04.2007 24704 - chama a consulta documento do RAD+
  TfrmRADConsultaDoc.SetDisparadorCapCar(True);
  frmRADConsultaDoc                 := TfrmRADConsultaDoc.Create(self);
  frmRADConsultaDoc.Align           := alNone;
  frmRADConsultaDoc.Visible         := True;
  frmRADConsultaDoc.FormStyle       := fsMDIChild;
  frmRADConsultaDoc.Show;
end;

procedure TfrmPrincipal.Fornecedores1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConsFornMT,TFrmConsFornMT,False);
end;

procedure TfrmPrincipal.Configura1Click(Sender: TObject);
begin
  inherited;
  EtiquetaCm.AbrirFormConfig;
end;

procedure TfrmPrincipal.Imprime1Click(Sender: TObject);
begin
  inherited;
  EtiquetaCm.AbrirFormImpressao;
end;

procedure TfrmPrincipal.ImpostoscomTabeladeReteno1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadImpAgregMT, TFrmCadImpAgregMT, False);
end;

procedure TfrmPrincipal.Lote1Click(Sender: TObject);
begin
  inherited;
  // Alterado o nome do form por causa da autorizacao do boton estorno
  AbrirForm( FrmAlteraExcluiPagto, TFrmAlteraExcluiPagto, false);
end;

procedure TfrmPrincipal.Documento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmEstornaBaixaDocsMT, TFrmEstornaBaixaDocsMT, False );
end;

procedure TfrmPrincipal.TransfernciadeClassificao1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmTransfClassMT,TfrmTransfClassMT,False);
end;

procedure TfrmPrincipal.Acera1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAcertaBaixaMT,TfrmAcertaBaixaMT,False);
end;

procedure TfrmPrincipal.ControledeTalesdeCheque1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadTalaoChequeMT,TFrmCadTalaoChequeMT,False);
end;

procedure TfrmPrincipal.Lotes1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConsLoteMT,TFrmConsLoteMT,False);
end;

procedure TfrmPrincipal.ClassificaoFiscal1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadCladFisCliForMT,TFrmCadCladFisCliForMT,False);
end;

procedure TfrmPrincipal.Configura2Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadCertifRetencaoMT,TfrmCadCertifRetencaoMT,False);
  frmCadCertifRetencaoMT.HabilitaImpressao(false);
end;

procedure TfrmPrincipal.Imprime2Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadCertifRetencaoMT,TfrmCadCertifRetencaoMT,False);
  frmCadCertifRetencaoMT.HabilitaImpressao(True);
end;

procedure TfrmPrincipal.Configura3Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConfigFatNotaReciboMT,TFrmConfigFatNotaReciboMT,False);
  FrmConfigFatNotaReciboMT.HabilitaImpressao(false);
end;

procedure TfrmPrincipal.Imprime3Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConfigFatNotaReciboMT,TFrmConfigFatNotaReciboMT,False);
  FrmConfigFatNotaReciboMT.HabilitaImpressao(True);
end;

procedure TfrmPrincipal.Confiura1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConfigReciboMT,TFrmConfigReciboMT,False);
  FrmConfigReciboMT.HabilitaImpressao(false);
end;

procedure TfrmPrincipal.Imprime4Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConfigReciboMT,TFrmConfigReciboMT,False);
  FrmConfigReciboMT.HabilitaImpressao(True);
end;


procedure TfrmPrincipal.Altera1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmAtualizaOperacaoMT,TFrmAtualizaOperacaoMT,False);
end;

procedure TfrmPrincipal.ClassificaoFiscalXImpostosAgregados1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadClasFisXImpostoMT,TFrmCadClasFisXImpostoMT,False);
end;

procedure TfrmPrincipal.AlteraDadosBancrios1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmAltdadosbancdocMT,TFrmAltdadosbancdocMT,False);
end;

procedure TfrmPrincipal.ExportaodeLanc1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmExpLanctoMT, TFrmExpLanctoMT, False );
end;

procedure TfrmPrincipal.OrdemdePagamento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConsOrdemPagoMT,TFrmConsOrdemPagoMT,False);
end;

procedure TfrmPrincipal.PagamentosxRecebimentos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmBaixaRecXPagtoMT,TFrmBaixaRecXPagtoMT, false);
end;

procedure TfrmPrincipal.ConciliaodeCPMF1Click(Sender: TObject);
begin
  inherited;
  If Modulo.CodDocCPMF <> 0 Then
     AbrirForm(FrmConciliaCPMFMT,TFrmConciliaCPMFMT,False)
  Else
     MsgDlg('Falta indicar o "Documento Padrão Para CPMF" no cadastro de parâmetros do sistema','Aviso',mtError,[mbOk],0);
end;

procedure TfrmPrincipal.UsurioxTipodeDocumento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadUsuxTpdpctoMT, TFrmCadUsuxTpdpctoMT, false);
end;



procedure TfrmPrincipal.DocumentosPendentesdeCPMF1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(FrmConsDoctosCpmfMT, TFrmConsDoctosCpmfMT, False);
end;



procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
var cdsAux: TCMClientDataSet;
    flgPrazo : boolean;
begin
   inherited;
   If sistema.FezLogin Then
   Begin
      stbarStatusBar.Panels[2].Text := Sistema.AliasServidor;

      If Sistema.MudouUsuario Or
         Sistema.MudouEmpresa Then
      begin
         Modulo.InitializeAs(ParamIntegra);
         ParamIntegra.GetParams(Sistema.IdEmpresa, 0, '', '', tiCAP);
      end;

      IntegraBack.BuscaParamIntegra('PARAMCAP','INTEGRACONTAB',IntegraBack.RecPag);
      Modulo.BuscaParamCap(Sistema.IdEmpresa);
     try   // higor Nayde Ferreira SOL  188852  TKN 1784376   Inicio
        cdsAux:=TCMClientDataSet.Create(nil);
        spAux.ClientDataSet := cdsAux;
        spAux.Prepare;
        spAux.ParamByName('IDUSUARIOINCLUSAO').AsInteger :=   Sistema.IdUsuario;
        spAux.Open;

       // cdsAux.Data:= CtrlAvaliacaoFornec.BuscaPendentesAvaliacao;
       {
        flgPrazo := False;
        while not(cdsAux.EOF) do begin
            if (cdsAux.FieldByName('PRAZO').AsInteger > 4) then
               flgPrazo := True;
             cdsAux.Next;
        end;

        if (flgPrazo)  then}
        if not cdsAux.IsEmpty then
           AbrirForm(frmDocPendenteAvaliacao, TfrmDocPendenteAvaliacao, false);

     finally // higor Nayde Ferreira SOL  188852  TKN 1784376  FIM
        cdsAux.Free;
     end;

  End;
end;



procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
   inherited;
   if (Sistema.FezLogin) Then
   Begin
   //  Início - Rodolpho - P: 18300
   Application.CreateForm(TDtmRelCPMFPlanoxPatro,DtmRelCPMFPlanoxPatro);

   //  Rodolpho da Silva - 02/06/2005
   Application.CreateForm(TDtmCapCarMT, DtmCapCarMT);

   End;
end;



procedure TfrmPrincipal.AjustarSaldoAtravsdeLanamentos1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmAjusteSaldoLancamentoMT,TfrmAjusteSaldoLancamentoMT, False);
end;



procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject; IdReports: Integer; sFileName: String; var Printed: Boolean);
Var
 CtrlRptCAP :TCtrlRptCAP;
begin
  inherited;
  CtrlRptCAP := TCtrlRptCAP.Create;
  Try
    Printed := ShowReport(IdReports, CtrlRptCAP);
    CtrlRptCAP.Free;
  Except
    CtrlRptCAP.Free;
    Raise;
  End;
end;



procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer; DesReport: TObject; var Config: Boolean);
Var
  CtrlRptCAP :TCtrlRptCAP;
begin
  inherited;
  CtrlRptCAP := TCtrlRptCAP.Create;
  try
    Config := ConfigReport(liIdReports, liOrigemCm, CtrlRptCAP, DesReport);
    CtrlRptCAP.free;
  except
    CtrlRptCAP.free;
    raise;
  end;
end;



procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  Case IdReports Of
    1147: FrmPreviewReports := TFrmRelAprovaDocs.Create(Self);
    1494: FrmPreviewReports := TFrmRelEmisCheque.Create(Self);
    1508: FrmPreviewReports := TFrmRelSlip.Create(Self);
    1553: FrmPreviewReports := TFrmRelEmissBordero.create(Self);
    1554: FrmPreviewReports := TFrmRelEmissBordero.create(Self);

    1927: FrmPreviewReports := TfrmParamRecEncargos.create(self);
    20202: FrmPreviewReports := TfrmParamRecEncargosPlanoxPatro.create(self); //Bruno Bastos - Pend. 22086

    // Rodolpho da SIlva - 03/11/2006
    20206: FrmPreviewReports := TfrmRelApGr4.Create(Self);

    2856: Begin
             FrmPreviewReports := TFrmRelEmissBordero.create(Self);
             FrmPreviewReports.tag := 1;
          End;
    1852: FrmPreviewReports := TFrmRelFichaPag.Create(Self);
    2474: FrmPreviewReports := TFrmRelOrdemDePago.Create(Self);
    2543: FrmPreviewReports := TFrmRelDemosSint.Create(Self);
    2546: FrmPreviewReports := TFrmRelAutPag.Create(Self);
    2551:
      Begin
        FrmPreviewReports := TFrmRelApGr.Create(Self);
        FrmPreviewReports.tag := 0;
      End;
    3272: FrmPreviewReports := TFrmRelApGr3.Create(Self);
    1392: FrmPreviewReports := TFrmRelEmisEtiq.Create(Self);
    2556:
      begin
         FrmPreviewReports := TFrmRelDemGestAutPag.Create(Self);
         FrmPreviewReports.Tag := 1;
      end;
   2672:
      begin
         FrmPreviewReports := TFrmRelDemGestAutPag.Create(Self);
         FrmPreviewReports.Tag := 0;
      end;

      //pendência 27070
      2034:
      begin
        FrmPreviewReports := TfrmFiltroAtosGestaoAP.Create(Self);
  //      FrmPreviewReports.tag := 1;
      end;
    4579: FrmPreviewReports := TFrmRelAutPag.Create(Self);   //edilaine SIG120794    
    4643: FrmPreviewReports := TFrmRelAutPag.Create(Self);   //WO11554 Ferrari

  Else
    FrmPreviewReports := Nil;
  End;
  inherited;
end;


procedure TfrmPrincipal.ParcelasDocClick(Sender: TObject);
begin
  inherited;
  TFrmAgrupaParcelaMT.AbrirForm(opfDocumento, NovaParcela);
end;

procedure TfrmPrincipal.ParcelasPrevClick(Sender: TObject);
begin
  inherited;
  TFrmAgrupaParcelaMT.AbrirForm(opfContratoPrev, NovaParcela);
end;

procedure TfrmPrincipal.Regulariza1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmRegAdiantoMT, TFrmRegAdiantoMT, False);
end;

procedure TfrmPrincipal.EstornaExclui1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmEstAdiantamentoMT, TFrmEstAdiantamentoMT, false );
end;

procedure TfrmPrincipal.mnu2Manual1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmBaixaManualMT, TFrmBaixaManualMT, false );
end;

procedure TfrmPrincipal.MnuHistoricosContabeisClick(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmCadHistoContabilMT, TFrmCadHistoContabilMT, false );
end;

procedure TfrmPrincipal.mnuCadPadraoRateioClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadGrupoRateioDocMT, TfrmCadGrupoRateioDocMT, False);
end;

procedure TfrmPrincipal.mnuRetencaoOutrasEmpresasClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadRetInssOutros, TfrmCadRetInssOutros, false );
end;

procedure TfrmPrincipal.mnuConveniosBancriosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadConvenioBancoMT, TFrmCadConvenioBancoMT, false);
end;

procedure TfrmPrincipal.mnu1TipodeDesembolso1Click(Sender: TObject);
begin
  inherited;
  If Modulo.ExisteParametros Then
     with TfrmCadTipoDesembMT.create(self) do show
  Else
     MsgDlg('Cadastro dos Parâmetros deve ser feito previamente','Aviso',mtError,[mbOk],0);

end;

procedure TfrmPrincipal.TiposdeDesembolsoxCentrodeCustoXContaContbil1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmTrdxCCxContaMT,TFrmTrdxCCxContaMT,False);
end;

procedure TfrmPrincipal.TiposdeDesembolsoXImpostosAgregados1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadRecDesXAgregMT,TfrmCadRecDesXAgregMT,False);

end;

procedure TfrmPrincipal.mnu1TiposdeAlteradores1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadAlteradoresMT,TfrmCadAlteradoresMT,False);
end;

procedure TfrmPrincipal.MnuAlteradorXRelacionamentosClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmTipoAlteradorxCCxContaMT,TFrmTipoAlteradorxCCxContaMT,False);
end;

procedure TfrmPrincipal.TipodeCliente1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadRamoFor, TfrmCadRamoFor, false);
end;

procedure TfrmPrincipal.RamodoFornecedorXTipodeDesembolso1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadRamoxDesembMT,TFrmCadRamoxDesembMT,False);

end;

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadForne, TfrmCadForne, false);

end;

procedure TfrmPrincipal.mnudocregistraExecute(Sender: TObject);
begin
  inherited;
   TfrmLancDocCAPCAR.AbrirForm(opldEfetivo);
end;

procedure TfrmPrincipal.MnuEventosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmLancEventoMT, TFrmLancEventoMT, false)
end;

procedure TfrmPrincipal.MnuTipodeEventoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadTipoEvento, TFrmCadTipoEvento, false)
end;

procedure TfrmPrincipal.mnuRemessaEletronicaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmRemessaEletronica, TFrmRemessaEletronica, false)//Paulo Nobre SOL212845
end;

procedure TfrmPrincipal.DocumentosPendentesAvaliacaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmDocPendenteAvaliacao, TfrmDocPendenteAvaliacao, false);   // higor Nayde Ferreira SOL  188852  TKN 1784376
end;

procedure TfrmPrincipal.mnuAtuNFSDocClick(Sender: TObject);
begin
  inherited;
  //Cássio Rovaroto - SIG nº88813 - Início
  //AbrirForm(frmAtuDadosNFSDoc, TfrmAtuDadosNFSDoc, false);
  AbrirForm(frmAtualizaNFS, TfrmAtualizaNFS, false);
  //Cássio Rovaroto - SIG nº88813 - Fim
end;

procedure TfrmPrincipal.mnuAgrupaDocumentoClick(Sender: TObject);
begin
  inherited;

  AbrirForm(frmAgrupaDocumento, TFrmAgrupaDocumento, false); //Everson Cunha - SIG117206
end;

procedure TfrmPrincipal.mnuAtivProdServClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadAtivProdServMT, TfrmCadAtivProdServMT, False);
end;

procedure TfrmPrincipal.mnuPlanilhaModeloRateio1Click(Sender: TObject);
begin
  inherited;
  if MsgDlg( 'Deseja Gerar Planilha Modelo?', 'Confirmação', mtConfirmation,[mbYes, mbNO],0) = mrYes then
    PlanilhaModeloCustos;

end;

initialization

   Sistema.LoadOldReport      := True;
   Sistema.NomeModulo         := 'Contas a Pagar';       // Nome do Módulo
   Sistema.IdModulo           := 3;                     // IdModulo cadastrado no SAD
   Sistema.Versao := '3.04.19h';
   Sistema.NomeAplicativo     := 'Contas a Pagar';

   IntegraBack                := TIntegraBack.Create(True, True, True);
   IntegraBack.Recpag         := 'P';

   Modulo                     := TModulo.Create;
   Modulo.IndiceTipoBordero   := 0;



finalization
   // Rodolpho da Silva - 02/05/2005
   Modulo.Free;

end.
