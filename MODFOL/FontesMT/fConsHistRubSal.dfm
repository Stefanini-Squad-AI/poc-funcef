inherited frmConsHistRubSal: TfrmConsHistRubSal
  Left = 471
  Top = 204
  HelpContext = 210082
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Histórico de Rubricas Salariais'
  ClientHeight = 453
  ClientWidth = 762
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 762
    Height = 414
    BorderWidth = 2
    object Label22: TLabel
      Left = 16
      Top = 108
      Width = 65
      Height = 13
      Caption = 'Tipo de Folha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 16
      Top = 144
      Width = 156
      Height = 13
      Caption = 'Proventos (e Apoio se Solicitado)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 16
      Top = 274
      Width = 51
      Height = 13
      Caption = 'Descontos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object fcLabel2: TfcLabel
      Left = 95
      Top = 98
      Width = 209
      Height = 24
      AutoSize = False
      Caption = 'Rubricas Salariais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = []
      ParentFont = False
      TextOptions.Alignment = taCenter
      TextOptions.Shadow.Enabled = True
      TextOptions.Shadow.XOffset = 1
      TextOptions.Shadow.YOffset = 2
      TextOptions.VAlignment = vaTop
    end
    object pnlInformacoes: TPanel
      Left = 4
      Top = 4
      Width = 754
      Height = 92
      BevelInner = bvLowered
      TabOrder = 0
      object fcLabel1: TfcLabel
        Left = 94
        Top = 2
        Width = 209
        Height = 24
        AutoSize = False
        Caption = 'Dados do Empregado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = []
        ParentFont = False
        TextOptions.Alignment = taCenter
        TextOptions.Shadow.Enabled = True
        TextOptions.Shadow.XOffset = 1
        TextOptions.Shadow.YOffset = 2
        TextOptions.VAlignment = vaTop
      end
      object Label1: TLabel
        Left = 15
        Top = 13
        Width = 28
        Height = 13
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 330
        Top = 10
        Width = 28
        Height = 13
        Caption = 'Cargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 639
        Top = 13
        Width = 45
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 15
        Top = 50
        Width = 76
        Height = 13
        Caption = 'Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 330
        Top = 50
        Width = 41
        Height = 13
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edFuncionario: TEdit
        Left = 15
        Top = 27
        Width = 303
        Height = 21
        AutoSelect = False
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
      object edCargo: TEdit
        Left = 330
        Top = 27
        Width = 300
        Height = 21
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
      object edMatricula: TEdit
        Left = 639
        Top = 27
        Width = 103
        Height = 21
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
      object edCCusto: TEdit
        Left = 15
        Top = 64
        Width = 303
        Height = 21
        AutoSelect = False
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object edEmpresa: TEdit
        Left = 330
        Top = 64
        Width = 300
        Height = 21
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object bbtnProcurar: TBitBtn
        Left = 639
        Top = 57
        Width = 103
        Height = 28
        Hint = 'Procurar Pessoa Desejada'
        Caption = '&Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = bbtnProcurarClick
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
      object cbxAlternativo: TCheckBox
        Left = 364
        Top = 9
        Width = 97
        Height = 17
        Caption = 'Alternativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = cbxAlternativoClick
      end
    end
    object gridDescontos: TwwDBGrid
      Left = 16
      Top = 287
      Width = 600
      Height = 115
      Selected.Strings = (
        'CODPROVDESC'#9'7'#9'Código'#9'F'
        'DESCRICAO'#9'44'#9'Descrição'#9'F'
        'MES'#9'18'#9'Mês de Referência'#9'F'
        'REFERENCIA'#9'11'#9'Referência'#9'F'
        'VALORPROVENTO'#9'10'#9'Valor'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 1
      ShowHorzScrollBar = False
      DataSource = dsDescontos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 7
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
    object dblcMotivo: TwwDBLookupCombo
      Left = 16
      Top = 122
      Width = 300
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'Motivo')
      LookupTable = CdsMotivo
      LookupField = 'IDMOTIVO'
      Style = csDropDownList
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcMotivoChange
    end
    object Panel1: TPanel
      Left = 625
      Top = 217
      Width = 119
      Height = 176
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 6
      object Label10: TLabel
        Left = 6
        Top = 5
        Width = 90
        Height = 13
        Caption = 'Total de Proventos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 6
        Top = 40
        Width = 93
        Height = 13
        Caption = 'Total de Descontos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 6
        Top = 76
        Width = 63
        Height = 13
        Caption = 'Total Líquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 6
        Top = 116
        Width = 59
        Height = 13
        Caption = 'Salário Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edTotProventos: TRealEdit
        Left = 6
        Top = 18
        Width = 106
        Height = 21
        Alignment = taRightJustify
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '0,00')
        ParentFont = False
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edTotDescontos: TRealEdit
        Left = 6
        Top = 53
        Width = 106
        Height = 21
        Alignment = taRightJustify
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edTotLiquido: TRealEdit
        Left = 6
        Top = 88
        Width = 106
        Height = 22
        Alignment = taRightJustify
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edSalarioTotal: TRealEdit
        Left = 5
        Top = 129
        Width = 106
        Height = 21
        Alignment = taRightJustify
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      end
    end
    object grpMesRef: TGroupBox
      Left = 331
      Top = 100
      Width = 197
      Height = 43
      Caption = ' Mês e Ano de Referência '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object cmbMes: TComboBox
        Left = 7
        Top = 15
        Width = 112
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        OnChange = dblcMotivoChange
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object spnedAno: TSpinEdit
        Left = 130
        Top = 15
        Width = 55
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 0
        OnChange = dblcMotivoChange
      end
    end
    object rgRubApoio: TRadioGroup
      Left = 547
      Top = 100
      Width = 197
      Height = 43
      Caption = 'Inclui Rubricas de Apoio?'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 1
      Items.Strings = (
        'Sim'
        'Não')
      ParentFont = False
      TabOrder = 2
      OnClick = dblcMotivoChange
    end
    object rgProcesso: TRadioGroup
      Left = 625
      Top = 152
      Width = 119
      Height = 55
      Caption = 'Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 1
      Items.Strings = (
        'Prévia'
        'Final')
      ParentFont = False
      TabOrder = 4
      OnClick = dblcMotivoChange
    end
    object gridProventos: TwwDBGrid
      Left = 16
      Top = 159
      Width = 600
      Height = 115
      Selected.Strings = (
        'CODPROVDESC'#9'7'#9'Código'
        'DESCRICAO'#9'44'#9'Descrição'
        'MES'#9'18'#9'Mês de Referência'
        'REFERENCIA'#9'11'#9'Referência'#9'F'
        'VALORPROVENTO'#9'10'#9'Valor')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 1
      ShowHorzScrollBar = False
      DataSource = dsProventos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 5
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
  inherited Dock971: TDock97
    Top = 414
    Width = 762
    inherited tb97Fundo: TToolbar97
      Left = 594
      DockPos = 601
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 547
    Top = 410
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Empregado'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'CARGO'
      'EMPRESAPROP')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA'
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA'
      'FUNCIONARIO.CODCENTROCUSTO')
    Filtro.Strings = (
      'CARGO.IDCARGO        = FUNCIONARIO.IDCARGO'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 703
    Top = 348
  end
  object dsDescontos: TwwDataSource
    DataSet = CdsDescontos
    Left = 391
    Top = 317
  end
  object dsProventos: TwwDataSource
    DataSet = CdsProventos
    Left = 390
    Top = 190
  end
  object CdsMotivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 639
    Top = 350
  end
  object CdsProventos: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODPROVDESC'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 130
      end
      item
        Name = 'MES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 7
      end
      item
        Name = 'REFERENCIA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VALORPROVENTO'
        DataType = ftFloat
      end
      item
        Name = 'FLGDESCONTO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'CdsProventosIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'MES;FLGDESCONTO;DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsProventosIndex'
    Params = <>
    StoreDefs = True
    Left = 323
    Top = 190
  end
  object CdsDescontos: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODPROVDESC'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 130
      end
      item
        Name = 'MES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 7
      end
      item
        Name = 'REFERENCIA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VALORPROVENTO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'CdsDescontosIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'MES;DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsDescontosIndex'
    Params = <>
    StoreDefs = True
    Left = 322
    Top = 317
  end
  object qry: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 152
    Top = 216
  end
end
