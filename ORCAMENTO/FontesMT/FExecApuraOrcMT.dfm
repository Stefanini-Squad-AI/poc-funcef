inherited FrmExecApuraOrcMT: TFrmExecApuraOrcMT
  Left = 136
  Top = 182
  Caption = 'Gerar Orçado basedo nas Fórmulas cadastradas'
  ClientWidth = 653
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 32
    Top = 16
    Width = 39
    Height = 13
    Caption = 'Label1'
  end
  object Label5: TLabel [1]
    Left = 234
    Top = 178
    Width = 168
    Height = 13
    Caption = 'Calcular as Contas - Posição:'
  end
  object Label7: TLabel [2]
    Left = 234
    Top = 194
    Width = 35
    Height = 13
    Caption = 'Inicial'
  end
  object Label8: TLabel [3]
    Left = 291
    Top = 194
    Width = 42
    Height = 13
    Caption = 'Dígitos'
  end
  object Label9: TLabel [4]
    Left = 354
    Top = 194
    Width = 55
    Height = 13
    Caption = 'Conteúdo'
  end
  inherited pnlFundo: TPanel
    Width = 653
    object Bevel1: TBevel
      Left = 8
      Top = 40
      Width = 209
      Height = 49
    end
    object lblExercicio: TLabel
      Left = 16
      Top = 48
      Width = 55
      Height = 13
      Caption = 'Exercício'
    end
    object lblPeriodo: TLabel
      Left = 96
      Top = 48
      Width = 46
      Height = 13
      Caption = 'Período'
    end
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 40
      Height = 13
      Caption = 'Origem'
    end
    object Bevel2: TBevel
      Left = 232
      Top = 40
      Width = 361
      Height = 49
    end
    object Label3: TLabel
      Left = 240
      Top = 48
      Width = 55
      Height = 13
      Caption = 'Exercício'
    end
    object Label4: TLabel
      Left = 232
      Top = 24
      Width = 44
      Height = 13
      Caption = 'Destino'
    end
    object Label6: TLabel
      Left = 18
      Top = 106
      Width = 168
      Height = 13
      Caption = 'Calcular as Contas - Posição:'
    end
    object Label10: TLabel
      Left = 18
      Top = 122
      Width = 35
      Height = 13
      Caption = 'Inicial'
    end
    object Label11: TLabel
      Left = 75
      Top = 122
      Width = 42
      Height = 13
      Caption = 'Dígitos'
    end
    object Label12: TLabel
      Left = 138
      Top = 122
      Width = 55
      Height = 13
      Caption = 'Conteúdo'
    end
    object Label13: TLabel
      Left = 328
      Top = 48
      Width = 64
      Height = 13
      Caption = 'Período Ini'
    end
    object Label14: TLabel
      Left = 464
      Top = 48
      Width = 69
      Height = 13
      Caption = 'Período Fim'
    end
    object dblkExercicio: TwwDBLookupCombo
      Left = 16
      Top = 64
      Width = 65
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'EXERCICIO'#9'10'#9'EXERCICIO')
      LookupField = 'EXERCICIO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblkPeriodo: TwwDBLookupCombo
      Left = 96
      Top = 64
      Width = 105
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPERIODO'#9'60'#9'NOMEPERIODO')
      LookupField = 'PERIODO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object wwDBLookupCombo1: TwwDBLookupCombo
      Left = 240
      Top = 64
      Width = 65
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'EXERCICIO'#9'10'#9'EXERCICIO')
      LookupField = 'EXERCICIO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object sePosIni1: TwwDBSpinEdit
      Left = 18
      Top = 137
      Width = 49
      Height = 21
      Increment = 1
      TabOrder = 3
      UnboundDataType = wwDefault
    end
    object sePosFim1: TwwDBSpinEdit
      Left = 75
      Top = 137
      Width = 49
      Height = 21
      Increment = 1
      TabOrder = 4
      UnboundDataType = wwDefault
    end
    object edConteudo1: TEdit
      Left = 138
      Top = 137
      Width = 124
      Height = 21
      TabOrder = 5
    end
    object pbAguarde: TProgressBar
      Left = 16
      Top = 192
      Width = 273
      Height = 16
      Min = 0
      Max = 100
      TabOrder = 6
    end
    object edtStatus: TEdit
      Left = 16
      Top = 176
      Width = 281
      Height = 15
      BorderStyle = bsNone
      Color = clBtnFace
      TabOrder = 7
      Text = 'Aguarde enquanto os dados são processados...'
    end
    object wwDBLookupCombo2: TwwDBLookupCombo
      Left = 328
      Top = 64
      Width = 105
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPERIODO'#9'60'#9'NOMEPERIODO')
      LookupField = 'PERIODO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object wwDBLookupCombo3: TwwDBLookupCombo
      Left = 464
      Top = 64
      Width = 105
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPERIODO'#9'60'#9'NOMEPERIODO')
      LookupField = 'PERIODO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 9
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Width = 653
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65531
    Top = 65515
  end
end
