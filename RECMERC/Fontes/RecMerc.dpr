program RecMerc;



uses
  Forms,
  uAutorizacao,
  fCMEntrada,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\CM\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  fAguarde in '..\..\cm\forms\Source\fAguarde.pas' {frmAguarde},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmprincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  dAlmoxCaf in '..\..\Almoxarifado\Fontes\dAlmoxCaf.pas' {dtmAlmoxCaf: TDataModule},
  FCadastroPai in '..\..\Cm\Forms\Source\FCadastroPai.pas' {frmCadastroPai},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {FrmCadastroGridCS},
  FCadConjunto in '..\..\Almoxarifado\Fontes\FCadConjunto.pas' {frmCadConjunto},
  FCadLocal in '..\..\Almoxarifado\Fontes\FCadLocal.pas' {FrmCadLocal},
  UConversaoMed in '..\..\Almox&Compras\Fontes\UConversaoMed.pas',
  uMovNew in '..\..\Almoxarifado\Fontes\uMovNew.pas',
  DMoviment in '..\..\Almoxarifado\Fontes\DMoviment.pas' {DtmMoviment: TDataModule},
  UProduto in '..\..\Almox&Compras\Fontes\UProduto.pas',
  FCadProduto in '..\..\Almox&Compras\Fontes\FCadProduto.pas' {frmCadProduto},
  FUsuxCCusto in '..\..\Almox&Compras\Fontes\FUsuxCCusto.pas' {FrmUsuxCCusto},
  FCadCores in '..\..\Almox&Compras\Fontes\FCadCores.pas' {FrmCadCores},
  FCadInsumos in '..\..\Almox&Compras\Fontes\FCadInsumos.pas' {frmCadInsumos},
  FCadItemPDV in '..\..\Almox&Compras\Fontes\FCadItemPDV.pas' {FrmCadItemPDV},
  FCadItemVenda in '..\..\Almox&Compras\Fontes\FCadItemVenda.pas' {FrmCadItemVenda},
  FCadOutros in '..\..\Almox&Compras\Fontes\FCadOutros.pas' {FrmCadOutros},
  FCadTamanho in '..\..\Almox&Compras\Fontes\FCadTamanho.pas' {frmCadTamanho},
  FCadTipoAgre in '..\..\Almox&Compras\Fontes\FCadTipoAgre.pas' {FrmCadTipoAgre},
  FCadUnCusteio in '..\..\Almox&Compras\Fontes\FCadUnCusteio.pas' {FrmCadUnCusteio},
  FCadUnMedida in '..\..\Almox&Compras\Fontes\FCadUnMedida.pas' {frmCadUnMedida},
  FCadUsuxAlmox in '..\..\Almox&Compras\Fontes\FCadUsuxAlmox.pas' {FrmCadUsuxAlmox},
  FCadUsuxGrpProd in '..\..\Almox&Compras\Fontes\FCadUsuxGrpProd.pas' {FrmCadUsuxGrpProd},
  FLogCCusto in '..\..\Almox&Compras\Fontes\FLogCCusto.pas' {frmLogCCusto},
  FCadAlmox in '..\..\Almox&Compras\Fontes\FCadAlmox.pas' {FrmCadAlmox},
  FCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  FCadGrupoProd in '..\..\Almox&Compras\Fontes\FCadGrupoProd.pas' {frmCadGrupoProd},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports},
  DRptRelats in '..\..\Almoxarifado\Fontes\DRptRelats.pas' {dtmRptRelats},
  FParamResFinAnual in '..\..\Almoxarifado\Fontes\FParamResFinAnual.pas' {FrmParamResFinAnual},
  fParamValidade in '..\..\Almoxarifado\Fontes\fParamValidade.pas' {frmParamValidade},
  FParamABCComp in '..\..\Almoxarifado\Fontes\FParamABCComp.pas' {FrmParamABCComp},
  FParamAjustFinanc in '..\..\Almoxarifado\Fontes\FParamAjustFinanc.pas' {frmParamAjustFinanc},
  FParamAlmox in '..\..\Almoxarifado\Fontes\FParamAlmox.pas' {frmParamAlmox},
  FParamArtSemMov in '..\..\Almoxarifado\Fontes\FParamArtSemMov.pas' {FrmParamArtSemMov},
  FParamArtxConta in '..\..\Almoxarifado\Fontes\FParamArtxConta.pas' {FrmParamArtxConta},
  FParamCadSolPrePronta in '..\..\Almoxarifado\Fontes\FParamCadSolPrePronta.pas' {FrmParamCadSolPrePronta},
  FParamConAlmoxContab in '..\..\Almoxarifado\Fontes\FParamConAlmoxContab.pas' {FrmParamConAlmoxContab},
  FParamConsMed in '..\..\Almoxarifado\Fontes\FParamConsMed.pas' {FrmParamConsMed},
  FParamContInvent in '..\..\Almoxarifado\Fontes\FParamContInvent.pas' {FrmParamContInvent},
  FParamCurvaAltCustoMed in '..\..\Almoxarifado\Fontes\FParamCurvaAltCustoMed.pas' {FrmParamCurvaAltCustoMed},
  FParamCustAnali in '..\..\Almoxarifado\Fontes\FParamCustAnali.pas' {FrmParamCustAnali},
  FParamCustContab in '..\..\Almoxarifado\Fontes\FParamCustContab.pas' {FrmParamCustContab},
  FParamCustContabSint in '..\..\Almoxarifado\Fontes\FParamCustContabSint.pas' {FrmParamCustContabSint},
  fParamDevolucao in '..\..\Almoxarifado\Fontes\fParamDevolucao.pas' {frmParamDevolucao},
  FParamEtqProduto in '..\..\Almoxarifado\Fontes\FParamEtqProduto.pas' {FrmParamEtqProduto},
  FParamExtMov in '..\..\Almoxarifado\Fontes\FParamExtMov.pas' {FrmParamExtMov},
  FParamExtMovSint in '..\..\Almoxarifado\Fontes\FParamExtMovSint.pas' {FrmParamExtMovSint},
  FParamExtMovUC in '..\..\Almoxarifado\Fontes\FParamExtMovUC.pas' {FrmParamExtMovUC},
  FParamGiroProd in '..\..\Almoxarifado\Fontes\FParamGiroProd.pas' {FrmParamGiroProd},
  FParamInventFF in '..\..\Almoxarifado\Fontes\FParamInventFF.pas' {FrmParamInventFF},
  FParamInventFFData in '..\..\Almoxarifado\Fontes\FParamInventFFData.pas' {FrmParamInventFFData},
  FParamInventFFHoje in '..\..\Almoxarifado\Fontes\FParamInventFFHoje.pas' {FrmParamInventFFHoje},
  FParamLivroInvet in '..\..\Almoxarifado\Fontes\FParamLivroInvet.pas' {FrmParamLivroInvet},
  FParamNFxCustAgreg in '..\..\Almoxarifado\Fontes\FParamNFxCustAgreg.pas' {FrmParamNFxCustAgreg},
  FParamNotaDifOC in '..\..\Almoxarifado\Fontes\FParamNotaDifOC.pas' {FrmParamNotaDifOC},
  FParamPlanInvent in '..\..\Almoxarifado\Fontes\FParamPlanInvent.pas' {frmParamPlanInvent},
  FParamPlanInventGrp in '..\..\Almoxarifado\Fontes\FParamPlanInventGrp.pas' {FrmParamPlanInventGrp},
  FParamPlanProd in '..\..\Almoxarifado\Fontes\FParamPlanProd.pas' {FrmParamPlanProd},
  fParamRecebimento in '..\..\Almoxarifado\Fontes\fParamRecebimento.pas' {frmParamRecebimento},
  FParamRecMercDesemb in '..\..\Almoxarifado\Fontes\FParamRecMercDesemb.pas' {FrmParamRecMercDesemb},
  FParamRecMercSint in '..\..\Almoxarifado\Fontes\FParamRecMercSint.pas' {FrmParamRecMercSint},
  FParamRecon in '..\..\Almoxarifado\Fontes\FParamrecon.pas' {FrmParamRecon},
  FParamReconEst in '..\..\Almoxarifado\Fontes\FParamReconEst.pas' {FrmParamReconEst},
  FParamReconSaldo in '..\..\Almoxarifado\Fontes\FParamReconSaldo.pas' {FrmParamReconSaldo},
  FParamReqCad in '..\..\Almoxarifado\Fontes\FParamReqCad.pas' {FrmParamReqCad},
  FParamReqLancSint in '..\..\Almoxarifado\Fontes\FParamReqLancSint.pas' {FrmParamReqLancSint},
  fParamRequisicao in '..\..\Almoxarifado\Fontes\fParamRequisicao.pas' {frmParamRequisicao},
  FParamResFinanCC in '..\..\Almoxarifado\Fontes\FParamResFinanCC.pas' {FrmParamResFinanCC},
  FParamSalEstMin in '..\..\Almoxarifado\Fontes\FParamSalEstMin.pas' {FrmParamSalEstMin},
  fParamSoliComp in '..\..\Almoxarifado\Fontes\fParamSoliComp.pas' {frmParamSoliComp},
  FParamSolPrePronta in '..\..\Almoxarifado\Fontes\FParamSolPrePronta.pas' {FrmParamSolPrePronta},
  FParamSugestComp in '..\..\Almoxarifado\Fontes\FParamSugestComp.pas' {FrmParamSugestComp},
  FParamTermoInvet in '..\..\Almoxarifado\Fontes\FParamTermoInvet.pas' {FrmParamTermoInvent},
  FParamTotFinanc in '..\..\Almoxarifado\Fontes\FParamTotFinanc.pas' {FrmParamTotFinanc},
  FParamUltMovArt in '..\..\Almoxarifado\Fontes\FParamUltMovArt.pas' {FrmParamUltMovArt},
  fParamABC in '..\..\Almoxarifado\Fontes\fParamABC.pas' {frmParamABC},
  DRelatoriosAlmox in '..\..\Almoxarifado\Fontes\DRelatoriosAlmox.pas' {dtmRelatoriosAlmox},
  FMTConsultaRecMerc in '..\..\Almox&Compras\FontesMT\FMTConsultaRecMerc.pas' {FrmMTConsultaRecMerc},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadModeloHistoricoMT in '..\..\Cm\Forms\SourceMT\FCadModeloHistoricoMT.pas' {FrmCadModeloHistoricoMT},
  FMTConfigHistAlmox in '..\..\Almoxarifado\FontesMT\FMTConfigHistAlmox.pas' {FrmMTConfigHistAlmox},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  FMTRecebMerc in '..\..\Almoxarifado\FontesMT\FMTRecebMerc.pas' {FrmMTRecebMerc},
  FrAgregados in '..\..\Almox&Compras\FontesMT\FrAgregados.pas' {FrameAgregados: TFrame},
  uCtrlTipoAgregado in '..\..\Almox&Compras\CtrlObjetos\uCtrlTipoAgregado.pas',
  FMTNotaCompl in '..\..\Almoxarifado\FontesMT\FMTNotaCompl.pas' {FrmMTNotaCompl},
  FMTValTotAgreg in '..\..\Almoxarifado\FontesMT\FMTValTotAgreg.pas' {FrmMTValTotAgreg},
  FMTBaixaDir in '..\..\Almoxarifado\FontesMT\FMTBaixaDir.pas' {FrmMTBaixaDir},
  FMTOCxForn in '..\..\Almoxarifado\FontesMT\FMTOCxForn.pas' {FrmMTOCxForn},
  uCtrlModeloHistorico in '..\..\Cm\Forms\CtrlObjects\uCtrlModeloHistorico.pas',
  uDbModelohistorico in '..\..\Cm\Forms\DbObjects\uDbModelohistorico.pas',
  uCtrlRecebMerc in '..\..\Almox&Compras\CtrlObjetos\uCtrlRecebMerc.pas',
  uCtrlLancamento in '..\..\CMContabObj50\CtrlObjects\uCtrlLancamento.pas',
  uCtrlUnMedida in '..\..\Almox&Compras\CtrlObjetos\uCtrlUnMedida.pas',
  uCtrlAlmoxCompra in '..\..\Almox&Compras\CtrlObjetos\uCtrlAlmoxCompra.pas',
  uCtrlAlteraCustoMed in '..\..\Almox&Compras\CtrlObjetos\uCtrlAlteraCustoMed.pas',
  uCtrlAlteraValidade in '..\..\Almox&Compras\CtrlObjetos\uCtrlAlteraValidade.pas',
  uCtrlAnalEstoque in '..\..\Almox&Compras\CtrlObjetos\uCtrlAnalEstoque.pas',
  uCtrlApagaItemSCI in '..\..\Almox&Compras\CtrlObjetos\uCtrlApagaItemSCI.pas',
  uCtrlArtxForn in '..\..\Almox&Compras\CtrlObjetos\uCtrlArtxForn.pas',
  uCtrlAtualizaMovimento in '..\..\Almox&Compras\CtrlObjetos\uCtrlAtualizaMovimento.pas',
  uCtrlBaixaPerda in '..\..\Almox&Compras\CtrlObjetos\uCtrlBaixaPerda.pas',
  uCtrlCaixaPequeno in '..\..\Almox&Compras\CtrlObjetos\uCtrlCaixaPequeno.pas',
  uCtrlComprador in '..\..\Almox&Compras\CtrlObjetos\uCtrlComprador.pas',
  uCtrlContratoProd in '..\..\Almox&Compras\CtrlObjetos\uCtrlContratoProd.pas',
  uCtrlCor in '..\..\Almox&Compras\CtrlObjetos\uCtrlCor.pas',
  uCtrlCotacao in '..\..\Almox&Compras\CtrlObjetos\uCtrlCotacao.pas',
  uCtrlDataRepresa in '..\..\Almox&Compras\CtrlObjetos\uCtrlDataRepresa.pas',
  uCtrlGrupoProd in '..\..\Almox&Compras\CtrlObjetos\uCtrlGrupoProd.pas',
  uCtrlImplantaSaldo in '..\..\Almox&Compras\CtrlObjetos\uCtrlImplantaSaldo.pas',
  uCtrlIntegracaoContabil in '..\..\Almox&Compras\CtrlObjetos\uCtrlIntegracaoContabil.pas',
  uCtrlInventario in '..\..\Almox&Compras\CtrlObjetos\uCtrlInventario.pas',
  uCtrlLocalizacao in '..\..\Almox&Compras\CtrlObjetos\uCtrlLocalizacao.pas',
  uCtrlMovEstoque in '..\..\Almox&Compras\CtrlObjetos\uCtrlMovEstoque.pas',
  uCtrlMudaUnid in '..\..\Almox&Compras\CtrlObjetos\uCtrlMudaUnid.pas',
  uCtrlNotaFiscal in '..\..\Almox&Compras\CtrlObjetos\uCtrlNotaFiscal.pas',
  uCtrlOrdemCompra in '..\..\Almox&Compras\CtrlObjetos\uCtrlOrdemCompra.pas',
  uCtrlPremiGestEstoque in '..\..\Almox&Compras\CtrlObjetos\uCtrlPremiGestEstoque.pas',
  uCtrlProcessoCompra in '..\..\Almox&Compras\CtrlObjetos\uCtrlProcessoCompra.pas',
  uCtrlProdCasa in '..\..\Almox&Compras\CtrlObjetos\uCtrlProdCasa.pas',
  uCtrlReqManual in '..\..\Almox&Compras\CtrlObjetos\uCtrlReqManual.pas',
  uCtrlReqMat in '..\..\Almox&Compras\CtrlObjetos\uCtrlReqMat.pas',
  uCtrlSCPrePronta in '..\..\Almox&Compras\CtrlObjetos\uCtrlSCPrePronta.pas',
  uCtrlSoliCompra in '..\..\Almox&Compras\CtrlObjetos\uCtrlSoliCompra.pas',
  uCtrlTamanho in '..\..\Almox&Compras\CtrlObjetos\uCtrlTamanho.pas',
  uCtrlTermoInventario in '..\..\Almox&Compras\CtrlObjetos\uCtrlTermoInventario.pas',
  uCtrlTipoPerda in '..\..\Almox&Compras\CtrlObjetos\uCtrlTipoPerda.pas',
  uCtrlUnCusteio in '..\..\Almox&Compras\CtrlObjetos\uCtrlUnCusteio.pas',
  uCtrlAlmox in '..\..\Almox&Compras\CtrlObjetos\uCtrlAlmox.pas',
  uDbValorAgregCot in '..\..\Almox&Compras\DbObjetos\uDbValorAgregCot.pas',
  uDbAgregItemOC in '..\..\Almox&Compras\DbObjetos\uDbAgregItemOC.pas',
  udbAgregNota in '..\..\Almox&Compras\DbObjetos\udbAgregNota.pas',
  uDbAgregTotOC in '..\..\Almox&Compras\DbObjetos\uDbAgregTotOC.pas',
  udbAlmox in '..\..\Almox&Compras\DbObjetos\udbAlmox.pas',
  uDbAnaliseestoque in '..\..\Almox&Compras\DbObjetos\uDbAnaliseestoque.pas',
  uDbArtigo in '..\..\Almox&Compras\DbObjetos\uDbArtigo.pas',
  uDbArtxcontaxcc in '..\..\Almox&Compras\DbObjetos\uDbArtxcontaxcc.pas',
  uDbArtxForn in '..\..\Almox&Compras\DbObjetos\uDbArtxForn.pas',
  uDbBorderocaixapeq in '..\..\Almox&Compras\DbObjetos\uDbBorderocaixapeq.pas',
  uDbCaixapequeno in '..\..\Almox&Compras\DbObjetos\uDbCaixapequeno.pas',
  uDbContratoProd in '..\..\Almox&Compras\DbObjetos\uDbContratoProd.pas',
  uDbConver in '..\..\Almox&Compras\DbObjetos\uDbConver.pas',
  uDbCor in '..\..\Almox&Compras\DbObjetos\uDbCor.pas',
  uDbCotacoes in '..\..\Almox&Compras\DbObjetos\uDbCotacoes.pas',
  uDbCustoMed in '..\..\Almox&Compras\DbObjetos\uDbCustoMed.pas',
  uDbGrpxComp in '..\..\Almox&Compras\DbObjetos\uDbGrpxComp.pas',
  uDbGrupoProd in '..\..\Almox&Compras\DbObjetos\uDbGrupoProd.pas',
  uDbImpostos in '..\..\Almox&Compras\DbObjetos\uDbImpostos.pas',
  uDbInventar in '..\..\Almox&Compras\DbObjetos\uDbInventar.pas',
  uDbItemanaliseestoq in '..\..\Almox&Compras\DbObjetos\uDbItemanaliseestoq.pas',
  uDbItemEntr in '..\..\Almox&Compras\DbObjetos\uDbItemEntr.pas',
  udbItemNota in '..\..\Almox&Compras\DbObjetos\udbItemNota.pas',
  uDbItemOC in '..\..\Almox&Compras\DbObjetos\uDbItemOC.pas',
  uDbItemPedi in '..\..\Almox&Compras\DbObjetos\uDbItemPedi.pas',
  uDbItemSCPrePronta in '..\..\Almox&Compras\DbObjetos\uDbItemSCPrePronta.pas',
  uDbItemSoli in '..\..\Almox&Compras\DbObjetos\uDbItemSoli.pas',
  uDbLanccaixapeq in '..\..\Almox&Compras\DbObjetos\uDbLanccaixapeq.pas',
  uDbLoteVali in '..\..\Almox&Compras\DbObjetos\uDbLoteVali.pas',
  uDbMoviment in '..\..\Almox&Compras\DbObjetos\uDbMoviment.pas',
  udbNota in '..\..\Almox&Compras\DbObjetos\udbNota.pas',
  uDbOc in '..\..\Almox&Compras\DbObjetos\uDbOc.pas',
  uDbParAlmox in '..\..\Almox&Compras\DbObjetos\uDbParAlmox.pas',
  uDbParamCompras in '..\..\Almox&Compras\DbObjetos\uDbParamCompras.pas',
  uDbPrazoentrega in '..\..\Almox&Compras\DbObjetos\uDbPrazoentrega.pas',
  uDbPrazoEntregaOC in '..\..\Almox&Compras\DbObjetos\uDbPrazoEntregaOC.pas',
  uDbPrazoPgto in '..\..\Almox&Compras\DbObjetos\uDbPrazoPgto.pas',
  uDbPrazoPgtoOC in '..\..\Almox&Compras\DbObjetos\uDbPrazoPgtoOC.pas',
  uDbProcesso in '..\..\Almox&Compras\DbObjetos\uDbProcesso.pas',
  uDbProcxArt in '..\..\Almox&Compras\DbObjetos\uDbProcxArt.pas',
  uDbProduto in '..\..\Almox&Compras\DbObjetos\uDbProduto.pas',
  uDbQtdeCont in '..\..\Almox&Compras\DbObjetos\uDbQtdeCont.pas',
  uDbReqMat in '..\..\Almox&Compras\DbObjetos\uDbReqMat.pas',
  uDbResCont in '..\..\Almox&Compras\DbObjetos\uDbResCont.pas',
  uDbSaldo in '..\..\Almox&Compras\DbObjetos\uDbSaldo.pas',
  uDbSCItemOC in '..\..\Almox&Compras\DbObjetos\uDbSCItemOC.pas',
  uDbSCPrePronta in '..\..\Almox&Compras\DbObjetos\uDbSCPrePronta.pas',
  uDbSoliComp in '..\..\Almox&Compras\DbObjetos\uDbSoliComp.pas',
  uDbTamanho in '..\..\Almox&Compras\DbObjetos\uDbTamanho.pas',
  uDbTermoInventario in '..\..\Almox&Compras\DbObjetos\uDbTermoInventario.pas',
  uDbTipoPerda in '..\..\Almox&Compras\DbObjetos\uDbTipoPerda.pas',
  uDbTransfAlmox in '..\..\Almox&Compras\DbObjetos\uDbTransfAlmox.pas',
  uDbUnCusteio in '..\..\Almox&Compras\DbObjetos\uDbUnCusteio.pas',
  uDbUnMedida in '..\..\Almox&Compras\DbObjetos\uDbUnMedida.pas',
  uDbUsuarioxcaixapeq in '..\..\Almox&Compras\DbObjetos\uDbUsuarioxcaixapeq.pas',
  uDbUsuxAlmox in '..\..\Almox&Compras\DbObjetos\uDbUsuxAlmox.pas',
  uDbUsuxGrupProd in '..\..\Almox&Compras\DbObjetos\uDbUsuxGrupProd.pas',
  udbAgregItemNota in '..\..\Almox&Compras\DbObjetos\udbAgregItemNota.pas',
  DAlmoxarifado in '..\..\Almox&Compras\Fontes\DAlmoxarifado.pas' {DtmAlmoxarifado: TDataModule},
  uCtrlBaixaDireta in '..\..\Almox&Compras\CtrlObjetos\uCtrlBaixaDireta.pas',
  uCtrlDevolMerc in '..\..\Almox&Compras\CtrlObjetos\uCtrlDevolMerc.pas',
  uDbConfigNFDevol in '..\..\Almox&Compras\DbObjetos\uDbConfigNFDevol.pas',
  uDbTemplNFDevol in '..\..\Almox&Compras\DbObjetos\uDbTemplNFDevol.pas',
  uCtrlConfigNFDevol in '..\..\Almox&Compras\CtrlObjetos\uCtrlConfigNFDevol.pas',
  uListaCamposHistAlmox in '..\..\Almox&Compras\Fontes\uListaCamposHistAlmox.pas',
  uCtrlClasfisc in '..\..\Geral\CtrlObjetos\uCtrlClasfisc.pas',
  uDbClasfisc in '..\..\Geral\DbObjetos\uDbClasfisc.pas',
  DMovEstoque in '..\..\CMAlmoxCompraObj50\Source\DMovEstoque.pas' {DtmMovEstoque: TDataModule},
  uCtrlArtigo in '..\..\Almox&Compras\CtrlObjetos\uCtrlArtigo.pas',
  fMTParamAlmox in '..\..\Almoxarifado\FontesMT\fMTParamAlmox.pas' {FrmMTParamAlmox},
  uCtrlAlmoxCAF in '..\..\Almox&Compras\CtrlObjetos\uCtrlAlmoxCAF.pas',
  fMTCadAlmoxCAF in '..\..\Almoxarifado\FontesMT\fMTCadAlmoxCAF.pas' {frmMTCadAlmoxCaf},
  FMTDevolMerc in '..\..\Almoxarifado\FontesMT\FMTDevolMerc.pas' {FrmMTDevolMerc},
  UModulo in '..\..\Almoxarifado\Fontes\UModulo.pas',
  uCtrlAlteradorImpostos in '..\..\CMCAPCARUTILOBJ50\CtrlObjects\uCtrlAlteradorImpostos.pas',
  FLancDocCapCarMT in '..\..\CMCAPCARUTILOBJ50\Source\FLancDocCapCarMT.pas' {frmLancDocCAPCAR},
  DCtrlLancDocCapCar in '..\..\CMCAPCAROBJ50\Source\DCtrlLancDocCapCar.pas' {DtmCtrlLancDocCapCar: TDataModule},
  uCtrlLancDocCapCar in '..\..\cmcapcarobj50\ctrlobjects\uCtrlLancDocCapCar.pas',
  DCtrlDocCapCar in '..\..\CMCAPCAROBJ50\Source\DCtrlDocCapCar.pas' {DtmCtrlDocCapCar: TDataModule};

