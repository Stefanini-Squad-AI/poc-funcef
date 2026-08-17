program ParamPrev;
uses
  Forms,
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports},
  FCadastroPai in '..\..\Cm\Forms\Source\FCadastroPai.pas' {frmCadastroPai},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {FrmCadastroGridCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  Fpessoa in '..\..\Cm\Forms\Source\fPessoa.pas' {frmPessoa},
  FCadFundacao in 'FCadFundacao.pas' {frmCadFundacao},
  FCadContribuicaoCS in 'FCadContribuicaoCS.pas' {frmCadContribuicaoCS},
  FCadBenefEventoCS in 'FCadBenefEventoCS.pas' {frmCadBenefEventoCS},
  FCadGrupoBenef in 'FCadGrupoBenef.pas' {frmCadGrupoBenef},
  FCadPlanPrevCS in 'FCadPlanPrevCS.pas' {frmCadPlanPrevCS},
  FAssocContribEventoF in 'FAssocContribEventoF.pas' {frmAssocContribEventoF},
  FCadTipoPDV in 'FCadTipoPDV.pas' {frmCadTipoPDV},
  FCadReservaXPlano in 'FCadReservaXPlano.pas' {frmCadReservaXPlano},
  FSolicitaPlano in 'FSolicitaPlano.pas' {frmSolicitaPlano},
  FAssocContribReserva in 'FAssocContribReserva.pas' {frmAssocContribReserva},
  FAssocBenefReserva in 'FAssocbenefReserva.pas' {frmAssocBenefReserva},
  FCadMovReservaTree in 'FCadMovReservaTree.pas' {frmCadMovReservaTree},
  FCadPatro in 'FCadPatro.pas' {frmCadPatro},
  FCadFilial in 'FCadFilial.pas' {frmCadFilial},
  FAssocPlanPatro in 'FAssocPlanPatro.pas' {frmAssocPlanPatro},
  FCadOrgaosESetores in 'FCadOrgaosESetores.pas' {frmCadOrgaosESetores},
  FCadParamDotacao in 'FCadParamDotacao.pas' {frmCadParamDotacao},
  FMigraDotacaoInicial in 'FMigraDotacaoInicial.pas' {frmMigraDotacaoInicial},
  FCadPCS in 'FCadPCS.pas' {frmCadPCS},
  FCadParamSal13 in 'FCadParamSal13.pas' {FrmCadParamSal13},
  FCadGrupoFuncional in 'FCadGrupoFuncional.pas' {frmCadGrupoFuncional},
  FCadNivel in 'FCadNivel.pas' {frmCadNivel},
  FCadCarreira in 'FCadCarreira.pas' {frmCadCarreira},
  FCadTipoFunc in 'FCadTipoFunc.pas' {frmCadTipoFunc},
  FCadCargoExtPCS in 'FCadCargoExtPCS.pas' {frmCadCargoExtPCS},
  FCadIntegracaoPREV in 'FCadIntegracaoPREV.pas' {frmCadIntegracaoPREV},
  FCadAlteradorContribCS in 'FCadAlteradorContribCS.pas' {frmCadAlteradorContribCS},
  FCadAlteradorBenefCS in 'FCadAlteradorBenefCS.pas' {frmCadAlteradorBenefCS},
  FCadCalendPrev in 'FCadCalendPrev.pas' {frmCadCalendPrev},
  FCalendGeraAno in 'FCalendGeraAno.pas' {frmCalendGeraAno},
  FCalendDatas in 'FCalendDatas.pas' {frmCalendDatas},
  FCadTipoPagamento in 'FCadTipoPagamento.pas' {frmCadTipoPagamento},
  FCadTpPeriodicidade in 'FCadTpPeriodicidade.pas' {frmCadTpPeriodicidade},
  FCadEventoGerCS in 'FCadEventoGerCS.pas' {frmCadEventoGerCS},
  fcadmotivo in 'FCadMotivo.pas' {frmcadmotivo},
  FCadEeventoxSit in 'FCadEeventoxSit.pas' {FrmCadEeventoxSit},
  FCadSitDependente in 'FCadSitDependente.pas' {frmCadSitDependente},
  FCadSitFunc in 'fCadSitFunc.pas' {frmCadSitFunc},
  FCadSitPart in 'FCadSitPart.pas' {FrmCadSitPart},
  FCadSitPlano in 'FCadSitPlano.pas' {frmCadSitPlano},
  FCadTpInsalubridadeCS in 'FCadTpInsalubridadeCS.pas' {frmCadTpInsalubridadeCS},
  FCadTpBonusTrabCS in 'FCadTpBonusTrabCS.pas' {frmCadTpBonusTrabCS},
  FDevolveContribuicoes in 'FDevolveContribuicoes.pas' {frmDevolveContribuicoes},
  FParamRelPartManutTpCob in 'FParamRelPartManutTpCob.pas' {frmParamRelPartManutTpCob},
  FParamRelPdvGeral in 'FParamRelPdvGeral.pas' {frmParamRelPdvGeral},
  FCadContaRequerimento in 'FCadContaRequerimento.pas' {frmCadContaRequerimento},
  FSelecionaLote in 'FSelecionaLote.pas' {frmSelecionaLote},
  FCadIntegracaoPREVAux in 'FCadIntegracaoPREVAux.pas' {frmCadIntegracaoPREVAux},
  FSolicitaPatro in 'FSolicitaPatro.pas' {frmSolicitaPatro},
  DRelatorios in 'DRelatorios.pas' {DtmRelatorios},
  DRelatAdmPrev in 'DRelatAdmPrev.pas' {dtmRelatAdmPrev},
  DRelatAdmPREV2 in 'DRelatAdmPREV2.pas' {dtmRelatAdmPREV2},
  DIntegraCAPCAR in 'DIntegraCAPCAR.pas' {dtmIntegraCAPCAR},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  dRelTempoServicoMT in 'DRelTempoServicoMT.pas' {dtmRelTempoServicoMT},
  DRelatEspecificos in 'DRelatEspecificos.pas' {dtmRelatEspecificos},
  DRelTransfPlano in 'DRelTransfPlano.pas' {dtmRelTransfPlano},
  dRelRetroRegional in '..\Relatorios\dRelRetroRegional.pas' {dtmRelRetroRegional},
  DRelatGerencial in '..\Relatorios\dRelatGerencial.pas' {dtmRelatorioGerencial},
  FParamRelGerencial in '..\Relatorios\fParamRelGerencial.pas' {frmParamRelGerencial},
  fParamRelGerencial02 in '..\Relatorios\fParamRelGerencial02.pas' {frmParamRelGerencial02},
  fParamRelGerencial03 in '..\Relatorios\fParamRelGerencial03.pas' {frmParamRelGerencial03},
  fParamRelGerencial04 in '..\Relatorios\fParamRelGerencial04.pas' {frmParamRelGerencial04},
  fPRelConsolidaMovRes in '..\Relatorios\fPRelConsolidaMovRes.pas' {frmPRelConsolidaMovRes},
  fLerRegraContribEventoF in 'FLerRegraContribEventoF.pas' {FrmLerRegraContribEventoF},
  fLerRegraBenefReserva in 'fLerRegraBenefReserva.pas' {frmLerRegraBenefReserva},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FAssocRubricaIndivEvento in 'FAssocRubricaIndivEvento.pas' {frmAssocRubricaIndivEvento},
  FLerRegraRubricaIndivEvento in 'FLerRegraRubricaIndivEvento.pas' {frmLerRegraRubricaIndivEvento},
  fLerRegrasPlano in 'fLerRegrasPlano.pas' {frmLerRegrasPlano},
  FParamAPrevCS in 'FParamAPrevCS.pas' {frmParamAPrevCS},
  fCadReajBeneficio in 'fCadReajBeneficio.pas' {frmCadReajBeneficio},
  FCadParamTransfPlano in 'FCadParamTransfPlano.pas' {frmCadParamTransfPlano},
  FCadConfigTransfPlano in 'FCadConfigTransfPlano.pas' {frmCadConfigTransfPlano},
  FCadConfigBenefTransfPlano in 'FCadConfigBenefTransfPlano.pas' {frmCadConfigBenefTransfPlano},
  FCadReajINSS in 'FCadReajINSS.pas' {frmCadReajINSS},
  FCadReajSalPatroCS in 'FCadReajSalPatroCS.pas' {frmCadReajSalPatroCS},
  FCadFuncaoSemGrupo in 'FCadFuncaoSemGrupo.pas' {frmCadFuncaoSemGrupo},
  FCadItemCalcPCS in 'FCadItemCalcPCS.pas' {frmCadItemCalcPCS},
  FReajustaCargosPatro in 'FReajustaCargosPatro.pas' {frmReajustaCargosPatro},
  FCadParamContribBanco in 'FCadParamContribBanco.pas' {frmCadParamContribBanco},
  FCadParamReserva in 'fcadparamreserva.pas' {frmCadParamReserva},
  FCadVinculacaoFuncional in 'fcadvinculacaofuncional.pas' {frmCadVinculacaoFuncional},
  FCadGrauInstr in 'fCadGrauInstr.pas' {frmCadGrauInstr},
  FCadTipoRecebedor in 'FCadTipoRecebedor.pas' {frmCadTipoRecebedor},
  FCadParamPessoa in 'FCadParamPessoa.pas' {frmCadParamPessoa},
  FConsLogTotalPREV in 'FConsLogTotalPREV.pas' {frmConsLogTotalPREV},
  FConsCargoFuncao in 'FConsCargoFuncao.pas' {frmConsCargoFuncao},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  FCadContribPatrocinadoraMT in '..\FontesMT\FCadContribPatrocinadoraMT.pas' {FrmCadContribPatrocinadoraMT},
  FMostraAux in '..\..\Cm\CMAdmPrev\Fontes\FMostraAux.pas' {frmMostraAux},
  FHabilitacaoBenefINSS in 'FHabilitacaoBenefINSS.pas' {FrmHabilitacaoBenefINSS},
  FPedeOpcoesTextoBenef in 'FPedeOpcoesTextoBenef.pas' {frmPedeOpcoesTextoBenef},
  FCadFaixaPerdContrib in 'FCadFaixaPerdContrib.pas' {FrmCadFaixaPerdContrib},
  FCadTipoContrib in 'FCadTipoContrib.pas' {frmCadTipoContrib},
  FCadFaixasPercentuais in 'FCadFaixasPercentuais.pas' {FrmCadFaixasPercentuais},
  FPerfilInvestimento in 'FPerfilInvestimento.pas' {FrmPerfilInvestimento};

{$R *.RES}
{$R PARAMPREV_RES.RES}

begin
  frmCMEntrada := TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Parametrização Previdenciária';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDtmRelatorios, DtmRelatorios);
  Application.CreateForm(TdtmReports, dtmReports);
  Application.CreateForm(TdtmRelatAdmPrev, dtmRelatAdmPrev);
  Application.CreateForm(TdtmRelatAdmPREV2, dtmRelatAdmPREV2);
  Application.CreateForm(TdtmRelTempoServicoMT, dtmRelTempoServicoMT);
  Application.CreateForm(TdtmRelatEspecificos, dtmRelatEspecificos);
  Application.CreateForm(TdtmRelTransfPlano, dtmRelTransfPlano);
  Application.CreateForm(TdtmIntegraCAPCAR, dtmIntegraCAPCAR);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TFrmLerRegraContribEventoF, FrmLerRegraContribEventoF);
  Application.CreateForm(TfrmLerRegrasPlano, frmLerRegrasPlano);
  Application.CreateForm(TdtmRelRetroRegional, dtmRelRetroRegional);
  Application.CreateForm(TfrmMostraAux, frmMostraAux);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Parametrização Previdenciária
