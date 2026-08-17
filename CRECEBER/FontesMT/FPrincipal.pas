{---------------------------------------------------------------------------------------------
Data      : 13/02/2016 
Autor     : Darivaldo Alencar
SIG       : 29271
Menu      : mnuRegistrodeCarteira
Descrição : criação da funcionalidade (FrmRegistroCarteiraBoleto)
------------------------------------------------------------------------------
Data      : 23/06/2015
Autor     : Helio Lima Custódio
SOL       : 253577/17359
PPM       : 842402
Menu      : Inclusão do menu Cobrança - Cadastro do Modelo de E-mail
Descrição : Geração dos boletos separado e envio de e-mail para o participante
------------------------------------------------------------------------------
Data      : 16/01/2008
Autor     : Hugo Luna
Pendência : 18332 e 23815
Descrição : Foram criadas as chamadas para o Relatório de Envio de Documentos para a Contabilidade.
------------------------------------------------------------------------------
Data      : 03/04/2007
Autor     : Antonio Marcos (amf)
Pendência : 24704
Descrição : A tela de consulta documentos agora é a mesma do RAD+ (FRADConsultadoc)
---------------------------------------------------------------------------------------------}

unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,dbTables,
  TB97, Db, Wwdatsrc, wwdblook, StdCtrls, Mask,
  wwdbedit, DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio,
  IvAMulti, IvBinDic, IvMulti, IvEMulti, CMDatabase, CorreioCM, fcLabel,
  AppEvnts, StdActns, ActnList, ImgList, fcStatusBar, CMApplicationEvents,
  SConnect, MConnect, DBClient, Grids, DBGrids, Provider, uResource,
  FTipoEventoMT, fLancEventosMT,
  //  Rodolpho da Silva - 02/06/2005
  dCapCarMT, CMNetUsers, uCtrlPlacontasCapCar, FBaixaIntBancoVolumeMT,

  FCadModeloEmail, wwstorep; //Helio - SOL Nº 253577-17359 PPM Nº 842402

