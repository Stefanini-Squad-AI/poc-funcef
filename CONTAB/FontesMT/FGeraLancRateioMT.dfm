inherited frmGeraLancRateioMT: TfrmGeraLancRateioMT
  Top = 73
  Caption = 'Geração dos Lançamentos do Rateio por Ativ./Proj.'
  ClientHeight = 400
  ClientWidth = 366
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 366
    Height = 361
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
      Left = 24
      Top = 51
      Width = 101
      Height = 13
      Caption = 'Tipo de operação'
    end
    object lblAtivProj: TLabel
      Left = 24
      Top = 92
      Width = 100
      Height = 13
      Caption = 'Atividade/Projeto'
    end
    object Label1: TLabel
      Left = 24
      Top = 135
      Width = 126
      Height = 13
      AutoSize = False
      Caption = 'Gerando Ativ./Proj... : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 151
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
    object Label6: TLabel
      Left = 24
      Top = 217
      Width = 65
      Height = 13
      Caption = 'Mensagens'
    end
    object Bevel1: TBevel
      Left = 24
      Top = 206
      Width = 321
      Height = 9
      Shape = bsTopLine
    end
    object LblRateio: TLabel
      Left = 152
      Top = 136
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblConta: TLabel
      Left = 152
      Top = 152
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
      OnClick = dblkExercicioClick
      OnExit = dblkExercicioClick
    end
    object dblkPeriodo: TwwDBLookupCombo
      Left = 104
      Top = 27
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
      Top = 67
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
      Style = csDropDownList
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblkUnidNegoc: TwwDBLookupCombo
      Left = 24
      Top = 108
      Width = 321
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'25'#9'Descrição'#9'F'
        'UNECODIGO'#9'10'#9'Código'#9'F')
      LookupTable = cdsAtivProj
      LookupField = 'UNIDNEGOC'
      Style = csDropDownList
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object pgbStatus: TProgressBar
      Left = 24
      Top = 171
      Width = 321
      Height = 21
      Min = 0
      Max = 100
      TabOrder = 4
    end
    object mmLog: TRichEdit
      Left = 24
      Top = 231
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
      TabOrder = 5
    end
    object Anim: TAnimate
      Left = 21
      Top = 167
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
    Top = 361
    Width = 366
    inherited tb97Fundo: TToolbar97
      Left = 196
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 29
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 3
    Top = 363
    TargetsData = (
      1
      1
      (
        'TRichEdit'
        'Text'
        0))
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
    Left = 32
    Top = 15
  end
  object cdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 64
  end
  object cdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 96
  end
end