================================================================================
CM$VER      3.00.06b    28/05/2008
--------------------------------------------------------------------------------
- Resolução da Pendência nº 27602
  Tela/Opção no Sistema: Principal
  Descrição: Remoção dos itens de menu que nâo mais utilizados pelo módulo
- Resolução da Pendência nº 27590
  Tela/Opção no Sistema: Cadastro | Cadastro de Beneficio
  Descrição: Inclusão de um novo tipo de beneficio
- Resolução da Pendência nº 27503
  Tela/Opção no Sistema: Integração Financeira | Cadastro Geral
  Descrição: Acertando o SQL que estava com um erro de sintaxe.
- Resolução da Pendência nº 27438
  Tela/Opção no Sistema: Integração com Financeiro | Cadastro Geral
  Descrição: Ajuste na estrutura que copia as parametrizações contábeis e financeiras
             de um benefício para outro
- Resolução da Pendência nº 27926
  Tela/Opção no Sistema: Integração com Financeiro | Alteradores por Contribuição
  Descrição: Ajuste na gravação do alterador.
================================================================================
CM$VER      3.00.06a    08/05/2008
--------------------------------------------------------------------------------
- Resolução da Pendência nº 27278
  Tela/Opção no Sistema: Principal
  Descrição: Inclusão da incialização do ParamIntegra
