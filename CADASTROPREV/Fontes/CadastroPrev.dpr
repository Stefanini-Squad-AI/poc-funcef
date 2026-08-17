// ---------------------------------------------------------------------------------------------------------------------------------
//Nº SIG:........... 25312
//Data da Alteração: 22/06/2017
//Responsável......: Darivaldo Alencar / Andre Imakawa
//Descrição........: Criação da funcionalidade
//				         	 Utilizar a tabela Motivo.
// ---------------------------------------------------------------------------------------------------------------------------------


program CadastroPrev;

uses
  Forms,
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastroPai in '..\..\Cm\Forms\Source\FCadastroPai.pas' {frmCadastroPai},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {FrmCadastroGridCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  Fpessoa in '..\..\Cm\Forms\Source\fPessoa.pas' {frmPessoa},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FEmissaoRecadastramento in 'FEmissaoRecadastramento.pas' {frmEmiteRecadastramento},
  fRecebeRecadTXT in 'fRecebeRecadTXT.pas' {frmRecebeRecadTXT},
  FRecebeRecadastramento in 'FRecebeRecadastramento.pas' {frmRecebeRecadastramento},
  FSuspendeBeneficio in 'FSuspendeBeneficio.pas' {frmSuspendeBeneficio},
  FRegFalBenef in 'FRegFalBenef.pas' {FrmRegFalBenef},
  FMostraAux in 'FMostraAux.pas' {frmMostraAux},
  FCancelaDependente in 'FCancelaDependente.pas' {frmCancelaDependente},
  FCadResponsa in 'FCadResponsa.pas' {frmCadResponsa},
  FCadContaBanco in 'FCadContaBanco.pas' {frmCadContaBanco},
  fCadHistFuncPartCS in 'FCadHistFuncPartCS.pas' {frmCadHistFuncPartCS},
  FCadEvolFuncPrev in 'FCadEvolFuncPrev.pas' {frmCadEvolFuncPrev},
  FCadOpcoesBenef in 'FCadOpcoesBenef.pas' {frmCadOpcoesBenef},
  FPedeBenefExigencia in 'FPedeBenefExigencia.pas' {frmPedeBenefExigencia},
  FPedeDadosBenefAnterior in 'FPedeDadosBenefAnterior.pas' {frmPedeDadosBenefAnterior},
  FSelecionaBeneficiariosPensionista in 'FSelecionaBeneficiariosPensionista.pas' {frmSelecionaBeneficiariosPensionista},
  fCadContaRequerBenef in 'fCadContaRequerBenef.pas' {frmCadContaRequerBenef},
  FLerTempoServico in 'FLerTempoServico.pas' {frmLerTempoServico},
  FCadBeneficiarioPP in 'FCadBeneficiarioPP.pas' {FrmCadBeneficiarioPP},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  FEventoReinscricao in 'FEventoReinscricao.pas' {frmEventoReinscricao},
  fNovaDataReinscricao in 'fNovaDataReinscricao.pas' {frmNovaDataReinscricao},
  FEventoRetornoMantidoParaAtivo in 'FEventoRetornoMantidoParaAtivo.pas' {frmEventoRetornoMantidoParaAtivo},
  FConsReservapart in 'FConsReservapart.pas' {frmConsReservaPart},
  FEscolheReservaPart in 'FEscolheReservaPart.pas' {frmEscolheReservaPart},
  FEscolheCont in 'FEscolheCont.pas' {frmEscolheCont},
  FEventoAfastamento in 'FEventoAfastamento.pas' {frmEventoAfastamento},
  FEventoAfastSemRemun in 'FEventoAfastSemRemun.pas' {frmEventoAfastSemRemun},
  FAlteraEnderecoCobranca in 'FAlteraEnderecoCobranca.pas' {frmAlteraEnderecoCobranca},
  FEventoDemissaoPatrocinadora in 'FEventoDemissaoPatrocinadora.pas' {frmEventoDemissaoPatrocinadora},
  FCadRequerBenefParticip in 'FCadRequerBenefParticip.pas' {frmCadRequerBenefParticip},
  FLerSituacaoPlano in 'FLerSituacaoPlano.pas' {frmLerSituacaoPlano},
  FDesfazerEvento in 'FDesfazerEvento.pas' {frmDesfazerEvento},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports},
  DRelatAdmPREV2 in 'DRelatAdmPREV2.pas' {dtmRelatAdmPREV2},
  DRelatAdmPrev in 'DRelatAdmPrev.pas' {dtmRelatAdmPrev},
  DRelatEspecificos in 'DRelatEspecificos.pas' {dtmRelatEspecificos},
  DRelTransfPlano in 'DRelTransfPlano.pas' {dtmRelTransfPlano},
  FNumInsc in 'FNumInsc.pas' {frmNumInsc},
  DRelatorios in 'DRelatorios.pas' {DtmRelatorios},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  dRelRetroRegional in '..\Relatorios\dRelRetroRegional.pas' {dtmRelRetroRegional},
  DRelatGerencial in '..\Relatorios\dRelatGerencial.pas' {dtmRelatorioGerencial},
  FParamRelGerencial in '..\Relatorios\fParamRelGerencial.pas' {frmParamRelGerencial},
  fParamRelGerencial02 in '..\Relatorios\fParamRelGerencial02.pas' {frmParamRelGerencial02},
  fParamRelGerencial03 in '..\Relatorios\fParamRelGerencial03.pas' {frmParamRelGerencial03},
  fParamRelGerencial04 in '..\Relatorios\fParamRelGerencial04.pas' {frmParamRelGerencial04},
  fPRelConsolidaMovRes in '..\Relatorios\fPRelConsolidaMovRes.pas' {frmPRelConsolidaMovRes},
  FEventoTransfPlano in 'FEventoTransfPlano.pas' {FrmEventoTransfPlano},
  FCadContribPartTransfPlano in 'FCadContribPartTransfPlano.pas' {frmCadContribPartTransfPlano},
  FCadBfciarioTitPlanTransf in 'FCadBfciarioTitPlanTransf.pas' {FrmCadBfciarioTitPlanTransf},
  fTransfPatroBatch in 'fTransfPatroBatch.pas' {frmTransfPatroBatch},
  FCadContribParticipante in 'FCadContribParticipante.pas' {frmCadContribParticipante},
  FCadAlteraPdv in 'FCadAlteraPdv.pas' {frmCadAlteraPdv},
  FCalculaTempoServicoLote in 'FCalculaTempoServicoLote.pas' {frmCalculaTempoServicoLote},
  FAssocReservaPart in 'FAssocReservaPart.pas' {FrmAssocReservaPart},
  UModulo in 'UModulo.pas',
  dRelExtratoDeslig in '..\Relatorios\dRelExtratoDeslig.pas' {dtmRelExtratoDeslig},
  FConfSimulaDeslig in '..\Relatorios\FConfSimulaDeslig.pas' {FrmConfSimulaDeslig},
  FParamRelExtratoDeslig in '..\Relatorios\FParamRelExtratoDeslig.pas' {FrmParamRelExtratoDeslig},
  FEventoManutParcial in 'FEventoManutParcial.pas' {frmEventoManutParcial},
  FConsRubricas in '..\Relatorios\FConsRubricas.pas' {frmConsRubricas},
  FSolicitaPatro in '..\..\Cm\CMAdmPrev\Fontes\FSolicitaPatro.pas' {frmSolicitaPatro},
  FConsLogTotalPREV in '..\Relatorios\FConsLogTotalPREV.pas' {frmConsLogTotalPREV},
  FConsEventosPrev in '..\Relatorios\FConsEventosPrev.pas' {frmConsEventosPrev},
  FTipoBenefConcede in '..\..\Cm\CMAdmPrev\Fontes\FTipoBenefConcede.pas' {frmTipoBenefConcede},
  FSimulacaoEnquadramento in 'FSimulacaoEnquadramento.pas' {FrmSimulacaoEnquadramento},
  uCtrlPCS in '..\CtrlObjects\uCtrlPCS.pas',
  uCtrlEvolFuncPrev in '..\CtrlObjects\uCtrlEvolFuncPrev.pas',
  uDbEvolfuncprev in '..\DBObjects\uDbEvolfuncprev.pas',
  uDbHistrubsal in '..\DBObjects\uDbHistrubsal.pas',
  FCadOpcoesElegivel in '..\..\Cm\CMAdmPrev\Fontes\FCadOpcoesElegivel.pas' {FrmCadOpcoesElegivel},
  FProgresso in '..\..\Cm\Forms\Source\FProgresso.pas' {frmProgresso},
  FPRelHisFuncionalMT in '..\Relatorios\FPRelHisFuncionalMT.pas' {frmPRelHisFuncionalMT},
  dRelTempoServicoMT in '..\Relatorios\dRelTempoServicoMT.pas' {dtmRelTempoServicoMT},
  fInscBuscaParticipLote in 'fInscBuscaParticipLote.pas' {frmInscBuscaParticipLote},
  FInscricaoParticipanteLote in 'FInscricaoParticipanteLote.pas' {frmInscricaoParticipanteLote},
  FMovimentacaoTempoServico in '..\Relatorios\FMovimentacaoTempoServico.pas' {frmMovimentacaoTempoServico},
  dMovimentacaoDependentes in '..\Relatorios\dMovimentacaoDependentes.pas' {dtmMovimentacaoDependentes},
  dMovimentacaoTempoServico in '..\Relatorios\dMovimentacaoTempoServico.pas' {dtmMovimentacaoTempoServico},
  FMovimentacaoDependentes in '..\Relatorios\FMovimentacaoDependentes.pas' {frmMovimentacaoDependentes},
  //Andre Imakawa - SIG 73590 - Inicio
  //fConciliaInstResgPort in '..\Relatorios\fConciliaInstResgPort.pas' {frmConciliaInstResgPort},
  //dConciliaInstResgPort in '..\Relatorios\dConciliaInstResgPort.pas' {dtmConciliaInstResgPort},
  fConciliaInstResgPort in '..\..\Cm\CMAdmPrev\Relatorios\fConciliaInstResgPort.pas' {frmConciliaInstResgPort},
  dConciliaInstResgPort in '..\..\Cm\CMAdmPrev\Relatorios\dConciliaInstResgPort.pas' {dtmConciliaInstResgPort},
  //Andre Imakawa - SIG 73590 - Fim                                                              
  dQtdSituacaoPartcip in '..\Relatorios\dQtdSituacaoPartcip.pas' {dtmQtdSituacaoPartcip},
  fQtdSituacaoPartcip in '..\Relatorios\fQtdSituacaoPartcip.pas' {frmQtdSituacaoPartcip},
  uPextratoDesligamento in '..\..\GLOBALCM\FONTES\uPextratoDesligamento.pas' {frmPExtratoDesligamento},
  dRelExtratoDesligamento in '..\..\GLOBALCM\FONTES\dRelExtratoDesligamento.pas' {dtmRelExtratoDesligamento},
  UctrlExtratoDesligamento in '..\..\GLOBALCM\FONTES\UctrlExtratoDesligamento.pas',
  FConsCargoFuncao in '..\..\Cm\CMAdmPrev\Relatorios\FConsCargoFuncao.pas' {frmConsCargoFuncao},
  FEventoMorte in 'FEventoMorte.pas' {frmEventoMorte},
  FEventoReclusao in 'FEventoReclusao.pas' {frmEventoReclusao},
  FEventoAssistidoINSS in 'FEventoAssistidoINSS.pas' {frmEventoAssistidoINSS},
  FSolContaSal in 'FSolContaSal.pas' {frmSolContaSal},
  FEmailContasSol in 'FEmailContasSol.pas' {frmEmailContasSol},
  FCadContaEmLote in 'FCadContaEmLote.pas' {frmCadContaEmLote},
  FMapaPrevi in 'FMapaPrevi.pas' {frmMapaPrevic},
  FBloqueioIR in 'FBloqueioIR.pas' {frmBloqueioIR},
  dExtratoInstitutos in '..\..\GLOBALCM\FONTES\dExtratoInstitutos.pas' {dtmRelExtratoInstitutos},
  FCadNumeroProtoco in 'FCadNumeroProtoco.pas' {frmCadNumeroProtoco},
  uTipoExtratoInstitutos in '..\..\GLOBALCM\FONTES\uTipoExtratoInstitutos.pas' {frmTipoExtratoInstitutos},
  fRegistraCancel in 'fRegistraCancel.pas' {frmRegistraCancel},
  FAlteraEvento in 'FAlteraEvento.pas' {frmAlteraEvento};

