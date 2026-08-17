inherited frmPrincipal: TfrmPrincipal
  Left = 145
  Top = 157
  Caption = 'Contencioso Previdenciário'
  ClientHeight = 296
  ClientWidth = 568
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 568
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 135
    Top = 49
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 276
    Width = 568
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
        Width = '200'
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
        Name = 'Panel2'
        Style = psDateTime
        Tag = 0
        Text = '02/01/2008 12:00'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
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
        object N2: TMenuItem
          Caption = '-'
        end
        object mnuVerificaCusto: TMenuItem
          Caption = 'Verificação e Acerto do &Custo'
          HelpContext = 1100024
          OnClick = mnuVerificaCustoClick
        end
        object mnuAlteracaodoResponsavel: TMenuItem
          Caption = 'Alteração do &Responsável'
          HelpContext = 1100025
          OnClick = mnuAlteracaodoResponsavelClick
        end
        object mnuAlteracaodoEscritorio: TMenuItem
          Caption = 'Alteração do &Escritório/Advogado'
          HelpContext = 1100026
          OnClick = mnuAlteracaodoEscritorioClick
        end
      end
    end
    inherited mnuCadastro: TMenuItem [1]
      HelpContext = 1100001
      object mnuAdvogados: TMenuItem
        Caption = '&Advogados, Assistentes e Peritos'
        HelpContext = 1100002
        OnClick = mnuAdvogadosClick
      end
      object mnuEmpresasRecl: TMenuItem
        Caption = 'Contrapa&rtes e Litisconsortes'
        HelpContext = 1110003
        OnClick = mnuEmpresasReclClick
      end
      object mnuTRTs: TMenuItem
        Caption = 'Órgãos Jurisdicionais (&Varas)'
        HelpContext = 1100003
        OnClick = mnuTRTsClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuTiposdeProcesso: TMenuItem
        Caption = 'Tipos de &Processo'
        HelpContext = 1100004
        OnClick = mnuTiposdeProcessoClick
      end
      object mnuTiposdeAcao: TMenuItem
        Caption = 'T&ipos de Ação'
        HelpContext = 1100005
        OnClick = mnuTiposdeAcaoClick
      end
      object mnuMotivosdeExclusaodePessoas: TMenuItem
        Caption = '&Motivos de Exclusão de Litisconsortes'
        HelpContext = 1100006
        OnClick = mnuMotivosdeExclusaodePessoasClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuGruposdeObjeto: TMenuItem
        Caption = '&Grupos de Objeto Reclamado'
        HelpContext = 1100007
        OnClick = mnuGruposdeObjetoClick
      end
      object mnuTiposdeObjeto: TMenuItem
        Caption = 'Tipos de &Objeto Reclamado'
        HelpContext = 1100008
        OnClick = mnuTiposdeObjetoClick
      end
      object mnuTiposdeSentenca: TMenuItem
        Caption = 'Tipos de &Sentença'
        HelpContext = 1100009
        OnClick = mnuTiposdeSentencaClick
      end
      object mnuTiposdeRecurso: TMenuItem
        Caption = 'Tipos de &Etapa (Andamento)'
        HelpContext = 1100010
        OnClick = mnuTiposdeRecursoClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuParametrizaoContabil: TMenuItem
        Caption = 'Parametrização &Contábil'
        HelpContext = 1100011
        OnClick = mnuParametrizaoContabilClick
      end
    end
    object mnuTransacoes: TMenuItem [2]
      Caption = '&Transações'
      HelpContext = 1100012
      object mnuProcessoPrevidenciario: TMenuItem
        Caption = '&Processo Previdenciário'
        HelpContext = 1100013
        OnClick = mnuProcessoPrevidenciarioClick
      end
      object mnuEtapasdoProcesso: TMenuItem
        Caption = '&Etapas do Processo'
        HelpContext = 1100014
        OnClick = mnuEtapasdoProcessoClick
      end
      object mnuHonorarios: TMenuItem
        Caption = '&Honorários'
        HelpContext = 1100015
        OnClick = mnuHonorariosClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuManutDoc: TMenuItem
        Caption = 'Manutenção de Documentos (AP / GR)'
        HelpContext = 1100016
        OnClick = mnuManutDocClick
      end
    end
    inherited mnuConsulta: TMenuItem [3]
      object N8: TMenuItem
        Caption = '-'
      end
      object mnuConsultaGeraldeProcessos: TMenuItem
        Caption = '&Consulta Geral de Processos'
        HelpContext = 1100017
        OnClick = mnuConsultaGeraldeProcessosClick
      end
      object mnuFolUpEtapas: TMenuItem
        Caption = '&FollowUp das Etapas dos Processos'
        HelpContext = 1100018
        OnClick = mnuFolUpEtapasClick
      end
      object ConsultaProcessoQualquerMateria: TMenuItem
        Caption = 'Consulta &Processo de Qualquer Matéria'
        HelpContext = 1100019
        OnClick = ConsultaProcessoQualquerMateriaClick
      end
    end
    object mnuRelatorios: TMenuItem [4]
      Caption = '&Gráficos Fixos'
      HelpContext = 1100020
      object mnuEstatReclamacoes: TMenuItem
        Caption = '&Estatística de Reclamações'
        HelpContext = 1100022
        OnClick = mnuEstatReclamacoesClick
      end
      object mnuEstatisticadeProcessos: TMenuItem
        Caption = 'Estatística de &Processos'
        HelpContext = 1100023
        OnClick = mnuEstatisticadeProcessosClick
      end
    end
    inherited Edit1: TMenuItem [5]
    end
  end
  inherited AclPadrao: TActionList
    Left = 40
    Top = 136
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
    Left = 88
    Top = 232
  end
  inherited CMNetUsers: TCMNetUsers
    Left = 184
    Top = 232
  end
end
