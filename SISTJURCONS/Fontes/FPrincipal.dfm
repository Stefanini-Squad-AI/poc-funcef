inherited frmPrincipal: TfrmPrincipal
  Left = 265
  Top = 129
  Caption = 'Sistema Jurídico Consolidado'
  ClientHeight = 480
  ClientWidth = 751
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 751
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 460
    Width = 751
    Panels = <
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel0'
        Tag = 0
        Text = 'Empresa'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '300'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel1'
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
        Name = 'Panel3'
        Tag = 0
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel2'
        Style = psHint
        Tag = 0
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '400'
      end>
  end
  inherited mnu: TMainMenu
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
      inherited mnuUtilitario: TMenuItem
        object N1: TMenuItem
          Caption = '-'
        end
        object mnuVerificaCusto: TMenuItem
          Caption = 'Verificação e Acerto do &Custo'
          HelpContext = 7190001
          OnClick = mnuVerificaCustoClick
        end
        object mnuAlteracaodeResponsavel: TMenuItem
          Caption = 'Alteração de &Responsável'
          HelpContext = 7190002
          OnClick = mnuAlteracaodeResponsavelClick
        end
        object mnuAlteracaodeEscritorio: TMenuItem
          Caption = '&Alteração de Escritório/Advogado'
          HelpContext = 7190003
          OnClick = mnuAlteracaodeEscritorioClick
        end
      end
    end
    inherited mnuCadastro: TMenuItem [1]
      HelpContext = 7190004
      object mnuAdvogados: TMenuItem
        Caption = '&Advogados, Assistentes e Peritos'
        HelpContext = 7190005
        OnClick = mnuAdvogadosClick
      end
      object mnuHonorariosAdvocaticios: TMenuItem
        Caption = '&Honorários Advocatícios'
        HelpContext = 7190006
        OnClick = mnuHonorariosAdvocaticiosClick
      end
      object mnuEmpresasAdqContraPartes: TMenuItem
        Caption = 
          'E&mpresas Adquiridas e Adquirentes, Contrapartes, Litisconsortes' +
          ' ou Testemunhas'
        HelpContext = 7190007
        OnClick = mnuEmpresasAdqContraPartesClick
      end
      object mnuVaras: TMenuItem
        Caption = 'Órgãos Jurisdicionais (&Varas)'
        HelpContext = 7190008
        OnClick = mnuVarasClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuTiposdeProcesso: TMenuItem
        Caption = 'Tipos de &Processo'
        HelpContext = 7190009
        OnClick = mnuTiposdeProcessoClick
      end
      object mnuTiposdeAcao: TMenuItem
        Caption = 'T&ipos de Ação'
        HelpContext = 7190010
        OnClick = mnuTiposdeAcaoClick
      end
      object mnuMotivosdeExclusaodePessoas: TMenuItem
        Caption = '&Motivos de Exclusão de Litisconsortes'
        HelpContext = 7190011
        OnClick = mnuMotivosdeExclusaodePessoasClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuGruposdeObjeto: TMenuItem
        Caption = '&Grupos de Objeto Reclamado'
        HelpContext = 7190012
        OnClick = mnuGruposdeObjetoClick
      end
      object mnuTiposdeObjeto: TMenuItem
        Caption = 'Tipos de &Objeto Reclamado'
        HelpContext = 7190013
        OnClick = mnuTiposdeObjetoClick
      end
      object mnuTiposdeSentenca: TMenuItem
        Caption = 'Tipos de &Sentença'
        HelpContext = 7190014
        OnClick = mnuTiposdeSentencaClick
      end
      object mnuTiposdeEtapa: TMenuItem
        Caption = 'Tipos de &Etapa (Andamento)'
        HelpContext = 7190015
        OnClick = mnuTiposdeEtapaClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuRateiodeCustos: TMenuItem
        Caption = '&Rateio de Custos por Estabelecimento'
        HelpContext = 7190016
        OnClick = mnuRateiodeCustosClick
      end
      object mnuParametrizaoContabil: TMenuItem
        Caption = 'Parametrização &Contábil'
        HelpContext = 7190017
        OnClick = mnuParametrizaoContabilClick
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object HonorriosContratuais1: TMenuItem
        Caption = 'Honorários Contratuais'
        OnClick = HonorriosContratuais1Click
      end
    end
    object mnuTransacoes: TMenuItem [2]
      Caption = '&Transações'
      HelpContext = 7190018
      object mnuProcesso: TMenuItem
        Caption = '&Processo'
        HelpContext = 7190019
        OnClick = mnuProcessoClick
      end
      object mnuEtapasdoProcesso: TMenuItem
        Caption = '&Etapas do Processo'
        HelpContext = 7190020
        OnClick = mnuEtapasdoProcessoClick
      end
      object mnuHonorarios: TMenuItem
        Caption = '&Honorários'
        HelpContext = 7190021
        OnClick = mnuHonorariosClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuRateioDespesasJudiciais: TMenuItem
        Caption = '&Rateio de Despesas Judiciais'
        HelpContext = 7190022
        OnClick = mnuRateioDespesasJudiciaisClick
      end
      object mnuCorrecaoMonetria: TMenuItem
        Caption = 'Correção Monetária dos Processos'
        HelpContext = 7190023
        OnClick = mnuCorrecaoMonetriaClick
      end
      object mnuAjusteEstimativaOriginal: TMenuItem
        Caption = 'Ajuste da Estimativa Original aos Depósitos e Penhoras'
        HelpContext = 7190032
        OnClick = mnuAjusteEstimativaOriginalClick
      end
      object mnuManutDoc: TMenuItem
        Caption = 'Manutenção de Documentos (AP / GR)'
        HelpContext = 7190024
        OnClick = mnuManutDocClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object DespesasAdministrativas1: TMenuItem
        Caption = 'Despesas Administrativas'
        object ImportaodoMovimentodasDespesasAdministrativas1: TMenuItem
          Caption = 'Importação do Movimento das Despesas Administrativas'
          OnClick = ImportaodoMovimentodasDespesasAdministrativas1Click
        end
        object ManutenodasDespesasAdministrativas2: TMenuItem
          Caption = 'Manutenção das Despesas Administrativas'
          OnClick = ManutenodasDespesasAdministrativas2Click
        end
      end
      object OrdemJudicialFuncefNoParte1: TMenuItem
        Caption = 'Ordem Judicial - Funcef não é parte'
        OnClick = OrdemJudicialFuncefNoParte1Click
      end
      object ReembolsodeHonorriosAdvocatciosaExFuncionrios1: TMenuItem
        Caption = 'Reembolso de Honorários Advocatícios a Ex-Funcionários'
        OnClick = ReembolsodeHonorriosAdvocatciosaExFuncionrios1Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object MnuMovimContrato: TMenuItem
        Caption = 'Movimento dos Honorários Contratuais'
        OnClick = MnuMovimContratoClick
      end
    end
    inherited mnuConsulta: TMenuItem [3]
      object N6: TMenuItem
        Caption = '-'
      end
      object mnuConsultaGeraldeProcessos: TMenuItem
        Caption = '&Consulta Geral de Processos'
        HelpContext = 7190025
        OnClick = mnuConsultaGeraldeProcessosClick
      end
      object mnuFolUpEtapas: TMenuItem
        Caption = '&FollowUp das Etapas dos Processos'
        HelpContext = 7190026
        OnClick = mnuFolUpEtapasClick
      end
      object mnuAlteracoesExclusoesProcessos: TMenuItem
        Caption = '&Alterações e Exclusões dos Processos'
        HelpContext = 7190027
        OnClick = mnuAlteracoesExclusoesProcessosClick
      end
    end
    object mnuGraficosFixos: TMenuItem [4]
      Caption = '&Gráficos Fixos'
      HelpContext = 7190028
      object mnuEstatReclamacoes: TMenuItem
        Caption = '&Estatística de Reclamações'
        HelpContext = 7190029
        OnClick = mnuEstatReclamacoesClick
      end
      object mnuEstatisticadeProcessos: TMenuItem
        Caption = 'Estatística de &Processos'
        HelpContext = 7190030
        OnClick = mnuEstatisticadeProcessosClick
      end
      object mnuDistribuicaodeProcessos: TMenuItem
        Caption = '&Distribuição de Processos (Trabalhistas apenas)'
        HelpContext = 7190031
        OnClick = mnuDistribuicaodeProcessosClick
      end
    end
    inherited Edit1: TMenuItem [5]
    end
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
  end
end
