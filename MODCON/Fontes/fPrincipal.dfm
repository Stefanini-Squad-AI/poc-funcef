inherited frmPrincipal: TfrmPrincipal
  Left = 109
  Top = 151
  Caption = 'Módulo de Contencioso Trabalhista'
  ClientHeight = 336
  ClientWidth = 546
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 546
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 316
    Width = 546
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
        Text = '29/03/2004 14:20'
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
  inherited mnu: TMainMenu
    Top = 141
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
      inherited mnuUtilitario: TMenuItem
        object N9: TMenuItem
          Caption = '-'
        end
        object mnuVerificaCusto: TMenuItem
          Caption = 'Verificação e Acerto do &Custo'
          HelpContext = 760001
          OnClick = mnuVerificaCustoClick
        end
        object mnuAlteracaodeResponsavel: TMenuItem
          Caption = '&Alteração de Responsável'
          HelpContext = 760002
          OnClick = mnuAlteracaodeResponsavelClick
        end
        object mnuAlteracaodeEscritorio: TMenuItem
          Caption = 'Alteração de Escritório/Advogado'
          HelpContext = 760003
          OnClick = mnuAlteracaodeEscritorioClick
        end
      end
    end
    inherited mnuCadastro: TMenuItem [1]
      HelpContext = 760004
      object mnuAdvogados: TMenuItem
        Caption = '&Advogados, Assistentes e Peritos'
        HelpContext = 760005
        OnClick = mnuAdvogadosClick
      end
      object mnuEmpresasAdq: TMenuItem
        Caption = 
          'E&mpresas Adquiridas e Adquirentes, Litisconsortes ou Testemunha' +
          's'
        HelpContext = 760006
        OnClick = mnuEmpresasAdqClick
      end
      object mnuVarasdoTrabalho: TMenuItem
        Caption = 'Órgãos Jurisdicionais (&Varas)'
        HelpContext = 760008
        OnClick = mnuVarasdoTrabalhoClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuTiposdeProcesso: TMenuItem
        Caption = 'Tipos de &Processo'
        HelpContext = 760009
        OnClick = mnuTiposdeProcessoClick
      end
      object mnuTiposdeAcao: TMenuItem
        Caption = 'T&ipos de Ação'
        HelpContext = 760010
        OnClick = mnuTiposdeAcaoClick
      end
      object mnuMotivosdeExclusaodePessoas: TMenuItem
        Caption = '&Motivos de Exclusão de Litisconsortes'
        HelpContext = 760011
        OnClick = mnuMotivosdeExclusaodePessoasClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuGruposdeObjeto: TMenuItem
        Caption = '&Grupos de Objeto Reclamado'
        HelpContext = 760012
        OnClick = mnuGruposdeObjetoClick
      end
      object mnuTiposdeObjeto: TMenuItem
        Caption = 'Tipos de &Objeto Reclamado'
        HelpContext = 760013
        OnClick = mnuTiposdeObjetoClick
      end
      object mnuTiposdeSentenca: TMenuItem
        Caption = 'Tipos de &Sentença'
        HelpContext = 760014
        OnClick = mnuTiposdeSentencaClick
      end
      object mnuTiposdeRecurso: TMenuItem
        Caption = 'Tipos de &Etapa (Andamento)'
        HelpContext = 760015
        OnClick = mnuTiposdeRecursoClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuRateiodeCustos: TMenuItem
        Caption = '&Rateio de Custos por Estabelecimento'
        HelpContext = 760016
        OnClick = mnuRateiodeCustosClick
      end
      object mnuParametrizacaoContabil: TMenuItem
        Caption = 'Parametrização &Contábil'
        HelpContext = 760017
        OnClick = mnuParametrizacaoContabilClick
      end
    end
    object mnuTransacoes: TMenuItem [2]
      Caption = '&Transações'
      HelpContext = 760018
      object ProcessoTrabalhista1: TMenuItem
        Caption = '&Processo Trabalhista'
        HelpContext = 760019
        OnClick = ProcessoTrabalhista1Click
      end
      object mnuEtapasdoProcesso: TMenuItem
        Caption = '&Etapas do Processo'
        HelpContext = 760020
        OnClick = mnuEtapasdoProcessoClick
      end
      object mnuHonorarios: TMenuItem
        Caption = '&Honorários'
        HelpContext = 760021
        OnClick = mnuHonorariosClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuManutDoc: TMenuItem
        Caption = 'Manutenção de Documentos (AP)'
        HelpContext = 760022
        OnClick = mnuManutDocClick
      end
    end
    inherited mnuConsulta: TMenuItem [3]
      object N8: TMenuItem
        Caption = '-'
      end
      object mnuConsultaGeraldeProcessos: TMenuItem
        Caption = '&Consulta Geral de Processos'
        HelpContext = 760023
        OnClick = mnuConsultaGeraldeProcessosClick
      end
      object mnuFolUpEtapas: TMenuItem
        Caption = '&FollowUp das Etapas dos Processos'
        HelpContext = 760024
        OnClick = mnuFolUpEtapasClick
      end
      object mnuConsultaProcessoQualquerMateria: TMenuItem
        Caption = 'Consulta &Processo de Qualquer Matéria'
        HelpContext = 760025
        OnClick = mnuConsultaProcessoQualquerMateriaClick
      end
    end
    object mnuRelatorios: TMenuItem [4]
      Caption = '&Gráficos Fixos'
      HelpContext = 760026
      object mnuEstatReclamacoes: TMenuItem
        Caption = '&Estatística de Reclamações'
        HelpContext = 760029
        OnClick = mnuEstatReclamacoesClick
      end
      object mnuDistribuicaodeProcessos: TMenuItem
        Caption = '&Distribuição de Processos'
        HelpContext = 760030
        OnClick = mnuDistribuicaodeProcessosClick
      end
      object mnuEstatisticadeProcessos: TMenuItem
        Caption = 'Estatística de &Processos'
        HelpContext = 760031
        OnClick = mnuEstatisticadeProcessosClick
      end
    end
    inherited Edit1: TMenuItem [5]
    end
  end
  inherited ImlPadrao: TImageList
    Top = 200
  end
  inherited AclPadrao: TActionList
    Top = 248
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
    Left = 88
    Top = 232
  end
end
