program Almoxarifado;

uses
  Forms,
  fCMEntrada,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  Fpessoa in '..\..\Cm\Forms\Source\fPessoa.pas' {frmPessoa},
  FParamAlmox in 'FParamAlmox.pas' {frmParamAlmox},
  FIniContagem in 'FIniContagem.pas' {frmIniContagem},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  FAtuUltCompra in 'FAtuUltCompra.pas' {frmAtuUltCompra},
  FAnaliseInv in 'FAnaliseInv.pas' {frmAnaliseInv},
  FRequiscao in 'FRequiscao.pas' {FrmRequisicao},
  DRptRelats in 'DRptRelats.pas' {dtmRptRelats},
  FParamExtMov in 'FParamExtMov.pas' {FrmParamExtMov},
  FParamInventFF in 'FParamInventFF.pas' {FrmParamInventFF},
  FParamResFinanCC in 'FParamResFinanCC.pas' {FrmParamResFinanCC},
  FAtendReqCad in 'FAtendReqCad.pas' {FrmAtendReqCad},
  fParamRequisicao in 'fParamRequisicao.pas' {frmParamRequisicao},
  DRelatoriosAlmox in 'DRelatoriosAlmox.pas' {dtmRelatoriosAlmox},
  fParamRecebimento in 'fParamRecebimento.pas' {frmParamRecebimento},
  FConfAtend in 'FConfAtend.pas' {FrmConfAtend},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {frmCadastroGridCS},
  FCadLocal in 'FCadLocal.pas' {FrmCadLocal},
  FParamPlanInvent in 'FParamPlanInvent.pas' {frmParamPlanInvent},
  FParamContInvent in 'FParamContInvent.pas' {FrmParamContInvent},
  FParamRecon in 'FParamrecon.pas' {FrmParamRecon},
  fParamDevolucao in 'fParamDevolucao.pas' {frmParamDevolucao},
  FParamPlanInventGrp in 'FParamPlanInventGrp.pas' {FrmParamPlanInventGrp},
  fParamValidade in 'fParamValidade.pas' {frmParamValidade},
  FAnalEstoque in 'FAnalEstoque.pas' {FrmAnalEstoque},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports},
  FAnalSug in 'FAnalSug.pas' {FrmAnalSug},
  fParamABC in 'fParamABC.pas' {frmParamABC},
  FParamSugestComp in 'FParamSugestComp.pas' {FrmParamSugestComp},
  FParamInventFFData in 'FParamInventFFData.pas' {FrmParamInventFFData},
  FParamCustAnali in 'FParamCustAnali.pas' {FrmParamCustAnali},
  FParamSolPrePronta in 'FParamSolPrePronta.pas' {FrmParamSolPrePronta},
  FCadReq in 'FCadReq.pas' {FrmCadReq},
  FParamCadSolPrePronta in 'FParamCadSolPrePronta.pas' {FrmParamCadSolPrePronta},
  fParamSoliComp in 'fParamSoliComp.pas' {frmParamSoliComp},
  FTransfAlmox in 'FTransfAlmox.pas' {FrmTransfAlmox},
  FAlteraCustoMed in 'FAlteraCustoMed.pas' {FrmAlteraCustoMed},
  FParamArtxConta in 'FParamArtxConta.pas' {FrmParamArtxConta},
  FParamCustContab in 'FParamCustContab.pas' {FrmParamCustContab},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FParamReconSaldo in 'FParamReconSaldo.pas' {FrmParamReconSaldo},
  FAtualizaMov in 'FAtualizaMov.pas' {FrmAtualizaMov},
  FCadTipoPerda in 'FCadTipoPerda.pas' {FrmCadTipoPerda},
  FBaixaPerda in 'FBaixaPerda.pas' {FrmBaixaPerda},
  uMovNew in 'uMovNew.pas',
  FCadPremiGestEst in 'FCadPremiGestEst.pas' {FrmCadPremiGestEst},
  FDataRepresa in 'FDataRepresa.pas' {FrmDataRepresa},
  FParamExtMovSint in 'FParamExtMovSint.pas' {FrmParamExtMovSint},
  FImpSaldo in 'FImpSaldo.pas' {FrmImpSaldo},
  FParamArtSemMov in 'FParamArtSemMov.pas' {FrmParamArtSemMov},
  FParamPlanProd in 'FParamPlanProd.pas' {FrmParamPlanProd},
  FParamRecMercSint in 'FParamRecMercSint.pas' {FrmParamRecMercSint},
  FParamCustContabSint in 'FParamCustContabSint.pas' {FrmParamCustContabSint},
  FAcertaEntrada in 'FAcertaEntrada.pas' {frmAcertaEntrada},
  FParamConsMed in 'FParamConsMed.pas' {FrmParamConsMed},
  FParamInventFFHoje in 'FParamInventFFHoje.pas' {FrmParamInventFFHoje},
  FParamNFxCustAgreg in 'FParamNFxCustAgreg.pas' {FrmParamNFxCustAgreg},
  FParamExtMovUC in 'FParamExtMovUC.pas' {FrmParamExtMovUC},
  FParamConAlmoxContab in 'FParamConAlmoxContab.pas' {FrmParamConAlmoxContab},
  FParamSalEstMin in 'FParamSalEstMin.pas' {FrmParamSalEstMin},
  FMudaUn in 'FMudaUn.pas' {FrmMudaUn},
  FAcompReqCad in 'FAcompReqCad.pas' {FrmAcompReqCad},
  FViewAtend in 'FViewAtend.pas' {FrmViewAtend},
  FParamReqCad in 'FParamReqCad.pas' {FrmParamReqCad},
  DMoviment in 'DMoviment.pas' {DtmMoviment: TDataModule},
  FConsultaSaldo in 'FConsultaSaldo.pas' {FrmConsultaSaldo},
  FConsDifInvent in 'FConsDifInvent.pas' {FrmConsDifInvent},
  FParamTotFinanc in 'FParamTotFinanc.pas' {FrmParamTotFinanc},
  FCadTermo in 'FCadTermo.pas' {FrmCadTermo},
  FParamTermoInvet in 'FParamTermoInvet.pas' {FrmParamTermoInvent},
  FContagem in 'FContagem.pas' {frmContagem},
  FParamABCComp in 'FParamABCComp.pas' {FrmParamABCComp},
  FMTAtendPrePronta in '..\..\Shared\Almox_Compras\FontesMT\FMTAtendPrePronta.pas' {FrmMTAtendPrePronta},
  FCadAlmox in '..\..\Shared\Almox_Compras\Fontes\FCadAlmox.pas' {FrmCadAlmox},
  FCadContrato in '..\..\Shared\Almox_Compras\Fontes\FCadContrato.pas' {FrmCadContrato},
  FCadCores in '..\..\Shared\Almox_Compras\Fontes\FCadCores.pas' {FrmCadCores},
  FCadGrupoProd in '..\..\Shared\Almox_Compras\Fontes\FCadGrupoProd.pas',
  FCadProduto in '..\..\Shared\Almox_Compras\Fontes\FCadProduto.pas' {frmCadProduto},
  FCadInsumos in '..\..\Shared\Almox_Compras\Fontes\FCadInsumos.pas' {frmCadInsumos},
  FCadItemPDV in '..\..\Shared\Almox_Compras\Fontes\FCadItemPDV.pas' {FrmCadItemPDV},
  FCadItemVenda in '..\..\Shared\Almox_Compras\Fontes\FCadItemVenda.pas' {FrmCadItemVenda},
  FCadOutros in '..\..\Shared\Almox_Compras\Fontes\FCadOutros.pas' {FrmCadOutros},
  FCadTamanho in '..\..\Shared\Almox_Compras\Fontes\FCadTamanho.pas' {frmCadTamanho},
  FCadTipoAgre in '..\..\Shared\Almox_Compras\Fontes\FCadTipoAgre.pas' {FrmCadTipoAgre},
  FCadUnCusteio in '..\..\Shared\Almox_Compras\Fontes\FCadUnCusteio.pas' {FrmCadUnCusteio},
  FCadUnMedida in '..\..\Shared\Almox_Compras\Fontes\FCadUnMedida.pas' {frmCadUnMedida},
  FCadUsuxAlmox in '..\..\Shared\Almox_Compras\Fontes\FCadUsuxAlmox.pas' {FrmCadUsuxAlmox},
  FLogCCusto in '..\..\Shared\Almox_Compras\Fontes\FLogCCusto.pas' {frmLogCCusto},
  FSoliComp2 in '..\..\Shared\Almox_Compras\Fontes\FSoliComp2.pas' {FrmSoliComp2},
  FSoliPrePronta in '..\..\Shared\Almox_Compras\Fontes\FSoliPrePronta.pas' {FrmSoliPrePronta},
  FUsuxCCusto in '..\..\Shared\Almox_Compras\Fontes\FUsuxCCusto.pas' {FrmUsuxCCusto},
  FViewContrato in '..\..\Shared\Almox_Compras\Fontes\FViewContrato.pas' {FrmViewContrato},
  UConversaoMed in '..\..\Shared\Almox_Compras\Fontes\UConversaoMed.pas',
  UProduto in '..\..\Shared\Almox_Compras\Fontes\UProduto.pas',
  FAjustaConv in 'FAjustaConv.pas' {FrmAjustaConv},
  FProdCasa in 'FProdCasa.pas' {FrmProdCasa},
  FParamLivroInvet in 'FParamLivroInvet.pas' {FrmParamLivroInvet},
  FAcertaFuncef in 'FAcertaFuncef.pas' {FrmAcertaFuncef},
  FParamGiroProd in 'FParamGiroProd.pas' {FrmParamGiroProd},
  dAlmoxCaf in 'dAlmoxCaf.pas' {dtmAlmoxCaf: TDataModule},
  FCadConjunto in 'FCadConjunto.pas' {frmCadConjunto},
  FCadUsuxGrpProd in '..\..\Shared\Almox_Compras\Fontes\FCadUsuxGrpProd.pas' {FrmCadUsuxGrpProd},
  FMTSenac in '..\FontesMT\FMTSenac.pas' {FrmMTSenac},
  fAjustaSCI in 'fAjustaSCI.pas' {frmAjustaSCI},
  FViewConsumo in 'FViewConsumo.pas' {FrmViewConsumo},
  FParamResFinAnual in 'FParamResFinAnual.pas' {FrmParamResFinAnual},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  FParamRecMercDesemb in 'FParamRecMercDesemb.pas' {FrmParamRecMercDesemb},
  FParamReqLancSint in 'FParamReqLancSint.pas' {FrmParamReqLancSint},
  FParamReconEst in 'FParamReconEst.pas' {FrmParamReconEst},
  FConfigNFDevol in 'FConfigNFDevol.pas' {FrmConfigNFDevol},
  uConfigNFDevol in 'uConfigNFDevol.pas',
  FImpNFDevol in 'FImpNFDevol.pas' {FrmImpNFDevol},
  FCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  FNotaFiscal in '..\FontesMT\FNotaFiscal.pas' {FrmNotaFiscal},
  FParamEtqProduto in 'FParamEtqProduto.pas' {FrmParamEtqProduto},
  FParamUltMovArt in 'FParamUltMovArt.pas' {FrmParamUltMovArt},
  FApagaProdMov in 'FApagaProdMov.pas' {FrmApagaProdMov},
  FParamAjustFinanc in 'FParamAjustFinanc.pas' {frmParamAjustFinanc},
  FAltValidade in 'FAltValidade.pas' {FrmAltValidade},
  FParamCurvaAltCustoMed in 'FParamCurvaAltCustoMed.pas' {FrmParamCurvaAltCustoMed},
  FParamNotaDifOC in 'FParamNotaDifOC.pas' {FrmParamNotaDifOC},
  FMTCadReq in '..\FontesMT\FMTCadReq.pas' {FrmMTCadReq},
  FMTReqManual in '..\FontesMT\FMTReqManual.pas' {FrmMTReqManual},
  FMTExportArqInvent in '..\FontesMT\FMTExportArqInvent.pas' {FrmMTExportArqInvent},
  FMTIniContagem in '..\FontesMT\FMTIniContagem.pas' {FrmMTIniContagem},
  FMTContagem in '..\FontesMT\FMTContagem.pas' {FrmMTContagem},
  FMTAnaliseInvent in '..\FontesMT\FMTAnaliseInvent.pas' {FrmMTAnaliseInvent},
  FMTImportArqInvent in '..\FontesMT\FMTImportArqInvent.pas' {FrmMTImportArqInvent},
  FMTAlteraCustoMed in '..\FontesMT\FMTAlteraCustoMed.pas' {FrmMTAlteraCustoMed},
  FMTCadArtigo in '..\..\Shared\Almox_Compras\FontesMT\FMTCadArtigo.pas' {FrmMTCadArtigo},
  FMtCadGrupoProd in '..\..\Shared\Almox_Compras\FontesMT\FMtCadGrupoProd.pas' {FrmMtCadGrupoProd},
  FMtCadUnidMedida in '..\..\Shared\Almox_Compras\FontesMT\FMtCadUnidMedida.pas' {FrmMTCadUnidMedida},
  FMtCadTamanho in '..\..\Shared\Almox_Compras\FontesMT\FMtCadTamanho.pas' {FrmMtCadTamanho},
  FMtCadContratoProd in '..\..\Shared\Almox_Compras\FontesMT\FMtCadContratoProd.pas' {FrmMtCadContratoProd},
  FMtCadUnidCusteio in '..\..\Shared\Almox_Compras\FontesMT\FMtCadUnidCusteio.pas' {FrmMTCadUnidCusteio},
  FMtCadSCPrePronta in '..\..\Shared\Almox_Compras\FontesMT\FMtCadSCPrePronta.pas' {FrmMtCadSCPrePronta},
  FMtCadCustAgregado in '..\..\Shared\Almox_Compras\FontesMT\FMtCadCustAgregado.pas' {FrmMtCadCustAgregado},
  FMtCadCor in '..\..\Shared\Almox_Compras\FontesMT\FMtCadCor.pas' {FrmMtCadCor},
  FMtCadAlmoxarifado in '..\..\Shared\Almox_Compras\FontesMT\FMtCadAlmoxarifado.pas' {FrmMtCadAlmoxarifado},
  FMTAtuUltCompra in '..\FontesMT\FMTAtuUltCompra.pas' {FrmMTAtuUltCompra},
  FMTCadTermo in '..\FontesMT\FMTCadTermo.pas' {FrmMTCadTermo},
  FMTCadTipoPerda in '..\FontesMT\FMTCadTipoPerda.pas' {FrmMTCadTipoPerda},
  FMTCadPremiGestEst in '..\FontesMT\FMTCadPremiGestEst.pas' {FrmMTCadPremiGestEst},
  FMTCadLocal in '..\FontesMT\FMTCadLocal.pas' {FrmMTCadLocal},
  FMTBaixaPerda in '..\FontesMT\FMTBaixaPerda.pas' {FrmMTBaixaPerda},
  FMTConsultaSaldo in '..\FontesMT\FMTConsultaSaldo.pas' {FrmMTConsultaSaldo},
  FMTConsDifInvent in '..\FontesMT\FMTConsDifInvent.pas' {FrmMTConsDifInvent},
  FMTViewConsumo in '..\FontesMT\FMTViewConsumo.pas' {FrmMTViewConsumo},
  FMTAcompReqCad in '..\FontesMT\FMTAcompReqCad.pas' {FrmMTAcompReqCad},
  FMTDataRepresa in '..\FontesMT\FMTDataRepresa.pas' {FrmMTDataRepresa},
  FMTAtendReqCad in '..\FontesMT\FMTAtendReqCad.pas' {FrmMTAtendReqCad},
  FMTConfAtend in '..\FontesMT\FMTConfAtend.pas' {FrmMTConfAtend},
  FMTAtualizaMov in '..\FontesMT\FMTAtualizaMov.pas' {FrmMTAtualizaMov},
  FMTCadUsuxGrpProd in '..\..\Shared\Almox_Compras\FontesMT\FMTCadUsuxGrpProd.pas' {FrmMTCadUsuxGrpProd},
  FMTTransfAlmox in '..\..\Shared\Almox_Compras\FontesMT\FMTTransfAlmox.pas' {FrmMTTransfAlmox},
  FMTCadUsuxAlmox in '..\..\Shared\Almox_Compras\FontesMT\FMTCadUsuxAlmox.pas' {FrmMTCadUsuxAlmox},
  FMTProdCasa in '..\FontesMT\FMTProdCasa.pas' {FrmMTProdCasa},
  FMTIntegraContab in '..\FontesMT\FMTIntegraContab.pas' {FrmMTIntegraContab},
  FMTMudaUn in '..\FontesMT\FMTMudaUn.pas' {FrmMTMudaUn},
  FMTExtornaIntContab in '..\FontesMT\FMTExtornaIntContab.pas' {FrmMTExtornaIntContab},
  FMTLoginCCusto in '..\..\Shared\Almox_Compras\FontesMT\FMTLoginCCusto.pas' {FrmMTLoginCCusto},
  fMTParamAlmox in '..\FontesMT\fMTParamAlmox.pas' {FrmMTParamAlmox},
  FMTAcompSCI in '..\..\Shared\Almox_Compras\FontesMT\FMTAcompSCI.pas' {FrmMTAcompSCI},
  FMTImpSaldo in '..\FontesMT\FMTImpSaldo.pas' {FrmMTImpSaldo},
  FMTRecebMerc in '..\FontesMT\FMTRecebMerc.pas' {FrmMTRecebMerc},
  FMtSoliCompra in '..\..\Shared\Almox_Compras\FontesMT\FMtSoliCompra.pas' {FrmMtSoliCompra},
  FMTViewContrato in '..\..\Shared\Almox_Compras\FontesMT\FMTViewContrato.pas' {FrmMTViewContrato},
  UModulo in 'UModulo.pas',
  FMTAltValidade in '..\FontesMT\FMTAltValidade.pas' {FrmMTAltValidade},
  FMTApagaItemSCI in '..\..\Shared\Almox_Compras\FontesMT\FMTApagaItemSCI.pas' {FrmMTApagaItemSCI},
  FAtendPrePronta in '..\..\Shared\Almox_Compras\Fontes\FAtendPrePronta.pas' {FrmAtendPrePronta},
  uCtrlGeraSCIAuto in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlGeraSCIAuto.pas',
  FGeraSCIAuto in 'FGeraSCIAuto.pas' {FrmGeraSCIAuto},
  FMTGeraSCIAuto in '..\FontesMT\FMTGeraSCIAuto.pas' {FrmMTGeraSCIAuto},
  FrAgregados in '..\..\Shared\Almox_Compras\FontesMT\FrAgregados.pas' {FrameAgregados: TFrame},
  uCtrlUnMedida in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlUnMedida.pas',
  uCtrlAlmoxCompra in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlAlmoxCompra.pas',
  uCtrlAlteraCustoMed in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlAlteraCustoMed.pas',
  uCtrlAlteraValidade in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlAlteraValidade.pas',
  uCtrlAnalEstoque in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlAnalEstoque.pas',
  uCtrlApagaItemSCI in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlApagaItemSCI.pas',
  uCtrlArtigo in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlArtigo.pas',
  uCtrlArtxForn in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlArtxForn.pas',
  uCtrlAtualizaMovimento in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlAtualizaMovimento.pas',
  uCtrlBaixaPerda in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlBaixaPerda.pas',
  uCtrlCaixaPequeno in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlCaixaPequeno.pas',
  uCtrlComprador in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlComprador.pas',
  uCtrlContratoProd in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlContratoProd.pas',
  uCtrlCor in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlCor.pas',
  uCtrlCotacao in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlCotacao.pas',
  uCtrlDataRepresa in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlDataRepresa.pas',
  uCtrlGrupoProd in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlGrupoProd.pas',
  uCtrlImplantaSaldo in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlImplantaSaldo.pas',
  uCtrlIntegracaoContabil in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlIntegracaoContabil.pas',
  uCtrlInventario in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlInventario.pas',
  uCtrlLocalizacao in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlLocalizacao.pas',
  uCtrlMovEstoque in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlMovEstoque.pas',
  uCtrlMudaUnid in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlMudaUnid.pas',
  uCtrlNotaFiscal in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlNotaFiscal.pas',
  uCtrlOrdemCompra in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlOrdemCompra.pas',
  uCtrlPremiGestEstoque in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlPremiGestEstoque.pas',
  uCtrlProcessoCompra in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlProcessoCompra.pas',
  uCtrlProdCasa in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlProdCasa.pas',
  uCtrlRecebMerc in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlRecebMerc.pas',
  uCtrlReqManual in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlReqManual.pas',
  uCtrlReqMat in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlReqMat.pas',
  uCtrlSCPrePronta in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlSCPrePronta.pas',
  uCtrlSoliCompra in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlSoliCompra.pas',
  uCtrlTamanho in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlTamanho.pas',
  uCtrlTermoInventario in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlTermoInventario.pas',
  uCtrlTipoAgregado in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlTipoAgregado.pas',
  uCtrlTipoPerda in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlTipoPerda.pas',
  uCtrlUnCusteio in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlUnCusteio.pas',
  uCtrlAlmox in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlAlmox.pas',
  uDbValorAgregCot in '..\..\Shared\Almox_Compras\DbObjetos\uDbValorAgregCot.pas',
  uDbAgregItemOC in '..\..\Shared\Almox_Compras\DbObjetos\uDbAgregItemOC.pas',
  udbAgregNota in '..\..\Shared\Almox_Compras\DbObjetos\udbAgregNota.pas',
  uDbAgregTotOC in '..\..\Shared\Almox_Compras\DbObjetos\uDbAgregTotOC.pas',
  udbAlmox in '..\..\Shared\Almox_Compras\DbObjetos\udbAlmox.pas',
  uDbAnaliseestoque in '..\..\Shared\Almox_Compras\DbObjetos\uDbAnaliseestoque.pas',
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
  uDbInventar in '..\..\Shared\Almox_Compras\DbObjetos\uDbInventar.pas',
  uDbItemanaliseestoq in '..\..\Shared\Almox_Compras\DbObjetos\uDbItemanaliseestoq.pas',
  uDbItemEntr in '..\..\Shared\Almox_Compras\DbObjetos\uDbItemEntr.pas',
  udbItemNota in '..\..\Shared\Almox_Compras\DbObjetos\udbItemNota.pas',
  uDbItemOC in '..\..\Shared\Almox_Compras\DbObjetos\uDbItemOC.pas',
  uDbItemPedi in '..\..\Shared\Almox_Compras\DbObjetos\uDbItemPedi.pas',
  uDbItemSCPrePronta in '..\..\Shared\Almox_Compras\DbObjetos\uDbItemSCPrePronta.pas',
  uDbItemSoli in '..\..\Shared\Almox_Compras\DbObjetos\uDbItemSoli.pas',
  uDbLanccaixapeq in '..\..\Shared\Almox_Compras\DbObjetos\uDbLanccaixapeq.pas',
  uDbLoteVali in '..\..\Shared\Almox_Compras\DbObjetos\uDbLoteVali.pas',
  uDbMoviment in '..\..\Shared\Almox_Compras\DbObjetos\uDbMoviment.pas',
  udbNota in '..\..\Shared\Almox_Compras\DbObjetos\udbNota.pas',
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
  uDbQtdeCont in '..\..\Shared\Almox_Compras\DbObjetos\uDbQtdeCont.pas',
  uDbReqMat in '..\..\Shared\Almox_Compras\DbObjetos\uDbReqMat.pas',
  uDbResCont in '..\..\Shared\Almox_Compras\DbObjetos\uDbResCont.pas',
  uDbSaldo in '..\..\Shared\Almox_Compras\DbObjetos\uDbSaldo.pas',
  uDbSCItemOC in '..\..\Shared\Almox_Compras\DbObjetos\uDbSCItemOC.pas',
  uDbSCPrePronta in '..\..\Shared\Almox_Compras\DbObjetos\uDbSCPrePronta.pas',
  uDbSoliComp in '..\..\Shared\Almox_Compras\DbObjetos\uDbSoliComp.pas',
  uDbTamanho in '..\..\Shared\Almox_Compras\DbObjetos\uDbTamanho.pas',
  uDbTermoInventario in '..\..\Shared\Almox_Compras\DbObjetos\uDbTermoInventario.pas',
  uDbTipoPerda in '..\..\Shared\Almox_Compras\DbObjetos\uDbTipoPerda.pas',
  uDbTransfAlmox in '..\..\Shared\Almox_Compras\DbObjetos\uDbTransfAlmox.pas',
  uDbUnCusteio in '..\..\Shared\Almox_Compras\DbObjetos\uDbUnCusteio.pas',
  uDbUnMedida in '..\..\Shared\Almox_Compras\DbObjetos\uDbUnMedida.pas',
  uDbUsuarioxcaixapeq in '..\..\Shared\Almox_Compras\DbObjetos\uDbUsuarioxcaixapeq.pas',
  uDbUsuxAlmox in '..\..\Shared\Almox_Compras\DbObjetos\uDbUsuxAlmox.pas',
  uDbUsuxGrupProd in '..\..\Shared\Almox_Compras\DbObjetos\uDbUsuxGrupProd.pas',
  udbAgregItemNota in '..\..\Shared\Almox_Compras\DbObjetos\udbAgregItemNota.pas',
  DAlmoxarifado in '..\..\Shared\Almox_Compras\Fontes\DAlmoxarifado.pas' {DtmAlmoxarifado: TDataModule},
  FMTNotaCompl in '..\FontesMT\FMTNotaCompl.pas' {FrmMTNotaCompl},
  rExtMovSint in '..\Reports\rExtMovSint.pas' {RptExtMovSint},
  rRecebimento in '..\Reports\rRecebimento.pas' {RptRecebimento},
  rRecMercSint in '..\Reports\rRecMercSint.pas' {RptRecMercSint},
  uCtrlRptAlmox in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlRptAlmox.pas',
  FMTAnalEstoque in '..\FontesMT\FMTAnalEstoque.pas' {frmMTAnalEstoque},
  FMTAnalSug in '..\FontesMT\FMTAnalSug.pas' {FrmMTAnalSug},
  rValidade in '..\Reports\rValidade.pas' {RptValidade},
  rArtSemMov in '..\Reports\rArtSemMov.pas' {RptArtSemMov},
  rArtxConta in '..\Reports\rArtxConta.pas' {RptArtxConta},
  rCadSolPrePronta in '..\Reports\rCadSolPrePronta.pas' {RptCadSolPrePronta},
  rConAlmoxContab in '..\Reports\rConAlmoxContab.pas' {RptConAlmoxContab},
  rConsMed in '..\Reports\rConsMed.pas' {RptConsMed},
  rCurvaABC in '..\Reports\rCurvaABC.pas' {RptCurvaABC},
  rCurvaABCCompras in '..\Reports\rCurvaABCCompras.pas' {RptCurvaABCCompras},
  rCurvaABCCustoMed in '..\Reports\rCurvaABCCustoMed.pas' {RptCurvaABCCustoMed},
  rCustContabSint in '..\Reports\rCustContabSint.pas' {RptCustContabSint},
  rCustoAnalit in '..\Reports\rCustoAnalit.pas' {RptCustoAnalit},
  rCustosContabeis in '..\Reports\rCustosContabeis.pas' {rptCustosContabeis},
  rDevolucao in '..\Reports\rDevolucao.pas' {RptDevolucao},
  rDifInvent in '..\Reports\rDifInvent.pas' {RptDifInvent},
  rEtqProduto in '..\Reports\rEtqProduto.pas' {RptEtqProduto},
  rExtMov in '..\Reports\rExtMov.pas' {RptExtMov},
  rExtMovUC in '..\Reports\rExtMovUC.pas' {RptExtMovUC},
  rGiroProd in '..\Reports\rGiroProd.pas' {RptGiroProd},
  rInventFF in '..\Reports\rInventFF.pas' {RptInventFF},
  rInventFFData in '..\Reports\rInventFFData.pas' {RptInventFFData},
  rInventFFHoje in '..\Reports\rInventFFHoje.pas' {RptInventFFHoje},
  rLivroInvent in '..\Reports\rLivroInvent.pas' {RptLivroInvent},
  rNFxCustAgreg in '..\Reports\rNFxCustAgreg.pas' {RptNFxCustAgreg},
  rNotaDifOC in '..\Reports\rNotaDifOC.pas' {RptNotaDifOC},
  rPlanInvent in '..\Reports\rPlanInvent.pas' {rptPlanInvent},
  rPlanInventGrupo in '..\Reports\rPlanInventGrupo.pas' {rptPlanInventGrupo},
  rPlanProd in '..\Reports\rPlanProd.pas' {RptPlanProd},
  rRecMercDesemb in '..\Reports\rRecMercDesemb.pas' {RptRecMercDesemb},
  rRecon in '..\Reports\rRecon.pas' {RptRecon},
  rReconSaldo in '..\Reports\rReconSaldo.pas' {RptReconSaldo},
  rReqCad in '..\Reports\rReqCad.pas' {RptReqCad},
  rReqLancSint in '..\Reports\rReqLancSint.pas' {RptReqLancSint},
  rRequisicao in '..\Reports\rRequisicao.pas' {RptRequisicao},
  rResFinanCC in '..\Reports\rResFinanCC.pas' {RptResFinanCC},
  rResFinAnual in '..\Reports\rResFinAnual.pas' {RptResFinAnual},
  rSalEstMin in '..\Reports\rSalEstMin.pas' {RptSalEstMin},
  rSolCompra in '..\Reports\rSolCompra.pas' {RptSolCompra},
  rSolPrePronta in '..\Reports\rSolPrePronta.pas' {RptSolPrePronta},
  rSugestCompra in '..\Reports\rSugestCompra.pas' {RptSugestCompra},
  rTermoInvent in '..\Reports\rTermoInvent.pas' {RptTermoInvent},
  rTotFinanc in '..\Reports\rTotFinanc.pas' {RptTotFinanc},
  rUltMovArt in '..\Reports\rUltMovArt.pas' {RptUltMovArt},
  rAjustFinanc in '..\Reports\rAjustFinanc.pas' {RptAjustFinanc},
  rNotasxBaixaDir in '..\Reports\rNotasxBaixaDir.pas' {RptNotasxBaixaDir},
  FMTValTotAgreg in '..\FontesMT\FMTValTotAgreg.pas' {FrmMTValTotAgreg},
  FMTBaixaDir in '..\FontesMT\FMTBaixaDir.pas' {FrmMTBaixaDir},
  uCtrlBaixaDireta in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlBaixaDireta.pas',
  FMTOCxForn in '..\FontesMT\FMTOCxForn.pas' {FrmMTOCxForn},
  FMTDevolMerc in '..\FontesMT\FMTDevolMerc.pas' {FrmMTDevolMerc},
  uCtrlDevolMerc in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlDevolMerc.pas',
  FMTConsultaRecMerc in '..\..\Shared\Almox_Compras\FontesMT\FMTConsultaRecMerc.pas' {FrmMTConsultaRecMerc},
  uMTConfigNFDevol in '..\FontesMT\uMTConfigNFDevol.pas',
  FMTConfigNFDevol in '..\FontesMT\FMTConfigNFDevol.pas' {FrmMTConfigNFDevol},
  uDbConfigNFDevol in '..\..\Shared\Almox_Compras\DbObjetos\uDbConfigNFDevol.pas',
  uDbTemplNFDevol in '..\..\Shared\Almox_Compras\DbObjetos\uDbTemplNFDevol.pas',
  uCtrlConfigNFDevol in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlConfigNFDevol.pas',
  FMTImpNFDevol in '..\FontesMT\FMTImpNFDevol.pas' {FrmMTImpNFDevol},
  FMTConsolidaReq in '..\FontesMT\FMTConsolidaReq.pas' {FrmMTConsolidaReq},
  FCadModeloHistoricoMT in '..\..\Cm\Forms\SourceMT\FCadModeloHistoricoMT.pas' {FrmCadModeloHistoricoMT},
  FMTConfigHistAlmox in '..\FontesMT\FMTConfigHistAlmox.pas' {FrmMTConfigHistAlmox},
  uListaCamposHistAlmox in '..\..\Shared\Almox_Compras\Fontes\uListaCamposHistAlmox.pas',
  uCtrlClasfisc in '..\..\Shared\Almox_Compras\CtrlObjetos\uCtrlClasfisc.pas',
  uCtrlLancamento in '..\..\CMContabObj50\CtrlObjects\uCtrlLancamento.pas',
  DMovEstoque in '..\..\CMAlmoxCompraObj50\Source\DMovEstoque.pas' {DtmMovEstoque: TDataModule},
  uDbClasfisc in '..\..\Shared\Almox_Compras\DbObjetos\uDbClasfisc.pas',
  FHistoricoItens in 'FHistoricoItens.pas' {FrmHistoricoItens},
  FCadMovXUsu in 'FCadMovXUsu.pas' {frmCadMovXUsu};

