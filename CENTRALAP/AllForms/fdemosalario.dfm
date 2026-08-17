inherited frmDemoSalario: TfrmDemoSalario
  Left = 7
  Top = 110
  BorderIcons = [biSystemMenu]
  Caption = 'Demonstrativo de Salários - Verificação'
  ClientHeight = 482
  ClientWidth = 783
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 783
    Height = 442
    object RichEdAdaptacao: TRichEdit
      Left = 6
      Top = 3
      Width = 774
      Height = 472
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        'RichEdAdaptacao')
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
    object stgridresult: TStringGrid
      Left = 1
      Top = 1
      Width = 781
      Height = 440
      Align = alClient
      ColCount = 12
      DefaultColWidth = 67
      DefaultRowHeight = 20
      FixedColor = 13224393
      FixedCols = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ParentFont = False
      TabOrder = 0
      OnKeyDown = stgridresultKeyDown
      OnSelectCell = stgridresultSelectCell
      ColWidths = (
        227
        74
        67
        67
        101
        67
        78
        67
        67
        67
        85
        67)
    end
  end
  inherited Dock971: TDock97
    Top = 442
    Width = 783
    Height = 40
    inherited tb97Fundo: TToolbar97
      Left = 611
      DockPos = 613
      inherited bbtnSair: TBitBtn
        Top = 1
        Height = 32
        Hint = 'Cancela o Processo'
        Caption = '&Terminar'
        ParentShowHint = False
        ShowHint = True
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Top = 1
        Height = 32
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 439
      DockPos = 441
      inherited ToolbarSep971: TToolbarSep97
        Left = 85
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 85
        Height = 34
        Hint = 'Continua o Processamento'
        Caption = '&Avançar'
        ParentShowHint = False
        ShowHint = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333FF3333333333333003333
          3333333333773FF3333333333309003333333333337F773FF333333333099900
          33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
          99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
          33333333337F3F77333333333309003333333333337F77333333333333003333
          3333333333773333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
      end
      inherited bbtnCancelar: TBitBtn
        Left = 88
        Width = 80
        Visible = False
      end
    end
    object BitBtn1: TBitBtn
      Left = 4
      Top = 2
      Width = 93
      Height = 33
      Cancel = True
      Caption = '&Imprimir'
      TabOrder = 2
      Visible = False
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      Spacing = 2
    end
  end
end
