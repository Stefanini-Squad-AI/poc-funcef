inherited FrmConfigBloqMT: TFrmConfigBloqMT
  Left = 429
  Top = 191
  Caption = 'Configuração de Bloqueto'
  ClientHeight = 453
  ClientWidth = 436
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 436
    Height = 367
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 434
      Height = 60
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label4: TLabel
        Left = 20
        Top = 3
        Width = 100
        Height = 13
        Caption = 'Nome do Modelo:'
      end
      object dbedlayoutbloq: TwwDBEdit
        Left = 20
        Top = 17
        Width = 389
        Height = 21
        DataField = 'LAYOUT'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object CkbFonteReduzida: TDBCheckBox
        Left = 21
        Top = 41
        Width = 225
        Height = 17
        Caption = 'Imprime com fonte condensada'
        DataField = 'FLGIMPCONDENSADO'
        DataSource = ds
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object LbldocEscluidos: TPanel
      Left = 1
      Top = 61
      Width = 434
      Height = 30
      Align = alTop
      BevelInner = bvLowered
      BevelWidth = 2
      Caption = 'Configuração'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 1
    end
    object wwDBGrid1: TwwDBGrid
      Left = 1
      Top = 91
      Width = 434
      Height = 275
      Selected.Strings = (
        'DESCCAMPO'#9'27'#9'Campo'
        'LINHABLOQUETO'#9'10'#9'Linha'
        'COLUNABLOQUETO'#9'10'#9'Coluna')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsDet
      KeyOptions = []
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = wwDBGrid1CalcCellColors
      IndicatorColor = icBlack
    end
  end
  inherited Dock972: TDock97
    Width = 436
    inherited Toolbar971: TToolbar97
      object BtnTestaImpressao: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Imprime'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
          8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
          0000888800880007700888888F778F7778F778FF000088008800877007700888
          778F7787F778F778000080880088877770077087FF778887F88778F700008700
          888887777770008777888887FF888777000080888888F77777777087F8888F77
          78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
          87777087FF778888888778F7000087FF88899888888770877788888888888777
          000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
          778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
          88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
          8F888F77000088888888887FFF7788888888888878FF77880000888888888887
          7788888888888888877788880000888888888888888888888888888888888888
          0000}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = BtnTestaImpressaoClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 436
    inherited tb97Fundo: TToolbar97
      Left = 264
      DockPos = 267
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 95
      DockPos = 98
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 146
    Top = 71
  end
  inherited ds: TwwDataSource
    Left = 245
    Top = 152
  end
  inherited ImlPadrao: TImageList
    Left = 304
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 358
    Top = 18
  end
  inherited Cds: TCMClientDataSet
    Left = 316
    Top = 15
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'TEMPLBLOQCHEQUE.LAYOUT')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Modelo')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TEMPLBLOQCHEQUE')
    CamposChave.Strings = (
      'TEMPLBLOQCHEQUE.CODBLOQCHE')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 293
    Top = 152
  end
  object dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 114
    Top = 221
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 76
    Top = 223
  end
end
