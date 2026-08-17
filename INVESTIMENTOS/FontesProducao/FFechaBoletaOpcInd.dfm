inherited frmFechaBoletaOpcInd: TfrmFechaBoletaOpcInd
  Left = 169
  Top = 94
  HelpContext = 790312
  Caption = 'Fechamento de Boletas'
  ClientHeight = 472
  ClientWidth = 804
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 804
    Height = 433
    inherited bvlSepTit: TBevel
      Width = 802
    end
    inherited pnlTitulo: TPanel
      Width = 802
      inherited lbNomDescricao: TfcLabel
        Width = 239
        Caption = 'Fechamento de Boletas'
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 45
      Width = 802
      Height = 228
      Align = alTop
      TabOrder = 1
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 800
        Height = 56
        Align = alTop
        TabOrder = 0
        object Label2: TLabel
          Left = 6
          Top = 4
          Width = 98
          Height = 13
          Caption = 'Data Referência '
        end
        object Label1: TLabel
          Left = 122
          Top = 4
          Width = 53
          Height = 13
          Caption = 'Corretora'
        end
        object Label4: TLabel
          Left = 376
          Top = 4
          Width = 65
          Height = 13
          Caption = 'Documento'
        end
        object Label3: TLabel
          Left = 498
          Top = 4
          Width = 98
          Height = 13
          Caption = 'Data Liquidação '
        end
        object lblBoletaAF: TLabel
          Left = 619
          Top = 21
          Width = 158
          Height = 16
          AutoSize = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object dbDtaOperacao: TCMDateTimePicker
          Left = 6
          Top = 20
          Width = 110
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
        object dblCorretora: TwwDBLookupCombo
          Left = 122
          Top = 20
          Width = 247
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SGLCORRETVALORES'#9'20'#9'Descrição'#9'F')
          LookupTable = QryCorretValores
          LookupField = 'IDCORRETVALORES'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnExit = dblCorretoraExit
        end
        object dbeLote: TDBEdit
          Left = 376
          Top = 20
          Width = 113
          Height = 21
          Color = clWhite
          DataField = 'IDBOLETA'
          Enabled = False
          TabOrder = 2
        end
        object dbDataLiquidacao: TCMDateTimePicker
          Left = 498
          Top = 20
          Width = 110
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
          Enabled = False
          ShowButton = True
          TabOrder = 3
        end
      end
      object Panel3: TPanel
        Left = 1
        Top = 57
        Width = 800
        Height = 170
        Align = alClient
        TabOrder = 1
        object Panel10: TPanel
          Left = 1
          Top = 24
          Width = 798
          Height = 145
          Align = alClient
          TabOrder = 1
          object pnlOperacoes: TPanel
            Left = 1
            Top = 1
            Width = 796
            Height = 143
            Align = alClient
            TabOrder = 0
            object lblPremio: TLabel
              Left = 192
              Top = 93
              Width = 39
              Height = 13
              Caption = 'Prêmio'
            end
            object lblQuantidade: TLabel
              Left = 16
              Top = 93
              Width = 66
              Height = 13
              Caption = 'Quantidade'
            end
            object lblOperacao: TLabel
              Left = 16
              Top = 10
              Width = 56
              Height = 13
              Caption = 'Operação'
            end
            object lblOpcao: TLabel
              Left = 370
              Top = 8
              Width = 38
              Height = 13
              Caption = 'Opção'
            end
            object lblValor: TLabel
              Left = 368
              Top = 93
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object lblPrecoEx: TLabel
              Left = 16
              Top = 52
              Width = 92
              Height = 13
              Caption = 'Preço Exercício'
            end
            object lblVencimento: TLabel
              Left = 192
              Top = 52
              Width = 67
              Height = 13
              Caption = 'Vencimento'
            end
            object Dock974: TDock97
              Left = 710
              Top = 1
              Width = 85
              Height = 141
              AllowDrag = False
              BoundLines = [blLeft]
              Position = dpRight
              object tb97Detalhe: TToolbar97
                Left = 0
                Top = 0
                Caption = 'tb97Detalhe'
                DockPos = 0
                TabOrder = 0
                object bbtnOkDet: TBitBtn
                  Left = 0
                  Top = 0
                  Width = 80
                  Height = 27
                  Caption = '&OK'
                  TabOrder = 0
                  OnClick = bbtnOkDetClick
                  Glyph.Data = {
                    BE060000424DBE06000000000000360400002800000024000000120000000100
                    0800000000008802000000000000000000000001000000010000000000000000
                    80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                    A600000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                    0303030303030303030303030303030303030303030303030303030303030303
                    03030303030303030303030303030303030303030303FF030303030303030303
                    03030303030303040403030303030303030303030303030303F8F8FF03030303
                    03030303030303030303040202040303030303030303030303030303F80303F8
                    FF030303030303030303030303040202020204030303030303030303030303F8
                    03030303F8FF0303030303030303030304020202020202040303030303030303
                    0303F8030303030303F8FF030303030303030304020202FA0202020204030303
                    0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
                    040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
                    03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
                    FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
                    0303030303030303030303FA0202020403030303030303030303030303F8FF03
                    03F8FF03030303030303030303030303FA020202040303030303030303030303
                    0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
                    03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
                    030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
                    0202040303030303030303030303030303F8FF03F8FF03030303030303030303
                    03030303FA0202030303030303030303030303030303F8FFF803030303030303
                    030303030303030303FA0303030303030303030303030303030303F803030303
                    0303030303030303030303030303030303030303030303030303030303030303
                    0303}
                  NumGlyphs = 2
                end
                object bbtnCancelarDet: TBitBtn
                  Left = 0
                  Top = 27
                  Width = 80
                  Height = 27
                  Cancel = True
                  Caption = '&Cancelar'
                  TabOrder = 1
                  OnClick = bbtnCancelarDetClick
                  Glyph.Data = {
                    BE060000424DBE06000000000000360400002800000024000000120000000100
                    0800000000008802000000000000000000000001000000010000000000000000
                    80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                    A600000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                    0303030303030303030303030303030303030303030303030303030303030303
                    0303F8F80303030303030303030303030303030303FF03030303030303030303
                    0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
                    03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
                    030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
                    FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
                    030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
                    F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
                    010101F8030303030303030303F8FF030303030303FFF8030303030303030303
                    030101010101F80303030303030303030303F8FF0303030303F8030303030303
                    0303030303F901010101F8030303030303030303030303F8FF030303F8030303
                    0303030303030303F90101010101F8030303030303030303030303F803030303
                    F8FF030303030303030303F9010101F8010101F803030303030303030303F803
                    03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
                    03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
                    03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
                    0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
                    030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
                    03030303030303030303030303030303030303030303030303F8F8F803030303
                    0303030303030303030303030303030303030303030303030303030303030303
                    0303}
                  NumGlyphs = 2
                end
                object bbtnVoltarDet: TBitBtn
                  Left = 0
                  Top = 54
                  Width = 80
                  Height = 27
                  Cancel = True
                  Caption = '&Voltar'
                  TabOrder = 2
                  OnClick = bbtnVoltarDetClick
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000010000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
                    FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                    FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                    FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                    FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                    FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
                    C8807FF7777777777FF700000000000000007777777777777777333333333333
                    3333333333333333333333333333333333333333333333333333}
                  NumGlyphs = 2
                end
              end
            end
            object dbePremio: TDBEdit
              Left = 192
              Top = 109
              Width = 169
              Height = 21
              Color = clBtnFace
              DataField = 'PREMIO'
              DataSource = DMOpcoesIndice.dsBuscaOperacoes
              Enabled = False
              TabOrder = 1
            end
            object dbeQuantidade: TDBEdit
              Left = 16
              Top = 109
              Width = 169
              Height = 21
              Color = clBtnFace
              DataField = 'QUANTIDADE'
              DataSource = DMOpcoesIndice.dsBuscaOperacoes
              Enabled = False
              TabOrder = 2
            end
            object dbeOperacao: TDBEdit
              Left = 16
              Top = 24
              Width = 347
              Height = 21
              Color = clBtnFace
              DataField = 'DESCTIPOOPERACAO'
              DataSource = DMOpcoesIndice.dsBuscaOperacoes
              Enabled = False
              TabOrder = 3
            end
            object dbeOpcao: TDBEdit
              Left = 370
              Top = 24
              Width = 327
              Height = 21
              Color = clBtnFace
              DataField = 'DESCINVESTIMENTO'
              DataSource = DMOpcoesIndice.dsBuscaOperacoes
              Enabled = False
              TabOrder = 4
            end
            object dbeValor: TDBEdit
              Left = 368
              Top = 109
              Width = 169
              Height = 21
              DataField = 'VALOR'
              DataSource = DMOpcoesIndice.dsBuscaOperacoes
              TabOrder = 5
            end
            object dbePrecoEx: TDBEdit
              Left = 16
              Top = 68
              Width = 169
              Height = 21
              Color = clBtnFace
              DataField = 'VLRPRECOEX'
              DataSource = DMOpcoesIndice.dsBuscaOperacoes
              Enabled = False
              TabOrder = 6
            end
            object dbeVencimento: TDBEdit
              Left = 192
              Top = 68
              Width = 169
              Height = 21
              Color = clBtnFace
              DataField = 'DTAVENCTO'
              DataSource = DMOpcoesIndice.dsBuscaOperacoes
              Enabled = False
              TabOrder = 7
            end
          end
          object dbgrOperacoes: TDBGrid
            Left = 1
            Top = 1
            Width = 796
            Height = 143
            Align = alClient
            DataSource = DMOpcoesIndice.dsBuscaOperacoes
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = PopOperacao
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            OnDblClick = dbgrOperacoesDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'DESCTIPOOPERACAO'
                Title.Alignment = taCenter
                Title.Caption = 'Operação'
                Title.Color = clSilver
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clMaroon
                Title.Font.Height = -9
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 257
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCINVESTIMENTO'
                Title.Alignment = taCenter
                Title.Caption = 'Opção'
                Title.Color = clSilver
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clMaroon
                Title.Font.Height = -9
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 240
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTIDADE'
                Title.Alignment = taCenter
                Title.Caption = 'Quantidade'
                Title.Color = clSilver
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clMaroon
                Title.Font.Height = -9
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 134
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PREMIO'
                Title.Alignment = taCenter
                Title.Caption = 'Prêmio'
                Title.Color = clSilver
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clMaroon
                Title.Font.Height = -9
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 131
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR'
                Title.Alignment = taCenter
                Title.Caption = 'Valor'
                Title.Color = clSilver
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clMaroon
                Title.Font.Height = -9
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 134
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VLRPRECOEX'
                Title.Alignment = taCenter
                Title.Caption = 'Preço Exercício'
                Title.Color = clSilver
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clMaroon
                Title.Font.Height = -9
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 123
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTAVENCTO'
                Title.Alignment = taCenter
                Title.Caption = 'Vencimento'
                Title.Color = clSilver
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clMaroon
                Title.Font.Height = -9
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 128
                Visible = True
              end>
          end
        end
        object Panel6: TPanel
          Left = 1
          Top = 1
          Width = 798
          Height = 23
          Align = alTop
          BevelOuter = bvLowered
          Caption = 'Operações do Documento'
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 273
      Width = 802
      Height = 159
      Align = alClient
      TabOrder = 2
      object Panel5: TPanel
        Left = 1
        Top = 120
        Width = 800
        Height = 38
        Align = alBottom
        TabOrder = 0
        object lblTotalDespesas: TLabel
          Left = 8
          Top = 10
          Width = 72
          Height = 16
          Caption = 'Despesas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblTotalLiquido: TLabel
          Left = 430
          Top = 10
          Width = 169
          Height = 16
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Total Líquido à Receber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object PnlTotLiquido: TPanel
          Left = 606
          Top = 6
          Width = 171
          Height = 21
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object PnlTotalDespesas: TPanel
          Left = 88
          Top = 6
          Width = 171
          Height = 21
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 800
        Height = 119
        Align = alClient
        TabOrder = 1
        object dbgDespOpcInd: TDBGrid
          Left = 1
          Top = 25
          Width = 798
          Height = 93
          Align = alClient
          DataSource = DMOpcoesIndice.dsBuscaBoletaOper
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = PopDespesa
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnDblClick = dbgDespOpcIndDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'DESCTIPODESPINV'
              Title.Alignment = taCenter
              Title.Caption = 'Tipo de Despesa'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 480
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLRDESPESA'
              Title.Alignment = taCenter
              Title.Caption = 'Valor'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 293
              Visible = True
            end>
        end
        object pnlDespOpcInd: TPanel
          Left = 1
          Top = 25
          Width = 798
          Height = 93
          Align = alClient
          TabOrder = 0
          object lblVlrDesp: TLabel
            Left = 384
            Top = 12
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object lblDespesa: TLabel
            Left = 16
            Top = 14
            Width = 97
            Height = 13
            Caption = 'Tipo de Despesa'
          end
          object Dock972: TDock97
            Left = 712
            Top = 1
            Width = 85
            Height = 91
            AllowDrag = False
            BoundLines = [blLeft]
            Position = dpRight
            object Toolbar971: TToolbar97
              Left = 0
              Top = 0
              Caption = 'tb97Detalhe'
              DockPos = 0
              TabOrder = 0
              object bbtnOkDesp: TBitBtn
                Left = 0
                Top = 0
                Width = 80
                Height = 27
                Caption = '&OK'
                TabOrder = 0
                OnClick = bbtnOkDespClick
                Glyph.Data = {
                  BE060000424DBE06000000000000360400002800000024000000120000000100
                  0800000000008802000000000000000000000001000000010000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                  A600000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  03030303030303030303030303030303030303030303FF030303030303030303
                  03030303030303040403030303030303030303030303030303F8F8FF03030303
                  03030303030303030303040202040303030303030303030303030303F80303F8
                  FF030303030303030303030303040202020204030303030303030303030303F8
                  03030303F8FF0303030303030303030304020202020202040303030303030303
                  0303F8030303030303F8FF030303030303030304020202FA0202020204030303
                  0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
                  040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
                  03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
                  FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
                  0303030303030303030303FA0202020403030303030303030303030303F8FF03
                  03F8FF03030303030303030303030303FA020202040303030303030303030303
                  0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
                  03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
                  030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
                  0202040303030303030303030303030303F8FF03F8FF03030303030303030303
                  03030303FA0202030303030303030303030303030303F8FFF803030303030303
                  030303030303030303FA0303030303030303030303030303030303F803030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  0303}
                NumGlyphs = 2
              end
              object bbtnCancDesp: TBitBtn
                Left = 0
                Top = 27
                Width = 80
                Height = 27
                Cancel = True
                Caption = '&Cancelar'
                TabOrder = 1
                OnClick = bbtnCancDespClick
                Glyph.Data = {
                  BE060000424DBE06000000000000360400002800000024000000120000000100
                  0800000000008802000000000000000000000001000000010000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                  A600000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  0303F8F80303030303030303030303030303030303FF03030303030303030303
                  0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
                  03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
                  030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
                  FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
                  030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
                  F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
                  010101F8030303030303030303F8FF030303030303FFF8030303030303030303
                  030101010101F80303030303030303030303F8FF0303030303F8030303030303
                  0303030303F901010101F8030303030303030303030303F8FF030303F8030303
                  0303030303030303F90101010101F8030303030303030303030303F803030303
                  F8FF030303030303030303F9010101F8010101F803030303030303030303F803
                  03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
                  03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
                  03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
                  0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
                  030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
                  03030303030303030303030303030303030303030303030303F8F8F803030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  0303}
                NumGlyphs = 2
              end
              object bbtnVoltarDesp: TBitBtn
                Left = 0
                Top = 54
                Width = 80
                Height = 27
                Cancel = True
                Caption = '&Voltar'
                TabOrder = 2
                OnClick = bbtnVoltarDespClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
                  FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                  FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                  FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                  FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                  FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
                  C8807FF7777777777FF700000000000000007777777777777777333333333333
                  3333333333333333333333333333333333333333333333333333}
                NumGlyphs = 2
              end
            end
          end
          object dbeVlrDesp: TDBEdit
            Left = 384
            Top = 28
            Width = 169
            Height = 21
            DataField = 'VLRDESPESA'
            DataSource = DMOpcoesIndice.dsBuscaBoletaOper
            TabOrder = 1
          end
          object dbeTipoDesp: TDBEdit
            Left = 16
            Top = 28
            Width = 361
            Height = 21
            Color = clBtnFace
            DataField = 'DESCTIPODESPINV'
            DataSource = DMOpcoesIndice.dsBuscaBoletaOper
            Enabled = False
            TabOrder = 2
          end
        end
        object Panel8: TPanel
          Left = 1
          Top = 1
          Width = 798
          Height = 24
          Align = alTop
          BevelOuter = bvLowered
          Caption = 'Despesas da Operação'
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 433
    Width = 804
    inherited tb97Fundo: TToolbar97
      Left = 632
      DockPos = 666
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 380
      DockPos = 414
      inherited ToolbarSep971: TToolbarSep97
        Left = 80
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 164
        Top = 0
        Blank = True
        SizeHorz = 3
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 83
        Enabled = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 167
        Enabled = False
        Visible = False
        OnClick = bbtnCancelarClick
      end
      object BitBtn1: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Hint = 'Imprime a Boleta de Operação'
        Cancel = True
        Caption = '&Boleta'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BitBtn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        Spacing = 2
      end
    end
    inline fraMsg: TfraMensagem
      Width = 384
      Height = 38
      TabOrder = 2
      inherited pnlProgresso: TPanel
        Width = 384
        Height = 38
        inherited pnlProgressoMensagem: TPanel
          Height = 36
          inherited lblProgressoMensagem: TfcLabel
            Height = 34
          end
        end
        inherited pnlProgressoBarra: TPanel
          Width = 187
          Height = 36
          inherited pgbProcesso: TProgressBar
            Width = 185
            Height = 34
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 619
    Top = 5
  end
  object QryCorretValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DISTINCT OC.IDCORRETVALORES, CO.SGLCORRETVALORES'
      'FROM'
      '   CORRETVALORES CO, ORDEMOPCIND OC'
      'WHERE'
      '   (OC.DATAORDEM = TO_DATE(:DATAORDEM,'#39'DD/MM/YYYY'#39')) AND'
      '   (OC.IDCORRETVALORES = CO.IDCORRETVALORES)'
      'ORDER BY CO.SGLCORRETVALORES'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 338
    Top = 62
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAORDEM'
        ParamType = ptUnknown
      end>
    object QryCorretValoresSGLCORRETVALORES: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'SGLCORRETVALORES'
      Size = 10
    end
    object QryCorretValoresIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Visible = False
    end
  end
  object dsCorretValores: TwwDataSource
    AutoEdit = False
    DataSet = QryCorretValores
    Left = 294
    Top = 62
  end
  object PopOperacao: TPopupMenu
    Left = 598
    Top = 183
    object mnuAlterarOperOpcInd: TMenuItem
      Caption = 'Alterar'
      OnClick = mnuAlterarOperOpcIndClick
    end
  end
  object PopDespesa: TPopupMenu
    Left = 662
    Top = 183
    object mnuPopDespAlterar: TMenuItem
      Caption = 'Alterar'
      OnClick = mnuPopDespAlterarClick
    end
  end
end
