program Assistencial;

uses
  Forms,
  FPai in '..\..\CM\Forms\FPai.pas' {frmPai},
  FCMPrincipal in '..\..\CM\Forms\FCMPrincipal.pas' {frmCMPrincipal},
  FTelaAut in '..\..\CM\Forms\FTelaAut.pas' {frmTelaAutorizacao},
  FSairAjuda in '..\..\CM\Forms\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\CM\Forms\FOkCancelar.pas' {frmOkCancelar},
  FCadastro in '..\..\CM\Forms\FCadastro.pas' {frmCadastro},
  FCMEntrada in '..\..\CM\Forms\FCMEntrada.pas' {frmCMEntrada},
  FCadastroCS in '..\..\CM\Forms\FCadastroCS.pas' {frmCadastroCS},
  FCadMestreDetCS in '..\..\CM\Forms\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  FCadastroGrid in '..\..\CM\Forms\FCadastroGrid.pas' {frmCadastroGrid},
  FCadMestreDet in '..\..\CM\Forms\FCadMestreDet.pas' {frmCadMestreDetalhe},
  //FTPSERVASS in 'FTPSERVASS.pas' {frmTipoServAss},
  fprodass in 'fprodass.pas' {frmprodass},
  FRelPlanos in 'FRelPlanos.pas' {frmPlanAssist},
  FCadMulti in '..\..\CM\Forms\FCadMulti.pas' {frmCadastroMulti},
  //FFornPag in 'FFornPag.pas' {frmFornPag},
  FConsAvancada in 'FConsAvancada.pas' {frmConsAvancada},
  FCancelaInsc in 'FCancelaInsc.pas' {frmCancelaInsc},
  FRelFornServ in 'FRelFornServ.pas' {frmRelFornServ},
  FRelFornservAnalit in 'FRelFornservAnalit.pas' {frmRelFornservAnalit},
  FRelProd in 'FRelProd.pas' {frmRelProd},
  FRelParticipante in 'FRelParticipante.pas' {frmRelParticipante},
  FRelPlanass in 'FRelPlanass.pas' {frmRelPlanass},
  FRelPlanassAnalit in 'FRelPlanassAnalit.pas' {frmRelPlanassAnalit},
  FParamRelParticipante in 'FParamRelParticipante.pas' {frmParamRelParticipante},
  FRelParticAnalit in 'FRelParticAnalit.pas' {frmRelParticAnalit},
  FParamPagFornserv in 'FParamPagFornserv.pas' {frmParamPagFornserv},
  FGerPagFornserv in 'FGerPagFornserv.pas' {frmGerPagFornserv},
  FParamGerRecFornserv in 'FParamGerRecFornserv.pas' {frmParamGerRecFornserv},
  FGerRecFornserv in 'FGerRecFornserv.pas' {frmGerRecFornserv},
  FParamGerRecContr in 'FParamGerRecContr.pas' {frmParamGerRecContr},
  FParamGerUtil in 'FParamGerUtil.pas' {frmParamGerUtil},
  FGerUtil in 'FGerUtil.pas' {frmGerUtil},
  FParamRelParticAnalist in 'FParamRelParticAnalist.pas' {frmParamRelParticAnalist},
  FParamRelFornserv in 'FParamRelFornserv.pas' {frmParamRelFornserv},
  FParamProdAnalit in 'FParamProdAnalit.pas' {frmParamProdAnalit},
  FRelProdAnalit in 'FRelProdAnalit.pas' {frmRelProdAnalit},
  FParamEtiqueta in 'FParamEtiqueta.pas' {frmParamEtiqueta},
  FPRelCarta in 'FPRelCarta.pas' {frmPRelCarta},
  RCarta in 'RCarta.pas' {relCarta},
  RHeadFoot in '..\..\CM\Relats\RHeadFoot.pas',
  RSimples in '..\..\CM\Relats\RSimples.pas',
  RMestreDet in '..\..\CM\Relats\RMestreDet.pas',
  RPai in '..\..\CM\Relats\RPai.pas' {relPai},
  FConsCancelInsc in 'FConsCancelInsc.pas' {frmConsCancelInsc},
  FConsContrPatro in 'FConsContrPatro.pas' {frmConsContrPatro},
  FImportRecContr in 'FImportRecContr.pas' {frmImportRecContr},
  frmConsEventass in 'frmConsEventass.pas' {fConsEventass},
  FCliente in 'FCliente.pas',
  FPrecoServPlan in 'FPrecoServPlan.pas' {frmPrecoServPlanass},
  Message in 'Message.pas',
  FEtiqueta in 'FEtiqueta.pas' {frmEtiquetas},
  FImportPart in 'FImportPart.pas' {frmImportPart},
  FEstimaContr in 'FEstimaContr.pas' {frmEstimaContr},
  FNumInsc in 'FNumInsc.pas' {frmnuminsc},
  FPlanAss in 'FPlanAss.pas' {frmPlanAss},
  FCadPartAssist in 'FCadPartAssist.pas' {frmCadPartAssist},
  FCadProvento in 'FCadProvento.pas' {frmCadProvento},
  FCadPartAss in 'FCadPartAss.pas' {frmCadPartAss},
  FFornComiss in 'FFornComiss.pas' {frmFornComiss},
  FRecebeContribAss in 'FRecebeContribAss.pas' {frmRecebeContribuicao},
  FEnviaFornPag in 'FEnviaFornPag.pas' {frmEnviaFornPag},
  FEnviaFornComiss in 'FEnviaFornComiss.pas' {frmEnviaFornComiss},
  FCobraContribAss in 'FCobraContribAss.pas' {frmCobraContribuicao},
  FRecebeFornPag in 'FRecebeFornPag.pas' {frmRecebFornPag},
  FRecebeFornComiss in 'FRecebeFornComiss.pas' {frmRecebeFornComiss},
  FCadSitPlano in 'FCadSitPlano.pas' {frmCadSitPlano},
  FCadTpPeriodicidade in 'FCadTpPeriodicidade.pas' {frmCadTpPeriodicidade},
  RRubAssNaoPagas in 'RRubAssNaoPagas.pas',
  RDivergContribAssParc in 'RDivergContribAssParc.pas',
  FPRelRubAssNaoPagas in 'FPRelRubAssNaoPagas.pas' {frmPRelRubNaoPagas},
  FPRelDivergContribAssParc in 'FPRelDivergContribAssParc.pas' {frmPRelDivergContribParc},
  FConsEstatDivergContribass in 'FConsEstatDivergContribass.pas' {frmConsEstatDivergContrib},
  FCadEventAss in 'FCadEventAss.pas' {frmCadEventAssist},
  FCadFornservass in 'FCadFornservass.pas' {frmCadFornservass},
  FAssocProvPatro in 'FAssocProvPatro.pas' {frmAssocProvPatro},
  FLerCodProvento in 'FLerCodProvento.pas' {frmLerCodProvento},
  FDepenBenef in 'FDepenBenef.pas' {frmDepenBenef},
  FCadServContribass in 'FCadServContribass.pas' {frmCadSevContribass},
  FCadDatasPlanass in 'FCadDatasPlanass.pas' {frmCadDatasPlanass},
  FCadContribuicaoCS in 'FCadContribuicaoCS.pas' {frmCadContribuicaoCS},
  FCMParamRel in '..\..\CM\RELATS\FCMParamRel.pas' {CMParamRel},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FCtrForn in 'FCtrForn.pas' {frmCtrForn},
  FCadRubricaManualAssist in 'FCadRubricaManualAssist.pas' {frmCadRubricaManualAssist},
  FDivergContribAss in 'FDivergContribAss.pas' {frmDivergContribAss},
  FVlrDtDiverg in 'FVlrDtDiverg.pas' {frmVlrDtDiverg},
  fAguarde in '..\..\CM\Forms\fAguarde.pas' {frmAguarde},
  fConsHistContrAss in 'fConsHistContrAss.pas' {frmConsultContr},
  FPadraoParticipante in 'FPadraoParticipante.pas' {frmPadraoParticipante},
  fContrCalc in 'fContrCalc.pas' {frmContrCalc},
  FConsContrib in 'FConsContrib.pas' {frmConsContrib},
  FIntegraCAPCAR in 'fintegracapcar.pas' {frmIntegraCAPCAR},
  DIntegraCAPCAR in 'dintegracapcar.pas' {dtmIntegraCAPCAR: TDataModule},
  FCadCalendPrev in 'fcadcalendprev.pas' {frmCadCalendPrev},
  FCalendDatas in 'fcalenddatas.pas' {frmCalendDatas},
  FCalendGeraAno in 'fcalendgeraano.pas' {frmCalendGeraAno},
  fCadDepTitPlanAss in 'fCadDepTitPlanAss.pas' {frmCadDepTitPlanAss},
  FCadDependenteAss in 'FCadDependenteAss.pas' {frmCadDependenteAss},
  fInscBenefAss in 'fInscBenefAss.pas' {frmInscBenefAss},
  FPedeDadosDependencia in 'FPedeDadosDependencia.pas' {frmPedeDadosDependencia},
  fCancBenefAss in 'fCancBenefAss.pas' {frmCancBenefAss},
  FParamRelaCalcContribAss in 'FParamRelaCalcContribAss.pas' {frmParamRelaCalcContribAss},
