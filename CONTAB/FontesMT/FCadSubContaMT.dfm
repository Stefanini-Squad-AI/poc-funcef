inherited frmCadSubContaMT: TfrmCadSubContaMT
  Left = 206
  Top = 224
  Caption = 'Cadastro de Sub-Contas'
  ClientHeight = 212
  ClientWidth = 490
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 490
    Height = 126
    object Label1: TLabel
      Left = 12
      Top = 32
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label2: TLabel
      Left = 112
      Top = 32
      Width = 62
      Height = 13
      Caption = 'Descrição '
    end
    object Label3: TLabel
      Left = 24
      Top = 88
      Width = 237
      Height = 13
      Caption = 'Código da última Sub-Conta cadastrada : '
    end
    object lblUltima: TLabel
      Left = 264
      Top = 88
      Width = 49
      Height = 13
      AutoSize = False
      Caption = '----'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbrSubConta: TDBRealEdit
      Left = 12
      Top = 48
      Width = 97
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      MaxLength = 6
      TabOrder = 0
      WordWrap = False
      IntDigits = 7
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
      DataField = 'CODSUBCONTA'
      DataSource = ds
    end
    object dbeNomeSubConta: TwwDBEdit
      Left = 112
      Top = 48
      Width = 353
      Height = 21
      DataField = 'NOMESUBCONTA'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 490
  end
  inherited Dock971: TDock97
    Top = 173
    Width = 490
    inherited tb97Fundo: TToolbar97
      Left = 318
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 149
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 402
    Top = 23
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 294
    Top = 15
  end
  inherited ImlPadrao: TImageList
    Left = 368
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 264
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 324
    Top = 15
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'SUBCONTA.CODSUBCONTA'
      'SUBCONTA.NOMESUBCONTA')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código Sub-conta'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'SUBCONTA')
    CamposChave.Strings = (
      'SUBCONTA.CODSUBCONTA'
      'SUBCONTA.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    Left = 432
    Top = 23
  end
end