{$R *.RES}
{$R ALMOXARIFADO_RES.RES}

begin
  frmCMEntrada := TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Almoxarifado e Custos';
  Application.HelpFile := '..\HELP\Almoxa.hlp';
  frmCMEntrada.Hide;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TDtmMoviment, DtmMoviment);
  Application.CreateForm(TdtmAlmoxCaf, dtmAlmoxCaf);
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Almoxarifado
================================================================================
CM$VER      3.05.14d    24/06/2008
--------------------------------------------------------------------------------
- Pendencia 27699: Ajuste na demonstração dos centros de custo, de acordo com o plano
  atual nas telas:
  Movimentação / Requisição de Material / Atendimento de requisição cadastrada
  Movimentação / Requisição de Material / Atendimento de requisição manual
  Cadastros / Produto / Insumos / guia contabilização
  Cadastros / Produto / Outros / guia contabilização
  Cadastros / Produto / Itens de venda / guia contabilização
  Cadastros / Produto / Itens de PDV / guia contabilização
  Cadastros / Almoxarifado / Novo
  Cadastros / Custos Agregados
  Consultas / Acompanhamento de Requisições cadastradas / Guia de parâmetros
  Consultas / Acompanhamento de Solicitações de compra / Guia de parâmetros
================================================================================
CM$VER      3.05.14c    08/05/2008
--------------------------------------------------------------------------------
Pendência: 27683
Descrição: Retirando do principal o menu, Consulta geral de pessoa.
================================================================================
CM$VER      3.05.14b    10/03/2008
--------------------------------------------------------------------------------
Reorganizando estrutura de diretórios.
================================================================================
CM$VER      3.03.14a    27/12/2007
--------------------------------------------------------------------------------
Pendência: 27025
Descrição: Acerto no cálculo dos dias úteis calculado após a data atual.
================================================================================
CM$VER      3.05.14     06/11/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.18
================================================================================
CM$VER      3.05.13     16/08/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.17
pendência : 26117
Tela      : Movimentação/Compra/Recebimento de Mercadoria (grid com os custos agregados)
Descrição : Correção do nome das colunas do grid. As descrições das colunas dos custos agregados
estavam trazendo o nome da coluna no banco de dados.        
Pendência : 26045 - 26061 (ajuste)
Tela      : Movimentação/Compra/Solicitação Avulsa
Descrição : Adequação da rotina com a unidade de integração de sistemas. Os parâmetros de
configuração do sistema em relação a integração com o orçamento não estavam sendo acatados.
Pendência : 25515
Tela      : Consulta/Diferenças de Inventário no período
Descrição : Adicionada informação do item de estoque que apresentou diferença no inventário.
================================================================================
CM$VER      3.05.12     11/07/2007
--------------------------------------------------------------------------------
Pendência : 24180
Tela      : Movimentação/Compra/Solicitação Avulsa
Descrição : Critica se a data de emissão for menor que a data atual.
================================================================================
CM$VER      3.05.11b    17/05/2007
--------------------------------------------------------------------------------
Pendência : 25203
Tela      : Consulta/Relatório/Recebimento de Mercadoria
Descrição : Corrigido o problema dos dados bancários do fornecedor. Agora, ao gerar o documento
para o contas a pagar, as informações referentes aos dados bancários estão sendo gravadas.
Este problema estava afetando o relatório de requisição de pagamentos no contas a pagar.
================================================================================
CM$VER      3.05.11a    04/05/2007
--------------------------------------------------------------------------------
Pendência 25079 - Sistema/Parâmetros do sistema
- Corrigido o erro de "Campo IDPESSOA não informado".
Pendência 21549 - RAD
- Inclusão de condições por grupo de produto.
================================================================================
CM$VER      3.05.11     12/04/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.15
Pendência : 24854
Tela      : Consulta/Relatório/Recebimento de Mercadoria
Descrição : Correção na exibição (estava cortando o valor) do total do relatório de recebimento de Mercadorias.
Pendência : 22345
Tela      : Movimentação/Compra/Recebimento de Mercadoria/Sem OC.
Descrição : Critica a data de vencimento (feriados e dias não-úteis).
================================================================================
CM$VER      3.05.10a    26/03/2007
--------------------------------------------------------------------------------
Pendência : 24854
Tela      : Consulta/Relatório/Recebimento de Mercadoria
Descrição : Correção no total do relatório de recebimento de Mercadorias.
================================================================================
CM$VER      3.05.10     05/02/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.14
Pendência : 23238 Movimentação \ Compra \ Cadastro de Solicitação de Compra \  Solicitação Avulsa
Descrição : Implementação do campo OPERAÃO no MontaSelect de Reserva Orçamentária
pendência: 24212 Movimentação\Compra\Recebimento de Mercadoria\Com OC
Descrição  : Não exibe a mensagem de itens pendentes quando o usuário recebe em uma só nota fiscal
todos os itens da OC.
pendência : 24207 Consulta\Custos\Totais Financeiros
Descrição : Permite ao usuário indicar o destino dos itens(ativo fixo, custo ou estoque) que deseja
que sejam processados na confecção do relatório.
================================================================================
CM$VER      3.05.09     15/12/2006
--------------------------------------------------------------------------------
Pendência : 23860
Descrição : Implementação do RAD+ no Almoxarifado e Compras
================================================================================
CM$VER      3.05.08     4/12/2006
--------------------------------------------------------------------------------
Pendência: 23720
Tela     : Movimentação / Compras  / Recebimento de Mercadoria
Descrição: Corrigido o problema da mensagem de Itens pendentes na alteração do recebimento da mercadoria
================================================================================
CM$VER      3.05.06     06/10/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.12
Pendência: 22573
Tela     : Movimentação / Compras  / Recebimento de Mercadoria
Descrição: Corrigida rotina de Baixa Direta da mercadoria
Pendência: 22574
Tela     : Movimentação / Compras  / Devolução de Mercadoria
Descrição: Corrigido o controle das quantidades dos artigos devolvidos.
Pendência: 22582
Tela:Gestão de Rstoque/Gerar Análise de Estoque
Descrição: Correção da Cor da Fonte (preta) na tela resultado "Análise Sugerida"
Pendência: 22549
Tela:Cadastros/Produtos/Grupo de Produtos
Descrição: Retirada do combobox "Natureza do Estoque"
Pendência: 22575
Tela:Movimentação/Compra/Recebimento de Mercadoria com OC
Descrição: Correção do Oc gerada por contrato,que não apresentava os items.
================================================================================
CM$VER      3.05.05a    22/08/2006
--------------------------------------------------------------------------------
Pendência: 22579
Tela     : Consulta\Relatório\Planilha de Inventário
Descrição: Imprimir de itens com saldo zero.
           Imprimr somente itens ativos
