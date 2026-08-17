inherited FrmEmissChequeMT: TFrmEmissChequeMT
  Left = 230
  Top = 161
  HelpContext = 30039
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Emissão de Cheques'
  ClientHeight = 381
  ClientWidth = 711
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 711
    Height = 342
    object Panel3: TPanel
      Left = 5
      Top = 5
      Width = 379
      Height = 332
      Align = alClient
      Caption = 'Panel3'
      TabOrder = 0
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 377
        Height = 76
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel1'
        TabOrder = 0
        object FormaPag: TLabel
          Left = 14
          Top = 8
          Width = 216
          Height = 13
          Caption = 'Contas Caixas X Forma de Pagamento'
        end
        object Label1: TLabel
          Left = 14
          Top = 54
          Width = 164
          Height = 13
          Caption = 'Lotes Pendentes para envio:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dblkFormaPag: TwwDBLookupCombo
          Left = 13
          Top = 24
          Width = 352
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição')
          LookupTable = CdsFormaRecPag
          LookupField = 'CODPORTFORMA'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnChange = dblkFormaPagChange
        end
      end
      object ClCheques: TCMchklistbox
        Left = 1
        Top = 77
        Width = 377
        Height = 215
        GlyphChecked.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FF00F222222222222F00F2FFFFFFFFFF2F00F2FFF4FFFFFF2F00F2FF224FFFFF
          2F00F2F22224FFFF2F00F2F22F224FFF2F00F2F2FFF224FF2F00F2FFFFFF224F
          2F00F2FFFFFFF22F2F00F2FFFFFFFF2F2F00F2FFFFFFFFFF2F00F22222222222
          2F00FFFFFFFFFFFFFF00}
        GlyphUnchecked.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FF00F222222222222F00F2FFFFFFFFFF2F00F2FFFFFFFFFF2F00F2FFFFFFFFFF
          2F00F2FFFFFFFFFF2F00F2FFFFFFFFFF2F00F2FFFFFFFFFF2F00F2FFFFFFFFFF
          2F00F2FFFFFFFFFF2F00F2FFFFFFFFFF2F00F2FFFFFFFFFF2F00F22222222222
          2F00FFFFFFFFFFFFFF00}
        GlyphTopMargin = 0
        GlyphLeftMargin = 0
        TextLeftMargin = 0
        ReadOnly = False
        Align = alClient
        Columns = 4
        ItemHeight = 16
        ItemIndex = 0
        TabOrder = 1
      end
      object Panel2: TPanel
        Left = 1
        Top = 292
        Width = 377
        Height = 39
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
        TabOrder = 2
        object SbAdTodos: TSpeedButton
          Left = 31
          Top = 7
          Width = 154
          Height = 25
          Caption = 'Marca &Todos'
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
          Left = 195
          Top = 7
          Width = 154
          Height = 25
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
    end
    object Panel4: TPanel
      Left = 384
      Top = 5
      Width = 322
      Height = 332
      Align = alRight
      TabOrder = 1
      object Label2: TLabel
        Left = 12
        Top = 47
        Width = 113
        Height = 13
        Caption = 'Número do Cheque:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 181
        Top = 48
        Width = 100
        Height = 13
        Caption = 'Data de Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 12
        Top = 91
        Width = 169
        Height = 13
        Caption = 'Local de Emissão do Cheque:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 12
        Top = 136
        Width = 300
        Height = 9
        Shape = bsTopLine
        Style = bsRaised
      end
      object DtEmis: TCMDateTimePicker
        Left = 180
        Top = 64
        Width = 132
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
        TabOrder = 0
      end
      object edtNumChq: TRealEdit
        Left = 12
        Top = 64
        Width = 164
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 1
        WordWrap = False
        IntDigits = 15
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
      end
      object CkData: TCheckBox
        Left = 12
        Top = 18
        Width = 245
        Height = 17
        Caption = 'Considera a Data de Emissão do lote'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = CkDataClick
      end
      object EdtLocalEmissCheque: TEdit
        Left = 12
        Top = 107
        Width = 300
        Height = 21
        TabOrder = 3
      end
      object CkbMaquina: TCheckBox
        Left = 12
        Top = 146
        Width = 267
        Height = 17
        Caption = 'Ultiliza Máquina de Impressão de Cheques'
        TabOrder = 4
        OnClick = CkbMaquinaClick
      end
      object GpMaqCheque: TGroupBox
        Left = 12
        Top = 193
        Width = 300
        Height = 117
        Caption = ' Parâmetros Para Impressão '
        Enabled = False
        TabOrder = 5
        object Label6: TLabel
          Left = 13
          Top = 20
          Width = 125
          Height = 13
          Caption = 'Modelo de Impressora'
        end
        object Label7: TLabel
          Left = 13
          Top = 67
          Width = 67
          Height = 13
          Caption = 'Porta Serial'
        end
        object CmbModelo: TComboBox
          Left = 13
          Top = 37
          Width = 268
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = CmbModeloChange
        end
        object ComboBoxDeviceName: TComboBox
          Left = 13
          Top = 85
          Width = 98
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          OnChange = ComboBoxDeviceNameChange
          Items.Strings = (
            'COM1'
            'COM2'
            'COM3'
            'COM4')
        end
      end
      object CkbVersoCheque: TCheckBox
        Left = 12
        Top = 168
        Width = 162
        Height = 17
        Caption = 'Imprime verso do cheque'
        TabOrder = 6
      end
    end
  end
  inherited Dock971: TDock97
    Top = 342
    Width = 711
    inherited tb97Fundo: TToolbar97
      Left = 228
      DockPos = 228
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 30089
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 60
      DockPos = 60
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 603
    Top = 185
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object dsLotePagto: TDataSource
    DataSet = CdsLotePagto
    Left = 84
    Top = 96
  end
  object Extenso: TExtensoCM
    TamanhoLinha = 0
    Idioma = iePortugues
    CompletaExtenso = False
    Left = 649
    Top = 310
  end
  object CmCheque: TCmImprimeCheque
    NomeImpressora = niChronos_ACC100
    BaudRate = br9600
    DataBits = db8
    StopBits = sb1
    Parity = paNone
    DeviceName = 'COM1'
    Left = 645
    Top = 268
  end
  object GImp1: TGImp
    DataBaseName = 'BaseDados'
    TipoFonte = TfNormal
    MostraPrinterSetup = False
    EjetarPagina = False
    Condensado = False
    Sublinhado = False
    SaltodeLinhaCondensado = False
    RegConfigImpressora.ValueNameId = 'IdImpressora'
    RegConfigImpressora.ValueNamePrinter = 'Impressora\Porta'
    Left = 589
    Top = 317
  end
  object Sql: TCMSqlParams
    ClientDataSet = Cds
    Left = 13
    Top = 165
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 13
    Top = 173
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 21
    Top = 229
  end
  object SqlAux: TCMSqlParams
    ClientDataSet = CdsAux
    Left = 21
    Top = 245
  end
  object CdsFormaRecPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 221
    Top = 29
  end
  object SqlFormaRecPag: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        ' P.CODPORTFORMA, P.IDTEMPLCHEQUE, P.DESCRICAO, C.QTDEDIGITOSANO,' +
        ' P.LANCAFINANC,'
      
        ' P.CODPORTADOR, P.CODSUBCONTA, P.CODCENTROCUSTO, P.PLACONTA, C.F' +
        'LGIMPCONDENSADO,'
      
        ' C.NUMCHQSALTO, C.NUMLINHASSALTO, P.PLACONTACONTABCHQ, P.PLANOCO' +
        'NTABCHQ, P.FLGCONTABEMISCHQ,'
      ' P.DMAIS, p.FLGCONTROLACHEQUE'
      'FROM'
      ' PORTADORFORMA P,'
      ' TEMPLCHEQUE C'
      'WHERE'
      '  (P.IDPESSOA = :IDPESSOA)      AND'
      '  (P.RECPAG = :RECPAG)          AND'
      '  (P.IDTEMPLCHEQUE IS NOT NULL) AND'
      '  (P.IDTEMPLCHEQUE = C.IDTEMPLCHEQUE)'
      'ORDER BY'
      '  P.DESCRICAO'
      '')
    ClientDataSet = CdsFormaRecPag
    Left = 277
    Top = 29
  end
  object CdsLotePagto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 13
    Top = 101
  end
  object SqlLotePagto: TCMSqlParams
    ClientDataSet = CdsLotePagto
    Left = 13
    Top = 93
  end
  object CdsParamChq: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 213
    Top = 117
  end
  object SqlParamChq: TCMSqlParams
    ClientDataSet = CdsParamChq
    Left = 221
    Top = 101
  end
  object CdsUltCheque: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 317
    Top = 93
  end
  object SqlUltCheque: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDCHEQUES,'
      '  CODPORTADOR,'
      '  NUMTALAO,'
      '  NUMCHEQUEINICIAL,'
      '  NUMCHEQUEFINAL,'
      '  NUMPROXIMOCHEQUE'
      'FROM'
      '  CHEQUES'
      'WHERE'
      '  CODPORTADOR = :pCODPORTADOR '
      'ORDER BY NUMTALAO'
      ''
      ''
      ' ')
    ClientDataSet = CdsUltCheque
    Left = 344
    Top = 104
  end
  object CdsDocsLote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 189
    Top = 173
  end
  object SqlDocsLote: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  LD.VALOR,'
      '  DOC.NODOCUMENTO,'
      '  DOC.COMPLDOCUMENTO,'
      '  DOC.DATAPROGRAMADA,'
      '  PFOR.RAZAOSOCIAL FORNECEDOR,'
      '  LC.HISTORICOCOMPL'
      'FROM'
      '  LOTEPAGTO LP,'
      '  LOTEXDOCUM LD,'
      '  DOCUMENTO DOC,'
      '  PESSOA PFOR,'
      '  LANCTODOCUM LC'
      'WHERE'
      '  (LP.NUMLOTE = :NUMLOTE) AND'
      '  (LD.NUMLOTE = LP.NUMLOTE) AND'
      '  (LD.CODDOCUMENTO = DOC.CODDOCUMENTO) AND'
      '  (LC.OPERACAO = DOC.OPERACAO) AND'
      '  (LC.CODDOCUMENTO = DOC.CODDOCUMENTO) AND'
      '  (DOC.IDFORCLI = PFOR.IDPESSOA)')
    ClientDataSet = CdsDocsLote
    Left = 216
    Top = 184
  end
  object CdsCheque: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 237
    Top = 245
  end
  object SqlCheque: TCMSqlParams
    ClientDataSet = CdsCheque
    Left = 309
    Top = 245
  end
end