{$R *.RES}
{$R CADASTROPREV_RES.RES}

begin
  frmCMEntrada := TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Cadastro Previdenciário';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TdtmReports, dtmReports);
  Application.CreateForm(TdtmRelatAdmPREV2, dtmRelatAdmPREV2);
  Application.CreateForm(TdtmRelatAdmPrev, dtmRelatAdmPrev);
  Application.CreateForm(TdtmRelatEspecificos, dtmRelatEspecificos);
  Application.CreateForm(TdtmRelTempoServicoMT, dtmRelTempoServicoMT);
  Application.CreateForm(TdtmRelTransfPlano, dtmRelTransfPlano);
  Application.CreateForm(TDtmRelatorios, DtmRelatorios);
  Application.CreateForm(TdtmRelRetroRegional, dtmRelRetroRegional);
  Application.CreateForm(TdtmRelatorioGerencial, dtmRelatorioGerencial);
  Application.CreateForm(TdtmRelExtratoDeslig, dtmRelExtratoDeslig);
  Application.CreateForm(TfrmMostraAux, frmMostraAux);
  Application.CreateForm(TfrmTipoBenefConcede, frmTipoBenefConcede);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TfrmProgresso, frmProgresso);
  Application.CreateForm(TfrmMovimentacaoTempoServico, frmMovimentacaoTempoServico);
  Application.CreateForm(TdtmMovimentacaoDependentes, dtmMovimentacaoDependentes);
  Application.CreateForm(TdtmMovimentacaoTempoServico, dtmMovimentacaoTempoServico);
  Application.CreateForm(TfrmMovimentacaoDependentes, frmMovimentacaoDependentes);
  Application.CreateForm(TdtmConciliaInstResgPort, dtmConciliaInstResgPort);
  Application.CreateForm(TfrmConciliaInstResgPort, frmConciliaInstResgPort);
  Application.CreateForm(TdtmQtdSituacaoPartcip, dtmQtdSituacaoPartcip);
  Application.CreateForm(TfrmQtdSituacaoPartcip, frmQtdSituacaoPartcip);
  Application.CreateForm(TfrmPExtratoDesligamento, frmPExtratoDesligamento);
  Application.CreateForm(TdtmRelExtratoDesligamento, dtmRelExtratoDesligamento);
  Application.CreateForm(TfrmEventoReclusao, frmEventoReclusao);
  Application.CreateForm(TdtmRelExtratoInstitutos, dtmRelExtratoInstitutos);
  Application.CreateForm(TfrmTipoExtratoInstitutos, frmTipoExtratoInstitutos);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Cadastro Previdenciário
