program Compras;

uses
  Forms,
  uAutorizacao,
  fCMEntrada,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FPreview in '..\..\Cm\Relatórios\FPreview.pas' {FrmPreview},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  FMTAtendPrePronta in '..\..\Shared\Almox_Compras\FontesMT\FMTAtendPrePronta.pas' {FrmMTAtendPrePronta},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  FCadAlmox in '..\..\Shared\Almox_Compras\Fontes\FCadAlmox.pas' {FrmCadAlmox},
  FCadContrato in '..\..\Shared\Almox_Compras\Fontes\FCadContrato.pas' {FrmCadContrato},
  FCadProduto in '..\..\Shared\Almox_Compras\Fontes\FCadProduto.pas' {frmCadProduto},
  FCadInsumos in '..\..\Shared\Almox_Compras\Fontes\FCadInsumos.pas' {frmCadInsumos},
  FCadOutros in '..\..\Shared\Almox_Compras\Fontes\FCadOutros.pas' {FrmCadOutros},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {frmCadastroGridCS},
  FCadCores in '..\..\Shared\Almox_Compras\Fontes\FCadCores.pas' {FrmCadCores},
  FCadTipoAgre in '..\..\Shared\Almox_Compras\Fontes\FCadTipoAgre.pas' {FrmCadTipoAgre},
  FCadUnCusteio in '..\..\Shared\Almox_Compras\Fontes\FCadUnCusteio.pas' {FrmCadUnCusteio},
  FCadUnMedida in '..\..\Shared\Almox_Compras\Fontes\FCadUnMedida.pas' {frmCadUnMedida},
  FCadUsuxAlmox in '..\..\Shared\Almox_Compras\Fontes\FCadUsuxAlmox.pas' {FrmCadUsuxAlmox},
  FLogCCusto in '..\..\Shared\Almox_Compras\Fontes\FLogCCusto.pas' {frmLogCCusto},
  FSoliComp2 in '..\..\Shared\Almox_Compras\Fontes\FSoliComp2.pas' {FrmSoliComp2},
  FSoliPrePronta in '..\..\Shared\Almox_Compras\Fontes\FSoliPrePronta.pas' {FrmSoliPrePronta},
  FUsuxCCusto in '..\..\Shared\Almox_Compras\Fontes\FUsuxCCusto.pas' {FrmUsuxCCusto},
  FMTViewContrato in '..\..\Shared\Almox_Compras\FontesMT\FMTViewContrato.pas' {FrmMTViewContrato},
  UConversaoMed in '..\..\Shared\Almox_Compras\Fontes\UConversaoMed.pas',
  UProduto in '..\..\Shared\Almox_Compras\Fontes\UProduto.pas',
  FCadItemVenda in '..\..\Shared\Almox_Compras\Fontes\FCadItemVenda.pas' {FrmCadItemVenda},
  FParamCompras in 'FParamCompras.pas' {FrmParamCompras},
  FCadComprador in 'FCadComprador.pas' {FrmCadComprador},
  FCadArtxForn in 'FCadArtxForn.pas' {FrmCadArtxForn},
  FAdicionaForn in 'FAdicionaForn.pas' {frmAdicionaForn},
  FCotacao in 'FCotacao.pas' {FrmCotacao},
  DCompras in 'DCompras.pas' {DtmCompras: TDataModule},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports},
  FParamImpCxPeq in 'FParamImpCxPeq.pas' {FrmParamImpCxPeq},
  FParamImpCxPeqR in 'FParamImpCxPeqR.pas' {FrmParamImpCxPeqR},
  fParamSoliComp in 'fParamSoliComp.pas' {frmParamSoliComp},
  FParamSolPrePronta in 'FParamSolPrePronta.pas' {FrmParamSolPrePronta},
  FParamCadSolPrePronta in 'FParamCadSolPrePronta.pas' {FrmParamCadSolPrePronta},
  FParamImpOC in 'FParamImpOC.pas' {FrmParamImpOC},
  FParamControleOC in 'FParamControleOC.pas' {FrmParamControleOC},
  FParamCotForn in 'FParamCotForn.pas' {FrmParamCotForn},
  FParamColeta in 'FParamColeta.pas' {FrmParamColeta},
  FParamCotProd in 'FParamCotProd.pas' {FrmParamCotProd},
  FResumoCot in 'FResumoCot.pas' {FrmResumoCot},
  FViewUltComp in 'FViewUltComp.pas' {FrmViewUltComp},
  FParamCotProdxForn in 'FParamCotProdxForn.pas' {FrmParamCotProdxForn},
  FCadUsuxGrpProd in '..\..\Shared\Almox_Compras\Fontes\FCadUsuxGrpProd.pas' {FrmCadUsuxGrpProd},
  DRelCompras in 'DRelCompras.pas' {DtmRelCompras},
  FCadTamanho in '..\..\Shared\Almox_Compras\Fontes\FCadTamanho.pas',
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  RControleOC in 'RControleOC.pas' {RptControleOC},
  RCxPeqR in 'RCxPeqR.pas' {RptCxPeqR},
  RCotProdxForn in 'RCotProdxForn.pas' {RptCotProdxForn},
  FParamFornSemComp in 'FParamFornSemComp.pas' {FrmParamFornSemComp},
  FParamAcompProc in 'FParamAcompProc.pas' {FrmParamAcompProc},
  FViewCotacao in 'FViewCotacao.pas' {FrmViewCotacao},
  FApagaItemSCI in '..\..\Shared\Almox_Compras\Fontes\FApagaItemSCI.pas' {FrmApagaItemSCI},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  FCadastroGridMT in '..\..\Cm\Forms\Source\FCadastroGridMT.pas' {FrmCadastroGridMT},
  FMtCadUnidCusteio in '..\..\Shared\Almox_Compras\FontesMT\FMtCadUnidCusteio.pas' {FrmMTCadUnidCusteio},
  FMtCadTamanho in '..\..\Shared\Almox_Compras\FontesMT\FMtCadTamanho.pas' {FrmMtCadTamanho},
  FMtCadCor in '..\..\Shared\Almox_Compras\FontesMT\FMtCadCor.pas' {FrmMtCadCor},
  FMTCadComprador in '..\FontesMT\FMTCadComprador.pas' {FrmMTCadComprador},
  FMtCadContratoProd in '..\..\Shared\Almox_Compras\FontesMT\FMtCadContratoProd.pas' {FrmMtCadContratoProd},
  FMtCadArtxForn in '..\FontesMT\FMtCadArtxForn.pas' {FrmMtCadArtxForn},
  FMtCadGrupoProd in '..\..\Shared\Almox_Compras\FontesMT\FMtCadGrupoProd.pas' {FrmMtCadGrupoProd},
  FMtCadSCPrePronta in '..\..\Shared\Almox_Compras\FontesMT\FMtCadSCPrePronta.pas' {FrmMtCadSCPrePronta},
  FMtCadCustAgregado in '..\..\Shared\Almox_Compras\FontesMT\FMtCadCustAgregado.pas' {FrmMtCadCustAgregado},
  FMtSoliCompra in '..\..\Shared\Almox_Compras\FontesMT\FMtSoliCompra.pas' {FrmMtSoliCompra},
  FMtAtribComprador in '..\FontesMT\FMtAtribComprador.pas' {FrmMtAtribComprador},
  FMtMontaProcesso in '..\FontesMT\FMtMontaProcesso.pas' {FrmMTMontaProcesso},
  FMTAdicionaForn in '..\FontesMT\FMTAdicionaForn.pas' {frmMTAdicionaForn},
  FMTCotacao in '..\FontesMT\FMTCotacao.pas' {FrmMTCotacao},
  FrAgregados in '..\..\Shared\Almox_Compras\FontesMT\FrAgregados.pas' {FrameAgregados: TFrame},
  FMTSumarioCot in '..\FontesMT\FMTSumarioCot.pas' {frmMTSumarioCot},
  FMTJustif in '..\FontesMT\FMTJustif.pas' {FrmMTJustif},
  FMtCadAlmoxarifado in '..\..\Shared\Almox_Compras\FontesMT\FMtCadAlmoxarifado.pas' {FrmMtCadAlmoxarifado},
  FMtCadUnidMedida in '..\..\Shared\Almox_Compras\FontesMT\FMtCadUnidMedida.pas' {FrmMTCadUnidMedida},
  FMTCadOCSemCot in '..\FontesMT\FMTCadOCSemCot.pas' {FrmMTCadOCSemCot},
  FMTCancelaOC in '..\FontesMT\FMTCancelaOC.pas' {FrmMTCancelaOC},
  FMTViewSCI in '..\FontesMT\FMTViewSCI.pas' {FrmMTViewSCI},
  FMTViewCotacao in '..\FontesMT\FMTViewCotacao.pas' {FrmMTViewCotacao},
  FMTViewUltCompra in '..\FontesMT\FMTViewUltCompra.pas' {FrmMTViewUltCompra},
  FMTCadArtigo in '..\..\Shared\Almox_Compras\FontesMT\FMTCadArtigo.pas' {FrmMTCadArtigo},
  FCadGrupoProd in '..\..\Shared\Almox_Compras\Fontes\FCadGrupoProd.pas' {frmCadGrupoProd},
  FMTLoginCCusto in '..\..\Shared\Almox_Compras\FontesMT\FMTLoginCCusto.pas' {FrmMTLoginCCusto},
  FMTAcompSCI in '..\..\Shared\Almox_Compras\FontesMT\FMTAcompSCI.pas' {FrmMTAcompSCI},
  FMTParamCompras in '..\FontesMT\FMTParamCompras.pas' {FrmMTParamCompras},
  FMTAvaliacao in '..\..\Shared\Almox_Compras\FontesMT\FMTAvaliacao.pas' {FrmMTAvaliacao},
  FMTViewRestricao in '..\..\Shared\Almox_Compras\FontesMT\FMTViewRestricao.pas' {FrmMTViewRestricao},
  uCtrlAvaliacaoForn in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlAvaliacaoForn.pas',
  uDbAvaliacao in '..\..\Shared\Almox_Compras\DbObjetos\uDbAvaliacao.pas',
  uDbItemavaliacao in '..\..\Shared\Almox_Compras\DbObjetos\uDbItemavaliacao.pas',
  FViewContrato in '..\..\Shared\Almox_Compras\Fontes\FViewContrato.pas' {FrmViewContrato},
  UModulo in 'UModulo.pas',
  uCtrlApagaItemSCI in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlApagaItemSCI.pas',
  FMTApagaItemSCI in '..\..\Shared\Almox_Compras\FontesMT\FMTApagaItemSCI.pas' {FrmMTApagaItemSCI},
  FAtendPrePronta in '..\..\Shared\Almox_Compras\Fontes\FAtendPrePronta.pas' {FrmAtendPrePronta},
  FMTLancCaixaPeq in '..\FontesMT\FMTLancCaixaPeq.pas' {frmMTLancCaixaPeq},
  FMTConsCaixaPeq in '..\FontesMT\FMTConsCaixaPeq.pas' {FrmMTConsCaixaPeq},
  FMTEfetivCaixaPeq in '..\FontesMT\FMTEfetivCaixaPeq.pas' {FrmMTEfetivCaixaPeq},
  FMTCadCaixaPeq in '..\FontesMT\FMTCadCaixaPeq.pas' {frmMTCadCaixaPeq},
  FMTUsuxCaixaPeq in '..\FontesMT\FMTUsuxCaixaPeq.pas' {frmMTUsuxCaixaPeq},
  FMTExcluiEfetCxPeq in '..\FontesMT\FMTExcluiEfetCxPeq.pas' {frmMTExcluiEfetCxPeq},
  uCtrlAlmoxCompra in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlAlmoxCompra.pas',
  uCtrlArtigo in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlArtigo.pas',
  uCtrlArtxForn in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlArtxForn.pas',
  uCtrlCaixaPequeno in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlCaixaPequeno.pas',
  uCtrlComprador in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlComprador.pas',
  uCtrlContratoProd in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlContratoProd.pas',
  uCtrlCor in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlCor.pas',
  uCtrlCotacao in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlCotacao.pas',
  uCtrlGrupoProd in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlGrupoProd.pas',
  uCtrlLocalizacao in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlLocalizacao.pas',
  uCtrlOrdemCompra in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlOrdemCompra.pas',
  uCtrlProcessoCompra in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlProcessoCompra.pas',
  uCtrlSCPrePronta in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlSCPrePronta.pas',
  uCtrlSoliCompra in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlSoliCompra.pas',
  uCtrlTamanho in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlTamanho.pas',
  uCtrlTipoAgregado in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlTipoAgregado.pas',
  uCtrlUnCusteio in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlUnCusteio.pas',
  uCtrlAlmox in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlAlmox.pas',
  uDbValorAgregCot in '..\..\Shared\Almox_Compras\DbObjetos\uDbValorAgregCot.pas',
  uDbAgregItemOC in '..\..\Shared\Almox_Compras\DbObjetos\uDbAgregItemOC.pas',
  uDbAgregTotOC in '..\..\Shared\Almox_Compras\DbObjetos\uDbAgregTotOC.pas',
  udbAlmox in '..\..\Shared\Almox_Compras\DbObjetos\udbAlmox.pas',
  uDbArtigo in '..\..\Shared\Almox_Compras\DbObjetos\uDbArtigo.pas',
  uDbArtxcontaxcc in '..\..\Shared\Almox_Compras\DbObjetos\uDbArtxcontaxcc.pas',
  uDbArtxForn in '..\..\Shared\Almox_Compras\DbObjetos\uDbArtxForn.pas',
  uDbBorderocaixapeq in '..\..\Shared\Almox_Compras\DbObjetos\uDbBorderocaixapeq.pas',
  uDbCaixapequeno in '..\..\Shared\Almox_Compras\DbObjetos\uDbCaixapequeno.pas',
  uDbContratoProd in '..\..\Shared\Almox_Compras\DbObjetos\uDbContratoProd.pas',
  uDbConver in '..\..\Shared\Almox_Compras\DbObjetos\uDbConver.pas',
  uDbCor in '..\..\Shared\Almox_Compras\DbObjetos\uDbCor.pas',
  uDbCotacoes in '..\..\Shared\Almox_Compras\DbObjetos\uDbCotacoes.pas',
  uDbCustoMed in '..\..\Shared\Almox_Compras\DbObjetos\uDbCustoMed.pas',
  uDbGrpxComp in '..\..\Shared\Almox_Compras\DbObjetos\uDbGrpxComp.pas',
  uDbGrupoProd in '..\..\Shared\Almox_Compras\DbObjetos\uDbGrupoProd.pas',
  uDbImpostos in '..\..\Shared\Almox_Compras\DbObjetos\uDbImpostos.pas',
  uDbItemEntr in '..\..\Shared\Almox_Compras\DbObjetos\uDbItemEntr.pas',
  udbItemNota in '..\..\Shared\Almox_Compras\DbObjetos\udbItemNota.pas',
  uDbItemOC in '..\..\Shared\Almox_Compras\DbObjetos\uDbItemOC.pas',
  uDbItemPedi in '..\..\Shared\Almox_Compras\DbObjetos\uDbItemPedi.pas',
  uDbItemSCPrePronta in '..\..\Shared\Almox_Compras\DbObjetos\uDbItemSCPrePronta.pas',
  uDbItemSoli in '..\..\Shared\Almox_Compras\DbObjetos\uDbItemSoli.pas',
  uDbLanccaixapeq in '..\..\Shared\Almox_Compras\DbObjetos\uDbLanccaixapeq.pas',
  uDbOc in '..\..\Shared\Almox_Compras\DbObjetos\uDbOc.pas',
  uDbParAlmox in '..\..\Shared\Almox_Compras\DbObjetos\uDbParAlmox.pas',
  uDbParamCompras in '..\..\Shared\Almox_Compras\DbObjetos\uDbParamCompras.pas',
  uDbPrazoentrega in '..\..\Shared\Almox_Compras\DbObjetos\uDbPrazoentrega.pas',
  uDbPrazoEntregaOC in '..\..\Shared\Almox_Compras\DbObjetos\uDbPrazoEntregaOC.pas',
  uDbPrazoPgto in '..\..\Shared\Almox_Compras\DbObjetos\uDbPrazoPgto.pas',
  uDbPrazoPgtoOC in '..\..\Shared\Almox_Compras\DbObjetos\uDbPrazoPgtoOC.pas',
  uDbProcesso in '..\..\Shared\Almox_Compras\DbObjetos\uDbProcesso.pas',
  uDbProcxArt in '..\..\Shared\Almox_Compras\DbObjetos\uDbProcxArt.pas',
  uDbProduto in '..\..\Shared\Almox_Compras\DbObjetos\uDbProduto.pas',
  uDbSCItemOC in '..\..\Shared\Almox_Compras\DbObjetos\uDbSCItemOC.pas',
  uDbSCPrePronta in '..\..\Shared\Almox_Compras\DbObjetos\uDbSCPrePronta.pas',
  uDbSoliComp in '..\..\Shared\Almox_Compras\DbObjetos\uDbSoliComp.pas',
  uDbTamanho in '..\..\Shared\Almox_Compras\DbObjetos\uDbTamanho.pas',
  uDbTipoPerda in '..\..\Shared\Almox_Compras\DbObjetos\uDbTipoPerda.pas',
  uDbTransfAlmox in '..\..\Shared\Almox_Compras\DbObjetos\uDbTransfAlmox.pas',
  uDbUnCusteio in '..\..\Shared\Almox_Compras\DbObjetos\uDbUnCusteio.pas',
  uDbUnMedida in '..\..\Shared\Almox_Compras\DbObjetos\uDbUnMedida.pas',
  uDbUsuarioxcaixapeq in '..\..\Shared\Almox_Compras\DbObjetos\uDbUsuarioxcaixapeq.pas',
  uDbUsuxAlmox in '..\..\Shared\Almox_Compras\DbObjetos\uDbUsuxAlmox.pas',
  uDbUsuxGrupProd in '..\..\Shared\Almox_Compras\DbObjetos\uDbUsuxGrupProd.pas',
  DAlmoxarifado in '..\..\Shared\Almox_Compras\Fontes\DAlmoxarifado.pas' {DtmAlmoxarifado: TDataModule},
  uCtrlIntegracaoContabil in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlIntegracaoContabil.pas',
  FMTConsultaRecMerc in '..\..\Shared\Almox_Compras\FontesMT\FMTConsultaRecMerc.pas' {FrmMTConsultaRecMerc},
  FMTCadUsuxGrpProd in '..\..\Shared\Almox_Compras\FontesMT\FMTCadUsuxGrpProd.pas' {FrmMTCadUsuxGrpProd},
  uListaCamposHistAlmox in '..\..\Shared\Almox_Compras\Fontes\uListaCamposHistAlmox.pas',
  uCtrlImplantaSaldo in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlImplantaSaldo.pas';

