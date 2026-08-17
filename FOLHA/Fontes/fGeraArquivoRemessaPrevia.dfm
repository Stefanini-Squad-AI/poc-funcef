inherited frmGeraArquivoRemessaPrevia: TfrmGeraArquivoRemessaPrevia
  Left = 365
  Top = 151
  HelpContext = 180013
  Caption = 'Simula geração de Arquivo de Pagamento da Prévia'
  ClientHeight = 439
  ClientWidth = 648
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 648
    Height = 400
    object pgcComponentes: TPageControl
      Left = 1
      Top = 1
      Width = 646
      Height = 398
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
        Caption = 'Opções de Seleção'
        object pnlSelecao: TPanel
          Left = 0
          Top = 0
          Width = 638
          Height = 370
          Align = alClient
          TabOrder = 0
          object grpBanco: TGroupBox
            Left = 1
            Top = 95
            Width = 636
            Height = 160
            Align = alClient
            Caption = ' Selecione o Contas Caixa x Forma de Pagamento e Sequência '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object dbgPortadorForma: TwwDBGrid
              Left = 2
              Top = 15
              Width = 632
              Height = 143
              ControlType.Strings = (
                'SEL;CheckBox;1;0')
              Selected.Strings = (
                'SEL'#9'7'#9'Seleção'
                'CODPORTFORMA'#9'10'#9'Código'
                'DESCRICAO'#9'46'#9'Descrição'
                'SEQDOCUMENTO'#9'10'#9'Sequência')
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
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              OnCalcCellColors = CorParaColunaSelecao
              IndicatorColor = icBlack
              OnFieldChanged = dbgPortadorFormaFieldChanged
            end
          end
          object grpParticip: TGroupBox
            Left = 1
            Top = 255
            Width = 636
            Height = 57
            Align = alBottom
            Caption = 
              ' Selecione um recebedor pela matrícula ou pressionando o botão a' +
              ' direita '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label3: TLabel
              Left = 9
              Top = 15
              Width = 55
              Height = 13
              Caption = 'Matrícula'
            end
            object edNomeAssist: TLabel
              Left = 150
              Top = 15
              Width = 67
              Height = 13
              Caption = 'Recebedor '
            end
            object spbRecebedor: TSpeedButton
              Left = 593
              Top = 22
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
              Top = 27
              Width = 135
              Height = 21
              Color = clInactiveCaption
              Enabled = False
              TabOrder = 0
            end
            object edNome: TEdit
              Left = 150
              Top = 27
              Width = 437
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Color = clInactiveCaption
              Enabled = False
              TabOrder = 1
            end
          end
          object Panel3: TPanel
            Left = 1
            Top = 312
            Width = 636
            Height = 57
            Align = alBottom
            BevelOuter = bvNone
            Caption = 'Panel3'
            TabOrder = 2
            object GroupBox2: TGroupBox
              Left = 9
              Top = 1
              Width = 420
              Height = 50
              Anchors = [akLeft, akTop, akRight]
              Caption = ' Selecione a Pasta onde o arquivo será criado '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object pnlLblDiretorio: TPanel
                Left = 12
                Top = 21
                Width = 370
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                BevelOuter = bvNone
                BorderStyle = bsSingle
                Color = clSilver
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
                Left = 383
                Top = 21
                Width = 27
                Height = 21
                Hint = 'Seleciona a Pasta que será gravado os arquivos para banco'
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
              Left = 436
              Top = 1
              Width = 185
              Height = 50
              Anchors = [akTop, akRight]
              Caption = ' Entre a Previsão Pagamento '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object edDataFolha: TCMDateTimePicker
                Left = 34
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
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 0
              end
            end
          end
          object Panel1: TPanel
            Left = 1
            Top = 1
            Width = 636
            Height = 94
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 3
            object Panel2: TPanel
              Left = 0
              Top = 0
              Width = 161
              Height = 94
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object grpMesRef: TGroupBox
                Left = 5
                Top = 17
                Width = 150
                Height = 64
                Caption = ' Mês e Ano de Referência  '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object spnedAno: TSpinEdit
                  Left = 93
                  Top = 25
                  Width = 50
                  Height = 22
                  EditorEnabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  MaxValue = 2100
                  MinValue = 1950
                  ParentFont = False
                  TabOrder = 1
                  Value = 1950
                  OnChange = spnedAnoChange
                end
                object cmbMes: TComboBox
                  Left = 7
                  Top = 26
                  Width = 84
                  Height = 21
                  Style = csDropDownList
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ItemHeight = 13
                  ParentFont = False
                  TabOrder = 0
                  OnChange = cmbMesChange
                  Items.Strings = (
                    'Janeiro'
                    'Fevereiro'
                    'Março'
                    'Abril'
                    'Maio'
                    'Junho'
                    'Julho'
                    'Agosto'
                    'Setembro'
                    'Outubro'
                    'Novembro'
                    'Dezembro')
                end
              end
            end
            object grpHistorico: TGroupBox
              Left = 161
              Top = 0
              Width = 475
              Height = 94
              Align = alClient
              Caption = 
                ' Selecione a(s) Prévia(s) de Pagamento de Benefícios do mês dese' +
                'jado '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object dbgPrevia: TwwDBGrid
                Left = 2
                Top = 15
                Width = 471
                Height = 77
                ControlType.Strings = (
                  'SEL;CheckBox;1;0')
                Selected.Strings = (
                  'SEL'#9'7'#9'Seleção'
                  'IDLOTE'#9'10'#9'Lote'
                  'MESREFERENCIA'#9'7'#9'Mês'
                  'DESCRICAO'#9'36'#9'Descrição')
                MemoAttributes = []
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
                Align = alClient
                DataSource = dsLote
                EditCalculated = True
                KeyOptions = []
                Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
                TabOrder = 0
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                OnCalcCellColors = CorParaColunaSelecao
                IndicatorColor = icBlack
                OnFieldChanged = dbgPreviaFieldChanged
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
          Width = 630
          Height = 362
          Align = alClient
          TabOrder = 0
          object lbProcessando: TLabel
            Left = 1
            Top = 325
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
            Width = 628
            Height = 324
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 0
            WordWrap = False
          end
          object pBarProcesso: TProgressBar
            Left = 1
            Top = 345
            Width = 628
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
    Top = 400
    Width = 648
    inherited tb97Fundo: TToolbar97
      Left = 9
      DockPos = 11
      inherited sep1: TToolbarSep97
        Left = 435
      end
      inherited sep3: TToolbarSep97
        Left = 519
      end
      inherited bbtnSair: TBitBtn
        Left = 234
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 438
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
        Top = 2
        Width = 117
        Height = 29
        Caption = '&Processar Outro'
        TabOrder = 3
        Visible = False
        OnClick = bbtnOutroClick
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnEnviarArquivo: TBitBtn
        Left = 315
        Top = 0
        Width = 120
        Height = 33
        Caption = '&Enviar Arquivo'
        TabOrder = 4
        OnClick = bbtnEnviarArquivoClick
        Glyph.Data = {
          F2010000424DF201000000000000760000002800000024000000130000000100
          0400000000007C01000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
          3333333333388F3333333333000033334224333333333333338338F333333333
          0000333422224333333333333833338F33333333000033422222243333333333
          83333338F3333333000034222A22224333333338F33F33338F33333300003222
          A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
          38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
          2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
          0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
          333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
          33333A2224A2233333333338F338F83300003333333333A2224A333333333333
          8F338F33000033333333333A222433333333333338F338F30000333333333333
          A224333333333333338F38F300003333333333333A223333333333333338F8F3
          000033333333333333A3333333333333333383330000}
        NumGlyphs = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 535
      DockPos = 537
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
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Title'
        0))
  end
  object qryLote1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 AS SEL, IDLOTE, DESCRICAO, MESREFERENCIA'
      'FROM CTRLINTERFACE'
      'WHERE (FLGIDATMP = 1)'
      'AND (FLGVOLTATMP = 0)'
      'AND (TIPO = '#39'B'#39')'
      'AND (IDREFERENCIA IS NULL)'
      'ORDER BY IDLOTE DESC')
    ValidateWithMask = True
    Left = 606
    Top = 62
  end
  object qryPortador1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 AS SEL, P.CODPORTFORMA, P.DESCRICAO, PV.SEQDOCUMENTO,'
      '       DECODE(B.TIPOCONTA,'#39'4'#39','#39'4'#39','#39'D'#39') AS TIPOCONTA,'
      '       MIN(B.DFLOATPAGTO) AS DFLOATPAGTO,'
      '       MIN(B.DFLOATPAGTOALTER) AS DFLOATPAGTOALTER,'
      '       NVL(P.FLGARQUIVO,'#39'N'#39') AS FLGARQUIVO'
      'FROM PREVIA PV, PORTADORFORMA P, BANCOPORTFORMA B'
      'WHERE (PV.IDLOTE = 1)'
      'AND (PV.CODPORTFORMA = P.CODPORTFORMA)'
      'AND (B.CODPORTFORMA = PV.CODPORTFORMA)'
      'AND (B.IDMODULO = 18)'
      
        'GROUP BY P.CODPORTFORMA, P.DESCRICAO, PV.SEQDOCUMENTO, DECODE(B.' +
        'TIPOCONTA,'#39'4'#39','#39'4'#39','#39'D'#39'), NVL(P.FLGARQUIVO,'#39'N'#39') '
      'ORDER BYNVL(P.FLGARQUIVO,'#39'N'#39') , P.DESCRICAO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 473
    Top = 168
  end
  object qryRecebedor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT G.IDPESSJUR, G.IDPLANOPREV, G.IDTITULAR, G.IDRESPONSAVEL,' +
        ' G.NOME, G.NUMDOCUMENTO,'
      
        '       G.NUMBANCO, G.NUMAGENCIA, G.CONTACORRENTE, G.VALORPROVENT' +
        'O, G.MATRICULA'
      'FROM ('
      
        'SELECT HS.IDPESSJUR, /*HS.IDPLANOPREV*/ PF.IDPLANOPREV, HS.IDTIT' +
        'ULAR, HS.IDRESPONSAVEL, P.NOME, P.NUMDOCUMENTO,'
      
        '       BB.NUMBANCO, AG.NUMAGENCIA, CB.CONTACORRENTE, D.MATRICULA' +
        ','
      '       SUM(DECODE(PR.FLGDESCONTO,0,'
      '                  DECODE(PR.FLGESPECIAL,0,HS.VALORPROVENTO,0),'
      
        '                  DECODE(PR.FLGESPECIAL,0,HS.VALORPROVENTO*-1,0)' +
        ')) VALORPROVENTO'
      
        'FROM PREVIA HS, PROVDESC PR, PESSOA P, CONTABANCARIA CB, AGENCIA' +
        'BANCARIA AG,'
      '     BANCO BB, DEPENTIT D, PERFILINVEST PF'
      'WHERE (HS.IDLOTE = :IDFOLHA)'
      'AND (HS.CODPORTFORMA = :CODPORTFORMA)'
      'AND (HS.SEQDOCUMENTO = :SEQDOCUMENTO)'
      'AND (PR.IDPROVENTO = HS.IDRUBRICA)'
      'AND (PR.FLGESPECIAL = 0)'
      'AND (HS.IDTITULAR = D.IDTITULAR(+))'
      'AND (HS.IDRESPONSAVEL = D.IDPESSOA(+))'
      'AND (HS.IDRESPONSAVEL = P.IDPESSOA)'
      'AND (HS.IDRESPONSAVEL = CB.IDPESSOA)'
      
        'AND ((hs.flgpensaoalim = 2 AND cb.flgcontapref = 1) OR CB.Tipoco' +
        'nta = 2)'
      'AND (CB.IDAGENCIA = AG.IDPESSOA)'
      'AND (AG.IDBANCO = BB.IDPESSOA)'
      'AND (PF.IDPERFILINVEST = HS.IDPERFILINVEST)'
      
        'GROUP BY HS.IDPESSJUR, /*HS.IDPLANOPREV*/ PF.IDPLANOPREV, HS.IDT' +
        'ITULAR, P.NOME, D.MATRICULA, HS.IDRESPONSAVEL,'
      
        '         BB.NUMBANCO, AG.NUMAGENCIA, CB.CONTACORRENTE, P.NUMDOCU' +
        'MENTO'
      ') G'
      'WHERE G.VALORPROVENTO >= 0.01'
      
        'ORDER BY G.NOME, G.IDPESSJUR, G.IDPLANOPREV, G.IDTITULAR, G.IDRE' +
        'SPONSAVEL'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 360
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFOLHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODPORTFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryDocTxt: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 AS IDPESSOA,'
      '       '#39'   '#39' AS NUM_BANCO,'
      '       '#39' '#39' AS COD_REG,'
      '       '#39' '#39' AS SEG,'
      '       '#39' '#39' AS TIP_MOV,'
      '       '#39'  '#39' AS COD_INST,'
      '       '#39'   '#39' AS COD_BAN_D,'
      '       '#39'     '#39' AS COD_AGE_D,'
      '       '#39' '#39'AS DV_AGE_D,'
      '       '#39'            '#39' AS CC_D,'
      '       '#39' '#39' AS DV_CC_D,'
      '       '#39' '#39' AS DV_AGE_CC_D,'
      '       '#39'                              '#39' AS NOME,'
      '       '#39'      '#39' AS NUM_DOC,'
      '       '#39'             '#39' AS FILLER,'
      '       '#39' '#39' AS TP_CONT,'
      '       '#39'        '#39' AS DT_VENC,'
      '       '#39'   '#39' AS TP_MOE,'
      '       '#39'                '#39' AS VALOR,'
      '       '#39'         '#39' AS NUM_DOC_BAN,'
      '       '#39'  '#39' AS QTD_PAR,'
      '       '#39' '#39' AS IND_BLOQ,'
      '       '#39' '#39' AS IND_FORMA_PAR,'
      '       '#39'  '#39' AS PER_VENC,'
      '       '#39'  '#39' AS NUM_PAR,'
      '       '#39'        '#39' AS DT_EFET,'
      '       '#39'                '#39' AS VLR_REAL,'
      '       '#39'                                       '#39' AS INF,'
      '       '#39'  '#39' AS USO_FEBRABAN,'
      '       '#39' '#39' AS EMITE_AVISO,'
      '       '#39'          '#39' AS OCORRENCIAS,'
      '       '#39' '#39' AS TIP_INSCR,'
      '       '#39'              '#39' AS NUM_IDENT,'
      '       '#39'                              '#39' AS LOGRADOURO,'
      '       '#39'     '#39' AS NUMERO,'
      '       '#39'                '#39' AS COMPL,'
      '       '#39'                '#39' AS BAIRRO,'
      '       '#39'                     '#39' AS CIDADE,'
      '       '#39'     '#39' AS CEP,'
      '       '#39'   '#39' AS COMPL_CEP,'
      '       '#39'  '#39' AS UF,'
      '       '#39'                '#39' AS VL_DOC,'
      '       '#39'                '#39' AS VL_ABAT,'
      '       '#39'                '#39' AS VL_DESC,'
      '       '#39'                '#39' AS VL_MORA,'
      '       '#39'                '#39' AS VL_MULTA,'
      '       0 AS CODPORTFORMA,'
      '       '#39'  '#39' AS FORMALANC,'
      '      '#39#39' AS MATRICULA,'
      '      0 AS IDTITULAR'
      '  FROM DUAL'
      ' WHERE (1 = 2)'
      '/*SELECT DISTINCT'
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
      ' '#39'1234567890123456789012345'#39' LIVRE,'
      ' 0 AS IDPLANOPREV'
      'FROM DUAL'
      'WHERE 1 = 2 */'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDoc
    ValidateWithMask = True
    Left = 397
    Top = 62
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
      'AND PCT.CODPORTADOR = PFR.CODPORTADOR'
      ''
      ' ')
    ValidateWithMask = True
    Left = 220
    Top = 2
  end
  object qryDadosRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT UPPER(REGEXP_REPLACE(E.LOGRADOURO, '#39'( *[[:punct:]])'#39', '#39#39')' +
        ') AS LOGRADOURO,'
      
        '       UPPER(REGEXP_REPLACE(E.NUMERO, '#39'( *[[:punct:] [:alpha:] [' +
        ':space:]])'#39', '#39#39')) AS NUMERO,'
      
        '       UPPER(REGEXP_REPLACE(E.COMPLEMENTO, '#39'( *[[:punct:]])'#39', '#39#39 +
        ')) AS COMPLEMENTO,'
      
        '       UPPER(REGEXP_REPLACE(E.BAIRRO, '#39'( *[[:punct:]])'#39', '#39#39')) AS' +
        '  BAIRRO,'
      
        '       UPPER(REGEXP_REPLACE(C.NOME, '#39'( *[[:punct:]])'#39', '#39#39')) AS C' +
        'IDADE,'
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
      'AND PG.DOCPFISICA(+) = D.IDDOCUMENTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 276
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object updDoc: TUpdateSQL
    Left = 192
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
      'Matrícula'
      'Número de Inscrição'
      'Nome do Participante')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N')
    Tabelas.Strings = (
      'PREVIA'
      'ELEGPATRO'
      'PESSOA'
      'PARTPREVPLAN')
    CamposChave.Strings = (
      'PREVIA.IDRESPONSAVEL'
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
    Left = 304
    Top = 2
  end
  object pdirdlgPasta: TProcuraDirDlg
    Caption = 'Seleção de pasta'
    Directory = 
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0
    Folder = foCustom
    ShowPath = False
    Title = 
      'Navegue na árvore de pastas e selecione o caminho desejado para ' +
      'gravação dos arquivos.'
    Left = 473
    Top = 2
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 332
    Top = 50
  end
  object dspDocTxt: TDataSetProvider
    DataSet = QryDocTxt
    Constraints = True
    Left = 424
    Top = 62
  end
  object cdsDocTxt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDocTxt'
    Left = 453
    Top = 62
  end
  object dsPortador: TwwDataSource
    DataSet = cdsPortador
    Left = 501
    Top = 168
  end
  object dsLote: TwwDataSource
    DataSet = cdsLote
    Left = 578
    Top = 62
  end
  object dspLote: TDataSetProvider
    DataSet = qryLote1
    Constraints = True
    Left = 521
    Top = 62
  end
  object cdsLote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLote'
    Left = 550
    Top = 62
    object cdsLoteSEL: TFloatField
      DisplayLabel = 'Seleção'
      DisplayWidth = 7
      FieldName = 'SEL'
    end
    object cdsLoteIDLOTE: TFloatField
      DisplayLabel = 'Lote'
      DisplayWidth = 10
      FieldName = 'IDLOTE'
    end
    object cdsLoteMESREFERENCIA: TStringField
      DisplayLabel = 'Mês'
      DisplayWidth = 7
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object cdsLoteDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 36
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object dspPortador: TDataSetProvider
    DataSet = qryPortador1
    Constraints = True
    Left = 415
    Top = 168
  end
  object cdsPortador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPortador'
    Left = 444
    Top = 168
    object cdsPortadorSEL: TFloatField
      DisplayLabel = 'Seleção'
      DisplayWidth = 7
      FieldName = 'SEL'
    end
    object cdsPortadorCODPORTFORMA: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
    end
    object cdsPortadorDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 46
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsPortadorSEQDOCUMENTO: TFloatField
      DisplayLabel = 'Sequência'
      DisplayWidth = 10
      FieldName = 'SEQDOCUMENTO'
    end
    object cdsPortadorDFLOATPAGTO: TFloatField
      FieldName = 'DFLOATPAGTO'
      Visible = False
    end
    object cdsPortadorDFLOATPAGTOALTER: TFloatField
      FieldName = 'DFLOATPAGTOALTER'
    end
    object cdsPortadorTIPOCONTA: TStringField
      FieldName = 'TIPOCONTA'
      Visible = False
      Size = 1
    end
    object cdsPortadorFLGARQUIVO: TStringField
      FieldName = 'FLGARQUIVO'
      Visible = False
      Size = 1
    end
  end
  object dspTarifaArqPagto: TDataSetProvider
    DataSet = qryTarifaArqPagto
    Constraints = True
    Left = 245
    Top = 158
  end
  object cdsTarifaArqPagto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTarifaArqPagto'
    Left = 274
    Top = 158
  end
  object qryTarifaArqPagto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTARIFAARQPAGTO,'
      '       IDARQUIVOPAGTO,   '
      '       CODDOCARQ,        '
      '       IDPLANOPREV,      '
      '       PERCENTUAL        '
      '  FROM TARIFAARQPAGTO    '
      ' WHERE 1 = 2 ')
    ValidateWithMask = True
    Left = 303
    Top = 158
  end
  object dsTarifaArqPagto: TwwDataSource
    DataSet = cdsTarifaArqPagto
    Left = 331
    Top = 158
  end
  object dspTipoFormaRecPag: TDataSetProvider
    DataSet = qryTipoFormaRecPag
    Constraints = True
    Left = 281
    Top = 226
  end
  object cdsTipoFormaRecPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoFormaRecPag'
    Left = 310
    Top = 226
  end
  object qryTipoFormaRecPag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT TF.FORMALANC                                             ' +
        '         '
      
        '  FROM PORTADORFORMA PF                                         ' +
        '         '
      
        '  JOIN FORMARECPAGXTIPOFORMARECPAG FXF ON FXF.CODFORMA = PF.CODF' +
        'ORMA     '
      
        '  JOIN TIPOFORMARECPAG TF ON TF.IDTIPOFORMARECPAG = FXF.IDTIPOFO' +
        'RMARECPAG'
      ' ')
    ValidateWithMask = True
    Left = 339
    Top = 226
  end
  object dsTipoFormaRecPag: TwwDataSource
    DataSet = cdsTipoFormaRecPag
    Left = 367
    Top = 226
  end
  object dlgEnviarArquivo: TOpenDialog
    DefaultExt = '.rem'
    InitialDir = 'C:\'
    Title = 'Selecionar arquivo de Remessa'
    Left = 554
    Top = 202
  end
end