{$R *.RES}
{$R RECMERC_RES.RES}

begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Recebimento de Mercadoria';
  Application.CreateForm(Tfrmprincipal, frmprincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TdtmAlmoxCaf, dtmAlmoxCaf);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Recebimento de Mercadoria
================================================================================
CM$VER      3.01.02a    27/12/2007
--------------------------------------------------------------------------------
Pendência: 27025
Descrição: Acerto no cálculo dos dias úteis calculado após a data atual.
================================================================================
CM$VER      3.01.02     06/11/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.18
================================================================================
CM$VER      3.01.01     31/07/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.17
================================================================================
CM$VER      3.01.00     11/07/2007
--------------------------------------------------------------------------------
Pendência : 24180
Tela      : Movimentação/Compra/Solicitação Avulsa
Descrição : Critica se a data de emissão for menor que a data atual.
Liberação do padrão 5.10.16
================================================================================
CM$VER      3.00.26     04/05/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.15
Pendência 21549 - RAD
- Inclusão de condições por grupo de produto.
================================================================================
CM$VER      3.00.25a    26/03/2007
--------------------------------------------------------------------------------
Pendência : 24854
Tela      : Consulta/Relatório/Recebimento de Mercadoria
Descrição : Correção no total do relatório de recebimento de Mercadorias.
================================================================================
CM$VER      3.00.25     05/02/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.14
Pendência : 23720
Tela      : Movimentação / Compras  / Recebimento de Mercadoria
Descrição : Corrigido o problema da mensagem de Itens pendentes na alteração do recebimento da mercadoria
Pendênciac: 24212
Descrição : Não exibe a mensagem de itens pendentes quando o usuário recebe em uma só nota fiscal
todos os itens da OC.
================================================================================
CM$VER      3.00.24     15/12/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.13
Pendência : 23860
Descrição : Implementação do RAD+ no Almoxarifado e Compras
================================================================================
CM$VER      3.00.23     09/10/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.12
Pendência: 21621
Descrição: Ampliado o tamanho de caracteres do campo histórico para 60 caracteres.
================================================================================
CM$VER      3.00.22     21/07/2006
--------------------------------------------------------------------------------
Liberação no padrão 5.10.11
Pendência: 22883
Tela     : Movimentação/Recebimento de Mercadoria/Com OC
Descrição: - Acerta a coluna quantidade que estava exibindo o total da solicitação para
             o artigo. O correto seria a quantidade de acordo com a solicitação feita.
           - Corrige a quantidade pendente na tela de Item da OC por Fornecedor.
             Estava trazendo o total da solicitação na quantidade pendente ao invés
             da quantidade pendente por solicitação.
