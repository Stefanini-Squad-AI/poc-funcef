inherited FrmApagaProdMov: TFrmApagaProdMov
  Left = 91
  Top = 137
  Caption = 'Exclusão de Produtos Já Movimentados'
  ClientHeight = 316
  ClientWidth = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 600
    Height = 277
    Font.Height = -11
    ParentFont = False
    object btnSelOrigem: TSpeedButton
      Left = 552
      Top = 32
      Width = 23
      Height = 81
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
      OnClick = btnSelOrigemClick
    end
    object btnSelDestino: TSpeedButton
      Left = 552
      Top = 136
      Width = 23
      Height = 81
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
      OnClick = btnSelDestinoClick
    end
    object lbProcess: TLabel
      Left = 24
      Top = 232
      Width = 86
      Height = 13
      Caption = 'Processando...'
      Visible = False
    end
    object GrpOrigem: TGroupBox
      Left = 24
      Top = 24
      Width = 529
      Height = 89
      Caption = '  Artigo de Origem  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 24
        Top = 32
        Width = 40
        Height = 13
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 160
        Top = 32
        Width = 58
        Height = 13
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 449
        Top = 32
        Width = 48
        Height = 13
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edCodOrigem: TEdit
        Left = 24
        Top = 48
        Width = 121
        Height = 21
        TabStop = False
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edDescOrigem: TEdit
        Left = 160
        Top = 48
        Width = 273
        Height = 21
        TabStop = False
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edUnOrigem: TEdit
        Left = 448
        Top = 48
        Width = 57
        Height = 21
        TabStop = False
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    object GrpDestino: TGroupBox
      Left = 24
      Top = 128
      Width = 529
      Height = 89
      Caption = '  Artigo de Destino  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label4: TLabel
        Left = 24
        Top = 32
        Width = 40
        Height = 13
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 160
        Top = 32
        Width = 58
        Height = 13
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 449
        Top = 32
        Width = 48
        Height = 13
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edCodDestino: TEdit
        Left = 24
        Top = 48
        Width = 121
        Height = 21
        TabStop = False
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edDescDestino: TEdit
        Left = 160
        Top = 48
        Width = 273
        Height = 21
        TabStop = False
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edUnDestino: TEdit
        Left = 448
        Top = 48
        Width = 57
        Height = 21
        TabStop = False
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    object pgBar: TProgressBar
      Left = 24
      Top = 248
      Width = 545
      Height = 16
      Min = 0
      Max = 100
      TabOrder = 2
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 277
    Width = 600
    inherited tb97Fundo: TToolbar97
      Left = 352
      DockPos = 477
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 162
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
      object btnExecutar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Executar'
        TabOrder = 2
        OnClick = btnExecutarClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888088888888888888800888888888888880B0888888888888880B088
          8888888800000B088888888880BBBBB08888888880BBB00008888888880BBB08
          88888880000BFBF088888880BFBFB000088888880BFBF088888888880FBFBF08
          8888888880FBFBF0888888888000000088888888888888888888}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 755
    Top = 3
  end
  object qryTabela: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TABLE_NAME, COLUMN_NAME'
      'FROM ALL_TAB_COLUMNS'
      'WHERE'
      '      (DATA_TYPE = '#39'CHAR'#39')'
      '  AND (DATA_LENGTH =14)'
      '  AND (COLUMN_NAME LIKE '#39'COD%'#39')'
      '  AND (TABLE_NAME <> '#39'ARTIGO'#39')'
      '  AND (TABLE_NAME <> '#39'CUSTOMED'#39')'
      '  AND (TABLE_NAME <> '#39'SALDO'#39')'
      '  AND (SUBSTR(TABLE_NAME,1,2) <> '#39'VW'#39')'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 288
    Top = 8
    object qryTabelaTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Origin = 'BASEDADOS.ALL_TAB_COLUMNS.TABLE_NAME'
      Size = 30
    end
    object qryTabelaCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Origin = 'BASEDADOS.ALL_TAB_COLUMNS.COLUMN_NAME'
      Size = 30
    end
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PRODUTO.CODPRODUTO'
      'PRODUTO.DESCPROD'
      'PRODUTO.CODGRUPOPROD'
      'GRUPPROD.DESCGRUPOPROD')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código do Produto'
      'Descrição do Produto'
      'Código do Grupo'
      'Descrição do Grupo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PRODUTO'
      'GRUPPROD'
      'ARTIGO')
    CamposChave.Strings = (
      'ARTIGO.CODARTIGO'
      'PRODUTO.DESCPROD'
      'PRODUTO.CODMEDCUSTO')
    Filtro.Strings = (
      'PRODUTO.CODGRUPOPROD = GRUPPROD.CODGRUPOPROD'
      'PRODUTO.CODPRODUTO = ARTIGO.CODARTIGO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '6'
      '10'
      '4'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 399
    Top = 5
  end
  object qryAlmox: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALMOXARIFADO '
      'FROM ALMOX'
      'WHERE (IDPESSOA = :pIDPESSOA)')
    ValidateWithMask = True
    Left = 288
    Top = 58
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    CODARTIGO,'
      '    CODALMOXARIFADO,'
      '    SUM(SALDOQTDE) AS SALDO'
      'FROM SALDO'
      'WHERE (CODARTIGO = :CODARTIGO)'
      'GROUP BY CODARTIGO, CODALMOXARIFADO')
    ValidateWithMask = True
    Left = 384
    Top = 66
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODARTIGO'
        ParamType = ptUnknown
      end>
  end
  object qryChaveTab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    SUBSTR(C.TABLE_NAME,   1, 30) TABELA,'
      '    SUBSTR(CC.COLUMN_NAME, 1, 30) CHAVE,'
      '    CC.POSITION'
      'FROM USER_CONSTRAINTS C,'
      '     USER_CONS_COLUMNS CC'
      'WHERE (RTRIM(C.TABLE_NAME) = :TABELA)'
      '  AND (C.CONSTRAINT_TYPE = '#39'P'#39')'
      '  AND (C.CONSTRAINT_NAME = CC.CONSTRAINT_NAME)'
      'ORDER BY CC.POSITION'
      ' ')
    ValidateWithMask = True
    Left = 464
    Top = 50
    ParamData = <
      item
        DataType = ftString
        Name = 'TABELA'
        ParamType = ptInput
      end>
    object qryChaveTabTABELA: TStringField
      FieldName = 'TABELA'
      Size = 30
    end
    object qryChaveTabCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 30
    end
    object qryChaveTabPOSITION: TFloatField
      FieldName = 'POSITION'
    end
  end
end