Pendência: 22816
Tela     : Consulta\Relatório\Planilha de Inventário por Data
Descrição: Imprimir itens estocáveis.
Pendência: 22546
Tela     : Sistema/Utilitários
Descrição: Retirada do menu 'Geração de Arquivo Texto do SENAC'.
Pendência: 22578
Tela     : Movimentação/Requisição de Material/Atendimento/De Requisição Cadastrada
Descrição: Alteração do label Departamento para Centro de Custo
Data       : 25.08.2006
Tela       : Consultas/Diferenças de Inventários no Período
Pendências : 22580
Descrição  : Retirei a obrigatoriedade da seleção do artigo
              Traz o número do inventário se houver diferenças
================================================================================
CM$VER      3.05.05     20/07/2006
--------------------------------------------------------------------------------
Liberação no padrão 5.10.11
================================================================================
CM$VER      3.05.04     12/07/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.10
================================================================================
CM$VER      3.05.03b    21/06/2006
--------------------------------------------------------------------------------
Pendência: 22652
Tela     : Movimentação/Recebimento de Mercadoria/Com OC
Descrição: Corrige a mensagem de erro de Produto controlado por validade
================================================================================
CM$VER      3.05.03a    14/06/2006
--------------------------------------------------------------------------------
Pendência: 22244
Tela     : Movimentação/Recebimento de Mercadoria/Sem OC
Descrição: Corrige o problema das compras sem cotação.
================================================================================
CM$VER      3.05.03     08/05/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.09
================================================================================
CM$VER      3.05.02i    08/05/2006
--------------------------------------------------------------------------------
Pendência: 22280
Tela     : Movimentação/Recebimento de Mercadoria/Sem OC
Descrição: Corrige o problema da mensagem que estava ocorrendo com recebimentos sem OCs. 
================================================================================
CM$VER      3.05.02h    03/05/2006
--------------------------------------------------------------------------------
Pendência: 22069
Tela     : Movimentação/Recebimento de Mercadoria/Com OC
Descrição: Correção da quantidade de itens a serem baixados da solicitação de compras.
================================================================================
CM$VER      3.05.02g    24/04/2006
--------------------------------------------------------------------------------
Pendência: 22069
Tela     : Movimentação/Recebimento de Mercadoria/Com OC
Descrição: Correção da conversão da unidade de custo médio para unidade de compra.
================================================================================
CM$VER      3.05.02f    17/04/2006
--------------------------------------------------------------------------------
Pendência: 21902
Tela     : Movimentação/Recebimento de Mercadoria/Com OC
Descrição: Corrige o problema encontrado no recebimento de mercadoria.
================================================================================
CM$VER      3.05.02e    10/04/2006
--------------------------------------------------------------------------------
Pendência: 21902
Tela     : Movimentação/Recebimento de Mercadoria/Com OC
Descrição: Alteração na estrutura de consulta referente a OC (itens pendentes)
================================================================================
CM$VER      3.05.02d    07/04/2006
--------------------------------------------------------------------------------
Pendência: 21830
Tela     : Movimentação/Recebimento de Mercadoria/Com OC
Descrição: - Acerto da mensagem no recebimento parcial de mercadorias
           - Acerto da quantidade pendente quando houver edição da quantidade
           - Corrigida a replicação de registros após pressionar o botão de Procurar.
           - Correção do valor pendente ao pressionar o botão adicionar
           - Correção do valor pendente ao pressionar o botão remover
================================================================================
CM$VER      3.05.02c    04/04/2006
--------------------------------------------------------------------------------
Pendência: 21830
Tela     : Movimentação/Recebimento de Mercadoria/Com OC
Descrição: - Acerto do recebimento parcial de mercadorias
           - Acerto automático do valor parcial da nota fiscal pelo somatório dos itens.
           - Não exibe os produtos onde a quantidade pendente (qtdependente) = 0
           - Limpa o filtro ao sair da tela. Estava sempre considerando o último
             filtro passado para o cdsOC.
================================================================================
CM$VER      3.05.02b    20/03/200
--------------------------------------------------------------------------------
pendência: 21547
tela     : Consulta/Relatório de Recebimento de Mercadoria
Descrição: Correção do sinal dos valores de acréscimo e decréscimo.
================================================================================
CM$VER      3.05.02a    08/02/200
--------------------------------------------------------------------------------
pendência: 21493
tela: Movimentação/Compra/Recebimento de Mercadoria/Sem OC
Descrição: Ao gravar recebimentos sem Ordem de Compra (Sem OC) ocorria erro na atualização.
================================================================================
CM$VER      3.05.02     20/01/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.08
pendência: 18505  (do sistema Compras)
tela: Caixa Pequeno\Lançamentos
Descriçaõ: implementação da integração do caixa pequeno com o orçamento.
================================================================================
CM$VER      3.05.01c    12/01/2006
--------------------------------------------------------------------------------
Pendência : 21243
Tela: Movimento\Recebimento de Mercadoria (com OC)
Descrição : Estava pegando o campo de quantidade errado.
================================================================================
CM$VER      3.05.01     25/10/2005
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
Pendência: 20205
Descrição do erro: Todos os relatórios que envolvam contabilidade apresentam divergência por causa do número de casas decimais
================================================================================
CM$VER      3.05.00     16/06/2005
--------------------------------------------------------------------------------
Pendência : 19288
Tela: Movimento\Recebimento de Mercadoria
Descrição : filtrar pelo idplanoprev contabil
Pendência: 17580
Tela: todas as telas que contém o relacionamento Plano Prev Contábil x Patro
Descrição : Listar somente os Planos Prev. Contábeis relacionados a patro selecionada.
Liberação de Módulo no SAD.
Pendências : 19406 Movimentação\Compras\Recebimento de mercadoria\Com O.C.
Descrição  : Correção do erro que ao alterar a mercadoria recebida, nâo estava
             atualizando a quantidade pendente.
================================================================================
CM$VER      3.04.40e    27/04/2005
--------------------------------------------------------------------------------
Pendência 19040
Tela: Compras\Solicitação de compras
Descrição do Erro: Não está excluindo (marcar como excluído FLGOK = 'E') o processo RAD corrente quando outro é gerado na operação de alteração da SCI.
Pendência : 18210
Tela/Unit : uCtrlRecebMerc
Descrição : Não permitir que seja incrementado o numero da O.C. quando o registro
            for alterado.
