inherited frmGeraTabuaServico: TfrmGeraTabuaServico
  Left = 243
  Top = 151
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Gerar Tabela de Comutação'
  ClientHeight = 264
  ClientWidth = 497
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 497
    Height = 224
    object Label8: TLabel
      Left = 51
      Top = 17
      Width = 125
      Height = 13
      Caption = 'Tábua de Mortalidade'
    end
    object Label1: TLabel
      Left = 51
      Top = 63
      Width = 110
      Height = 13
      Caption = 'Tábua de Invalidez'
    end
    object Label2: TLabel
      Left = 51
      Top = 107
      Width = 178
      Height = 13
      Caption = 'Tábua de Entrada em Invalidez'
    end
    object GroupBox2: TGroupBox
      Left = 102
      Top = 160
      Width = 379
      Height = 49
      Caption = 'Intervalo de Idades para o Cálculo da Tabela de Comutação'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label4: TLabel
        Left = 19
        Top = 24
        Width = 82
        Height = 13
        Alignment = taRightJustify
        Caption = 'Idade Mínima:'
      end
      object Label5: TLabel
        Left = 149
        Top = 24
        Width = 83
        Height = 13
        Alignment = taRightJustify
        Caption = 'Idade Máxima:'
      end
      object EdtIdadeMinima: TEdit
        Left = 104
        Top = 21
        Width = 37
        Height = 21
        Hint = 'Idade mínima para considera a tábua de invalidez'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = '18'
        OnChange = EdtIdadeMinimaChange
      end
      object EdtIdadeMaxima: TEdit
        Left = 235
        Top = 21
        Width = 37
        Height = 21
        Hint = 'Idade máxima para considerar a tábua de invalidez'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Text = '70'
        OnChange = EdtIdadeMaximaChange
      end
    end
    object GroupBox1: TGroupBox
      Left = 17
      Top = 160
      Width = 77
      Height = 49
      Caption = 'Juros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Editfator: TEdit
        Left = 15
        Top = 21
        Width = 48
        Height = 21
        Hint = 'Juros utilizados para cálculo da tabela de comutação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        Text = '0,06'
        OnChange = EditfatorChange
      end
    end
    object DBCmbBxTabuaGeral: TDBLookupComboBox
      Left = 51
      Top = 32
      Width = 384
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'CD_TABUA'
      ListField = 'DS_TABUA'
      ListSource = DsTabMorte
      ParentFont = False
      TabOrder = 2
      OnCloseUp = DBCmbBxTabuaGeralCloseUp
    end
    object DBCmbBxTabuaInvalidez: TDBLookupComboBox
      Left = 51
      Top = 78
      Width = 384
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'CD_TABUA'
      ListField = 'DS_TABUA'
      ListSource = DsTabInvalidez
      ParentFont = False
      TabOrder = 3
      OnCloseUp = DBCmbBxTabuaInvalidezCloseUp
    end
    object DBCmbBxTabuaEntradaInv: TDBLookupComboBox
      Left = 51
      Top = 122
      Width = 384
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'CD_TABUA'
      ListField = 'DS_TABUA'
      ListSource = DsTabEntrInvalidez
      ParentFont = False
      TabOrder = 4
      OnCloseUp = DBCmbBxTabuaEntradaInvCloseUp
    end
  end
  inherited Dock971: TDock97
    Top = 224
    Width = 497
    Height = 40
    inherited tb97Fundo: TToolbar97
      Left = 331
      DockPos = 331
    end
    object Toolbar971: TToolbar97
      Left = 63
      Top = 0
      Caption = 'tb97Fundo'
      Color = clNone
      CloseButton = False
      DefaultDock = Dock971
      DockPos = 63
      TabOrder = 1
      object ToolbarSep972: TToolbarSep97
        Left = 186
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object ToolbarSep971: TToolbarSep97
        Left = 181
        Top = 0
        Blank = True
        SizeHorz = 5
      end
      object bbtnGera: TSpeedButton
        Left = 0
        Top = 0
        Width = 181
        Height = 34
        Caption = 'Gera Tabela Comutação'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        OnClick = SpeedButton1Click
      end
      object bbtnApaga: TBitBtn
        Left = 189
        Top = 0
        Width = 75
        Height = 33
        Hint = 'Limpa condição'
        Caption = '&Limpar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bbtnApagaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 464
    Top = 5
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object DsTabMorte: TDataSource
    DataSet = QryTabMorte
    Left = 282
    Top = 32
  end
  object QryTabMorte: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select a.CD_TABUA, a.DS_TABUA'
      'from FI_TABUA a, FI_TIPO_TABUA b'
      'where a.CD_TIPO_TABUA = b.CD_TIPO_TABUA'
      '      and b.IR_DOMINIO_SISTEMA = '#39'MRT'#39
      'order by a.DS_TABUA')
    Left = 314
    Top = 32
    object QryTabMorteCD_TABUA: TFloatField
      FieldName = 'CD_TABUA'
      Origin = 'FI_TABUA.CD_TABUA'
    end
    object QryTabMorteDS_TABUA: TStringField
      FieldName = 'DS_TABUA'
      Origin = 'FI_TABUA.DS_TABUA'
      Size = 50
    end
  end
  object DsTabInvalidez: TDataSource
    DataSet = QryTabInvalidez
    Left = 285
    Top = 73
  end
  object QryTabInvalidez: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select a.CD_TABUA, a.DS_TABUA'
      'from FI_TABUA a, FI_TIPO_TABUA b'
      'where a.CD_TIPO_TABUA = b.CD_TIPO_TABUA'
      '      and b.IR_DOMINIO_SISTEMA = '#39'INV'#39
      'order by a.DS_TABUA')
    Left = 317
    Top = 74
    object QryTabInvalidezCD_TABUA: TFloatField
      FieldName = 'CD_TABUA'
      Origin = 'FI_TABUA.CD_TABUA'
    end
    object QryTabInvalidezDS_TABUA: TStringField
      FieldName = 'DS_TABUA'
      Origin = 'FI_TABUA.DS_TABUA'
      Size = 50
    end
  end
  object DsTabEntrInvalidez: TDataSource
    DataSet = QryTabEntrInvalidez
    Left = 285
    Top = 118
  end
  object QryTabEntrInvalidez: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select a.CD_TABUA, a.DS_TABUA'
      'from FI_TABUA a, FI_TIPO_TABUA b'
      'where a.CD_TIPO_TABUA = b.CD_TIPO_TABUA'
      '      and b.IR_DOMINIO_SISTEMA = '#39'EIN'#39
      'order by a.DS_TABUA')
    Left = 316
    Top = 118
    object QryTabEntrInvalidezCD_TABUA: TFloatField
      FieldName = 'CD_TABUA'
      Origin = 'FI_TABUA.CD_TABUA'
    end
    object QryTabEntrInvalidezDS_TABUA: TStringField
      FieldName = 'DS_TABUA'
      Origin = 'FI_TABUA.DS_TABUA'
      Size = 50
    end
  end
end
