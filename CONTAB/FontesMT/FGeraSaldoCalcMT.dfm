inherited frmGeraSaldoCalcMT: TfrmGeraSaldoCalcMT
  Caption = 'Geração de Saldos Calculados'
  ClientHeight = 211
  ClientWidth = 371
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 371
    Height = 172
    object Label3: TLabel
      Left = 24
      Top = 24
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
      Left = 104
      Top = 24
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
    object lblConta: TLabel
      Left = 24
      Top = 116
      Width = 321
      Height = 13
      AutoSize = False
      Caption = 'Gerando Conta : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dblkExercicio: TwwDBLookupCombo
      Left = 24
      Top = 40
      Width = 69
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
    object dblkPeriodo: TwwDBLookupCombo
      Left = 104
      Top = 40
      Width = 241
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
    object cbGeraSubConta: TCheckBox
      Left = 24
      Top = 72
      Width = 321
      Height = 17
      Caption = 'Gera com Subconta'
      TabOrder = 2
    end
    object cbGeraCCusto: TCheckBox
      Left = 24
      Top = 92
      Width = 321
      Height = 17
      Caption = 'Gera com Centro de Custo'
      TabOrder = 3
    end
    object pgbStatus: TProgressBar
      Left = 24
      Top = 136
      Width = 321
      Height = 21
      Min = 0
      Max = 100
      TabOrder = 4
    end
    object Anim: TAnimate
      Left = 20
      Top = 133
      Width = 16
      Height = 16
      Active = False
      AutoSize = False
      CommonAVI = aviFindFile
      StopFrame = 8
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 172
    Width = 371
    inherited tb97Fundo: TToolbar97
      Left = 199
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 30
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 347
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 16
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 160
    Top = 15
  end
end
