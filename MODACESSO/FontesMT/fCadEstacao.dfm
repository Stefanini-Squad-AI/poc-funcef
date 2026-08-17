inherited frmCadEstacao: TfrmCadEstacao
  Left = 193
  Top = 68
  Caption = 'Cadastro de Estações'
  ClientHeight = 465
  ClientWidth = 549
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 549
    Height = 379
    BorderWidth = 2
    object Label1: TLabel
      Left = 13
      Top = 16
      Width = 44
      Height = 13
      AutoSize = False
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 203
      Top = 16
      Width = 52
      Height = 13
      AutoSize = False
      Caption = 'Estação'
      FocusControl = dbedEstacao
    end
    object Label4: TLabel
      Left = 13
      Top = 42
      Width = 73
      Height = 13
      AutoSize = False
      Caption = 'Localização'
    end
    object lblGrupo: TLabel
      Left = 13
      Top = 68
      Width = 73
      Height = 13
      AutoSize = False
      Caption = 'Função'
      FocusControl = dbcmbFuncao
    end
    object lblDescricao: TLabel
      Left = 14
      Top = 265
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbmemDescr
    end
    object dbedCodigo: TDBEdit
      Left = 89
      Top = 13
      Width = 84
      Height = 21
      Color = clGray
      DataField = 'IDESTACAOACESSO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbedEstacao: TDBEdit
      Left = 256
      Top = 13
      Width = 280
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ESTACAO'
      DataSource = ds
      TabOrder = 1
      OnExit = dbedEstacaoExit
    end
    object dblckLocalizacao: TwwDBLookupCombo
      Left = 89
      Top = 39
      Width = 448
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME'#9'F')
      DataField = 'IDLOCALIZACAO'
      DataSource = ds
      LookupTable = CdsLocalizacao
      LookupField = 'IDLOCALIZACAO'
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dbcmbFuncao: TwwDBComboBox
      Left = 89
      Top = 65
      Width = 126
      Height = 21
      ShowButton = True
      Style = csDropDownList
      MapList = True
      AllowClearKey = False
      DataField = 'INDFUNCAO'
      DataSource = ds
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'Ponto'#9'P'
        'Acesso'#9'A')
      Sorted = False
      TabOrder = 3
      UnboundDataType = wwDefault
    end
    object dbrgEntraSai: TDBRadioGroup
      Left = 280
      Top = 63
      Width = 257
      Height = 43
      Caption = 'Forma de Operação'
      Columns = 2
      DataField = 'INDENTRASAI'
      DataSource = ds
      Items.Strings = (
        'Entrada e Saída'
        'Só entrada')
      TabOrder = 4
      Values.Strings = (
        '0'
        '1'
        '2')
    end
    object dbrgIdentificacao: TDBRadioGroup
      Left = 13
      Top = 111
      Width = 250
      Height = 77
      Caption = 'A Identificação da Pessoa é Feita por'
      DataField = 'INDIDENTIFICACAO'
      DataSource = ds
      Items.Strings = (
        'Teclado'
        'Leitor, sem Catraca'
        'Leitor, com Catraca'
        'Biométrica (Digital da Pessoa)')
      TabOrder = 5
      Values.Strings = (
        '0'
        '1'
        '2'
        '3')
      OnChange = dbrgIdentificacaoChange
    end
    object dbrgLiberacao: TDBRadioGroup
      Left = 280
      Top = 111
      Width = 257
      Height = 77
      Caption = 'A Liberação de Passagem da Pessoa é'
      DataField = 'INDLIBERACAO'
      DataSource = ds
      Items.Strings = (
        'Assistida, sem Catraca'
        'Assistida, com Catraca'
        'Automática, com Catraca'
        'Automática, sem Catraca')
      TabOrder = 6
      Values.Strings = (
        '0'
        '1'
        '2'
        '3')
      OnChange = dbrgIdentificacaoChange
    end
    object gbxCatraca: TGroupBox
      Left = 13
      Top = 194
      Width = 524
      Height = 68
      Caption = 'Catraca'
      TabOrder = 7
      Visible = False
      object Label3: TLabel
        Left = 13
        Top = 17
        Width = 42
        Height = 13
        AutoSize = False
        Caption = 'Marca'
      end
      object Label5: TLabel
        Left = 12
        Top = 43
        Width = 51
        Height = 13
        AutoSize = False
        Caption = 'Modelo'
      end
      object Label6: TLabel
        Left = 358
        Top = 17
        Width = 34
        Height = 13
        AutoSize = False
        Caption = 'Porta'
        FocusControl = dbedPorta
      end
      object dbedPorta: TDBEdit
        Left = 394
        Top = 14
        Width = 116
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PORTACATRACA'
        DataSource = ds
        TabOrder = 1
      end
      object dbcbMarca: TDBComboBox
        Left = 67
        Top = 14
        Width = 284
        Height = 21
        Style = csDropDownList
        DataField = 'MARCACATRACA'
        DataSource = ds
        ItemHeight = 13
        Items.Strings = (
          '01 - Madis Rodbel'
          '02 - Passo Automação'
          '03 - Topdata')
        TabOrder = 0
        OnChange = dbcbMarcaChange
      end
      object dbcbModelo: TDBComboBox
        Left = 68
        Top = 40
        Width = 443
        Height = 21
        Style = csDropDownList
        DataField = 'MODELOCATRACA'
        DataSource = ds
        ItemHeight = 13
        Items.Strings = (
          '0101 - RBC-2801 ou Equivalente - Tempo Real - Porta Serial'
          '0102 - RBC-2801 ou Equivalente - Tempo Real - Porta Paralela'
          '0201 - Passo - CA 1M'
          '0301 - Topdata "Inner"')
        TabOrder = 2
      end
    end
    object dbmemDescr: TDBMemo
      Left = 14
      Top = 280
      Width = 524
      Height = 88
      DataField = 'DESCRICAO'
      DataSource = ds
      ScrollBars = ssVertical
      TabOrder = 8
    end
  end
  inherited Dock972: TDock97
    Width = 549
  end
  inherited Dock971: TDock97
    Top = 426
    Width = 549
    inherited tb97Fundo: TToolbar97
      Left = 377
      DockPos = 441
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 208
      DockPos = 272
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 158
    Top = 415
    TargetsData = (
      1
      1
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
    Left = 483
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 421
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'ESTACAOACESSO.IDESTACAOACESSO'
      'ESTACAOACESSO.ESTACAO'
      'LOCALIZACAO.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Estação'
      'Localização')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ESTACAOACESSO'
      'LOCALIZACAO')
    CamposChave.Strings = (
      'ESTACAOACESSO.IDESTACAOACESSO')
    Filtro.Strings = (
      'ESTACAOACESSO.IDLOCALIZACAO = LOCALIZACAO.IDLOCALIZACAO'
      'ESTACAOACESSO.IDPESSOA = LOCALIZACAO.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '40'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    ExibePergunta = False
    Left = 421
    Top = 1
  end
  object CdsLocalizacao: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDLOCALIZACAO'
        DataType = ftFloat
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'IDTIPOAREA'
        DataType = ftFloat
      end
      item
        Name = 'IDRESPONSAVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'FLGLOCSAITEMP'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'Dsp'
    StoreDefs = True
    Left = 346
    Top = 1
  end
end
