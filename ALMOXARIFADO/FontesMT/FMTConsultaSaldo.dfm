inherited FrmMTConsultaSaldo: TFrmMTConsultaSaldo
  Left = 100
  Top = 86
  HelpContext = 50070
  Caption = 'Consulta dos Saldos dos Produtos'
  ClientHeight = 400
  ClientWidth = 609
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 609
    Height = 361
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label2: TLabel
      Left = 160
      Top = 16
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label3: TLabel
      Left = 528
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Unidade'
    end
    object Label5: TLabel
      Left = 24
      Top = 64
      Width = 101
      Height = 13
      Caption = 'Grupo de Produto'
    end
    object Label6: TLabel
      Left = 456
      Top = 64
      Width = 100
      Height = 13
      Caption = 'Valor Ult. Compra'
    end
    object Label7: TLabel
      Left = 24
      Top = 112
      Width = 135
      Height = 13
      Caption = 'Fornecedor Ult. Compra'
    end
    object Label8: TLabel
      Left = 456
      Top = 112
      Width = 98
      Height = 13
      Caption = 'Data Ult. Compra'
    end
    object Label10: TLabel
      Left = 336
      Top = 64
      Width = 102
      Height = 13
      Caption = 'Qtde. Ult. Compra'
    end
    object edCodArt: TEdit
      Left = 24
      Top = 32
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
    object edDesc: TEdit
      Left = 160
      Top = 32
      Width = 353
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
    object edUn: TEdit
      Left = 528
      Top = 32
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
    object DBRealEdit1: TDBRealEdit
      Left = 456
      Top = 80
      Width = 129
      Height = 21
      Alignment = taRightJustify
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '      0,00')
      ParentFont = False
      TabOrder = 3
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'VALUNIT'
      DataSource = dsUltComp
    end
    object edForn: TDBEdit
      Left = 24
      Top = 128
      Width = 417
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'FORMECEDOR'
      DataSource = dsUltComp
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object edDate: TDBEdit
      Left = 456
      Top = 128
      Width = 129
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'DATAULTCOMP'
      DataSource = dsUltComp
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object DBRealEdit2: TDBRealEdit
      Left = 336
      Top = 80
      Width = 105
      Height = 21
      Alignment = taRightJustify
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '      0,00')
      ParentFont = False
      TabOrder = 6
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'QTDE'
      DataSource = dsUltComp
    end
    object edGrp: TEdit
      Left = 24
      Top = 80
      Width = 297
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
      TabOrder = 7
    end
    object Panel1: TPanel
      Left = 5
      Top = 164
      Width = 599
      Height = 192
      Align = alBottom
      BevelOuter = bvNone
      Caption = '`'
      TabOrder = 8
      object GrdEtapa: TwwDBGrid
        Left = 0
        Top = 28
        Width = 599
        Height = 144
        Selected.Strings = (
          'DESCALMOX'#9'44'#9'Almoxarifado'#9'F'
          'SALDOQTDE'#9'13'#9'Saldo~Quantidade'
          'CUSTOMEDIO'#9'10'#9'Custo~Médio'
          'VALOREST'#9'13'#9'Valor')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        BorderStyle = bsNone
        DataSource = ds
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 599
        Height = 28
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Saldo nos Almoxarifados'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object plntot: TPanel
        Left = 0
        Top = 172
        Width = 599
        Height = 20
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 2
        object Label9: TLabel
          Left = 264
          Top = 5
          Width = 49
          Height = 13
          Caption = 'TOTAL :'
        end
        object LbTotSaldo: TLabel
          Left = 336
          Top = 5
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'LbTotSaldo'
        end
        object LbTotVal: TLabel
          Left = 511
          Top = 5
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'LbTotSaldo'
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 361
    Width = 609
    inherited tb97Fundo: TToolbar97
      Left = 346
      DockPos = 501
      inherited sep1: TToolbarSep97
        Left = 95
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 177
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 97
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 179
        HelpContext = 50070
      end
      object BtnSel: TBitBtn
        Left = 0
        Top = 0
        Width = 95
        Height = 33
        Caption = 'S&elecionar'
        TabOrder = 2
        OnClick = BtnSelClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 795
    Top = 65523
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object dsUltComp: TwwDataSource
    AutoEdit = False
    DataSet = cdsUltComp
    Left = 389
    Top = 236
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = cds
    Left = 469
    Top = 236
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
      'GRUPPROD.DESCGRUPOPROD'
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
    Left = 551
    Top = 197
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 469
    Top = 188
  end
  object cdsUltComp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 389
    Top = 188
  end
end
