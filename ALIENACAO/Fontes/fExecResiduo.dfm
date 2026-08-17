inherited frmExecResiduo: TfrmExecResiduo
  Left = 124
  Top = 152
  HelpContext = 1350035
  Caption = 'Cobrança de Resíduo'
  ClientHeight = 370
  ClientWidth = 660
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 660
    Height = 331
    inherited PagControle: TPageControl
      Width = 658
      Height = 329
      ActivePage = TabSheet1
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 650
          Caption = 'Cobrança de Resíduo Não Incorporado [ seleção ]'
        end
        object Label6: TLabel
          Left = 73
          Top = 79
          Width = 61
          Height = 13
          Caption = 'Comprador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 73
          Top = 125
          Width = 139
          Height = 13
          Caption = 'Condição de Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inline molProposta1: TmolProposta
          Left = 64
          Top = 35
          inherited Label1: TLabel
            Width = 85
            Caption = 'Nº do Contrato'
          end
          inherited Label2: TLabel
            Width = 103
            Caption = 'Nome do Contrato'
          end
          inherited btnBuscaProp: TBitBtn
            OnClick = molProposta1btnBuscaPropClick
          end
        end
        object GroupBox2: TGroupBox
          Left = 71
          Top = 177
          Width = 297
          Height = 70
          Caption = 'Vencimento'
          TabOrder = 1
          object Label4: TLabel
            Left = 18
            Top = 18
            Width = 34
            Height = 13
            Caption = 'Início'
          end
          object Label5: TLabel
            Left = 154
            Top = 18
            Width = 46
            Height = 13
            Caption = 'Término'
          end
          object edDataI: TCMDateTimePicker
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
          object edDataF: TCMDateTimePicker
            Left = 154
            Top = 34
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
            TabOrder = 1
          end
        end
        object edtComprador: TEdit
          Left = 73
          Top = 94
          Width = 449
          Height = 21
          Enabled = False
          TabOrder = 2
        end
        object dblcCondPag: TCMDBLookupCombo
          Left = 73
          Top = 141
          Width = 448
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DSCCOND'#9'34'#9'Vencimento    Valor Finaciado   Nr. Parcelas'#9'F')
          LookupTable = qryCondPag
          LookupField = 'DSCCOND'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object rgTipo: TRadioGroup
          Left = 391
          Top = 176
          Width = 178
          Height = 137
          Caption = 'Tipo de Processo '
          ItemIndex = 0
          Items.Strings = (
            'Gerar Cobrança'
            'Gerar Abono'
            'Estornar Abono')
          TabOrder = 4
        end
        object gbCorrecao: TGroupBox
          Left = 71
          Top = 257
          Width = 298
          Height = 56
          Caption = ' Correção de resíduo '
          TabOrder = 5
          object edDtLimite: TCMDateTimePicker
            Left = 154
            Top = 22
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
          end
          object chkCorrecao: TCheckBox
            Left = 12
            Top = 24
            Width = 133
            Height = 17
            Caption = 'Efetua correção até'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 650
          Caption = 'Cobrança de Resíduo Não Incorporado [ Parcelas ]'
        end
        object Panel1: TPanel
          Left = 0
          Top = 24
          Width = 650
          Height = 295
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object pnlResiduo: TPanel
            Left = 0
            Top = 0
            Width = 650
            Height = 27
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Parcelas com Resíduo'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object grdParc: TwwDBGrid
            Left = 0
            Top = 27
            Width = 650
            Height = 227
            Selected.Strings = (
              'CHKINTEGRA'#9'2'#9'   '#9'F'
              'NUMPARCELA'#9'8'#9'Parcela'#9'F'
              'DATAVENCIMENTO'#9'12'#9'Vencimento'#9'F'
              'VLRPRESTACAO'#9'12'#9'Prestação'#9'F'
              'VLRPRESTATUALIZADA'#9'17'#9'Prest. Atualizada'#9'F'
              'VLRRESIDUO'#9'12'#9'Resíduo'#9'F'
              'VLRRESIDUOATUALI'#9'18'#9'Resíduo Atualizado'#9'F'
              'TOT_ALTERADOR'#9'10'#9'Adiant. Resíduo'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            BorderStyle = bsNone
            DataSource = dsParc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = grdParcCalcCellColors
            OnDblClick = grdParcDblClick
            IndicatorColor = icBlack
            OnTopRowChanged = grdParcTopRowChanged
          end
          object Panel2: TPanel
            Left = 0
            Top = 254
            Width = 650
            Height = 41
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
            object sbMarcaTodas: TSpeedButton
              Left = 1
              Top = 5
              Width = 147
              Height = 36
              Hint = 'Marca todas as parcelas para conciliar'
              Caption = 'Marca todos'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                555555555555555555555555555555555555555555FF55555555555559055555
                55555555577FF5555555555599905555555555557777F5555555555599905555
                555555557777FF5555555559999905555555555777777F555555559999990555
                5555557777777FF5555557990599905555555777757777F55555790555599055
                55557775555777FF5555555555599905555555555557777F5555555555559905
                555555555555777FF5555555555559905555555555555777FF55555555555579
                05555555555555777FF5555555555557905555555555555777FF555555555555
                5990555555555555577755555555555555555555555555555555}
              NumGlyphs = 2
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = sbMarcaTodasClick
            end
            object sbDesmarcaTodas: TSpeedButton
              Left = 153
              Top = 5
              Width = 147
              Height = 36
              Hint = 'Desmarca todas as parcelas para conciliar'
              Caption = 'Desmarca todos'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
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
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = sbDesmarcaTodasClick
            end
          end
        end
      end
      object tsCobranca: TTabSheet
        Caption = 'tsCobranca'
        ImageIndex = 2
        TabVisible = False
        object fcLabel2: TfcLabel
          Left = 0
          Top = 0
          Width = 650
          Height = 24
          Align = alTop
          Caption = 'Cobrança de Resíduo Não Incorporado [ Cobrança ]'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
        end
        object Label2: TLabel
          Left = 377
          Top = 93
          Width = 67
          Height = 13
          Caption = 'Vencimento'
        end
        object Label26: TLabel
          Left = 32
          Top = 146
          Width = 111
          Height = 13
          Caption = 'Forma de Cobrança'
        end
        object Label3: TLabel
          Left = 32
          Top = 44
          Width = 61
          Height = 13
          Caption = 'Comprador'
        end
        object Label1: TLabel
          Left = 200
          Top = 93
          Width = 63
          Height = 13
          Caption = 'Valor Total'
        end
        object Label8: TLabel
          Left = 32
          Top = 93
          Width = 82
          Height = 13
          Caption = 'Valor Resíduo'
        end
        object edDataVencto: TCMDateTimePicker
          Left = 377
          Top = 108
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
          ShowButton = True
          TabOrder = 0
        end
        object dbcboPortadorForma: TCMDBLookupCombo
          Left = 30
          Top = 160
          Width = 315
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
          LookupTable = qryLookPortadorForma
          LookupField = 'CODPORTFORMA'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = dbcboPortadorFormaChange
          OnCloseUp = dbcboPortadorFormaCloseUp
        end
        object edComprador: TEdit
          Left = 32
          Top = 60
          Width = 457
          Height = 21
          TabStop = False
          Enabled = False
          TabOrder = 2
          Text = 'edComprador'
        end
        object edVlrTotal: TRealEdit
          Left = 200
          Top = 108
          Width = 121
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 3
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object chkBoleto: TCheckBox
          Left = 30
          Top = 188
          Width = 201
          Height = 17
          Caption = 'Gerar boleto de cobrança'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object edVlrResiduo: TRealEdit
          Left = 32
          Top = 108
          Width = 121
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 5
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
      object tsMensagem: TTabSheet
        Caption = 'tsMensagem'
        ImageIndex = 3
        TabVisible = False
        object fcLabel3: TfcLabel
          Left = 0
          Top = 0
          Width = 534
          Height = 24
          Align = alTop
          Caption = 'Cobrança de Resíduo Não Incorporado [ Mensagem ]'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
        end
        object gbMensagem: TGroupBox
          Left = 31
          Top = 31
          Width = 481
          Height = 218
          Caption = 'Mensagem do Boleto'
          TabOrder = 0
          object Label32: TLabel
            Left = 15
            Top = 26
            Width = 47
            Height = 13
            Caption = 'Linha 1:'
          end
          object Label33: TLabel
            Left = 15
            Top = 47
            Width = 47
            Height = 13
            Caption = 'Linha 2:'
          end
          object Label34: TLabel
            Left = 15
            Top = 68
            Width = 47
            Height = 13
            Caption = 'Linha 3:'
          end
          object Label35: TLabel
            Left = 15
            Top = 89
            Width = 47
            Height = 13
            Caption = 'Linha 4:'
          end
          object Label36: TLabel
            Left = 15
            Top = 110
            Width = 47
            Height = 13
            Caption = 'Linha 5:'
          end
          object Label37: TLabel
            Left = 15
            Top = 131
            Width = 47
            Height = 13
            Caption = 'Linha 6:'
          end
          object Label38: TLabel
            Left = 15
            Top = 152
            Width = 47
            Height = 13
            Caption = 'Linha 7:'
          end
          object Label39: TLabel
            Left = 15
            Top = 173
            Width = 47
            Height = 13
            Caption = 'Linha 8:'
          end
          object Label40: TLabel
            Left = 15
            Top = 194
            Width = 47
            Height = 13
            Caption = 'Linha 9:'
          end
          object edtln9: TEdit
            Left = 72
            Top = 189
            Width = 400
            Height = 21
            MaxLength = 69
            TabOrder = 8
          end
          object edtln8: TEdit
            Left = 72
            Top = 168
            Width = 400
            Height = 21
            MaxLength = 69
            TabOrder = 7
          end
          object edtln7: TEdit
            Left = 72
            Top = 147
            Width = 400
            Height = 21
            MaxLength = 69
            TabOrder = 6
          end
          object edtln6: TEdit
            Left = 72
            Top = 126
            Width = 400
            Height = 21
            MaxLength = 69
            TabOrder = 5
          end
          object edtln5: TEdit
            Left = 72
            Top = 105
            Width = 400
            Height = 21
            MaxLength = 69
            TabOrder = 4
          end
          object edtln4: TEdit
            Left = 72
            Top = 84
            Width = 400
            Height = 21
            MaxLength = 69
            TabOrder = 3
          end
          object edtln3: TEdit
            Left = 72
            Top = 63
            Width = 400
            Height = 21
            MaxLength = 69
            TabOrder = 2
          end
          object edtln2: TEdit
            Left = 72
            Top = 42
            Width = 400
            Height = 21
            MaxLength = 69
            TabOrder = 1
          end
          object edtln1: TEdit
            Left = 72
            Top = 21
            Width = 400
            Height = 21
            MaxLength = 69
            TabOrder = 0
          end
        end
      end
      object tsAbono: TTabSheet
        Caption = 'tsAbono'
        ImageIndex = 4
        TabVisible = False
        object fcLabel4: TfcLabel
          Left = 0
          Top = 0
          Width = 491
          Height = 24
          Align = alTop
          Caption = 'Cobrança de Resíduo Não Incorporado [ Abono ]'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
        end
        object GroupBox1: TGroupBox
          Left = 168
          Top = 80
          Width = 313
          Height = 105
          Caption = 'Motivo '
          TabOrder = 0
          object memAbono: TMemo
            Left = 16
            Top = 24
            Width = 281
            Height = 65
            MaxLength = 200
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 331
    Width = 660
    inherited tb97Fundo: TToolbar97
      Left = 220
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object dsParc: TwwDataSource
    AutoEdit = False
    DataSet = qryParc
    Left = 584
    Top = 192
  end
  object qryParc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     (0) CHKINTEGRA,'
      '     MIN(CI.IDCONTRATOIMOVEL)   AS IDCONTRATOIMOVEL,'
      '     MIN(CI.CONNUMERO)          AS NUMCONTRATO,'
      '     MIN(CI.CONNOME)            AS NOMECONTRATO,'
      '     MIN(IM.NOMEMESTRE)         AS NOMEMESTRE,'
      '     MIN(IM.CODTIPIMOVEL)       AS CODTIPIMOVEL,'
      '     PR.IDPARCFINANCIMOV,'
      '     PR.IDCONDPAGIMOVEL,'
      '     MIN(PR.DATAVENCIMENTO)     AS DATAVENCIMENTO,'
      '     MIN(PR.NUMPARCELA)         AS NUMPARCELA,'
      '     MIN(CP.NUMPARCELAS)        AS NUMPARCELAS,'
      '     MIN(CP.FORMACALCULO)       AS FORMACALCULO,'
      '     MIN(CP.INDCORRECAO)        AS INDCORRECAO,'
      '     MIN(CP.MESREFREAJUSTE)     AS MESREFREAJUSTE,'
      '     MIN(PR.VLRPRESTACAO)       AS VLRPRESTACAO,'
      '     MIN(NVL(PR.FLGRESIDUOINCORP,'#39'N'#39')) AS FLGRESIDUOINCORP,'
      '     MIN(PR.VLRPRESTATUALIZADA) AS VLRPRESTATUALIZADA,'
      
        '     ROUND(MIN(NVL(PR.VLRRESIDUO,0)+NVL(PR.VLRCORRSALDO,0)),2) A' +
        'S VLRRESIDUO,'
      '     (0)                          AS VLRRESIDUOATUALI,'
      '     MIN(CI.IDLOCATARIO)        AS IDPESSOA,'
      '     MIN(P.RAZAOSOCIAL)         AS RAZAOSOCIAL,'
      '     MIN(PR.FLGTIPOLANC)        AS FLGTIPOLANC,'
      
        '     DECODE(MIN(CI.CODPORTFORMA), NULL, -1, MIN(CI.CODPORTFORMA)' +
        ') AS CODPORTFORMA,'
      
        '     DECODE(MIN(PF.CODFORMA), NULL, -1, MIN(PF.CODFORMA)) AS COD' +
        'FORMA,'
      '     CI.FLGTIPOCONTRATO,'
      '     MIN(NVL(ALT.TOT_ALTERADOR,0))     AS TOT_ALTERADOR,'
      '     MIN(PR.IDLANCOPERNORMAL)          AS IDLANCOPERNORMAL,'
      '     MIN(PR.IDLANCOPERADIANTO)         AS IDLANCOPERADIANTO,'
      '     MIN(ALT.NUMLANCTO)                AS NUMLANCTO,'
      '     MIN(ALT.CODDOCUMENTO)             AS CODDOCUMENTO'
      'FROM'
      '     PARCFINANCIMOV PR, '
      '     CONDPAGIMOVEL CP, '
      '     CONTRATOIMOVEL CI, '
      '     PESSOA P, '
      '     PORTADORFORMA PF, '
      '     ( SELECT CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL, '
      '              M.IMONOME            AS NOMEMESTRE, '
      '              I.CODTIPIMOVEL       AS CODTIPIMOVEL '
      '       FROM '
      '              CONTRATOXIMOVEL CXI, '
      '              IMOVEL I, '
      '              IMOVEL M  '
      '       WHERE '
      '              CXI.IDIMOVEL = I.IDIMOVEL AND '
      '              I.IDIMOVELMESTRE = M.IDIMOVEL ) IM, '
      '     ('
      
        '      SELECT PR.CODDOCUMENTO, MIN(L.NUMLANCTO) AS NUMLANCTO, NVL' +
        '(SUM(VALOR),0) AS TOT_ALTERADOR'
      '      FROM LANCTODOCUM L, PARCFINANCIMOV PR'
      '      WHERE L.CODDOCUMENTO = PR.CODDOCUMENTO'
      '      AND   L.CODALTERADOR = 466'
      '      AND   (NVL(PR.FLGRESIDUOINCORP,'#39'N'#39') = :pFLGRESIDUO)'
      '      AND ((:pDATAI IS NULL) OR (PR.DATAVENCIMENTO >= :pDATAI)) '
      '      AND ((:pDATAF IS NULL) OR (PR.DATAVENCIMENTO <= :pDATAF)) '
      
        '      AND ((:pIDCONDPAG IS NULL) OR (PR.IDCONDPAGIMOVEL = :pIDCO' +
        'NDPAG))'
      '      AND NOT EXISTS (SELECT 1 FROM CONCILIADOC'
      '                      WHERE IDDOCUMENTO = PR.CODDOCUMENTO'
      '                      AND FLGTIPO       = '#39'U'#39
      '                      AND   NUMLANCTO   = L.NUMLANCTO)'
      ''
      '      GROUP BY PR.CODDOCUMENTO'
      '      ) ALT'
      'WHERE  (NVL(PR.FLGRESIDUOINCORP,'#39'N'#39') = :pFLGRESIDUO) '
      
        '   AND ( ( CP.FORMACALCULO IN(14,16) AND (NVL(PR.VLRRESIDUO,0)+N' +
        'VL(PR.VLRCORRSALDO,0)) <> 0) OR (NVL(PR.VLRRESIDUOATUALI,0) <> 0' +
        ') ) '
      '   AND (PR.FLGLANCINTEGRA > 1) '
      '   AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL) '
      '   AND (CP.IDCONDPAGIMOVEL = PR.IDCONDPAGIMOVEL) '
      '   AND (CI.IDLOCATARIO = P.IDPESSOA) '
      '   AND (CI.IDCONTRATOIMOVEL = IM.IDCONTRATOIMOVEL(+)) '
      '   AND (CI.CODPORTFORMA = PF.CODPORTFORMA(+)) '
      '   AND ((:pDATAI IS NULL) OR (PR.DATAVENCIMENTO >= :pDATAI)) '
      '   AND ((:pDATAF IS NULL) OR (PR.DATAVENCIMENTO <= :pDATAF)) '
      '   AND ((:pIDPESSOA IS NULL) OR (CI.IDLOCATARIO = :pIDPESSOA)) '
      
        '   AND ((:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = :pIDRES' +
        'PONSAVEL)) '
      
        '   AND ((:pIDADMINIMOVEL IS NULL) OR (CI.IDADMINIMOVEL = :pIDADM' +
        'INIMOVEL)) '
      
        '   AND ((:pIDCONTRATO IS NULL) OR (CI.IDCONTRATOIMOVEL = :pIDCON' +
        'TRATO)) '
      '   AND (PR.CODDOCUMENTO = ALT.CODDOCUMENTO(+)) '
      
        '   AND ((:pIDCONDPAG IS NULL) OR (PR.IDCONDPAGIMOVEL = :pIDCONDP' +
        'AG)) '
      
        'GROUP BY PR.IDCONDPAGIMOVEL, PR.IDPARCFINANCIMOV, CI.FLGTIPOCONT' +
        'RATO '
      'ORDER BY DATAVENCIMENTO '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpdParc
    ControlType.Strings = (
      'CHKINTEGRA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 368
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'pFLGRESIDUO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDATAF'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDATAF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDCONDPAG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDCONDPAG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pFLGRESIDUO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDATAF'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDATAF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDRESPONSAVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDRESPONSAVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDCONDPAG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDCONDPAG'
        ParamType = ptInput
      end>
    object qryParcCHKINTEGRA: TFloatField
      DisplayLabel = '   '
      DisplayWidth = 2
      FieldName = 'CHKINTEGRA'
    end
    object qryParcNUMPARCELA: TFloatField
      DisplayLabel = 'Parcela'
      DisplayWidth = 8
      FieldName = 'NUMPARCELA'
    end
    object qryParcDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 12
      FieldName = 'DATAVENCIMENTO'
    end
    object qryParcVLRPRESTACAO: TFloatField
      DisplayLabel = 'Prestação'
      DisplayWidth = 12
      FieldName = 'VLRPRESTACAO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRPRESTATUALIZADA: TFloatField
      DisplayLabel = 'Prest. Atualizada'
      DisplayWidth = 17
      FieldName = 'VLRPRESTATUALIZADA'
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRRESIDUO: TFloatField
      DisplayLabel = 'Resíduo'
      DisplayWidth = 12
      FieldName = 'VLRRESIDUO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRRESIDUOATUALI: TFloatField
      DisplayLabel = 'Resíduo Atualizado'
      DisplayWidth = 18
      FieldName = 'VLRRESIDUOATUALI'
      DisplayFormat = '#,##0.00'
    end
    object qryParcTOT_ALTERADOR: TFloatField
      DisplayLabel = 'Adiant. Resíduo'
      DisplayWidth = 10
      FieldName = 'TOT_ALTERADOR'
    end
    object qryParcIDLANCOPERNORMAL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLANCOPERNORMAL'
      Visible = False
    end
    object qryParcIDLANCOPERADIANTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLANCOPERADIANTO'
      Visible = False
    end
    object qryParcRAZAOSOCIAL: TStringField
      DisplayLabel = 'Comprador'
      DisplayWidth = 40
      FieldName = 'RAZAOSOCIAL'
      Visible = False
      Size = 60
    end
    object qryParcIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryParcNUMCONTRATO: TStringField
      DisplayLabel = 'Nº do Contrato'
      DisplayWidth = 18
      FieldName = 'NUMCONTRATO'
      Visible = False
    end
    object qryParcNOMEMESTRE: TStringField
      FieldName = 'NOMEMESTRE'
      Visible = False
      Size = 60
    end
    object qryParcNOMECONTRATO: TStringField
      DisplayLabel = 'Descrição do Contrato'
      DisplayWidth = 35
      FieldName = 'NOMECONTRATO'
      Visible = False
      Size = 60
    end
    object qryParcCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Visible = False
      Size = 5
    end
    object qryParcIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
      Visible = False
    end
    object qryParcIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
      Visible = False
    end
    object qryParcNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
      Visible = False
    end
    object qryParcIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryParcFLGTIPOLANC: TFloatField
      FieldName = 'FLGTIPOLANC'
      Visible = False
    end
    object qryParcCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object qryParcCODFORMA: TFloatField
      FieldName = 'CODFORMA'
      Visible = False
    end
    object qryParcFORMACALCULO: TFloatField
      FieldName = 'FORMACALCULO'
      Visible = False
    end
    object qryParcFLGRESIDUOINCORP: TStringField
      FieldName = 'FLGRESIDUOINCORP'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryParcINDCORRECAO: TFloatField
      FieldName = 'INDCORRECAO'
      Visible = False
    end
    object qryParcMESREFREAJUSTE: TFloatField
      FieldName = 'MESREFREAJUSTE'
      Visible = False
    end
    object qryParcFLGTIPOCONTRATO: TStringField
      FieldName = 'FLGTIPOCONTRATO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryParcNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Visible = False
    end
    object qryParcCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
  end
  object UpdParc: TUpdateSQL
    ModifySQL.Strings = (
      'update PARCFINANCIMOV'
      'set'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  FLGLANCINTEGRA = :FLGLANCINTEGRA'
      'where'
      '  IDPARCFINANCIMOV = :OLD_IDPARCFINANCIMOV')
    InsertSQL.Strings = (
      'insert into PARCFINANCIMOV'
      '  (CODDOCUMENTO, PLNCODIGO, FLGLANCINTEGRA)'
      'values'
      '  (:CODDOCUMENTO, :PLNCODIGO, :FLGLANCINTEGRA)')
    DeleteSQL.Strings = (
      'delete from PARCFINANCIMOV'
      'where'
      '  IDPARCFINANCIMOV = :OLD_IDPARCFINANCIMOV')
    Left = 584
    Top = 265
  end
  object qryLookPortadorForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    CODPORTFORMA,'
      '    DESCRICAO,'
      '    CODFORMA,'
      '    IDCONFIGBARRAS'
      'FROM'
      '    PORTADORFORMA'
      'WHERE'
      '    RECPAG = '#39'R'#39
      'AND NVL(FLGATIVO, '#39'S'#39') = '#39'S'#39
      'AND IDPESSOA =:EMPRESAPROP'
      'ORDER BY'
      '   DESCRICAO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 583
    Top = 231
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryLookPortadorFormaDESCRICAO: TStringField
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = 'PORTADORFORMA.DESCRICAO'
      Size = 50
    end
    object qryLookPortadorFormaCODPORTFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
      Origin = 'PORTADORFORMA.CODPORTFORMA'
      Visible = False
    end
    object qryLookPortadorFormaCODFORMA: TFloatField
      FieldName = 'CODFORMA'
      Origin = 'BASEDADOS.PORTADORFORMA.CODFORMA'
      Visible = False
    end
    object qryLookPortadorFormaIDCONFIGBARRAS: TFloatField
      FieldName = 'IDCONFIGBARRAS'
      Origin = 'BASEDADOS.PORTADORFORMA.IDCONFIGBARRAS'
    end
  end
  object qryCondPag: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       CP.IDCONTRATOIMOVEL,'
      '       CP.IDCONDPAGIMOVEL,'
      '       CP.IDCONDINICIAL,'
      '       DECODE(NVL(CP.VLRFINANC,0),0,'
      
        '          DECODE(CP.TIPOCONDPAG,'#39'S'#39',(TO_CHAR(CP.DATAVENCIMENTO,'#39 +
        'DD/MM/YYYY'#39') || '#39' '#39' || TO_CHAR(CPI.VLRFINANC,'#39'99999,999,999.99'#39')' +
        ' || '#39'  Sinal'#39'),'
      
        '                                '#39'V'#39',(TO_CHAR(CP.DATAVENCIMENTO,'#39 +
        'DD/MM/YYYY'#39') || '#39' '#39' || TO_CHAR(CPI.VLRFINANC,'#39'99999,999,999.99'#39')' +
        ' || '#39'  A Vista'#39'),'
      
        '                                    (TO_CHAR(CP.DATAVENCIMENTO,'#39 +
        'DD/MM/YYYY'#39') || '#39' '#39' || TO_CHAR(CPI.VLRFINANC,'#39'99999,999,999.99'#39')' +
        ' || '#39'  '#39' || TO_CHAR(CP.NUMPARCELAS,'#39'999'#39')) ),'
      
        '          DECODE(CP.TIPOCONDPAG,'#39'S'#39',(TO_CHAR(CP.DATAVENCIMENTO,'#39 +
        'DD/MM/YYYY'#39') || '#39' '#39' || TO_CHAR(CP.VLRFINANC,'#39'99999,999,999.99'#39') ' +
        '|| '#39'  Sinal'#39'),'
      
        '                                '#39'V'#39',(TO_CHAR(CP.DATAVENCIMENTO,'#39 +
        'DD/MM/YYYY'#39') || '#39' '#39' || TO_CHAR(CP.VLRFINANC,'#39'99999,999,999.99'#39') ' +
        '|| '#39'  A Vista'#39'),'
      
        '                                    (TO_CHAR(CP.DATAVENCIMENTO,'#39 +
        'DD/MM/YYYY'#39') || '#39' '#39' || TO_CHAR(CP.VLRFINANC,'#39'99999,999,999.99'#39') ' +
        '|| '#39'  '#39' || TO_CHAR(CP.NUMPARCELAS,'#39'999'#39')) ) ) AS DSCCOND'
      ''
      'FROM'
      '       CONDPAGIMOVEL CP,'
      '       CONDPAGIMOVEL CPI'
      'WHERE'
      '      (CP.TIPOCONDPAG IN ('#39'S'#39','#39'P'#39','#39'V'#39','#39'R'#39') )'
      '  AND (CP.IDREPACTUA IS NULL)'
      '  AND (CP.IDCONDINICIAL = CPI.IDCONDPAGIMOVEL)'
      '  AND (CP.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 394
    Top = 150
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryCondPagDSCCOND: TStringField
      DisplayLabel = 'Vencimento    Valor Finaciado   Nr. Parcelas'
      DisplayWidth = 34
      FieldName = 'DSCCOND'
      Size = 34
    end
    object qryCondPagIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryCondPagIDCONDPAGIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONDPAGIMOVEL'
      Visible = False
    end
    object qryCondPagIDCONDINICIAL: TFloatField
      FieldName = 'IDCONDINICIAL'
    end
  end
  object qryDadosCliente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    EST.IDPAIS,'
      '    CID.IDCIDADES,'
      '    EST.CODESTADO'
      'FROM'
      '    PESSOA  PES,'
      '    ENDPESS END,'
      '    CIDADES CID,'
      '    ESTADO  EST'
      'WHERE'
      '    PES.IDPESSOA      = :IDPESSOA          AND'
      '    END.IDENDERECO(+) = PES.IDENDCOMERCIAL AND'
      '    CID.IDCIDADES(+)  = END.IDCIDADES      AND'
      '    EST.IDESTADO(+)   = CID.IDESTADO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 448
    Top = 51
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    object qryDadosClienteIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object qryDadosClienteIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
    end
    object qryDadosClienteCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
  end
end