//  FParamRelaMensPagMes in 'FParamRelaMensPagMes.pas' {frmParamRelaMensPagMes},
//  dRelAssistencial in 'dRelAssistencial.pas' {dtmRelAssistencial: TDataModule},
  fPessoa in '..\..\CM\Forms\fPessoa.pas' {frmPessoa},
  //FCadElegivel in 'FCadElegivel.pas' {frmCadElegivel},
  DBaseDados in '..\..\CM\Forms\dBaseDados.pas' {dtmBaseDados: TDataModule},
  dReports in '..\..\CM\Forms\dReports.pas' {dtmReports: TDataModule},
  FAssocContribuicaoParticip in 'fassoccontribuicaoparticip.pas' {frmAssocContribuicaoParticip},
  FParamRelaQuantBenefSit in 'FParamRelaQuantBenefSit.pas' {frmParamRelaQuantBenefSit},
  FParamRelQuantPlanoSaude in 'FParamRelQuantPlanoSaude.pas' {frmQuantBenefPlanoSaude},
  FCadAlteradorContribCS in 'FCadAlteradorContribCS.pas' {frmCadAlteradorContribCS},
  fCadMotivoAss in 'fCadMotivoAss.pas' {frmCadMotivoAss},
  UAdmAss in 'UAdmAss.pas',
  uSincronismo in 'uSincronismo.pas',
  fapurainscritos in 'fapurainscritos.pas' {frmapurainscritos},
  //FParamEmisEtiq in 'FParamEmisEtiq.pas' {frmParamEmisEtiq},
  FRelHistFinanc in 'FRelHistFinanc.pas' {frmRelHistFinanc},
  fCadHstContribuicao in 'fCadHstContribuicao.pas' {frmCadHstContribuicao},
  FParamAssist in 'FParamAssist.pas' {frmParamAssist},
  FDivergeRecebimento in 'FDivergeRecebimento.pas' {frmdivergeRecebimento},
  FConsultar in '..\..\CM\Forms\FConsultar.pas' {frmConsultar},
  fConsLote in 'fConsLote.pas' {frmConsLote},
  UDividaAssist in 'UDividaAssist.pas',
  fCadParcelamento in 'fCadParcelamento.pas' {frmCadParcelamento},
  DAPrev in 'daprev.pas' {dtmAPrev: TDataModule},
  FCadFilial in 'FCadFilial.pas' {frmCadFilial},
  FCtrlInterface in 'fctrlinterface.pas' {frmCtrlinterface},
  fCriticaAdmissao in 'fCriticaAdmissao.pas' {frmCriticaAdmissao};

{$R *.RES}

begin
  frmcmEntrada:= TfrmcmEntrada.Create(Application);
  frmcmEntrada.Show;
  frmcmEntrada.Update;

  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdtmAPrev, dtmAPrev);
  Application.CreateForm(TdtmIntegraCAPCAR, dtmIntegraCAPCAR);
//  Application.CreateForm(TdtmRelAssistencial, dtmRelAssistencial);
  Application.CreateForm(TfrmInscBenefAss, frmInscBenefAss);
  Application.CreateForm(TfrmCancBenefAss, frmCancBenefAss);
  Application.CreateForm(TfrmPedeDadosDependencia, frmPedeDadosDependencia);
  Application.CreateForm(TfrmParamRelaMensPagMes, frmParamRelaMensPagMes);
  Application.CreateForm(TfrmParamRelaCalcContribAss, frmParamRelaCalcContribAss);
  Application.CreateForm(TfrmLerCodProvento, frmLerCodProvento);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmcmEntrada.Hide;
  frmcmEntrada.Free;

  //sTipoPrevidencia := 'F';

  Application.Run;

end.
