type
  TFrmPrincipal = class(TfrmCMPrincipal)
    Fornecedores1: TMenuItem;
    N3: TMenuItem;
    Previses1: TMenuItem;
    mnudocregistraB: TMenuItem;
    parcelasprev: TMenuItem;
    Adiantamentos1: TMenuItem;
    Saldo1: TMenuItem;
    Movimento1: TMenuItem;
    N4: TMenuItem;
    Cadastros1: TMenuItem;
    Bancos2: TMenuItem;
    Portadores1: TMenuItem;
    FormasdePagamento1: TMenuItem;
    Tiposdealteradores1_: TMenuItem;
    TiposdeDocumentos1: TMenuItem;
    OradoxRealizado1: TMenuItem;
    SaldoaPagar1: TMenuItem;
    Documentos1: TMenuItem;
    Pagamento1: TMenuItem;
    N6: TMenuItem;
    mnu1Alteradores1: TMenuItem;
    parcelasdoc: TMenuItem;
    mnuprevregistra: TMenuItem;
    EmissodeEtiquetas1: TMenuItem;
    CartasdeCobrana1: TMenuItem;
    Escreve1: TMenuItem;
    Imprime1: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Configurao1: TMenuItem;
    Cobranca: TMenuItem;
    CdigosBancriosparaCobrana1: TMenuItem;
    ToolbarSep971: TToolbarSep97;
    Tiposlientes1_b: TMenuItem;
    N5: TMenuItem;
    Clientes1_b: TMenuItem;
    N10: TMenuItem;
    ExcluiRecebimentos1: TMenuItem;
    Emisso1: TMenuItem;
    MensagensParaRemessaEletrnica1: TMenuItem;
    TransfernciadeClassificao1: TMenuItem;
    N11: TMenuItem;
    AlteraVencimento1: TMenuItem;
    N12: TMenuItem;
    Bancos1: TMenuItem;
    Agncias1: TMenuItem;
    N13: TMenuItem;
    GeraRemessaParaAlterao1: TMenuItem;
    RegularizaAdiantamentos1: TMenuItem;
    N14: TMenuItem;
    Documentos2: TMenuItem;
    dbVH: TCMDatabase;
    ImportaodeLanamentos1: TMenuItem;
    Configura1: TMenuItem;
    Imprime2: TMenuItem;
    Etiquetas1: TMenuItem;
    Documentos3: TMenuItem;
    TiposdeClientesxTiposdeRecebimento1_b: TMenuItem;
    Lote1: TMenuItem;
    Documento1: TMenuItem;
    N16: TMenuItem;
    JurosAtuarial1: TMenuItem;
    CorreoAutomticadeDocumentos1: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    TiposdeFatura1: TMenuItem;
    ClassificaoFiscal1: TMenuItem;
    CadastrodeImpostosAgregados1: TMenuItem;
    Configura3: TMenuItem;
    Imprime4: TMenuItem;
    N20: TMenuItem;
    EmissodeRecibo1: TMenuItem;
    Configura4: TMenuItem;
    Imprime5: TMenuItem;
    LiberaReimpressodoBloqueto1: TMenuItem;
    AlteraOperaodeParcelaEngloba1: TMenuItem;
    N21: TMenuItem;
    ClassificaoFiscalXImpostosAgregados1: TMenuItem;
    N9: TMenuItem;
    TiposdeDesembolsoXImpostosAgregados1_: TMenuItem;
    FormasDeRecebientoXCentrodeCustoXContaContbil1_: TMenuItem;
    Regulariza1: TMenuItem;
    EstornaExclui1: TMenuItem;
    Lotedocumento: TMenuItem;
    Emissodecheque1: TMenuItem;
    Automatico1: TMenuItem;
    Manua1: TMenuItem;
    ContasBancri1: TMenuItem;
    ContasCaixasxFormasdepaga1: TMenuItem;
    TiposDesembolso1_: TMenuItem;
    AlteraDadosBancrios1: TMenuItem;
    Padro1: TMenuItem;
    MnuFichaComp: TMenuItem;
    MnuConfigFichaComp: TMenuItem;
    MnuImpFichaComp: TMenuItem;
    CertificadodeReteno1: TMenuItem;
    Configura2: TMenuItem;
    Imprime3: TMenuItem;
    MnuEmissao: TMenuItem;
    MnuSepara: TMenuItem;
    RecebimentosXPagamentos1: TMenuItem;
    UsurioxTipodeDocumento1: TMenuItem;
    N1: TMenuItem;
    AjustarSaldoatravsdeLanamentos1: TMenuItem;
    MnuAlteradorXRelacionamentos_: TMenuItem;
    N23: TMenuItem;
    AgruparBloquetos1: TMenuItem;
    N2: TMenuItem;
    mnuLotesdeRecebimento: TMenuItem;
    MnuTipoDocumentoxAlteradorxModulo: TMenuItem;
    mnuLancamento: TMenuItem;
    MnuHistoricosContabeis: TMenuItem;
    mnuExportaLancMT: TMenuItem;
    mnuConveniosBancarios: TMenuItem;
    TiposDesembolso1: TMenuItem;
    FormasDeRecebientoXCentrodeCustoXContaContbil1: TMenuItem;
    TiposdeDesembolsoXImpostosAgregados1: TMenuItem;
    Tiposdealteradores1: TMenuItem;
    MnuAlteradorXRelacionamentos: TMenuItem;
    sBtnLancDoc: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    Clientes2: TMenuItem;
    Tiposlientes1: TMenuItem;
    TiposdeClientesxTiposdeRecebimento1: TMenuItem;
    Clientes1: TMenuItem;
    mnudocregistra: TAction;
    msgBoletos: TMenuItem;
    mnuTipoEvento: TMenuItem;
    mnuEventos: TMenuItem;
    AutomticoRetornoemGrandeVolume1: TMenuItem;
    mmuCadastroMEmail: TMenuItem;
    mnuRegistrodeCarteira: TMenuItem;
    mnuRemessaEletronica: TMenuItem;
    procedure mnu1FormasdePagamento1Click(Sender: TObject);
    procedure mnu1PortadorxFormadePagamento1Click(Sender: TObject);
    procedure mnu1TiposdeDocumentos1Click(Sender: TObject);
    procedure mnu1TipodeDesembolso1Click(Sender: TObject);
    procedure mnu1TiposdeAlteradores1Click(Sender: TObject);
    procedure mnu1Alteradores1Click(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure mnu1Portadores1Click(Sender: TObject);
    procedure TiposdePagamento1Click(Sender: TObject);
    procedure mnu1Documentos1Click(Sender: TObject);
    procedure FormasdePagamento1Click(Sender: TObject);
    procedure Manua1Click(Sender: TObject);
    procedure ContasBancri1Click(Sender: TObject);
    procedure ContasCaixasxFormasdepaga1Click(Sender: TObject);
    procedure TiposdeDocumentos1Click(Sender: TObject);
    procedure Adiantamentos1Click(Sender: TObject);
    procedure mnuprevregistraClick(Sender: TObject);
    procedure parcelasprevClick(Sender: TObject);
    procedure Automatico1Click(Sender: TObject);
    procedure Configurao1Click(Sender: TObject);
    procedure Escreve1Click(Sender: TObject);
    procedure Imprime1Click(Sender: TObject);
    procedure LotedocumentoClick(Sender: TObject);
    procedure CdigosBancriosparaCobrana1Click(Sender: TObject);
    procedure Emisso1Click(Sender: TObject);
    procedure MensagensParaRemessaEletrnica1Click(Sender: TObject);
    procedure TransfernciadeClassificao1Click(Sender: TObject);
    procedure AlteraVencimento1Click(Sender: TObject);
    procedure Bancos1Click(Sender: TObject);
    procedure Agncias1Click(Sender: TObject);
    procedure GeraRemessaParaAlterao1Click(Sender: TObject);
    procedure Documentos2Click(Sender: TObject);
    procedure Imprime2Click(Sender: TObject);
    procedure Configura1Click(Sender: TObject);
    procedure EmissodeEtiquetas1Click(Sender: TObject);
    procedure Documentos3Click(Sender: TObject);
    procedure Lote1Click(Sender: TObject);
    procedure Documento1Click(Sender: TObject);
    procedure JurosAtuarial1Click(Sender: TObject);
    procedure CorreoAutomticadeDocumentos1Click(Sender: TObject);
    procedure ClassificaoFiscal1Click(Sender: TObject);
    procedure CadastrodeImpostosAgregados1Click(Sender: TObject);
    procedure Configura2Click(Sender: TObject);
    procedure Imprime3Click(Sender: TObject);
    procedure Configura3Click(Sender: TObject);
    procedure Imprime4Click(Sender: TObject);
    procedure Configura4Click(Sender: TObject);
    procedure Imprime5Click(Sender: TObject);
    procedure LiberaReimpressodoBloqueto1Click(Sender: TObject);
    procedure AlteraOperaodeParcelaEngloba1Click(Sender: TObject);
    procedure ClassificaoFiscalXImpostosAgregados1Click(Sender: TObject);
    procedure Regulariza1Click(Sender: TObject);
    procedure EstornaExclui1Click(Sender: TObject);
    procedure AlteraDadosBancrios1Click(Sender: TObject);
    procedure Padro1Click(Sender: TObject);
    procedure MnuConfigFichaCompClick(Sender: TObject);
    procedure MnuImpFichaCompClick(Sender: TObject);
    procedure RecebimentosXPagamentos1Click(Sender: TObject);
    procedure UsurioxTipodeDocumento1Click(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure AjustarSaldoatravsdeLanamentos1Click(Sender: TObject);
    procedure AgruparBloquetos1Click(Sender: TObject);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure mnuLotesdeRecebimentoClick(Sender: TObject);
    procedure parcelasdocClick(Sender: TObject);
    procedure MnuTipoDocumentoxAlteradorxModuloClick(Sender: TObject);
    procedure mnuExportaLancMTClick(Sender: TObject);
    procedure mnuConveniosBancariosClick(Sender: TObject);
    procedure MnuHistoricosContabeisClick(Sender: TObject);
    procedure TiposDesembolso1Click(Sender: TObject);
    procedure FormasDeRecebientoXCentrodeCustoXContaContbil1Click(
      Sender: TObject);
    procedure TiposdeDesembolsoXImpostosAgregados1Click(Sender: TObject);
    procedure Tiposdealteradores1Click(Sender: TObject);
    procedure MnuAlteradorXRelacionamentosClick(Sender: TObject);
    procedure Tiposlientes1Click(Sender: TObject);
    procedure TiposdeClientesxTiposdeRecebimento1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure mnudocregistraExecute(Sender: TObject);
    procedure msgBoletosClick(Sender: TObject);
    procedure mnuTipoEventoClick(Sender: TObject);
    procedure mnuEventosClick(Sender: TObject);
    procedure AutomticoRetornoemGrandeVolume1Click(Sender: TObject);
    procedure mmuCadastroMEmailClick(Sender: TObject);
    procedure mnuRegistrodeCarteiraClick(Sender: TObject);
    procedure mnuRemessaEletronicaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sPorDoc : String;

  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  {** Units 3 Camadas **}
  uFormManager,
  uCtrlParamIntegra,
  uCtrlLancDocCapCar,
  USistema,
  uFuncaoGeral,
  uModulo,
  uMensErro,
  uString,
  uDataBase,
  uEtiquetaCM,
  uCtrlRptCAR,

  {** Parâmetros de Relatórios 3 Camadas **}
  fRelApGr,
  rFichaPag,
  rEmissBloq,
  FRelEmissBloq,
  FRelFichaPag,
  FRelPosiFornCli,
  FRelCartaCob,
  FRelEmisEtiq,

  {** Telas 3 Camadas **}
  FCartaCobrMT,
  FConfigBloqMT,
  FDocxCobrancaMT,
  FLancDocCapCarMT,
  FAgrupaParcelaMT,
  FFormaRecPagMT,
  fCadContasMT,
  FCadTipoDocMT,
  FCadTipoDesembMT,
  FCadAlteradoresMT,
  FPortadorFormaMT,
  FparamcapMT,
  FCadBancosxCodigosMT,
  FCadMensCnabMT,
  FAlteraVencMT,
  FCadTipoxDesembMT,
  FCorrigeDocumentoMT,
  FCadCladFisCliForMT,
  FConfigReciboMT,
  FReimprBloqMT,
  FAtualizaOperacaoMT,
  FCadClasFisXImpostoMT,
  fCadRecDesXAgregMT,
  FTrdxCCxContaMT,
  FAgrupaCnabMT,
  FCadUsuxTpdpctoMT,
  FTipoAlteradorxCCxContaMT,
  fConfigFatNotaReciboMT,
  fCadCertifRetencaoMT,
  FRelDemosSint,
  FAltdadosbancdocMT,
  fLancAlteradoresMT,
  FRegAdiantoMT,
  FEstAdiantamentoMT,
  FConsRecLoteMT,
  FTransfClassMT,
  fCadCliente,
  FCadBanco,
  fCadAgencia,
  FBaixaManualMT,
  FConsultaDocMT,
  fCadJurosAtuarialMT,
  fCadTipoClienteMT,
  FConsFornMT,
  fBaixaRecXPagtoMT,
  FBaixaIntBancoMT,
  FParamBloqueteCobrancaMT,
  FAlteraDadosRemessaMT,
  FExcluiEstornaBaixaLoteMT,
  FEstornaBaixaDocsMT,
  FConfigBarrasCMMT,
  FAjusteSaldoLancamentoMT,
  FCadImpAgregMT,

  fImportaLancamentoMT,
  FCadHistoContabilMT,

  //amf 03.04.20007 - passa a usar a consulta do documentos do RAD+.
  FRADConsultaDOC,

  {** Verificar se já foram convertidas**}
  uIntegraBack, fCadTpDocxAltxMod, FExportaLancMT, FCadConvenioBancoMT, fCadMsgBoletoMT,
  fRegistroCarteiraBoletoMT,
  FRemessaEletronicaDeb;

{$R *.DFM}

procedure TFrmPrincipal.mnu1FormasdePagamento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmFormaRecPagMT, TfrmFormaRecPagMT,false);
end;

procedure TFrmPrincipal.mnu1PortadorxFormadePagamento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPortadorFormaMT, TfrmPortadorFormaMT,false);
end;


