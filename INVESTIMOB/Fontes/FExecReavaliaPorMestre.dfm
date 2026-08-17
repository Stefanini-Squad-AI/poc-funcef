inherited frmExecReavaliaPorMestre: TfrmExecReavaliaPorMestre
  Left = 9
  Top = 92
  BorderStyle = bsSingle
  Caption = 'Reavaliação por Imóvel Mestre'
  ClientHeight = 419
  ClientWidth = 763
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 763
    Height = 303
    object Label1: TLabel
      Left = 16
      Top = 6
      Width = 80
      Height = 13
      Caption = 'Imovel Mestre'
    end
    object Label6: TLabel
      Left = 328
      Top = 46
      Width = 49
      Height = 13
      Caption = 'Vida Útil'
    end
    object Label9: TLabel
      Left = 408
      Top = 64
      Width = 37
      Height = 13
      Caption = 'Meses'
    end
    object Label7: TLabel
      Left = 152
      Top = 46
      Width = 87
      Height = 13
      Caption = 'Valor do Laudo'
    end
    object Label15: TLabel
      Left = 16
      Top = 46
      Width = 121
      Height = 13
      Caption = 'Data da Reavaliação'
    end
    object Label4: TLabel
      Left = 16
      Top = 86
      Width = 132
      Height = 13
      Caption = 'Observações do Laudo'
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 142
      Width = 763
      Height = 161
      ActivePage = tbsImovel
      Align = alBottom
      TabOrder = 0
      object tbsImovel: TTabSheet
        Caption = 'Imóveis'
        object DBgrdImoveis: TwwDBGrid
          Left = 0
          Top = 0
          Width = 755
          Height = 133
          Selected.Strings = (
            'IMONOME'#9'43'#9'Imóvel'
            'IMOCODIGO'#9'13'#9'Código'
            'CUSTO_CONTABIL'#9'16'#9'Custo Contábil'
            'VLR_LAUDO'#9'16'#9'Valor do Laudo')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dtsImovel
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = DBgrdImoveisCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdImoveisTopRowChanged
        end
      end
      object tbsBem: TTabSheet
        Caption = 'Bens'
        object DBgrdBens: TwwDBGrid
          Left = 0
          Top = 0
          Width = 753
          Height = 133
          Selected.Strings = (
            'GrupoExtenso'#9'20'#9'Grupo'
            'PLACA'#9'11'#9'Nº Tombamento'
            'DESBEM'#9'30'#9'Descrição'
            'SUMVALCTB'#9'13'#9'Custo Contábil'
            'VLRREAVAL'#9'13'#9'Valor do Laudo')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dtsBemXMestre
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = DBgrdBensCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdBensTopRowChanged
        end
      end
    end
    object btnBuscaMestre: TBitBtn
      Left = 424
      Top = 20
      Width = 23
      Height = 22
      TabOrder = 1
      OnClick = btnBuscaMestreClick
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
    end
    object edtMestre: TEdit
      Left = 16
      Top = 20
      Width = 409
      Height = 21
      TabOrder = 2
    end
    object edtDataReaval: TCMDateTimePicker
      Left = 16
      Top = 60
      Width = 113
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
      OnExit = edtDataReavalExit
    end
    object DBspnVidaUtil: TwwDBSpinEdit
      Left = 328
      Top = 60
      Width = 73
      Height = 21
      Increment = 1
      MaxValue = 1200
      TabOrder = 4
      UnboundDataType = wwDefault
    end
    object GroupBox1: TGroupBox
      Left = 464
      Top = 16
      Width = 281
      Height = 105
      Caption = ' Tipo de Operação de Investimento '
      TabOrder = 5
      object Label42: TLabel
        Left = 16
        Top = 18
        Width = 121
        Height = 13
        Caption = 'Reavaliação Positiva'
      end
      object Label2: TLabel
        Left = 16
        Top = 58
        Width = 127
        Height = 13
        Caption = 'Reavaliação Negativa'
      end
      object DBcboTipoOperPositiva: TwwDBLookupCombo
        Left = 16
        Top = 32
        Width = 249
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'60'#9'DESCTIPOOPERACAO')
        LookupTable = qryLookTipoOperPositiva
        LookupField = 'IDTIPOOPERACAO'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
      end
      object DBcboTipoOperNegativa: TwwDBLookupCombo
        Left = 16
        Top = 72
        Width = 249
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'60'#9'DESCTIPOOPERACAO')
        LookupTable = qryLookTipoOperNegativa
        LookupField = 'IDTIPOOPERACAO'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
      end
    end
    object edtObsLaudo: TEdit
      Left = 16
      Top = 100
      Width = 433
      Height = 21
      TabOrder = 6
    end
    object DBedtValorReavalia: TRealEdit
      Left = 152
      Top = 60
      Width = 153
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 7
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
  end
  inherited Dock971: TDock97
    Top = 384
    Width = 763
    Height = 35
    inherited tb97Fundo: TToolbar97
      Left = 588
      DockPos = 588
      inherited sep1: TToolbarSep97
        Left = 164
      end
      inherited sep3: TToolbarSep97
        Left = 166
      end
      inherited bbtnSair: TBitBtn
        Top = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 83
        Top = 1
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 158
      DockPos = 158
      inherited ToolbarSep971: TToolbarSep97
        Left = 342
        Visible = False
      end
      inherited ToolbarSep974: TToolbarSep97
        Left = 340
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 171
        Top = 1
        Width = 169
        Caption = 'Processa Reavaliação'
        Default = False
        Enabled = False
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000013000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555550000
          555555500000555555030B030055555000005555553BBBBB3055555000005555
          533B303B000555500000555553BB070BB305555000005555533B303B00055550
          00005555553BBBBB305555500000555555330B03005555500000555500003333
          5554555000005507080700555544455000005578888870555454545000005778
          7078000555545450000057880708870555444550000057787078000554545550
          0000557888887055545454500000557708070055554445500000555577775555
          555455500000555555555555555555500000}
        NumGlyphs = 1
      end
      inherited bbtnCancelar: TBitBtn
        Left = 344
        Top = 1
        Visible = False
      end
      object btnCalcula: TBitBtn
        Left = 2
        Top = 0
        Width = 169
        Height = 29
        Caption = 'Calcula Rateio por Bem'
        ModalResult = 1
        TabOrder = 2
        OnClick = btnCalculaClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777777777777777777700000000000000766444444444444406E6666666666
          66406E60F0F0F067F0406E666666666666406E60F0F0F0F0F0406E6666666666
          66406E077777776666406E0FFFFFF76666406E000000006666406EEEEEEEEEEE
          EE60766666666666666777777777777777777777777777777777}
        Spacing = 6
      end
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 303
    Width = 763
    Height = 81
    Align = alBottom
    Enabled = False
    TabOrder = 2
    object lblProgress: TLabel
      Left = 16
      Top = 42
      Width = 118
      Height = 13
      Caption = 'Processando Bens...'
      Visible = False
    end
    object lblContadorImovel: TLabel
      Left = 652
      Top = 4
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = '00000 de 00000'
      Visible = False
    end
    object lblProgressoImovel: TLabel
      Left = 16
      Top = 6
      Width = 133
      Height = 13
      Caption = 'Processando Imóveis...'
      Visible = False
    end
    object lblContador: TLabel
      Left = 652
      Top = 40
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = '00000 de 00000'
      Visible = False
    end
    object Progress: TProgressBar
      Left = 16
      Top = 20
      Width = 729
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 0
      Visible = False
    end
    object ProgressBar: TProgressBar
      Left = 16
      Top = 56
      Width = 729
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 1
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65499
    Top = 65499
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryBemXImovel: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IXB.IDBEM, IXB.IDIMOVEL, IXB.IXBGRUPO,'
      '   B.DESBEM, B.PLACA,(0) AS VIDAUTIL, (0) AS VLRREAVAL,'
      ''
      '       ((('
      
        '       (DECODE(BEMACUM.VALBEMACUM,              NULL,0,BEMACUM.V' +
        'ALBEMACUM) +'
      
        '        DECODE(REAVACUM.VALREAVACUM,            NULL,0,REAVACUM.' +
        'VALREAVACUM) +'
      
        '        DECODE(ACRESACUM.VALACRESACUM,          NULL,0,ACRESACUM' +
        '.VALACRESACUM) +'
      
        '        DECODE(CMBEMACUM.VALCMBEMACUM,          NULL,0,CMBEMACUM' +
        '.VALCMBEMACUM) +'
      
        '        DECODE(CMREAVACUM.VALCMREAVACUM,        NULL,0,CMREAVACU' +
        'M.VALCMREAVACUM) +'
      
        '        DECODE(CMACRESACUM.VALCMACRESACUM,      NULL,0,CMACRESAC' +
        'UM.VALCMACRESACUM) ) -'
      ''
      
        '       (DECODE(DEPBEMACUM.VALDEPBEMACUM,        NULL,0,DEPBEMACU' +
        'M.VALDEPBEMACUM) +'
      
        '        DECODE(DEPREAVACUM.VALDEPREAVACUM,      NULL,0,DEPREAVAC' +
        'UM.VALDEPREAVACUM) +'
      
        '        DECODE(DEPACRESACUM.VALDEPACRESACUM,    NULL,0,DEPACRESA' +
        'CUM.VALDEPACRESACUM) +'
      
        '        DECODE(CMDEPBEMACUM.VALCMDEPBEMACUM,    NULL,0,CMDEPBEMA' +
        'CUM.VALCMDEPBEMACUM) +'
      
        '        DECODE(CMDEPREAVACUM.VALCMDEPREAVACUM,  NULL,0,CMDEPREAV' +
        'ACUM.VALCMDEPREAVACUM) +'
      
        '        DECODE(CMDEPACRESACUM.VALCMDEPACRESACUM,NULL,0,CMDEPACRE' +
        'SACUM.VALCMDEPACRESACUM) )'
      '       ) -'
      '       ('
      
        '       (DECODE(BXBEMACUM.BXVALBEMACUM,          NULL,0,BXBEMACUM' +
        '.BXVALBEMACUM) +'
      
        '        DECODE(BXREAVACUM.BXVALREAVACUM,        NULL,0,BXREAVACU' +
        'M.BXVALREAVACUM) +'
      
        '        DECODE(BXACRESACUM.BXVALACRESACUM,      NULL,0,BXACRESAC' +
        'UM.BXVALACRESACUM) +'
      
        '        DECODE(BXCMBEMACUM.BXVALCMBEMACUM,      NULL,0,BXCMBEMAC' +
        'UM.BXVALCMBEMACUM) +'
      
        '        DECODE(BXCMREAVACUM.BXVALCMREAVACUM,    NULL,0,BXCMREAVA' +
        'CUM.BXVALCMREAVACUM) +'
      
        '        DECODE(BXCMACRESACUM.BXVALCMACRESACUM,  NULL,0,BXCMACRES' +
        'ACUM.BXVALCMACRESACUM) ) -'
      ''
      
        '       (DECODE(BXDEPBEMACUM.BXVALDEPBEMACUM,    NULL,0,BXDEPBEMA' +
        'CUM.BXVALDEPBEMACUM) +'
      
        '        DECODE(BXDEPREAVACUM.BXVALDEPREAVACUM,  NULL,0,BXDEPREAV' +
        'ACUM.BXVALDEPREAVACUM) +'
      
        '        DECODE(BXDEPACRESACUM.BXVALDEPACRESACUM,NULL,0,BXDEPACRE' +
        'SACUM.BXVALDEPACRESACUM) +'
      
        '        DECODE(BXCMDEPBEMACUM.BXVALCMDEPBEMACUM,NULL,0,BXCMDEPBE' +
        'MACUM.BXVALCMDEPBEMACUM) +'
      
        '        DECODE(BXCMDEPREAVACUM.BXVALCMDEPREAVACUM,NULL,0,BXCMDEP' +
        'REAVACUM.BXVALCMDEPREAVACUM) +'
      
        '        DECODE(BXCMDEPACRESACUM.BXVALCMDEPACRESACUM,NULL,0,BXCMD' +
        'EPACRESACUM.BXVALCMDEPACRESACUM) )'
      '       )) +'
      '       (('
      
        '       (DECODE(ULTREAVACUM.VALULTREAVACUM    ,NULL,0,ULTREAVACUM' +
        '.VALULTREAVACUM) +'
      
        '        DECODE(ULTCMREAVACUM.VALULTCMREAVACUM,NULL,0,ULTCMREAVAC' +
        'UM.VALULTCMREAVACUM) ) -'
      
        '       (DECODE(ULTDEPREAVACUM.VALULTDEPREAVACUM,NULL,0,ULTDEPREA' +
        'VACUM.VALULTDEPREAVACUM) +'
      
        '        DECODE(ULTCMDEPREAVACUM.VALULTCMDEPREAVACUM,NULL,0,ULTCM' +
        'DEPREAVACUM.VALULTCMDEPREAVACUM) )'
      '       ) -'
      '       ('
      
        '       (DECODE(BXULTREAVACUM.BXVALULTREAVACUM,NULL,0,BXULTREAVAC' +
        'UM.BXVALULTREAVACUM) +'
      
        '        DECODE(BXULTCMREAVACUM.BXVALULTCMREAVACUM,NULL,0,BXULTCM' +
        'REAVACUM.BXVALULTCMREAVACUM) ) -'
      
        '       (DECODE(BXULTDEPREAVACUM.BXVALULTDEPREAVACUM,NULL,0,BXULT' +
        'DEPREAVACUM.BXVALULTDEPREAVACUM) +'
      
        '        DECODE(BXULTCMDEPREAVACUM.BXVALULTCMDEPREAVACUM,NULL,0,B' +
        'XULTCMDEPREAVACUM.BXVALULTCMDEPREAVACUM) )'
      '       ))) AS SUMVALCTB,'
      ''
      '       ((('
      
        '       (DECODE(BEMACUM.VALBEMACUM,              NULL,0,BEMACUM.V' +
        'ALBEMACUM) +'
      
        '        DECODE(REAVACUM.VALREAVACUM,            NULL,0,REAVACUM.' +
        'VALREAVACUM) +'
      
        '        DECODE(ACRESACUM.VALACRESACUM,          NULL,0,ACRESACUM' +
        '.VALACRESACUM) +'
      
        '        DECODE(CMBEMACUM.VALCMBEMACUM,          NULL,0,CMBEMACUM' +
        '.VALCMBEMACUM) +'
      
        '        DECODE(CMREAVACUM.VALCMREAVACUM,        NULL,0,CMREAVACU' +
        'M.VALCMREAVACUM) +'
      
        '        DECODE(CMACRESACUM.VALCMACRESACUM,      NULL,0,CMACRESAC' +
        'UM.VALCMACRESACUM) )'
      '       ) -'
      '       ('
      
        '       (DECODE(BXBEMACUM.BXVALBEMACUM,          NULL,0,BXBEMACUM' +
        '.BXVALBEMACUM) +'
      
        '        DECODE(BXREAVACUM.BXVALREAVACUM,        NULL,0,BXREAVACU' +
        'M.BXVALREAVACUM) +'
      
        '        DECODE(BXACRESACUM.BXVALACRESACUM,      NULL,0,BXACRESAC' +
        'UM.BXVALACRESACUM) +'
      
        '        DECODE(BXCMBEMACUM.BXVALCMBEMACUM,      NULL,0,BXCMBEMAC' +
        'UM.BXVALCMBEMACUM) +'
      
        '        DECODE(BXCMREAVACUM.BXVALCMREAVACUM,    NULL,0,BXCMREAVA' +
        'CUM.BXVALCMREAVACUM) +'
      
        '        DECODE(BXCMACRESACUM.BXVALCMACRESACUM,  NULL,0,BXCMACRES' +
        'ACUM.BXVALCMACRESACUM) )'
      '       )) +'
      '       (('
      
        '       (DECODE(ULTREAVACUM.VALULTREAVACUM    ,NULL,0,ULTREAVACUM' +
        '.VALULTREAVACUM) +'
      
        '        DECODE(ULTCMREAVACUM.VALULTCMREAVACUM,NULL,0,ULTCMREAVAC' +
        'UM.VALULTCMREAVACUM) )'
      '       ) -'
      '       ('
      
        '       (DECODE(BXULTREAVACUM.BXVALULTREAVACUM,NULL,0,BXULTREAVAC' +
        'UM.BXVALULTREAVACUM) +'
      
        '        DECODE(BXULTCMREAVACUM.BXVALULTCMREAVACUM,NULL,0,BXULTCM' +
        'REAVACUM.BXVALULTCMREAVACUM) )'
      '       ))) AS SUMVALCTBIMOB'
      'FROM'
      '   IMOVELXBEM IXB, BEM B,'
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 01)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BEMACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      
        '      AND  ((HM.IDTIPOMOVIMENTACAO = 08) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 32))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (R.IDMOVIMENTACAO  = HM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) REAVACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 09)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ACRESACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 15)'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMBEMATU,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMREAVATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 22)'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMREAVATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMACRESAT' +
        'U'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 34)'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMACRESATU,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 15)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMREAVACU' +
        'M'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 22)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMACRESAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 34)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMACRESACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      
        '      AND  ((HM.IDTIPOMOVIMENTACAO = 14) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 17)'
      
        '                                         OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 21))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPBEMATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPREAVAT' +
        'U'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      
        '      AND ((HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIPOMOVIMENTACA' +
        'O = 33)'
      
        '                                        OR (HM.IDTIPOMOVIMENTACA' +
        'O = 19))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPREAVATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPACRESA' +
        'TU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      
        '      AND  ((HM.IDTIPOMOVIMENTACAO = 35) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 36))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPACRESATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPBEMACU' +
        'M'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      
        '      AND  ((HM.IDTIPOMOVIMENTACAO = 14) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 17))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPREAVAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      
        '      AND ((HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIPOMOVIMENTACA' +
        'O = 33))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPACRESA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  ((HM.IDTIPOMOVIMENTACAO = 35))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPBEMA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 21)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPREAV' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 19)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPACRE' +
        'SACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 36)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTREAVAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      
        '      AND  ((HM.IDTIPOMOVIMENTACAO = 08) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 32))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (R.IDMOVIMENTACAO  = HM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ULTREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTCMREAV' +
        'ATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 22)'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ULTCMREAVATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTCMREAV' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 22)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ULTCMREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTDEPREA' +
        'VATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      
        '      AND ((HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIPOMOVIMENTACA' +
        'O = 33)'
      
        '                                        OR (HM.IDTIPOMOVIMENTACA' +
        'O = 19))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ULTDEPREAVATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTDEPREA' +
        'VACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      
        '      AND ((HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIPOMOVIMENTACA' +
        'O = 33)'
      
        '                                        OR (HM.IDTIPOMOVIMENTACA' +
        'O = 19))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ULTDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTCMDEPR' +
        'EAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 19)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ULTCMDEPREAVACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 6)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALREAVACU' +
        'M'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 20)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALACRESAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 37)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMBEMAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 25)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMREAVA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 28)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMACRES' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 38)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPBEMA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 24)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPREAV' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 27)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPACRE' +
        'SACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 39)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPBE' +
        'MACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 26)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPRE' +
        'AVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 29)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPAC' +
        'RESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 40)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALULTREAV' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 20)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXULTREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALULTCMRE' +
        'AVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 28)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXULTCMREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALULTDEPR' +
        'EAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 27)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXULTDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALULTCMDE' +
        'PREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 29)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXULTCMDEPREAVACUM'
      'WHERE'
      '   (( IXB.IDIMOVEL =:IMOVEL )'
      '   AND( IXB.IDPESSOA =:EMPRESAPROP ))'
      '   AND(( IXB.IDBEM = B.IDBEM )'
      '   AND( IXB.IDPESSOA = B.IDPESSOA ))'
      
        '  AND((B.DATAINICIODEP <= :PDATAMOV) OR (B.DATAINICIODEP IS NULL' +
        '))'
      '  AND (B.IDBEM = BEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = REAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = ACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = CMBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = DEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMREAVATU.IDBEM(+))'
      '  AND (B.IDBEM = CMREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPREAVATU.IDBEM(+))'
      '  AND (B.IDBEM = DEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = ULTREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = ULTCMREAVATU.IDBEM(+))'
      '  AND (B.IDBEM = ULTCMREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = ULTDEPREAVATU.IDBEM(+))'
      '  AND (B.IDBEM = ULTDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = ULTCMDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = CMACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = DEPACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXULTREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXULTCMREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXULTDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXULTCMDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPACRESACUM.IDBEM(+))'
      ''
      'ORDER BY'
      '   IXB.IXBGRUPO, B.DESBEM')
    ValidateWithMask = True
    Left = 640
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
    object qryBemXImovelPLACA: TFloatField
      DisplayLabel = 'Nº Tombamento'
      DisplayWidth = 11
      FieldName = 'PLACA'
    end
    object qryBemXImovelDESBEM: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 31
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryBemXImovelSUMVALCTB: TFloatField
      DisplayLabel = 'Valor Contábil'
      DisplayWidth = 11
      FieldName = 'SUMVALCTB'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qryBemXImovelVLRREAVAL: TFloatField
      DisplayLabel = 'Valor do Laudo'
      DisplayWidth = 11
      FieldName = 'VLRREAVAL'
      DisplayFormat = '###,###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryBemXImovelVIDAUTIL: TFloatField
      DisplayLabel = 'Vida Útil'
      DisplayWidth = 7
      FieldName = 'VIDAUTIL'
      DisplayFormat = '0'
      EditFormat = '0'
    end
    object qryBemXImovelGrupoExtenso: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 22
      FieldKind = fkCalculated
      FieldName = 'GrupoExtenso'
      Visible = False
      Size = 25
      Calculated = True
    end
    object qryBemXImovelVlrAnterior: TFloatField
      DisplayLabel = 'Valor Contábil'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'VlrAnterior'
      Visible = False
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00'
      Calculated = True
    end
    object qryBemXImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryBemXImovelIDBEM: TFloatField
      FieldName = 'IDBEM'
      Visible = False
    end
    object qryBemXImovelIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      Visible = False
      Size = 1
    end
    object qryBemXImovelSUMVALCTBIMOB: TFloatField
      FieldName = 'SUMVALCTBIMOB'
      Visible = False
    end
  end
  object qryImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   I.IDIMOVEL, I.IMONOME, I.IMOMATRICULA, I.IMOCODIGO,'
      
        '   DECODE(CC_IMOVEL.SUMVALCTB, NULL, 0, CC_IMOVEL.SUMVALCTB) AS ' +
        'CUSTO_CONTABIL,'
      '   0 AS VLR_LAUDO'
      ''
      'FROM'
      '   IMOVEL I,'
      ''
      '   ('
      '   SELECT'
      '      I.IDIMOVEL,'
      ''
      '      SUM(((('
      '      ('
      '      DECODE(BEMACUM.VALBEMACUM, NULL, 0, BEMACUM.VALBEMACUM) +'
      
        '      DECODE(REAVACUM.VALREAVACUM, NULL, 0, REAVACUM.VALREAVACUM' +
        ') +'
      
        '      DECODE(ACRESACUM.VALACRESACUM, NULL, 0, ACRESACUM.VALACRES' +
        'ACUM) +'
      
        '      DECODE(CMBEMACUM.VALCMBEMACUM, NULL, 0, CMBEMACUM.VALCMBEM' +
        'ACUM) +'
      
        '      DECODE(CMREAVACUM.VALCMREAVACUM, NULL, 0, CMREAVACUM.VALCM' +
        'REAVACUM) +'
      
        '      DECODE(CMACRESACUM.VALCMACRESACUM, NULL, 0, CMACRESACUM.VA' +
        'LCMACRESACUM)'
      '      ) -'
      ''
      '      ('
      
        '      DECODE(DEPBEMACUM.VALDEPBEMACUM, NULL, 0, DEPBEMACUM.VALDE' +
        'PBEMACUM) +'
      
        '      DECODE(DEPREAVACUM.VALDEPREAVACUM, NULL, 0, DEPREAVACUM.VA' +
        'LDEPREAVACUM) +'
      
        '      DECODE(DEPACRESACUM.VALDEPACRESACUM, NULL, 0, DEPACRESACUM' +
        '.VALDEPACRESACUM) +'
      
        '      DECODE(CMDEPBEMACUM.VALCMDEPBEMACUM, NULL, 0, CMDEPBEMACUM' +
        '.VALCMDEPBEMACUM) +'
      
        '      DECODE(CMDEPREAVACUM.VALCMDEPREAVACUM, NULL, 0, CMDEPREAVA' +
        'CUM.VALCMDEPREAVACUM) +'
      
        '      DECODE(CMDEPACRESACUM.VALCMDEPACRESACUM, NULL, 0, CMDEPACR' +
        'ESACUM.VALCMDEPACRESACUM)'
      '      )) -'
      ''
      '      (('
      
        '      DECODE(BXBEMACUM.BXVALBEMACUM, NULL, 0, BXBEMACUM.BXVALBEM' +
        'ACUM) +'
      
        '      DECODE(BXREAVACUM.BXVALREAVACUM, NULL, 0, BXREAVACUM.BXVAL' +
        'REAVACUM) +'
      
        '      DECODE(BXACRESACUM.BXVALACRESACUM, NULL, 0, BXACRESACUM.BX' +
        'VALACRESACUM) +'
      
        '      DECODE(BXCMBEMACUM.BXVALCMBEMACUM, NULL, 0, BXCMBEMACUM.BX' +
        'VALCMBEMACUM) +'
      
        '      DECODE(BXCMREAVACUM.BXVALCMREAVACUM, NULL, 0, BXCMREAVACUM' +
        '.BXVALCMREAVACUM) +'
      
        '      DECODE(BXCMACRESACUM.BXVALCMACRESACUM, NULL, 0, BXCMACRESA' +
        'CUM.BXVALCMACRESACUM)'
      '      ) -'
      ''
      '      ('
      
        '      DECODE(BXDEPBEMACUM.BXVALDEPBEMACUM, NULL, 0, BXDEPBEMACUM' +
        '.BXVALDEPBEMACUM) +'
      
        '      DECODE(BXDEPREAVACUM.BXVALDEPREAVACUM, NULL, 0, BXDEPREAVA' +
        'CUM.BXVALDEPREAVACUM) +'
      
        '      DECODE(BXDEPACRESACUM.BXVALDEPACRESACUM, NULL, 0, BXDEPACR' +
        'ESACUM.BXVALDEPACRESACUM) +'
      
        '      DECODE(BXCMDEPBEMACUM.BXVALCMDEPBEMACUM, NULL, 0, BXCMDEPB' +
        'EMACUM.BXVALCMDEPBEMACUM) +'
      
        '      DECODE(BXCMDEPREAVACUM.BXVALCMDEPREAVACUM, NULL, 0, BXCMDE' +
        'PREAVACUM.BXVALCMDEPREAVACUM) +'
      
        '      DECODE(BXCMDEPACRESACUM.BXVALCMDEPACRESACUM, NULL, 0, BXCM' +
        'DEPACRESACUM.BXVALCMDEPACRESACUM)'
      '      ))) +'
      ''
      '      (('
      '      ('
      
        '      DECODE(ULTREAVACUM.VALULTREAVACUM, NULL, 0, ULTREAVACUM.VA' +
        'LULTREAVACUM) +'
      
        '      DECODE(ULTCMREAVACUM.VALULTCMREAVACUM, NULL, 0, ULTCMREAVA' +
        'CUM.VALULTCMREAVACUM)'
      '      ) -'
      '      ('
      
        '      DECODE(ULTDEPREAVACUM.VALULTDEPREAVACUM, NULL, 0, ULTDEPRE' +
        'AVACUM.VALULTDEPREAVACUM) +'
      
        '      DECODE(ULTCMDEPREAVACUM.VALULTCMDEPREAVACUM, NULL, 0, ULTC' +
        'MDEPREAVACUM.VALULTCMDEPREAVACUM)'
      '      )) -'
      '      ('
      '      ('
      
        '      DECODE(BXULTREAVACUM.BXVALULTREAVACUM, NULL, 0, BXULTREAVA' +
        'CUM.BXVALULTREAVACUM) +'
      
        '      DECODE(BXULTCMREAVACUM.BXVALULTCMREAVACUM, NULL, 0, BXULTC' +
        'MREAVACUM.BXVALULTCMREAVACUM)'
      '      ) -'
      '      ('
      
        '      DECODE(BXULTDEPREAVACUM.BXVALULTDEPREAVACUM, NULL, 0, BXUL' +
        'TDEPREAVACUM.BXVALULTDEPREAVACUM) +'
      
        '      DECODE(BXULTCMDEPREAVACUM.BXVALULTCMDEPREAVACUM, NULL, 0, ' +
        'BXULTCMDEPREAVACUM.BXVALULTCMDEPREAVACUM)'
      '      )'
      '      )))) AS SUMVALCTB,'
      ''
      '      SUM(((('
      '      ('
      '      DECODE(BEMACUM.VALBEMACUM, NULL, 0, BEMACUM.VALBEMACUM) +'
      
        '      DECODE(REAVACUM.VALREAVACUM, NULL, 0, REAVACUM.VALREAVACUM' +
        ') +'
      
        '      DECODE(ACRESACUM.VALACRESACUM, NULL, 0, ACRESACUM.VALACRES' +
        'ACUM) +'
      
        '      DECODE(CMBEMACUM.VALCMBEMACUM, NULL, 0, CMBEMACUM.VALCMBEM' +
        'ACUM) +'
      
        '      DECODE(CMREAVACUM.VALCMREAVACUM, NULL, 0, CMREAVACUM.VALCM' +
        'REAVACUM) +'
      
        '      DECODE(CMACRESACUM.VALCMACRESACUM, NULL, 0, CMACRESACUM.VA' +
        'LCMACRESACUM)'
      '      )) -'
      '      (('
      
        '      DECODE(BXBEMACUM.BXVALBEMACUM, NULL, 0, BXBEMACUM.BXVALBEM' +
        'ACUM) +'
      
        '      DECODE(BXREAVACUM.BXVALREAVACUM, NULL, 0, BXREAVACUM.BXVAL' +
        'REAVACUM) +'
      
        '      DECODE(BXACRESACUM.BXVALACRESACUM, NULL, 0, BXACRESACUM.BX' +
        'VALACRESACUM) +'
      
        '      DECODE(BXCMBEMACUM.BXVALCMBEMACUM, NULL, 0, BXCMBEMACUM.BX' +
        'VALCMBEMACUM) +'
      
        '      DECODE(BXCMREAVACUM.BXVALCMREAVACUM, NULL, 0, BXCMREAVACUM' +
        '.BXVALCMREAVACUM) +'
      
        '      DECODE(BXCMACRESACUM.BXVALCMACRESACUM, NULL, 0, BXCMACRESA' +
        'CUM.BXVALCMACRESACUM)'
      '      ))) +'
      '      ((('
      
        '      DECODE(ULTREAVACUM.VALULTREAVACUM, NULL, 0, ULTREAVACUM.VA' +
        'LULTREAVACUM) +'
      
        '      DECODE(ULTCMREAVACUM.VALULTCMREAVACUM, NULL, 0, ULTCMREAVA' +
        'CUM.VALULTCMREAVACUM)'
      '      )) -'
      '      (('
      
        '      DECODE(BXULTREAVACUM.BXVALULTREAVACUM, NULL, 0, BXULTREAVA' +
        'CUM.BXVALULTREAVACUM) +'
      
        '      DECODE(BXULTCMREAVACUM.BXVALULTCMREAVACUM, NULL, 0, BXULTC' +
        'MREAVACUM.BXVALULTCMREAVACUM)'
      '      ))))) AS SUMVALCTBIMOB'
      ''
      '   FROM'
      '      IMOVEL I, IMOVELXBEM IXB, BEM B,'
      ''
      '      ('
      '      SELECT'
      '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALBEMACUM'
      '      FROM'
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM'
      '      WHERE'
      '         ( HM.IDPESSOA =:PIDPESSOA )'
      '         AND ( HM.IDTIPOMOVIMENTACAO = 01)'
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO )'
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) )'
      '      GROUP BY'
      '         HM.IDPESSOA, HM.IDBEM'
      '      ) BEMACUM,'
      ''
      '      ('
      '      SELECT'
      '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALREAVACUM'
      '      FROM'
      
        '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM, REAVALI' +
        'ACAO R'
      '      WHERE'
      '         ( HM.IDPESSOA =:PIDPESSOA )'
      
        '         AND  ( ( HM.IDTIPOMOVIMENTACAO = 08 ) OR ( HM.IDTIPOMOV' +
        'IMENTACAO = 32 ) )'
      '         AND  ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO)'
      '         AND  ( R.FLGULTREAVAL = 0)'
      '         AND  ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) )'
      '         AND  ( R.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+) )'
      '      GROUP BY'
      '         HM.IDPESSOA, HM.IDBEM'
      '      ) REAVACUM,'
      ''
      '      ('
      '      SELECT'
      '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALACRESACUM'
      '      FROM'
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM'
      '      WHERE'
      '         ( HM.IDPESSOA =:PIDPESSOA )'
      '         AND ( HM.IDTIPOMOVIMENTACAO = 09 )'
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO )'
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) )'
      '      GROUP BY'
      '         HM.IDPESSOA, HM.IDBEM'
      '      ) ACRESACUM,'
      ''
      '      ('
      '      SELECT'
      '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMBEMATU'
      '      FROM'
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM'
      '      WHERE'
      '         ( HM.IDPESSOA =:PIDPESSOA )'
      '         AND ( HM.IDTIPOMOVIMENTACAO = 15 )'
      '         AND ( HM.DATAMOVIMENTACAO =:PDATAMOVIMENTACAO )'
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) )'
      '      GROUP BY'
      '         HM.IDPESSOA, HM.IDBEM'
      '      ) CMBEMATU,'
      ''
      '      ('
      '      SELECT'
      '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMREAVATU'
      '      FROM'
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM,'
      '         REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '      WHERE'
      '         ( HM.IDPESSOA =:PIDPESSOA )'
      '         AND ( HM.IDTIPOMOVIMENTACAO = 22 )'
      '         AND ( HM.DATAMOVIMENTACAO =:PDATAMOVIMENTACAO )'
      '         AND ( R.FLGULTREAVAL = 0 ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '         AND ( DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+) ) '
      '         AND ( DR.IDREAVALIACAO  = R.IDREAVALIACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM'
      '      ) CMREAVATU, '
      ''
      '      ( '
      '      SELECT '
      '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMACRESATU '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 34 ) '
      '         AND ( HM.DATAMOVIMENTACAO =:PDATAMOVIMENTACAO ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) CMACRESATU, '
      ''
      '      ( '
      '      SELECT '
      '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMBEMACUM '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM'
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 15 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) CMBEMACUM, '
      ''
      '      ( '
      '      SELECT '
      '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMREAVACUM '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM, '
      '         REAVALIACAO R, DEPRECIACAOREAVAL DR '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 22 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( R.FLGULTREAVAL = 0 ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) )'
      '         AND ( DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+) ) '
      '         AND ( DR.IDREAVALIACAO  = R.IDREAVALIACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) CMREAVACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMACRESACUM' +
        ' '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 34 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) CMACRESACUM, '
      ''
      '      ('
      '      SELECT '
      '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPBEMATU '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      
        '         AND (( HM.IDTIPOMOVIMENTACAO = 14 ) OR ( HM.IDTIPOMOVIM' +
        'ENTACAO = 17 ) OR ( HM.IDTIPOMOVIMENTACAO = 21 )) '
      '         AND ( HM.DATAMOVIMENTACAO =:PDATAMOVIMENTACAO ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) DEPBEMATU, '
      ''
      '      ( '
      '      SELECT '
      '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPREAVATU '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM, '
      '         REAVALIACAO R, DEPRECIACAOREAVAL DR '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA )'
      
        '         AND (( HM.IDTIPOMOVIMENTACAO = 18 ) OR ( HM.IDTIPOMOVIM' +
        'ENTACAO = 33 ) OR ( HM.IDTIPOMOVIMENTACAO = 19 )) '
      '         AND ( HM.DATAMOVIMENTACAO =:PDATAMOVIMENTACAO ) '
      '         AND ( R.FLGULTREAVAL = 0 ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '         AND ( DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+) ) '
      '         AND ( DR.IDREAVALIACAO  = R.IDREAVALIACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) DEPREAVATU, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPACRESATU' +
        ' '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      
        '         AND (( HM.IDTIPOMOVIMENTACAO = 35 ) OR ( HM.IDTIPOMOVIM' +
        'ENTACAO = 36 )) '
      '         AND ( HM.DATAMOVIMENTACAO =:PDATAMOVIMENTACAO ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '      GROUP BY'
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) DEPACRESATU, '
      ''
      '      ( '
      '      SELECT '
      '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPBEMACUM '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      
        '         AND ((HM.IDTIPOMOVIMENTACAO = 14) OR (HM.IDTIPOMOVIMENT' +
        'ACAO = 17)) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) DEPBEMACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPREAVACUM' +
        ' '
      '      FROM'
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM, '
      '         REAVALIACAO R, DEPRECIACAOREAVAL DR '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      
        '         AND ( ( HM.IDTIPOMOVIMENTACAO = 18 ) OR ( HM.IDTIPOMOVI' +
        'MENTACAO = 33 ) ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( R.FLGULTREAVAL = 0 ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '         AND ( DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+) ) '
      '         AND ( DR.IDREAVALIACAO  = R.IDREAVALIACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) DEPREAVACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPACRESACU' +
        'M '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA )'
      '         AND ( ( HM.IDTIPOMOVIMENTACAO = 35 ) ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) DEPACRESACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPBEMACU' +
        'M '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 21 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) CMDEPBEMACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPREAVAC' +
        'UM '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM, '
      '         REAVALIACAO R, DEPRECIACAOREAVAL DR '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 19 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( R.FLGULTREAVAL = 0) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '         AND ( DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+) ) '
      '         AND ( DR.IDREAVALIACAO  = R.IDREAVALIACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) CMDEPREAVACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPACRESA' +
        'CUM'
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 36 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) CMDEPACRESACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTREAVACUM' +
        ' '
      '      FROM '
      
        '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM, REAVALI' +
        'ACAO R '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      
        '         AND ( (HM.IDTIPOMOVIMENTACAO = 08) OR (HM.IDTIPOMOVIMEN' +
        'TACAO = 32) ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( R.FLGULTREAVAL = 1 )'
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '         AND ( R.IDMOVIMENTACAO  = HM.IDMOVIMENTACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) ULTREAVACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTCMREAVAT' +
        'U '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM, '
      '         REAVALIACAO R, DEPRECIACAOREAVAL DR '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 22 ) '
      '         AND ( HM.DATAMOVIMENTACAO =:PDATAMOVIMENTACAO ) '
      '         AND ( R.FLGULTREAVAL = 1 ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '         AND ( DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+) ) '
      '         AND ( DR.IDREAVALIACAO  = R.IDREAVALIACAO(+) ) '
      '      GROUP BY'
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) ULTCMREAVATU, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTCMREAVAC' +
        'UM '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM, '
      '         REAVALIACAO R, DEPRECIACAOREAVAL DR '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 22 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( R.FLGULTREAVAL = 1 ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '         AND ( DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+) ) '
      '         AND ( DR.IDREAVALIACAO  = R.IDREAVALIACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) ULTCMREAVACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTDEPREAVA' +
        'TU '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM, '
      '         REAVALIACAO R, DEPRECIACAOREAVAL DR '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      
        '         AND ( (HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIPOMOVIMEN' +
        'TACAO = 33) OR (HM.IDTIPOMOVIMENTACAO = 19) ) '
      '         AND ( HM.DATAMOVIMENTACAO =:PDATAMOVIMENTACAO ) '
      '         AND ( R.FLGULTREAVAL = 1 ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '         AND ( DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+) ) '
      '         AND ( DR.IDREAVALIACAO  = R.IDREAVALIACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) ULTDEPREAVATU, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTDEPREAVA' +
        'CUM'
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM, '
      '         REAVALIACAO R, DEPRECIACAOREAVAL DR '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      
        '         AND ( (HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIPOMOVIMEN' +
        'TACAO = 33) OR (HM.IDTIPOMOVIMENTACAO = 19) ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( R.FLGULTREAVAL = 1 ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '         AND ( DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+) ) '
      '         AND ( DR.IDREAVALIACAO  = R.IDREAVALIACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) ULTDEPREAVACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTCMDEPREA' +
        'VACUM '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM, '
      '         REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 19 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( R.FLGULTREAVAL = 1 ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '         AND ( DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+) ) '
      '         AND ( DR.IDREAVALIACAO  = R.IDREAVALIACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) ULTCMDEPREAVACUM, '
      ''
      '      ( '
      '      SELECT '
      '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALBEMACUM '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 6 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO )'
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) BXBEMACUM, '
      ''
      '      ( '
      '      SELECT '
      '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALREAVACUM '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM, '
      '         REAVALIACAO R, BAIXABEM BR '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 20) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( R.FLGULTREAVAL = 0 ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '         AND ( BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+) ) '
      '         AND ( BR.IDREAVAL = R.IDREAVALIACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM'
      '      ) BXREAVACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALACRESACUM' +
        ' '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 37 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) BXACRESACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMBEMACUM' +
        ' '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM'
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 25 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) BXCMBEMACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMREAVACU' +
        'M '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM, '
      '         REAVALIACAO R, BAIXABEM BR '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 28 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( R.FLGULTREAVAL = 0) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) )'
      '         AND ( BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+) ) '
      '         AND ( BR.IDREAVAL       = R.IDREAVALIACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) BXCMREAVACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMACRESAC' +
        'UM '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 38 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) BXCMACRESACUM, '
      ''
      '      ('
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPBEMACU' +
        'M '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 24 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) BXDEPBEMACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPREAVAC' +
        'UM '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM, '
      '         REAVALIACAO R, BAIXABEM BR '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA )'
      '         AND ( HM.IDTIPOMOVIMENTACAO = 27 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( R.FLGULTREAVAL = 0 ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '         AND ( BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+) ) '
      '         AND ( BR.IDREAVAL       = R.IDREAVALIACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) BXDEPREAVACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPACRESA' +
        'CUM '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 39 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '      GROUP BY'
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) BXDEPACRESACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPBEMA' +
        'CUM '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 26 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) BXCMDEPBEMACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPREAV' +
        'ACUM '
      '      FROM'
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM, '
      '         REAVALIACAO R, BAIXABEM BR '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 29 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( R.FLGULTREAVAL = 0 ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '         AND ( BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+) ) '
      '         AND ( BR.IDREAVAL = R.IDREAVALIACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) BXCMDEPREAVACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPACRE' +
        'SACUM '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA )'
      '         AND ( HM.IDTIPOMOVIMENTACAO = 40 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) BXCMDEPACRESACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALULTREAVAC' +
        'UM '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM, '
      '         REAVALIACAO R, BAIXABEM BR '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 20 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( R.FLGULTREAVAL = 1 ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '         AND ( BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+) ) '
      '         AND ( BR.IDREAVAL = R.IDREAVALIACAO(+) )'
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) BXULTREAVACUM, '
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALULTCMREAV' +
        'ACUM '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM, '
      '         REAVALIACAO R, BAIXABEM BR '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 28 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( R.FLGULTREAVAL = 1 ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '         AND ( BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+) ) '
      '         AND ( BR.IDREAVAL       = R.IDREAVALIACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) BXULTCMREAVACUM,'
      ''
      '      ( '
      '      SELECT '
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALULTDEPREA' +
        'VACUM '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM, '
      '         REAVALIACAO R, BAIXABEM BR '
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 27 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( R.FLGULTREAVAL = 1 ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '         AND ( BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+) ) '
      '         AND ( BR.IDREAVAL       = R.IDREAVALIACAO(+) ) '
      '      GROUP BY'
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) BXULTDEPREAVACUM, '
      ''
      '      ( '
      '      SELECT'
      
        '         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALULTCMDEPR' +
        'EAVACUM '
      '      FROM '
      '         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO VM, '
      '         REAVALIACAO R, BAIXABEM BR'
      '      WHERE '
      '         ( HM.IDPESSOA =:PIDPESSOA ) '
      '         AND ( HM.IDTIPOMOVIMENTACAO = 29 ) '
      '         AND ( HM.DATAMOVIMENTACAO <=:PDATAMOVIMENTACAO ) '
      '         AND ( R.FLGULTREAVAL = 1 ) '
      '         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+) ) '
      '         AND ( BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+) ) '
      '         AND ( BR.IDREAVAL       = R.IDREAVALIACAO(+) ) '
      '      GROUP BY '
      '         HM.IDPESSOA, HM.IDBEM '
      '      ) BXULTCMDEPREAVACUM '
      ''
      '   WHERE '
      '      ( I.FLGTIPOIMOVEL = 1 )'
      '      AND ( I.IDIMOVELMESTRE =:PIDIMOVELMESTRE )'
      
        '      AND ( (B.DATAINICIODEP <=:PDATAMOVIMENTACAO) OR (B.DATAINI' +
        'CIODEP IS NULL) )'
      '      AND ( IXB.IDPESSOA =:PIDPESSOA )'
      '      AND ( IXB.IDIMOVEL = I.IDIMOVEL )'
      '      AND ( B.IDBEM = IXB.IDBEM )'
      '      AND ( B.IDPESSOA = IXB.IDPESSOA )'
      '      AND ( B.IDBEM = BEMACUM.IDBEM(+) )'
      '      AND ( B.IDBEM = REAVACUM.IDBEM(+) )'
      '      AND ( B.IDBEM = ACRESACUM.IDBEM(+) ) '
      '      AND ( B.IDBEM = CMBEMATU.IDBEM(+) ) '
      '      AND ( B.IDBEM = CMBEMACUM.IDBEM(+) ) '
      '      AND ( B.IDBEM = DEPBEMATU.IDBEM(+) ) '
      '      AND ( B.IDBEM = DEPBEMACUM.IDBEM(+) ) '
      '      AND ( B.IDBEM = CMREAVATU.IDBEM(+) ) '
      '      AND ( B.IDBEM = CMREAVACUM.IDBEM(+) ) '
      '      AND ( B.IDBEM = DEPREAVATU.IDBEM(+) ) '
      '      AND ( B.IDBEM = DEPREAVACUM.IDBEM(+) ) '
      '      AND ( B.IDBEM = CMDEPBEMACUM.IDBEM(+) ) '
      '      AND ( B.IDBEM = CMDEPREAVACUM.IDBEM(+) )'
      '      AND ( B.IDBEM = ULTREAVACUM.IDBEM(+) ) '
      '      AND ( B.IDBEM = ULTCMREAVATU.IDBEM(+) ) '
      '      AND ( B.IDBEM = ULTCMREAVACUM.IDBEM(+) ) '
      '      AND ( B.IDBEM = ULTDEPREAVATU.IDBEM(+) ) '
      '      AND ( B.IDBEM = ULTDEPREAVACUM.IDBEM(+) ) '
      '      AND ( B.IDBEM = ULTCMDEPREAVACUM.IDBEM(+) )'
      '      AND ( B.IDBEM = CMACRESATU.IDBEM(+) ) '
      '      AND ( B.IDBEM = CMACRESACUM.IDBEM(+) ) '
      '      AND ( B.IDBEM = DEPACRESATU.IDBEM(+) )'
      '      AND ( B.IDBEM = DEPACRESACUM.IDBEM(+) )'
      '      AND ( B.IDBEM = CMDEPACRESACUM.IDBEM(+) ) '
      '      AND ( B.IDBEM = BXBEMACUM.IDBEM(+) ) '
      '      AND ( B.IDBEM = BXREAVACUM.IDBEM(+) ) '
      '      AND ( B.IDBEM = BXACRESACUM.IDBEM(+) ) '
      '      AND ( B.IDBEM = BXCMBEMACUM.IDBEM(+) ) '
      '      AND ( B.IDBEM = BXDEPBEMACUM.IDBEM(+) ) '
      '      AND ( B.IDBEM = BXCMREAVACUM.IDBEM(+) ) '
      '      AND ( B.IDBEM = BXDEPREAVACUM.IDBEM(+) ) '
      '      AND ( B.IDBEM = BXCMDEPBEMACUM.IDBEM(+) ) '
      '      AND ( B.IDBEM = BXCMDEPREAVACUM.IDBEM(+) ) '
      '      AND ( B.IDBEM = BXULTREAVACUM.IDBEM(+) )'
      '      AND ( B.IDBEM = BXULTCMREAVACUM.IDBEM(+) )'
      '      AND ( B.IDBEM = BXULTDEPREAVACUM.IDBEM(+) )'
      '      AND ( B.IDBEM = BXULTCMDEPREAVACUM.IDBEM(+) )'
      '      AND ( B.IDBEM = BXCMACRESACUM.IDBEM(+) )'
      '      AND ( B.IDBEM = BXDEPACRESACUM.IDBEM(+) )'
      '      AND ( B.IDBEM = BXCMDEPACRESACUM.IDBEM(+) )'
      ''
      '   GROUP BY'
      '      I.IDIMOVEL'
      '   ) CC_IMOVEL'
      ''
      'WHERE'
      '   ( I.IDPESSOA =:PIDPESSOA )'
      '   AND ( I.IDIMOVELMESTRE =:PIDIMOVELMESTRE )'
      '   AND ( I.IDIMOVEL = CC_IMOVEL.IDIMOVEL )'
      ''
      'ORDER BY'
      '   I.IMONOME')
    UpdateObject = updImovel
    ValidateWithMask = True
    Left = 269
    Top = 110
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end>
    object qryImovelIMONOME: TStringField
      DisplayLabel = 'Imóvel'
      DisplayWidth = 43
      FieldName = 'IMONOME'
      Size = 60
    end
    object qryImovelIMOCODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 13
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object qryImovelCUSTO_CONTABIL: TFloatField
      DisplayLabel = 'Custo Contábil'
      DisplayWidth = 16
      FieldName = 'CUSTO_CONTABIL'
      DisplayFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      EditFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
    end
    object qryImovelVLR_LAUDO: TFloatField
      DisplayLabel = 'Valor do Laudo'
      DisplayWidth = 16
      FieldName = 'VLR_LAUDO'
      DisplayFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      EditFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
    end
    object qryImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryImovelIMOMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 12
      FieldName = 'IMOMATRICULA'
      Visible = False
    end
  end
  object wwQuery2: TwwQuery
    ValidateWithMask = True
    Left = 693
    Top = 173
  end
  object qryMestre: TwwQuery
    SQL.Strings = (
      '         '#39'SELECT '#39' + #13 +'
      
        '         '#39'   IM.IDIMOVEL, IM.IMONOME AS NOME_MESTRE, IM.IMOMATRI' +
        'CULA, IM.IMOCODIGO, '#39' + #13 +'
      ''
      
        '         '#39'   IM.IMOLOGRADOURO, IM.IMONUMERO, IM.IMOCOMPLEMENTO, ' +
        #39' + #13 +'
      
        '         '#39'   IM.IMOBAIRRO, IM.IMOCIDADE, IM.CODESTADO, IM.IMOCEP' +
        ', '#39' + #13 +'
      ''
      '         '#39'   ( '#39' + #13 +'
      
        '         '#39'   DECODE(REC_DES.RECEBIDO, NULL, 0, REC_DES.RECEBIDO)' +
        ' - DECODE(REC_DES.PAGO, NULL, 0, REC_DES.PAGO) '#39' + #13 +'
      '         '#39'   ) AS VLR_LIQUIDO, '#39' + #13 +'
      ''
      
        '         '#39'   DECODE(CC_IMOVEL.SUMVALCTB, NULL, 0, CC_IMOVEL.SUMV' +
        'ALCTB) AS CUSTO_CONTABIL, '#39' + #13 +'
      ''
      '         '#39'   0 AS VLR_CORRIGIDO, '#39' + #13 +'
      '         '#39'   0 AS VLR_ALUGUEL, '#39' + #13 +'
      '         '#39'   0 AS MINIMO_ATUARIAL, '#39' + #13 +'
      '         '#39'   0 AS RECEITAXCC, '#39' + #13 +'
      '         '#39'   0 AS RECEITAXVLR, '#39' + #13 +'
      '         '#39'   0 AS REC_CONTRATUAL, '#39' + #13 +'
      '         '#39'   0 AS ALUGUELXCC, '#39' + #13 +'
      '         '#39'   0 AS ALUGUELXVLR '#39' + #13 +'
      ''
      '         '#39'FROM '#39' + #13 +'
      '         '#39'   IMOVEL IM, '#39' + #13 +'
      ''
      '         '#39'   ( '#39' + #13 +'
      '         '#39'   SELECT '#39' + #13 +'
      '         '#39'      I.IDIMOVELMESTRE, '#39' + #13 +'
      ''
      '         '#39'      SUM( '#39' + #13 +'
      
        '         '#39'      DECODE(RTRIM(LD.OPERACAO), '#39#39'1'#39#39', DECODE(D.RECPA' +
        'G, '#39#39'R'#39#39', DECODE(LD.DEBCRE, '#39#39'D'#39#39', LD.VALOR, LD.VALOR * -1), 0),' +
        ' 0) + '#39' + #13 +'
      
        '         '#39'      DECODE(RTRIM(LD.OPERACAO), '#39#39'2'#39#39', DECODE(D.RECPA' +
        'G, '#39#39'R'#39#39', DECODE(LD.DEBCRE, '#39#39'D'#39#39', LD.VALOR, LD.VALOR * -1), 0),' +
        ' 0) + '#39' + #13 +'
      
        '         '#39'      DECODE(RTRIM(LD.OPERACAO), '#39#39'4'#39#39', DECODE(D.RECPA' +
        'G, '#39#39'R'#39#39', DECODE(LD.DEBCRE, '#39#39'D'#39#39', LD.VALOR, LD.VALOR * -1), 0),' +
        ' 0) '#39' + #13 +'
      '         '#39'      ) AS TOT_RECEBER, '#39' + #13 +'
      ''
      
        '         '#39'      SUM(DECODE(RTRIM(LD.OPERACAO), '#39#39'5'#39#39', DECODE(D.R' +
        'ECPAG, '#39#39'R'#39#39', DECODE(LD.DEBCRE, '#39#39'C'#39#39', LD.VALOR, LD.VALOR * (-1)' +
        '), 0), 0)) AS RECEBIDO, '#39' + #13 +'
      ''
      '         '#39'      SUM( '#39' + #13 +'
      
        '         '#39'      DECODE(RTRIM(LD.OPERACAO), '#39#39'1'#39#39', DECODE(D.RECPA' +
        'G, '#39#39'P'#39#39', DECODE(LD.DEBCRE, '#39#39'C'#39#39', LD.VALOR, LD.VALOR * -1), 0),' +
        ' 0) + '#39' + #13 +'
      
        '         '#39'      DECODE(RTRIM(LD.OPERACAO), '#39#39'2'#39#39', DECODE(D.RECPA' +
        'G, '#39#39'P'#39#39', DECODE(LD.DEBCRE, '#39#39'C'#39#39', LD.VALOR, LD.VALOR * -1), 0),' +
        ' 0) + '#39' + #13 +'
      
        '         '#39'      DECODE(RTRIM(LD.OPERACAO), '#39#39'4'#39#39', DECODE(D.RECPA' +
        'G, '#39#39'P'#39#39', DECODE(LD.DEBCRE, '#39#39'C'#39#39', LD.VALOR, LD.VALOR * -1), 0),' +
        ' 0) '#39' + #13 +'
      '         '#39'      ) AS TOT_PAGAR, '#39' + #13 +'
      ''
      
        '         '#39'      SUM(DECODE(RTRIM(LD.OPERACAO), '#39#39'5'#39#39', DECODE(D.R' +
        'ECPAG, '#39#39'P'#39#39', DECODE(LD.DEBCRE, '#39#39'D'#39#39', LD.VALOR, LD.VALOR * (-1)' +
        '), 0), 0)) AS PAGO '#39' + #13 +'
      ''
      '         '#39'   FROM '#39' + #13 +'
      '         '#39'      DOCUMENTO D, LANCTODOCUM LD, '#39' + #13 +'
      '         '#39'      LANCAMENTOSIMOVEL LI, RECBTOPAGTO RP, '#39' + #13 +'
      '         '#39'      IMOVEL I '#39' + #13 +'
      '         '#39'   WHERE '#39' + #13 +'
      '         '#39'      ( LI.CODDOCUMENTO = D.CODDOCUMENTO ) '#39' + #13 +'
      
        '         '#39'      AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO ) '#39' + #13' +
        ' +'
      
        '         '#39'      AND ( LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) ) '#39' +' +
        ' #13 +'
      '         '#39'      AND ( LD.NUMLANCTO = RP.NUMLANCTO(+) ) '#39' + #13 +'
      '         '#39'      AND ( LI.IDIMOVEL = I.IDIMOVEL ) '#39' + #13 +'
      
        '         '#39'      AND ( RP.DATABAIXA BETWEEN ( TO_DATE('#39#39#39' + Forma' +
        'tDateTime('#39'dd/mm/yyyy'#39', dDataIniPeriodo) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39') ' +
        ') AND ( TO_DATE('#39#39#39' + FormatDateTime('#39'dd/mm/yyyy'#39', dDataFimPerio' +
        'do) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39') ) ) '#39' + #13 +'
      ''
      '         '#39'   GROUP BY '#39' + #13 +'
      '         '#39'      I.IDIMOVELMESTRE '#39' + #13 +'
      '         '#39'   ) REC_DES, '#39' + #13 +'
      ''
      '         '#39'   ( '#39' + #13 +'
      '         '#39'   SELECT '#39' + #13 +'
      '         '#39'      I.IDIMOVELMESTRE, '#39' + #13 +'
      '{'
      '         '#39'      1000000 AS SUMVALCTB '#39' + #13 +'
      '}'
      '         '#39'      SUM(((( '#39' + #13 +'
      '         '#39'      ( '#39' + #13 +'
      
        '         '#39'      DECODE(BEMACUM.VALBEMACUM, NULL, 0, BEMACUM.VALB' +
        'EMACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(REAVACUM.VALREAVACUM, NULL, 0, REAVACUM.V' +
        'ALREAVACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(ACRESACUM.VALACRESACUM, NULL, 0, ACRESACU' +
        'M.VALACRESACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(CMBEMACUM.VALCMBEMACUM, NULL, 0, CMBEMACU' +
        'M.VALCMBEMACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(CMREAVACUM.VALCMREAVACUM, NULL, 0, CMREAV' +
        'ACUM.VALCMREAVACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(CMACRESACUM.VALCMACRESACUM, NULL, 0, CMAC' +
        'RESACUM.VALCMACRESACUM) '#39' + #13 +'
      '         '#39'      ) - '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      
        '         '#39'      DECODE(DEPBEMACUM.VALDEPBEMACUM, NULL, 0, DEPBEM' +
        'ACUM.VALDEPBEMACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(DEPREAVACUM.VALDEPREAVACUM, NULL, 0, DEPR' +
        'EAVACUM.VALDEPREAVACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(DEPACRESACUM.VALDEPACRESACUM, NULL, 0, DE' +
        'PACRESACUM.VALDEPACRESACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(CMDEPBEMACUM.VALCMDEPBEMACUM, NULL, 0, CM' +
        'DEPBEMACUM.VALCMDEPBEMACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(CMDEPREAVACUM.VALCMDEPREAVACUM, NULL, 0, ' +
        'CMDEPREAVACUM.VALCMDEPREAVACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(CMDEPACRESACUM.VALCMDEPACRESACUM, NULL, 0' +
        ', CMDEPACRESACUM.VALCMDEPACRESACUM) '#39' + #13 +'
      '         '#39'      )) - '#39' + #13 +'
      ''
      '         '#39'      (( '#39' + #13 +'
      
        '         '#39'      DECODE(BXBEMACUM.BXVALBEMACUM, NULL, 0, BXBEMACU' +
        'M.BXVALBEMACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(BXREAVACUM.BXVALREAVACUM, NULL, 0, BXREAV' +
        'ACUM.BXVALREAVACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(BXACRESACUM.BXVALACRESACUM, NULL, 0, BXAC' +
        'RESACUM.BXVALACRESACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(BXCMBEMACUM.BXVALCMBEMACUM, NULL, 0, BXCM' +
        'BEMACUM.BXVALCMBEMACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(BXCMREAVACUM.BXVALCMREAVACUM, NULL, 0, BX' +
        'CMREAVACUM.BXVALCMREAVACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(BXCMACRESACUM.BXVALCMACRESACUM, NULL, 0, ' +
        'BXCMACRESACUM.BXVALCMACRESACUM) '#39' + #13 +'
      '         '#39'      ) - '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      
        '         '#39'      DECODE(BXDEPBEMACUM.BXVALDEPBEMACUM, NULL, 0, BX' +
        'DEPBEMACUM.BXVALDEPBEMACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(BXDEPREAVACUM.BXVALDEPREAVACUM, NULL, 0, ' +
        'BXDEPREAVACUM.BXVALDEPREAVACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(BXDEPACRESACUM.BXVALDEPACRESACUM, NULL, 0' +
        ', BXDEPACRESACUM.BXVALDEPACRESACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(BXCMDEPBEMACUM.BXVALCMDEPBEMACUM, NULL, 0' +
        ', BXCMDEPBEMACUM.BXVALCMDEPBEMACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(BXCMDEPREAVACUM.BXVALCMDEPREAVACUM, NULL,' +
        ' 0, BXCMDEPREAVACUM.BXVALCMDEPREAVACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(BXCMDEPACRESACUM.BXVALCMDEPACRESACUM, NUL' +
        'L, 0, BXCMDEPACRESACUM.BXVALCMDEPACRESACUM) '#39' + #13 +'
      '         '#39'      ))) + '#39' + #13 +'
      ''
      '         '#39'      (( '#39' + #13 +'
      '         '#39'      ( '#39' + #13 +'
      
        '         '#39'      DECODE(ULTREAVACUM.VALULTREAVACUM, NULL, 0, ULTR' +
        'EAVACUM.VALULTREAVACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(ULTCMREAVACUM.VALULTCMREAVACUM, NULL, 0, ' +
        'ULTCMREAVACUM.VALULTCMREAVACUM) '#39' + #13 +'
      '         '#39'      ) - '#39' + #13 +'
      '         '#39'      ( '#39' + #13 +'
      
        '         '#39'      DECODE(ULTDEPREAVACUM.VALULTDEPREAVACUM, NULL, 0' +
        ', ULTDEPREAVACUM.VALULTDEPREAVACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(ULTCMDEPREAVACUM.VALULTCMDEPREAVACUM, NUL' +
        'L, 0, ULTCMDEPREAVACUM.VALULTCMDEPREAVACUM) '#39' + #13 +'
      '         '#39'      )) - '#39' + #13 +'
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      ( '#39' + #13 +'
      
        '         '#39'      DECODE(BXULTREAVACUM.BXVALULTREAVACUM, NULL, 0, ' +
        'BXULTREAVACUM.BXVALULTREAVACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(BXULTCMREAVACUM.BXVALULTCMREAVACUM, NULL,' +
        ' 0, BXULTCMREAVACUM.BXVALULTCMREAVACUM) '#39' + #13 +'
      '         '#39'      ) - '#39' + #13 +'
      '         '#39'      ( '#39' + #13 +'
      
        '         '#39'      DECODE(BXULTDEPREAVACUM.BXVALULTDEPREAVACUM, NUL' +
        'L, 0, BXULTDEPREAVACUM.BXVALULTDEPREAVACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(BXULTCMDEPREAVACUM.BXVALULTCMDEPREAVACUM,' +
        ' NULL, 0, BXULTCMDEPREAVACUM.BXVALULTCMDEPREAVACUM) '#39' + #13 +'
      '         '#39'      ) '#39' + #13 +'
      '         '#39'      )))) AS SUMVALCTB, '#39' + #13 +'
      ''
      '         '#39'      SUM(((( '#39' + #13 +'
      '         '#39'      ( '#39' + #13 +'
      
        '         '#39'      DECODE(BEMACUM.VALBEMACUM, NULL, 0, BEMACUM.VALB' +
        'EMACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(REAVACUM.VALREAVACUM, NULL, 0, REAVACUM.V' +
        'ALREAVACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(ACRESACUM.VALACRESACUM, NULL, 0, ACRESACU' +
        'M.VALACRESACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(CMBEMACUM.VALCMBEMACUM, NULL, 0, CMBEMACU' +
        'M.VALCMBEMACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(CMREAVACUM.VALCMREAVACUM, NULL, 0, CMREAV' +
        'ACUM.VALCMREAVACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(CMACRESACUM.VALCMACRESACUM, NULL, 0, CMAC' +
        'RESACUM.VALCMACRESACUM) '#39' + #13 +'
      '         '#39'      )) - '#39' + #13 +'
      '         '#39'      (( '#39' + #13 +'
      
        '         '#39'      DECODE(BXBEMACUM.BXVALBEMACUM, NULL, 0, BXBEMACU' +
        'M.BXVALBEMACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(BXREAVACUM.BXVALREAVACUM, NULL, 0, BXREAV' +
        'ACUM.BXVALREAVACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(BXACRESACUM.BXVALACRESACUM, NULL, 0, BXAC' +
        'RESACUM.BXVALACRESACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(BXCMBEMACUM.BXVALCMBEMACUM, NULL, 0, BXCM' +
        'BEMACUM.BXVALCMBEMACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(BXCMREAVACUM.BXVALCMREAVACUM, NULL, 0, BX' +
        'CMREAVACUM.BXVALCMREAVACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(BXCMACRESACUM.BXVALCMACRESACUM, NULL, 0, ' +
        'BXCMACRESACUM.BXVALCMACRESACUM) '#39' + #13 +'
      '         '#39'      ))) + '#39' + #13 +'
      '         '#39'      ((( '#39' + #13 +'
      
        '         '#39'      DECODE(ULTREAVACUM.VALULTREAVACUM, NULL, 0, ULTR' +
        'EAVACUM.VALULTREAVACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(ULTCMREAVACUM.VALULTCMREAVACUM, NULL, 0, ' +
        'ULTCMREAVACUM.VALULTCMREAVACUM) '#39' + #13 +'
      '         '#39'      )) - '#39' + #13 +'
      '         '#39'      (( '#39' + #13 +'
      
        '         '#39'      DECODE(BXULTREAVACUM.BXVALULTREAVACUM, NULL, 0, ' +
        'BXULTREAVACUM.BXVALULTREAVACUM) + '#39' + #13 +'
      
        '         '#39'      DECODE(BXULTCMREAVACUM.BXVALULTCMREAVACUM, NULL,' +
        ' 0, BXULTCMREAVACUM.BXVALULTCMREAVACUM) '#39' + #13 +'
      '         '#39'      ))))) AS SUMVALCTBIMOB '#39' + #13 +'
      ''
      '         '#39'   FROM '#39' + #13 +'
      '         '#39'      IMOVEL I, IMOVELXBEM IXB, BEM B, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALB' +
        'EMACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 01) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) BEMACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALR' +
        'EAVACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M, REAVALIACAO R '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      
        '         '#39'         AND  ( ( HM.IDTIPOMOVIMENTACAO = 08 ) OR ( HM' +
        '.IDTIPOMOVIMENTACAO = 32 ) ) '#39' + #13 +'
      
        '         '#39'         AND  ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + F' +
        'ormatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39 +
        ')) '#39' + #13 +'
      '         '#39'         AND  ( R.FLGULTREAVAL = 0) '#39' + #13 +'
      
        '         '#39'         AND  ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(' +
        '+) ) '#39' + #13 +'
      
        '         '#39'         AND  ( R.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) REAVACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALA' +
        'CRESACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 09 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) ACRESACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALC' +
        'MBEMATU '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 15 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO = TO_DATE('#39#39#39' + For' +
        'matDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39') ' +
        ') '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) CMBEMATU, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALC' +
        'MREAVATU '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M, '#39' + #13 +'
      '         '#39'         REAVALIACAO R, DEPRECIACAOREAVAL DR '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 22 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO = TO_DATE('#39#39#39' + For' +
        'matDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39') ' +
        ') '#39' + #13 +'
      '         '#39'         AND ( R.FLGULTREAVAL = 0 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( DR.IDREAVALIACAO  = R.IDREAVALIACAO(+) ' +
        ') '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) CMREAVATU, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALC' +
        'MACRESATU '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 34 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO = TO_DATE('#39#39#39' + For' +
        'matDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39') ' +
        ') '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) CMACRESATU, '#39' + #13 +'
      '         '
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALC' +
        'MBEMACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 15 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) CMBEMACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALC' +
        'MREAVACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M, '#39' + #13 +'
      '         '#39'         REAVALIACAO R, DEPRECIACAOREAVAL DR '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 22 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      '         '#39'         AND ( R.FLGULTREAVAL = 0 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( DR.IDREAVALIACAO  = R.IDREAVALIACAO(+) ' +
        ') '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) CMREAVACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALC' +
        'MACRESACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 34 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) CMACRESACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALD' +
        'EPBEMATU '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      
        '         '#39'         AND (( HM.IDTIPOMOVIMENTACAO = 14 ) OR ( HM.I' +
        'DTIPOMOVIMENTACAO = 17 ) OR ( HM.IDTIPOMOVIMENTACAO = 21 )) '#39' + ' +
        '#13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO = TO_DATE('#39#39#39' + For' +
        'matDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39') ' +
        ') '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) DEPBEMATU, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALD' +
        'EPREAVATU '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM' +
        ', '#39' + #13 +'
      '         '#39'         REAVALIACAO R, DEPRECIACAOREAVAL DR '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      
        '         '#39'         AND (( HM.IDTIPOMOVIMENTACAO = 18 ) OR ( HM.I' +
        'DTIPOMOVIMENTACAO = 33 ) OR ( HM.IDTIPOMOVIMENTACAO = 19 )) '#39' + ' +
        '#13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO = TO_DATE('#39#39#39' + For' +
        'matDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39') ' +
        ') '#39' + #13 +'
      '         '#39'         AND ( R.FLGULTREAVAL = 0 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( DR.IDREAVALIACAO  = R.IDREAVALIACAO(+) ' +
        ') '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) DEPREAVATU, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALD' +
        'EPACRESATU '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      
        '         '#39'         AND (( HM.IDTIPOMOVIMENTACAO = 35 ) OR ( HM.I' +
        'DTIPOMOVIMENTACAO = 36 )) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO = TO_DATE('#39#39#39' + For' +
        'matDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39') ' +
        ') '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) DEPACRESATU, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALD' +
        'EPBEMACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      
        '         '#39'         AND ((HM.IDTIPOMOVIMENTACAO = 14) OR (HM.IDTI' +
        'POMOVIMENTACAO = 17)) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) DEPBEMACUM, '#39' + #13 +'
      '         '
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALD' +
        'EPREAVACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M, '#39' + #13 +'
      '         '#39'         REAVALIACAO R, DEPRECIACAOREAVAL DR '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      
        '         '#39'         AND ( ( HM.IDTIPOMOVIMENTACAO = 18 ) OR ( HM.' +
        'IDTIPOMOVIMENTACAO = 33 ) ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      '         '#39'         AND ( R.FLGULTREAVAL = 0 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( DR.IDREAVALIACAO  = R.IDREAVALIACAO(+) ' +
        ') '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) DEPREAVACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALD' +
        'EPACRESACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      
        '         '#39'         AND ( ( HM.IDTIPOMOVIMENTACAO = 35 ) ) '#39' + #1' +
        '3 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) DEPACRESACUM, '#39' + #13 +'
      '         '
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALC' +
        'MDEPBEMACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 21 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) CMDEPBEMACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALC' +
        'MDEPREAVACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M, '#39' + #13 +'
      '         '#39'         REAVALIACAO R, DEPRECIACAOREAVAL DR '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 19 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      '         '#39'         AND ( R.FLGULTREAVAL = 0) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( DR.IDREAVALIACAO  = R.IDREAVALIACAO(+) ' +
        ') '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) CMDEPREAVACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALC' +
        'MDEPACRESACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 36 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) CMDEPACRESACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALU' +
        'LTREAVACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M, REAVALIACAO R '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      
        '         '#39'         AND ( (HM.IDTIPOMOVIMENTACAO = 08) OR (HM.IDT' +
        'IPOMOVIMENTACAO = 32) ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      '         '#39'         AND ( R.FLGULTREAVAL = 1 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( R.IDMOVIMENTACAO  = HM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) ULTREAVACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALU' +
        'LTCMREAVATU '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M, '#39' + #13 +'
      '         '#39'         REAVALIACAO R, DEPRECIACAOREAVAL DR '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 22 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO = TO_DATE('#39#39#39' + For' +
        'matDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39') ' +
        ') '#39' + #13 +'
      '         '#39'         AND ( R.FLGULTREAVAL = 1 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( DR.IDREAVALIACAO  = R.IDREAVALIACAO(+) ' +
        ') '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) ULTCMREAVATU, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALU' +
        'LTCMREAVACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M, '#39' + #13 +'
      '         '#39'         REAVALIACAO R, DEPRECIACAOREAVAL DR '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 22 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      '         '#39'         AND ( R.FLGULTREAVAL = 1 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( DR.IDREAVALIACAO  = R.IDREAVALIACAO(+) ' +
        ') '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) ULTCMREAVACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALU' +
        'LTDEPREAVATU '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M, '#39' + #13 +'
      '         '#39'         REAVALIACAO R, DEPRECIACAOREAVAL DR '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      
        '         '#39'         AND ( (HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDT' +
        'IPOMOVIMENTACAO = 33) OR (HM.IDTIPOMOVIMENTACAO = 19) ) '#39' + #13 ' +
        '+'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO = TO_DATE('#39#39#39' + For' +
        'matDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39') ' +
        ') '#39' + #13 +'
      '         '#39'         AND ( R.FLGULTREAVAL = 1 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( DR.IDREAVALIACAO  = R.IDREAVALIACAO(+) ' +
        ') '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) ULTDEPREAVATU, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALU' +
        'LTDEPREAVACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M, '#39' + #13 +'
      '         '#39'         REAVALIACAO R, DEPRECIACAOREAVAL DR '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      
        '         '#39'         AND ( (HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDT' +
        'IPOMOVIMENTACAO = 33) OR (HM.IDTIPOMOVIMENTACAO = 19) ) '#39' + #13 ' +
        '+'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      '         '#39'         AND ( R.FLGULTREAVAL = 1 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( DR.IDREAVALIACAO  = R.IDREAVALIACAO(+) ' +
        ') '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) ULTDEPREAVACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALU' +
        'LTCMDEPREAVACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M, '#39' + #13 +'
      '         '#39'         REAVALIACAO R, DEPRECIACAOREAVAL DR '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 19 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      '         '#39'         AND ( R.FLGULTREAVAL = 1 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( DR.IDREAVALIACAO  = R.IDREAVALIACAO(+) ' +
        ') '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) ULTCMDEPREAVACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVA' +
        'LBEMACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 6 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) BXBEMACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVA' +
        'LREAVACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M, '#39' + #13 +'
      '         '#39'         REAVALIACAO R, BAIXABEM BR '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 20) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      '         '#39'         AND ( R.FLGULTREAVAL = 0 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( BR.IDREAVAL = R.IDREAVALIACAO(+) ) '#39' + ' +
        '#13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) BXREAVACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVA' +
        'LACRESACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 37 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) BXACRESACUM, '#39' + #13 +'
      '         '
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVA' +
        'LCMBEMACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 25 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) BXCMBEMACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVA' +
        'LCMREAVACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M, '#39' + #13 +'
      '         '#39'         REAVALIACAO R, BAIXABEM BR '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 28 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      '         '#39'         AND ( R.FLGULTREAVAL = 0) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( BR.IDREAVAL       = R.IDREAVALIACAO(+) ' +
        ') '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) BXCMREAVACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVA' +
        'LCMACRESACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM' +
        ' '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 38 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) BXCMACRESACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVA' +
        'LDEPBEMACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 24 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) BXDEPBEMACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVA' +
        'LDEPREAVACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M, '#39' + #13 +'
      '         '#39'         REAVALIACAO R, BAIXABEM BR '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 27 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      '         '#39'         AND ( R.FLGULTREAVAL = 0 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( BR.IDREAVAL       = R.IDREAVALIACAO(+) ' +
        ') '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) BXDEPREAVACUM, '#39' + #13 +'
      '         '
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVA' +
        'LDEPACRESACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 39 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) BXDEPACRESACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVA' +
        'LCMDEPBEMACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 26 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) BXCMDEPBEMACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVA' +
        'LCMDEPREAVACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M, '#39' + #13 +'
      '         '#39'         REAVALIACAO R, BAIXABEM BR '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 29 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      '         '#39'         AND ( R.FLGULTREAVAL = 0 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( BR.IDREAVAL = R.IDREAVALIACAO(+) ) '#39' + ' +
        '#13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) BXCMDEPREAVACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVA' +
        'LCMDEPACRESACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 40 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) BXCMDEPACRESACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVA' +
        'LULTREAVACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M, '#39' + #13 +'
      '         '#39'         REAVALIACAO R, BAIXABEM BR '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 20 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      '         '#39'         AND ( R.FLGULTREAVAL = 1 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( BR.IDREAVAL = R.IDREAVALIACAO(+) ) '#39' + ' +
        '#13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) BXULTREAVACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVA' +
        'LULTCMREAVACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M, '#39' + #13 +'
      '         '#39'         REAVALIACAO R, BAIXABEM BR '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 28 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      '         '#39'         AND ( R.FLGULTREAVAL = 1 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( BR.IDREAVAL       = R.IDREAVALIACAO(+) ' +
        ') '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) BXULTCMREAVACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVA' +
        'LULTDEPREAVACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M, '#39' + #13 +'
      '         '#39'         REAVALIACAO R, BAIXABEM BR '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 27 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      '         '#39'         AND ( R.FLGULTREAVAL = 1 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( BR.IDREAVAL       = R.IDREAVALIACAO(+) ' +
        ') '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) BXULTDEPREAVACUM, '#39' + #13 +'
      ''
      '         '#39'      ( '#39' + #13 +'
      '         '#39'      SELECT '#39' + #13 +'
      
        '         '#39'         HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVA' +
        'LULTCMDEPREAVACUM '#39' + #13 +'
      '         '#39'      FROM '#39' + #13 +'
      
        '         '#39'         HISTORICOMOVIMENTACAO HM, VALORMOVIMENTACAO V' +
        'M, '#39' + #13 +'
      '         '#39'         REAVALIACAO R, BAIXABEM BR '#39' + #13 +'
      '         '#39'      WHERE '#39' + #13 +'
      
        '         '#39'         ( HM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpres' +
        'a) + '#39' ) '#39' + #13 +'
      '         '#39'         AND ( HM.IDTIPOMOVIMENTACAO = 29 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.DATAMOVIMENTACAO <= TO_DATE('#39#39#39' + Fo' +
        'rmatDateTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')' +
        ' ) '#39' + #13 +'
      '         '#39'         AND ( R.FLGULTREAVAL = 1 ) '#39' + #13 +'
      
        '         '#39'         AND ( HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+' +
        ') ) '#39' + #13 +'
      
        '         '#39'         AND ( BR.IDREAVAL       = R.IDREAVALIACAO(+) ' +
        ') '#39' + #13 +'
      '         '#39'      GROUP BY '#39' + #13 +'
      '         '#39'         HM.IDPESSOA, HM.IDBEM '#39' + #13 +'
      '         '#39'      ) BXULTCMDEPREAVACUM '#39' + #13 +'
      ''
      '         '#39'   WHERE '#39' + #13 +'
      '         '#39'      ( I.FLGTIPOIMOVEL = 1 ) '#39' + #13 +'
      
        '         '#39'      AND ( (B.DATAINICIODEP <= TO_DATE('#39#39#39' + FormatDa' +
        'teTime('#39'dd/mm/yyyy'#39', dDataContabil) + '#39#39#39', '#39#39'DD/MM/YYYY'#39#39')) OR (' +
        'B.DATAINICIODEP IS NULL) ) '#39' + #13 +'
      '         '#39'      AND ( IXB.IDIMOVEL = I.IDIMOVEL ) '#39' + #13 +'
      
        '         '#39'      AND ( IXB.IDPESSOA = '#39' + IntToStr(Sistema.idEmpr' +
        'esa) + '#39' ) '#39' + #13 +'
      '         '#39'      AND ( B.IDBEM = IXB.IDBEM ) '#39' + #13 +'
      '         '#39'      AND ( B.IDPESSOA = IXB.IDPESSOA ) '#39' + #13 +'
      '         '#39'      AND ( B.IDBEM = BEMACUM.IDBEM(+) ) '#39' + #13 +'
      '         '#39'      AND ( B.IDBEM = REAVACUM.IDBEM(+) ) '#39' + #13 +'
      '         '#39'      AND ( B.IDBEM = ACRESACUM.IDBEM(+) ) '#39' + #13 +'
      '         '#39'      AND ( B.IDBEM = CMBEMATU.IDBEM(+) ) '#39' + #13 +'
      '         '#39'      AND ( B.IDBEM = CMBEMACUM.IDBEM(+) ) '#39' + #13 +'
      '         '#39'      AND ( B.IDBEM = DEPBEMATU.IDBEM(+) ) '#39' + #13 +'
      '         '#39'      AND ( B.IDBEM = DEPBEMACUM.IDBEM(+) ) '#39' + #13 +'
      '         '#39'      AND ( B.IDBEM = CMREAVATU.IDBEM(+) ) '#39' + #13 +'
      '         '#39'      AND ( B.IDBEM = CMREAVACUM.IDBEM(+) ) '#39' + #13 +'
      '         '#39'      AND ( B.IDBEM = DEPREAVATU.IDBEM(+) ) '#39' + #13 +'
      '         '#39'      AND ( B.IDBEM = DEPREAVACUM.IDBEM(+) ) '#39' + #13 +'
      
        '         '#39'      AND ( B.IDBEM = CMDEPBEMACUM.IDBEM(+) ) '#39' + #13 ' +
        '+'
      
        '         '#39'      AND ( B.IDBEM = CMDEPREAVACUM.IDBEM(+) ) '#39' + #13' +
        ' +'
      '         '#39'      AND ( B.IDBEM = ULTREAVACUM.IDBEM(+) ) '#39' + #13 +'
      
        '         '#39'      AND ( B.IDBEM = ULTCMREAVATU.IDBEM(+) ) '#39' + #13 ' +
        '+'
      
        '         '#39'      AND ( B.IDBEM = ULTCMREAVACUM.IDBEM(+) ) '#39' + #13' +
        ' +'
      
        '         '#39'      AND ( B.IDBEM = ULTDEPREAVATU.IDBEM(+) ) '#39' + #13' +
        ' +'
      
        '         '#39'      AND ( B.IDBEM = ULTDEPREAVACUM.IDBEM(+) ) '#39' + #1' +
        '3 +'
      
        '         '#39'      AND ( B.IDBEM = ULTCMDEPREAVACUM.IDBEM(+) ) '#39' + ' +
        '#13 +'
      '         '#39'      AND ( B.IDBEM = CMACRESATU.IDBEM(+) ) '#39' + #13 +'
      '         '#39'      AND ( B.IDBEM = CMACRESACUM.IDBEM(+) ) '#39' + #13 +'
      '         '#39'      AND ( B.IDBEM = DEPACRESATU.IDBEM(+) ) '#39' + #13 +'
      
        '         '#39'      AND ( B.IDBEM = DEPACRESACUM.IDBEM(+) ) '#39' + #13 ' +
        '+'
      
        '         '#39'      AND ( B.IDBEM = CMDEPACRESACUM.IDBEM(+) ) '#39' + #1' +
        '3 +'
      '         '#39'      AND ( B.IDBEM = BXBEMACUM.IDBEM(+) ) '#39' + #13 +'
      '         '#39'      AND ( B.IDBEM = BXREAVACUM.IDBEM(+) ) '#39' + #13 +'
      '         '#39'      AND ( B.IDBEM = BXACRESACUM.IDBEM(+) ) '#39' + #13 +'
      '         '#39'      AND ( B.IDBEM = BXCMBEMACUM.IDBEM(+) ) '#39' + #13 +'
      
        '         '#39'      AND ( B.IDBEM = BXDEPBEMACUM.IDBEM(+) ) '#39' + #13 ' +
        '+'
      
        '         '#39'      AND ( B.IDBEM = BXCMREAVACUM.IDBEM(+) ) '#39' + #13 ' +
        '+'
      
        '         '#39'      AND ( B.IDBEM = BXDEPREAVACUM.IDBEM(+) ) '#39' + #13' +
        ' +'
      
        '         '#39'      AND ( B.IDBEM = BXCMDEPBEMACUM.IDBEM(+) ) '#39' + #1' +
        '3 +'
      
        '         '#39'      AND ( B.IDBEM = BXCMDEPREAVACUM.IDBEM(+) ) '#39' + #' +
        '13 +'
      
        '         '#39'      AND ( B.IDBEM = BXULTREAVACUM.IDBEM(+) ) '#39' + #13' +
        ' +'
      
        '         '#39'      AND ( B.IDBEM = BXULTCMREAVACUM.IDBEM(+) ) '#39' + #' +
        '13 +'
      
        '         '#39'      AND ( B.IDBEM = BXULTDEPREAVACUM.IDBEM(+) ) '#39' + ' +
        '#13 +'
      
        '         '#39'      AND ( B.IDBEM = BXULTCMDEPREAVACUM.IDBEM(+) ) '#39' ' +
        '+ #13 +'
      
        '         '#39'      AND ( B.IDBEM = BXCMACRESACUM.IDBEM(+) ) '#39' + #13' +
        ' +'
      
        '         '#39'      AND ( B.IDBEM = BXDEPACRESACUM.IDBEM(+) ) '#39' + #1' +
        '3 +'
      
        '         '#39'      AND ( B.IDBEM = BXCMDEPACRESACUM.IDBEM(+) ) '#39' + ' +
        '#13 +'
      '         '#39'   GROUP BY '#39' + #13 +'
      '         '#39'      I.IDIMOVELMESTRE '#39' + #13 +'
      '{'
      '         '#39'   FROM '#39' + #13 +'
      '         '#39'      IMOVEL I '#39' + #13 +'
      '         '#39'   GROUP BY '#39' + #13 +'
      '         '#39'      I.IDIMOVELMESTRE '#39' + #13 +'
      '}'
      '         '#39'   ) CC_IMOVEL '#39' + #13 +'
      ''
      '         '#39'WHERE '#39' + #13 +'
      '         '#39'   ( IM.FLGTIPOIMOVEL = 0 ) '#39' + #13 +'
      
        '         '#39'   AND ( IM.IDPESSOA = '#39' + IntToStr(Sistema.idEmpresa)' +
        ' + '#39' ) '#39' + #13 +'
      
        '         '#39'   AND ( IM.IDIMOVEL = REC_DES.IDIMOVELMESTRE(+) ) '#39' +' +
        ' #13 +'
      
        '         '#39'   AND ( IM.IDIMOVEL = CC_IMOVEL.IDIMOVELMESTRE ) '#39' + ' +
        '#13 +'
      ''
      '         '#39'ORDER BY '#39' + #13 +'
      '         '#39'   IM.IMONOME '#39' + #13;')
    ValidateWithMask = True
    Left = 709
    Top = 229
  end
  object qryBemXMestre: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    OnCalcFields = qryBemXMestreCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IXB.IDBEM, IXB.IDIMOVEL, IXB.IXBGRUPO,'
      '   B.DESBEM, B.PLACA, (0) AS VIDAUTIL, (0) AS VLRREAVAL,'
      ''
      '       ((('
      
        '       (DECODE(BEMACUM.VALBEMACUM,              NULL,0,BEMACUM.V' +
        'ALBEMACUM) +'
      
        '        DECODE(REAVACUM.VALREAVACUM,            NULL,0,REAVACUM.' +
        'VALREAVACUM) +'
      
        '        DECODE(ACRESACUM.VALACRESACUM,          NULL,0,ACRESACUM' +
        '.VALACRESACUM) +'
      
        '        DECODE(CMBEMACUM.VALCMBEMACUM,          NULL,0,CMBEMACUM' +
        '.VALCMBEMACUM) +'
      
        '        DECODE(CMREAVACUM.VALCMREAVACUM,        NULL,0,CMREAVACU' +
        'M.VALCMREAVACUM) +'
      
        '        DECODE(CMACRESACUM.VALCMACRESACUM,      NULL,0,CMACRESAC' +
        'UM.VALCMACRESACUM) ) -'
      ''
      
        '       (DECODE(DEPBEMACUM.VALDEPBEMACUM,        NULL,0,DEPBEMACU' +
        'M.VALDEPBEMACUM) +'
      
        '        DECODE(DEPREAVACUM.VALDEPREAVACUM,      NULL,0,DEPREAVAC' +
        'UM.VALDEPREAVACUM) +'
      
        '        DECODE(DEPACRESACUM.VALDEPACRESACUM,    NULL,0,DEPACRESA' +
        'CUM.VALDEPACRESACUM) +'
      
        '        DECODE(CMDEPBEMACUM.VALCMDEPBEMACUM,    NULL,0,CMDEPBEMA' +
        'CUM.VALCMDEPBEMACUM) +'
      
        '        DECODE(CMDEPREAVACUM.VALCMDEPREAVACUM,  NULL,0,CMDEPREAV' +
        'ACUM.VALCMDEPREAVACUM) +'
      
        '        DECODE(CMDEPACRESACUM.VALCMDEPACRESACUM,NULL,0,CMDEPACRE' +
        'SACUM.VALCMDEPACRESACUM) )'
      '       ) -'
      '       ('
      
        '       (DECODE(BXBEMACUM.BXVALBEMACUM,          NULL,0,BXBEMACUM' +
        '.BXVALBEMACUM) +'
      
        '        DECODE(BXREAVACUM.BXVALREAVACUM,        NULL,0,BXREAVACU' +
        'M.BXVALREAVACUM) +'
      
        '        DECODE(BXACRESACUM.BXVALACRESACUM,      NULL,0,BXACRESAC' +
        'UM.BXVALACRESACUM) +'
      
        '        DECODE(BXCMBEMACUM.BXVALCMBEMACUM,      NULL,0,BXCMBEMAC' +
        'UM.BXVALCMBEMACUM) +'
      
        '        DECODE(BXCMREAVACUM.BXVALCMREAVACUM,    NULL,0,BXCMREAVA' +
        'CUM.BXVALCMREAVACUM) +'
      
        '        DECODE(BXCMACRESACUM.BXVALCMACRESACUM,  NULL,0,BXCMACRES' +
        'ACUM.BXVALCMACRESACUM) ) -'
      ''
      
        '       (DECODE(BXDEPBEMACUM.BXVALDEPBEMACUM,    NULL,0,BXDEPBEMA' +
        'CUM.BXVALDEPBEMACUM) +'
      
        '        DECODE(BXDEPREAVACUM.BXVALDEPREAVACUM,  NULL,0,BXDEPREAV' +
        'ACUM.BXVALDEPREAVACUM) +'
      
        '        DECODE(BXDEPACRESACUM.BXVALDEPACRESACUM,NULL,0,BXDEPACRE' +
        'SACUM.BXVALDEPACRESACUM) +'
      
        '        DECODE(BXCMDEPBEMACUM.BXVALCMDEPBEMACUM,NULL,0,BXCMDEPBE' +
        'MACUM.BXVALCMDEPBEMACUM) +'
      
        '        DECODE(BXCMDEPREAVACUM.BXVALCMDEPREAVACUM,NULL,0,BXCMDEP' +
        'REAVACUM.BXVALCMDEPREAVACUM) +'
      
        '        DECODE(BXCMDEPACRESACUM.BXVALCMDEPACRESACUM,NULL,0,BXCMD' +
        'EPACRESACUM.BXVALCMDEPACRESACUM) )'
      '       )) +'
      '       (('
      
        '       (DECODE(ULTREAVACUM.VALULTREAVACUM    ,NULL,0,ULTREAVACUM' +
        '.VALULTREAVACUM) +'
      
        '        DECODE(ULTCMREAVACUM.VALULTCMREAVACUM,NULL,0,ULTCMREAVAC' +
        'UM.VALULTCMREAVACUM) ) -'
      
        '       (DECODE(ULTDEPREAVACUM.VALULTDEPREAVACUM,NULL,0,ULTDEPREA' +
        'VACUM.VALULTDEPREAVACUM) +'
      
        '        DECODE(ULTCMDEPREAVACUM.VALULTCMDEPREAVACUM,NULL,0,ULTCM' +
        'DEPREAVACUM.VALULTCMDEPREAVACUM) )'
      '       ) -'
      '       ('
      
        '       (DECODE(BXULTREAVACUM.BXVALULTREAVACUM,NULL,0,BXULTREAVAC' +
        'UM.BXVALULTREAVACUM) +'
      
        '        DECODE(BXULTCMREAVACUM.BXVALULTCMREAVACUM,NULL,0,BXULTCM' +
        'REAVACUM.BXVALULTCMREAVACUM) ) -'
      
        '       (DECODE(BXULTDEPREAVACUM.BXVALULTDEPREAVACUM,NULL,0,BXULT' +
        'DEPREAVACUM.BXVALULTDEPREAVACUM) +'
      
        '        DECODE(BXULTCMDEPREAVACUM.BXVALULTCMDEPREAVACUM,NULL,0,B' +
        'XULTCMDEPREAVACUM.BXVALULTCMDEPREAVACUM) )'
      '       ))) AS SUMVALCTB,'
      ''
      '       ((('
      
        '       (DECODE(BEMACUM.VALBEMACUM,              NULL,0,BEMACUM.V' +
        'ALBEMACUM) +'
      
        '        DECODE(REAVACUM.VALREAVACUM,            NULL,0,REAVACUM.' +
        'VALREAVACUM) +'
      
        '        DECODE(ACRESACUM.VALACRESACUM,          NULL,0,ACRESACUM' +
        '.VALACRESACUM) +'
      
        '        DECODE(CMBEMACUM.VALCMBEMACUM,          NULL,0,CMBEMACUM' +
        '.VALCMBEMACUM) +'
      
        '        DECODE(CMREAVACUM.VALCMREAVACUM,        NULL,0,CMREAVACU' +
        'M.VALCMREAVACUM) +'
      
        '        DECODE(CMACRESACUM.VALCMACRESACUM,      NULL,0,CMACRESAC' +
        'UM.VALCMACRESACUM) )'
      '       ) -'
      '       ('
      
        '       (DECODE(BXBEMACUM.BXVALBEMACUM,          NULL,0,BXBEMACUM' +
        '.BXVALBEMACUM) +'
      
        '        DECODE(BXREAVACUM.BXVALREAVACUM,        NULL,0,BXREAVACU' +
        'M.BXVALREAVACUM) +'
      
        '        DECODE(BXACRESACUM.BXVALACRESACUM,      NULL,0,BXACRESAC' +
        'UM.BXVALACRESACUM) +'
      
        '        DECODE(BXCMBEMACUM.BXVALCMBEMACUM,      NULL,0,BXCMBEMAC' +
        'UM.BXVALCMBEMACUM) +'
      
        '        DECODE(BXCMREAVACUM.BXVALCMREAVACUM,    NULL,0,BXCMREAVA' +
        'CUM.BXVALCMREAVACUM) +'
      
        '        DECODE(BXCMACRESACUM.BXVALCMACRESACUM,  NULL,0,BXCMACRES' +
        'ACUM.BXVALCMACRESACUM) )'
      '       )) +'
      '       (('
      
        '       (DECODE(ULTREAVACUM.VALULTREAVACUM    ,NULL,0,ULTREAVACUM' +
        '.VALULTREAVACUM) +'
      
        '        DECODE(ULTCMREAVACUM.VALULTCMREAVACUM,NULL,0,ULTCMREAVAC' +
        'UM.VALULTCMREAVACUM) )'
      '       ) -'
      '       ('
      
        '       (DECODE(BXULTREAVACUM.BXVALULTREAVACUM,NULL,0,BXULTREAVAC' +
        'UM.BXVALULTREAVACUM) +'
      
        '        DECODE(BXULTCMREAVACUM.BXVALULTCMREAVACUM,NULL,0,BXULTCM' +
        'REAVACUM.BXVALULTCMREAVACUM) )'
      '       ))) AS SUMVALCTBIMOB'
      'FROM'
      '   IMOVELXBEM IXB, BEM B,'
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 01)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BEMACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      
        '      AND  ((HM.IDTIPOMOVIMENTACAO = 08) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 32))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (R.IDMOVIMENTACAO  = HM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) REAVACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 09)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ACRESACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 15)'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMBEMATU,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMREAVATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 22)'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMREAVATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMACRESAT' +
        'U'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 34)'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMACRESATU,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 15)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMREAVACU' +
        'M'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 22)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMACRESAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 34)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMACRESACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      
        '      AND  ((HM.IDTIPOMOVIMENTACAO = 14) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 17)'
      
        '                                         OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 21))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPBEMATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPREAVAT' +
        'U'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      
        '      AND ((HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIPOMOVIMENTACA' +
        'O = 33)'
      
        '                                        OR (HM.IDTIPOMOVIMENTACA' +
        'O = 19))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPREAVATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPACRESA' +
        'TU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      
        '      AND  ((HM.IDTIPOMOVIMENTACAO = 35) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 36))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPACRESATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPBEMACU' +
        'M'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      
        '      AND  ((HM.IDTIPOMOVIMENTACAO = 14) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 17))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPREAVAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      
        '      AND ((HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIPOMOVIMENTACA' +
        'O = 33))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPACRESA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  ((HM.IDTIPOMOVIMENTACAO = 35))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPBEMA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 21)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPREAV' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 19)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPACRE' +
        'SACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 36)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTREAVAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      
        '      AND  ((HM.IDTIPOMOVIMENTACAO = 08) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 32))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (R.IDMOVIMENTACAO  = HM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ULTREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTCMREAV' +
        'ATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 22)'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ULTCMREAVATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTCMREAV' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 22)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ULTCMREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTDEPREA' +
        'VATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      
        '      AND ((HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIPOMOVIMENTACA' +
        'O = 33)'
      
        '                                        OR (HM.IDTIPOMOVIMENTACA' +
        'O = 19))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ULTDEPREAVATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTDEPREA' +
        'VACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      
        '      AND ((HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIPOMOVIMENTACA' +
        'O = 33)'
      
        '                                        OR (HM.IDTIPOMOVIMENTACA' +
        'O = 19))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ULTDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTCMDEPR' +
        'EAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 19)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ULTCMDEPREAVACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 6)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALREAVACU' +
        'M'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 20)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALACRESAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 37)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMBEMAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 25)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMREAVA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 28)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMACRES' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 38)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPBEMA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 24)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPREAV' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 27)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPACRE' +
        'SACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 39)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPBE' +
        'MACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 26)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPRE' +
        'AVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 29)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPAC' +
        'RESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 40)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALULTREAV' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 20)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXULTREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALULTCMRE' +
        'AVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 28)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXULTCMREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALULTDEPR' +
        'EAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 27)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXULTDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALULTCMDE' +
        'PREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDPESSOA = :EMPRESAPROP)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 29)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXULTCMDEPREAVACUM'
      'WHERE'
      '   (( IXB.IDIMOVEL =:IMOVEL )'
      '   AND( IXB.IDPESSOA =:EMPRESAPROP ))'
      '   AND(( IXB.IDBEM = B.IDBEM )'
      '   AND( IXB.IDPESSOA = B.IDPESSOA ))'
      
        '  AND((B.DATAINICIODEP <= :PDATAMOV) OR (B.DATAINICIODEP IS NULL' +
        '))'
      '  AND (B.IDBEM = BEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = REAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = ACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = CMBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = DEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMREAVATU.IDBEM(+))'
      '  AND (B.IDBEM = CMREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPREAVATU.IDBEM(+))'
      '  AND (B.IDBEM = DEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = ULTREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = ULTCMREAVATU.IDBEM(+))'
      '  AND (B.IDBEM = ULTCMREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = ULTDEPREAVATU.IDBEM(+))'
      '  AND (B.IDBEM = ULTDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = ULTCMDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = CMACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = DEPACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXULTREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXULTCMREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXULTDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXULTCMDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPACRESACUM.IDBEM(+))'
      ''
      'ORDER BY'
      '   IXB.IXBGRUPO, B.DESBEM')
    UpdateObject = updBemXMestre
    ValidateWithMask = True
    Left = 344
    Top = 110
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
    object StringField2: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'GrupoExtenso'
      Size = 25
      Calculated = True
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Nº Tombamento'
      DisplayWidth = 11
      FieldName = 'PLACA'
    end
    object StringField1: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESBEM'
      Size = 200
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Custo Contábil'
      DisplayWidth = 13
      FieldName = 'SUMVALCTB'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Valor do Laudo'
      DisplayWidth = 13
      FieldName = 'VLRREAVAL'
      DisplayFormat = '###,###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Vida Útil'
      DisplayWidth = 7
      FieldName = 'VIDAUTIL'
      Visible = False
      DisplayFormat = '0'
      EditFormat = '0'
    end
    object FloatField7: TFloatField
      FieldName = 'IDBEM'
      Visible = False
    end
    object StringField3: TStringField
      FieldName = 'IXBGRUPO'
      Visible = False
      Size = 1
    end
    object FloatField8: TFloatField
      FieldName = 'SUMVALCTBIMOB'
      Visible = False
    end
    object qryBemXMestreIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
  end
  object updBemXMestre: TUpdateSQL
    Left = 344
    Top = 97
  end
  object updImovel: TUpdateSQL
    Left = 269
    Top = 97
  end
  object qryLookTipoOperPositiva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOOPERACAO, DESCTIPOOPERACAO, NATUREZAOPERACAO'
      ''
      'FROM'
      '   TIPOOPERACAO'
      ''
      'WHERE'
      '   ( IDTIPOINVEST = 3 )'
      '   AND ( NATUREZAOPERACAO = '#39'G'#39' )'
      ''
      'ORDER BY'
      '   DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 656
    Top = 45
    object qryLookTipoOperPositivaDESCTIPOOPERACAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryLookTipoOperPositivaIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
    object qryLookTipoOperPositivaNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPOOPERACAO.NATUREZAOPERACAO'
      Visible = False
      Size = 1
    end
  end
  object qryLookTipoOperNegativa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOOPERACAO, DESCTIPOOPERACAO, NATUREZAOPERACAO'
      ''
      'FROM'
      '   TIPOOPERACAO'
      ''
      'WHERE'
      '   ( IDTIPOINVEST = 3 )'
      '   AND ( NATUREZAOPERACAO = '#39'P'#39' )'
      ''
      'ORDER BY'
      '   DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 656
    Top = 85
    object qryLookTipoOperNegativaIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
    end
    object qryLookTipoOperNegativaDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryLookTipoOperNegativaNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPOOPERACAO.NATUREZAOPERACAO'
      Size = 1
    end
  end
  object dtsBemXMestre: TwwDataSource
    DataSet = qryBemXMestre
    Left = 344
    Top = 85
  end
  object dtsImovel: TwwDataSource
    DataSet = qryImovel
    Left = 269
    Top = 85
  end
end