================================================================================
CM$VER      3.00.07     08/05/2008
--------------------------------------------------------------------------------
Versão para liberação no padrão 5.10.18
- Resolução da Pendência nº 26825
  Tela/Opção no Sistema: Relatórios | Relatório de Tempo de Serviço.
  Descrição: Acerto na abertura da tela de parametrização do relatório.
- Resolução da Pendência nº 25020
  Tela/Opção no Sistema: -
  Descrição: Inclusão da tela de entrada manual de rubricas (menu Manutenção)
- Resolução da Pendência nº 20881
  Tela/Opção no Sistema: -
  Descrição: Criado controle de acesso ao campo FlgFitEspecial nas telas onde o mesmo pode ser alterado.
- Resolução da Pendência nº 26164
  Tela/Opção no Sistema: Evento de Transferência de Patrocinadora
  Descrição: - Acerto na atualização do campo ULTMESPREPARO da tabela de benefícios (BENEFBFCIARIO).
             - Acerto na atualização dos dependentes, quando processamento feito por situação (e não individual).
             - Ajuste efetuar a transferência dos associados falecidos que estão com o campo data morte preenchido. Isto influenciava a transferência dos pensionistas. 
================================================================================
CM$VER      3.00.05     23/07/2007
--------------------------------------------------------------------------------
Versão para liberação no padrão 5.10.17
- Resolução da Pendência nº 25783
  Tela/Opção no Sistema: Manutenção | Emissão de Cartas para Recadastramento
  Descrição: Correção de erro (access violation) ao disparar processo