================================================================================
CM$VER      3.00.21     12/07/2006
--------------------------------------------------------------------------------
Liberação do Padrão 5.10.10
================================================================================
CM$VER      3.00.20b    08/05/200
--------------------------------------------------------------------------------
Pendência: 22307
Tela     : Movimentação/Recebimento de Mercadoria/Sem OC
Descrição: - Alterada a procedure AtualizaQtdeItens para obter o total de itens da nota.
           - Acerto do recebimento de mercadorias sem OC. O dataset perdia o state.
           - Alteração na sqlCdsItensComOC. Agora traz o nome do plano previdenciário.
           - Alteração na interface do Grid para evitar a falsa impressão de duplicidade
                de linhas.
           - Alteração na crítica de Nota Zerada.
================================================================================
CM$VER      3.00.20a    08/05/200
--------------------------------------------------------------------------------
Pendência: 22280
Tela     : Movimentação/Recebimento de Mercadoria/Sem OC
Descrição: Corrige o recebimento sem OC testando o tipo de recebimento.
================================================================================
CM$VER      3.00.20     04/05/2006
--------------------------------------------------------------------------------
Liberação para o padrão 5.10.09
================================================================================
CM$VER      3.00.19g    03/05/2006
--------------------------------------------------------------------------------
Pendência: 22069
Tela     : Movimentação/Recebimento de Mercadoria/Com OC
Descrição: Correção das quantidades a serem baixadas oriundas da solicitação de compras.
================================================================================
CM$VER      3.00.19f    24/04/2006
--------------------------------------------------------------------------------
Pendência: 22069
Tela     : Movimentação/Recebimento de Mercadoria/Com OC
Descrição: Correção da conversão da unidade de custo médio para unidade de compra.
================================================================================
CM$VER      3.00.19e    17/04/2006
--------------------------------------------------------------------------------
Pendência: 21902
Tela     : Movimentação/Recebimento de Mercadoria/Com OC
Descrição: Acerto do recebimento parcelado
           Correção da quantidade pendente ao excluir.
