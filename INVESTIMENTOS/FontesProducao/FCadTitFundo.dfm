inherited FrmCadTitFundo: TFrmCadTitFundo
  Left = 52
  Top = 47
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Fundos de Investimento'
  ClientHeight = 487
  ClientWidth = 643
  FormStyle = fsNormal
  Visible = False
  OnCloseQuery = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 58
    Width = 643
    Height = 390
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 633
      Height = 201
      Align = alTop
      TabOrder = 0
      object Label10: TLabel
        Left = 16
        Top = 6
        Width = 86
        Height = 13
        Caption = 'Tipo de Título '
      end
      object Label14: TLabel
        Left = 16
        Top = 44
        Width = 48
        Height = 13
        Caption = 'Emissor '
      end
      object Label1: TLabel
        Left = 16
        Top = 79
        Width = 116
        Height = 13
        Caption = 'Descrição do Titulo '
      end
      object Label4: TLabel
        Left = 16
        Top = 115
        Width = 96
        Height = 13
        Caption = 'Tipo de Contrato'
      end
      object Label3: TLabel
        Left = 16
        Top = 155
        Width = 75
        Height = 13
        Caption = 'Observações'
      end
      object LbCustodiante: TLabel
        Left = 251
        Top = 115
        Width = 68
        Height = 13
        Caption = 'Custodiante'
      end
      object Label32: TLabel
        Left = 429
        Top = 115
        Width = 78
        Height = 13
        Caption = 'Periodicidade'
      end
      object Label12: TLabel
        Left = 429
        Top = 79
        Width = 51
        Height = 13
        Caption = 'Carência'
      end
      object Label29: TLabel
        Left = 430
        Top = 44
        Width = 74
        Height = 13
        Caption = 'Conta CETIP'
      end
      object DbLkcTipTit: TwwDBLookupCombo
        Left = 16
        Top = 23
        Width = 406
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPRENFIXA'#9'40'#9'Tipo de Titulo'
          'CODTIPRENFIXA'#9'10'#9'Código')
        DataField = 'CODTIPRENFIXA'
        DataSource = DsSubTipo
        LookupTable = QryTipTit
        LookupField = 'CODTIPRENFIXA'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnChange = DbLkcTipTitChange
      end
      object DbEdDescInvest: TDBEdit
        Left = 16
        Top = 93
        Width = 404
        Height = 21
        DataField = 'DESCINVESTIMENTO'
        DataSource = ds
        TabOrder = 1
      end
      object DbLkcTipoContrato: TwwDBLookupCombo
        Left = 16
        Top = 128
        Width = 225
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOCTINVEST'#9'40'#9'Tipo de Contrato')
        LookupTable = QryTipoContrato
        LookupField = 'IDTIPOCONTRINVEST'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = DbLkcEmissorChange
      end
      object DbMemoObservacao: TDBMemo
        Left = 96
        Top = 157
        Width = 453
        Height = 33
        DataField = 'OBSINVESTIMENTO'
        DataSource = ds
        TabOrder = 3
      end
      object DbLkcCustodiante: TwwDBLookupCombo
        Left = 251
        Top = 128
        Width = 169
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SGLCUSTODIANTE'#9'40'#9'Custodiante')
        DataField = 'IDCUSTODIANTE'
        DataSource = DsSubTipo
        LookupTable = QryCustodiante
        LookupField = 'IDCUSTODIANTE'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object DbEdPeriodicidade: TDBEdit
        Left = 429
        Top = 128
        Width = 120
        Height = 21
        DataField = 'PERIODICIDADE'
        DataSource = DsSubTipo
        TabOrder = 5
      end
      object DbEdCarencia: TDBEdit
        Left = 429
        Top = 93
        Width = 120
        Height = 21
        DataField = 'CARENCIA'
        DataSource = DsSubTipo
        TabOrder = 6
      end
      object DbEdNumAlt: TDBEdit
        Left = 430
        Top = 57
        Width = 120
        Height = 21
        DataField = 'IDALTTITRENFIX'
        DataSource = DsSubTipo
        TabOrder = 7
      end
      object Inativo: TDBCheckBox
        Left = 430
        Top = 20
        Width = 61
        Height = 17
        Caption = 'Inativo'
        DataField = 'FLGATIVO'
        DataSource = ds
        TabOrder = 8
        ValueChecked = 'N'
        ValueUnchecked = 'S'
      end
      object DbLkcEmissor: TwwDBLookupCombo
        Left = 16
        Top = 57
        Width = 404
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SIGLAEMISSOR'#9'40'#9'Sigla do Emissor ')
        DataField = 'IDEMISSOR'
        DataSource = ds
        LookupTable = QryEmissor
        LookupField = 'IDEMISSOR'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 9
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = DbLkcEmissorChange
      end
    end
    object Panel2: TPanel
      Left = 5
      Top = 206
      Width = 633
      Height = 179
      Align = alClient
      TabOrder = 1
      object PageControl1: TPageControl
        Left = 1
        Top = 1
        Width = 631
        Height = 177
        ActivePage = TabSheet1
        Align = alClient
        HotTrack = True
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = 'Certificados do Fundo '
          object GrdDetalhe: TDBGrid
            Left = 0
            Top = 31
            Width = 623
            Height = 99
            Align = alClient
            DataSource = DsContrato
            ReadOnly = True
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            Columns = <
              item
                Expanded = False
                FieldName = 'IDLOTE'
                Title.Caption = 'Certificado'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATACOMPRALOTE'
                Title.Caption = 'Data de Compra'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATACARENCIA'
                Title.Caption = 'Dt. Carência'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ANIVERSARIO'
                Title.Caption = 'Aniversário'
                Width = 68
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ULTSALDOQTD'
                Title.Caption = 'Saldo Qtd.'
                Width = 93
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ULTSALDOVALOR'
                Title.Caption = 'Saldo Valor'
                Width = 100
                Visible = True
              end>
          end
          object PnlDetalhe: TPanel
            Left = 0
            Top = 31
            Width = 623
            Height = 99
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            Visible = False
            object Label2: TLabel
              Left = 15
              Top = 11
              Width = 109
              Height = 13
              Caption = 'Certificado Numero'
            end
            object Label34: TLabel
              Left = 277
              Top = 11
              Width = 100
              Height = 13
              Caption = 'Data de Carência'
            end
            object Label19: TLabel
              Left = 146
              Top = 11
              Width = 96
              Height = 13
              Caption = 'Data de Compra '
            end
            object Label33: TLabel
              Left = 15
              Top = 50
              Width = 64
              Height = 13
              Caption = 'Aniversário'
            end
            object DbIdLote: TDBEdit
              Left = 15
              Top = 25
              Width = 123
              Height = 21
              DataField = 'IDLOTE'
              DataSource = DsContrato
              TabOrder = 0
              OnExit = DbIdLoteExit
            end
            object DbEdDtCarencia: TCMDateTimePicker
              Left = 277
              Top = 25
              Width = 123
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATACARENCIA'
              DataSource = DsContrato
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
            object DbDtCompraTit: TCMDateTimePicker
              Left = 146
              Top = 25
              Width = 123
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATACOMPRALOTE'
              DataSource = DsContrato
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
              OnExit = DbDtCompraTitExit
            end
            object DbEdAniversario: TDBEdit
              Left = 15
              Top = 64
              Width = 123
              Height = 21
              Color = clWhite
              DataField = 'ANIVERSARIO'
              DataSource = DsContrato
              TabOrder = 3
            end
            object Dock974: TDock97
              Left = 537
              Top = 1
              Width = 85
              Height = 97
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
                  OnClick = bbtnCancelarDetClick
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
          object Dock973: TDock97
            Left = 0
            Top = 0
            Width = 623
            Height = 31
            AllowDrag = False
            BoundLines = [blTop, blBottom, blLeft, blRight]
            object tb97BotoesDetalhe: TToolbar97
              Left = 0
              Top = 0
              Caption = 'tb97BotoesDetalhe'
              DockPos = 0
              TabOrder = 0
              object BtInserir: TSpeedButton
                Left = 0
                Top = 0
                Width = 25
                Height = 25
                Hint = 'Inserir novo registro|'
                AllowAllUp = True
                GroupIndex = 1
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
                OnClick = BtInserirClick
              end
              object BtAlterar: TSpeedButton
                Left = 25
                Top = 0
                Width = 25
                Height = 25
                Hint = 'Alterar o registro selecionado|'
                AllowAllUp = True
                GroupIndex = 1
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
                OnClick = BtAlterarClick
              end
              object BtExcluir: TSpeedButton
                Left = 50
                Top = 0
                Width = 25
                Height = 25
                Hint = 'Remover o registro selecionado|'
                AllowAllUp = True
                GroupIndex = 1
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
                Layout = blGlyphTop
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                Spacing = 0
                OnClick = BtExcluirClick
              end
            end
            object Panel3: TPanel
              Left = 396
              Top = 0
              Width = 148
              Height = 29
              BevelInner = bvLowered
              Caption = '`'
              TabOrder = 1
              object BtExecutarOperacao: TBitBtn
                Left = 2
                Top = 2
                Width = 143
                Height = 25
                Hint = 'Executa Operação Selecionada'
                Caption = 'Executar Operação '
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = BtExecutarOperacaoClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  88888888888888F88888888888888778888888888888F77F8888888888800F08
                  8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
                  88888887788888F7F8888887FFFFFCF088888887F88FF7878F888887FFCCCFFF
                  08888887FF77788F7F88888B7FFFFFCF088888F77F88FF7878F88B8B7BFCCCFF
                  F088878778F77788F78F888B87FFFFFCFF0888F7F7F88FF788788BBBBBFFCCCF
                  FFF08777778F777888F7888B887FFFFFF77888F7F878F888F7788B8B8B87FFF7
                  78888787F7878FF77888888B8888777888888887888877788888888888888888
                  8888888888888888888888888888888888888888888888888888}
                NumGlyphs = 2
              end
            end
          end
          object StBarFundo: TStatusBar
            Left = 0
            Top = 130
            Width = 623
            Height = 19
            Panels = <
              item
                Width = 425
              end
              item
                Alignment = taRightJustify
                Text = '0,00    '
                Width = 50
              end>
            SimplePanel = False
            SizeGrip = False
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 643
    Height = 58
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Height = 52
      end
      inherited sbtnAlterar: TToolbarButton97
        Height = 52
      end
      inherited sbtnProcurar: TToolbarButton97
        Height = 52
        Caption = 'Procurar'
      end
      inherited sbtnApagar: TToolbarButton97
        Height = 52
      end
      object BtProcOperacao: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 52
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Procurar &Operação'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        WordWrap = True
        OnClick = BtProcOperacaoClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 448
    Width = 643
    inherited tb97Fundo: TToolbar97
      Left = 188
      DockPos = 188
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 20
      DockPos = 20
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      
        'SELECT '#9'INV.IDINVESTIMENTO, INV.IDTIPOINVEST, INV.IDEMISSOR, INV' +
        '.IDMOEDACONTAB,'
      '         INV.DESCINVESTIMENTO, INV.FLGATIVO, INV.OBSINVESTIMENTO'
      ''
      
        'FROM CM.INVESTIMENTO INV, CM.TITRENFIXA TIT, CM.TIPOTITRENFIXA T' +
        'IP'
      ''
      'WHERE INV.IDTIPOINVEST   = 1 AND'
      #9'   TIP.IDCLASSETIT    = 2 AND'
      #9'   INV.IDINVESTIMENTO = TIT.IDTITRENFIXA AND'
      #9'   TIT.CODTIPRENFIXA  = TIP.CODTIPRENFIXA '
      ''
      'ORDER BY DESCINVESTIMENTO'
      ''
      '')
    Left = 130
    Top = 276
    object qryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'INVESTIMENTO.IDINVESTIMENTO'
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'INVESTIMENTO.IDTIPOINVEST'
    end
    object qryIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'INVESTIMENTO.IDEMISSOR'
    end
    object qryIDMOEDACONTAB: TFloatField
      FieldName = 'IDMOEDACONTAB'
      Origin = 'INVESTIMENTO.IDMOEDACONTAB'
    end
    object qryDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryFLGATIVO: TStringField
      FieldName = 'FLGATIVO'
      Origin = 'INVESTIMENTO.FLGATIVO'
      Size = 1
    end
    object qryOBSINVESTIMENTO: TStringField
      FieldName = 'OBSINVESTIMENTO'
      Origin = 'INVESTIMENTO.OBSINVESTIMENTO'
      Size = 200
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.INVESTIMENTO'
      'set'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  IDMOEDACONTAB = :IDMOEDACONTAB,'
      '  DESCINVESTIMENTO = :DESCINVESTIMENTO,'
      '  FLGATIVO = :FLGATIVO,'
      '  OBSINVESTIMENTO = :OBSINVESTIMENTO'
      'where'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    InsertSQL.Strings = (
      'insert into CM.INVESTIMENTO'
      
        '  (IDINVESTIMENTO, IDTIPOINVEST, IDEMISSOR, IDMOEDACONTAB, DESCI' +
        'NVESTIMENTO, '
      '   FLGATIVO, OBSINVESTIMENTO)'
      'values'
      
        '  (:IDINVESTIMENTO, :IDTIPOINVEST, :IDEMISSOR, :IDMOEDACONTAB, :' +
        'DESCINVESTIMENTO, '
      '   :FLGATIVO, :OBSINVESTIMENTO)')
    DeleteSQL.Strings = (
      'delete from CM.INVESTIMENTO'
      'where'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    Left = 100
    Top = 276
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'INVESTIMENTO.DESCINVESTIMENTO'
      'EMISSOR.SIGLAEMISSOR')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Investimento '
      'Emissor')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'INVESTIMENTO'
      'EMISSOR'
      'TITRENFIXA'
      'TIPOTITRENFIXA')
    CamposChave.Strings = (
      'INVESTIMENTO.IDINVESTIMENTO')
    Filtro.Strings = (
      'INVESTIMENTO.IDTIPOINVEST = 1'
      'INVESTIMENTO.IDEMISSOR=EMISSOR.IDEMISSOR'
      'INVESTIMENTO.IDINVESTIMENTO = TITRENFIXA.IDTITRENFIXA'
      'TITRENFIXA.CODTIPRENFIXA = TIPOTITRENFIXA.CODTIPRENFIXA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '40'
      '15')
    Left = 320
    Top = 16
  end
  inherited ds: TwwDataSource
    Left = 161
    Top = 276
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 358
    Top = 82
  end
  object QryAux: TwwQuery
    AutoCalcFields = False
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 286
    Top = 64
  end
  object ImageList1: TImageList
    Left = 352
    Top = 16
    Bitmap = {
      494C010104000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001001800000000000018
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
      00000000000000000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF
      000000000000000000000000000000000000000000000000000000FF0000FF00
      00FF0000FF0000FF0000FF0000FF000000000000000000000000000000000000
      0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      000000000080000000000000000000000000000000000000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF000000000080000000000000000000000000
      0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000080000080000080000080000080000080000080
      0000000000800000800000000000000000000000000000008000008000008000
      0080000080000080000080000080000000000080000080000000000000000000
      0000000000000000000000FFFFFF000000000000000000000000000000000000
      000000FFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800000800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000080000000000000
      0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000808080000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      000000FFFFFF000000000080000080000000000000000000808080000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF00000080000080000000
      0000000000000000000000FFFFFF000000000000000000000000000000000000
      000000FFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      000000FFFFFF000000000000000080000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF00000080000000
      0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFF808080000000000000000000
      000000FFFFFF000000FFFFFF000000000000000000000000000000000000FFFF
      FFFFFFFF808080000000000000000000000000C0C0C0C0C0C0FFFFFF00000000
      0000000000000000000000FFFFFF000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF000000FFFFFF0000000000000000000000000000000000000000
      00000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF00000000
      0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FFFFFFFFFFFF808080000000
      000000000000000000FFFFFF0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FFFFFF00000000
      0000000000000000000000FFFFFF000000000000000000000000000000000000
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000
      00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF00000000
      0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      8080800000000000000000000000000000000000000000000000000000000000
      00000000FFFFFF000000000000000000FFFFFFFFFFFF00000000000000000000
      0000000000000000000000FFFFFF000000000000000000000000FFFFFFFFFFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FFFFFFFFFFFF80808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFE01FE01FC007
      FFFFC00FC00FC007FFFF80078007C007FFFF00030003C007FFFF00010001C007
      FFFF80008000C007FFFFC000C000C007FFFFE000E000C007FFFFF000F000C007
      FFFFF801F801C007FFFFFC01F801C007FFFFFE01F801C007FFFFFF1FF807C01F
      FFFFFFFFF807C01FFFFFFFFFFC7FFFFF00000000000000000000000000000000
      000000000000}
  end
  object DsAux: TwwDataSource
    DataSet = QryAux
    Left = 247
    Top = 64
  end
  object QryTipoInvest: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'select       TI.IdTipoInvest,'
      '                TI.DescTipoInvest'
      ''
      'From        CM.TipoInvest TI'
      '')
    ValidateWithMask = True
    Left = 201
    Top = 64
  end
  object QryTipoOper: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT '#9'T.IDTIPOOPERACAO, T.IDTIPOINVEST, T.IDMERCADO, '
      '                T.DESCTIPOOPERACAO,  M.DESCMERCADO'
      ''
      'FROM   '#9'CM.TIPOOPERACAO T,CM.MERCADO M'
      ''
      'WHERE  '#9'T.IDMERCADO = M.IDMERCADO(+) AND '
      #9'T.IDTIPOINVEST = :IDTIPOINVEST'
      ''
      'ORDER BY T.DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 419
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
  end
  object UpdSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.TITRENFIXA'
      'set'
      '  IDTITRENFIXA = :IDTITRENFIXA,'
      '  CODTIPRENFIXA = :CODTIPRENFIXA,'
      '  SERIETITRENFIX = :SERIETITRENFIX,'
      '  IDALTTITRENFIX = :IDALTTITRENFIX,'
      '  DATAEMTITRENFIX = :DATAEMTITRENFIX,'
      '  DATAVENCTITRENFIX = :DATAVENCTITRENFIX,'
      '  INDEXRENFIX = :INDEXRENFIX,'
      '  DATAINIJURRENFIX = :DATAINIJURRENFIX,'
      '  DATABASEINDRENFIX = :DATABASEINDRENFIX,'
      '  JUROSRENFIX = :JUROSRENFIX,'
      '  CODTIPTXJUROS = :CODTIPTXJUROS,'
      '  PREMIORENFIX = :PREMIORENFIX,'
      '  CODTIPTXPREMIO = :CODTIPTXPREMIO,'
      '  IDINDSWAPFIX = :IDINDSWAPFIX,'
      '  VLRRESGATE = :VLRRESGATE,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  PERCINDEX = :PERCINDEX,'
      '  JUROSDIA = :JUROSDIA,'
      '  CARENCIA = :CARENCIA,'
      '  PERIODICIDADE = :PERIODICIDADE,'
      '  FLGSAQUEPARCIAL = :FLGSAQUEPARCIAL'
      'where'
      '  IDTITRENFIXA = :OLD_IDTITRENFIXA')
    InsertSQL.Strings = (
      'insert into CM.TITRENFIXA'
      '  (IDTITRENFIXA, CODTIPRENFIXA, SERIETITRENFIX, IDALTTITRENFIX, '
      'DATAEMTITRENFIX, '
      '   DATAVENCTITRENFIX, INDEXRENFIX, DATAINIJURRENFIX, '
      'DATABASEINDRENFIX, '
      '   JUROSRENFIX, CODTIPTXJUROS, PREMIORENFIX, CODTIPTXPREMIO, '
      'IDINDSWAPFIX, '
      '   VLRRESGATE, IDCUSTODIANTE, PERCINDEX, JUROSDIA, CARENCIA, '
      'PERIODICIDADE, '
      '   FLGSAQUEPARCIAL)'
      'values'
      
        '  (:IDTITRENFIXA, :CODTIPRENFIXA, :SERIETITRENFIX, :IDALTTITRENF' +
        'IX, '
      ':DATAEMTITRENFIX, '
      '   :DATAVENCTITRENFIX, :INDEXRENFIX, :DATAINIJURRENFIX, '
      ':DATABASEINDRENFIX, '
      
        '   :JUROSRENFIX, :CODTIPTXJUROS, :PREMIORENFIX, :CODTIPTXPREMIO,' +
        ' '
      ':IDINDSWAPFIX, '
      
        '   :VLRRESGATE, :IDCUSTODIANTE, :PERCINDEX, :JUROSDIA, :CARENCIA' +
        ', '
      ':PERIODICIDADE, '
      '   :FLGSAQUEPARCIAL)')
    DeleteSQL.Strings = (
      'delete from CM.TITRENFIXA'
      'where'
      '  IDTITRENFIXA = :OLD_IDTITRENFIXA')
    Left = 193
    Top = 276
  end
  object QrySubTipo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT'#9'IDTITRENFIXA, CODTIPRENFIXA, SERIETITRENFIX, IDALTTITRENF' +
        'IX, '
      
        '              '#9'DATAEMTITRENFIX, DATAVENCTITRENFIX, INDEXRENFIX, ' +
        'DATAINIJURRENFIX, '
      
        '               '#9'DATABASEINDRENFIX, JUROSRENFIX, CODTIPTXJUROS, P' +
        'REMIORENFIX, '
      
        '              '#9'CODTIPTXPREMIO, IDINDSWAPFIX, VLRRESGATE, IDCUSTO' +
        'DIANTE, PERCINDEX,'
      
        '                JUROSDIA, CARENCIA, PERIODICIDADE, FLGSAQUEPARCI' +
        'AL'
      ''
      'FROM CM.TITRENFIXA'
      ''
      'WHERE 1 = 2 ')
    UpdateObject = UpdSubTipo
    ValidateWithMask = True
    Left = 224
    Top = 276
    object QrySubTipoIDTITRENFIXA: TFloatField
      FieldName = 'IDTITRENFIXA'
      Origin = 'TITRENFIXA.IDTITRENFIXA'
    end
    object QrySubTipoCODTIPRENFIXA: TStringField
      FieldName = 'CODTIPRENFIXA'
      Origin = 'TITRENFIXA.CODTIPRENFIXA'
      Size = 5
    end
    object QrySubTipoSERIETITRENFIX: TStringField
      FieldName = 'SERIETITRENFIX'
      Origin = 'TITRENFIXA.SERIETITRENFIX'
      Size = 15
    end
    object QrySubTipoIDALTTITRENFIX: TStringField
      FieldName = 'IDALTTITRENFIX'
      Origin = 'TITRENFIXA.IDALTTITRENFIX'
      Size = 30
    end
    object QrySubTipoDATAEMTITRENFIX: TDateTimeField
      FieldName = 'DATAEMTITRENFIX'
      Origin = 'TITRENFIXA.DATAEMTITRENFIX'
    end
    object QrySubTipoDATAVENCTITRENFIX: TDateTimeField
      FieldName = 'DATAVENCTITRENFIX'
      Origin = 'TITRENFIXA.DATAVENCTITRENFIX'
    end
    object QrySubTipoINDEXRENFIX: TFloatField
      FieldName = 'INDEXRENFIX'
      Origin = 'TITRENFIXA.INDEXRENFIX'
    end
    object QrySubTipoDATAINIJURRENFIX: TDateTimeField
      FieldName = 'DATAINIJURRENFIX'
      Origin = 'TITRENFIXA.DATAINIJURRENFIX'
    end
    object QrySubTipoDATABASEINDRENFIX: TDateTimeField
      FieldName = 'DATABASEINDRENFIX'
      Origin = 'TITRENFIXA.DATABASEINDRENFIX'
    end
    object QrySubTipoJUROSRENFIX: TFloatField
      FieldName = 'JUROSRENFIX'
      Origin = 'TITRENFIXA.JUROSRENFIX'
      DisplayFormat = '####,###,###,##0.00######'
      EditFormat = '############0.00######'
    end
    object QrySubTipoCODTIPTXJUROS: TFloatField
      FieldName = 'CODTIPTXJUROS'
      Origin = 'TITRENFIXA.CODTIPTXJUROS'
    end
    object QrySubTipoPREMIORENFIX: TFloatField
      FieldName = 'PREMIORENFIX'
      Origin = 'TITRENFIXA.PREMIORENFIX'
      DisplayFormat = '###,###,###,##0.00######'
      EditFormat = '############0.00######'
    end
    object QrySubTipoCODTIPTXPREMIO: TFloatField
      FieldName = 'CODTIPTXPREMIO'
      Origin = 'TITRENFIXA.CODTIPTXPREMIO'
    end
    object QrySubTipoIDINDSWAPFIX: TFloatField
      FieldName = 'IDINDSWAPFIX'
      Origin = 'TITRENFIXA.IDINDSWAPFIX'
    end
    object QrySubTipoVLRRESGATE: TFloatField
      FieldName = 'VLRRESGATE'
      DisplayFormat = '###,###,###,###,##0.00'
      EditFormat = '###############0.00'
    end
    object QrySubTipoIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'TITRENFIXA.IDCUSTODIANTE'
    end
    object QrySubTipoPERCINDEX: TFloatField
      FieldName = 'PERCINDEX'
      Origin = 'TITRENFIXA.PERCINDEX'
      DisplayFormat = '###,###,###,##0.00######'
      EditFormat = '############0.00######'
    end
    object QrySubTipoJUROSDIA: TFloatField
      FieldName = 'JUROSDIA'
      Origin = 'TITRENFIXA.JUROSDIA'
    end
    object QrySubTipoCARENCIA: TFloatField
      FieldName = 'CARENCIA'
      Origin = 'TITRENFIXA.CARENCIA'
    end
    object QrySubTipoPERIODICIDADE: TFloatField
      FieldName = 'PERIODICIDADE'
      Origin = 'TITRENFIXA.PERIODICIDADE'
    end
    object QrySubTipoFLGSAQUEPARCIAL: TStringField
      FieldName = 'FLGSAQUEPARCIAL'
      Origin = 'TITRENFIXA.FLGSAQUEPARCIAL'
      Size = 1
    end
  end
  object DsSubTipo: TwwDataSource
    AutoEdit = False
    DataSet = QrySubTipo
    Left = 255
    Top = 276
  end
  object QryTipTit: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '    CODTIPRENFIXA, DESCTIPRENFIXA, FLGSERTITFIX,  FLGINDSWAPFIX,'
      '    FLGVLRAGIOOPER, FLGIDLOTEFIX, FLGDTCOMPRALOTE,FLGQTDTITLOTE,'
      
        '    FLGSLDTITLOTE, FLGVLRCOMPLOTE, FLGIDALTTITFIX, FLGDTEMITITFI' +
        'X, '
      
        '    FLGDTVENCTITFIX, FLGINDREAJFIX, FLGDTINIJURFIX, FLGDTBASEIND' +
        'FIX, '
      
        '    FLGJURFIX, FLGCODTPTXJUR, FLGPREMIOFIX, FLGCODTPTXPRE, IDMOE' +
        'DAREG,'
      
        '    CODTIPTXJUROS, IDCLASSETIT, IDCUSTODIANTE, FLGPERCINDEX, FLG' +
        'INSTFIN,'
      '    FLGPU, FLLGPRORATA, FLGINTERPOLA'
      ''
      'FROM CM.TIPOTITRENFIXA'
      ''
      'WHERE IDCLASSETIT = :IDCLASSETIT'
      ''
      'ORDER BY DESCTIPRENFIXA')
    ValidateWithMask = True
    Left = 457
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptUnknown
      end>
    object QryTipTitDESCTIPRENFIXA: TStringField
      DisplayLabel = 'Tipo de Titulo'
      DisplayWidth = 40
      FieldName = 'DESCTIPRENFIXA'
      Origin = 'TIPOTITRENFIXA.DESCTIPRENFIXA'
      Size = 60
    end
    object QryTipTitCODTIPRENFIXA: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODTIPRENFIXA'
      Origin = 'TIPOTITRENFIXA.CODTIPRENFIXA'
      Size = 5
    end
    object QryTipTitFLGSERTITFIX: TStringField
      FieldName = 'FLGSERTITFIX'
      Origin = 'TIPOTITRENFIXA.FLGSERTITFIX'
      Visible = False
      Size = 1
    end
    object QryTipTitFLGINDSWAPFIX: TStringField
      FieldName = 'FLGINDSWAPFIX'
      Origin = 'TIPOTITRENFIXA.FLGINDSWAPFIX'
      Visible = False
      Size = 1
    end
    object QryTipTitFLGVLRAGIOOPER: TStringField
      FieldName = 'FLGVLRAGIOOPER'
      Origin = 'TIPOTITRENFIXA.FLGVLRAGIOOPER'
      Visible = False
      Size = 1
    end
    object QryTipTitFLGIDLOTEFIX: TStringField
      FieldName = 'FLGIDLOTEFIX'
      Origin = 'TIPOTITRENFIXA.FLGIDLOTEFIX'
      Visible = False
      Size = 1
    end
    object QryTipTitFLGDTCOMPRALOTE: TStringField
      FieldName = 'FLGDTCOMPRALOTE'
      Origin = 'TIPOTITRENFIXA.FLGDTCOMPRALOTE'
      Visible = False
      Size = 1
    end
    object QryTipTitFLGQTDTITLOTE: TStringField
      FieldName = 'FLGQTDTITLOTE'
      Origin = 'TIPOTITRENFIXA.FLGQTDTITLOTE'
      Visible = False
      Size = 1
    end
    object QryTipTitFLGSLDTITLOTE: TStringField
      FieldName = 'FLGSLDTITLOTE'
      Origin = 'TIPOTITRENFIXA.FLGSLDTITLOTE'
      Visible = False
      Size = 1
    end
    object QryTipTitFLGVLRCOMPLOTE: TStringField
      FieldName = 'FLGVLRCOMPLOTE'
      Origin = 'TIPOTITRENFIXA.FLGVLRCOMPLOTE'
      Visible = False
      Size = 1
    end
    object QryTipTitFLGIDALTTITFIX: TStringField
      FieldName = 'FLGIDALTTITFIX'
      Origin = 'TIPOTITRENFIXA.FLGIDALTTITFIX'
      Visible = False
      Size = 1
    end
    object QryTipTitFLGDTEMITITFIX: TStringField
      FieldName = 'FLGDTEMITITFIX'
      Origin = 'TIPOTITRENFIXA.FLGDTEMITITFIX'
      Visible = False
      Size = 1
    end
    object QryTipTitFLGDTVENCTITFIX: TStringField
      FieldName = 'FLGDTVENCTITFIX'
      Origin = 'TIPOTITRENFIXA.FLGDTVENCTITFIX'
      Visible = False
      Size = 1
    end
    object QryTipTitFLGINDREAJFIX: TStringField
      FieldName = 'FLGINDREAJFIX'
      Origin = 'TIPOTITRENFIXA.FLGINDREAJFIX'
      Visible = False
      Size = 1
    end
    object QryTipTitFLGDTINIJURFIX: TStringField
      FieldName = 'FLGDTINIJURFIX'
      Origin = 'TIPOTITRENFIXA.FLGDTINIJURFIX'
      Visible = False
      Size = 1
    end
    object QryTipTitFLGDTBASEINDFIX: TStringField
      FieldName = 'FLGDTBASEINDFIX'
      Origin = 'TIPOTITRENFIXA.FLGDTBASEINDFIX'
      Visible = False
      Size = 1
    end
    object QryTipTitFLGJURFIX: TStringField
      FieldName = 'FLGJURFIX'
      Origin = 'TIPOTITRENFIXA.FLGJURFIX'
      Visible = False
      Size = 1
    end
    object QryTipTitFLGCODTPTXJUR: TStringField
      FieldName = 'FLGCODTPTXJUR'
      Origin = 'TIPOTITRENFIXA.FLGCODTPTXJUR'
      Visible = False
      Size = 1
    end
    object QryTipTitFLGPREMIOFIX: TStringField
      FieldName = 'FLGPREMIOFIX'
      Origin = 'TIPOTITRENFIXA.FLGPREMIOFIX'
      Visible = False
      Size = 1
    end
    object QryTipTitFLGCODTPTXPRE: TStringField
      FieldName = 'FLGCODTPTXPRE'
      Origin = 'TIPOTITRENFIXA.FLGCODTPTXPRE'
      Visible = False
      Size = 1
    end
    object QryTipTitIDMOEDAREG: TFloatField
      FieldName = 'IDMOEDAREG'
      Origin = 'TIPOTITRENFIXA.IDMOEDAREG'
      Visible = False
    end
    object QryTipTitCODTIPTXJUROS: TFloatField
      FieldName = 'CODTIPTXJUROS'
      Origin = '"CM.TIPOTITRENFIXA".CODTIPTXJUROS'
      Visible = False
    end
    object QryTipTitIDCLASSETIT: TFloatField
      FieldName = 'IDCLASSETIT'
      Visible = False
    end
    object QryTipTitIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object QryTipTitFLGPERCINDEX: TStringField
      FieldName = 'FLGPERCINDEX'
      Origin = 'TIPOTITRENFIXA.FLGPERCINDEX'
      Visible = False
      Size = 1
    end
    object QryTipTitFLGINSTFIN: TStringField
      FieldName = 'FLGINSTFIN'
      Origin = 'TIPOTITRENFIXA.FLGINSTFIN'
      Visible = False
      Size = 1
    end
    object QryTipTitFLGPU: TFloatField
      FieldName = 'FLGPU'
      Origin = 'TIPOTITRENFIXA.FLGPU'
      Visible = False
    end
    object QryTipTitFLLGPRORATA: TStringField
      FieldName = 'FLLGPRORATA'
      Origin = 'TIPOTITRENFIXA.FLLGPRORATA'
      Visible = False
      Size = 1
    end
    object QryTipTitFLGINTERPOLA: TStringField
      FieldName = 'FLGINTERPOLA'
      Origin = 'TIPOTITRENFIXA.FLGINTERPOLA'
      Visible = False
      Size = 1
    end
  end
  object QryEmissor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEMISSOR, SIGLAEMISSOR'
      ''
      'FROM EMISSOR '
      ''
      'WHERE FLGINSTFIN = '#39'S'#39
      ''
      'ORDER BY SIGLAEMISSOR')
    ValidateWithMask = True
    Left = 389
    Top = 16
    object QryEmissorIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Visible = False
    end
    object QryEmissorSIGLAEMISSOR: TStringField
      FieldName = 'SIGLAEMISSOR'
      Size = 15
    end
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'INVESTIMENTO.DESCINVESTIMENTO'
      'CONTRATOINVESTIM.IDLOTE'
      'CONTRATOINVESTIM.SERIE'
      'CONTRATOINVESTIM.DATACOMPRALOTE'
      'CONTRATOINVESTIM.DATAVENCIM'
      'TIPOCONTRINVEST.DESCTIPOCTINVEST'
      'EMISSOR.SIGLAEMISSOR')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'D'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Investimento '
      'Lote'
      '# de Série'
      'Compra'
      'Vencimento'
      'Tipo de Contrato'
      'Emissor')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOINVESTIM'
      'INVESTIMENTO'
      'TIPOCONTRINVEST'
      'EMISSOR'
      'TITRENFIXA'
      'TIPOTITRENFIXA')
    CamposChave.Strings = (
      'CONTRATOINVESTIM.IDCONTRATOINVEST'
      'CONTRATOINVESTIM.IDTIPOCONTRINVEST')
    Filtro.Strings = (
      'CONTRATOINVESTIM.IDINVESTIMENTO=INVESTIMENTO.IDINVESTIMENTO'
      'INVESTIMENTO.IDTIPOINVEST = 1'
      
        'CONTRATOINVESTIM.IDTIPOCONTRINVEST = TIPOCONTRINVEST.IDTIPOCONTR' +
        'INVEST'
      'INVESTIMENTO.IDEMISSOR=EMISSOR.IDEMISSOR'
      'INVESTIMENTO.IDINVESTIMENTO = TITRENFIXA.IDTITRENFIXA'
      'TITRENFIXA.CODTIPRENFIXA = TIPOTITRENFIXA.CODTIPRENFIXA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '10'
      '10'
      '10'
      '10'
      '40'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 489
    Top = 66
  end
  object DsContrato: TwwDataSource
    AutoEdit = False
    DataSet = QryContrato
    Left = 256
    Top = 243
  end
  object QryContrato: TwwQuery
    CachedUpdates = True
    AfterOpen = QryContratoAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  CON.IDCONTRATOINVEST, CON.IDEMISSOR, CON.IDCORRETVALORES' +
        ', CON.IDBOLSAVALORES, CON.IDTIPOCONTRINVEST,'
      
        '     '#9'CON.IDINVESTIMENTO, CON.SERIE, CON.IDLOTE, CON.DATACOMPRAL' +
        'OTE, CON.DATAVENCIM, CON.VLRCOMPRATITLOTE,'
      
        #9'CON.QTDETITLOTE, CON.SALDOTITLOTE, CON.VLRRESGATE, CON.PRECOVEN' +
        'CIM, CON.IDCARTLASTRO,'
      
        #9'CON.IDCARTAVISTA, CON.PRZVENC, CON.QTDECOMPRATITLOTE, CON.DATAC' +
        'ARENCIA, CON.ANIVERSARIO,'
      
        '                0 AS ULTSALDOQTD,  0 AS ULTSALDOVALOR, CON.IDCON' +
        'TRATOMESTRE'
      ''
      ''
      'FROM CM.CONTRATOINVESTIM CON '
      ''
      ''
      ''
      ''
      '')
    UpdateObject = UpdContrato
    ValidateWithMask = True
    Left = 329
    Top = 243
    object QryContratoIDCONTRATOINVEST: TFloatField
      FieldName = 'IDCONTRATOINVEST'
    end
    object QryContratoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object QryContratoIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object QryContratoIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
    end
    object QryContratoIDTIPOCONTRINVEST: TFloatField
      FieldName = 'IDTIPOCONTRINVEST'
    end
    object QryContratoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryContratoSERIE: TStringField
      FieldName = 'SERIE'
      Size = 60
    end
    object QryContratoIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QryContratoDATACOMPRALOTE: TDateTimeField
      FieldName = 'DATACOMPRALOTE'
    end
    object QryContratoDATAVENCIM: TDateTimeField
      FieldName = 'DATAVENCIM'
    end
    object QryContratoVLRCOMPRATITLOTE: TFloatField
      FieldName = 'VLRCOMPRATITLOTE'
    end
    object QryContratoQTDETITLOTE: TFloatField
      FieldName = 'QTDETITLOTE'
    end
    object QryContratoSALDOTITLOTE: TFloatField
      FieldName = 'SALDOTITLOTE'
    end
    object QryContratoVLRRESGATE: TFloatField
      FieldName = 'VLRRESGATE'
    end
    object QryContratoPRECOVENCIM: TFloatField
      FieldName = 'PRECOVENCIM'
    end
    object QryContratoIDCARTLASTRO: TFloatField
      FieldName = 'IDCARTLASTRO'
    end
    object QryContratoIDCARTAVISTA: TFloatField
      FieldName = 'IDCARTAVISTA'
    end
    object QryContratoPRZVENC: TFloatField
      FieldName = 'PRZVENC'
    end
    object QryContratoQTDECOMPRATITLOTE: TFloatField
      FieldName = 'QTDECOMPRATITLOTE'
    end
    object QryContratoDATACARENCIA: TDateTimeField
      FieldName = 'DATACARENCIA'
    end
    object QryContratoANIVERSARIO: TFloatField
      FieldName = 'ANIVERSARIO'
    end
    object QryContratoULTSALDOQTD: TFloatField
      FieldName = 'ULTSALDOQTD'
    end
    object QryContratoULTSALDOVALOR: TFloatField
      FieldName = 'ULTSALDOVALOR'
    end
    object QryContratoIDCONTRATOMESTRE: TFloatField
      FieldName = 'IDCONTRATOMESTRE'
    end
  end
  object UpdContrato: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.CONTRATOINVESTIM'
      'set'
      '  IDCONTRATOINVEST = :IDCONTRATOINVEST,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  IDCORRETVALORES = :IDCORRETVALORES,'
      '  IDBOLSAVALORES = :IDBOLSAVALORES,'
      '  IDTIPOCONTRINVEST = :IDTIPOCONTRINVEST,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  SERIE = :SERIE,'
      '  IDLOTE = :IDLOTE,'
      '  DATACOMPRALOTE = :DATACOMPRALOTE,'
      '  DATAVENCIM = :DATAVENCIM,'
      '  VLRCOMPRATITLOTE = :VLRCOMPRATITLOTE,'
      '  QTDETITLOTE = :QTDETITLOTE,'
      '  SALDOTITLOTE = :SALDOTITLOTE,'
      '  VLRRESGATE = :VLRRESGATE,'
      '  PRECOVENCIM = :PRECOVENCIM,'
      '  IDCARTLASTRO = :IDCARTLASTRO,'
      '  IDCARTAVISTA = :IDCARTAVISTA,'
      '  PRZVENC = :PRZVENC,'
      '  QTDECOMPRATITLOTE = :QTDECOMPRATITLOTE,'
      '  DATACARENCIA = :DATACARENCIA,'
      '  ANIVERSARIO = :ANIVERSARIO'
      'where'
      '  IDCONTRATOINVEST = :OLD_IDCONTRATOINVEST')
    InsertSQL.Strings = (
      'insert into CM.CONTRATOINVESTIM'
      
        '  (IDCONTRATOINVEST, IDEMISSOR, IDCORRETVALORES, IDBOLSAVALORES,' +
        ' IDTIPOCONTRINVEST, '
      
        '   IDINVESTIMENTO, SERIE, IDLOTE, DATACOMPRALOTE, DATAVENCIM, VL' +
        'RCOMPRATITLOTE, '
      
        '   QTDETITLOTE, SALDOTITLOTE, VLRRESGATE, PRECOVENCIM, IDCARTLAS' +
        'TRO, IDCARTAVISTA, '
      '   PRZVENC, QTDECOMPRATITLOTE, DATACARENCIA, ANIVERSARIO)'
      'values'
      
        '  (:IDCONTRATOINVEST, :IDEMISSOR, :IDCORRETVALORES, :IDBOLSAVALO' +
        'RES, :IDTIPOCONTRINVEST, '
      
        '   :IDINVESTIMENTO, :SERIE, :IDLOTE, :DATACOMPRALOTE, :DATAVENCI' +
        'M, :VLRCOMPRATITLOTE, '
      
        '   :QTDETITLOTE, :SALDOTITLOTE, :VLRRESGATE, :PRECOVENCIM, :IDCA' +
        'RTLASTRO, '
      
        '   :IDCARTAVISTA, :PRZVENC, :QTDECOMPRATITLOTE, :DATACARENCIA, :' +
        'ANIVERSARIO)')
    DeleteSQL.Strings = (
      'delete from CM.CONTRATOINVESTIM'
      'where'
      '  IDCONTRATOINVEST = :OLD_IDCONTRATOINVEST')
    Left = 193
    Top = 243
  end
  object QryTipoContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM CM.TIPOCONTRINVEST')
    ValidateWithMask = True
    Left = 498
    Top = 16
    object QryTipoContratoDESCTIPOCTINVEST: TStringField
      DisplayLabel = 'Tipo de Contrato'
      DisplayWidth = 40
      FieldName = 'DESCTIPOCTINVEST'
      Origin = 'TIPOCONTRINVEST.IDDESPCARTINVEST'
      Size = 60
    end
    object QryTipoContratoIDTIPOCONTRINVEST: TFloatField
      FieldName = 'IDTIPOCONTRINVEST'
      Origin = 'TIPOCONTRINVEST.IDHISTCARTINV'
      Visible = False
    end
  end
  object QryCustodiante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCUSTODIANTE, SGLCUSTODIANTE'
      ''
      'FROM CUSTODIANTE'
      ''
      'ORDER BY SGLCUSTODIANTE')
    ValidateWithMask = True
    Left = 530
    Top = 16
    object QryCustodianteSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 40
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
    object QryCustodianteIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Origin = 'CUSTODIANTE.IDCUSTODIANTE'
      Visible = False
    end
  end
  object MSProcOperacao: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'INVESTIMENTO.DESCINVESTIMENTO'
      'OPERACAOINVEST.DATAOPERACAO'
      'OPERACAOINVEST.NUMDOCUMENTO'
      'INVESTIMENTO.FLGATIVO')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Titulo de Renda Fixa'
      'Data da Operação '
      'Número do Documento '
      'Ativa')
    Tabelas.Strings = (
      'OPERACAOINVEST'
      'INVESTIMENTO')
    CamposChave.Strings = (
      'OPERACAOINVEST.IDOPERACAOINVEST')
    Filtro.Strings = (
      'OPERACAOINVEST.IDTIPOINVEST = 1 '
      'OPERACAOINVEST.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '35'
      '8'
      '19'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 83
    Top = 51
  end
end
