inherited frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Acompanhamento de Cotas & Fundos Patrimoniais'
  ClientHeight = 822
  ClientWidth = 1028
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 1028
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 802
    Width = 1028
  end
  inherited mnu: TMainMenu
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
        object MnuAberturadeAtivo: TMenuItem [1]
          Caption = 'Abertura de Ativo'
          OnClick = MnuAberturadeAtivoClick
        end
      end
    end
    inherited mnuCadastro: TMenuItem
      object mnuAtivo: TMenuItem
        Caption = 'Ativo'
        OnClick = mnuAtivoClick
      end
      object mnuContaFundo: TMenuItem
        Caption = 'Conta / Fundo'
        OnClick = mnuContaFundoClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object TipoEntrada1: TMenuItem
        Caption = 'Tipo Entrada'
        OnClick = TipoEntrada1Click
      end
      object mnuTipoMovim: TMenuItem
        Caption = 'Tipo Movimentação'
        OnClick = mnuTipoMovimClick
      end
      object mnuRoteiros: TMenuItem
        Caption = 'Roteiros'
        OnClick = mnuRoteirosClick
      end
    end
    object mnuOperacao: TMenuItem [3]
      Caption = 'Operação'
      object mnuApuracaoManual: TMenuItem
        Caption = 'Apuração Manual'
        OnClick = mnuApuracaoManualClick
      end
      object ExecuodeRoteiros1: TMenuItem
        Caption = 'Execução de Roteiros'
        OnClick = ExecuodeRoteiros1Click
      end
      object StatusdaCota1: TMenuItem
        Caption = 'Gerenciamento de Cotas'
        OnClick = StatusdaCota1Click
      end
    end
    inherited mnuConsulta: TMenuItem
      object mnuRoteirosApurados: TMenuItem [0]
        Caption = 'Roteiros Apurados'
        OnClick = mnuRoteirosApuradosClick
      end
      inherited Mnu_separa1_Padrao: TMenuItem [1]
        Visible = True
      end
      inherited Relatorios1: TMenuItem [2]
      end
      inherited Grficos2: TMenuItem [3]
      end
      inherited MnuConsultasGerais_Padrao: TMenuItem [4]
      end
    end
  end
end
