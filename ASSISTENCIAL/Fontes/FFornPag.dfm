inherited frmFornPag: TfrmFornPag
  Left = 134
  Top = 162
  Caption = 'Cálculo de Pagamento ao Fornecedor'
  ClientHeight = 325
  ClientWidth = 530
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 4
    Top = 193
    Width = 116
    Height = 13
    Caption = 'Data de Referência '
  end
  object Label2: TLabel [1]
    Left = 249
    Top = 234
    Width = 47
    Height = 13
    Caption = 'Motivo :'
  end
  object Label3: TLabel [2]
    Left = 4
    Top = 233
    Width = 117
    Height = 13
    Caption = 'Data de Pagamento '
  end
  object Label6: TLabel [3]
    Left = 8
    Top = 191
    Width = 108
    Height = 13
    Caption = 'Mês de Referência'
  end
  inherited Dock971: TDock97 [4]
    Top = 286
    Width = 530
    object Label17: TLabel [0]
      Left = 8
      Top = 21
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    inherited tb97Fundo: TToolbar97
      Left = 360
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
        OnClick = bbtnCancelarClick
      end
    end
    object ProgressBar1: TProgressBar
      Left = 6
      Top = 2
      Width = 179
      Height = 16
      Min = 0
      Max = 100
      TabOrder = 2
    end
  end
  object Memo1: TMemo [5]
    Left = 311
    Top = 103
    Width = 185
    Height = 89
    Lines.Strings = (
      '')
    TabOrder = 0
    Visible = False
  end
  inherited pnlFundo: TPanel [6]
    Width = 530
    Height = 286
    TabOrder = 2
    object Label4: TLabel
      Left = 11
      Top = 234
      Width = 87
      Height = 13
      Caption = 'Data de Cobrança'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 11
      Top = 193
      Width = 90
      Height = 13
      Caption = 'Mês de Referência'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 294
      Top = 234
      Width = 32
      Height = 13
      Caption = 'Motivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 5
      Width = 228
      Height = 187
      Caption = 'Fornecedores'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object wwDBGrid1: TwwDBGrid
        Left = 2
        Top = 18
        Width = 224
        Height = 167
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsforn
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -16
        TitleFont.Name = 'Bookman Old Style'
        TitleFont.Style = [fsItalic]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object GroupBox2: TGroupBox
      Left = 291
      Top = 5
      Width = 233
      Height = 225
      Caption = 'Planos Assistenciais'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object wwDBGrid2: TwwDBGrid
        Left = 2
        Top = 18
        Width = 229
        Height = 205
        Selected.Strings = (
          'NOME'#9'40'#9'Nome')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsplano
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -16
        TitleFont.Name = 'Bookman Old Style'
        TitleFont.Style = [fsItalic]
        TitleLines = 1
        TitleButtons = False
        OnColEnter = wwDBGrid2ColEnter
        IndicatorColor = icBlack
      end
    end
    object DataPag: TCMDateTimePicker
      Left = 10
      Top = 249
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 2
    end
    object spin1: TSpinEdit
      Left = 9
      Top = 206
      Width = 73
      Height = 22
      EditorEnabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxValue = 2100
      MinValue = 1997
      ParentFont = False
      TabOrder = 3
      Value = 1997
    end
    object cmb1: TComboBox
      Left = 83
      Top = 206
      Width = 109
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 4
      Items.Strings = (
        'JANEIRO'
        'FEVEREIRO'
        'MARÇO'
        'ABRIL'
        'MAIO'
        'JUNHO'
        'JULHO'
        'AGOSTO'
        'SETEMBRO'
        'OUTUBRO'
        'NOVEMBRO'
        'DEZEMBRO')
    end
    object cmbmotivo: TwwDBLookupCombo
      Left = 291
      Top = 249
      Width = 233
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'DESCRICAO')
      LookupTable = qrymotivo
      LookupField = 'IDMOTIVO'
      ParentFont = False
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 139
    Top = 139
  end
  object qryforn: TwwQuery
    AfterScroll = qryfornAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PESSOA.IDPESSOA , PESSOA.NOME'
      'FROM FORNSERV , PESSOA'
      'WHERE FORNSERV.IDPESSOA  IN( SELECT IDFORNSERV FROM PLANASS)  '
      'AND PESSOA.IDPESSOA = FORNSERV.IDPESSOA'
      'ORDER BY PESSOA.NOME')
    ValidateWithMask = True
    Left = 26
    Top = 102
  end
  object dsforn: TwwDataSource
    DataSet = qryforn
    Left = 26
    Top = 62
  end
  object qryplano: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsforn
    SQL.Strings = (
      'SELECT  *  FROM PLANASS'
      'WHERE IDFORNSERV =   :IDPESSOA'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 448
    Top = 6
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsplano: TwwDataSource
    DataSet = qryplano
    Left = 448
    Top = 56
  end
  object dsRegraIn: TwwDataSource
    DataSet = qryRegraIn
    Left = 256
    Top = 56
  end
  object qryRegraIn: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 256
    Top = 8
  end
  object qryHistPag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from histpag')
    ValidateWithMask = True
    Left = 98
    Top = 78
  end
  object dsHstPag: TwwDataSource
    DataSet = qryHistPag
    Left = 72
    Top = 64
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 186
    Top = 30
  end
  object dsAux: TwwDataSource
    DataSet = qryAux
    Left = 186
    Top = 78
  end
  object RegraFornPag: TRegra
    QueryIn = qryRegraIn
    DatabaseName = 'BaseDados'
    ParamOut = 'VALOR'
    IdCalculo = 0
    Left = 328
    Top = 6
  end
  object qryRegraOut: TwwQuery
    BeforeOpen = qryRegraOutBeforeOpen
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 328
    Top = 54
  end
  object qrymotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM  MOTIVO'
      'ORDER BY  DESCRICAO')
    ValidateWithMask = True
    Left = 233
    Top = 133
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 134
    Top = 61
  end
end