{$R *.RES}
{$R COMPRAS_RES.RES}

begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;
  Application.Initialize;
  Application.Title := 'Compras';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  frmCMEntrada.Hide;
  Application.CreateForm(TDtmCompras, DtmCompras);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmCMEntrada.Free; // Andre Imakawa - SIG - 52331
  Application.Run;

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Compras 2000
================================================================================
CM$VER      3.03.14d    26/06/2008
--------------------------------------------------------------------------------
Pendência: 27683
Descrição: Retirando do principal o menu, Consulta geral de pessoa.
================================================================================
CM$VER      3.03.14c    10/03/2008
--------------------------------------------------------------------------------
Reorganizando estrutura de diretórios.
================================================================================
CM$VER      3.03.14b    08/02/2008
--------------------------------------------------------------------------------
Pendência : 27262 (Ajustes)
Rotina    : Cobrança / Recebimento / Manual
Descrição : Na tela de Efetivação de Caixa Pequeno, o sistema não está filtrando os
            tipos de documento para somente mostrar os tipos de Recebimento.
================================================================================
CM$VER      3.03.14a    27/12/2007
--------------------------------------------------------------------------------
Pendência: 27025
Descrição: Acerto no cálculo dos dias úteis calculado após a data atual.
================================================================================
CM$VER      3.03.14     06/11/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.18
================================================================================
CM$VER      3.03.13     15/08/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.17
================================================================================
CM$VER      3.03.12c    15/08/2007
--------------------------------------------------------------------------------
Pendência: 26047
tela     : Caixa Pequeno/Efetivação de Lançamento
Descrição: Alterei para que apenas os centros de responsabilidade pertencentes ao usuário
           sejam carrgado na lista de centros de responsabilidade.