================================================================================
CM$VER      3.00.06     03/12/2007
--------------------------------------------------------------------------------
Liberação do padrão 18.
- Resolução da Pendência nº 24737
  Tela/Opção no Sistema: Plano de Cargos e Salarios | Grupo de Função
  Descrição: Retirados os decodes dos campos Piso Mercado e Piso Mercado dos
             Licensiados na qryDet.
- Resolução da Pendência nº 26336
  Tela/Opção no Sistema: Cadastros | Planos Previdenciários | Beneficios | Relatórios Parametrizáveis
  Descrição: Ocorria um erro ao clicar no botão "Normas parametrizáveis"
             Foi incluido um novo formulário ao ssitema para corrigir esse erro
- Resolução da Pendência nº 26685
  Tela/Opção no Sistema: Reajuste de cargos e funções
  Descrição: Acerto na pesquisa dos cargos e funções a reajustar 
================================================================================
CM$VER      3.00.05a    23/10/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 26453
  Tela/Opção no Sistema: Tela Principal
  Descrição: Correção do erro que ocorria quando nenhum Plano era selecionado
================================================================================
CM$VER      3.00.05     03/08/2007
--------------------------------------------------------------------------------
Liberação do padrão 17.
================================================================================
CM$VER      3.00.03b    03/08/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 19700 (ReAbertura)
  Tela/Opção no Sistema: Cadastros | Patrocinadora | Contribuição da Patrocinadora
  Descrição: Re-estruturação da tela
