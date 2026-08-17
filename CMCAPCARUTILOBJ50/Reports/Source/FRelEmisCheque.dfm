inherited FrmRelEmisCheque: TFrmRelEmisCheque
  Left = 322
  Top = 222
  Caption = 'Parâmetro do Relatório Cópia de Cheque'
  ClientHeight = 459
  ClientWidth = 641
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 641
    Height = 420
    object Panel2: TPanel
      Left = 5
      Top = 5
      Width = 631
      Height = 61
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object GpFaixa: TGroupBox
        Left = 14
        Top = 6
        Width = 257
        Height = 49
        Caption = ' Data de Emissão dos Lotes Entre '
        TabOrder = 0
        object Label1: TLabel
          Left = 126
          Top = 22
          Width = 5
          Height = 13
        end
        object DtIni: TCMDateTimePicker
          Left = 13
          Top = 18
          Width = 111
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
        end
        object DtFin: TCMDateTimePicker
          Left = 136
          Top = 18
          Width = 111
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
        end
      end
    end
    object RgRemessa: TRadioGroup
      Left = 277
      Top = 11
      Width = 244
      Height = 49
      Caption = ' Tipo de Emissão '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Cheque'
        'IntBanco')
      TabOrder = 0
      OnClick = RgRemessaClick
    end
    object BBtnSelecionar: TBitBtn
      Left = 529
      Top = 21
      Width = 101
      Height = 34
      Caption = 'Seleciona'
      TabOrder = 1
      OnClick = BBtnSelecionarClick
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000014000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777BBBBBBBBB
        BBBBB777000077BBBBBBBBBBBBBBBB7700007BBB777777777777BBB700007BB8
        8000000000008BB700007BB77777777777777BB700007BBB878787870087BBB7
        000077BBBBBBB00BB0BBBB770000777BBBB003B338BBB77700007777770FFF33
        0777777700007787808FFFF308787877000077770378FFF07777777700007780
        37338FF078787877000077037333380777777777000070373333807878787877
        0000737333380777777777770000773333807878787878770000733338077777
        777777770000733380787878787878770000}
    end
    object Panel1: TPanel
      Left = 5
      Top = 66
      Width = 631
      Height = 349
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      object PnlTotaVenc: TPanel
        Left = 0
        Top = 313
        Width = 631
        Height = 36
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
        TabOrder = 0
        object SbAdTodos: TBitBtn
          Left = 191
          Top = 5
          Width = 137
          Height = 25
          Caption = 'Marca &Todos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = SbAdTodosClick
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
          NumGlyphs = 2
        end
        object SbAdInverte: TBitBtn
          Left = 338
          Top = 5
          Width = 137
          Height = 25
          Caption = '&Inverter Seleção'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = SbAdInverteClick
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
          NumGlyphs = 2
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 631
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        BevelWidth = 2
        Caption = 'Lotes Emitdos No Período Indicado'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
      object GrdDocsaVencer: TwwDBGrid
        Left = 0
        Top = 30
        Width = 631
        Height = 283
        ControlType.Strings = (
          'EMITE;CheckBox;1;0')
        Selected.Strings = (
          'EMITE'#9'3'#9'Imp'#9'F'
          'NUMCHQBORDERO'#9'10'#9'Cheque'#9'F'
          'DATAEMISSAO'#9'10'#9'Emissão'#9'F'
          'NUMLOTE'#9'10'#9'Lote'#9'F'
          'FAVORECIDO'#9'25'#9'Favorecido'#9'F'
          'SUM(LD.VALOR)'#9'17'#9'Valor'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsCheque
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnCalcCellColors = GrdDocsaVencerCalcCellColors
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    Top = 420
    Width = 641
    inherited tb97Fundo: TToolbar97
      Left = 366
      DockPos = 366
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 198
      DockPos = 198
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 982
    Top = 7
  end
  inherited Cmp_Padrao: TCmParamReport
    Params = <
      item
        Caption = 'Lista de Cheques'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end>
    Left = 184
    Top = 176
  end
  object DsCheque: TwwDataSource
    DataSet = CdsCheque
    Left = 184
    Top = 120
  end
  object CdsCheque: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 120
    object CdsChequeEMITE: TFloatField
      DisplayLabel = 'Imp'
      DisplayWidth = 3
      FieldName = 'EMITE'
    end
    object CdsChequeNUMCHQBORDERO: TStringField
      DisplayLabel = 'Cheque'
      DisplayWidth = 10
      FieldName = 'NUMCHQBORDERO'
      Size = 15
    end
    object CdsChequeDATAEMISSAO: TDateTimeField
      DisplayLabel = 'Emissão'
      DisplayWidth = 10
      FieldName = 'DATAEMISSAO'
    end
    object CdsChequeNUMLOTE: TFloatField
      DisplayLabel = 'Lote'
      DisplayWidth = 10
      FieldName = 'NUMLOTE'
    end
    object CdsChequeFAVORECIDO: TStringField
      DisplayLabel = 'Favorecido'
      DisplayWidth = 25
      FieldName = 'FAVORECIDO'
      Size = 60
    end
    object CdsChequeSUMLDVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 17
      FieldName = 'SUM(LD.VALOR)'
      DisplayFormat = '#,##0.00'
    end
  end
  object SqlCheque: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  LP.NUMLOTE, LP.DATAEMISSAO,'
      '  LP.NUMCHQBORDERO,'
      '  LP.FAVORECIDO,'
      '  SUM(LD.VALOR),'
      '  (0) AS EMITE'
      'FROM'
      '  LOTEPAGTO LP,'
      '  LOTEXDOCUM LD,'
      '  PORTADORFORMA PF'
      
        ',(select count(*) as totdocum , numlote from lotexdocum ld , doc' +
        'umento d where'
      '       D.RECPAG         = '#39'P'#39'  AND'
      
        '         ld.CODDOCUMENTO = D.CODDOCUMENTO group by numlote  ) to' +
        'tdocum'
      
        ',(select count(*) as totdocum , numlote from lotexdocum ld , doc' +
        'umento d where'
      '       D.RECPAG         = '#39'P'#39'  AND'
      '         ld.CODDOCUMENTO = D.CODDOCUMENTO  and'
      
        '        d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WH' +
        'ERE a.RECPAG =  '#39'P'#39
      
        ' and not exists  (select 1 from UsuarioxTpdocto b where recpag='#39 +
        'P'#39' and b.idusuario='
      
        '             :IdUsuario) union  SELECT CODTIPDOC  FROM TIPODOCRE' +
        'CPAG a WHERE a.RECPAG =   '#39'P'#39
      
        '  and exists (select 1 from UsuarioxTpdocto b where recpag='#39'P'#39' a' +
        'nd a.codtipdoc=b.codtipdoc and b.idusuario='
      ' :IdUsuario)) group by numlote  ) totlote'
      'WHERE'
      '  (PF.IDTEMPLCHEQUE IS NOT NULL) AND'
      '  (CODARQUIVOREMESSA IS NOT NULL) AND'
      '  (LP.DATAEMISSAO BETWEEN :PDATAINI AND :PDATAFIM) AND'
      '  (LP.IDPESSOA = :PIDPESSOA) AND'
      '  (LP.FLAGEMISSAO = 1) AND'
      
        '  ((LP.FLAGCANCEL <> '#39'C'#39' AND LP.FLAGCANCEL <> '#39'R'#39') OR LP.FLAGCAN' +
        'CEL IS NULL) AND'
      '  (LP.NUMLOTE = LD.NUMLOTE) AND'
      '  (PF.CODPORTFORMA = LP.CODPORTFORMA)'
      '    and totlote.totdocum=totdocum.totdocum and'
      
        '  totlote.numlote=totdocum.numlote and   totlote.numlote=  lp.NU' +
        'MLOTE'
      'GROUP BY'
      '  LP.NUMLOTE, LP.DATAEMISSAO, LP.NUMCHQBORDERO, LP.FAVORECIDO'
      'ORDER BY'
      '  LP.NUMCHQBORDERO')
    ClientDataSet = CdsCheque
    Left = 72
    Top = 192
  end
  object SqlTodos: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   LP.NUMLOTE, LP.DATAEMISSAO,'
      '   LP.NUMCHQBORDERO,'
      '   LP.FAVORECIDO,'
      '   SUM(LD.VALOR),'
      '   (0) AS EMITE'
      'FROM'
      '   LOTEPAGTO  LP,'
      '   LOTEXDOCUM LD,'
      '   ('
      '   SELECT'
      '      COUNT(*) AS TOTDOCUM,'
      '      NUMLOTE'
      '   FROM'
      '      LOTEXDOCUM LD,'
      '      DOCUMENTO D'
      '   WHERE'
      '          D.RECPAG        = '#39'P'#39
      '      AND LD.CODDOCUMENTO = D.CODDOCUMENTO'
      '   GROUP BY'
      '      NUMLOTE'
      '   ) TOTDOCUM,'
      ''
      '   ('
      '   SELECT'
      '      COUNT(*) AS TOTDOCUM, NUMLOTE'
      '   FROM'
      '      LOTEXDOCUM LD,'
      '      DOCUMENTO  D'
      '   WHERE'
      '          D.RECPAG        = '#39'P'#39
      '      AND LD.CODDOCUMENTO = D.CODDOCUMENTO'
      '      AND D.CODTIPDOC IN'
      '      ('
      '      SELECT'
      '         CODTIPDOC'
      '      FROM'
      '         TIPODOCRECPAG A'
      '      WHERE'
      '             A.RECPAG =  '#39'P'#39
      '         AND NOT EXISTS'
      '         ('
      '         SELECT 1'
      '         FROM'
      '            USUARIOXTPDOCTO B'
      '         WHERE'
      '                RECPAG      = '#39'P'#39
      '            AND B.IDUSUARIO =:IDUSUARIO'
      '         )'
      '      UNION'
      '      SELECT'
      '         CODTIPDOC'
      '      FROM'
      '         TIPODOCRECPAG A'
      '      WHERE'
      '             A.RECPAG =   '#39'P'#39
      '         AND EXISTS'
      '         ('
      '         SELECT 1'
      '         FROM'
      '            USUARIOXTPDOCTO B'
      '         WHERE'
      '                RECPAG      = '#39'P'#39
      '            AND A.CODTIPDOC = B.CODTIPDOC'
      '            AND B.IDUSUARIO = :IDUSUARIO'
      '         )'
      '      ) GROUP BY NUMLOTE'
      '   ) TOTLOTE'
      ''
      'WHERE'
      '       ( LP.DATAEMISSAO BETWEEN :PDATAINI AND :PDATAFIM )'
      '   AND ( LP.IDPESSOA    =:PIDPESSOA )'
      '   AND ( LP.FLAGEMISSAO = 1 )'
      
        '   AND ( (LP.FLAGCANCEL <> '#39'C'#39' AND LP.FLAGCANCEL <> '#39'R'#39') OR LP.F' +
        'LAGCANCEL IS NULL )'
      '   AND ( LP.NUMLOTE     = LD.NUMLOTE )'
      '   AND TOTLOTE.TOTDOCUM = TOTDOCUM.TOTDOCUM'
      '   AND TOTLOTE.NUMLOTE  = TOTDOCUM.NUMLOTE'
      '   AND TOTLOTE.NUMLOTE  = LP.NUMLOTE'
      ''
      'GROUP BY'
      '   LP.NUMLOTE, LP.DATAEMISSAO, LP.NUMCHQBORDERO, LP.FAVORECIDO'
      ''
      'ORDER BY'
      '   LP.NUMCHQBORDERO')
    ClientDataSet = CdsTodos
    Left = 312
    Top = 168
  end
  object CdsTodos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 120
  end
  object SqlAlteradores: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CODALTERADOR,'
      '  DESCRICAO,'
      '  ACRESDECRES'
      'FROM'
      '  TIPOALTERADOR'
      'WHERE'
      '  IDPESSOA = :IDPESSOA'
      'ORDER BY'
      '  ACRESDECRES, DESCRICAO')
    ClientDataSet = CdsAlteradores
    Left = 568
    Top = 312
  end
  object CdsAlteradores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 568
    Top = 264
  end
  object SqlOP: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   LP.NUMLOTE, LP.DATAEMISSAO,'
      '   LP.NUMCHQBORDERO,'
      '   LP.FAVORECIDO,'
      '   SUM(LD.VALOR),'
      '   (0) AS EMITE'
      'FROM'
      '   LOTEPAGTO  LP,'
      '   LOTEXDOCUM LD,'
      ''
      '   ('
      '   SELECT'
      '      COUNT(*) AS TOTDOCUM,'
      '      NUMLOTE'
      '   FROM'
      '      LOTEXDOCUM LD,'
      '      DOCUMENTO  D'
      '   WHERE'
      '          D.RECPAG        = '#39'P'#39
      '      AND LD.CODDOCUMENTO = D.CODDOCUMENTO'
      '   GROUP BY'
      '      NUMLOTE'
      '   ) TOTDOCUM,'
      ''
      '   ('
      '   SELECT'
      '      COUNT(*) AS TOTDOCUM,'
      '      NUMLOTE'
      '   FROM'
      '      LOTEXDOCUM LD,'
      '      DOCUMENTO  D'
      '   WHERE'
      '          D.RECPAG         = '#39'P'#39
      '      AND LD.CODDOCUMENTO  = D.CODDOCUMENTO'
      '      AND D.CODTIPDOC IN'
      '      ('
      '      SELECT'
      '         CODTIPDOC'
      '      FROM'
      '         TIPODOCRECPAG A'
      '      WHERE'
      '             A.RECPAG =  '#39'P'#39
      '         AND NOT EXISTS'
      '         ('
      '         SELECT 1'
      '         FROM'
      '            USUARIOXTPDOCTO B'
      '         WHERE'
      '                RECPAG      = '#39'P'#39
      '            AND B.IDUSUARIO =:IDUSUARIO'
      '         )'
      '      UNION'
      '      SELECT'
      '         CODTIPDOC'
      '      FROM'
      '         TIPODOCRECPAG A'
      '      WHERE'
      '             A.RECPAG =   '#39'P'#39
      '         AND EXISTS'
      '         ('
      '         SELECT 1'
      '         FROM'
      '            USUARIOXTPDOCTO B'
      '         WHERE'
      '                RECPAG      = '#39'P'#39
      '            AND A.CODTIPDOC = B.CODTIPDOC'
      '            AND B.IDUSUARIO =:IDUSUARIO'
      '         )'
      '      )'
      '   GROUP BY'
      '      NUMLOTE'
      '   ) TOTLOTE'
      ''
      'WHERE'
      ' -- (LP.FLAGEMISSAO        = 1) AND'
      '       ( LP.NUMLOTE        = LD.NUMLOTE )'
      '   AND ( RTRIM(LP.NUMSLIP) =:NUMSLIP )'
      '   AND TOTLOTE.TOTDOCUM    = TOTDOCUM.TOTDOCUM'
      '   AND TOTLOTE.NUMLOTE     = TOTDOCUM.NUMLOTE'
      '   AND TOTLOTE.NUMLOTE     = LP.NUMLOTE'
      ''
      'GROUP BY'
      '   LP.NUMLOTE, LP.DATAEMISSAO, LP.NUMCHQBORDERO, LP.FAVORECIDO'
      ''
      'ORDER BY'
      '   LP.NUMCHQBORDERO')
    ClientDataSet = CdsOP
    Left = 512
    Top = 168
  end
  object CdsOP: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 512
    Top = 120
  end
  object SqlIntBanco: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   LP.NUMLOTE, LP.DATAEMISSAO,'
      '   LP.NUMCHQBORDERO,'
      '   LP.FAVORECIDO,'
      '   SUM(LD.VALOR),'
      '   (0) AS EMITE'
      'FROM'
      '   LOTEPAGTO LP,'
      '   LOTEXDOCUM LD,'
      '   PORTADORFORMA PF,'
      ''
      '   ('
      '   SELECT'
      '      COUNT(*) AS TOTDOCUM , NUMLOTE'
      '   FROM'
      '      DOCUMENTO  D,'
      '      LOTEXDOCUM LD'
      '   WHERE'
      '      D.RECPAG        = '#39'P'#39'  AND'
      '      LD.CODDOCUMENTO = D.CODDOCUMENTO'
      '   GROUP BY'
      '      NUMLOTE'
      '   ) TOTDOCUM,'
      ''
      '   ('
      '   SELECT'
      '      COUNT(*) AS TOTDOCUM , NUMLOTE'
      '   FROM'
      '      DOCUMENTO  D,'
      '      LOTEXDOCUM LD'
      '   WHERE'
      '      D.RECPAG          = '#39'P'#39'  AND'
      '      LD.CODDOCUMENTO   = D.CODDOCUMENTO  AND'
      '      D.CODTIPDOC       IN'
      '      ('
      '      SELECT'
      '         CODTIPDOC'
      '      FROM'
      '         TIPODOCRECPAG A'
      '      WHERE'
      '             A.RECPAG   =  '#39'P'#39
      '         AND NOT EXISTS'
      '             ('
      '             SELECT 1'
      '             FROM'
      '                USUARIOXTPDOCTO B'
      '             WHERE'
      '                    RECPAG      = '#39'P'#39
      '                AND B.IDUSUARIO =:IDUSUARIO'
      '             )'
      '      UNION'
      '      SELECT'
      '         CODTIPDOC'
      '      FROM'
      '         TIPODOCRECPAG A'
      '      WHERE'
      '             A.RECPAG   = '#39'P'#39
      '         AND EXISTS'
      '             ('
      '             SELECT 1'
      '             FROM'
      '                USUARIOXTPDOCTO B'
      '             WHERE'
      '                    RECPAG      = '#39'P'#39
      '                AND A.CODTIPDOC = B.CODTIPDOC'
      '                AND B.IDUSUARIO =:IDUSUARIO'
      '             )'
      '      )'
      '   GROUP BY'
      '      NUMLOTE'
      '   ) TOTLOTE'
      ''
      'WHERE'
      '       ( PF.CODARQUIVOREMESSA IS NOT NULL)'
      '   AND ( LP.DATAEMISSAO       BETWEEN :PDATAINI AND :PDATAFIM)'
      '   AND ( LP.IDPESSOA          =:PIDPESSOA)'
      '   AND ( LP.FLAGEMISSAO       = 1)'
      
        '   AND ( (LP.FLAGCANCEL       <> '#39'C'#39' AND LP.FLAGCANCEL <> '#39'R'#39') O' +
        'R LP.FLAGCANCEL IS NULL )'
      '   AND ( LP.FLAGCANCEL        <> '#39'C'#39' OR  LP.FLAGCANCEL IS NULL)'
      '   AND ( LP.NUMLOTE           = LD.NUMLOTE)'
      '   AND ( LP.CODPORTFORMA      = PF.CODPORTFORMA)'
      '   AND TOTLOTE.TOTDOCUM       = TOTDOCUM.TOTDOCUM'
      '   AND TOTLOTE.NUMLOTE        = TOTDOCUM.NUMLOTE'
      '   AND TOTLOTE.NUMLOTE        = LP.NUMLOTE'
      ''
      'GROUP BY'
      '   LP.NUMLOTE, LP.DATAEMISSAO, LP.NUMCHQBORDERO, LP.FAVORECIDO'
      ''
      'ORDER BY'
      '   LP.NUMCHQBORDERO'
      ' ')
    ClientDataSet = CdsIntBanco
    Left = 416
    Top = 168
  end
  object CdsIntBanco: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 120
  end
  object SqlChequeOriginal: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   LP.NUMLOTE, LP.DATAEMISSAO,'
      '   LP.NUMCHQBORDERO,'
      '   LP.FAVORECIDO,'
      '   SUM(LD.VALOR),'
      '   (0) AS EMITE'
      'FROM'
      '   LOTEPAGTO     LP,'
      '   LOTEXDOCUM    LD,'
      '   PORTADORFORMA PF,'
      ''
      '   ('
      '   SELECT'
      '      COUNT(*) AS TOTDOCUM ,'
      '      NUMLOTE'
      '   FROM'
      '      LOTEXDOCUM LD,'
      '      DOCUMENTO  D'
      '   WHERE'
      '          D.RECPAG         = '#39'P'#39
      '      AND LD.CODDOCUMENTO  = D.CODDOCUMENTO'
      '   GROUP BY'
      '      NUMLOTE'
      '   ) TOTDOCUM,'
      ''
      '   ('
      '   SELECT'
      '      COUNT(*) AS TOTDOCUM ,'
      '      NUMLOTE'
      '   FROM'
      '      LOTEXDOCUM LD,'
      '      DOCUMENTO  D'
      '   WHERE'
      '          D.RECPAG        = '#39'P'#39
      '      AND LD.CODDOCUMENTO = D.CODDOCUMENTO'
      '      AND D.CODTIPDOC IN'
      '      ('
      '      SELECT'
      '         CODTIPDOC'
      '      FROM'
      '         TIPODOCRECPAG A'
      '      WHERE'
      '             A.RECPAG =  '#39'P'#39
      '         AND NOT EXISTS'
      '         ('
      '         SELECT 1'
      '         FROM'
      '            USUARIOXTPDOCTO B'
      '         WHERE'
      '                RECPAG      = '#39'P'#39
      '            AND B.IDUSUARIO =:IDUSUARIO'
      '         )'
      '      UNION'
      '      SELECT'
      '         CODTIPDOC'
      '      FROM'
      '         TIPODOCRECPAG A'
      '      WHERE'
      '             A.RECPAG =   '#39'P'#39
      '         AND EXISTS'
      '         ('
      '         SELECT 1'
      '         FROM'
      '            USUARIOXTPDOCTO B'
      '         WHERE'
      '                RECPAG      = '#39'P'#39
      '            AND A.CODTIPDOC = B.CODTIPDOC'
      '            AND B.IDUSUARIO =:IDUSUARIO'
      '         )'
      '      )'
      '   GROUP BY'
      '      NUMLOTE'
      '   ) TOTLOTE'
      ''
      'WHERE'
      '       ( PF.IDTEMPLCHEQUE  IS NOT NULL )'
      '--   AND ( CODARQUIVOREMESSA IS NOT NULL )'
      '   AND ( LP.DATAEMISSAO    BETWEEN :PDATAINI AND :PDATAFIM )'
      '   AND ( LP.IDPESSOA       =:PIDPESSOA )'
      '   AND ( LP.FLAGEMISSAO    = 1 )'
      
        '   AND ( (LP.FLAGCANCEL    <> '#39'C'#39' AND LP.FLAGCANCEL <> '#39'R'#39') OR L' +
        'P.FLAGCANCEL IS NULL )'
      '   AND ( LP.NUMLOTE        = LD.NUMLOTE )'
      '   AND ( PF.CODPORTFORMA   = LP.CODPORTFORMA )'
      '   AND TOTLOTE.TOTDOCUM    = TOTDOCUM.TOTDOCUM'
      '   AND TOTLOTE.NUMLOTE     = TOTDOCUM.NUMLOTE'
      '   AND TOTLOTE.NUMLOTE     = LP.NUMLOTE'
      ''
      'GROUP BY'
      '   LP.NUMLOTE, LP.DATAEMISSAO, LP.NUMCHQBORDERO, LP.FAVORECIDO'
      ''
      'ORDER BY'
      '   LP.NUMCHQBORDERO')
    Left = 72
    Top = 248
  end
end