================================================================================
CM$VER      3.03.12b    10/08/2007
--------------------------------------------------------------------------------
Pendência : 26045
Tela      : Movimentação/Compra/Solicitação Avulsa
Descrição : Corrige o problema da integração com o orçamento.
Pendência : 26045 - 26061 (ajuste)
Tela      : Movimentação/Compra/Solicitação Avulsa
Descrição : Adequação da rotina com a unidade de integração de sistemas. Os parâmetros de
configuração do sistema em relação a integração com o orçamento não estavam sendo acatados.
================================================================================
CM$VER      3.03.12a    24/07/2007
--------------------------------------------------------------------------------
Pendência : 25483
Tela      : Caixa Pequeno \ Lançamento e Sistemas \ Configurações \ Parâmetros do Sistema
Descrição : No Parâmetros do Sistema foi criado uma opção para Ativar o relacionamento do Usuário x Centro de Responsabilidade.
            Com o parâmetro ativado reflete diretamente no Centro de Reponsabilidade do lançamento do Caixa Pequeno.
================================================================================
CM$VER      3.03.12     11/07/2007
--------------------------------------------------------------------------------
Pendência : 24180
Tela      : Movimentação/Compra/Solicitação Avulsa
Descrição : Critica se a data de emissão for menor que a data atual.
Liberação do padrão 5.10.16
================================================================================
CM$VER      3.03.11d    15/08/2007
--------------------------------------------------------------------------------
Pendência: 26047
tela     : Caixa Pequeno/Efetivação de Lançamento
Descrição: Alterei para que apenas os centros de responsabilidade pertencentes ao usuário
           sejam carregado na lista de centros de responsabilidade.
================================================================================
CM$VER      3.03.11c    24/07/2007
--------------------------------------------------------------------------------
Pendência : 25483
Tela : Caixa Pequeno \ Lançamento e Sistemas \ Configurações \ Parâmetros do Sistema
Descrição : No Parâmetros do Sistema foi criado uma opção para Ativar o relacionamento do Usuário x Centro de Responsabilidade.
            Com o parâmetro ativado reflete diretamente no Centro de Reponsabilidade do lançamento do Caixa Pequeno.
================================================================================
CM$VER      3.03.11b    02/07/2007
--------------------------------------------------------------------------------
Pendência : 25747
Tela      : Caixa Pequeno \ Lançamento
Descrição : Corrigido o filtro do desembolso, que estava desabilitando após inserir um lançamento de caixa pequeno.
================================================================================
CM$VER      3.03.11a    17/05/2007
--------------------------------------------------------------------------------
Pendência : 25373
Tela      : Compras/Cancelamento de OC
Descrição : - Na confirmação de um novo processo a ser criado, não exibia a mensagem com o novo número
do processo gerado.
            - O cancelamento de OC estava afetando o sistema de Compras e Almoxarifado.
              A quantidade de itens recebidos exibidos na lista de itens da solicitação
              era alterada (dobrando).
