inherited FrmImpEtiq: TFrmImpEtiq
  Left = 474
  Top = 170
  HelpContext = 30066
  BorderStyle = bsDialog
  Caption = 'Impressão de Etiquetas'
  ClientHeight = 368
  ClientWidth = 284
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 240
    Top = 120
    Width = 39
    Height = 13
    Caption = 'Label3'
  end
  inherited pnlFundo: TPanel
    Width = 284
    Height = 329
    object Bevel1: TBevel
      Left = 20
      Top = 264
      Width = 249
      Height = 50
    end
    object ToolbarButton971: TToolbarButton97
      Left = 36
      Top = 271
      Width = 102
      Height = 37
      AllowAllUp = True
      Caption = '&Filtra Registros'
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000021000000130000000100
        0400000000007C01000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333000000033333333333333333333333FFFF333333000
        00003333337BB03333333333337777F33333300000003333337BB03333333333
        337777F33333300000003333337BB03333333333337777F33333300000003333
        337BB03333333333337777FF333330000000333337BB8703333333333777877F
        333330000000333337B8770333333333377F777FF3333000000033337FBF8770
        333333337F7F8777F3333000000033337FB888703333333378788877FF333000
        00003337FB8F887703333337F7F888777F33300000003337FB88888703333337
        87F888877FF330000000337FFB8F88877033337F87FFFFF777F330000000337F
        777777777033337F7777777777FF300000003377FFFFFFFF00033377888F8888
        77733000000037FF88B8888FFF33378FFF788F8FFFF33000000033007888B807
        003333777FFF7F77773330000000333770000000733333377777777773333000
        00003333333333333333333333333333333330000000}
      NumGlyphs = 2
      Opaque = False
      WordWrap = True
      OnClick = ToolbarButton971Click
    end
    object ToolbarButton972: TToolbarButton97
      Left = 153
      Top = 271
      Width = 102
      Height = 37
      AllowAllUp = True
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
      NumGlyphs = 2
      Opaque = False
      WordWrap = True
      OnClick = ToolbarButton972Click
    end
    object Label1: TLabel
      Left = 20
      Top = 182
      Width = 89
      Height = 13
      Caption = 'Texto Adicional'
    end
    object Label2: TLabel
      Left = 20
      Top = 135
      Width = 111
      Height = 13
      Caption = 'Modelo de Etiqueta'
    end
    object Label4: TLabel
      Left = 21
      Top = 15
      Width = 125
      Height = 13
      Caption = 'Imprime Etiqueta Para'
    end
    object Bevel2: TBevel
      Left = 20
      Top = 226
      Width = 249
      Height = 27
    end
    object CmbModeloEtiq: TCMDBLookupCombo
      Left = 20
      Top = 154
      Width = 249
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MODELOETIQ'#9'60'#9'MODELOETIQ')
      LookupTable = QryModelo
      LookupField = 'IDETIQUETA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object EdtTexto: TEdit
      Left = 20
      Top = 199
      Width = 249
      Height = 21
      TabOrder = 1
    end
    object CkbMatricial: TCheckBox
      Left = 52
      Top = 232
      Width = 213
      Height = 17
      Caption = 'Ultiliza Impressora Matricial'
      TabOrder = 2
    end
    object RgEnd: TRadioGroup
      Left = 19
      Top = 62
      Width = 249
      Height = 65
      Caption = ' Tipo de Endereço '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Comercial'
        'Residencial'
        'Entrega'
        'Cobrança')
      TabOrder = 3
    end
    object CmbPessoa: TComboBox
      Left = 19
      Top = 34
      Width = 249
      Height = 21
      ItemHeight = 13
      TabOrder = 4
    end
  end
  inherited Dock971: TDock97
    Top = 329
    Width = 284
    inherited tb97Fundo: TToolbar97
      Left = 116
      DockPos = 402
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 33
    Top = 449
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object MsPessoa: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL As NOME'
      'PESSOA.NOME AS NOMEFANTASIA'
      'ENDPESS.LOGRADOURO As LOGRADOURO'
      'ENDPESS.NUMERO As NUMERO'
      'ENDPESS.COMPLEMENTO  As COMPLEMENTO'
      'ENDPESS. BAIRRO AS BAIRRO'
      'CIDADES.NOME AS CIDADE'
      'ESTADO.CODESTADO AS CODESTADO'
      'ENDPESS.CEP AS CEP'
      'PESSOA.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Razão Social'
      'Nome Fantasia'
      'Logradouro'
      'Numero'
      'Complemento'
      'Bairro'
      'Cidade'
      'Estado'
      'Cep'
      'Identificador')
    Tabelas.Strings = (
      'PESSOA'
      'ENDPESS'
      'CIDADES'
      'ESTADO')
    Filtro.Strings = (
      'ENDPESS.IDPESSOA = PESSOA.IDPESSOA'
      'ENDPESS.IDCIDADES = CIDADES.IDCIDADES(+)'
      'ESTADO.IDESTADO(+) = CIDADES.IDESTADO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '40'
      '40'
      '10'
      '10'
      '25'
      '25'
      '2'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 323
    Top = 449
  end
  object QryModelo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'IDETIQUETA, MODELOETIQ, IDREPORTS, ORIGEMCM    '
      'FROM ETIQUETA'
      'ORDER BY MODELOETIQ')
    ValidateWithMask = True
    Left = 282
    Top = 449
    object QryModeloMODELOETIQ: TStringField
      DisplayWidth = 60
      FieldName = 'MODELOETIQ'
      Origin = 'ETIQUETA.MODELOETIQ'
      Size = 60
    end
    object QryModeloIDETIQUETA: TFloatField
      FieldName = 'IDETIQUETA'
      Origin = 'ETIQUETA.IDETIQUETA'
      Visible = False
    end
    object QryModeloIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'ETIQUETA.IDREPORTS'
      Visible = False
    end
    object QryModeloORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'ETIQUETA.ORIGEMCM'
      Visible = False
    end
  end
  object ppConsulta: TppBDEPipeline
    DataSource = DsConsulta
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'Consulta'
    Left = 199
    Top = 449
  end
  object DsConsulta: TwwDataSource
    DataSet = QrySql
    Left = 157
    Top = 449
  end
  object QrySql: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select'
      
        ' P.IdPessoa, P.RazaoSocial As Nome, E.Logradouro, E.Numero, E.Co' +
        'mplemento, E.Bairro,'
      ' E.Cidade, E.CodEstado, E.Cep'
      'From'
      ' Pessoa P,'
      ' EndPess E'
      'Where'
      ' (E.Idpessoa = P.IdPessoa) And'
      ' (E.TipoEndereco Like '#39'%C%'#39') And'
      ' (RowNum < 10)')
    ValidateWithMask = True
    Left = 116
    Top = 449
  end
  object qryReports: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   REPORTS.TEMPLATE'
      'FROM'
      '  CM.REPORTS'
      'WHERE'
      '   (REPORTS.IDREPORTS = :PIDREPORTS) AND'
      '   (REPORTS.ORIGEMCM  = :PORIGEMCM)')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 74
    Top = 449
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDREPORTS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PORIGEMCM'
        ParamType = ptUnknown
      end>
    object qryReportsTEMPLATE: TBlobField
      FieldName = 'TEMPLATE'
      Origin = 'REPORTS.TEMPLATE'
      BlobType = ftBlob
      Size = 1
    end
  end
  object RptEtiq: TppReport
    AutoStop = False
    DataPipeline = ppConsulta
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    Left = 238
    Top = 451
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
end
