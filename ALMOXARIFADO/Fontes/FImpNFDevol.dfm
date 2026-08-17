inherited FrmImpNFDevol: TFrmImpNFDevol
  Left = 75
  Top = 105
  HelpContext = 50068
  Caption = 'Impressão de Nota Fiscal'
  ClientHeight = 371
  ClientWidth = 667
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 667
    Height = 332
    object plnSel: TPanel
      Left = 5
      Top = 5
      Width = 657
      Height = 100
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 64
        Height = 13
        Caption = 'Nº da Nota'
      end
      object Label2: TLabel
        Left = 152
        Top = 8
        Width = 65
        Height = 13
        Caption = 'Data Início'
      end
      object Label3: TLabel
        Left = 280
        Top = 8
        Width = 51
        Height = 13
        Caption = 'Data Fim'
      end
      object edDataI: TCMDateTimePicker
        Left = 152
        Top = 24
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
        ShowButton = True
        TabOrder = 0
      end
      object edDataF: TCMDateTimePicker
        Left = 280
        Top = 24
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
        ShowButton = True
        TabOrder = 1
      end
      object edNumNota: TRealEdit
        Left = 16
        Top = 24
        Width = 129
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
      end
      object dblcFornCli: TCMProcuraForCli
        Left = 16
        Top = 48
        Width = 385
        Height = 47
        Caption = ' Favorecido '
        TabOrder = 3
        CampoEdit = ceRazaoSocial
        MostraMensagens = True
        Mensagens.EmBranco = 'Fornecedor em branco'
        Mensagens.NaoExiste = 'Fornecedor não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        ForCli = fcFornecedor
        MostraEndereco = False
        StatusForCli = fcAll
        MostraStatusCredito = False
      end
      object btnProc: TBitBtn
        Left = 552
        Top = 8
        Width = 89
        Height = 41
        Caption = '&Procurar'
        TabOrder = 4
        OnClick = btnProcClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
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
      end
      object btnLimpar: TBitBtn
        Left = 552
        Top = 48
        Width = 89
        Height = 41
        Caption = '&Limpar'
        TabOrder = 5
        OnClick = btnLimparClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888888FF8888888888888778888888888888F77F8888888888800F0887
          88888888F7787F88888888800FFF0878888888F7788878888888800FFFFFF788
          888887788888F888888887FFFFFF7888888887F888888888888887FFFF888888
          8788878F888FF8888888887FF80088887888887F88778F888888887F80D50887
          88888878F78878F88F8888870DDD508F08888887788887F878F88880EDDDD0FF
          F08888878F888788F788880E6EDD0FF77888887888F878F7788880E6E6E0F778
          888887F88887F7788888806E6E0778888888878F8877788888888806E0888888
          88888878F7888888888888800888888888888887788888888888}
        NumGlyphs = 2
      end
      object rgTipoNF: TRadioGroup
        Left = 408
        Top = 16
        Width = 121
        Height = 79
        Caption = ' Tipo '
        ItemIndex = 0
        Items.Strings = (
          'Devolução'
          'Entrada'
          'Saída')
        TabOrder = 6
      end
    end
    object Panel2: TPanel
      Left = 5
      Top = 105
      Width = 657
      Height = 27
      Align = alTop
      BevelInner = bvLowered
      Caption = 'Notas para Impressão'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object grdNota: TwwDBGrid
      Left = 5
      Top = 132
      Width = 657
      Height = 195
      Selected.Strings = (
        'FLGIMPRESSO'#9'1'#9'    '#9'F'
        'NUMNF'#9'10'#9'Nº da Nota'
        'COMPLNF'#9'5'#9'Compl.'
        'DATAEMISNF'#9'10'#9'Data~de Emissão'
        'DATAENTDEVOL'#9'11'#9'Data~de Devolução'
        'RAZAOSOCIAL'#9'35'#9'Fornecedor'
        'VLRNOTAFISCAL'#9'10'#9'Valor Nota')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      BorderStyle = bsNone
      DataSource = ds
      KeyOptions = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
      TabOrder = 2
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      OnDblClick = grdNotaDblClick
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 332
    Width = 667
    object Label4: TLabel [0]
      Left = 10
      Top = 11
      Width = 42
      Height = 13
      Caption = 'Modelo'
      Transparent = True
    end
    inherited tb97Fundo: TToolbar97
      Left = 419
      DockPos = 541
      inherited sep1: TToolbarSep97
        Left = 162
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
        HelpContext = 50068
      end
      object btnImprimir: TmaHelpBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = btnImprimirClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
          8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
          0000888800880007700888888F778F7778F778FF000088008800877007700888
          778F7787F778F778000080880088877770077087FF778887F88778F700008700
          888887777770008777888887FF888777000080888888F77777777087F8888F77
          78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
          87777087FF778888888778F7000087FF88899888888770877788888888888777
          000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
          778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
          88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
          8F888F77000088888888887FFF7788888888888878FF77880000888888888887
          7788888888888888877788880000888888888888888888888888888888888888
          0000}
        NumGlyphs = 2
        ClickHelpContext = 0
      end
    end
    object dblcModelo: TCMDBLookupCombo
      Left = 56
      Top = 8
      Width = 313
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTEMPLNFDEVOL'#9'60'#9'Descição'#9'F')
      LookupTable = qryModelo
      LookupField = 'IDTEMPLNFDEVOL'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65523
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT'
      '       N.FLGIMPRESSO,'
      '       N.IDNFRECEBDEVOL,'
      '       N.NUMNF,'
      '       N.COMPLNF,'
      '       N.IDPESSOA,'
      '       N.CODDOCUMENTO,'
      '       N.FLGTIPONOTA,'
      '       N.DATAEMISNF,'
      '       N.IDFORCLI,'
      '       N.DATAENTDEVOL,'
      '       N.VLRNOTAFISCAL,'
      '       N.PLNCODIGO,'
      '       N.IDNFREFERENCIA,'
      '       P.RAZAOSOCIAL,'
      '       P.NOME,'
      '       P.NUMDOCUMENTO,'
      '      (E.LOGRADOURO ||'#39' '#39'|| E.NUMERO) AS ENDERECO,'
      '       E.COMPLEMENTO,'
      '       E.BAIRRO,'
      '       E.CEP,'
      '       ES.CODESTADO,'
      '       P.EMAIL,'
      '       DECODE(E.IDCIDADES, NULL, E.CIDADE,C.NOME) AS CIDADE,'
      '       TC.TELEFONE,'
      '       TC.DDD,'
      '       FC.FAX,'
      '       FC.DDDFAX'
      ' FROM'
      '      NFRECEBDEVOL N,'
      '      PESSOA P,'
      '      ENDPESS E,'
      '      CIDADES C,'
      '      ESTADO  ES,'
      '      ('
      '       SELECT TP.IDENDERECO, TP.NUMERO AS TELEFONE,TP.DDI,TP.DDD'
      '       FROM  TELENDPESS  TP,'
      '            (SELECT IDENDERECO, MAX(IDTELEFONE) AS IDTELEFONE'
      '             FROM TELENDPESS'
      '             WHERE (TIPO LIKE '#39'%C%'#39')'
      '             GROUP BY IDENDERECO) C'
      '       WHERE (TP.IDENDERECO = C.IDENDERECO) AND'
      '             (TP.IDTELEFONE = C.IDTELEFONE)'
      '       ) TC,'
      
        '       (SELECT TP.IDENDERECO, TP.NUMERO AS FAX,TP.DDI AS DDIFAX ' +
        ',TP.DDD AS DDDFAX'
      '       FROM  TELENDPESS  TP,'
      '            (SELECT IDENDERECO, MAX(IDTELEFONE) AS IDTELEFONE'
      '             FROM TELENDPESS'
      '             WHERE (TIPO LIKE '#39'%F%'#39')'
      '             GROUP BY IDENDERECO) C'
      '       WHERE (TP.IDENDERECO = C.IDENDERECO) AND'
      '             (TP.IDTELEFONE = C.IDTELEFONE)'
      '       ) FC'
      ' WHERE'
      '          (N.FLGTIPONOTA    = '#39'D'#39')'
      ''
      '      AND (P.IDPESSOA       = N.IDFORCLI )'
      '      AND (E.IDPESSOA(+)    = P.IDPESSOA)'
      '      AND (E.IDENDERECO(+)  = P.IDENDCOMERCIAL)'
      '      AND (E.IDCIDADES      = C.IDCIDADES(+))'
      '      AND (ES.IDESTADO(+)   = C.IDESTADO)'
      '      AND (TC.IDENDERECO(+) = E.IDENDERECO)'
      '      AND (FC.IDENDERECO(+) = E.IDENDERECO)'
      'ORDER BY  N.DATAENTDEVOL'
      ''
      ' '
      ' ')
    UpdateObject = upd
    ControlType.Strings = (
      'FLGIMPRESSO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 352
    Top = 201
    object qryFLGIMPRESSO: TStringField
      DisplayLabel = '    '
      DisplayWidth = 1
      FieldName = 'FLGIMPRESSO'
      FixedChar = True
      Size = 1
    end
    object qryNUMNF: TFloatField
      DisplayLabel = 'Nº da Nota'
      DisplayWidth = 10
      FieldName = 'NUMNF'
    end
    object qryCOMPLNF: TStringField
      DisplayLabel = 'Compl.'
      DisplayWidth = 5
      FieldName = 'COMPLNF'
      Size = 5
    end
    object qryDATAEMISNF: TDateTimeField
      DisplayLabel = 'Data~de Emissão'
      DisplayWidth = 10
      FieldName = 'DATAEMISNF'
    end
    object qryDATAENTDEVOL: TDateTimeField
      DisplayLabel = 'Data~de Devolução'
      DisplayWidth = 11
      FieldName = 'DATAENTDEVOL'
    end
    object qryRAZAOSOCIAL: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 35
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryVLRNOTAFISCAL: TFloatField
      DisplayLabel = 'Valor Nota'
      DisplayWidth = 10
      FieldName = 'VLRNOTAFISCAL'
      DisplayFormat = '#,##0.00'
    end
    object qryIDNFRECEBDEVOL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDNFRECEBDEVOL'
      Visible = False
    end
    object qryIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryCODDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object qryFLGTIPONOTA: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTIPONOTA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object qryPLNCODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryIDNFREFERENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDNFREFERENCIA'
      Visible = False
    end
    object qryNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Visible = False
      Size = 60
    end
    object qryNUMDOCUMENTO: TStringField
      DisplayWidth = 18
      FieldName = 'NUMDOCUMENTO'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qryENDERECO: TStringField
      DisplayWidth = 69
      FieldName = 'ENDERECO'
      Visible = False
      Size = 69
    end
    object qryCOMPLEMENTO: TStringField
      DisplayWidth = 20
      FieldName = 'COMPLEMENTO'
      Visible = False
    end
    object qryBAIRRO: TStringField
      DisplayWidth = 20
      FieldName = 'BAIRRO'
      Visible = False
    end
    object qryCEP: TStringField
      DisplayWidth = 8
      FieldName = 'CEP'
      Visible = False
      Size = 8
    end
    object qryCODESTADO: TStringField
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qryEMAIL: TStringField
      DisplayWidth = 100
      FieldName = 'EMAIL'
      Visible = False
      Size = 100
    end
    object qryCIDADE: TStringField
      DisplayWidth = 50
      FieldName = 'CIDADE'
      Visible = False
      Size = 50
    end
    object qryTELEFONE: TStringField
      DisplayWidth = 20
      FieldName = 'TELEFONE'
      Visible = False
    end
    object qryDDD: TStringField
      DisplayWidth = 5
      FieldName = 'DDD'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object qryFAX: TStringField
      DisplayWidth = 20
      FieldName = 'FAX'
      Visible = False
    end
    object qryDDDFAX: TStringField
      DisplayWidth = 5
      FieldName = 'DDDFAX'
      Visible = False
      FixedChar = True
      Size = 5
    end
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      I.IDITENSRECDEV,'
      '      I.NUMOC,'
      '      I.CODARTIGO,'
      '      I.CODMEDIDA,'
      '      I.IDMOV,'
      '      I.IDEMPRESA,'
      '      I.CODCENTROCUSTO,'
      '      I.CODALMOXARIFADO,'
      '      I.IDPESSOA,'
      '      I.IDNFRECEBDEVOL,'
      '      I.QTDERECEBDEVOL,'
      '      I.VLRUNITARIO,'
      '      I.VLRESTOQUE,'
      '      I.FLGDESTINO,'
      '      I.DATAVALIDADE,'
      '      I.RECPAG,'
      '      I.CODTIPRECDES,'
      '      I.UNIDNEGOC,'
      '      I.CODCENTRORESPON,'
      
        '      SUBSTR(DECODE(I.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI' +
        '),1,60)  AS DESCPROD,'
      '      P.CONSUMOREVENDA,'
      '      A.CODCOR,'
      '      A.CODTAMANHO,'
      '      I.IDPRODVARI,'
      '      CF.CODFISCAL,'
      '      CF.DESCCLASSIFISCAL,'
      '      SUB.TOTPROD'
      'FROM'
      '      ITENSRECEBDEVOL I,'
      '      PRODUTO P,'
      '      ARTIGO A,'
      '      PRODVARI PV,'
      '      CLASFISC CF,'
      '      (SELECT SUM(VLRESTOQUE) AS TOTPROD'
      '       FROM ITENSRECEBDEVOL'
      '       WHERE(IDNFRECEBDEVOL = :pNUMIDNF)'
      '       ) SUB'
      ''
      'WHERE'
      '        ( I.IDNFRECEBDEVOL = :pNUMIDNF)'
      '    AND (I.CODARTIGO = A.CODARTIGO)'
      '    AND (P.CODPRODUTO = A.CODPRODUTO)'
      '    AND (PV.IDPRODVARI(+) = I.IDPRODVARI)'
      '    AND (CF.CODFISCAL = I.CODFISCAL)'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 467
    Top = 136
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pNUMIDNF'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'pNUMIDNF'
        ParamType = ptUnknown
      end>
    object qryDetIDITENSRECDEV: TFloatField
      FieldName = 'IDITENSRECDEV'
    end
    object qryDetNUMOC: TFloatField
      FieldName = 'NUMOC'
    end
    object qryDetCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      FixedChar = True
      Size = 14
    end
    object qryDetCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      FixedChar = True
      Size = 4
    end
    object qryDetIDMOV: TFloatField
      FieldName = 'IDMOV'
    end
    object qryDetIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qryDetCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryDetCODALMOXARIFADO: TFloatField
      FieldName = 'CODALMOXARIFADO'
    end
    object qryDetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryDetIDNFRECEBDEVOL: TFloatField
      FieldName = 'IDNFRECEBDEVOL'
    end
    object qryDetQTDERECEBDEVOL: TFloatField
      FieldName = 'QTDERECEBDEVOL'
    end
    object qryDetVLRUNITARIO: TFloatField
      FieldName = 'VLRUNITARIO'
    end
    object qryDetVLRESTOQUE: TFloatField
      FieldName = 'VLRESTOQUE'
    end
    object qryDetFLGDESTINO: TStringField
      FieldName = 'FLGDESTINO'
      FixedChar = True
      Size = 1
    end
    object qryDetDATAVALIDADE: TDateTimeField
      FieldName = 'DATAVALIDADE'
    end
    object qryDetRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryDetCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object qryDetUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qryDetCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      FixedChar = True
      Size = 10
    end
    object qryDetDESCPROD: TStringField
      FieldName = 'DESCPROD'
      Size = 60
    end
    object qryDetCONSUMOREVENDA: TStringField
      FieldName = 'CONSUMOREVENDA'
      FixedChar = True
      Size = 1
    end
    object qryDetCODCOR: TStringField
      FieldName = 'CODCOR'
      FixedChar = True
      Size = 5
    end
    object qryDetCODTAMANHO: TStringField
      FieldName = 'CODTAMANHO'
      FixedChar = True
      Size = 3
    end
    object qryDetIDPRODVARI: TFloatField
      FieldName = 'IDPRODVARI'
    end
    object qryDetDESCCLASSIFISCAL: TStringField
      FieldName = 'DESCCLASSIFISCAL'
      FixedChar = True
      Size = 50
    end
    object qryDetCODFISCAL: TStringField
      FieldName = 'CODFISCAL'
      FixedChar = True
      Size = 4
    end
    object qryDetTOTPROD: TFloatField
      FieldName = 'TOTPROD'
    end
  end
  object qryAgregItem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     A.CODTIPOCUSTAGREG,'
      '     A.IDAGRITENSRECDEV,'
      '     A.IDITENSRECDEV,'
      '     A.ALIQUOTA,'
      '     A.BASECALCULO,'
      '     A.VLRAGREGADO'
      'FROM'
      '     TIPOAGRE T,'
      '     AGRITENSRECDEV A'
      'WHERE'
      '      (T.FLGINCIDERECEB = '#39'S'#39')'
      '  AND (T.TOTALITEM = '#39'I'#39')'
      '  AND (A.IDITENSRECDEV = :IDITENSRECDEV)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 529
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDITENSRECDEV'
        ParamType = ptUnknown
      end>
    object qryAgregItemCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Origin = 'BASEDADOS.AGRITENSRECDEV.CODTIPOCUSTAGREG'
    end
    object qryAgregItemIDAGRITENSRECDEV: TFloatField
      FieldName = 'IDAGRITENSRECDEV'
      Origin = 'BASEDADOS.AGRITENSRECDEV.IDAGRITENSRECDEV'
    end
    object qryAgregItemIDITENSRECDEV: TFloatField
      FieldName = 'IDITENSRECDEV'
      Origin = 'BASEDADOS.AGRITENSRECDEV.IDITENSRECDEV'
    end
    object qryAgregItemALIQUOTA: TFloatField
      FieldName = 'ALIQUOTA'
      Origin = 'BASEDADOS.AGRITENSRECDEV.ALIQUOTA'
    end
    object qryAgregItemBASECALCULO: TFloatField
      FieldName = 'BASECALCULO'
      Origin = 'BASEDADOS.AGRITENSRECDEV.BASECALCULO'
    end
    object qryAgregItemVLRAGREGADO: TFloatField
      FieldName = 'VLRAGREGADO'
      Origin = 'BASEDADOS.AGRITENSRECDEV.VLRAGREGADO'
    end
  end
  object qryAgregNota: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '         T.CODTIPOCUSTAGREG,'
      '         T.CODTRATFISCE,'
      '         T.DESCCUSTAGREG,'
      '         T.PERCVALOR,'
      '         A.IDAGRNFRECDEV,'
      '         A.IDNFRECEBDEVOL,'
      '         A.IDNFCOMPLEMENTAR,'
      '         A.ALIQUOTA,'
      '         A.BASECALCULO,'
      '         A.VLRAGREGADO  '
      'FROM'
      '         TIPOAGRE T,'
      '         AGRNFRECDEV A'
      'WHERE'
      '            (T.FLGINCIDERECEB = '#39'S'#39')'
      '           AND  (T.TOTALITEM = '#39'T'#39')'
      '           AND ( A.IDNFRECEBDEVOL = :iAgregNota)'
      '  AND (T.CODTIPOCUSTAGREG = A.CODTIPOCUSTAGREG)'
      ''
      '')
    ValidateWithMask = True
    Left = 600
    Top = 136
    ParamData = <
      item
        DataType = ftFloat
        Name = 'iAgregNota'
        ParamType = ptUnknown
      end>
    object qryAgregNotaCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Origin = 'BASEDADOS.TIPOAGRE.CODTIPOCUSTAGREG'
    end
    object qryAgregNotaCODTRATFISCE: TStringField
      FieldName = 'CODTRATFISCE'
      Origin = 'BASEDADOS.TIPOAGRE.CODTRATFISCE'
      FixedChar = True
      Size = 1
    end
    object qryAgregNotaDESCCUSTAGREG: TStringField
      FieldName = 'DESCCUSTAGREG'
      Origin = 'BASEDADOS.TIPOAGRE.DESCCUSTAGREG'
      Size = 60
    end
    object qryAgregNotaPERCVALOR: TStringField
      FieldName = 'PERCVALOR'
      Origin = 'BASEDADOS.TIPOAGRE.PERCVALOR'
      FixedChar = True
      Size = 1
    end
    object qryAgregNotaIDAGRNFRECDEV: TFloatField
      FieldName = 'IDAGRNFRECDEV'
      Origin = 'BASEDADOS.AGRNFRECDEV.IDAGRNFRECDEV'
    end
    object qryAgregNotaIDNFRECEBDEVOL: TFloatField
      FieldName = 'IDNFRECEBDEVOL'
      Origin = 'BASEDADOS.AGRNFRECDEV.IDNFRECEBDEVOL'
    end
    object qryAgregNotaIDNFCOMPLEMENTAR: TFloatField
      FieldName = 'IDNFCOMPLEMENTAR'
      Origin = 'BASEDADOS.AGRNFRECDEV.IDNFCOMPLEMENTAR'
    end
    object qryAgregNotaALIQUOTA: TFloatField
      FieldName = 'ALIQUOTA'
      Origin = 'BASEDADOS.AGRNFRECDEV.ALIQUOTA'
    end
    object qryAgregNotaBASECALCULO: TFloatField
      FieldName = 'BASECALCULO'
      Origin = 'BASEDADOS.AGRNFRECDEV.BASECALCULO'
    end
    object qryAgregNotaVLRAGREGADO: TFloatField
      FieldName = 'VLRAGREGADO'
      Origin = 'BASEDADOS.AGRNFRECDEV.VLRAGREGADO'
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 307
    Top = 204
  end
  object qryModelo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDTEMPLNFDEVOL,'
      '     DESCTEMPLNFDEVOL,'
      '     ICMSNOTA,'
      '     ICMSITEM,'
      '     ICMSSUBSTITUICAO,'
      '     IPIITEM,'
      '     FRETE,'
      '     SEGURO,'
      '     OUTRASDESP,'
      '     IDDOCUMENTO'
      'FROM'
      '     TEMPLNFDEVOL'
      'ORDER BY 2'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 400
    Top = 200
    object qryModeloIDTEMPLNFDEVOL: TFloatField
      FieldName = 'IDTEMPLNFDEVOL'
      Origin = 'BASEDADOS.TEMPLNFDEVOL.IDTEMPLNFDEVOL'
    end
    object qryModeloDESCTEMPLNFDEVOL: TStringField
      FieldName = 'DESCTEMPLNFDEVOL'
      Origin = 'BASEDADOS.TEMPLNFDEVOL.DESCTEMPLNFDEVOL'
      Size = 60
    end
    object qryModeloICMSNOTA: TFloatField
      FieldName = 'ICMSNOTA'
      Origin = 'BASEDADOS.TEMPLNFDEVOL.ICMSNOTA'
    end
    object qryModeloICMSITEM: TFloatField
      FieldName = 'ICMSITEM'
      Origin = 'BASEDADOS.TEMPLNFDEVOL.ICMSITEM'
    end
    object qryModeloICMSSUBSTITUICAO: TFloatField
      FieldName = 'ICMSSUBSTITUICAO'
      Origin = 'BASEDADOS.TEMPLNFDEVOL.ICMSSUBSTITUICAO'
    end
    object qryModeloIPIITEM: TFloatField
      FieldName = 'IPIITEM'
      Origin = 'BASEDADOS.TEMPLNFDEVOL.IPIITEM'
    end
    object qryModeloFRETE: TFloatField
      FieldName = 'FRETE'
      Origin = 'BASEDADOS.TEMPLNFDEVOL.FRETE'
    end
    object qryModeloSEGURO: TFloatField
      FieldName = 'SEGURO'
      Origin = 'BASEDADOS.TEMPLNFDEVOL.SEGURO'
    end
    object qryModeloOUTRASDESP: TFloatField
      FieldName = 'OUTRASDESP'
      Origin = 'BASEDADOS.TEMPLNFDEVOL.OUTRASDESP'
    end
    object qryModeloIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
    end
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update NFRECEBDEVOL'
      'set'
      '  NUMNF = :NUMNF,'
      '  FLGIMPRESSO = :FLGIMPRESSO'
      'where'
      '  IDNFRECEBDEVOL = :OLD_IDNFRECEBDEVOL')
    InsertSQL.Strings = (
      'insert into NFRECEBDEVOL'
      '  (NUMNF, FLGIMPRESSO)'
      'values'
      '  (:NUMNF, :FLGIMPRESSO)')
    DeleteSQL.Strings = (
      'delete from NFRECEBDEVOL'
      'where'
      '  IDNFRECEBDEVOL = :OLD_IDNFRECEBDEVOL')
    Left = 352
    Top = 152
  end
end