Pendência 18602
Tela: Cadastros\Produto\Insumos
Descrição do erro: Ao associar um novo centro de custo para um produto(sem a opção de contabilizar para todo o grupo marcado) os centro de custos já parametrizados somem e só fica o que acabei de cadastrar.
================================================================================
CM$VER      3.04.40d    03/03/2005
--------------------------------------------------------------------------------
Pendência 18698
Tela: Compras\Solicitação de Compras\Avulsa
Descrição do erro: Ao excluir uma solicitação o processo rad gerado continua pendente.
================================================================================
CM$VER      3.04.40c    10/03/2005
--------------------------------------------------------------------------------
- Pendencia 18513 - Ajuste na pendencia para voltar a quantidade pendente quando exclui o recebimento de mercadoria
Pendência 18602
Tela: Cadastros\Produto\Insumos
Descrição do erro: Ao associar um novo centro de custo para um produto(sem a opção de contabilizar para todo o grupo marcado) os centro de custos já parametrizados somem e só fica o que acabei de cadastrar.
Pendência 18698
Tela: Compras\Solicitação de Compras\Avulsa
Descrição do erro: Ao excluir uma solicitação o processo rad gerado continua pendente.
- Pendencia 18513 - Ajuste na pendencia para voltar a quantidade pendente quando exclui o recebimento de mercadoria
================================================================================
CM$VER      3.04.40b    24/01/2005
--------------------------------------------------------------------------------
- Pendencia 18513 - Acerto no Recebimento de mercadoria com solicitações de compra de programas diferentes
- Pendencia 18531 - Acerto na gravação da OC para colocar como atendida quando não tiverem mais itens pendentes
================================================================================
CM$VER      3.04.40a    28/12/2004
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
CM$VER      3.04.40     27/12/2004
--------------------------------------------------------------------------------
Pendência 18113 (Almoxarifado)
Tela: Movimentação / Recebimento de Mercadoria / Com O.C
Descrição: Contabilização com as informações de Plano, Patrocinadora e Programa específicos informados por ocasião do cadastramento da SCI,
levando em consideração a segregação de recursos.
Pendência 17553
Tela: Todas
Descrição: Substituir os métodos de uDocumento pelos métodos de uCtrlDocumento, de uLancContab pelos de uCtrlLancamento
e de uLancFinanc pelos métodos da bpl cmcFinanObj50 .
Pendência 17228 (módulo compras)
Tela:Compras\Solicitação de Compras\Avulsa
Descrição: Implementação do combo para buscar o valor unitário pelo valor da última compra ou custo médio
Pendência 16977
Tela: Movimentação\Recebimento de material\Gera SCI Automática
Descrição: Trazer no combo Centro de responsabilidade, somente os que estiverem 
relacionados ao usuário.
Pendência 16979
Tela: Movimentação\compras\solicitação avulsa.
Descrição: O campo destino não aparece marco com está gravado no parâmetro do sistema.
Pendência: 17895 Recebimento de mercadoria
Descrição: Correção na rotina em que ao lançar para o CAP e gerar o fluxo previsto,
           estava considerando a data de lançamento e a data programada 
================================================================================
CM$VER      3.04.39e    07/10/2004
--------------------------------------------------------------------------------
Pendência 16969
Tela: Movimentação\Recebimento de mecadoria com OC
Descrição: Após selecionar o fornecedor, aparece a tela para seleção dos itens.  
Se um item for selecionado, mas se retornar ao combo do fornecedor novamente, 
está sendo possível escolher o mesmo item quantas vezes quiser.
================================================================================
CM$VER      3.04.39d    08/09/2004
--------------------------------------------------------------------------------
Pendência 17150
Tela: Consultas\Acompanhamento de solicitação de compras
Descrição: exibir na tela o campo observação preenchido no momento da solicitação da SCI.
Através de um duplo clique no grid.
================================================================================
CM$VER      3.04.39c    05/08/2004
--------------------------------------------------------------------------------
Pendência: 17280 (ajuste)
Tela: Movimentações\Compras\Recebimento de Mercadorias
Descrição: Quando no Contas a Pagar estar preenchido o parametro com nº de vencimento, 
o sistema não está permitindo o lançamento de notas com vencimento futuro ou do dia. 
A mensagem do erro é: USUARIO SEM PRIVILÉGIO DE LANÇAR/ ALTERAR 
DOCUMENTO COM DATA DE VENCIMENTO INDICADO.
================================================================================
CM$VER      3.04.39b    04/08/2004
--------------------------------------------------------------------------------
Pendência: 17280
Tela: Movimentações\Compras\Recebimento de Mercadorias
Descrição: Quando no Contas a Pagar estar preenchido o parametro com nº de vencimento, 
o sistema não está permitindo o lançamento de notas com vencimento futuro ou do dia. 
A mensagem do erro é: USUARIO SEM PRIVILÉGIO DE LANÇAR/ ALTERAR 
DOCUMENTO COM DATA DE VENCIMENTO INDICADO.
================================================================================
CM$VER      3.04.39a    28/07/2004
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
CM$VER      3.04.39     16/07/2004
--------------------------------------------------------------------------------
Pendência 16495 - Geração de SCI Automática
- Gerar SCI como "NÃO ATENDIDA".
Pendências 16521, 17057 - Geração de SCI Automática
- Resolução de vários problemas no preenchimento do Compromisso Orçamentário.
Pendencia 15662 - Recebimento de Mercadoria com e sem OC
- Na tela de Cadastro de bens, colocada a rotina para geraçào automática do nº de patrimonio/tombamento
================================================================================
CM$VER      3.04.38     15/06/2004
--------------------------------------------------------------------------------
Pendência 16219 - Recebimento de Mercadoria
- Ao tentar fazer recebimento do OC sem contação não liberado no RAD, exibir mensagem contendo no. do processo e da OC.
================================================================================
CM$VER      3.04.37f    09/06/2004
--------------------------------------------------------------------------------
Pendência 16838
Tela : Movimentação/Recebimento de Mercadoria/ Com OC
Descrição: acerto de erro que ocorria na seguanda vez que se selecionava pelo botão 'Procurar' ou
quando se clicava no botão excluir.
================================================================================
CM$VER      3.04.36h    12/07/2004
--------------------------------------------------------------------------------
Pendencia 17083 - Retirado o erro de constraint na tela de Recebimento de Mercadoria com OC
================================================================================
CM$VER      3.04.36g    30/06/2004
--------------------------------------------------------------------------------
Pendência 17062
Tela : Movimentação/Recebimento de Mercadoria/Sem OC
Descrição: Correção do erro que ocorria quando se tentava receber uma nota com 3 ou mais itens.
================================================================================
CM$VER      3.04.36f    11/06/2004
--------------------------------------------------------------------------------
Pendência 16838
Tela : Movimentação/Recebimento de Mercadoria/ Com OC
Descrição: acerto de erro que ocorria na seguanda vez que se selecionava pelo botão 'Procurar' ou
quando se clicava no botão excluir.
================================================================================
CM$VER      3.04.36e    31/05/2004
--------------------------------------------------------------------------------
Pendencia 16480 - Não permitir recebimento de mercadoria sem indicação de Compromisso Orçamentário quando o parâmetro de integração com o Orçamento estiver ativado.
================================================================================
CM$VER      3.04.36d    20/05/2004
--------------------------------------------------------------------------------
Pendência 15663: Não permitido recebimento de mercadoria com valor superior ao do compromisso orçamentário criado quando da geração / lançamento da OC.
================================================================================
CM$VER      3.04.36c    30/04/2004
--------------------------------------------------------------------------------
Pendência 16688 - Recebimento de mercadoria
- Alteração do número de casas decimais do campo "Valor Unitário" para 4 dígitos após a vírgula.
================================================================================
CM$VER      3.04.36b    15/04/2004
--------------------------------------------------------------------------------
Pendência 15550
Tela: Movimentação\Compra\Recebimento de Mercadoria\Com OC.
Descrição: pequeno ajuste na conversão do valor do item cotado em moeda estrangeira 
com o valor de cotação da mesma mais atual.
================================================================================
CM$VER      3.04.36a    15/04/2004
--------------------------------------------------------------------------------
Pendência: 15069
Tela: Todas as telas que exibem e utilizam dados de tipo de desembolso\recebimentos
Descrição: filtrar peli campo ativo = 'S'
================================================================================
CM$VER      3.04.36     29/03/2004
--------------------------------------------------------------------------------
Pendencia 16111 - Se CodTipoMov = 'A' não gravar IDMOVENTRADA
================================================================================
CM$VER      3.04.35     22/03/2004
--------------------------------------------------------------------------------
- Pendencia 16180 - Os itens de SCI não estavam sendo baixados, ocasionando qtd pendente e a SCI ficava como não atendida
================================================================================
CM$VER      3.04.34f    01/03/2004
--------------------------------------------------------------------------------
Pendência: 15069
Tela: todas as telas que utilizam o campo Tipo de Desembolso no sistema Almoxarifado.
Descrição: nas telas que utilizam o campo Tipo de Desembolso, listar somente os tipods de desembolso ATIVOS.
================================================================================
CM$VER      3.04.34e    20/02/2004
--------------------------------------------------------------------------------
Pendência 14929
Tela: Movimentação\Compra\Recebimento de Mercadoria
Descrição: Não mostrar a tela de erro sem mensagem quando o valor da nota fiscal estiver zerado.
================================================================================
CM$VER      3.04.34d    19/02/2004
--------------------------------------------------------------------------------
Pendência 15550
Tela: Movimentação\Compra\Recebimento de Mercadoria\Com OC.
Descrição: Conversão do valor do item cotado em moeda estrangeira 
com o valor de cotação da mesma mais atual.
================================================================================
CM$VER      3.04.34c    12/02/2004
--------------------------------------------------------------------------------
Pendência 14995
Tela: Movimentação\Compra\Recebimento de Mercadoria\Sem OC.
Descrição: Acerto na baixa direta da mercadoria associando a mesma ao centro de custo selecionado na tela.
================================================================================
CM$VER      3.04.34b    22/01/2004
--------------------------------------------------------------------------------
Pendência 15218
Descrição: ajuste na gravação do campo CUSTOMEDIOMOV da tabela MOVIMENT para
gravá-lo com 7 casas decimais para aumentar a precisão.
================================================================================
CM$VER      3.04.34a    21/01/2004
--------------------------------------------------------------------------------
Pendência: 15602
Tela: Consultas/Relatórios/Operacinais/Requisições Lançadas
Descrição: Implementação do filtro por Item de requisição.
================================================================================
CM$VER      3.04.34     17/12/2003
--------------------------------------------------------------------------------
Pendência  : 15810 - 16.12.2003
FMTRecebMerc.pas - Rotina CmeDetalheConfirma: Recuperação do centro de custo correto, de acordo com o destino do lançamento.
================================================================================
CM$VER      3.04.33     04/12/2003
--------------------------------------------------------------------------------
>> Resolução da pendência 15623: 
Quando do recebimento de uma nota que será um pagamento de deposito em conta , 
o sistema  está gravando na tabela documento o campo idcbancaria  = null.
================================================================================
CM$VER      3.04.32     11/09/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15001
  > Tela\Opçao No Sistema: Movimentação \ Recebimento de Mercadoria
  Na pasta Itens Recebidos se escolhe um item e sua unidade de medida. Se alterar o item, mas não  alterar a unidade de medida, o sistema está gravando a unidade incorreta.  É necessário que o sistema critique a unidade de medida em relação ao item e não deixe gravar. 
================================================================================
CM$VER      3.04.31     10/09/2003
--------------------------------------------------------------------------------
Resolução da pendência 14995 
================================================================================
CM$VER      3.04.30     28/08/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14924
  > Tela\Opçao No Sistema: Movimentação \ Recebimento de Mercadoria sem OC
  Na pasta rateio para o Contas a Pagar vir preenchido o campo Centro de Responsabilidade caso o usuário tenha apenas um relacionado.  Se tiver mais de um, obrigar o preenchimento do mesmo. 
================================================================================
CM$VER      3.04.29     06/08/2003
--------------------------------------------------------------------------------
 - Correção de erro na abertura da tela de Contagem de inventário
================================================================================
CM$VER      3.04.28     05/08/2003
--------------------------------------------------------------------------------
 - Resolução da Pendência: 14239 
   Impedir a movimentação de centro de custos inativos
 - Resolução da Pendência: 14305 
   Acerto na rotina para Recebimento para Ativo Fixo
================================================================================
CM$VER      3.04.27     31/07/2003
--------------------------------------------------------------------------------
- Implementado o Nº do Slip no histórico configurável
- Resolução da Pendência Nº 14560
  > Tela\Opçao No Sistema: Recebimento de Mercadorias sem O.C
  Na pasta de parametrização com o Contas a Pagar, o mesmo não está obedecendo o cadastro de Usuário X Centro de Responsabilidade.
3S: 21576
================================================================================
CM$VER      3.04.26     03/04/2003
--------------------------------------------------------------------------------
- Corrigido o Relatório de Custo por Centro de Custo Anual, onde o total não batia
- Implementada Tela de Requisições Consolidadas
================================================================================
CM$VER      3.04.25     14/02/2003
--------------------------------------------------------------------------------
- Alteração da rotina  de verificação de Saldo dos Produtos, onde esta agora 
   vai independete da data represa buscar o saldo.
================================================================================
CM$VER      3.04.24     11/02/2003
--------------------------------------------------------------------------------
- Corrigido  de Requisição de material, quando usava o RAD integrado, 
  onde ocorria o erro não existe transação de usuário em progrsso.
================================================================================
CM$VER      3.04.23     06/02/2003
--------------------------------------------------------------------------------
- Corrigido  de solicitação de compras avulsa, quando usava o RAD integrado, 
  onde ocorria o erro não existe transação de usuário em progrsso.
================================================================================
CM$VER      3.04.22     29/01/2003
--------------------------------------------------------------------------------
- Tela de Cadastro de Produto, implementado verificação da conversão da unidade
  de media onde esta não pode ser apagada caso haja ocorrencia dela em uma SCI
  ou Ficha técnica.
================================================================================
CM$VER      3.04.21     29/01/2003
--------------------------------------------------------------------------------
- Alterado o Relatório de Planilha de Produto para só trazer os produtos que possuam 
  saldo no almoxarifado selecionado.
================================================================================
CM$VER      3.04.20     06/01/2003
--------------------------------------------------------------------------------
- Corrigido Erro na exclusão de mercadoria onde dava constraint com a planilha
  da contabilidade 
- Resolução da Pendência Nº 11073
  > Tela\Opçao No Sistema: Movimentação/Requisição de Material/Cadastro de Requisição
  Movimentação/Requisição de Material/Cadastro de Requisição- Caso indiquemos um iten de Requisição que NÃO pode ser requisitado pelo Centro de Custo em questão, o sistema permite que criemos uma requisição, mas a mesma não pode ser atendida, pois o produto que não esta, no seu cadastro de conta contábil, com o Centro de Custo preenchido.
================================================================================
CM$VER      3.04.19     19/12/2002
--------------------------------------------------------------------------------
-  Correção da Geração da SCI Automática estava dando invalid 
    variant type conversion
-  Alterado o liste de custos agregado nos cadastro de produtos
-  Corrigido na Tele de Atendimento de Requisição Cadastrada o filtro por 
    data de necessidade.
- Implementada a obrigação do preenchimento do centro de custo e unidade de custeio
  no cadastro de Almoxarifado
================================================================================
CM$VER      3.04.18     16/12/2002
--------------------------------------------------------------------------------
- Corrigido Cadastro de Grupo de Produtos, onde estava dando constraint na alteração
  do tipo de desembolso.
================================================================================
CM$VER      3.04.17     09/12/2002
--------------------------------------------------------------------------------
- Corrigdo as lista de centro de custo na requisição que estavam premitindo lançamento
  em centro de custo sitéticos.
- Corrigido na tela de Requisição cadastra a rotinas de integrção com RAD
================================================================================
CM$VER      3.04.16     28/11/2002
--------------------------------------------------------------------------------
- Implementada na tela de Cadastro de Requisição quatro casas decimais no campo
  quantidade.
- Corrigido a tela de Produtos feitos na Casa, onde entrava com quantidade errada do
  artigo eleaborado.
- Corrigido o Cadastro de Produtos, onde não excluia a contabilização.
================================================================================
CM$VER      3.04.15     27/11/2002
--------------------------------------------------------------------------------
- Corrigido tela de Cadastro de Requisição de Material, onde esta não esta fazendo os
   tratamentos da confirmação do item (Click do botão OK do detalhe).
================================================================================
CM$VER      3.04.14     21/11/2002
--------------------------------------------------------------------------------
- Implementado Integração Contabíl dos Custo com partida dobrada.
- Corrigido Relatório de Custo Contábeis Sintético.
- Corrigido Tela de Requisição Cadastrada, onde não verifica se tinha saldo disponível
  em função do párametro do sistema.
