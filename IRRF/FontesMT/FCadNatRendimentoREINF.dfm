inherited frmCadNatRendimentoREINF: TfrmCadNatRendimentoREINF
  Left = 400
  Top = 169
  HelpContext = 240021
  Caption = 'Natureza de Rendimentos - REINF'
  ClientHeight = 463
  ClientWidth = 532
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock972: TDock97 [0]
    Width = 532
  end
  inherited Dock971: TDock97 [1]
    Top = 424
    Width = 532
    inherited tb97Fundo: TToolbar97
      Left = 360
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 240019
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited pnlFundo: TPanel [2]
    Width = 532
    Height = 377
    object lblCodigo: TLabel
      Left = 10
      Top = 5
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label1: TLabel
      Left = 10
      Top = 83
      Width = 35
      Height = 13
      Caption = 'Título'
    end
    object Label2: TLabel
      Left = 10
      Top = 122
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label3: TLabel
      Left = 10
      Top = 44
      Width = 124
      Height = 13
      Caption = 'Grupo de Rendimento'
    end
    object Label4: TLabel
      Left = 10
      Top = 333
      Width = 230
      Height = 13
      Caption = 'Natureza de rendimento DIRF associada'
    end
    object edtCodigo: TwwDBEdit
      Left = 10
      Top = 20
      Width = 61
      Height = 21
      DataField = 'CODNATUREZAREINF'
      DataSource = ds
      MaxLength = 5
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnEnter = edtCodigoEnter
      OnExit = edtCodigoExit
    end
    object edtTitulo: TwwDBEdit
      Left = 10
      Top = 98
      Width = 503
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'TITULO'
      DataSource = ds
      MaxLength = 50
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnChange = edtTituloChange
      OnExit = edtTituloChange
    end
    object edtDescricao: TwwDBEdit
      Left = 10
      Top = 137
      Width = 503
      Height = 80
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = edtDescricaoExit
    end
    object edtGrupoRendimento: TEdit
      Left = 10
      Top = 59
      Width = 503
      Height = 21
      TabOrder = 3
    end
    object rgTipoDeclarante: TRadioGroup
      Left = 10
      Top = 289
      Width = 503
      Height = 35
      Caption = 'Tipo de declarante relacionado'
      Columns = 3
      Items.Strings = (
        'Pessoa Física'
        'Pessoa Jurídica'
        'Ambos')
      TabOrder = 7
      OnClick = rgTipoDeclaranteClick
    end
    object lkpCodDirf: TwwDBLookupCombo
      Left = 10
      Top = 347
      Width = 503
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CODDESC'#9'70'#9'Natureza de Rendimento DIRF')
      DataField = 'CODDIRF'
      DataSource = ds
      LookupTable = cdsNatuRendimento
      LookupField = 'CODNATUREZA'
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object chkResidExt: TCheckBox
      Left = 10
      Top = 225
      Width = 503
      Height = 17
      Caption = 'Pode ser usado em tributações de residentes no exterior'
      TabOrder = 4
      OnClick = chkResidExtClick
    end
    object chkTribRend13: TCheckBox
      Left = 10
      Top = 244
      Width = 503
      Height = 17
      Caption = 'Pode ser usado em tributações de rendimento de 13º salário'
      TabOrder = 5
      OnClick = chkTribRend13Click
    end
    object chkTribRendRRA: TCheckBox
      Left = 10
      Top = 263
      Width = 503
      Height = 17
      Caption = 'Pode ser usado em tributações de RRA'
      TabOrder = 6
      OnClick = chkTribRendRRAClick
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 490
    Top = 15
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 326
    Top = 15
  end
  inherited ImlPadrao: TImageList
    Left = 336
    Top = 79
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 264
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 372
    Top = 15
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'NATUREZA_RENDIMENTO_REINF.CODNATUREZAREINF'
      'NATUREZA_RENDIMENTO_REINF.TITULO'
      'NATUREZA_RENDIMENTO_REINF.CODGRUPONATUREZA'
      'NATUREZA_RENDIMENTO_REINF.CODDIRF')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código da Natureza'
      'Descrição'
      'Grupo da Natureza'
      'Rendimento DIRF Associado')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'NATUREZA_RENDIMENTO_REINF')
    CamposChave.Strings = (
      'NATUREZA_RENDIMENTO_REINF.CODNATUREZAREINF')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '6'
      '60'
      '2'
      '4')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      '')
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 432
    Top = 15
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 236
    Top = 63
  end
  object cdsNatuRendimento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 372
    Top = 63
  end
end
