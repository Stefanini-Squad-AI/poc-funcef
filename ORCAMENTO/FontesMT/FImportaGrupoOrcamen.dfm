object FImportacaoGrupoOrcamen: TFImportacaoGrupoOrcamen
  Left = 248
  Top = 162
  Width = 618
  Height = 486
  Caption = 'Importação de Grupos Orçamentários'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_Top: TPanel
    Left = 0
    Top = 0
    Width = 610
    Height = 169
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lblTitulo: TfcLabel
      Left = 0
      Top = 0
      Width = 610
      Height = 24
      Align = alTop
      Caption = 'Importação de Grupos Orçamentários via planilha Excel ®'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
    end
    object lblCaminho: TLabel
      Left = 10
      Top = 68
      Width = 170
      Height = 13
      Caption = 'Caminho completo da planilha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object gProgresso: TGauge
      Left = 8
      Top = 136
      Width = 481
      Height = 20
      ForeColor = clNavy
      Progress = 0
    end
    object lblStatus_Progresso: TLabel
      Left = 8
      Top = 120
      Width = 123
      Height = 13
      Caption = 'Pronto para começar.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCaminho: TEdit
      Left = 10
      Top = 84
      Width = 415
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object btnAbrir: TBitBtn
      Left = 433
      Top = 82
      Width = 27
      Height = 23
      Hint = 'Selecionar arquivo excel.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnAbrirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        555555555555555555555555555555555555555FFFFFFFFFF555550000000000
        55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
        B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
        000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
        555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
        55555575FFF75555555555700007555555555557777555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
    end
    object BtnExcelparaCds: TBitBtn
      Left = 465
      Top = 82
      Width = 27
      Height = 23
      Hint = 'Obter dados do arquivo excel.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BtnExcelparaCdsClick
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
  object pgcImporta: TPageControl
    Left = 0
    Top = 169
    Width = 610
    Height = 290
    ActivePage = ts1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    object ts1: TTabSheet
      Caption = 'Layout do Excel'
      ImageIndex = 2
      object mmoLayout: TMemo
        Left = 0
        Top = 0
        Width = 602
        Height = 259
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Lines.Strings = (
          ''
          '   COLUNA           CAMPO'
          '   ------------     --------------------------------------'
          '   A '#9'          Nome do Plano Orçamentário'
          '   B '#9'          Código do Grupo Orçamentário'
          '   C '#9'          Descrição do Grupo Orçamentário'
          
            '   D '#9'          Flag identificando se o grupo é “Analítico” ou “' +
            'Sintético”'
          
            '   E '#9'          Flag identificando se o sinal do grupo é “Positi' +
            'vo” ou “Negativo”;'
          
            '   F '#9'          Flag identificando se o grupo é um grupo de “Res' +
            'ultado”;'
          '   G'#9'          Fórmula de apuração utilizada pelo grupo;'
          ''
          '* Primeira Linha deverá conter o nome da coluna')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object tsGrade: TTabSheet
      Caption = 'Dados Excel'
      ImageIndex = 2
      object dbgrd1: TDBGrid
        Left = 0
        Top = 0
        Width = 602
        Height = 259
        Align = alClient
        DataSource = ds_Excel
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object ts_Log: TTabSheet
      Caption = 'Importação'
      object Label1: TLabel
        Left = 0
        Top = 44
        Width = 22
        Height = 13
        Align = alBottom
        Caption = 'Log'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnPararImportacao: TBitBtn
        Left = 4
        Top = 1
        Width = 168
        Height = 27
        Caption = 'Parar Importação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = False
        OnClick = btnPararImportacaoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
      object btnComecaImportacao: TBitBtn
        Left = 4
        Top = 2
        Width = 168
        Height = 27
        Caption = 'Começar Importação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnComecaImportacaoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
          333333333333337FF3333333333333903333333333333377FF33333333333399
          03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
          99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
          99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
          03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
          33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
          33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
          3333777777333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
      object btnSalvaLog: TBitBtn
        Left = 177
        Top = 2
        Width = 168
        Height = 27
        Caption = 'Salvar Log'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnSalvaLogClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
          0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
          00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
          00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
          F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
          F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
          FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
          0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
          00337777FFFF77FF7733EEEE0000000003337777777777777333}
        NumGlyphs = 2
      end
      object mmoLog: TMemo
        Left = 0
        Top = 57
        Width = 602
        Height = 202
        Align = alBottom
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 3
      end
    end
  end
  object ds_Excel: TDataSource
    DataSet = cds_Excel
    Left = 76
    Top = 300
  end
  object cds_Excel: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 208
    object cds_ExcelLINHA_EXCEL: TIntegerField
      DisplayLabel = 'Linha Excel'
      FieldName = 'LINHA_EXCEL'
    end
    object cds_ExcelPLANO_ORCAMENTARIO: TStringField
      FieldName = 'PLANO_ORCAMENTARIO'
      Size = 50
    end
    object cds_ExcelCODIGO_GRUPO: TStringField
      FieldName = 'CODIGO_GRUPO'
      Size = 50
    end
    object cds_ExcelDESCRICAO_GRUPO: TStringField
      FieldName = 'DESCRICAO_GRUPO'
      Size = 100
    end
    object cds_ExcelFLAG_ANALITICO_SINTETICO: TStringField
      FieldName = 'FLAG_ANALITICO_SINTETICO'
      Size = 1
    end
    object cds_ExcelFLAG_POSITIVO_NEGATIVO: TStringField
      FieldName = 'FLAG_POSITIVO_NEGATIVO'
      Size = 1
    end
    object cds_ExcelFLAG_RESULTADO: TStringField
      FieldName = 'FLAG_RESULTADO'
      Size = 1
    end
    object cds_ExcelID_FORMULA: TStringField
      FieldName = 'ID_FORMULA'
      Size = 5
    end
    object cds_ExcelIDPLANOORCAMEN: TIntegerField
      FieldName = 'IDPLANOORCAMEN'
    end
  end
  object dlgSave: TSaveDialog
    Filter = 'Arquivo txt (*.txt)|*.txt'
    Left = 252
    Top = 276
  end
  object dlgOpen: TOpenDialog
    Filter = 'Arquivo Excel (*.xls)|*.xls'
    Left = 248
    Top = 56
  end
end