================================================================================
CM$VER      3.04.13     12/11/2002
--------------------------------------------------------------------------------
- Corrigido tela de Cadastro de Produtos onde esta não estava fazendo contabilização 
  por item.
- Corrigida a Tela de Alteração da Validade
================================================================================
CM$VER      3.04.12     11/11/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 10424
  > Tela\Opçao No Sistema: Relatório Solicitação de Compras
  Relatório Solicitação de Compra, na combo Centro de Custo está trazendo os números dos centro de custos em vez dos nomes.
- Resolução da Pendência Nº 10425
  > Tela\Opçao No Sistema: Devolução de Atendimento
  Devolução de Atendimento, na combo centro de custo, quando clico dá a mensagem de No lookup table specified
- Resolução da Pendência Nº 10426
  > Tela\Opçao No Sistema: Geração Automática de SCI
  Quando vou gerar, o sistema informa que não existe requisições pendentes de geraçã, quando clico no preview.
- Resolução da Pendência Nº 10427
  > Tela\Opçao No Sistema: Alterar Custo Médio
  Alterar Custo Médio - Campo data não está habilitado, não tendo função definida
- Resolução da Pendência Nº 10428
  > Tela\Opçao No Sistema: Relatórios Custos Contábeis e Contábeis Sintéticos
  Relatórios Custos Contábeis e Contábeis Sintéticos quando não informo a conta contábil, mostra o erro de Conta Contábil não cadastrada, Verifique, sendo obrigado a abortar o programa.
- Resolução da Pendência Nº 10432
  > Tela\Opçao No Sistema: Notas X Custos Agregados
  Quando tiro o relatório sem indicar os agregados, está trazendo os lançamentos para um mesmo fornecedor sem o número da nota.
- Resolução da Pendência Nº 10433
  > Tela\Opçao No Sistema: Requisições Cadastradas
  Está trazendo no Campo Status Anted. Total, sendo o correto Atend. Total.
================================================================================
CM$VER      3.04.11     08/11/2002
--------------------------------------------------------------------------------
- Corrigido o Relatório de Notas x Agregados
- Corrigido Tela de Requisção Cadastrada, onde não alterava o item
- Acertadas as datas  na rotina de DataRepresa
================================================================================
CM$VER      3.04.10     06/11/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 5094
  > Tela\Opçao No Sistema: Relatório
  Implementar relatório de recebimento de mercadoria que classificassem os documentos por data de vencimento, ajudando e muito na comunicação com o CAP.
- Resolução da Pendência Nº 5493
  > Tela\Opçao No Sistema: Inventário 
  Permitir que o inventário possa ser digitado em qualquer unidade de medida cadastrada no produto.
- Resolução da Pendência Nº 10185
  > Tela\Opçao No Sistema: Relatório Extrato de Movimentação Sintético
  Implementar no Relatório Extrato de Movimentação Sintético as colunas de QTD e VALOR do Saldo Atual.
================================================================================
CM$VER      3.04.09     28/10/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 10099
  > Tela\Opçao No Sistema: Cadastro / Saldo Inicial / Implantação de Saldo
  Foi cadastrado um insumo e posteriormente fazer a implantação de saldo deste item, mas sistema retornou msg. CUSTOMED.CODCUSTEIO Não informado
- Corrigida a Alteração de Requisição Cadastrada
================================================================================
CM$VER      3.04.08     25/10/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 10014
  > Tela\Opçao No Sistema: Sistema/Mudar Centro de custo Almoxarifado
  Sistema/Mudar Centro de custo Almoxarifado - ao alterar o centro de custo/Amoxarifado, no rodapé do sistema o almoxarifado alterado continua e o novo selecionado fica ao lado.Ex.:Caso altere 3 vezes o almoxarifado, os nomes dos mesmos irão se acumular no rodapé do sistema.segue imagem em anexo.
- Resolução da Pendência Nº 10017
  > Tela\Opçao No Sistema: Consulta/Consulta Saldo dos Produtos - Saldo nos Almoxarifados
  Consulta/Consulta Saldo dos Produtos - Saldo nos Almoxarifados - Ao Cadastrar um novo insumo e efetuar a implanatção de saldo, o mesmo não aparece na consulta do saldo dos produto. na versão liberada esta funcionando.segue imagem em anexo.
- Resolução da Pendência Nº 10031
  > Tela\Opçao No Sistema: Inventário/Contagem - saldo dos produtos
  Inventário/Contagem - saldo dos produtos - o sistema não esta trazendo o saldo dos produtos, parametrizado anteriormente na contagem para aparecer.segue imagem em anexo.
================================================================================
CM$VER      3.04.07     17/10/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 9398
  > Tela\Opçao No Sistema: Sistema/Usuário X Grupo do produto
  Sistema/Usuário X Grupo do produto - Ao efetuar a associação o sistema não dessasocia osGrupos disponíveis dos Grupos associados, ficando 2 lançamentos segue imagem em anexo.
- Resolução da Pendência Nº 9473
  > Tela\Opçao No Sistema: Movimentação/Produtos Feitos na Casa - Baixa por iten
  Movimentação/Produtos Feitos na Casa - Baixa por iten - Ao tentar efetuar a baixa segue o erro de Look up table is not active
- Resolução da Pendência Nº 9477
  > Tela\Opçao No Sistema: Nota Fiscal/Ediçao de Nota Fiscal
  Nota Fiscal/Edição de Nota Fiscal - Ao Tentar incluir segue o erro de TDbItemNota : EDBEngineError
- Resolução da Pendência Nº 9739
  > Tela\Opçao No Sistema: Cadastro / Cadastro Grupo de Produtos
  O Sistema não permite excluir grupo de Analíticos e Sintéticos , informando que Grupo possui Sub Grupos 
================================================================================
CM$VER      3.04.06     15/10/2002
--------------------------------------------------------------------------------
- Correção do Cadastro de Grupo de Produto, onde este não permitia excluir itens
  analíticos
- Corrigido a rotina de verificação de Centro de Custo por Conta Contábil, onde não
  estava considerando o centro de custo do almoxarifado destino na transferência.
================================================================================
CM$VER      3.04.05     11/10/2002
--------------------------------------------------------------------------------
-  Corrigido a rotina de verifica da contabilização do produto, onde esta não estava 
   filtrando a empresa proprietária
================================================================================
CM$VER      3.04.04     04/10/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 9435
  > Tela\Opçao No Sistema: Cadastro de Insumos
  No Cadastro de Insumos ao alterar o tipo de Imposto e após salvar, o sistema volta para o imposto colocado anteriormente.
- Resolução da Pendência Nº 9603
  > Tela\Opçao No Sistema: Recebimento de Mercadoria Sem O.C.
  Ao dar entrada em uma nota fiscal (Sem O.C), e a data não for dia útil. O sistema pergunta se deseja alterar, caso sim, ok, mas se clicar não, o sistema trava e não conclui o Recebimento de Mercadoria Sem O.C.
- Incluido nos cadastros de Produtos o Último Produto Cadastrado
- Corrigida a Rotina de Lancamento de Estoque ], o movimento 'X' lançava quantidade
  erradas para correção do saldo.
  
================================================================================
CM$VER      3.04.03     02/10/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 8286
  > Tela\Opçao No Sistema: Nota Fiscal\Edição de Nota fiscal
  Nota Fiscal\Edição de Nota fiscal - Ao incluir segue o erro de " Erro ao executar o metodo insert
- Resolução da Pendência Nº 9398
  > Tela\Opçao No Sistema: Sistema/Usuário X Grupo do produto
  Sistema/Usuário X Grupo do produto - Ao efetuar a associação o sistema não dessasocia osGrupos disponíveis dos Grupos associados, ficando 2 lançamentos segue imagem em anexo.
- Resolução da Pendência Nº 9470
  > Tela\Opçao No Sistema: Movimentação/Atualização de preço da última compra
  Movimentação/Atualização de preço da última compra- estão ocorrendo vários erros dentre eles ao tentar selecionar o gupo de produtos segue o erro de " Look up table is not active"
- Resolução da Pendência Nº 9477
  > Tela\Opçao No Sistema: Nota Fiscal/Ediçao de Nota Fiscal
  Nota Fiscal/Edição de Nota Fiscal - Ao Tentar incluir segue o erro de TDbItemNota : EDBEngineError
- Resolução da Pendência Nº 9478
  > Tela\Opçao No Sistema: Nota Fiscal/Configuração de nota de devolução
  Nota Fiscal/Configuração de nota de devolução- Ao tentar EXCLUI,R o sistema informa que existe registro filho, sendo que o mesmo acabou de ser cadastrado.
================================================================================
CM$VER      3.04.02     02/09/2002
--------------------------------------------------------------------------------
- Correção no cadastro de Grupo de Produto, os botões ficavam sempre disponíveis
- Correção no Atendimento de Requisição Cadastrada, entrada com a data  da requisição
   e  não do atendimento 
- Correção na Baixa por Perda , setfocus com erro
================================================================================
CM$VER      3.04.01     19/08/2002
--------------------------------------------------------------------------------
- Criação da DPL CmAlmoxCompraObj50;
================================================================================
CM$VER      3.04.00     09/08/2002
--------------------------------------------------------------------------------
-  Incluido o Parametro Programa para intregração previdenciária
================================================================================
CM$VER      3.03.01     04/07/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 7751
  > Tela\Opçao No Sistema: Gestão de Estoque - Relatório Recebimento de Mercadoria por Tipo de Desembolso
  No Relatório Recebimento de Mercadoria por Tipo de Desembolso está aparecendo o Tipo de Recebimento igual ao mesmo código do Tipo de Desembolso com o mesmo valor. Só deve aparecer os Tipos de Desembolso.
OBS: Exemplo em anexo - Bares código 01.02 (Tipo de Recebimento) - Fornecedor de Produtos código 01.02 (Tipo de Desembolso). Instância PRO.
================================================================================
CM$VER      3.03.00     13/06/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 6556
  > Tela\Opçao No Sistema: Consulta/ Relatório/ Operacionais / Requisições Lançadas 
  - Incluir um 'CHECK-BOX', imprimir somente itens estocáveis, no relatório
Solic. Anelisa
 
Solic. Anelisa
- Resolução da Pendência Nº 6557
  > Tela\Opçao No Sistema: Consulta/ Relatório/ Operacionais / Recebimento de Mercadorias
  - Incluir um 'CHECK-BOX', imprimir somente itens estocáveis, nos relatórios
Solic. ANELISA
- Resolução da Pendência Nº 6558
  > Tela\Opçao No Sistema: Consulta/ Relatório/ Operacionais / Recebimento de Mercadorias
  No relatorio de recebimento de mercadoria colocar opção de não imprimir os itens do ativo/fixo  (FLGTIPOMOV=A)
Solic. Anelisa 
- Resolução da Pendência Nº 6647
  > Tela\Opçao No Sistema: Relatorio de Reconciliação de Valor e Quantidade
  Colocar opção de imprimir somente os itens estocáveis nos relatórios de Reconciliação de Valor e Quantidade
- Resolução da Pendência Nº 6556
  > Tela\Opçao No Sistema: Consulta/ Relatório/ Operacionais / Requisições Lançadas 
  - Incluir um 'CHECK-BOX', imprimir somente itens estocáveis, no relatório
Solic. Anelisa
 
Solic. Anelisa
- Resolução da Pendência Nº 6557
  > Tela\Opçao No Sistema: Consulta/ Relatório/ Operacionais / Recebimento de Mercadorias
  - Incluir um 'CHECK-BOX', imprimir somente itens estocáveis, nos relatórios
Solic. ANELISA
- Resolução da Pendência Nº 6558
  > Tela\Opçao No Sistema: Consulta/ Relatório/ Operacionais / Recebimento de Mercadorias
  No relatorio de recebimento de mercadoria colocar opção de não imprimir os itens do ativo/fixo  (FLGTIPOMOV=A)
Solic. Anelisa 
- Resolução da Pendência Nº 6647
  > Tela\Opçao No Sistema: Relatorio de Reconciliação de Valor e Quantidade
  Colocar opção de imprimir somente os itens estocáveis nos relatórios de Reconciliação de Valor e Quantidade
================================================================================
CM$VER      3.02.04     20/05/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 6556
  > Tela\Opçao No Sistema: Consulta/ Relatório/ Operacionais / Requisições Lançadas 
  - Incluir um 'CHECK-BOX', imprimir somente itens estocáveis, no relatório
Solic. Anelisa
 
Solic. Anelisa
- Resolução da Pendência Nº 6557
  > Tela\Opçao No Sistema: Consulta/ Relatório/ Operacionais / Recebimento de Mercadorias
  - Incluir um 'CHECK-BOX', imprimir somente itens estocáveis, nos relatórios
Solic. ANELISA
- Resolução da Pendência Nº 6558
  > Tela\Opçao No Sistema: Consulta/ Relatório/ Operacionais / Recebimento de Mercadorias
  No relatorio de recebimento de mercadoria colocar opção de não imprimir os itens do ativo/fixo  (FLGTIPOMOV=A)
Solic. Anelisa 
- Resolução da Pendência Nº 6647
  > Tela\Opçao No Sistema: Relatorio de Reconciliação de Valor e Quantidade
  Colocar opção de imprimir somente os itens estocáveis nos relatórios de Reconciliação de Valor e Quantidade
================================================================================
CM$VER      3.02.03     09/05/2002
--------------------------------------------------------------------------------
- Relatório de custo por centro de custo analítico, estava filtrando o grupo de produto
  pela empresa, corrigido.
================================================================================
CM$VER      3.02.02     03/05/2002
--------------------------------------------------------------------------------
- Introduçãos cadastro em 3 camadas.
================================================================================
CM$VER      3.02.01     01/04/2002
--------------------------------------------------------------------------------
- Acompanhamento de requisições cadastradas, quando se seleciona todas, mostra as 
  requisições de todas as empresas cadastradas. Implementar para que seja separada
  por empresa.
- Quando a solicitação for feita para custo, testar a conta contábil
  x centro de custo dos produtos solicitados.
- Dar mensagem quando estamos com inventário aberto e estamos fazendo uma 
  movimentação para uma data maior que a data represa para informar que este 
  lançamento NÃO entrará na contagem física.
- Relatório de requisição cadastrada implementar para mostrar atividade projeto.
================================================================================
CM$VER      3.02.00     08/03/2002
--------------------------------------------------------------------------------
- Implementado o conceito de produto ATIVO, onde este deixa de existir logicamente
  para o sistema, quando este não está ativo.
================================================================================
CM$VER      3.01.01     23/01/2002
--------------------------------------------------------------------------------
- Corrigido relatório de Solicotação de compras, onde se o produto tivesse diversos
  prazos de pagamento na OC, duplica o item no relatório.
- Corrigido Recebimento de Mercadoria, onde se houvesse avalição do fornecedor
  não excluia a nota
.
================================================================================
CM$VER      3.01.00     14/01/2002
--------------------------------------------------------------------------------
- Criado om parametro para aceitar requisição cadastra sem saldo no almorarifado de 
   origem.
- Criado Observação da  requisição cadastra, tanto para a requisção como para o item.
- Implementado filtro no relatório de Planilha de produtos para  imprir só produtos com
  saldo.
================================================================================
CM$VER      3.00.29     21/12/2001
--------------------------------------------------------------------------------
- Implementado ordenação nos Relatórios de Recebimento de Mercadoria/Sintético.
================================================================================
CM$VER      3.00.28     14/12/2001
--------------------------------------------------------------------------------
-  Corrigido :
  No relatório de Recebimento de Mercadoria/Recebimento de Mercadoria
  Sintético, eu informo a data inicial e data de término, seleciono o
  Almoxarifado e Ardem, o filtro do Almoxarifado não está funcionando, poís
  faço a troca do almoxarifado de materias diversos e almoxarifado central e
  tenho as mesma informações, sendo os mesmos almoxarifados diferentes.
