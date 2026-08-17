inherited frmCadSaldoCotasPlanPatroMT: TfrmCadSaldoCotasPlanPatroMT
  Left = 120
  Top = 136
  Caption = 'Cadastro dos Saldos de Cotas por Plano e Patrocinadora'
  ClientHeight = 233
  ClientWidth = 572
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 572
    Height = 147
    object Label3: TLabel
      Left = 23
      Top = 77
      Width = 55
      Height = 13
      Caption = 'Exercício'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 103
      Top = 77
      Width = 46
      Height = 13
      Caption = 'Período'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPlanoPrev: TLabel
      Left = 24
      Top = 24
      Width = 118
      Height = 13
      Caption = 'Plano Previdenciário'
    end
    object lblPatro: TLabel
      Left = 288
      Top = 24
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Label1: TLabel
      Left = 323
      Top = 77
      Width = 128
      Height = 13
      Caption = 'Quantidade de Quotas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dblkExercicio: TwwDBLookupCombo
      Left = 23
      Top = 93
      Width = 65
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PEREXERCICIO'#9'10'#9'Exercício')
      DataField = 'PEREXERCICIO'
      DataSource = ds
      LookupTable = cdsExercicio
      LookupField = 'PEREXERCICIO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dblkPeriodo: TwwDBLookupCombo
      Left = 103
      Top = 93
      Width = 209
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PERNOME'#9'25'#9'Nome')
      DataField = 'PERNUMERO'
      DataSource = ds
      LookupTable = cdsPeriodo
      LookupField = 'PERNUMERO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dblcPlanoPrev: TwwDBLookupCombo
      Left = 24
      Top = 40
      Width = 257
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'50'#9'Plano Previdenciário'#9'F')
      DataField = 'IDPLANOPREV'
      DataSource = ds
      LookupTable = cdsPlanoPrev
      LookupField = 'IDPLANOPREV'
      Style = csDropDownList
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcPatro: TwwDBLookupCombo
      Left = 290
      Top = 40
      Width = 257
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Patrocinadora'#9'F')
      DataField = 'IDPATRO'
      DataSource = ds
      LookupTable = cdsPatro
      LookupField = 'IDPESSOA'
      Style = csDropDownList
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbreQtdeCotas: TDBRealEdit
      Left = 323
      Top = 93
      Width = 145
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 4
      WordWrap = False
      IntDigits = 10
      DecDigits = 7
      NumberFormat = fNumber
      Signal = False
      DataField = 'QTDECOTAS'
      DataSource = ds
    end
  end
  inherited Dock972: TDock97
    Width = 572
  end
  inherited Dock971: TDock97
    Top = 194
    Width = 572
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 77
    Top = 18
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 142
    Top = 18
  end
  inherited ImlPadrao: TImageList
    Left = 15
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 294
    Top = 16
  end
  inherited Cds: TCMClientDataSet
    Left = 199
    Top = 18
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RATEIOPLANPATRO.PEREXERCICIO'
      'RATEIOPLANPATRO.PERNUMERO'
      'PESSOA.NOME'
      'PLANPREVCONTABIL.NOME'
      'RATEIOPLANPATRO.QTDECOTAS'
      'PERIODO.PERNOME')
    TipodeDado.Strings = (
      'N'
      'N'
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Exercício'
      'Número do Período'
      'Patrocinadora'
      'Plano Previdenciário'
      'Qtde. de Cotas'
      'Nome do Período')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RATEIOPLANPATRO'
      'PESSOA'
      'PLANPREVCONTABIL'
      'PERIODO')
    CamposChave.Strings = (
      'RATEIOPLANPATRO.IDRATEIOPLANPATRO')
    Filtro.Strings = (
      'PLANPREVCONTABIL.IDPLANOPREV = RATEIOPLANPATRO.IDPLANOPREV'
      'PESSOA.IDPESSOA = RATEIOPLANPATRO.IDPATRO'
      'PERIODO.PEREXERCICIO(+) = RATEIOPLANPATRO.PEREXERCICIO'
      'PERIODO.PERNUMERO(+) = RATEIOPLANPATRO.PERNUMERO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '60'
      '50'
      '10'
      '25')
    Left = 500
    Top = 14
  end
  object cdsExercicio: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 43
    Top = 142
  end
  object cdsPeriodo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 206
    Top = 142
  end
  object cdsPlanoPrev: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 158
    Top = 70
  end
  object cdsPatro: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 398
    Top = 70
  end
end
