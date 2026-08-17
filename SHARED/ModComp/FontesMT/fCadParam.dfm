inherited frmCadParam: TfrmCadParam
  Left = 358
  Top = 115
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 586
  ClientWidth = 402
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 402
    Height = 500
    BorderWidth = 2
    object Label12: TLabel
      Left = 15
      Top = 101
      Width = 314
      Height = 13
      Caption = 'Indice Padrão de Atualização Monetária dos Processos'
    end
    object gbDadosInt: TGroupBox
      Left = 16
      Top = 244
      Width = 368
      Height = 246
      Caption = 'Dados para Integração'
      TabOrder = 5
      object Label3: TLabel
        Left = 12
        Top = 28
        Width = 195
        Height = 13
        Caption = 'Dias Úteis para o Pagto. da Etapa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label47: TLabel
        Left = 12
        Top = 55
        Width = 112
        Height = 13
        Caption = 'Tipo de Documento'
      end
      object lblPortadorForma: TLabel
        Left = 12
        Top = 102
        Width = 120
        Height = 13
        Caption = 'Forma de Pagamento'
      end
      object lblCentroCusto: TLabel
        Left = 12
        Top = 149
        Width = 136
        Height = 13
        Caption = 'Centro de Custo Padrão'
      end
      object Label1: TLabel
        Left = 12
        Top = 197
        Width = 324
        Height = 13
        Caption = 'Tipo do Desembolso das Custas Judiciais (PAGAMENTO)'
      end
      object wwDBSpinEdit1: TwwDBSpinEdit
        Left = 214
        Top = 20
        Width = 43
        Height = 21
        Increment = 1
        Value = 3
        DataField = 'DIASPAGTOJURETAPA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
      end
      object dblckTipoDoc: TwwDBLookupCombo
        Left = 12
        Top = 70
        Width = 336
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição'#9'F')
        DataField = 'CODTIPDOCEJURETAPA'
        DataSource = ds
        LookupTable = CdsTipoDoc
        LookupField = 'CODTIPDOC'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object dblkPortadorForma: TwwDBLookupCombo
        Left = 12
        Top = 118
        Width = 336
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'Descrição'#9'F')
        DataField = 'CODPORTFORMAPAGETAPAJUR'
        DataSource = ds
        LookupTable = cdsPortadorFormaCAP
        LookupField = 'CODFORMA'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = True
      end
      object dblkCentroCusto: TwwDBLookupCombo
        Left = 12
        Top = 164
        Width = 336
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Centro de Custo'#9'F')
        DataField = 'CODCENTCUSTOJUR'
        DataSource = ds
        LookupTable = qryLkpCentroCusto
        LookupField = 'CODCENTROCUSTO'
        Options = [loColLines, loTitles]
        Color = clWhite
        ParentFont = False
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object dblkpTipoDesembPag: TwwDBLookupCombo
        Left = 12
        Top = 212
        Width = 336
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição'#9'F'
          'RECPAG'#9'6'#9'P/R'#9'F'
          'CODTIPRECDES'#9'15'#9'Código'#9'F')
        DataField = 'CODDESEMBCUSTASJUDPAG'
        DataSource = ds
        LookupTable = CdsDesembolsoCustas
        LookupField = 'CODTIPRECDES'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = True
      end
    end
    object dblcMoeda: TwwDBLookupCombo
      Left = 15
      Top = 115
      Width = 370
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MOEDESC'#9'20'#9'Descrição'
        'MOESIGLA'#9'10'#9'Sigla')
      DataField = 'MOEDAPROCTRAB'
      DataSource = ds
      LookupTable = CdsMoeda
      LookupField = 'MOECODIGO'
      Options = [loColLines, loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object dbrgIntegraCAP: TDBRadioGroup
      Left = 15
      Top = 199
      Width = 369
      Height = 40
      Caption = 'Faz Integração com Contas a Pagar/Receber?'
      Columns = 2
      DataField = 'FLGINTEGRACAP'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 1
      Values.Strings = (
        '1'
        '0')
      OnChange = dbrgIntegraContChange
      OnClick = dbrgIntegraCAPClick
    end
    object dbrgIntegraCont: TDBRadioGroup
      Left = 15
      Top = 10
      Width = 370
      Height = 83
      Caption = 'Faz Integração Contábil?'
      DataField = 'FLGINTEGRACONT'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 2
      Values.Strings = (
        '1'
        '0')
      OnChange = dbrgIntegraContChange
    end
    object dbrgSubConta: TDBRadioGroup
      Left = 258
      Top = 18
      Width = 119
      Height = 70
      Hint = 
        'Se optar por Sim, o sistema irá criar uma subconta contábil para' +
        ' cada contraparte dos processos'
      Caption = 'Criar Sub Conta?'
      DataField = 'FLGCRIASUBCONTA'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Values.Strings = (
        '1'
        '0')
    end
    object dbrgPercProb: TDBRadioGroup
      Left = 15
      Top = 148
      Width = 370
      Height = 40
      Caption = 'Estimativa Atual dos Objetos é Calculada com Base'
      Columns = 2
      DataField = 'FLGPERCPROB'
      DataSource = ds
      Items.Strings = (
        'No Valor Reclamado'
        'Na Estimativa Original')
      TabOrder = 4
      Values.Strings = (
        '0'
        '1')
      OnChange = dbrgIntegraContChange
    end
  end
  inherited Dock972: TDock97
    Width = 402
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 547
    Width = 402
    inherited tb97Fundo: TToolbar97
      Left = 213
      DockPos = 213
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 38
      DockPos = 38
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 192
    Top = 14
    TargetsData = (
      1
      1
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 100
    Top = 129
  end
  inherited ImlPadrao: TImageList
    Left = 192
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyEdit = CmeCadastroApplyEdit
    Left = 128
    Top = 13
  end
  inherited Cds: TCMClientDataSet
    Left = 96
    Top = 77
  end
  inherited MontaSelect: TMontaSelect
    Left = 128
    Top = 1
  end
  object CdsMoeda: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsMoedaIndex'
        CaseInsFields = 'MOEDESC'
        Fields = 'MOEDESC'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsMoedaIndex'
    Params = <>
    ProviderName = 'Dsp'
    StoreDefs = True
    Left = 264
    Top = 99
  end
  object CdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 300
  end
  object qryTipoDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM TIPODOCRECPAG')
    ClientDataSet = CdsTipoDoc
    Left = 126
    Top = 299
  end
  object cdsPortadorFormaCAP: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 242
    Top = 406
    object cdsPortadorFormaCAPCODFORMA: TFloatField
      FieldName = 'CODFORMA'
    end
    object cdsPortadorFormaCAPRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object cdsPortadorFormaCAPDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
  object qryPortadorCAP: TCMSqlParams
    SQL.Strings = (
      '  SELECT CODFORMA,'
      '   RECPAG,'
      '   DESCRICAO'
      'FROM FORMARECPAG'
      'WHERE recpag = '#39'P'#39
      'ORDER BY DESCRICAO')
    ClientDataSet = cdsPortadorFormaCAP
    Left = 34
    Top = 405
  end
  object qryLkpCentroCusto: TwwQuery
    AutoCalcFields = False
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT UPPER(CC.NOME) NOME, CC.CODCENTROCUSTO'
      'FROM CENTCUST CC'
      'WHERE CC.IDEMPRESA = 1 AND'
      '      CC.STATUSGRUPOCDC = '#39'A'#39' AND         '
      '      CC.IDPLANCENTCUST = 3 AND'
      '      CC.ATIVO = '#39'S'#39
      'ORDER BY UPPER(CC.NOME), CC.CODCENTROCUSTO')
    PictureMasks.Strings = (
      'VALORDESPESAADM'#9'###,###,#00.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 255
    Top = 262
    object qryLkpCentroCustoNOME: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'BASEDADOS.CENTCUST.NOME'
      Size = 30
    end
    object qryLkpCentroCustoCODCENTROCUSTO: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.CENTCUST.CODCENTROCUSTO'
      Visible = False
      FixedChar = True
      Size = 10
    end
  end
  object CdsDesembolsoCustas: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'PLACONTACREDITO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 18
      end
      item
        Name = 'PLANO'
        DataType = ftFloat
      end
      item
        Name = 'PLACONTA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 18
      end
      item
        Name = 'RECPAG'
        DataType = ftString
        Size = 7
      end>
    IndexDefs = <
      item
        Name = 'CdsMoedaIndex'
        CaseInsFields = 'MOEDESC'
        Fields = 'MOEDESC'
        Options = [ixCaseInsensitive]
      end>
    Params = <>
    ProviderName = 'Dsp'
    StoreDefs = True
    Left = 214
    Top = 473
    object CdsDesembolsoCustasDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object CdsDesembolsoCustasRECPAG: TStringField
      DisplayLabel = 'P/R'
      DisplayWidth = 6
      FieldName = 'RECPAG'
      Size = 7
    end
    object CdsDesembolsoCustasCODTIPRECDES: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 15
      FieldName = 'CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object CdsDesembolsoCustasPLACONTACREDITO: TStringField
      DisplayWidth = 18
      FieldName = 'PLACONTACREDITO'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object CdsDesembolsoCustasPLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLANO'
      Visible = False
    end
    object CdsDesembolsoCustasPLACONTA: TStringField
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      Visible = False
      FixedChar = True
      Size = 18
    end
  end
  object SQLDesemb: TCMSqlParams
    SQL.Strings = (
      'SELECT CODTIPRECDES,'
      '       DESCRICAO,'
      '       PLACONTACREDITO,'
      '       PLANO,'
      '       PLACONTA,'
      '       DECODE(RECPAG, '#39'P'#39', '#39'Pagar'#39', '#39'Receber'#39') AS RECPAG'
      '  FROM TIPORECEBDESEMB'
      ' WHERE (NVL(ATIVO, '#39'S'#39') <> '#39'N'#39')'
      '   AND (RECPAG = '#39'P'#39')'
      '   AND (ANASINT = '#39'A'#39')'
      '   AND (IDPESSOA = 1)'
      ' ORDER BY DESCRICAO')
    ClientDataSet = CdsDesembolsoCustas
    Left = 328
    Top = 475
  end
end