- Implementado : 
  Verificação de quantidade igual a zero na requisição de material
  manual. 
================================================================================
CM$VER      3.00.27     10/12/2001
--------------------------------------------------------------------------------
-  Implementado Novo  Relatório :  Ajustes Financeiros
================================================================================
CM$VER      3.00.26     21/11/2001
--------------------------------------------------------------------------------
- Implementado a edição de Notas Diversas.
================================================================================
CM$VER      3.00.25     26/10/2001
--------------------------------------------------------------------------------
- Corrigido o Relatório de Consumo médio dos produtos, que não esta tratando os
  movimentos  do tipo ( B ) e ( S ).
================================================================================
CM$VER      3.00.24     09/10/2001
--------------------------------------------------------------------------------
- Implementada na tela de contagem Física dos Produtos, que só aparesam os
  itens estocáveis Pend : 4456
- Na tela de Consulta dos Saldos dos Produtos, não aparecia os dados da última
  compra. Pend : 4678
- Implementada tela para  Exclusão da Integração dos Custos Contábeis. Pend: 4687
- Implementado Relatório de Ultima movimentação dos Produtos. Pend : 4641
================================================================================
CM$VER      3.00.23     02/10/2001
--------------------------------------------------------------------------------
- Acertado o valor do imposto a recuperar na nota fiscal de devolução.
================================================================================
CM$VER      3.00.22     27/09/2001
--------------------------------------------------------------------------------
- Implementada na tela de requisição manual.a verificação de numero da requisição 
  por item.
================================================================================
CM$VER      3.00.21     21/09/2001
--------------------------------------------------------------------------------
- Correção no Recebimento de Mercadoria com O.C., estava dando erro ao tentar 
  gravar a tabela SOLIBAIXADAS.
================================================================================
CM$VER      3.00.20     20/09/2001
--------------------------------------------------------------------------------
- Correção do relatório de Reconciliação de estoque.
- Implementação do filtro : não  imprimir artigos com saldo zero, no retório de 
  Artigos sem movimentação.
================================================================================
CM$VER      3.00.19     28/08/2001
--------------------------------------------------------------------------------
- Otimização da entrada do aplicativo.
================================================================================
CM$VER      3.00.18     24/08/2001
--------------------------------------------------------------------------------
- Alterado rotina de geração de arquiuvo do SENAC
- Corrigida tela de Requsição Manual/Cadastrada que a partir da versão 3.00.17 só 
  lançava com quantidade zerada.
================================================================================
CM$VER      3.00.17     21/08/2001
--------------------------------------------------------------------------------
Problemas corrigidos :
- Na impressão da SCI, não está saindo a data da ultima compra
  e sim uma data que nem sabemos o que é. 
- Nas telas de requisição manual e cadastrada inverter a ordem 
  do campo Unidade com Quantidade.
- Rever completamente a tela de baixa direta que não está 
  operacional.
- Na tela de baixa direta aumentar o número de casas decimais da 
  quantidade para ficar igual ao do recebimento.
- ERRO NA NOVA VERSÃO ENVIADA NO ATENDIMENTO DE REQUISIÇÃO 
  CADASTRADA FIELD UNIDNEGOC NOT FOUND.
================================================================================
CM$VER      3.00.16     13/08/2001
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 2529
  > Tela\Opçao No Sistema: 
  O cadastro de requisição de material, está permitindo selecionar todos os produtos, mesmo os de grupos que estão associados ao usuário.
- Resolução da Pendência Nº 2168
  > Tela\Opçao No Sistema: 
  Busca do compromisso ou reserva nos demais módulos não permite distinguir as reservas/comp - mostrar nº e nome da conta e observação da reserva/compromisso.
- Resolução da Pendência Nº 4194
  > Tela\Opçao No Sistema: 
  Incluir uma opção para o (usuário que fez a requisição). Incluir no relatório "Requisições Lançadas" e no menu Consulta, na opção: "Acompanhamento de Requisição Cadastrada".
Obs: Ao fazer a consulta de Requisicoes que foram atendidas, o Almoxa oferece varias informaçoes, inclusive  o Centro de Custo da pessoa que fez a requisiçao.  
Acontece que alguns hoteis, possuem uma grande numero de pessoas, pertencendo a um mesmo Centro de Custo, e dessa forma fica inviavel identificador o autor da requisicao.
================================================================================
CM$VER      3.00.15     07/08/2001
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 4245
  > Tela\Opçao No Sistema: BRASILTON CONTAGEM
  No relatório de Itens sem movimentação está demorando aproximadamente 6 horas para gerá-lo. 
Otimizar este tempo.
Obs: Testado por Sergio
================================================================================
CM$VER      3.00.14     06/08/2001
--------------------------------------------------------------------------------
- Corrigidos erros de português na tela de configuração de Impressão de 
   Nota de Devolução.
================================================================================
CM$VER      3.00.13     13/07/2001
--------------------------------------------------------------------------------
- Corrigido a Rotina de devolução de mercadoria, onde o debito não batia com credito.
- Implementada a rotina de impressão de nota fiscal de devolução.
- Resolução da Pendência Nº 1482
  > Tela\Opçao No Sistema: Alteração de Nota Fiscal
  Incluir opção de alterar a nota fiscal do almoxarifado.
- Resolução da Pendência Nº 1503
  > Tela\Opçao No Sistema: Relatório de Notas x Custos Agregados
  Colocar um resumo de totalização dos custos agregados no final deste relatório
- Resolução da Pendência Nº 2375
  > Tela\Opçao No Sistema: 
  Adaptar o relatório de Requisições Lançadas para conter uma opção de somente imprimir requisições não impressas ou impressas.
- Resolução da Pendência Nº 3548
  > Tela\Opçao No Sistema: 
  Criar em algum dos menus, sistema ou relatórios a opcao para que o usuario possa configurar e imprimir notas fiscais de devolucao de mercadoria
- Resolução da Pendência Nº 3880
  > Tela\Opçao No Sistema: 
  Relatório de notas que não tiveram integração com o CAP.
- Resolução da Pendência Nº 4220
  > Tela\Opçao No Sistema: 
  O relatório de Custo por Centro de Custo Analítico, não traz o custo dos ajustes de estoque gerados na análise da contagem do almoxa.
- Resolução da Pendência Nº 4221
  > Tela\Opçao No Sistema: Acompanhamento de Requisição
  Na consulta de Acompanhamento de Requisição, quando damos duplo click em cima do item para ver os atendimentos o sistema sempre mostra o item "EXTRATATO DE SAPOPONA"
- Resolução da Pendência Nº 4227
  > Tela\Opçao No Sistema: 
  Na impressao da sugestão de compra ter a opção de não imprimir os itens com o valor de quantidade a comprar zerados.
- Resolução da Pendência Nº 1503
  > Tela\Opçao No Sistema: Relatório de Notas x Custos Agregados
  Colocar um resumo de totalização dos custos agregados no final deste relatório
- Resolução da Pendência Nº 2375
  > Tela\Opçao No Sistema: 
  Adaptar o relatório de Requisições Lançadas para conter uma opção de somente imprimir requisições não impressas ou impressas.
- Resolução da Pendência Nº 3548
  > Tela\Opçao No Sistema: 
  Criar em algum dos menus, sistema ou relatórios a opcao para que o usuario possa configurar e imprimir notas fiscais de devolucao de mercadoria
- Resolução da Pendência Nº 3880
  > Tela\Opçao No Sistema: 
  Relatório de notas que não tiveram integração com o CAP.
- Resolução da Pendência Nº 4220
  > Tela\Opçao No Sistema: 
  O relatório de Custo por Centro de Custo Analítico, não traz o custo dos ajustes de estoque gerados na análise da contagem do almoxa.
- Resolução da Pendência Nº 4221
  > Tela\Opçao No Sistema: Acompanhamento de Requisição
  Na consulta de Acompanhamento de Requisição, quando damos duplo click em cima do item para ver os atendimentos o sistema sempre mostra o item "EXTRATATO DE SAPOPONA"
- Resolução da Pendência Nº 4227
  > Tela\Opçao No Sistema: 
  Na impressao da sugestão de compra ter a opção de não imprimir os itens com o valor de quantidade a comprar zerados.
================================================================================
CM$VER      3.00.12     04/07/2001
--------------------------------------------------------------------------------
- Acertado os Relatorios de Reconciliação de Estoque
- implementada o a proibição de recebimentos de Itens Estocáveis direto para custo.
- Resolução da Pendência Nº 4123
  > Tela\Opçao No Sistema: Devolução de Mercadoria
  Colocar na tela de devolução de mercadoria o combo para selecionar o código fiscal de devolução. Trazer como default o que ele lança atualmente.
================================================================================
CM$VER      3.00.11     20/06/2001
--------------------------------------------------------------------------------
- Acertado o relatório de Solicitação Pré-Pronta.
================================================================================
CM$VER      3.00.10     18/06/2001
--------------------------------------------------------------------------------
- Otimizado o relatório de Solicitação de Compras.
================================================================================
CM$VER      3.00.09     15/06/2001
--------------------------------------------------------------------------------
- Alterada a rotina de exclusão de Nota Fiscal
- Corrigida a rotina de processamento de Data Represa.
================================================================================
CM$VER      3.00.08     12/06/2001
--------------------------------------------------------------------------------
- Ao efetuar uma devolução de uma baixa (requisição), para efeito do arq. em 
 questão o sistema está gravando como se fosse uma baixa. Ou seja, no lugar 
 de abater do saldo, está dobrando o valor. 
 Para resolver, basta gravar os valores de débito e crédito nas colunas de 
 crédito e débito respectivamente. (CORRIGIDO)
- Aumentado o tamanho do campo termo de invetário.
 
================================================================================
CM$VER      3.00.07     05/06/2001
--------------------------------------------------------------------------------
- Atendimento/Cadastramento de requisição acertado o teste para centros de custo
  não válidos.
- Alterada a ordem dos campos ns tela de recebimento com O.C.
- Alterador o relatório de Custos Contábeis Sintético e Analítico para quando solicitado
   pela Conta de Saída, considerar as baixas feitas  diretamente para custos.
================================================================================
CM$VER      3.00.06     30/05/2001
--------------------------------------------------------------------------------
- Implementados os Relatórios :
    * Requisições Lançadas Sintéticas
    * Recebimento de Mercadoria por Tipo de Desembolso
================================================================================
CM$VER      3.00.05     24/05/2001
--------------------------------------------------------------------------------
- Implementado no Relatório de Livro Registro de Inventario, opção de :
   * Filtro oir data
   * Não imprimir Itens com saldo zerado
   * Indicar Nº inicial da página
================================================================================
CM$VER      3.00.04     11/05/2001
--------------------------------------------------------------------------------
- Acerto  nos parametro do Tipo Data nas Rotinas de Lançamento em estoque.  
================================================================================
CM$VER      3.00.03     22/05/2001
--------------------------------------------------------------------------------
- Ajuste na rotina de de verficação de Centro de Custo. (Requisição de mercadoria)
================================================================================
CM$VER      3.00.02     27/04/2001
--------------------------------------------------------------------------------
- Alteração na rotina de Lançamento Retroativo. esta dando em determinados caso
  violação de acesso.
================================================================================
CM$VER      3.00.01     19/04/2001
--------------------------------------------------------------------------------
- Alteração nos relatorios de Planilha de Inventarios, filtrar so os intens estocaveis.
- Inclusão do Filtro Grupo de produtos no relatório Custo por Centro de Custo.
================================================================================
CM$VER      3.00.00     04/04/2001
--------------------------------------------------------------------------------
Liberação em Delphi 5.0
================================================================================
CM$VER      2.15.01     08/03/2001
--------------------------------------------------------------------------------
- Alterado os relatórios de Custo Contabeis, onde não mais levam em conta as entradas
  direto para custo.
================================================================================
CM$VER      2.15.00     01/03/2001
--------------------------------------------------------------------------------
- Criado o campo FLGENTRADACUSTO na tabela MOVIMENT
- Alterada a rotina de Data Represa
================================================================================
CM$VER      2.14.11     21/02/2001
--------------------------------------------------------------------------------
- Implementanda a Consulta Consumo dos Produtos
- Corrigido relatorio de Requisições Lançadas, não filtrava por  Nº da requisição. 
================================================================================
CM$VER      2.14.10     25/01/2001
--------------------------------------------------------------------------------
- Corrigida a rotina de Recebimento de mercadoria com OC, que não apresentava 
  as OC pendentes ou  com a quantidade pendente zero.
================================================================================
CM$VER      2.14.09     24/01/2001
--------------------------------------------------------------------------------
- Alterada a rotina de lançamento de produtos, onde o movimento tipo 'X' não sera mais
  verificado data de travamento.
================================================================================
CM$VER      2.14.08     18/01/2001
--------------------------------------------------------------------------------
- Implementado tratamentro de previsão de paamento de O.C.
- Includio filtro de almoxarifado na tela de geração de arquivo texto do SENAC
================================================================================
CM$VER      2.14.07     11/01/2001
--------------------------------------------------------------------------------
- Implementado utilitário para exportação em arquivo texto para o SENAC
================================================================================
CM$VER      2.14.06     14/12/2000
--------------------------------------------------------------------------------
- Acertada a conversão de unidade e a quantidade pendente no recebimento com OC
================================================================================
CM$VER      2.14.05     01/12/2000
--------------------------------------------------------------------------------
* Acertada a exclusão de uma nota fiscal com itens do ativo fixo.
================================================================================
CM$VER      2.14.04     01/12/2000
--------------------------------------------------------------------------------
- Alterado o recebimento de mercadoria com OC quando tinha RAD.
- No login, mostrar somente os centros de custo ativos.
- No recebimento de mercadoria também, mostrar somente centros de custo e centros de
  responsabilidade ativos.
- Na tela de cadastro de usuario x centro de custo mostrar somente os ativos.
- Na tela de baixa manual mostrar somente os ativos.
================================================================================
CM$VER      2.14.03     16/11/2000
--------------------------------------------------------------------------------
- Alteração da função de integração com o Ativo Fixo.
================================================================================
CM$VER      2.14.02     07/11/2000
--------------------------------------------------------------------------------
- Implementação : No recebimento de mercadoria so aparecer os centro de custo ativos.
================================================================================
CM$VER      2.14.01     19/10/2000
--------------------------------------------------------------------------------
- Alteração do relatório de requisição cadastrada.
================================================================================
CM$VER      2.14.00     28/09/2000
--------------------------------------------------------------------------------
- Implementado o Cadastro de Usuario por Grupo de Produto
================================================================================
CM$VER      2.13.05     22/09/2000
--------------------------------------------------------------------------------
- Corrigido o erro no extrato de movimentação de item, que não mostrava o relatório 
  quando o produto não tinha movimentação anterior a data inicial do período.
- Alterada a fomra de implantação de saldo, quando este já possui movimentação.
================================================================================
CM$VER      2.13.04     11/09/2000
--------------------------------------------------------------------------------
-  Implementar a pesquisa à associação de usuários x centros de responsabilidade
   na tela de  cadastro de solicitação de compras.
- Criado o Relatorio de Giro de Produtos.
================================================================================
CM$VER      2.13.03     08/09/2000
--------------------------------------------------------------------------------
- Acertou o recebimento com OC, quando a empresa possuia RAD.
================================================================================
CM$VER      2.13.02     30/08/2000
--------------------------------------------------------------------------------
- Acertado o erro no relatório de extrato de movimentação = NOT SINGLE GROUP BY
================================================================================
CM$VER      2.13.01     17/08/2000
--------------------------------------------------------------------------------
- Implementeda a restrição de grau do grupo de produto no tipo de processo.
================================================================================
CM$VER      2.13.00     11/08/2000
--------------------------------------------------------------------------------
- Alteração na rotina de Exclusão de Nota Fiscal 
- Inclusão dos parâmetros PLANO e PATROCINADORA.
- Alterado o extrato de movimentação de itens, não estava apresentado o relatório quando
  não era indicado o artigo.
