inherited frmExecLancMultRec: TfrmExecLancMultRec
  Left = 290
  Top = 163
  HelpContext = 640017
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Lançamento Múltiplo de Receitas'
  ClientHeight = 447
  ClientWidth = 737
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 737
    Height = 371
    object lblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 434
      Height = 24
      Caption = 'Lançamento Múltiplo de Receitas [Seleção]'
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
    object ntbPrincipal: TNotebook
      Left = 0
      Top = 39
      Width = 737
      Height = 332
      Align = alBottom
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnPageChanged = ntbPrincipalPageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagSelecao'
        object Label22: TLabel
          Left = 16
          Top = 46
          Width = 92
          Height = 13
          Caption = 'Tipo de Receita'
        end
        object Label1: TLabel
          Left = 16
          Top = 6
          Width = 100
          Height = 13
          Caption = 'Grupo de Imóveis'
        end
        object Label5: TLabel
          Left = 616
          Top = 46
          Width = 83
          Height = 13
          Caption = 'Nº Documento'
        end
        object Label7: TLabel
          Left = 362
          Top = 183
          Width = 75
          Height = 13
          Caption = 'Observações'
        end
        object lblCentroCusto: TLabel
          Left = 16
          Top = 197
          Width = 92
          Height = 13
          Caption = 'Centro de Custo'
        end
        object Bevel3: TBevel
          Left = 16
          Top = 293
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object lblFormaCobranca: TLabel
          Left = 16
          Top = 234
          Width = 111
          Height = 13
          Caption = 'Forma de Cobrança'
        end
        object Label30: TLabel
          Left = 362
          Top = 140
          Width = 142
          Height = 13
          Caption = 'Histórico de Lançamento'
        end
        object DBcboTipoRecDes: TwwDBLookupCombo
          Left = 16
          Top = 60
          Width = 209
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCCUSTORECIMO'#9'60'#9'DESCCUSTORECIMO'#9'F')
          LookupTable = cdsReceita
          LookupField = 'IDTIPOCUSTORECIMO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = DBcboTipoRecDesCloseUp
        end
        object DBcboGrupo: TwwDBLookupCombo
          Left = 16
          Top = 20
          Width = 321
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'GRRDESCRICAO'#9'60'#9'Descrição')
          LookupTable = dtmLookImobiliario.qryLookGrupoRateio
          LookupField = 'IDGRUPORATEIO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = DBcboGrupoCloseUp
          OnExit = DBcboGrupoExit
        end
        object btnContinuaSelecao: TfcShapeBtn
          Left = 536
          Top = 298
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
          TabOrder = 13
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuaSelecaoClick
        end
        object GroupBox1: TGroupBox
          Left = 16
          Top = 82
          Width = 705
          Height = 53
          TabOrder = 5
          TabStop = True
          object Label3: TLabel
            Left = 339
            Top = 10
            Width = 101
            Height = 13
            Caption = 'Data Lançamento'
          end
          object lblDataVencimento: TLabel
            Left = 225
            Top = 10
            Width = 98
            Height = 13
            Caption = 'Data Vencimento'
          end
          object Label15: TLabel
            Left = 16
            Top = 10
            Width = 135
            Height = 13
            Caption = 'Competência (mês/ano)'
          end
          object Label2: TLabel
            Left = 624
            Top = 10
            Width = 63
            Height = 13
            Caption = 'Valor Total'
          end
          object Label29: TLabel
            Left = 453
            Top = 10
            Width = 78
            Height = 13
            Caption = 'Data Emissão'
          end
          object edtDataLanc: TCMDateTimePicker
            Left = 339
            Top = 24
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
            OnChange = edtDataLancChange
          end
          object edtDataVenc: TCMDateTimePicker
            Left = 225
            Top = 24
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
            OnExit = edtDataVencExit
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 152
            Top = 24
            Width = 62
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
            OnChange = cboMesChange
            OnExit = cboMesChange
          end
          object edtVlrTotal: TRealEdit
            Left = 568
            Top = 24
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Color = 12648447
            Lines.Strings = (
              '        0,00')
            TabOrder = 5
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object cboMes: TComboBox
            Left = 16
            Top = 24
            Width = 134
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnChange = cboMesChange
            OnExit = cboMesChange
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
          object edtDataEmissao: TCMDateTimePicker
            Left = 453
            Top = 24
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
            TabOrder = 4
            OnChange = edtDataLancChange
          end
        end
        object edtNumDocumento: TEdit
          Left = 616
          Top = 60
          Width = 105
          Height = 21
          TabStop = False
          TabOrder = 4
        end
        object btnAtualizar: TfcShapeBtn
          Left = 16
          Top = 298
          Width = 89
          Height = 29
          Caption = 'Atualizar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888888888888FFFFFF88888800008888844444488888888F88F7777778F88888
            000024884222222448888877FF788888877F888800002244222222222488887F
            7788FFFFF887F8880000222222AAAAA22248887F888F77777F887F8800002222
            2A88888A2224887F88F7888887F887F80000222228888888A224887F8878F888
            887FF7F80000222222888888A444887FFFF78F88887777880000AAAAAAA88888
            8888887777777888888888880000888888888888888888888888888888FFFFFF
            00008888888888844444488FFFF888888777777F0000A444888888A222224877
            77F888887F88887F0000A2248888888A2222487F878F888887F8887F00008A22
            48888844222248878878FFFF7788887F00008A222444442222224887F8877777
            888FF87F000088A2222222222AA248887FF888888FF77F780000888AA222222A
            A88A8888877FFFFFF7788788000088888AAAAAA8888888888887777778888888
            0000}
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 14
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnAtualizarClick
        end
        object memObs: TMemo
          Left = 362
          Top = 197
          Width = 361
          Height = 71
          MaxLength = 200
          TabOrder = 11
        end
        object DBcboCentroCusto: TwwDBLookupCombo
          Left = 16
          Top = 211
          Width = 329
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'NOME')
          LookupTable = dtmLookImobiliario.qryLookCentroCusto
          LookupField = 'CODCENTROCUSTO'
          Style = csDropDownList
          DropDownWidth = 113
          TabOrder = 7
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object chkBoleto: TCheckBox
          Left = 16
          Top = 274
          Width = 201
          Height = 16
          Caption = 'Gerar boleto de cobrança'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
        end
        object DBcboPortadorForma: TwwDBLookupCombo
          Left = 16
          Top = 248
          Width = 329
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
          LookupTable = dtmLookImobiliario.qryLookPortadorForma
          LookupField = 'CODPORTFORMA'
          Style = csDropDownList
          DropDownWidth = 113
          TabOrder = 8
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          OnChange = DBcboPortadorFormaChange
          OnCloseUp = DBcboPortadorFormaCloseUp
          OnEnter = DBcboPortadorFormaChange
        end
        inline molCliente1: TmolCliente
          Left = 224
          Top = 44
          TabOrder = 3
          inherited btnBuscaCli: TBitBtn
            OnClick = molCliente1btnBuscaCliClick
          end
        end
        inline molContrato1: TmolContrato
          Left = 346
          Top = 5
          TabOrder = 1
          TabStop = True
          inherited edtContrato: TEdit
            OnExit = molContrato1edtContratoExit
          end
          inherited btnBuscaContrato: TBitBtn
            OnClick = molContrato1btnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            OnClick = molContrato1btnLimpaContratoClick
          end
        end
        object chkImovelSemContrato: TCheckBox
          Left = 362
          Top = 274
          Width = 343
          Height = 17
          Caption = 'Permite inclusão de imóveis sem contratos ( liberação )'
          TabOrder = 12
        end
        object gbPeriodoCtbDiaria: TGroupBox
          Left = 16
          Top = 137
          Width = 329
          Height = 56
          Caption = 'Período para Contabilização Diária'
          TabOrder = 6
          TabStop = True
          object Label6: TLabel
            Left = 19
            Top = 14
            Width = 34
            Height = 13
            Caption = 'Início'
          end
          object Label28: TLabel
            Left = 168
            Top = 14
            Width = 46
            Height = 13
            Caption = 'Término'
          end
          object edtDtinictbdiaria: TCMDateTimePicker
            Left = 18
            Top = 28
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
          object edtDtfimctbdiaria: TCMDateTimePicker
            Left = 168
            Top = 28
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
            TabOrder = 1
          end
        end
        object edtHistLanc: TEdit
          Left = 362
          Top = 154
          Width = 361
          Height = 21
          TabOrder = 10
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagMensagem'
        object RadioGroup1: TRadioGroup
          Left = 496
          Top = -20
          Width = 281
          Height = 49
          ItemIndex = 0
          Items.Strings = (
            'Gerar boleto isolado'
            'Agrupar lançamentos com boleto de Aluguel')
          TabOrder = 0
          Visible = False
        end
        object GroupBox2: TGroupBox
          Left = 16
          Top = 56
          Width = 705
          Height = 213
          Caption = ' Mensagem do Boleto '
          TabOrder = 1
          object Label10: TLabel
            Left = 16
            Top = 20
            Width = 47
            Height = 13
            Caption = 'Linha 1:'
          end
          object Label12: TLabel
            Left = 16
            Top = 41
            Width = 47
            Height = 13
            Caption = 'Linha 2:'
          end
          object Label13: TLabel
            Left = 16
            Top = 62
            Width = 47
            Height = 13
            Caption = 'Linha 3:'
          end
          object Label16: TLabel
            Left = 16
            Top = 83
            Width = 47
            Height = 13
            Caption = 'Linha 4:'
          end
          object Label17: TLabel
            Left = 16
            Top = 104
            Width = 47
            Height = 13
            Caption = 'Linha 5:'
          end
          object Label18: TLabel
            Left = 16
            Top = 125
            Width = 47
            Height = 13
            Caption = 'Linha 6:'
          end
          object Label19: TLabel
            Left = 16
            Top = 146
            Width = 47
            Height = 13
            Caption = 'Linha 7:'
          end
          object Label20: TLabel
            Left = 16
            Top = 167
            Width = 47
            Height = 13
            Caption = 'Linha 8:'
          end
          object Label21: TLabel
            Left = 16
            Top = 188
            Width = 47
            Height = 13
            Caption = 'Linha 9:'
          end
          object Label49: TLabel
            Left = 528
            Top = 41
            Width = 57
            Height = 13
            Caption = '<parcela>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 528
            Top = 62
            Width = 63
            Height = 13
            Caption = '<parcelas>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label23: TLabel
            Left = 528
            Top = 20
            Width = 53
            Height = 13
            Caption = '<recdes>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label24: TLabel
            Left = 592
            Top = 20
            Width = 105
            Height = 13
            Caption = '= Nome da receita'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label25: TLabel
            Left = 592
            Top = 41
            Width = 90
            Height = 13
            Caption = '= Nº da parcela'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label27: TLabel
            Left = 592
            Top = 62
            Width = 96
            Height = 13
            Caption = '= Nº de parcelas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 528
            Top = 81
            Width = 45
            Height = 13
            Caption = '<comp>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label26: TLabel
            Left = 592
            Top = 81
            Width = 85
            Height = 13
            Caption = '= Competência'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label31: TLabel
            Left = 528
            Top = 97
            Width = 51
            Height = 13
            Caption = '<imovel>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label32: TLabel
            Left = 592
            Top = 97
            Width = 66
            Height = 13
            Caption = '= Imóvel(is)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtLinha1: TEdit
            Left = 72
            Top = 16
            Width = 449
            Height = 21
            MaxLength = 69
            TabOrder = 0
          end
          object edtLinha2: TEdit
            Left = 72
            Top = 37
            Width = 449
            Height = 21
            MaxLength = 69
            TabOrder = 1
            Text = 'Reembolso de <recdes>'
          end
          object edtLinha3: TEdit
            Left = 72
            Top = 58
            Width = 449
            Height = 21
            MaxLength = 69
            TabOrder = 2
          end
          object edtLinha4: TEdit
            Left = 72
            Top = 79
            Width = 449
            Height = 21
            MaxLength = 69
            TabOrder = 3
            Text = 'Parcela <parcela> de <parcelas>'
          end
          object edtLinha5: TEdit
            Left = 72
            Top = 100
            Width = 449
            Height = 21
            MaxLength = 69
            TabOrder = 4
          end
          object edtLinha6: TEdit
            Left = 72
            Top = 121
            Width = 449
            Height = 21
            MaxLength = 69
            TabOrder = 5
          end
          object edtLinha7: TEdit
            Left = 72
            Top = 142
            Width = 449
            Height = 21
            MaxLength = 69
            TabOrder = 6
          end
          object edtLinha8: TEdit
            Left = 72
            Top = 163
            Width = 449
            Height = 21
            MaxLength = 69
            TabOrder = 7
          end
          object edtLinha9: TEdit
            Left = 72
            Top = 184
            Width = 449
            Height = 21
            MaxLength = 69
            TabOrder = 8
          end
          object btnTrazrMsg: TfcShapeBtn
            Left = 597
            Top = 130
            Width = 81
            Height = 25
            Caption = 'Trazer'
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
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888888F88888888888888778888888888888F77F8888888888800F088
              888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF08
              8888887788888F7F8888887FFFFFCF088888887F88FF7878F888887FFFCCFFF0
              8888887F877788F7F888888744FFFCF088888887778FF7878F888884CC4FCFFF
              088888878878788F78F8884CCCC4FFCFF088887888878F78878F84CCCCCC4FFF
              FF0887FF88887F888F788444CC444FFF77888777F877788F77888884CC4FFF77
              88888887F87F8F7788888884CC47778888888887F877778888888884CC488888
              88888887FF7F8888888888844448888888888887777888888888}
            Margin = 10
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 9
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            Visible = False
          end
          object btnLimpaMsg: TfcShapeBtn
            Left = 597
            Top = 170
            Width = 81
            Height = 25
            Caption = 'Limpar'
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
            Spacing = 8
            TabOrder = 10
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnLimpaMsgClick
          end
        end
        object btnVoltarMsg: TfcShapeBtn
          Left = 440
          Top = 284
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
          TabOrder = 2
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnVoltarMsgClick
        end
        object btnContinuarMsg: TfcShapeBtn
          Left = 536
          Top = 284
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
          TabOrder = 3
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuarMsgClick
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagLancamentos'
        object Label4: TLabel
          Left = 264
          Top = 292
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total:'
        end
        object Bevel1: TBevel
          Left = 16
          Top = 278
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object pgcLancamentos: TPageControl
          Left = 14
          Top = 33
          Width = 706
          Height = 232
          ActivePage = tbsLancamentos
          HotTrack = True
          MultiLine = True
          ParentShowHint = False
          ShowHint = False
          TabHeight = 21
          TabOrder = 3
          TabPosition = tpBottom
          TabWidth = 121
          object tbsLancamentos: TTabSheet
            Caption = 'Lançamentos'
            object DBgrdLancamentos: TwwDBGrid
              Left = 0
              Top = 0
              Width = 698
              Height = 201
              Selected.Strings = (
                'IMOCODIGO'#9'10'#9'Código'#9'F'
                'IMOVEL_EXTENSO'#9'37'#9'Imóvel '#9'F'
                'CODTIPIMOVEL'#9'6'#9'Tipo'#9'F'
                'GXIPERCENTRATEIO'#9'9'#9'Rateio (I)'#9'F'
                'PERCENT_RATEIO'#9'9'#9'Rateio (C)'#9'F'
                'VALOR'#9'11'#9'Valor'#9'F'
                '_CONTRATOEXTENSO'#9'23'#9'Contrato'#9'F'
                'CIMDESCRICAO'#9'60'#9'CIMDESCRICAO'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsRateio
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              KeyOptions = []
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
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
              OnCalcCellColors = DBgrdLancamentosCalcCellColors
              IndicatorColor = icBlack
              OnTopRowChanged = DBgrdLancamentosTopRowChanged
            end
          end
          object tbsErro: TTabSheet
            Caption = 'Ocorrências'
            object memErro: TMemo
              Left = 0
              Top = 0
              Width = 698
              Height = 201
              Align = alClient
              ScrollBars = ssBoth
              TabOrder = 0
              WantTabs = True
              WordWrap = False
            end
          end
        end
        object btnConfirmaLanc: TfcShapeBtn
          Left = 632
          Top = 284
          Width = 89
          Height = 29
          Caption = 'Confirmar'
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
            8888888888FFFFF8888888888000008888888888F777778FF888888002222200
            88888887788888778F88887222222222088888788888888878F887A228822222
            208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
            22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
            22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
            220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
            2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
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
          OnClick = btnConfirmaLancClick
        end
        object btnVoltar: TfcShapeBtn
          Left = 440
          Top = 284
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
        object Panel3: TPanel
          Left = 14
          Top = 12
          Width = 707
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Lançamentos a Gerar'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object btnTrazer: TfcShapeBtn
            Left = 155
            Top = 1
            Width = 77
            Height = 25
            AllowAllUp = True
            Caption = 'Trazer'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888888F88888888888888778888888888888F77F8888888888800F088
              888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF08
              8888887788888F7F8888887FFFFFCF088888887F88FF7878F888887FFFCCFFF0
              8888887F877788F7F888888744FFFCF088888887778FF7878F888884CC4FCFFF
              088888878878788F78F8884CCCC4FFCFF088887888878F78878F84CCCCCC4FFF
              FF0887FF88887F888F788444CC444FFF77888777F877788F77888884CC4FFF77
              88888887F87F8F7788888884CC47778888888887F877778888888884CC488888
              88888887FF7F8888888888844448888888888887777888888888}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 2
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            Visible = False
          end
          object btnExclui: TfcShapeBtn
            Left = 78
            Top = 1
            Width = 77
            Height = 25
            AllowAllUp = True
            Caption = 'Excluir'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888FF8888888888888778888888888888F77F8888888888800F08
              8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
              88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
              08888877777F788F7F8881999991FFCF088887777777F87878F8999999991CFF
              F088777777777F88F78F998F9FF91FFCFF0877FF78877F8788789998FF991CCF
              FFF0777F88777F7888F7999FF8991FFFF77877788F777F88F778998F9FF91FF7
              788877FF7FF778F7788889999991777888888777777787788888889999988888
              8888887777788888888888888888888888888888888888888888}
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
            OnClick = btnExcluiClick
          end
          object btnInsert: TfcShapeBtn
            Left = 1
            Top = 1
            Width = 77
            Height = 25
            AllowAllUp = True
            Caption = 'Inserir'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888888B8888
              8888888888888F8888888B8888BB778888B88888888F77F8888888BB8800F088
              BB8888888F7787F8888888BB00FFF0BBBB88888F7788878F88888800FFFFFF0B
              B888887788888F7F8888887FFFFFCF0B8888887F88FF7878F888887FFCCCFFF0
              B8888878F77788F7F88888B7FFFFFCF0BB888887F88FF7878F88BBB7FFCCCFFF
              0BBB88878F77788F78F888BB7FFFFFCFF08888887F88FF78878F888B7FFCCCFF
              FF08888878F777888F78888BB7FFFFFF77888888878F888F778888BBBB7FFF77
              BB8888888878FF77888888BB88B77788BB8888888887778888888B88888B8888
              88B888888888888888888888888B888888888888888888888888}
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
            OnClick = btnInsertClick
          end
          object btnTotaliza: TfcShapeBtn
            Left = 617
            Top = 1
            Width = 89
            Height = 25
            AllowAllUp = True
            Caption = 'Atualizar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888888888888FFFFFF88888800008888844444488888888F88F7777778F88888
              000024884222222448888877FF788888877F888800002244222222222488887F
              7788FFFFF887F8880000222222AAAAA22248887F888F77777F887F8800002222
              2A88888A2224887F88F7888887F887F80000222228888888A224887F8878F888
              887FF7F80000222222888888A444887FFFF78F88887777880000AAAAAAA88888
              8888887777777888888888880000888888888888888888888888888888FFFFFF
              00008888888888844444488FFFF888888777777F0000A444888888A222224877
              77F888887F88887F0000A2248888888A2222487F878F888887F8887F00008A22
              48888844222248878878FFFF7788887F00008A222444442222224887F8877777
              888FF87F000088A2222222222AA248887FF888888FF77F780000888AA222222A
              A88A8888877FFFFFF7788788000088888AAAAAA8888888888887777778888888
              0000}
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
            OnClick = btnTotalizaClick
          end
        end
        object edtTotalLanc: TRealEdit
          Left = 304
          Top = 288
          Width = 105
          Height = 21
          Alignment = taRightJustify
          Color = 12648447
          Enabled = False
          Lines.Strings = (
            '      0,00')
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object btnContinuarLanc: TfcShapeBtn
          Left = 536
          Top = 284
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
          Enabled = False
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
          TabOrder = 5
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          Visible = False
          OnClick = btnContinuarLancClick
        end
        object Panel1: TPanel
          Left = 368
          Top = 244
          Width = 353
          Height = 27
          BevelOuter = bvNone
          TabOrder = 6
          object lblParcelas: TLabel
            Left = 279
            Top = 6
            Width = 49
            Height = 13
            Caption = 'parcelas'
            Visible = False
          end
          object chkParcelar: TCheckBox
            Left = 24
            Top = 4
            Width = 193
            Height = 19
            Caption = 'Lançamento parcelado:   '
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Visible = False
            OnClick = chkParcelarClick
          end
          object DBspnNumParcelas: TwwDBSpinEdit
            Left = 216
            Top = 3
            Width = 57
            Height = 21
            BiDiMode = bdLeftToRight
            Increment = 1
            MaxValue = 120
            MinValue = 1
            Value = 1
            Enabled = False
            ParentBiDiMode = False
            TabOrder = 1
            UnboundDataType = wwDefault
            Visible = False
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagAlteradores'
        object Label9: TLabel
          Left = 176
          Top = 26
          Width = 103
          Height = 13
          Caption = 'Tipo de Alterador '
        end
        object Label14: TLabel
          Left = 552
          Top = 26
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object Bevel4: TBevel
          Left = 16
          Top = 278
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object fcShapeBtn1: TfcShapeBtn
          Left = 440
          Top = 284
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
          TabOrder = 6
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnVoltarClick
        end
        object btnConfirmaAlt: TfcShapeBtn
          Left = 632
          Top = 284
          Width = 89
          Height = 29
          Caption = 'Confirmar'
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
            8888888888FFFFF8888888888000008888888888F777778FF888888002222200
            88888887788888778F88887222222222088888788888888878F887A228822222
            208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
            22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
            22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
            220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
            2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
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
          TabOrder = 7
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
        end
        object rdgAcreDesc: TRadioGroup
          Left = 64
          Top = 16
          Width = 97
          Height = 53
          ItemIndex = 0
          Items.Strings = (
            'Acréscimo'
            'Desconto')
          TabOrder = 0
        end
        object DBcboAlterador: TwwDBLookupCombo
          Left = 176
          Top = 40
          Width = 361
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'DESCRICAO')
          LookupTable = dtmLookImobiliario.qryLookAlteradorXTipoImo
          LookupField = 'CODALTERADOR'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
        end
        object DBgrdAlteradoresLanc: TwwDBGrid
          Left = 64
          Top = 112
          Width = 609
          Height = 121
          Selected.Strings = (
            'DESCRICAO'#9'66'#9'Tipo do Alterador'
            'VLRALTERADOR'#9'15'#9'Valor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 4
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object edtValor: TEditNum
          Left = 552
          Top = 40
          Width = 121
          Height = 21
          TabOrder = 2
          IntDigits = 0
          Signal = False
          DecDigits = 2
          Numeric = False
          Alignment = taRightJustify
        end
        object Panel4: TPanel
          Left = 64
          Top = 86
          Width = 609
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Alteradores'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          TabStop = True
          object bbtnConfirmar: TBitBtn
            Left = 0
            Top = 1
            Width = 81
            Height = 25
            Caption = 'Aplicar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ModalResult = 1
            ParentFont = False
            TabOrder = 0
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888002222200
              88888887788888778F88887222222222088888788888888878F887A228822222
              208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
              22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
              22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
              220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
              2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
              8888888778FFFF77888888888777778888888888877777888888}
            Margin = 10
            NumGlyphs = 2
          end
          object btnExcluiAlterador: TBitBtn
            Left = 81
            Top = 1
            Width = 81
            Height = 25
            Caption = 'Excluir'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ModalResult = 1
            ParentFont = False
            TabOrder = 1
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888009191900
              88888887788888778F88887991919191088888788888888878F8879919191919
              108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
              19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
              19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
              190878F877787778887887917F919F71908887F88788878887F8879919191919
              1088878F88888888878888799191919108888878FF88888F7888888779999977
              8888888778FFFF77888888888777778888888888877777888888}
            Margin = 10
            NumGlyphs = 2
          end
        end
        object btnRefreshAlterador: TfcShapeBtn
          Left = 16
          Top = 284
          Width = 89
          Height = 29
          Caption = 'Atualizar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888888888888FFFFFF88888800008888844444488888888F88F7777778F88888
            000024884222222448888877FF788888877F888800002244222222222488887F
            7788FFFFF887F8880000222222AAAAA22248887F888F77777F887F8800002222
            2A88888A2224887F88F7888887F887F80000222228888888A224887F8878F888
            887FF7F80000222222888888A444887FFFF78F88887777880000AAAAAAA88888
            8888887777777888888888880000888888888888888888888888888888FFFFFF
            00008888888888844444488FFFF888888777777F0000A444888888A222224877
            77F888887F88887F0000A2248888888A2222487F878F888887F8887F00008A22
            48888844222248878878FFFF7788887F00008A222444442222224887F8877777
            888FF87F000088A2222222222AA248887FF888888FF77F780000888AA222222A
            A88A8888877FFFFFF7788788000088888AAAAAA8888888888887777778888888
            0000}
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 8
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
        end
        object chkRepetirAlterador: TCheckBox
          Left = 72
          Top = 236
          Width = 193
          Height = 19
          Caption = 'Aplicar alteradore '
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          Visible = False
          OnClick = chkParcelarClick
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 737
    inherited tb97Fundo: TToolbar97
      Left = 565
      DockPos = 645
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 371
    Width = 737
    Height = 43
    Align = alBottom
    TabOrder = 2
    object lblProgress: TLabel
      Left = 16
      Top = 4
      Width = 140
      Height = 13
      Caption = 'Gerando Lançamentos...'
      Visible = False
    end
    object lblContador: TLabel
      Left = 628
      Top = 4
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = '00000 de 00000'
      Visible = False
    end
    object ProgressBar: TProgressBar
      Left = 16
      Top = 18
      Width = 705
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 0
      Visible = False
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
  object dsRateio: TwwDataSource
    DataSet = qryRateio
    Left = 187
    Top = 366
  end
  object updRateio: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPOXIMOVEL'
      'set'
      '  GXIPERCENTRATEIO = :GXIPERCENTRATEIO'
      'where'
      '  IDGRUPORATEIO = :OLD_IDGRUPORATEIO and'
      '  IDIMOVEL = :OLD_IDIMOVEL')
    InsertSQL.Strings = (
      'insert into GRUPOXIMOVEL'
      '  (IDGRUPORATEIO, IDIMOVEL, GXIPERCENTRATEIO)'
      'values'
      '  (:IDGRUPORATEIO, :IDIMOVEL, :GXIPERCENTRATEIO)')
    DeleteSQL.Strings = (
      'delete from GRUPOXIMOVEL'
      'where'
      '  IDGRUPORATEIO = :OLD_IDGRUPORATEIO and'
      '  IDIMOVEL = :OLD_IDIMOVEL')
    Left = 193
    Top = 306
  end
  object updAlterador: TUpdateSQL
    ModifySQL.Strings = (
      'update ALTERALANCIMOVEL'
      'set'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  CODALTERADOR = :CODALTERADOR,'
      '  CODTIPIMOVEL = :CODTIPIMOVEL,'
      '  VLRALTERADOR = :VLRALTERADOR'
      'where'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO')
    InsertSQL.Strings = (
      'insert into ALTERALANCIMOVEL'
      '  (IDDOCUMENTO, CODALTERADOR, CODTIPIMOVEL,VLRALTERADOR)'
      'values'
      '  (:IDDOCUMENTO, :CODALTERADOR, :CODTIPIMOVEL, :VLRALTERADOR)')
    DeleteSQL.Strings = (
      'delete from ALTERALANCIMOVEL'
      'where'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO')
    Left = 312
    Top = 384
  end
  object qryAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   AL.IDDOCUMENTO,'
      '   AL.CODALTERADOR,'
      '   AL.VLRALTERADOR,'
      '   AL.CODTIPIMOVEL,'
      '   TA.DESCRICAO'
      ''
      'FROM'
      '   ALTERALANCIMOVEL AL, TIPOALTERADOR TA'
      ''
      'WHERE'
      '   ( AL.IDDOCUMENTO =:PIDDOCUMENTO )'
      '   AND ( AL.CODALTERADOR = TA.CODALTERADOR )'
      ''
      'ORDER BY'
      '   TA.DESCRICAO'
      ' ')
    UpdateObject = updAlterador
    ValidateWithMask = True
    Left = 312
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryAlteradorDESCRICAO: TStringField
      DisplayLabel = 'Tipo do Alterador'
      DisplayWidth = 66
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPOALTERADOR.DESCRICAO'
      Size = 35
    end
    object qryAlteradorIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'BASEDADOS.ALTERALANCIMOVEL.IDDOCUMENTO'
      Visible = False
    end
    object qryAlteradorCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Origin = 'BASEDADOS.ALTERALANCIMOVEL.CODALTERADOR'
      Visible = False
    end
    object qryAlteradorVLRALTERADOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 15
      FieldName = 'VLRALTERADOR'
      Origin = 'BASEDADOS.ALTERALANCIMOVEL.VLRALTERADOR'
    end
    object qryAlteradorCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'BASEDADOS.ALTERALANCIMOVEL.CODTIPIMOVEL'
      Size = 5
    end
  end
  object dsAlterador: TwwDataSource
    DataSet = qryAlterador
    Left = 312
    Top = 360
  end
  object cdsReceita: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 473
    Top = 164
    Data = {
      770900009619E0BD01000000180000000C002000000003000000A50111494454
      49504F435553544F524543494D4F08000400000000000F44455343435553544F
      524543494D4F0100490000000100055749445448020002003C0009434F445449
      50444F43080004000000000008524543435553544F0100490000000200075355
      4254595045020049000A00466978656443686172000557494454480200020001
      000E4944524543454954415245454D42080004000000000011464C474F425249
      47414F5243505245535408000400000000000C464C474F42524947414F524308
      000400000000000C464C475245454D424F4C534F010049000000020007535542
      54595045020049000A0046697865644368617200055749445448020002000100
      0849444D4F44554C4F08000400000000000D49445449504F4445535045534108
      0004000000000009464C4744494152494F010049000000020007535542545950
      45020049000A0046697865644368617200055749445448020002000100084453
      435F5449504F01004900000001000557494454480200020008000100044C4349
      440400010009080000000055040000000000C056401754656C65666F6E652028
      61207265656D626F6C7361722900000000000018400152000000000000504001
      4E075265636569746100005504000000000000244007416C756775656C000000
      000000184001520000000000005040014E075265636569746100005504000000
      000000004013436F6E66697373616F2064652044697669646100000000000018
      4001520000000000005040014E07526563656974610000550400000000000010
      40135265656D626F6C736F73206469766572736F730000000000002040015200
      00000000005040014E0752656365697461000055040000000000001840125265
      656D626F6C736F20646520495054552000000000000020400152000000000000
      5040014E0752656365697461000055040000000000001C40175265656D626F6C
      736F20646520436F6E646F6D696E696F00000000000020400152000000000000
      5040014E0752656365697461000055040000000000003E40105265656D626F6C
      736F20495054552032000000000000204001520000000000005040014E075265
      63656974610000550400000000008042401263657373E36F2064652064697265
      69746F73000000000000184001520000000000005040014E0752656365697461
      0000550400000000000043400B416C756775656C20312F320000000000001840
      01520000000000005040014E0752656365697461000055040000000000804440
      104D756C7461207265736369736F726961000000000000204001520000000000
      005040014E075265636569746100005504000000000080484010496D706F7374
      6F2064652052656E6461000000000000204001520000000000005040014E0752
      656365697461000055040000000000804940135265656D626F6C736F20646520
      53656775726F000000000000204001520000000000005040014E075265636569
      7461000045040000000000804A401652656365697461204573746163696F6E61
      6D656E746F000000000000184001520000000000000000000000000000504001
      4E0752656365697461000045040000000000004B400C5265656D622E204C6967
      68740000000000002040015200000000000000000000000000005040014E0752
      656365697461000045040000000000004C401D5265656D626F6C736F20646520
      456E657267696120456C65747269636100000000000020400152000000000000
      00000000000000005040014E0752656365697461000045040000000000004D40
      1A5265656D626F6C736F207461786120646520496E63656E64696F0000000000
      002040015200000000000000000000000000005040014E075265636569746100
      0045040000000000804D401A5265656D626F6C736F20456E657267696120456C
      E974726963610000000000002040015200000000000000000000000000005040
      014E0752656365697461000045040000000000004E40195265656D626F6C736F
      20617220636F6E646963696F6E61646F00000000000020400152000000000000
      00000000000000005040014E0752656365697461000045040000000000804E40
      114F7574726F73205265656D626F6C736F730000000000002040015200000000
      000000000000000000005040014E075265636569746100004504000000000080
      4F400750617263656C6100000000000020400152000000000000000000000000
      00005040014E0752656365697461000045040000000000405040104D554C5441
      20524553434953D3524941000000000000204001520000000000000000000000
      0000005040014E07526563656974610000450400000000008050400653454755
      524F0000000000002040015200000000000000000000000000005040014E0752
      656365697461000055040000000000804C40145265636569746120646520416C
      69656E61E7E36F000000000000204001520000000000005040014E0752656365
      697461000055150000000000405140244D414E5554454EC7C34F204445205052
      C944494F53202841205245454D424F4C53415229000000000000184001520752
      656365697461000055150000000000805140244D414E5554454EC7C34F204445
      205052C944494F53202841205245454D424F4C53415229000000000000184001
      520752656365697461000055150000000000C05240244D414E5554454EC7C34F
      204445205052C944494F53202841205245454D424F4C53415229000000000000
      36400152075265636569746100005504000000000000544014414C49454E41C7
      C34F20444520494DD356454953000000000000204001520000000000004B4001
      4E0752656365697461000055040000000000C054401450524F4A45C7C34F2044
      452050415243454C4153000000000000204001520000000000E06040014E0752
      6563656974610000550400000000000055401C414D4F5254495A4143414F2044
      4F2046494E414E4349414D454E544F000000000000204001520000000000E060
      40014E07526563656974610000550400000000008055401B4A55524F53204520
      434F52524543414F2044412050415243454C4100000000000020400152000000
      0000E06040014E07526563656974610000550400000000004056401350455244
      4153204E4120414C49454E41C7C34F000000000000204001520000000000E060
      40014E0752656365697461000055040000000000005A4007416E656C69736100
      0000000000184001520000000000005040014E0752656365697461}
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      T.IDTIPOCUSTORECIMO,'
      '      T.DESCCUSTORECIMO,'
      '      T.CODTIPDOC,'
      '      T.RECCUSTO,'
      '      T.IDRECEITAREEMB,'
      '      T.FLGOBRIGAORCPREST,'
      '      T.FLGOBRIGAORC,'
      '      T.FLGREEMBOLSO,'
      '      T.IDMODULO,'
      '      T.IDTIPODESPESA,'
      '      T.FLGDIARIO,'
      
        '      DECODE(T.RECCUSTO,'#39'C'#39','#39'Despesa'#39','#39'R'#39','#39'Receita'#39','#39'Operação'#39') ' +
        'AS DSC_TIPO'
      'FROM  TIPOCUSTORECIMOV T'
      'WHERE RECCUSTO = '#39'R'#39)
    ClientDataSet = cdsReceita
    Left = 683
    Top = 3
  end
  object qryBuscaContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CI.IDCONTRATOIMOVEL,'
      '       CI.IDLOCATARIO,'
      '       CI.CONNUMERO,'
      '       CI.CONNOME,'
      '       CI.CONNUMERO || '#39' - '#39' || CI.CONNOME AS CONTRATO_EXTENSO,'
      
        '       DECODE(CI.FLGSTATUS, '#39'S'#39', '#39'Suspenso'#39', '#39'R'#39', '#39'Rescindido'#39', ' +
        #39'V'#39', '#39'Vigente'#39', '#39'Encerrado'#39') AS STATUS,   -- SOL 1077772-5681'
      '       CXI.CIMDTINI,  -- SOL 1077772-5681'
      '       CXI.CIMDTFIM  -- SOL 1077772-5681'
      '  FROM CONTRATOIMOVEL CI, CONTRATOXIMOVEL CXI'
      ' WHERE CXI.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL'
      '   AND CXI.IDIMOVEL = :IDIMOVEL'
      
        '   AND (CXI.CIMDTFIM IS NOT NULL AND TO_CHAR(:DATALANCTO,'#39'YYYYMM' +
        #39') BETWEEN TO_CHAR(CXI.CIMDTINI,'#39'YYYYMM'#39') AND TO_CHAR(CXI.CIMDTF' +
        'IM,'#39'YYYYMM'#39') OR'
      
        '       (CXI.CIMDTFIM IS NULL AND TO_CHAR(:DATALANCTO,'#39'YYYYMM'#39') >' +
        '= TO_CHAR(CXI.CIMDTINI,'#39'YYYYMM'#39')) )'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 436
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATALANCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATALANCTO'
        ParamType = ptUnknown
      end>
    object qryBuscaContratoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryBuscaContratoIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
    end
    object qryBuscaContratoCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryBuscaContratoCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object qryBuscaContratoCONTRATO_EXTENSO: TStringField
      FieldName = 'CONTRATO_EXTENSO'
      Size = 83
    end
    object qryBuscaContratoSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 10
    end
    object qryBuscaContratoCIMDTINI: TDateTimeField
      FieldName = 'CIMDTINI'
    end
    object qryBuscaContratoCIMDTFIM: TDateTimeField
      FieldName = 'CIMDTFIM'
    end
  end
  object qryContratoDoImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CXI.IDCONTRATOIMOVEL'
      'FROM'
      '   CONTRATOXIMOVEL CXI,'
      '   CONTRATOIMOVEL  CON'
      'WHERE'
      '       CXI.IDIMOVEL         =:PIDIMOVEL'
      '   AND CXI.IDCONTRATOIMOVEL = CON.IDCONTRATOIMOVEL'
      '   AND CON.FLGTIPOCONTRATO  = '#39'L'#39
      '   AND CON.FLGSTATUS        = '#39'V'#39)
    ValidateWithMask = True
    Left = 496
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptInput
      end>
    object qryContratoDoImovelIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'BASEDADOS.CONTRATOXIMOVEL.IDCONTRATOIMOVEL'
    end
  end
  object qryReceitaContratual: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOCUSTORECIMO'
      'FROM '
      '   CONTRATOIMOVEL '
      'WHERE'
      '  IDCONTRATOIMOVEL =:PIDCONTRATOIMOVEL')
    ValidateWithMask = True
    Left = 583
    Top = 65533
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptInput
      end>
    object qryReceitaContratualIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.IDTIPOCUSTORECIMO'
    end
  end
  object Query1: TQuery
    SQL.Strings = (
      'SELECT IM.IDIMOVEL, IM.IMONOME AS NOME_MESTRE,'
      
        '       (ROUND (REC_DES.TOT_RECEBER + NVL(COR.VLRCORRECAO,0) - RE' +
        'C_DES.RECEBIDO)) AS TOT_RECEBER'
      'FROM IMOVEL IM,'
      '   ( SELECT I.IDIMOVELMESTRE,'
      '            SUM('
      
        '                DECODE(RTRIM(LD.OPERACAO),  '#39'1'#39', DECODE(D.RECPAG' +
        ', '#39'R'#39', DECODE(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB *' +
        ' (-1)), 0), 0) +'
      
        '                DECODE(RTRIM(LD.OPERACAO),  '#39'2'#39', DECODE(D.RECPAG' +
        ', '#39'R'#39', DECODE(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB *' +
        ' (-1)), 0), 0) +'
      
        '                DECODE(RTRIM(LD.OPERACAO),  '#39'3'#39', DECODE(D.RECPAG' +
        ', '#39'R'#39', DECODE(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB *' +
        ' (-1)), 0), 0) +'
      
        '                DECODE(RTRIM(LD.OPERACAO),  '#39'4'#39', DECODE(D.RECPAG' +
        ', '#39'R'#39', DECODE(LD.DEBCRE, '#39'D'#39', LD.VALOR * LI.VLRLANCRECEB / TRD.V' +
        'ALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0)'
      '                ) AS TOT_RECEBER,'
      
        '            SUM(DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG,' +
        ' '#39'R'#39', DECODE(LD.DEBCRE, '#39'C'#39', LD.VALOR * LI.VLRLANCRECEB / TRD.VA' +
        'LOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0)) AS ' +
        'RECEBIDO'
      
        '     FROM DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL LI, TIP' +
        'OIMOVEL T, CONTRATOIMOVEL C, IMOVEL I,'
      '        ( SELECT CODDOCUMENTO, VALOR'
      '          FROM LANCTODOCUM'
      
        '          WHERE RTRIM(OPERACAO) = '#39'1'#39' OR RTRIM(OPERACAO) = '#39'2'#39' O' +
        'R RTRIM(OPERACAO) = '#39'3'#39') TRD'
      '     WHERE ( LI.IDCONTRATOIMOVEL IS NOT NULL )'
      '       AND ( LI.CODDOCUMENTO   = D.CODDOCUMENTO )'
      '       AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      
        '       AND ( LD.DATALANCTO <= TO_DATE('#39'12/02/2005'#39', '#39'DD/MM/YYYY'#39 +
        ') )'
      '       AND ( C.FLGTIPOCONTRATO = '#39'L'#39' )'
      '       AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )'
      '       AND ( D.CODDOCUMENTO = TRD.CODDOCUMENTO )'
      '       AND ( LI.CODTIPIMOVEL = T.CODTIPIMOVEL )'
      '       AND ( LI.IDIMOVEL = I.IDIMOVEL )'
      
        '       AND ( (LD.CODALTERADOR IS NULL) OR (LD.CODALTERADOR IN(T.' +
        'CODALTMULTA, T.CODALTJUROS, T.CODALTCORRMON)'
      '       AND LD.DATALANCTO < TO_DATE('#39'31/12/2004'#39','#39'DD/MM/YYYY'#39')'
      
        '       AND NOT EXISTS ( SELECT 1 FROM LANCOPERDIAIMOB WHERE CODD' +
        'OCUMENTO = LD.CODDOCUMENTO ) ) OR (LD.CODALTERADOR <> NVL(T.CODA' +
        'LTMULTA,0)'
      '       AND LD.CODALTERADOR <> NVL(T.CODALTJUROS,0)'
      '       AND LD.CODALTERADOR <> NVL(T.CODALTCORRMON,0)) )'
      
        '       AND ( (LI.DATALIMITE IS NOT NULL AND LI.DATALIMITE <= TO_' +
        'DATE('#39'01/03/2006'#39', '#39'DD/MM/YYYY'#39')) OR'
      
        '             (LI.DATALIMITE IS NULL AND LI.DATAVENCIMENTO <= TO_' +
        'DATE('#39'01/03/2006'#39', '#39'DD/MM/YYYY'#39')) )'
      '     GROUP BY I.IDIMOVELMESTRE ) REC_DES,'
      ''
      
        '   ( SELECT I.IDIMOVELMESTRE, ROUND( SUM(OP.VLRCORRECAO * LI.VLR' +
        'LANCRECEB / TOT.VLR_TOTAL), 2) AS VLRCORRECAO'
      '     FROM LANCAMENTOSIMOVEL LI, IMOVEL I,'
      '        ( SELECT CODDOCUMENTO, SUM(VLRLANCRECEB) AS VLR_TOTAL'
      '          FROM LANCAMENTOSIMOVEL'
      '          WHERE IDMODULO = '#39'64'#39
      '            AND RECPAG = '#39'R'#39
      '          GROUP BY CODDOCUMENTO ) TOT,'
      ''
      '        ( SELECT LO.CODDOCUMENTO, SUM(LO.VLRACUM) AS VLRCORRECAO'
      '          FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,'
      
        '             ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULT' +
        'DIA'
      '               FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2'
      
        '               WHERE ( LO2.IDOPERACAO = PI2.IDOPERATUALCM OR LO2' +
        '.IDOPERACAO = PI2.IDOPERATUALJUROS OR LO2.IDOPERACAO = PI2.IDOPE' +
        'RATUALMULTA )'
      
        '                 AND ( LO2.DATAOPER <= TO_DATE('#39'12/02/2005'#39', '#39'DD' +
        '/MM/YYYY'#39') )'
      
        '                 AND ( LO2.DATAOPER <= TO_DATE('#39'12/02/2005'#39', '#39'DD' +
        '/MM/YYYY'#39') )'
      '               GROUP BY LO2.CODDOCUMENTO ) UD'
      
        '          WHERE ( LO.IDOPERACAO = PI.IDOPERATUALCM OR LO.IDOPERA' +
        'CAO = PI.IDOPERATUALJUROS OR LO.IDOPERACAO = PI.IDOPERATUALMULTA' +
        ' )'
      '            AND LO.DATAOPER     = UD.ULTDIA'
      '            AND LO.CODDOCUMENTO = UD.CODDOCUMENTO (+)'
      '          GROUP BY LO.CODDOCUMENTO ) OP'
      '     WHERE LI.CODDOCUMENTO = OP.CODDOCUMENTO'
      '       AND LI.CODDOCUMENTO = TOT.CODDOCUMENTO'
      '       AND LI.IDIMOVEL = I.IDIMOVEL'
      '     GROUP BY I.IDIMOVELMESTRE ) COR'
      'WHERE ( (REC_DES.TOT_RECEBER - REC_DES.RECEBIDO) <> 0 )'
      '  AND ( IM.IDIMOVEL = REC_DES.IDIMOVELMESTRE )'
      '  AND ( IM.IDIMOVEL = COR.IDIMOVELMESTRE(+) )'
      'ORDER BY IM.IMONOME'
      '')
    Left = 160
    Top = 170
  end
  object qryLocalizaDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT IDDOCUMENTO FROM LANCAMENTOSIMOVEL'
      'WHERE IDDOCUMENTO = :PIDDOCUMENTO'
      ' ')
    ValidateWithMask = True
    Left = 408
    Top = 108
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryLocalizaDocumentoIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.IDDOCUMENTO'
    end
  end
  object cdsBloqueioImob: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 249
    Top = 193
  end
  object qryRateio: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '-- esta query sera reescrita em tempo de execução'
      
        '-- pois se for escolhido um filtro pelo contrato ele buscara o i' +
        'móvel tambem em qq grupo rateio'
      
        'SELECT SUBSTR(DECODE(I.IDIMOVELPAI,NULL,IM.IMONOME||'#39' - '#39'||I.IMO' +
        'NOME,'
      '       DECODE(I.IMONOME,NULL,IM.IMONOME||'#39' - '#39'||IP.IMONOME,'
      
        '              IM.IMONOME||'#39' - '#39'||IP.IMONOME||'#39' - '#39'||I.IMONOME) )' +
        ',1,100) AS IMOVEL_EXTENSO,'
      '       I.IMOCODIGO, I.CODTIPIMOVEL,'
      '       CXI.CONVLRAJUSTADO, CXI.CIMVLRAJUSTADO,'
      '       0 AS GXIPERCENTRATEIO,'
      
        '       CXI.CONNUMERO, CXI.CONNOME, CXI.IDLOCATARIO, 0 AS VALOR, ' +
        '0 AS VLR_PARCELA, CXI.IDCONTRATOIMOVEL,'
      '       DECODE(CXI.FLGRATEIO,NULL,100,'
      '       DECODE(CXI.FLGRATEIO, 0, 100, '
      
        '       DECODE(CXI.CIMPERCENTRATEIO, NULL, 0, CXI.CIMPERCENTRATEI' +
        'O))) AS PERCENT_RATEIO, '
      '       CXI.CIMDESCRICAO, '
      
        '       I.IMOAREA, I.IDIMOVEL,  -- PARA RATEAR RECEITAS POR CONTR' +
        'ATO'
      
        '       I.IMOFRACAOIDEAL        -- ATUALIZACAO PARA FCRT ELES CAL' +
        'CULAM PERCENTUAL POR AQUI, O DEFAULT E IMOAREA'
      'FROM IMOVEL I, IMOVEL IM, IMOVEL IP, '
      
        '     ( SELECT C.IDCONTRATOIMOVEL, CXI.IDIMOVEL, CXI.FLGRATEIO, C' +
        'XI.CIMPERCENTRATEIO, '
      '              C.CONNUMERO,        C.CONNOME,    C.IDLOCATARIO,'
      
        '              CXI.CIMDESCRICAO, SUM(CXI.CIMVLRAJUSTADO) AS CONVL' +
        'RAJUSTADO,'
      '              CXI.CIMVLRAJUSTADO'
      '       FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI'
      '       WHERE C.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL'
      ''
      
        '       group by  C.IDCONTRATOIMOVEL, CXI.IDIMOVEL, CXI.FLGRATEIO' +
        ', CXI.CIMPERCENTRATEIO,'
      
        '              C.CONNUMERO,        C.CONNOME,    C.IDLOCATARIO,  ' +
        'CXI.CIMDESCRICAO,  CXI.CIMVLRAJUSTADO            '
      '      ) CXI'
      'WHERE ( I.IDPESSOA = :PIDPESSOA )'
      
        '  AND ( (:PIDCONTRATOIMOVEL IS NULL) OR (CXI.IDCONTRATOIMOVEL = ' +
        ':PIDCONTRATOIMOVEL) )'
      '  AND ( I.IDIMOVELMESTRE     = IM.IDIMOVEL )'
      '  AND ( I.IDIMOVELPAI        = IP.IDIMOVEL(+) ) '
      '  AND ( I.IDIMOVEL           = CXI.IDIMOVEL(+) )'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updRateio
    ValidateWithMask = True
    Left = 190
    Top = 251
    ParamData = <
      item
        DataType = ftString
        Name = 'PIDPESSOA'
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
      end>
    object qryRateioIMOCODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object qryRateioIMOVEL_EXTENSO: TStringField
      DisplayLabel = 'Imóvel '
      DisplayWidth = 37
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryRateioCODTIPIMOVEL: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 6
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryRateioGXIPERCENTRATEIO: TFloatField
      DisplayLabel = 'Rateio (I)'
      DisplayWidth = 9
      FieldName = 'GXIPERCENTRATEIO'
      DisplayFormat = '#0.0000 %'
      EditFormat = '#0 %'
    end
    object qryRateioPERCENT_RATEIO: TFloatField
      DisplayLabel = 'Rateio (C)'
      DisplayWidth = 9
      FieldName = 'PERCENT_RATEIO'
      DisplayFormat = '#0.0000 %'
      EditFormat = '#0 %'
    end
    object qryRateioVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 11
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,###,##0.00'
      EditFormat = '#0'
    end
    object qryRateio_CONTRATOEXTENSO: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 23
      FieldKind = fkCalculated
      FieldName = '_CONTRATOEXTENSO'
      OnGetText = qryRateio_CONTRATOEXTENSOGetText
      Size = 83
      Calculated = True
    end
    object qryRateioIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryRateioCONNUMERO: TStringField
      DisplayWidth = 20
      FieldName = 'CONNUMERO'
      Visible = False
    end
    object qryRateioCONNOME: TStringField
      DisplayWidth = 60
      FieldName = 'CONNOME'
      Visible = False
      Size = 60
    end
    object qryRateioIDLOCATARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLOCATARIO'
      Visible = False
    end
    object qryRateioVLR_PARCELA: TFloatField
      DisplayWidth = 10
      FieldName = 'VLR_PARCELA'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryRateioIMOAREA: TFloatField
      DisplayWidth = 10
      FieldName = 'IMOAREA'
      Visible = False
    end
    object qryRateioIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryRateioIMOFRACAOIDEAL: TFloatField
      DisplayWidth = 10
      FieldName = 'IMOFRACAOIDEAL'
      Visible = False
    end
    object qryRateioCIMDESCRICAO: TStringField
      DisplayWidth = 60
      FieldName = 'CIMDESCRICAO'
      Size = 60
    end
    object qryRateioCONVLRAJUSTADO: TFloatField
      FieldName = 'CONVLRAJUSTADO'
    end
    object qryRateioCIMVLRAJUSTADO: TFloatField
      FieldName = 'CIMVLRAJUSTADO'
    end
  end
  object qryZerado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '-- esta query sera reescrita em tempo de execução'
      
        '-- pois se for escolhido um filtro pelo contrato ele buscara o i' +
        'móvel tambem em qq grupo rateio'
      'SELECT'
      '   ( IM.IMONOME||'#39' - '#39'||I.IMONOME ) AS IMOVEL_EXTENSO,'
      '   I.IMOCODIGO, I.CODTIPIMOVEL,'
      '   GXI.GXIPERCENTRATEIO,'
      '   C.CONNUMERO, C.CONNOME, C.IDLOCATARIO,'
      
        '   0 AS VALOR, 0 AS VLR_PARCELA, C.IDCONTRATOIMOVEL,CXI.CIMDESCR' +
        'ICAO,'
      ''
      '   DECODE(CXI.FLGRATEIO, NULL, 100,'
      '      DECODE(CXI.FLGRATEIO, 0, 100,'
      
        '         DECODE(CXI.CIMPERCENTRATEIO, NULL, 0, CXI.CIMPERCENTRAT' +
        'EIO))) AS PERCENT_RATEIO,'
      ''
      '   I.IMOAREA, I.IDIMOVEL,  -- PARA RATEAR RECEITAS POR CONTRATO'
      
        '   I.IMOFRACAOIDEAL        -- ATUALIZACAO PARA FCRT ELES CALCULA' +
        'M PERCENTUAL POR AQUI, O DEFAULT E IMOAREA'
      ''
      'FROM'
      
        '   IMOVEL I, IMOVEL IM, CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI, G' +
        'RUPOXIMOVEL GXI'
      ''
      'WHERE'
      '   ( I.IDPESSOA = -1 )'
      '   AND ( (-1  IS NULL) OR (GXI.IDGRUPORATEIO = -1 ) )'
      '   AND ( (-1  IS NULL) OR (C.IDCONTRATOIMOVEL = -1 ) )'
      '   AND ( I.IDIMOVEL = GXI.IDIMOVEL(+) )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( I.IDIMOVEL = CXI.IDIMOVEL(+) )'
      '   AND ( CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) )'
      '   AND ( ( C.CONDATAFIM >= SYSDATE )'
      '       OR ( C.FLGINDETERMINADO = '#39'S'#39' ) )'
      ''
      'ORDER BY'
      '   GXI.GXIPERCENTRATEIO'
      ' '
      ' ')
    UpdateObject = UpdateZerado
    ValidateWithMask = True
    Left = 280
    Top = 296
    object StringField1: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object StringField2: TStringField
      DisplayLabel = 'Imóvel '
      DisplayWidth = 37
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object StringField3: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 6
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Rateio (I)'
      DisplayWidth = 9
      FieldName = 'GXIPERCENTRATEIO'
      DisplayFormat = '#0.0000 %'
      EditFormat = '#0 %'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Rateio (C)'
      DisplayWidth = 9
      FieldName = 'PERCENT_RATEIO'
      DisplayFormat = '#0.0000 %'
      EditFormat = '#0 %'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 11
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,###,##0.00'
      EditFormat = '#0'
    end
    object StringField4: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 23
      FieldKind = fkCalculated
      FieldName = '_CONTRATOEXTENSO'
      Size = 83
      Calculated = True
    end
    object FloatField4: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object StringField5: TStringField
      DisplayWidth = 20
      FieldName = 'CONNUMERO'
      Visible = False
    end
    object StringField6: TStringField
      DisplayWidth = 60
      FieldName = 'CONNOME'
      Visible = False
      Size = 60
    end
    object FloatField5: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLOCATARIO'
      Visible = False
    end
    object FloatField6: TFloatField
      DisplayWidth = 10
      FieldName = 'VLR_PARCELA'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object FloatField7: TFloatField
      DisplayWidth = 10
      FieldName = 'IMOAREA'
      Visible = False
    end
    object FloatField8: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object FloatField9: TFloatField
      DisplayWidth = 10
      FieldName = 'IMOFRACAOIDEAL'
      Visible = False
    end
    object StringField7: TStringField
      FieldName = 'CIMDESCRICAO'
      Size = 60
    end
  end
  object UpdateZerado: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPOXIMOVEL'
      'set'
      '  GXIPERCENTRATEIO = :GXIPERCENTRATEIO'
      'where'
      '  IDGRUPORATEIO = :OLD_IDGRUPORATEIO and'
      '  IDIMOVEL = :OLD_IDIMOVEL')
    InsertSQL.Strings = (
      'insert into GRUPOXIMOVEL'
      '  (IDGRUPORATEIO, IDIMOVEL, GXIPERCENTRATEIO)'
      'values'
      '  (:IDGRUPORATEIO, :IDIMOVEL, :GXIPERCENTRATEIO)')
    DeleteSQL.Strings = (
      'delete from GRUPOXIMOVEL'
      'where'
      '  IDGRUPORATEIO = :OLD_IDGRUPORATEIO and'
      '  IDIMOVEL = :OLD_IDIMOVEL')
    Left = 336
    Top = 284
  end
end