================================================================================
CM$VER      3.03.11     04/05/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.15
Pendência 21549 - RAD
- Inclusão de condições por grupo de produto.
================================================================================
CM$VER      3.03.10     30/01/2007
--------------------------------------------------------------------------------
Liberação no Padrão 5.10.14
Pendência : 24187
Tela      : Compras/Processo de Compras
Descrição : OCs sem cotação não devem participar do processo de compras (As SCIs não podem ser listadas na tela de Processo de Compras)
================================================================================
CM$VER      3.03.09     15/12/2006
--------------------------------------------------------------------------------
Pendência : 21700
Tela      : Caixa Pequeno \ Lançamento
Descrição : O filtro do desembolso, traz apenas o desembolso relacionado ao caixa selecionado.
Pendência : 23860
Descrição : Implementação do RAD+ no Almoxarifado e Compras
================================================================================
CM$VER      3.03.07     06/10/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.12
================================================================================
CM$VER      3.03.06b    01/09/2006
--------------------------------------------------------------------------------
Pendência : 23138
Tela      : Compras / Sumário de Cotação
Descrição : Tratamento do status da cotação de forma exclusiva. Não deve mais
            coexistir a seguinte situação: 'U' com 'C' ou 'C' com 'S'.
Pendência : 21409
Tela      : Parâmetro de compras e Solicitação de Compras
Descrição : criação do centro de responsabilidade padrão para ser utilizado como
            default na tela de solicitação de compras
================================================================================
CM$VER      3.03.06a    27/07/2006
--------------------------------------------------------------------------------
Pendência : 22504
Tela: Consultas\Relatórios\ Compras\Emissões Diversas\Ordem de Compras - CBS
Descrição :  Relatório default não estava Imprimindo.
================================================================================
CM$VER      3.03.06     20/07/2006
--------------------------------------------------------------------------------
Liberação no padrão 5.10.11
================================================================================
CM$VER      3.03.05     12/07/2006
--------------------------------------------------------------------------------
Liberação do Padrão 5.10.10
Pendência : 21380
Tela      : Cadastro de Produtos
Descrição : Correção do erro que ocorria ao tentar excluir o insumo.
pendência : 22826
Tela : Consulta/Relatórios/Emissões Diversas/Ordem de Compras (MODELO 2)
Descrição : Ajuste da Máscara de Telefone
================================================================================
CM$VER      3.03.04c    29/06/200
--------------------------------------------------------------------------------
pendência:21975
tela: Caixa Pequeno\Lançamentos
Descriçâo : Ajuste da configuração dos campos da tela.
================================================================================
CM$VER      3.03.04b    21/06/2006
--------------------------------------------------------------------------------
Pendência: 22504 Sumário/Cotação e Cancelamento de OC
Descrição: - Corrigido o erro da mensagem na tela do  Cancelamento de OC, para que mostre
             a mensagem referente a Reserva/Compromisso apenas quando houver reser-
             va e compromissos.
           - Ao cancelar a OC, o sistema fará a pergunta se quer gerar um novo processo.
           - Corrigido o erro de impressão de OCs. Após a geração das OCs, serão
             gerados os relatórios das OCs (da primeira a última).
           - Foi corrigido o problema referente ao cancelamento de OCs com reserva
             orçamentária(na solicitação) e compromissos criados a partir do Sumário/Cotações.
================================================================================
CM$VER      3.03.04a    14/06/2006
--------------------------------------------------------------------------------
Pendência: 22534 Caixa Pequeno\Lançamentos
Descrição: Corrigido o erro de integridade referencial ao lançar uma nota para
          o caixa pequeno.
pendência:21975
tela: Caixa Pequeno\Lançamentos
Descriçâo : Ajuste da configuração dos campos da tela.
================================================================================
CM$VER      3.03.04     22/03/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.09
================================================================================
CM$VER      3.03.03b    10/02/2006
--------------------------------------------------------------------------------
pendência: 18505
tela: Caixa Pequeno\Lançamentos
Descriçaõ: Ajuste da integração com o orçamento.
================================================================================
CM$VER      3.03.03a    09/02/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.08
pendência: 21512
tela: Caixa Pequeno\Lançamentos
Descriçaõ: Erro de constraint ao lançar um caixa pequeno sem compromisso.
================================================================================
CM$VER      3.03.03     08/02/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.08
pendência: 18505
tela: Caixa Pequeno\Lançamentos
Descriçaõ: implementação da integração do caixa pequeno com o orçamento.
================================================================================
CM$VER      3.03.02c    27/12/2005
--------------------------------------------------------------------------------
pendência: 21091
tela: compras \ cancelamento de oc
descrição: Ao cancelar uma OC(compras \ cancelamento de oc) gerada na tela de "OC sem cotação" o sistema está duplicando a quantidade quando retornamos para criar a OC novamente.
================================================================================
CM$VER      3.03.02b    13/10/2005
--------------------------------------------------------------------------------
Pendência: 20374
Tela: sumário de cotação
Descrição : acerto na criação do compromisso,  1 oc = 1 compromisso, estava gerando 1 
compromisso para cada item quando 2 fornecedores venciam a cotação para o mesmo item.
================================================================================
CM$VER      3.03.02a    28/09/2005
--------------------------------------------------------------------------------
pendência 17970
Tela consultas\sumario de cotacoes
descricao: acerto no campo justificativa.
================================================================================
CM$VER      3.03.02     19/08/2005
--------------------------------------------------------------------------------
Liberação do padrão 5.10.07
Pendência: 19697
Tela: Solicitação de compra\ Avulsa
descrição do erro : Os planos estão sendo listados no combo em duplicatas.
Pendência: 19690
Tela: Movimento\Recebimento de mercadoria\com oc
descrição do erro : Não está gravando o codalmoxarifado.
================================================================================
CM$VER      3.03.01     21/06/2005
--------------------------------------------------------------------------------
Pendência : 19518
Telas : Sumário de Cotação e Consulta OC
Descrição: Estava salvando apenas o último número de compromisso criado mesmo
                 que fossem gerados mais de um compormisso para uma mesma OC.
Pendência : 19288
Tela: Movimento\Recebimento de Mercadoria
Descrição : filtrar pelo idplanoprev contabil
Pendência 19309
Tela: Compras/Cancela OC
Descrição dos Erros: 1) Ao cancelar uma ou mais OC's que faziam parte de um
                        PROCESSO que gerou várias OC's, alterava indevidamente o
                        saldo da Conta Orçamentária, pois a cada cancelamento,
                        todo o valor da RESERVA era reaberto e o valor do
                        COMPROMISSO era devolvido para a Conta Orçamentária.
                     2) Depois de cancelada uma das OC's, era permitido gerar um
                        novo PROCESSO, originando em novas OC's indevidamente e
                        consequentemente alterando o saldo da Conta Orçamentária
                        indevidamente.
                     3) A mensagem ao término do processo de Sumário de Cotação
                        estava sendo exibida com OC's e COMPROMISSOS gerados
                        de forma desordenada.
Pendencia : 19276 \Consultas\Consulta O.C.
Descrição : Colocar nesta tela um campo que mostra o valor total da oc.
================================================================================
CM$VER      3.03.00d    11/05/2005
--------------------------------------------------------------------------------
Pendência 19095
Tela: Compras\Sumário de Cotação
Descrição do Erro: Não gerava todos os Compromissos Necessários para as OC's
                   geradas e não mostrava corretamente o Compromisso relacionado
                   a OC.
Pendência : 18764
Tela      : Compras\O.C. Sem Cotação
Descrição : Ao gerar a O.C sem cotação, e tentar fazer o Recebimento de
            Mercadoria no Almoxarifado, a O.C gerada não estava aparecendo no
            combo para fazer o devido recebimento.
