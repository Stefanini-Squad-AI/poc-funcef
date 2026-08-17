object wmdlAutoAtendimento: TwmdlAutoAtendimento
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  OnDestroy = WebModuleDestroy
  Actions = <
    item
      Name = 'Conecta'
      PathInfo = '/Conecta'
      OnAction = wmdlAutoAtendimentoConectaAction
    end
    item
      Name = 'ConsultaTempoServico'
      PathInfo = '/ConsultaTempoServico'
      OnAction = wmdlAutoAtendimentoConsultaTempoServicoAction
    end
    item
      Name = 'ConsultaDadosParticipante'
      PathInfo = '/ConsultaDadosParticipante'
      OnAction = wmdlAutoAtendimentoConsultaDadosCadastraisAction
    end
    item
      Name = 'ConsultaPartPatro'
      PathInfo = '/ConsultaPartPatro'
      OnAction = wmdlAutoAtendimentoConsultaPartPatroAction
    end
    item
      Name = 'ConsultaPartPlanos'
      PathInfo = '/ConsultaPartPlanos'
      OnAction = wmdlAutoAtendimentoConsultaPartPlanosAction
    end
    item
      Name = 'ConsultaExtratoReserva'
      PathInfo = '/ConsultaExtratoReserva'
      OnAction = wmdlAutoAtendimentoConsultaExtratoReservaAction
    end
    item
      Name = 'Logout'
      PathInfo = '/Logout'
      OnAction = wmdlAutoAtendimentoLogoutAction
    end
    item
      Name = 'ConfirmaLogout'
      PathInfo = '/ConfirmaLogout'
      OnAction = wmdlAutoAtendimentoConfirmaLogoutAction
    end
    item
      Name = 'ConsultaSaldoReserva'
      PathInfo = '/ConsultaSaldoReserva'
      OnAction = wmdlAutoAtendimentoConsultaSaldoReservaAction
    end
    item
      Name = 'Home'
      PathInfo = '/Home'
      OnAction = wmdlAutoAtendimentoHomeAction
    end
    item
      Name = 'ConsultaEventosPrev'
      PathInfo = '/ConsultaEventosPrev'
      OnAction = wmdlAutoAtendimentoConsultaEventosPrevAction
    end
    item
      Name = 'ConsultaDadosEventosPrev'
      PathInfo = '/ConsultaDadosEventosPrev'
      OnAction = wmdlAutoAtendimentoConsultaDadosEventosPrevAction
    end
    item
      Name = 'ConsultaQuadroSalarial'
      PathInfo = '/ConsultaQuadroSalarial'
      OnAction = wmdlAutoAtendimentoConsultaQuadroSalarialAction
    end
    item
      Name = 'Sobre'
      PathInfo = '/Sobre'
      OnAction = wmdlAutoAtendimentoSobreAction
    end
    item
      Name = 'Imagem'
      PathInfo = '/Imagem'
      OnAction = wmdlAutoAtendimentoImagemAction
    end
    item
      Name = 'ConsultaContraCheque'
      PathInfo = '/ConsultaContraCheque'
      OnAction = wmdlAutoAtendimentoConsultaContraChequeAction
    end
    item
      Name = 'ConsultaHistBenef'
      PathInfo = '/ConsultaHistBenef'
      OnAction = wmdlAutoAtendimentoConsultaHistBenefAction
    end
    item
      Name = 'ConsultaConsignacao'
      PathInfo = '/ConsultaConsignacao'
      OnAction = wmdlAutoAtendimentoConsultaConsignacaoAction
    end
    item
      Name = 'ConsultaDadosConsigJudicial'
      PathInfo = '/ConsultaDadosConsigJudicial'
      OnAction = wmdlAutoAtendimentoConsultaDadosConsigJudicialAction
    end
    item
      Name = 'AbrePagina'
      PathInfo = '/AbrePagina'
      OnAction = wmdlAutoAtendimentoAbrePaginaAction
    end
    item
      Name = 'ManutEnderecos'
      PathInfo = '/ManutEnderecos'
      OnAction = wmdlAutoAtendimentoManutEnderecoAction
    end
    item
      Name = 'AlteracaoEndereco'
      PathInfo = '/AlteracaoEndereco'
      OnAction = wmdlAutoAtendimentoAlteracaoEnderecoAction
    end
    item
      Name = 'SalvarEndereco'
      PathInfo = '/SalvarEndereco'
      OnAction = wmdlAutoAtendimentoSalvaEnderecoAction
    end
    item
      Name = 'ExclusaoEndereco'
      PathInfo = '/ExclusaoEndereco'
      OnAction = wmdlAutoAtendimentoExclusaoEnderecoAction
    end
    item
      Name = 'ExcluirEndereco'
      PathInfo = '/ExcluirEndereco'
      OnAction = wmdlAutoAtendimentoExcluirEnderecoAction
    end
    item
      Name = 'AlteracaoSenha'
      PathInfo = '/AlteracaoSenha'
      OnAction = wmdlAutoAtendimentoAlteracaoSenhaAction
    end
    item
      Name = 'SalvarSenha'
      PathInfo = '/SalvarSenha'
      OnAction = wmdlAutoAtendimentoSalvarSenhaAction
    end
    item
      Name = 'ManutDependentes'
      PathInfo = '/ManutDependentes'
      OnAction = wmdlAutoAtendimentoManutDependentesAction
    end
    item
      Name = 'AlteracaoDependente'
      PathInfo = '/AlteracaoDependente'
      OnAction = wmdlAutoAtendimentoAlteracaoDependenteAction
    end
    item
      Name = 'SalvarDependente'
      PathInfo = '/SalvarDependente'
      OnAction = wmdlAutoAtendimentoSalvarDependenteAction
    end
    item
      Name = 'ExclusaoDependente'
      PathInfo = '/ExclusaoDependente'
      OnAction = wmdlAutoAtendimentoExclusaoDependenteAction
    end
    item
      Name = 'ExcluirDependente'
      PathInfo = '/ExcluirDependente'
      OnAction = wmdlAutoAtendimentoExcluirDependenteAction
    end
    item
      Name = 'EmpExtratoExpEmprestimos'
      PathInfo = '/EmpExtratoExpEmprestimos'
      OnAction = wmdlAutoAtendimentoEmpExtratoExpEmprestimosAction
    end
    item
      Name = 'EmpParamConsultaContrato'
      PathInfo = '/EmpParamConsultaContrato'
      OnAction = wmdlAutoAtendimentoEmpParamConsultaContratoAction
    end
    item
      Name = 'EmpConsultaContrato'
      PathInfo = '/EmpConsultaContrato'
      OnAction = wmdlAutoAtendimentoEmpConsultaContratoAction
    end
    item
      Name = 'EmpSelTpContrato'
      PathInfo = '/EmpSelTpContrato'
      OnAction = wmdlAutoAtendimentoEmpSelTpContratoAction
    end
    item
      Name = 'EmpDadosSimulacao'
      PathInfo = '/EmpDadosSimulacao'
      OnAction = wmdlAutoAtendimentoEmpDadosSimulacaoAction
    end
    item
      Name = 'TransfPlano'
      PathInfo = '/TransfPlano'
      OnAction = wmdlAutoAtendimentoTransfPlanoAction
    end
    item
      Name = 'CamposTransfPlano'
      PathInfo = '/CamposTransfPlano'
      OnAction = wmdlAutoAtendimentoCamposTransfPlanoAction
    end
    item
      Name = 'OpcoesTransfPlano'
      PathInfo = '/OpcoesTransfPlano'
      OnAction = wmdlAutoAtendimentoOpcoesTransfPlanoAction
    end
    item
      Name = 'OptarTransfPlano'
      PathInfo = '/OptarTransfPlano'
      OnAction = wmdlAutoAtendimentoOptarTransfPlanoAction
    end
    item
      Name = 'EmpSimulacao'
      PathInfo = '/EmpSimulacao'
      OnAction = wmdlAutoAtendimentoEmpSimulacaoAction
    end
    item
      Name = 'EstimaTransfPlano'
      PathInfo = '/EstimaTransfPlano'
      OnAction = wmdlAutoAtendimentoEstimaTransfPlanoAction
    end
    item
      Name = 'CamposEstimaTransfPlano'
      PathInfo = '/CamposEstimaTransfPlano'
      OnAction = wmdlAutoAtendimentoCamposEstimaTransfPlanoAction
    end
    item
      Name = 'BenefSimulacao'
      PathInfo = '/BenefSimulacao'
      OnAction = wmdlAutoAtendimentoBenefSimulacaoAction
    end
    item
      Name = 'EmpParamEmptmo'
      PathInfo = '/EmpParamEmptmo'
      OnAction = wmdlAutoAtendimentoEmpParamEmptmoAction
    end
    item
      Name = 'EmpSalvaEmptmo'
      PathInfo = '/EmpSalvaEmptmo'
      OnAction = wmdlAutoAtendimentoEmpSalvaEmptmo
    end
    item
      Name = 'EmpExtratoAgrEmprestimos'
      PathInfo = '/EmpExtratoAgrEmprestimos'
      OnAction = wmdlAutoAtendimentoEmpExtratoAgrEmprestimosAction
    end
    item
      Name = 'EmpConsultaInscricao'
      PathInfo = '/EmpConsultaInscricao'
      OnAction = wmdlAutoAtendimentoEmpConsultaInscricaoAction
    end
    item
      Name = 'EmpParamConsultaInscricao'
      PathInfo = '/EmpParamConsultaInscricao'
      OnAction = wmdlAutoAtendimentoEmpParamConsultaInscricaoAction
    end
    item
      Name = 'ImprimeRelatorio'
      PathInfo = '/ImprimeRelatorio'
      OnAction = wmdlAutoAtendimentoImprimeRelatorioAction
    end
    item
      Name = 'EmpExcluirInscricao'
      PathInfo = '/EmpExcluirInscricao'
      OnAction = wmdlAutoAtendimentoEmpExcluirInscricaoAction
    end
    item
      Name = 'InformeRendimentos'
      PathInfo = '/InformeRendimentos'
      OnAction = wmdlAutoAtendimentoInformeRendimentosAction
    end
    item
      Name = 'BenefSimulaCampos'
      PathInfo = '/BenefSimulaCampos'
      OnAction = wmdlAutoAtendimentoBenefSimulaCamposAction
    end
    item
      Name = 'BenefSimulaResultados'
      PathInfo = '/BenefSimulaResultados'
      OnAction = wmdlAutoAtendimentoBenefSimulaResultadosAction
    end
    item
      Name = 'ExtResPer'
      PathInfo = '/ExtResPer'
      OnAction = wmdlAutoAtendimentoExtResPerAction
    end
    item
      Name = 'ImpExtResPer'
      PathInfo = '/ImpExtResPer'
      OnAction = wmdlAutoAtendimentoImpExtResPerAction
    end
    item
      Name = 'ConsultaEventosPrevAtivos'
      PathInfo = '/ConsultaEventosPrevAtivos'
      OnAction = wmdlAutoAtendimentoConsultaEventosPrevAtivosAction
    end
    item
      Name = 'NovoUsuario'
      PathInfo = '/NovoUsuario'
      OnAction = wmdlAutoAtendimentoNovoUsuarioAction
    end
    item
      Name = 'CadSenha'
      PathInfo = '/CadSenha'
      OnAction = wmdlAutoAtendimentoCadSenhaAction
    end
    item
      Name = 'LembreteSenha'
      PathInfo = '/LembreteSenha'
      OnAction = wmdlAutoAtendimentoLembreteSenhaAction
    end
    item
      Name = 'ManutTelefones'
      PathInfo = '/ManutTelefones'
      OnAction = wmdlAutoAtendimentoManutTelefonesAction
    end
    item
      Name = 'AlteracaoTelefone'
      PathInfo = '/AlteracaoTelefone'
      OnAction = wmdlAutoAtendimentoAlteracaoTelefoneAction
    end
    item
      Name = 'SalvarTelefone'
      PathInfo = '/SalvarTelefone'
      OnAction = wmdlAutoAtendimentoSalvarTelefoneAction
    end
    item
      Name = 'ExcluirTelefone'
      PathInfo = '/ExcluirTelefone'
      OnAction = wmdlAutoAtendimentoExcluirTelefoneAction
    end
    item
      Name = 'ExclusaoTelefone'
      PathInfo = '/ExclusaoTelefone'
      OnAction = wmdlAutoAtendimentoExclusaoTelefoneAction
    end
    item
      Name = 'ConsultaSitAtualBenefPar'
      PathInfo = '/ConsultaSitAtualBenefPar'
      OnAction = wmdlAutoAtendimentoConsultaSitAtualBenefParAction
    end
    item
      Name = 'ConsultaSitAtualBenefTabela'
      PathInfo = '/ConsultaSitAtualBenefTabela'
      OnAction = wmdlAutoAtendimentoConsultaSitAtualBenefTabelaAction
    end
    item
      Name = 'ConsultaSitAtualBenefDetalhes'
      PathInfo = '/ConsultaSitAtualBenefDetalhes'
      OnAction = wmdlAutoAtendimentoConsultaSitAtualBenefDetalhesAction
    end
    item
      Name = 'CancelamentoDependente'
      PathInfo = '/CancelamentoDependente'
      OnAction = wmdlAutoAtendimentoCancelamentoDependenteAction
    end
    item
      Name = 'CancelarDependente'
      PathInfo = '/CancelarDependente'
      OnAction = wmdlAutoAtendimentoCancelarDependenteAction
    end
    item
      Name = 'RestaurarDependente'
      PathInfo = '/RestaurarDependente'
      OnAction = wmdlAutoAtendimentoRestaurarDependenteAction
    end
    item
      Name = 'EnvioSenha'
      PathInfo = '/EnvioSenha'
      OnAction = wmdlAutoAtendimentoEnvioSenhaAction
    end
    item
      Name = 'EsqueciMinhaSenha'
      PathInfo = '/EsqueciMinhaSenha'
      OnAction = wmdlAutoAtendimentoEsqueciMinhaSenhaAction
    end
    item
      Name = 'RelatorioDinamico'
      PathInfo = '/RelatorioDinamico'
      OnAction = wmdlAutoAtendimentoRelatorioDinamicoAction
    end
    item
      Name = 'ConsultaContribuicoes'
      PathInfo = '/ConsultaContribuicoes'
      OnAction = wmdlAutoAtendimentoConsultaContribuicoesAction
    end
    item
      Name = 'TempoServicoConsulta'
      PathInfo = '/TempoServicoConsulta'
      OnAction = wmdlAutoAtendimentoTempoServicoConsultaAction
    end
    item
      Name = 'AlteracaoTempoServico'
      PathInfo = '/AlteracaoTempoServico'
      OnAction = wmdlAutoAtendimentoAlteracaoTempoServicoAction
    end
    item
      Name = 'SalvarTempoServico'
      PathInfo = '/SalvarTempoServico'
      OnAction = wmdlAutoAtendimentoSalvarTempoServicoAction
    end
    item
      Name = 'ExclusaoTempoServico'
      PathInfo = '/ExclusaoTempoServico'
      OnAction = wmdlAutoAtendimentoExclusaoTempoServicoAction
    end
    item
      Name = 'ExcluirTempoServico'
      PathInfo = '/ExcluirTempoServico'
      OnAction = wmdlAutoAtendimentoExcluirTempoServicoAction
    end
    item
      Name = 'AlterarDadosCadastrais'
      PathInfo = '/AlterarDadosCadastrais'
      OnAction = wmdlAutoAtendimentoAlterarDadosCadastraisAction
    end
    item
      Name = 'SalvarDadosCadastrais'
      PathInfo = '/SalvarDadosCadastrais'
      OnAction = wmdlAutoAtendimentoSalvarDadosCadastraisAction
    end
    item
      Name = 'HistoricoEnderecos'
      PathInfo = '/HistoricoEnderecos'
      OnAction = wmdlAutoAtendimentoHistoricoEnderecosAction
    end>
  Left = 280
  Top = 112
  Height = 513
  Width = 576
  object pgpResposta: TPageProducer
    OnHTMLTag = pgpRespostaHTMLTag
    Left = 24
    Top = 16
  end
end
