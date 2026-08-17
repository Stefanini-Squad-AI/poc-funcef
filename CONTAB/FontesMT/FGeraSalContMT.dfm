inherited frmGeraSALCONTMT: TfrmGeraSALCONTMT
  Left = 278
  Top = 152
  HelpContext = 10142
  Caption = 'Geração do Arquivo SIPC-CAP'
  ClientHeight = 306
  ClientWidth = 352
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 352
    Height = 267
    object Label5: TLabel
      Left = 179
      Top = 64
      Width = 83
      Height = 13
      Caption = 'Plano Contábil'
    end
    object Label1: TLabel
      Left = 24
      Top = 64
      Width = 95
      Height = 13
      Caption = 'Cód.da Entidade'
    end
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
    object Label6: TLabel
      Left = 24
      Top = 200
      Width = 274
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Caminho onde será gravado o BALANCETE.TXT'
    end
    object lblPlanoPrev: TLabel
      Left = 24
      Top = 155
      Width = 118
      Height = 13
      Caption = 'Plano Previdenciário'
    end
    object Label2: TLabel
      Left = 24
      Top = 107
      Width = 105
      Height = 13
      Caption = 'Tipo de Balancete'
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
      OnCloseUp = dblkExercicioCloseUp
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
      Top = 80
      Width = 145
      Height = 21
      MaxLength = 5
      TabOrder = 2
    end
    object edtPlano: TEdit
      Left = 179
      Top = 80
      Width = 149
      Height = 21
      MaxLength = 1
      TabOrder = 3
    end
    object pgbStatus: TProgressBar
      Left = 1
      Top = 246
      Width = 350
      Height = 20
      Align = alBottom
      Min = 0
      Max = 0
      Step = 1
      TabOrder = 6
    end
    object btnSelecionar: TBitBtn
      Left = 304
      Top = 210
      Width = 25
      Height = 24
      Anchors = [akLeft, akBottom]
      TabOrder = 7
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
    object edtPath: TEdit
      Left = 22
      Top = 214
      Width = 279
      Height = 21
      TabStop = False
      Anchors = [akLeft, akBottom]
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 8
    end
    object dblcPlanoPrev: TwwDBLookupCombo
      Left = 24
      Top = 171
      Width = 305
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
    object CbTipoBalancete: TwwDBComboBox
      Left = 24
      Top = 123
      Width = 305
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'Consolidado'#9'CS'
        'Operações Comuns'#9'OC'
        'Administrativo'#9'AD'
        'Número do Plano'#9'NP')
      Sorted = False
      TabOrder = 4
      UnboundDataType = wwDefault
      OnChange = CbTipoBalanceteChange
    end
  end
  inherited Dock971: TDock97
    Top = 267
    Width = 352
    inherited tb97Fundo: TToolbar97
      Left = 180
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 11
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 427
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 15
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 24
  end
  object ProcuraDir: TProcuraDirDlg
    ShowPath = False
    OnSelectionChanged = ProcuraDirSelectionChanged
    Left = 232
    Top = 48
  end
  object cdsPlanoPrev: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 158
    Top = 70
  end
end
