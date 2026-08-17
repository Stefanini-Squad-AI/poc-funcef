inherited frmEncerraExercicioMT: TfrmEncerraExercicioMT
  Left = 191
  Top = 179
  HelpContext = 520019
  Caption = 'Encerramento do Exercício'
  ClientHeight = 152
  ClientWidth = 374
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 374
    Height = 113
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 55
      Height = 13
      Caption = 'Exercício'
    end
    object Label2: TLabel
      Left = 136
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Status'
    end
    object dblkExercicio: TwwDBLookupCombo
      Left = 24
      Top = 32
      Width = 97
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'EXERCICIO'#9'10'#9'EXERCICIO')
      LookupTable = cdsExercicio
      LookupField = 'EXERCICIO'
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnChange = dblkExercicioChange
    end
    object pgrStatus: TProgressBar
      Left = 24
      Top = 72
      Width = 329
      Height = 16
      Min = 0
      Max = 100
      TabOrder = 1
    end
    object edtStatus: TEdit
      Left = 136
      Top = 32
      Width = 217
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 113
    Width = 374
    inherited tb97Fundo: TToolbar97
      Left = 121
      DockPos = 122
      inherited sep1: TToolbarSep97
        Left = 166
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 5
      end
      inherited bbtnSair: TBitBtn
        Left = 85
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 168
        HelpContext = 520019
      end
      object bbtnEncerra: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Encerra'
        Enabled = False
        TabOrder = 2
        OnClick = bbtnEncerraClick
        Glyph.Data = {
          36010000424D3601000000000000760000002800000011000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555000000050000000000000000000000050FF8FF8FF8FF8FF0000000050FF
          8FF8FF8FF8FF0000000050888888888888880000000050FF8FF8FF8FF8FF0000
          000050FF8FF8FF8FF8FF0000000050888888888888880000000050FF8FF8FF71
          111F0000000050FF8FF8F8199991700000005088888881999999100000005044
          4447719FFFF91000000050444447719FFFF91000000050000000719999991000
          0000555555555719999170000000555555555551111550000000}
        Spacing = 5
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65499
    Top = 65499
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 56
    Top = 32
  end
  object cdsContas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 152
    Top = 32
  end
end
