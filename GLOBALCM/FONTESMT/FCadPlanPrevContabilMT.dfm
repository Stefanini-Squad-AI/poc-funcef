inherited FrmCadPlanPrevContabil: TFrmCadPlanPrevContabil
  Left = 487
  Top = 212
  Caption = 'Plano Previdenciário Contábil'
  ClientHeight = 309
  ClientWidth = 336
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 336
    Height = 223
    TabOrder = 1
    object Label1: TLabel
      Left = 18
      Top = 10
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 18
      Top = 61
      Width = 118
      Height = 13
      Caption = 'Plano Previdenciário'
    end
    object Label3: TLabel
      Left = 251
      Top = 61
      Width = 68
      Height = 13
      Caption = 'Código SPC'
    end
    object lbCodSPC: TLabel
      Left = 272
      Top = 80
      Width = 49
      Height = 13
      AutoSize = False
    end
    object Label4: TLabel
      Left = 37
      Top = 172
      Width = 201
      Height = 13
      Caption = 'identificados no controle financeiro'
    end
    object dbedPlanPrevContabil: TwwDBEdit
      Left = 18
      Top = 25
      Width = 301
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbckAtivo: TDBCheckBox
      Left = 18
      Top = 131
      Width = 57
      Height = 17
      Caption = 'Ativo'
      DataField = 'ATIVO'
      DataSource = ds
      TabOrder = 4
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object cboPlanoPrevPrev: TwwDBLookupCombo
      Left = 18
      Top = 77
      Width = 214
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'40'#9'Descrição'#9'F')
      DataField = 'IDPLANOPREVPREV'
      DataSource = ds
      LookupTable = cdsPlanPrevPrev
      LookupField = 'IDPLANOPREV'
      Options = [loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnChange = cboPlanoPrevPrevChange
    end
    object edtCodSPC: TDBEdit
      Left = 251
      Top = 78
      Width = 70
      Height = 21
      DataField = 'CODSPC'
      DataSource = ds
      MaxLength = 10
      TabOrder = 2
    end
    object DBckIdentificado: TDBCheckBox
      Left = 18
      Top = 154
      Width = 303
      Height = 17
      Caption = 'Destina-se ao lançamento de valores não '
      DataField = 'FLGNAOIDENTIFICAD'
      DataSource = ds
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object dbckUsoPGA: TDBCheckBox
      Left = 18
      Top = 107
      Width = 143
      Height = 17
      Caption = 'Uso exclusivo PGA'
      DataField = 'FLGUsoPGA'
      DataSource = ds
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object chkUsoExclusivoContab: TDBCheckBox
      Left = 18
      Top = 192
      Width = 297
      Height = 17
      Caption = 'Uso exclusivo da contabilidade'
      DataField = 'FLGEXCLUSIVOCONTAB'
      DataSource = ds
      TabOrder = 6
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  inherited Dock972: TDock97
    Width = 336
  end
  inherited Dock971: TDock97
    Top = 270
    Width = 336
    inherited tb97Fundo: TToolbar97
      Left = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 74
    Top = 59
  end
  inherited ds: TwwDataSource
    Left = 130
    Top = 11
  end
  inherited ImlPadrao: TImageList
    Left = 72
    Top = 11
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 180
    Top = 11
  end
  inherited Cds: TCMClientDataSet
    Left = 128
    Top = 59
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'PLANPREVCONTABIL.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PLANPREVCONTABIL')
    CamposChave.Strings = (
      'PLANPREVCONTABIL.IDPLANOPREV')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '50')
    OperComparador.Strings = (
      '-1')
    LookupSQL.Strings = (
      '')
    LookupCampoChave.Strings = (
      '')
    LookupCampoExibe.Strings = (
      '')
    Left = 180
    Top = 59
  end
  object cdsPlanPrevPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 15
  end
  object cdsCodSPC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 55
  end
end
