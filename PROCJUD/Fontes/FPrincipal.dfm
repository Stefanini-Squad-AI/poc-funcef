inherited frmPrincipal: TfrmPrincipal
  Left = 132
  Top = 173
  Caption = 'Processos Judiciais'
  ClientHeight = 294
  ClientWidth = 543
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 543
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 274
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
        Text = '26/11/2007 13:01'
        TextOptions.Alignment = taRightJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited mnu: TMainMenu
    Top = 185
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
      inherited mnuUtilitario: TMenuItem
        object N6: TMenuItem
          Caption = '-'
        end
        object mnuVerificaCusto: TMenuItem
          Caption = 'Verificação e Acerto do &Custo'
          HelpContext = 1110025
          OnClick = mnuVerificaCustoClick
        end
        object mnuAlteracaodoResponsavel: TMenuItem
          Caption = '&Alteração do Responsável'
          HelpContext = 1100025
          OnClick = mnuAlteracaodoResponsavelClick
        end
        object mnuAlteracaodeEscritorio: TMenuItem
          Caption = 'Alteração de Escritório/Advogado'
          HelpContext = 1100026
          OnClick = mnuAlteracaodeEscritorioClick
        end
      end
    end
    inherited mnuCadastro: TMenuItem [1]
      HelpContext = 1110001
      object mnuAdvogados: TMenuItem
        Caption = '&Advogados, Assistentes e Peritos'
        HelpContext = 1110002
        OnClick = mnuAdvogadosClick
      end
      object mnuEmpresasRecl: TMenuItem
        Caption = 'Contrapartes e &Litisconsortes'
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
        HelpContext = 1110009
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
      object TMenuItem
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
      HelpContext = 1110013
      object mnuProcessoJudicial: TMenuItem
        Caption = '&Processo Judicial'
        HelpContext = 1110014
        OnClick = mnuProcessoJudicialClick
      end
      object mnuEtapasdoProcesso: TMenuItem
        Caption = '&Etapas do Processo'
        HelpContext = 1110015
        OnClick = mnuEtapasdoProcessoClick
      end
      object mnuHonorarios: TMenuItem
        Caption = '&Honorários'
        HelpContext = 1110016
        OnClick = mnuHonorariosClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuManutDoc: TMenuItem
        Caption = 'Manutenção de Documentos (AP / GR)'
        HelpContext = 1100016
        OnClick = mnuManutDocClick
      end
    end
    inherited mnuConsulta: TMenuItem [3]
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuConsultaGeraldeProcessos: TMenuItem
        Caption = '&Consulta Geral de Processos'
        HelpContext = 1110018
        OnClick = mnuConsultaGeraldeProcessosClick
      end
      object mnuFolUpEtapas: TMenuItem
        Caption = '&FollowUp das Etapas dos Processos'
        HelpContext = 1110019
        OnClick = mnuFolUpEtapasClick
      end
      object mnuConsultaProcessoQualquerMateria: TMenuItem
        Caption = 'Consulta &Processo de Qualquer Matéria'
        HelpContext = 1100019
        OnClick = mnuConsultaProcessoQualquerMateriaClick
      end
    end
    object mnuRelatorios: TMenuItem [4]
      Caption = '&Gráficos Fixos'
      HelpContext = 1110021
      object mnuEstatReclamacoes: TMenuItem
        Caption = '&Estatística de Reclamações'
        HelpContext = 1110023
        OnClick = mnuEstatReclamacoesClick
      end
      object mnuEstatisticadeProcessos: TMenuItem
        Caption = 'Estatística de &Processos'
        HelpContext = 1110024
        OnClick = mnuEstatisticadeProcessosClick
      end
    end
    inherited Edit1: TMenuItem [5]
    end
  end
  inherited AclPadrao: TActionList
    Left = 37
    Top = 136
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
    Left = 85
    Top = 232
  end
end
