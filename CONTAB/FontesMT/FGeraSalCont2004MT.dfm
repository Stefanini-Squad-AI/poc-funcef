inherited frmGeraSALCONT2004MT: TfrmGeraSALCONT2004MT
  Left = 415
  Top = 240
  HelpContext = 10143
  Caption = 'Geração do Arquivo SIPC-CAP'
  ClientHeight = 384
  ClientWidth = 352
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 352
    Height = 345
    object Label1: TLabel
      Left = 24
      Top = 59
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
      Top = 268
      Width = 274
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Caminho onde será gravado o BALANCETE.TXT'
    end
    object lblPlanoPrev: TLabel
      Left = 24
      Top = 219
      Width = 118
      Height = 13
      Caption = 'Plano Previdenciário'
    end
    object Label2: TLabel
      Left = 186
      Top = 59
      Width = 124
      Height = 13
      Caption = 'Cód. Plano de Contas'
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
    object pgbStatus: TProgressBar
      Left = 1
      Top = 324
      Width = 350
      Height = 20
      Align = alBottom
      Min = 0
      Max = 0
      Step = 1
      TabOrder = 3
    end
    object btnSelecionar: TBitBtn
      Left = 303
      Top = 280
      Width = 25
      Height = 24
      Anchors = [akLeft, akBottom]
      TabOrder = 4
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
      Left = 24
      Top = 282
      Width = 279
      Height = 21
      TabStop = False
      Anchors = [akLeft, akBottom]
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 5
    end
    object dblcPlanoPrev: TwwDBLookupCombo
      Left = 24
      Top = 235
      Width = 305
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'50'#9'Plano Previdenciário'#9'F'
        'CODIGOSPC'#9'15'#9'Cód. SPC'#9'F')
      DataField = 'IDPLANOPREV'
      LookupTable = cdsPlanoPrev
      LookupField = 'IDPLANOPREV'
      Options = [loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object edtEntidade: TEdit
      Left = 24
      Top = 75
      Width = 144
      Height = 21
      MaxLength = 5
      TabOrder = 6
    end
    object rgTotalizacao: TRadioGroup
      Left = 24
      Top = 104
      Width = 297
      Height = 105
      Caption = 'Totalização'
      ItemIndex = 0
      Items.Strings = (
        '&Consolidado'
        'Por &Plano de Benefícios'
        '&Todos')
      TabOrder = 7
      OnClick = rgTotalizacaoClick
    end
    object edtPlanoContas: TDBRealEdit
      Left = 186
      Top = 75
      Width = 133
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 8
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
  end
  inherited Dock971: TDock97
    Top = 345
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
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
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
    Left = 240
    Top = 120
  end
  object ProcuraDir: TProcuraDirDlg
    ShowPath = False
    OnSelectionChanged = ProcuraDirSelectionChanged
    Left = 144
    Top = 16
  end
  object cdsPlanoPrev: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 286
    Top = 158
    Data = {
      400100009619E0BD01000000180000000300050000000300000072000B494450
      4C414E4F505245560800040000000000044E4F4D450100490000000100055749
      44544802000200320009434F4449474F53504301004900000001000557494454
      48020002000F000100044C434944040001000908000000100000000000001040
      28506C616E6F206465205375706C656D656E7461E7E36F206461204DE9646961
      2053616C617269616C00100000000000001440104F70657261E7F5657320436F
      6D756E73001000000000000018401E506C616E6F20646520333525206461204D
      E96469612053616C617269616C00100000000000001C4024506C616E6F204D69
      73746F2064652042656E6566ED63696F205375706C656D656E74617200000000
      000000002240194F70657261E7F565732041646D696E69737472617469766173
      03393938}
  end
  object cdsEntidade: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 152
  end
  object sqlPlanoPrev: TCMSqlParams
    SQL.Strings = (
      'SELECT IDPLANOPREV, -1 AS IDPLANOPREVCONTABIL, NOME, CODIGOSPC'
      'FROM PLANPREV'
      'UNION'
      
        'SELECT IDPLANOPREV, IDPLANOPREV AS IDPLANOPREVCONTABIL, NOME, CO' +
        'DSPC AS CODIGOSPC'
      'FROM PLANPREVCONTABIL'
      'WHERE IDPLANOPREVPREV IS NULL'
      '  AND NVL(ATIVO, '#39'N'#39') = '#39'S'#39
      ' ')
    ClientDataSet = cdsPlanoPrev
    Left = 288
    Top = 208
  end
end
