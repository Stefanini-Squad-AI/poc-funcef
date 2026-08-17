inherited frmCadOrcamPessoal: TfrmCadOrcamPessoal
  Left = 95
  Top = 124
  Caption = 'Cadastro do Orçamento da Quantidade de Pessoal (Manpower)'
  ClientHeight = 362
  ClientWidth = 603
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 603
    Height = 276
    BorderWidth = 2
    object Label1: TLabel
      Left = 14
      Top = 16
      Width = 99
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Código'
    end
    object lblPontosHay: TLabel
      Left = 27
      Top = 244
      Width = 86
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Quantidade'
    end
    object lblGrupo: TLabel
      Left = 14
      Top = 129
      Width = 99
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Estabelecimento'
    end
    object Label2: TLabel
      Left = 21
      Top = 168
      Width = 92
      Height = 13
      Alignment = taRightJustify
      Caption = 'Centro de Custo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 79
      Top = 209
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cargo'
    end
    object Label15: TLabel
      Left = 89
      Top = 52
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Mês'
    end
    object Label3: TLabel
      Left = 90
      Top = 84
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ano'
    end
    object dbrePontosHay: TDBRealEdit
      Left = 123
      Top = 240
      Width = 91
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      TabOrder = 0
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = fNumber
      Signal = False
      DataField = 'QTDEPESSOAL'
      DataSource = ds
    end
    object dblcEstab: TwwDBLookupCombo
      Left = 123
      Top = 126
      Width = 423
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'40'#9'NOME')
      DataField = 'IDESTAB'
      DataSource = ds
      LookupTable = CdsEstab
      LookupField = 'IDPESSOA'
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      OrderByDisplay = False
      UseTFields = False
      AllowClearKey = True
    end
    object dbedCodigo: TDBEdit
      Left = 123
      Top = 14
      Width = 91
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'IDORCAMPESSOAL'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object cmbCCusto: TwwDBLookupCombo
      Left = 123
      Top = 165
      Width = 423
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Descrição'#9'F'
        'CODCENTROCUSTO'#9'10'#9'Código'#9'F')
      DataField = 'CODCENTROCUSTO'
      DataSource = ds
      LookupTable = CdsCCusto
      LookupField = 'CODCENTROCUSTO'
      Options = [loColLines, loTitles]
      Style = csDropDownList
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dblckCargo: TwwDBLookupCombo
      Left = 123
      Top = 207
      Width = 423
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TITULO'#9'30'#9'TITULO')
      DataField = 'IDCARGO'
      DataSource = ds
      LookupTable = CdsCargo
      LookupField = 'IDCARGO'
      Style = csDropDownList
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object speAno: TwwDBSpinEdit
      Left = 123
      Top = 81
      Width = 91
      Height = 21
      Increment = 1
      DataField = 'ANO'
      DataSource = ds
      TabOrder = 5
      UnboundDataType = wwDefault
    end
    object speMes: TwwDBSpinEdit
      Left = 123
      Top = 49
      Width = 91
      Height = 21
      Increment = 1
      MaxValue = 12
      MinValue = 1
      DataField = 'MES'
      DataSource = ds
      MaxLength = 2
      TabOrder = 6
      UnboundDataType = wwDefault
      OnChange = speMesChange
    end
    object edNomeMes: TEdit
      Left = 225
      Top = 50
      Width = 109
      Height = 21
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
  end
  inherited Dock972: TDock97
    Width = 603
  end
  inherited Dock971: TDock97
    Top = 323
    Width = 603
    inherited tb97Fundo: TToolbar97
      Left = 433
      DockPos = 439
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 266
      DockPos = 272
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 555
    Top = 14
    TargetsData = (
      1
      4
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 555
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 469
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'OP.IDORCAMPESSOAL'
      'OP.ANO'
      'OP.MES'
      'C.TITULO'
      'OP.CODCENTROCUSTO'
      'CC.NOME'
      'P.NOME'
      'OP.QTDEPESSOAL')
    TipodeDado.Strings = (
      'N'
      'N'
      'N'
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Código'
      'Ano'
      'Mês'
      'Cargo'
      'Cód. C.Custo'
      'Nome C.Custo'
      'Estabelecimento'
      'Qtde. Pessoas')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ORCAMPESSOAL OP'
      'CARGO C'
      'CENTCUST CC'
      'PESSOA P')
    CamposChave.Strings = (
      'OP.IDORCAMPESSOAL')
    Filtro.Strings = (
      'OP.IDCARGO = C.IDCARGO(+)'
      'OP.IDEMPRESA = CC.IDEMPRESA(+)'
      'OP.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)'
      'OP.IDESTAB = P.IDPESSOA(+)')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '40'
      '10'
      '40'
      '40'
      '10')
    ExibePergunta = False
    Left = 469
    Top = 1
  end
  object CdsEstab: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'Dsp'
    StoreDefs = True
    Left = 312
    Top = 169
  end
  object CdsCCusto: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'CdsCCustoIndexNOME'
        Fields = 'NOME'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsCCustoIndexNOME'
    Params = <>
    StoreDefs = True
    Left = 418
    Top = 209
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 365
    Top = 249
  end
end