================================================================================
CM$VER      2.12.05     02/08/2000
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 2049
  > Tela\Opçao No Sistema: 
  Opção para lançamento de nota fiscal paga a vista (sem gerar lançamento no Contas a Pagar). 
A contabilização deverá ser a mesma (D-estoque e C-fonecedor), somente não gerar lançamento Contas a Pagar.
Previsão de término estima por Rosane
================================================================================
CM$VER      2.12.04     19/07/2000
--------------------------------------------------------------------------------
- Alterado o Relatório de Curva ABC de Compras
================================================================================
CM$VER      2.12.03     14/07/2000
--------------------------------------------------------------------------------
- Alterado a rotina de geração de SCI automática, para gravar o saldo a comprar.
- Relatório de SCI, não esta ficando com estatus de impresso, corrigido.
================================================================================
CM$VER      2.12.02     08/07/2000
--------------------------------------------------------------------------------
- Acetado o cálculo do lançamento retroativo, caso não houvesse movimentação
  em algum almoxarifado na data do processamento.
================================================================================
CM$VER      2.12.01     21/06/2000
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 2048
  > Tela\Opçao No Sistema: 
  Não permitir baixa de requisição com data maior que a data do dia.
Prazo de término estimado por Rosane.
- Resolução da Pendência Nº 2078
  > Tela\Opçao No Sistema: Relatório Sugestão de Compra
  Inclusão do  codigo do produto no relatório Sugestão de Compras
- Alterada a formula de cáculo da quantidade da OC no recebimento de mercadoria
================================================================================
CM$VER      2.12.00     15/06/2000
--------------------------------------------------------------------------------
- Criado o parâmetro para indicar o TIPO DE DOCUMENTO para nota de Devolução.
- Implementada mascara no tipo do documento na Nota de Devolução
================================================================================
CM$VER      2.11.27     12/06/2000
--------------------------------------------------------------------------------
- Alterada a Devolução de Mercadoria, incluidos os campos para o Livro Fiscal, na
  tabela LANCTODOCUM : NUMFATURA, FLGTIPOFATURA e CODTIPDOC  
================================================================================
CM$VER      2.11.26     08/06/2000
--------------------------------------------------------------------------------
- Corrigido a Geração de SCI automatica
- Corrigida Exclusão de Nota Fiscal quando esta era para custo. Não desfazia a integração
   com a contabilidade.
================================================================================
CM$VER      2.11.25     02/06/2000
--------------------------------------------------------------------------------
- Implementeado a Geração de SCI automaticamente a parti da Requisição de Material.
================================================================================
CM$VER      2.11.24     31/05/2000
--------------------------------------------------------------------------------
- Implementação da Solcitação Pré-Pronta incluido :
   * Data de Emissão 
   * Data de Necessidade
   * Observação
- Implementado nos Relatorios de Recebimento de Mercadoria, o tipo do documento.
- Resolução da Pendência Nº 1678
  > Tela\Opçao No Sistema: 
  · Recebimento de Mercadorias Com OC e Sem OC Indicar se a operação é referente a um Remito ou a uma Fatura. Caso seja Remito Marcar o documento como engloba parcela, caso fatura deixar a opção desmarcada. Em ambos os casos vincular as opções: Remito com 'Engloba e Parcela Marcado' e Fatura com 'Engloba e Parcela Desmarcado';
================================================================================
CM$VER      2.11.23     25/05/2000
--------------------------------------------------------------------------------
* Alterado o relatório "Custo por Centro de Custo" para ser emitido até um determinado 
  grau do Centro de Custo e do Grupo de Produtos.
================================================================================
CM$VER      2.11.22     22/05/2000
--------------------------------------------------------------------------------
- Acertado o saldo pendente de entrega quando existiam mais de uma SCI para o mesmo
   produto
================================================================================
CM$VER      2.11.21     17/05/2000
--------------------------------------------------------------------------------
- Implementação :
    * Opção de ordenação no relatório de SCI e opção deste sair resumido.
    * Descrição do centro de custo do Relatório de SCI   
- Alterado Relátório Requsições Cadastrada, podendo ser impresso sem indicação do
  almoxarifado origem.
================================================================================
CM$VER      2.11.20     12/05/2000
--------------------------------------------------------------------------------
* Criada a possibilidade de efetivar o compromisso orçamentário vindo do sistema de compras.
================================================================================
CM$VER      2.11.19     11/05/2000
--------------------------------------------------------------------------------
- Implementado Relatório de Livro de Registro de Inventário.
================================================================================
CM$VER      2.11.18     27/04/2000
--------------------------------------------------------------------------------
- Correção no Lançamento Automático de impostos associados ao fornecedor
================================================================================
CM$VER      2.11.17     20/04/2000
--------------------------------------------------------------------------------
- Alterada a forma de buscar o valor de entrada em uma transferencia entre 
  almoxarifados (I).
================================================================================
CM$VER      2.11.16     18/04/2000
--------------------------------------------------------------------------------
- Implmentações
     * Recebimento de Mercadoria para ativo fixo gerando Nº de bens
        correspondente a quantidade passada.
     * Relatórios
             º Custo por Centro de Custo Analítico - Filtro por Grupo de produto
             º Extrato de Movimentação Sintético   - Inclusão do Saldo do Produto
================================================================================
CM$VER      2.11.15     13/04/2000
--------------------------------------------------------------------------------
- Implementado Movimentação de Produtos Feitos na Casa
- Alterado o Relatório de Reconciliação de Estoque
================================================================================
CM$VER      2.11.14     06/04/2000
--------------------------------------------------------------------------------
-  Solicitação Pré-Pronta estava repetido quatidade solicitada para todos os
   itens, quando estava selecionada para repetir o Nº de pessoas. Acertado.
- Alterado analise de estoque para compatibilização com o sistema de compras 
  novo.
================================================================================
CM$VER      2.11.13     29/03/2000
--------------------------------------------------------------------------------
- Alterada a procurada da Tela de Cadastro de Requsição
================================================================================
CM$VER      2.11.12     14/03/2000
--------------------------------------------------------------------------------
- Alterado relatório de requisição cadastrada, em função da unidade de conversão
  de medida
================================================================================
CM$VER      2.11.11     09/03/2000
--------------------------------------------------------------------------------
- Alterado o Relatório de Impressão de S.C.I., onde o produto não possuindo
  custo médio, este assim mesmo irá ser impresso.
================================================================================
CM$VER      2.11.10     09/03/2000
--------------------------------------------------------------------------------
- Alterada a implantação de saldo do almoxarifado para permitir a alteração do  
  saldo inicial mesmo este já tendo movimento. 
================================================================================
CM$VER      2.11.09     02/03/2000
--------------------------------------------------------------------------------
- Acertada a exclusão de nota quando o lançamento era feito em unidade diferente
  da do custo médio e a data do lançamento era posterior a data represa.
================================================================================
CM$VER      2.11.08     01/03/2000
--------------------------------------------------------------------------------
- Implementado o Utilitário Ajuste de Conversão de unidade de medida 
================================================================================
CM$VER      2.11.07     25/02/2000
--------------------------------------------------------------------------------
- Implementada a atualização com a integração com o sistema de Contas a Pagar
================================================================================
CM$VER      2.11.06     17/02/2000
--------------------------------------------------------------------------------
- Acertada a função de conversão de unidade de medida
================================================================================
CM$VER      2.11.05     15/02/2000
--------------------------------------------------------------------------------
- Implementada a função R.A.D. na requisição de material
- Acertado os relatorios de :
   * Custo por centro de custo Anual
   * Conciliação entre Contabilidade e Almoxarifado
- Implementada verficação de classificação fiscal para fornecedores (Argentina)
================================================================================
CM$VER      2.11.04     09/02/2000
--------------------------------------------------------------------------------
-  Alterações no recebimento de mercadoria 
   *Aumentado o tamanho do Nº da Nota
   *Implementrado exclusão de Imposto Retido
================================================================================
CM$VER      2.11.03     07/02/2000
--------------------------------------------------------------------------------
- Otimização da rotina de movimentação de produtos.
================================================================================
CM$VER      2.11.02     04/02/2000
--------------------------------------------------------------------------------
- Alterada Tela de Recebomento de Mercadoria, caso o fornecedor não tenha
 endereço comercial o default para a classificação fiscal é 1 (um) para o 1º digito
================================================================================
CM$VER      2.11.01     04/02/2000
--------------------------------------------------------------------------------
- Alterado o relatório Totais Financeiro 
- Alterado o relatório Requisições lançadas
- Alterardo tela de Solicitação de Compras Avulsas, não aparecem mais os itens
  que estão bloqueados para ambos (cadastro do produto).
================================================================================
CM$VER      2.11.00     28/01/2000
--------------------------------------------------------------------------------
- ATENÇÃO: Criada correlação entre almoxarifado e usuário. Para conseguir
  operar o sistema deve-se fazer antes esta correlação.
- Acertada a atualização da data represa quando se escolhe opção de somente
  atualizar o saldo.
- Incluida opção de relacionar todos os centros de custo para um usuário teclando-se
  somente em um botão.
================================================================================
CM$VER      2.10.26     25/01/2000
--------------------------------------------------------------------------------
- Corrigido o erro na tela de Consulta de Saldo, não aparecia os amlmoxarifados
  do produto selecionado.
- Corrigido o erro no relatório Notas x Custos Agregados, não estava trazendo
  corretamento os Custos Agregados.
================================================================================
CM$VER      2.10.25     18/01/2000
--------------------------------------------------------------------------------
- Acertado o multi-empresa dos relatorios e consultas abaixo:
  * Relatórios Notas x Custo agregado
  * Relatório Sintético de Notas
  * Consulta Saldo de Produto
- Acertada a alteração de solicitação de compra.
- Acertada a consulta de acompanhamento de requisição que estava mostrando
  os itens 'pendentes' como 'estornados'.
================================================================================
CM$VER      2.10.24     12/01/2000
--------------------------------------------------------------------------------
- Acertado o multi-empresa na pasta de custos agregados
================================================================================
CM$VER      2.10.23     12/01/2000
--------------------------------------------------------------------------------
- Acertado o multi-empresa da implantação de saldo.
================================================================================
CM$VER      2.10.22     07/01/2000
--------------------------------------------------------------------------------
- Acertado o access da tela de gestão de estoque apos a geração da SCI.
================================================================================
CM$VER      2.10.21     07/01/2000
--------------------------------------------------------------------------------
- Incluido o multi-empresa na pasta de contabilização do cadastro de produto e no
   cadastro de agregado.
================================================================================
CM$VER      2.10.20     06/01/2000
--------------------------------------------------------------------------------
- Acertada a procura de Artigos no Cadastro de Requisição, Solicitação de 
Compra Avulsa e Requisição Manual.
================================================================================
CM$VER      2.10.19     05/01/2000
--------------------------------------------------------------------------------
- Acertada a exclusão de Nota Fiscal permitindo a exclusão de Notas  
com pagamentos extornados.
================================================================================
CM$VER      2.10.18     31/12/1999
--------------------------------------------------------------------------------
- Implementado filtro por fornecedor  no relatório de Recebimento de Mercadoria
- Implementado máscara de número da Nota Fiscal.
- Implementado pergunta, quando recebimento de mercadoria com O.C., caso 
  quantidade recebida for menor que a solicitada, se deseja que fique pendete.
- Implementado verificação na NF quanto ao documento, se este é englobado ou
  parcelado.
- Implementado gravação de prazo de pageamento prazo de entrega na O.C. na
  NF sem O.C.
   
================================================================================
CM$VER      2.10.17     21/12/1999
--------------------------------------------------------------------------------
- Acertado o erro do Relatório Custo\Totais Financeiros
================================================================================
CM$VER      2.10.16     09/12/1999
--------------------------------------------------------------------------------
- Implementada tela para atualizar o preço de última compra
- Informado o número da  requisição cadastrada no momento da inclusão.
- Recebimento de Mercadoria
  * Colocada a exclusão automática da nota fiscal no livro quando esta é excluida pelo
    almoxarifado. (I)
  * Criado os itens da ordem de compra no recebimento sem OC para posterior 
    impressão no sistema de compras.(I)
  * Incluida a possibilidade de calcular a retenção no lançamento da nota fiscal de 
    entrada e complementar.(I)
  * Colocada a atualização do preço de ultima compra no artigo (I).
- Acerto no arredondamento da função de lançar a movimentação no almoxarifado (I)
================================================================================
CM$VER      2.10.15     02/12/1999
--------------------------------------------------------------------------------
- Implementação da rotina de estorno de requisição cadastrada, quanto
  ao atendimento.
- Correção no cadastro de Requisição, possibilitando selecionar qualquer produto
  caso a contabiliade não esteja integrada.
================================================================================
CM$VER      2.10.14     02/12/1999
--------------------------------------------------------------------------------
- Reimplementada a Rotina de Atualização de Movimentos dos Produtos.
================================================================================
CM$VER      2.10.13     29/11/1999
--------------------------------------------------------------------------------
- Correção na rotina de lançamento no almoxarifado, onde os movimentos do tipo
  X estavam alterando incorretamente o custo médio dos produtos.
- Acertada a autorização do sistema quanto a inventário.
- Implementação da coluna de unidade de medida nos relatórios de planilha.
================================================================================
CM$VER      2.10.12     26/11/1999
--------------------------------------------------------------------------------
-  Acertado problema na rotina de data represa, que estava gerando valores com
   resíduos na décimal.
================================================================================
CM$VER      2.10.11     24/11/1999
--------------------------------------------------------------------------------
- Acertado a Implantação de Saldo
- Acertado o cadastro de Almoxarifado, não trazia a indicação de contabil
  da unidade de custeio.
================================================================================
CM$VER      2.10.10     19/11/1999
--------------------------------------------------------------------------------
- Implementação da nova rotina de movimentação para melhorar performance (I)
- Acertada a gravação do codigo fiscal na nota complementar (I)
================================================================================
CM$VER      2.10.09     16/11/1999
--------------------------------------------------------------------------------
- Implementado nova mensagem de erro na integração contábil
================================================================================
CM$VER      2.10.08     12/11/1999
--------------------------------------------------------------------------------
- Implementada a Consulta de Diferêncas de Inventário por Período.
- Correção no Cadastro de Requisições Cadastrada, não permite data de 
   necessidade menor que a de emissão.
- Liberação de lançamentos com inventário aberto
================================================================================
CM$VER      2.10.07     08/11/1999
--------------------------------------------------------------------------------
- Correção na rotina de lançamentos, transferências retroativas a uma entrada de 
  mercadoria gerava uma alteração de custo médio errada.
- Implementação, da visualização do Nº da S.C.I. nas telas referentes.
================================================================================
CM$VER      2.10.06     25/10/1999
--------------------------------------------------------------------------------
- Acertada a exclusão de Nota Fiscal, para não aceitar a exclusão quando 
   a mesma já está em algum lote para pagamento ou já tenha algum 
   pagamento para ela. Também acertado a exclusão da contabilização quando 
   existe outros lançamentos para mesma Nota.
================================================================================
CM$VER      2.10.05     21/10/1999
--------------------------------------------------------------------------------
- Acertado o problema de zerar o custo médio quando zerava o saldo do produto
================================================================================
CM$VER      2.10.04     20/10/1999
--------------------------------------------------------------------------------
- Acertado o rateio do documento no contas a pagar quando a nota fiscal 
  tinha algum tipo de arredondamento.