================================================================================
CM$VER      3.03.00c    27/04/2005
--------------------------------------------------------------------------------
Pendência 19040
Tela: Compras\Solicitação de compras
Descrição do Erro: Não está excluindo (marcar como excluído FLGOK = 'E') o processo RAD corrente quando outro é gerado na operação de alteração da SCI.
Pendência 18822
Tela: Compras\Solicitação de Compras\Avulsa
Descrição do erro: Ao selecionar uma SCI e Alterar ods iítens ocorre o erro 'Lookup Table is not active'.
Pendência 18602
Tela: Cadastros\Produto\Insumos
Descrição do erro: Ao associar um novo centro de custo para um produto(sem a opção de contabilizar para todo o grupo marcado) os centro de custos já parametrizados somem e só fica o que acabei de cadastrar.
 Pendência 18698
Tela: Compras\Solicitação de Compras\Avulsa
Descrição do erro: Ao excluir uma solicitação o processo rad gerado continua pendente.
- Pendencia 18065 - Ajustes no processo de Ordem de Compra sem Cotação.
================================================================================
CM$VER      3.03.00b    26/01/2005
--------------------------------------------------------------------------------
- Pendencia 18513 - Ajuste na pendencia para voltar a quantidade pendente quando exclui o recebimento de mercadoria
================================================================================
CM$VER      3.03.00a    28/12/2004
--------------------------------------------------------------------------------
Pendência: 17167 (Almoxarifado)
Tela: Cadastros\Produtos\Grupo de Produtos
Descrição: gravar o campo RECPAG = 'P' na tabela GRUPOPROD.
Pendência: 17127 (compras)
Tela: Compras\Solicitação de Compra\Avulsa
Descrição: Ao tentar alterar uma solicitação, o sistema diz que já possui irens atribuídos, 
                 e logo a seguir apresenta outra mensagem 'O número enviado é de uma Reserva
                 já efetivada'. Até aí tudo bem, o prpblema é que não adianta clicar em OK, 
                 só conseguimos sair da tela, após clicar Ctrl+Alt+Del. 
================================================================================
CM$VER      3.03.00     27/12/2004
--------------------------------------------------------------------------------
Pendência 18113 (Almoxarifado)
Tela: Movimentação / Recebimento de Mercadoria / Com O.C
Descrição: Contabilização com as informações de Plano, Patrocinadora e Programa específicos informados por ocasião do cadastramento da SCI,
levando em consideração a segregação de recursos.
Pendência 17560
Tela: Todas
Descrição: Substituir os métodos de uDocumento pelos métodos de uCtrlDocumento, de uLancContab pelos de uCtrlLancamento
e de uLancFinanc pelos métodos da bpl cmcFinanObj50 .
Pendência 17228 (módulo compras)
Tela: Compras \ Solicitação de Compras \ Avulsa
Descrição: Implementação do combo para buscar o valor unitário pelo valor da última compra ou custo médio
Pendencia 17058
Tela: Compras \ Solicitação de Compras \ Avulsa
Descrição: Implementados os campos de Plano/Patro/Programa na tela de solicitaçào de compras avulsa
================================================================================
CM$VER      3.02.09h    08/10/2004
--------------------------------------------------------------------------------
Pendência 16738
Descrição: ajuste da pendência 16738, para que o sistema utize a bpl cmplaneorcobj50.bpl.
================================================================================
CM$VER      3.02.09g    23/09/2004
--------------------------------------------------------------------------------
Pendência 16969
Tela: Movimentação\Recebimento de mecadoria com OC
Descrição: Após selecionar o fornecedor, aparece a tela para seleção dos itens.  
Se um item for selecionado, mas se retornar ao combo do fornecedor novamente, 
está sendo possível escolher o mesmo item quantas vezes quiser.
================================================================================
CM$VER      3.02.09f    16/09/2004
--------------------------------------------------------------------------------
Pendência 16979
Tela: Movimentação\compras\solicitação avulsa.
Descrição: O campo destino não aparece marco com está gravado no parâmetro do sistema.
================================================================================
CM$VER      3.02.09e    16/09/2004
--------------------------------------------------------------------------------
Pendência 16738
Tela: Compras\Sumário de Cotação
Descrição: não permitir que usuários concorrentes gerem o mesmo número de compromisso.
================================================================================
CM$VER      3.02.09d    16/08/2004
--------------------------------------------------------------------------------
Pendência 17150
Tela: Consultas\Acompanhamento de solicitação de compras
Descrição: exibir na tela o campo observação preenchido no momento da solicitação da SCI.
Através de um duplo clique no grid.
================================================================================
CM$VER      3.02.09c    05/08/2004
--------------------------------------------------------------------------------
Pendência: 17280
Tela: Movimentações\Compras\Recebimento de Mercadorias
Descrição: Quando no Contas a Pagar estar preenchido o parametro com nº de vencimento, 
o sistema não está permitindo o lançamento de notas com vencimento futuro ou do dia. 
A mensagem do erro é: USUARIO SEM PRIVILÉGIO DE LANÇAR/ ALTERAR 
DOCUMENTO COM DATA DE VENCIMENTO INDICADO.
================================================================================
CM$VER      3.02.09b    27/07/2004
--------------------------------------------------------------------------------
Pendência 17168
Tela: Movimentações\ Recebimento de mercadorias
Descrição Ao lançar uma NF no recebimento da mercadoria , está gerando um lançamento com valo = 0,00. Como
pode ser observado na ficha financeira.
================================================================================
CM$VER      3.02.09a    22/07/2004
--------------------------------------------------------------------------------
Pendência : 17234
Tela: Sumário de Cotação
Descrição : Não estava gravando o prazo de entrega e a data de pagamento,
            com isso estava dando erro no relatório de Ordem de Compras -  Modelo 2
================================================================================
CM$VER      3.02.09     20/07/2004
--------------------------------------------------------------------------------
- Pendencia 16790 - Gera processo RAD somente quando a OC for gerada sem Cotação
- Pendencia 17147 - Gera processo RAD quando produto não tiver movimentaçào na solicitaçào de compras
================================================================================
CM$VER      3.02.08g    07/07/2004
--------------------------------------------------------------------------------
- Pendencia 17082 - Sumário de Cotação: No aceite de seleção criticar os valores com as reservas orçamentárias
- Pendencia 17109 - Cancelamento de OC: Mesmo não querendo gerar outro processo de compra, o sistema estava ignorando
- Pendencia 17118 - OC sem cotação: Estava dando erro ao gravar.
================================================================================
CM$VER      3.02.08f    22/06/2004
--------------------------------------------------------------------------------
Pendencia 17054 - Acerto na geração dos itens de OC
================================================================================
CM$VER      3.02.08e    15/06/2004
--------------------------------------------------------------------------------
Pendência: 15073
Tela: todas as telas que utilizam o campo Tipo de Desembolso.
Descrição: nas telas que utilizam o campo Tipo de Desembolso, listar somente os tipods de desembolso ATIVOS.
================================================================================
CM$VER      3.02.08d    31/05/2004
--------------------------------------------------------------------------------
- Pendencia 15659 - Revisão de toda rotina de Compra (SCI, OC c/ Cotação) com indicação de Reserva Orçamentária e geração automática de Compromisso Orçamentário.
- Pendencia 16658 - Compras/ OC sem cotação -> Ao clicar em inserir, o campo O.C Nº, já vem preenchido com -1.
- Pendencia 16659 - Inserir na tela de Procurar(monta select), a opção de Status da O.C.:
                              (P) - Pendente
                              (R) - Recebido
                              (C) - Cancelado
                              (A) - Recebido Parcialmente