procedure TFrmPrincipal.mnu1TiposdeDocumentos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadTipoDocMT,TfrmCadTipoDocMT,False);
end;

procedure TFrmPrincipal.mnu1TipodeDesembolso1Click(Sender: TObject);
begin
  inherited;
  with TfrmCadTipoDesembMT.create(self) do show;
end;

procedure TFrmPrincipal.mnu1TiposdeAlteradores1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadAlteradoresMT,TfrmCadAlteradoresMT,False);

end;

procedure TFrmPrincipal.mnu1Alteradores1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmLancAlteradores, TFrmLancAlteradores, false);
end;

procedure TFrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmParamCapMT, TfrmParamCapMT, false);
end;

procedure TFrmPrincipal.mnu1Portadores1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadContasMT, TfrmCadContasMT, false);
end;

procedure TFrmPrincipal.TiposdePagamento1Click(Sender: TObject);
begin
  inherited;
  with TfrmCadTipoDesembMT.create(self) do show;
end;

procedure TFrmPrincipal.mnu1Documentos1Click(Sender: TObject);
begin
  inherited;
  Modulo.PrevEfet:='E';
  AbrirForm(frmLancDocCAPCAR, TfrmLancDocCAPCAR, false);
end;

procedure TFrmPrincipal.FormasdePagamento1Click(Sender: TObject);
begin
  inherited;
    AbrirForm(frmFormaRecPagMT,TfrmFormaRecPagMT,false);
