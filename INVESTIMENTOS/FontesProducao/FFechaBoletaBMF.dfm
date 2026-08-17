inherited FrmFechaBoletaBMF: TFrmFechaBoletaBMF
  Left = 297
  Top = 226
  HelpContext = 790263
  BorderStyle = bsSingle
  Caption = 'Fechamento de Boletas de BM&F'
  ClientHeight = 531
  ClientWidth = 804
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 804
    Height = 492
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 802
      Height = 490
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 3
      TabOrder = 0
      object pnlCaption: TPanel
        Left = 5
        Top = 5
        Width = 792
        Height = 49
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 122
          Top = 4
          Width = 53
          Height = 13
          Caption = 'Corretora'
        end
        object Label2: TLabel
          Left = 6
          Top = 4
          Width = 98
          Height = 13
          Caption = 'Data Referência '
        end
        object Label3: TLabel
          Left = 498
          Top = 4
          Width = 98
          Height = 13
          Caption = 'Data Liquidação '
        end
        object Label4: TLabel
          Left = 616
          Top = 4
          Width = 49
          Height = 13
          Caption = 'Contrato'
        end
        object lblBoletaAF: TLabel
          Left = 742
          Top = 20
          Width = 111
          Height = 16
          Caption = 'Boleta Fechada'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label15: TLabel
          Left = 376
          Top = 4
          Width = 65
          Height = 13
          Caption = 'Documento'
        end
        object dbeLote: TDBEdit
          Left = 616
          Top = 20
          Width = 113
          Height = 21
          Color = clWhite
          DataField = 'IDLOTE'
          DataSource = DmRelBoletaBMF.dsBuscaOperacoes
          Enabled = False
          TabOrder = 4
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
            'SGLCORRETVALORES'#9'10'#9'Corretora'#9'F')
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
          DataField = 'DATAVENCOPER'
          DataSource = DmRelBoletaBMF.dsBuscaOperacoes
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
        object edtNumDoc: TEdit
          Left = 376
          Top = 20
          Width = 113
          Height = 21
          TabOrder = 2
          OnExit = dblCorretoraExit
        end
      end
      object Panel3: TPanel
        Left = 5
        Top = 54
        Width = 792
        Height = 163
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        object dbgOperacoes: TDBGrid
          Left = 1
          Top = 24
          Width = 790
          Height = 138
          Align = alClient
          DataSource = DmRelBoletaBMF.dsBuscaOperacoes
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnCellClick = dbgOperacoesCellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'DESCINVESTIMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'Investimento'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCTIPOOPERACAO'
              Title.Alignment = taCenter
              Title.Caption = 'Tipo de Operação'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 265
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTDEMOVINVCART'
              Title.Alignment = taCenter
              Title.Caption = 'Qtd. Operação'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 169
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VRLPUOPER'
              Title.Caption = 'PU Operação'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 137
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLRAJOPER'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr. Ajuste / Operação'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -9
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 167
              Visible = True
            end>
        end
        object Panel6: TPanel
          Left = 1
          Top = 1
          Width = 790
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
          TabOrder = 1
        end
      end
      object Panel4: TPanel
        Left = 5
        Top = 437
        Width = 792
        Height = 48
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 2
        object Label5: TLabel
          Left = 248
          Top = 6
          Width = 56
          Height = 13
          Caption = 'Despesas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 368
          Top = 6
          Width = 44
          Height = 13
          Caption = 'Líquido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 128
          Top = 6
          Width = 36
          Height = 13
          Caption = 'Ajuste'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 8
          Top = 6
          Width = 57
          Height = 13
          Caption = 'PU Ajuste'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 488
          Top = 6
          Width = 22
          Height = 13
          Caption = 'I.R.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 608
          Top = 6
          Width = 34
          Height = 13
          Caption = 'CPMF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object PnlTotLiquido: TPanel
          Left = 368
          Top = 21
          Width = 116
          Height = 21
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object PnlTotalTaxas: TPanel
          Left = 248
          Top = 21
          Width = 116
          Height = 21
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object PnlAjustePosicao: TPanel
          Left = 128
          Top = 21
          Width = 116
          Height = 21
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object PnlPUAjuste: TPanel
          Left = 8
          Top = 21
          Width = 116
          Height = 21
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        object pnlIR: TPanel
          Left = 488
          Top = 21
          Width = 116
          Height = 21
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object pnlCPMF: TPanel
          Left = 608
          Top = 21
          Width = 116
          Height = 21
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
      end
      object Panel5: TPanel
        Left = 5
        Top = 217
        Width = 792
        Height = 220
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Panel5'
        TabOrder = 3
        object Panel8: TPanel
          Left = 1
          Top = 1
          Width = 790
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
          TabOrder = 0
        end
        object PgCt: TPageControl
          Left = 1
          Top = 25
          Width = 790
          Height = 194
          ActivePage = tbDet
          Align = alClient
          HotTrack = True
          TabOrder = 1
          TabPosition = tpBottom
          object tbDet: TTabSheet
            Caption = 'Detalhes'
            object PnlDadosDespesa: TPanel
              Left = 0
              Top = 0
              Width = 782
              Height = 166
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 1
              object Label10: TLabel
                Left = 16
                Top = 8
                Width = 30
                Height = 13
                Caption = 'Valor'
              end
              object dbeVlrDespesa: TDBEdit
                Left = 16
                Top = 24
                Width = 169
                Height = 21
                DataField = 'VLRDESPOPER'
                DataSource = DsDespesasOperacao
                TabOrder = 0
              end
              object Dock974: TDock97
                Left = 696
                Top = 1
                Width = 85
                Height = 164
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
                    Default = True
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
            end
            object GridDespesas: TDBGrid
              Left = 0
              Top = 0
              Width = 782
              Height = 166
              Hint = 'Botão Direito Altera'
              Align = alClient
              DataSource = DsDespesasOperacao
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
              ParentShowHint = False
              PopupMenu = PopDespesas
              ShowHint = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              Columns = <
                item
                  Expanded = False
                  FieldName = 'DESCTIPODESPINV'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'Descricão das Despesas'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clMaroon
                  Title.Font.Height = -9
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 285
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATAVENCDESPOPER'
                  Title.Alignment = taCenter
                  Title.Caption = 'Vencimento'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clMaroon
                  Title.Font.Height = -9
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 99
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VLRDESPOPER'
                  Title.Alignment = taCenter
                  Title.Caption = 'Valor'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clMaroon
                  Title.Font.Height = -9
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 126
                  Visible = True
                end>
            end
          end
          object TbConsolidado: TTabSheet
            Caption = 'Consolidado'
            object grdConsolidado: TDBGrid
              Left = 0
              Top = 0
              Width = 782
              Height = 166
              Align = alClient
              DataSource = dsConsolidado
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              Columns = <
                item
                  Expanded = False
                  FieldName = 'DESCTIPODESPINV'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'Descricão da Despesa'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clMaroon
                  Title.Font.Height = -9
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 423
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VLRDESPOPER'
                  Title.Alignment = taCenter
                  Title.Caption = 'Valor'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clMaroon
                  Title.Font.Height = -9
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 233
                  Visible = True
                end>
            end
          end
          object TbObs: TTabSheet
            Caption = 'Observação'
            object mmoObs: TMemo
              Left = 0
              Top = 0
              Width = 734
              Height = 78
              Align = alClient
              MaxLength = 300
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 492
    Width = 804
    inherited tb97Fundo: TToolbar97
      Left = 388
      DockPos = 679
      inherited sep1: TToolbarSep97
        Left = 329
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 163
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 246
        Top = 0
        Blank = True
        SizeHorz = 2
        Visible = False
      end
      object ToolbarSep973: TToolbarSep97 [3]
        Left = 81
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 248
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 331
      end
      object bbtnConfirmar: TBitBtn
        Left = 83
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        Enabled = False
        TabOrder = 2
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnCancelar: TBitBtn
        Left = 165
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Cancelar'
        TabOrder = 3
        Visible = False
        Kind = bkCancel
        Spacing = 2
      end
      object btnImprimir: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Boleta'
        Enabled = False
        TabOrder = 4
        OnClick = btnImprimirClick
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
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 59
    Top = 139
  end
  object IvExtendedTranslator1: TIvExtendedTranslator
    DictionaryName = 'CMDicionario'
    Left = 69
    Top = 163
    TargetsData = (
      1
      4
      (
        ''
        'Hint'
        0)
      (
        ''
        'Caption'
        0)
      (
        ''
        'Lines'
        0)
      (
        ''
        'Text'
        0))
  end
  object QryCorretValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DISTINCT'
      '   HI1.IDLOTE,'
      '   OP.IDCORRETVALORES,OP.DATAVENCOPER,'
      '   CV.SGLCORRETVALORES,'
      '   HI1.DATAMOVCARTINV,HI1.IDINVESTIMENTO'
      'FROM'
      '   HISTCARTINV HI1,OPERACAOINVEST OP,CORRETVALORES CV,'
      '   ('
      '    SELECT  MAX(HI.IDHISTCARTINV) AS IDHISTCART, HI.IDLOTE'
      '    FROM'
      '       HISTCARTINV HI'
      '    WHERE'
      '       (HI.IDTIPOINVEST = 8) AND'
      
        '       (HI.TIPMOVCARTINV IN ('#39'ATU'#39','#39'INI'#39','#39'OPE'#39'))  AND (HI.DATAMO' +
        'VCARTINV = TO_DATE(:dDataAtu, '#39'DD/MM/YYYY'#39'))'
      '    GROUP BY'
      '       HI.IDLOTE'
      '   ) HI2'
      'WHERE'
      '   (HI1.IDHISTCARTINV = IDHISTCART) AND'
      '   (HI1.IDLOTE = OP.IDLOTE) AND'
      '   (OP.FLGSTATUSFECHBOL IN ('#39'P'#39','#39'F'#39')) AND'
      '   (OP.DATAOPERACAO = TO_DATE(:dDataAtu, '#39'DD/MM/YYYY'#39')) AND'
      '   (OP.IDCORRETVALORES = CV.IDCORRETVALORES) AND'
      '   (CV.FLGATIVABMF='#39'S'#39')'
      'ORDER BY SGLCORRETVALORES '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 165
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end>
    object QryCorretValoresIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QryCorretValoresIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object QryCorretValoresSGLCORRETVALORES: TStringField
      FieldName = 'SGLCORRETVALORES'
      Size = 10
    end
    object QryCorretValoresDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object QryCorretValoresDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object QryCorretValoresIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
  end
  object dsCorretValores: TwwDataSource
    AutoEdit = False
    DataSet = QryCorretValores
    Left = 165
    Top = 120
  end
  object dsConsolidado: TwwDataSource
    DataSet = QryConsolidado
    Left = 629
    Top = 107
  end
  object QryConsolidado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#9'TD.DESCTIPODESPINV,TD.IDTIPODESPINVEST, SUM(NVL(DOP.VLRD' +
        'ESPOPER,0)) AS VLRDESPOPER'
      ''
      
        'FROM '#9'CM.OPERACAOINVEST OI, CM.DESPOPERINVEST DOP, CM.TIPODESPIN' +
        'VEST TD'
      ''
      'WHERE '#9'(OI.IDLOTE      = :sBoleta) '#9'     AND '
      #9'(DOP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND '
      
        '                (DOP.DATAOPERACAO = TO_DATE(:dDataAtu,'#39'DD/MM/YYY' +
        'Y'#39')) AND'
      #9'(DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST) '
      #9
      'GROUP BY TD.DESCTIPODESPINV,TD.IDTIPODESPINVEST'
      ' '
      'ORDER BY TD.DESCTIPODESPINV'
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'VLRDESPOPER'#9'###,###,###,#0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 632
    Top = 147
    ParamData = <
      item
        DataType = ftString
        Name = 'sBoleta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end>
    object QryConsolidadoDESCTIPODESPINV: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPODESPINV'
      Size = 60
    end
    object QryConsolidadoVLRDESPOPER: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRDESPOPER'
      DisplayFormat = '###,###,###,#0.00'
    end
    object QryConsolidadoIDTIPODESPINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPODESPINVEST'
    end
  end
  object QryDespesasOperacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#9'DOP.IDDESPOPERINVEST, DOP.IDFORCLI,       DOP.IDOPERACAO' +
        'INVEST,'
      
        '         DOP.IDTIPOINVEST,     DOP.IDTIPOOPERACAO, NVL(DOP.VLRDE' +
        'SPOPER,0) AS VLRDESPOPER,'
      '         OI.DATAOPERACAO,'
      #9'      DOP.IDTIPODESPINVEST, DOP.DATAVENCDESPOPER,'
      
        #9'      DOP.IDREGRAVENCUSADA, OI.NUMDOCUMENTO,      OI.IDINVESTIM' +
        'ENTO,'
      
        #9'      OI.IDCARTEIRAINVEST,  OI.VLROPERACAO,       OI.QTDEOPERAC' +
        'AO, OI.MOECODIGO, OI.IDLOTE,'
      #9'      TP.DESCTIPOOPERACAO,'
      
        #9'      IV.DESCINVESTIMENTO, TP.NATUREZAOPERACAO, TD.DESCTIPODESP' +
        'INV'
      ''
      'FROM '#9'CM.DESPOPERINVEST DOP, CM.OPERACAOINVEST OI,'
      #9'      CM.TIPOOPERACAO TP,    CM.INVESTIMENTO IV,'
      #9'      CM.TIPODESPINVEST TD'
      ''
      'WHERE '#9'(DOP.IDOPERACAOINVEST = :iIdOperacaoInvest)   AND'
      #9'      (DOP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND'
      #9'      (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST) AND'
      #9'      (OI.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)      AND'
      #9'      (OI.IDINVESTIMENTO = IV.IDINVESTIMENTO) '
      'ORDER BY OI.NUMDOCUMENTO, TD.DESCTIPODESPINV'
      ' ')
    UpdateObject = UpdDespesasOperacao
    ValidateWithMask = True
    Left = 418
    Top = 139
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iIdOperacaoInvest'
        ParamType = ptUnknown
      end>
    object QryDespesasOperacaoIDDESPOPERINVEST: TFloatField
      FieldName = 'IDDESPOPERINVEST'
    end
    object QryDespesasOperacaoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object QryDespesasOperacaoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object QryDespesasOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object QryDespesasOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object QryDespesasOperacaoVLRDESPOPER: TFloatField
      FieldName = 'VLRDESPOPER'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryDespesasOperacaoDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object QryDespesasOperacaoIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
    end
    object QryDespesasOperacaoDATAVENCDESPOPER: TDateTimeField
      FieldName = 'DATAVENCDESPOPER'
    end
    object QryDespesasOperacaoIDREGRAVENCUSADA: TFloatField
      FieldName = 'IDREGRAVENCUSADA'
    end
    object QryDespesasOperacaoNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object QryDespesasOperacaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryDespesasOperacaoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryDespesasOperacaoVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryDespesasOperacaoQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object QryDespesasOperacaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object QryDespesasOperacaoIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QryDespesasOperacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryDespesasOperacaoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryDespesasOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object QryDespesasOperacaoDESCTIPODESPINV: TStringField
      FieldName = 'DESCTIPODESPINV'
      Size = 60
    end
  end
  object DsDespesasOperacao: TwwDataSource
    DataSet = QryDespesasOperacao
    Left = 416
    Top = 123
  end
  object QrySumDespBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(X.VLRDESPOPER) AS VLRDESPOPER'
      'FROM'
      '   (SELECT'
      '       SUM(NVL(DOP.VLRDESPOPER,0)) AS VLRDESPOPER'
      '    FROM'
      
        '       CM.OPERACAOINVEST OI, CM.DESPOPERINVEST DOP, CM.TIPODESPI' +
        'NVEST TD'
      '    WHERE'
      '       (OI.IDLOTE = :sBoleta) AND'
      '       (DOP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND'
      '       (DOP.DATAOPERACAO = TO_DATE(:dDataAtu,'#39'DD/MM/YYYY'#39')) AND'
      '       (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST) AND'
      '       (DOP.IDTIPODESPINVEST NOT IN (-20,-21))'
      '    GROUP BY TD.DESCTIPODESPINV,TD.IDTIPODESPINVEST) X'
      ' '
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'VLRDESPOPER'#9'###,###,###,#0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 632
    Top = 195
    ParamData = <
      item
        DataType = ftString
        Name = 'sBoleta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end>
    object QrySumDespBoletaVLRDESPOPER: TFloatField
      FieldName = 'VLRDESPOPER'
    end
  end
  object QrySumAjusteNormal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(X.VLRDESPOPER) AS VLRDESPOPER'
      'FROM'
      '   (SELECT'
      '       SUM(NVL(DOP.VLRDESPOPER,0)) AS VLRDESPOPER'
      '    FROM'
      
        '       CM.OPERACAOINVEST OI, CM.DESPOPERINVEST DOP, CM.TIPODESPI' +
        'NVEST TD'
      '    WHERE'
      '       (OI.IDLOTE = :sBoleta) AND'
      '       (DOP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND'
      '       (DOP.DATAOPERACAO = TO_DATE(:dDataAtu,'#39'DD/MM/YYYY'#39')) AND'
      '       (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST) AND'
      '       (DOP.IDTIPODESPINVEST IN (-20,-21))'
      '    GROUP BY TD.DESCTIPODESPINV,TD.IDTIPODESPINVEST) X'
      ' '
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'VLRDESPOPER'#9'###,###,###,#0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 632
    Top = 243
    ParamData = <
      item
        DataType = ftString
        Name = 'sBoleta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end>
    object QrySumAjusteNormalVLRDESPOPER: TFloatField
      FieldName = 'VLRDESPOPER'
    end
  end
  object QrySumAjustePosicao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '       VLRMOVCARTINV,IDTIPOOPERACAO'
      'FROM'
      '       HISTCARTINV'
      'WHERE '
      '      (IDLOTE = :sBoleta)  AND'
      '      (DATAMOVCARTINV = TO_DATE(:dDataAtu,'#39'DD/MM/YYYY'#39')) AND'
      '      (IDTIPOOPERACAO IN (-10,-11) )'
      ' '
      ' ')
    PictureMasks.Strings = (
      'VLRDESPOPER'#9'###,###,###,#0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 632
    Top = 291
    ParamData = <
      item
        DataType = ftString
        Name = 'sBoleta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end>
    object QrySumAjustePosicaoVLRMOVCARTINV: TFloatField
      FieldName = 'VLRMOVCARTINV'
    end
    object QrySumAjustePosicaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
  end
  object QryBuscaPuAjusteD0: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       VLRAJUSTE AS VLRAJUSTEDO'
      'FROM'
      '       COTACAOBMF CB1'
      'WHERE'
      '       (DATACOTACAOBMF = TO_DATE(:dDataAtu,'#39'DD/MM/YYYY'#39') ) AND'
      '       (IDINVESTIMENTO = :iIdInvestimento)'
      ' '
      ' ')
    PictureMasks.Strings = (
      'VLRDESPOPER'#9'###,###,###,#0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 520
    Top = 195
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdInvestimento'
        ParamType = ptUnknown
      end>
    object QryBuscaPuAjusteD0VLRAJUSTEDO: TFloatField
      FieldName = 'VLRAJUSTEDO'
    end
  end
  object UpdBuscaOperacoes: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  VLRMOVCARTINV = :VLRMOVCARTINV'
      'where'
      '  IDHISTCARTINV = :OLD_IDHISTCARTINV')
    InsertSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      '')
    Left = 282
    Top = 107
  end
  object UpdDespesasOperacao: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.DESPOPERINVEST'
      'set'
      '  VLRDESPOPER = :VLRDESPOPER'
      'where'
      '  IDDESPOPERINVEST = :OLD_IDDESPOPERINVEST')
    DeleteSQL.Strings = (
      '')
    Left = 466
    Top = 163
  end
  object UpdHistCartInvOPE: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      
        '        HISTCARTINV SET PLNCODIGO = :PLNCODIGO,CODDOCUMENTO = :C' +
        'ODDOCUMENTO,'
      '        PLANO = :PLANO'
      'WHERE'
      '        (IDTIPOINVEST = 8 )'
      '  AND   (IDLOTE = :sBoleta)'
      '  AND   (DATAMOVCARTINV = TO_DATE(:dDataAtu,'#39'DD/MM/YYYY'#39') )'
      
        '  AND   ( ( ( ( TIPMOVCARTINV = '#39'OPE'#39' ) AND ( IDTIPOOPERACAO < 0' +
        ' ) ) OR'
      
        '            ( ( TIPMOVCARTINV IN ('#39'OPE'#39','#39'INI'#39') ) AND ( IDTIPOOPE' +
        'RACAO > 0 ) ) ) OR'
      
        '        ((TIPMOVCARTINV = '#39'DOP'#39') AND (UPPER(HISTMOVCARTINV) LIKE' +
        ' '#39'%AJUSTE NORMAL%'#39')))'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 271
    Top = 186
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sBoleta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end>
  end
  object QryUpdOperacaoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '      OPERACAOINVEST'
      'SET FLGSTATUSFECHBOL = :pFLGSTATUSFECHBOL'
      'WHERE'
      '        (IDTIPOINVEST = 8 ) AND'
      '        (IDLOTE = :sBoleta)  AND'
      '        (DATAOPERACAO = TO_DATE(:dDataAtu,'#39'DD/MM/YYYY'#39') )'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 151
    Top = 274
    ParamData = <
      item
        DataType = ftString
        Name = 'pFLGSTATUSFECHBOL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sBoleta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end>
  end
  object UpdHistCartInvDOP: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      
        '        HISTCARTINV SET PLNCODIGO = :PLNCODIGO,CODDOCUMENTO = :C' +
        'ODDOCUMENTO,'
      '        PLANO = :PLANO'
      'WHERE'
      '        (IDTIPOINVEST = 8 )'
      '  AND   (IDLOTE = :sBoleta)'
      '  AND   (DATAMOVCARTINV = TO_DATE(:dDataAtu,'#39'DD/MM/YYYY'#39') )'
      '  AND   (TIPMOVCARTINV = '#39'DOP'#39')'
      '  AND   (NOT UPPER(HISTMOVCARTINV) LIKE '#39'%AJUSTE NORMAL%'#39')'
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
    ValidateWithMask = True
    Left = 271
    Top = 242
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sBoleta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end>
  end
  object QrySumIR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '       SUM(VLRIRAPU) AS VLRIR'
      'FROM'
      '       HISTCARTINV'
      'WHERE '
      '      (IDLOTE = :sBoleta)  AND'
      '      (DATAMOVCARTINV = TO_DATE(:dDataAtu,'#39'DD/MM/YYYY'#39')) '
      ''
      ' '
      ' ')
    PictureMasks.Strings = (
      'VLRDESPOPER'#9'###,###,###,#0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 536
    Top = 291
    ParamData = <
      item
        DataType = ftString
        Name = 'sBoleta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end>
    object QrySumIRVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
  end
  object QrySumCPMF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '       SUM(VLRCPMFAPU) AS VLRCPMF'
      'FROM'
      '       HISTCARTINV'
      'WHERE '
      '      (IDLOTE = :sBoleta)  AND'
      '      (DATAMOVCARTINV = TO_DATE(:dDataAtu,'#39'DD/MM/YYYY'#39'))'
      ' '
      ' ')
    PictureMasks.Strings = (
      'VLRDESPOPER'#9'###,###,###,#0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 472
    Top = 291
    ParamData = <
      item
        DataType = ftString
        Name = 'sBoleta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end>
    object QrySumCPMFVLRCPMF: TFloatField
      FieldName = 'VLRCPMF'
    end
  end
  object UpdHistCartInvCPMF: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      
        '        HISTCARTINV SET PLNCODIGO = :PLNCODIGO,CODDOCUMENTO = :C' +
        'ODDOCUMENTO,'
      '        PLANO = :PLANO'
      'WHERE'
      '        (IDTIPOINVEST = 8 ) AND'
      '        (IDLOTE = :sBoleta)  AND'
      '        (DATAMOVCARTINV = TO_DATE(:dDataAtu,'#39'DD/MM/YYYY'#39') ) AND'
      '        (TIPMOVCARTINV = '#39'OPE'#39') AND'
      '        (IDTIPOOPERACAO > 0 )'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 271
    Top = 290
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sBoleta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end>
  end
  object qryUpdDataFech: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PARAMINVEST'
      'SET DATAULTFECHBMF = TO_DATE(:DATAFECH,'#39'DD/MM/YYYY'#39')')
    ValidateWithMask = True
    Left = 375
    Top = 293
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAFECH'
        ParamType = ptInput
      end>
  end
  object qryFlgContabil: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   FLGGERACONTAB'
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '   IDTIPOOPERACAO = :IDTIPOOPERACAO'
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'VLRDESPOPER'#9'###,###,###,#0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 528
    Top = 115
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
    object qryFlgContabilFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACONTAB'
    end
  end
  object QryUpdNumDoc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   OPERACAOINVEST SET NUMDOCUMENTO = :NUMDOCUMENTO'
      'WHERE'
      '   (IDTIPOINVEST = 8 ) AND'
      '   (IDLOTE = :sBoleta)  AND'
      '   (DATAOPERACAO = TO_DATE(:dDataAtu,'#39'DD/MM/YYYY'#39') )'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 271
    Top = 338
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sBoleta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end>
  end
  object PopDespesas: TPopupMenu
    Left = 534
    Top = 355
    object Alterar1: TMenuItem
      Caption = 'Alterar'
      OnClick = Alterar1Click
    end
  end
end
