inherited FrmRelRecContrib: TFrmRelRecContrib
  Left = 163
  Top = 122
  Caption = 'Geração de Arquivo Digital'
  ClientHeight = 436
  ClientWidth = 804
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 804
    Height = 397
    AutoSize = True
    object GroupBox1: TGroupBox
      Left = 234
      Top = 88
      Width = 343
      Height = 82
      Caption = 'Período de Apuração'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 23
        Width = 92
        Height = 13
        Caption = 'Mês/Ano Inicial      '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 176
        Top = 23
        Width = 69
        Height = 13
        Caption = 'Mês/Ano Final'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object CbMesInicio: TComboBox
        Left = 4
        Top = 41
        Width = 89
        Height = 24
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 0
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object seAnoInicio: TSpinEdit
        Left = 95
        Top = 41
        Width = 54
        Height = 26
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 0
      end
      object CbMesFim: TComboBox
        Left = 175
        Top = 42
        Width = 89
        Height = 24
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 2
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object seAnoFim: TSpinEdit
        Left = 263
        Top = 42
        Width = 54
        Height = 26
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 3
        Value = 0
      end
    end
    object rgTipo: TRadioGroup
      Left = 278
      Top = 24
      Width = 257
      Height = 49
      Caption = '  Tipo de Arquivo  '
      Columns = 2
      Items.Strings = (
        'Resgate'
        'Contribuição')
      TabOrder = 1
      OnClick = rgTipoClick
    end
    object PSelecaoContribuicoes: TPanel
      Left = 1
      Top = 174
      Width = 802
      Height = 222
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      object btRetirar: TBitBtn
        Left = 384
        Top = 96
        Width = 25
        Height = 25
        Hint = 'Retirar'
        Default = True
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btRetirarClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000
          0000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF000000000000848400848400848400848400848400000000000000FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484840084840084840084840084
          8400848400848400848400848400000000FF00FFFF00FFFF00FFFF00FF848484
          FFFF008484008484008484008484008484008484008484008484008484008484
          00000000FF00FFFF00FFFF00FF848484FFFF0084840084840084840084840084
          8400FFFFFF848400848400848400848400000000FF00FFFF00FF848484FFFF00
          848400848400848400848400848400FFFFFFFFFFFF8484008484008484008484
          00848400000000FF00FF848484FFFF00848400848400848400848400FFFFFFFF
          FFFFFFFFFF848400848400848400848400848400000000FF00FF848484FFFF00
          848400848400848400FFFFFFFFFFFFFFFFFFFFFFFF8484008484008484008484
          00848400000000FF00FF848484FFFF00848400848400848400848400FFFFFFFF
          FFFFFFFFFF848400848400848400848400848400000000FF00FF848484FFFF00
          848400848400848400848400848400FFFFFFFFFFFF8484008484008484008484
          00848400000000FF00FFFF00FF848484FFFF0084840084840084840084840084
          8400FFFFFF848400848400848400848400000000FF00FFFF00FFFF00FF848484
          FFFF008484008484008484008484008484008484008484008484008484008484
          00000000FF00FFFF00FFFF00FFFF00FF848484FFFF00FFFF0084840084840084
          8400848400848400848400848400000000FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF848484848484FFFF00FFFF00FFFF00FFFF00FFFF00848484848484FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484
          8484848484848484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object btIncluir: TBitBtn
        Left = 384
        Top = 65
        Width = 25
        Height = 25
        Hint = 'Selecionar'
        Default = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btIncluirClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000
          0000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF000000000000848400848400848400848400848400000000000000FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484840084840084840084840084
          8400848400848400848400848400000000FF00FFFF00FFFF00FFFF00FF848484
          FFFF008484008484008484008484008484008484008484008484008484008484
          00000000FF00FFFF00FFFF00FF848484FFFF00848400848400848400FFFFFF84
          8400848400848400848400848400848400000000FF00FFFF00FF848484FFFF00
          848400848400848400848400FFFFFFFFFFFF8484008484008484008484008484
          00848400000000FF00FF848484FFFF00848400848400848400848400FFFFFFFF
          FFFFFFFFFF848400848400848400848400848400000000FF00FF848484FFFF00
          848400848400848400848400FFFFFFFFFFFFFFFFFFFFFFFF8484008484008484
          00848400000000FF00FF848484FFFF00848400848400848400848400FFFFFFFF
          FFFFFFFFFF848400848400848400848400848400000000FF00FF848484FFFF00
          848400848400848400848400FFFFFFFFFFFF8484008484008484008484008484
          00848400000000FF00FFFF00FF848484FFFF00848400848400848400FFFFFF84
          8400848400848400848400848400848400000000FF00FFFF00FFFF00FF848484
          FFFF008484008484008484008484008484008484008484008484008484008484
          00000000FF00FFFF00FFFF00FFFF00FF848484FFFF00FFFF0084840084840084
          8400848400848400848400848400000000FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF848484848484FFFF00FFFF00FFFF00FFFF00FFFF00848484848484FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484
          8484848484848484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object btConfirmar: TBitBtn
        Left = 384
        Top = 184
        Width = 25
        Height = 25
        Hint = 'Confirmar'
        Default = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btConfirmarClick
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
      object sgSecundaria: TStringGrid
        Left = 418
        Top = 15
        Width = 370
        Height = 204
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColCount = 1
        DefaultColWidth = 340
        FixedCols = 0
        RowCount = 2
        TabOrder = 3
        OnDrawCell = sgSecundariaDrawCell
        OnSelectCell = sgSecundariaSelectCell
      end
      object SGPrincipal: TStringGrid
        Left = 5
        Top = 15
        Width = 370
        Height = 204
        Anchors = [akLeft, akTop, akBottom]
        ColCount = 1
        DefaultColWidth = 340
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goRowMoving, goColMoving, goRowSelect]
        TabOrder = 4
        OnDrawCell = SGPrincipalDrawCell
        OnSelectCell = SGPrincipalSelectCell
      end
    end
  end
  inherited Dock971: TDock97
    Top = 397
    Width = 804
    inherited tb97Fundo: TToolbar97
      Left = 632
      DockPos = 802
      inherited bbtnAjuda: TmaHelpBitBtn
        Anchors = [akTop, akRight]
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 461
      DockPos = 625
      inherited ToolbarSep971: TToolbarSep97
        Left = 83
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 83
        Caption = 'Gera'
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 86
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      3
      (
        ''
        'Cells'
        0)
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object dtsSelecao: TwwDataSource
    DataSet = cdsSelecao
    Left = 72
    Top = 328
  end
  object sqlSelecao: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM CONTRIBUICAO ORDER BY IDCONTRIBUICAO')
    ClientDataSet = cdsSelecao
    Left = 72
    Top = 256
  end
  object cdsSelecao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 200
  end
  object CDSTipoArquivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 200
  end
end
