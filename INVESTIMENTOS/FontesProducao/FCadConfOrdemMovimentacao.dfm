inherited frmConfOrdemMovimentacao: TfrmConfOrdemMovimentacao
  Left = 222
  Top = 149
  HelpContext = 790276
  Caption = 'Conferência das Ordens de Movimentação'
  ClientHeight = 487
  ClientWidth = 776
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 330
    Top = 84
    Width = 45
    Height = 13
    Caption = 'Carteira'
  end
  inherited pnlFundo: TPanel
    Width = 776
    Height = 401
    object Label1: TLabel
      Left = 10
      Top = 13
      Width = 105
      Height = 13
      Caption = 'Data de Operação'
    end
    object Label2: TLabel
      Left = 10
      Top = 68
      Width = 49
      Height = 13
      Caption = 'Carteira '
    end
    object Label4: TLabel
      Left = 10
      Top = 96
      Width = 107
      Height = 13
      Caption = 'Sigla da Corretora '
    end
    object Label5: TLabel
      Left = 439
      Top = 96
      Width = 130
      Height = 13
      Caption = 'Número do Documento'
      FocusControl = dbDocumento
    end
    object Label6: TLabel
      Left = 439
      Top = 41
      Width = 34
      Height = 13
      Caption = 'Ação '
    end
    object Label8: TLabel
      Left = 439
      Top = 68
      Width = 100
      Height = 13
      Caption = 'Bolsa de Valores '
    end
    object Label12: TLabel
      Left = 10
      Top = 41
      Width = 118
      Height = 13
      Caption = 'Plano/Patrocinadora'
    end
    object Label7: TLabel
      Left = 10
      Top = 123
      Width = 107
      Height = 13
      Caption = 'Tipo de Operação '
    end
    object dblSiglaCorretora: TwwDBLookupCombo
      Left = 130
      Top = 92
      Width = 302
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SGLCORRETVALORES'#9'40'#9'Descrição')
      LookupTable = QryCorretValores
      LookupField = 'IDCORRETVALORES'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnExit = dblCarteiraExit
    end
    object dbDocumento: TDBEdit
      Left = 576
      Top = 92
      Width = 177
      Height = 21
      DataField = 'NUMDOCMOVINV'
      DataSource = DsDetalhe
      Enabled = False
      TabOrder = 7
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 153
      Width = 774
      Height = 247
      ActivePage = TabSheet1
      Align = alBottom
      TabOrder = 8
      object TabSheet1: TTabSheet
        Caption = 'Informações Contábeis '
        TabVisible = False
        object dbgOperacao: TwwDBGrid
          Left = 0
          Top = 62
          Width = 766
          Height = 132
          Selected.Strings = (
            'HORAMOV'#9'5'#9'Hora'
            'STACONFIRMA'#9'7'#9'Confirma'
            'PLANPRVCONTABPATRO'#9'31'#9'Plano/Patro'
            'SGLCUSTODIANTE'#9'10'#9'Custodiante'
            'QTDEORDENADA'#9'14'#9'Qtd. Negociada'
            'PUORDMOVINV'#9'14'#9'Preço'
            'VALOR'#9'18'#9'Valor'
            'OBSAUTMOV'#9'68'#9'Observação')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 1
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Color = clWhite
          DataSource = DsDetalhe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnDblClick = dbgOperacaoDblClick
          OnEnter = dbgOperacaoEnter
          IndicatorColor = icYellow
        end
        object dbgSelecao: TDBGrid
          Left = 0
          Top = -1
          Width = 785
          Height = 40
          Color = clInfoBk
          DataSource = DsDetalhe
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clGray
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'DESCCARTINVEST'
              Title.Alignment = taCenter
              Title.Caption = 'Carteira'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 249
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SGLCORRETVALORES'
              Title.Caption = 'Corretora'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 125
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SIGLATIPOOPER'
              Title.Caption = 'Operação'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCINVESTIMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'Ação'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 199
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SGLBOLSAVALORES'
              Title.Alignment = taCenter
              Title.Caption = 'Bolsa de Valores'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 121
              Visible = True
            end>
        end
        object Panel1: TPanel
          Left = -1
          Top = 38
          Width = 766
          Height = 25
          BevelInner = bvLowered
          Caption = 'Movimentação'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object Panel2: TPanel
          Left = 0
          Top = 195
          Width = 766
          Height = 42
          Align = alBottom
          Enabled = False
          TabOrder = 3
          object Label9: TLabel
            Left = 10
            Top = 3
            Width = 79
            Height = 13
            Caption = 'Qtde. do Lote'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 113
            Top = 3
            Width = 69
            Height = 13
            Caption = 'Qtde.  Atual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 273
            Top = 3
            Width = 82
            Height = 13
            Caption = 'Qtde. Prevista'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 429
            Top = 3
            Width = 107
            Height = 13
            Caption = 'Total da Operação'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object rQtdLote: TRealEdit
            Left = 8
            Top = 18
            Width = 91
            Height = 19
            TabStop = False
            Alignment = taRightJustify
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0')
            ParentFont = False
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
          end
          object rQtdPrevista: TRealEdit
            Left = 271
            Top = 18
            Width = 142
            Height = 19
            TabStop = False
            Alignment = taRightJustify
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            TabOrder = 2
            WordWrap = False
            IntDigits = 18
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object rTotalOperacao: TRealEdit
            Left = 429
            Top = 18
            Width = 155
            Height = 19
            TabStop = False
            Alignment = taRightJustify
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object rQtdAtual: TRealEdit
            Left = 113
            Top = 18
            Width = 142
            Height = 19
            TabStop = False
            Alignment = taRightJustify
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            TabOrder = 1
            WordWrap = False
            IntDigits = 18
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
        end
      end
    end
    object dbDtaOperacao: TCMDateTimePicker
      Left = 130
      Top = 9
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
      OnExit = dbDtaOperacaoExit
    end
    object dblBolsa: TwwDBLookupCombo
      Left = 574
      Top = 64
      Width = 181
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SGLBOLSAVALORES'#9'15'#9'Sigla da Bolsa')
      LookupTable = QryBolsaValores
      LookupField = 'IDBOLSAVALORES'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblCarteiraExit
    end
    object dblAcao: TwwDBLookupCombo
      Left = 483
      Top = 37
      Width = 272
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCINVESTIMENTO'#9'15'#9'Descrição')
      LookupTable = QryInvestimentoAcao
      LookupField = 'IDINVESTIMENTO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnExit = dblAcaoExit
    end
    object dblCarteira: TwwDBLookupCombo
      Left = 130
      Top = 64
      Width = 302
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCARTINVEST'#9'35'#9'Descrição')
      LookupTable = QryBuscaCarteira
      LookupField = 'IDCARTEIRA'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblCarteiraExit
    end
    object dblPlanoPatro: TwwDBLookupCombo
      Left = 130
      Top = 37
      Width = 302
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PLANPRVCONTABPATRO'#9'40'#9'Descrição'#9'F')
      LookupTable = qryPlanoPatro
      LookupField = 'IDPLANPREVCTBPATR'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnExit = dblCarteiraExit
    end
    object dblOperacao: TwwDBLookupCombo
      Left = 130
      Top = 119
      Width = 302
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOOPERACAO'#9'40'#9'Descrição')
      LookupTable = QryBuscaOperacao
      LookupField = 'IDTIPOOPERACAO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnExit = dblCarteiraExit
    end
  end
  inherited Dock972: TDock97
    Width = 776
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 448
    Width = 776
    inherited tb97Fundo: TToolbar97
      Left = 284
      DockPos = 293
      inherited sep1: TToolbarSep97
        Left = 401
      end
      inherited sep3: TToolbarSep97
        Left = 485
      end
      inherited bbtnSair: TBitBtn
        Left = 320
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 404
      end
      object btnTodas: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Todas'
        TabOrder = 2
        OnClick = btnTodasClick
        Kind = bkAll
        Spacing = 2
      end
      object BtnInverte: TBitBtn
        Left = 80
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Inverte'
        ModalResult = 8
        TabOrder = 3
        OnClick = BtnInverteClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333FFF33F333FF3F330E0330FFFCCFCC33777FF7F3377F7730EEE030FFFC
          CFCC377777F7F33773770EEE0000FFFFFCCF777777773F33377FEEE0BFBF0FFF
          FCCF7777333373F337730E0BFBFBF0FFCCFF77733333373F77F330BFBFBFBF0F
          CCFF37F333333F7F773330FBFBFB0B0FFFFF37F3F33F737FFFFF30B0BF0FB000
          000037F73F73F777777730FB0BF0FB0FFFFF373F73F73F7F333F330030BF0F0F
          FF993F77373F737F3377CC33330BF00FFF9977FFF373F77F3F77CC993330009F
          99FF7777F337777F77F333993330F99F99FF3F77FF37F773773F993CC330FFF9
          9F9977F77F37F3377F77993CC330FFF99F997737733733377377}
        NumGlyphs = 2
        Spacing = 2
      end
      object btnNenhuma: TBitBtn
        Left = 160
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Nenhuma'
        ModalResult = 8
        TabOrder = 4
        OnClick = btnNenhumaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        NumGlyphs = 2
        Spacing = 2
      end
      object BtAutConfirma: TBitBtn
        Left = 240
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Confirma'
        Enabled = False
        ModalResult = 8
        TabOrder = 5
        OnClick = BtAutConfirmaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        Spacing = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 115
      DockPos = 124
      Visible = False
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 265
    Top = 7
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 414
    Top = 6
  end
  inherited upd: TUpdateSQL
    Left = 442
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'TRUNC(ORDMOVINV.DATAORDMOVINV) AS DATAORDMOVINV'
      'VWPLANPREVCTBPATR.PLANPRVCONTABPATRO'
      'CARTEIRAINVEST.DESCCARTINVEST '
      'CARTEIRAGERENC.DESCCARTGERENC'
      'CORRETVALORES.SGLCORRETVALORES'
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'ORDMOVINV.NUMDOCMOVINV'
      'BOLSAVALORES.SGLBOLSAVALORES')
    TipodeDado.Strings = (
      'D'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Data da Operação'
      'Plano/Patro'
      'Carteira de Investimento'
      'Carteira Gerencial'
      'Sigla da Corretora'
      'Operação'
      'Ação'
      'Número do Documento'
      'Bolsa de Valores')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ORDMOVINV'
      'CARTEIRAINVEST'
      'CORRETVALORES'
      'INVESTIMENTO'
      'TIPOOPERACAO'
      'BOLSAVALORES'
      'CARTEIRAGERENC'
      'VWPLANPREVCTBPATR')
    CamposChave.Strings = (
      'ORDMOVINV.DATAORDMOVINV'
      'ORDMOVINV.IDCARTEIRAINVEST'
      'ORDMOVINV.IDCORRETVALORES'
      'ORDMOVINV.IDTIPOOPERACAO'
      'ORDMOVINV.IDINVESTIMENTO'
      'ORDMOVINV.IDBOLSAVALORES '
      'ORDMOVINV.IDCARTEIRAGERENC'
      'VWPLANPREVCTBPATR.IDPLANPREVCTBPATR')
    Filtro.Strings = (
      'ORDMOVINV.IDCARTEIRAINVEST = CARTEIRAINVEST.IDCARTEIRAINVEST(+)'
      'ORDMOVINV.IDCORRETVALORES  = CORRETVALORES.IDCORRETVALORES(+)'
      'ORDMOVINV.IDINVESTIMENTO   = INVESTIMENTO.IDINVESTIMENTO(+)'
      'ORDMOVINV.IDTIPOOPERACAO   = TIPOOPERACAO.IDTIPOOPERACAO(+)'
      'ORDMOVINV.IDBOLSAVALORES   = BOLSAVALORES.IDBOLSAVALORES(+)'
      'ORDMOVINV.IDCARTEIRAINVEST = CARTEIRAGERENC.IDCARTEIRAINVEST(+)'
      'ORDMOVINV.IDCARTEIRAINVEST = CARTEIRAGERENC.IDCARTEIRAGERENC(+)'
      'ORDMOVINV.IDTIPOINVEST    <> 8 '
      
        'ORDMOVINV.IDPLANPREVCTBPATR = VWPLANPREVCTBPATR.IDPLANPREVCTBPAT' +
        'R')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '40'
      '40'
      '40'
      '20'
      '20'
      '20'
      '10'
      '20')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 328
    Top = 8
  end
  inherited ImlPadrao: TImageList
    Left = 265
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 265
    Top = 7
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT '#9'IDOPERACAOINVEST, IDCUSTODIANTE, IDCARTEIRAINVEST, IDTIP' +
        'OINVEST,'
      #9'IDTIPOOPERACAO, IDINSTFIN, DATAOPERACAO, NUMDOCUMENTO,'
      #9'QTDEOPERACAO, PRECOUNITOPERACAO, VLROPERACAO, DATAVENCOPER,'
      #9'IDINVESTIMENTO, EMPRESAPROP, IDFORCLI, IDCORRETVALORES,'
      #9'MOECODIGO, IDCARTORIDEST, IDLOTE, IDMODULO, IDINVESTDEST,'
      '                IDORDMOVINV, IDCUSTORIG, IDCUSTDEST,VLRIR'
      ''
      'FROM OPERACAOINVEST'
      ''
      'WHERE IDOPERACAOINVEST = -1')
    Left = 386
    Top = 6
  end
  object QryBuscaCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM VWCARTEIRASRV'
      'ORDER BY DESCCARTINVEST'
      ' ')
    ValidateWithMask = True
    Left = 385
    Top = 103
    object QryBuscaCarteiraIDCARTEIRA: TStringField
      FieldName = 'IDCARTEIRA'
      Origin = 'BASEDADOS.VWCARTEIRASRV.IDCARTEIRA'
      Size = 4
    end
    object QryBuscaCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.VWCARTEIRASRV.IDCARTEIRAINVEST'
    end
    object QryBuscaCarteiraIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Origin = 'BASEDADOS.VWCARTEIRASRV.IDCARTEIRAGERENC'
    end
    object QryBuscaCarteiraDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Origin = 'BASEDADOS.VWCARTEIRASRV.DESCCARTINVEST'
      Size = 60
    end
  end
  object QryCorretValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   CORRETVALORES.IDCORRETVALORES,'
      '   CORRETVALORES.SGLCORRETVALORES'
      'FROM                             '
      '   CORRETVALORES'
      'ORDER BY CORRETVALORES.SGLCORRETVALORES'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 385
    Top = 131
  end
  object QryBuscaOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  TP.IDTIPOOPERACAO, TP.SIGLATIPOOPER, TP.NATUREZAOPERACAO' +
        ',TP.TIPOCUSTODIA,'
      
        '        TP.FLGTRATAIR, TP.IDMERCADO, TP.DESCTIPOOPERACAO, TP.VEN' +
        'CIMENTO,'
      '        PAR.IDTIPOOPERLIQPEND, TP.FLGCONTAINVEST'
      'FROM TIPOOPERACAO TP, PARAMINVEST PAR'
      'WHERE (TP.IDTIPOINVEST = 2)'
      '  AND ((TP.IDTIPOOPERACAO > 0) OR'
      
        '       (TP.IDTIPOOPERACAO IN (-72,-73,-74,-75,-76,-77,-78,-79,-8' +
        '0,-81,-82,-83)))'
      '  AND ((:IDMERCADO IS NULL) OR (TP.IDMERCADO = :IDMERCADO))'
      
        '  AND ((:IDMERCADOOPC IS NULL) OR (TP.IDMERCADO <> :IDMERCADOOPC' +
        '))'
      
        '  AND ((PAR.IDTIPOOPERLIQPEND IS NULL) OR (TP.IDTIPOOPERACAO <> ' +
        'PAR.IDTIPOOPERLIQPEND))'
      '  AND ((TP.FLGOPDIREITO <> '#39'S'#39') OR (TP.FLGOPDIREITO IS NULL))'
      '  AND ((TP.FLGOPGERENC <> '#39'S'#39') OR (TP.FLGOPGERENC IS NULL))'
      '  AND (TP.STAATIVO = '#39'S'#39')'
      'ORDER BY TP.DESCTIPOOPERACAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 385
    Top = 158
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMERCADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMERCADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMERCADOOPC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMERCADOOPC'
        ParamType = ptUnknown
      end>
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT distinct QTDELOTE FROM ACOESXBOLSA')
    ValidateWithMask = True
    Left = 720
    Top = 8
  end
  object DsDetalhe: TwwDataSource
    DataSet = QryDetalhe
    Left = 216
    Top = 288
  end
  object QryInvestimentoAcao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT I.IDINVESTIMENTO, I.DESCINVESTIMENTO, '
      '                                I.IDTIPOINVEST, I.IDEMISSOR'
      ''
      'FROM INVESTIMENTO I'
      ''
      'WHERE I.IDTIPOINVEST = 2'
      ''
      ''
      'ORDER BY I.DESCINVESTIMENTO')
    ValidateWithMask = True
    Left = 708
    Top = 75
    object QryInvestimentoAcaoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 15
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object QryInvestimentoAcaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'INVESTIMENTO.IDTIPOINVEST'
      Visible = False
    end
    object QryInvestimentoAcaoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'INVESTIMENTO.IDEMISSOR'
      Visible = False
    end
    object QryInvestimentoAcaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'INVESTIMENTO.IDINVESTIMENTO'
      Visible = False
    end
  end
  object QryTotalOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 538
    Top = 10
  end
  object updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update ORDMOVINV'
      'set'
      '  IDCORRETVALORES = :IDCORRETVALORES,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  PUORDMOVINV = :PUORDMOVINV,'
      '  OBSMOVINV = :OBSMOVINV,'
      '  DATAORDMOVINV = :DATAORDMOVINV,'
      '  QTDEORDMOVINV = :QTDEORDMOVINV,'
      '  NUMDOCMOVINV = :NUMDOCMOVINV,'
      '  STATMOVINV = :STATMOVINV,'
      '  IDUSUARIO = :IDUSUARIO,'
      '  IDAUTORIZACAO = :IDAUTORIZACAO,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  OBSAUTMOV = :OBSAUTMOV,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC,'
      '  IDLOTE = :IDLOTE,'
      '  IDBOLSAVALORES = :IDBOLSAVALORES,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  QTDEORDENADA = :QTDEORDENADA,'
      '  DATAAUTORIZACAO = :DATAAUTORIZACAO,'
      '  STACONFIRMA = :STACONFIRMA'
      'where'
      '  IDORDMOVINV = :OLD_IDORDMOVINV')
    InsertSQL.Strings = (
      'insert into ORDMOVINV'
      
        '  (IDORDMOVINV, IDCORRETVALORES, IDINVESTIMENTO, PUORDMOVINV, OB' +
        'SMOVINV, '
      
        '   DATAORDMOVINV, QTDEORDMOVINV, NUMDOCMOVINV, STATMOVINV, IDUSU' +
        'ARIO, IDAUTORIZACAO, '
      
        '   TRGDTINCLUSAO, TRGUSERINCLUSAO, IDTIPOINVEST, IDTIPOOPERACAO,' +
        ' OBSAUTMOV, '
      
        '   IDCARTEIRAINVEST, IDCARTEIRAGERENC, IDLOTE, IDBOLSAVALORES, I' +
        'DCUSTODIANTE, '
      '   QTDEORDENADA, DATAAUTORIZACAO, STACONFIRMA)'
      'values'
      
        '  (:IDORDMOVINV, :IDCORRETVALORES, :IDINVESTIMENTO, :PUORDMOVINV' +
        ', :OBSMOVINV, '
      
        '   :DATAORDMOVINV, :QTDEORDMOVINV, :NUMDOCMOVINV, :STATMOVINV, :' +
        'IDUSUARIO, '
      
        '   :IDAUTORIZACAO, :TRGDTINCLUSAO, :TRGUSERINCLUSAO, :IDTIPOINVE' +
        'ST, :IDTIPOOPERACAO, '
      
        '   :OBSAUTMOV, :IDCARTEIRAINVEST, :IDCARTEIRAGERENC, :IDLOTE, :I' +
        'DBOLSAVALORES, '
      
        '   :IDCUSTODIANTE, :QTDEORDENADA, :DATAAUTORIZACAO, :STACONFIRMA' +
        ')')
    DeleteSQL.Strings = (
      'delete from ORDMOVINV'
      'where'
      '  IDORDMOVINV = :OLD_IDORDMOVINV')
    Left = 138
    Top = 288
  end
  object QrySubTipo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'IDOPERACAOINVEST, IDBOLSAVALORES, IDACAO, '
      #9'IDEMISSOR, DATAULTOPERACAO, NOVODIREITO, NUMCLIENTECORRET '
      ''
      'FROM OPRACAO '
      ''
      'WHERE IDOPERACAOINVEST =:IDOPERACAOINVEST')
    UpdateObject = updSubTipo
    ValidateWithMask = True
    Left = 405
    Top = 300
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object DsSubTipo: TwwDataSource
    AutoEdit = False
    DataSet = QrySubTipo
    Left = 434
    Top = 300
  end
  object updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update OPRACAO'
      'set'
      '  IDBOLSAVALORES = :IDBOLSAVALORES,'
      '  IDACAO = :IDACAO,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  DATAULTOPERACAO = :DATAULTOPERACAO,'
      '  NOVODIREITO = :NOVODIREITO,'
      '  NUMCLIENTECORRET = :NUMCLIENTECORRET'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    InsertSQL.Strings = (
      'insert into OPRACAO'
      '  (IDOPERACAOINVEST, IDBOLSAVALORES, IDACAO, IDEMISSOR, '
      'DATAULTOPERACAO, '
      '   NOVODIREITO, NUMCLIENTECORRET)'
      'values'
      '  (:IDOPERACAOINVEST, :IDBOLSAVALORES, :IDACAO, :IDEMISSOR, '
      ':DATAULTOPERACAO, '
      '   :NOVODIREITO, :NUMCLIENTECORRET)')
    DeleteSQL.Strings = (
      'delete from OPRACAO'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 361
    Top = 300
  end
  object QryBolsaValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBOLSAVALORES, SGLBOLSAVALORES, MOECODIGO, IDCUSTODIANTE'
      ''
      'FROM BOLSAVALORES'
      ''
      'ORDER BY SGLBOLSAVALORES '
      '')
    ValidateWithMask = True
    Left = 708
    Top = 103
    object QryBolsaValoresSGLBOLSAVALORES: TStringField
      DisplayLabel = 'Sigla da Bolsa'
      DisplayWidth = 15
      FieldName = 'SGLBOLSAVALORES'
      Origin = 'BOLSAVALORES.SGLBOLSAVALORES'
      Size = 10
    end
    object QryBolsaValoresIDBOLSAVALORES: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDBOLSAVALORES'
      Origin = 'BOLSAVALORES.IDBOLSAVALORES'
      Visible = False
    end
    object QryBolsaValoresMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'BOLSAVALORES.MOECODIGO'
      Visible = False
    end
    object QryBolsaValoresIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BOLSAVALORES.IDCUSTODIANTE'
      Visible = False
    end
  end
  object QryBuscaCustodiante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  CUS.IDCUSTODIANTE, CUS.SGLCUSTODIANTE'
      ''
      'FROM CUSTODIANTE CUS'
      ''
      'ORDER BY CUS.SGLCUSTODIANTE')
    ValidateWithMask = True
    Left = 632
    Top = 9
    object QryBuscaCustodianteSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 11
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
    object QryBuscaCustodianteIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Origin = 'CUSTODIANTE.IDCUSTODIANTE'
      Visible = False
    end
  end
  object QryNumDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT                                                          ' +
        ' '
      
        '  NUMDOCMOVINV                                                  ' +
        ' '
      
        'FROM                                                            ' +
        ' '
      
        '  ORDMOVINV                                                     ' +
        ' '
      'WHERE'
      
        '   ((:DATAORDMOVINV IS NULL)        OR (TRUNC(ORDMOVINV.DATAORDM' +
        'OVINV) = TO_DATE(:DATAORDMOVINV,'#39'DD/MM/YYYY'#39')))'
      
        '   AND ((:IDCARTEIRAINVEST IS NULL) OR (ORDMOVINV.IDCARTEIRAINVE' +
        'ST = :IDCARTEIRAINVEST))')
    ValidateWithMask = True
    Left = 724
    Top = 131
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAORDMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAORDMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryDetalhe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  ORDMOVINV.IDORDMOVINV ,'
      '  ORDMOVINV.IDCORRETVALORES,'
      '  ORDMOVINV.IDINVESTIMENTO,'
      '  ORDMOVINV.PUORDMOVINV,'
      '  ORDMOVINV.OBSMOVINV,'
      '  ORDMOVINV.DATAORDMOVINV,'
      '  ORDMOVINV.QTDEORDMOVINV,'
      '  ORDMOVINV.NUMDOCMOVINV,'
      '  ORDMOVINV.STATMOVINV,'
      '  ORDMOVINV.IDUSUARIO,'
      '  ORDMOVINV.IDAUTORIZACAO,'
      '  ORDMOVINV.TRGDTINCLUSAO,'
      '  ORDMOVINV.TRGUSERINCLUSAO,'
      '  ORDMOVINV.IDTIPOINVEST,'
      '  ORDMOVINV.IDTIPOOPERACAO,'
      '  ORDMOVINV.OBSAUTMOV,'
      '  ORDMOVINV.IDCARTEIRAINVEST,'
      '  ORDMOVINV.IDCARTEIRAGERENC,'
      '  ORDMOVINV.IDLOTE,'
      '  ORDMOVINV.IDBOLSAVALORES,'
      '  ORDMOVINV.IDCUSTODIANTE,'
      '  ORDMOVINV.QTDEORDENADA,'
      '  ORDMOVINV.DATAAUTORIZACAO,'
      '  TO_CHAR(ORDMOVINV.DATAORDMOVINV, '#39'HH24:MM'#39') AS HORAMOV,'
      '  (((PUORDMOVINV*QTDEORDENADA)/QTDELOTE)-0.0049) AS VALOR,'
      '  CARTEIRAINVEST.DESCCARTINVEST,'
      '  CORRETVALORES.SGLCORRETVALORES,'
      '  TIPOOPERACAO.DESCTIPOOPERACAO,'
      '  TIPOOPERACAO.SIGLATIPOOPER,'
      '  INVESTIMENTO.DESCINVESTIMENTO,'
      '  BOLSAVALORES.SGLBOLSAVALORES,'
      '  TIPOOPERACAO.NATUREZAOPERACAO,'
      '  ORDMOVINV.STACONFIRMA,'
      '  BOLETA.IDBOLETA,'
      '  BOLETA.STATUS,'
      '  VWPLANPREVCTBPATR.PLANPRVCONTABPATRO'
      'FROM'
      
        '  ORDMOVINV, VWCARTEIRASRV CARTEIRAINVEST, CORRETVALORES, INVEST' +
        'IMENTO, BOLSAVALORES, TIPOOPERACAO, BOLETA, ACOESXBOLSA, VWPLANP' +
        'REVCTBPATR'
      
        'WHERE ((:DATAORDMOVINV IS NULL)         OR (TRUNC(ORDMOVINV.DATA' +
        'ORDMOVINV) = TO_DATE(:DATAORDMOVINV,'#39'DD/MM/YYYY'#39')))'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (ORDMOVINV.IDPLANPREVCTBP' +
        'ATR = :IDPLANPREVCTBPATR))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL)  OR (ORDMOVINV.IDCARTEIRAINVE' +
        'ST = :IDCARTEIRAINVEST))'
      '   AND ((:IDCARTEIRAGERENC IS NULL) OR'
      
        '       ((SIGN(:IDCARTEIRAGERENC) = 0) AND (ORDMOVINV.IDCARTEIRAG' +
        'ERENC IS NULL)) OR'
      
        '       ((SIGN(:IDCARTEIRAGERENC) = 1) AND (ORDMOVINV.IDCARTEIRAG' +
        'ERENC = :IDCARTEIRAGERENC) ) )'
      
        '  AND ((:IDCORRETVALORES IS NULL)   OR (ORDMOVINV.IDCORRETVALORE' +
        'S  = :IDCORRETVALORES))'
      
        '  AND ((:IDTIPOOPERACAO IS NULL)    OR (ORDMOVINV.IDTIPOOPERACAO' +
        '   = :IDTIPOOPERACAO))'
      
        '  AND ((:IDINVESTIMENTO IS NULL)    OR (ORDMOVINV.IDINVESTIMENTO' +
        '   = :IDINVESTIMENTO))'
      
        '  AND ((:IDBOLSAVALORES IS NULL)    OR (ORDMOVINV.IDBOLSAVALORES' +
        '   = :IDBOLSAVALORES))'
      '   AND (ORDMOVINV.IDTIPOINVEST       <> 8)'
      
        '  AND (VWPLANPREVCTBPATR.IDPLANPREVCTBPATR = ORDMOVINV.IDPLANPRE' +
        'VCTBPATR)'
      
        '  AND (CARTEIRAINVEST.IDCARTEIRAINVEST(+) = ORDMOVINV.IDCARTEIRA' +
        'INVEST)'
      
        '  AND (NVL(CARTEIRAINVEST.IDCARTEIRAGERENC,0) = NVL(ORDMOVINV.ID' +
        'CARTEIRAGERENC,0))'
      
        '  AND (CORRETVALORES.IDCORRETVALORES   = ORDMOVINV.IDCORRETVALOR' +
        'ES)'
      
        '  AND (INVESTIMENTO.IDINVESTIMENTO     = ORDMOVINV.IDINVESTIMENT' +
        'O)'
      
        '  AND (BOLSAVALORES.IDBOLSAVALORES     = ORDMOVINV.IDBOLSAVALORE' +
        'S)'
      
        '  AND (TIPOOPERACAO.IDTIPOOPERACAO     = ORDMOVINV.IDTIPOOPERACA' +
        'O)'
      '   AND (ORDMOVINV.NUMDOCMOVINV          = BOLETA.IDBOLETA(+))'
      
        '  AND (ACOESXBOLSA.IDBOLSAVALORES(+)   = ORDMOVINV.IDBOLSAVALORE' +
        'S)'
      
        '  AND (ACOESXBOLSA.IDACAO(+)           = ORDMOVINV.IDINVESTIMENT' +
        'O)'
      
        'ORDER BY VWPLANPREVCTBPATR.PLANPRVCONTABPATRO, CORRETVALORES.SGL' +
        'CORRETVALORES, INVESTIMENTO.DESCINVESTIMENTO, ORDMOVINV.IDORDMOV' +
        'INV'
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    UpdateObject = updDetalhe
    ControlType.Strings = (
      'STATMOVINV;CheckBox;A;P'
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 176
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAORDMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAORDMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBOLSAVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBOLSAVALORES'
        ParamType = ptUnknown
      end>
    object QryDetalheHORAMOV: TStringField
      DisplayLabel = 'Hora'
      DisplayWidth = 5
      FieldName = 'HORAMOV'
      Size = 5
    end
    object QryDetalheSTACONFIRMA: TStringField
      DisplayLabel = 'Confirma'
      DisplayWidth = 7
      FieldName = 'STACONFIRMA'
      OnChange = QryDetalheSTACONFIRMAChange
      Size = 1
    end
    object QryDetalhePLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano/Patro'
      DisplayWidth = 31
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QryDetalheSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'SGLCUSTODIANTE'
      LookupDataSet = QryBuscaCustodiante
      LookupKeyFields = 'IDCUSTODIANTE'
      LookupResultField = 'SGLCUSTODIANTE'
      KeyFields = 'IDCUSTODIANTE'
      Size = 40
      Lookup = True
    end
    object QryDetalheQTDEORDENADA: TFloatField
      DisplayLabel = 'Qtd. Negociada'
      DisplayWidth = 14
      FieldName = 'QTDEORDENADA'
      Origin = 'ORDMOVINV.QTDEORDENADA'
      DisplayFormat = '###,###,###,###'
    end
    object QryDetalhePUORDMOVINV: TFloatField
      DisplayLabel = 'Preço'
      DisplayWidth = 14
      FieldName = 'PUORDMOVINV'
      Origin = 'ORDMOVINV.PUORDMOVINV'
      DisplayFormat = '###,###,###,########0.00000000'
    end
    object QryDetalheVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 18
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryDetalheOBSAUTMOV: TStringField
      DisplayLabel = 'Observação'
      DisplayWidth = 68
      FieldName = 'OBSAUTMOV'
      Origin = 'ORDMOVINV.OBSAUTMOV'
      Size = 200
    end
    object QryDetalheIDCARTEIRAGERENC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object QryDetalheSTATMOVINV: TStringField
      DisplayLabel = 'Autoriza'
      DisplayWidth = 6
      FieldName = 'STATMOVINV'
      Origin = 'ORDMOVINV.STATMOVINV'
      Visible = False
      Size = 1
    end
    object QryDetalheQTDEORDMOVINV: TFloatField
      DisplayLabel = 'Quantidade Negociada'
      DisplayWidth = 18
      FieldName = 'QTDEORDMOVINV'
      Origin = 'ORDMOVINV.QTDEORDMOVINV'
      Visible = False
    end
    object QryDetalheIDCUSTODIANTE: TFloatField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 15
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object QryDetalheIDORDMOVINV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDORDMOVINV'
      Origin = 'ORDMOVINV.IDORDMOVINV'
      Visible = False
    end
    object QryDetalheIDCORRETVALORES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCORRETVALORES'
      Origin = 'ORDMOVINV.IDCORRETVALORES'
      Visible = False
    end
    object v: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'ORDMOVINV.IDINVESTIMENTO'
      Visible = False
    end
    object QryDetalheOBSMOVINV: TStringField
      DisplayWidth = 200
      FieldName = 'OBSMOVINV'
      Origin = 'ORDMOVINV.OBSMOVINV'
      Visible = False
      Size = 200
    end
    object QryDetalheDATAORDMOVINV: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DATAORDMOVINV'
      Origin = 'ORDMOVINV.DATAORDMOVINV'
      Visible = False
    end
    object QryDetalheNUMDOCMOVINV: TStringField
      DisplayWidth = 30
      FieldName = 'NUMDOCMOVINV'
      Origin = 'ORDMOVINV.NUMDOCMOVINV'
      Visible = False
      Size = 30
    end
    object QryDetalheIDUSUARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUSUARIO'
      Origin = 'ORDMOVINV.IDUSUARIO'
      Visible = False
    end
    object QryDetalheIDAUTORIZACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDAUTORIZACAO'
      Origin = 'ORDMOVINV.IDAUTORIZACAO'
      Visible = False
    end
    object QryDetalheTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'ORDMOVINV.TRGDTINCLUSAO'
      Visible = False
    end
    object QryDetalheTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'ORDMOVINV.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryDetalheIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'ORDMOVINV.IDTIPOINVEST'
      Visible = False
    end
    object QryDetalheIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'ORDMOVINV.IDTIPOOPERACAO'
      Visible = False
    end
    object QryDetalheIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'ORDMOVINV.IDCARTEIRAINVEST'
      Visible = False
    end
    object QryDetalheIDLOTE: TStringField
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Origin = 'ORDMOVINV.IDLOTE'
      Visible = False
      Size = 10
    end
    object QryDetalheDATAAUTORIZACAO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DATAAUTORIZACAO'
      Origin = 'ORDMOVINV.DATAAUTORIZACAO'
      Visible = False
    end
    object QryDetalheIDBOLSAVALORES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBOLSAVALORES'
      Visible = False
    end
    object StringField9: TStringField
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Visible = False
      Size = 60
    end
    object StringField10: TStringField
      DisplayWidth = 10
      FieldName = 'SGLCORRETVALORES'
      Visible = False
      Size = 10
    end
    object StringField11: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Visible = False
      Size = 60
    end
    object StringField12: TStringField
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Visible = False
      Size = 60
    end
    object StringField13: TStringField
      DisplayWidth = 10
      FieldName = 'SGLBOLSAVALORES'
      Visible = False
      Size = 10
    end
    object StringField14: TStringField
      DisplayWidth = 4
      FieldName = 'SIGLATIPOOPER'
      Visible = False
      Size = 4
    end
    object QryDetalheNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      Size = 1
    end
    object QryDetalheIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Visible = False
      Size = 30
    end
    object QryDetalheSTATUS: TStringField
      FieldName = 'STATUS'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qryPlanoPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM VWPLANPREVCTBPATR'
      'ORDER BY PLANPRVCONTABPATRO'
      '')
    ValidateWithMask = True
    Left = 385
    Top = 76
  end
end