end;

procedure TFrmPrincipal.Manua1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmBaixaManualMT, TFrmBaixaManualMT, false);
end;



procedure TFrmPrincipal.ContasBancri1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadContasMT, TfrmCadContasMT, false);
end;

procedure TFrmPrincipal.ContasCaixasxFormasdepaga1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmPortadorFormaMT, TfrmPortadorFormaMT,false);
end;

procedure TFrmPrincipal.TiposdeDocumentos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadTipoDocMT,TfrmCadTipoDocMT,False);
end;

procedure TFrmPrincipal.Adiantamentos1Click(Sender: TObject);
begin
  inherited;
  TFrmLancDocCapCar.AbrirForm(opldAdiantamento);  
end;

procedure TFrmPrincipal.mnuprevregistraClick(Sender: TObject);
begin
  inherited;
  TFrmLancDocCapCar.AbrirForm(opldContratoPrevisao);
end;

procedure TFrmPrincipal.parcelasprevClick(Sender: TObject);
begin
  inherited;
  TFrmAgrupaParcelaMT.AbrirForm(opfContratoPrev, NovaParcela);
end;


procedure TFrmPrincipal.Automatico1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmBaixaIntBancoMT, TFrmBaixaIntBancoMT, false)
end;

procedure TFrmPrincipal.Configurao1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConfigBloqMT, TFrmConfigBloqMT, false);
end;

