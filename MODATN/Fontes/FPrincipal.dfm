inherited frmPrincipal: TfrmPrincipal
  Left = 125
  Top = 155
  Caption = 'RH - Módulo de Atendimento'
  ClientHeight = 302
  ClientWidth = 543
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 543
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 167
    Top = 92
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 282
    Width = 543
    Panels = <
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'PnlEmpresa_Padrao'
        Tag = 0
        Text = 'Empresa'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '200'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'PnlUsuario_Padrao'
        Tag = 0
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '200'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'PnlDateTime'
        Style = psDateTime
        Tag = 0
        Text = '10/09/2003 16:38'
        TextOptions.Alignment = taRightJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  object UsuarioRH: TPanel [3]
    Left = 375
    Top = 42
    Width = 94
    Height = 22
    Caption = 'UsuarioRH'
    TabOrder = 3
    Visible = False
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited mnu: TMainMenu
    Left = 33
    Top = 232
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          Visible = False
        end
        inherited MnuSep2_padrao: TMenuItem
          Visible = False
        end
      end
      inherited mnuUtilitario: TMenuItem
        object N7: TMenuItem
          Caption = '-'
        end
      end
    end
    inherited mnuCadastro: TMenuItem [1]
      object mnuPessoal1: TMenuItem
        Caption = '&Pessoal'
        OnClick = mnuPessoal1Click
      end
      object mnuCandidatos: TMenuItem
        Caption = 'Candidatos'
        OnClick = mnuCandidatosClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuLinhasdeTransporteporPessoa: TMenuItem
        Caption = 'Linhas de Transporte por Pessoa'
        OnClick = mnuLinhasdeTransporteporPessoaClick
      end
      object mnuDiasExtrasporPessoa: TMenuItem
        Caption = '&Dias Extras por Pessoa'
        OnClick = mnuDiasExtrasporPessoaClick
      end
    end
    object mnuTransacoes: TMenuItem [2]
      Caption = '&Transações'
      object mnuTransacoesGeral: TMenuItem
        Caption = '&Geral'
        object mnuCartasComunicados1: TMenuItem
          Caption = '&Cartas ou Comunicados'
          OnClick = mnuCartasComunicados1Click
        end
      end
      object mnuTransacoesAvaliacoes: TMenuItem
        Caption = '&Avaliações'
        object mnuRegistrodeAvaliacoesdeDesempenho: TMenuItem
          Caption = 'Registro de Avaliações de Desempenho'
          OnClick = mnuRegistrodeAvaliacoesdeDesempenhoClick
        end
        object mnuRegistrodeOutrasAvaliacoes: TMenuItem
          Caption = 'Registro de Outras Avaliações, Testes, Entrevistas'
          OnClick = mnuRegistrodeOutrasAvaliacoesClick
        end
      end
      object mnuTransacoesTreinamento: TMenuItem
        Caption = '&Treinamento'
        object mnuRegistroIndividualdeTreinamento: TMenuItem
          Caption = 'Registro Individual de Treinamento'
          OnClick = mnuRegistroIndividualdeTreinamentoClick
        end
        object mnuRegistroColetivodeTreinamento: TMenuItem
          Caption = 'Registro Coletivo de Treinamento'
          OnClick = mnuRegistroColetivodeTreinamentoClick
        end
      end
      object mnuRecrutamento: TMenuItem
        Caption = 'Recrutamento'
        object mnuRequisicaodePessoal: TMenuItem
          Caption = '&Requisição de Pessoal'
          OnClick = mnuRequisicaodePessoalClick
        end
        object mnuEliminacaodeRequisicoes: TMenuItem
          Caption = 'E&liminação de Requisições'
          OnClick = mnuEliminacaodeRequisicoesClick
        end
        object N9: TMenuItem
          Caption = '-'
        end
        object mnuRegistrodeTestesEntrevistas: TMenuItem
          Caption = 'Registro de &Testes e Entrevistas'
          OnClick = mnuRegistrodeTestesEntrevistasClick
        end
        object mnuRegistrodeExperiencias: TMenuItem
          Caption = 'Registro e Histórico de &Experiências'
          OnClick = mnuRegistrodeExperienciasClick
        end
        object mnuRegistrodeCursosdeCandidatos: TMenuItem
          Caption = 'Registro de C&ursos de Candidatos'
          OnClick = mnuRegistrodeCursosdeCandidatosClick
        end
      end
      object mnuSalariosBeneficios: TMenuItem
        Caption = '&Salários e Benefícios'
        object mnuRegistrodeAlteracaoFuncional: TMenuItem
          Caption = '&Registro de Alteração Funcional'
          OnClick = mnuRegistrodeAlteracaoFuncionalClick
        end
        object mnuSolicitdeAlteracaoFuncional: TMenuItem
          Caption = 'Solicitação de Alteração &Funcional'
          OnClick = mnuSolicitdeAlteracaoFuncionalClick
        end
        object mnuAnalisedasSolicitacoesdeAlteracao: TMenuItem
          Caption = '&Análise das Solicitações de Alteração'
          OnClick = mnuAnalisedasSolicitacoesdeAlteracaoClick
        end
        object mnuSimulacaodeAumentos: TMenuItem
          Caption = '&Simulação/Implementação de Aumentos'
          OnClick = mnuSimulacaodeAumentosClick
        end
        object mnuRegistrodeBeneficios: TMenuItem
          Caption = '&Registro de Benefícios'
          OnClick = mnuRegistrodeBeneficiosClick
        end
      end
      object Medicina1: TMenuItem
        Caption = '&Medicina do Trabalho'
        object mnuRegistrodeOcorrencia: TMenuItem
          Caption = '&Registro de Ocorrência Médica'
          OnClick = mnuRegistrodeOcorrenciaClick
        end
      end
      object mnuTransacoesPagamentoeAfins: TMenuItem
        Caption = 'Pagamento e Afins'
        object mnuLancaRubricasSalariais: TMenuItem
          Caption = '&Lançamento de Rubricas Salariais'
          object mnuLancaRubPorPessoa: TMenuItem
            Caption = 'Por &Pessoa'
            OnClick = mnuLancaRubPorPessoaClick
          end
          object mnuLancaRubPorRubrica: TMenuItem
            Caption = 'Por &Rubrica'
            OnClick = mnuLancaRubPorRubricaClick
          end
        end
        object mnuHorasExtraseAtrasos: TMenuItem
          Caption = '&Horas Extras e Atrasos'
          OnClick = mnuHorasExtraseAtrasosClick
        end
        object mnuFerias: TMenuItem
          Caption = '&Férias'
          OnClick = mnuFeriasClick
        end
        object mnuProgramacaoAntec13: TMenuItem
          Caption = '&Programação da Antecipação do 13º'
          OnClick = mnuProgramacaoAntec13Click
        end
      end
    end
    inherited mnuConsulta: TMenuItem [3]
      object N8: TMenuItem
        Caption = '-'
      end
      object mnuConsGeralRH: TMenuItem
        Caption = 'Geral RH'
        object mnuBrowsedoCadastro1: TMenuItem
          Caption = '&Browse do Cadastro de Pessoas'
          OnClick = mnuBrowsedoCadastro1Click
        end
      end
      object mnuConsAvaliacoes: TMenuItem
        Caption = 'Avaliações'
        object mnuHistricodeAvaliacoes: TMenuItem
          Caption = 'Histórico de Avaliações, Testes, Entrevistas'
          OnClick = mnuHistricodeAvaliacoesClick
        end
        object mnuEvoluocaoPotencialdoDesempenho: TMenuItem
          Caption = 'Evolução e Potencial do Desempenho'
          OnClick = mnuEvoluocaoPotencialdoDesempenhoClick
        end
      end
      object mnuConsTreinamento: TMenuItem
        Caption = 'Treinamento'
        object mnuHistoricodeTreinamento: TMenuItem
          Caption = 'Histórico de Treinamento'
          OnClick = mnuHistoricodeTreinamentoClick
        end
      end
      object mnuConsRecrutamento: TMenuItem
        Caption = 'Recrutamento'
        object mnuSelecaodeCandidatos: TMenuItem
          Caption = '&Seleção de Candidatos'
        end
      end
      object mnuConsSalariosBeneficios: TMenuItem
        Caption = '&Salários e Benefícios'
        object mnuHistoricodaEvolucaoFuncional: TMenuItem
          Caption = '&Histórico da Evolução Funcional'
          OnClick = mnuHistoricodaEvolucaoFuncionalClick
        end
        object mnuOrcamentodoCustodePessoal: TMenuItem
          Caption = '&Orçamento do Custo de Pessoal'
          OnClick = mnuOrcamentodoCustodePessoalClick
        end
        object mnuHistoricodeBeneficios: TMenuItem
          Caption = '&Histórico de Benefícios'
          OnClick = mnuHistoricodeBeneficiosClick
        end
      end
      object mnuConsMedicinadoTrabalho: TMenuItem
        Caption = '&Medicina do Trabalho'
        object mnuHistoricodeOcorrencias: TMenuItem
          Caption = '&Histórico de Ocorrências Médicas'
          OnClick = mnuHistoricodeOcorrenciasClick
        end
      end
      object mnuConsPagamentoeAfins: TMenuItem
        Caption = 'Pagamento e Afins'
        object mnuHistoricoRubricas: TMenuItem
          Caption = '&Histórico de Rubricas'
          OnClick = mnuHistoricoRubricasClick
        end
        object mnuHistoricodaSituacaoFuncional: TMenuItem
          Caption = 'Histórico da &Situação Funcional'
          OnClick = mnuHistoricodaSituacaoFuncionalClick
        end
      end
    end
    object mnuRelatorios: TMenuItem [4]
      Caption = '&Relatórios e Gráficos Fixos'
      object mnuRelGeral: TMenuItem
        Caption = '&Geral'
        object mnuRelCadastrodePessoal: TMenuItem
          Caption = 'Cadastro de Pessoal'
          OnClick = mnuRelCadastrodePessoalClick
        end
        object mnuRelFichaFuncional: TMenuItem
          Caption = 'Ficha Funcional'
          OnClick = mnuRelFichaFuncionalClick
        end
        object mnuRelEtiquetas: TMenuItem
          Caption = 'Etiquetas'
          OnClick = mnuRelEtiquetasClick
        end
        object N4: TMenuItem
          Caption = '-'
        end
        object mnuEstatisticasdoQuadro: TMenuItem
          Caption = '&Estatísticas do Quadro de Pessoal'
          OnClick = mnuEstatisticasdoQuadroClick
        end
      end
      object mnuRelAvaliacoes: TMenuItem
        Caption = '&Avaliações'
        object mnuAvaliacaoPreenchida: TMenuItem
          Caption = '&Avaliação Preenchida'
          OnClick = mnuAvaliacaoPreenchidaClick
        end
        object mnuRelatoriodeAvaliacoes: TMenuItem
          Caption = '&Relatório de Avaliações'
          OnClick = mnuRelatoriodeAvaliacoesClick
        end
        object mnuProgramacaodeAvaliacoes: TMenuItem
          Caption = '&Programação de Avaliações'
          OnClick = mnuProgramacaodeAvaliacoesClick
        end
        object N5: TMenuItem
          Caption = '-'
        end
        object mnuEstatisticadeAvaliacoes: TMenuItem
          Caption = '&Estatística de Avaliações'
          OnClick = mnuEstatisticadeAvaliacoesClick
        end
      end
      object mnuRelTreinamento: TMenuItem
        Caption = '&Treinamento'
        object mnuAtividadenoPeriodo: TMenuItem
          Caption = '&Atividade no Período'
          OnClick = mnuAtividadenoPeriodoClick
        end
        object mnuNecessidadesdeTreinamento: TMenuItem
          Caption = '&Necessidades de Treinamento'
          OnClick = mnuNecessidadesdeTreinamentoClick
        end
        object mnuMapadeTreinamento: TMenuItem
          Caption = '&Mapa de Treinamento'
          OnClick = mnuMapadeTreinamentoClick
        end
        object N6: TMenuItem
          Caption = '-'
        end
        object mnuEstatisticadeTreinamento: TMenuItem
          Caption = '&Estatística de Treinamento'
          OnClick = mnuEstatisticadeTreinamentoClick
        end
      end
      object mnuRelRecrutamento: TMenuItem
        Caption = '&Recrutamento'
        object mnuDossieCandidato: TMenuItem
          Caption = '&Dossiê do Candidato'
          OnClick = mnuDossieCandidatoClick
        end
        object mnuRequisicoesdePessoal: TMenuItem
          Caption = '&Requisições de Pessoal'
          OnClick = mnuRequisicoesdePessoalClick
        end
        object mnuRotatividade: TMenuItem
          Caption = 'Rotatividade (&Turnover)'
          OnClick = mnuRotatividadeClick
        end
        object N11: TMenuItem
          Caption = '-'
        end
        object mnuEstatisticaporFonte: TMenuItem
          Caption = 'Estatística por &Fonte de Recrutamento'
          OnClick = mnuEstatisticaporFonteClick
        end
        object mnuEstatisticadeDemissoes: TMenuItem
          Caption = 'Estatística de &Demissões'
          OnClick = mnuEstatisticadeDemissoesClick
        end
      end
      object mnuRelSalariosBeneficios: TMenuItem
        Caption = '&Salários e Benefícios'
        object mnuInconsistSalar: TMenuItem
          Caption = '&Inconsistências Salariais'
          OnClick = mnuInconsistSalarClick
        end
        object N13: TMenuItem
          Caption = '-'
        end
        object mnuEstatisticadeBeneficios: TMenuItem
          Caption = '&Estatística de Benefícios'
          OnClick = mnuEstatisticadeBeneficiosClick
        end
        object mnuEvolucaodaFolha: TMenuItem
          Caption = 'Evolução da &Folha'
          OnClick = mnuEvolucaodaFolhaClick
        end
      end
      object mnuRelMedicinadoTrabalho: TMenuItem
        Caption = '&Medicina do Trabalho'
        object mnuEstatisticadeOcorrencias: TMenuItem
          Caption = '&Estatística de Ocorrências'
          OnClick = mnuEstatisticadeOcorrenciasClick
        end
      end
    end
    inherited Edit1: TMenuItem [5]
    end
  end
  inherited ImlPadrao: TImageList
    Top = 136
  end
  inherited AclPadrao: TActionList
    Top = 184
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
    Left = 88
    Top = 232
  end
end
