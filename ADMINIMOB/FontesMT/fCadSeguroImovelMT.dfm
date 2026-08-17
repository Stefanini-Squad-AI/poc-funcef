inherited frmCadSeguroImovelMT: TfrmCadSeguroImovelMT
  Left = 163
  Top = 128
  HelpContext = 640073
  Caption = 'Cadastro de Seguros de Imóvel'
  ClientHeight = 483
  ClientWidth = 704
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 704
    Height = 397
    inherited pnlMestre: TPanel
      Width = 702
      Height = 83
      inline molImovelouMestre1: TmolImovelouMestre
        Left = 8
        Top = 1
        Width = 577
        Height = 43
        inherited edtImovel: TEdit
          Width = 513
        end
        inherited btnBuscaImovel: TBitBtn
          Left = 520
          OnClick = molImovelouMestre1btnBuscaImovelClick
        end
        inherited btnLimpaImovel: TBitBtn
          Left = 544
        end
      end
      inline molSeguradora1: TmolSeguradora
        Left = 8
        Top = 40
        Width = 577
        Height = 39
        TabOrder = 1
        inherited edtSeguradora: TEdit
          Width = 513
        end
        inherited btnBuscaSeguradora: TBitBtn
          Left = 520
        end
        inherited btnLimpaSeguradora: TBitBtn
          Left = 544
        end
      end
      object dbRgStatus: TDBRadioGroup
        Left = 592
        Top = 12
        Width = 104
        Height = 66
        Caption = 'Situação'
        DataField = 'FLGSTATUS'
        DataSource = ds
        Items.Strings = (
          'Vigente'
          'Encerrado')
        TabOrder = 2
        Values.Strings = (
          'V'
          'E')
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 84
      Width = 702
      Height = 312
      Tabs.Strings = (
        'Apólice'
        'Cobertura'
        'Observações'
        'Rateio')
      detdbGrids.Strings = (
        ''
        'dbgrdDetCobertura'
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 604
        Height = 253
        ActivePage = tbsRateio
        inherited tbsDet: TTabSheet
          Caption = 'Apólice'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 596
            Height = 225
            Selected.Strings = (
              'NOMECOBERTURA'#9'59'#9'Cobertura'
              'VLRFUNDACAO'#9'15'#9'Valor Fundação'
              'VLRCOBERTURA'#9'15'#9'Valor Total')
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 596
            Height = 225
            object Label2: TLabel
              Left = 8
              Top = 4
              Width = 79
              Height = 13
              Caption = 'Nº da Apólice'
            end
            object Label1: TLabel
              Left = 8
              Top = 42
              Width = 48
              Height = 13
              Caption = 'Registro'
            end
            object Label4: TLabel
              Left = 240
              Top = 4
              Width = 90
              Height = 13
              Caption = 'Valor do Prêmio'
            end
            object Label43: TLabel
              Left = 8
              Top = 145
              Width = 146
              Height = 13
              Caption = 'Responsável pelo Seguro'
            end
            object Label6: TLabel
              Left = 8
              Top = 186
              Width = 154
              Height = 13
              Caption = 'Observações (Reponsável)'
            end
            object DBedtApolice: TwwDBEdit
              Left = 8
              Top = 18
              Width = 201
              Height = 21
              DataField = 'SGIAPOLICE'
              DataSource = ds
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object edtRegistro: TwwDBEdit
              Left = 8
              Top = 56
              Width = 337
              Height = 21
              DataField = 'SGIREGISTRO'
              DataSource = ds
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object DBedtVlrPremio: TDBRealEdit
              Left = 239
              Top = 18
              Width = 106
              Height = 22
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 8
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'SGIVLRPREMIO'
              DataSource = ds
            end
            object GroupBox1: TGroupBox
              Left = 8
              Top = 82
              Width = 257
              Height = 59
              Caption = 'Vigência'
              TabOrder = 3
              object Label8: TLabel
                Left = 18
                Top = 15
                Width = 34
                Height = 13
                Caption = 'Início'
              end
              object Label9: TLabel
                Left = 134
                Top = 15
                Width = 46
                Height = 13
                Caption = 'Término'
              end
              object edtDataIni: TCMDateTimePicker
                Left = 16
                Top = 31
                Width = 105
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'SGIDATAINI'
                DataSource = ds
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
              object DBedtDataFim: TCMDateTimePicker
                Left = 136
                Top = 31
                Width = 105
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'SGIDATAFIM'
                DataSource = ds
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
            end
            object DBcboResponsavel: TwwDBComboBox
              Left = 8
              Top = 161
              Width = 281
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = True
              AllowClearKey = False
              DataField = 'SGIRESPSEGURO'
              DataSource = ds
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'Condomínio'#9'C'
                'Fundação'#9'F'
                'Locatário'#9'L'
                'Outros'#9'O')
              Sorted = False
              TabOrder = 5
              UnboundDataType = wwDefault
            end
            object DBedtRespOutros: TDBEdit
              Left = 8
              Top = 202
              Width = 609
              Height = 21
              DataField = 'SGIRESPOUTROS'
              DataSource = ds
              TabOrder = 6
            end
            inline molResponsavel1: TmolResponsavel
              Left = 304
              Top = 145
              Width = 320
              TabOrder = 4
              inherited Label5: TLabel
                Width = 154
                Caption = 'Responsável pelo Contrato'
              end
              inherited edtResponsavel: TEdit
                Width = 256
              end
              inherited btnBuscaResponsavel: TBitBtn
                Left = 264
              end
              inherited btnLimpaResponsavel: TBitBtn
                Left = 288
              end
              inherited btnAbrePessoa: TBitBtn
                Left = 184
                Visible = False
              end
            end
            object GroupBox2: TGroupBox
              Left = 363
              Top = 1
              Width = 241
              Height = 61
              Caption = 'Seguro Total'
              TabOrder = 7
              object Label13: TLabel
                Left = 25
                Top = 15
                Width = 88
                Height = 13
                Caption = 'Valor Segurado'
              end
              object Label5: TLabel
                Left = 172
                Top = 15
                Width = 55
                Height = 13
                Caption = 'Valor LMI'
              end
              object DBedtVlrSeguro: TDBRealEdit
                Left = 7
                Top = 30
                Width = 106
                Height = 22
                Alignment = taRightJustify
                Enabled = False
                Lines.Strings = (
                  '0,00')
                TabOrder = 0
                WordWrap = False
                IntDigits = 8
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'SGIVLRSEGURO'
                DataSource = ds
              end
              object dbLMITot: TDBRealEdit
                Left = 122
                Top = 30
                Width = 106
                Height = 22
                Alignment = taRightJustify
                Enabled = False
                Lines.Strings = (
                  '0,00')
                TabOrder = 1
                WordWrap = False
                IntDigits = 8
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'LMI_TOTAL'
                DataSource = ds
              end
            end
            object GroupBox3: TGroupBox
              Left = 363
              Top = 72
              Width = 241
              Height = 61
              Caption = 'Parte da Fundação'
              TabOrder = 8
              object Label10: TLabel
                Left = 25
                Top = 15
                Width = 88
                Height = 13
                Caption = 'Valor Segurado'
              end
              object Label11: TLabel
                Left = 172
                Top = 15
                Width = 55
                Height = 13
                Caption = 'Valor LMI'
              end
              object DBRealEdit1: TDBRealEdit
                Left = 7
                Top = 30
                Width = 106
                Height = 22
                Alignment = taRightJustify
                Enabled = False
                Lines.Strings = (
                  '0,00')
                TabOrder = 0
                WordWrap = False
                IntDigits = 8
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'TOT_FUNDACAO'
                DataSource = ds
              end
              object DBRealEdit2: TDBRealEdit
                Left = 122
                Top = 30
                Width = 106
                Height = 22
                Alignment = taRightJustify
                Enabled = False
                Lines.Strings = (
                  '0,00')
                TabOrder = 1
                WordWrap = False
                IntDigits = 8
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'LMI_FUNDACAO'
                DataSource = ds
              end
            end
          end
        end
        object tbsCobertura: TTabSheet
          Caption = 'Cobertura'
          ImageIndex = 1
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 596
            Height = 83
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object dbgrdDetCobertura: TwwDBGrid
              Left = 0
              Top = 0
              Width = 596
              Height = 83
              Selected.Strings = (
                'NOMECOBERTURA'#9'59'#9'Cobertura'
                'VLRFUNDACAO'#9'15'#9'Valor Fundação'
                'VLRCOBERTURA'#9'15'#9'Valor Total'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsDet
              KeyOptions = []
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ReadOnly = True
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
              Width = 596
              Height = 83
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object Label3: TLabel
                Left = 8
                Top = 17
                Width = 56
                Height = 13
                Caption = 'Cobertura'
                FocusControl = DbEdtCobertura
              end
              object Label7: TLabel
                Left = 374
                Top = 17
                Width = 63
                Height = 13
                Caption = 'Valor Total'
                FocusControl = DbEdtValorCobertura
              end
              object Label12: TLabel
                Left = 464
                Top = 17
                Width = 90
                Height = 13
                Caption = 'Valor Fundação'
                FocusControl = DbEdtValorCobertura
              end
              object sbCalcFundacao: TSpeedButton
                Left = 554
                Top = 33
                Width = 23
                Height = 22
                Hint = 'Calcula pela Composição Societária'
                Flat = True
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000010000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                  77777777777777777777700000000000000766444444444444406E6666666666
                  66406E60F0F0F067F0406E666666666666406E60F0F0F0F0F0406E6666666666
                  66406E077777776666406E0FFFFFF76666406E000000006666406EEEEEEEEEEE
                  EE60766666666666666777777777777777777777777777777777}
                ParentShowHint = False
                ShowHint = True
                OnClick = sbCalcFundacaoClick
              end
              object DbEdtCobertura: TDBEdit
                Left = 8
                Top = 33
                Width = 313
                Height = 21
                DataField = 'NOMECOBERTURA'
                DataSource = dsDet
                TabOrder = 0
              end
              object DbEdtValorCobertura: TDBEdit
                Left = 330
                Top = 33
                Width = 109
                Height = 21
                DataField = 'VLRCOBERTURA'
                DataSource = dsDet
                TabOrder = 1
              end
              object dbValorFundacao: TDBEdit
                Left = 446
                Top = 33
                Width = 109
                Height = 21
                DataField = 'VLRFUNDACAO'
                DataSource = dsDet
                TabOrder = 2
              end
            end
          end
          object Panel4: TPanel
            Left = 0
            Top = 83
            Width = 596
            Height = 142
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object gbCobertura: TGroupBox
              Left = 0
              Top = 0
              Width = 596
              Height = 142
              Align = alClient
              Caption = 'Descrição da Cobertura'
              Enabled = False
              TabOrder = 0
              object Panel7: TPanel
                Left = 2
                Top = 15
                Width = 592
                Height = 125
                Align = alClient
                BevelOuter = bvNone
                BorderWidth = 7
                TabOrder = 0
                object DBMemDescricao: TwwDBRichEdit
                  Left = 7
                  Top = 7
                  Width = 578
                  Height = 111
                  Align = alClient
                  AutoURLDetect = False
                  DataField = 'DESCCOBERTURA'
                  DataSource = dsDet
                  PrintJobName = 'Delphi 5'
                  TabOrder = 0
                  PopupOptions = [rpoPopupEdit, rpoPopupCut, rpoPopupCopy, rpoPopupPaste]
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
                    840000007B5C727466315C616E73695C616E7369637067313235325C64656666
                    305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
                    4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
                    5C706172645C625C66305C667331342044424D656D44657363726963616F5C70
                    61720D0A7D0D0A00}
                end
              end
            end
          end
        end
        object tbsObs: TTabSheet
          Caption = 'Observações'
          ImageIndex = 2
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 596
            Height = 27
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Observações'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object DBmemObservacao: TwwDBRichEdit
            Left = 0
            Top = 27
            Width = 596
            Height = 198
            ScrollBars = ssVertical
            Align = alClient
            AutoURLDetect = True
            DataField = 'OBSERVACAO'
            DataSource = ds
            MaxLength = 1750
            PrintJobName = 'Delphi 5'
            TabOrder = 1
            PopupOptions = [rpoPopupEdit, rpoPopupCut, rpoPopupCopy, rpoPopupPaste, rpoPopupFont]
            EditorCaption = 'Edit Rich Text'
            EditorPosition.Left = 0
            EditorPosition.Top = 0
            EditorPosition.Width = 0
            EditorPosition.Height = 0
            MeasurementUnits = muCentimeters
            PrintMargins.Top = 1
            PrintMargins.Bottom = 1
            PrintMargins.Left = 1
            PrintMargins.Right = 1
            RichEditVersion = 2
            Data = {
              850000007B5C727466315C616E73695C616E7369637067313235325C64656666
              305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
              4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
              5C706172645C625C66305C667331342044426D656D4F62736572766163616F5C
              7061720D0A7D0D0A00}
          end
        end
        object tbsRateio: TTabSheet
          Caption = 'Rateio'
          ImageIndex = 3
          object pnlDetalhe: TPanel
            Left = 0
            Top = 0
            Width = 596
            Height = 127
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object grbPagamento: TGroupBox
              Left = 7
              Top = 3
              Width = 672
              Height = 61
              Caption = ' Pagamento '
              TabOrder = 0
              object Label22: TLabel
                Left = 12
                Top = 19
                Width = 65
                Height = 13
                Caption = 'Documento'
              end
              object Label14: TLabel
                Left = 201
                Top = 19
                Width = 67
                Height = 13
                Caption = 'Vencimento'
              end
              object Label15: TLabel
                Left = 321
                Top = 19
                Width = 64
                Height = 13
                Caption = 'Pagamento'
              end
              object Label16: TLabel
                Left = 468
                Top = 19
                Width = 30
                Height = 13
                Caption = 'Valor'
              end
              object edtDataVencimento: TCMDateTimePicker
                Left = 201
                Top = 32
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
                ReadOnly = True
                ShowButton = True
                TabOrder = 0
              end
              object edtDataPagamento: TCMDateTimePicker
                Left = 321
                Top = 32
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
                ReadOnly = True
                ShowButton = True
                TabOrder = 1
              end
              object btnBuscaDoc: TBitBtn
                Left = 141
                Top = 31
                Width = 24
                Height = 22
                Hint = 'Busca um Responsável'
                TabOrder = 2
                OnClick = btnBuscaDocClick
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
              object edtDocumento: TEdit
                Left = 13
                Top = 32
                Width = 128
                Height = 21
                ReadOnly = True
                TabOrder = 3
              end
              object edtValor: TRealEdit
                Left = 468
                Top = 32
                Width = 116
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                ReadOnly = True
                TabOrder = 4
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
              end
            end
            object grbRateio: TGroupBox
              Left = 7
              Top = 64
              Width = 672
              Height = 61
              Caption = ' Rateio '
              TabOrder = 1
              object Label17: TLabel
                Left = 11
                Top = 16
                Width = 100
                Height = 13
                Caption = 'Grupo de Imóveis'
              end
              object Label18: TLabel
                Left = 248
                Top = 16
                Width = 54
                Height = 13
                Caption = 'Indicador'
              end
              object dbcboGrupo: TwwDBLookupCombo
                Left = 11
                Top = 29
                Width = 212
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'GRRDESCRICAO'#9'40'#9'Grupo de Rateio'#9'F')
                LookupTable = cdsGrupo
                LookupField = 'IDGRUPORATEIO'
                Options = [loColLines, loTitles]
                Style = csDropDownList
                TabOrder = 0
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = True
              end
              object dbcboIndicador: TwwDBLookupCombo
                Left = 248
                Top = 29
                Width = 212
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'INMDESCRICAO'#9'25'#9'Indicadores'#9'F')
                LookupTable = cdsIndicadores
                LookupField = 'IDINDICADORIMOVEL'
                Options = [loColLines, loTitles]
                Style = csDropDownList
                TabOrder = 1
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = True
              end
              object btnRatear: TButton
                Left = 486
                Top = 25
                Width = 98
                Height = 25
                Caption = 'Ratear'
                TabOrder = 2
                OnClick = btnRatearClick
              end
            end
          end
          object Panel9: TPanel
            Left = 7
            Top = 129
            Width = 672
            Height = 20
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Imóveis'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object dbgrdDetImoveis: TwwDBGrid
            Left = 7
            Top = 149
            Width = 672
            Height = 119
            Selected.Strings = (
              'IMOCODIGO'#9'12'#9'Cod. Imóvel'#9'F'
              'NOMEIMOVEL'#9'35'#9'Nome Imóvel'#9'F'
              'DESCINDICADOR'#9'29'#9'Indicador'#9'F'
              'VLRAPURADO'#9'10'#9'Valor Apurado'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsImoveisRateio
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap, dgShowFooter]
            TabOrder = 2
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = True
            UseTFields = False
            OnCalcCellColors = dbgrdDetImoveisCalcCellColors
            OnDblClick = dbgrdDetDblClick
            IndicatorColor = icBlack
            OnUpdateFooter = dbgrdDetImoveisUpdateFooter
            FooterHeight = 30
          end
        end
      end
      inherited Dock973: TDock97
        Width = 694
      end
      inherited Dock974: TDock97
        Left = 608
        Height = 253
      end
    end
  end
  inherited Dock972: TDock97
    Width = 704
  end
  inherited Dock971: TDock97
    Top = 444
    Width = 704
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      4
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 336
  end
  inherited Cds: TCMClientDataSet
    Left = 284
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'S.SGIREGISTRO'
      'S.SGIAPOLICE'
      'IM.IMONOME'
      'I.IMONOME'
      'PS.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Registro'
      'Apólice'
      'Imóvel Mestre'
      'Imóvel'
      'Seguradora')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'SEGUROIMOVEL S'
      'IMOVEL I'
      'IMOVEL IM'
      'SEGURADORA SE'
      'PESSOA PS')
    CamposChave.Strings = (
      'S.IDSEGUROIMOVEL')
    Filtro.Strings = (
      'S.IDIMOVEL = I.IDIMOVEL(+)'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL(+)'
      'S.IDSEGURADORA = SE.IDSEGURADORA(+)'
      'SE.IDSEGURADORA = PS.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '25'
      '25'
      '60'
      '60'
      '60')
    OperComparador.Strings = (
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
      '')
    LookupCampoChave.Strings = (
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
      '')
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 292
    Top = 79
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    DataSet = cdsDetCobertura
    Left = 246
    Top = 79
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   S.IDSEGUROIMOVEL,'
      ''
      '   S.IDIMOVEL,'
      ''
      '   I.IDIMOVELMESTRE,'
      
        '   (DECODE(I.IDIMOVELMESTRE, NULL, I.IMONOME, (IM.IMONOME||'#39' - '#39 +
        '||I.IMONOME))) AS IMOVEL_EXTENSO,'
      ''
      
        '   S.IDSEGURADORA, PS.NOME AS NF_SEGURADORA, PS.RAZAOSOCIAL AS R' +
        'S_SEGURADORA,'
      ''
      '   S.SGIAPOLICE, S.SGIREGISTRO,'
      '   S.SGIDATAINI, S.SGIDATAFIM,'
      '   S.SGIVLRSEGURO, S.SGIVLRPREMIO,'
      '   S.SGIRESPSEGURO, S.SGIRESPOUTROS,'
      '   S.OBSERVACAO, S.IDRESPONSAVEL,'
      '   PR.NOME AS NOME_RESPONSAVEL,'
      '   MAX(SC.VLRCOBERTURA) AS LMI_TOTAL,'
      '   MAX(SC.VLRFUNDACAO)  AS LMI_FUNDACAO,'
      '   SUM(SC.VLRFUNDACAO)  AS TOT_FUNDACAO'
      ''
      'FROM'
      '   PESSOA PS, PESSOA PR,'
      '   IMOVEL I, IMOVEL IM,'
      '   SEGUROIMOVEL S, SEGUROIMOXCOB SC'
      ''
      'WHERE'
      '   ( S.IDSEGUROIMOVEL = :IDSEGUROIMOVEL )'
      '   AND ( S.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL(+) )'
      '   AND ( S.IDSEGURADORA = PS.IDPESSOA )'
      '   AND ( S.IDRESPONSAVEL = PR.IDPESSOA(+) )'
      '   AND ( S.IDSEGUROIMOVEL = SC.IDSEGUROIMOVEL(+) )'
      ''
      'GROUP BY S.IDSEGUROIMOVEL, S.IDIMOVEL, I.IDIMOVELMESTRE,'
      
        '        (DECODE(I.IDIMOVELMESTRE, NULL, I.IMONOME, (IM.IMONOME||' +
        #39' - '#39'||I.IMONOME))),'
      '        S.IDSEGURADORA, PS.NOME, PS.RAZAOSOCIAL,'
      '        S.SGIAPOLICE, S.SGIREGISTRO,'
      '        S.SGIDATAINI, S.SGIDATAFIM,'
      '        S.SGIVLRSEGURO, S.SGIVLRPREMIO,'
      '        S.SGIRESPSEGURO, S.SGIRESPOUTROS,'
      '        S.OBSERVACAO, S.IDRESPONSAVEL, PR.NOME'
      ''
      '')
    ValidateWithMask = True
    Left = 536
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDSEGUROIMOVEL'
        ParamType = ptUnknown
      end>
    object qryIDSEGUROIMOVEL: TFloatField
      FieldName = 'IDSEGUROIMOVEL'
    end
    object qryIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryIDSEGURADORA: TFloatField
      FieldName = 'IDSEGURADORA'
    end
    object qryNF_SEGURADORA: TStringField
      FieldName = 'NF_SEGURADORA'
      Size = 60
    end
    object qryRS_SEGURADORA: TStringField
      FieldName = 'RS_SEGURADORA'
      Size = 60
    end
    object qrySGIAPOLICE: TStringField
      FieldName = 'SGIAPOLICE'
      Size = 25
    end
    object qrySGIREGISTRO: TStringField
      FieldName = 'SGIREGISTRO'
      Size = 25
    end
    object qrySGIDATAINI: TDateTimeField
      FieldName = 'SGIDATAINI'
    end
    object qrySGIDATAFIM: TDateTimeField
      FieldName = 'SGIDATAFIM'
    end
    object qrySGIVLRSEGURO: TFloatField
      FieldName = 'SGIVLRSEGURO'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qrySGIVLRPREMIO: TFloatField
      FieldName = 'SGIVLRPREMIO'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qrySGIRESPSEGURO: TStringField
      FieldName = 'SGIRESPSEGURO'
      Size = 1
    end
    object qrySGIRESPOUTROS: TStringField
      FieldName = 'SGIRESPOUTROS'
      Size = 200
    end
    object qryOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = qry
    Constraints = True
    Left = 600
    Top = 1
  end
  object cdsDetCobertura: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 269
    Top = 132
    object cdsDetCoberturaNOMECOBERTURA: TStringField
      DisplayLabel = 'Cobertura'
      DisplayWidth = 59
      FieldName = 'NOMECOBERTURA'
      Size = 80
    end
    object cdsDetCoberturaVLRFUNDACAO: TFloatField
      DisplayLabel = 'Valor Fundação'
      DisplayWidth = 15
      FieldName = 'VLRFUNDACAO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object cdsDetCoberturaVLRCOBERTURA: TFloatField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 15
      FieldName = 'VLRCOBERTURA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDetCoberturaDESCCOBERTURA: TMemoField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCCOBERTURA'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object cdsDetCoberturaIDSEGUROIMOXCOB: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSEGUROIMOXCOB'
      Visible = False
    end
    object cdsDetCoberturaIDSEGUROIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSEGUROIMOVEL'
      Visible = False
    end
  end
  object CMSql: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM SEGUROIMOXCOB')
    Left = 349
    Top = 124
  end
  object CMClientDataSet1: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 404
    Top = 143
  end
  object wwDataSource1: TwwDataSource
    DataSet = CMClientDataSet1
    Left = 462
    Top = 135
  end
  object MS_Documento_OLD_VW: TMontaSelect
    Template.IdConsulta = 83
    Caption = 'Seleciona'
    Colunas.Strings = (
      'VW.VALOR_LANC'
      'VW.ANOCOMPETENCIA'
      'VW.MESCOMPETENCIA'
      'VW.DATAVENCIMENTO'
      'VW.DATALANCAMENTO'
      'VW.DATA_BAIXA'
      'VW.NODOCUMENTO'
      'DECODE(VW.FLGINTEGRADO, 0, '#39'NÃO'#39', '#39'SIM'#39') AS INTEGRADO'
      
        'DECODE(VW.FLGORIGEMLANC, '#39'D'#39', '#39'LANÇAMENTO DE DÍVIDAS'#39', '#39'F'#39', '#39'FOL' +
        'HA DE ALUGUÉIS'#39', '#39'I'#39', '#39'IMP. PRESTAÇÃO DE CONTAS'#39', '#39'L'#39', '#39'LANÇAMEN' +
        'TO EM LOTE'#39', '#39'P'#39', '#39'PRESTAÇÃO DE CONTAS'#39', '#39'R'#39', '#39'FOLHA DE REMUNERA' +
        'ÇÕES'#39', '#39'T'#39', '#39'LANÇAMENTO COM RATEIO'#39', '#39'V'#39', '#39'LANÇAMENTO DE PREVISÃ' +
        'O'#39')')
    TipodeDado.Strings = (
      'N'
      'N'
      'N'
      'D'
      'D'
      'D'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Valor do Lançamento'
      'Competência (Ano)'
      'Competência (Mês)'
      'Data Vencimento'
      'Data Lançamento'
      'Data de Baixa'
      'Nº Documento'
      'Integrado ?'
      'Lançamento')
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
      'VWLANCAMENTO VW')
    CamposChave.Strings = (
      'VW.IDLANCIMOVEL'
      'VW.CODDOCUMENTO'
      'VW.PLNCODIGO'
      'VW.NODOCUMENTO'
      'VW.IDPESSOA'
      'VW.CODTIPIMOVEL'
      'VW.IDDOCUMENTO'
      'VW.RECPAG'
      'VW.DATAVENCIMENTO'
      'VW.DATA_BAIXA'
      'VW.VALOR_LANC'
      'VW.IDIMOVEL')
    Filtro.Strings = (
      'VW.RECPAG = '#39'P'#39)
    Mascaras.Strings = (
      '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      '0000'
      '00'
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      '#0'
      ''
      '')
    Larguras.Strings = (
      '10'
      '5'
      '4'
      '10'
      '10'
      '10'
      '18'
      '5'
      '10')
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
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
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
    Left = 56
    Top = 442
  end
  object cdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 117
    Top = 300
    object cdsGrupoGRRDESCRICAO: TStringField
      DisplayLabel = 'Grupo de Rateio'
      DisplayWidth = 40
      FieldName = 'GRRDESCRICAO'
      Size = 60
    end
    object cdsGrupoIDGRUPORATEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPORATEIO'
      Visible = False
    end
    object cdsGrupoIDMODULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODULO'
      Visible = False
    end
    object cdsGrupoIMOCODIGO: TStringField
      DisplayWidth = 15
      FieldName = 'IMOCODIGO'
      Visible = False
      Size = 15
    end
  end
  object dsGrupo: TwwDataSource
    DataSet = cdsGrupo
    Left = 126
    Top = 309
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      
        '/*SELECT DISTINCT GR.IDGRUPORATEIO, GR.IDMODULO, GR.GRRDESCRICAO' +
        ', GR.IMOCODIGO'
      'FROM GRUPORATEIO GR, GRUPOXIMOVEL GXI, IMOVEL I'
      'WHERE GR.IDGRUPORATEIO  = GXI.IDGRUPORATEIO'
      '  AND GXI.IDIMOVEL      = I.IDIMOVEL'
      '  AND I.IDIMOVELMESTRE  = 26'
      '  AND NOT EXISTS ( SELECT 1 FROM GRUPOXIMOVEL G, IMOVEL I'
      '                   WHERE G.IDIMOVEL      = I.IDIMOVEL'
      '                     AND I.IDIMOVELMESTRE  <> 26'
      '                     AND G.IDGRUPORATEIO = GR.IDGRUPORATEIO )*/'
      ''
      ''
      ''
      
        'SELECT I.IMOCODIGO, I.IDIMOVEL, I.IMONOME AS NOMEIMOVEL, IM.IMON' +
        'OME AS NOMEMESTRE, IXA.OBSERVACAO,'
      
        '       IXA.DESCINDICADOR, IXA.IDINDICADORIMOVEL, IXA.IDDOCUMENTO' +
        ', IXA.IDSEGUROIMOVEL, IXA.IDINDICADORXAPUR,'
      
        '       IXA.MESCOMPETENCIA, IXA.ANOCOMPETENCIA, IXA.DATAAPURADO, ' +
        'IXA.FLGPREVREAL, IXA.FLGTIPOAPURACAO,'
      
        '       NVL(DECODE(IXA.VLRAPURADO,0,0,IXA.VLRAPURADO),0) AS VLRAP' +
        'URADO, ROUND(I.IMOAREA / TOTAREA.SOMAAREA,4) AS PERCENTAREA'
      'FROM IMOVEL I, IMOVEL IM,'
      '   ( SELECT SUM(IMOAREA) SOMAAREA'
      '     FROM IMOVEL'
      '     WHERE IDIMOVELMESTRE = 26 ) TOTAREA,'
      ''
      
        '   ( SELECT IXA.IDIMOVEL, IXA.IDINDICADORIMOVEL, IXA.IDDOCUMENTO' +
        ', IXA.IDSEGUROIMOVEL, IXA.IDINDICADORXAPUR,'
      
        '            IXA.MESCOMPETENCIA, IXA.ANOCOMPETENCIA, IXA.DATAAPUR' +
        'ADO, IXA.FLGPREVREAL, IXA.FLGTIPOAPURACAO,'
      
        '            IXA.OBSERVACAO, IND.INMDESCRICAO AS DESCINDICADOR, N' +
        'VL(IXA.VLRAPURADO,0) AS VLRAPURADO'
      '     FROM INDICADORXAPUR IXA, INDICADORIMOVEL IND'
      '     WHERE IND.IDINDICADORIMOVEL = IXA.IDINDICADORIMOVEL'
      '       AND IXA.IDIMOVEL IS NOT NULL'
      '       AND IXA.MESCOMPETENCIA    = 1'
      '       AND IXA.ANOCOMPETENCIA    = 2007 ) IXA'
      'WHERE I.IDIMOVELMESTRE = IM.IDIMOVEL'
      '  AND I.IDIMOVEL       = IXA.IDIMOVEL(+)'
      '  AND 17 = IXA.IDINDICADORIMOVEL(+)'
      '  AND IM.IDIMOVEL      = 26'
      'ORDER BY NOMEIMOVEL'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsImoveisRateio
    Left = 157
    Top = 358
  end
  object cdsIndicadores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 345
    Top = 292
    object cdsIndicadoresINMDESCRICAO: TStringField
      DisplayLabel = 'Indicadores'
      DisplayWidth = 25
      FieldName = 'INMDESCRICAO'
      Size = 60
    end
    object cdsIndicadoresIDINDICADORIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINDICADORIMOVEL'
      Visible = False
    end
  end
  object dsIndicadores: TwwDataSource
    AutoEdit = False
    DataSet = cdsIndicadores
    Left = 356
    Top = 300
  end
  object sqlIndicadores: TCMSqlParams
    SQL.Strings = (
      'SELECT IDINDICADORIMOVEL, INMDESCRICAO'
      'FROM INDICADORIMOVEL'
      'WHERE FLGTIPOVALOR = '#39'M'#39
      '  AND RECPAG       = '#39'R'#39)
    ClientDataSet = cdsIndicadores
    Left = 367
    Top = 310
  end
  object cdsImoveisRateio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 237
    Top = 352
    object cdsImoveisRateioIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object cdsImoveisRateioIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsImoveisRateioNOMEIMOVEL: TStringField
      FieldName = 'NOMEIMOVEL'
      Size = 60
    end
    object cdsImoveisRateioNOMEMESTRE: TStringField
      FieldName = 'NOMEMESTRE'
      Size = 60
    end
    object cdsImoveisRateioPERCENTAREA: TFloatField
      FieldName = 'PERCENTAREA'
    end
    object cdsImoveisRateioDESCINDICADOR: TStringField
      FieldName = 'DESCINDICADOR'
      Size = 60
    end
    object cdsImoveisRateioIDINDICADORIMOVEL: TFloatField
      FieldName = 'IDINDICADORIMOVEL'
    end
    object cdsImoveisRateioIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
    end
    object cdsImoveisRateioIDSEGUROIMOVEL: TFloatField
      FieldName = 'IDSEGUROIMOVEL'
    end
    object cdsImoveisRateioIDINDICADORXAPUR: TFloatField
      FieldName = 'IDINDICADORXAPUR'
    end
    object cdsImoveisRateioMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object cdsImoveisRateioANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object cdsImoveisRateioDATAAPURADO: TDateTimeField
      FieldName = 'DATAAPURADO'
    end
    object cdsImoveisRateioFLGPREVREAL: TStringField
      FieldName = 'FLGPREVREAL'
      FixedChar = True
      Size = 1
    end
    object cdsImoveisRateioFLGTIPOAPURACAO: TStringField
      FieldName = 'FLGTIPOAPURACAO'
      FixedChar = True
      Size = 1
    end
    object cdsImoveisRateioVLRAPURADO: TFloatField
      FieldName = 'VLRAPURADO'
      DisplayFormat = ',0.00'
    end
    object cdsImoveisRateioOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
  end
  object dsImoveisRateio: TwwDataSource
    DataSet = cdsImoveisRateio
    Left = 246
    Top = 365
  end
  object cdsIndicadorXApur: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 413
    Top = 364
  end
  object MS_Documento: TMontaSelect
    Template.IdConsulta = 83
    Caption = 'Seleciona'
    Colunas.Strings = (
      'D.CODDOCUMENTO'
      'D.DATAVENCTO'
      'BX.DATA_BAIXA'
      'L.VALOR')
    TipodeDado.Strings = (
      'N'
      'D'
      'D'
      'N')
    Descricao.Strings = (
      'Nº Documento'
      'Data Vencimento'
      'Data Pagamento'
      'Valor do Lançamento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DOCUMENTO D'
      'LANCTODOCUM L'
      'LANCAMENTOSIMOVEL LI'
      'IMOVEL I'
      
        '(SELECT CODDOCUMENTO, MAX(DATABAIXA) AS DATA_BAIXA FROM RECBTOPA' +
        'GTO GROUP BY CODDOCUMENTO) BX')
    CamposChave.Strings = (
      'D.CODDOCUMENTO'
      'D.DATAVENCTO'
      'BX.DATA_BAIXA'
      'L.VALOR'
      'I.IDIMOVELMESTRE')
    Filtro.Strings = (
      'L.CODDOCUMENTO   = D.CODDOCUMENTO'
      'L.CODDOCUMENTO   = BX.CODDOCUMENTO(+)'
      'LI.CODDOCUMENTO  = L.CODDOCUMENTO'
      'LI.IDIMOVEL      = I.IDIMOVEL'
      'L.OPERACAO       = '#39'2'#39
      'D.RECPAG         = '#39'P'#39)
    Mascaras.Strings = (
      '#0'
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      '###,###,###,###,##0.00;(###,###,###,###,##0.00)')
    Larguras.Strings = (
      '18'
      '10'
      '10'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 176
    Top = 234
  end
end