procedure TFrmPrincipal.Escreve1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCartaCobrMT, TFrmCartaCobrMT, false);
  FrmCartaCobrMT.HabilitaImpressao(False);
end;

procedure TFrmPrincipal.Imprime1Click(Sender: TObject);
begin
  inherited;
  MsgDlg('Selecione no menu Consultas/Relatórios, o grupo ''Emissões Diversas''.','Atenção',mtinformation,[mbOK],0);
  Relatorios1Click(Self);
end;

procedure TFrmPrincipal.LotedocumentoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmDocxCobrancaMT,TFrmDocxCobrancaMT, false);
end;

procedure TFrmPrincipal.CdigosBancriosparaCobrana1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadBancosxCodigosMT,TFrmCadBancosxCodigosMT,False)
end;

procedure TFrmPrincipal.Emisso1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmParamBloqueteCobrancaMT, TFrmParamBloqueteCobrancaMT, false);
end;

procedure TFrmPrincipal.MensagensParaRemessaEletrnica1Click(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmCadMensCnabMT,TFrmCadMensCnabMT, false);
end;

procedure TFrmPrincipal.TransfernciadeClassificao1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmTransfClassMT,TFrmTransfClassMT,false);
end;

procedure TFrmPrincipal.AlteraVencimento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmAlteraVencMT,TFrmAlteraVencMT, false);
end;

procedure TFrmPrincipal.Bancos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadBanco, TfrmCadBanco, false);
end;

procedure TFrmPrincipal.Agncias1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadAgencia, TfrmCadAgencia, false);
end;

