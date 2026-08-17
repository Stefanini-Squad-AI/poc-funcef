inherited frmInscricaoParticipanteLote: TfrmInscricaoParticipanteLote
  Left = 168
  Top = 243
  BorderIcons = [biSystemMenu]
  Caption = 'Inscrição do Participante em Lote'
  ClientHeight = 449
  ClientWidth = 1051
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1051
    Height = 363
    object GroupBox1: TGroupBox
      Left = 8
      Top = 22
      Width = 1041
      Height = 289
      Caption = 'Inscrição de Participante em Lote'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object dbgrdParticipantes: TwwDBGrid
        Left = 8
        Top = 16
        Width = 1025
        Height = 243
        ControlType.Strings = (
          'SEL;CheckBox;1;0')
        Selected.Strings = (
          'SEL'#9'3'#9' '
          'MATRICULA'#9'10'#9'Matrícula'
          'PERCENTUAL'#9'11'#9'% Contribuição'
          'PLANO'#9'17'#9'Plano Previdenciário'
          'DATAINSCRICAO'#9'12'#9'Data de Inscrição Funcef'
          'DATAOPCAOIR'#9'10'#9'Data da Opção de IR'
          'NUMDOCUMENTO'#9'16'#9'Proposta Recebida Em'
          'EMAILFUNCEF'#9'18'#9'E-mail base FUNCEF'
          'DESCOPCAOIR'#9'18'#9'Regime de Tributação')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        DataSource = dsGrid
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object btnExcluir: TBitBtn
        Left = 666
        Top = 264
        Width = 71
        Height = 20
        Hint = 'Excluir'
        Caption = 'Excluir'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnExcluirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
          03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
          33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
          0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
          3333333337FFF7F3333333333000003333333333377777333333}
        NumGlyphs = 2
      end
      object btnLimpar: TBitBtn
        Left = 592
        Top = 259
        Width = 66
        Height = 25
        Hint = 'Limpar'
        Caption = 'Limpar'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Visible = False
        OnClick = btnLimparClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555FFFFFFFFFF5F5557777777777505555777777777757F55555555555555
          055555555555FF5575F555555550055030555555555775F7F7F55555550FB000
          005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
          B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
          305555577F555557F7F5550E0BFBFB003055557575F55577F7F550EEE0BFB0B0
          305557FF575F5757F7F5000EEE0BFBF03055777FF575FFF7F7F50000EEE00000
          30557777FF577777F7F500000E05555BB05577777F75555777F5500000555550
          3055577777555557F7F555000555555999555577755555577755}
        NumGlyphs = 2
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 311
      Width = 1041
      Height = 47
      Caption = 'Formatos:'
      TabOrder = 1
      object Label1: TLabel
        Left = 751
        Top = 23
        Width = 21
        Height = 13
        Caption = 'De:'
      end
      object Label2: TLabel
        Left = 883
        Top = 22
        Width = 24
        Height = 13
        Caption = 'Até:'
      end
      object chkpdf: TCheckBox
        Left = 11
        Top = 21
        Width = 57
        Height = 17
        Caption = 'Pdf'
        TabOrder = 0
      end
      object chktxt: TCheckBox
        Left = 76
        Top = 21
        Width = 49
        Height = 17
        Caption = 'Txt'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object chkXls: TCheckBox
        Left = 134
        Top = 21
        Width = 57
        Height = 17
        Caption = 'Excel'
        TabOrder = 2
      end
      object chkRelatorio: TCheckBox
        Left = 206
        Top = 21
        Width = 82
        Height = 17
        Caption = 'Relatório'
        TabOrder = 3
      end
    end
    object dtInicio: TCMDateTimePicker
      Left = 781
      Top = 330
      Width = 105
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
      TabOrder = 2
    end
    object dtFim: TCMDateTimePicker
      Left = 916
      Top = 329
      Width = 105
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
      TabOrder = 3
    end
    object chkSel: TCheckBox
      Left = 36
      Top = 40
      Width = 13
      Height = 17
      TabOrder = 4
      OnClick = chkSelClick
    end
  end
  inherited Dock972: TDock97
    Width = 1051
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Tag = 1
        OnClick = sbtnInserirClick
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 410
    Width = 1051
    object btnArquivo: TSpeedButton [0]
      Left = 696
      Top = 2
      Width = 79
      Height = 34
      Caption = 'Arquivos'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333337777777733333333008088003333333377F73377333333330088
        88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
        000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
        FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
        99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      Visible = False
    end
    inherited tb97Fundo: TToolbar97
      Left = 778
      DockPos = 778
      inherited sep1: TToolbarSep97
        Left = 81
      end
      inherited sep3: TToolbarSep97
        Left = 84
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 87
        Width = 96
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 523
      DockPos = 523
      inherited ToolbarSep971: TToolbarSep97
        Left = 242
      end
      object btnGerar: TSpeedButton [1]
        Left = 80
        Top = 0
        Width = 81
        Height = 33
        Caption = 'Arquivos'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        OnClick = btnGerarClick
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 80
        Enabled = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 161
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 544
    Top = 6
    TargetsData = (
      1
      1
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 667
    Top = 6
  end
  inherited upd: TUpdateSQL
    Left = 707
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Left = 789
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 585
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 748
    Top = 6
  end
  inherited qry: TwwQuery
    Left = 626
    Top = 6
  end
  object QryGrid: TQuery
    AutoCalcFields = False
    CachedUpdates = True
    AfterPost = QryGridAfterPost
    AfterScroll = QryGridAfterScroll
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT'
      '0 AS SEL,'
      '0 AS NOVAMATRICULA,'
      #39' XXXXXXXXXXXXXXX'#39'  AS MATRICULA,'
      '0 AS IDPESSJUR,'
      '0 AS IDPESSOA,'
      
        #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS ' +
        'NOME,'
      '0 AS PERCENTUAL,'
      '0 AS PLANOPREV,'
      #39'XXXXXXXXXXXXXXXXXXX'#39' AS PLANO,'
      #39'XXXXXXXXXXXXXXX'#39'  AS DATAINSCRICAO,'
      '0 AS OPCAOIR,'
      #39'XXXXXXXXXXXXXXX'#39' AS DESCOPCAOIR,'
      #39'00/00/0000'#39' AS INSCRICAODATA,'
      #39'00/00/0000'#39' AS DATAOPCAOIR,'
      '0 AS POSSUIPLANOATIVO,'
      #39'00/00/0000'#39' AS DATAEMISSAO,'
      #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS NUMDOCUMENTO,'
      
        #39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' +
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS EMAILFUNCEF,'
      #39' XXXXXXXXXXXXXXX'#39'  INSCRICAONUMERO,'
      '0 IDCONTRIBUICAO'
      'FROM DUAL')
    UpdateObject = updGrid
    Left = 152
    Top = 269
    object QryGridSEL: TFloatField
      DefaultExpression = '1'
      FieldName = 'SEL'
      OnChange = QryGridSELChange
    end
    object QryGridNOVAMATRICULA: TFloatField
      FieldName = 'NOVAMATRICULA'
    end
    object QryGridMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 16
    end
    object QryGridIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object QryGridIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object QryGridNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 58
    end
    object QryGridPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object QryGridPLANOPREV: TFloatField
      FieldName = 'PLANOPREV'
    end
    object QryGridPLANO: TStringField
      FieldName = 'PLANO'
      FixedChar = True
      Size = 19
    end
    object QryGridDATAINSCRICAO: TStringField
      FieldName = 'DATAINSCRICAO'
      FixedChar = True
      Size = 15
    end
    object QryGridOPCAOIR: TFloatField
      FieldName = 'OPCAOIR'
    end
    object QryGridDESCOPCAOIR: TStringField
      FieldName = 'DESCOPCAOIR'
      FixedChar = True
      Size = 15
    end
    object QryGridINSCRICAODATA: TStringField
      FieldName = 'INSCRICAODATA'
      FixedChar = True
      Size = 10
    end
    object QryGridDATAOPCAOIR: TStringField
      FieldName = 'DATAOPCAOIR'
      FixedChar = True
      Size = 10
    end
    object QryGridPOSSUIPLANOATIVO: TFloatField
      FieldName = 'POSSUIPLANOATIVO'
    end
    object QryGridDATAEMISSAO: TStringField
      FieldName = 'DATAEMISSAO'
      FixedChar = True
      Size = 10
    end
    object QryGridNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 30
    end
    object QryGridEMAILFUNCEF: TStringField
      FieldName = 'EMAILFUNCEF'
      FixedChar = True
      Size = 99
    end
    object QryGridINSCRICAONUMERO: TStringField
      FieldName = 'INSCRICAONUMERO'
      FixedChar = True
      Size = 16
    end
    object QryGridIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
    end
  end
  object dsGrid: TDataSource
    DataSet = QryGrid
    Left = 96
    Top = 269
  end
  object updGrid: TUpdateSQL
    Left = 200
    Top = 269
  end
  object QryAux: TQuery
    DatabaseName = 'BaseDados'
    Left = 336
    Top = 141
  end
  object ppReport: TppReport
    AutoStop = False
    DataPipeline = ppPipeLine
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 496
    Top = 165
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppPipeLine'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 38629
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'FUNCEF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 7535
        mmLeft = 85821
        mmTop = 5027
        mmWidth = 25739
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Listagem de inscrições de participantes em lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 2116
        mmTop = 20902
        mmWidth = 96838
        BandType = 0
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        mmHeight = 7938
        mmLeft = 1059
        mmTop = 30691
        mmWidth = 15875
        BandType = 0
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        mmHeight = 7938
        mmLeft = 16669
        mmTop = 30691
        mmWidth = 83608
        BandType = 0
      end
      object ppShape10: TppShape
        UserName = 'Shape10'
        mmHeight = 7938
        mmLeft = 100013
        mmTop = 30691
        mmWidth = 18785
        BandType = 0
      end
      object ppShape11: TppShape
        UserName = 'Shape11'
        mmHeight = 7938
        mmLeft = 118534
        mmTop = 30691
        mmWidth = 23283
        BandType = 0
      end
      object ppShape12: TppShape
        UserName = 'Shape12'
        mmHeight = 7938
        mmLeft = 141552
        mmTop = 30691
        mmWidth = 16140
        BandType = 0
      end
      object ppShape13: TppShape
        UserName = 'Shape13'
        Visible = False
        mmHeight = 7938
        mmLeft = 180711
        mmTop = 30691
        mmWidth = 16933
        BandType = 0
      end
      object ppShape14: TppShape
        UserName = 'Shape14'
        mmHeight = 7938
        mmLeft = 157427
        mmTop = 30691
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Matricula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 34396
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Contrib. (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 100277
        mmTop = 34396
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 119063
        mmTop = 34396
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = '  FUNCEF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 142875
        mmTop = 34396
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Tributação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 161132
        mmTop = 34396
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 17198
        mmTop = 34396
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 146315
        mmTop = 30692
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 185473
        mmTop = 30956
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'CAIXA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 184150
        mmTop = 34660
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 124619
        mmTop = 30692
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Regime de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 161396
        mmTop = 30692
        mmWidth = 16140
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 3969
        mmLeft = 16669
        mmTop = 0
        mmWidth = 83608
        BandType = 4
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 3969
        mmLeft = 100013
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 3969
        mmLeft = 118534
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        mmHeight = 3969
        mmLeft = 141552
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        mmHeight = 3969
        mmLeft = 157427
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MATRICULA'
        DataPipeline = ppPipeLine
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPipeLine'
        mmHeight = 3260
        mmLeft = 1852
        mmTop = 265
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PARTICIPANTE'
        DataPipeline = ppPipeLine
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPipeLine'
        mmHeight = 3175
        mmLeft = 17198
        mmTop = 265
        mmWidth = 82286
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'Contribuicao'
        DataPipeline = ppPipeLine
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppPipeLine'
        mmHeight = 3260
        mmLeft = 101071
        mmTop = 265
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PLANO'
        DataPipeline = ppPipeLine
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPipeLine'
        mmHeight = 3260
        mmLeft = 119063
        mmTop = 265
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DataInscricao'
        DataPipeline = ppPipeLine
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppPipeLine'
        mmHeight = 3260
        mmLeft = 142346
        mmTop = 265
        mmWidth = 14552
        BandType = 4
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        Visible = False
        mmHeight = 3969
        mmLeft = 180711
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'OpcaoIr'
        DataPipeline = ppPipeLine
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPipeLine'
        mmHeight = 3175
        mmLeft = 158486
        mmTop = 265
        mmWidth = 21696
        BandType = 4
      end
      object ppLblDataCaixa: TppLabel
        UserName = 'LblDataCaixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 182034
        mmTop = 265
        mmWidth = 14552
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 2117
      mmPrintPosition = 0
    end
  end
  object ppPipeLine: TppDBPipeline
    DataSource = dsRelatorio
    UserName = 'PipeLine'
    Left = 496
    Top = 221
  end
  object QryRelatorio: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      
        'SELECT PPP.TRGDTINCLUSAO,PPP.IDPESSJUR,EL.MATRICULA,PPP.INSCRICA' +
        'ODATA AS DATAINSCRICAO, CTP.VALORBASE1 AS CONTRIBUICAO, DECODE(P' +
        'PP.TIPOOPCAOIR,'#39'1'#39','#39'PROGRESSIVA'#39','#39'REGRESSIVA'#39') AS OPCAOIR, PP.NO' +
        'ME AS PLANO, P.NOME AS PARTICIPANTE, PPP.IDPLANOPREV'
      
        ' FROM PARTPREVPLAN PPP, CONTRIBPREVPARTP CTP, ELEGPATRO EL, PLAN' +
        'PREV PP, PESSOA P'
      ''
      'WHERE  PPP.FLGINSCRICAOLOTE = 1'
      
        'AND   ((TRUNC(PPP.TRGDTINCLUSAO) >= :PDTINICIO )AND (TRUNC(PPP.T' +
        'RGDTINCLUSAO) <= :PDATAFIM ))'
      ''
      'AND CTP.IDCONTRIBUICAO = 1'
      ''
      'AND   PPP.IDPESSJUR    = CTP.IDPESSJUR'
      'AND   PPP.IDPESSOA     = CTP.IDPESSOA'
      'AND   PPP.IDPLANOPREV  = CTP.IDPLANOPREV'
      'AND   PPP.IDPESSJUR    = EL.IDPESSJUR'
      'AND   PPP.IDPESSOA     = EL.IDPESSOA'
      'AND   PPP.IDPLANOPREV  = PP.IDPLANOPREV'
      'AND   PPP.IDPESSOA     = P.IDPESSOA'
      
        'GROUP BY PPP.TRGDTINCLUSAO,PPP.IDPESSJUR,EL.MATRICULA, PPP.INSCR' +
        'ICAODATA , CTP.VALORBASE1 , PPP.TIPOOPCAOIR, PP.NOME, P.NOME,PPP' +
        '.IDPLANOPREV'
      'ORDER BY PPP.TRGDTINCLUSAO'
      ' '
      ' ')
    Left = 560
    Top = 165
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PDTINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDATAFIM'
        ParamType = ptUnknown
      end>
  end
  object dsRelatorio: TDataSource
    DataSet = QryRelatorio
    Left = 560
    Top = 224
  end
end