================================================================================
CM$VER      3.00.03a    12/07/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 25806
  Tela/Opção no Sistema: Integração com Financeiro | Cadastro Geral | Parametrização de Integração Contábil / Financeira de Contribuições e Benefícios
  Descrição: Retirar o botão de atalho para o Cadastros de Pessoa
- Resolução da Pendência nº 25830
  Tela/Opção no Sistema: Cadastro | Reserva | Cadastro de Reservas por Plano
  Descrição: Ajuste na gravação da reserva por plano
================================================================================
CM$VER      3.00.03     02/07/2007
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.16.
- Resolução da Pendência nº 21960
  Tela/Opção no Sistema: Cadastros | Benefício
  Descrição: Criação de um novo item de destino de pagamento
- Resolução da Pendência nº 19937
  Tela/Opção no Sistema: Cadastro | Plano Previdenciário |
                         Opções para Eventos de Transferência de Plano | Configuração
  Descrição: Re-estruturação da tela
- Resolução da Pendência nº 19700
  Tela/Opção no Sistema: Cadastros | Patrocinadora | Contribuição da Patrocinadora
  Descrição: Re-estruturação da tela
- Resolução da Pendência nº 19701
  Tela/Opção no Sistema: Integração com Financeiro | Alteradores por Contribuição e
                         Integração com Financeiro | Alteradores por Benefício
  Descrição: Re-estruturação da tela
- Resolução da Pendência nº 25174
  Tela/Opção no Sistema: Plano de Cargos e Salários | Cargo e Função
  Descrição: Retirada da restrição 
================================================================================
CM$VER      3.00.01b    09/05/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 25264
  Tela/Opção no Sistema: Atalho para Cadastros de Pessoa
  Descrição: Retirar o botão de atalho para o Cadastros de Pessoa
================================================================================
CM$VER      3.00.01a    24/04/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 25156
  Tela/Opção no Sistema: Cadastro | Plano Previdenciário | Cadstro
  Descrição: Acerto no cadastro de rubricas de contribuição do plano previdenciário.
================================================================================
CM$VER      3.00.01     11/04/2007
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.15.
================================================================================
CM$VER      3.00.00a    11/04/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 20949
  Tela/Opção no Sistema: Cadastros | Reserva | Padrão de Movimentação
  Descrição: Validação das contas contábeis no ato da digitação
================================================================================
CM$VER      3.00.00     16/02/2007
--------------------------------------------------------------------------------
Liberação do padrão 14.
- Resolução da Pendência nº 23876
  Tela/Opção no Sistema: Cadastros | Cadastro de Reservas por Plano
  Descrição: Inclusão dos campos IDPLANOPREV, IDTIPORESERVA no UpdateSql
- Resolução da Pendência nº 24335
  Tela/Opção no Sistema: Cadastros | Plano Previdenciario | Cadastro (RUBRICAS DE BENEFICIOS)
  Descrição: Acerto no filtro do campo FLGDESCONTO ao procurar a rubrica correta
================================================================================
CM$ALT}






