procedure TFrmPrincipal.GeraRemessaParaAlterao1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmAlteraDadosRemessaMT, TFrmAlteraDadosRemessaMT, false);
end;

procedure TFrmPrincipal.Documentos2Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConsFornMT,TFrmConsFornMT,False);
end;

procedure TFrmPrincipal.Imprime2Click(Sender: TObject);
begin
  inherited;
  EtiquetaCm.AbrirFormImpressao;
end;

procedure TFrmPrincipal.Configura1Click(Sender: TObject);
begin
  inherited;
  EtiquetaCm.AbrirFormConfig;
end;

procedure TFrmPrincipal.EmissodeEtiquetas1Click(Sender: TObject);
begin
  inherited;
  MsgDlg('Selecione no menu Consultas/Relatórios, o grupo ''Emissões Diversas''.','Atenção',mtinformation,[mbOK],0);
  Relatorios1Click(Self);
end;

procedure TFrmPrincipal.Documentos3Click(Sender: TObject);
begin
  inherited;

  //amf 03.04.2007 24704 - chama a consulta documento do RAD+
  TfrmRADConsultaDoc.SetDisparadorCapCar(True);
  frmRADConsultaDoc                 := TfrmRADConsultaDoc.Create(self);
  frmRADConsultaDoc.Align           := alNone;
  frmRADConsultaDoc.FormStyle       := fsMDIChild;
  frmRADConsultaDoc.Show;

end;

procedure TFrmPrincipal.Lote1Click(Sender: TObject);
begin
  inherited;

  // Alterado o nome do form por causa da autorizacao do boton estorno
  AbrirForm( FrmAlteraExcluiPagto, TFrmAlteraExcluiPagto, false);
end;

procedure TFrmPrincipal.Documento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmEstornaBaixaDocsMT,TFrmEstornaBaixaDocsMT,False);
end;

procedure TFrmPrincipal.JurosAtuarial1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadJurosAtuarialMT, TfrmCadJurosAtuarialMT,False);
end;

procedure TFrmPrincipal.CorreoAutomticadeDocumentos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCorrigeDocumentoMT,TFrmCorrigeDocumentoMT,False);
end;

procedure TFrmPrincipal.ClassificaoFiscal1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadCladFisCliForMT,TFrmCadCladFisCliForMT,False);
end;

procedure TFrmPrincipal.CadastrodeImpostosAgregados1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadImpAgregMT, TFrmCadImpAgregMT, False);
end;

procedure TFrmPrincipal.Configura2Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadCertifRetencaoMT,TfrmCadCertifRetencaoMT,False);
  frmCadCertifRetencaoMT.HabilitaImpressao(false);
end;

procedure TFrmPrincipal.Imprime3Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadCertifRetencaoMT,TfrmCadCertifRetencaoMT,False);
  frmCadCertifRetencaoMT.HabilitaImpressao(True);
end;

procedure TFrmPrincipal.Configura3Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConfigFatNotaReciboMT,TFrmConfigFatNotaReciboMT,False);
  FrmConfigFatNotaReciboMT.HabilitaImpressao(false);
end;

procedure TFrmPrincipal.Imprime4Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConfigFatNotaReciboMT,TFrmConfigFatNotaReciboMT,False);
  FrmConfigFatNotaReciboMT.HabilitaImpressao(True);
end;

procedure TFrmPrincipal.Configura4Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConfigReciboMT,TFrmConfigReciboMT,False);
  FrmConfigReciboMT.HabilitaImpressao(false);
end;

procedure TFrmPrincipal.Imprime5Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConfigReciboMT,TFrmConfigReciboMT,False);
  FrmConfigReciboMT.HabilitaImpressao(True);
end;

procedure TFrmPrincipal.LiberaReimpressodoBloqueto1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmreimprbloqMT,TFrmreimprbloqMT,False);
end;

procedure TFrmPrincipal.AlteraOperaodeParcelaEngloba1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmAtualizaOperacaoMT, TFrmAtualizaOperacaoMT, False);
end;

procedure TFrmPrincipal.ClassificaoFiscalXImpostosAgregados1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadClasFisXImpostoMT,TFrmCadClasFisXImpostoMT,False);
end;