================================================================================
CM$VER      3.00.19d    10/04/2006
--------------------------------------------------------------------------------
Pendência: 21902
Tela     : Movimentação/Recebimento de Mercadoria/Com OC
Descrição: Alteração na estrutura de consulta referente a OC (itens pendentes)
================================================================================
CM$VER      3.00.19c    07/04/2006
--------------------------------------------------------------------------------
Pendência: 21830
Tela     : Movimentação/Recebimento de Mercadoria/Com OC
Descrição: - Acerto da mensagem no recebimento parcial de mercadorias
           - Acerto da quantidade pendente quando houver edição da quantidade
           - Corrigida a replicação de registros após pressionar o botão de Procurar.
           - Correção do valor pendente ao pressionar o botão adicionar
           - Correção do valor pendente ao pressionar o botão remover
================================================================================
CM$VER      3.00.19b    28/03/2006
--------------------------------------------------------------------------------
Pendência: 21830
Tela     : Movimentação/Recebimento de Mercadoria/Com OC
Descrição: - Acerto do recebimento parcial de mercadorias
           - Acerto automático do valor parcial da nota fiscal pelo somatório dos itens.
           - Não exibe os produtos onde a quantidade pendente = 0 (zero)
           - Limpa o filtro ao sair da tela. Estava sempre considerando o último
             filtro.
