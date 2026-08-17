inherited frmAcertaCodRedMT: TfrmAcertaCodRedMT
  Left = 301
  Top = 199
  Caption = 'Atualiza Códigos Reduzidos'
  ClientHeight = 293
  ClientWidth = 341
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 341
    Height = 254
    object mmComentario: TMemo
      Left = 1
      Top = 1
      Width = 339
      Height = 89
      Align = alTop
      Alignment = taCenter
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        'Este procedimento renumerará os '
        'códigos reduzidos das contas '
        'contábeis')
      ParentFont = False
      TabOrder = 0
    end
    object rgRenumera: TRadioGroup
      Left = 78
      Top = 108
      Width = 185
      Height = 105
      Caption = ' Renumerar '
      ItemIndex = 0
      Items.Strings = (
        'Somente os &Duplicados'
        '&Todos os Códigos')
      TabOrder = 1
    end
    object pbProgresso: TProgressBar
      Left = 1
      Top = 231
      Width = 339
      Height = 22
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 2
    end
    object Anim: TAnimate
      Left = 11
      Top = 222
      Width = 18
      Height = 18
      Active = False
      AutoSize = False
      CommonAVI = aviFindFile
      StopFrame = 8
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 254
    Width = 341
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 170
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 1
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 281
    Top = 145
  end
end