procedure TFrmPrincipal.Regulariza1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmRegAdiantoMT, TFrmRegAdiantoMT, False);
end;

procedure TFrmPrincipal.EstornaExclui1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmEstAdiantamentoMT, TFrmEstAdiantamentoMT, false );
end;

procedure TFrmPrincipal.AlteraDadosBancrios1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmAltdadosbancdocMT,TFrmAltdadosbancdocMT,False);
end;

procedure TFrmPrincipal.Padro1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmImportaLancamentoMT,TfrmImportaLancamentoMT,False);
end;

procedure TFrmPrincipal.MnuConfigFichaCompClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConfigBarrasCMMT, TFrmConfigBarrasCMMT, False);
  FrmConfigBarrasCMMT.HabilitaImpressao(false);
end;

procedure TFrmPrincipal.MnuImpFichaCompClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConfigBarrasCMMT, TFrmConfigBarrasCMMT,False);
  FrmConfigBarrasCMMT.HabilitaImpressao(True);
end;

procedure TFrmPrincipal.RecebimentosXPagamentos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmBaixaRecXPagtoMT, TFrmBaixaRecXPagtoMT, false);
end;

procedure TFrmPrincipal.UsurioxTipodeDocumento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadUsuxTpdpctoMT, TFrmCadUsuxTpdpctoMT, false);
end;

procedure TFrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
  inherited;
  if (Sistema.FezLogin) Then
  Begin
      // Rodolpho da Silva - 02/06/2005
      Application.CreateForm(TDtmCapCarMT, DtmCapCarMT);
  End;
end;




procedure TFrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
  inherited;
  If Sistema.FezLogin Then
  Begin
      stbarStatusBar.Panels[2].Text := Sistema.AliasServidor;

    If Sistema.MudouUsuario Or
       Sistema.MudouEmpresa Then
    begin
       Modulo.InitializeAs(ParamIntegra);
       ParamIntegra.GetParams(Sistema.IdEmpresa, 0, '', '', tiCAR);
    end;

    IntegraBack.BuscaParamIntegra('PARAMCAP','INTEGRACONTAB',IntegraBack.RecPag);
    Modulo.BuscaParamCap(Sistema.IdEmpresa);
  End;
end;

procedure TFrmPrincipal.AjustarSaldoatravsdeLanamentos1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmAjusteSaldoLancamentoMT, TfrmAjusteSaldoLancamentoMT, False);
end;

procedure TFrmPrincipal.AgruparBloquetos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAgrupaCnabMT, TfrmAgrupaCnabMT, False);
end;

procedure TFrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
Var
 CtrlRptCAR :TCtrlRptCAR;
begin
  inherited;
  CtrlRptCAR := TCtrlRptCAR.Create;
  Try
    Printed := ShowReport(IdReports, CtrlRptCAR);
    CtrlRptCAR.Free;
  Except
    CtrlRptCAR.Free;
    Raise;
  End;
end;

procedure TFrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  case IdReports of
    2544: FrmPreviewReports := TFrmRelDemosSint.Create(Self);
    1598: FrmPreviewReports := TFrmRelApGr.Create(Self);
    1909: FrmPreviewReports := TFrmRelFichaPag.Create(Self);
    2426: FrmPreviewReports := TFrmRelEmissBloq.Create(Self);
    1502: FrmPreviewReports := TFrmRelPosiFornCli.Create(Self);
    1399: FrmPreviewReports := TFrmRelCartaCob.Create(Self);
    1391: FrmPreviewReports := TFrmRelEmisEtiq.Create(Self);
  else
    FrmPreviewReports := nil;
  end;
  inherited;
end;

procedure TFrmPrincipal.AppPadraoConfigReportPadrao(liIdReports,
  liOrigemCm: Integer; DesReport: TObject; var Config: Boolean);
var
  CtrlRptCAR: TCtrlRptCAR;
begin
  inherited;
  CtrlRptCAR := TCtrlRptCAR.Create;
  try
    Config := ConfigReport(liIdReports, liOrigemCm, CtrlRptCAR, DesReport);
    CtrlRptCAR.free;
  except
    CtrlRptCAR.free;
    raise;
  end;
end;

procedure TFrmPrincipal.mnuLotesdeRecebimentoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConsRecLoteMT, TfrmConsRecLoteMT, false);
end;

