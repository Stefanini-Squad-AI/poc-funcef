inherited frmPrincipal: TfrmPrincipal
  Left = 122
  Top = 154
  Caption = 'Módulo de Recrutamento e Seleção'
  ClientHeight = 322
  ClientWidth = 554
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 554
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 302
    Width = 554
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
        Text = '18/09/2014 11:31'
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
        object N1: TMenuItem
          Caption = '-'
        end
        object mnuImportaTXTCandidatos: TMenuItem
          Caption = '&Importa TXT de Candidatos'
          HelpContext = 730001
          OnClick = mnuImportaTXTCandidatosClick
        end
      end
    end
    inherited mnuCadastro: TMenuItem [1]
      HelpContext = 730002
      object mnuCadastrodeCandidatos: TMenuItem
        Caption = '&Candidatos'
        HelpContext = 730003
        OnClick = mnuCadastrodeCandidatosClick
      end
      object mnuFontesdeRecrutamento: TMenuItem
        Caption = '&Fontes de Recrutamento'
        HelpContext = 730004
        OnClick = mnuFontesdeRecrutamentoClick
      end
      object mnuInsEnsino: TMenuItem
        Caption = 'Instituição de Ensino'
        OnClick = mnuInsEnsinoClick
      end
      object mnuAgenteIntegracao: TMenuItem
        Caption = 'Agente de Integração'
        OnClick = mnuAgenteIntegracaoClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuTiposdeExperiencia: TMenuItem
        Caption = 'Tipos de &Experiência'
        HelpContext = 730005
        OnClick = mnuTiposdeExperienciaClick
      end
      object mnuTiposdeTeste: TMenuItem
        Caption = '&Tipos de Avaliação, Teste, Entrevista'
        HelpContext = 730006
        OnClick = mnuTiposdeTesteClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mnuExperienciasRequeridasporCargo: TMenuItem
        Caption = 'Experiências &Requeridas por Cargo'
        HelpContext = 730007
        OnClick = mnuExperienciasRequeridasporCargoClick
      end
      object mnuAvaliaciesRequeridasporCargo: TMenuItem
        Caption = '&Avaliações Requeridas por Cargo'
        HelpContext = 730008
        OnClick = mnuAvaliaciesRequeridasporCargoClick
      end
    end
    object mnuTransacoes: TMenuItem [2]
      Caption = '&Transações'
      HelpContext = 730009
      object mnuRequisicaodePessoal: TMenuItem
        Caption = '&Requisição de Pessoal'
        HelpContext = 730010
        OnClick = mnuRequisicaodePessoalClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object mnuRegistrodeTestesEntrevistas: TMenuItem
        Caption = 'Registro de &Testes e Entrevistas'
        HelpContext = 730011
        OnClick = mnuRegistrodeTestesEntrevistasClick
      end
      object mnuRegistrodeExperiencias: TMenuItem
        Caption = 'Registro e Histórico de &Experiências'
        HelpContext = 730012
        OnClick = mnuRegistrodeExperienciasClick
      end
      object mnuRegistrodeCursosdeCandidatos: TMenuItem
        Caption = 'Registro de C&ursos de Candidatos'
        HelpContext = 730013
        OnClick = mnuRegistrodeCursosdeCandidatosClick
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object mnuEliminacaodeCandidatos: TMenuItem
        Caption = 'Eliminação de &Candidatos'
        HelpContext = 730014
        OnClick = mnuEliminacaodeCandidatosClick
      end
      object mnuEliminacaodeRequisicoes: TMenuItem
        Caption = 'E&liminação de Requisições'
        HelpContext = 730015
        OnClick = mnuEliminacaodeRequisicoesClick
      end
    end
    inherited mnuConsulta: TMenuItem [3]
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuHistoricodeTestes: TMenuItem
        Caption = '&Histórico de Testes e Entrevistas'
        HelpContext = 730016
        OnClick = mnuHistoricodeTestesClick
      end
      object mnuSelecaodeCandidatos: TMenuItem
        Caption = '&Seleção de Candidatos'
        HelpContext = 730017
        OnClick = mnuSelecaodeCandidatosClick
      end
    end
    object mnuRelatorios: TMenuItem [4]
      Caption = '&Gráficos Fixos'
      HelpContext = 730018
      object mnuEstatisticaporFonte: TMenuItem
        Caption = 'Estatística por &Fonte de Recrutamento'
        HelpContext = 730021
        OnClick = mnuEstatisticaporFonteClick
      end
      object mnuEstatisticadeDemissoes: TMenuItem
        Caption = 'Estatística de &Demissões'
        HelpContext = 730022
        OnClick = mnuEstatisticadeDemissoesClick
      end
    end
    inherited Edit1: TMenuItem [5]
    end
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
    Left = 40
  end
end