================================================================================
CM$VER      3.02.08c    20/05/2004
--------------------------------------------------------------------------------
Pendência: 15073
Tela: todas as telas que utilizam o campo Tipo de Desembolso.
Descrição: nas telas que utilizam o campo Tipo de Desembolso, listar somente os tipods de desembolso ATIVOS.
================================================================================
CM$VER      3.02.08b    30/01/2004
--------------------------------------------------------------------------------
Pendência 15940
Descrição: Correção do problema que ocorria quando associava-se um fornecedor ao mesmo produto duas vezes, na mesma operação.
================================================================================
CM$VER      3.02.08a    29/01/2004
--------------------------------------------------------------------------------
Pendência 16010
Descrição: Correção do texto "PENDENETES" para "PENDENTES".
================================================================================
CM$VER      3.02.08     14/10/2003
--------------------------------------------------------------------------------
Resolução da pendência 15181 - Erro no cancelamento da OC = "não há usuário 
atualmente em progresso."
================================================================================
CM$VER      3.02.07     05/08/2003
--------------------------------------------------------------------------------
- Resolução da Pendência: 14238  
  Impedir a movimentação de centros de custo inativos e acrescentar o seu código.
  
- Resolução da Pendência Nº 14579
  > Tela\Opçao No Sistema: Relatório/ Ordem de Compras 2
  No relatório vir na moeda da cotação e não na moeda padrão(real)
================================================================================
CM$VER      3.02.06     13/06/2003
--------------------------------------------------------------------------------
Ajuste no relatório de solicitação de comrpas par mostrar a data de emissão
Ajuste no relatório de resumo de cotação para mostrar justificativa
Na tela de sumário de cotação agora mostra o valor total
================================================================================
CM$VER      3.02.05     06/05/2003
--------------------------------------------------------------------------------
- Corrgida a Integração com o RAD na alteração de Solicitação de Compra  Avulsa; 
  onde sempre dizia que os itens não pertenciam ao mesmo grupo.
================================================================================
CM$VER      3.02.04     22/04/2003
--------------------------------------------------------------------------------
- Alterada Tela de Solicitação de Compras, onde não esta exbindo o centro de 
  resposabilidade padrão.
================================================================================
CM$VER      3.02.03     26/03/2003
--------------------------------------------------------------------------------
- Corrigido a tela de OC sem Cotação, onde ao excluir um item excluia dois.
- Implementado filtro por empresa :
  * Cancelamento OC
  * OC sem Cotação 
================================================================================
CM$VER      3.02.02     18/03/2003
--------------------------------------------------------------------------------
- Corrgido Relatório de Cotação por Produto, onde estava duplicando fornecedor 
  caso este não tivesse colocado o preço.
- Corrigido tela de Montagem do Processo de Compra, onde se alterado o processo e
  colocado um novo fornecedor esta dava a mensagem de erro "INDEX IS READ-ONLY".
================================================================================
CM$VER      3.02.01     06/02/2003
--------------------------------------------------------------------------------
- Corrigido atendimento de solicitação pré-pronta, onde ocorria o erro não existe 
  transação de usuário em progrsso.
- Corrigido  de solicitação de compras avulsa, quando usava o RAD integrado, 
  onde ocorria o erro não existe transação de usuário em progrsso.
================================================================================
CM$VER      3.02.00     06/02/2003
--------------------------------------------------------------------------------
- Implementado controle RAD para geração de OC no sumário de cotação.
- Implementado tela de Consulta de Recebimento de Mercadoria
================================================================================
CM$VER      3.01.15     09/01/2003
--------------------------------------------------------------------------------
- Corrigida a Tela de Efetivação de Caixa Pequeno, onde não obedecia o fitro de caixa
   pequeno trasendo sempre o primerio da lista.
================================================================================
CM$VER      3.01.14     19/12/2002
--------------------------------------------------------------------------------
-  Alterado o liste de custos agregado nos cadastro de produtos
-  Alterada a tela de Sumário de Cotação para impressão direta de OC
================================================================================
CM$VER      3.01.13     12/12/2002
--------------------------------------------------------------------------------
- Corrigido Cadastro de Grupo de Produtos, onde estava dando constraint na alteração
  do tipo de desembolço.
- Corrigdo tela de Montagem do Processo de compra onde : 
   *  Não exclui a o processo
   * Ao retornar o item para pendente dava list index auto of bound
   * No desatribuia  o fornecedor do item quando este já tim valores ou prazo de entrega
     ou pagamento.
 
================================================================================
CM$VER      3.01.12     10/12/2002
--------------------------------------------------------------------------------
- Corrigida Tela de Montagem do processo de compra, onde ao se desabilitar um 
  fornecedor para um item que tivesse já os dados entrados na cotação dava constraint
================================================================================
CM$VER      3.01.11     28/11/2002
--------------------------------------------------------------------------------
- Corrigido o Cadastro de Produtos, onde não excluia a contabilização.
================================================================================
CM$VER      3.01.10     27/11/2002
--------------------------------------------------------------------------------
- Corrigida a Cópia da Seleção dos Fornecedores na tela de Montagem do Processo de
  Compra.
================================================================================
CM$VER      3.01.09     19/11/2002
--------------------------------------------------------------------------------
- Implementado no status para consulta de OC, item com recebimento parcial.
- Corrigido a tela de Montagem do processo de compra, onde não estava na alteração
  incluindo um novo fornecedor.
================================================================================
CM$VER      3.01.08     18/11/2002
--------------------------------------------------------------------------------
- Acertado o Sumário de Cotação, onde gerava OC´s selecionadas pelo sistema 
  mesmo quando o usuário escolhia outro fornecedor.
- Acertada Tela de Cotação de Preços, não estava trasendo os tipos de impostos 
  existentes
================================================================================
CM$VER      3.01.07     30/10/2002
--------------------------------------------------------------------------------
- Corrigida a tela de Motagem de Compra, onde estava dando constraint quando
  se alterava o processo e se inseria um novo Fornecedor.
- Corrigido a tela de Cotação, onde ao se selecionar um fornecedor mostrava o preço
  de outro.
================================================================================
CM$VER      3.01.06     28/10/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 10119
  > Tela\Opçao No Sistema: Cadastro de Outros Produtos
  Cadastro de Outros Produtos :
Ao adicionar  Impostos e cores na inclusão de um "Outro Produto" esta dando o erro O campo Artigo.flgativo não foi informado
- Resolução da Pendência Nº 10120
  > Tela\Opçao No Sistema: Cadastro de Itens de Venda
  Cadastro de Itens de Venda :
Ao adiconar impostos e Cores na inclusão de um item de venda  esta dando erro o campo Artigo.flgativo não foi informado.
- Resolução da Pendência Nº 10121
  > Tela\Opçao No Sistema: Cadastro - Solicitação Pré-Pronta
  Cadastro - Solicitação Pré-Pronta - O titulo, label, esta escrito ´cadstro´
- Resolução da Pendência Nº 10130
  > Tela\Opçao No Sistema: Efetivação de lançamento de caixa pequeno
  Efetivação de lançamento de caixa pequeno :
A tela de confirmação de Lançamento esta vindo em Inglês
- Corrigida a exclusão da SCI
================================================================================
CM$VER      3.01.05     25/10/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 9938
  > Tela\Opçao No Sistema: Cadastros/Produto/Itens de pdv
  Cadastros/Produto/Itens de pdv - essa opção de " itens de pdv" não poderia esta associado para cadastro no Compras e sim no almoxarifado.O mesmo só aparece para ser cadastrado na opção TIPO nos demais cadastros de produtos.segue imagem em anexo.
- Resolução da Pendência Nº 10000
  > Tela\Opçao No Sistema: Compras/Cotação - Fornecedor
  Compras/Cotação -No campo de Fornecedor o sistema só traz um fornecedor(o primeiro), mesmo selecionando o outro para efetuar a cotação.
