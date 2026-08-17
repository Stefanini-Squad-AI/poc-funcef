inherited FrmViewUltComp: TFrmViewUltComp
  Left = 90
  Top = 122
  Caption = 'Visualiza Ultimas Compras'
  ClientHeight = 356
  ClientWidth = 633
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 633
    Height = 317
    object Label1: TLabel
      Left = 16
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
      Left = 536
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Unidade'
    end
    object plnUltComp: TPanel
      Left = 5
      Top = 64
      Width = 623
      Height = 248
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 623
        Height = 30
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Últimas Compras'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object GrdUltComp: TwwDBGrid
        Tag = 99
        Left = 0
        Top = 30
        Width = 623
        Height = 218
        Selected.Strings = (
          'VLRUNITARIO'#9'10'#9'Valor Unitário'
          'VALUNEST'#9'10'#9'Valor Estoque'
          'CODMEDIDA'#9'4'#9'Unidade'
          'QTDERECEBDEVOL'#9'10'#9'Quantidade'
          'DATAENTDEVOL'#9'10'#9'Data'
          'RAZAOSOCIAL'#9'60'#9'Fornecedor')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsUltComp
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object edDesc: TEdit
      Left = 160
      Top = 32
      Width = 361
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
      Left = 536
      Top = 32
      Width = 81
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
    object edCodArt: TEdit
      Left = 16
      Top = 32
      Width = 129
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
      TabOrder = 3
    end
  end
  inherited Dock971: TDock97
    Top = 317
    Width = 633
    inherited tb97Fundo: TToolbar97
      Left = 366
      DockPos = 366
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
    Left = 779
    Top = 65531
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryUltComp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   P.RAZAOSOCIAL, '
      '   NF.DATAENTDEVOL,'
      '   I.QTDERECEBDEVOL,'
      '   (I.VLRESTOQUE/I.QTDERECEBDEVOL) AS VALUNEST,'
      '   I.VLRUNITARIO,'
      '   I.CODMEDIDA'
      'FROM '
      '   PESSOA P,'
      '   ITENSRECEBDEVOL I,'
      '   NFRECEBDEVOL NF'
      'WHERE '
      '      (I.CODARTIGO = :CODARTIGO)'
      '  AND (NF.FLGTIPONOTA = '#39'R'#39')'
      '  AND (NF.IDNFRECEBDEVOL = I.IDNFRECEBDEVOL)'
      '  AND (NF.IDFORCLI = P.IDPESSOA) '
      'ORDER BY NF.DATAENTDEVOL DESC'
      '')
    ValidateWithMask = True
    Left = 176
    Top = 311
    ParamData = <
      item
        DataType = ftString
        Name = 'CODARTIGO'
        ParamType = ptUnknown
      end>
    object qryUltCompVLRUNITARIO: TFloatField
      DisplayLabel = 'Valor Unitário'
      DisplayWidth = 10
      FieldName = 'VLRUNITARIO'
      Origin = 'ITENSRECEBDEVOL.VLRUNITARIO'
      DisplayFormat = '#,##0.00'
    end
    object qryUltCompVALUNEST: TFloatField
      DisplayLabel = 'Valor Estoque'
      DisplayWidth = 10
      FieldName = 'VALUNEST'
      Origin = 'ITENSRECEBDEVOL.VLRESTOQUE'
      DisplayFormat = '#,##0.00'
    end
    object qryUltCompCODMEDIDA: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      Origin = 'ITENSRECEBDEVOL.CODMEDIDA'
      Size = 4
    end
    object qryUltCompQTDERECEBDEVOL: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QTDERECEBDEVOL'
      Origin = 'ITENSRECEBDEVOL.QTDERECEBDEVOL'
      DisplayFormat = '#,####0.0000'
    end
    object qryUltCompDATAENTDEVOL: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAENTDEVOL'
      Origin = 'NFRECEBDEVOL.DATAENTDEVOL'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryUltCompRAZAOSOCIAL: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 60
      FieldName = 'RAZAOSOCIAL'
      Origin = '"CM.PESSOA".RAZAOSOCIAL'
      Size = 60
    end
  end
  object dsUltComp: TwwDataSource
    DataSet = qryUltComp
    Left = 240
    Top = 311
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
    Left = 103
    Top = 309
  end
end
