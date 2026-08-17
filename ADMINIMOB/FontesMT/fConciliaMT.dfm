inherited frmConciliaMT: TfrmConciliaMT
  Left = 168
  Top = 177
  HelpContext = 640012
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Conciliação de Lançamentos'
  ClientHeight = 395
  ClientWidth = 787
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 787
    Height = 356
    inherited PagControle: TPageControl
      Width = 785
      Height = 354
      ActivePage = tabPrincipal
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 777
          Caption = 'Conciliação de Lançamentos [Seleção]'
        end
        inline MolUsuario1: TMolUsuario
          Left = 4
          Top = 38
          inherited btnBuscaUsuario: TBitBtn
            OnClick = MolUsuario1btnBuscaUsuarioClick
          end
          inherited btnLimpaUsuario: TBitBtn
            OnClick = MolUsuario1btnLimpaUsuarioClick
          end
        end
        inline molContrato1: TmolContrato
          Left = 4
          Top = 86
          TabOrder = 1
          inherited btnBuscaContrato: TBitBtn
            OnClick = molContrato1btnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            OnClick = molContrato1btnLimpaContratoClick
          end
        end
        inline molCliente1: TmolCliente
          Left = 4
          Top = 133
          Width = 769
          TabOrder = 2
          inherited btnBuscaCli: TBitBtn
            Left = 704
            OnClick = molCliente1btnBuscaCliClick
          end
          inherited btnLimpaCli: TBitBtn
            Left = 728
            OnClick = molCliente1btnLimpaCliClick
          end
          inherited edtNomeFantasia: TEdit
            Width = 273
          end
          inherited edtRazaoSocial: TEdit
            Left = 280
            Width = 425
          end
        end
        inline molOrigemLanc1: TmolOrigemLanc
          Left = 443
          Top = 82
          Width = 318
          Height = 49
          TabOrder = 3
          inherited cboOrigemLanc: TwwDBComboBox
            Top = 21
            Width = 304
            Items.Strings = (
              'Folha de Aluguéis'#9'F'
              'Lançamento Múltiplo de Receitas'#9'M')
          end
        end
        object grpDatas: TGroupBox
          Left = 12
          Top = 183
          Width = 261
          Height = 95
          Caption = ' Período de Datas '
          TabOrder = 4
          object Label5: TLabel
            Left = 122
            Top = 35
            Width = 8
            Height = 13
            Caption = 'a'
          end
          object edtDataIni: TCMDateTimePicker
            Left = 14
            Top = 31
            Width = 97
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
          object edtDataFim: TCMDateTimePicker
            Left = 142
            Top = 31
            Width = 97
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
        object grpCompetencia: TGroupBox
          Left = 523
          Top = 183
          Width = 249
          Height = 95
          Caption = ' Mês de Competência '
          TabOrder = 5
          object DBspnAnoCompetencia: TwwDBSpinEdit
            Left = 170
            Top = 31
            Width = 65
            Height = 21
            Increment = 1
            MaxValue = 2050
            MinValue = 1980
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object cboMesCompetencia: TComboBox
            Left = 14
            Top = 31
            Width = 145
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
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
          object chkCompetencia: TCheckBox
            Left = 14
            Top = 64
            Width = 221
            Height = 17
            Caption = 'NÃO levar em conta a competência'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
        end
        object rdgTipoData: TRadioGroup
          Left = 12
          Top = 279
          Width = 503
          Height = 54
          Caption = ' Tipo de Datas '
          Columns = 3
          ItemIndex = 2
          Items.Strings = (
            'de Inclusão'
            'de Lançamento'
            'de Vencimento')
          TabOrder = 6
          TabStop = True
        end
        object GroupBox1: TGroupBox
          Left = 281
          Top = 183
          Width = 234
          Height = 95
          Caption = 'Valores atualizados até '
          TabOrder = 7
          object edtDataAtualiza: TCMDateTimePicker
            Left = 64
            Top = 31
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
            TabOrder = 0
          end
        end
      end
      inherited TabSheet1: TTabSheet
        Caption = 'tabLiquidados'
        inherited fcLabel1: TfcLabel
          Width = 777
          Caption = 'Conciliação de Lançamentos [Seleção]'
        end
        object lblLancamentos: TLabel
          Left = 651
          Top = 295
          Width = 113
          Height = 13
          Alignment = taRightJustify
          Caption = 'Lançamento(s): 753'
        end
        object dbGrdData: TwwDBGrid
          Left = 12
          Top = 50
          Width = 753
          Height = 228
          ControlType.Strings = (
            'FLGMARCAR;CheckBox;1;0')
          Selected.Strings = (
            'FLGMARCAR'#9'4'#9#9'F'
            'CODDOCUMENTO'#9'15'#9'Documento'#9'F'
            'CONTRATO_EXTENSO'#9'56'#9'Contrato'#9'F'
            'MESCOMPETENCIA'#9'4'#9'Mês'#9'F'
            'ANOCOMPETENCIA'#9'5'#9'Ano'#9'F'
            'DATAVENCIMENTO'#9'12'#9'Vencimento'#9'F'
            'DATALIMITE'#9'9'#9'Limite'#9'F'
            'DATA_BAIXA'#9'9'#9'Baixa'#9'F'
            'TOT_RECEBER'#9'15'#9'Vlr Original'#9'F'
            'TOT_RECEBIDO'#9'15'#9'Vlr Recebido'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsConciliaFeriado
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = dbGrdDataCalcCellColors
          OnDblClick = dbGrdDataDblClick
          IndicatorColor = icBlack
        end
        object Panel5: TPanel
          Left = 12
          Top = 24
          Width = 753
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Documentos Liquidados pelo Valor Original'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object btnAbonaData: TfcShapeBtn
          Left = 356
          Top = 302
          Width = 89
          Height = 29
          Caption = 'Abonar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            4E010000424D4E01000000000000760000002800000014000000120000000100
            040000000000D800000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            77777777000077888888887788888877000078000000088000000087000070FF
            FFFF0FF0FFFFFF08000070FF000FF80FF000FF08000070FFFFFFF80FFFFFFF08
            000070FF0000F80F0000FF08000070FFFFFFF80FFFFFFF08000070FFFFFFF800
            FFFFFF08000070F9999F0FF0F9999F08000070FF99FFF80FFF99FF08000070FF
            99FFF80FFFF99F08000070FF99FFF80FF9FF9F08000070F999FFF80FF9999F08
            000070FF99FFF80FFF99FF08000070FFFFFF0FF0FFFFFF080000770000000880
            000000870000777777777777777777770000}
          NumGlyphs = 0
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          Spacing = 6
          TabOrder = 2
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnAbonaDataClick
        end
        object fcShapeBtn1: TfcShapeBtn
          Left = 12
          Top = 302
          Width = 124
          Height = 29
          Caption = 'Marcar Todas'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 3
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = fcShapeBtn1Click
        end
        object fcShapeBtn2: TfcShapeBtn
          Left = 146
          Top = 302
          Width = 124
          Height = 29
          Caption = 'Desmarcar Todas'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888FF8888888888888008888888888888F77F8888888888800F08888
            8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
            88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
            888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
            0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
            03088878F88878F878788887F8888090B03088878F888787878788887888880B
            0B038888788888787878888888888880B0B38888888888878788888888888888
            0BBB88888888888878F888888888888880BB8888888888888788}
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 4
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = fcShapeBtn2Click
        end
      end
      object tabPrincipal: TTabSheet
        Caption = 'tabPrincipal'
        ImageIndex = 2
        TabVisible = False
        object fcLabel2: TfcLabel
          Left = 0
          Top = 0
          Width = 777
          Height = 24
          Align = alTop
          Caption = 'Conciliação de Lançamentos [Seleção]'
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
        object lblCalculo: TLabel
          Left = 708
          Top = 292
          Width = 56
          Height = 13
          Alignment = taRightJustify
          Caption = 'lblCalculo'
        end
        object Panel3: TPanel
          Left = 12
          Top = 29
          Width = 753
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Documentos Corrigidos'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dbGrdValor: TwwDBGrid
          Left = 12
          Top = 55
          Width = 752
          Height = 213
          ControlType.Strings = (
            'FLGMARCAR;CheckBox;1;0')
          Selected.Strings = (
            'FLGMARCAR'#9'3'#9' '#9'F'
            'CODDOCUMENTO'#9'10'#9'Documento'#9'F'
            'CONTRATO_EXTENSO'#9'40'#9'Contrato'#9'F'
            'MESCOMPETENCIA'#9'5'#9'Mês'#9'F'
            'ANOCOMPETENCIA'#9'6'#9'Ano'#9'F'
            'DATAVENCIMENTO'#9'10'#9'Vencimento'#9'F'
            'DATA_BAIXA'#9'10'#9'Baixa'#9'F'
            'TOT_RECEBER'#9'20'#9'Vlr. Original'#9'F'
            'TOT_RECEBIDO'#9'20'#9'Vlr. Recebido'#9'F'
            'JUROS'#9'13'#9'Juros'#9'F'
            'MULTA'#9'13'#9'Multa'#9'F'
            'CORRECAO'#9'13'#9'Correção'#9'F'
            'ABONO'#9'9'#9'Abono'#9'F'
            'PROPORCAO'#9'11'#9'Proporção'#9'F'
            'JUROSDIF'#9'13'#9'Juros Dif.'#9'F'
            'MULTADIF'#9'13'#9'Multa Dif.'#9'F'
            'CORRECAODIF'#9'13'#9'Correção Dif.'#9'F'
            'DIFERENCA'#9'20'#9'Diferença'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsConciliacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = dbGrdValorCalcCellColors
          OnDblClick = dbGrdValorDblClick
          IndicatorColor = icBlack
          object dbGrdValorIButton: TwwIButton
            Left = 0
            Top = 0
            Width = 13
            Height = 17
            AllowAllUp = True
          end
        end
        object btnAbonaDif: TfcShapeBtn
          Left = 347
          Top = 302
          Width = 89
          Height = 29
          Caption = 'Abonar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008B88888BCB88
            888B888888887888888888BB888BCB888BB8888888887888888888BBBB8CCC8B
            BBB88888888777888888888B8CCCCCCC8B888888877777778888888BCC88C88C
            CB8888887788788778888888CC88C88CC888888877887887788888888888C88C
            C8888888888878877888888B888CCCCC8B8888888887777788888BBB8CCCCC88
            8BBB8888877777888888888BCC88C8888B8888887788788888888888CC88C88C
            C8888888778878877888888BCC88C88CCB888888778878877888888B8CCCCCCC
            8B88888887777777888888BBBB8CCC8BBBB8888888877788888888BB888BCB88
            8BB888888888788888888B88888BCB88888B8888888878888888}
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          Spacing = 8
          TabOrder = 2
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnAbonaDifClick
        end
        object btnCobranca: TfcShapeBtn
          Left = 401
          Top = 366
          Width = 89
          Height = 28
          Caption = 'Cobrança'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Enabled = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
            0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
            0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
            0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
            0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
            0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
            5555557FFFFF7755555555500000005555555577777775555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 3
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          Visible = False
        end
        object btnConsulta: TfcShapeBtn
          Left = 442
          Top = 302
          Width = 89
          Height = 29
          Caption = 'Consulta'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
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
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 4
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnConsultaClick
        end
        object btnImprime: TfcShapeBtn
          Left = 537
          Top = 302
          Width = 89
          Height = 29
          Caption = 'Imprime'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 5
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnImprimeClick
        end
        object btnMarcar: TfcShapeBtn
          Left = 12
          Top = 302
          Width = 124
          Height = 29
          Caption = 'Marcar Todas'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 6
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnMarcarClick
        end
        object btnDesmarcar: TfcShapeBtn
          Left = 146
          Top = 302
          Width = 124
          Height = 29
          Caption = 'Desmarcar Todas'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888FF8888888888888008888888888888F77F8888888888800F08888
            8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
            88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
            888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
            0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
            03088878F88878F878788887F8888090B03088878F888787878788887888880B
            0B038888788888787878888888888880B0B38888888888878788888888888888
            0BBB88888888888878F888888888888880BB8888888888888788}
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 7
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnDesmarcarClick
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 356
    Width = 787
    inherited tb97Fundo: TToolbar97
      Left = 421
      inherited sep1: TToolbarSep97
        Left = 278
      end
      inherited bbtnSair: TBitBtn
        Left = 197
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 280
      end
      inherited btnConfirmar: TfcShapeBtn
        Width = 31
        Visible = False
      end
    end
  end
  object pnlProgressBar: TPanel [2]
    Left = 768
    Top = 343
    Width = 787
    Height = 45
    BevelInner = bvSpace
    BevelOuter = bvLowered
    Enabled = False
    TabOrder = 2
    Visible = False
    object lblProgress: TLabel
      Left = 8
      Top = 6
      Width = 79
      Height = 13
      Caption = 'Conciliando...'
      Visible = False
    end
    object lblContador: TLabel
      Left = 686
      Top = 6
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = '00000 de 00000'
      Visible = False
    end
    object pbConcilia: TProgressBar
      Left = 8
      Top = 20
      Width = 771
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 0
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 1
    Top = 408
  end
  object cdsAtualizaConcilia: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 38
    Top = 328
  end
  object dsAtualizaConcilia: TwwDataSource
    DataSet = cdsAtualizaConcilia
    Left = 38
    Top = 343
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      
        'SELECT DISTINCT V.CODDOCUMENTO,    V.DATAVENCIMENTO,    V.DATA_B' +
        'AIXA,       V.TOT_RECEBER+NVL(ALT.TOT_ALTERADOR,0) AS TOT_RECEBE' +
        'R, '
      
        '                V.TOT_RECEBIDO,    V.FLGNAOCONCILIADO,  V.IDCONT' +
        'RATOIMOVEL, V.IDCIDADES, '
      
        '                V.IDPAIS,          V.CODESTADO,         V.RS_FOR' +
        'CLI,        V.IDFORCLI, '
      
        '                V.DATALIMITE,      V.CONTRATO_EXTENSO,  V.MESCOM' +
        'PETENCIA,   V.ANOCOMPETENCIA, '
      
        '                V.CODTIPIMOVEL,    V.CONMESREFREAJUSTE, V.STATUS' +
        '_DOC,       V.IDTIPOCUSTORECIMO, '
      
        '                0 AS FLGMARCAR,    V.CONNUMERO,         V.TOT_AL' +
        'TERADOR, '
      
        '                0.00 AS CORRECAO,  0.00 AS JUROS,       0.00 AS ' +
        'MULTA,      0.00 AS CORRECAODIF, '
      
        '                0.00 AS JUROSDIF,  0.00 AS MULTADIF,    0.00 AS ' +
        'VLRATUAL,   0.00 AS VLRDIVERG, '
      
        '                0.00 AS DIFERENCA, 0.00 AS PROPORCAO,   0.00 AS ' +
        'ABONO, '
      
        '                0.00 AS VLRDIVERGATUAL, 0.00 AS TOT_CORRIGIDO,  ' +
        #39#39' AS NUMERO_CONTRATO, '
      
        '                '#39#39' AS NOME_CONTRATO,    0 AS IDINDCORRECAO,   0 ' +
        'AS CONDIASTOLERANCIA, '
      
        '                0 AS CONDIASREPASSE,    V.FLGTIPODIATOLERA,     ' +
        '0 AS CONVLRMULTA, '
      
        '                0 AS CONPERCENTMULTA,   0 AS CONMOEDAMULTA,     ' +
        '0 AS CONVLRMORA, '
      
        '                0 AS CONMOEDAMORA,      0 AS CONPERCENTMORA,    ' +
        'V.FLGMORAPROPORC, '
      
        '                0 AS CONPERMORA,  (V.TOT_RECEBER + V.TOT_ALTERAD' +
        'OR) AS A_RECEBER'
      'FROM VWLANCAMENTO V,'
      '     ('
      
        'SELECT L.CODDOCUMENTO, SUM(DECODE(LD.DEBCRE,'#39'D'#39',LD.VALOR, LD.VAL' +
        'OR * -1)) AS TOT_ALTERADOR'
      '  FROM LANCTODOCUM LD, '
      
        '       ( SELECT L.CODDOCUMENTO, MAX(L.CODTIPIMOVEL) AS CODTIPIMO' +
        'VEL,'
      '                MAX(T.CODALTMULTA) AS CODALTMULTA,'
      '                MAX(T.CODALTJUROS) AS CODALTJUROS,'
      '                MAX(T.CODALTCORRMON) AS CODALTCORRMON'
      '           FROM LANCAMENTOSIMOVEL L, TIPOIMOVEL T'
      '          WHERE L.RECPAG = '#39'R'#39' '
      '            AND L.CODTIPIMOVEL = T.CODTIPIMOVEL'
      '          GROUP BY L.CODDOCUMENTO ) L'
      ' WHERE L.CODDOCUMENTO = LD.CODDOCUMENTO'
      '   AND LD.ESTORNO IS NULL'
      '   AND TRIM(LD.OPERACAO) = '#39'4'#39
      
        '   AND LD.CODALTERADOR NOT IN(L.CODALTMULTA, L.CODALTJUROS, L.CO' +
        'DALTCORRMON)'
      '   AND L.CODDOCUMENTO = 73719'
      ' GROUP BY L.CODDOCUMENTO  '
      ') ALT'
      ''
      ' '
      'WHERE V.FLGNAOCONCILIADO = 1 '
      '  AND V.RECPAG           = '#39'R'#39'   AND V.IDMODULO = 64'
      '  AND V.IDCONTRATOIMOVEL = 154'
      '  AND V.FLGORIGEMLANC    = '#39'F'#39
      '  AND V.STATUS_DOC = '#39'2'#39' '
      '  AND V.CODDOCUMENTO = ALT.CODDOCUMENTO(+)'
      
        '  AND ((V.TOT_RECEBER+NVL(ALT.TOT_ALTERADOR,0))-V.TOT_RECEBIDO)=' +
        '0 '
      '  AND V.DATAVENCIMENTO <= SYSDATE '
      
        'ORDER BY CONNUMERO, DATAVENCIMENTO, ANOCOMPETENCIA, MESCOMPETENC' +
        'IA, CODDOCUMENTO'
      ''
      ''
      '/*'
      
        'SELECT 0 AS FLGMARCAR, REC_DES.CODDOCUMENTO, REC_DES.MESCOMPETEN' +
        'CIA, REC_DES.ANOCOMPETENCIA, REC_DES.DATAVENCIMENTO,'
      
        '       REC_DES.DATA_BAIXA, REC_DES.DATALIMITE, REC_DES.CODTIPIMO' +
        'VEL,'
      '       ROUND(REC_DES.TOT_RECEBER,2) AS TOT_RECEBER,'
      '       ROUND(REC_DES.TOT_RECEBIDO,2) AS TOT_RECEBIDO,'
      
        '       ROUND((REC_DES.TOT_RECEBER+NVL(CM.VLRACUM,0)+NVL(JR.VLRAC' +
        'UM,0)+NVL(MT.VLRACUM,0))-NVL(REC_DES.TOT_RECEBIDO,0)-NVL(ABONO.T' +
        'OT_ABONO,0),2) AS DIFERENCA,'
      
        '       NVL(CM.VLRACUM,0) AS CORRECAO, NVL(JR.VLRACUM,0) AS JUROS' +
        ', NVL(MT.VLRACUM,0) AS MULTA,'
      '       NVL(ABONO.TOT_ABONO,0) AS ABONO,'
      ''
      
        '       (REC_DES.TOT_RECEBER+NVL(CM.VLRACUM,0)+NVL(JR.VLRACUM,0)+' +
        'NVL(MT.VLRACUM,0))-NVL(REC_DES.TOT_RECEBIDO,0)-NVL(ABONO.TOT_ABO' +
        'NO,0) + NVL(JR.VLRACUM,0)+NVL(MT.VLRACUM,0)-NVL(ABONO.TOT_ABONO,' +
        '0) AS TOT_CORRIGIDO,'
      ''
      
        '       C.IDCONTRATOIMOVEL, C.CONNUMERO AS NUMERO_CONTRATO, C.CON' +
        'NOME AS NOME_CONTRATO, C.CONMESREFREAJUSTE,'
      
        '       C.IDINDCORRECAO, C.IDCIDADES, C.IDPAIS, C.CODESTADO, C.CO' +
        'NDIASTOLERANCIA, C.CONDIASREPASSE,'
      
        '       C.FLGTIPODIATOLERA, C.CONVLRMULTA, C.CONPERCENTMULTA, C.C' +
        'ONMOEDAMULTA, C.CONVLRMORA, C.CONMOEDAMORA,'
      
        '       C.CONPERCENTMORA, C.FLGMORAPROPORC, C.CONPERMORA, (C.CONN' +
        'UMERO||'#39' - '#39'||C.CONNOME) AS CONTRATO_EXTENSO,'
      ''
      
        '       0 AS CORRECAODIF, 0 AS JUROSDIF, 0 AS MULTADIF, 0 AS VLRA' +
        'TUAL, 0 AS VLRDIVERG, 0 AS VLRDIVERGATUAL,'
      '       0 AS PROPORCAO'
      ''
      'FROM CONTRATOIMOVEL C,'
      
        '   ( SELECT LI.IDCONTRATOIMOVEL, LI.CODTIPIMOVEL, LI.CODDOCUMENT' +
        'O, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, LI.DATALIMITE, '
      
        '            LI.DATAVENCIMENTO, LI.IDMODULO, LI.IDUSUARIOSISTEMA,' +
        ' LI.IDFORCLI, LI.FLGORIGEMLANC, '
      '            SUM('
      
        '                DECODE(RTRIM(LD.OPERACAO),'#39'1'#39',DECODE(D.RECPAG,'#39'R' +
        #39',DECODE(LD.DEBCRE,'#39'D'#39',LI.VLRLANCRECEB,LI.VLRLANCRECEB*(-1)),0),' +
        '0)+ '
      
        '                DECODE(RTRIM(LD.OPERACAO),'#39'2'#39',DECODE(D.RECPAG,'#39'R' +
        #39',DECODE(LD.DEBCRE,'#39'D'#39',LI.VLRLANCRECEB,LI.VLRLANCRECEB*(-1)),0),' +
        '0)+ '
      
        '                DECODE(RTRIM(LD.OPERACAO),'#39'3'#39',DECODE(D.RECPAG,'#39'R' +
        #39',DECODE(LD.DEBCRE,'#39'D'#39',LI.VLRLANCRECEB,LI.VLRLANCRECEB*(-1)),0),' +
        '0)+ '
      
        '                DECODE(RTRIM(LD.OPERACAO),'#39'4'#39',DECODE(D.RECPAG,'#39'R' +
        #39',DECODE(LD.DEBCRE,'#39'D'#39',LD.VALOR*LI.VLRLANCRECEB/TRD.VALOR,LD.VAL' +
        'OR*(-1)*LI.VLRLANCRECEB/TRD.VALOR),0),0) '
      '               ) AS TOT_RECEBER,'
      
        '            SUM(DECODE(RTRIM(LD.OPERACAO),'#39'5'#39',DECODE(D.RECPAG,'#39'R' +
        #39',DECODE(LD.DEBCRE,'#39'C'#39',LD.VALOR*LI.VLRLANCRECEB/TRD.VALOR,LD.VAL' +
        'OR*(-1)*LI.VLRLANCRECEB/TRD.VALOR),0),0)) AS TOT_RECEBIDO,'
      '            MAX(BX.DATABAIXA) AS DATA_BAIXA '
      
        '     FROM DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL LI, TIP' +
        'OIMOVEL T, CONTRATOIMOVEL C, '
      '        ( SELECT CODDOCUMENTO, VALOR'
      '          FROM LANCTODOCUM'
      
        '          WHERE RTRIM(OPERACAO) = '#39'1'#39' OR RTRIM(OPERACAO) = '#39'2'#39' O' +
        'R RTRIM(OPERACAO) = '#39'3'#39') TRD,'
      '        ( SELECT D.CODDOCUMENTO, MAX(RP.DATABAIXA) AS DATABAIXA'
      '          FROM DOCUMENTO D, RECBTOPAGTO RP'
      '          WHERE ( D.CODDOCUMENTO = RP.CODDOCUMENTO )'
      '          GROUP BY D.CODDOCUMENTO ) BX'
      '     WHERE ( LI.CODDOCUMENTO   = D.CODDOCUMENTO )'
      
        '       AND ( LD.DATALANCTO    <= TO_DATE( '#39'13/02/2007'#39','#39'DD/MM/YY' +
        'YY'#39') )'
      '       AND ( LI.FLGESTORNADO IS NULL )'
      
        '       AND ( LI.CODDOCUMENTO NOT IN ( SELECT IDDOCUMENTO        ' +
        '      '
      
        '                                      FROM CONCILIADOC          ' +
        '    '
      '                                      WHERE FLGTIPO = '#39'A'#39
      
        '                                        AND IDPARCFINANCIMOV IS ' +
        'NULL '
      
        '                                        AND DATA <= TO_DATE('#39'13/' +
        '02/2007'#39', '#39'DD/MM/YYYY'#39') ) )'
      
        '       AND ( C.FLGTIPOCONTRATO = '#39'L'#39' OR LI.IDCONTRATOIMOVEL IS N' +
        'ULL ) '
      '       AND ( LD.ESTORNO IS NULL ) '
      '       AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) ) '
      '       AND ( D.CODDOCUMENTO      = LD.CODDOCUMENTO ) '
      '       AND ( D.CODDOCUMENTO      = TRD.CODDOCUMENTO ) '
      '       AND ( D.CODDOCUMENTO      = BX.CODDOCUMENTO(+) ) '
      '       AND ( LI.CODTIPIMOVEL     = T.CODTIPIMOVEL ) '
      
        '       AND ( (LD.CODALTERADOR IS NULL) OR (LD.CODALTERADOR IN(T.' +
        'CODALTMULTA,T.CODALTJUROS,T.CODALTCORRMON) '
      '       AND LD.DATALANCTO < TO_DATE('#39'31/12/2004'#39','#39'DD/MM/YYYY'#39') '
      
        '       AND NOT EXISTS ( SELECT 1 FROM LANCOPERDIAIMOB WHERE CODD' +
        'OCUMENTO = LD.CODDOCUMENTO AND (FLGTIPO IS NULL OR FLGTIPO <> '#39'S' +
        #39') ) ) OR (LD.CODALTERADOR <> NVL(T.CODALTMULTA,0) '
      '       AND LD.CODALTERADOR <> NVL(T.CODALTJUROS,0) '
      '       AND LD.CODALTERADOR <> NVL(T.CODALTCORRMON,0)) ) '
      
        '       AND ( (LI.DATALIMITE IS NOT NULL AND LI.DATALIMITE <= TO_' +
        'DATE( '#39'13/02/2007'#39','#39'DD/MM/YYYY'#39')) OR '
      
        '             (LI.DATALIMITE IS NULL AND LI.DATAVENCIMENTO <= TO_' +
        'DATE( '#39'13/02/2007'#39','#39'DD/MM/YYYY'#39')) ) '
      
        '     GROUP BY LI.IDCONTRATOIMOVEL, LI.CODTIPIMOVEL, LI.CODDOCUME' +
        'NTO, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, LI.DATALIMITE, '
      
        '              LI.DATAVENCIMENTO, LI.IDMODULO, LI.IDUSUARIOSISTEM' +
        'A, LI.IDFORCLI, LI.FLGORIGEMLANC,  '
      '              LI.FLGIMPORTADO, D.STATUS ) REC_DES, '
      
        '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO,' +
        ' SUM(LO.VLRACUM) AS VLRACUM '
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI, '
      '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA '
      '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2 '
      '          WHERE LO2.IDOPERACAO  = PI2.IDOPERATUALCM '
      
        '            AND LO2.DATAOPER   <= TO_DATE( '#39'13/02/2007'#39','#39'DD/MM/Y' +
        'YYY'#39') '
      '            AND (LO2.FLGTIPO IS NULL OR LO2.FLGTIPO <> '#39'S'#39') '
      '          GROUP BY LO2.CODDOCUMENTO ) UD '
      '     WHERE LO.IDOPERACAO       = PI.IDOPERATUALCM '
      '       AND LO.DATAOPER         = UD.ULTDIA '
      '       AND LO.CODDOCUMENTO     = UD.CODDOCUMENTO(+) '
      '       AND LO.IDCONTRATOIMOVEL = 7'
      '       AND (LO.FLGTIPO IS NULL OR LO.FLGTIPO <> '#39'S'#39') '
      
        '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACA' +
        'O ) CM, '
      
        '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO,' +
        ' SUM(LO.VLRACUM) AS VLRACUM '
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI, '
      '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA '
      '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2 '
      '          WHERE LO2.IDOPERACAO  = PI2.IDOPERATUALJUROS '
      
        '            AND LO2.DATAOPER   <= TO_DATE( '#39'13/02/2007'#39','#39'DD/MM/Y' +
        'YYY'#39') '
      '            AND (LO2.FLGTIPO IS NULL OR LO2.FLGTIPO <> '#39'S'#39') '
      '          GROUP BY LO2.CODDOCUMENTO ) UD '
      '     WHERE LO.IDOPERACAO       = PI.IDOPERATUALJUROS '
      '       AND LO.DATAOPER         = UD.ULTDIA '
      '       AND LO.CODDOCUMENTO     = UD.CODDOCUMENTO(+) '
      '       AND LO.IDCONTRATOIMOVEL = 7'
      '       AND (LO.FLGTIPO IS NULL OR LO.FLGTIPO <> '#39'S'#39') '
      
        '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACA' +
        'O ) JR, '
      
        '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO,' +
        ' SUM(LO.VLRACUM) AS VLRACUM '
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI, '
      '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA '
      '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2 '
      '          WHERE LO2.IDOPERACAO  = PI2.IDOPERATUALMULTA '
      
        '            AND LO2.DATAOPER   <= TO_DATE( '#39'13/02/2007'#39','#39'DD/MM/Y' +
        'YYY'#39') '
      '            AND (LO2.FLGTIPO IS NULL OR LO2.FLGTIPO <> '#39'S'#39') '
      '          GROUP BY LO2.CODDOCUMENTO ) UD '
      '     WHERE LO.IDOPERACAO       = PI.IDOPERATUALMULTA '
      '       AND LO.DATAOPER         = UD.ULTDIA '
      '       AND LO.CODDOCUMENTO     = UD.CODDOCUMENTO(+) '
      '       AND LO.IDCONTRATOIMOVEL = 7'
      '       AND (LO.FLGTIPO IS NULL OR LO.FLGTIPO <> '#39'S'#39') '
      
        '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACA' +
        'O ) MT, '
      
        '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, SUM(LO.VLRACUM' +
        ') AS TOT_ABONO '
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI, '
      '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA '
      '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2 '
      '          WHERE ( LO2.IDOPERACAO = PI2.IDOPERABONOMULTA OR '
      '                  LO2.IDOPERACAO = PI2.IDOPERABONOJUROS OR '
      '                  LO2.IDOPERACAO = PI2.IDOPERABONOCM )     '
      
        '            AND LO2.DATAOPER   <= TO_DATE( '#39'13/02/2007'#39','#39'DD/MM/Y' +
        'YYY'#39') '
      '            AND (LO2.FLGTIPO IS NULL OR LO2.FLGTIPO <> '#39'S'#39') '
      '          GROUP BY LO2.CODDOCUMENTO ) UD '
      '     WHERE ( LO.IDOPERACAO = PI.IDOPERABONOMULTA OR '
      '             LO.IDOPERACAO = PI.IDOPERABONOJUROS OR '
      '             LO.IDOPERACAO = PI.IDOPERABONOCM )     '
      '       AND LO.DATAOPER         = UD.ULTDIA '
      '       AND LO.CODDOCUMENTO     = UD.CODDOCUMENTO(+) '
      '       AND LO.IDCONTRATOIMOVEL = 7'
      '       AND (LO.FLGTIPO IS NULL OR LO.FLGTIPO <> '#39'S'#39') '
      '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL ) ABONO '
      'WHERE ( REC_DES.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) ) '
      '  AND ( REC_DES.IDCONTRATOIMOVEL = CM.IDCONTRATOIMOVEL(+) ) '
      '  AND ( REC_DES.CODDOCUMENTO     = CM.CODDOCUMENTO(+) ) '
      '  AND ( REC_DES.IDCONTRATOIMOVEL = JR.IDCONTRATOIMOVEL(+) ) '
      '  AND ( REC_DES.CODDOCUMENTO     = JR.CODDOCUMENTO(+) ) '
      '  AND ( REC_DES.IDCONTRATOIMOVEL = MT.IDCONTRATOIMOVEL(+) ) '
      '  AND ( REC_DES.CODDOCUMENTO     = MT.CODDOCUMENTO(+) ) '
      '  AND ( REC_DES.IDCONTRATOIMOVEL = ABONO.IDCONTRATOIMOVEL(+) )'
      '  AND ( REC_DES.CODDOCUMENTO     = ABONO.CODDOCUMENTO(+) ) '
      
        '  AND ( ROUND((REC_DES.TOT_RECEBER+NVL(CM.VLRACUM,0)+NVL(JR.VLRA' +
        'CUM,0)+NVL(MT.VLRACUM,0)-NVL(REC_DES.TOT_RECEBIDO,0)-NVL(ABONO.T' +
        'OT_ABONO,0)),2) <> 0) '
      '  AND REC_DES.IDMODULO         = 64'
      '  AND C.IDCONTRATOIMOVEL       = 7'
      '  AND REC_DES.IDUSUARIOSISTEMA = 3'
      'ORDER BY REC_DES.CODDOCUMENTO '
      '*/'
      ''
      ''
      ''
      '')
    ClientDataSet = cdsConciliacao
    Left = 301
    Top = 327
  end
  object cdsConciliaFeriado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 130
    Top = 328
  end
  object dsConciliaFeriado: TwwDataSource
    DataSet = cdsConciliaFeriado
    Left = 130
    Top = 343
  end
  object cdsConciliacao: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODDOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'DATAVENCIMENTO'
        DataType = ftDateTime
      end
      item
        Name = 'DATA_BAIXA'
        DataType = ftDateTime
      end
      item
        Name = 'TOT_RECEBER'
        DataType = ftFloat
      end
      item
        Name = 'TOT_RECEBIDO'
        DataType = ftFloat
      end
      item
        Name = 'FLGNAOCONCILIADO'
        DataType = ftFloat
      end
      item
        Name = 'IDCONTRATOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDCIDADES'
        DataType = ftFloat
      end
      item
        Name = 'IDPAIS'
        DataType = ftFloat
      end
      item
        Name = 'CODESTADO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'RS_FORCLI'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDFORCLI'
        DataType = ftFloat
      end
      item
        Name = 'DATALIMITE'
        DataType = ftDateTime
      end
      item
        Name = 'CONTRATO_EXTENSO'
        DataType = ftString
        Size = 83
      end
      item
        Name = 'MESCOMPETENCIA'
        DataType = ftFloat
      end
      item
        Name = 'ANOCOMPETENCIA'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPIMOVEL'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'CONMESREFREAJUSTE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'STATUS_DOC'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IDTIPOCUSTORECIMO'
        DataType = ftFloat
      end
      item
        Name = 'FLGMARCAR'
        DataType = ftFloat
      end
      item
        Name = 'CONNUMERO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TOT_ALTERADOR'
        DataType = ftFloat
      end
      item
        Name = 'CORRECAO'
        DataType = ftFloat
      end
      item
        Name = 'JUROS'
        DataType = ftFloat
      end
      item
        Name = 'MULTA'
        DataType = ftFloat
      end
      item
        Name = 'CORRECAODIF'
        DataType = ftFloat
      end
      item
        Name = 'JUROSDIF'
        DataType = ftFloat
      end
      item
        Name = 'MULTADIF'
        DataType = ftFloat
      end
      item
        Name = 'VLRATUAL'
        DataType = ftFloat
      end
      item
        Name = 'VLRDIVERG'
        DataType = ftFloat
      end
      item
        Name = 'DIFERENCA'
        DataType = ftFloat
      end
      item
        Name = 'PROPORCAO'
        DataType = ftFloat
      end
      item
        Name = 'ABONO'
        DataType = ftFloat
      end
      item
        Name = 'VLRDIVERGATUAL'
        DataType = ftFloat
      end
      item
        Name = 'TOT_CORRIGIDO'
        DataType = ftFloat
      end
      item
        Name = 'IDINDCORRECAO'
        DataType = ftFloat
      end
      item
        Name = 'CONDIASTOLERANCIA'
        DataType = ftFloat
      end
      item
        Name = 'CONDIASREPASSE'
        DataType = ftFloat
      end
      item
        Name = 'FLGTIPODIATOLERA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CONVLRMULTA'
        DataType = ftFloat
      end
      item
        Name = 'CONPERCENTMULTA'
        DataType = ftFloat
      end
      item
        Name = 'CONMOEDAMULTA'
        DataType = ftFloat
      end
      item
        Name = 'CONVLRMORA'
        DataType = ftFloat
      end
      item
        Name = 'CONMOEDAMORA'
        DataType = ftFloat
      end
      item
        Name = 'CONPERCENTMORA'
        DataType = ftFloat
      end
      item
        Name = 'FLGMORAPROPORC'
        DataType = ftFloat
      end
      item
        Name = 'CONPERMORA'
        DataType = ftFloat
      end
      item
        Name = 'A_RECEBER'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 220
    Top = 328
  end
  object dsConciliacao: TwwDataSource
    DataSet = cdsConciliacao
    Left = 220
    Top = 343
  end
  object rptConciliacao: TppReport
    AutoStop = False
    DataPipeline = ppConciliaCalculo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rptConciliacaoBeforePrint
    DeviceType = 'Screen'
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 682
    Top = 300
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppConciliaCalculo'
    object HeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26988
      mmPrintPosition = 0
      object Label11: TppLabel
        UserName = 'Label11'
        Caption = 'Conciliação de Lançamentos - Documentos Corrigidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 86784
        mmTop = 8731
        mmWidth = 110861
        BandType = 0
      end
      object Line1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 284300
        BandType = 0
      end
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 128059
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 17198
        mmWidth = 30427
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Mes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 22754
        mmTop = 22490
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Ano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 31485
        mmTop = 22490
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 40217
        mmTop = 22490
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Baixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 77523
        mmTop = 22490
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Vlr Original'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 96309
        mmTop = 22490
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Vlr Recebido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 114829
        mmTop = 22490
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Proporção'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 133615
        mmTop = 22490
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Diferença'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 266171
        mmTop = 22490
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Correção'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 150284
        mmTop = 22490
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label12'
        Caption = 'Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 168805
        mmTop = 22490
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label13'
        Caption = 'Multa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 187325
        mmTop = 22490
        mmWidth = 17727
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21431
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label15'
        Caption = 'Limite'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 59002
        mmTop = 22490
        mmWidth = 17727
        BandType = 0
      end
      object ppLogoConcilia: TppImage
        UserName = 'ppLogoConcilia'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15610
        mmLeft = 265
        mmTop = 0
        mmWidth = 15611
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label16'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 4498
        mmTop = 22490
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label101'
        Caption = 'Correção Dif.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 205846
        mmTop = 22490
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Juros Dif.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 225690
        mmTop = 22490
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Multa Dif.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 245798
        mmTop = 22490
        mmWidth = 19315
        BandType = 0
      end
    end
    object DetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppsCor: TppShape
        OnPrint = ppsCorPrint
        UserName = 'ShapeResumoFolha1'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MESCOMPETENCIA'
        DataPipeline = ppConciliaCalculo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 22754
        mmTop = 1058
        mmWidth = 7673
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'ANOCOMPETENCIA'
        DataPipeline = ppConciliaCalculo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 31485
        mmTop = 1058
        mmWidth = 7673
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DATAVENCIMENTO'
        DataPipeline = ppConciliaCalculo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 40217
        mmTop = 1058
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DATA_BAIXA'
        DataPipeline = ppConciliaCalculo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 77523
        mmTop = 1058
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'TOT_RECEBER'
        DataPipeline = ppConciliaCalculo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 96309
        mmTop = 1058
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'TOT_RECEBIDO'
        DataPipeline = ppConciliaCalculo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 114829
        mmTop = 1058
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'PROPORCAO'
        DataPipeline = ppConciliaCalculo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 133615
        mmTop = 1058
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'DIFERENCA'
        DataPipeline = ppConciliaCalculo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 266171
        mmTop = 1058
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CORRECAO'
        DataPipeline = ppConciliaCalculo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 150284
        mmTop = 1058
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'JUROS'
        DataPipeline = ppConciliaCalculo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 168805
        mmTop = 1058
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'MULTA'
        DataPipeline = ppConciliaCalculo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 187325
        mmTop = 1058
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DATALIMITE'
        DataPipeline = ppConciliaCalculo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 59002
        mmTop = 1058
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'CODDOCUMENTO'
        DataPipeline = ppConciliaCalculo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 4498
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText101'
        DataField = 'CORRECAODIF'
        DataPipeline = ppConciliaCalculo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 205846
        mmTop = 1058
        mmWidth = 19314
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'JUROSDIF'
        DataPipeline = ppConciliaCalculo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 225690
        mmTop = 1058
        mmWidth = 19314
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'MULTADIF'
        DataPipeline = ppConciliaCalculo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 245798
        mmTop = 1058
        mmWidth = 19315
        BandType = 4
      end
    end
    object FooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object Line2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object LblSistema: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 284163
        BandType = 8
      end
      object Calc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 283898
        BandType = 8
      end
      object Calc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257705
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'DIFERENCA'
        DataPipeline = ppConciliaCalculo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 266171
        mmTop = 1588
        mmWidth = 17727
        BandType = 7
      end
      object ppLabel13: TppLabel
        UserName = 'Label14'
        Caption = 'Totais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 82021
        mmTop = 1588
        mmWidth = 11906
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'CORRECAO'
        DataPipeline = ppConciliaCalculo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 149490
        mmTop = 1588
        mmWidth = 18521
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'JUROS'
        DataPipeline = ppConciliaCalculo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 168011
        mmTop = 1588
        mmWidth = 18521
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'MULTA'
        DataPipeline = ppConciliaCalculo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 186532
        mmTop = 1588
        mmWidth = 18521
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'TOT_RECEBER'
        DataPipeline = ppConciliaCalculo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 95250
        mmTop = 1588
        mmWidth = 17727
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'TOT_RECEBIDO'
        DataPipeline = ppConciliaCalculo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 113771
        mmTop = 1588
        mmWidth = 17727
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'MULTADIF'
        DataPipeline = ppConciliaCalculo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 245798
        mmTop = 1588
        mmWidth = 19315
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc9'
        DataField = 'JUROSDIF'
        DataPipeline = ppConciliaCalculo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 225690
        mmTop = 1588
        mmWidth = 19315
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'CORRECAODIF'
        DataPipeline = ppConciliaCalculo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 205846
        mmTop = 1588
        mmWidth = 19315
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CONTRATO_EXTENSO'
      DataPipeline = ppConciliaCalculo
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppConciliaCalculo'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppDBMemo1: TppDBMemo
          UserName = 'DBMemo1'
          CharWrap = False
          DataField = 'CONTRATO_EXTENSO'
          DataPipeline = ppConciliaCalculo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Stretch = True
          Transparent = True
          DataPipelineName = 'ppConciliaCalculo'
          mmHeight = 4233
          mmLeft = 0
          mmTop = 794
          mmWidth = 208227
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppConciliaCalculo: TppBDEPipeline
    DataSource = dsConciliacao
    UserName = 'ppConciliacao'
    Left = 682
    Top = 313
    object ppConciliaCalculoppField1: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField2: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField3: TppField
      FieldAlias = 'DATA_BAIXA'
      FieldName = 'DATA_BAIXA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField4: TppField
      FieldAlias = 'TOT_RECEBER'
      FieldName = 'TOT_RECEBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField5: TppField
      FieldAlias = 'TOT_RECEBIDO'
      FieldName = 'TOT_RECEBIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField6: TppField
      FieldAlias = 'FLGNAOCONCILIADO'
      FieldName = 'FLGNAOCONCILIADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField7: TppField
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField8: TppField
      FieldAlias = 'IDCIDADES'
      FieldName = 'IDCIDADES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField9: TppField
      FieldAlias = 'IDPAIS'
      FieldName = 'IDPAIS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField10: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField11: TppField
      FieldAlias = 'RS_FORCLI'
      FieldName = 'RS_FORCLI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField12: TppField
      FieldAlias = 'IDFORCLI'
      FieldName = 'IDFORCLI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField13: TppField
      FieldAlias = 'DATALIMITE'
      FieldName = 'DATALIMITE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField14: TppField
      FieldAlias = 'CONTRATO_EXTENSO'
      FieldName = 'CONTRATO_EXTENSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField15: TppField
      FieldAlias = 'MESCOMPETENCIA'
      FieldName = 'MESCOMPETENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField16: TppField
      FieldAlias = 'ANOCOMPETENCIA'
      FieldName = 'ANOCOMPETENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField17: TppField
      FieldAlias = 'CODTIPIMOVEL'
      FieldName = 'CODTIPIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField18: TppField
      FieldAlias = 'CONMESREFREAJUSTE'
      FieldName = 'CONMESREFREAJUSTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField19: TppField
      FieldAlias = 'STATUS_DOC'
      FieldName = 'STATUS_DOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField20: TppField
      FieldAlias = 'IDTIPOCUSTORECIMO'
      FieldName = 'IDTIPOCUSTORECIMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField21: TppField
      FieldAlias = 'FLGMARCAR'
      FieldName = 'FLGMARCAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField22: TppField
      FieldAlias = 'CONNUMERO'
      FieldName = 'CONNUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField23: TppField
      FieldAlias = 'TOT_ALTERADOR'
      FieldName = 'TOT_ALTERADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField24: TppField
      FieldAlias = 'CORRECAO'
      FieldName = 'CORRECAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField25: TppField
      FieldAlias = 'JUROS'
      FieldName = 'JUROS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField26: TppField
      FieldAlias = 'MULTA'
      FieldName = 'MULTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField27: TppField
      FieldAlias = 'CORRECAODIF'
      FieldName = 'CORRECAODIF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField28: TppField
      FieldAlias = 'JUROSDIF'
      FieldName = 'JUROSDIF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField29: TppField
      FieldAlias = 'MULTADIF'
      FieldName = 'MULTADIF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField30: TppField
      FieldAlias = 'VLRATUAL'
      FieldName = 'VLRATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField31: TppField
      FieldAlias = 'VLRDIVERG'
      FieldName = 'VLRDIVERG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField32: TppField
      FieldAlias = 'DIFERENCA'
      FieldName = 'DIFERENCA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField33: TppField
      FieldAlias = 'PROPORCAO'
      FieldName = 'PROPORCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField34: TppField
      FieldAlias = 'ABONO'
      FieldName = 'ABONO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField35: TppField
      FieldAlias = 'VLRDIVERGATUAL'
      FieldName = 'VLRDIVERGATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField36: TppField
      FieldAlias = 'TOT_CORRIGIDO'
      FieldName = 'TOT_CORRIGIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField37: TppField
      FieldAlias = 'IDINDCORRECAO'
      FieldName = 'IDINDCORRECAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField38: TppField
      FieldAlias = 'CONDIASTOLERANCIA'
      FieldName = 'CONDIASTOLERANCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField39: TppField
      FieldAlias = 'CONDIASREPASSE'
      FieldName = 'CONDIASREPASSE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField40: TppField
      FieldAlias = 'FLGTIPODIATOLERA'
      FieldName = 'FLGTIPODIATOLERA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField41: TppField
      FieldAlias = 'CONVLRMULTA'
      FieldName = 'CONVLRMULTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField42: TppField
      FieldAlias = 'CONPERCENTMULTA'
      FieldName = 'CONPERCENTMULTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField43: TppField
      FieldAlias = 'CONMOEDAMULTA'
      FieldName = 'CONMOEDAMULTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField44: TppField
      FieldAlias = 'CONVLRMORA'
      FieldName = 'CONVLRMORA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField45: TppField
      FieldAlias = 'CONMOEDAMORA'
      FieldName = 'CONMOEDAMORA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField46: TppField
      FieldAlias = 'CONPERCENTMORA'
      FieldName = 'CONPERCENTMORA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField47: TppField
      FieldAlias = 'FLGMORAPROPORC'
      FieldName = 'FLGMORAPROPORC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField48: TppField
      FieldAlias = 'CONPERMORA'
      FieldName = 'CONPERMORA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppConciliaCalculoppField49: TppField
      FieldAlias = 'A_RECEBER'
      FieldName = 'A_RECEBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
  end
  object Query1: TQuery
    SQL.Strings = (
      '// SELECT PRINCIPAL'
      
        'SELECT REC_DES.CODDOCUMENTO, REC_DES.MESCOMPETENCIA, REC_DES.ANO' +
        'COMPETENCIA, REC_DES.DATAVENCIMENTO,'
      
        '       REC_DES.DATA_BAIXA, REC_DES.DATALIMITE, REC_DES.TOT_RECEB' +
        'ER, REC_DES.TOT_RECEBIDO,'
      
        '       ROUND((REC_DES.TOT_RECEBER+NVL(CM.VLRACUM,0)+NVL(JR.VLRAC' +
        'UM,0)+NVL(MT.VLRACUM,0))-NVL(REC_DES.TOT_RECEBIDO,0),2) AS DIFER' +
        'ENCA,'
      
        '       NVL(CM.VLRACUM,0) AS CORRECAO, NVL(JR.VLRACUM,0) AS JUROS' +
        ', NVL(MT.VLRACUM,0) AS MULTA,'
      
        '       C.IDCONTRATOIMOVEL, C.CONNUMERO AS NUMERO_CONTRATO, C.CON' +
        'NOME AS NOME_CONTRATO, C.CONMESREFREAJUSTE,'
      
        '       C.IDINDCORRECAO, C.IDCIDADES, C.IDPAIS, C.CODESTADO, C.CO' +
        'NDIASTOLERANCIA, C.CONDIASREPASSE, C.IDFORCLI,'
      
        '       C.FLGTIPODIATOLERA, C.CONVLRMULTA, C.CONPERCENTMULTA, C.C' +
        'ONMOEDAMULTA, C.CONVLRMORA, C.CONMOEDAMORA,'
      
        '       C.CONPERCENTMORA, C.FLGMORAPROPORC, C.CONPERMORA, (C.CONN' +
        'UMERO||'#39' - '#39'||C.CONNOME) AS CONTRATO_EXTENSO'
      'FROM CONTRATOIMOVEL C,'
      ''
      '   // REC_DES - INÍCIO'
      
        '   ( SELECT LI.CODDOCUMENTO, LI.IDCONTRATOIMOVEL, LI.MESCOMPETEN' +
        'CIA, LI.ANOCOMPETENCIA, LI.DATALIMITE, LI.DATAVENCIMENTO,'
      
        '            LI.IDMODULO, LI.IDUSUARIOSISTEMA, LI.IDFORCLI, LI.FL' +
        'GORIGEMLANC,'
      '            LI.TRGDTINCLUSAO,'
      '            SUM('
      
        '                DECODE(RTRIM(LD.OPERACAO),'#39'1'#39',DECODE(D.RECPAG,'#39'R' +
        #39',DECODE(LD.DEBCRE,'#39'D'#39',LI.VLRLANCRECEB,LI.VLRLANCRECEB*(-1)),0),' +
        '0)+'
      
        '                DECODE(RTRIM(LD.OPERACAO),'#39'2'#39',DECODE(D.RECPAG,'#39'R' +
        #39',DECODE(LD.DEBCRE,'#39'D'#39',LI.VLRLANCRECEB,LI.VLRLANCRECEB*(-1)),0),' +
        '0)+'
      
        '                DECODE(RTRIM(LD.OPERACAO),'#39'3'#39',DECODE(D.RECPAG,'#39'R' +
        #39',DECODE(LD.DEBCRE,'#39'D'#39',LI.VLRLANCRECEB,LI.VLRLANCRECEB*(-1)),0),' +
        '0)+'
      
        '                DECODE(RTRIM(LD.OPERACAO),'#39'4'#39',DECODE(D.RECPAG,'#39'R' +
        #39',DECODE(LD.DEBCRE,'#39'D'#39',LD.VALOR*LI.VLRLANCRECEB/TRD.VALOR,LD.VAL' +
        'OR*(-1)*LI.VLRLANCRECEB/TRD.VALOR),0),0)'
      '               ) AS TOT_RECEBER,'
      
        '            SUM(DECODE(RTRIM(LD.OPERACAO),'#39'5'#39',DECODE(D.RECPAG,'#39'R' +
        #39',DECODE(LD.DEBCRE,'#39'C'#39',LD.VALOR*LI.VLRLANCRECEB/TRD.VALOR,LD.VAL' +
        'OR*(-1)*LI.VLRLANCRECEB/TRD.VALOR),0),0)) AS TOT_RECEBIDO,'
      
        '            MAX(DECODE(LI.FLGIMPORTADO,'#39'1'#39',LI.DATAVENCIMENTO,DEC' +
        'ODE(RTRIM(D.STATUS),'#39'2'#39',BX.DATABAIXA,NULL))) AS DATA_BAIXA'
      
        '     FROM DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL LI, TIP' +
        'OIMOVEL T, CONTRATOIMOVEL C,'
      ''
      ''
      '        ( SELECT CODDOCUMENTO, VALOR'
      '          FROM LANCTODOCUM'
      
        '          WHERE RTRIM(OPERACAO) = '#39'1'#39' OR RTRIM(OPERACAO) = '#39'2'#39' O' +
        'R RTRIM(OPERACAO) = '#39'3'#39') TRD,'
      ''
      ''
      '        ( SELECT D.CODDOCUMENTO, MAX(RP.DATABAIXA) AS DATABAIXA'
      '          FROM DOCUMENTO D, RECBTOPAGTO RP'
      '          WHERE ( D.IDMODULO = 64 )'
      '            AND ( D.CODDOCUMENTO = RP.CODDOCUMENTO )'
      '          GROUP BY D.CODDOCUMENTO ) BX'
      ''
      ''
      '     WHERE ( LI.CODDOCUMENTO   = D.CODDOCUMENTO )'
      
        '       AND ( LD.DATALANCTO    <= TO_DATE( '#39'18/08/2006'#39','#39'DD/MM/YY' +
        'YY'#39') )'
      
        '       AND ( C.FLGTIPOCONTRATO = '#39'L'#39' OR LI.IDCONTRATOIMOVEL IS N' +
        'ULL )'
      '       AND ( LD.ESTORNO IS NULL )'
      '       AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) )'
      '       AND ( D.CODDOCUMENTO      = LD.CODDOCUMENTO )'
      '       AND ( D.CODDOCUMENTO      = TRD.CODDOCUMENTO )'
      '       AND ( LI.CODTIPIMOVEL     = T.CODTIPIMOVEL )'
      
        '       AND ( (LD.CODALTERADOR IS NULL) OR (LD.CODALTERADOR IN(T.' +
        'CODALTMULTA,T.CODALTJUROS,T.CODALTCORRMON)'
      '       AND LD.DATALANCTO < TO_DATE('#39'31/12/2004'#39','#39'DD/MM/YYYY'#39')'
      
        '       AND NOT EXISTS ( SELECT 1 FROM LANCOPERDIAIMOB WHERE CODD' +
        'OCUMENTO = LD.CODDOCUMENTO AND (FLGTIPO IS NULL OR FLGTIPO <> '#39'S' +
        #39') ) ) OR (LD.CODALTERADOR <> NVL(T.CODALTMULTA,0)'
      '       AND LD.CODALTERADOR <> NVL(T.CODALTJUROS,0)'
      '       AND LD.CODALTERADOR <> NVL(T.CODALTCORRMON,0)) )'
      
        '       AND ( (LI.DATALIMITE IS NOT NULL AND LI.DATALIMITE <= TO_' +
        'DATE( '#39'18/08/2006'#39','#39'DD/MM/YYYY'#39')) OR'
      
        '             (LI.DATALIMITE IS NULL AND LI.DATAVENCIMENTO <= TO_' +
        'DATE( '#39'18/08/2006'#39','#39'DD/MM/YYYY'#39')) )'
      
        '     GROUP BY LI.IDCONTRATOIMOVEL, LI.CODDOCUMENTO, LI.MESCOMPET' +
        'ENCIA, LI.ANOCOMPETENCIA, LI.DATALIMITE,'
      
        '              LI.DATAVENCIMENTO, LI.IDMODULO, LI.IDUSUARIOSISTEM' +
        'A, LI.IDFORCLI, LI.FLGORIGEMLANC, LI.TRGDTINCLUSAO,'
      '              LI.FLGIMPORTADO, D.STATUS ) REC_DES,'
      '   // REC_DES - FIM'
      ''
      '   // CORREÇÃO - INÍCIO'
      
        '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO,' +
        ' SUM(LO.VLRACUM) AS VLRACUM'
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,'
      '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA'
      '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2'
      '          WHERE LO2.IDOPERACAO  = PI2.IDOPERATUALCM'
      
        '            AND LO2.DATAOPER   <= TO_DATE( '#39'18/08/2006'#39','#39'DD/MM/Y' +
        'YYY'#39')'
      '            AND (LO2.FLGTIPO IS NULL OR LO2.FLGTIPO <> '#39'S'#39')'
      '          GROUP BY LO2.CODDOCUMENTO ) UD'
      '     WHERE LO.IDOPERACAO       = PI.IDOPERATUALCM'
      '       AND LO.DATAOPER         = UD.ULTDIA'
      '       AND LO.CODDOCUMENTO     = UD.CODDOCUMENTO(+)'
      '       AND LO.IDCONTRATOIMOVEL = 2648'
      '       AND (LO.FLGTIPO IS NULL OR LO.FLGTIPO <> '#39'S'#39' )'
      
        '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACA' +
        'O ) CM,'
      '   // CORREÇÃO - FIM'
      ''
      '   // JUROS - INÍCIO'
      
        '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO,' +
        ' SUM(LO.VLRACUM) AS VLRACUM'
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,'
      '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA'
      '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2'
      '          WHERE LO2.IDOPERACAO  = PI2.IDOPERATUALJUROS'
      
        '            AND LO2.DATAOPER   <= TO_DATE( '#39'18/08/2006'#39','#39'DD/MM/Y' +
        'YYY'#39')'
      '            AND (LO2.FLGTIPO IS NULL OR LO2.FLGTIPO <> '#39'S'#39')'
      '          GROUP BY LO2.CODDOCUMENTO ) UD'
      '     WHERE LO.IDOPERACAO       = PI.IDOPERATUALJUROS'
      '       AND LO.DATAOPER         = UD.ULTDIA'
      '       AND LO.CODDOCUMENTO     = UD.CODDOCUMENTO(+)'
      '       AND LO.IDCONTRATOIMOVEL = 2648'
      '       AND (LO.FLGTIPO IS NULL OR LO.FLGTIPO <> '#39'S'#39')'
      
        '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACA' +
        'O ) JR,'
      '   // JUROS - FIM'
      ''
      '   // MULTA - INÍCIO'
      
        '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO,' +
        ' SUM(LO.VLRACUM) AS VLRACUM'
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,'
      '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA'
      '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2'
      '          WHERE LO2.IDOPERACAO  = PI2.IDOPERATUALMULTA'
      
        '            AND LO2.DATAOPER   <= TO_DATE( '#39'18/08/2006'#39','#39'DD/MM/Y' +
        'YYY'#39')'
      '            AND (LO2.FLGTIPO IS NULL OR LO2.FLGTIPO <> '#39'S'#39')'
      '          GROUP BY LO2.CODDOCUMENTO ) UD'
      '     WHERE LO.IDOPERACAO       = PI.IDOPERATUALMULTA'
      '       AND LO.DATAOPER         = UD.ULTDIA'
      '       AND LO.CODDOCUMENTO     = UD.CODDOCUMENTO(+)'
      '       AND LO.IDCONTRATOIMOVEL = 2648'
      '       AND (LO.FLGTIPO IS NULL OR LO.FLGTIPO <> '#39'S'#39')'
      
        '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACA' +
        'O ) MT'
      '   // MULTA - FIM'
      ''
      ''
      '// CONDIÇÃO DA QUERY PRINCIPAL'
      'WHERE ( REC_DES.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) )'
      '  AND ( REC_DES.IDCONTRATOIMOVEL = CM.IDCONTRATOIMOVEL(+) )'
      '  AND ( REC_DES.CODDOCUMENTO     = CM.CODDOCUMENTO(+) )'
      '  AND ( REC_DES.IDCONTRATOIMOVEL = JR.IDCONTRATOIMOVEL(+) )'
      '  AND ( REC_DES.CODDOCUMENTO     = JR.CODDOCUMENTO(+) )'
      '  AND ( REC_DES.IDCONTRATOIMOVEL = MT.IDCONTRATOIMOVEL(+) )'
      '  AND ( REC_DES.CODDOCUMENTO     = MT.CODDOCUMENTO(+) )'
      
        '  AND ( ROUND((REC_DES.TOT_RECEBER+NVL(CM.VLRACUM,0)+NVL(JR.VLRA' +
        'CUM,0)+NVL(MT.VLRACUM,0)-NVL(REC_DES.TOT_RECEBIDO,0)),2)>0)'
      '  AND REC_DES.IDMODULO         = 64'
      '  AND C.IDCONTRATOIMOVEL       = 2648'
      '  AND REC_DES.IDUSUARIOSISTEMA = 751869'
      
        '  AND REC_DES.TRGDTINCLUSAO BETWEEN TO_DATE('#39'01/01/2000'#39','#39'DD/MM/' +
        'YYYY'#39') AND TO_DATE('#39'01/08/2006'#39','#39'DD/MM/YYYY'#39')'
      'ORDER BY REC_DES.CODDOCUMENTO'
      '// FIM'
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
      ''
      ''
      '// SELECT PRINCIPAL'
      'SELECT C.IDCONTRATOIMOVEL,'
      
        '       DECODE(C.IDCONTRATOIMOVEL,NULL,'#39'RECEITA SEM CONTRATO'#39',C.C' +
        'ONNUMERO) AS NUMERO_CONTRATO,'
      
        '       DECODE(C.IDCONTRATOIMOVEL,NULL,'#39'RECEITA SEM CONTRATO'#39',C.C' +
        'ONNOME) AS NOME_CONTRATO,'
      '       DD.CODDOCUMENTO, DD.TOT_RECEBER, DD.RECEBIDO,'
      
        '       CM.VLRACUM AS CORRECAO, JR.VLRACUM AS JUROS, MT.VLRACUM A' +
        'S MULTA,'
      
        '       ROUND((DD.TOT_RECEBER-DD.RECEBIDO)+DECODE(CM.VLRACUM,NULL' +
        ',0,CM.VLRACUM)+DECODE(JR.VLRACUM,NULL,0,JR.VLRACUM)+DECODE(MT.VL' +
        'RACUM,NULL,0,MT.VLRACUM),2) AS TOTAL,'
      
        '      (DD.MESCOMPETENCIA||'#39'/'#39'||DD.ANOCOMPETENCIA) AS COMPETENCIA' +
        ','
      
        '       ROUND(TO_DATE('#39'20/08/2006'#39','#39'DD/MM/YYYY'#39')-DD.DATAVENCIMENT' +
        'O,0) AS DIAS,'
      
        '       DD.DATAVENCIMENTO, C.CONDATAINICIO, C.CONDATAFIM, C.IDLOC' +
        'ATARIO, PL.NOME AS NF_LOCATARIO,'
      '       PL.RAZAOSOCIAL AS RS_LOCATARIO, C.IDADMINIMOVEL'
      'FROM PESSOA PL, PESSOA PA, CONTRATOIMOVEL C,'
      ''
      ''
      '   // DD - INÍCIO'
      
        '   ( SELECT LI.CODDOCUMENTO, LI.IDCONTRATOIMOVEL, LI.MESCOMPETEN' +
        'CIA, LI.ANOCOMPETENCIA, LI.DATALIMITE, LI.DATAVENCIMENTO,'
      '            LI.CODTIPIMOVEL, LI.IDTIPOCUSTORECIMO,'
      '            SUM('
      
        '                DECODE(RTRIM(LD.OPERACAO),'#39'1'#39',DECODE(D.RECPAG,'#39'R' +
        #39',DECODE(LD.DEBCRE,'#39'D'#39',LI.VLRLANCRECEB,LI.VLRLANCRECEB*(-1)),0),' +
        '0)+'
      
        '                DECODE(RTRIM(LD.OPERACAO),'#39'2'#39',DECODE(D.RECPAG,'#39'R' +
        #39',DECODE(LD.DEBCRE,'#39'D'#39',LI.VLRLANCRECEB,LI.VLRLANCRECEB*(-1)),0),' +
        '0)+'
      
        '                DECODE(RTRIM(LD.OPERACAO),'#39'3'#39',DECODE(D.RECPAG,'#39'R' +
        #39',DECODE(LD.DEBCRE,'#39'D'#39',LI.VLRLANCRECEB,LI.VLRLANCRECEB*(-1)),0),' +
        '0)+'
      
        '                DECODE(RTRIM(LD.OPERACAO),'#39'4'#39',DECODE(D.RECPAG,'#39'R' +
        #39',DECODE(LD.DEBCRE,'#39'D'#39',LD.VALOR*LI.VLRLANCRECEB/TRD.VALOR,LD.VAL' +
        'OR*(-1)*LI.VLRLANCRECEB/TRD.VALOR),0),0)'
      '               ) AS TOT_RECEBER,'
      
        '            SUM( DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG' +
        ', '#39'R'#39', LD.VALOR, 0), 0) * LI.VLRLANCRECEB / TRD.VALOR ) AS RECEB' +
        'IDO'
      
        '     FROM DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL LI, TIP' +
        'OIMOVEL T, CONTRATOIMOVEL C,'
      ''
      '        ( SELECT CODDOCUMENTO, VALOR'
      '          FROM LANCTODOCUM'
      
        '          WHERE RTRIM(OPERACAO) = '#39'1'#39' OR RTRIM(OPERACAO) = '#39'2'#39' O' +
        'R RTRIM(OPERACAO) = '#39'3'#39') TRD'
      ''
      
        '     WHERE ( C.FLGTIPOCONTRATO = '#39'L'#39' OR LI.IDCONTRATOIMOVEL IS N' +
        'ULL )'
      '       AND ( LD.ESTORNO IS NULL )'
      
        '       AND ( LD.DATALANCTO <= TO_DATE('#39'20/08/2006'#39', '#39'DD/MM/YYYY'#39 +
        ') )'
      '       AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )'
      '       AND ( D.CODDOCUMENTO  = LD.CODDOCUMENTO )'
      '       AND ( D.CODDOCUMENTO  = TRD.CODDOCUMENTO )'
      '       AND ( LI.CODTIPIMOVEL = T.CODTIPIMOVEL )'
      '       AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) )'
      '       AND ( (LD.CODALTERADOR IS NULL) OR'
      
        '             (LD.CODALTERADOR IN(T.CODALTMULTA, T.CODALTJUROS, T' +
        '.CODALTCORRMON)'
      '       AND LD.DATALANCTO < TO_DATE('#39'31/12/2004'#39','#39'DD/MM/YYYY'#39')'
      
        '       AND NOT EXISTS ( SELECT 1 FROM LANCOPERDIAIMOB WHERE CODD' +
        'OCUMENTO = LD.CODDOCUMENTO AND (FLGTIPO IS NULL OR FLGTIPO <> '#39'S' +
        #39')) ) OR'
      '           (LD.CODALTERADOR <> NVL(T.CODALTMULTA,0) AND'
      '            LD.CODALTERADOR <> NVL(T.CODALTJUROS,0) AND'
      '            LD.CODALTERADOR <> NVL(T.CODALTCORRMON,0)) )'
      
        '     GROUP BY LI.CODDOCUMENTO, LI.IDCONTRATOIMOVEL, LI.MESCOMPET' +
        'ENCIA, LI.ANOCOMPETENCIA, LI.DATAVENCIMENTO,'
      
        '              LI.DATALIMITE,   LI.CODTIPIMOVEL,     LI.IDTIPOCUS' +
        'TORECIMO ) DD,'
      '   // DD - FIM'
      ''
      '   // CORREÇÃO - INÍCIO'
      
        '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO,' +
        ' SUM(LO.VLRACUM) AS VLRACUM'
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,'
      '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA'
      '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2'
      
        '          WHERE LO2.IDOPERACAO = PI2.IDOPERATUALCM AND (FLGTIPO ' +
        'IS NULL OR FLGTIPO <> '#39'S'#39')'
      
        '            AND ( LO2.DATAOPER <= TO_DATE('#39'20/08/2006'#39', '#39'DD/MM/Y' +
        'YYY'#39') )'
      '          GROUP BY LO2.CODDOCUMENTO ) UD'
      '     WHERE LO.IDOPERACAO   = PI.IDOPERATUALCM'
      
        '       AND LO.DATAOPER     = UD.ULTDIA AND (FLGTIPO IS NULL OR F' +
        'LGTIPO <> '#39'S'#39')'
      '       AND LO.CODDOCUMENTO = UD.CODDOCUMENTO(+)'
      '       AND LO.IDCONTRATOIMOVEL = 2648'
      
        '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACA' +
        'O ) CM,'
      '   // CORREÇÃO - FIM'
      ''
      '   // JUROS - INÍCIO'
      
        '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO,' +
        ' SUM(LO.VLRACUM) AS VLRACUM'
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,'
      '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA'
      '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2'
      
        '          WHERE LO2.IDOPERACAO = PI2.IDOPERATUALJUROS AND (FLGTI' +
        'PO IS NULL OR FLGTIPO <> '#39'S'#39')'
      
        '            AND ( LO2.DATAOPER <= TO_DATE('#39'20/08/2006'#39', '#39'DD/MM/Y' +
        'YYY'#39') )'
      '          GROUP BY LO2.CODDOCUMENTO ) UD'
      '     WHERE LO.IDOPERACAO   = PI.IDOPERATUALJUROS'
      
        '       AND LO.DATAOPER     = UD.ULTDIA AND (FLGTIPO IS NULL OR F' +
        'LGTIPO <> '#39'S'#39')'
      '       AND LO.CODDOCUMENTO = UD.CODDOCUMENTO (+)'
      
        '       AND LO.IDCONTRATOIMOVEL = 2648    GROUP BY LO.CODDOCUMENT' +
        'O, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO ) JR,'
      '   // JUROS - FIM'
      ''
      '   // MULTA - INÍCIO'
      
        '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO,' +
        ' SUM(LO.VLRACUM) AS VLRACUM'
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,'
      '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA'
      '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2'
      
        '          WHERE LO2.IDOPERACAO = PI2.IDOPERATUALMULTA AND (FLGTI' +
        'PO IS NULL OR FLGTIPO <> '#39'S'#39')'
      
        '            AND ( LO2.DATAOPER <= TO_DATE('#39'20/08/2006'#39', '#39'DD/MM/Y' +
        'YYY'#39') )'
      '          GROUP BY LO2.CODDOCUMENTO ) UD'
      '     WHERE LO.IDOPERACAO   = PI.IDOPERATUALMULTA'
      
        '       AND LO.DATAOPER     = UD.ULTDIA AND (FLGTIPO IS NULL OR F' +
        'LGTIPO <> '#39'S'#39')'
      '       AND LO.CODDOCUMENTO = UD.CODDOCUMENTO (+)'
      '       AND LO.IDCONTRATOIMOVEL = 2648'
      
        '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACA' +
        'O ) MT'
      '   // MULTA - FIM'
      ''
      '// CONDIÇÃO DA QUERY PRINCIPAL'
      'WHERE ( C.IDLOCATARIO        = PL.IDPESSOA(+) )'
      '  AND ( C.IDADMINIMOVEL      = PA.IDPESSOA(+) )'
      '  AND ( DD.IDCONTRATOIMOVEL  = C.IDCONTRATOIMOVEL(+) )'
      '  AND ( DD.CODDOCUMENTO      = CM.CODDOCUMENTO (+) )'
      '  AND ( DD.IDCONTRATOIMOVEL  = CM.IDCONTRATOIMOVEL (+) )'
      '  AND ( DD.CODDOCUMENTO      = JR.CODDOCUMENTO (+) )'
      '  AND ( DD.IDCONTRATOIMOVEL  = JR.IDCONTRATOIMOVEL (+) )'
      '  AND ( DD.CODDOCUMENTO      = MT.CODDOCUMENTO (+) )'
      '  AND ( DD.IDCONTRATOIMOVEL  = MT.IDCONTRATOIMOVEL (+) )'
      
        '  AND ( ROUND((DD.TOT_RECEBER + NVL(CM.VLRACUM,0) + NVL(JR.VLRAC' +
        'UM,0) + NVL(MT.VLRACUM,0) - DD.RECEBIDO),2) <> 0 )'
      
        '  AND ( (DD.DATALIMITE IS NOT NULL AND DD.DATALIMITE <= TO_DATE(' +
        #39'20/08/2006'#39', '#39'DD/MM/YYYY'#39')) OR'
      
        '        (DD.DATALIMITE IS NULL AND DD.DATAVENCIMENTO <= TO_DATE(' +
        #39'20/08/2006'#39', '#39'DD/MM/YYYY'#39')) )'
      '  AND ( C.IDCONTRATOIMOVEL = 2648 )'
      
        'ORDER BY C.CONNUMERO, PL.NOME, DD.DATAVENCIMENTO, COMPETENCIA, D' +
        'D.CODDOCUMENTO'
      '// FIM')
    Left = 701
    Top = 15
  end
  object CrmRptCM: TCmRptManager
    IdUsuario = 0
    IdModulo = 0
    DeviceType = rdtScreen
    ShowPrintDialog = True
    ShowCancelDialog = True
    Report = rptConciliacao
    ConnectionType = cntADO
    Left = 675
    Top = 256
  end
end
