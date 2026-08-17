inherited frmPrincipal: TfrmPrincipal
  Left = 87
  Top = 154
  Caption = 'Módulo de Administração de Desempenho'
  ClientHeight = 331
  ClientWidth = 621
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 621
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 311
    Width = 621
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
        Text = '08/09/2003 16:47'
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
          OnClick = nmuConfigParametrosClick
        end
        inherited MnuSep2_padrao: TMenuItem
          Visible = False
        end
      end
    end
    inherited mnuCadastro: TMenuItem [1]
      HelpContext = 700001
      object mnuCargos: TMenuItem
        Caption = '&Cargos'
        HelpContext = 700002
        OnClick = mnuCargosClick
      end
      object mnuGruposFuncionais: TMenuItem
        Caption = '&Grupos Funcionais'
        HelpContext = 700003
        OnClick = mnuGruposFuncionaisClick
      end
      object mnuGruposFatoresAvaliacao: TMenuItem
        Caption = 'Grupos de Fatores de &Avaliação'
        HelpContext = 700004
        OnClick = mnuGruposFatoresAvaliacaoClick
      end
      object mnuFatoresdeAvalicao: TMenuItem
        Caption = '&Fatores de Avaliação'
        HelpContext = 700005
        OnClick = mnuFatoresdeAvalicaoClick
      end
      object mnuPesosGruposxFatores: TMenuItem
        Caption = '&Pesos Grupos x Fatores'
        HelpContext = 700006
        OnClick = mnuPesosGruposxFatoresClick
      end
      object mnuTiposdeAvalicao: TMenuItem
        Caption = '&Tipos de Avaliação'
        HelpContext = 700007
        OnClick = mnuTiposdeAvalicaoClick
      end
    end
    object mnuTransacoes: TMenuItem [2]
      Caption = '&Transações'
      HelpContext = 700008
      object mnuRegistrodeAvalDesemp: TMenuItem
        Caption = '&Registro de Avaliações de Desempenho'
        HelpContext = 700009
        OnClick = mnuRegistrodeAvalDesempClick
      end
      object mnuRegistrodeOutrasAval: TMenuItem
        Caption = 'Registro de &Outras Avaliações'
        HelpContext = 700010
        OnClick = mnuRegistrodeOutrasAvalClick
      end
    end
    inherited mnuConsulta: TMenuItem [3]
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuHistAval: TMenuItem
        Caption = '&Histórico de Avaliações'
        HelpContext = 700011
        OnClick = mnuHistAvalClick
      end
      object mnuEvolPotencial: TMenuItem
        Caption = '&Evolução e Potencial'
        HelpContext = 700012
        OnClick = mnuEvolPotencialClick
      end
    end
    object mnuRelatorios: TMenuItem [4]
      Caption = '&Gráficos Fixos'
      HelpContext = 700013
      object mnuEstatAval: TMenuItem
        Caption = '&Estatística de Avaliações'
        HelpContext = 700017
        OnClick = mnuEstatAvalClick
      end
    end
    inherited Edit1: TMenuItem [5]
    end
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
  end
  inherited Skt: TSocketConnection
    ServerGUID = '{C9A55B6B-EE2F-4295-99A9-665FE3034E2F}'
    ServerName = 'CmModAvaSvr50.DmCmModAvaSvr50'
  end
  inherited Dcom: TDCOMConnection
    ServerGUID = '{C9A55B6B-EE2F-4295-99A9-665FE3034E2F}'
    ServerName = 'CmModAvaSvr50.DmCmModAvaSvr50'
  end
  inherited Web: TWebConnection
    ServerGUID = '{C9A55B6B-EE2F-4295-99A9-665FE3034E2F}'
    ServerName = 'CmModAvaSvr50.DmCmModAvaSvr50'
  end
end
