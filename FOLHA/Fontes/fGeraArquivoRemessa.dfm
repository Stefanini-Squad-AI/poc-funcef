inherited frmGeraArquivoRemessa: TfrmGeraArquivoRemessa
  Left = 124
  Top = 109
  HelpContext = 180015
  Caption = 'GeraÁ„o de Arquivo de Remessa de Pagamento'
  ClientHeight = 380
  ClientWidth = 580
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 580
    Height = 341
    object pgcComponentes: TPageControl
      Left = 1
      Top = 1
      Width = 578
      Height = 339
      ActivePage = tbsOpcoes
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object tbsOpcoes: TTabSheet
        Caption = 'OpÁıes de SeleÁ„o'
        object pnlSelecao: TPanel
          Left = 0
          Top = 0
          Width = 570
          Height = 311
          Align = alClient
          TabOrder = 0
          object grpHistorico: TGroupBox
            Left = 1
            Top = 1
            Width = 568
            Height = 57
            Align = alTop
            Caption = ' Selecione o HistÛrico da Folha de BenefÌcios '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object dblkfolha: TwwDBLookupCombo
              Left = 13
              Top = 22
              Width = 537
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'HISTORICO'#9'75'#9'HistÛrico'#9'F'
                'MESREFERENCIA'#9'7'#9'MÍs')
              LookupTable = qryHist
              LookupField = 'IDHSTFOLHABENEF'
              Options = [loColLines, loRowLines, loTitles]
              Style = csDropDownList
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = dblkfolhaChange
            end
          end
          object grpBanco: TGroupBox
            Left = 1
            Top = 58
            Width = 568
            Height = 139
            Align = alClient
            Caption = ' Selecione o Contas Caixa x Forma de Pagamento '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object dbgPortadorForma: TwwDBGrid
              Left = 2
              Top = 15
              Width = 564
              Height = 122
              ControlType.Strings = (
                'SEL;CheckBox;1;0')
              Selected.Strings = (
                'SEL'#9'7'#9'SeleÁ„o'
                'CODPORTFORMA'#9'8'#9'CÛdigo'
                'DESCRICAO'#9'36'#9'DescriÁ„o'
                'CODDOCUMENTO'#9'10'#9'Documento'
                'VALORDOC'#9'11'#9'Valor')
              MemoAttributes = []
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
              Align = alClient
              DataSource = dsPortador
              EditCalculated = True
              KeyOptions = []
              Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
              OnFieldChanged = dbgPortadorFormaFieldChanged
            end
          end
          object grpParticip: TGroupBox
            Left = 1
            Top = 197
            Width = 568
            Height = 61
            Align = alBottom
            Caption = 
              ' Selecione um recebedor pela matrÌcula ou pressionando o bot„o a' +
              ' direita '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object Label3: TLabel
              Left = 9
              Top = 18
              Width = 55
              Height = 13
              Caption = 'MatrÌcula'
            end
            object edNomeAssist: TLabel
              Left = 150
              Top = 18
              Width = 67
              Height = 13
              Caption = 'Recebedor '
            end
            object spbRecebedor: TSpeedButton
              Left = 525
              Top = 26
              Width = 25
              Height = 25
              Hint = 'Selecione um recebedor'
              Anchors = [akTop, akRight]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33333333333333333333333333333333333333333333333333FF333333333333
                3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
                E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
                E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
                E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
                000033333373FF77777733333330003333333333333777333333333333333333
                3333333333333333333333333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = spbRecebedorClick
            end
            object edMatricula: TEdit
              Left = 9
              Top = 30
              Width = 135
              Height = 21
              Color = clInactiveCaption
              Enabled = False
              TabOrder = 0
            end
            object edNome: TEdit
              Left = 150
              Top = 30
              Width = 373
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Color = clInactiveCaption
              Enabled = False
              TabOrder = 1
            end
          end
          object Panel1: TPanel
            Left = 1
            Top = 258
            Width = 568
            Height = 52
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 3
            object GroupBox2: TGroupBox
              Left = 0
              Top = 0
              Width = 383
              Height = 52
              Align = alClient
              Caption = ' Selecione a Pasta onde o arquivo ser· criado '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object pnlLblDiretorio: TPanel
                Left = 9
                Top = 21
                Width = 330
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                BevelOuter = bvNone
                BorderStyle = bsSingle
                Color = clCaptionText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object lblDiretorio: TLabel
                  Left = 4
                  Top = 2
                  Width = 15
                  Height = 13
                  Caption = 'C:\'
                end
              end
              object btnEscolheDir: TBitBtn
                Left = 340
                Top = 21
                Width = 27
                Height = 21
                Hint = 'Seleciona a Pasta que ser· gravado os arquivos para banco'
                Anchors = [akTop, akRight]
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = btnEscolheDirClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
                  333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
                  300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
                  333337F373F773333333303330033333333337F3377333333333303333333333
                  333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
                  333337777F337F33333330330BB00333333337F373F773333333303330033333
                  333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
                  333377777F77377733330BBB0333333333337F337F33333333330BB003333333
                  333373F773333333333330033333333333333773333333333333}
                NumGlyphs = 2
              end
            end
            object GroupBox1: TGroupBox
              Left = 383
              Top = 0
              Width = 185
              Height = 52
              Align = alRight
              Caption = ' Entre a Previs„o Pagamento '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object edDataFolha: TCMDateTimePicker
                Left = 38
                Top = 21
                Width = 114
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
                TabOrder = 0
              end
            end
          end
        end
      end
      object tbsResultado: TTabSheet
        Caption = 'Resultado'
        ImageIndex = 1
        object pnlProcesso: TPanel
          Left = 0
          Top = 0
          Width = 547
          Height = 303
          Align = alClient
          TabOrder = 0
          object lbProcessando: TLabel
            Left = 1
            Top = 266
            Width = 198
            Height = 20
            Align = alBottom
            Alignment = taCenter
            Caption = 'Processando. Aguarde...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object mmResult: TMemo
            Left = 1
            Top = 1
            Width = 545
            Height = 265
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
            WordWrap = False
          end
          object pbarProcesso: TProgressBar
            Left = 1
            Top = 286
            Width = 545
            Height = 16
            Align = alBottom
            Min = 0
            Max = 100
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 341
    Width = 580
    inherited tb97Fundo: TToolbar97
      Left = 11
      DockPos = 11
      inherited sep1: TToolbarSep97
        Left = 315
      end
      inherited sep3: TToolbarSep97
        Left = 399
      end
      inherited bbtnSair: TBitBtn
        Left = 234
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 318
      end
      object bbtnProcessar: TBitBtn
        Left = 0
        Top = 0
        Width = 117
        Height = 33
        Caption = '&Processar'
        TabOrder = 2
        OnClick = bbtnProcessarClick
        Kind = bkOK
        Spacing = 2
      end
      object bbtnOutro: TBitBtn
        Left = 117
        Top = 0
        Width = 117
        Height = 33
        Caption = '&Processar Outro'
        TabOrder = 3
        Visible = False
        OnClick = bbtnOutroClick
        NumGlyphs = 2
        Spacing = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 417
      DockPos = 417
      Visible = False
      inherited ToolbarSep971: TToolbarSep97
        Left = 46
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 46
        Caption = '&Ok'
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 49
        Width = 60
        Cancel = False
        ModalResult = 0
        Visible = False
        Glyph.Data = {00000000}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 417
    Top = 2
    TargetsData = (
      1
      4
      (
        ''
        'Text'
        0)
      (
        ''
        'Title'
        0)
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object qryHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDHSTFOLHABENEF, HISTORICO, MESREFERENCIA'
      'FROM HSTFOLHABENEF'
      'ORDER BY HISTORICO DESC')
    ValidateWithMask = True
    Left = 333
    Top = 2
  end
  object qryPortador1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT 0 AS SEL, HFB.MESREFERENCIA AS MESCOBRANCA,'
      '       HCAP.IDHSTFOLHABENEF,'
      '       HCAP.CODPORTFORMA,'
      '       HCAP.CODDOCUMENTO,'
      '       HCAP.DFLOATPAGTO,'
      '       HCAP.DFLOATPAGTOALTER,'
      '       hcap.valordoc,'
      '       P.DESCRICAO'
      'FROM HSTFOLHABENEF HFB,'
      '     HSTFOLHABENEFCAP HCAP,'
      '     PORTADORFORMA P,'
      '     DOCUMENTO D'
      'WHERE HFB.IDHSTFOLHABENEF = :IDHSTFOLHABENEF'
      '  AND HFB.IDHSTFOLHABENEF = HCAP.IDHSTFOLHABENEF'
      '  AND HCAP.CODPORTFORMA   = P.CODPORTFORMA'
      '  AND HCAP.CODDOCUMENTO   = D.CODDOCUMENTO'
      '  AND HCAP.TIPOPORTADOR   = '#39'A'#39
      ''
      ' ')
    ValidateWithMask = True
    Left = 433
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
      end>
  end
  object qryRecebedor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT G.IDPESSJUR, G.IDPLANOPREV, G.IDTITULAR, G.IDRESPONSAVEL,' +
        ' G.NOME, G.NUMDOCUMENTO,'
      
        '       G.NUMBANCO, G.NUMAGENCIA, G.CONTACORRENTE, G.VALORPROVENT' +
        'O, G.MATRICULA'
      'FROM ('
      
        'SELECT HS.IDPESSJUR, HS.IDPLANOPREV, HS.IDTITULAR, HS.IDRESPONSA' +
        'VEL, P.NOME, P.NUMDOCUMENTO,'
      
        '       HS.NUMBANCO, HS.NUMAGENCIA, HS.CONTACORRENTE, D.MATRICULA' +
        ','
      '       SUM(DECODE(PR.FLGDESCONTO,0,'
      '                  DECODE(PR.FLGESPECIAL,0,HS.VALORPROVENTO,0),'
      
        '                  DECODE(PR.FLGESPECIAL,0,HS.VALORPROVENTO*-1,0)' +
        ')) VALORPROVENTO'
      'FROM HISTRUBSAL HS, PROVDESC PR, PESSOA P, DEPENTIT D'
      'WHERE (HS.IDHSTFOLHABENEF = :IDFOLHA)'
      'AND (HS.CODPORTFORMA = :CODPORTFORMA)'
      'AND (HS.CODDOCUMENTO = :CODDOCUMENTO)'
      'AND (HS.IDTITULAR = D.IDTITULAR(+))'
      'AND (HS.IDRESPONSAVEL = D.IDPESSOA(+))'
      'AND (NVL(HS.FLGESTORNO,0) = 0)'
      'AND (PR.IDPROVENTO = HS.IDRUBRICA)'
      'AND (PR.FLGESPECIAL = 0)'
      'AND (HS.IDRESPONSAVEL = P.IDPESSOA)'
      
        'GROUP BY HS.IDPESSJUR, HS.IDPLANOPREV, HS.IDTITULAR, P.NOME, D.M' +
        'ATRICULA, HS.IDRESPONSAVEL,'
      
        '         HS.NUMBANCO, HS.NUMAGENCIA, HS.CONTACORRENTE, P.NUMDOCU' +
        'MENTO'
      ') G'
      'WHERE G.VALORPROVENTO >= 0.01'
      
        'ORDER BY G.NOME, G.IDPESSJUR, G.IDPLANOPREV, G.IDTITULAR, G.IDRE' +
        'SPONSAVEL'
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 389
    Top = 2
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDFOLHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODPORTFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryDocTxt1: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      ' '#39'123456789012345678'#39' CONTALIQUIDO,'
      ' 0 IDPESSOA,'
      ' '#39'12345678901234567890123456789012345678901234567890'#39' NOME,'
      
        ' '#39'12345678901234567890123456789012345678901234567890'#39' RAZAOSOCIA' +
        'L,'
      ' '#39'123456789012345678'#39' NUMDOCUMENTO,'
      ' '#39'123456789012345'#39' CONTACORRENTE,'
      ' '#39'1234567890'#39' CODBANCOFAVORECIDO,'
      ' '#39'123456789012345'#39' NUMAGENCIA,'
      
        ' '#39'12345678901234567890123456789012345678901234567890'#39' LOGRADOURO' +
        ','
      ' '#39'12345678'#39' NUMERO,'
      ' '#39'12345678901234567890'#39' COMPLEMENTO,'
      ' '#39'12345678901234567890'#39' BAIRRO,'
      ' '#39'12345678901234567890'#39' CIDADE,'
      ' '#39'123'#39' CODESTADO,'
      ' '#39'12345678'#39' CEP,'
      ' 0 IDFORCLI,'
      ' '#39'1234567890123456789012345'#39' CODDOCUMENTO,'
      ' 0.00 VALOR,'
      ' 0.00 VALORDESCONTO,'
      ' 0.00 VALORJUROS,'
      ' '#39'01/01/1990'#39' DATAVENCTO,'
      ' '#39'01/01/1990'#39' DATAPROGRAMADA,'
      ' 0 TIPOMOEDA,'
      ' 0 NUMLOTE,'
      ' 0 CODPORTFORMA,'
      ' 0 CODPORTADOR,'
      ' 0 CODFORMAPAGTO,'
      ' 0 CODTIPOPAGTO,'
      ' '#39'0'#39' FLGEMITEAVISO,'
      ' 0 CODARQUIVOREMESSA,'
      ' 0 IDBANCO,'
      ' '#39'123456789012345'#39' NOCONTACORR,'
      ' '#39'1234567890'#39' CODBARRA,'
      ' '#39'1234567890'#39' CODBARRAVALOR,'
      ' '#39'12345678901234567890'#39' NODOCUMENTO,'
      ' '#39'123'#39' COMPLDOCUMENTO,'
      ' '#39'1'#39' TIPO,'
      ' '#39'12345678901234567890'#39' NUMEMPRESABANCO,'
      ' '#39'1'#39' DEBCRE,'
      ' '#39'1'#39' TIPOCONTA,'
      ' '#39'AGENCIA'#39' NOMEAGENCIA,'
      ' 0 AS DMAISALT,'
      ' 0 AS CODFORMAPGTOALT,'
      ' 0.00 AS  VALORMAXIMO,'
      ' '#39'1234567890123456789012345'#39' LIVRE'
      'FROM DUAL'
      'WHERE 1 = 2'
      '')
    UpdateObject = updDoc
    ValidateWithMask = True
    Left = 93
    Top = 155
  end
  object qryPortadorForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PFR.CODPORTFORMA,PFR.DESCRICAO,PFR.CODARQUIVOREMESSA,PFR.' +
        'PATHARQUIVOREM,PFR.DMAIS,'
      '       PFR.CONTROLEREMESSA,PFR.CODFORMAPAGTO,PFR.FLGEMITEAVISO,'
      '       PFR.CODTIPOPAGTO,PFR.NUMEMPRESABANCO,'
      '       PCT.IDBANCO,PCT.NOCONTACORR,'
      '       PFR.DMAISALT, PFR.CODFORMAPGTOALT, PFR.VALORMAXIMO'
      'FROM PORTADORFORMA PFR,PORTADORCONTA PCT'
      'WHERE PFR.RECPAG = '#39'P'#39
      'AND PCT.CODPORTADOR=PFR.CODPORTADOR'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 193
    Top = 2
  end
  object qryDadosRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.LOGRADOURO,'
      '       E.NUMERO,'
      '       E.COMPLEMENTO,'
      '       E.BAIRRO,'
      '       C.NOME AS CIDADE,'
      '       S.CODESTADO,'
      '       E.CEP,'
      '       NVL(P.NUMDOCUMENTO,D.NUMDOCUMENTO) AS NUMDOCUMENTO,'
      '       P.NOME'
      
        'FROM PESSOA P, ENDPESS E, DOCPESSOA D, CIDADES C, ESTADO S, PARA' +
        'MGLOBAL PG'
      'WHERE P.IDPESSOA = :IDRESPONSAVEL'
      'AND E.IDPESSOA(+) = P.IDPESSOA'
      'AND D.IDPESSOA(+) = P.IDPESSOA'
      'AND E.IDCIDADES = C.IDCIDADES(+)'
      'AND C.IDESTADO = S.IDESTADO(+)'
      'AND PG.DOCPFISICA(+) = D.IDDOCUMENTO')
    ValidateWithMask = True
    Left = 277
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object updDoc: TUpdateSQL
    Left = 249
    Top = 2
  end
  object msAssistido: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'MatrÌcula'
      'N˙mero de InscriÁ„o'
      'Nome do Participante')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N')
    Tabelas.Strings = (
      'HISTRUBSAL'
      'ELEGPATRO'
      'PESSOA'
      'PARTPREVPLAN')
    CamposChave.Strings = (
      'HISTRUBSAL.IDRESPONSAVEL'
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 445
    Top = 2
  end
  object qryDadosAg: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 305
    Top = 2
  end
  object pdirdlgPasta: TProcuraDirDlg
    Caption = 'SeleÁ„o de pasta'
    Directory = 
      'WHERE (PPP.IDPESSOA = :PESSO,'#0#0#0'/'#0#0#0#0#0#0#0#30#0#0#0'AND (PPP.IDPESSOA=R.' +
      'IDTITULAX'#0#0#0'3'#0#0#0#0#0#0#0'#'#0#0#0'AND (PAT.IDFUNDACAO = :PIDFUNDACà'#0#0#0#23#0#0#0 +
      'à+T'#7#16#7'6'#8'Left'#20#0#0#0'8'#16#26#6'êu^'#8'T'#0#0#0'AND (P.IDPESSOA=R.IDRECEBEDO,'#0#0#0'+'#0#0#0 +
      #0#0#0#0#27#0#0#0'AND (PPP.FLGDESATIVADO ='#0#0#0#39#0#0#0#0#0#0#0#16#0#0#0'qryRubricaGravar' +
      #0'Ë'#31#11
    Folder = foCustom
    ShowPath = False
    Title = 
      'Navegue na ·rvore de pastas e selecione o caminho desejado para ' +
      'gravaÁ„o dos arquivos.'
    Left = 473
    Top = 2
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 332
    Top = 50
  end
  object dspPortador: TDataSetProvider
    DataSet = qryPortador1
    Constraints = True
    Left = 375
    Top = 88
  end
  object cdsPortador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPortador'
    Left = 404
    Top = 88
  end
  object dsPortador: TwwDataSource
    DataSet = cdsPortador
    Left = 461
    Top = 88
  end
  object dspDocTxt: TDataSetProvider
    DataSet = QryDocTxt1
    Constraints = True
    Left = 121
    Top = 155
  end
  object cdsDocTxt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDocTxt'
    Left = 150
    Top = 155
  end
end
