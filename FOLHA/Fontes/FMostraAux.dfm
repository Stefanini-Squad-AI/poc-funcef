inherited frmMostraAux: TfrmMostraAux
  Left = 122
  Top = 196
  Caption = 'Recálculo de Parâmetros do Participante'
  ClientHeight = 324
  ClientWidth = 634
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 634
    Height = 285
    object memResult: TRichEdit
      Left = 5
      Top = 5
      Width = 624
      Height = 275
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 285
    Width = 634
    inherited tb97Fundo: TToolbar97
      Left = 454
      DockPos = 454
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 126
      DockPos = 126
      inherited ToolbarSep971: TToolbarSep97
        Left = 240
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 160
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 243
        Visible = False
      end
      object bbtnImprimir: TBitBtn
        Left = 80
        Top = 0
        Width = 80
        Height = 33
        Hint = 'Imprimir a Consulta'
        Caption = '&Imprimir'
        Default = True
        ModalResult = 1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = bbtnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnSalvar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Hint = 'Salvar a Consulta como arquivo'
        Caption = '&Salvar'
        Default = True
        ModalResult = 1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = bbtnSalvarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
          00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
          00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
          00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
          0003737FFFFFFFFF7F7330099999999900333777777777777733}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  object savedlg: TSaveDialog
    Left = 33
    Top = 267
  end
  object printdlg: TPrintDialog
    Left = 99
    Top = 270
  end
end