================================================================================
CM$VER      3.00.19a    20/03/2006
--------------------------------------------------------------------------------
Pendência: 21547
Tela     : Consulta/Relatório de Recebimento de Mercadorias
Descrição: Correção do sinal dos acréscimos/decréscimos no relatório de Recebimento
          de Mercadorias.
================================================================================
CM$VER      3.00.19     08/02/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.08
pendência: 18505
tela: Caixa Pequeno\Lançamentos
Descriçaõ: implementação da integração do caixa pequeno com o orçamento.
================================================================================
CM$VER      3.00.18c    12/01/2006
--------------------------------------------------------------------------------
Pendência : 21243
Tela: Movimento\Recebimento de Mercadoria (com OC)
Descrição : Estava pegando o campo de quantidade errado.
================================================================================
CM$VER      3.00.18a    02/12/2005
--------------------------------------------------------------------------------
Pendência: 20862
Tela: Recebimento de mercadoria \ com OC
Descrição : Corrigido o processo quanto ao se gerar múltiplas contas de baixa.
================================================================================
CM$VER      3.00.18     18/08/2005
--------------------------------------------------------------------------------
Liberação do padrão 5.10.07
Pendência: 19697
Tela: Solicitação de compra\ Avulsa
descrição do erro : Os planos estão sendo listados no combo em duplicatas.
Pendência: 19690
Tela: Movimento\Recebimento de mercadoria\com oc
descrição do erro : Não está gravando o codalmoxarifado.
Pendência : 18169
Tela: Movimento\Recebimento de Mercadoria
Descrição :  fazer lançamentos com partida dobrada com o parâmetro 
(obriga partida dobrada) da contabilidade estiver marcado.
================================================================================
CM$VER      3.00.17     10/06/2005
--------------------------------------------------------------------------------
Pendência : 19288
Tela: Movimento\Recebimento de Mercadoria
Descrição : filtrar pelo idplanoprev contabil
Pendência: 17612
Tela: todas as telas que contém o relacionamento Plano Prev Contábil x Patro
Descrição : Listar somente os Planos Prev. Contábeis relacionados a patro selecionada.
Liberação de Módulo no SAD.
================================================================================
CM$VER      3.00.16e    27/04/2005
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
ajuste na tela recebimento de Mercadoreia\com e sem OC
================================================================================
CM$VER      3.00.16d    10/03/2005
--------------------------------------------------------------------------------
Pendência 18602
Tela: Cadastros\Produto\Insumos
Descrição do erro: Ao associar um novo centro de custo para um produto(sem a opção de contabilizar para todo o grupo marcado) os centro de custos já parametrizados somem e só fica o que acabei de cadastrar.
Pendência 18698
Tela: Compras\Solicitação de Compras\Avulsa
Descrição do erro: Ao excluir uma solicitação o processo rad gerado continua pendente.
ajuste na tela recebimento de Mercadoreia\com e sem OC
================================================================================
CM$VER      3.00.16c    24/01/2005
--------------------------------------------------------------------------------
- Pendencia 18513 - Acerto no Recebimento de mercadoria com solicitações de compra de programas diferentes
- Pendencia 18531 - Acerto na gravação da OC para colocar como atendida quando não tiverem mais itens pendentes
================================================================================
CM$VER      3.00.16b    28/12/2004
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
CM$VER      3.00.16a    27/12/2004
--------------------------------------------------------------------------------
ajuste na tela recebimento de Mercadoreia\com e sem OC
================================================================================
CM$VER      3.00.16     27/12/2004
--------------------------------------------------------------------------------
ajuste na tela recebimento de Mercadoreia\com e sem OC
Pendência 18113 (Almoxarifado)
Tela: Movimentação / Recebimento de Mercadoria / Com O.C
Descrição: Contabilização com as informações de Plano, Patrocinadora e Programa específicos informados por ocasião do cadastramento da SCI,
levando em consideração a segregação de recursos.
Pendência 17228 (módulo compras)
Tela:Compras\Solicitação de Compras\Avulsa
Descrição: Implementação do combo para buscar o valor unitário pelo valor da última compra ou custo médio
Pendência 16979
Tela: Movimentação\compras\solicitação avulsa.
Descrição: O campo destino não aparece marco com está gravado no parâmetro do sistema.
================================================================================
CM$VER      3.00.15e    23/09/2004
--------------------------------------------------------------------------------
Pendência 16969
Tela: Movimentação\Recebimento de mecadoria com OC
Descrição: Após selecionar o fornecedor, aparece a tela para seleção dos itens.
Se um item for selecionado, mas se retornar ao combo do fornecedor novamente,
está sendo possível escolher o mesmo item quantas vezes quiser.
================================================================================
CM$VER      3.00.15d    08/09/2004
--------------------------------------------------------------------------------
Pendência 17150
Tela: Consultas\Acompanhamento de solicitação de compras
Descrição: exibir na tela o campo observação preenchido no momento da solicitação da SCI.
Através de um duplo clique no grid.
================================================================================
CM$VER      3.00.15c    05/08/2004
--------------------------------------------------------------------------------
Pendência: 17280 (ajuste)
Tela: Movimentações\Compras\Recebimento de Mercadorias
Descrição: Quando no Contas a Pagar estar preenchido o parametro com nº de vencimento,
o sistema não está permitindo o lançamento de notas com vencimento futuro ou do dia.
A mensagem do erro é: USUARIO SEM PRIVILÉGIO DE LANÇAR/ ALTERAR
DOCUMENTO COM DATA DE VENCIMENTO INDICADO.
================================================================================
CM$VER      3.00.15b    04/08/2004
--------------------------------------------------------------------------------
Pendência: 17280
Tela: Movimentações\Compras\Recebimento de Mercadorias
Descrição: Quando no Contas a Pagar estar preenchido o parametro com nº de vencimento,
o sistema não está permitindo o lançamento de notas com vencimento futuro ou do dia.
A mensagem do erro é: USUARIO SEM PRIVILÉGIO DE LANÇAR/ ALTERAR
DOCUMENTO COM DATA DE VENCIMENTO INDICADO.
================================================================================
CM$VER      3.00.15a    28/07/2004
--------------------------------------------------------------------------------
Pendência 17168
Tela: Movimentações\ Recebimento de mercadorias
Descrição Ao lançar uma NF no recebimento da mercadoria , está gerando um lançamento com valo = 0,00. Como
pode ser observado na ficha financeira.
Pendência : 15662
Tela: Recebimento de Mercadoria do RecMerc e Amoxarifado
Descrição: No recebimento de mercadorias do Ativo Fixo, não está aparecendo o botão
de geração automática de Num. de Patrimônio da tela do Ativo Fixo.
- Pendencia 17241
Na geração da OC e do respectivo compromisso orçamentário, o valor que está sendo deduzido no módulo Orçamento estava incorreto.
================================================================================
CM$VER      3.00.15     16/07/2004
--------------------------------------------------------------------------------
Pendências 16521, 17057 - Geração de SCI Automática
- Resolução de vários problemas no preenchimento do Compromisso Orçamentário.
Pendencia 15662 - Recebimento de Mercadoria com e sem OC
- Na tela de Cadastro de bens, colocada a rotina para geraçào automática do nº de patrimonio/tombamento
================================================================================
CM$VER      3.00.14     15/06/2004
--------------------------------------------------------------------------------
- Corrigidos erros de português na tela de configuração de Impressão de 
   Nota de Devolução.
