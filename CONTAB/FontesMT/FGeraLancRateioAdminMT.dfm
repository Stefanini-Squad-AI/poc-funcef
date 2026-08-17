inherited frmGeraLancRateioAdminMT: TfrmGeraLancRateioAdminMT
  Left = 220
  Top = 52
  Caption = 'Geração dos Lançamentos do Rateio Administrativo'
  ClientHeight = 379
  ClientWidth = 369
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 369
    Height = 340
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
    object Label2: TLabel
      Left = 24
      Top = 64
      Width = 101
      Height = 13
      Caption = 'Tipo de operação'
    end
    object Label1: TLabel
      Left = 24
      Top = 192
      Width = 65
      Height = 13
      Caption = 'Mensagens'
    end
    object Label5: TLabel
      Left = 24
      Top = 109
      Width = 126
      Height = 13
      AutoSize = False
      Caption = 'Gerando Rateio .......: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 24
      Top = 125
      Width = 129
      Height = 13
      AutoSize = False
      Caption = 'Gerando Conta ........: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblConta: TLabel
      Left = 152
      Top = 127
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblRateio: TLabel
      Left = 152
      Top = 111
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dblkExercicio: TwwDBLookupCombo
      Left = 24
      Top = 40
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
    object dblkTipoOper: TwwDBLookupCombo
      Left = 24
      Top = 80
      Width = 321
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
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object pgbStatus: TProgressBar
      Left = 24
      Top = 149
      Width = 321
      Height = 21
      Min = 0
      Max = 100
      TabOrder = 3
    end
    object mmLog: TRichEdit
      Left = 24
      Top = 208
      Width = 321
      Height = 113
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 1200
      ParentFont = False
      PlainText = True
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object Anim: TAnimate
      Left = 21
      Top = 148
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
    Top = 340
    Width = 369
    inherited tb97Fundo: TToolbar97
      Left = 199
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 32
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 347
    TargetsData = (
      1
      1
      (
        'TRichEdit'
        'Text'
        0))
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 15
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 16
  end
  object cdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 64
  end
end
