inherited frmGeraCotaPlanPatroMT: TfrmGeraCotaPlanPatroMT
  Left = 142
  Top = 113
  Caption = 
    'Geração da Quantidade de Cotas para a Segregação por Plano e Pat' +
    'rocinadora'
  ClientHeight = 277
  ClientWidth = 486
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 486
    Height = 238
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
    object dblkPeriodo: TwwDBLookupCombo
      Left = 104
      Top = 40
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
    object pgbStatus: TProgressBar
      Left = 24
      Top = 80
      Width = 289
      Height = 16
      Min = 0
      Max = 100
      TabOrder = 2
    end
    object rdgSinal: TRadioGroup
      Left = 328
      Top = 32
      Width = 137
      Height = 65
      ItemIndex = 0
      Items.Strings = (
        'Crédito - Débito'
        'Débito - Crédito')
      TabOrder = 3
    end
    object memLog: TRichEdit
      Left = 24
      Top = 104
      Width = 441
      Height = 113
      ScrollBars = ssVertical
      TabOrder = 4
    end
  end
  inherited Dock971: TDock97
    Top = 238
    Width = 486
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
    Left = 267
    Top = 59
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
end
