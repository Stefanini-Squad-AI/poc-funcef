inherited FrmPagEletronico: TFrmPagEletronico
  Left = 320
  Top = 145
  HelpContext = 30041
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Gera Arquivo de Pagamento Eletrônico'
  ClientHeight = 416
  ClientWidth = 464
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97 [0]
    Top = 377
    Width = 464
    inherited tb97Fundo: TToolbar97
      Left = 294
      DockPos = 294
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 30041
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 125
      DockPos = 125
      inherited ToolbarSep971: TToolbarSep97
        Left = 81
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 81
        Default = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 84
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited pnlFundo: TPanel [1]
    Width = 464
    Height = 377
    object SrcLabel: TLabel
      Left = 10
      Top = 137
      Width = 163
      Height = 13
      Caption = 'Lotes Pendentes P/ Modelo:'
    end
    object ExcAllBtn: TSpeedButton
      Left = 218
      Top = 297
      Width = 24
      Height = 24
      Hint = 'Exclui Todos os Lotes'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888888878F887E666666666
        608887F888888F8887F887E66666F6666088878888887F88878F7E66666FF666
        66087F8888877F88887F7E6666FFF66666087F8888777F88887F7E666FFFF666
        66087F8887777F88887F7E6666FFF66666087F8888777F88887F7E66666FF666
        660878F888877F88887887E66666F666608887F88888788887F887E666666666
        6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      OnClick = ExcAllBtnClick
    end
    object ExcludeBtn: TSpeedButton
      Left = 218
      Top = 265
      Width = 24
      Height = 24
      Hint = 'Exclui um Lote'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888888878F887E666666666
        608887F8888F888F87F887E666F666F660888788887F887F878F7E666FF66FF6
        66087F88877F877F887F7E66FFF6FFF666087F88777F777F887F7E6FFFFFFFF6
        66087F877777777F887F7E66FFF6FFF666087F88777F777F887F7E666FF66FF6
        660878F8877F877F887887E666F666F6608887F88878887887F887E666666666
        6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      OnClick = ExcludeBtnClick
    end
    object IncAllBtn: TSpeedButton
      Left = 218
      Top = 233
      Width = 24
      Height = 24
      Hint = 'Seleciona Todos os Lotes'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888888878F887E666666666
        608887F88F888F8887F887E6F666F6666088878878F878F8878F7E66FF66FF66
        66087F88778F778F887F7E66FFF6FFF666087F8877787778F87F7E66FFFFFFFF
        66087F8877777777887F7E66FFF6FFF666087F8877787778887F7E66FF66FF66
        660878F877887788887887E6F666F666608887F87888788887F887E666666666
        6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      OnClick = IncAllBtnClick
    end
    object IncludeBtn: TSpeedButton
      Left = 218
      Top = 201
      Width = 24
      Height = 24
      Hint = 'Seleciona um Lote'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888888878F887E666666666
        608887F8888F888887F887E666F66666608887888878F888878F7E6666FF6666
        66087F8888778F88887F7E6666FFF66666087F88887778F8887F7E6666FFFF66
        66087F8888777788887F7E6666FFF66666087F8888777888887F7E6666FF6666
        660878F888778888887887E666F66666608887F88878888887F887E666666666
        6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      OnClick = IncludeBtnClick
    end
    object DstLabel: TLabel
      Left = 250
      Top = 135
      Width = 197
      Height = 16
      AutoSize = False
      Caption = 'Lotes Para Pagamento Eletrônico:'
    end
    object LblRemessa: TLabel
      Left = 14
      Top = 14
      Width = 184
      Height = 13
      Caption = 'Modelo de Arquivo de Remessa:'
    end
    object RgEmisLote: TRadioGroup
      Left = 15
      Top = 59
      Width = 432
      Height = 69
      Caption = ' Para Lançamento no financeiro '
      ItemIndex = 0
      Items.Strings = (
        'Considera a data de emissão do lote para efetuar o lançamento'
        'Considera a data indicada')
      TabOrder = 4
      OnClick = RgEmisLoteClick
    end
    object DtEmis: TCMDateTimePicker
      Left = 199
      Top = 98
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
      TabOrder = 5
    end
    object CmbModeloCnab: TCMDBLookupCombo
      Left = 14
      Top = 31
      Width = 437
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'40'#9'Contas Caixas x Formas de Pagamento')
      LookupTable = QryModelosCnab
      LookupField = 'IDMODELOSCNAB'
      Options = [loTitles]
      Style = csDropDownList
      DropDownWidth = 600
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      OrderByDisplay = False
      UseTFields = False
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = CmbModeloCnabCloseUp
    end
    object SrcList: TListBox
      Left = 10
      Top = 153
      Width = 201
      Height = 209
      ItemHeight = 13
      MultiSelect = True
      Sorted = True
      TabOrder = 0
    end
    object DstList: TListBox
      Left = 250
      Top = 153
      Width = 201
      Height = 209
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 1
    end
    object PnlCodigodeBarras: TPanel
      Left = 5
      Top = 5
      Width = 454
      Height = 367
      Align = alClient
      TabOrder = 2
      Visible = False
      object Label2: TLabel
        Left = 11
        Top = 8
        Width = 427
        Height = 26
        Caption = 
          'Obrigatório Indicar o Código de Barras ou a Representação do Mes' +
          'mo para os Documentos abaixo:'
        WordWrap = True
      end
      object Label3: TLabel
        Left = 11
        Top = 243
        Width = 342
        Height = 13
        Caption = 'Código de Barras ( Parte Inferior da Ficha de Compensação)'
      end
      object Label4: TLabel
        Left = 11
        Top = 289
        Width = 399
        Height = 13
        Caption = 
          'Representação Numérica  ( Parte Superior da Ficha de Compensação' +
          ')'
      end
      object EdtBarras: TEdit
        Tag = 1
        Left = 11
        Top = 262
        Width = 430
        Height = 21
        MaxLength = 60
        TabOrder = 0
      end
      object EdtRepBarras: TEdit
        Left = 11
        Top = 308
        Width = 430
        Height = 21
        MaxLength = 60
        TabOrder = 1
      end
      object wwDBGrid1: TwwDBGrid
        Left = 11
        Top = 40
        Width = 429
        Height = 193
        Selected.Strings = (
          'NUMLOTE'#9'10'#9'Lote'
          'NODOCUMENTO'#9'9'#9'Número do~Documento'
          'VALOR'#9'11'#9'Valor'
          'CODBARRA'#9'45'#9'Código de Barra'
          'CODBARRAVALOR'#9'45'#9'Representação Númerica')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = DsQryLoteDoc
        TabOrder = 2
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object DBNavigator1: TDBNavigator
        Left = 337
        Top = 334
        Width = 104
        Height = 26
        DataSource = DsQryLoteDoc
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 3
      end
      object ChkDoc: TCheckBox
        Left = 13
        Top = 338
        Width = 292
        Height = 17
        Caption = '&Lista apenas Códigos de Barra não Digitados'
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = ChkDocClick
      end
      object BtnIncluiBarras: TBitBtn
        Left = 312
        Top = 334
        Width = 25
        Height = 26
        Hint = 'Inclui Código de Barras'
        Default = True
        TabOrder = 5
        OnClick = BtnIncluiBarrasClick
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777700000007777777777777777700000007777777774F77777700000007777
          7777444F77777000000077777774444F777770000000700000444F44F7777000
          000070FFF444F0744F777000000070F8884FF0774F777000000070FFFFFFF077
          74F77000000070F88888F077774F7000000070FFFFFFF0777774F000000070F8
          8777F07777774000000070FFFF00007777777000000070F88707077777777000
          000070FFFF007777777770000000700000077777777770000000777777777777
          777770000000}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 83
    Top = 163
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryLotePagto: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 512
    Top = 170
  end
  object QryLoteDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT L.NUMLOTE, D.NODOCUMENTO,L.VALOR, L.CODDOCUMENTO, L.CODBA' +
        'RRA, L.CODBARRAVALOR, LP.CODPORTFORMA'
      'FROM'
      'DOCUMENTO D,'
      'LOTEXDOCUM  L,'
      'PORTADORFORMA P,'
      'LOTEPAGTO LP'
      'WHERE 1=2')
    ValidateWithMask = True
    Left = 509
    Top = 17
    object QryLoteDocNUMLOTE: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Lote'
      DisplayWidth = 10
      FieldName = 'NUMLOTE'
      Origin = 'LOTEXDOCUM.NUMLOTE'
    end
    object QryLoteDocNODOCUMENTO: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Número do~Documento'
      DisplayWidth = 9
      FieldName = 'NODOCUMENTO'
      Origin = 'DOCUMENTO.NODOCUMENTO'
    end
    object QryLoteDocVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 11
      FieldName = 'VALOR'
      Origin = 'LOTEXDOCUM.VALOR'
      DisplayFormat = '#,##0.00'
    end
    object QryLoteDocCODBARRA: TStringField
      DisplayLabel = 'Código de Barra'
      DisplayWidth = 45
      FieldName = 'CODBARRA'
      Size = 60
    end
    object QryLoteDocCODBARRAVALOR: TStringField
      DisplayLabel = 'Representação Númerica'
      DisplayWidth = 45
      FieldName = 'CODBARRAVALOR'
      Size = 60
    end
    object QryLoteDocCODDOCUMENTO: TFloatField
      DisplayWidth = 60
      FieldName = 'CODDOCUMENTO'
      Origin = 'LOTEXDOCUM.CODDOCUMENTO'
      Visible = False
    end
    object QryLoteDocCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'LOTEPAGTO.CODPORTFORMA'
    end
  end
  object DsQryLoteDoc: TwwDataSource
    DataSet = QryLoteDoc
    OnDataChange = DsQryLoteDocDataChange
    Left = 509
    Top = 65
  end
  object QryAtualizaBarras: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 511
    Top = 117
  end
  object QryDocumentos: TwwQuery
    OnCalcFields = QryDocumentosCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      ' PESS.IDPESSOA, PESS.NOME, PESS.RAZAOSOCIAL,'
      
        ' DECODE(PESS.TIPO,'#39'J'#39',DECODE(PESS.NUMDOCUMENTO,NULL,'#39'00000000000' +
        '000'#39',PESS.NUMDOCUMENTO),DECODE(PESS.NUMDOCUMENTO,NULL,'#39'000000000' +
        '00'#39',PESS.NUMDOCUMENTO)) AS NUMDOCUMENTO,'
      
        '-- C.CONTACORRENTE, BA.NUMBANCO AS CODBANCOFAVORECIDO, AG.NUMAGE' +
        'NCIA,'
      
        ' E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, CID.NOME AS CI' +
        'DADE, ES.CODESTADO,'
      ' E.CEP, DOC.IDFORCLI, DOC.CODDOCUMENTO, LOTEX.VALOR,'
      
        ' DOC.VALORDESCONTO, DOC.VALORJUROS, DOC.DATAVENCTO, DOC.DATAPROG' +
        'RAMADA,'
      
        ' DOC.MOECODIGO AS TIPOMOEDA, LP.NUMLOTE, LP.CODPORTFORMA, PF.COD' +
        'FORMAPAGTO, PF.CODTIPOPAGTO,'
      
        ' PF.FLGEMITEAVISO, PF.CODARQUIVOREMESSA, PC.IDBANCO, PC.NOCONTAC' +
        'ORR, pf.codportador  ,'
      
        ' LOTEX.CODBARRA, LOTEX.CODBARRAVALOR, DOC.NODOCUMENTO, DOC.COMPL' +
        'DOCUMENTO, PESS.TIPO, PF.NUMEMPRESABANCO, TD.DEBCRE, '#39'          ' +
        '               '#39' as livre'
      '-- , PAG.NOME AS NOMEAGENCIA'
      '-- C.TIPOCONTA'
      'FROM'
      '-- PESSOA PAG,'
      
        ' PESSOA PESS, LOTEPAGTO LP, LOTEXDOCUM LOTEX, DOCUMENTO DOC, PAR' +
        'AMCAP PAR,'
      
        ' PORTADORFORMA PF, PORTADORCONTA PC, TIPODOCRECPAG TD, CIDADES C' +
        'ID, ESTADO ES,'
      ' ENDPESS E,'
      '-- CONTABANCARIA C,'
      ' MOEDA M'
      '-- AGENCIABANCARIA AG,'
      '-- BANCO BA'
      'WHERE 1=2')
    ValidateWithMask = True
    Left = 514
    Top = 225
    object QryDocumentosIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object QryDocumentosNOME: TStringField
      Tag = 9
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOME'
      Size = 60
    end
    object QryDocumentosRAZAOSOCIAL: TStringField
      Tag = 9
      DisplayLabel = 'Razão Social'
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object QryDocumentosNUMDOCUMENTO: TStringField
      Tag = 9
      DisplayLabel = 'Cpf\Cgc'
      FieldName = 'NUMDOCUMENTO'
      Size = 18
    end
    object QryDocumentosCONTACORRENTE: TStringField
      DisplayLabel = 'Número da Conta Corrente'
      FieldKind = fkCalculated
      FieldName = 'CONTACORRENTE'
      Size = 15
      Calculated = True
    end
    object QryDocumentosCODBANCOFAVORECIDO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CODBANCOFAVORECIDO'
      Size = 10
      Calculated = True
    end
    object QryDocumentosNUMAGENCIA: TStringField
      DisplayLabel = 'Número da Agência do Favorecido'
      FieldKind = fkCalculated
      FieldName = 'NUMAGENCIA'
      Size = 15
      Calculated = True
    end
    object QryDocumentosLOGRADOURO: TStringField
      DisplayLabel = 'Endereço'
      DisplayWidth = 60
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object QryDocumentosNUMERO: TStringField
      DisplayLabel = 'Número do Endereço'
      FieldName = 'NUMERO'
      Size = 8
    end
    object QryDocumentosCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object QryDocumentosBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
    end
    object QryDocumentosCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 50
    end
    object QryDocumentosCODESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'CODESTADO'
      Size = 3
    end
    object QryDocumentosCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object QryDocumentosIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object QryDocumentosCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object QryDocumentosVALOR: TFloatField
      Tag = 9
      DisplayLabel = 'Valor A Pagar'
      FieldName = 'VALOR'
    end
    object QryDocumentosVALORDESCONTO: TFloatField
      FieldName = 'VALORDESCONTO'
    end
    object QryDocumentosVALORJUROS: TFloatField
      FieldName = 'VALORJUROS'
    end
    object QryDocumentosDATAVENCTO: TDateTimeField
      Tag = 9
      DisplayLabel = 'Data do Vencimento'
      FieldName = 'DATAVENCTO'
    end
    object QryDocumentosDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object QryDocumentosTIPOMOEDA: TFloatField
      FieldName = 'TIPOMOEDA'
    end
    object QryDocumentosNUMLOTE: TFloatField
      FieldName = 'NUMLOTE'
    end
    object QryDocumentosCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object QryDocumentosCODFORMAPAGTO: TFloatField
      FieldName = 'CODFORMAPAGTO'
    end
    object QryDocumentosCODTIPOPAGTO: TFloatField
      FieldName = 'CODTIPOPAGTO'
    end
    object QryDocumentosFLGEMITEAVISO: TStringField
      FieldName = 'FLGEMITEAVISO'
      Size = 1
    end
    object QryDocumentosCODARQUIVOREMESSA: TFloatField
      FieldName = 'CODARQUIVOREMESSA'
    end
    object QryDocumentosIDBANCO: TFloatField
      FieldName = 'IDBANCO'
    end
    object QryDocumentosNOCONTACORR: TStringField
      FieldName = 'NOCONTACORR'
      Size = 15
    end
    object QryDocumentosCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 60
    end
    object QryDocumentosCODBARRAVALOR: TStringField
      FieldName = 'CODBARRAVALOR'
      Size = 60
    end
    object C: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object QryDocumentosCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      Size = 3
    end
    object QryDocumentosTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object QryDocumentosNUMEMPRESABANCO: TStringField
      FieldName = 'NUMEMPRESABANCO'
    end
    object QryDocumentosDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Size = 1
    end
    object QryDocumentosNOMEAGENCIA: TStringField
      FieldKind = fkCalculated
      FieldName = 'NOMEAGENCIA'
      Size = 60
      Calculated = True
    end
    object QryDocumentosTIPOCONTA: TStringField
      FieldKind = fkCalculated
      FieldName = 'TIPOCONTA'
      Size = 1
      Calculated = True
    end
    object QryDocumentosCODPORTADOR: TFloatField
      FieldName = 'CODPORTADOR'
    end
    object QryDocumentosLIVRE: TStringField
      FieldName = 'LIVRE'
      Size = 25
    end
  end
  object QryPortadorForma: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 515
    Top = 277
  end
  object QryModelosCnab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMODELOSCNAB,DESCRICAO '
      'FROM MODELOSCNAB '
      'WHERE RECPAG = '#39'P'#39
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 516
    Top = 327
    object QryModelosCnabIDMODELOSCNAB: TFloatField
      FieldName = 'IDMODELOSCNAB'
      Origin = 'MODELOSCNAB.IDMODELOSCNAB'
    end
    object QryModelosCnabDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'MODELOSCNAB.DESCRICAO'
      Size = 60
    end
  end
end
