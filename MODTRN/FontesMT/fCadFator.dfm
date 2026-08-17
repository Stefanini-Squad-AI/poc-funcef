inherited frmCadFator: TfrmCadFator
  Left = 176
  Top = 91
  HelpContext = 720008
  Caption = 'Cadastro dos Fatores de Avaliação de Treinamento'
  ClientHeight = 426
  ClientWidth = 434
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 434
    Height = 340
    BorderWidth = 2
    object Label1: TLabel
      Left = 17
      Top = 7
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 94
      Top = 7
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object Label3: TLabel
      Left = 17
      Top = 190
      Width = 75
      Height = 13
      Caption = 'Observações'
      FocusControl = dbedDescr
    end
    object dbedCodigo: TDBEdit
      Left = 17
      Top = 22
      Width = 64
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'IDFATORAVAL'
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
    object dbedDescr: TDBEdit
      Left = 94
      Top = 22
      Width = 323
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
    object dbmemOBS: TDBMemo
      Left = 17
      Top = 203
      Width = 400
      Height = 121
      DataField = 'OBSERVACAO'
      DataSource = ds
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object dbrgFormaAval: TDBRadioGroup
      Left = 17
      Top = 50
      Width = 400
      Height = 38
      Caption = 'Forma de Avaliação deste Fator'
      Columns = 2
      DataField = 'FLGAVALCURSO'
      DataSource = ds
      Items.Strings = (
        'Escalonada'
        'Conceitual')
      TabOrder = 3
      Values.Strings = (
        '0'
        '1')
      OnChange = dbrgFormaAvalChange
    end
    object dbrgAplicacao: TDBRadioGroup
      Left = 17
      Top = 92
      Width = 400
      Height = 38
      Caption = 'Aplicabilidade deste Fator'
      Columns = 2
      DataField = 'INDAPLICACAO'
      DataSource = ds
      Items.Strings = (
        'Para Avaliação dos Cursos'
        'Para Avaliação dos Alunos')
      TabOrder = 4
      Values.Strings = (
        '0'
        '1')
    end
    object gbxEscala: TGroupBox
      Left = 17
      Top = 136
      Width = 400
      Height = 49
      Caption = 'Escala de Conceitos'
      TabOrder = 5
      Visible = False
      object dblcEscala: TwwDBLookupCombo
        Left = 10
        Top = 18
        Width = 380
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'41'#9'DESCRICAO'#9'F')
        DataField = 'IDESCALACONCEITOS'
        DataSource = ds
        LookupTable = CdsEscala
        LookupField = 'IDESCALACONCEITOS'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = True
      end
    end
  end
  inherited Dock972: TDock97
    Width = 434
  end
  inherited Dock971: TDock97
    Top = 387
    Width = 434
    inherited tb97Fundo: TToolbar97
      Left = 264
      DockPos = 266
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 97
      DockPos = 98
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 381
    Top = 15
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
    Left = 382
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 318
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Fatores de Avaliação'
    Colunas.Strings = (
      'IDFATORAVAL'
      'DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'S'
      'N')
    Tabelas.Strings = (
      'FATORAVALCURSO')
    CamposChave.Strings = (
      'IDFATORAVAL')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '200')
    ExibePergunta = False
    Left = 318
    Top = 1
  end
  object CdsEscala: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 306
    Top = 193
    Data = {
      070200009619E0BD01000000180000000B000200000003000000630111494445
      5343414C41434F4E434549544F5308000400000000000D51544445434F4E4345
      49544F53080004000000000009434F4E434549544F3101004900000001000557
      4944544802000200140009434F4E434549544F32010049000000010005574944
      544802000200140009434F4E434549544F330100490000000100055749445448
      02000200140009434F4E434549544F3401004900000001000557494454480200
      0200140009434F4E434549544F35010049000000010005574944544802000200
      140009434F4E434549544F360100490000000100055749445448020002001400
      0D5452474454494E434C5553414F08000800000000000F54524755534552494E
      434C5553414F0100490000000100055749445448020002001E00094445534352
      4943414F01004900000001000557494454480200020029000100044C43494404
      0001000908000000005000000000000000F03F0000000000001040045275696D
      07526567756C617203426F6D05D374696D6F0030CD781EBDCC4208434D313930
      3239300C5275696D2C526567756C617200000000000000000000004000000000
      000018400750E97373696D6F045275696D07526567756C617203426F6D05D374
      696D6F09457863656C656E746500A40D791EBDCC4208434D3139303239300C50
      E97373696D6F2C5275696D}
  end
end
