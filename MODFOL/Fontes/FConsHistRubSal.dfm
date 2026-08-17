inherited frmConsHistRubSal: TfrmConsHistRubSal
  Left = 11
  Top = 102
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
      Top = 109
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
      Font.Style = [fsItalic]
      ParentFont = False
      TextOptions.Alignment = taCenter
      TextOptions.Shadow.Enabled = True
      TextOptions.Shadow.XOffset = 2
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
      object Label2: TLabel
        Left = 330
        Top = 13
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
      object Label7: TLabel
        Left = 15
        Top = 50
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
      object Label8: TLabel
        Left = 330
        Top = 50
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
        Font.Style = [fsItalic]
        ParentFont = False
        TextOptions.Alignment = taCenter
        TextOptions.Shadow.Enabled = True
        TextOptions.Shadow.XOffset = 2
        TextOptions.Shadow.YOffset = 2
        TextOptions.VAlignment = vaTop
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
        TabOrder = 0
      end
      object edEmpresa: TEdit
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
        TabOrder = 1
      end
      object edMatricula: TEdit
        Left = 15
        Top = 63
        Width = 123
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
      object edTitulo: TEdit
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
        TabOrder = 3
      end
      object bbtnProcurar: TBitBtn
        Left = 639
        Top = 38
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
      TabOrder = 6
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
      LookupTable = qryMotivo
      LookupField = 'IDMOTIVO'
      Style = csDropDownList
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcMotivoChange
    end
    object Panel1: TPanel
      Left = 625
      Top = 217
      Width = 119
      Height = 120
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Panel1'
      TabOrder = 7
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
      object edTotProventos: TRealEdit
        Left = 6
        Top = 18
        Width = 105
        Height = 21
        Alignment = taRightJustify
        Color = clGray
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
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
        Width = 105
        Height = 21
        Alignment = taRightJustify
        Color = clGray
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
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
        Top = 89
        Width = 105
        Height = 21
        Alignment = taRightJustify
        Color = clGray
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
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
      TabOrder = 2
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
      Caption = 'Inclui Rubricas de Apoio ?'
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
      TabOrder = 3
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
        'MES'#9'14'#9'Mês de Referência'
        'REFERENCIA'#9'11'#9'Referência'
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
      Left = 596
      DockPos = 601
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 571
    Top = 338
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
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo'
      'Empresa')
    SensivelACaixa.Strings = (
      'N'
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
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA'
      'EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'EMPRESAPROP.IDPESSOA = FUNCIONARIO.IDEMPRESA'
      'CARGO.IDCARGO        = FUNCIONARIO.IDCARGO'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 698
    Top = 364
  end
  object qryProventos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  H.CODPROVDESC, H.MES, H.REFERENCIA,'
      '  H.VALORPROVENTO, PV.DESCRICAO,'
      '  PV.FLGDESCONTO'
      'FROM'
      '  PREVIAFOLPAG H, PROVDESC PV'
      'WHERE'
      '  (H.IDPESSOA  = -12) AND'
      '  (H.IDRUBRICA = PV.IDPROVENTO)')
    ValidateWithMask = True
    Left = 326
    Top = 190
    object qryProventosCODPROVDESC: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 7
      FieldName = 'CODPROVDESC'
      Origin = 'BASEDADOS.PREVIAFOLPAG.CODPROVDESC'
      Size = 15
    end
    object qryProventosDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 44
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PROVDESC.DESCRICAO'
      Size = 130
    end
    object qryProventosMES: TStringField
      DisplayLabel = 'Mês de Referência'
      DisplayWidth = 14
      FieldName = 'MES'
      Origin = 'BASEDADOS.PREVIAFOLPAG.MES'
      FixedChar = True
      Size = 7
    end
    object qryProventosREFERENCIA: TStringField
      DisplayLabel = 'Referência'
      DisplayWidth = 11
      FieldName = 'REFERENCIA'
      Origin = 'BASEDADOS.PREVIAFOLPAG.REFERENCIA'
      Size = 10
    end
    object qryProventosVALORPROVENTO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALORPROVENTO'
      Origin = 'BASEDADOS.PREVIAFOLPAG.VALORPROVENTO'
      DisplayFormat = '#,0.00;-#,0.00'
    end
    object qryProventosFLGDESCONTO: TFloatField
      FieldName = 'FLGDESCONTO'
      Origin = 'BASEDADOS.PROVDESC.FLGDESCONTO'
      Visible = False
    end
  end
  object qryDescontos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  H.CODPROVDESC, H.MES, H.REFERENCIA,'
      '  H.VALORPROVENTO, PV.DESCRICAO'
      'FROM'
      '  PREVIAFOLPAG H, PROVDESC PV'
      'WHERE'
      '  (H.IDPESSOA  = -12) AND'
      '  (H.IDRUBRICA = PV.IDPROVENTO)')
    ValidateWithMask = True
    Left = 325
    Top = 317
    object qryDescontosCODPROVDESC: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 7
      FieldName = 'CODPROVDESC'
      Origin = 'BASEDADOS.PREVIAFOLPAG.CODPROVDESC'
      Size = 15
    end
    object qryDescontosDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 44
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PROVDESC.DESCRICAO'
      Size = 130
    end
    object qryDescontosMES: TStringField
      DisplayLabel = 'Mês de Referência'
      DisplayWidth = 18
      FieldName = 'MES'
      Origin = 'BASEDADOS.PREVIAFOLPAG.MES'
      FixedChar = True
      Size = 7
    end
    object qryDescontosREFERENCIA: TStringField
      DisplayLabel = 'Referência'
      DisplayWidth = 11
      FieldName = 'REFERENCIA'
      Origin = 'BASEDADOS.PREVIAFOLPAG.REFERENCIA'
      Size = 10
    end
    object qryDescontosVALORPROVENTO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALORPROVENTO'
      Origin = 'BASEDADOS.PREVIAFOLPAG.VALORPROVENTO'
      DisplayFormat = '#,0.00;-#,0.00'
    end
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDMOTIVO, DESCRICAO, IDMOVCONTRCAGED, MOTIVORAIS, MOTIVOFGTS,'
      '  OBSERVACAO, GRUPOMOTIVO, FLGTIPO'
      'FROM'
      '  MOTIVO'
      'WHERE'
      '  (GRUPOMOTIVO IN ('#39'F'#39', '#39'D'#39'))'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 637
    Top = 353
  end
  object dsDescontos: TwwDataSource
    DataSet = qryDescontos
    Left = 391
    Top = 317
  end
  object dsProventos: TwwDataSource
    DataSet = qryProventos
    Left = 390
    Top = 190
  end
  object qryParamRH: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NORMALINI, IDMOTIVO'
      'FROM'
      '  PARAMRH')
    ValidateWithMask = True
    Left = 637
    Top = 341
  end
end