================================================================================
CM$VER      3.00.13     10/06/2004
--------------------------------------------------------------------------------
Pendência 16219 - Recebimento de Mercadoria
- Ao tentar fazer recebimento do OC sem contação não liberado no RAD, exibir mensagem contendo no. do processo e da OC.
================================================================================
CM$VER      3.00.12f    09/06/2004
--------------------------------------------------------------------------------
Pendência 16838
Tela : Movimentação/Recebimento de Mercadoria/ Com OC
Descrição: acerto de erro que ocorria na seguanda vez que se selecionava pelo botão 'Procurar' ou
quando se clicava no botão excluir.
================================================================================
CM$VER      3.00.12e    31/05/2004
--------------------------------------------------------------------------------
Pendencia 16480 - Não permitir recebimento de mercadoria sem indicação de Compromisso Orçamentário quando o parâmetro de integração com o Orçamento estiver ativado.
================================================================================
CM$VER      3.00.12d    20/05/2004
--------------------------------------------------------------------------------
- Pendências 16818 e 16819: Correção no recebimento de mercadoria para custo. Os valores do registro de saída estavam sendo passados já multiplicados por (-1).
- Pendência 15663: Não permitido recebimento de mercadoria com valor superior ao do compromisso orçamentário criado quando da geração / lançamento da OC.
================================================================================
CM$VER      3.00.12c    30/04/2004
--------------------------------------------------------------------------------
Pendência 16688 - Recebimento de mercadoria
- Alteração do número de casas decimais do campo "Valor Unitário" para 4 dígitos após a vírgula.
================================================================================
CM$VER      3.00.12b    15/04/2004
--------------------------------------------------------------------------------
Pendência 15550
Tela: Movimentação\Compra\Recebimento de Mercadoria\Com OC.
Descrição: pequeno ajuste na conversão do valor do item cotado em moeda estrangeira 
com o valor de cotação da mesma mais atual.
================================================================================
CM$VER      3.00.12a    15/04/2004
--------------------------------------------------------------------------------
Pendência 15083 - Correção
tela : todas as tela que utilizam o tipo de desembolso.
Descrição: listar somente os tipos de desembolso ativos.
================================================================================
CM$VER      3.00.12     29/03/2004
--------------------------------------------------------------------------------
- Acertado os Relatorios de Reconciliação de Estoque
- implementada o a proibição de recebimentos de Itens Estocáveis direto para custo.
- Resolução da Pendência Nº 4123
  > Tela\Opçao No Sistema: Devolução de Mercadoria
  Colocar na tela de devolução de mercadoria o combo para selecionar o código fiscal de devolução. Trazer como default o que ele lança atualmente.
