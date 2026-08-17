inherited frmCadEventAssist: TfrmCadEventAssist
  Left = 27
  Top = 117
  Caption = 'Cadastro de Eventos Assistenciais'
  ClientHeight = 399
  ClientWidth = 699
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 699
    Height = 313
    object Panel3: TPanel
      Left = 5
      Top = 5
      Width = 689
      Height = 157
      Align = alTop
      TabOrder = 0
      object Label10: TLabel
        Left = 14
        Top = 15
        Width = 29
        Height = 13
        Caption = 'Titular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 16
        Top = 46
        Width = 69
        Height = 13
        Caption = 'Patrocinadora '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 100
        Width = 100
        Height = 13
        Caption = 'Plano Previdenciário '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 16
        Top = 127
        Width = 85
        Height = 13
        Caption = 'Plano Assistencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 16
        Top = 73
        Width = 20
        Height = 13
        Caption = 'Filial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 88
        Top = 15
        Width = 441
        Height = 21
        Cursor = crNo
        TabStop = False
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object wwDBLookupCombo1: TwwDBLookupCombo
        Left = 172
        Top = 98
        Width = 361
        Height = 21
        Cursor = crNo
        TabStop = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'NOME')
        LookupTable = qryplanoprev
        LookupField = 'IDPLANOPREV'
        Enabled = False
        ReadOnly = True
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object wwDBLookupCombo2: TwwDBLookupCombo
        Left = 172
        Top = 125
        Width = 361
        Height = 21
        Cursor = crNo
        TabStop = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'40'#9'NOME')
        LookupTable = qryplanass
        LookupField = 'IDPLANASS'
        Enabled = False
        ReadOnly = True
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object DBLookupComboBox1: TwwDBLookupCombo
        Left = 172
        Top = 43
        Width = 360
        Height = 21
        Cursor = crNo
        TabStop = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qrypatro
        LookupField = 'IDPESSOA'
        Enabled = False
        ReadOnly = True
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object BitBtn2: TBitBtn
        Left = 556
        Top = 13
        Width = 86
        Height = 37
        Hint = 'Procurar participante'
        Caption = '&Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = BitBtn1Click
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      end
      object edfilial: TEdit
        Left = 172
        Top = 71
        Width = 359
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 5
      end
    end
    object Panel2: TPanel
      Left = 5
      Top = 165
      Width = 689
      Height = 143
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label6: TLabel
        Left = 12
        Top = 49
        Width = 41
        Height = 13
        Caption = 'Serviços'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 288
        Top = 49
        Width = 23
        Height = 13
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 496
        Top = 49
        Width = 24
        Height = 13
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 11
        Top = 14
        Width = 55
        Height = 13
        Caption = 'Beneficiário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object GroupBox1: TGroupBox
        Left = 1
        Top = 79
        Width = 687
        Height = 63
        Align = alBottom
        Caption = 'Pagamento (Reembolso)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object Label4: TLabel
          Left = 496
          Top = 31
          Width = 24
          Height = 13
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 288
          Top = 29
          Width = 23
          Height = 13
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DateEdit4: TCMDateTimePicker
          Left = 334
          Top = 28
          Width = 121
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          Epoch = 1950
          ButtonGlyph.Data = {
            06050000424D06050000000000003604000028000000100000000D0000000100
            080000000000D000000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
            000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
            A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
            FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
            04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
            000000000000000000FF}
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 0
          OnEnter = DateEdit4Click
        end
        object wwDBEdit1: TRealEdit
          Left = 552
          Top = 29
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '      0,00')
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
      object DateEdit3: TCMDateTimePicker
        Left = 336
        Top = 48
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        Enabled = False
        ShowButton = True
        TabOrder = 2
        OnEnter = DateEdit3Click
      end
      object dblkpcmbdepend: TwwDBLookupCombo
        Left = 88
        Top = 12
        Width = 425
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qrydepend
        LookupField = 'IDPESSOA'
        Enabled = False
        ReadOnly = True
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dbediddep: TwwDBEdit
        Left = 552
        Top = 0
        Width = 121
        Height = 21
        DataField = 'IDDEPENDENTE'
        DataSource = ds
        TabOrder = 4
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object dbedidtit: TwwDBEdit
        Left = 568
        Top = 1
        Width = 121
        Height = 21
        DataField = 'IDTITULAR'
        DataSource = ds
        TabOrder = 5
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object dbedvalevento: TRealEdit
        Left = 552
        Top = 46
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Enabled = False
        Lines.Strings = (
          '      0,00')
        TabOrder = 6
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object DBLkpCmbevent: TwwDBLookupCombo
        Left = 87
        Top = 47
        Width = 194
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qryevent
        LookupField = 'IDSERVASS'
        Enabled = False
        ReadOnly = True
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = DBLkpCmbeventCloseUp
        OnEnter = DBLkpCmbeventEnter
        OnExit = DBLkpCmbeventExit
      end
    end
  end
  inherited Dock972: TDock97
    Width = 699
    object sbtnimport: TSpeedButton [0]
      Left = 612
      Top = 0
      Width = 86
      Height = 45
      Caption = '&Importar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFB
        FB0555557F555555557F55500FBFBFBFBF0555577F555555557F550B0BFBFBFB
        FB05557F7F555555557F500F0FBFBFBFBF05577F7F555555557F0B0B0BFBFBFB
        FB057F7F7F555555557F0F0F0FBFBFBFBF057F7F7FFFFFFFFF750B0B00000000
        00557F7F7777777777550F0FB0FBFB0F05557F7FF75FFF7575550B0007000070
        55557F777577775755550FB0FBFB0F0555557FF75FFF75755555000700007055
        5555777577775755555550FBFB0555555555575FFF7555555555570000755555
        5555557777555555555555555555555555555555555555555555}
      Layout = blGlyphTop
      NumGlyphs = 2
      Visible = False
      OnClick = sbtnimportClick
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 360
    Width = 699
    inherited dbnav: TDBNavigator [0]
      Hints.Strings = ()
    end
    inherited tb97Fundo: TToolbar97 [1]
      Left = 529
      DockPos = 529
    end
    inherited TB97oKCancelar: TToolbar97 [2]
      Left = 361
      DockPos = 361
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 555
    Top = 65531
  end
  inherited ds: TwwDataSource
    AutoEdit = True
    DataSet = qrycadevent
    Left = 129
    Top = 323
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 426
    Top = 244
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    SearchControls = True
    AlwaysShow = True
    Left = 548
    Top = 269
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 358
    Top = 58
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA, NOME'
      'FROM  PESSOA'
      'WHERE FLGPATROCINADORA = 1'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 159
    Top = 357
    object qrypatroIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
    end
    object qrypatroNOME: TStringField
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
  end
  object dspatro: TwwDataSource
    DataSet = qrypatro
    Left = 71
    Top = 321
  end
  object qryplanoprev: TwwQuery
    BeforeOpen = qryplanoprevBeforeOpen
    AfterOpen = qryplanoprevAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV,NOME'
      'FROM PLANPREV'
      'WHERE IDPLANOPREV IN'
      '('
      'SELECT IDPLANOPREV'
      'FROM PLANPREVPATRO'
      ''
      ')'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 228
    Top = 213
    object qryplanoprevIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryplanoprevNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
  end
  object dsplanoprev: TwwDataSource
    DataSet = qryplanoprev
    Left = 228
    Top = 264
  end
  object qryplanass: TwwQuery
    BeforeOpen = qryplanassBeforeOpen
    AfterOpen = qryplanassAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANASS,NOME,IDFORNSERV'
      'FROM PLANASS'
      'WHERE IDPLANASS IN'
      '('
      'SELECT IDPLANASS'
      'FROM PLANPREVASS'
      ')'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 165
    Top = 213
    object qryplanassIDPLANASS: TFloatField
      FieldName = 'IDPLANASS'
    end
    object qryplanassNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object qryplanassIDFORNSERV: TFloatField
      FieldName = 'IDFORNSERV'
    end
  end
  object dsplanass: TwwDataSource
    DataSet = qryplanass
    Left = 173
    Top = 313
  end
  object qryevent: TwwQuery
    BeforeOpen = qryeventBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TP.*, SE.PRECO ,IDREGRAPAGAMENTO,'
      'IDREGRACOMISSAO , IDREGRAREEMBOLSO'
      'FROM TPSERVASS TP , SERVPLANASS SE'
      'WHERE '
      'TP.IDSERVASS = SE.IDSERVASS '
      'AND SE.IDPLANASS = :IDPLANASS ')
    ValidateWithMask = True
    Left = 630
    Top = 69
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
  end
  object qrytit: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PARTASS.IDPESSOA , PESSOA.NOME, FILIAL.NOME FILIAL'
      'FROM PARTASS , PESSOA , PESSOA FILIAL, ELEGPATRO'
      'WHERE PARTASS.IDPESSJUR = :IDPESSJUR  AND'
      '               PARTASS.IDPLANOPREV =  :IDPLANOPREV  AND'
      '               PARTASS.IDPLANASS = :IDPLANASS  AND '
      '               PARTASS.IDPESSOA = :IDPESSOA  AND'
      'ELEGPATRO.IDPESSOA = PARTASS.IDPESSOA AND'
      'ELEGPATRO.IDPESSJUR = PARTASS.IDPESSJUR AND'
      'ELEGPATRO.IDESTAB = FILIAL.IDPESSOA(+) AND'
      'PESSOA.IDPESSOA = PARTASS.IDPESSOA'
      'ORDER BY NOME'
      ''
      '')
    ValidateWithMask = True
    Left = 596
    Top = 125
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dstit: TwwDataSource
    DataSet = qrytit
    Left = 596
    Top = 176
  end
  object qrydepend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME , IDPESSOA'
      'FROM PESSOA'
      'WHERE IDPESSOA  IN '
      '('
      'SELECT IDDEPENDENTE '
      'FROM BENEFASS '
      'WHERE IDTITULAR =  :IDPESSOA  AND'
      '               IDPESSJUR =  :IDPESSJUR  AND'
      '               IDPLANOPREV =   :IDPLANOPREV AND'
      '               IDPLANASS = :IDPLANASS AND'
      '               FLGATIVO = 1'
      ')'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 346
    Top = 293
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
  end
  object dsdepend: TwwDataSource
    DataSet = qrydepend
    Left = 346
    Top = 337
  end
  object dsevent: TwwDataSource
    DataSet = qryevent
    Left = 638
    Top = 121
  end
  object qrycadevent: TwwQuery
    BeforeInsert = qrycadeventBeforeInsert
    AfterInsert = qrycadeventAfterInsert
    BeforeEdit = qrycadeventBeforeEdit
    AfterEdit = qrycadeventAfterEdit
    BeforePost = qrycadeventBeforePost
    AfterPost = qrycadeventAfterPost
    AfterScroll = qrycadeventAfterScroll
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT  IDTITULAR, IDPLANASS, DATAEVENT, IDSERVASS, IDPESSJUR, I' +
        'DPLANOPREV, '
      
        '                IDDEPENDENTE, ESTATISTICA, VALOREVENT, VALORPAGO' +
        ', DATAPAG, FLGREEMBOLSO, '
      
        '                VALORPAGAMENTO, VALORRECEBIMENTO, VALORREEMBOLSO' +
        ', FLGCOB '
      'FROM EVENTASS')
    PictureMasks.Strings = (
      
        'VALOREVENT'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#' +
        '[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#' +
        '][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[' +
        '#][#]]]}'#9'T'#9'F'
      
        'VALORPAGO'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[' +
        '#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#]' +
        '[#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#' +
        '][#]]]}'#9'T'#9'F')
    ValidateWithMask = True
    Left = 95
    Top = 208
    object qrycadeventIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'EVENTASS.IDTITULAR'
    end
    object qrycadeventIDPLANASS: TFloatField
      FieldName = 'IDPLANASS'
      Origin = 'EVENTASS.IDPLANASS'
    end
    object qrycadeventDATAEVENT: TDateTimeField
      FieldName = 'DATAEVENT'
      Origin = 'EVENTASS.DATAEVENT'
    end
    object qrycadeventIDSERVASS: TFloatField
      FieldName = 'IDSERVASS'
      Origin = 'EVENTASS.IDSERVASS'
    end
    object qrycadeventIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'EVENTASS.IDPESSJUR'
    end
    object qrycadeventIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'EVENTASS.IDPLANOPREV'
    end
    object qrycadeventIDDEPENDENTE: TFloatField
      FieldName = 'IDDEPENDENTE'
      Origin = 'EVENTASS.IDDEPENDENTE'
    end
    object qrycadeventESTATISTICA: TStringField
      FieldName = 'ESTATISTICA'
      Origin = 'EVENTASS.ESTATISTICA'
      Size = 40
    end
    object qrycadeventVALOREVENT: TFloatField
      FieldName = 'VALOREVENT'
      Origin = 'EVENTASS.VALOREVENT'
    end
    object qrycadeventVALORPAGO: TFloatField
      FieldName = 'VALORPAGO'
      Origin = 'EVENTASS.VALORPAGO'
    end
    object qrycadeventDATAPAG: TDateTimeField
      FieldName = 'DATAPAG'
      Origin = 'EVENTASS.DATAPAG'
    end
    object qrycadeventFLGREEMBOLSO: TFloatField
      FieldName = 'FLGREEMBOLSO'
      Origin = 'EVENTASS.FLGREEMBOLSO'
    end
    object qrycadeventVALORPAGAMENTO: TFloatField
      FieldName = 'VALORPAGAMENTO'
      Origin = 'EVENTASS.VALORPAGAMENTO'
    end
    object qrycadeventVALORRECEBIMENTO: TFloatField
      FieldName = 'VALORRECEBIMENTO'
      Origin = 'EVENTASS.VALORRECEBIMENTO'
    end
    object qrycadeventVALORREEMBOLSO: TFloatField
      FieldName = 'VALORREEMBOLSO'
      Origin = 'EVENTASS.VALORREEMBOLSO'
    end
    object qrycadeventFLGCOB: TFloatField
      FieldName = 'FLGCOB'
      Origin = 'EVENTASS.FLGCOB'
    end
  end
  object Qryprocura: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PESSOA.NOME Titular , '
      '       P2.NOME Dependente , '
      '       P3.NOME Patrocinadora ,'
      '       PLANASS.NOME Assistencial,'
      '       PLANPREV.NOME Previdenciario , '
      '       TPSERVASS.NOME Servico ,EVENTASS.DATAEVENT Data,'
      '       EVENTASS.DATAPAG Pagamento,'
      '       EVENTASS.VALOREVENT Valor ,'
      '       EVENTASS.VALORPAGO Pago ,'
      '       EVENTASS.IDPLANASS ,'
      '       EVENTASS.IDPESSJUR ,'
      '       EVENTASS.IDDEPENDENTE,'
      '       EVENTASS.IDSERVASS ,'
      '       EVENTASS.IDPLANOPREV ,'
      '       EVENTASS.IDTITULAR,'
      '       EL.MATRICULA Matricula,'
      '       PT.INSCRICAONUMERO Inscricao     '
      '       '
      'FROM EVENTASS , PESSOA ,PLANASS , PLANPREV ,  PESSOA P2,'
      '     PESSOA P3 , TPSERVASS , ELEGPATRO EL, PARTPREVPLAN PT '
      ''
      'WHERE EVENTASS.IDPLANASS = PLANASS.IDPLANASS AND'
      '      EVENTASS.IDPLANOPREV = PLANPREV.IDPLANOPREV AND'
      '      EVENTASS.IDSERVASS = TPSERVASS.IDSERVASS AND '
      '      EVENTASS.IDPESSJUR = P3.IDPESSOA AND'
      '      EVENTASS.IDTITULAR = PESSOA.IDPESSOA AND'
      '      EVENTASS.IDDEPENDENTE = P2.IDPESSOA AND'
      '      EL.IDPESSOA = PESSOA.IDPESSOA AND'
      '      EL.IDPESSJUR = P3.IDPESSOA AND'
      '      PT.IDPESSOA = PESSOA.IDPESSOA AND'
      '      PT.IDPESSJUR = P3.IDPESSOA AND'
      '      PT.IDPLANOPREV = EVENTASS.IDPLANOPREV'
      ''
      '     ')
    ValidateWithMask = True
    Left = 549
    Top = 160
  end
  object dsprocura: TwwDataSource
    DataSet = Qryprocura
    Left = 272
    Top = 336
  end
  object qryoper: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 373
    Top = 228
  end
  object Regra: TRegra
    QueryIn = qryregrapag
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 461
    Top = 228
  end
  object qryregrapag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PRECO, PARTASS.* , BENEFASS.*'
      'FROM SERVPLANASS , PARTASS, BENEFASS'
      'WHERE '
      'PARTASS.IDPLANASS = SERVPLANASS.IDPLANASS'
      'AND BENEFASS.IDTITULAR = PARTASS.IDPESSOA '
      'AND BENEFASS.IDPLANASS = SERVPLANASS.IDPLANASS'
      'AND BENEFASS.IDPLANOPREV =  PARTASS.IDPLANOPREV '
      'AND BENEFASS.IDPESSJUR = PARTASS.IDPESSJUR '
      'AND PARTASS.IDPLANASS =  :IDPLANASS'
      'AND SERVPLANASS.IDSERVASS =  :IDSERVASS'
      'AND PARTASS.IDPESSJUR =  :IDPESSJUR'
      'AND PARTASS.IDPESSOA =  :IDPESSOA'
      'AND BENEFASS.IDDEPENDENTE =  :IDDEPENDENTE'
      'AND PARTASS.IDPLANOPREV =  :IDPLANOPREV')
    ValidateWithMask = True
    Left = 517
    Top = 212
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDSERVASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDDEPENDENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryaux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 37
    Top = 323
  end
  object qryaux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 197
    Top = 323
  end
  object qryregracomiss: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PRECO, PARTASS.* , BENEFASS.*'
      'FROM SERVPLANASS , PARTASS, BENEFASS'
      'WHERE '
      'PARTASS.IDPLANASS = SERVPLANASS.IDPLANASS'
      'AND BENEFASS.IDTITULAR = PARTASS.IDPESSOA '
      'AND BENEFASS.IDPLANASS = SERVPLANASS.IDPLANASS'
      'AND BENEFASS.IDPLANOPREV =  PARTASS.IDPLANOPREV '
      'AND BENEFASS.IDPESSJUR = PARTASS.IDPESSJUR '
      'AND PARTASS.IDPLANASS =  :IDPLANASS'
      'AND SERVPLANASS.IDSERVASS =  :IDSERVASS'
      'AND PARTASS.IDPESSJUR =  :IDPESSJUR'
      'AND PARTASS.IDPESSOA =  :IDPESSOA'
      'AND BENEFASS.IDDEPENDENTE =  :IDDEPENDENTE'
      'AND PARTASS.IDPLANOPREV =  :IDPLANOPREV'
      '')
    ValidateWithMask = True
    Left = 597
    Top = 284
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDSERVASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDDEPENDENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryregrareemb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PRECO, PARTASS.* , BENEFASS.*'
      'FROM SERVPLANASS , PARTASS, BENEFASS'
      'WHERE '
      'PARTASS.IDPLANASS = SERVPLANASS.IDPLANASS'
      'AND BENEFASS.IDTITULAR = PARTASS.IDPESSOA '
      'AND BENEFASS.IDPLANASS = SERVPLANASS.IDPLANASS'
      'AND BENEFASS.IDPLANOPREV =  PARTASS.IDPLANOPREV '
      'AND BENEFASS.IDPESSJUR = PARTASS.IDPESSJUR '
      'AND PARTASS.IDPLANASS =  :IDPLANASS'
      'AND SERVPLANASS.IDSERVASS =  :IDSERVASS'
      'AND PARTASS.IDPESSJUR =  :IDPESSJUR'
      'AND PARTASS.IDPESSOA =  :IDPESSOA'
      'AND BENEFASS.IDDEPENDENTE =  :IDDEPENDENTE'
      'AND PARTASS.IDPLANOPREV =  :IDPLANOPREV'
      ''
      '')
    ValidateWithMask = True
    Left = 469
    Top = 332
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDSERVASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDDEPENDENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object montaSel: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PESSJUR.NOME'
      'PARTPREVPLAN.INSCRICAODATA'
      'PARTASS.INSCRICAONUMERO'
      'PARTASS.DATAENTRADA'
      'FILIAL.NOME'
      'PLANASS.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C'
      'D'
      'C'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Matricula'
      'Participante'
      'Inscrição Previdenciária'
      'Plano Previdenciário'
      'Patrocinadora'
      'Data de Insc. Previdenciária'
      'Inscrição Assistencial'
      'Data de Insc. Assistencial'
      'Filial'
      'Plano Assistencial')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOA PESSJUR'
      'PLANASS'
      'PARTASS'
      'PLANPREV'
      'PARTPREVPLAN'
      'ELEGPATRO'
      'PESSOA FILIAL')
    CamposChave.Strings = (
      'PARTASS.IDPESSOA'
      'PARTASS.IDPLANASS'
      'PARTASS.IDPLANOPREV'
      'PARTASS.IDPESSJUR')
    Filtro.Strings = (
      'ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PESSJUR.IDPESSOA'
      'PARTASS.IDPESSOA = ELEGPATRO.IDPESSOA'
      'PARTASS.IDPESSJUR = ELEGPATRO.IDPESSJUR'
      'PARTASS.IDPLANASS = PLANASS.IDPLANASS'
      'PARTASS.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PARTPREVPLAN.IDPESSOA = PARTASS.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR = PARTASS.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PARTASS.IDPLANOPREV'
      'FILIAL.IDPESSOA(+) = ELEGPATRO.IDESTAB')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 392
    Top = 25
  end
  object MontaSelProc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'DEPEN.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PESSJUR.NOME'
      'PARTPREVPLAN.INSCRICAODATA'
      'PARTASS.INSCRICAONUMERO'
      'PARTASS.DATAENTRADA'
      'TPSERVASS.NOME'
      'EVENTASS.DATAEVENT'
      'PESSOA.NOME'
      'FILIAL.NOME'
      'PLANASS.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C'
      'D'
      'N'
      'D'
      'C'
      'D'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matricula'
      'Beneficiário'
      'Inscrição Previdenciária'
      'Plano Previdenciário'
      'Patrocinadora'
      'Data de Insc. Previdenciária'
      'Inscrição Assistencial'
      'Data de Insc. Assistencial'
      'Serviço'
      'Data do Evento'
      'Participante'
      'Filial'
      'Plano Assistencial')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOA PESSJUR'
      'PLANASS'
      'PARTASS'
      'PLANPREV'
      'PARTPREVPLAN'
      'ELEGPATRO'
      'TPSERVASS'
      'EVENTASS'
      'PESSOA DEPEN'
      'PESSOA FILIAL')
    CamposChave.Strings = (
      'PARTASS.IDPESSOA'
      'PARTASS.IDPLANASS'
      'PARTASS.IDPLANOPREV'
      'PARTASS.IDPESSJUR'
      'EVENTASS.IDDEPENDENTE'
      'EVENTASS.IDSERVASS'
      'EVENTASS.DATAEVENT')
    Filtro.Strings = (
      'ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PESSJUR.IDPESSOA'
      'PARTASS.IDPESSOA = ELEGPATRO.IDPESSOA'
      'PARTASS.IDPESSJUR = ELEGPATRO.IDPESSJUR'
      'PARTASS.IDPLANASS = PLANASS.IDPLANASS'
      'PARTASS.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PARTPREVPLAN.IDPESSOA = PARTASS.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR = PARTASS.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PARTASS.IDPLANOPREV'
      'EVENTASS.IDTITULAR = PARTASS.IDPESSOA'
      'EVENTASS.IDPLANASS = PARTASS.IDPLANASS'
      'EVENTASS.IDPLANOPREV = PARTASS.IDPLANOPREV'
      'EVENTASS.IDSERVASS = TPSERVASS.IDSERVASS'
      'EVENTASS.IDDEPENDENTE = DEPEN.IDPESSOA'
      'EVENTASS.IDPESSJUR = PARTASS.IDPESSJUR'
      'FILIAL.IDPESSOA(+) = ELEGPATRO.IDESTAB')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 296
    Top = 25
  end
end