================================================================================
CM$VER      3.00.03a    02/07/2007
--------------------------------------------------------------------------------
- Resolução das Pendências nº 22281 e 21134
  Tela/Opção no Sistema: Cadastro | Dependente e Beneficiário | Cadastro
  Descrição: Controle de acesso aos dados da Pasta de Documentação do dependente
================================================================================
CM$VER      3.00.03     18/05/2007
--------------------------------------------------------------------------------
Versão inicial, para liberação no padrão 5.10.16
- Resolução da Pendência nº 24983
  Tela/Opção no Sistema: Consultas / Extrato de desligamento / Configuração
  Descrição: Tratar controle da tela quando não existe detalhe na configuração e se cancela inclusão.
================================================================================
CM$VER      3.00.01b    09/05/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 25264
  Tela/Opção no Sistema: Atalho para Cadastros de Pessoa
  Descrição: Retirar o botão de atalho para o Cadastros de Pessoa
================================================================================
CM$VER      3.00.01a    18/04/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 25104
  Tela/Opção no Sistema: Consultas | Extrato de Desligamento | Impressão
  Descrição: Acerto na consideração do tipo de dado do registro processados.
================================================================================
CM$VER      3.00.01     11/04/2007
--------------------------------------------------------------------------------
Versão inicial, para liberação no padrão 5.10.15
- Resolução da Pendência nº 21191
  Tela/Opção no Sistema: Cadastro de Conta Bancária
  Descrição: Alteração na consulta da procura para buscar a matrícula do dependente