- Resolução da Pendência Nº 10005
  > Tela\Opçao No Sistema: Consulta/Relatórios/Operacionais/Controle de Ordem de Compas
  Consulta/Relatórios/Operacionais/Controle de Ordem de Compas - ao tentar consultar o relatório segue o erro de:EDatabaseError -  qryControleOC: Type mismatch for field 'DESCRICAO', expecting: Memo actual: String
Endereço: 405B8DF0
 
- Resolução da Pendência Nº 10007
  > Tela\Opçao No Sistema: Caixa Pequeno/Exclusão de Efetivação de Lançamento
  Caixa Pequeno/Exclusão de Efetivação de Lançamento- O sistema esta trazendo a tela de "ACOMPANHAMENTO DE SOLICITAÇÃO DE COMPRA"
================================================================================
CM$VER      3.01.04     18/10/2002
--------------------------------------------------------------------------------
- Correção do Cadastro de Grupo de Produto, onde este não permitia excluir itens
  analíticos
================================================================================
CM$VER      3.01.03     11/10/2002
--------------------------------------------------------------------------------
- Corrigida a tela de Montagem do processo de compra não estava incluindo
  um novo forncedor na lista dos fornecedores já utlizados pelo determinado
  produto.
================================================================================
CM$VER      3.01.02     30/09/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 9349
  > Tela\Opçao No Sistema: Cadastro de Custos Agregados
  Cadastro de Custos Agregados :
Ao Confirmar a inclusào de um custo Agregado o sistema retorna a seguinte mensagem de Erro :
" O campo tipoagre.codtratfiscd não informado "
================================================================================
CM$VER      3.01.01     28/08/2002
--------------------------------------------------------------------------------
- Correção no cadastro de Grupo de Produto, os botões ficavam sempre disponíveis
================================================================================
CM$VER      3.01.00     19/08/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 6385
  > Tela\Opçao No Sistema: Relatório Cotação - Produtos x Fornecedores
  Incluir a soma VALOR TOTAL DO ITEM X QUANTIDADE.
- Resolução da Pendência Nº 6648
  > Tela\Opçao No Sistema: Solicitação de Compras 
  Incluir na criação do processo no RAD o centro de custo da solicitação
- Resolução da Pendência Nº 6649
  > Tela\Opçao No Sistema: Processo de Compra
  * Gerar o processo do RAD no momento que gera o processo de cotação.
* No sumário de cotação bloquear a geração da OC se o processo não estiver autorizado.
================================================================================
CM$VER      3.00.23     09/05/2002
--------------------------------------------------------------------------------
- Correção na tela de lançamento de caixa pequeno, não estava filtrando o centro
  de custo por empresa.
================================================================================
CM$VER      3.00.22     30/04/2002
--------------------------------------------------------------------------------
- Em Compras - Montagem do Processo de Compras -Clica-se inserir, depois OK 
  para gravar e o sistema está aceitando gravar sem ter nenhum ítem atribuido.
- Implementar para sair o número do fax no Relatório Ordem de Compras ( Modelo 1)
================================================================================
CM$VER      3.00.21     04/02/2002
--------------------------------------------------------------------------------
- Corrigido relatório de Solicotação de compras, onde se o produto tivesse diversos
  prazos de pagamento na OC, duplica o item no relatório.
  
================================================================================
CM$VER      3.00.20     28/12/2001
--------------------------------------------------------------------------------
- Corrigido a impressão de OC no momento da geração, onde só imprimia a primeira gerada.
================================================================================
CM$VER      3.00.19     21/12/2001
--------------------------------------------------------------------------------
- Otimizado o Relatório de Solicitação de Compra
- Resolução da Pendência Nº 4946, ao alterar a quantidade fornecida na cotação e clicar em
  atualizar o sistema não permanece com a alteração feita. 
================================================================================
CM$VER      3.00.18     14/12/2001
--------------------------------------------------------------------------------
- Alterado o relatório de Cotação - Fornecedor x Produto, onde foi implementado
  o mix ideal (igual ao menor valor) e o percentual em relação mix ideal.
- Corrigida tela de O.C. sem cotação : Quando alterava o valor do produto troca os id da
  tabela SCIITEMOC, ocasionando a não impressão da mesma.
================================================================================
CM$VER      3.00.16     18/10/2001
--------------------------------------------------------------------------------
- Alterada a tela de Cotação, onde não trasia os produtos que não tinha o saldo 
  implantado no almoxarifado.
================================================================================
CM$VER      3.00.15     05/10/2001
--------------------------------------------------------------------------------
- Correção da  Tela de Sumário de Cotação, onde esta dava erro de geração de OC, 
  Constriant com a tabela ItemOC. 
-  Implementado alterações no Relatorio Cotação x Fornecedores.
   * Colocar opção para emitir valor unitário
   * Imprimir preco ultma compra     Pend : 4674
- Implementado em todos os relatorios de Cotação as informações de ultima compra.
  atraves da nova view VWULTCOMPRA. Pend : 4673
================================================================================
CM$VER      3.00.14     02/10/2001
--------------------------------------------------------------------------------
- Corrigido alteração de OC sem Cotação, onde este não aparecia mais no recebimento 
  de mercadoria, quando era alterada.
- Implementada a opção de Impressão de OC direta na tela de sumário. Pend : 4672 
- Colocado o Saldo atual na tela de Cotação. Pend : 4671
================================================================================
CM$VER      3.00.13     27/09/2001
--------------------------------------------------------------------------------
-Acertada tela de parâmetro do Relatório de Solicitação Pré-Pronta
================================================================================
CM$VER      3.00.12     21/08/2001
--------------------------------------------------------------------------------
Pendencias efetuadas :
- Quando temos 2 SCI´s com o mesmo produto, na quantidade 
  solicitada está OK e na  fornecida está considerando 
  somente uma delas.
- Colocar justificativa em TODOS os relatórios de cotação.
- Obrigar o preenchimento do prazo de entrega e prazo de 
  pagamento na tela de OC sem cotação.
- Na tela de "Atribuição de Compradores" quando selecionamos 
  a SCI e o Grupo, o filtro de grupo é ignorado. 
- Na escolha dos fornecedores poder copiar a seleção do primeiro 
  produto para os outros.
- Tirar da Tela de Atribuição de COmprador os Itens com 
  quantidade pendente Igual a zero.
================================================================================
CM$VER      3.00.11     09/08/2001
--------------------------------------------------------------------------------
* Acertada a Contabilização da Efetivação do Caixa Pequeno quando escolhe-se a opção 
  de encerrar o caixa pequeno.
================================================================================
CM$VER      3.00.10     08/08/2001
--------------------------------------------------------------------------------
- Acertado a efetivação de Caixa Pequeno, não estava funcionando.
================================================================================
CM$VER      3.00.09     07/08/2001
--------------------------------------------------------------------------------
- Corrigido a Tela de OS sem Cotação, quando alterado o preço do produto se este 
  possuisse descrição variável, este ha perdia.
================================================================================
CM$VER      3.00.08     06/08/2001
--------------------------------------------------------------------------------
- Corrigido o Relatório de Acompanhamento dos Processos.
================================================================================
CM$VER      3.00.07     07/07/2001
--------------------------------------------------------------------------------
- Implementado Relatório de Acompanhamento de Processo
- Implementado Relatório de Fornecedores sem Compra por data
- Implementado Encerramento de Caixa Pequeno
================================================================================
CM$VER      3.00.06     20/06/2001
--------------------------------------------------------------------------------
- Acertado o relatório de Solicitação Pré-Pronta.
================================================================================
CM$VER      3.00.05     18/06/2001
--------------------------------------------------------------------------------
- Otimizado o relatório de Solicitação de Compras.
================================================================================
CM$VER      3.00.04     05/06/2001
--------------------------------------------------------------------------------
- Relatório de Cotação por Produto e Fornecedor : Alterador para mostrar todos 
  os produtos mesmo os que não tiveram cotação.
