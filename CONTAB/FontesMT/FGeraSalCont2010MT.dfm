inherited FrmGeraSalCont2010MT: TFrmGeraSalCont2010MT
  Left = 697
  Top = 278
  Caption = 'SICADI'
  ClientHeight = 276
  ClientWidth = 347
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 347
    Height = 237
    object Label3: TLabel
      Left = 24
      Top = 16
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
      Left = 120
      Top = 16
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
    object Label1: TLabel
      Left = 24
      Top = 59
      Width = 95
      Height = 13
      Caption = 'Cód.da Entidade'
    end
    object Label2: TLabel
      Left = 186
      Top = 59
      Width = 124
      Height = 13
      Caption = 'Cód. Plano de Contas'
    end
    object Label6: TLabel
      Left = 24
      Top = 173
      Width = 216
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Caminho onde será gravado o arquivo'
    end
    object LblEmail: TLabel
      Left = 24
      Top = 104
      Width = 179
      Height = 13
      Caption = 'E-mails de Retorno de Arquivos'
    end
    object dblkExercicio: TwwDBLookupCombo
      Left = 24
      Top = 32
      Width = 81
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
    end
    object dblkPeriodo: TwwDBLookupCombo
      Left = 120
      Top = 32
      Width = 203
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
    object edtEntidade: TEdit
      Left = 24
      Top = 75
      Width = 144
      Height = 21
      MaxLength = 5
      TabOrder = 2
    end
    object edtPlanoContas: TDBRealEdit
      Left = 186
      Top = 75
      Width = 133
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 3
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object edtPath: TEdit
      Left = 24
      Top = 187
      Width = 279
      Height = 21
      TabStop = False
      Anchors = [akLeft, akBottom]
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 6
    end
    object pgbStatus: TProgressBar
      Left = 1
      Top = 216
      Width = 345
      Height = 20
      Align = alBottom
      Min = 0
      Max = 0
      Step = 1
      TabOrder = 7
    end
    object btnSelecionar: TBitBtn
      Left = 303
      Top = 185
      Width = 25
      Height = 24
      Anchors = [akLeft, akBottom]
      TabOrder = 5
      OnClick = btnSelecionarClick
      Glyph.Data = {
        16010000424D1601000000000000760000002800000010000000140000000100
        040000000000A000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888880088888888888880910888888888888089108888888888880890000088
        88888880800FFF088888888800FFFFF0888888880FFFFFFF0888870008888888
        0088800B0F8F8F8F0B088007B0F8F8F0B70880B07B0F8F0B7B0880F0B7B777B7
        B7B080BF0B7B7B7B7B7080FBF0000000000880BFBFBFBFBFB08880FBFBFBFBFB
        F08880BFB0000000078887000788888888888888888888888888}
    end
    object mmoEmails: TMemo
      Left = 24
      Top = 120
      Width = 295
      Height = 49
      Hint = 'Colocar um e-mail por linha'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
  end
  inherited Dock971: TDock97
    Top = 237
    Width = 347
    inherited tb97Fundo: TToolbar97
      Left = 175
      inherited bbtnSair: TBitBtn
        TabOrder = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        TabOrder = 0
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 6
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 51
    Top = 355
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object ProcuraDir: TProcuraDirDlg
    ShowPath = False
    OnSelectionChanged = ProcuraDirSelectionChanged
    Left = 264
    Top = 64
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 15
  end
  object cdsEntidade: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 184
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 56
  end
end