- Resolução da Pendência nº 22091
  Tela/Opção no Sistema: Eventos de Resgate
  Descrição: Correção para não permitir alterar valores de documentos que já tenham sido enviados para Banco (contas a receber).
================================================================================
CM$VER      3.00.00a    11/04/2007
--------------------------------------------------------------------------------
Versão inicial, para liberação no padrão 5.10.14
- Resolução da Pendência nº 24435
  Tela/Opção no Sistema: Evento de cancelamento de participante.
  Descrição: Correção para que quando cancelar as contribuições abertas após
             a data de cancelamento, não cancelar as contribuições que já
             tenham sido enviadas para o banco e aguardam seu recebimento.
- Resolução da Pendência nº 24043
  Tela/Opçao No Sistema: Eventos \ Falecimento
  Descrição: Criada nova situação para o evento de falecimento "REG/REPLAN SALDADO"
- Resolução da Pendência nº 23893
  Tela/Opçao No Sistema: Cadastro \ Plano Previdenciário \ Cadastro
  Descrição: Correção para considerar o parâmetro "Gerar Contribuição Zerada" 
- Resolução da Pendência nº 22780
  Tela/Opçao No Sistema: Consulta \ Etiquetas \ Imprime
  Descrição: Permitir a emissão de etiquetas somente para elegíveis
- Resolução da Pendência nº 24334
  Tela/Opçao No Sistema: Requerimento de Benefícios
  Descrição: Ajuste para sempre considerar formato de datas 'dd/mm/aaaa'
- Resolução da Pendência nº 24214
  Tela/Opçao No Sistema: Cadastros | Dependente e Beneficiário | Cadastro
  Descrição: Alteração no filtro de beneficios para considerar todos os planos do participante/dependente, não apenas o ativo;
             Exibição do plano ao qual está ligado o benefício na grid;
- Resolução da Pendência nº 24291
  Tela/Opção no Sistema: Associação de reservas
  Descrição: Retirada do filtro de plano desativado
- Resolução da Pendência nº 18975
  Tela/Opção no Sistema: Evento de transferência de plano.
  Descrição: Implementação para otimizar a visualização de reservas coletivas.
- Resolução da Pendência nº 23858
  Tela/Opção no Sistema: Evento de transferência de plano.
  Descrição: Retirada do campo IDREGRAVLRDEFAULT da tabela INPUTTRANSFPLANO, pois o campo não existe.
- Resolução da Pendência nº 21893
  Tela/Opção no Sistema: Evento de Inscrição de Participante
  Descrição: Correção para considerar o parâmetro FLGNGRAVACONTZERO.
- Resolução da Pendência nº 21825
  Tela/Opção no Sistema: Cadastro | Dependente e Beneficiário | Cadastro
  Descrição: Permitir cadastrar o campo "Desconta IR sobre INSS e Suplementação juntos" para Dependente e Beneficiário
- Resolução da Pendência nº 24124
  Tela/Opção no Sistema: Cadastro | Conta bancária
  Descrição: Alterar a cor do fonte dos campos nome, CPF e data nascimento para que fiquem mais visíveis.
- Resolução da Pendência nº 23974
  Tela/Opção no Sistema: Consulta | Extrato de Desligamento | Impressão
  Descrição: Alteração da rotina para inclusão de campos de regras.
- Resolução da Pendência nº 23973
  Tela/Opção no Sistema: Consulta | Extrato de Desligamento | Impressão
  Descrição: Alteração da rotina para inclusão de campos referentes a benefício proporcional diferido
- Resolução da Pendência nº 23972
  Tela/Opção no Sistema: Consulta | Extrato de Desligamento | Impressão
  Descrição: Alteração da rotina para inclusão de campos referentes a contribuições.
================================================================================
CM$ALT}