procedure TFrmPrincipal.parcelasdocClick(Sender: TObject);
begin
  inherited;
  TFrmAgrupaParcelaMT.AbrirForm(opfDocumento, NovaParcela);
end;

//Início - André Tavares - pendência 3138 - 23/10/2003
procedure TFrmPrincipal.MnuTipoDocumentoxAlteradorxModuloClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadTpDocxAltxMod, TfrmCadTpDocxAltxMod, false);
end;
//Fim - André Tavares - pendência 3138 - 23/10/2003


procedure TFrmPrincipal.mnuExportaLancMTClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExportaLancMT, TfrmExportaLancMT, false);
end;


procedure TFrmPrincipal.mnuConveniosBancariosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadConvenioBancoMT, TFrmCadConvenioBancoMT, false);
end;

procedure TFrmPrincipal.MnuHistoricosContabeisClick(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmCadHistoContabilMT, TFrmCadHistoContabilMT, false );
end;

procedure TFrmPrincipal.TiposDesembolso1Click(Sender: TObject);
begin
  inherited;
  with TfrmCadTipoDesembMT.create(self) do show;
end;

procedure TFrmPrincipal.FormasDeRecebientoXCentrodeCustoXContaContbil1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmTrdxCCxContaMT,TFrmTrdxCCxContaMT,False);
end;

procedure TFrmPrincipal.TiposdeDesembolsoXImpostosAgregados1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadRecDesXAgregMT,TfrmCadRecDesXAgregMT,False);
end;

procedure TFrmPrincipal.Tiposdealteradores1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadAlteradoresMT,TfrmCadAlteradoresMT,False);

end;

procedure TFrmPrincipal.MnuAlteradorXRelacionamentosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmTipoAlteradorxCCxContaMT,TFrmTipoAlteradorxCCxContaMT,False);

end;

procedure TFrmPrincipal.Tiposlientes1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadTipoCliente, TfrmCadTipoCliente, false);
end;

procedure TFrmPrincipal.TiposdeClientesxTiposdeRecebimento1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadTipoxDesembMT, TFrmCadTipoxDesembMT, false);
end;

procedure TFrmPrincipal.Clientes1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadCliente, TfrmCadCliente, false);
end;

procedure TFrmPrincipal.mnudocregistraExecute(Sender: TObject);
begin
  inherited;
  TFrmLancDocCapCar.AbrirForm(opldEfetivo);
end;

procedure TFrmPrincipal.msgBoletosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadMsgBoletoMT, TfrmCadMsgBoletoMT, false);
end;

procedure TFrmPrincipal.mnuTipoEventoClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadTipoEvento, TfrmCadTipoEvento, False );
end;

procedure TFrmPrincipal.mnuEventosClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmLancEventoMT, TfrmLancEventoMT, False );
end;

procedure TFrmPrincipal.AutomticoRetornoemGrandeVolume1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmBaixaIntBancoVolumeMT, TFrmBaixaIntBancoVolumeMT, false)
end;

//Helio - SOL Nº 253577-17359 PPM Nº 842402
procedure TFrmPrincipal.mmuCadastroMEmailClick(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmCadModeloEmail, TFrmCadModeloEmail, False );
end;

procedure TFrmPrincipal.mnuRegistrodeCarteiraClick(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmRegistroCarteiraBoleto, TFrmRegistroCarteiraBoleto, False );//Darivaldo Alencar SIG 29271
end;

procedure TFrmPrincipal.mnuRemessaEletronicaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmRemessaEletronicaDeb, TFrmRemessaEletronicaDeb, False);
end;

Initialization

  Sistema.NomeModulo     := 'Contas a Receber';  // Nome do Módulo
  Sistema.IdModulo       := 4 ;                  // IdModulo cadastrado no SAD
   Sistema.Versao := '3.04.21b';
  Sistema.NomeAplicativo := 'Contas a Receber';

  IntegraBack            := TIntegraBack.Create(True,True,True);
  IntegraBack.RecPag     := 'R';

  Modulo                 := TModulo.Create;




finalization
   // Rodolpho da Silva - 02/06/2005
   Modulo.Free;
   IntegraBack.Free;





end.
