inherited FrmReimprBloqMT: TFrmReimprBloqMT
  Left = 427
  Top = 109
  HelpContext = 40046
  BorderStyle = bsSingle
  Caption = ' Libera Reimpressão de Bloqueto'
  ClientHeight = 499
  ClientWidth = 691
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 9
    Top = 106
    Width = 198
    Height = 13
    Cursor = crDrag
    Caption = 'Contas Caixas X Tipo de Cobrança'
  end
  inherited pnlFundo: TPanel
    Width = 691
    Height = 460
    object Panel1: TPanel [0]
      Left = 1
      Top = 1
      Width = 689
      Height = 156
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLabel
        Left = 276
        Top = 60
        Width = 112
        Height = 13
        Cursor = crDrag
        Caption = 'Tipo de Documento'
      end
      object Label3: TLabel
        Left = 523
        Top = 61
        Width = 83
        Height = 13
        Caption = 'Nosso Número'
      end
      object Label4: TLabel
        Left = 276
        Top = 108
        Width = 117
        Height = 13
        Cursor = crDrag
        Caption = 'Usuário Lançamento'
      end
      object Label8: TLabel
        Left = 12
        Top = 61
        Width = 198
        Height = 13
        Cursor = crDrag
        Caption = 'Contas Caixas X Tipo de Cobrança'
      end
      object Label9: TLabel
        Left = 12
        Top = 108
        Width = 106
        Height = 13
        Cursor = crDrag
        Caption = 'Sistema de Origem'
      end
      object CMDBtpdocto: TCMDBLookupCombo
        Left = 276
        Top = 76
        Width = 238
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'DOCUMENTO')
        LookupTable = cdsDoc
        LookupField = 'CODTIPDOC'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object dtnossonum: TEditNum
        Left = 523
        Top = 77
        Width = 147
        Height = 21
        Ctl3D = True
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = dtnossonumKeyPress
        IntDigits = 0
        Signal = False
        DecDigits = 0
        Numeric = False
      end
      object BitBtn1: TBitBtn
        Left = 523
        Top = 111
        Width = 147
        Height = 35
        Caption = 'Seleciona'
        TabOrder = 6
        OnClick = BitBtn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
        Spacing = 2
      end
      object CMDBportforma: TCMDBLookupCombo
        Left = 12
        Top = 77
        Width = 259
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'DESCRICAO')
        LookupTable = cdsPortForma
        LookupField = 'CODPORTFORMA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object CMDBUSUARIO: TCMDBLookupCombo
        Left = 276
        Top = 124
        Width = 238
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEUSUARIO'#9'20'#9'NOMEUSUARIO'#9'F')
        LookupTable = cdsUsuariLanc
        LookupField = 'IDUSUARIO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object CMDBMODULO: TCMDBLookupCombo
        Left = 12
        Top = 124
        Width = 261
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEMODULO'#9'50'#9'NOMEMODULO')
        LookupTable = cdsModulo
        LookupField = 'IDMODULO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object GroupBox1: TGroupBox
        Left = 389
        Top = 10
        Width = 282
        Height = 49
        Caption = ' Data de Emissão do Documento Entre '
        TabOrder = 0
        TabStop = True
        object dtemissao: TCMDateTimePicker
          Left = 9
          Top = 19
          Width = 136
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
          ShowButton = True
          TabOrder = 0
          OnExit = DataExit
        end
        object dtemissaofinal: TCMDateTimePicker
          Left = 147
          Top = 19
          Width = 126
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
          ShowButton = True
          TabOrder = 1
          OnExit = DataExit
        end
      end
    end
    inherited CPForCli: TCMProcuraForCli
      Left = 17
      Top = 11
      Width = 370
      Height = 49
    end
    object Panel2: TPanel
      Left = 1
      Top = 409
      Width = 689
      Height = 50
      Align = alBottom
      BevelInner = bvLowered
      BevelWidth = 2
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 4
      object SbAdTodos: TSpeedButton
        Left = 176
        Top = 10
        Width = 154
        Height = 30
        Caption = 'Marcar &Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88887666666666088888788888888878F887E668866666
          608887F88FFF888887F887E6FFF8666660888788777FF888878F7E66FFFF8666
          66087F887777FF88887F7E66FFFFF86666087F8877777FF8887F7E66FF8FFF86
          66087F8877F777FF887F7E66FF86FFF866087F8877F8777F887F7E66FF666FF8
          660878F87788877FF87887E6666666FF608887F88888887787F887E666666666
          6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        Margin = 13
        NumGlyphs = 2
        ParentFont = False
        Spacing = 13
        OnClick = SbAdTodosClick
      end
      object SbAdInverte: TSpeedButton
        Left = 334
        Top = 10
        Width = 154
        Height = 30
        Caption = '&Inverter Seleção'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888FFFFF8888888888800000888888888FF877777F8888888776666600
          888888F877888887788888766666666608888F878F888888878887666F666666
          60888F78F87888888F788766FF8888666088F87F877FFF8888787E6FFFFFFF66
          6608F7887777777888F77E66FF6666666608F7888778F88888F77E666F66F666
          6608F7888878F78888F77E666666FF666608F788FFFFF77888F77E66FFFFFFF6
          66088788877777778F8787E68888FF6660888F788888F7788F7887E66666F666
          6088887888888788F878887EE666666608888887F88888FF878888877EEEEE00
          8888888877FFFF87788888888777778888888888887777788888}
        Margin = 13
        NumGlyphs = 2
        ParentFont = False
        Spacing = 13
        OnClick = SbAdInverteClick
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 157
      Width = 689
      Height = 34
      Align = alTop
      BevelInner = bvLowered
      BevelWidth = 2
      Caption = 'Documentos Emitidos'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 2
    end
    object cm: TwwDBGrid
      Left = 1
      Top = 191
      Width = 689
      Height = 218
      ControlType.Strings = (
        'EMISBLOQ;CheckBox;N;S')
      Selected.Strings = (
        'EMISBLOQ'#9'7'#9'Reemite'
        'NODOCUMENTO'#9'15'#9'N° Documento'
        'RAZAOSOCIAL'#9'60'#9'Cliente'
        'NOSSONUMERO'#9'20'#9'Nosso Número'
        'DESCRDOCTO'#9'15'#9'Tipo Documento'
        'DATAEMISSAO'#9'13'#9'Dt. Emissão'
        'DATAVENCTO'#9'13'#9'Dt. Vencimento'
        'DATAPROGRAMADA'#9'13'#9'Dt. Programada'
        'DESCRICAO'#9'50'#9'Contas Caixas X Tipo de Cobrança'
        'VALOR'#9'11'#9'Valor'
        'NOMEMODULO'#9'40'#9'Sistema de Origem'
        'NOMEUSUARIO'#9'20'#9'Usuário Lançamento'
        'CONTROLEREMESSA'#9'18'#9'Controle Remessa')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      Color = clWhite
      DataSource = dsSel
      KeyOptions = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 3
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = True
      OnCalcCellColors = cmCalcCellColors
      OnTitleButtonClick = cmTitleButtonClick
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 460
    Width = 691
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 40046
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 163
    Top = 323
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object dsSel: TwwDataSource
    DataSet = cdsSel
    Left = 595
    Top = 255
  end
  object cdsDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 393
    Top = 61
  end
  object sqlPortForma: TCMSqlParams
    SQL.Strings = (
      'SELECT CODPORTFORMA,'
      '       DESCRICAO'
      'FROM   PORTADORFORMA'
      'WHERE  RECPAG = '#39'R'#39' AND'
      '       ((CODBLOQCHE IS NOT NULL) OR'
      '        (CODARQUIVOREMESSA IS NOT NULL) OR'
      '        (IDCONFIGBARRAS IS NOT NULL))'
      'ORDER BY DESCRICAO'
      ''
      ''
      ''
      ' ')
    ClientDataSet = cdsPortForma
    Left = 165
    Top = 56
  end
  object cdsPortForma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 195
    Top = 56
  end
  object sqlModulo: TCMSqlParams
    SQL.Strings = (
      'select  IDMODULO ,'
      '            NOMEMODULO'
      'from  MODULO'
      'order by    NOMEMODULO    '
      '')
    ClientDataSet = cdsModulo
    Left = 125
    Top = 109
  end
  object cdsModulo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 155
    Top = 109
  end
  object sqlUsuariLanc: TCMSqlParams
    SQL.Strings = (
      'SELECT IDUSUARIO, NOMEUSUARIO'
      '  FROM USUARIOSISTEMA U'
      ' ORDER BY U.NOMEUSUARIO')
    ClientDataSet = cdsUsuariLanc
    Left = 413
    Top = 112
  end
  object cdsUsuariLanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 443
    Top = 112
  end
  object sqlSel: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  D.CODDOCUMENTO,'
      '  D.NODOCUMENTO,'
      '  D.DATAEMISSAO,'
      '  D.DATAVENCTO,'
      '  D.DATAPROGRAMADA,'
      '  D.EMISBLOQ,'
      '  D.NOSSONUMERO,'
      '  L.VALOR,'
      '  P.RAZAOSOCIAL,'
      '  TD.DESCRICAO AS DESCRDOCTO,'
      '  PF.DESCRICAO,'
      '  M.NOMEMODULO,'
      '  D.CONTROLEREMESSA,'
      '  U.NOMEUSUARIO'
      'FROM'
      '  DOCUMENTO D,'
      '  LANCTODOCUM L,'
      '  TIPODOCRECPAG TD,'
      '  PESSOA P,'
      '  PORTADORFORMA PF,'
      '  CLIENTEPESS CP,'
      '  MODULO M,'
      '  USUARIOSISTEMA U'
      'WHERE'
      '  1 = 2'
      '')
    ClientDataSet = cdsSel
    Left = 535
    Top = 255
  end
  object cdsSel: TCMClientDataSet
    Active = True
    Aggregates = <>
    Filtered = True
    Params = <>
    Left = 565
    Top = 255
    Data = {
      D50100009619E0BD01000000180000000E000000000003000000D5010C434F44
      444F43554D454E544F08000400000000000B4E4F444F43554D454E544F080004
      00000000000B44415441454D495353414F08000800000000000A444154415645
      4E43544F08000800000000000E4441544150524F4752414D4144410800080000
      00000008454D4953424C4F510100490000000200075355425459504502004900
      0A00466978656443686172000557494454480200020001000B4E4F53534F4E55
      4D45524F01004900000001000557494454480200020014000556414C4F520800
      0400000000000B52415A414F534F4349414C0100490000000100055749445448
      020002003C000A4445534352444F43544F010049000000010005574944544802
      00020023000944455343524943414F0100490000000100055749445448020002
      0032000A4E4F4D454D4F44554C4F010049000000020007535542545950450200
      49000A00466978656443686172000557494454480200020032000F434F4E5452
      4F4C4552454D4553534108000400000000000B4E4F4D455553554152494F0100
      4900000002000753554254595045020049000A00466978656443686172000557
      494454480200020014000100044C4349440400010009080000}
    object cdsSelEMISBLOQ: TStringField
      DisplayLabel = 'Reemite'
      DisplayWidth = 7
      FieldName = 'EMISBLOQ'
      OnChange = cdsSelEMISBLOQChange
      FixedChar = True
      Size = 1
    end
    object cdsSelNODOCUMENTO: TFloatField
      DisplayLabel = 'N° Documento'
      DisplayWidth = 15
      FieldName = 'NODOCUMENTO'
    end
    object cdsSelRAZAOSOCIAL: TStringField
      DisplayLabel = 'Cliente'
      DisplayWidth = 60
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object cdsSelNOSSONUMERO: TStringField
      DisplayLabel = 'Nosso Número'
      DisplayWidth = 20
      FieldName = 'NOSSONUMERO'
    end
    object cdsSelDESCRDOCTO: TStringField
      DisplayLabel = 'Tipo Documento'
      DisplayWidth = 15
      FieldName = 'DESCRDOCTO'
      Size = 35
    end
    object cdsSelDATAEMISSAO: TDateTimeField
      DisplayLabel = 'Dt. Emissão'
      DisplayWidth = 13
      FieldName = 'DATAEMISSAO'
    end
    object cdsSelDATAVENCTO: TDateTimeField
      DisplayLabel = 'Dt. Vencimento'
      DisplayWidth = 13
      FieldName = 'DATAVENCTO'
    end
    object cdsSelDATAPROGRAMADA: TDateTimeField
      DisplayLabel = 'Dt. Programada'
      DisplayWidth = 13
      FieldName = 'DATAPROGRAMADA'
    end
    object cdsSelDESCRICAO: TStringField
      DisplayLabel = 'Contas Caixas X Tipo de Cobrança'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsSelVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 11
      FieldName = 'VALOR'
    end
    object cdsSelNOMEMODULO: TStringField
      DisplayLabel = 'Sistema de Origem'
      DisplayWidth = 40
      FieldName = 'NOMEMODULO'
      FixedChar = True
      Size = 50
    end
    object cdsSelNOMEUSUARIO: TStringField
      DisplayLabel = 'Usuário Lançamento'
      DisplayWidth = 20
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
    object cdsSelCONTROLEREMESSA: TFloatField
      DisplayLabel = 'Controle Remessa'
      DisplayWidth = 18
      FieldName = 'CONTROLEREMESSA'
    end
    object cdsSelCODDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
  end
end
