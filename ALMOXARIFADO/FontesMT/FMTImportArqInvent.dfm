inherited FrmMTImportArqInvent: TFrmMTImportArqInvent
  Left = 29
  Top = 142
  Caption = 'Importação de Arquivo de Inventário'
  ClientHeight = 314
  ClientWidth = 720
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 720
    Height = 275
    object Panel2: TPanel
      Left = 5
      Top = 5
      Width = 710
      Height = 55
      Align = alTop
      BevelOuter = bvNone
      BevelWidth = 2
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object lbInvent: TLabel
        Left = 96
        Top = 32
        Width = 94
        Height = 13
        Caption = 'Nº do Inventário'
      end
      object lbAlmox: TLabel
        Left = 96
        Top = 8
        Width = 73
        Height = 13
        Caption = 'Almoxarifado'
      end
      object btnProcurar: TBitBtn
        Left = 5
        Top = 5
        Width = 68
        Height = 44
        Caption = '&Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnProcurarClick
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
        Layout = blGlyphTop
        NumGlyphs = 2
      end
    end
    object grdinvent: TwwDBGrid
      Left = 5
      Top = 60
      Width = 710
      Height = 210
      Selected.Strings = (
        'CODARTIGO'#9'14'#9'Código'
        'DESCRICAO'#9'50'#9'Descrição'
        'QTDECONTADA'#9'10'#9'Quantidade'
        'CODMEDIDA'#9'8'#9'Unid.'#9'F'
        'CUSTOMEDIO'#9'10'#9'Custo Médio'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      BorderStyle = bsNone
      Color = clWhite
      DataSource = dsInvent
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = True
      UseTFields = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 275
    Width = 720
    inherited tb97Fundo: TToolbar97
      Left = 455
      DockPos = 541
      inherited sep1: TToolbarSep97
        Left = 97
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 179
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 99
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 181
      end
      object btnImportar: TBitBtn
        Left = 0
        Top = 0
        Width = 97
        Height = 33
        Caption = '&Importar'
        TabOrder = 2
        OnClick = btnImportarClick
        Glyph.Data = {
          36010000424D3601000000000000760000002800000018000000100000000100
          040000000000C0000000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777008777777777777777777780EE087777777777777777780EEEE08777777
          77777777780EEEEEE08777777777777770EEEEEEEE087788888888777000EEEE
          000870000000000877770EE0877700B7B7B7B7B087770EE087770F0B7B7B7B7B
          08770EE087770BF0B7B7B7B7B0880EE087770FBF000000000000EEE087770BFB
          FBFBFB0EEEEEEEE077770FBFBFBFBF0EEEEEEE0777770BFBFBF0007000000077
          777770BFBF077777777777777777780000877777777777777777}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65523
  end
  object cdsInvent: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 136
  end
  object dsInvent: TwwDataSource
    AutoEdit = False
    DataSet = cdsInvent
    Left = 520
    Top = 88
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'INVENTAR.IDINVENTARIO'
      'INVENTAR.DATAINVENTARIO'
      'INVENTAR.CODGRUPOPROD'
      'GRUPPROD.DESCGRUPOPROD')
    TipodeDado.Strings = (
      'N'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Num. Inventário'
      'Data Inventário'
      'Código do Grupo'
      'Descrição do Grupo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INVENTAR'
      'GRUPPROD')
    CamposChave.Strings = (
      'INVENTAR.IDINVENTARIO')
    Filtro.Strings = (
      'GRUPPROD.CODGRUPOPROD(+) = INVENTAR.CODGRUPOPROD')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 303
    Top = 6
  end
  object Dlg: TOpenDialog
    DefaultExt = '*.txt'
    FileName = 'Invent.txt'
    Title = 'Abrir Arquivio para importação'
    Left = 520
    Top = 40
  end
end
