inherited frmSegregaPlanPatroMT: TfrmSegregaPlanPatroMT
  Left = 142
  Top = 113
  Caption = 'Geração dos Lançamentos de Segregação por Plano e Patrocinadora'
  ClientHeight = 388
  ClientWidth = 556
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 556
    Height = 349
    object Label4: TLabel
      Left = 104
      Top = 11
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
    object Label3: TLabel
      Left = 24
      Top = 11
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
    object Label5: TLabel
      Left = 320
      Top = 11
      Width = 101
      Height = 13
      Caption = 'Tipo de operação'
    end
    object lblRateio: TLabel
      Left = 24
      Top = 122
      Width = 513
      Height = 13
      AutoSize = False
      Caption = 'Gerando Plano / Patrocinadora: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblConta: TLabel
      Left = 24
      Top = 138
      Width = 513
      Height = 13
      AutoSize = False
      Caption = 'Gerando Conta : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 24
      Top = 187
      Width = 513
      Height = 9
      Shape = bsTopLine
    end
    object Label6: TLabel
      Left = 24
      Top = 197
      Width = 65
      Height = 13
      Caption = 'Mensagens'
    end
    object lblPlanoPrev: TLabel
      Left = 24
      Top = 54
      Width = 118
      Height = 13
      Caption = 'Plano Previdenciário'
    end
    object lblPatro: TLabel
      Left = 288
      Top = 54
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object dblkPeriodo: TwwDBLookupCombo
      Left = 104
      Top = 27
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
      DataField = 'PEREXERCI'
      LookupTable = cdsPeriodo
      LookupField = 'PERNUMERO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dblkExercicio: TwwDBLookupCombo
      Left = 24
      Top = 27
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
      DataField = 'PEREXERCI'
      LookupTable = cdsExercicio
      LookupField = 'PEREXERCICIO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnCloseUp = dblkExercicioCloseUp
    end
    object pgbStatus: TProgressBar
      Left = 24
      Top = 163
      Width = 513
      Height = 16
      Min = 0
      Max = 100
      TabOrder = 3
    end
    object memLog: TRichEdit
      Left = 24
      Top = 214
      Width = 513
      Height = 113
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object dblkTipoOper: TwwDBLookupCombo
      Left = 320
      Top = 27
      Width = 225
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
      LookupTable = cdsTipoOper
      LookupField = 'TIPCODIGO'
      Style = csDropDownList
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcPlanoPrev: TwwDBLookupCombo
      Left = 24
      Top = 70
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
      LookupTable = cdsPlanoPrev
      LookupField = 'IDPLANOPREV'
      Style = csDropDownList
      ParentFont = False
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcPatro: TwwDBLookupCombo
      Left = 288
      Top = 70
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
      LookupTable = cdsPatro
      LookupField = 'IDPESSOA'
      Style = csDropDownList
      ParentFont = False
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object cbSomentePer: TCheckBox
      Left = 24
      Top = 99
      Width = 385
      Height = 17
      Caption = 'Considera somente o saldo de cota do Período'
      TabOrder = 7
    end
  end
  inherited Dock971: TDock97
    Top = 349
    Width = 556
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 507
    Top = 203
  end
  object cdsExercicio: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 99
    Top = 201
  end
  object cdsPeriodo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 214
    Top = 206
  end
  object cdsTipoOper: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 294
    Top = 206
  end
  object cdsPlanoPrev: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 382
    Top = 206
  end
  object cdsPatro: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 454
    Top = 206
  end
end
