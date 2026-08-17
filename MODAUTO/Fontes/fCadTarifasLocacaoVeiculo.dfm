inherited frmCadTarifasLocacaoVeiculos: TfrmCadTarifasLocacaoVeiculos
  Left = 230
  Top = 130
  HelpContext = 4170007
  Caption = 'Tarifas - Cadastro de Locação de Veículos'
  ClientHeight = 511
  ClientWidth = 727
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 727
    Height = 425
    inherited pnlMestre: TPanel
      Width = 725
      Height = 58
      BevelInner = bvLowered
      Font.Style = []
      ParentFont = False
      object lblDescricao: TLabel
        Left = 303
        Top = 10
        Width = 89
        Height = 13
        Caption = 'Descrição do Perfil'
      end
      object dbedDescricao: TwwDBEdit
        Left = 302
        Top = 25
        Width = 411
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBRadioGroup2: TDBRadioGroup
        Tag = 1
        Left = 16
        Top = 9
        Width = 269
        Height = 37
        Caption = 'Grupo'
        Columns = 3
        DataField = 'TIPOGRUPOVEICULO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Items.Strings = (
          'Econômico'
          'Intermediário'
          'Executivo')
        ParentFont = False
        TabOrder = 1
        TabStop = True
        Values.Strings = (
          'E'
          'I'
          'X')
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 70
      Width = 725
      Height = 354
      Align = alBottom
      Tabs.Strings = (
        'Valores ')
      detdbGrids.Strings = (
        'dbgrdDet'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 627
        Height = 295
        OnChange = pgctrlDetalheChange
        inherited tbsDet: TTabSheet
          Caption = 'Valores'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 619
            Height = 106
            Selected.Strings = (
              'DATADSTVALORES'#9'14'#9'Data Vigência'
              'DSC_LOCAL'#9'10'#9'Local'#9'F'
              'MOESIGLA'#9'13'#9'Sigla Moeda'
              'VLCONTROLADODIARIA'#9'10'#9'Vl.Cont.Diária'
              'VLCONTROLADOKMRODADO'#9'10'#9'Vl.Cont.Km Rodado'
              'VLKMLIVREDIARIA'#9'10'#9'Vl.KmLivre Diária'
              'VLKMLIVRESEMANA'#9'10'#9'Vl.KmLivre Semana'
              'VLKMLIVREDIAEXTRA'#9'10'#9'Vl.KmLivre Dia Extra')
            Align = alTop
            Color = clWhite
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap, dgPerfectRowFit]
            ParentFont = False
            OnDblClick = nil
          end
          inherited pnlControlesDet: TPanel [1]
            Top = 106
            Width = 619
            Height = 160
            Align = alTop
            BevelInner = bvLowered
            BevelOuter = bvLowered
            Font.Style = []
            ParentFont = False
            object Label4: TLabel
              Left = 18
              Top = 19
              Width = 82
              Height = 13
              Caption = 'Data de Vigência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label5: TLabel
              Left = 77
              Top = 83
              Width = 129
              Height = 13
              Caption = 'Valores Km Controlado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label2: TLabel
              Left = 364
              Top = 19
              Width = 33
              Height = 13
              Caption = 'Moeda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label1: TLabel
              Left = 137
              Top = 107
              Width = 56
              Height = 13
              Caption = 'Km Rodado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label6: TLabel
              Left = 383
              Top = 83
              Width = 96
              Height = 13
              Caption = 'Valores Km Livre'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel
              Left = 371
              Top = 107
              Width = 39
              Height = 13
              Caption = 'Semana'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 254
              Top = 108
              Width = 27
              Height = 13
              Caption = 'Diária'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Shape1: TShape
              Left = 18
              Top = 98
              Width = 221
              Height = 2
              Brush.Color = clSilver
            end
            object Label3: TLabel
              Left = 19
              Top = 107
              Width = 27
              Height = 13
              Caption = 'Diária'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Shape2: TShape
              Left = 252
              Top = 98
              Width = 341
              Height = 2
              Brush.Color = clSilver
            end
            object Label9: TLabel
              Left = 489
              Top = 107
              Width = 43
              Height = 13
              Caption = 'Dia Extra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dbDtVigencia: TCMDateTimePicker
              Left = 18
              Top = 34
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATADSTVALORES'
              DataSource = dsDet
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
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 0
            end
            object dbValor1: TDBRealEdit
              Left = 18
              Top = 122
              Width = 103
              Height = 21
              Hint = 'Se For Abatimento, Coloque o Valor Negativo'
              Alignment = taRightJustify
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Lines.Strings = (
                '0,00')
              ParentFont = False
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
              DataField = 'VLCONTROLADODIARIA'
              DataSource = dsDet
            end
            object DBlkpMoeda: TwwDBLookupCombo
              Left = 364
              Top = 34
              Width = 152
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'10'#9'Sigla'#9'F')
              DataField = 'MOECODIGO'
              DataSource = dsDet
              LookupTable = cdsMoeda
              LookupField = 'MOECODIGO'
              DropDownWidth = 314
              ParentFont = False
              TabOrder = 2
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object dbrgLocal: TDBRadioGroup
              Tag = 1
              Left = 176
              Top = 21
              Width = 154
              Height = 35
              Hint = 'Tipo de Movimento'
              Caption = 'Local:'
              Columns = 2
              DataField = 'TIPOLOCAL'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Items.Strings = (
                'País'
                'Exterior')
              ParentFont = False
              TabOrder = 1
              TabStop = True
              Values.Strings = (
                'P'
                'E')
            end
            object dbValor2: TDBRealEdit
              Left = 136
              Top = 122
              Width = 103
              Height = 21
              Hint = 'Se For Abatimento, Coloque o Valor Negativo'
              Alignment = taRightJustify
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Lines.Strings = (
                '0,00')
              ParentFont = False
              TabOrder = 4
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
              DataField = 'VLCONTROLADOKMRODADO'
              DataSource = dsDet
            end
            object dbValor5: TDBRealEdit
              Left = 489
              Top = 122
              Width = 103
              Height = 21
              Hint = 'Se For Abatimento, Coloque o Valor Negativo'
              Alignment = taRightJustify
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Lines.Strings = (
                '0,00')
              ParentFont = False
              TabOrder = 7
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
              DataField = 'VLKMLIVREDIAEXTRA'
              DataSource = dsDet
            end
            object dbValor4: TDBRealEdit
              Left = 371
              Top = 122
              Width = 103
              Height = 21
              Hint = 'Se For Abatimento, Coloque o Valor Negativo'
              Alignment = taRightJustify
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Lines.Strings = (
                '0,00')
              ParentFont = False
              TabOrder = 6
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
              DataField = 'VLKMLIVRESEMANA'
              DataSource = dsDet
            end
            object dbValor3: TDBRealEdit
              Left = 254
              Top = 123
              Width = 103
              Height = 21
              Hint = 'Se For Abatimento, Coloque o Valor Negativo'
              Alignment = taRightJustify
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Lines.Strings = (
                '0,00')
              ParentFont = False
              TabOrder = 5
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
              DataField = 'VLKMLIVREDIARIA'
              DataSource = dsDet
            end
          end
        end
        object tsCargo: TTabSheet
          Caption = 'Cargos'
          ImageIndex = 1
          object pnlAssociacao: TPanel
            Left = 0
            Top = 0
            Width = 619
            Height = 267
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Splitter1: TSplitter
              Left = 0
              Top = 0
              Width = 5
              Height = 267
              Cursor = crHSplit
              Beveled = True
            end
            object pnlNaoAssociados: TPanel
              Left = 5
              Top = 0
              Width = 266
              Height = 267
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object gridCNA: TwwDBGrid
                Left = 0
                Top = 53
                Width = 266
                Height = 214
                Selected.Strings = (
                  'TITULO'#9'40'#9'TITULO')
                IniAttributes.Delimiter = ';;'
                TitleColor = clGray
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsTarifaXCargo_NS
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                KeyOptions = []
                MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
                Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit, dgMultiSelect]
                ParentFont = False
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
              object Panel2: TPanel
                Left = 0
                Top = 0
                Width = 266
                Height = 26
                Align = alTop
                BevelInner = bvLowered
                Caption = 'Cargos Não Associados'
                Color = clGray
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
              end
              object Panel1: TPanel
                Left = 0
                Top = 26
                Width = 266
                Height = 27
                Align = alTop
                BevelOuter = bvLowered
                TabOrder = 2
                object isPesquisaCargo: TwwIncrementalSearch
                  Left = 6
                  Top = 3
                  Width = 252
                  Height = 21
                  DataSource = dsTarifaXCargo_NS
                  SearchField = 'TITULO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  HideSelection = False
                  ParentFont = False
                  TabOrder = 0
                end
              end
            end
            object pnlAssociados: TPanel
              Left = 313
              Top = 0
              Width = 306
              Height = 267
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object gridCA: TwwDBGrid
                Left = 0
                Top = 25
                Width = 306
                Height = 242
                Selected.Strings = (
                  'TITULO'#9'40'#9'TITULO')
                IniAttributes.Delimiter = ';;'
                TitleColor = clGray
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsTarifaXCargo_S
                KeyOptions = []
                MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
                Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit, dgMultiSelect]
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
              object Panel3: TPanel
                Left = 0
                Top = 0
                Width = 306
                Height = 25
                Align = alTop
                BevelInner = bvLowered
                Caption = 'Cargos Associados'
                Color = clGray
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
              end
            end
            object pnlBotoesAssociacao: TPanel
              Left = 271
              Top = 0
              Width = 42
              Height = 267
              Align = alLeft
              Constraints.MaxWidth = 42
              Constraints.MinHeight = 168
              Constraints.MinWidth = 42
              TabOrder = 2
              object sbtnAdicionarTudo: TSpeedButton
                Left = 2
                Top = 8
                Width = 39
                Height = 34
                Hint = 'Associar Todos'
                Enabled = False
                Flat = True
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
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnAdicionarTudoClick
              end
              object sbtnAdicionar: TSpeedButton
                Left = 2
                Top = 47
                Width = 39
                Height = 34
                Hint = 'Associar Cargo(s) Selecionado(s)'
                Enabled = False
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                  88888887788888778F88880666666666088888788888F88878F880E6666F6666
                  608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
                  66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
                  66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
                  660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
                  6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
                  8888888778FFFF77888888888000008888888888877777888888}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnAdicionarClick
              end
              object sbtnRemover: TSpeedButton
                Left = 2
                Top = 86
                Width = 39
                Height = 34
                Hint = 'Desassociar Cargo(s) Selecionado(s)'
                Enabled = False
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                  88888887788888778F88880666666666088888788888F88878F880E6666F6666
                  608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
                  66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
                  66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
                  660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
                  6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
                  8888888778FFFF77888888888000008888888888877777888888}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnRemoverClick
              end
              object sbtnRemoverTudo: TSpeedButton
                Left = 2
                Top = 125
                Width = 39
                Height = 34
                Hint = 'Desassociar Todos'
                Enabled = False
                Flat = True
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
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnRemoverTudoClick
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 717
      end
      inherited Dock974: TDock97
        Left = 631
        Height = 295
        inherited tb97Detalhe: TToolbar97
          inherited bbtnVoltarDet: TBitBtn
            Enabled = False
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 727
  end
  inherited Dock971: TDock97
    Top = 472
    Width = 727
    inherited tb97Fundo: TToolbar97
      Left = 431
      DockPos = 431
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 4170007
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 262
      DockPos = 262
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 625
    Top = 2
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 83
    Top = 83
  end
  inherited ImlPadrao: TImageList
    Left = 568
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    Operacao = opVazio
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 165
    Top = 36
  end
  inherited Cds: TCMClientDataSet
    Left = 84
    Top = 31
    object CdsIDDSTTARIFA: TFloatField
      FieldName = 'IDDSTTARIFA'
    end
    object CdsMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object CdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsINDTIPO: TFloatField
      FieldName = 'INDTIPO'
    end
    object CdsTIPOGRUPOVEICULO: TStringField
      FieldName = 'TIPOGRUPOVEICULO'
      FixedChar = True
      Size = 1
    end
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      
        'DECODE(TIPOGRUPOVEICULO, '#39'E'#39', '#39'ECONÔMICO'#39', DECODE(TIPOGRUPOVEICU' +
        'LO, '#39'I'#39', '#39'INTERMEDIÁRIO'#39', DECODE(TIPOGRUPOVEICULO, '#39'X'#39', '#39'EXECUTI' +
        'VO'#39', '#39#39')))'
      'DT.DESCRICAO'
      
        'DECODE(DV.TIPOLOCAL, '#39'P'#39', '#39'PAÍS'#39', DECODE(DV.TIPOLOCAL, '#39'E'#39','#39'EXTE' +
        'RIOR'#39', '#39' '#39')) AS DSC_LOCAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Grupo'
      'Perfil'
      'Local')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DSTTARIFA DT'
      'DSTVALORES DV')
    CamposChave.Strings = (
      'DT.IDDSTTARIFA'
      'DT.INDTIPO')
    Filtro.Strings = (
      'DT.IDDSTTARIFA = DV.IDDSTTARIFA (+)'
      'DT.INDTIPO = 4')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '20'
      '12')
    OperComparador.Strings = (
      '0'
      '0'
      '0')
    UsaDistinct = True
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 298
    Top = 15
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 488
    Top = 5
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    DataSet = cdsValores
    Left = 414
    Top = 57
  end
  object qryValores: TCMSqlParams
    SQL.Strings = (
      'select DATADSTVALORES, VLRDST,'
      'TIPOLOCAL, dstValores.MOECODIGO, IDDSTTARIFA,'
      
        'DECODE(TIPOLOCAL, '#39'P'#39', '#39'PAÍS'#39', DECODE(TIPOLOCAL, '#39'E'#39','#39'EXTERIOR'#39',' +
        ' '#39' '#39')) AS DSC_LOCAL,'
      ' MOEDA.MOESIGLA, MOEDA.MOEDESC,'
      ' VLCONTROLADODIARIA,'
      'VLCONTROLADOKMRODADO,'
      'VLKMLIVREDIARIA,'
      'VLKMLIVRESEMANA,'
      'VLKMLIVREDIAEXTRA,'
      ' dstaeroporto.IDDSTAEROPORTO, dstaeroporto.NMEDSTAEROPORTO'
      'from dstValores, moeda, dstaeroporto'
      'where dstValores.moecodigo = moeda.moecodigo and'
      'dstvalores.iddstaeroporto = dstaeroporto.iddstaeroporto'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsValores
    Left = 417
    Top = 121
  end
  object cdsMoeda: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 348
    Top = 160
    Data = {
      C44B00009619E0BD01000000180000001100F4000000030000009602094D4F45
      434F4449474F08000400000000001149445553554152494F494E434C5553414F
      0800040000000000074D4F454445534301004900000001000557494454480200
      02001400084D4F455349474C410100490000000100055749445448020002000A
      00104D4F45504552494F44494349444144450100490000000200075355425459
      5045020049000A00466978656443686172000557494454480200020001000A4D
      4F45494E415449564F01004900000002000753554254595045020049000A0046
      6978656443686172000557494454480200020001000C464C475045524356414C
      4F5201004900000002000753554254595045020049000A004669786564436861
      72000557494454480200020001000E4641544F52434F4E56455253414F080004
      00000000000A44415441494E4943494F0800080000000000074441544146494D
      08000800000000000F4D4F4544415245464552454E4349410800040000000000
      0D5452474454494E434C5553414F08000800000000000F54524755534552494E
      434C5553414F0100490000000100055749445448020002001E000C464C475449
      504F5052415A4F01004900000002000753554254595045020049000A00466978
      656443686172000557494454480200020001000A464C47504552494F444F0100
      4900000002000753554254595045020049000A00466978656443686172000557
      494454480200020001000F44455343554E494441444554415841010049000000
      0100055749445448020002001E0010464C4754455354414441544153434F5401
      004900000002000753554254595045020049000A004669786564436861720005
      57494454480200020001000100044C4349440400010009080000000000154400
      00000000004066400000000004C11241114947504D20494E56455354494D454E
      544F08494E565F4947504D01440141015600000000000000000058D7982CB7CC
      4208434D333037323635014E0153000000154400000000000080664000000000
      04C112410A5441584120414E42494409494E565F414E42494401440141015600
      0000000000000000289D8446B7CC4208434D333037323635014E015300000015
      44000000000000E066400000000004C112410954415841204F56455208494E56
      5F4F564552014401410156000000000000000000E0D04D55B7CC4208434D3330
      37323635014E015300000015440000000000004067400000000004C112410B54
      5220504F5550414E434106494E565F5452014401410156000000000000000000
      646ABC64B7CC4208434D333037323635014E01530000001014000000000000E0
      67400000000004C1124110435245464953554C204C454153494E470A494E565F
      435245464953014401410156000000000000F03F00005E17A6A9CC4200002C84
      5D40CB4200D03AF8C3B7CC4208434D333037323635045245414C015300000010
      140000000000000068400000000004C112410A4341534120414E474C4F09494E
      565F414E474C4F014401410156000000000000F03F0000CA6F3BAACC4200002C
      845D40CB42006C9EF8C3B7CC4208434D333037323635045245414C0153000000
      10140000000000002068400000000004C112411454454C455452555354205245
      43454249564549530A494E565F545452555354014401410156000000000000F0
      3F0000C26383A3CC4200002C845D40CB420068F2F8C3B7CC4208434D33303732
      3635045245414C015300000010140000000000006068400000000004C112410A
      534552524120415A554C0A494E565F5352415A554C0144014101560000000000
      00F03F00007011C1AFCC4200002C845D40CB420058A308FAB7CC4208434D3330
      37323635045245414C0153000040151400000000000080684000000000B88912
      410D494E50432050524F56C156454C08494E504350524F56014D014101560038
      254DD5B8CC4208434D333033373236082520616F206DEA73014E000040151400
      0000000000C0684000000000B88912410D4947504D2050524F56C156454C0849
      47504D50524F56014D0141015000A48A4ED5B8CC4208434D3330333732360825
      20616F206DEA73014E0000401514000000000000E0684000000000B88912410F
      49475044492050524F4A455441444F0A494750444950524F4A45014D01490150
      00986854D5B8CC4208434D333033373236082520616F206DEA73015300004015
      5400000000000000694000000000B6A9264114556E69642050616472E36F2064
      652056656E646103555056014D01410156009C28AC27B9CC4208434D37343236
      31390153000040151400000000000020694000000000D0AC12410F494E504320
      50455353494D4953544108494E504350455353014D0141015600849CF65DB9CC
      4208434D333035393732082520616F206DEA73014E0000401514000000000000
      40694000000000D0AC12410F4947504D2050455353494D49535441084947504D
      50455353014D01410150000CAAF75DB9CC4208434D333035393732082520616F
      206DEA73014E000040101400000000000060694000000000D0AC124114494750
      44492050524F4A2050455353494D4953540A494750444950524F5045014D0149
      01560000E2373DB9CC42000046778AB9CC4200E057F85DB9CC4208434D333035
      393732082520616F206DEA730153000040101400000000000080694000000000
      D0AC124114494E434344492050524F4A2050455353494D49530A494E43435052
      4F504553014D014901560000E2373DB9CC42000046778AB9CC420014F6F85DB9
      CC4208434D333035393732082520616F206DEA73015300004010140000000000
      00A0694000000000D0AC1241144344492050524F4A452050455353494D495354
      410A4344492050524F504553014D014901560000E2373DB9CC42000046778AB9
      CC4200643CF95DB9CC4208434D333035393732082520616F20616E6F01530000
      401514000000000000C0694000000000D0AC124114544158412053454C494320
      50455353494D4953540953454C494350455353014D0141015000B482F95DB9CC
      4208434D333035393732082520616F20616E6F014E0000401514000000000000
      E0694000000000D0AC12410D54522050455353494D4953544106545250455353
      014D014101500068E2F95DB9CC4208434D3330353937320825204E4F204DCA53
      014E0000401514000000000000006A4000000000D0AC12411449424F56205052
      4F4A2050455353494D495354410849424F5650455353014D0141015600A455FA
      5DB9CC4208434D33303539373206504F4E544F53014E00004015140000000000
      00206A4000000000D0AC12410D494E5043204F54494D4953544108494E50434F
      54494D014D0141015600C4FC005EB9CC4208434D333035393732082520616F20
      6DEA73014E0000401514000000000000406A4000000000D0AC12410D4947504D
      204F54494D49535441084947504D4F54494D014D01410150007433015EB9CC42
      08434D333035393732082520616F206DEA73014E000040101400000000000060
      6A4000000000D0AC12411349475044492050524F4A204F54494D495354410A49
      4750444950524F5449014D014901560000E2373DB9CC42000046778AB9CC4200
      D077015EB9CC4208434D333035393732082520616F206DEA7301530000401014
      000000000000806A4000000000D0AC124114494E434344492050524F4A204F54
      494D495354410A494E434350524F4F5449014D014901560000E2373DB9CC4200
      0046778AB9CC420038BA015EB9CC4208434D333035393732082520616F206DEA
      7301530000401014000000000000A06A4000000000D0AC124111434449205052
      4F4A204F54494D495354410A4344492050524F4F5449014D014901560000E237
      3DB9CC42000046778AB9CC420000ED015EB9CC4208434D333035393732082520
      616F20616E6F01530000401514000000000000C06A4000000000D0AC12411354
      4158412053454C4943204F54494D495354410953454C49434F54494D014D0141
      0150000416025EB9CC4208434D333035393732082520616F20616E6F014E0000
      401514000000000000E06A4000000000D0AC12410B5452204F54494D49535441
      0654524F54494D014D0141015000A84E025EB9CC4208434D3330353937320825
      204E4F204DCA53014E0000401514000000000000006B4000000000D0AC124112
      49424F562050524F4A204F54494D495354410849424F564F54494D014D014101
      56004C87025EB9CC4208434D33303539373206504F4E544F53014E0000401454
      000000000000206B400000000004C11241134C4654452053414E544120434154
      4152494E410A494E565F4C46544553430144014101560000347D6FB3CC420078
      29FA64BACC4208434D33303732363501530000401454000000000000406B4000
      0000001013F74013434F544120434F525245C7C34F20524542303209434F5441
      52454230320144014101560000E6E172B7CC420080549EE7BACC4207434D3934
      35313301530000401014000000000000606B4000000000B6A9264114496E6420
      507265E76F20436F6E7320416D706C6F0A49504341284942474529014D014101
      500000E2373DB9CC42000056D7ADBCCC420094D9B239BBCC4208434D37343236
      3139064D656E73616C01530000001544000000000000388F4000000000000000
      401253414C4152494F204D494E494D4F205453540953414C4D494E494D4F014D
      014101560000000000000000003C3787E9BDCC420E43415247415F4C454F4E41
      52444F014E01530000401554000000000000E06B4000000000EC9A264105494E
      50434105494E504341014D014101500054E83B85BDCC4208434D373430373236
      01530000401554000000000000C06B4000000000B48D17411153414C4152494F
      204D494E494D4F20524A0853414C4D494E524A014D01410156008875E128BDCC
      4208434D33383539303101530000000414000000000000606740000000000C15
      13410853414C4D494E524A0853414C4D494E524A014D01410156000000000000
      F03F0000CA551BB7CC42000000000000F03F00347FA1A0BBCC4208434D333132
      363433045245414C01530000401554000000000000006C4000000000B6A92641
      044F55524F084F55524F20434F54014401410156007891364EBECC4208434D37
      343236313901530000401554000000000000406C4000000000B6A92641114950
      434120494E56455354494D454E544F08494E565F49504341014D014101500040
      9E01C7BECC4208434D37343236313901530000401554000000000000606C4000
      000000B6A9264110496E646963652042726173696C20353007494252582D3530
      01440141015000549AC411BFCC4208434D373432363139015300004015540000
      00000000806C4000000000B6A9264114496E646963652042726173696C203530
      204DE96409494252582D35302F4D01440141015000E439E511BFCC4208434D37
      343236313901530000401554000000000000A06C40000000009000F740074947
      5044492D410749475044492D41014D014101500070165A16BFCC4207434D3934
      32313701530000401554000000000000C06C4000000000001B2A410B4A55525F
      544652325F524A0A4A55525F54465232524A014D01410156000C2A8336C1CC42
      08434D383535343234014E0000401554000000000000E06C4000000000001B2A
      41094A55525F544A5F524A084A55525F544A524A014D0141015600F8568336C1
      CC4208434D383535343234014E0000401554000000000000006D400000000000
      1B2A410A4A55525F5452545F524A094A55525F545254524A014D0141015600E4
      838336C1CC4208434D383535343234014E0000401554000000000000206D4000
      000000001B2A410C4A55525F54524656465F4D470A4A55525F545246564D4701
      4D0141015600F47A3145C1CC4208434D383535343234014E0000401554000000
      000000406D4000000000001B2A410A4A55525F5452545F4D47094A55525F5452
      544D47014D0141015600349A3145C1CC4208434D383535343234014E00004015
      54000000000000606D4000000000900EF740094A55525F544A5F5343084A5552
      5F544A5343014D0141015600F48CFD61C1CC4207434D3934343431014E000040
      1554000000000000806D4000000000900EF7400A4A55525F5452545F5052094A
      55525F5452545052014D014101560078E8FF61C1CC4207434D3934343431014E
      0000401554000000000000A06D4000000000900EF7400A4A55525F5452545F52
      53094A55525F5452545253014D014101560048550462C1CC4207434D39343434
      31014E0000401554000000000000C06D4000000000900EF740094A55525F544A
      5F5253084A55525F544A5253014D014101560044A90462C1CC4207434D393434
      3431014E0000401554000000000000E06D4000000000900EF7400A4A55525F54
      52545F5350094A55525F5452545350014D014101560010E7FD63C1CC4207434D
      3934343431014E0000401554000000000000006E4000000000900EF7400A4A55
      525F5452545F5343094A55525F5452545343014D0141015600FC13FE63C1CC42
      07434D3934343431014E0000401554000000000000206E4000000000900EF740
      0A4A55525F5452545F5042094A55525F5452545042014D01410156000C3BFE63
      C1CC4207434D3934343431014E0000401554000000000000406E400000000090
      0EF7400A4A55525F5452545F414D094A55525F545254414D014D014101560094
      A4C064C1CC4207434D3934343431014E0000401554000000000000606E400000
      0000900EF7400A4A55525F5452545F5252094A55525F5452545252014D014101
      56000856C364C1CC4207434D3934343431014E0000401554000000000000806E
      4000000000900EF7400A4A55525F5452545F4241094A55525F5452544241014D
      01410156009456CD64C1CC4207434D3934343431014E00004015540000000000
      00A06E4000000000900EF740094A55525F544A5F4D47084A55525F544A4D4701
      4D0141015600B868BC7BC1CC4207434D3934343431014E000040155400000000
      0000C06E4000000000900EF740094A55525F544A5F5350084A55525F544A5350
      014D01410156001CF7E77BC1CC4207434D3934343431014E0000401554000000
      000000E06E4000000000900EF7400A4A55525F5452545F4553094A55525F5452
      544553014D01410156005C316985C1CC4207434D3934343431014E0000401554
      000000000000006F4000000000900EF7400A4A55525F5452545F414C094A5552
      5F545254414C014D0141015600AC883990C1CC4207434D3934343431014E0000
      401554000000000000206F4000000000900EF740094A55525F544A5F414C084A
      55525F544A414C014D0141015600A4B33990C1CC4207434D3934343431014E00
      00401554000000000000406F4000000000900EF740094A55525F544A5F505208
      4A55525F544A5052014D014101560038A6A697C1CC4207434D3934343431014E
      0000401554000000000000606F4000000000900EF740094A55525F544A5F5042
      084A55525F544A5042014D014101560054CBA697C1CC4207434D393434343101
      4E0000401554000000000000806F4000000000900EF740094A55525F544A5F47
      4F084A55525F544A474F014D014101560058F4A697C1CC4207434D3934343431
      014E0000401554000000000000A06F4000000000900EF740094A55525F544A5F
      4345084A55525F544A4345014D0141015600BC0DA797C1CC4207434D39343434
      31014E0000401554000000000000C06F4000000000900EF740094A55525F544A
      5F4D53084A55525F544A4D53014D0141015600B40B409FC1CC4207434D393434
      3431014E0000401554000000000000E06F4000000000900EF7400A4A55525F54
      52545F5041094A55525F5452545041014D0141015600F447509FC1CC4207434D
      3934343431014E000040155400000000000000704000000000900EF7400A4A55
      525F5452545F4150094A55525F5452544150014D01410156002869509FC1CC42
      07434D3934343431014E000040155400000000000010704000000000900EF740
      0A4A55525F5452545F5049094A55525F5452545049014D01410156002094509F
      C1CC4207434D3934343431014E00004015540000000000002070400000000090
      0EF7400A4A55525F5452545F5045094A55525F5452545045014D01410156002C
      DF75AFC1CC4207434D3934343431014E00004015540000000000003070400000
      0000900EF7400A4A55525F5452545F524E094A55525F545254524E014D014101
      5600C43B0BB2C1CC4207434D3934343431014E00004015540000000000004070
      4000000000900EF7400A4A55525F5452545F5345094A55525F5452545345014D
      01410156001C4CFDC5C1CC4207434D3934343431014E00004015540000000000
      0050704000000000900EF7400A4A55525F5452545F4446094A55525F54525444
      46014D0141015600F8F19AD8C1CC4207434D3934343431014E00004015540000
      0000000060704000000000900EF7400A4A55525F5452545F4D54094A55525F54
      52544D54014D014101560008199BD8C1CC4207434D3934343431014E00004015
      5400000000000070704000000000C4A32641094A55525F544A5F4446084A5552
      5F544A4446014D0141015600D84F443CC2CC4208434D373431383538014E0000
      40155400000000000080704000000000C4A32641094A55525F544A5F5045084A
      55525F544A5045014D014101560020084E3CC2CC4208434D373431383538014E
      000040155400000000000090704000000000C4A32641094A55525F544A5F5049
      084A55525F544A5049014D0141015600285A4E3CC2CC4208434D373431383538
      014E0000401554000000000000A0704000000000C4A32641094A55525F544A5F
      524E084A55525F544A524E014D014101560070B9513CC2CC4208434D37343138
      3538014E0000401554000000000000B0704000000000C4A32641094A55525F54
      4A5F5345084A55525F544A5345014D0141015600B401523CC2CC4208434D3734
      31383538014E0000401554000000000000C0704000000000C4A32641094A5552
      5F544A5F4D41084A55525F544A4D41014D01410156004C3C523CC2CC4208434D
      373431383538014E0000401554000000000000D0704000000000C4A326410A4A
      55525F5452545F4D41094A55525F5452544D41014D01410156009853533CC2CC
      4208434D373431383538014E0000401554000000000000E0704000000000C4A3
      2641094A55525F544A5F4553084A55525F544A4553014D01410156009C7C533C
      C2CC4208434D373431383538014E0000401554000000000000F0704000000000
      C4A32641094A55525F4A465F5350084A55525F4A465350014D014101560090FB
      533CC2CC4208434D373431383538014E00004015540000000000000071400000
      0000C4A32641094A55525F544A5F414D084A55525F544A414D014D0141015600
      B81E543CC2CC4208434D373431383538014E0000401554000000000000107140
      00000000C4A32641094A55525F544A5F4D54084A55525F544A4D54014D014101
      5600B818553CC2CC4208434D373431383538014E000040155400000000000020
      714000000000C4A32641094A55525F544A5F5041084A55525F544A5041014D01
      41015600E03B553CC2CC4208434D373431383538014E00004015540000000000
      0030714000000000C4A32641094A55525F544A5F4150084A55525F544A415001
      4D01410156002C59553CC2CC4208434D373431383538014E0000401554000000
      00000040714000000000C4A32641094A55525F544A5F524F084A55525F544A52
      4F014D014101560024D6713CC2CC4208434D373431383538014E000040155400
      000000000050714000000000C4A326410A4A55525F5452545F524F094A55525F
      545254524F014D01410156009816723CC2CC4208434D373431383538014E0000
      40155400000000000060714000000000C4A326410A4A55525F5452545F434509
      4A55525F5452544345014D014101560048CA723CC2CC4208434D373431383538
      014E000040155400000000000070714000000000C4A326410A4A55525F545254
      5F4D53094A55525F5452544D53014D014101560094E7723CC2CC4208434D3734
      31383538014E000040155400000000000080714000000000C4A326410A4A5552
      5F5452545F474F094A55525F545254474F014D01410156002850A33CC2CC4208
      434D373431383538014E000040155400000000000090714000000000C4A32641
      094A55525F544A5F4241084A55525F544A4241014D0141015600B0E0A33CC2CC
      4208434D373431383538014E0000401554000000000000A0714000000000C4A3
      26410A4A55525F5452545F544F094A55525F545254544F014D014101560000B8
      D641C2CC4208434D373431383538014E0000401554000000000000B071400000
      0000C4A32641094A55525F544A5F544F084A55525F544A544F014D0141015600
      BCECD641C2CC4208434D373431383538014E0000401554000000000000C07140
      00000000900EF740094A55525F56465F5350084A55525F56465350014D014101
      560028BDB05DC2CC4207434D3934343431014E0000401554000000000000D071
      4000000000247D124106495043412D4506495043412D45015401410150000044
      2968C2CC4208434D33303239323101530000401454000000000000E071400000
      0000B6A9264114556E69646164652046697363616C2064652052650755464952
      2D524A0141014101560000F60673BECC4200707B1948C3CC4208434D37343236
      313901530000401454000000000000F07140000000001013F74010434F52525F
      42454E5F53414C4441444F0A494E50435F53414C4441014D014101560000FAFF
      3EC8CC42003CD6EC52C3CC4207434D3934353133015300004015140000000000
      000072400000000074A4264113444F4C41522056454E44412041444F5441444F
      0A43414D42494F41444F54014D0141015600B4024A19C4CC4208434D37343139
      3436134DC9444941204D454E53414C2052242F555324014E0000401514000000
      0000001072400000000074A4264114444F4C41522056454E4441204F54494D49
      5354410A43414D42494F4F54494D014D0141015600E88E4D19C4CC4208434D37
      3431393436134DC9444941204D454E53414C2052242F555324014E0000401514
      0000000000002072400000000074A4264114444F4C41522056454E4441205045
      5353494D49530A43414D42494F50455353014D01410156008CC74D19C4CC4208
      434D373431393436134DC9444941204D454E53414C2052242F555324014E0000
      4015140000000000003072400000000074A426410A54522041444F5441444F06
      545241444F54014D01410150004C369525C4CC4208434D373431393436082520
      4E4F204DCA53014E0000401514000000000000407240000000006E4F27410C49
      4E50432041444F5441444F08494E504341444F54014D01410156000033AA82C4
      CC4208434D373633383331082520616F206DEA73014E00004015140000000000
      00607240000000000E682C411149424F562050524F4A2041444F5441444F0849
      424F5641444F54014D01410156003025AB82C4CC4208434D3933303832330650
      4F4E544F53014E0000401514000000000000707240000000006E4F27410C4947
      504D2041444F5441444F084947504D41444F54014D0141015000C084AC82C4CC
      4208434D373633383331082520616F206DEA73014E0000401514000000000000
      907240000000006E4F27410D53454C49432041444F5441444F0953454C494341
      444F54014D0141015000B47AAE82C4CC4208434D373633383331082520616F20
      616E6F014E0000401454000000000000A07240000000001013F7400F434F5441
      204E4F564F20504C414E4F094E4F564F504C414E4F0144014101560000504BCD
      C5CC4200646334D7C4CC4207434D393435313301530000401554000000000000
      B0724000000000B6A926410947454A55525F54524E0947454A55525F54524E01
      4D0141015000EC56A80AC5CC4208434D37343236313901530000401554000000
      000000C0724000000000B6A9264107495043412D313507495043412D3135014D
      014101500094454D0BC5CC4208434D3734323631390153000040155400000000
      0000D0724000000000B6A92641054952462D4D054952462D4D01440141015600
      30D24F0DC5CC4208434D37343236313901530000401554000000000000E07240
      00000000B6A9264107494D412D43203507494D412D4320350144014101560084
      41500DC5CC4208434D37343236313901530000401554000000000000F0724000
      000000B6A9264108494D412D4320352B08494D412D4320352B01440141015600
      6470500DC5CC4208434D37343236313901530000401554000000000000007340
      00000000B6A926410B494D412D4320544F54414C0A494D412D4320544F544101
      4401410156003CCA500DC5CC4208434D37343236313901530000401554000000
      00000010734000000000B6A9264109494D412D474552414C09494D412D474552
      414C014401410156004CF1500DC5CC4208434D37343236313901530000401554
      00000000000020734000000000B6A9264105494D412D5305494D412D53014401
      41015600BC08510DC5CC4208434D373432363139015300004015540000000000
      0030734000000000B6A9264107494D412D42203507494D412D42203501440141
      0156002022510DC5CC4208434D37343236313901530000401554000000000000
      40734000000000B6A9264108494D412D4220352B08494D412D4220352B014401
      410156006C3F510DC5CC4208434D373432363139015300004015540000000000
      0050734000000000B6A926410B494D412D4220544F54414C0A494D412D422054
      4F544101440141015600B85C510DC5CC4208434D373432363139015300004014
      5400000000000060734000000000B6A926410F63E26D62696F2070726F76E176
      656C0A43616D62696F2070726F014D0141015600000898D7C5CC420004BEB9D8
      C5CC4208434D3734323631390153000040151400000000000070734000000000
      74A426410D4E544E2D4220323034352048500732303435204850014D01410150
      004C709D9AC6CC4208434D37343139343606414F20414E4F014E000040151400
      0000000000807340000000002EEE2D410F494252582035302041444F5441444F
      0A49425258353041444F54014D0141015600B4D833F7C6CC4208434D39383037
      353906504F4E544F53014E0000401514000000000000907340000000002EEE2D
      4110494252582035302050524F56C156454C0A49425258353050524F56014D01
      41015600BC2435F7C6CC4208434D39383037353906504F4E544F53014E000040
      1514000000000000A07340000000002EEE2D411049425258203530204F54494D
      495354410A4942525835304F54494D014D0141015600545F35F7C6CC4208434D
      39383037353906504F4E544F53014E0000401514000000000000B07340000000
      002EEE2D4112494252582035302050455353494D495354410A49425258353050
      455353014D01410156004C8A35F7C6CC4208434D39383037353906504F4E544F
      53014E0000401554000000000000C0734000000000B6A9264114494E44204E41
      4320434F4E53545220434956494C04494E4343014D0149015600F437092DC7CC
      4208434D37343236313901530000401454000000000000D07340000000001013
      F7400F436F727265E7E36F2046554E4345460A434F525F46554E434546014D01
      410156000010BC435BCC42005013CDDEC9CC4207434D39343531330153000040
      1554000000000000E073400000000096D626410D4950434120424E4445535041
      520A494E565F49504341424E014D014101500040D94C9ECACC4208434D373438
      33363301530000401454000000000000F07340000000001013F7401446554E43
      454620434F54412052454220323030320A46554E435F52454230320144014101
      560000EA29D5CCCC42001CC3B436CDCC4207434D393435313301530000401454
      000000000000007440000000001013F7401246554E43454620434F5441205245
      422039380A46554E435F52454239380144014101560000EA29D5CCCC42009C01
      B536CDCC4207434D393435313301530000401454000000000000107440000000
      001013F7400F434F5441205245422046554E4345460A5245425F46554E434546
      01440141015600005C428BAACC42005C962B48CDCC4207434D39343531330153
      0000401454000000000000207440000000001013F74014496E642E46756E646F
      2042656E2E2053616C642E054946524253014D014101560000FAFF3EC8CC4200
      305771EECECC4207434D39343531330153000040155400000000000030744000
      000000C08912410E504543554C494F204D494E494D4F095245424D494E504543
      014101410156000CDC133ED1CC4208434D333033373238015300004015540000
      0000000040744000000000C08912410C42454E4546204D494E494D4F09524542
      42454E4D494E01410141015600202C143ED1CC4208434D333033373238015300
      0040155400000000000050744000000000C08912411053414C205445544F2043
      4F4E545249420A4E505445544F434F4E5401410141015600F885143ED1CC4208
      434D3330333732380153000040155400000000000060744000000000C0891241
      1142454E4546204D494E494D4F2053414C440A42454E4D494E53414C44014101
      4101560058F3143ED1CC4208434D333033373238015300004015540000000000
      0070744000000000C08912410F42454E4546204D494E494D4F204E50084E5042
      454E4D494E01410141015600501E153ED1CC4208434D33303337323801530000
      40155400000000000080744000000000C089124110434553544120414C494D20
      4341495841094345535441414C494D014101410156000CDA5A4ED1CC4208434D
      3330333732380153000040155400000000000090744000000000C08912411141
      555820414C494D454E5420434149584107415558414C494D014101410156008C
      185B4ED1CC4208434D33303337323801530000401554000000000000B0744000
      000000C4A326410A47454A55525F494E50430A47454A55525F494E5043014D01
      4101500014BAD246D3CC4208434D373431383538015300004015540000000000
      00F0744000000000C4792F4112437573746F204F706F7274756E696461646506
      434F50203031014D0141015600C4E89F8BD8CC4209434D313033313339340153
      0000401554000000000000C0744000000000C4A326410A474A5F495043412D31
      350A474A5F495043412D3135014D01490150002C80DB46D3CC4208434D373431
      38353801530000401544000000000000E07440000000004EBB26410F5465746F
      20496E73732056616C6F720A5465746F496E73735672014D014101560000B232
      29D5CC4208434D373434383731014E01530000401544000000000000D0744000
      0000004EBB2641105465746F20496E737320CD6E646963650A5465746F496E73
      734964014D014101560000B23229D5CC4208434D373434383731014E01530000
      00155400000000000000F03F0000000000000040045245414C02522401440141
      0156000000000000000000202EEEB5AFCC4203434D3201530000001554000000
      000000001440000000000000004014554E49442E2046495343414C2E20524546
      2E2F4D06554649522F4D014D01410156000000000000000000F84DF2A9B0CC42
      03434D3201530000401554000000000000001C40000000000000004014494E44
      2E204E41432E20505245C74F20434F4E5304494E5043014D0141015000D87CF2
      A9B0CC4203434D32015300000015540000000000000022400000000000000040
      0D494E43432D444920284647562907494E43432D4449014D0141015000000000
      0000000000AC2A70AAB0CC4203434D3201530000001554000000000000002640
      00000000000000400B494750204D45524341444F044947504D014D0141015000
      00000000000000005C6170AAB0CC4203434D3201530000001554000000000000
      002A400000000000000040035552560355525601440141015600000000000000
      0000A0A970AAB0CC4203434D3201530000001554000000000000002C40000000
      00000000401454582E205245464552454E4349414C204E4F56410354524E0144
      01410150000000000000000000780371AAB0CC4203434D320153000000155400
      0000000000002E40000000000000004008504F5550414E434108504F5550414E
      4341014401410150000000000000000000A02671AAB0CC4203434D3201530000
      401554000000000000003140000000000000004014494750202D20444953502E
      20494E5445524E4120064947502D4449014D0149015000F83B72AAB0CC420343
      4D320153000000155400000000000000334000000000000000400D436F727265
      E7E36F20494E535308434F5252494E5353014D01410150000000000000000000
      1CE194AAB0CC4203434D32015300000015540000000000000034400000000000
      0000400D5265616A7573746520494E5353085245414A494E5353014D01410150
      000000000000000000A81D95AAB0CC4203434D32015300000015540000000000
      0000354000000000000000400E53414C4152494F204D494E494D4F0A53414C2E
      4D494E494D4F014D01410156000000000000000000C44295AAB0CC4203434D32
      015300000015540000000000000036400000000000000040115465746F206465
      2042656E65666963696F085445544F494E5353014D0141015600000000000000
      0000807795AAB0CC4203434D3201530000001554000000000000003840000000
      0000000040134F52544E2F4F544E2F42544E2F42544E2D5452074F544E2F4254
      4E014D0141015600000000000000000078955EB7B0CC4203434D320153000000
      1554000000000000003D400000000000000040084372757A6569726F03437224
      014401490156000000000000000000604ACAFEB0CC4203434D32015300000015
      54000000000000003F400000000000000040074372757A61646F03437A240144
      01490156000000000000000000783ACCFEB0CC4203434D320153000000155400
      000000000000404000000000000000400C4372757A61646F204E6F766F044E43
      7A240144014901560000000000000000001C73CCFEB0CC4203434D3201530000
      0015540000000000000041400000000000000040124661742E20436F72726563
      616F20496E7373065442494E5353014D0141015000000000000000000044370C
      AFB1CC4203434D32015300000015440000000000000042400000000000000040
      12496E64696365206E616F20636F727269676505494E44435A01410141015600
      000000000000000020953DD5B1CC4203434D32014E0153000000154400000000
      000000454000000000000000400B496E64696365205A65726F07494E44494345
      5A014D01410156000000000000000000401781F9B1CC4203434D32014E015300
      000015440000000000008045400000000000000040095465746F20486F726108
      5445544F484F5241014D01410156000000000000000000E44F81F9B1CC420343
      4D32014E01530000001544000000000000804640000000000000004012436F72
      7265E7E36F204D6F6E6574E172696106494E50433230014D0141015000000000
      00000000000028CE53B2CC4203434D32014E0153000040154400000000000000
      4B40000000000000004011544158412053454C4943204449C15249410553454C
      49430144014101500084D3D0B2B2CC4203434D32014E01530000001544000000
      000000004C4000000000000000401454617861204A75726F732052656D756E65
      7261740854784A75726F735201440141015600000000000000000034C553E8B2
      CC4203434D32014E01530000001544000000000000804D400000000000000040
      0D526561697320706F72204D696C0752242F3130303001410141015600000000
      00000000003CE023F5B2CC4203434D32014E0153000040100400000000000080
      4E4000000000000000400C494E43432D4D20284647562906494E43432D4D014D
      0141015000002C845D40CB4200002C845D40CB420034354F40B3CC4203434D32
      014E082520616F206DEA7301530000001544000000000000804F400000000000
      0000400D4947502D4D202D2056616C6F72054947504D56014D01410156000000
      0000000000008CD65473B3CC4203434D32014E01530000001544000000000000
      405040000000000097124114544158412042414E43415249412046494E414E43
      03544246014401410150000000000000000000EC167C8DB3CC4208434D333034
      353736014E01530000001544000000000000C0504000000000009712410A5441
      584120414E42494405414E4249440144014101500000000000000000008CFC82
      8DB3CC4208434D333034353736014E0153000000154400000000000040514000
      00000000971241094344422F4345544950094344422F43455449500144014101
      500000000000000000006450848DB3CC4208434D333034353736014E01530000
      401544000000000000C05140000000000097124113494E4449434520505245C7
      4F5320434F4E532E094950432D4D20464756014D014101500000BF978DB3CC42
      08434D333034353736014E015300004015440000000000004052400000000000
      97124114494E442E505245C74F5320434F4E532E464950450A49504320284649
      504529014D0141015000E064998DB3CC4208434D333034353736014E01530000
      401544000000000000C0524000000000009712410F4947502D4449202846554E
      434546290A4947502D44492046554E014D0141015000404F9A8DB3CC4208434D
      333034353736014E01530000001544000000000000C053400000000000971241
      0746475620313030074647562031303001440141015000000000000000000078
      0A9D8DB3CC4208434D333034353736014E015300004015440000000000004056
      40000000000097124114494E442E20425241532E20522D58204D4544494F0A49
      4252582F4D4544494F014401410156005827469CB3CC4208434D333034353736
      014E01530000401544000000000000405440000000000097124110494E444943
      45204942562F4D4544494F094942562F4D4544494F01440141015000D44E9D8D
      B3CC4208434D333034353736014E01530000401544000000000000C054400000
      0000009712410C44F36C61722028505441582907444F4C41524F560144014101
      5600384FF797B3CC4208434D333034353736014E015300000015440000000000
      00005540000000000097124107444F4C4152505608444F4C4152504152014401
      4101560000000000000000006C70F797B3CC4208434D333034353736014E0153
      000000154400000000000080554000000000009712411154582E4D4544494120
      434449204F564552094344495F43455449500144014101500000000000000000
      0010F00098B3CC4208434D333034353736014E01530000401544000000000000
      005640000000000097124114494E444943452042524153494C205241494F2D58
      04494252580144014101560054FE459CB3CC4208434D333034353736014E0153
      000000104400000000000040574000000000009712410D4372757A6569726F20
      5265616C034352240144014101560000000000000000000040742D98CC420000
      16E7869BCC4200E05253A8B4CC4208434D333034353736014E01530000001544
      00000000000080584000000000009712410643C24D42494F0643414D42494F01
      44014101560000000000000000009C8B0FC9B5CC4208434D333034353736014E
      0153000000154400000000000040584000000000009712410C5641524941C7C3
      4F2042544E0542544E2031014401410156000000000000000000104F0FC9B5CC
      4208434D333034353736014E01530000001544000000000000C0584000000000
      009712410A4641544F52204947504D074641544947504D014401410156000000
      000000000000C8D70FC9B5CC4208434D333034353736014E0153000000154400
      000000000000594000000000009712411349475020464756202D20494DD35645
      4953202005494750494D014401410156000000000000000000D02910C9B5CC42
      08434D333034353736014E015300000015440000000000004059400000000000
      97124105494E464C4105494E464C41014401410156000000000000000000D452
      10C9B5CC4208434D333034353736014E01530000001544000000000000C05940
      000000000097124110494E44494341444F522050414452C34F0650414452C34F
      014401410156000000000000000000180C13C9B5CC4208434D33303435373601
      4E01530000001544000000000000005A40000000000097124111544158412053
      454C4943204D454E53414C0753454C49432F4D014D0141015600000000000000
      0000D44013C9B5CC4208434D333034353736014E015300004015040000000000
      00005B4000000000009712410D4344492050524F4A455441444F094344492D50
      524F4A4501440149015600A492D0DFB5CC4208434D333034353736014E082520
      616F20616E6F01530000401504000000000000405B4000000000009712411444
      4F4C41522056454E44412050524F56C156454C0A43414D42494F50524F56014D
      0141015600DCDCD0DFB5CC4208434D333034353736014E134DC9444941204D45
      4E53414C2052242F555324014E0000401504000000000000005C400000000000
      9712411249424F562050524F4A2050524F56C156454C0849424F5650524F5601
      4D01410156001C5ED2EAB5CC4208434D333034353736014E06504F4E544F5301
      4E0000401544000000000000405C4000000000009712411449424F562E415449
      564F2050524F4A455441444F0A494256322550524F4A450144014901560000B6
      D2EAB5CC4208434D333034353736014E01530000401504000000000000805C40
      0000000000971241144947502D44492050524F4A455441444F20414E4F0A4947
      50444950524F4A41014D01490150006C21D3EAB5CC4208434D33303435373601
      4E0A414E55414C495A41444101530000401504000000000000C05C4000000000
      00971241134947502D4D2050524F4A455441444F20414E4F0A4947504D205052
      4F4A41014D01490156009444D3EAB5CC4208434D333034353736014E0A414E55
      414C495A41444101530000401504000000000000005D40000000000097124111
      494E43432D44492050524F4A455441444F0A494E434344492D50524F01440149
      015600D88CD3EAB5CC4208434D333034353736014E082520616F206DEA730153
      0000401504000000000000405D40000000000097124112494E50432050524F4A
      455441444F20414E4F0A494E50432050524F4A41014D0149015600DCB5D3EAB5
      CC4208434D333034353736014E0A414E55414C495A41444F0153000040150400
      0000000000805D40000000000097124113544158412053454C49432050524F56
      C156454C0953454C494350524F56014D0141015600B0E6D3EAB5CC4208434D33
      3034353736014E082520414F20414E4F014E0000001544000000000000C05D40
      00000000009712411453454D20494E44455841444F522045434F4E4F4D0A5345
      4D494E50524F4A450144014101560000000000000000003C23D4EAB5CC420843
      4D333034353736014E01530000401504000000000000005E4000000000009712
      410B54522050524F56C156454C06545250524F56014D0141015000BC61D4EAB5
      CC4208434D333034353736014E0825204E4F204DCA53014E0000001544000000
      000000805E4000000000009712411454582E4A55524F53204C4F4E474F205052
      415A4F04544A4C500144014101560000000000000000007878D9EAB5CC420843
      4D333034353736014E01530000001544000000000000405F40000000001013F7
      4014434F544120434F525245C7C34F205245504C414E08434F54415245504C01
      4D01410156000000000000000000C875EEECB5CC4207434D3934353133014E01
      530000401444000000000000C05F40000000001013F74013434F544120434F52
      5245C7C34F20524542393809434F5441524542393801440141015600005C428B
      AACC4200380AEFECB5CC4207434D3934353133014E0153000000154400000000
      0000606040000000000097124111554E49442E2046495343414C205245462E04
      5546495201440141015600000000000000000050CDD6FCB5CC4208434D333034
      353736014E0153000040154400000000000080604000000000009712410F494E
      444943452049424F5645535041064942562F535001440141015600D00BD7FCB5
      CC4208434D333034353736014E01530000401544000000000000A06040000000
      000097124113494E44494345204947504D202843455449502905494947504D01
      4D0141015000983ED7FCB5CC4208434D333034353736014E0153000040154400
      0000000000E06040000000000097124113494E4449434520494E504320284345
      544950290549494E5043014D01410150003848D8FCB5CC4208434D3330343537
      36014E0153000040154400000000000000614000000000009712411456414920
      534552204150414741444F202841432909494E5043204552524F014D01490156
      001877D8FCB5CC4208434D333034353736014E01530000001544000000000000
      2061400000000000971241134C45545241532046494E2E205445534F55524F03
      4C4654014401410156000000000000000000349CD8FCB5CC4208434D33303435
      3736014E01530000001544000000000000606140000000000097124114434144
      45524E45544120504F5550414EC741303106504F555030310144014101560000
      00000000000000CC53D9FCB5CC4208434D333034353736014E01530000001544
      00000000000080614000000000009712411443414445524E45544120504F5550
      414EC741303206504F555030320144014101560000000000000000000075D9FC
      B5CC4208434D333034353736014E01530000001544000000000000A061400000
      0000009712411443414445524E45544120504F5550414EC741303306504F5550
      30330144014101560000000000000000007C8AD9FCB5CC4208434D3330343537
      36014E01530000001544000000000000C0614000000000009712411443414445
      524E45544120504F5550414EC741303406504F55503034014401410156000000
      000000000000ECA1D9FCB5CC4208434D333034353736014E0153000000154400
      0000000000E0614000000000009712411443414445524E45544120504F555041
      4EC741303506504F555030350144014101560000000000000000005CB9D9FCB5
      CC4208434D333034353736014E01530000001544000000000000006240000000
      00009712411443414445524E45544120504F5550414EC741303606504F555030
      36014401410156000000000000000000E4CCD9FCB5CC4208434D333034353736
      014E015300000015440000000000002062400000000000971241144341444552
      4E45544120504F5550414EC741303706504F5550303701440141015600000000
      000000000048E6D9FCB5CC4208434D333034353736014E015300000015440000
      0000000040624000000000009712411443414445524E45544120504F5550414E
      C741303806504F55503038014401410156000000000000000000C4FBD9FCB5CC
      4208434D333034353736014E0153000000154400000000000060624000000000
      009712411443414445524E45544120504F5550414EC741303906504F55503039
      0144014101560000000000000000004011DAFCB5CC4208434D33303435373601
      4E0153000000154400000000000080624000000000009712411443414445524E
      45544120504F5550414EC741313006504F555031300144014101560000000000
      00000000BC26DAFCB5CC4208434D333034353736014E01530000001544000000
      000000A0624000000000009712411443414445524E45544120504F5550414EC7
      41313106504F55503131014401410156000000000000000000383CDAFCB5CC42
      08434D333034353736014E01530000001544000000000000C062400000000000
      9712411443414445524E45544120504F5550414EC741313206504F5550313201
      4401410156000000000000000000C04FDAFCB5CC4208434D333034353736014E
      01530000001544000000000000E0624000000000009712411443414445524E45
      544120504F5550414EC741313306504F55503133014401410156000000000000
      0000003C65DAFCB5CC4208434D333034353736014E0153000000154400000000
      000000634000000000009712411443414445524E45544120504F5550414EC741
      313406504F55503134014401410156000000000000000000B87ADAFCB5CC4208
      434D333034353736014E01530000001544000000000000206340000000000097
      12411443414445524E45544120504F5550414EC741313506504F555031350144
      014101560000000000000000001096DAFCB5CC4208434D333034353736014E01
      53000000154400000000000040634000000000009712411443414445524E4554
      4120504F5550414EC741313606504F5550313601440141015600000000000000
      00008CABDAFCB5CC4208434D333034353736014E015300000015440000000000
      0060634000000000009712411443414445524E45544120504F5550414EC74131
      3706504F5550313701440141015600000000000000000008C1DAFCB5CC420843
      4D333034353736014E0153000000154400000000000080634000000000009712
      411443414445524E45544120504F5550414EC741313806504F55503138014401
      41015600000000000000000090D4DAFCB5CC4208434D333034353736014E0153
      0000001544000000000000A0634000000000009712411443414445524E455441
      20504F5550414EC741313906504F555031390144014101560000000000000000
      0018E8DAFCB5CC4208434D333034353736014E01530000001544000000000000
      C0634000000000009712411443414445524E45544120504F5550414EC7413230
      06504F5550323001440141015600000000000000000094FDDAFCB5CC4208434D
      333034353736014E01530000001544000000000000E063400000000000971241
      1443414445524E45544120504F5550414EC741323106504F5550323101440141
      01560000000000000000000415DBFCB5CC4208434D333034353736014E015300
      0000154400000000000000644000000000009712411443414445524E45544120
      504F5550414EC741323206504F55503232014401410156000000000000000000
      682EDBFCB5CC4208434D333034353736014E0153000000154400000000000020
      644000000000009712411443414445524E45544120504F5550414EC741323306
      504F55503233014401410156000000000000000000F041DBFCB5CC4208434D33
      3034353736014E01530000001544000000000000406440000000000097124114
      43414445524E45544120504F5550414EC741323406504F555032340144014101
      560000000000000000006059DBFCB5CC4208434D333034353736014E01530000
      00154400000000000060644000000000009712411443414445524E4554412050
      4F5550414EC741323506504F55503235014401410156000000000000000000E8
      6CDBFCB5CC4208434D333034353736014E015300000015440000000000008064
      4000000000009712411443414445524E45544120504F5550414EC74132360650
      4F555032360144014101560000000000000000007080DBFCB5CC4208434D3330
      34353736014E01530000001544000000000000A0644000000000009712411443
      414445524E45544120504F5550414EC741323706504F55503237014401410156
      000000000000000000F893DBFCB5CC4208434D333034353736014E0153000000
      1544000000000000C0644000000000009712411443414445524E45544120504F
      5550414EC741323806504F5550323801440141015600000000000000000050AF
      DBFCB5CC4208434D333034353736014E01530000001544000000000000006540
      00000000009712411443414445524E45544120504F5550414EC741323906504F
      55503239014401410156000000000000000000D06ADCFCB5CC4208434D333034
      353736014E015300000015440000000000002065400000000000971241144341
      4445524E45544120504F5550414EC741333006504F5550333001440141015600
      0000000000000000647CDCFCB5CC4208434D333034353736014E015300004015
      04000000000000606540000000000097124114435553544F204445204F504F52
      54554E4944414403434F50014D01410150001435D815B6CC4208434D33303435
      3736014E082520616F20616E6F014E0000001544000000000000206640000000
      0004C1124111494E504320494E56455354494D454E544F08494E565F494E5043
      014401410156000000000000000000E8BF982CB7CC4208434D33303732363501
      4E01530000001544000000000000E065400000000000971241054950432D7205
      4950432D72014D01410150000000000000000000841254F6B6CC4208434D3330
      34353736014E0153}
    object cdsMoedaMOESIGLA: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object cdsMoedaMOEDESC: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Visible = False
    end
    object cdsMoedaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
  end
  object cdsValores: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DATADSTVALORES'
        DataType = ftDateTime
      end
      item
        Name = 'VLRDST'
        DataType = ftFloat
      end
      item
        Name = 'TIPOLOCAL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'IDDSTTARIFA'
        DataType = ftFloat
      end
      item
        Name = 'DSC_LOCAL'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOEDESC'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VLCONTROLADODIARIA'
        DataType = ftFloat
      end
      item
        Name = 'VLCONTROLADOKMRODADO'
        DataType = ftFloat
      end
      item
        Name = 'VLKMLIVREDIARIA'
        DataType = ftFloat
      end
      item
        Name = 'VLKMLIVRESEMANA'
        DataType = ftFloat
      end
      item
        Name = 'VLKMLIVREDIAEXTRA'
        DataType = ftFloat
      end
      item
        Name = 'IDDSTAEROPORTO'
        DataType = ftFloat
      end
      item
        Name = 'NMEDSTAEROPORTO'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end
      item
        Name = 'DATA_DECRESCENTE'
        Fields = 'DATADSTVALORES'
        Options = [ixDescending]
      end>
    Params = <>
    StoreDefs = True
    Left = 410
    Top = 7
    object cdsValoresDATADSTVALORES: TDateTimeField
      DisplayLabel = 'Data Vigência'
      DisplayWidth = 14
      FieldName = 'DATADSTVALORES'
    end
    object cdsValoresDSC_LOCAL: TStringField
      DisplayLabel = 'Local'
      DisplayWidth = 10
      FieldName = 'DSC_LOCAL'
      FixedChar = True
      Size = 2
    end
    object cdsValoresMOESIGLA: TStringField
      DisplayLabel = 'Sigla Moeda'
      DisplayWidth = 13
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object cdsValoresVLCONTROLADODIARIA: TFloatField
      DisplayLabel = 'Vl.Cont.Diária'
      DisplayWidth = 10
      FieldName = 'VLCONTROLADODIARIA'
      DisplayFormat = '#,##0.00 '
    end
    object cdsValoresVLCONTROLADOKMRODADO: TFloatField
      DisplayLabel = 'Vl.Cont.Km Rodado'
      DisplayWidth = 10
      FieldName = 'VLCONTROLADOKMRODADO'
      DisplayFormat = '#,##0.00 '
    end
    object cdsValoresVLKMLIVREDIARIA: TFloatField
      DisplayLabel = 'Vl.KmLivre Diária'
      DisplayWidth = 10
      FieldName = 'VLKMLIVREDIARIA'
      DisplayFormat = '#,##0.00 '
    end
    object cdsValoresVLKMLIVRESEMANA: TFloatField
      DisplayLabel = 'Vl.KmLivre Semana'
      DisplayWidth = 10
      FieldName = 'VLKMLIVRESEMANA'
      DisplayFormat = '#,##0.00 '
    end
    object cdsValoresVLKMLIVREDIAEXTRA: TFloatField
      DisplayLabel = 'Vl.KmLivre Dia Extra'
      DisplayWidth = 10
      FieldName = 'VLKMLIVREDIAEXTRA'
      DisplayFormat = '#,##0.00 '
    end
    object cdsValoresVLRDST: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 14
      FieldName = 'VLRDST'
      Visible = False
      DisplayFormat = '#,##0.00 '
    end
    object cdsValoresMOEDESC: TStringField
      DisplayLabel = 'Sigla Moeda'
      DisplayWidth = 12
      FieldName = 'MOEDESC'
      Visible = False
    end
    object cdsValoresIDDSTTARIFA: TFloatField
      FieldName = 'IDDSTTARIFA'
      Visible = False
    end
    object cdsValoresMOECODIGO: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = 'Sigla da Moeda'
      DisplayWidth = 14
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object cdsValoresTIPOLOCAL: TStringField
      DisplayLabel = 'Local'
      DisplayWidth = 9
      FieldName = 'TIPOLOCAL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsValoresIDDSTAEROPORTO: TFloatField
      FieldName = 'IDDSTAEROPORTO'
      Visible = False
    end
  end
  object qryTarifas: TCMSqlParams
    SQL.Strings = (
      'select * from dstTarifa')
    ClientDataSet = Cds
    Left = 88
    Top = 133
  end
  object cdsTarifaXCargo_NS: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsTarifaXCargo_NSAfterScroll
    Left = 235
    Top = 159
  end
  object dsTarifaXCargo_NS: TwwDataSource
    AutoEdit = False
    DataSet = cdsTarifaXCargo_NS
    Left = 551
    Top = 75
  end
  object cdsTarifaXCargo_S: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    AfterScroll = cdsTarifaXCargo_SAfterScroll
    Left = 597
    Top = 170
    Data = {
      7E0000009619E0BD0100000018000000030000000000030000007E000B494444
      53545441524946410800040000000000074944434152474F0800040000000000
      06544954554C4F010049000000010005574944544802000200280002000D4445
      4641554C545F4F5244455202008200010000000300044C434944040001000908
      0000}
    object cdsTarifaXCargo_STITULO: TStringField
      DisplayWidth = 40
      FieldName = 'TITULO'
      Size = 40
    end
    object cdsTarifaXCargo_SIDCARGO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARGO'
      Visible = False
    end
    object cdsTarifaXCargo_SIDDSTTARIFA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDDSTTARIFA'
      Visible = False
    end
  end
  object dsTarifaXCargo_S: TwwDataSource
    AutoEdit = False
    DataSet = cdsTarifaXCargo_S
    Left = 641
    Top = 97
  end
  object qryCargosNS: TCMSqlParams
    SQL.Strings = (
      'select /*+RULE+*/'
      '  cg.idcargo,'
      '  cg.titulo'
      'from'
      '  cargo cg'
      'where'
      '  cg.idcargo'
      '    not in'
      '    (select tc1.idcargo from dstTarifaXCargo tc1, dstTarifa tf1'
      '     where tc1.IDDSTTARIFA = tf1.IDDSTTARIFA '
      '       and tf1.INDTIPO = 1 and tf1.IDDSTTARIFA = 1)'
      ''
      'and'
      '  cg.idcargo'
      '    not in'
      '    (select tc2.idcargo from dstTarifaXCargo tc2, dstTarifa tf2'
      
        '     where  tc2.IDDSTTARIFA = tf2.IDDSTTARIFA and tf2.INDTIPO = ' +
        '1)'
      '     '
      'order by cg.titulo')
    ClientDataSet = cdsTarifaXCargo_NS
    Left = 570
    Top = 286
  end
  object qryCargoS: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  tc.iddsttarifa, tc.IDCARGO, cg.TITULO'
      'FROM '
      '  CARGO cg,'
      '  DSTTARIFAXCARGO tc,'
      '  DSTTARIFA dt'
      '  '
      'WHERE '
      '  cg.IDCARGO = tc.IDCARGO'
      '  and dt.IDDSTTARIFA = tc.IDDSTTARIFA'
      '  and dt.INDTIPO = 1'
      '  and dt.IDDSTTARIFA = 1'
      ''
      'ORDER BY TITULO')
    ClientDataSet = cdsTarifaXCargo_S
    Left = 428
    Top = 250
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'select * from moeda')
    ClientDataSet = cdsMoeda
    Left = 183
    Top = 96
  end
  object CmeDetalheCargoSelecionado: TCmEventosCadastro
    Operacao = opVazio
    RepetirInsert = True
    OnDelete = CmeDetalheDelete
    OnEdit = CmeDetalheEdit
    OnCancel = CmeDetalheCancel
    OnConfirma = CmeDetalheConfirma
    OnAtualizaBotoes = CmeDetalheCargoSelecionadoAtualizaBotoes
    DataSource = dsTarifaXCargo_S
    OpenDsAutomatico = False
    Left = 293
    Top = 66
  end
  object SqlMoeda: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM moeda')
    ClientDataSet = cdsMoeda
    Left = 385
    Top = 205
  end
end
