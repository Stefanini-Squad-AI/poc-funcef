inherited frmResultConciliacao: TfrmResultConciliacao
  Left = 123
  Top = 137
  HelpContext = 160090
  Caption = 'Resultado de Importação dos Arquivos do Reembolso do INSS'
  ClientHeight = 536
  ClientWidth = 792
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 792
    Height = 497
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 790
      Height = 62
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object lblMes: TLabel
        Left = 14
        Top = 16
        Width = 24
        Height = 13
        Caption = 'Mês'
      end
      object lblAnoMes: TLabel
        Left = 164
        Top = 16
        Width = 27
        Height = 13
        Caption = 'Ano '
      end
      object Label1: TLabel
        Left = 12
        Top = 2
        Width = 232
        Height = 13
        Caption = 'Informe o Mês e o Ano para pesquisa  ...'
      end
      object Label9: TLabel
        Left = 252
        Top = 4
        Width = 73
        Height = 29
        AutoSize = False
        Caption = 'Valores superiores a'
        Visible = False
        WordWrap = True
      end
      object pnlLegenda: TPanel
        Left = 472
        Top = 3
        Width = 312
        Height = 57
        BevelOuter = bvNone
        TabOrder = 3
        Visible = False
        object Shape1: TShape
          Left = 14
          Top = 15
          Width = 19
          Height = 12
          Brush.Color = 8454143
        end
        object Shape2: TShape
          Left = 14
          Top = 29
          Width = 19
          Height = 12
          Brush.Color = 16744576
        end
        object Shape3: TShape
          Left = 14
          Top = 43
          Width = 19
          Height = 12
        end
        object Label5: TLabel
          Left = 14
          Top = 0
          Width = 66
          Height = 13
          Caption = 'Legenda ...'
        end
        object Label6: TLabel
          Left = 41
          Top = 15
          Width = 264
          Height = 13
          Caption = '- Valor INSS Informado e Mantenedora Zerado'
        end
        object Label7: TLabel
          Left = 41
          Top = 29
          Width = 264
          Height = 13
          Caption = '- Valor INSS Zerado e Mantenedora Informado'
        end
        object Label8: TLabel
          Left = 41
          Top = 43
          Width = 254
          Height = 13
          Caption = '- Valor INSS diferente do Valor Mantenedora'
        end
      end
      object cboxMes: TComboBox
        Left = 14
        Top = 32
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        OnChange = cboxMesChange
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
      object seAno: TSpinEdit
        Left = 164
        Top = 32
        Width = 65
        Height = 22
        MaxValue = 3000
        MinValue = 1900
        TabOrder = 1
        Value = 2003
        OnChange = cboxMesChange
      end
      object edtVlrSup: TEdit
        Left = 252
        Top = 32
        Width = 69
        Height = 21
        TabOrder = 2
        Visible = False
        OnKeyPress = edtVlrSupKeyPress
      end
      object cboxExibeDivergencias: TCheckBox
        Left = 336
        Top = 33
        Width = 134
        Height = 17
        Caption = 'Exibe Divergências'
        TabOrder = 4
        Visible = False
      end
    end
    object pgTipo: TPageControl
      Left = 1
      Top = 63
      Width = 790
      Height = 433
      ActivePage = tabRelatorios
      Align = alClient
      TabOrder = 1
      OnChange = pgTipoChange
      object tabDadosImport: TTabSheet
        Caption = 'Dados da Importação'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 405
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object dbGridDadosImport: TwwDBGrid
            Left = 2
            Top = 2
            Width = 778
            Height = 401
            Selected.Strings = (
              'SIGLA'#9'2'#9'GEREG'
              'ENTIDADE'#9'20'#9'Entidade'
              'PLANO'#9'26'#9'Plano'
              'RUBRICA'#9'26'#9'Rubrica'
              'PROVENTOS'#9'12'#9'Proventos'
              'DESCONTOS'#9'12'#9'Descontos')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDadosImport
            ReadOnly = True
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
      end
      object tabDivergencia: TTabSheet
        Caption = 'Divergências Encontradas'
        ImageIndex = 1
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 405
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object dbGrid: TwwDBGrid
            Left = 2
            Top = 2
            Width = 778
            Height = 360
            Selected.Strings = (
              'NUMPROCINSS'#9'10'#9'Nº Benefício ~INSS'
              'NOME'#9'32'#9'Nome'
              'CODPROVDESC'#9'9'#9'Código ~Fundação'#9'F'
              'DESCRPROVDESC'#9'30'#9'Descrição'
              'VALORINSS'#9'10'#9'Valor ~INSS'
              'VALORMANT'#9'10'#9'Valor ~Mantenedora')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsINSSxPrisma
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            OnCalcCellColors = dbGridCalcCellColors
            IndicatorColor = icBlack
          end
          object pnlTotais: TPanel
            Left = 2
            Top = 362
            Width = 778
            Height = 41
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 1
            object Label2: TLabel
              Left = 17
              Top = 13
              Width = 81
              Height = 13
              Caption = 'Total do INSS'
            end
            object Label3: TLabel
              Left = 238
              Top = 13
              Width = 138
              Height = 13
              Caption = 'Total das Mantenedoras'
            end
            object Label4: TLabel
              Left = 514
              Top = 13
              Width = 56
              Height = 13
              Caption = 'Diferença'
            end
            object edTotalINSS: TRealEdit
              Left = 101
              Top = 9
              Width = 106
              Height = 21
              Alignment = taRightJustify
              Color = clSilver
              Lines.Strings = (
                '      0,00')
              ReadOnly = True
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object edTotalMant: TRealEdit
              Left = 380
              Top = 9
              Width = 106
              Height = 21
              Alignment = taRightJustify
              Color = clSilver
              Lines.Strings = (
                '      0,00')
              ReadOnly = True
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object edDiferenca: TRealEdit
              Left = 573
              Top = 9
              Width = 106
              Height = 21
              Alignment = taRightJustify
              Color = clSilver
              Lines.Strings = (
                '      0,00')
              ReadOnly = True
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
          end
        end
      end
      object tabRelatorios: TTabSheet
        Caption = 'Relatórios'
        ImageIndex = 2
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 405
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Label10: TLabel
            Left = 416
            Top = 324
            Width = 8
            Height = 13
            Caption = '0'
            Visible = False
          end
          object pnlLocalizaArquivo: TPanel
            Left = 157
            Top = 10
            Width = 205
            Height = 41
            BevelOuter = bvNone
            TabOrder = 0
            object SpeedButton1: TSpeedButton
              Left = 179
              Top = 10
              Width = 22
              Height = 23
              Hint = 'Buscar Arquivo '
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000012000000120000000100
                040000000000D800000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
                FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
                0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
                870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
                FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
                0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
              ParentShowHint = False
              ShowHint = True
              OnClick = SB1Click
            end
            object edtArquivo: TEdit
              Left = -87
              Top = -25
              Width = 159
              Height = 21
              TabOrder = 0
            end
          end
          object pnlGridLeituraArq: TPanel
            Left = 376
            Top = 0
            Width = 377
            Height = 226
            Caption = 'an'
            TabOrder = 1
            Visible = False
            object wwDBGrid1: TwwDBGrid
              Left = 1
              Top = 1
              Width = 375
              Height = 224
              Selected.Strings = (
                'RUBRICA'#9'6'#9'Rubrica'
                'QUANTIDADE'#9'8'#9'Quant.'
                'VALOR'#9'25'#9'Valor'
                'TIPO'#9'4'#9'Tipo')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsVirtual
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
          end
          object Button1: TButton
            Left = 302
            Top = 352
            Width = 83
            Height = 25
            Caption = 'Confere NB'
            TabOrder = 2
            Visible = False
            OnClick = Button1Click
          end
          object reArq: TRichEdit
            Left = 536
            Top = 340
            Width = 185
            Height = 27
            Lines.Strings = (
              'reArq')
            TabOrder = 3
            Visible = False
          end
          object Button3: TButton
            Left = 398
            Top = 352
            Width = 67
            Height = 25
            Caption = 'Batimento'
            TabOrder = 4
            Visible = False
            OnClick = Button3Click
          end
        end
      end
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 63
      Width = 790
      Height = 433
      ActivePage = TabSheet3
      Align = alClient
      TabOrder = 2
      OnChange = pgTipoChange
      object TabSheet2: TTabSheet
        Caption = 'Divergências Encontradas'
        ImageIndex = 1
        TabVisible = False
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 405
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object wwDBGrid3: TwwDBGrid
            Left = 2
            Top = 2
            Width = 778
            Height = 360
            Selected.Strings = (
              'NUMPROCINSS'#9'10'#9'Nº Benefício ~INSS'
              'NOME'#9'32'#9'Nome'
              'CODPROVDESC'#9'9'#9'Código ~Fundação'#9'F'
              'DESCRPROVDESC'#9'30'#9'Descrição'
              'VALORINSS'#9'10'#9'Valor ~INSS'
              'VALORMANT'#9'10'#9'Valor ~Mantenedora')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsINSSxPrisma
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            OnCalcCellColors = dbGridCalcCellColors
            IndicatorColor = icBlack
          end
          object Panel6: TPanel
            Left = 2
            Top = 362
            Width = 778
            Height = 41
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 1
            object Label11: TLabel
              Left = 17
              Top = 13
              Width = 81
              Height = 13
              Caption = 'Total do INSS'
            end
            object Label12: TLabel
              Left = 238
              Top = 13
              Width = 138
              Height = 13
              Caption = 'Total das Mantenedoras'
            end
            object Label13: TLabel
              Left = 514
              Top = 13
              Width = 56
              Height = 13
              Caption = 'Diferença'
            end
            object RealEdit1: TRealEdit
              Left = 101
              Top = 9
              Width = 106
              Height = 21
              Alignment = taRightJustify
              Color = clSilver
              Lines.Strings = (
                '      0,00')
              ReadOnly = True
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object RealEdit2: TRealEdit
              Left = 380
              Top = 9
              Width = 106
              Height = 21
              Alignment = taRightJustify
              Color = clSilver
              Lines.Strings = (
                '      0,00')
              ReadOnly = True
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object RealEdit3: TRealEdit
              Left = 573
              Top = 9
              Width = 106
              Height = 21
              Alignment = taRightJustify
              Color = clSilver
              Lines.Strings = (
                '      0,00')
              ReadOnly = True
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Relatórios'
        ImageIndex = 2
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 405
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Label14: TLabel
            Left = 416
            Top = 324
            Width = 8
            Height = 13
            Caption = '0'
            Visible = False
          end
          object rgrpRelatorios: TRadioGroup
            Left = 12
            Top = 24
            Width = 760
            Height = 289
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Valores Provisionados - 020.201'
              'Pago na Folha e Não Pagos no INSS - 020.201'
              'Beneficiários Não Identificados - 020.208'
              'Valores por Mantenedoras - 020.217 (arquivo original)'
              'Valores por Mantenedoras - 020.217 (entradas manuais)'
              'Valores por Mantenedoras - 020.217 (todos)'
              'Diferença de Proventos Pagos - 020.235'
              'Beneficiários por Espécie - 020.236'
              'Beneficiários por Rubricas INSS - 020.234'
              'Pagamento Alternativo de Benefício PAB - 020.225'
              'Valores Glosados pelo INSS - 020.223'
              'Lista de Exceções'
              'Leitura Arq. DataPrev'
              'Listagem de Rubricas Importadas'
              'Relação de Diferença de Proventos Pagos por Conta do INSS'
              'Relação de Proventos Pagos e não reembolsados'
              'Relação de Proventos Pagos e não reembolsados - Sintético')
            TabOrder = 0
            OnClick = rgrpRelatoriosClick
          end
          object Panel8: TPanel
            Left = 544
            Top = 126
            Width = 217
            Height = 27
            BevelOuter = bvNone
            TabOrder = 1
            object SpeedButton2: TSpeedButton
              Left = 181
              Top = 3
              Width = 22
              Height = 23
              Hint = 'Buscar Arquivo '
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000012000000120000000100
                040000000000D800000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
                FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
                0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
                870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
                FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
                0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
              ParentShowHint = False
              ShowHint = True
              OnClick = SB1Click
            end
            object Edit1: TEdit
              Left = 2
              Top = 4
              Width = 175
              Height = 21
              TabOrder = 0
            end
          end
          object Panel9: TPanel
            Left = 728
            Top = 320
            Width = 377
            Height = 226
            Caption = 'an'
            TabOrder = 2
            Visible = False
            object wwDBGrid4: TwwDBGrid
              Left = 1
              Top = 1
              Width = 375
              Height = 224
              Selected.Strings = (
                'RUBRICA'#9'6'#9'Rubrica'
                'QUANTIDADE'#9'8'#9'Quant.'
                'VALOR'#9'25'#9'Valor'
                'TIPO'#9'4'#9'Tipo')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsVirtual
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
          end
          object Button2: TButton
            Left = 302
            Top = 352
            Width = 83
            Height = 25
            Caption = 'Confere NB'
            TabOrder = 3
            Visible = False
            OnClick = Button1Click
          end
          object RichEdit1: TRichEdit
            Left = 536
            Top = 340
            Width = 185
            Height = 27
            Lines.Strings = (
              'reArq')
            TabOrder = 4
            Visible = False
          end
          object Button4: TButton
            Left = 398
            Top = 352
            Width = 67
            Height = 25
            Caption = 'Batimento'
            TabOrder = 5
            Visible = False
            OnClick = Button3Click
          end
        end
      end
      object tbsFiltroDifINSS: TTabSheet
        Caption = 'Filtro'
        ImageIndex = 2
        object pnlFiltro: TPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 405
          Align = alClient
          Enabled = False
          TabOrder = 0
          object Label15: TLabel
            Left = 7
            Top = 4
            Width = 128
            Height = 13
            Caption = 'Mês/Ano de Cobrança'
          end
          object Label16: TLabel
            Left = 7
            Top = 43
            Width = 101
            Height = 13
            Caption = 'Entidade Contábil'
          end
          object Label17: TLabel
            Left = 7
            Top = 94
            Width = 51
            Height = 13
            Caption = 'Rubricas'
          end
          object Label18: TLabel
            Left = 289
            Top = 4
            Width = 141
            Height = 13
            AutoSize = False
            Caption = 'Diferenças superiores a'
          end
          object Label19: TLabel
            Left = 287
            Top = 43
            Width = 118
            Height = 13
            Caption = 'Plano Previdenciário'
          end
          object DBcboEntidadeContabil2: TwwDBLookupCombo
            Left = 7
            Top = 57
            Width = 266
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'NOME'#9'F')
            LookupTable = qryLookEntidadeContabil
            LookupField = 'IDPLANOPREV'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
          object cbMes: TComboBox
            Left = 7
            Top = 18
            Width = 194
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            OnChange = cbMesChange
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
          object dbspano: TwwDBSpinEdit
            Left = 208
            Top = 18
            Width = 65
            Height = 21
            Increment = 1
            Value = 2004
            TabOrder = 2
            UnboundDataType = wwDefault
            OnChange = cbMesChange
          end
          object chklstRubricas: TCheckListBox
            Left = 7
            Top = 109
            Width = 763
            Height = 265
            Columns = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 3
          end
          object edDifSuperior: TEdit
            Left = 288
            Top = 18
            Width = 217
            Height = 21
            BiDiMode = bdRightToLeft
            ParentBiDiMode = False
            TabOrder = 4
            Text = '0.00'
            OnKeyPress = edtVlrSupKeyPress
          end
          object rgFiltro: TRadioGroup
            Left = 594
            Top = 11
            Width = 167
            Height = 76
            Caption = 'Filtros'
            ItemIndex = 0
            Items.Strings = (
              'Aplicar no Reembolso'
              'Aplicar no Desembolso')
            TabOrder = 5
            Visible = False
          end
          object DbLkcPlanPrev: TwwDBLookupCombo
            Left = 287
            Top = 57
            Width = 266
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Plano Previdenciário'#9'F')
            LookupTable = QryPlanPrev
            LookupField = 'IDPLANOPREV'
            TabOrder = 6
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 497
    Width = 792
    inherited tb97Fundo: TToolbar97
      Left = 261
      DockPos = 261
      inherited sep1: TToolbarSep97
        Left = 323
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 240
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 242
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 325
      end
      object bbtnProcurar: TBitBtn
        Left = 160
        Top = 0
        Width = 80
        Height = 33
        Hint = 'Procurar participante'
        Caption = '&Consultar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Visible = False
        OnClick = bbtnProcurarClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
        Spacing = 2
      end
      object btnImprimir: TBitBtn
        Left = 80
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 3
        OnClick = btnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
      object btnImprimir1: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Provisão'
        Enabled = False
        TabOrder = 4
        Visible = False
        OnClick = btnImprimir1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 979
    Top = 3
    TargetsData = (
      1
      5
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TRichEdit'
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
        'Cells'
        0))
  end
  object dsINSSxPrisma: TwwDataSource
    AutoEdit = False
    DataSet = qryINSSxMant
    Left = 414
    Top = 374
  end
  object qryINSSxMant: TwwQuery
    AutoCalcFields = False
    BeforeOpen = qryINSSxMantBeforeOpen
    AfterOpen = qryINSSxMantAfterOpen
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'SELECT  SUBSTR(DECODE(PL.NOME,NULL,M.NOME,PL.NOME),1,40) ENTIDAD' +
        'E,'
      '        D.NUMPROCINSS,'
      '        B.CODBENEFICIO,'
      '        DECODE(E.MATRICULA, NULL, '
      
        '               DECODE(BPP.MATRICULA,NULL, DP.MATRICULA,BPP.MATRI' +
        'CULA)) MATRICULA,'
      '        P.NOME,'
      '        PD.CODPROVDESC,       '
      '        NVL(D.VALORINSS,0) VALORINSS,'
      '        NVL(D.VALORMANT,0) VALORMANT,'
      '        (NVL(D.VALORMANT,0)  - NVL(D.VALORINSS,0) ) AS DIFERENCA'
      '         '
      'FROM    PESSOA P, '
      '        ELEGPATRO E, '
      '        PARTPREVPLAN PPP,'
      '        DETCONCINSS D, '
      '        BENEFICIARIOPP BPP,'
      '        DEPENTIT DP,'
      '        PROVDESC PD, '
      '        BENEFICIO B, '
      '        PLANPREV PL,'
      '        RUBRICAXINSS RXI,'
      '        MANTENEDORA M'
      ''
      'WHERE   D.MESREFERENCIA = :MESREFERENCIA'
      '  AND   NVL(D.VALORINSS,0) <> NVL(D.VALORMANT,0)'
      '  AND   D.IDRUBRICA = PD.IDPROVENTO'
      '  AND   E.IDPESSOA(+)                = D.IDPESSOA'
      '  AND   DP.IDPESSOA(+)               = D.IDPESSOA'
      '  AND   PPP.IDPESSOA(+)              = DP.IDTITULAR'
      '  AND   PL.IDPLANOPREV(+)            = PPP.IDPLANOPREV'
      ''
      '  AND   BPP.IDBENEFICIARIOPP(+)      = D.IDPESSOA'
      '  AND   M.CODMANTENEDORA(+)          = BPP.CODMANTENEDORA'
      '  '
      '  AND   P.IDPESSOA                   = D.IDPESSOA'
      '  AND   D.IDBENEFICIO                = B.IDBENEFICIO'
      '  AND   RXI.IDRUBRICA                = D.IDRUBRICA'
      '  AND   RXI.FLGRUBCENTRAL            = 1'
      'ORDER   BY P.NOME'
      '')
    ValidateWithMask = True
    Left = 486
    Top = 374
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
        Value = '2002/11'
      end>
  end
  object qryDadosImport: TwwQuery
    AutoCalcFields = False
    BeforeOpen = qryDadosImportBeforeOpen
    AfterOpen = qryDadosImportAfterOpen
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      ' '#9'UF.SIGLA,'
      #9'SUBSTR(P.NOME, 1,20) ENTIDADE,'
      #9'SUBSTR(PL.NOME, 1, 20) PLANO,'
      #9'SUBSTR(PD.DESCRICAO, 1, 20) RUBRICA,'
      '  '#9'PD.IDPROVENTO AS IDRUBRICA,'
      #9'SUM(DECODE(PD.FLGDESCONTO,0, D.VALORINSS, NULL)) PROVENTOS,'
      #9'SUM(DECODE(PD.FLGDESCONTO,1, D.VALORINSS, NULL)) DESCONTOS,'
      #9'COUNT(DISTINCT D.IDPESSOA) TOTAL'
      'FROM'
      '  PESSOA P,'
      '  DETCONCINSS D,'
      '  PARTPREVPLAN PP,'
      '  PROVDESC PD,'
      '  PLANPREV PL,'
      '  UFINSS UF'
      'WHERE'
      #9'D.MESREFERENCIA  = :MESREFERENCIA'
      'AND   PP.IDPESSOA '#9' = D.IDPESSOA'
      'AND   UF.CODORGAOLOCAL(+)   = D.CODMANTENEDORINSS'
      'AND   PL.IDPLANOPREV'#9' = PP.IDPLANOPREV'
      'AND   P.IDPESSOA'#9' = PP.IDPESSJUR'
      'AND   D.IDRUBRICA'#9' = PD.IDPROVENTO'
      'GROUP BY'
      '  UF.SIGLA,'
      '  P.NOME,'
      '  PL.NOME,'
      '  PD.DESCRICAO,'
      '  PD.IDPROVENTO'
      ''
      'UNION ALL'
      ''
      'SELECT'
      #9'UF.SIGLA,'
      #9'SUBSTR(M.NOME, 1, 20) ENTIDADE,'
      
        #9'SUBSTR(DECODE(PL.NOME,NULL,'#39'NÃO ASSOCIADO'#39',PL.NOME), 1, 20) PLA' +
        'NO,'
      #9'SUBSTR(PD.DESCRICAO, 1, 20) RUBRICA,'
      '  '#9'PD.IDPROVENTO AS IDRUBRICA,'
      #9'SUM(DECODE(PD.FLGDESCONTO,0, D.VALORINSS, NULL)) PROVENTOS,'
      #9'SUM(DECODE(PD.FLGDESCONTO,1, D.VALORINSS, NULL)) DESCONTOS,'
      #9'COUNT(DISTINCT D.IDPESSOA) TOTAL'
      'FROM '
      '  DETCONCINSS D,'
      '  BENEFICIARIOPP BPP,'
      '  PROVDESC PD,'
      '  MANTENEDORA M,'
      '  PLANPREV PL,'
      '  UFINSS UF'
      'WHERE'#9#9#9' '
      '      D.MESREFERENCIA '#9#9'= :MESREFERENCIA'
      'AND   UF.CODORGAOLOCAL   '#9'= D.CODMANTENEDORINSS'
      'AND   BPP.IDBENEFICIARIOPP '#9'= D.IDPESSOA'
      'AND   M.CODMANTENEDORA '#9#9'= BPP.CODMANTENEDORA'
      'AND   D.IDRUBRICA'#9#9'= PD.IDPROVENTO'
      'AND   PL.IDPLANOPREV '#9#9'= M.IDPLANOPREV'
      'GROUP BY'
      '  UF.SIGLA,'
      '  M.NOME,'
      '  PL.NOME,'
      '  PD.DESCRICAO,'
      '  PD.IDPROVENTO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 222
    Top = 398
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end>
  end
  object dsDadosImport: TwwDataSource
    AutoEdit = False
    DataSet = qryDadosImport
    Left = 254
    Top = 398
  end
  object OpenDialog1: TOpenDialog
    Left = 113
    Top = 398
  end
  object qryVirtual: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    BeforeOpen = qryDadosImportBeforeOpen
    AfterOpen = qryDadosImportAfterOpen
    AutoRefresh = True
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT  0 AS RUBRICA,'
      '        0 AS QUANTIDADE,'
      '        0.00 VALOR,'
      '        0.00 VALORINFO,'
      '        0 AS TIPO'
      'FROM DUAL'
      'WHERE 1=2'
      'ORDER BY TIPO, RUBRICA'
      ''
      ' '
      ' ')
    UpdateObject = UpdateSQL1
    ValidateWithMask = True
    Left = 302
    Top = 342
    object qryVirtualRUBRICA: TFloatField
      DisplayLabel = 'Rubrica'
      DisplayWidth = 6
      FieldName = 'RUBRICA'
    end
    object qryVirtualQUANTIDADE: TFloatField
      DisplayLabel = 'Quant.'
      DisplayWidth = 8
      FieldName = 'QUANTIDADE'
    end
    object qryVirtualVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 25
      FieldName = 'VALOR'
    end
    object qryVirtualTIPO: TFloatField
      DisplayLabel = 'Tipo'
      DisplayWidth = 4
      FieldName = 'TIPO'
    end
    object qryVirtualVALORINFO: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORINFO'
      Visible = False
    end
  end
  object dsVirtual: TwwDataSource
    AutoEdit = False
    DataSet = qryVirtual
    Left = 334
    Top = 342
  end
  object UpdateSQL1: TUpdateSQL
    Left = 145
    Top = 398
  end
  object ppLeituraArq: TppBDEPipeline
    DataSource = dsVirtual
    UserName = 'LeituraArq'
    Left = 21
    Top = 398
    object ppLeituraArqppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RUBRICA'
      FieldName = 'RUBRICA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 6
      Position = 0
    end
    object ppLeituraArqppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTIDADE'
      FieldName = 'QUANTIDADE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 8
      Position = 1
    end
    object ppLeituraArqppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 25
      Position = 2
    end
    object ppLeituraArqppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 4
      Position = 3
    end
    object ppLeituraArqppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORINFO'
      FieldName = 'VALORINFO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
  object prLeituaArq: TppReport
    AutoStop = False
    DataPipeline = ppLeituraArq
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 81
    Top = 398
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppLeituraArq'
    object ppHeaderBand15: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 44715
      mmPrintPosition = 0
      object ppDBImage14: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText212: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText213: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 25400
        BandType = 0
      end
      object ppDBText214: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 20373
        BandType = 0
      end
      object ppDBText215: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText216: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText217: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText218: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel206: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText219: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel210: TppLabel
        UserName = 'Label65'
        Caption = 'Resultado da Leitura do Arquivo DataPrev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 58208
        mmTop = 27517
        mmWidth = 84931
        BandType = 0
      end
      object ppLine62: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 33338
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel212: TppLabel
        UserName = 'Label212'
        Caption = 'Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 30427
        mmTop = 39423
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel214: TppLabel
        UserName = 'Label214'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 76729
        mmTop = 39423
        mmWidth = 19579
        BandType = 0
      end
      object ppLine64: TppLine
        UserName = 'Line64'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 529
        mmTop = 43921
        mmWidth = 225161
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 130969
        mmTop = 39423
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 39423
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Valor Info.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 168275
        mmTop = 39423
        mmWidth = 17463
        BandType = 0
      end
      object pplblMesComp: TppLabel
        UserName = 'lblMesComp'
        Caption = 'Mês de Competencia:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 140229
        mmTop = 21960
        mmWidth = 29104
        BandType = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      BeforeGenerate = ppDetailBand16BeforeGenerate
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object shp1: TppShape
        UserName = 'shp1'
        Pen.Color = clWhite
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 4
      end
      object ppDBText220: TppDBText
        UserName = 'DBText220'
        DataField = 'RUBRICA'
        DataPipeline = ppLeituraArq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3175
        mmLeft = 30427
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText221: TppDBText
        UserName = 'DBText221'
        DataField = 'QUANTIDADE'
        DataPipeline = ppLeituraArq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3175
        mmLeft = 79111
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = ppLeituraArq
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3175
        mmLeft = 130440
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2201'
        OnGetText = ppDBText2GetText
        DataField = 'TIPO'
        DataPipeline = ppLeituraArq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'VALORINFO'
        DataPipeline = ppLeituraArq
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3175
        mmLeft = 169334
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
    end
    object ppFooterBand15: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine63: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel213: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2910
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable27: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 3175
        mmWidth = 197644
        BandType = 8
      end
    end
    object ppSummaryBand13: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = ppLeituraArq
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3440
        mmLeft = 119592
        mmTop = 0
        mmWidth = 20373
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        AutoSize = True
        DataField = 'QUANTIDADE'
        DataPipeline = ppLeituraArq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3440
        mmLeft = 66940
        mmTop = 0
        mmWidth = 29369
        BandType = 7
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Total Geral :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 43656
        mmTop = 0
        mmWidth = 16140
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        AutoSize = True
        DataField = 'VALORINFO'
        DataPipeline = ppLeituraArq
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3440
        mmLeft = 158486
        mmTop = 0
        mmWidth = 27252
        BandType = 7
      end
    end
  end
  object ppdsnLeituraArq: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = prLeituaArq
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 51
    Top = 398
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 23
    Top = 435
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 55
    Top = 434
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 95
    Top = 432
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object qryAux: TwwQuery
    AutoCalcFields = False
    BeforeOpen = qryINSSxMantBeforeOpen
    AfterOpen = qryINSSxMantAfterOpen
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 222
    Top = 438
  end
  object qryFolhaFuncef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.MES,H.MESCOBRANCA, H.IDRUBRICA, H.CODPROVDESC, H.VALORP' +
        'ROVENTO,'
      
        '       DECODE(P.FLGDESCONTO,1,'#39'(-)'#39',0,'#39'(+)'#39') AS SINAL, TO_CHAR(D' +
        'ATAPAGAMENTO,'#39'DD/MM/YYYY'#39') AS DATAPAGTO,'
      
        '       NUMPROCINSS, SUBSTR(P.DESCRICAO,1,30) AS DESCRRUBRICA, H.' +
        'FONTEPAGADORA,'
      '       TOTAL.VALOR'
      'FROM HISTRUBSAL H, PROVDESC P,'
      
        '     (SELECT SUM(DECODE(P.FLGDESCONTO,0,VALORPROVENTO,1,-VALORPR' +
        'OVENTO,0)) AS VALOR'
      '      FROM HISTRUBSAL H, PROVDESC P'
      '      WHERE (H.IDMODULO in (18,21))      AND'
      '            (H.IDRUBRICA = P.IDPROVENTO) AND'
      '            (H.FONTEPAGADORA = 2 )) TOTAL'
      'WHERE (H.IDMODULO in (18,21))            AND'
      '      (H.IDRUBRICA = P.IDPROVENTO)       AND'
      '      (H.FONTEPAGADORA = 2)'
      'ORDER BY H.MESCOBRANCA')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 601
    Top = 395
  end
  object qryReembolso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT D.MESREFERENCIA, D.MESCOBRANCA, D.NUMPROCINSS, D.VALORINS' +
        'S,'
      '       DECODE(P.FLGDESCONTO,1,'#39'(-)'#39',0,'#39'(+)'#39') AS SINAL, '
      
        '       NUMPROCINSS, SUBSTR(P.DESCRICAO,1,30) AS DESCRRUBRICA, TO' +
        'TAL.VALOR'
      'FROM DETCONCINSS D, PROVDESC P,'
      
        '     (SELECT SUM(DECODE(P.FLGDESCONTO,0,VALORINSS,1,-VALORINSS,0' +
        ')) AS VALOR'
      '      FROM DETCONCINSS H, PROVDESC P '
      '      WHERE (H.NUMPROCINSS= :numproc)         AND'
      '            (H.IDRUBRICA = P.IDPROVENTO)) TOTAL'
      'WHERE (D.NUMPROCINSS = :numproc)         AND'
      '      (D.IDRUBRICA = P.IDPROVENTO)'
      'ORDER BY D.MESCOBRANCA'
      ' '
      ' '
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 665
    Top = 395
    ParamData = <
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptUnknown
        Value = ''
      end
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptUnknown
      end>
  end
  object qryLookEntidadeContabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select IDPLANOPREV, NOME'
      'from planprevcontabil'
      'order by nome')
    ValidateWithMask = True
    Left = 520
    Top = 374
    object qryLookEntidadeContabilNOME: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 50
    end
    object qryLookEntidadeContabilIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.IDPLANOPREV'
      Visible = False
    end
  end
  object qryRubricaAcertoOrigem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO, R.RUBRICAINSS, P.DESCRICAO'
      'FROM PROVDESC P, rubricaxinss R'
      'WHERE P.IDPROVENTO = R.IDRUBRICA'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 456
    Top = 374
    object FloatField1: TFloatField
      FieldName = 'IDPROVENTO'
      Origin = 'BASEDADOS.PROVDESC.IDPROVENTO'
    end
    object StringField1: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PROVDESC.DESCRICAO'
      Size = 130
    end
    object FloatField2: TFloatField
      FieldName = 'RUBRICAINSS'
      Origin = 'BASEDADOS.RUBRICAXINSS.RUBRICAINSS'
    end
  end
  object qryBeneficiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBENEFICIO, B.CODBENEFICIO, B.NOME'
      'FROM BENEFBFCIARIO BF , BENEFPLANPREV BP, BENEFICIO B'
      'WHERE BF.NUMPROCINSS   = :numprocinss   AND'
      '      BF.IDPESSOA      = :idpessoa      AND'
      '      BF.IDPLANOPREV   = BP.IDPLANOPREV AND'
      '      BF.IDBENEFICIO   = BP.IDBENEFICIO AND'
      '      BP.FLGREFERENCIA = 1              AND'
      '      BP.IDBENEFICIO   = B.IDBENEFICIO'
      '')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 633
    Top = 395
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numprocinss'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idpessoa'
        ParamType = ptUnknown
      end>
  end
  object QryPlanPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPLANOPREV, NOME'
      'FROM'
      '  PLANPREV'
      'ORDER BY'
      '  NOME')
    ValidateWithMask = True
    Left = 552
    Top = 374
  end
  object ppValorMantManual: TppBDEPipeline
    DataSource = dsValorMantManual
    UserName = 'ValorMantManual'
    Left = 304
    Top = 88
    object ppValorMantManualppField1: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppValorMantManualppField2: TppField
      FieldAlias = 'MANTENEDORA'
      FieldName = 'MANTENEDORA'
      FieldLength = 24
      DisplayWidth = 24
      Position = 1
    end
    object ppValorMantManualppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_NO_MES_CREDITO'
      FieldName = 'VALOR_NO_MES_CREDITO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppValorMantManualppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_NO_MES_DEBITO'
      FieldName = 'VALOR_NO_MES_DEBITO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppValorMantManualppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_FORA_DO_MES_CREDITO'
      FieldName = 'VALOR_FORA_DO_MES_CREDITO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppValorMantManualppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_FORA_DO_MES_DEBITO'
      FieldName = 'VALOR_FORA_DO_MES_DEBITO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppValorMantManualppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_CREDITO'
      FieldName = 'VALOR_CREDITO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppValorMantManualppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_DEBITO'
      FieldName = 'VALOR_DEBITO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
  end
  object dsValorMantManual: TwwDataSource
    DataSet = qryValorMantManual
    Left = 424
    Top = 80
  end
  object qryValorMantManual: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(PPC.NOME, '#39'Não Indicado'#39') AS PLANO,'
      ''
      '   CASE'
      
        '      WHEN D.IDPLANOPREV = 02 AND D.IDPLANOPREVPREV = 02    AND ' +
        '(NVL(D.CODMANTENEDORA,14) IN (14)) THEN '#39'REPLAN'#39
      
        '      WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 02    AND ' +
        '(NVL(D.CODMANTENEDORA,14) IN (14)) THEN '#39'REPLAN EXPREVHAB'#39
      
        '      WHEN D.IDPLANOPREV = 02 AND D.IDPLANOPREVPREV = 66    AND ' +
        '(NVL(D.CODMANTENEDORA,14) IN (14)) THEN '#39'REPLAN MIGRADO'#39
      
        '      WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 66    AND ' +
        '(NVL(D.CODMANTENEDORA,14) IN (14)) THEN '#39'REPLAN EXPREVHAB MIGRAD' +
        'O'#39
      
        '      WHEN D.IDPLANOPREV = 19 AND D.IDPLANOPREVPREV = 19    AND ' +
        '(NVL(D.CODMANTENEDORA,14) IN (14)) THEN '#39'REB 1998'#39
      
        '      WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV IS NULL AND ' +
        '(D.CODMANTENEDORA = 99)            THEN '#39'NÃO IDENTIFICADO'#39
      
        '      WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV IS NULL AND ' +
        '(D.CODMANTENEDORA = 6)             THEN '#39'EMPREGADO FUNCEF'#39
      
        '      WHEN D.IDPLANOPREV = 66 AND D.IDPLANOPREVPREV = 66    AND ' +
        '(NVL(D.CODMANTENEDORA,14) IN (14)) THEN '#39'REB 2002'#39
      
        '      WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV IS NULL AND ' +
        '(D.CODMANTENEDORA = 3)             THEN '#39'CAIXA-SRH'#39
      
        '      WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV IS NULL AND ' +
        '(D.CODMANTENEDORA = 2)             THEN '#39'PMPP'#39
      
        '      WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV IS NULL AND ' +
        '(D.CODMANTENEDORA = 5)             THEN '#39'CAIXA-SEGUROS'#39
      '   END AS MANTENEDORA,'
      ''
      '  SUM('
      
        '    DECODE(SUBSTR(D.RUBRICAINSS, 1, 2) , '#39'10'#39', DECODE(D.MESCOBRA' +
        'NCA, D.MESREFERENCIA, D.VALORINSS, 0), 0)'
      '  ) AS VALOR_NO_MES_CREDITO,'
      ''
      '  SUM('
      
        '    DECODE(SUBSTR(D.RUBRICAINSS, 1, 2) , '#39'30'#39', DECODE(D.MESCOBRA' +
        'NCA, D.MESREFERENCIA, D.VALORINSS, 0), 0)'
      '  ) AS VALOR_NO_MES_DEBITO,'
      ''
      '  SUM('
      
        '    DECODE(SUBSTR(D.RUBRICAINSS, 1, 2) , '#39'10'#39', DECODE(D.MESCOBRA' +
        'NCA, D.MESREFERENCIA, 0, D.VALORINSS), 0)'
      '  ) AS VALOR_FORA_DO_MES_CREDITO,'
      ''
      '  SUM('
      
        '    DECODE(SUBSTR(D.RUBRICAINSS, 1, 2) , '#39'30'#39', DECODE(D.MESCOBRA' +
        'NCA, D.MESREFERENCIA, 0, D.VALORINSS), 0)'
      '  ) AS VALOR_FORA_DO_MES_DEBITO,'
      ''
      
        '  SUM(DECODE(SUBSTR(D.RUBRICAINSS, 1, 2) , '#39'10'#39', DECODE(D.MESCOB' +
        'RANCA, D.MESREFERENCIA, D.VALORINSS, 0), 0) +'
      
        '      DECODE(SUBSTR(D.RUBRICAINSS, 1, 2) , '#39'10'#39', DECODE(D.MESCOB' +
        'RANCA, D.MESREFERENCIA, 0, D.VALORINSS), 0)'
      '  ) AS VALOR_CREDITO,'
      ''
      
        '  SUM(DECODE(SUBSTR(D.RUBRICAINSS, 1, 2) , '#39'30'#39', DECODE(D.MESCOB' +
        'RANCA, D.MESREFERENCIA, D.VALORINSS, 0), 0) +'
      
        '      DECODE(SUBSTR(D.RUBRICAINSS, 1, 2) , '#39'30'#39', DECODE(D.MESCOB' +
        'RANCA, D.MESREFERENCIA, 0, D.VALORINSS), 0)       ) AS VALOR_DEB' +
        'ITO'
      ''
      'FROM'
      '   DETCONCINSS      D,'
      '   PLANPREVCONTABIL PPC'
      ''
      'WHERE'
      '       D.MESCOBRANCA = '#39'2005/09'#39
      '   AND D.FLGMANUAL  <> '#39'0'#39
      '   AND D.IDPLANOPREV = PPC.IDPLANOPREV(+)'
      ''
      'GROUP BY'
      '   PPC.NOME,'
      '   CASE'
      
        '      WHEN D.IDPLANOPREV = 02 AND D.IDPLANOPREVPREV = 02    AND ' +
        '(NVL(D.CODMANTENEDORA,14) IN (14)) THEN '#39'REPLAN'#39
      
        '      WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 02    AND ' +
        '(NVL(D.CODMANTENEDORA,14) IN (14)) THEN '#39'REPLAN EXPREVHAB'#39
      
        '      WHEN D.IDPLANOPREV = 02 AND D.IDPLANOPREVPREV = 66    AND ' +
        '(NVL(D.CODMANTENEDORA,14) IN (14)) THEN '#39'REPLAN MIGRADO'#39
      
        '      WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 66    AND ' +
        '(NVL(D.CODMANTENEDORA,14) IN (14)) THEN '#39'REPLAN EXPREVHAB MIGRAD' +
        'O'#39
      
        '      WHEN D.IDPLANOPREV = 19 AND D.IDPLANOPREVPREV = 19    AND ' +
        '(NVL(D.CODMANTENEDORA,14) IN (14)) THEN '#39'REB 1998'#39
      
        '      WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV IS NULL AND ' +
        '(D.CODMANTENEDORA = 99)            THEN '#39'NÃO IDENTIFICADO'#39
      
        '      WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV IS NULL AND ' +
        '(D.CODMANTENEDORA = 6)             THEN '#39'EMPREGADO FUNCEF'#39
      
        '      WHEN D.IDPLANOPREV = 66 AND D.IDPLANOPREVPREV = 66    AND ' +
        '(NVL(D.CODMANTENEDORA,14) IN (14)) THEN '#39'REB 2002'#39
      
        '      WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV IS NULL AND ' +
        '(D.CODMANTENEDORA = 3)             THEN '#39'CAIXA-SRH'#39
      
        '      WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV IS NULL AND ' +
        '(D.CODMANTENEDORA = 2)             THEN '#39'PMPP'#39
      
        '      WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV IS NULL AND ' +
        '(D.CODMANTENEDORA = 5)             THEN '#39'CAIXA-SEGUROS'#39
      '   END'
      ''
      'ORDER BY'
      '   PPC.NOME, MANTENEDORA')
    ValidateWithMask = True
    Left = 424
    Top = 64
    object qryValorMantManualPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object qryValorMantManualMANTENEDORA: TStringField
      FieldName = 'MANTENEDORA'
      Size = 24
    end
    object qryValorMantManualVALOR_NO_MES_CREDITO: TFloatField
      FieldName = 'VALOR_NO_MES_CREDITO'
    end
    object qryValorMantManualVALOR_NO_MES_DEBITO: TFloatField
      FieldName = 'VALOR_NO_MES_DEBITO'
    end
    object qryValorMantManualVALOR_FORA_DO_MES_CREDITO: TFloatField
      FieldName = 'VALOR_FORA_DO_MES_CREDITO'
    end
    object qryValorMantManualVALOR_FORA_DO_MES_DEBITO: TFloatField
      FieldName = 'VALOR_FORA_DO_MES_DEBITO'
    end
    object qryValorMantManualVALOR_CREDITO: TFloatField
      FieldName = 'VALOR_CREDITO'
    end
    object qryValorMantManualVALOR_DEBITO: TFloatField
      FieldName = 'VALOR_DEBITO'
    end
  end
  object ppdsnValorMantManual: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = rbValorMantManual
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 304
    Top = 76
  end
  object rbValorMantManual: TppReport
    AutoStop = False
    DataPipeline = ppValorMantManual
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 296863
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 304
    Top = 64
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppValorMantManual'
    object ppHeaderBand14: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 44979
      mmPrintPosition = 0
      object ppShape13: TppShape
        UserName = 'Shape13'
        mmHeight = 7673
        mmLeft = 238390
        mmTop = 34660
        mmWidth = 45244
        BandType = 0
      end
      object ppDBImage13: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText167: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5842
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 16298
        BandType = 0
      end
      object ppDBText168: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4191
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 57827
        BandType = 0
      end
      object ppDBText193: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 41021
        BandType = 0
      end
      object ppDBText196: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 3133
        BandType = 0
      end
      object ppDBText199: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 3471
        BandType = 0
      end
      object ppDBText201: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 23707
        BandType = 0
      end
      object ppDBText202: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 11938
        BandType = 0
      end
      object ppLabel194: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText203: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3260
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 12531
        BandType = 0
      end
      object ppLabel196: TppLabel
        UserName = 'Label65'
        Caption = 'Relação de Valores Por Entidade / Mantenedora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 93927
        mmTop = 27517
        mmWidth = 96309
        BandType = 0
      end
      object ppLabel205: TppLabel
        UserName = 'Label159'
        Caption = 'Mês Cobrança:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 239448
        mmTop = 36248
        mmWidth = 25400
        BandType = 0
      end
      object lblMesRefVlrMant: TppLabel
        UserName = 'lblMesRefRub'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 268023
        mmTop = 36248
        mmWidth = 11642
        BandType = 0
      end
    end
    object ppDetailBand15: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object BandaVM: TppShape
        UserName = 'BandaVM'
        Pen.Color = clWhite
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 284957
        BandType = 4
      end
      object ppDBText204: TppDBText
        UserName = 'DBText204'
        DataField = 'MANTENEDORA'
        DataPipeline = ppValorMantManual
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppValorMantManual'
        mmHeight = 3969
        mmLeft = 529
        mmTop = 0
        mmWidth = 70907
        BandType = 4
      end
      object ppDBText208: TppDBText
        UserName = 'DBText208'
        DataField = 'VALOR_NO_MES_CREDITO'
        DataPipeline = ppValorMantManual
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValorMantManual'
        mmHeight = 3969
        mmLeft = 158750
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText209: TppDBText
        UserName = 'DBText209'
        DataField = 'VALOR_NO_MES_DEBITO'
        DataPipeline = ppValorMantManual
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValorMantManual'
        mmHeight = 3969
        mmLeft = 192088
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText210: TppDBText
        UserName = 'DBText210'
        DataField = 'VALOR_FORA_DO_MES_CREDITO'
        DataPipeline = ppValorMantManual
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValorMantManual'
        mmHeight = 3969
        mmLeft = 225425
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText211: TppDBText
        UserName = 'DBText2101'
        DataField = 'VALOR_FORA_DO_MES_DEBITO'
        DataPipeline = ppValorMantManual
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValorMantManual'
        mmHeight = 3969
        mmLeft = 258763
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VALOR_DEBITO'
        DataPipeline = ppValorMantManual
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValorMantManual'
        mmHeight = 3969
        mmLeft = 125413
        mmTop = 265
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VALOR_CREDITO'
        DataPipeline = ppValorMantManual
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValorMantManual'
        mmHeight = 3969
        mmLeft = 94192
        mmTop = 265
        mmWidth = 24077
        BandType = 4
      end
    end
    object ppFooterBand14: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object ppLine45: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284163
        BandType = 8
      end
      object ppLabel198: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 1323
        mmWidth = 70908
        BandType = 8
      end
      object ppSystemVariable26: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 133350
        mmTop = 1323
        mmWidth = 17463
        BandType = 8
      end
    end
    object ppSummaryBand10: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppShape15: TppShape
        UserName = 'Shape15'
        Brush.Color = 15263976
        Pen.Color = clWhite
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1323
        mmWidth = 284957
        BandType = 7
      end
      object ppLabel216: TppLabel
        UserName = 'Label216'
        Caption = 'Líquido Apurado :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 60854
        mmTop = 2381
        mmWidth = 30163
        BandType = 7
      end
      object ppDBCalc69: TppDBCalc
        UserName = 'SomatorioDebito'
        DataField = 'VALOR_DEBITO'
        DataPipeline = ppValorMantManual
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValorMantManual'
        mmHeight = 4233
        mmLeft = 125413
        mmTop = 2381
        mmWidth = 24077
        BandType = 7
      end
      object ppLine65: TppLine
        UserName = 'Line65'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 6879
        mmWidth = 284692
        BandType = 7
      end
      object ppLabel217: TppLabel
        UserName = 'Label217'
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 121179
        mmTop = 1852
        mmWidth = 1058
        BandType = 7
      end
      object ppLabel218: TppLabel
        UserName = 'Label218'
        Caption = '='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 154782
        mmTop = 2381
        mmWidth = 2117
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 1588
        mmWidth = 284692
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'SomatorioCredito'
        DataField = 'VALOR_CREDITO'
        DataPipeline = ppValorMantManual
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValorMantManual'
        mmHeight = 4233
        mmLeft = 94192
        mmTop = 2381
        mmWidth = 24077
        BandType = 7
      end
      object ppVariable1: TppVariable
        UserName = 'LiquidoTotal'
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 162190
        mmTop = 2381
        mmWidth = 21167
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PLANO'
      DataPipeline = ppValorMantManual
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppValorMantManual'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          mmHeight = 12965
          mmLeft = 0
          mmTop = 0
          mmWidth = 284163
          BandType = 3
          GroupNo = 0
        end
        object ppLabel199: TppLabel
          UserName = 'Label199'
          Caption = 'Entidade Contábil / Mantenedora '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 8202
          mmWidth = 55827
          BandType = 3
          GroupNo = 0
        end
        object ppLabel209: TppLabel
          UserName = 'Label2002'
          Caption = 'Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 93134
          mmTop = 8202
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
        end
        object ppLabel200: TppLabel
          UserName = 'Label200'
          Caption = 'Desconto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 124354
          mmTop = 8202
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
        end
        object ppLabel203: TppLabel
          UserName = 'Label2001'
          Caption = 'Créd. Na Ref.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 157692
          mmTop = 8202
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
        end
        object ppLabel204: TppLabel
          UserName = 'Label204'
          Caption = 'Desc. Na Ref.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 191030
          mmTop = 8202
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
        end
        object ppLabel207: TppLabel
          UserName = 'Label207'
          Caption = 'Créd. Mês Ant.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 224367
          mmTop = 8202
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
        end
        object ppLabel208: TppLabel
          UserName = 'Label208'
          Caption = 'Desc. Mês Ant.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 257705
          mmTop = 8202
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          AutoSize = True
          DataField = 'PLANO'
          DataPipeline = ppValorMantManual
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppValorMantManual'
          mmHeight = 4022
          mmLeft = 794
          mmTop = 794
          mmWidth = 13716
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10848
        mmPrintPosition = 0
        object ppLine2: TppLine
          UserName = 'Line3'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 10848
          mmLeft = 0
          mmTop = 0
          mmWidth = 284163
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'VALOR_CREDITO'
          DataPipeline = ppValorMantManual
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMantManual'
          mmHeight = 3969
          mmLeft = 101071
          mmTop = 794
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'VALOR_DEBITO'
          DataPipeline = ppValorMantManual
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMantManual'
          mmHeight = 3969
          mmLeft = 132292
          mmTop = 794
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'VALOR_NO_MES_CREDITO'
          DataPipeline = ppValorMantManual
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMantManual'
          mmHeight = 3969
          mmLeft = 165629
          mmTop = 794
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'VALOR_FORA_DO_MES_CREDITO'
          DataPipeline = ppValorMantManual
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMantManual'
          mmHeight = 3969
          mmLeft = 232305
          mmTop = 794
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'VALOR_NO_MES_DEBITO'
          DataPipeline = ppValorMantManual
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMantManual'
          mmHeight = 3969
          mmLeft = 198967
          mmTop = 794
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'VALOR_FORA_DO_MES_DEBITO'
          DataPipeline = ppValorMantManual
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValorMantManual'
          mmHeight = 3969
          mmLeft = 265642
          mmTop = 794
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650612
        4C69717569646F546F74616C4F6E43616C630B50726F6772616D54797065070B
        747450726F63656475726506536F7572636506A170726F636564757265204C69
        717569646F546F74616C4F6E43616C63287661722056616C75653A2056617269
        616E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D20466F726D61
        74466C6F617428272323232C2323232C2323232C2323302E3030272C536F6D61
        746F72696F4372656469746F2E56616C7565202D20536F6D61746F72696F4465
        6269746F2E56616C7565290D0A0D0A656E643B0D0A0D436F6D706F6E656E744E
        616D65060C4C69717569646F546F74616C094576656E744E616D6506064F6E43
        616C63074576656E74494402210000}
    end
    object ppParameterList1: TppParameterList
    end
  end
end
