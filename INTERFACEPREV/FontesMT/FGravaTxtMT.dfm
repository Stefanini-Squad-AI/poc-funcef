inherited frmGravaTxtMT: TfrmGravaTxtMT
  Left = 293
  Top = 154
  HelpContext = 320007
  Caption = 'Interface Financeira com a Patrocinadora'
  ClientHeight = 477
  ClientWidth = 779
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 779
    Height = 438
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 777
      Height = 119
      Align = alTop
      TabOrder = 0
      object lblArquivoPatro: TLabel
        Left = 14
        Top = 3
        Width = 145
        Height = 13
        Caption = 'Arquivo da Patrocinadora'
      end
      object lblDataCobranca: TLabel
        Left = 140
        Top = 41
        Width = 104
        Height = 13
        Caption = 'Data de Cobrança'
      end
      object lblDataRef: TLabel
        Left = 9
        Top = 41
        Width = 112
        Height = 13
        Caption = 'Data de Referencia'
      end
      object lblPatrocinadora: TLabel
        Left = 272
        Top = 3
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object SpeedButton1: TSpeedButton
        Left = 237
        Top = 18
        Width = 20
        Height = 21
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
      object Label1: TLabel
        Left = 272
        Top = 41
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object edTxt: TEdit
        Left = 9
        Top = 18
        Width = 225
        Height = 21
        Enabled = False
        TabOrder = 0
        OnChange = edTxtChange
      end
      object deDataRef: TCMDateTimePicker
        Left = 9
        Top = 55
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
        OnChange = deDataRefChange
      end
      object deDataCob: TCMDateTimePicker
        Left = 139
        Top = 55
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
        TabOrder = 2
      end
      object dblkPatrocinadora: TwwDBLookupCombo
        Left = 272
        Top = 18
        Width = 313
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Nome')
        LookupTable = cdsPatro
        LookupField = 'IDPESSOA'
        Options = [loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblkPatrocinadoraCloseUp
      end
      object GroupBox1: TGroupBox
        Left = 600
        Top = 6
        Width = 163
        Height = 69
        Caption = ' Início do Processamento '
        TabOrder = 4
        object lblHoraIni: TLabel
          Left = 40
          Top = 27
          Width = 89
          Height = 18
          Caption = '00:00:00'
          Font.Charset = OEM_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Terminal'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object dblkPlanoPrev: TwwDBLookupCombo
        Left = 272
        Top = 55
        Width = 313
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANO'#9'50'#9'Nome'#9'F')
        LookupTable = cdsPlano
        LookupField = 'IDPLANOPREV'
        Options = [loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object chkbad: TCheckBox
        Left = 10
        Top = 81
        Width = 297
        Height = 17
        Caption = 'Gerar arquivo com registros criticados (.BAD)'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object chkInsElegiveis: TCheckBox
        Left = 10
        Top = 98
        Width = 266
        Height = 17
        Caption = 'Importar rubricas de elegíveis'
        TabOrder = 7
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 120
      Width = 777
      Height = 317
      Align = alClient
      Caption = 'Panel1'
      TabOrder = 1
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 556
        Height = 315
        Align = alClient
        TabOrder = 0
        object PageControl1: TPageControl
          Left = 1
          Top = 1
          Width = 554
          Height = 313
          ActivePage = tbDescricao
          Align = alClient
          TabOrder = 0
          OnChange = PageControl1Change
          object tbDescricao: TTabSheet
            Caption = 'Mensagem'
            object lbMensagens: TMemo
              Left = 0
              Top = 0
              Width = 546
              Height = 285
              Align = alClient
              Enabled = False
              ScrollBars = ssBoth
              TabOrder = 0
            end
          end
          object tbErros: TTabSheet
            Caption = 'Erros'
            object memErros: TwwDBRichEdit
              Left = 0
              Top = 0
              Width = 546
              Height = 285
              Align = alClient
              AutoURLDetect = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              PrintJobName = 'Delphi 5'
              TabOrder = 0
              WordWrap = False
              OnDblClick = memErrosDblClick
              EditorCaption = 'Edit Rich Text'
              EditorPosition.Left = 0
              EditorPosition.Top = 0
              EditorPosition.Width = 0
              EditorPosition.Height = 0
              MeasurementUnits = muInches
              PrintMargins.Top = 1
              PrintMargins.Bottom = 1
              PrintMargins.Left = 1
              PrintMargins.Right = 1
              RichEditVersion = 2
              Data = {
                6B0000007B5C727466315C616E73695C64656666305C6465666C616E67313033
                337B5C666F6E7474626C7B5C66305C667377697373204D532053616E73205365
                7269663B7D7D0D0A5C766965776B696E64345C7563315C706172645C625C6630
                5C667331345C7061720D0A7D0D0A00}
            end
          end
          object tbDiverg: TTabSheet
            Caption = 'Divergências'
            object mmDivergencias: TMemo
              Left = 0
              Top = 0
              Width = 546
              Height = 285
              Align = alClient
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              WordWrap = False
            end
          end
        end
      end
      object Panel4: TPanel
        Left = 557
        Top = 1
        Width = 219
        Height = 315
        Align = alRight
        TabOrder = 1
        object GroupBox2: TGroupBox
          Left = 1
          Top = 92
          Width = 217
          Height = 222
          Align = alClient
          Caption = ' Status '
          TabOrder = 0
          object memBuscaRubricas: TMemo
            Left = 188
            Top = 48
            Width = 213
            Height = 85
            Lines.Strings = (
              'SELECT RP.CODPROVDESC,'
              
                '       RP.IDRUBRICA,PD.IDREGRA,PD.FLGCOMPOESALBENEF,PD.FLGCOMPOE' +
                'SALPART,PD.FLGDESCONTO,'
              
                '       PD.FLGCOMPOEREMTOTAL,PD.FLGIRRF,PD.FLGTPRUBRICA,PD.FLGATR' +
                'ASODEVOL,'
              
                '       (NVL(CP.ORDEMCALCULO,0) + NVL(CP13.ORDEMCALCULO,0) + NVL(' +
                'CPA.ORDEMCALCULO,0) +'
              
                '       NVL(CPD.ORDEMCALCULO,0) + NVL(CP13A.ORDEMCALCULO,0) +  NV' +
                'L(CP13D.ORDEMCALCULO,0))  AS ORDEMCALCULO,'
              
                '       DECODE(CP.IDCONTRIBUICAO,NULL,CP13.IDCONTRIBUICAO,CP.IDCO' +
                'NTRIBUICAO) AS IDCONTRIBUICAO,'
              
                '       DECODE(CPA.IDCONTRIBUICAO,NULL,CP13A.IDCONTRIBUICAO,CPA.I' +
                'DCONTRIBUICAO) AS IDCONTRIBATRASO,'
              
                '       DECODE(CPD.IDCONTRIBUICAO,NULL,CP13D.IDCONTRIBUICAO,CPD.I' +
                'DCONTRIBUICAO) AS IDCONTRIBDEVOL,'
              '       CA.IDCONTASS,'
              '       DECODE(CP13.ORDEMCALCULO,NULL,'
              '       DECODE(CP13A.ORDEMCALCULO,NULL,'
              
                '       DECODE(CP13D.ORDEMCALCULO, NULL, 0, 1), 1), 1 ) AS CONTRI' +
                'BSOBRE13,'
              
                '       DECODE(CP.ORDEMCALCULO,NULL,CP13.IDREGRACALCULO13,CP.IDRE' +
                'GRACALCULO) AS IDREGRACALCULO,'
              '       RP.TRGDTINCLUSAO , PD.PRAZO'
              
                'FROM   RUBRICAXPESS RP,        PROVDESC PD,       CONTPREV CP,  ' +
                '     CONTRIBASS CA,'
              'CONTRIBASS CAA,       CONTRIBASS CAD,       CONTPREV CPA,'
              
                '       CONTPREV CPD,       CONTPREV CP13,       CONTPREV CP13A, ' +
                '      CONTPREV CP13D'
              
                'WHERE  ( RTRIM(LTRIM(RP.CODPROVDESC))             =  :CodProvDes' +
                'c )'
              'AND    (RP.IDPESSOA                = :CodPatro)'
              'AND    (PD.IDPROVENTO              = RP.IDRUBRICA)'
              'and    (cp.idplanoprev(+)          = :IdPlanoPrev)'
              'AND    (CP.IDRUBRICA(+)            = RP.IDRUBRICA)'
              'and    (cpa.idplanoprev(+)         = :IdPlanoPrev)'
              'AND    (CPA.IDRUBRICAATRASO(+)     = RP.IDRUBRICA)'
              'and    (cpd.idplanoprev(+)         = :IdPlanoPrev)'
              'AND    (CPD.IDRUBRICADEVOLUC(+)    = RP.IDRUBRICA)'
              'and    (cp13.idplanoprev(+)        = :IdPlanoPrev)'
              'AND    (CP13.IDRUBDECTERC(+)       = RP.IDRUBRICA)'
              'and    (cp13a.idplanoprev(+)       = :IdPlanoPrev)'
              'AND    (CP13A.IDRUBDECTERCATRA(+)  = RP.IDRUBRICA)'
              'and    (cp13d.idplanoprev(+)       = :IdPlanoPrev)'
              'AND    (CP13D.IDRUBDECTERCDEVOL(+) = RP.IDRUBRICA)'
              'AND    (CA.IDPROVENTO(+)           = RP.IDRUBRICA)'
              'AND    (CAA.IDPROVENTOATRASO(+)    = RP.IDRUBRICA)'
              'AND    (CAD.IDPROVENTODEVOL(+)     = RP.IDRUBRICA)'
              'AND PD.FLGTPRUBRICA NOT LIKE '#39'%E%'#39
              'ORDER BY'
              
                '(NVL(CP.ORDEMCALCULO,0) + NVL(CP13.ORDEMCALCULO,0) + NVL(CPA.ORD' +
                'EMCALCULO,0) +'
              
                'NVL(CPD.ORDEMCALCULO,0) + NVL(CP13A.ORDEMCALCULO,0) +  NVL(CP13D' +
                '.ORDEMCALCULO,0))'
              ''
              ''
              ''
              ''
              ' ')
            TabOrder = 0
            Visible = False
            WordWrap = False
          end
          object memBuscaRubricasDuplo: TMemo
            Left = 190
            Top = 123
            Width = 185
            Height = 89
            Lines.Strings = (
              'SELECT * FROM'
              '('
              
                'SELECT RP.CODPROVDESC, RP.IDRUBRICA,PD.IDREGRA,PD.FLGCOMPOESALBE' +
                'NEF,PD.FLGCOMPOESALPART,PD.FLGDESCONTO,'
              
                '       PD.FLGCOMPOEREMTOTAL,PD.FLGIRRF,PD.FLGTPRUBRICA,PD.FLGATR' +
                'ASODEVOL,'
              
                '       DECODE(CP.ORDEMCALCULO,NULL,CP13.ORDEMCALCULO,CP.ORDEMCAL' +
                'CULO) AS ORDEMCALCULO ,'
              
                '       DECODE(CP.IDCONTRIBUICAO,NULL,CP13.IDCONTRIBUICAO,CP.IDCO' +
                'NTRIBUICAO) AS IDCONTRIBUICAO,'
              
                '       DECODE(CPA.IDCONTRIBUICAO,NULL,CP13A.IDCONTRIBUICAO,CPA.I' +
                'DCONTRIBUICAO) AS IDCONTRIBATRASO,'
              
                '       DECODE(CPD.IDCONTRIBUICAO,NULL,CP13D.IDCONTRIBUICAO,CPD.I' +
                'DCONTRIBUICAO) AS IDCONTRIBDEVOL,'
              '       CA.IDCONTASS,'
              '       DECODE(CP13.ORDEMCALCULO,NULL,'
              '       DECODE(CP13A.ORDEMCALCULO,NULL,'
              
                '       DECODE(CP13D.ORDEMCALCULO, NULL, 0, 1), 1), 1 ) AS CONTRI' +
                'BSOBRE13,'
              
                '       DECODE(CP.ORDEMCALCULO,NULL,CP13.IDREGRACALCULO13,CP.IDRE' +
                'GRACALCULO) AS IDREGRACALCULO,'
              '       RP.TRGDTINCLUSAO'
              
                'FROM   RUBRICAXPESS RP,        PROVDESC PD,       CONTPREV CP,  ' +
                '     CONTRIBASS CA,'
              '       CONTRIBASS CAA,       CONTRIBASS CAD,       CONTPREV CPA,'
              
                '       CONTPREV CPD,       CONTPREV CP13,       CONTPREV CP13A, ' +
                '      CONTPREV CP13D'
              'WHERE  ( RP.CODPROVDESC             =  :CodProvDesc )'
              'AND    (RP.IDPESSOA                = :CodPatro)'
              'AND    (PD.IDPROVENTO              = RP.IDRUBRICA)'
              'and    (cp.idplanoprev(+)          = :IdPlanoPrev)'
              'AND    (CP.IDRUBRICA(+)            = RP.IDRUBRICA)'
              'and    (cpa.idplanoprev(+)         = :IdPlanoPrev)'
              'AND    (CPA.IDRUBRICAATRASO(+)     = RP.IDRUBRICA)'
              'and    (cpd.idplanoprev(+)         = :IdPlanoPrev)'
              'AND    (CPD.IDRUBRICADEVOLUC(+)    = RP.IDRUBRICA)'
              'and    (cp13.idplanoprev(+)        = :IdPlanoPrev)'
              'AND    (CP13.IDRUBDECTERC(+)       = RP.IDRUBRICA)'
              'and    (cp13a.idplanoprev(+)       = :IdPlanoPrev)'
              'AND    (CP13A.IDRUBDECTERCATRA(+)  = RP.IDRUBRICA)'
              'and    (cp13d.idplanoprev(+)       = :IdPlanoPrev)'
              'AND    (CP13D.IDRUBDECTERCDEVOL(+) = RP.IDRUBRICA)'
              'AND    (CA.IDPROVENTO(+)           = RP.IDRUBRICA)'
              'AND    (CAA.IDPROVENTOATRASO(+)    = RP.IDRUBRICA)'
              'AND    (CAD.IDPROVENTODEVOL(+)     = RP.IDRUBRICA)'
              'AND    (PD.FLGTPRUBRICA <> '#39'G'#39')'
              'AND    NVL( DECODE(CP.IDCONTRIBUICAO,NULL,CP13.IDCONTRIBUICAO,'
              '       CP.IDCONTRIBUICAO),0) >0'
              ''
              'UNION ALL'
              
                'SELECT RP.CODPROVDESC, RP.IDRUBRICA,PD.IDREGRA,PD.FLGCOMPOESALBE' +
                'NEF,PD.FLGCOMPOESALPART,PD.FLGDESCONTO,'
              
                '       PD.FLGCOMPOEREMTOTAL,PD.FLGIRRF,PD.FLGTPRUBRICA,PD.FLGATR' +
                'ASODEVOL,'
              
                '       DECODE(CP.ORDEMCALCULO,NULL,CP13.ORDEMCALCULO,CP.ORDEMCAL' +
                'CULO) AS ORDEMCALCULO ,'
              
                '       DECODE(CP.IDCONTRIBUICAO,NULL,CP13.IDCONTRIBUICAO,CP.IDCO' +
                'NTRIBUICAO) AS IDCONTRIBUICAO,'
              
                '       DECODE(CPA.IDCONTRIBUICAO,NULL,CP13A.IDCONTRIBUICAO,CPA.I' +
                'DCONTRIBUICAO) AS IDCONTRIBATRASO,'
              
                '       DECODE(CPD.IDCONTRIBUICAO,NULL,CP13D.IDCONTRIBUICAO,CPD.I' +
                'DCONTRIBUICAO) AS IDCONTRIBDEVOL,'
              '       CA.IDCONTASS,'
              '       DECODE(CP13.ORDEMCALCULO,NULL,'
              '       DECODE(CP13A.ORDEMCALCULO,NULL,'
              
                '       DECODE(CP13D.ORDEMCALCULO, NULL, 0, 1), 1), 1 ) AS CONTRI' +
                'BSOBRE13,'
              
                '       DECODE(CP.ORDEMCALCULO,NULL,CP13.IDREGRACALCULO13,CP.IDRE' +
                'GRACALCULO) AS IDREGRACALCULO,'
              '       RP.TRGDTINCLUSAO'
              
                'FROM   RUBRICAXPESS RP,        PROVDESC PD,       CONTPREV CP,  ' +
                '     CONTRIBASS CA,'
              'CONTRIBASS CAA,       CONTRIBASS CAD,       CONTPREV CPA,'
              
                '       CONTPREV CPD,       CONTPREV CP13,       CONTPREV CP13A, ' +
                '      CONTPREV CP13D'
              
                'WHERE  (substr(RP.CODPROVDESC ,1,4)            = substr( :CodPro' +
                'vDesc,1,4) )'
              'AND    (RP.IDPESSOA                = :CodPatro)'
              'AND    (PD.IDPROVENTO              = RP.IDRUBRICA)'
              'and    (cp.idplanoprev(+)          = :IdPlanoPrev)'
              'AND    (CP.IDRUBRICA(+)            = RP.IDRUBRICA)'
              'and    (cpa.idplanoprev(+)         = :IdPlanoPrev)'
              'AND    (CPA.IDRUBRICAATRASO(+)     = RP.IDRUBRICA)'
              'and    (cpd.idplanoprev(+)         = :IdPlanoPrev)'
              'AND    (CPD.IDRUBRICADEVOLUC(+)    = RP.IDRUBRICA)'
              'and    (cp13.idplanoprev(+)        = :IdPlanoPrev)'
              'AND    (CP13.IDRUBDECTERC(+)       = RP.IDRUBRICA)'
              'and    (cp13a.idplanoprev(+)       = :IdPlanoPrev)'
              'AND    (CP13A.IDRUBDECTERCATRA(+)  = RP.IDRUBRICA)'
              'and    (cp13d.idplanoprev(+)       = :IdPlanoPrev)'
              'AND    (CP13D.IDRUBDECTERCDEVOL(+) = RP.IDRUBRICA)'
              'AND    (CA.IDPROVENTO(+)           = RP.IDRUBRICA)'
              'AND    (CAA.IDPROVENTOATRASO(+)    = RP.IDRUBRICA)'
              'AND    (CAD.IDPROVENTODEVOL(+)     = RP.IDRUBRICA)'
              'AND    (PD.FLGTPRUBRICA <> '#39'G'#39')'
              'UNION ALL'
              
                'SELECT RP.CODPROVDESC, RP.IDRUBRICA,PD.IDREGRA,PD.FLGCOMPOESALBE' +
                'NEF,PD.FLGCOMPOESALPART,PD.FLGDESCONTO,'
              
                '       PD.FLGCOMPOEREMTOTAL,PD.FLGIRRF,PD.FLGTPRUBRICA,PD.FLGATR' +
                'ASODEVOL,'
              
                '       DECODE(CP.ORDEMCALCULO,NULL,CP13.ORDEMCALCULO,CP.ORDEMCAL' +
                'CULO) AS ORDEMCALCULO ,'
              
                '       DECODE(CP.IDCONTRIBUICAO,NULL,CP13.IDCONTRIBUICAO,CP.IDCO' +
                'NTRIBUICAO) AS IDCONTRIBUICAO,'
              
                '       DECODE(CPA.IDCONTRIBUICAO,NULL,CP13A.IDCONTRIBUICAO,CPA.I' +
                'DCONTRIBUICAO) AS IDCONTRIBATRASO,'
              
                '       DECODE(CPD.IDCONTRIBUICAO,NULL,CP13D.IDCONTRIBUICAO,CPD.I' +
                'DCONTRIBUICAO) AS IDCONTRIBDEVOL,'
              '       CA.IDCONTASS,'
              '       DECODE(CP13.ORDEMCALCULO,NULL,'
              '       DECODE(CP13A.ORDEMCALCULO,NULL,'
              
                '       DECODE(CP13D.ORDEMCALCULO, NULL, 0, 1), 1), 1 ) AS CONTRI' +
                'BSOBRE13,'
              
                '       DECODE(CP.ORDEMCALCULO,NULL,CP13.IDREGRACALCULO13,CP.IDRE' +
                'GRACALCULO) AS IDREGRACALCULO,'
              '       RP.TRGDTINCLUSAO'
              
                'FROM   RUBRICAXPESS RP,        PROVDESC PD,       CONTPREV CP,  ' +
                '     CONTRIBASS CA,'
              'CONTRIBASS CAA,       CONTRIBASS CAD,       CONTPREV CPA,'
              
                '       CONTPREV CPD,       CONTPREV CP13,       CONTPREV CP13A, ' +
                '      CONTPREV CP13D'
              'WHERE  ( RP.CODPROVDESC             =  :CodProvDesc )'
              'AND    (RP.IDPESSOA                = :CodPatro)'
              'AND    (PD.IDPROVENTO              = RP.IDRUBRICA)'
              'and    (cp.idplanoprev(+)          = :IdPlanoPrev)'
              'AND    (CP.IDRUBRICA(+)            = RP.IDRUBRICA)'
              'and    (cpa.idplanoprev(+)         = :IdPlanoPrev)'
              'AND    (CPA.IDRUBRICAATRASO(+)     = RP.IDRUBRICA)'
              'and    (cpd.idplanoprev(+)         = :IdPlanoPrev)'
              'AND    (CPD.IDRUBRICADEVOLUC(+)    = RP.IDRUBRICA)'
              'and    (cp13.idplanoprev(+)        = :IdPlanoPrev)'
              'AND    (CP13.IDRUBDECTERC(+)       = RP.IDRUBRICA)'
              'and    (cp13a.idplanoprev(+)       = :IdPlanoPrev)'
              'AND    (CP13A.IDRUBDECTERCATRA(+)  = RP.IDRUBRICA)'
              'and    (cp13d.idplanoprev(+)       = :IdPlanoPrev)'
              'AND    (CP13D.IDRUBDECTERCDEVOL(+) = RP.IDRUBRICA)'
              'AND    (CA.IDPROVENTO(+)           = RP.IDRUBRICA)'
              'AND    (CAA.IDPROVENTOATRASO(+)    = RP.IDRUBRICA)'
              'AND    (CAD.IDPROVENTODEVOL(+)     = RP.IDRUBRICA)'
              'AND    (PD.FLGTPRUBRICA            <> '#39'G'#39') )'
              'WHERE  ROWNUM = 1'
              'ORDER BY  TRGDTINCLUSAO'
              ''
              ' '
              ' ')
            TabOrder = 1
            Visible = False
            WordWrap = False
          end
          object TwCons: TTreeWzd
            Left = 2
            Top = 15
            Width = 213
            Height = 205
            Align = alClient
            Color = clGray
            BevelOuter = bvNone
            BevelWidth = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Etapa.Caption.Strings = (
              'Tratando Arquivo'
              'Importando Rubricas'
              'Calculando Contrib.'
              'Totalizando Salários'
              'Fim')
            Etapa.Forma = stRoundSquare
            Etapa.LinhaWidth = 1
            Etapa.Top = 25
            Etapa.Espaco = 15
            Etapa.Quantidade = 5
            Etapa.BorderWidth = 1
            Etapa.Left = 10
            Etapa.Identacao = 30
            Etapa.Height = 20
            Etapa.Width = 20
            Etapa.BoderColor = clNavy
            Etapa.BrushColor = clWhite
            Etapa.Imagem.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777777744777777777777746647777777777746666477777777746666664777
              77774666E66664777777666E7E6664777777E6E777E6664777777E77777E6664
              777777777777E6664777777777777E6664777777777777E6664777777777777E
              6664777777777777E6647777777777777E6677777777777777E7}
            Etapa.Pos = -1
          end
        end
        object GroupBox3: TGroupBox
          Left = 1
          Top = 1
          Width = 217
          Height = 91
          Align = alTop
          Caption = ' Etapas do Processo '
          TabOrder = 1
          object clbEtapas: TCheckListBox
            Left = 2
            Top = 15
            Width = 213
            Height = 74
            Align = alClient
            ItemHeight = 13
            Items.Strings = (
              'Histórico de Rubricas'
              'Atualização do Sal. de Participação'
              'Descontos de Contribuição'
              'Contribuições Não Recebidas'
              'Contribuições Não Esperadas')
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 438
    Width = 779
    inherited tb97Fundo: TToolbar97
      Left = 271
      DockPos = 621
      inherited sep1: TToolbarSep97
        Left = 421
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 338
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 336
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 340
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 423
      end
      object bbtnBaca: TBitBtn
        Left = 0
        Top = 0
        Width = 112
        Height = 33
        Cancel = True
        Caption = '&Temporário'
        TabOrder = 2
        Visible = False
        OnClick = bbtnBacaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
          000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
          FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
          FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
          0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
          05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
          55557F7777777555555500000005555555557777777555555555}
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnCalcula: TBitBtn
        Left = 112
        Top = 0
        Width = 112
        Height = 33
        Cancel = True
        Caption = '&Importar'
        TabOrder = 3
        OnClick = bbtnCalculaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
          333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
          C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
          F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
          F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
          00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
          3333333373FF7333333333333000333333333333377733333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnRel: TBitBtn
        Left = 224
        Top = 0
        Width = 112
        Height = 33
        Cancel = True
        Caption = '&Relatório'
        TabOrder = 4
        OnClick = bbtnRelClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
          000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
          FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
          FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
          0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
          05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
          55557F7777777555555500000005555555557777777555555555}
        NumGlyphs = 2
        Spacing = 2
      end
    end
    object BitBtn2: TBitBtn
      Left = 15
      Top = 2
      Width = 145
      Height = 33
      Caption = 'Desfaz Importação'
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF33339993707399933333773337F3777FF3399933000339
        9933377333777F3377F3399333707333993337733337333337FF993333333333
        399377F33333F333377F993333303333399377F33337FF333373993333707333
        333377F333777F333333993333101333333377F333777F3FFFFF993333000399
        999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
        99933773FF777F3F777F339993707399999333773F373F77777F333999999999
        3393333777333777337333333999993333333333377777333333}
      NumGlyphs = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 987
    TargetsData = (
      1
      3
      (
        'TMemo'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        ''
        'Cells'
        0))
  end
  object odTxt: TOpenDialog
    DefaultExt = '*.txt'
    Filter = 'Arquivos de texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Left = 88
    Top = 240
  end
  object SaveDialog1: TSaveDialog
    Title = 'Salvar como'
    Left = 32
    Top = 240
  end
  object bmPatro: TBatchMove
    Destination = tblDbf
    Mode = batCopy
    Source = tblTxt
    Left = 144
    Top = 240
  end
  object tblTxt: TwwTable
    DatabaseName = 'C:\ProjetosCM5\SRH\'
    TableName = 'Financeiro_Part_Cedidos_teste'
    TableType = ttASCII
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 88
    Top = 288
  end
  object tblDbf: TwwTable
    TableName = 'tmptxt.dbf'
    TableType = ttDBase
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 32
    Top = 288
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 176
  end
  object cdsPatro: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 32
    Top = 176
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 264
    Top = 176
  end
  object cdsDadosArquivo: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 184
    Top = 176
  end
  object qryTxt: TwwQuery
    DatabaseName = 'c:\projetoscm5\cbs'
    RequestLive = True
    SQL.Strings = (
      'SELECT DBF.VALORCHAVE, DBF.VALORPROVE , DBF.PROVENTO '
      ' FROM  TMPTXT DBF '
      '              WHERE DBF.PROVENTO LIKE '#39'%D89%'#39'  '
      'ORDER BY DBF.VALORCHAVE')
    ValidateWithMask = True
    Left = 144
    Top = 288
  end
  object cmsqlCalcContrib: TCMSqlParams
    SQL.Strings = (
      
        'SELECT DISTINCT   /*+ INDEX (CLASSERUBRICAS XPKCLASSERUBRICAS) *' +
        '/'
      '       C.FLGACEITAOPCAO,'
      '       C.IDREGRACALCULO,'
      '       C.IDREGRAPRIMPAGTO,C.IDREGRAULTPAGTO,'
      '       C.NUMOPCOES,'
      '       CP.FLGCOBRA,CP.FLGDESCFOLHA,'
      
        '     CP.FLGRECALCULA,CP.FLGRETROATIVO,     CP.IDCONTRIBUICAO,CP.' +
        'IDPESSJUR,CP.IDPESSOA,CP.IDPLANOPREV,'
      '       CP.QTDEPARCELAS,CP.SEQPROPOSTA,'
      '       NVL(CP.VALORBASE1,0) AS VALORBASE1,'
      '       NVL(CP.VALORBASE2,0) AS VALORBASE2,'
      '       NVL(CP.VALORBASE3,0) AS VALORBASE3,'
      '       NVL(CP.ASSOC1OP1,0) AS ASSOC1OP1,'
      '       NVL(CP.ASSOC1OP2,0) AS ASSOC1OP2,'
      '       NVL(CP.ASSOC1OP3,0) AS ASSOC1OP3,'
      '       NVL(CP.ASSOC2OP1,0) AS ASSOC2OP1,'
      '       NVL(CP.ASSOC2OP2,0) AS ASSOC2OP2,'
      '       NVL(CP.ASSOC2OP3,0) AS ASSOC2OP3,'
      '       NVL(CP.ASSOC3OP1,0) AS ASSOC3OP1,'
      '       NVL(CP.ASSOC3OP2,0) AS ASSOC3OP2,'
      '       NVL(CP.ASSOC3OP3,0) AS ASSOC3OP3,'
      '       NVL(CP.VALORASSOCIADO,0) AS VALORASSOCIADO,'
      '       NVL(CP.VALORASSOCIADO,0) AS VALORASSOCIADO1,'
      '       NVL(CP.VALORASSOCIADO2,0) AS VALORASSOCIADO2,'
      '       NVL(CP.VALORASSOCIADO3,0) AS VALORASSOCIADO3,'
      '       EL.DATAADMISSAO,EL.IDSITFUNC,EL.MATRICULA,'
      '       EL.SALTOTAL,EL.TEMPONAOCREDITADO,EL.TEMPOSERVANTERIOR,'
      '       PF.DATAMORTE,PF.DATANASC,PF.SEXO,'
      
        '       PP.DTINICIOINSC,PP.INSCRICAODATA,PP.ULTSALMANUT AS RUBMAN' +
        'TIDO,'
      '       PP.ULTSALMANUTPARC AS RUBPARCIAL, PP.IDADEBASE,'
      
        '       DECODE(CL.FLG13,0,NVL(PP.SALPARTICIPACAO,0),DECODE(NVL(PP' +
        '.SALPARTIC13,0),0,NVL(PP.SALPARTICIPACAO,0),NVL(PP.SALPARTIC13,0' +
        '))) AS VALORPROVENTO,'
      
        '       DECODE(CL.FLG13,0,NVL(PP.SALPARTICIPACAO,0),DECODE(NVL(PP' +
        '.SALPARTIC13,0),0,NVL(PP.SALPARTICIPACAO,0),NVL(PP.SALPARTIC13,0' +
        '))) AS SALARIOINTEGRAL,'
      '       ST.FLGINTERNO,ST.IDSITPART,CL.CHAVE,'
      
        '       CL.VALORCHAVE,        CL.IDPESSOA,       CL.CODPATRO,    ' +
        '   CL.CODPLANO,'
      
        '       CL.MESREFERENCIA, CL.MESREFERENCIA ANOMESREF,  CL.MESCOBR' +
        'ANCA,       CL.DATAREFERENCIA,       CL.VALORRECEBIDO,'
      '       CL.CODPROVDESC,'
      
        '       CL.FLGATRASODEVOL,  CL.IDRUBRICA,       CL.SEQINTERFACE, ' +
        '         CL.ORDEMCALCULO,'
      '       :pDataRef AS DATAREF,'
      
        '       DECODE(TRUNC(PP.DTINICIOINSC) - TRUNC(PP.INSCRICAODATA),0' +
        ',0,1) AS PARTREINSC'
      'FROM   CLASSERUBRICAS   CL,'
      '       CONTRIBPREVPARTP CP,'
      '       PARTPREVPLAN     PP,'
      '       ELEGPATRO        EL,'
      '       PESSOAFISICA     PF,'
      '       RUBRICAXPESS     RP,'
      '       PROVDESC         P,'
      '       CONTPREV         C,'
      '       SITPART          ST'
      'WHERE'
      'CL.CHAVE = CL.CHAVE'
      'AND CL.VALORCHAVE = CL.VALORCHAVE'
      'AND CL.IDPESSOA = CL.IDPESSOA'
      'AND CL.CODPATRO = :pidpessjur'
      'AND CL.CODPLANO = :pIDPLANOPREV'
      'AND CL.MESREFERENCIA = CL.MESREFERENCIA'
      'AND CL.MESCOBRANCA = :pmescob'
      'AND CL.IDCONTRIBUICAO = :pIdContribuicao'
      'AND (CP.IDPESSJUR = CL.CODPATRO)'
      'AND   (CP.IDPLANOPREV = CL.CODPLANO)'
      'AND   (CP.SEQPROPOSTA = :pseqproposta)'
      'AND   (CP.IDPESSOA = CL.IDPESSOA)'
      'AND   (CP.IDCONTRIBUICAO = CL.IDCONTRIBUICAO )'
      'AND   (CP.IDCONTRIBUICAO = CP.IDCONTRIBUICAO)'
      'AND   (PP.IDPESSJUR = CP.IDPESSJUR)'
      'AND   (PP.IDPESSOA = CP.IDPESSOA)'
      'AND   (PP.IDPLANOPREV = CP.IDPLANOPREV)'
      'AND   (PP.IDSITPART = ST.IDSITPART)'
      'AND   (PP.SEQPROPOSTA = CP.SEQPROPOSTA)'
      'AND   (EL.IDPESSJUR = PP.IDPESSJUR)'
      'AND   (EL.IDPESSOA  = PP.IDPESSOA)'
      'AND   (PF.IDPESSOA = EL.IDPESSOA)'
      'AND   (CL.IDPESSOA = CP.IDPESSOA)'
      'AND   (CL.CODPATRO  = EL.IDPESSJUR)'
      'AND   (CL.CODPLANO = PP.IDPLANOPREV)'
      'AND   (CL.SEQINTERFACE = CL.SEQINTERFACE)'
      'AND   (RP.IDRUBRICA = CL.IDRUBRICA)'
      'AND   (RP.CODPROVDESC = CL.CODPROVDESC)'
      'AND   (RP.IDPESSOA = EL.IDPESSJUR)'
      'AND   (P.IDPROVENTO = RP.IDRUBRICA)'
      'AND   (C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO)'
      'AND   (C.IDPLANOPREV = PP.IDPLANOPREV)'
      'AND   ((C.IDRUBRICA = RP.IDRUBRICA ) OR'
      '       (C.IDRUBRICAATRASO = RP.IDRUBRICA) OR'
      '       (C.IDRUBRICADEVOLUC  = RP.IDRUBRICA) OR'
      '       (C.IDRUBDECTERC = RP.IDRUBRICA) OR'
      '       (C.IDRUBDECTERCATRA = RP.IDRUBRICA) OR'
      '       (C.IDRUBDECTERCDEVOL = RP.IDRUBRICA) )'
      ' '
      ' ')
    Left = 360
    Top = 168
  end
end
