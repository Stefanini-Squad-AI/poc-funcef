inherited frmExecLancRateio: TfrmExecLancRateio
  Left = 158
  Top = 159
  HelpContext = 640018
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Lançamento Rateado'
  ClientHeight = 436
  ClientWidth = 737
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 737
    Height = 354
    object lblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 316
      Height = 24
      Caption = 'Lançamento Rateado [Seleção]'
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
      Top = 33
      Width = 737
      Height = 321
      Align = alBottom
      TabOrder = 0
      OnPageChanged = ntbPrincipalPageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagSelecao'
        object Label22: TLabel
          Left = 392
          Top = 10
          Width = 97
          Height = 13
          Caption = 'Tipo de Despesa'
        end
        object Label1: TLabel
          Left = 16
          Top = 10
          Width = 100
          Height = 13
          Caption = 'Grupo de Imóveis'
        end
        object Label5: TLabel
          Left = 528
          Top = 50
          Width = 83
          Height = 13
          Caption = 'Nº Documento'
        end
        object Label10: TLabel
          Left = 16
          Top = 90
          Width = 120
          Height = 13
          Caption = 'Forma de Pagamento'
        end
        object Label13: TLabel
          Left = 16
          Top = 194
          Width = 129
          Height = 13
          Caption = 'Referência / Processo'
        end
        object Label7: TLabel
          Left = 360
          Top = 194
          Width = 75
          Height = 13
          Caption = 'Observações'
        end
        object Label8: TLabel
          Left = 16
          Top = 234
          Width = 92
          Height = 13
          Caption = 'Centro de Custo'
        end
        object Bevel3: TBevel
          Left = 16
          Top = 272
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object lblContaBancaria: TLabel
          Left = 392
          Top = 90
          Width = 88
          Height = 13
          Caption = 'Conta Bancária'
          Enabled = False
        end
        object DBcboTipoRecDes: TwwDBLookupCombo
          Left = 392
          Top = 24
          Width = 329
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCCUSTORECIMO'#9'30'#9'Tipo de Despesa')
          LookupTable = dtmLookImobiliario.qryLookTipoRecDes
          LookupField = 'IDTIPOCUSTORECIMO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object DBcboGrupo: TwwDBLookupCombo
          Left = 16
          Top = 24
          Width = 361
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
        end
        object btnContinuaSelecao: TfcShapeBtn
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
          TabOrder = 9
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuaSelecaoClick
        end
        object GroupBox1: TGroupBox
          Left = 16
          Top = 128
          Width = 705
          Height = 61
          TabOrder = 5
          object Label3: TLabel
            Left = 360
            Top = 16
            Width = 101
            Height = 13
            Caption = 'Data Lançamento'
          end
          object lblDataVencimento: TLabel
            Left = 240
            Top = 16
            Width = 98
            Height = 13
            Caption = 'Data Vencimento'
          end
          object Label15: TLabel
            Left = 16
            Top = 16
            Width = 135
            Height = 13
            Caption = 'Competência (mês/ano)'
          end
          object Label2: TLabel
            Left = 536
            Top = 16
            Width = 63
            Height = 13
            Caption = 'Valor Total'
          end
          object edtDataLanc: TCMDateTimePicker
            Left = 360
            Top = 30
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
          end
          object edtDataVenc: TCMDateTimePicker
            Left = 240
            Top = 30
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
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 160
            Top = 30
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
            OnChange = cboMesChange
            OnExit = cboMesChange
          end
          object edtVlrTotal: TRealEdit
            Left = 536
            Top = 30
            Width = 153
            Height = 21
            Alignment = taRightJustify
            Color = 12648447
            Lines.Strings = (
              '      0,00')
            TabOrder = 4
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object cboMes: TComboBox
            Left = 16
            Top = 30
            Width = 145
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
        end
        object DBcboFormaRecPag: TwwDBLookupCombo
          Left = 16
          Top = 104
          Width = 329
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'30'#9'DESCRICAO')
          LookupTable = dtmLookImobiliario.qryLookFormaRecPag
          LookupField = 'CODFORMA'
          Style = csDropDownList
          DropDownWidth = 113
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          OnExit = DBcboFormaRecPagExit
        end
        object edtReferenciaAP: TEdit
          Left = 16
          Top = 208
          Width = 329
          Height = 21
          MaxLength = 30
          TabOrder = 6
        end
        object edtNumDocumento: TEdit
          Left = 528
          Top = 64
          Width = 193
          Height = 21
          TabStop = False
          TabOrder = 3
        end
        object btnAtualizar: TfcShapeBtn
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
          TabOrder = 10
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnAtualizarClick
        end
        object memObs: TMemo
          Left = 360
          Top = 208
          Width = 361
          Height = 59
          MaxLength = 200
          TabOrder = 8
        end
        object DBcboCentroCusto: TwwDBLookupCombo
          Left = 16
          Top = 248
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
        inline molFornecedor1: TmolFornecedor
          Left = 8
          Top = 48
          Width = 513
          TabOrder = 2
          inherited btnBuscaForn: TBitBtn
            Left = 456
            OnClick = molFornecedor1btnBuscaFornClick
          end
          inherited btnLimpaForn: TBitBtn
            Left = 480
          end
          inherited edtRazaoSocial: TEdit
            Width = 289
          end
        end
        object dbCboContaBancaria: TwwDBLookupCombo
          Left = 392
          Top = 104
          Width = 329
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CONTACORRENTE'#9'15'#9'Cta. Corrente'#9'F'
            'NUMBANCO'#9'10'#9'Banco'#9'F'
            'NUMAGENCIA'#9'10'#9'Agência'#9'F'
            'FLGCONTAPREF'#9'5'#9'     Pref.'#9'F')
          LookupTable = dtmLookImobiliario.qryLookContaBancaria
          LookupField = 'IDCBANCARIA'
          Options = [loTitles]
          Style = csDropDownList
          DropDownWidth = 113
          Enabled = False
          TabOrder = 11
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagLancamentos'
        object Label12: TLabel
          Left = 20
          Top = 292
          Width = 54
          Height = 13
          Caption = 'a Ratear:'
        end
        object Label4: TLabel
          Left = 208
          Top = 292
          Width = 34
          Height = 13
          Caption = 'Total:'
        end
        object Bevel1: TBevel
          Left = 16
          Top = 272
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
          TabOrder = 6
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
                'IMOCODIGO'#9'8'#9'Código'
                'IMOVEL_EXTENSO'#9'44'#9'Imóvel '
                'CODTIPIMOVEL'#9'4'#9'Tipo'
                '_CONTRATOEXTENSO'#9'23'#9'Contrato'
                'GXIPERCENTRATEIO'#9'9'#9'Rateio (I)'
                'PERCENT_RATEIO'#9'9'#9'Rateio (C)'
                'VALOR'#9'11'#9'Valor')
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
        object btnConfirma: TfcShapeBtn
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
          TabOrder = 1
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnConfirmaClick
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
          TabOrder = 2
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
          Caption = 'Lançamentos a Gerar  '
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
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
            TabOrder = 0
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnTotalizaClick
          end
        end
        object chkRefazRateio: TCheckBox
          Left = 332
          Top = 249
          Width = 389
          Height = 17
          Caption = 'Recalcular os percentuais de acordo com os valores informados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object edtTotalLanc: TRealEdit
          Left = 248
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
        object edtTotalInformado: TRealEdit
          Left = 80
          Top = 288
          Width = 105
          Height = 21
          Alignment = taRightJustify
          Color = 12648447
          Enabled = False
          Lines.Strings = (
            '      0,00')
          TabOrder = 5
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
          TabOrder = 7
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuarLancClick
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'pgcAlteradores'
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
          Top = 272
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
          TabOrder = 0
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnVoltarClick
        end
        object fcShapeBtn2: TfcShapeBtn
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
          TabOrder = 1
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnConfirmaClick
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
          TabOrder = 2
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
          TabOrder = 3
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
          TitleFont.Charset = DEFAULT_CHARSET
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
          TabOrder = 5
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
          TabOrder = 6
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
          TabOrder = 7
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 737
    inherited tb97Fundo: TToolbar97
      Left = 564
      DockPos = 564
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 354
    Width = 737
    Height = 49
    Align = alBottom
    TabOrder = 2
    object lblProgress: TLabel
      Left = 16
      Top = 10
      Width = 140
      Height = 13
      Caption = 'Gerando Lançamentos...'
      Visible = False
    end
    object lblContador: TLabel
      Left = 628
      Top = 10
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = '00000 de 00000'
      Visible = False
    end
    object ProgressBar: TProgressBar
      Left = 16
      Top = 24
      Width = 705
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 0
      Visible = False
    end
  end
  object dsRateio: TwwDataSource
    DataSet = qryRateio
    Left = 424
    Top = 384
  end
  object updRateio: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPOXIMOVEL'
      'set'
      '  GXIPERCENTRATEIO = :GXIPERCENTRATEIO,'
      '  IDIMOVEL = :IDIMOVEL'
      'where'
      '  GXIPERCENTRATEIO = :OLD_GXIPERCENTRATEIO and'
      '  IDIMOVEL = :OLD_IDIMOVEL')
    InsertSQL.Strings = (
      'insert into GRUPOXIMOVEL'
      '  (GXIPERCENTRATEIO, IDIMOVEL)'
      'values'
      '  (:GXIPERCENTRATEIO, :IDIMOVEL)')
    DeleteSQL.Strings = (
      'delete from GRUPOXIMOVEL'
      'where'
      '  GXIPERCENTRATEIO = :OLD_GXIPERCENTRATEIO and'
      '  IDIMOVEL = :OLD_IDIMOVEL')
    Left = 424
    Top = 372
  end
  object qryUpdateRateio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   GRUPOXIMOVEL GXI'
      ''
      'SET'
      '   GXI.GXIPERCENTRATEIO =:PGXIPERCENTRATEIO'
      ''
      'WHERE'
      '   ( GXI.IDGRUPORATEIO =:PIDGRUPORATEIO )'
      '   AND ( GXI.IDIMOVEL =:PIDIMOVEL )')
    ValidateWithMask = True
    Left = 248
    Top = 360
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PGXIPERCENTRATEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPORATEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end>
  end
  object qryRateio: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   ( IM.IMONOME||'#39' - '#39'||I.IMONOME ) AS IMOVEL_EXTENSO,'
      ''
      '   I.IMOCODIGO, I.CODTIPIMOVEL,'
      ''
      '   GXI.GXIPERCENTRATEIO, GXI.IDIMOVEL,'
      ''
      '   C.IDCONTRATOIMOVEL, C.CONNUMERO, C.CONNOME,'
      ''
      '   0 AS VALOR,'
      '   0 AS PERCENT_RATEIO'
      ''
      'FROM'
      
        '   GRUPOXIMOVEL GXI, IMOVEL I, IMOVEL IM, CONTRATOXIMOVEL CXI, C' +
        'ONTRATOIMOVEL C'
      ''
      'WHERE'
      '   ( GXI.IDGRUPORATEIO =:PIDGRUPORATEIO )'
      '   AND ( GXI.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( I.IDIMOVEL = CXI.IDIMOVEL )'
      '   AND ( CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      ''
      ' ')
    UpdateObject = updRateio
    ValidateWithMask = True
    Left = 424
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPORATEIO'
        ParamType = ptUnknown
      end>
    object qryRateioIMOCODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 8
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object qryRateioIMOVEL_EXTENSO: TStringField
      DisplayLabel = 'Imóvel '
      DisplayWidth = 44
      FieldName = 'IMOVEL_EXTENSO'
      ReadOnly = True
      Size = 123
    end
    object qryRateioCODTIPIMOVEL: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 4
      FieldName = 'CODTIPIMOVEL'
      Size = 5
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
    object qryRateioGXIPERCENTRATEIO: TFloatField
      DisplayLabel = 'Rateio (I)'
      DisplayWidth = 9
      FieldName = 'GXIPERCENTRATEIO'
      ReadOnly = True
      DisplayFormat = '#0.0000 %'
      EditFormat = '#0 %'
    end
    object qryRateioPERCENT_RATEIO: TFloatField
      DisplayLabel = 'Rateio (C)'
      DisplayWidth = 9
      FieldName = 'PERCENT_RATEIO'
      ReadOnly = True
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
    object qryRateioIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
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
  end
  object updAlterador: TUpdateSQL
    ModifySQL.Strings = (
      'update ALTERALANCIMOVEL'
      'set'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  CODALTERADOR = :CODALTERADOR,'
      '  VLRALTERADOR = :VLRALTERADOR'
      'where'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO')
    InsertSQL.Strings = (
      'insert into ALTERALANCIMOVEL'
      '  (IDDOCUMENTO, CODALTERADOR, VLRALTERADOR)'
      'values'
      '  (:IDDOCUMENTO, :CODALTERADOR, :VLRALTERADOR)')
    DeleteSQL.Strings = (
      'delete from ALTERALANCIMOVEL'
      'where'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO')
    Left = 336
    Top = 384
  end
  object qryAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   AL.IDDOCUMENTO,'
      '   AL.CODALTERADOR,'
      '   AL.VLRALTERADOR,'
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
      '   TA.DESCRICAO')
    UpdateObject = updAlterador
    ValidateWithMask = True
    Left = 336
    Top = 372
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
  end
  object dsAlterador: TwwDataSource
    DataSet = qryAlterador
    Left = 336
    Top = 360
  end
end