================================================================================
CM$VER      2.10.03     19/10/1999
--------------------------------------------------------------------------------
 - Acertado o relatório de Requisições cadastradas, que não imprimia o valor unitário correto.
================================================================================
CM$VER      2.10.02     14/10/1999
--------------------------------------------------------------------------------
 - Correção não Tela de Solicitação de Compras Avulsa, onde não excluia 
   nehum item, caso um dos itens já estivesse sido cotado. 
================================================================================
CM$VER      2.10.01     08/10/1999
--------------------------------------------------------------------------------
- Alterado o histórico e o centro de custo na contabilização das transferências.
================================================================================
CM$VER      2.10.00     07/10/1999
--------------------------------------------------------------------------------
- Criada a possibilidade de fazer contabilização de transferencia entre almoxarifados.
  Para tal, deve-se entrar no parametro e informar que se deseja contabilizar as transferencias.
- Acertada a criação do movimento 'X' quando o saldo fica negativo.
================================================================================
CM$VER      2.09.14     30/09/1999
--------------------------------------------------------------------------------
- Acertado o erro no relatório de Custo Contábil Sintético.
- Inclusão no a Tela de Custos Agregado da Indicação do 
  tipo do custo ( nota ou item)
================================================================================
CM$VER      2.09.13     24/09/1999
--------------------------------------------------------------------------------
- Acertado o lançamento automático dos impostos no lançamento da nota fiscal.
================================================================================
CM$VER      2.09.12     16/09/1999
--------------------------------------------------------------------------------
- Correção na devolução de Mercadoria, com relação a integração contábil
================================================================================
CM$VER      2.09.11     10/09/1999
--------------------------------------------------------------------------------
 - Correção no problema na tela de Recebimento de Mercadoria
================================================================================
CM$VER      2.09.10     08/09/1999
--------------------------------------------------------------------------------
- Alterada a contabilização da nota fiscal para testar também o histórico para 
  juntar os documentos.
================================================================================
CM$VER      2.09.09     06/09/1999
--------------------------------------------------------------------------------
- Implementação de Custo Agregado, que incidece sobre a base de cálculo de
  outro custo agregado. Ex: desconto de ICMS no item.
================================================================================
CM$VER      2.09.08     02/09/1999
--------------------------------------------------------------------------------
- Correção do erro da Nota Complementar, não aceitava a digitação do fornecedor
================================================================================
CM$VER      2.09.07     24/08/1999
--------------------------------------------------------------------------------
 - Alteração no Relatório de Requisição Cadastrada, onde agora irá sair
   uma requisição por folha
- Implementação da Solicitação de Compra para Custo
================================================================================
CM$VER      2.09.06     20/08/1999
--------------------------------------------------------------------------------
- Recebiemento de Mercadoria para Ativo fixo, foi corrigido um 
   problema de gravação dos itens de Ativo fixo. 
================================================================================
CM$VER      2.09.05     19/08/1999
--------------------------------------------------------------------------------
- Implementação do Cadastro de Itens de PDV
- Criação do Relatório de Requisições Cadastrada
- Correção no Recebimento de Mercadoria Com O.C. ,não estava permitindo 
  exclusão do item
================================================================================
CM$VER      2.09.04     11/08/1999
--------------------------------------------------------------------------------
 - Alteração na Tela de Cadastros de Premissas para Gestão de Estoque, possibilitando
   casas decimais no consumo médio.
================================================================================
CM$VER      2.09.03     11/08/1999
--------------------------------------------------------------------------------
- Alteração no atendimento de Requisição Cadastrada, quanto ao controle de
  transação ( I )
================================================================================
CM$VER      2.09.02     10/08/1999
--------------------------------------------------------------------------------
- Alteração na rotina de contabilização ( I )
================================================================================
CM$VER      2.09.01     03/08/1999
--------------------------------------------------------------------------------
 - Implementado Acompanhamento de Requisição Cadastrada no menu Consultas.
================================================================================
CM$VER      2.09.00     02/08/1999
--------------------------------------------------------------------------------
- Alterada a base de dados para o atendimento de requisições cadastradas. Esta 
  alteração possibilitará um melhor acompanhamento das requisições (I). 
- Incluida a nova função de contabilização (I).
- Acertado o cálculo do valor na diferença de inventário (I).
================================================================================
CM$VER      2.08.08     27/07/1999
--------------------------------------------------------------------------------
 - Acertado o Problema na Devolução de Mercadoria.
================================================================================
CM$VER      2.08.07     22/07/1999
--------------------------------------------------------------------------------
- Implementado no relatório de curva ABC os percentuais de ABC, a possibilidade
  de filtrar o relatório somente de um grupo, e filtrar somente para imprimiar o A, 
  A e B, A B e C ou todos os produtos.
- Implementado o filtro por centro de custo no relatório de requisições lançadas e 
  a quebra por número da requisição e centro de custo.
- Corrigidos os seguintes relatórios:
  * Artigo x Contas Contábeis 
  * Custo por Centro de Custo Analítico
  * Artigo sem movimentação
  * Conciliação entre Almoxarifado e Contabilidade
================================================================================
CM$VER      2.08.06     19/07/1999
--------------------------------------------------------------------------------
- Otimização da rotina de movimentação de produtos
- Revisão de todos os Relatórios da pasta CUSTO
- Criação do Relatório Custo por Centro de Custo Anual
- Alteração do Relatório Custos Contábeis Sintético, onde poderá ser emitido de
  forma resumida : Contas e seus respectivos Centros de Custo.
================================================================================
CM$VER      2.08.05     12/07/1999
--------------------------------------------------------------------------------
- Implementação da Integração com Orçamento na Tela de Recebimento de
  Mercadoria.
- Otimização da rotina de lançamento de produtos no almoxarifado.
================================================================================
CM$VER      2.08.04     05/07/1999
--------------------------------------------------------------------------------
- Acertada a contabilização da entrada de mercadoria para custo quando era
  cadastrado uma conta para cada centro de custo.
================================================================================
CM$VER      2.08.03     05/07/1999
--------------------------------------------------------------------------------
 - As telas de Gestão de Estoque e Inventário/Início não repetem mais o insert
   automaticamente.
 - Tela de Premissas para gestão de Estoque, totos os campos com  05 casa de
  cimais.
================================================================================
CM$VER      2.08.02     30/06/1999
--------------------------------------------------------------------------------
-  Alterações na tela de Requisição Cadastrada
     . Só apareceram na procura a requisições referentes ao almoxarifado/
       Centro de Custo que foram escolhidos ao logar.
     . Ao fazer uma procura esta agora tras preenchido corretamente se foi
       tranferência ou custo.
     . Para cencelar/sair da tela não é mais obrigatório preenchar o almoxarifado
       de origem.
================================================================================
CM$VER      2.08.01     29/06/1999
--------------------------------------------------------------------------------
 - Implementação da Reserva Orçamentária na Solicitação de Compra
 - Implementação da visualização do Código do último produto cadastrado
================================================================================
CM$VER      2.08.00     25/06/1999
--------------------------------------------------------------------------------
- Proibida a alteração de custo médio com data retroativa e com data posterior a 
  data de represamento.
- Alterada a tela de cadastro de requisição para aceitar a utilização de somente um
  almoxarifado (Baixa somente para custo).
- Incluido no cadastro do produto a possibilidade de haver uma descrição complementar
  na hora da solicitação de compra e no recebimento da mercadoria.
- Acertada a tela de implantação de saldo inicial.
================================================================================
CM$VER      2.07.11     22/06/1999
--------------------------------------------------------------------------------
- Acertada a exclusão de Recebimento de Mercadoria, quando  tinha algum item
  devolvido
- Acertado o arredondamento da integração contábil dos custos.
- Incluido na tela de Recebimento de Mercadoria a possibilidade de digitar ou
  ler o código de barra do bloquete de cobrança.
================================================================================
CM$VER      2.07.10     21/06/1999
--------------------------------------------------------------------------------
- Acerto na Tela de Implantação de Saldo, onde esta errava quando se tentava
   implantar um saldo, que já havia sido implantado.
================================================================================
CM$VER      2.07.09     17/06/1999
--------------------------------------------------------------------------------
- Alterado o teste do inventário por Unidade de Custeio para permitir 
  movimentação no mesmo dia do inventário.
- Acertado o relatório de Solicitação Pré-Pronta que não estava reimprimindo.
================================================================================
CM$VER      2.07.08     17/06/1999
--------------------------------------------------------------------------------
- Criação do Relatório de Conciliação entre Almoxarifado e Contabilidade
- Acertado a tela de Requisição Cadastrada, no referente a verficação de
   possibilidade de verificação de requisição de material. 
================================================================================
CM$VER      2.07.07     08/06/1999
--------------------------------------------------------------------------------
- Acerto do relatório CONTAS X ARTIGOS que somente imprimia as contas 
  vinculadas ao artigo e não imprimia as vinculadas ao grupo.
- Acerto da exclusão de nota quando era direto para custo ou quando era 
  efetuada a baixa direta.
- Incluido teste para não permitir rodar a integração dos custos com data 
  maior que a data represa.
================================================================================
CM$VER      2.07.06     08/06/1999
--------------------------------------------------------------------------------
- Implementação do Relatório de Custos Contábeis Sintéticos
================================================================================
CM$VER      2.07.05     07/06/1999
--------------------------------------------------------------------------------
- Incluido a rotina padrão de cadastro de fornecedores.
- Acertado o cálculo do consumo médio na tela de gestão de estoque.
================================================================================
CM$VER      2.07.04     07/06/1999
--------------------------------------------------------------------------------
- Acertada a entrada e baixa de mercadoria quando a unidade do movimento era 
  diferente da unidade de custo médio.
================================================================================
CM$VER      2.07.03     29/05/1999
--------------------------------------------------------------------------------
- Acertado o relatório inventário físico e financeiro por data.
- Incluida a descrição do produto na baixa de requisição manual.
================================================================================
CM$VER      2.07.02     27/05/1999
--------------------------------------------------------------------------------
- Correção nos lançamentos retroativos.
================================================================================
CM$VER      2.07.01     21/05/1999
--------------------------------------------------------------------------------
- Correção na função que informa o Saldo
- Correção na devolução de custo na Tela de Requisição Manual. Não devolvia 
  caso a quantidade devolvida focesse maior do que a em estoque. 
================================================================================
CM$VER      2.07.00     19/05/1999
--------------------------------------------------------------------------------
- Implementação de Lançamento Retroativo
- Nova Tela de Implantação de Saldo
================================================================================
CM$VER      2.06.18     11/05/1999
--------------------------------------------------------------------------------
- Implementação do Relatório de Extrato de Movimentação Sintético
================================================================================
CM$VER      2.06.17     07/05/1999
--------------------------------------------------------------------------------
 - Correção do Inventario Físico e Financeiro por data, que apresentava produtos
   com movimentação posterior a data indicada.
================================================================================
CM$VER      2.06.16     06/05/1999
--------------------------------------------------------------------------------
- Novo Cadastro de Premissas para Gestão de Estoque
- Nova Tela de Baixa por Perda
- Correção do Relatório de Inventario Físico e Financeiro por data, que não estava
  Filtrando por grupo.
================================================================================
CM$VER      2.06.15     26/04/1999
--------------------------------------------------------------------------------
- Requsição manual nãoe estava confirmando o detalhe com teclavamos enter
  no botão OK do detalhe focado. Este foi concertado.
================================================================================
CM$VER      2.06.14     19/04/1999
--------------------------------------------------------------------------------
- Cadastro de Produtos implementação : não se pode alterar a unidade de custo médio
  depois de o produto sofrer movimentação.
- Relatíro de Requisições lançadas Implementação : pode ser ordernado
  alfabeticamente ou order de lançamento.
- Relatório Recebimento de Mercadorias, o valor total foi ajustado para bater
  com os subtotais.
- Implementação do Utilitário de Atualização de Movimentações.
================================================================================
CM$VER      2.06.13     09/04/1999
--------------------------------------------------------------------------------
- Relatório de Reconciliação de Estoque passou a ser filtrado por unidade de custeio
   e não por almoxarifado, e este passou a ser exibido em grupos e sub grupos.
- Implementação da integração de Notas pendentes, que não foram itegrada com
  a  contabilidade.
- Correção no cadastro de Produtos no referente a erro de gravação de unidade 
  de medidas e código fiscal que apresentava os dois primeiros dígitos e passou
  a apresentar os dois últimos. 
- Implementação do Relatório de Custos Contábeis. 
================================================================================
CM$VER      2.06.12     07/04/1999
--------------------------------------------------------------------------------
- Correção na Tela de Requisição Manual, referente a movimentação que estava
  alterando de forma errada o custo médio.
- Implementação do relatório de Custos Contábeis
================================================================================
CM$VER      2.06.11     31/03/1999
--------------------------------------------------------------------------------
- Correção do error na Procura no Cadastro de Produtos.
- Correção na exclusão da Contabilização do Cadastro de Produto.
================================================================================
CM$VER      2.06.10     25/03/1999
--------------------------------------------------------------------------------
- Acertada a opção de diferença de inventário que não calculava a diferença
quando o saldo do produto estava zerado.
================================================================================
CM$VER      2.06.09     24/03/1999
--------------------------------------------------------------------------------
- Forma realizadas alterações nos paramatros do sistema com relação ao login.
================================================================================
CM$VER      2.06.08     23/03/1999
--------------------------------------------------------------------------------
- Conserto na Exclusão de Nota, para produtos com controle de validade.
- Alteração no cadastro de Produto, Colocado um combo p/ codigo fical padrão.
================================================================================
CM$VER      2.06.07     18/03/1999
--------------------------------------------------------------------------------
- Verificação da Data de Vencimento, na Tela de Nota ComPelmentar.
- Alteração na tela de Requisição Cadastrada. Agora quando o destino é custo o
  Almoxarifado que estiver sido logado tembém poderá ser requisistado.
  
================================================================================
CM$VER      2.06.06     16/03/1999
--------------------------------------------------------------------------------
- Implementação do Tratamento de Movimentação Retroativa ( Modulo.LeUltDataMov ).
- Alteração na tela de Parametro do Relatório de Solicitação Pré-Pronta.
- Foram corrigidos os problemas de Movimentação 'X'.
================================================================================
CM$VER      2.06.05     15/03/1999
--------------------------------------------------------------------------------
- Alteração Cadastro de Requisições. Passou a pegar o Saldo do Almoxarifado de
  Origem.
================================================================================
CM$VER      2.06.04     12/03/1999
--------------------------------------------------------------------------------
 - Foi concertado o erro do Relatório de Requsição Lancadas
================================================================================
CM$VER      2.06.03     11/03/1999
--------------------------------------------------------------------------------
- Foi concertado o erro do Relatório Inventário Físico e Financeiro por Data.
- Alterações no Cadastro de Saldo Inicial, solicitado pela Rosane.
================================================================================
CM$VER      2.06.02     10/03/1999
--------------------------------------------------------------------------------
- Foi Alterado o nome da Tabela da Analise de Estoque.
================================================================================
CM$VER      2.06.01     10/03/1999
--------------------------------------------------------------------------------
- Foi concertado o erro de Recebimento de Mercadoria com O.C. .
================================================================================
CM$VER      2.06.00     09/03/1999
--------------------------------------------------------------------------------
- Foi criado na tabela PARALMOX, o campo FLGINFOVALORUN
  que indica se na entrada da nota, informa-se o valor
  unitário ou total. Em virtude disso o Form FRecMercComSemOC
  também sofreu alterações, para atender as mudanças.
================================================================================
CM$VER      2.05.05     08/03/1999
--------------------------------------------------------------------------------
- Foi trocado o Form de Requisição Cadastrada (refeito)
================================================================================
CM$ALT}




























































































































































