================================================================================
CM$VER      3.00.11     26/03/2004
--------------------------------------------------------------------------------
- Pendência: 15868 (Recebimento de Mercadoria)
Lançamento de documentos com múltiplas contas de baixa e segregados
//
-Pendência 15713 (Recebimento de Mercadoria
Correção de erro na inclusão dos campos NUMLEITCODBARRAS, NUMDIGCODBARRAS e IDCBANCARIA.
================================================================================
CM$VER      3.00.10     01/03/2004
--------------------------------------------------------------------------------
Pendência 15083
tela : todas as tela que utilizam o tipo de desembolso.
Descrição: listar somente os tipos de desembolso ativos.
================================================================================
CM$VER      3.00.09     19/02/2004
--------------------------------------------------------------------------------
Pendência 15550
Tela: Movimentação\Compra\Recebimento de Mercadoria\Com OC.
Descrição: Conversão do valor do item cotado em moeda estrangeira 
com o valor de cotação da mesma mais atual.
================================================================================
CM$VER      3.00.08     04/12/2003
--------------------------------------------------------------------------------
>> Resolução da pendência 15623: 
Quando do recebimento de uma nota que será um pagamento de deposito em conta , 
o sistema  está gravando na tabela documento o campo idcbancaria  = null.
================================================================================
CM$VER      3.00.07     05/08/2003
--------------------------------------------------------------------------------
Colocado o cadastro de configuração do modelo de histórico
Trocado o form de recebimento de mercadoria para MT
Colocado no recebimento de mercadoria o historico a partir do cadastro de modelo de histórico
================================================================================
CM$VER      3.00.06     28/03/2003
--------------------------------------------------------------------------------
- Corrigido o Relatório de Custo por Centro de Custo Anual, onde o total não batia
================================================================================
CM$VER      3.00.05     20/03/2003
--------------------------------------------------------------------------------
- Inclusão da tela de parâmetro  no sistema
- Corrigido o Relatório de Custo por Centro de Custo Anual
================================================================================
CM$VER      3.00.04     15/01/2003
--------------------------------------------------------------------------------
- Implementado tela de Consulta de Recebimento de Mercadoria
- Implementado Relatório de Recebimento de Mercadoria
================================================================================
CM$VER      3.00.03     05/12/2002
--------------------------------------------------------------------------------
- Implementado Relatório de Resumo Financeiro por Centro de Custo Anual
================================================================================
CM$VER      3.00.02     31/08/2002
--------------------------------------------------------------------------------
- Implemetação do Parâmetro IdPrograma
================================================================================
CM$VER      3.00.01     26/09/2001
--------------------------------------------------------------------------------
- Correção do recebimento de Mercadoria
================================================================================
CM$VER      3.00.00     16/08/2001
--------------------------------------------------------------------------------
Primeira Versão
================================================================================
CM$ALT}





































































































































































































































