- Relatorio de Cotação Por produto para não considerar a OC cacelada como 
  valor de última compra.
================================================================================
CM$VER      3.00.03     01/06/2001
--------------------------------------------------------------------------------
- Implemetado no Cadastro de Solicitação de Compras - Avulsa
      * Não poder alter solicitações com itens atribuidos para compra.
================================================================================
CM$VER      3.00.02     11/05/2001
--------------------------------------------------------------------------------
- Acertado Relatório de Emissão de OC modelo 1, estava duplicando os itens da OC
================================================================================
CM$VER      3.00.01     09/05/2001
--------------------------------------------------------------------------------
- Rotina de verificação dos dados da ultima compra foi ajustada nos relatorio do processo
  de cotação. 
================================================================================
CM$VER      3.00.00     26/04/2001
--------------------------------------------------------------------------------
- beração em Delphi 5.0
- Implementação da nova estrutura de conato na Ordem de Compra.
================================================================================
CM$VER      2.03.09     15/03/2001
--------------------------------------------------------------------------------
- Implementação. Não obrigar o campo referência na efetivação de caixa Pequeno.
================================================================================
CM$VER      2.03.08     07/03/2001
--------------------------------------------------------------------------------
- Alterado o relatório de OC modelo default e modelo 1, não aparecia o contato do fornecedor
================================================================================
CM$VER      2.03.07     29/01/2001
--------------------------------------------------------------------------------
- Tela de Cotação , dava a mensagem  "is '' not a valid value", ao sair do campo
  preço corrigido. 
================================================================================
CM$VER      2.03.06     18/01/2001
--------------------------------------------------------------------------------
- Correção na impressão de O.C. no modelo 1 e 2 , estava exibindo valores errados para
   IPI.
- Correção na geração de OC, quando esta possuia reserva orcamentaria não gerava
   a OC.
 
================================================================================
CM$VER      2.03.05     12/12/2000
--------------------------------------------------------------------------------
-  Acertada a Alteração de OC sem cotação, estava dando constraint R_6863.
================================================================================
CM$VER      2.03.04     30/11/2000
--------------------------------------------------------------------------------
- Alteração na OC sem cotação, baixa da solicitação de compras a quantidade
  pendente.
================================================================================
CM$VER      2.03.03     07/11/2000
--------------------------------------------------------------------------------
- Alteração no cálculo default da base de calculo do imposto, na teal de OC sem cotação.
================================================================================
CM$VER      2.03.02     18/10/2000
--------------------------------------------------------------------------------
- Alterada a tela de Compradores não estava desatribuindo o comprador.
================================================================================
CM$VER      2.03.01     17/10/2000
--------------------------------------------------------------------------------
- Lançamento de Caixa Pequeno inplementado só exibir os centro de custo e os centro 
  de responsabilidade ativos.
================================================================================
CM$VER      2.03.00     28/09/2000
--------------------------------------------------------------------------------
- Implementado o Cadastro de Usuario por Grupo de Produto
================================================================================
CM$VER      2.02.08     11/09/2000
--------------------------------------------------------------------------------
-  Implementar a pesquisa à associação de usuários x centros de responsabilidade
   na tela de  cadastro de solicitação de compras.
- Acertado Relatorio de COntrole de OC.
================================================================================
CM$VER      2.02.07     08/09/2000
--------------------------------------------------------------------------------
- Alterada tela de Consulta de OC para compatibilização com o RAD.
================================================================================
CM$VER      2.02.06     30/08/2000
--------------------------------------------------------------------------------
- Implementeda a restrição de grau do grupo de produto no tipo de processo.
================================================================================
CM$VER      2.02.05     09/08/2000
--------------------------------------------------------------------------------
- Implementado parâmetro para automaticamente, gravar a observação do item
  da SCI no item da OC.
- Implementado compatibilidade com PLANO, PATRCINADORA.
================================================================================
CM$VER      2.02.04     30/05/2000
--------------------------------------------------------------------------------
- Acertada a exclusão de processos que não estava disponibilizando os produtos outra vez
  para outra cotação ou para uma OC sem cotação.
================================================================================
CM$VER      2.02.03     23/05/2000
--------------------------------------------------------------------------------
- Acertado o calculo da simulação dos impostos vinculados ao fornecedor.
================================================================================
CM$VER      2.02.02     22/05/2000
--------------------------------------------------------------------------------
- Acertado a qquantidade gerada da OC quando existiam mais de uma SCI para o mesmo
   produto
================================================================================
CM$VER      2.02.01     17/05/2000
--------------------------------------------------------------------------------
- Implementação :
    * Opção de ordenação no relatório de SCI.
    * Na Cotão OC para calcular o imposto que era agregado ao produto, era necessário
       que se desse varios TAB's.
    * Nº do Processo na tela de Consulta OC
    * Cálculo do Imposto Automático Na SCI quando esta é feita com contrato.
    * Imprissão de OC  por faixa de números.
    * Na Consulta de OC incluidos os campos para pesquisa, Nome e Razão Social do Fornecedor
================================================================================
CM$VER      2.02.00     12/05/2000
--------------------------------------------------------------------------------
* Incluída a integração com o orçamento
================================================================================
CM$VER      2.01.07     10/05/2000
--------------------------------------------------------------------------------
 - Sumario de cotação desabilita o o botão de gerar ordem de Compras, evitando 
   duplicidade.
 - Implementado Visualialização de Ultimas Compras
 - Implementado Imrpessão de Solicitação de Compras  com a opção RESUMIDA, onde
   esta será impressa sem os 4 ultimos fornecedores.
 - Implementado na Consulta de OC, visualização da SCI geradora de cada item da OC.
================================================================================
CM$VER      2.01.06     04/05/2000
--------------------------------------------------------------------------------
- Otimização na tela de Solcitação de Compras Avulsa, no referente a verificação de 
  contrato.
- Alteração na Geração de O.C. na tela de Sumário de Cotação na rotina de Verificação
  de Vencedores da Cotação.
- Resolução da Pendência Nº 2008
  Não está inserindo um registro quando o parametro está zerado.
================================================================================
CM$VER      2.01.05     27/04/2000
--------------------------------------------------------------------------------
- Acertador o Relatório de Cotação por Produto 
================================================================================
CM$VER      2.01.04     24/04/2000
--------------------------------------------------------------------------------
- Acertado o relatório de Controle de ordem de compra que estava duplicando.
- Alterada a impressão da SCI para ficar um pouco mais rápida
================================================================================
CM$VER      2.01.03     20/04/2000
--------------------------------------------------------------------------------
-  Corrigido o cadastro de Ordem de Compras sem Cotação, não estaga gravando
   a empresa em que efetuava a O.C., impossibilitando o recebimento de mercadoria.
================================================================================
CM$VER      2.01.02     17/04/2000
--------------------------------------------------------------------------------
- Alterado o Cancenlamento de O.C. , quando possuia valores agregados não
  cancelava.
- Alterado os Relatório de Solicitação de Compra para imprimir a observação do
  Item.
================================================================================
CM$VER      2.01.01     10/04/2000
--------------------------------------------------------------------------------
- Implementado od relatórios :
  * Ordem de Compras (Modelo 1)                                                     
  * Controle de Ordem de Compras                                                    
  * Cotação - por Fornecedor                                                        
  * Coleta de Preços                                                                
  * Cotação por Produto                                                             
-  Acertado no processo de compras não trazia a descrição variável 
   dos produtos na cotacão. 
-  Solicitação Pré-Pronta estava repetido quatidade solicitada para todos os
   itens, quando estava selecionada para repetir o Nº de pessoas. Acertado.
================================================================================
CM$VER      2.01.00     28/03/2000
--------------------------------------------------------------------------------
- Primeira versão
================================================================================
CM$ALT}























































































































































































































































































































































































































































































































