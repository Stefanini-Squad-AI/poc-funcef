inherited frmExecBaixaBem: TfrmExecBaixaBem
  Left = 7
  Top = 84
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Baixa Parcial (Baixa de Bens)'
  ClientHeight = 421
  ClientWidth = 764
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 764
    Height = 382
    object pgcBens: TPageControl
      Left = 1
      Top = 53
      Width = 762
      Height = 328
      ActivePage = tbsBens
      Align = alClient
      TabOrder = 1
      object tbsBens: TTabSheet
        Caption = 'Bens'
        object Bevel1: TBevel
          Left = 16
          Top = 114
          Width = 713
          Height = 2
          Shape = bsTopLine
        end
        object Dock973: TDock97
          Left = 0
          Top = 0
          Width = 754
          Height = 31
          AllowDrag = False
          BoundLines = [blTop, blBottom, blLeft, blRight]
          object tb97BotoesDetalhe: TToolbar97
            Left = 0
            Top = 0
            Caption = 'tb97BotoesDetalhe'
            DockPos = 0
            TabOrder = 0
            object sbtnInserir: TSpeedButton
              Left = 0
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Inserir novo registro|'
              AllowAllUp = True
              GroupIndex = 1
              Enabled = False
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
                0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
                33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
                B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                3BB33773333773333773B333333B3333333B7333333733333337}
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              Visible = False
            end
            object sbtnAlterar: TSpeedButton
              Left = 50
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Alterar o registro selecionado|'
              AllowAllUp = True
              GroupIndex = 1
              Enabled = False
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
                000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
                00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
                F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
                0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
                FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
                FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
                0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
                00333377737FFFFF773333303300000003333337337777777333}
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              Visible = False
            end
            object sbtnApagar: TSpeedButton
              Left = 25
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Remover o registro selecionado'
              AllowAllUp = True
              GroupIndex = 1
              Layout = blGlyphTop
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              Visible = False
            end
            object spdSelecionar: TSpeedButton
              Left = 75
              Top = 0
              Width = 26
              Height = 25
              Hint = 'Remover o registro selecionado'
              AllowAllUp = True
              GroupIndex = 1
              Enabled = False
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
              Layout = blGlyphTop
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              OnClick = spdSelecionarClick
            end
          end
        end
        object pnlDetalhe: TPanel
          Left = 16
          Top = 120
          Width = 721
          Height = 169
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object Label36: TLabel
            Left = 0
            Top = 42
            Width = 113
            Height = 13
            Caption = 'Nº de Tombamento '
          end
          object Label49: TLabel
            Left = 0
            Top = 82
            Width = 35
            Height = 13
            Caption = 'Grupo'
          end
          object Label48: TLabel
            Left = 136
            Top = 42
            Width = 58
            Height = 13
            Caption = 'Descrição'
          end
          object Label6: TLabel
            Left = 256
            Top = 82
            Width = 106
            Height = 13
            Caption = 'Valor OM de Baixa'
          end
          object Label4: TLabel
            Left = 424
            Top = 82
            Width = 39
            Height = 13
            Caption = 'Moeda'
          end
          object Label2: TLabel
            Left = 560
            Top = 82
            Width = 83
            Height = 13
            Caption = 'Valor de Baixa'
          end
          object Label14: TLabel
            Left = 0
            Top = 122
            Width = 52
            Height = 13
            Caption = 'Debitado'
          end
          object Label3: TLabel
            Left = 488
            Top = 2
            Width = 105
            Height = 13
            Caption = 'Data da Operação'
          end
          object Label7: TLabel
            Left = 608
            Top = 2
            Width = 98
            Height = 13
            Caption = 'Data Vencimento'
          end
          object lblLucroPreju: TLabel
            Left = 248
            Top = 2
            Width = 160
            Height = 13
            Caption = 'Rubrica do Lucro / Prejuízo'
          end
          object Label42: TLabel
            Left = 0
            Top = 2
            Width = 103
            Height = 13
            Caption = 'Tipo de Operação'
          end
          object Label8: TLabel
            Left = 360
            Top = 122
            Width = 75
            Height = 13
            Caption = 'Observações'
          end
          object DBedtPlaca: TDBEdit
            Left = 0
            Top = 56
            Width = 122
            Height = 21
            DataField = 'PLACA'
            DataSource = ds
            Enabled = False
            TabOrder = 4
          end
          object DBedtDescricaoBem: TDBEdit
            Left = 136
            Top = 56
            Width = 577
            Height = 21
            DataField = 'DESBEM'
            DataSource = ds
            Enabled = False
            TabOrder = 5
          end
          object DBEdit1: TDBEdit
            Left = 0
            Top = 96
            Width = 241
            Height = 21
            DataField = 'Grupo'
            DataSource = ds
            Enabled = False
            TabOrder = 6
          end
          object DBcboMoeda: TwwDBLookupCombo
            Left = 424
            Top = 96
            Width = 121
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOESIGLA'#9'10'#9'MOESIGLA')
            LookupTable = qryLookMoeda
            LookupField = 'MOECODIGO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 8
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnExit = edtVlrOMExit
          end
          object DBcboForCliOper: TwwDBLookupCombo
            Left = 0
            Top = 136
            Width = 345
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME')
            LookupTable = qryLookForCli
            LookupField = 'IDFORCLI'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 10
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object edtVlrOM: TRealEdit
            Left = 256
            Top = 96
            Width = 153
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 7
            WordWrap = False
            OnExit = edtVlrOMExit
            IntDigits = 15
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edtVlr: TRealEdit
            Left = 560
            Top = 96
            Width = 153
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 9
            WordWrap = False
            IntDigits = 15
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edtDataVenc: TCMDateTimePicker
            Left = 608
            Top = 16
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
          object edtDataOper: TCMDateTimePicker
            Left = 488
            Top = 16
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
            OnExit = edtDataOperExit
          end
          object DBcboLucroPreju: TwwDBLookupCombo
            Left = 248
            Top = 16
            Width = 225
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCTIPODESPINV'#9'60'#9'DESCTIPODESPINV')
            LookupTable = qryLookTipoDespesa
            LookupField = 'IDTIPODESPINVEST'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object DBcboTipoOper: TwwDBLookupCombo
            Left = 0
            Top = 16
            Width = 233
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCTIPOOPERACAO'#9'60'#9'DESCTIPOOPERACAO')
            LookupTable = qryLookTipoOper
            LookupField = 'IDTIPOOPERACAO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnCloseUp = DBcboTipoOperCloseUp
          end
          object edtObservacao: TEdit
            Left = 360
            Top = 136
            Width = 353
            Height = 21
            TabOrder = 11
          end
        end
        object DBgrd: TwwDBGrid
          Left = 0
          Top = 32
          Width = 745
          Height = 73
          Selected.Strings = (
            'PLACA'#9'12'#9'Nº Tombamento'
            'DESBEM'#9'53'#9'Descrição do Bem'
            'Grupo'#9'22'#9'Grupo')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = ds
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = DBgrdCalcCellColors
          OnDblClick = spdSelecionarClick
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdTopRowChanged
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 762
      Height = 52
      Align = alTop
      TabOrder = 0
      object Label5: TLabel
        Left = 16
        Top = 8
        Width = 80
        Height = 13
        Caption = 'Imóvel Mestre'
      end
      object Label1: TLabel
        Left = 336
        Top = 8
        Width = 38
        Height = 13
        Caption = 'Imóvel'
      end
      object btnBuscaImovel: TBitBtn
        Left = 712
        Top = 21
        Width = 24
        Height = 22
        TabOrder = 0
        OnClick = btnBuscaImovelClick
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
      object edtNomeMestre: TEdit
        Left = 16
        Top = 22
        Width = 321
        Height = 21
        TabOrder = 1
      end
      object edtNomeImovel: TEdit
        Left = 336
        Top = 22
        Width = 377
        Height = 21
        TabOrder = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 382
    Width = 764
    inherited tb97Fundo: TToolbar97
      Left = 537
      DockPos = 537
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 368
      DockPos = 368
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
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
  object qry: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IXB.IDBEM, IXB.IDIMOVEL, IXB.IDPESSOA, IXB.IXBGRUPO,'
      '   B.PLACA, B.DESBEM'
      'FROM'
      '   IMOVELXBEM IXB, BEM B'
      'WHERE'
      '   ( IXB.IDPESSOA =:EMPRESAPROP )'
      '   AND ( IXB.IDIMOVEL =:IMOVEL )'
      '   AND ( IXB.IDBEM = B.IDBEM )'
      '')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 224
    Top = 19
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end>
    object qryPLACA: TFloatField
      DisplayLabel = 'Nº Tombamento'
      DisplayWidth = 12
      FieldName = 'PLACA'
      Origin = 'BEM.PLACA'
    end
    object qryDESBEM: TStringField
      DisplayLabel = 'Descrição do Bem'
      DisplayWidth = 53
      FieldName = 'DESBEM'
      Origin = 'BEM.DESBEM'
      Size = 200
    end
    object qryGrupo: TStringField
      DisplayWidth = 22
      FieldKind = fkCalculated
      FieldName = 'Grupo'
      Calculated = True
    end
    object qryIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'IMOVELXBEM.IDBEM'
      Visible = False
    end
    object qryIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'IMOVELXBEM.IDIMOVEL'
      Visible = False
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'IMOVELXBEM.IDPESSOA'
      Visible = False
    end
    object qryIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      Origin = 'IMOVELXBEM.IXBGRUPO'
      Visible = False
      Size = 1
    end
  end
  object qryLookTipoOper: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOINVEST, IDTIPOOPERACAO, '
      '   DESCTIPOOPERACAO, RECPAG, NATUREZAOPERACAO,'
      '   FLGGERACAF, FLGGERACAPCAR'
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '   ( IDTIPOINVEST = 3 )'
      '   AND ( RECPAG <> '#39'P'#39' )'
      'ORDER BY'
      '   DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 440
    Top = 30
    object qryLookTipoOperDESCTIPOOPERACAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryLookTipoOperIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOOPERACAO.IDTIPOINVEST'
      Visible = False
    end
    object qryLookTipoOperIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
    object qryLookTipoOperRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPOOPERACAO.RECPAG'
      Visible = False
      Size = 1
    end
    object qryLookTipoOperNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPOOPERACAO.NATUREZAOPERACAO'
      Size = 1
    end
    object qryLookTipoOperFLGGERACAF: TFloatField
      FieldName = 'FLGGERACAF'
      Origin = '"CM.TIPOOPERACAO".FLGGERACAF'
    end
    object qryLookTipoOperFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Origin = 'TIPOOPERACAO.FLGGERACAPCAR'
    end
  end
  object qryLookTipoDespesa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TD.IDTIPODESPINVEST, TD.DESCTIPODESPINV, TD.NATUREZAOPERACAO,'
      '   TP.IDTIPOOPERACAO,'
      '   DX.RECPAG'
      'FROM'
      '   TIPODESPINVEST TD,'
      '   TIPOOPERACAO TP, DESPESASXTIPOOPER DX'
      'WHERE'
      '   ( TP.IDTIPOINVEST = 3 )'
      '   AND ( TD.NATUREZAOPERACAO IN ('#39'O'#39', '#39'U'#39') )'
      '   AND ( TP.IDTIPOOPERACAO =:TIPOOPER )'
      '   AND ( TP.IDTIPOOPERACAO = DX.IDTIPOOPERACAO )'
      '   AND ( DX.IDTIPODESPINVEST = TD.IDTIPODESPINVEST )'
      'ORDER BY'
      '  TD.DESCTIPODESPINV'
      '')
    ValidateWithMask = True
    Left = 440
    Top = 18
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPOOPER'
        ParamType = ptUnknown
      end>
    object qryLookTipoDespesaIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
    end
    object qryLookTipoDespesaDESCTIPODESPINV: TStringField
      FieldName = 'DESCTIPODESPINV'
      Size = 60
    end
    object qryLookTipoDespesaNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Size = 1
    end
    object qryLookTipoDespesaIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryLookTipoDespesaRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update IMOVELXBEM'
      'set'
      '  IDIMOVEL = :IDIMOVEL,'
      '  IDBEM = :IDBEM,'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDIMOVEL = :OLD_IDIMOVEL and'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into IMOVELXBEM'
      '  (IDIMOVEL, IDBEM, IDPESSOA)'
      'values'
      '  (:IDIMOVEL, :IDBEM, :IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from IMOVELXBEM'
      'where'
      '  IDIMOVEL = :OLD_IDIMOVEL and'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 192
    Top = 19
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 256
    Top = 19
  end
  object qryLookMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  MOECODIGO, MOEDESC, MOESIGLA'
      'FROM'
      '  MOEDA'
      'ORDER BY '
      '  MOESIGLA')
    ValidateWithMask = True
    Left = 552
    Top = 30
    object qryLookMoedaMOESIGLA: TStringField
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryLookMoedaMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryLookMoedaMOEDESC: TStringField
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Visible = False
    end
  end
  object qryInsertRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO DESPOPERINVEST'
      '   ('
      '   IDDESPOPERINVEST, MOECODIGO, IDFORCLI,'
      '   EMPRESAPROP, IDREGRACALCUSADA, IDTIPOINVEST,'
      '   IDTIPOOPERACAO, IDTIPODESPINVEST, IDOPERACAOINVEST,'
      '   VLRDESPOPER, DATAVENCDESPOPER, IDREGRAVENCUSADA,'
      '   FLGCALCDIARIO, VLRDESPOPEROM, DATAOPERACAO'
      '   )'
      'VALUES'
      '   ('
      '   :IDRUBRICA, :MOEDA, :FORCLI,'
      '   :EMPRESAPROP, NULL, 3,'
      '   :TIPOOPER, :TIPORUBRICA, :IDOPERACAO,'
      '   :VALOR, :DATAVENC, NULL,'
      '   0, :VALOROM, :DATAOPER'
      '   )')
    ValidateWithMask = True
    Left = 656
    Top = 31
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPORUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAVENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOROM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAOPER'
        ParamType = ptUnknown
      end>
  end
  object qryLookForCli: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  E.IDFORCLI, E.IDPESSOA, P.NOME'
      'FROM'
      '  EMPRESACLIENTE E, PESSOA P'
      'WHERE'
      '  ( E.IDPESSOA =:EMPRESAPROP )'
      '  AND ( E.IDFORCLI = P.IDPESSOA )'
      'ORDER BY'
      '  P.NOME')
    ValidateWithMask = True
    Left = 552
    Top = 18
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryLookForCliNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object qryLookForCliIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object qryLookForCliIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
  end
  object qryInsertOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO OPERACAOINVEST'
      '   ('
      '   IDOPERACAOINVEST, IDINVESTIMENTO, EMPRESAPROP,'
      '   IDCARTEIRAINVEST, IDTIPOINVEST, IDTIPOOPERACAO,'
      '   DATAOPERACAO, NUMDOCUMENTO, QTDEOPERACAO,'
      '   PRECOUNITOPERACAO, VLROPERACAO, IDCUSTODIANTE,'
      '   IDINSTFIN, DATAVENCOPER, IDFORCLI, VLROPERACAOOM,'
      '   MOECODIGO, OBSERVACAO'
      '   )'
      'VALUES'
      '   ('
      '   :IDOPERACAOINVEST, :IDINVESTIMENTO, :EMPRESAPROP,'
      '   :IDCARTEIRAINVEST, :IDTIPOINVEST, :IDTIPOOPERACAO,'
      '   :DATAOPERACAO, :NUMDOCUMENTO, :QTDEOPERACAO,'
      '   :PRECOUNITOPERACAO, :VLROPERACAO, :IDCUSTODIANTE,'
      '   :IDINSTFIN, :DATAVENCOPER, :IDFORCLI, :VLROPERACAOOM,'
      '   :MOECODIGO, :OBSERVACAO'
      '   )')
    ValidateWithMask = True
    Left = 656
    Top = 19
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'QTDEOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PRECOUNITOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLROPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINSTFIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAVENCOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLROPERACAOOM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MOECODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OBSERVACAO'
        ParamType = ptUnknown
      end>
  end
end
