inherited frmExecImportacao: TfrmExecImportacao
  Left = 57
  HelpContext = 4390003
  Caption = 'Importação de Indicadores'
  ClientHeight = 336
  ClientWidth = 714
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 714
    Height = 297
    inherited PagControle: TPageControl
      Width = 712
      Height = 295
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 704
          Caption = 'Importação de Indicadores [ Seleção Arquivo ]'
        end
        object Label8: TLabel
          Left = 8
          Top = 60
          Width = 140
          Height = 13
          Caption = 'Arquivo para Importação'
        end
        object Label1: TLabel
          Left = 10
          Top = 120
          Width = 54
          Height = 13
          Caption = 'Shopping'
        end
        object Label2: TLabel
          Left = 10
          Top = 184
          Width = 54
          Height = 13
          Caption = 'Registros'
        end
        object edtArqImporta: TEdit
          Left = 8
          Top = 76
          Width = 497
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object edtImovel: TEdit
          Left = 9
          Top = 135
          Width = 520
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
        object edtRegistros: TEdit
          Left = 9
          Top = 199
          Width = 72
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 2
        end
        object btnBuscaArq: TBitBtn
          Left = 504
          Top = 75
          Width = 25
          Height = 22
          Hint = 'Seleciona o arquivo para gravação do log de exceções.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btnBuscaArqClick
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
        object btnBuscaArqx: TBitBtn
          Left = 656
          Top = 83
          Width = 24
          Height = 22
          Hint = 'Busca um Arquivo para Importação'
          TabOrder = 4
          Visible = False
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
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 558
          Caption = 'Importação de Indicadores [ Indicadores Processados ]'
        end
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 24
          Width = 696
          Height = 253
          Selected.Strings = (
            'DSC_CONTRATO'#9'37'#9'Contrato'
            'DSC_INDICADOR'#9'30'#9'Indicador'
            'MESCOMPETENCIA'#9'5'#9'Mês'
            'ANOCOMPETENCIA'#9'7'#9'Ano'
            'VLRAPURACAONUM'#9'12'#9'Valor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsApuracao
          TabOrder = 0
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
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 2
        TabVisible = False
        object fcLabel2: TfcLabel
          Left = 0
          Top = 0
          Width = 445
          Height = 24
          Align = alTop
          Caption = 'Importação de Indicadores [ Log Exceções ]'
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
        object lstLogExcecao: TListBox
          Left = 0
          Top = 24
          Width = 696
          Height = 225
          Align = alTop
          ItemHeight = 13
          TabOrder = 0
        end
        object edtLogExcecao: TEdit
          Left = 0
          Top = 256
          Width = 649
          Height = 21
          Enabled = False
          TabOrder = 1
        end
        object btnLogArq: TBitBtn
          Left = 648
          Top = 256
          Width = 25
          Height = 22
          Hint = 'Seleciona o arquivo para gravação do log de exceções.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnLogArqClick
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
        object btnLimpaLogArq: TBitBtn
          Left = 672
          Top = 256
          Width = 23
          Height = 22
          Hint = 'Apaga o arquivo de log de exceções'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btnLimpaLogArqClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888888888888FF8888888888888778888888888888F77F8888888888800F0888
            88888888F7787F88888888800FFF0888888888F7788878F88888800FFF8FF088
            888887788888F7F8888887FF888FF088888887F88888878F888887FF8888FF08
            8888878F88888F7F8888887F88888F088888887F88888878F888887FF8800FF0
            88888878F88778F78F888887FF0910FF08888887F87F878878F88887FF09910F
            F08888878F7F8878F78888887FF090307888888878F7F7F77F88888887FF0BB3
            08888888878F7F8878F88888887770BB30888888887777F8878F88888888880B
            B30888888888887F887888888888888888888888888888888888}
          NumGlyphs = 2
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'TabSheet3'
        ImageIndex = 3
        TabVisible = False
        object fcLabel3: TfcLabel
          Left = 0
          Top = 0
          Width = 486
          Height = 24
          Align = alTop
          Caption = 'Importação de Indicadores [ Arquivo Exceções ]'
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
        object lstArquivoExcecao: TListBox
          Left = 0
          Top = 24
          Width = 696
          Height = 225
          Align = alTop
          ItemHeight = 13
          TabOrder = 0
        end
        object edtArquivoExcecao: TEdit
          Left = 0
          Top = 256
          Width = 649
          Height = 21
          Enabled = False
          TabOrder = 1
        end
        object btnArquivoExcecao: TBitBtn
          Left = 648
          Top = 255
          Width = 24
          Height = 22
          Hint = 'Seleciona o arquivo para gravação do arquivo de exceções.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnArquivoExcecaoClick
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
        object btnLimpaArquivoExcecao: TBitBtn
          Left = 672
          Top = 255
          Width = 23
          Height = 22
          Hint = 'Apaga o arquivo de exceções'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btnLimpaArquivoExcecaoClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888888888888FF8888888888888778888888888888F77F8888888888800F0888
            88888888F7787F88888888800FFF0888888888F7788878F88888800FFF8FF088
            888887788888F7F8888887FF888FF088888887F88888878F888887FF8888FF08
            8888878F88888F7F8888887F88888F088888887F88888878F888887FF8800FF0
            88888878F88778F78F888887FF0910FF08888887F87F878878F88887FF09910F
            F08888878F7F8878F78888887FF090307888888878F7F7F77F88888887FF0BB3
            08888888878F7F8878F88888887770BB30888888887777F8878F88888888880B
            B30888888888887F887888888888888888888888888888888888}
          NumGlyphs = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 297
    Width = 714
    inherited tb97Fundo: TToolbar97
      Left = 297
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  object dlgImporta: TOpenDialog
    Filter = 'Arquivo Funcef ( *.prn )|*.prn|Arquivo Texto ( *.txt )|*.txt'
    Left = 425
    Top = 72
  end
  object CdsImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 265
    Top = 123
    object CdsImovelIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
  end
  object wwQuery1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   C.IDCONTRATO,      C.IDIMOVEL,       C.NUMCONTRATO,'
      '         C.NOMCONTRATO,     C.TIPOCONTRATO,   C.LOJAS,'
      '         C.VLRALUGMIN,      C.DATINICIO,      C.DATTERMINO,'
      '         C.PERALUGVARIAVEL, C.INDICEREAJUSTE, C.DATULTAUDITORIA,'
      '         C.IDATIVIDADE,     C.IDMARCA,        C.DATREAJUSTE,'
      '         C.DATPROXREAJUSTE, C.PERREAJUSTE,    C.DESCRICAO,'
      
        '         C.QTDEABL,         C.FLGSTATUS,      C.FLGINDETERMINADO' +
        ','
      
        '         C.NUMCONTRATO ||'#39#39' - '#39#39'|| C.NOMCONTRATO AS CONTRATO_EXT' +
        'ENSO'
      '  FROM   INDCONTRATOLOJA C'
      ' WHERE   1=2')
    ValidateWithMask = True
    Left = 481
    Top = 27
    object wwQuery1IDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.IDCONTRATO'
    end
    object wwQuery1IDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.IDIMOVEL'
    end
    object wwQuery1NUMCONTRATO: TStringField
      FieldName = 'NUMCONTRATO'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.NUMCONTRATO'
    end
    object wwQuery1NOMCONTRATO: TStringField
      FieldName = 'NOMCONTRATO'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.NOMCONTRATO'
      Size = 60
    end
    object wwQuery1TIPOCONTRATO: TStringField
      FieldName = 'TIPOCONTRATO'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.TIPOCONTRATO'
      FixedChar = True
      Size = 1
    end
    object wwQuery1LOJAS: TStringField
      FieldName = 'LOJAS'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.LOJAS'
    end
    object wwQuery1VLRALUGMIN: TFloatField
      FieldName = 'VLRALUGMIN'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.VLRALUGMIN'
    end
    object wwQuery1DATINICIO: TDateTimeField
      FieldName = 'DATINICIO'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.DATINICIO'
    end
    object wwQuery1DATTERMINO: TDateTimeField
      FieldName = 'DATTERMINO'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.DATTERMINO'
    end
    object wwQuery1PERALUGVARIAVEL: TFloatField
      FieldName = 'PERALUGVARIAVEL'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.PERALUGVARIAVEL'
    end
    object wwQuery1INDICEREAJUSTE: TFloatField
      FieldName = 'INDICEREAJUSTE'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.INDICEREAJUSTE'
    end
    object wwQuery1DATULTAUDITORIA: TDateTimeField
      FieldName = 'DATULTAUDITORIA'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.DATULTAUDITORIA'
    end
    object wwQuery1IDATIVIDADE: TFloatField
      FieldName = 'IDATIVIDADE'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.IDATIVIDADE'
    end
    object wwQuery1IDMARCA: TFloatField
      FieldName = 'IDMARCA'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.IDMARCA'
    end
    object wwQuery1DATREAJUSTE: TDateTimeField
      FieldName = 'DATREAJUSTE'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.DATREAJUSTE'
    end
    object wwQuery1DATPROXREAJUSTE: TDateTimeField
      FieldName = 'DATPROXREAJUSTE'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.DATPROXREAJUSTE'
    end
    object wwQuery1PERREAJUSTE: TFloatField
      FieldName = 'PERREAJUSTE'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.PERREAJUSTE'
    end
    object wwQuery1DESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.DESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object wwQuery1QTDEABL: TFloatField
      FieldName = 'QTDEABL'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.QTDEABL'
    end
    object wwQuery1FLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.FLGSTATUS'
      FixedChar = True
      Size = 1
    end
    object wwQuery1FLGINDETERMINADO: TStringField
      FieldName = 'FLGINDETERMINADO'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.FLGINDETERMINADO'
      FixedChar = True
      Size = 1
    end
    object wwQuery1CONTRATO_EXTENSO: TStringField
      FieldName = 'CONTRATO_EXTENSO'
      Origin = 'BASEDADOS.INDCONTRATOLOJA.NUMCONTRATO'
      Size = 100
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = wwQuery1
    Constraints = True
    Left = 537
    Top = 27
  end
  object CdsApuracao: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'Dsp'
    StoreDefs = True
    Left = 401
    Top = 123
    object CdsApuracaoDSC_CONTRATO: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 37
      FieldName = 'DSC_CONTRATO'
      Size = 83
    end
    object CdsApuracaoDSC_INDICADOR: TStringField
      DisplayLabel = 'Indicador'
      DisplayWidth = 30
      FieldName = 'DSC_INDICADOR'
      Size = 60
    end
    object CdsApuracaoMESCOMPETENCIA: TFloatField
      DisplayLabel = 'Mês'
      DisplayWidth = 5
      FieldName = 'MESCOMPETENCIA'
    end
    object CdsApuracaoANOCOMPETENCIA: TFloatField
      DisplayLabel = 'Ano'
      DisplayWidth = 7
      FieldName = 'ANOCOMPETENCIA'
    end
    object CdsApuracaoVLRAPURACAONUM: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 12
      FieldName = 'VLRAPURACAONUM'
    end
    object CdsApuracaoIDAPURACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDAPURACAO'
      Visible = False
    end
    object CdsApuracaoIDGRPAPURACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRPAPURACAO'
      Visible = False
    end
    object CdsApuracaoIDSUBGRPAPURACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSUBGRPAPURACAO'
      Visible = False
    end
    object CdsApuracaoIDCONTRATO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATO'
      Visible = False
    end
    object CdsApuracaoIDINDICADOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINDICADOR'
      Visible = False
    end
    object CdsApuracaoIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object CdsApuracaoDATAAPURACAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAAPURACAO'
      Visible = False
    end
    object CdsApuracaoTIPOLANCA: TStringField
      DisplayWidth = 1
      FieldName = 'TIPOLANCA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsApuracaoVLRAPURACAOSTR: TStringField
      DisplayWidth = 60
      FieldName = 'VLRAPURACAOSTR'
      Visible = False
      Size = 60
    end
    object CdsApuracaoVLRAPURACAODAT: TDateTimeField
      DisplayWidth = 18
      FieldName = 'VLRAPURACAODAT'
      Visible = False
    end
    object CdsApuracaoDATAINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAINCLUSAO'
      Visible = False
    end
    object CdsApuracaoTIPOINCLUSAO: TStringField
      DisplayWidth = 1
      FieldName = 'TIPOINCLUSAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsApuracaoTIPODADO: TStringField
      DisplayWidth = 1
      FieldName = 'TIPODADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsApuracaoFLGGRPAPURACAO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGGRPAPURACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsApuracaoFLGSUBGRPAPURACAO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGSUBGRPAPURACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsApuracaoFLGCONTRATO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCONTRATO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsApuracaoPERIODICIDADE: TStringField
      DisplayWidth = 1
      FieldName = 'PERIODICIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsApuracaoDSC_GRPAPURACAO: TStringField
      DisplayWidth = 60
      FieldName = 'DSC_GRPAPURACAO'
      Visible = False
      Size = 60
    end
    object CdsApuracaoDSC_SUBGRPAPURACAO: TStringField
      DisplayWidth = 60
      FieldName = 'DSC_SUBGRPAPURACAO'
      Visible = False
      Size = 60
    end
    object CdsApuracaoNOME_EXTENSO: TStringField
      DisplayWidth = 123
      FieldName = 'NOME_EXTENSO'
      Visible = False
      Size = 123
    end
  end
  object dsApuracao: TwwDataSource
    DataSet = CdsApuracao
    Left = 400
    Top = 232
  end
  object dlgSave: TSaveDialog
    DefaultExt = 'TXT'
    Filter = 'Arquivo Texto (*.txt)|*.TXT|Todos Arquivos |*.*'
    Left = 318
    Top = 246
  end
  object CdsIndicador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 513
    Top = 131
    object CdsIndicadorIDINDICADOR: TFloatField
      FieldName = 'IDINDICADOR'
    end
    object CdsIndicadorDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsIndicadorTIPODADO: TStringField
      FieldName = 'TIPODADO'
      FixedChar = True
      Size = 1
    end
    object CdsIndicadorTIPOVALOR: TStringField
      FieldName = 'TIPOVALOR'
      FixedChar = True
      Size = 1
    end
    object CdsIndicadorUNIDADE: TStringField
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 5
    end
    object CdsIndicadorFLGGRPAPURACAO: TStringField
      FieldName = 'FLGGRPAPURACAO'
      FixedChar = True
      Size = 1
    end
    object CdsIndicadorFLGSUBGRPAPURACAO: TStringField
      FieldName = 'FLGSUBGRPAPURACAO'
      FixedChar = True
      Size = 1
    end
    object CdsIndicadorFLGCONTRATO: TStringField
      FieldName = 'FLGCONTRATO'
      FixedChar = True
      Size = 1
    end
    object CdsIndicadorTIPOINDICADOR: TFloatField
      FieldName = 'TIPOINDICADOR'
    end
    object CdsIndicadorPERIODICIDADE: TStringField
      FieldName = 'PERIODICIDADE'
      FixedChar = True
      Size = 1
    end
    object CdsIndicadorNIVELVERIFICA: TFloatField
      FieldName = 'NIVELVERIFICA'
    end
  end
  object CdsContratoLoja: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 601
    Top = 131
    object CdsContratoLojaIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
    end
    object CdsContratoLojaIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object CdsContratoLojaNUMCONTRATO: TStringField
      FieldName = 'NUMCONTRATO'
    end
    object CdsContratoLojaNOMCONTRATO: TStringField
      FieldName = 'NOMCONTRATO'
      Size = 60
    end
    object CdsContratoLojaTIPOCONTRATO: TStringField
      FieldName = 'TIPOCONTRATO'
      FixedChar = True
      Size = 1
    end
    object CdsContratoLojaLOJAS: TStringField
      FieldName = 'LOJAS'
    end
    object CdsContratoLojaVLRALUGMIN: TFloatField
      FieldName = 'VLRALUGMIN'
    end
    object CdsContratoLojaDATINICIO: TDateTimeField
      FieldName = 'DATINICIO'
    end
    object CdsContratoLojaDATTERMINO: TDateTimeField
      FieldName = 'DATTERMINO'
    end
    object CdsContratoLojaPERALUGVARIAVEL: TFloatField
      FieldName = 'PERALUGVARIAVEL'
    end
    object CdsContratoLojaINDICEREAJUSTE: TFloatField
      FieldName = 'INDICEREAJUSTE'
    end
    object CdsContratoLojaDATULTAUDITORIA: TDateTimeField
      FieldName = 'DATULTAUDITORIA'
    end
    object CdsContratoLojaIDATIVIDADE: TFloatField
      FieldName = 'IDATIVIDADE'
    end
    object CdsContratoLojaIDMARCA: TFloatField
      FieldName = 'IDMARCA'
    end
    object CdsContratoLojaDATREAJUSTE: TDateTimeField
      FieldName = 'DATREAJUSTE'
    end
    object CdsContratoLojaDATPROXREAJUSTE: TDateTimeField
      FieldName = 'DATPROXREAJUSTE'
    end
    object CdsContratoLojaPERREAJUSTE: TFloatField
      FieldName = 'PERREAJUSTE'
    end
    object CdsContratoLojaDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object CdsContratoLojaQTDEABL: TFloatField
      FieldName = 'QTDEABL'
    end
    object CdsContratoLojaFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      FixedChar = True
      Size = 1
    end
    object CdsContratoLojaFLGINDETERMINADO: TStringField
      FieldName = 'FLGINDETERMINADO'
      FixedChar = True
      Size = 1
    end
    object CdsContratoLojaCONTRATO_EXTENSO: TStringField
      FieldName = 'CONTRATO_EXTENSO'
      Size = 100
    end
  end
end
