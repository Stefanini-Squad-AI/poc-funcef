inherited frmSelOrcam: TfrmSelOrcam
  Left = 133
  Top = 166
  HelpContext = 740027
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Orçamento do Custo de Pessoal'
  ClientHeight = 341
  ClientWidth = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 600
    Height = 302
    BorderWidth = 2
    object Label1: TLabel
      Left = 45
      Top = 12
      Width = 161
      Height = 13
      Caption = 'Número de Meses a Projetar'
    end
    object spedMeses: TSpinEdit
      Left = 213
      Top = 9
      Width = 40
      Height = 22
      MaxValue = 12
      MinValue = 1
      TabOrder = 0
      Value = 12
      OnChange = spedMesesChange
    end
    object rgBenef: TRadioGroup
      Left = 306
      Top = 6
      Width = 283
      Height = 31
      Caption = 'Considera os Benefícios Sociais ?'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 1
    end
    object rgEncargo: TRadioGroup
      Left = 12
      Top = 38
      Width = 283
      Height = 120
      Caption = '% Encargos Sociais'
      ItemIndex = 1
      Items.Strings = (
        'Único (a Especificar)'
        'Por Rubrica (Tabela ao Lado)')
      TabOrder = 2
      OnClick = rgEncargoClick
    end
    object ednPerc1: TEditNum
      Left = 219
      Top = 66
      Width = 64
      Height = 21
      TabOrder = 3
      Visible = False
      IntDigits = 3
      Signal = False
      DecDigits = 2
      Numeric = True
    end
  end
  inherited Dock971: TDock97
    Top = 302
    Width = 600
    inherited tb97Fundo: TToolbar97
      Left = 352
      inherited sep1: TToolbarSep97
        Left = 162
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
        Left = 164
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  object dbgrEncargo: TwwDBGrid [2]
    Left = 306
    Top = 42
    Width = 283
    Height = 120
    Selected.Strings = (
      'DESCRENCARGO'#9'33'#9'Descrição'
      'PERCENCARGO'#9'7'#9'%')
    IniAttributes.Delimiter = ';;'
    TitleColor = clGray
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    TitleLines = 1
    TitleButtons = False
    IndicatorColor = icBlack
  end
  object super: TGroupBox [3]
    Left = 12
    Top = 162
    Width = 283
    Height = 133
    Caption = 'Índice de Variação de Salários'
    TabOrder = 2
    object ednSal1: TEditNum
      Tag = 1
      Left = 20
      Top = 24
      Width = 46
      Height = 21
      TabOrder = 0
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object ednSal2: TEditNum
      Tag = 2
      Left = 84
      Top = 24
      Width = 46
      Height = 21
      TabOrder = 1
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum1: TEditNum
      Tag = 3
      Left = 151
      Top = 24
      Width = 46
      Height = 21
      TabOrder = 2
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum2: TEditNum
      Tag = 4
      Left = 216
      Top = 24
      Width = 46
      Height = 21
      TabOrder = 3
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum3: TEditNum
      Tag = 5
      Left = 20
      Top = 63
      Width = 46
      Height = 21
      TabOrder = 4
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum4: TEditNum
      Tag = 6
      Left = 84
      Top = 63
      Width = 46
      Height = 21
      TabOrder = 5
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum5: TEditNum
      Tag = 7
      Left = 151
      Top = 63
      Width = 46
      Height = 21
      TabOrder = 6
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum6: TEditNum
      Tag = 8
      Left = 216
      Top = 63
      Width = 46
      Height = 21
      TabOrder = 7
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum7: TEditNum
      Tag = 9
      Left = 20
      Top = 102
      Width = 46
      Height = 21
      TabOrder = 8
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum8: TEditNum
      Tag = 10
      Left = 84
      Top = 102
      Width = 46
      Height = 21
      TabOrder = 9
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum9: TEditNum
      Tag = 11
      Left = 151
      Top = 102
      Width = 46
      Height = 21
      TabOrder = 10
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum10: TEditNum
      Tag = 12
      Left = 216
      Top = 102
      Width = 46
      Height = 21
      TabOrder = 11
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
  end
  object gbxEfetivo: TGroupBox [4]
    Left = 306
    Top = 162
    Width = 283
    Height = 133
    Caption = 'Índice de Variação do Quadro Efetivo'
    TabOrder = 3
    object EditNum11: TEditNum
      Tag = 13
      Left = 20
      Top = 24
      Width = 46
      Height = 21
      TabOrder = 0
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum12: TEditNum
      Tag = 14
      Left = 84
      Top = 24
      Width = 46
      Height = 21
      TabOrder = 1
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum13: TEditNum
      Tag = 15
      Left = 151
      Top = 24
      Width = 46
      Height = 21
      TabOrder = 2
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum14: TEditNum
      Tag = 16
      Left = 216
      Top = 24
      Width = 46
      Height = 21
      TabOrder = 3
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum15: TEditNum
      Tag = 17
      Left = 20
      Top = 63
      Width = 46
      Height = 21
      TabOrder = 4
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum16: TEditNum
      Tag = 18
      Left = 84
      Top = 63
      Width = 46
      Height = 21
      TabOrder = 5
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum17: TEditNum
      Tag = 19
      Left = 151
      Top = 63
      Width = 46
      Height = 21
      TabOrder = 6
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum18: TEditNum
      Tag = 20
      Left = 216
      Top = 63
      Width = 46
      Height = 21
      TabOrder = 7
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum19: TEditNum
      Tag = 21
      Left = 20
      Top = 102
      Width = 46
      Height = 21
      TabOrder = 8
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum20: TEditNum
      Tag = 22
      Left = 84
      Top = 102
      Width = 46
      Height = 21
      TabOrder = 9
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum21: TEditNum
      Tag = 23
      Left = 151
      Top = 102
      Width = 46
      Height = 21
      TabOrder = 10
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
    object EditNum22: TEditNum
      Tag = 24
      Left = 216
      Top = 102
      Width = 46
      Height = 21
      TabOrder = 11
      Text = '1,0000'
      IntDigits = 1
      Signal = False
      DecDigits = 4
      Numeric = True
    end
  end
  object ednPerc2: TEditNum [5]
    Left = 219
    Top = 117
    Width = 64
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 4
    IntDigits = 3
    Signal = False
    DecDigits = 2
    Numeric = True
  end
  object ds: TwwDataSource
    DataSet = tblEncargo
    Left = 378
    Top = 108
  end
  object tblEncargo: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDENCARGO'
    TableName = 'CM.ENCARGO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 456
    Top = 110
    object tblEncargoDESCRENCARGO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 33
      FieldName = 'DESCRENCARGO'
      Size = 40
    end
    object tblEncargoPERCENCARGO: TFloatField
      DisplayLabel = '%'
      DisplayWidth = 7
      FieldName = 'PERCENCARGO'
      DisplayFormat = '0.00'
    end
  end
end
