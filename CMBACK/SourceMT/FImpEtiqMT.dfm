inherited FrmImpEtiqMT: TFrmImpEtiqMT
  Left = 465
  Top = 113
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
        'MODELOETIQ'#9'60'#9'Modelo'#9'F')
      LookupTable = CdsModelo
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
    Left = 73
    Top = 449
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'Filter'
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
      'PESSOA.IDPESSOA'
      'CONTATOPESS.NOME')
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
      'N'
      'C')
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
      'Identificador'
      'Contato')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ENDPESS'
      'CIDADES'
      'ESTADO'
      'CONTATOPESS')
    Filtro.Strings = (
      'ENDPESS.IDPESSOA = PESSOA.IDPESSOA'
      'ENDPESS.IDCIDADES = CIDADES.IDCIDADES(+)'
      'ESTADO.IDESTADO(+) = CIDADES.IDESTADO'
      'CONTATOPESS.IDENDERECO(+) = ENDPESS.IDENDERECO')
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
      '10'
      '50')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 275
    Top = 449
  end
  object ppConsulta: TppBDEPipeline
    DataSource = DsConsulta
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'Consulta'
    Left = 194
    Top = 449
  end
  object DsConsulta: TwwDataSource
    DataSet = CdsConsulta
    Left = 154
    Top = 449
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
    Left = 235
    Top = 449
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
  object CdsConsulta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 113
    Top = 449
  end
  object SQLConsulta: TCMSqlParams
    SQL.Strings = (
      'Select'
      
        ' P.IdPessoa, P.RazaoSocial As Nome, E.Logradouro, E.Numero, E.Co' +
        'mplemento, E.Bairro,'
      ' C.nome as Cidade, Es.CodEstado, E.Cep, CP.Nome as Contato'
      'From'
      ' Pessoa P,'
      ' EndPess E,'
      ' ContatoPess CP,'
      ' Cidades c,'
      ' Estado Es'
      'Where'
      ' (E.Idpessoa = P.IdPessoa) And'
      ' (E.IDCIDADES = C.IDCIDADES(+)) And'
      ' (ES.IDESTADO(+) = C.IDESTADO) And'
      ' (E.IDENDERECO(+) = P.IDENDCOMERCIAL) And'
      ' (CP.IDENDERECO(+) = P.IDENDCOMERCIAL)'
      ' (RowNum < 10)'
      '')
    ClientDataSet = CdsConsulta
    Left = 112
    Top = 503
  end
  object SQLReports: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   REPORTS.TEMPLATE'
      'FROM'
      '  CM.REPORTS'
      'WHERE'
      '   (REPORTS.IDREPORTS = :IDREPORTS) AND'
      '   (REPORTS.ORIGEMCM  = :ORIGEMCM)')
    ClientDataSet = CdsReports
    Left = 312
    Top = 503
  end
  object CdsReports: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 451
  end
  object CdsModelo: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 355
    Top = 451
    Data = {
      D60100009619E0BD01000000180000000400070000000300000094000A494445
      5449515545544108000400000000000A4D4F44454C4F45544951010049000000
      0100055749445448020002003C000949445245504F5254530800040000000000
      084F524947454D434D080004000000000002000D44454641554C545F4F524445
      5202008200010000000200044C43494404000100090800000000000000000000
      3E4012444541494D202D204C4F4341544152494F530000000000288B40000000
      0000000000000000000000000032401F446F7461633F6F2064617320636F6E74
      6173204F7263616D656E74617269730000000000088240000000000000000000
      00000000000000184024457469717565746120416C6D6F786172696661646F20
      2D20466F726E656365646F7265730000000000A06F4000000000000000000040
      00000000000030401D4574697175657461206465204D616E7574656E69646F73
      2054657374650000000000F0804000000000000000002040044E6F7661000000
      0000607040000000000000000000400000000000804440124E6F766F20546573
      746520646F20446176690000000000A09040000000000000000042400D504152
      5449434950414E54455300000000001890400000000000000000}
  end
  object SQLModelo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      'IDETIQUETA, MODELOETIQ, IDREPORTS, ORIGEMCM    '
      'FROM ETIQUETA'
      'ORDER BY MODELOETIQ')
    ClientDataSet = CdsModelo
    Left = 355
    Top = 503
  end
end
