inherited frmConcilia: TfrmConcilia
  Left = 186
  Top = 273
  HelpContext = 640012
  Caption = 'Conciliação de Lançamentos'
  ClientHeight = 437
  ClientWidth = 787
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 787
    Height = 355
    inherited lblTitulo: TfcLabel
      Width = 392
      Caption = 'Conciliação de Lançamentos [Seleção]'
    end
    object ntbPrincipal: TNotebook
      Left = 0
      Top = 34
      Width = 787
      Height = 321
      Align = alBottom
      PageIndex = 2
      TabOrder = 0
      OnPageChanged = ntbPrincipalPageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagSelecao'
        object btnContinuaSelecao: TfcShapeBtn
          Left = 680
          Top = 283
          Width = 89
          Height = 29
          Caption = 'Continuar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F88888888887F887FBBBBB0BBBB088878888887F88878F7FBBBBBB00BB
            BB087F88FFFF77F8887F7FB00000000BBB087F877777777F887F7FB000000000
            BB087F8777777777887F7FB00000000BBB087F8777777778887F7FBBBBBB00BB
            BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
            8888888778FFFF77888888888777778888888888877777888888}
          Layout = blGlyphRight
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 1
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuaSelecaoClick
        end
        inline MolUsuario1: TMolUsuario
          Left = 8
          Top = 8
        end
        object grpCompetencia: TGroupBox
          Left = 304
          Top = 160
          Width = 257
          Height = 57
          Caption = ' Mês de Competência '
          TabOrder = 7
          object DBspnAnoCompetencia: TwwDBSpinEdit
            Left = 164
            Top = 24
            Width = 65
            Height = 21
            Increment = 1
            MaxValue = 2050
            MinValue = 1980
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object cboMesCompetencia: TComboBox
            Left = 16
            Top = 24
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
        end
        object grpDatas: TGroupBox
          Left = 16
          Top = 160
          Width = 257
          Height = 49
          Caption = ' Período de Datas '
          TabOrder = 5
          object Label5: TLabel
            Left = 124
            Top = 24
            Width = 8
            Height = 13
            Caption = 'a'
          end
          object edtDataIni: TCMDateTimePicker
            Left = 16
            Top = 20
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
            Left = 144
            Top = 20
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
        object rdgTipoData: TRadioGroup
          Left = 16
          Top = 220
          Width = 257
          Height = 61
          Caption = ' Tipo de Datas '
          Columns = 2
          ItemIndex = 2
          Items.Strings = (
            'de Inclusão'
            'de Lançamento'
            'de Vencimento')
          TabOrder = 6
          TabStop = True
        end
        object chkCompetencia: TCheckBox
          Left = 304
          Top = 228
          Width = 225
          Height = 17
          Caption = 'NÃO levar em conta a competência'
          Checked = True
          State = cbChecked
          TabOrder = 8
        end
        inline molContrato1: TmolContrato
          Left = 8
          Top = 56
          TabOrder = 2
        end
        inline molOrigemLanc1: TmolOrigemLanc
          Left = 399
          Top = 52
          Width = 321
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
        inline molCliente1: TmolCliente
          Left = 8
          Top = 104
          Width = 769
          TabOrder = 4
          inherited btnBuscaCli: TBitBtn
            Left = 704
          end
          inherited btnLimpaCli: TBitBtn
            Left = 728
          end
          inherited edtNomeFantasia: TEdit
            Width = 273
          end
          inherited edtRazaoSocial: TEdit
            Left = 280
            Width = 425
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagLancamentos'
        object lblLancamentos: TLabel
          Left = 655
          Top = 255
          Width = 113
          Height = 13
          Alignment = taRightJustify
          Caption = 'Lançamento(s): 753'
        end
        object btnVoltar: TfcShapeBtn
          Left = 584
          Top = 283
          Width = 89
          Height = 29
          Caption = 'Voltar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F8888F888887F887FBBB0BBBBBB0888788887F8888878F7FBBB00BBBBB
            BB087F88877FFFFFF87F7FBB00000000BB087F8877777777F87F7FB000000000
            BB087F8777777777F87F7FBB00000000BB087F8877777777887F7FBBB00BBBBB
            BB0878F8877F8888887887FBBB0BBBBBB08887F88878888887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 1
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnVoltarClick
        end
        object btnContinuarLanc: TfcShapeBtn
          Left = 680
          Top = 283
          Width = 89
          Height = 29
          Caption = 'Continuar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F88888888887F887FBBBBB0BBBB088878888887F88878F7FBBBBBB00BB
            BB087F88FFFF77F8887F7FB00000000BBB087F877777777F887F7FB000000000
            BB087F8777777777887F7FB00000000BBB087F8777777778887F7FBBBBBB00BB
            BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
            8888888778FFFF77888888888777778888888888877777888888}
          Layout = blGlyphRight
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 0
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuarLancClick
        end
        object dbGrdData: TwwDBGrid
          Left = 16
          Top = 34
          Width = 753
          Height = 212
          Selected.Strings = (
            'CONTRATO_EXTENSO'#9'48'#9'Contrato'#9'F'
            'MESCOMPETENCIA'#9'6'#9'Mês'#9'F'
            'ANOCOMPETENCIA'#9'7'#9'Ano'#9'F'
            'DATAVENCIMENTO'#9'13'#9'Vencimento'#9'F'
            'DATALIMITE'#9'13'#9'Limite'#9'F'
            'DATA_BAIXA'#9'12'#9'Baixa'#9'F'
            'DIF'#9'9'#9'Dif. Dias'#9'F'
            'TOT_RECEBER'#9'12'#9'Vlr Original'#9'F'
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
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgPerfectRowFit, dgMultiSelect]
          ParentFont = False
          TabOrder = 2
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
          IndicatorColor = icBlack
          OnTopRowChanged = dbGrdDataTopRowChanged
        end
        object Panel5: TPanel
          Left = 16
          Top = 8
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
          TabOrder = 3
        end
        object btnAbonaData: TfcShapeBtn
          Left = 16
          Top = 283
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
          TabOrder = 4
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnAbonaDataClick
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'pgcReembolso'
        object lblCalculo: TLabel
          Left = 712
          Top = 255
          Width = 56
          Height = 13
          Alignment = taRightJustify
          Caption = 'lblCalculo'
        end
        object Panel3: TPanel
          Left = 16
          Top = 8
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
        object fcShapeBtn4: TfcShapeBtn
          Left = 584
          Top = 283
          Width = 89
          Height = 29
          Caption = 'Voltar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F8888F888887F887FBBB0BBBBBB0888788887F8888878F7FBBB00BBBBB
            BB087F88877FFFFFF87F7FBB00000000BB087F8877777777F87F7FB000000000
            BB087F8777777777F87F7FBB00000000BB087F8877777777887F7FBBB00BBBBB
            BB0878F8877F8888887887FBBB0BBBBBB08887F88878888887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 1
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = fcShapeBtn4Click
        end
        object dbGrdValor: TwwDBGrid
          Left = 16
          Top = 34
          Width = 752
          Height = 212
          Selected.Strings = (
            'CONTRATO_EXTENSO'#9'39'#9'Contrato'#9'F'
            'MESCOMPETENCIA'#9'5'#9'Mês'#9'F'
            'ANOCOMPETENCIA'#9'6'#9'Ano'#9'F'
            'DATAVENCIMENTO'#9'10'#9'Vencto'#9'F'
            'DATALIMITE'#9'10'#9'Limite'#9'F'
            'DATA_BAIXA'#9'10'#9'Baixa'#9'F'
            'TOT_RECEBER'#9'12'#9'Vlr Original'#9'F'
            'TOT_RECEBIDO'#9'15'#9'Vlr Recebido'#9'F'
            'VC'#9'15'#9'Vlr Corrigido'#9'F'
            'DIFERENCA'#9'12'#9'Diferença'#9'F'
            'VLRCORRECAOMON'#9'10'#9'Correção'#9'F'
            'VLRJUROS'#9'10'#9'Juros'#9'F'
            'VLRMULTA'#9'10'#9'Multa'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsConciliaCalculo
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgPerfectRowFit, dgMultiSelect]
          ParentFont = False
          TabOrder = 2
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = dbGrdValorCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = dbGrdValorTopRowChanged
        end
        object btnAbonaDif: TfcShapeBtn
          Left = 16
          Top = 283
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
          TabOrder = 3
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnAbonaDifClick
        end
        object btnCobranca: TfcShapeBtn
          Left = 112
          Top = 283
          Width = 89
          Height = 29
          Caption = 'Cobrança'
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
          TabOrder = 4
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnCobrancaClick
        end
        object btnDiferenca: TfcShapeBtn
          Left = 208
          Top = 251
          Width = 89
          Height = 29
          Caption = 'Diferença'
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
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888009191900
            88888887788888778F88887991919191088888788888888878F8879919191919
            108887F88888888887F88791919191919088878888888888878F791919191919
            19087F88FFFFFFFFF87F79988888888891087F8777777777F87F791FFFFFFFF8
            19087F8777777777F87F799FFFFFFFF891087F8777777777887F791919191919
            190878F8888888888878879191919191908887F88888888887F8879919191919
            1088878F88888888878888799191919108888878FF88888F7888888779999977
            8888888778FFFF77888888888777778888888888877777888888}
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
          Visible = False
        end
        object btnConsulta: TfcShapeBtn
          Left = 208
          Top = 283
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
          TabOrder = 6
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnConsultaClick
        end
        object btnImprime: TfcShapeBtn
          Left = 304
          Top = 283
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
          TabOrder = 7
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnImprimeClick
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 404
    Width = 787
  end
  inherited Panel2: TPanel
    Top = 355
    Width = 787
    inherited lblContador: TLabel
      Left = 668
    end
    inherited ProgressBar: TProgressBar
      Width = 745
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  object qryUpdConciliaNormal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE DOCUMENTO'
      'SET FLGNAOCONCILIADO = NULL'
      'WHERE CODDOCUMENTO IN'
      '('
      '   SELECT DISTINCT'
      '      V.CODDOCUMENTO'
      ''
      '   FROM'
      '      VWLANCAMENTO V'
      ''
      '   WHERE'
      '      ( V.IDMODULO = 64 )'
      '      AND ( V.STATUS_DOC = '#39'2'#39' )'
      '      AND ( V.FLGNAOCONCILIADO = 1 )'
      '      AND ( V.RECPAG = '#39'R'#39' )'
      '      AND ( V.DATAVENCIMENTO >= V.DATA_BAIXA )'
      '      AND ( V.TOT_RECEBER = V.TOT_RECEBIDO )'
      
        '      AND ( (:PIDUSUARIOSISTEMA IS NULL) OR (V.IDUSUARIOSISTEMA ' +
        '= :PIDUSUARIOSISTEMA) )'
      
        '      AND ( (:PIDCONTRATOIMOVEL IS NULL) OR (V.IDCONTRATOIMOVEL ' +
        '= :PIDCONTRATOIMOVEL) )'
      '      AND ( (:PIDFORCLI IS NULL) OR (V.IDFORCLI = :PIDFORCLI) )'
      
        '      AND ( (:PMESCOMPETENCIA IS NULL) OR ((MESCOMPETENCIA = :PM' +
        'ESCOMPETENCIA) AND (ANOCOMPETENCIA = :PANOCOMPETENCIA)) )'
      
        '      AND ( (:PFLGORIGEMLANC IS NULL) OR (FLGORIGEMLANC = :PFLGO' +
        'RIGEMLANC) )'
      
        '      AND ( (:PTRGDTINCLUSAOINI IS NULL) OR (TRGDTINCLUSAO BETWE' +
        'EN :PTRGDTINCLUSAOINI AND :PTRGDTINCLUSAOFIM) )'
      
        '      AND ( (:PDATALANCAMENTOINI IS NULL) OR (DATALANCAMENTO BET' +
        'WEEN :PDATALANCAMENTOINI AND :PDATALANCAMENTOFIM) )'
      
        '      AND ( (:PDATAVENCIMENTOINI IS NULL) OR (DATAVENCIMENTO BET' +
        'WEEN :PDATAVENCIMENTOINI AND :PDATAVENCIMENTOFIM) )'
      ')'
      '')
    ValidateWithMask = True
    Left = 56
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDUSUARIOSISTEMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIOSISTEMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGORIGEMLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGORIGEMLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PTRGDTINCLUSAOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PTRGDTINCLUSAOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PTRGDTINCLUSAOFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALANCAMENTOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALANCAMENTOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALANCAMENTOFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTOFIM'
        ParamType = ptUnknown
      end>
  end
  object dsConciliaFeriado: TwwDataSource
    DataSet = qryConciliaFeriado
    Left = 177
    Top = 387
  end
  object updConciliaFeriado: TUpdateSQL
    ModifySQL.Strings = (
      'update DOCUMENTO'
      'set'
      '  FLGNAOCONCILIADO = :FLGNAOCONCILIADO'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    InsertSQL.Strings = (
      'insert into DOCUMENTO'
      '  (CODDOCUMENTO, FLGNAOCONCILIADO)'
      'values'
      '  (:CODDOCUMENTO, :FLGNAOCONCILIADO)')
    DeleteSQL.Strings = (
      'delete from DOCUMENTO'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    Left = 176
    Top = 374
  end
  object qryConciliaFeriado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   V.CODDOCUMENTO,        V.DATAVENCIMENTO,      V.DATA_BAIXA,'
      
        '   V.TOT_RECEBER,         V.TOT_RECEBIDO,        V.FLGNAOCONCILI' +
        'ADO,'
      '   V.IDCONTRATOIMOVEL,    V.IDCIDADES,           V.IDPAIS,'
      
        '   V.CODESTADO,           V.CONDIASTOLERANCIA,   V.FLGTIPODIATOL' +
        'ERA,'
      
        '   CONTRATO_EXTENSO,      V.MESCOMPETENCIA,      V.ANOCOMPETENCI' +
        'A,'
      '   V.DATALIMITE,          V.CONDIASREPASSE,'
      '   (V.DATA_BAIXA-V.DATALIMITE) AS DIF'
      ''
      'FROM'
      '   VWLANCAMENTO V'
      ''
      'WHERE'
      '   ( V.IDMODULO = 64 )'
      '   AND ( V.STATUS_DOC = '#39'2'#39' )'
      '   AND ( V.FLGNAOCONCILIADO = 1 )'
      '   AND ( V.RECPAG = '#39'R'#39' )'
      '   AND ( V.TOT_RECEBER = V.TOT_RECEBIDO )'
      
        '   AND ( (:PIDUSUARIOSISTEMA IS NULL) OR (V.IDUSUARIOSISTEMA = :' +
        'PIDUSUARIOSISTEMA) )'
      
        '   AND ( (:PIDCONTRATOIMOVEL IS NULL) OR (V.IDCONTRATOIMOVEL = :' +
        'PIDCONTRATOIMOVEL) )'
      '   AND ( (:PIDFORCLI IS NULL) OR (V.IDFORCLI = :PIDFORCLI) )'
      
        '   AND ( (:PMESCOMPETENCIA IS NULL) OR ((MESCOMPETENCIA = :PMESC' +
        'OMPETENCIA) AND (ANOCOMPETENCIA = :PANOCOMPETENCIA)) )'
      
        '   AND ( (:PFLGORIGEMLANC IS NULL) OR (FLGORIGEMLANC = :PFLGORIG' +
        'EMLANC) )'
      
        '   AND ( (:PTRGDTINCLUSAOINI IS NULL) OR (TRGDTINCLUSAO BETWEEN ' +
        ':PTRGDTINCLUSAOINI AND :PTRGDTINCLUSAOFIM) )'
      
        '   AND ( (:PDATALANCAMENTOINI IS NULL) OR (DATALANCAMENTO BETWEE' +
        'N :PDATALANCAMENTOINI AND :PDATALANCAMENTOFIM) )'
      
        '   AND ( (:PDATAVENCIMENTOINI IS NULL) OR (DATAVENCIMENTO BETWEE' +
        'N :PDATAVENCIMENTOINI AND :PDATAVENCIMENTOFIM) )'
      ''
      'ORDER BY'
      '   DIF, V.CONTRATO_EXTENSO'
      ''
      ''
      ''
      ''
      '')
    UpdateObject = updConciliaFeriado
    ControlType.Strings = (
      'FLGNAOCONCILIADO;CheckBox;;1')
    ValidateWithMask = True
    Left = 176
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDUSUARIOSISTEMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIOSISTEMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGORIGEMLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGORIGEMLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PTRGDTINCLUSAOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PTRGDTINCLUSAOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PTRGDTINCLUSAOFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALANCAMENTOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALANCAMENTOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALANCAMENTOFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTOFIM'
        ParamType = ptUnknown
      end>
    object qryConciliaFeriadoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.VWLANCAMENTO.CODDOCUMENTO'
    end
    object qryConciliaFeriadoDATAVENCIMENTO: TDateTimeField
      Alignment = taCenter
      FieldName = 'DATAVENCIMENTO'
      Origin = 'BASEDADOS.VWLANCAMENTO.DATAVENCIMENTO'
    end
    object qryConciliaFeriadoDATA_BAIXA: TDateTimeField
      Alignment = taCenter
      FieldName = 'DATA_BAIXA'
      Origin = 'BASEDADOS.VWLANCAMENTO.DATA_BAIXA'
    end
    object qryConciliaFeriadoTOT_RECEBER: TFloatField
      FieldName = 'TOT_RECEBER'
      Origin = 'BASEDADOS.VWLANCAMENTO.TOT_RECEBER'
      DisplayFormat = '#,##0.00'
    end
    object qryConciliaFeriadoTOT_RECEBIDO: TFloatField
      FieldName = 'TOT_RECEBIDO'
      Origin = 'BASEDADOS.VWLANCAMENTO.TOT_RECEBIDO'
      DisplayFormat = '#,##0.00'
    end
    object qryConciliaFeriadoFLGNAOCONCILIADO: TFloatField
      FieldName = 'FLGNAOCONCILIADO'
      Origin = 'BASEDADOS.VWLANCAMENTO.FLGNAOCONCILIADO'
    end
    object qryConciliaFeriadoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'BASEDADOS.VWLANCAMENTO.IDCONTRATOIMOVEL'
    end
    object qryConciliaFeriadoIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Origin = 'BASEDADOS.VWLANCAMENTO.IDCIDADES'
    end
    object qryConciliaFeriadoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'BASEDADOS.VWLANCAMENTO.IDPAIS'
    end
    object qryConciliaFeriadoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Origin = 'BASEDADOS.VWLANCAMENTO.CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryConciliaFeriadoCONDIASTOLERANCIA: TFloatField
      FieldName = 'CONDIASTOLERANCIA'
      Origin = 'BASEDADOS.VWLANCAMENTO.CONDIASTOLERANCIA'
    end
    object qryConciliaFeriadoFLGTIPODIATOLERA: TStringField
      FieldName = 'FLGTIPODIATOLERA'
      Origin = 'BASEDADOS.VWLANCAMENTO.FLGTIPODIATOLERA'
      FixedChar = True
      Size = 1
    end
    object qryConciliaFeriadoCONTRATO_EXTENSO: TStringField
      FieldName = 'CONTRATO_EXTENSO'
      Origin = 'BASEDADOS.VWLANCAMENTO.CONTRATO_EXTENSO'
      Size = 83
    end
    object qryConciliaFeriadoMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
      Origin = 'BASEDADOS.VWLANCAMENTO.MESCOMPETENCIA'
    end
    object qryConciliaFeriadoANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
      Origin = 'BASEDADOS.VWLANCAMENTO.ANOCOMPETENCIA'
    end
    object qryConciliaFeriadoDIF: TFloatField
      FieldName = 'DIF'
      Origin = 'BASEDADOS.VWLANCAMENTO.DATA_BAIXA'
    end
    object qryConciliaFeriadoDATALIMITE: TDateTimeField
      Alignment = taCenter
      FieldName = 'DATALIMITE'
    end
    object qryConciliaFeriadoCONDIASREPASSE: TFloatField
      FieldName = 'CONDIASREPASSE'
      Origin = 'BASEDADOS.VWLANCAMENTO.CONDIASREPASSE'
    end
  end
  object qryUpdDataLimite: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE LANCAMENTOSIMOVEL'
      'SET DATALIMITE = :PDATALIMITE'
      'WHERE '
      '   ( CODDOCUMENTO = :PCODDOCUMENTO )'
      
        '   AND ( DATALIMITE IS NULL )   -- teoricamente a data limite é ' +
        'processada nao folha'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 277
    Top = 360
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATALIMITE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object dsConciliaCalculo: TwwDataSource
    DataSet = qryConciliaCalculo
    Left = 377
    Top = 387
  end
  object updConciliaCalculo: TUpdateSQL
    ModifySQL.Strings = (
      'update DOCUMENTO'
      'set'
      '  FLGNAOCONCILIADO = :FLGNAOCONCILIADO'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    InsertSQL.Strings = (
      'insert into DOCUMENTO'
      '  (CODDOCUMENTO, FLGNAOCONCILIADO)'
      'values'
      '  (:CODDOCUMENTO, :FLGNAOCONCILIADO)')
    DeleteSQL.Strings = (
      'delete from DOCUMENTO'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    Left = 376
    Top = 374
  end
  object qryConciliaCalculo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   V.CODDOCUMENTO,        V.DATAVENCIMENTO,      V.DATA_BAIXA,'
      
        '   V.TOT_RECEBER,         V.TOT_RECEBIDO,        V.FLGNAOCONCILI' +
        'ADO,'
      '   V.IDCONTRATOIMOVEL,    V.IDCIDADES,           V.IDPAIS,'
      
        '   V.CODESTADO,           V.CONDIASTOLERANCIA,   V.FLGTIPODIATOL' +
        'ERA,'
      '   V.RS_FORCLI,           V.IDFORCLI,            V.DATALIMITE,'
      
        '   V.CONTRATO_EXTENSO,    V.MESCOMPETENCIA,      V.ANOCOMPETENCI' +
        'A,'
      
        '   V.VLRJUROS,            V.VLRMULTA,            V.VLRCORRECAOMO' +
        'N,'
      
        '   V.IDINDCORRECAO,       V.CONMOEDAMULTA,       V.CONPERCENTMUL' +
        'TA,'
      
        '   V.CONVLRMULTA,         V.CONPERMORA,          V.FLGMORAPROPOR' +
        'C,'
      '   V.CONPERCENTMORA,      V.CONVLRMORA,          V.CONMOEDAMORA,'
      
        '   V.CODTIPIMOVEL,        V.CONMESREFREAJUSTE,   V.CONDIASREPASS' +
        'E,'
      '   (V.TOT_RECEBER+V.VLRJUROS+V.VLRMULTA+V.VLRCORRECAOMON) AS VC,'
      
        '   (V.TOT_RECEBER+V.VLRJUROS+V.VLRMULTA+V.VLRCORRECAOMON - V.TOT' +
        '_RECEBIDO) AS DIFERENCA'
      ''
      'FROM'
      '   VWLANCAMENTO V'
      ''
      'WHERE'
      '   ( V.IDMODULO = 64 )'
      '   AND ( V.STATUS_DOC = '#39'2'#39' )'
      '   AND ( V.FLGNAOCONCILIADO = 1 )'
      '   AND ( V.RECPAG = '#39'R'#39' )'
      '   AND ( V.IDCONTRATOIMOVEL IS NOT NULL)'
      
        '   AND ( (:PIDUSUARIOSISTEMA IS NULL) OR (V.IDUSUARIOSISTEMA = :' +
        'PIDUSUARIOSISTEMA) )'
      
        '   AND ( (:PIDCONTRATOIMOVEL IS NULL) OR (V.IDCONTRATOIMOVEL = :' +
        'PIDCONTRATOIMOVEL) )'
      '   AND ( (:PIDFORCLI IS NULL) OR (V.IDFORCLI = :PIDFORCLI) )'
      
        '   AND ( (:PMESCOMPETENCIA IS NULL) OR ((MESCOMPETENCIA = :PMESC' +
        'OMPETENCIA) AND (ANOCOMPETENCIA = :PANOCOMPETENCIA)) )'
      
        '   AND ( (:PFLGORIGEMLANC IS NULL) OR (FLGORIGEMLANC = :PFLGORIG' +
        'EMLANC) )'
      
        '   AND ( (:PTRGDTINCLUSAOINI IS NULL) OR (TRGDTINCLUSAO BETWEEN ' +
        ':PTRGDTINCLUSAOINI AND :PTRGDTINCLUSAOFIM) )'
      
        '   AND ( (:PDATALANCAMENTOINI IS NULL) OR (DATALANCAMENTO BETWEE' +
        'N :PDATALANCAMENTOINI AND :PDATALANCAMENTOFIM) )'
      
        '   AND ( (:PDATAVENCIMENTOINI IS NULL) OR (DATAVENCIMENTO BETWEE' +
        'N :PDATAVENCIMENTOINI AND :PDATAVENCIMENTOFIM) )'
      ''
      'ORDER BY'
      '   DIFERENCA'
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
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updConciliaCalculo
    ControlType.Strings = (
      'FLGNAOCONCILIADO;CheckBox;;1')
    ValidateWithMask = True
    Left = 376
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDUSUARIOSISTEMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIOSISTEMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGORIGEMLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGORIGEMLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PTRGDTINCLUSAOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PTRGDTINCLUSAOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PTRGDTINCLUSAOFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALANCAMENTOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALANCAMENTOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALANCAMENTOFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTOFIM'
        ParamType = ptUnknown
      end>
    object qryConciliaCalculoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryConciliaCalculoDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryConciliaCalculoDATA_BAIXA: TDateTimeField
      FieldName = 'DATA_BAIXA'
    end
    object qryConciliaCalculoTOT_RECEBER: TFloatField
      FieldName = 'TOT_RECEBER'
      DisplayFormat = '#,##0.00'
    end
    object qryConciliaCalculoTOT_RECEBIDO: TFloatField
      FieldName = 'TOT_RECEBIDO'
      DisplayFormat = '#,##0.00'
    end
    object qryConciliaCalculoFLGNAOCONCILIADO: TFloatField
      FieldName = 'FLGNAOCONCILIADO'
    end
    object qryConciliaCalculoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryConciliaCalculoIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
    end
    object qryConciliaCalculoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object qryConciliaCalculoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryConciliaCalculoCONDIASTOLERANCIA: TFloatField
      FieldName = 'CONDIASTOLERANCIA'
    end
    object qryConciliaCalculoFLGTIPODIATOLERA: TStringField
      FieldName = 'FLGTIPODIATOLERA'
      FixedChar = True
      Size = 1
    end
    object qryConciliaCalculoCONTRATO_EXTENSO: TStringField
      FieldName = 'CONTRATO_EXTENSO'
      Size = 83
    end
    object qryConciliaCalculoMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object qryConciliaCalculoANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object qryConciliaCalculoVLRJUROS: TFloatField
      FieldName = 'VLRJUROS'
      Origin = 'BASEDADOS.VWLANCAMENTO.VLRJUROS'
      DisplayFormat = '#,##0.00'
    end
    object qryConciliaCalculoVLRMULTA: TFloatField
      FieldName = 'VLRMULTA'
      Origin = 'BASEDADOS.VWLANCAMENTO.VLRMULTA'
      DisplayFormat = '#,##0.00'
    end
    object qryConciliaCalculoVLRCORRECAOMON: TFloatField
      FieldName = 'VLRCORRECAOMON'
      Origin = 'BASEDADOS.VWLANCAMENTO.VLRCORRECAOMON'
      DisplayFormat = '#,##0.00'
    end
    object qryConciliaCalculoDIFERENCA: TFloatField
      FieldName = 'DIFERENCA'
      Origin = 'BASEDADOS.VWLANCAMENTO.TOT_RECEBER'
      DisplayFormat = '#,##0.00'
    end
    object qryConciliaCalculoVC: TFloatField
      FieldName = 'VC'
      Origin = 'BASEDADOS.VWLANCAMENTO.TOT_RECEBER'
      DisplayFormat = '#,##0.00'
    end
    object qryConciliaCalculoCONMOEDAMULTA: TFloatField
      FieldName = 'CONMOEDAMULTA'
      Origin = 'BASEDADOS.VWLANCAMENTO.CONMOEDAMULTA'
    end
    object qryConciliaCalculoCONPERCENTMULTA: TFloatField
      FieldName = 'CONPERCENTMULTA'
      Origin = 'BASEDADOS.VWLANCAMENTO.CONPERCENTMULTA'
    end
    object qryConciliaCalculoCONVLRMULTA: TFloatField
      FieldName = 'CONVLRMULTA'
      Origin = 'BASEDADOS.VWLANCAMENTO.CONVLRMULTA'
    end
    object qryConciliaCalculoCONPERMORA: TStringField
      FieldName = 'CONPERMORA'
      Origin = 'BASEDADOS.VWLANCAMENTO.CONPERMORA'
      FixedChar = True
      Size = 1
    end
    object qryConciliaCalculoFLGMORAPROPORC: TFloatField
      FieldName = 'FLGMORAPROPORC'
      Origin = 'BASEDADOS.VWLANCAMENTO.FLGMORAPROPORC'
    end
    object qryConciliaCalculoCONPERCENTMORA: TFloatField
      FieldName = 'CONPERCENTMORA'
      Origin = 'BASEDADOS.VWLANCAMENTO.CONPERCENTMORA'
    end
    object qryConciliaCalculoCONVLRMORA: TFloatField
      FieldName = 'CONVLRMORA'
      Origin = 'BASEDADOS.VWLANCAMENTO.CONVLRMORA'
    end
    object qryConciliaCalculoCONMOEDAMORA: TFloatField
      FieldName = 'CONMOEDAMORA'
      Origin = 'BASEDADOS.VWLANCAMENTO.CONMOEDAMORA'
    end
    object qryConciliaCalculoDATALIMITE: TDateTimeField
      FieldName = 'DATALIMITE'
      Origin = 'BASEDADOS.VWLANCAMENTO.DATALIMITE'
    end
    object qryConciliaCalculoRS_FORCLI: TStringField
      FieldName = 'RS_FORCLI'
      Origin = 'BASEDADOS.VWLANCAMENTO.RS_FORCLI'
      Size = 60
    end
    object qryConciliaCalculoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'BASEDADOS.VWLANCAMENTO.IDFORCLI'
    end
    object qryConciliaCalculoCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'BASEDADOS.VWLANCAMENTO.CODTIPIMOVEL'
      Size = 5
    end
    object qryConciliaCalculoIDINDCORRECAO: TFloatField
      FieldName = 'IDINDCORRECAO'
    end
    object qryConciliaCalculoCONMESREFREAJUSTE: TStringField
      FieldName = 'CONMESREFREAJUSTE'
      FixedChar = True
      Size = 1
    end
    object qryConciliaCalculoCONDIASREPASSE: TFloatField
      FieldName = 'CONDIASREPASSE'
      Origin = 'BASEDADOS.VWLANCAMENTO.CONDIASREPASSE'
    end
  end
  object qryUpdLancamentosImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   LANCAMENTOSIMOVEL'
      'SET'
      '   VLRCORRECAOMON = :PVLRCORRECAOMON,'
      '   VLRJUROS       = :PVLRJUROS,'
      '   VLRMULTA       = :PVLRMULTA'
      'WHERE'
      '   ( CODDOCUMENTO = :PCODDOCUMENTO )'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 509
    Top = 363
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PVLRCORRECAOMON'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRJUROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRMULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object rptConciliaCalculo: TppReport
    AutoStop = False
    DataPipeline = ppConciliaCalculo
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
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rptConciliaCalculoBeforePrint
    DeviceType = 'Screen'
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 624
    Top = 368
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppConciliaCalculo'
    object HeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21696
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
        mmHeight = 3175
        mmLeft = 0
        mmTop = 17198
        mmWidth = 11642
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
        mmHeight = 3175
        mmLeft = 60854
        mmTop = 17198
        mmWidth = 5556
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
        mmHeight = 3175
        mmLeft = 69321
        mmTop = 17198
        mmWidth = 5292
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
        mmHeight = 3175
        mmLeft = 79640
        mmTop = 17198
        mmWidth = 15610
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
        mmHeight = 3175
        mmLeft = 119592
        mmTop = 17198
        mmWidth = 7408
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
        Transparent = True
        mmHeight = 3175
        mmLeft = 146844
        mmTop = 17198
        mmWidth = 14817
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
        Transparent = True
        mmHeight = 3175
        mmLeft = 164571
        mmTop = 17198
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Vlr Corrigido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 184415
        mmTop = 17198
        mmWidth = 16933
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
        Transparent = True
        mmHeight = 3175
        mmLeft = 208757
        mmTop = 16933
        mmWidth = 12435
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
        Transparent = True
        mmHeight = 3175
        mmLeft = 228865
        mmTop = 17198
        mmWidth = 12171
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
        Transparent = True
        mmHeight = 3175
        mmLeft = 253736
        mmTop = 17198
        mmWidth = 7408
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
        Transparent = True
        mmHeight = 3175
        mmLeft = 274109
        mmTop = 17198
        mmWidth = 7408
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20638
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
        mmHeight = 3175
        mmLeft = 99484
        mmTop = 17198
        mmWidth = 8202
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
    end
    object DetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MESCOMPETENCIA'
        DataPipeline = ppConciliaCalculo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 60854
        mmTop = 0
        mmWidth = 3704
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
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 67998
        mmTop = 0
        mmWidth = 6615
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
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 79640
        mmTop = 0
        mmWidth = 15346
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
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 119592
        mmTop = 0
        mmWidth = 15081
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
        mmLeft = 144463
        mmTop = 0
        mmWidth = 17198
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
        mmLeft = 164307
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VC'
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
        mmLeft = 184150
        mmTop = 0
        mmWidth = 17198
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
        mmLeft = 203994
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VLRCORRECAOMON'
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
        mmLeft = 223838
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'VLRJUROS'
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
        mmLeft = 243946
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'VLRMULTA'
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
        mmLeft = 264319
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'CONTRATO_EXTENSO'
        DataPipeline = ppConciliaCalculo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 9260
        mmLeft = 0
        mmTop = 0
        mmWidth = 58738
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
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
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConciliaCalculo'
        mmHeight = 3175
        mmLeft = 99484
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
    end
    object FooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
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
      mmHeight = 8202
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
        mmLeft = 202407
        mmTop = 1588
        mmWidth = 18785
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
        mmLeft = 127529
        mmTop = 1588
        mmWidth = 8202
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'VLRCORRECAOMON'
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
        mmLeft = 222515
        mmTop = 1588
        mmWidth = 18521
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'VLRJUROS'
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
        mmLeft = 242623
        mmTop = 1588
        mmWidth = 18521
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'VLRMULTA'
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
        mmLeft = 262996
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
        mmLeft = 142875
        mmTop = 1588
        mmWidth = 18785
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
        mmLeft = 162719
        mmTop = 1588
        mmWidth = 18785
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'VC'
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
        mmLeft = 182563
        mmTop = 1588
        mmWidth = 18785
        BandType = 7
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650611
        5265706F72744265666F72655072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F75726365062D70726F63656475726520526570
        6F72744265666F72655072696E743B0D0A626567696E0D0A0D0A656E643B0D0A
        0D436F6D706F6E656E744E616D6506065265706F7274094576656E744E616D65
        060B4265666F72655072696E74074576656E74494402010000}
    end
  end
  object ppConciliaCalculo: TppBDEPipeline
    DataSource = dsConciliaCalculo
    UserName = 'ppConciliaCalculo'
    Left = 625
    Top = 384
  end
end
