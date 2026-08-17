inherited frmPrincipal: TfrmPrincipal
  Left = 189
  Top = 171
  Caption = 'IntegraSAF - Sistema de Intgração SAF X CM'
  ClientHeight = 398
  ClientWidth = 678
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 678
    inherited tb97Atalho: TToolbar97
      inherited sbtnFluxOper: TToolbarButton97
        Visible = False
      end
      inherited sbtnListaMensagens: TToolbarButton97
        Visible = False
      end
      inherited sbtnEnviaMensagens: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 255
    Top = 44
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 378
    Width = 678
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
        Text = '08/10/2001 21:50'
        TextOptions.Alignment = taRightJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited mnu: TMainMenu
    Top = 160
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
      inherited mnuFluxOper: TMenuItem
        Visible = False
      end
    end
    object MnuOperacoes: TMenuItem [2]
      Caption = '&Operações'
      object MnuBloqueiHist: TMenuItem
        Caption = '&Bloqueia Históricos Para Importação'
        OnClick = MnuBloqueiHistClick
      end
      object MnuImporta: TMenuItem
        Caption = '&Importa Lançamentos'
        OnClick = MnuImportaClick
      end
    end
    inherited mnuCadastro: TMenuItem
      object MnuHistSaf: TMenuItem
        Caption = 'Históricos SAF'
        OnClick = MnuHistSafClick
      end
      object MnuHistXTipoAlterador: TMenuItem
        Caption = 'Históricos X Tipo Alterador'
        OnClick = MnuHistXTipoAlteradorClick
      end
    end
  end
  inherited CorreioCM: TCorreioCM
    Left = 122
    Top = 301
  end
  object Tmr: TTimer
    Enabled = False
    OnTimer = TmrTimer
    Left = 560
    Top = 112
  end
end
