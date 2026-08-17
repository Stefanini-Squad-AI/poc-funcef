inherited frmAtuSaldoAnaMT: TfrmAtuSaldoAnaMT
  Left = 268
  Top = 171
  Caption = 'Atualiza Saldo das Contas Analíticas'
  ClientHeight = 293
  ClientWidth = 401
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 401
    Height = 254
    object Label3: TLabel
      Left = 24
      Top = 24
      Width = 55
      Height = 13
      Caption = 'Exercício'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 128
      Top = 24
      Width = 46
      Height = 13
      Caption = 'Período'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 24
      Top = 104
      Width = 65
      Height = 13
      Caption = 'Mensagens'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dblkExercicio: TwwDBLookupCombo
      Left = 24
      Top = 40
      Width = 89
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PEREXERCICIO'#9'10'#9'Exercício')
      LookupTable = cdsExercicio
      LookupField = 'PEREXERCICIO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblkExercicioCloseUp
    end
    object dblkPeriodo: TwwDBLookupCombo
      Left = 128
      Top = 40
      Width = 257
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PERNOME'#9'25'#9'Nome')
      DataField = 'PEREXERCI'
      LookupTable = cdsPeriodo
      LookupField = 'PERNUMERO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object prbImportar: TProgressBar
      Left = 26
      Top = 72
      Width = 359
      Height = 17
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 2
    end
    object mmStatus: TRichEdit
      Left = 24
      Top = 120
      Width = 361
      Height = 121
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 3
    end
  end
  inherited Dock971: TDock97
    Top = 254
    Width = 401
    inherited tb97Fundo: TToolbar97
      Left = 151
      inherited sep1: TToolbarSep97
        Left = 163
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 165
      end
      object btnAtualizar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Atualizar'
        TabOrder = 2
        OnClick = btnAtualizarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888005555500
          88888887788888778F88887555555555088888788888888878F887D558855555
          508887F88FFF888887F887D5FFF8555550888788777FF888878F7D55FFFF8555
          55087F887777FF88887F7D55FFFFF85555087F8877777FF8887F7D55FF8FFF85
          55087F8877F777FF887F7D55FF85FFF855087F8877F8777F887F7D55FF555FF8
          550878F87788877FF87887D5555555FF508887F88888887787F887D555555555
          5088878F888888888788887DD555555508888878FF88888F788888877DDDDD77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 40
    Top = 188
    TargetsData = (
      1
      1
      (
        'TRichEdit'
        'Text'
        0))
  end
  object cdsExercicio: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeOpen = cdsExercicioBeforeOpen
    Left = 171
    Top = 129
  end
  object cdsPeriodo: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeOpen = cdsPeriodoBeforeOpen
    Left = 246
    Top = 126
  end
end
