inherited FrmDistratoContratual: TFrmDistratoContratual
  Left = 268
  Top = 136
  Caption = 'Distrato Contratual'
  ClientHeight = 461
  ClientWidth = 900
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 900
    Height = 422
    inherited PagControle: TPageControl
      Width = 898
      Height = 420
      ActivePage = tabLancDesp
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 890
          Height = 0
          Caption = ''
          Visible = False
        end
        object Label3: TLabel
          Left = 8
          Top = 44
          Width = 82
          Height = 13
          Caption = 'Data Proposta'
        end
        object Label48: TLabel
          Left = 8
          Top = 89
          Width = 91
          Height = 13
          Caption = 'Data Assinatura'
        end
        object Label19: TLabel
          Left = 151
          Top = 89
          Width = 90
          Height = 13
          Caption = 'Valor Avaliação'
        end
        object Label20: TLabel
          Left = 247
          Top = 89
          Width = 80
          Height = 13
          Caption = 'Valor Contabil'
        end
        object Label50: TLabel
          Left = 343
          Top = 89
          Width = 70
          Height = 13
          Caption = 'Valor Venda'
        end
        object Label1: TLabel
          Left = 151
          Top = 42
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
        object Label21: TLabel
          Left = 463
          Top = 42
          Width = 154
          Height = 13
          Caption = 'Responsável pelo Contrato'
        end
        object Label44: TLabel
          Left = 463
          Top = 89
          Width = 154
          Height = 13
          Caption = 'Administradora do Contrato'
        end
        object Label2: TLabel
          Left = 8
          Top = 2
          Width = 85
          Height = 13
          Caption = 'Nº do Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 115
          Top = 2
          Width = 103
          Height = 13
          Caption = 'Nome do Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edDataProp: TCMDateTimePicker
          Left = 8
          Top = 58
          Width = 102
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'CONDATAINICIO'
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
          Enabled = False
          ShowButton = False
          TabOrder = 0
        end
        object edDataAssin: TCMDateTimePicker
          Left = 8
          Top = 103
          Width = 102
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'CONDATAASSINATURA'
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
          Enabled = False
          ShowButton = False
          TabOrder = 2
        end
        object edValAvali: TDBRealEdit
          Left = 151
          Top = 103
          Width = 90
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '0,00')
          TabOrder = 3
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'CONVLRAJUSTADO'
          DataSource = ds
        end
        object edValContab: TDBRealEdit
          Left = 247
          Top = 103
          Width = 90
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRCONTABIL'
          DataSource = ds
        end
        object edValVenda: TDBRealEdit
          Left = 343
          Top = 103
          Width = 90
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRPROPOSTA'
          DataSource = ds
        end
        object pcCondPagto: TPageControl
          Left = 1
          Top = 136
          Width = 880
          Height = 256
          ActivePage = TabSheet4
          TabOrder = 7
          object TabSheet4: TTabSheet
            Caption = 'Condição de Pagamento'
            object grdCondPag: TwwDBGrid
              Left = 0
              Top = 0
              Width = 872
              Height = 228
              Selected.Strings = (
                'cal_Tipo'#9'7'#9'Tipo'#9'F'
                'DATAVENCIMENTO'#9'10'#9'Início'#9'F'
                'VLRFINANC'#9'13'#9'Valor '#9'F'
                'NUMPARCELAS'#9'7'#9'Nº Parc'#9'F'
                'cal_intervalo'#9'15'#9'Intervalo'#9'F'
                'cal_PerTaxa'#9'20'#9'Juros'#9'F'
                'DSCINDCORR'#9'12'#9'Ind. Correção'#9'F'
                'DSCINDPROJ'#9'12'#9'Ind. Projeção'#9'F'
                'MESREFREAJUSTE'#9'19'#9'Usa Indice Mes Anterior'#9'F'
                'cal_forma'#9'60'#9'Forma de Calculo'#9'F'
                'PERINDPROJ'#9'15'#9'Índice Projetado'#9'F'
                'DATACARENCIA'#9'12'#9'Carência'#9'F'
                'FLGJURCARENCIA'#9'3'#9'Juros na Carência'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsCondPag
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              UseTFields = False
              IndicatorColor = icBlack
            end
          end
        end
        object DBedtResponsavel: TDBEdit2
          Left = 463
          Top = 57
          Width = 362
          Height = 21
          TabStop = False
          DataField = 'NOMRESPONSAVEL'
          DataSource = ds
          Enabled = False
          TabOrder = 1
        end
        object dbEdtAdmin: TDBEdit2
          Left = 463
          Top = 104
          Width = 362
          Height = 21
          TabStop = False
          DataField = 'NOMADMINIMOVEL'
          DataSource = ds
          Enabled = False
          TabOrder = 6
        end
        object edtNumProp: TEdit
          Left = 8
          Top = 17
          Width = 105
          Height = 21
          Enabled = False
          TabOrder = 8
        end
        object edtNomProp: TEdit
          Left = 115
          Top = 17
          Width = 713
          Height = 21
          Enabled = False
          TabOrder = 9
        end
        object btnBuscaContrato: TBitBtn
          Left = 828
          Top = 16
          Width = 24
          Height = 22
          Hint = 'Busca contrato'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          OnClick = molProposta1btnBuscaPropClick
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
        object btnLimpaProp: TBitBtn
          Left = 852
          Top = 16
          Width = 24
          Height = 22
          Hint = 'Limpa a seleção de uma Proposta'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          OnClick = btnLimpaPropClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
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
        end
        object DBedtComprador: TDBEdit2
          Left = 151
          Top = 57
          Width = 282
          Height = 21
          TabStop = False
          DataField = 'RAZAOSOCIAL'
          DataSource = ds
          Enabled = False
          TabOrder = 12
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Top = 329
          Width = 890
          Height = 0
          Caption = ''
          Visible = False
        end
        object fcLabel2: TfcLabel
          Left = 0
          Top = 0
          Width = 890
          Height = 24
          Align = alTop
          Caption = 'Liquidar Parcelas'
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
        object Panel4: TPanel
          Left = 0
          Top = 24
          Width = 890
          Height = 27
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Parcelas Integradas'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dbgParc: TwwDBGrid
          Left = 0
          Top = 51
          Width = 890
          Height = 278
          Selected.Strings = (
            'NUMPARCELA'#9'7'#9'Parcela'#9'T'
            'DATAVENCIMENTO'#9'11'#9' Vencimento'#9'T'
            'CODDOCUMENTO'#9'15'#9'Documento'#9'F'
            'CAL_TIPO'#9'50'#9'Tipo'#9'F'
            'VLRPRESTACAO'#9'17'#9'Valor Prestação'#9'T'
            'VLRDEVIDO'#9'17'#9'Valor Devido'#9'T')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoSearchOwnerForm, ecoDisableDateTimePicker]
          Align = alTop
          DataSource = dsParc
          KeyOptions = []
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object GroupBox6: TGroupBox
          Left = 272
          Top = 334
          Width = 361
          Height = 60
          Caption = 'Alterador de desconto para liquidar documentos em aberto'
          TabOrder = 2
          object DBcboAlterador: TwwDBLookupCombo
            Left = 16
            Top = 23
            Width = 329
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            LookupTable = dtmLookImobiliario.qryLookAlteradorXTipoImo
            LookupField = 'CODALTERADOR'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
            OnChange = DBcboAlteradorChange
          end
        end
      end
      object tabLancDesp: TTabSheet
        Caption = 'tabLancDesp'
        ImageIndex = 2
        TabVisible = False
        object Label12: TLabel
          Left = 8
          Top = 8
          Width = 85
          Height = 13
          Caption = 'Nº do Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 115
          Top = 8
          Width = 103
          Height = 13
          Caption = 'Nome do Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 11
          Top = 48
          Width = 94
          Height = 13
          Caption = 'Data do Distrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtNumContr: TEdit
          Left = 8
          Top = 23
          Width = 105
          Height = 21
          Color = 12648447
          Enabled = False
          TabOrder = 0
        end
        object edtNomContr: TEdit
          Left = 115
          Top = 23
          Width = 710
          Height = 21
          Enabled = False
          TabOrder = 1
        end
        object dteDataDistrato: TCMDateTimePicker
          Left = 9
          Top = 64
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
          TabOrder = 2
        end
        object pgcImovelBem: TPageControl
          Left = 1
          Top = 103
          Width = 880
          Height = 298
          ActivePage = tsImovelBen
          TabOrder = 3
          object tsImovelBen: TTabSheet
            Caption = 'Imóvel e Bens'
            object grdImovelBem: TwwDBGrid
              Left = 0
              Top = 0
              Width = 872
              Height = 270
              Selected.Strings = (
                'IMOCODIGO'#9'15'#9'Código Imóvel'
                'DESBEM'#9'38'#9'Nome Imóvel'
                'TIPO'#9'11'#9'Tipo Imóvel'
                'GRUPOCONTABIL'#9'28'#9'Grupo Contábil'
                'VLRCONTABIL'#9'11'#9'Valor Contábil'
                'DATABAIXA'#9'14'#9'Data Baixa')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsImovelBem
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 422
    Width = 900
    inherited tb97Fundo: TToolbar97
      Left = 421
      inherited btnContinuar: TfcShapeBtn
        OnKeyPress = btnContinuarKeyPress
      end
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 579
    Top = 83
    TargetsData = (
      1
      5
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object dsCondPag: TwwDataSource
    AutoEdit = False
    DataSet = qryCondPag
    Left = 463
    Top = 240
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CI.IDCONTRATOIMOVEL,'
      '     CI.CONNUMERO,'
      '     CI.CONNOME,'
      '     CI.DATAOPERACAO,'
      '     CI.CONDATAINICIO,'
      '     CI.CONDATAASSINATURA,'
      '     CI.FLGTIPOCONTRATO,'
      '     CI.FLGSTATUS,'
      '     CI.FLGVGV,'
      '     CI.CONTAXAADMIN,'
      '     CI.CONVLRAJUSTADO,'
      '     CI.PERALUGUELIDEAL,'
      '     CI.PERCTXJURMERC,'
      '     CI.PERITXJURMERC,'
      '     CI.IDLOCATARIO,'
      '     CI.CONVLRTOTAL,'
      '     CI.CONDESCRICAO,'
      '     CI.VLRPROPOSTA,'
      '     CI.VLRPRESENTE,'
      '     CI.VLRCONTABIL,'
      '     CI.CONINDICEREAJUSTE,'
      '     CI.CONDATAREAJUSTE,'
      '     CI.CONPERREAJUSTE,'
      '     CI.IDMSGBOLETO,'
      '     CI.CODPORTFORMA,'
      '     CI.CODESTADO,'
      '     CI.IDPAIS,'
      '     CI.IDCIDADES,'
      ''
      '     CI.IDRESPONSAVEL,'
      '     CI.IDADMINIMOVEL,'
      ''
      '     CI.FLGFIANCA,'
      '     CONDATAFIANCAINI,'
      '     CONDATAFIANCAFIM,'
      '     CONDATAFIANCAAV,'
      '     CONBANCOFIANCA,'
      '     CONVLRFIANCA,'
      '     CONOBSFIANCA,'
      ''
      '     P.RAZAOSOCIAL,'
      ''
      '     CI.IDPESSOA,'
      '     PR.NOME                       AS NOMRESPONSAVEL,'
      '     PA.NOME                       AS NOMADMINIMOVEL'
      'FROM'
      '     CONTRATOIMOVEL CI,'
      '     PESSOA P,'
      '     PESSOA PR,'
      '     PESSOA PA'
      'WHERE'
      '         (CI.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      '     AND (CI.IDLOCATARIO = P.IDPESSOA(+))'
      '     AND (CI.IDRESPONSAVEL = PR.IDPESSOA(+))'
      '     AND (CI.IDADMINIMOVEL = PA.IDPESSOA(+))'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 376
    Top = 98
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptInput
      end>
    object qryIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = '"CM.CONTRATOIMOVEL".IDCONTRATOIMOVEL'
    end
    object qryCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
      Origin = '"CM.CONTRATOIMOVEL".CONNUMERO'
    end
    object qryCONNOME: TStringField
      FieldName = 'CONNOME'
      Origin = '"CM.CONTRATOIMOVEL".CONNOME'
      Size = 100
    end
    object qryCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
      Origin = '"CM.CONTRATOIMOVEL".CONDATAINICIO'
    end
    object qryFLGTIPOCONTRATO: TStringField
      FieldName = 'FLGTIPOCONTRATO'
      Origin = '"CM.CONTRATOIMOVEL".FLGTIPOCONTRATO'
      Size = 1
    end
    object qryCONTAXAADMIN: TFloatField
      FieldName = 'CONTAXAADMIN'
      Origin = '"CM.CONTRATOIMOVEL".CONTAXAADMIN'
    end
    object qryCONVLRAJUSTADO: TFloatField
      FieldName = 'CONVLRAJUSTADO'
      Origin = '"CM.CONTRATOIMOVEL".CONVLRAJUSTADO'
    end
    object qryCONVLRTOTAL: TFloatField
      FieldName = 'CONVLRTOTAL'
      Origin = '"CM.CONTRATOIMOVEL".CONVLRTOTAL'
    end
    object qryCONDESCRICAO: TMemoField
      FieldName = 'CONDESCRICAO'
      Origin = '"CM.CONTRATOIMOVEL".CONDESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryVLRPROPOSTA: TFloatField
      FieldName = 'VLRPROPOSTA'
      Origin = '"CM.CONTRATOIMOVEL".VLRPROPOSTA'
    end
    object qryVLRPRESENTE: TFloatField
      FieldName = 'VLRPRESENTE'
      Origin = '"CM.CONTRATOIMOVEL".VLRPRESENTE'
    end
    object qryVLRCONTABIL: TFloatField
      FieldName = 'VLRCONTABIL'
      Origin = '"CM.CONTRATOIMOVEL".VLRCONTABIL'
    end
    object qryCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
      Origin = 'CONTRATOIMOVEL.CONINDICEREAJUSTE'
    end
    object qryCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
      Origin = 'CONTRATOIMOVEL.CONDATAREAJUSTE'
    end
    object qryPERALUGUELIDEAL: TFloatField
      FieldName = 'PERALUGUELIDEAL'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.PERALUGUELIDEAL'
    end
    object qryPERCTXJURMERC: TFloatField
      FieldName = 'PERCTXJURMERC'
    end
    object qryPERITXJURMERC: TStringField
      FieldName = 'PERITXJURMERC'
      FixedChar = True
      Size = 1
    end
    object qryIDMSGBOLETO: TFloatField
      FieldName = 'IDMSGBOLETO'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.IDMSGBOLETO'
    end
    object qryCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CODPORTFORMA'
    end
    object qryRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qryNOMRESPONSAVEL: TStringField
      FieldName = 'NOMRESPONSAVEL'
      Size = 60
    end
    object qryDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryCONPERREAJUSTE: TFloatField
      FieldName = 'CONPERREAJUSTE'
    end
    object qryFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      FixedChar = True
      Size = 1
    end
    object qryCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object qryIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
    end
    object qryIDADMINIMOVEL: TFloatField
      FieldName = 'IDADMINIMOVEL'
    end
    object qryNOMADMINIMOVEL: TStringField
      FieldName = 'NOMADMINIMOVEL'
      Size = 60
    end
    object qryCONDATAASSINATURA: TDateTimeField
      FieldName = 'CONDATAASSINATURA'
    end
    object qryFLGFIANCA: TStringField
      FieldName = 'FLGFIANCA'
      FixedChar = True
      Size = 1
    end
    object qryCONDATAFIANCAINI: TDateTimeField
      FieldName = 'CONDATAFIANCAINI'
    end
    object qryCONDATAFIANCAFIM: TDateTimeField
      FieldName = 'CONDATAFIANCAFIM'
    end
    object qryCONDATAFIANCAAV: TDateTimeField
      FieldName = 'CONDATAFIANCAAV'
    end
    object qryCONBANCOFIANCA: TFloatField
      FieldName = 'CONBANCOFIANCA'
    end
    object qryCONVLRFIANCA: TFloatField
      FieldName = 'CONVLRFIANCA'
    end
    object qryCONOBSFIANCA: TMemoField
      FieldName = 'CONOBSFIANCA'
      BlobType = ftMemo
      Size = 2000
    end
    object qryIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryFLGVGV: TFloatField
      FieldName = 'FLGVGV'
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 434
    Top = 106
  end
  object dsParc: TwwDataSource
    AutoEdit = False
    DataSet = qryParc
    Left = 636
    Top = 243
  end
  object qryParc: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryParcCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CI.CONNUMERO,'
      '     PF.IDPARCFINANCIMOV,'
      '     PF.IDCONDPAGIMOVEL,'
      '     CP.IDCONTRATOIMOVEL,'
      '     CI.FLGTIPOCONTRATO,'
      '     IM.CODTIPIMOVEL,'
      '     PF.CODDOCUMENTO,'
      '     PF.PLNCODIGO,'
      
        '     DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || '#39'/'#39' |' +
        '| TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA,'
      
        '     DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENTO)' +
        ' AS DATAVENCIMENTO,'
      
        '     DECODE(NVL(PF.FLGRESIDUOINCORP,'#39'N'#39'),'#39'N'#39',PF.VLRRESIDUOATUALI' +
        ',0) AS VLRRESIDUOATUALI,    '
      '     PF.VLRPRESTACAO,'
      '     PF.VLRAMORTIZACAO,'
      '     PF.VLRJUROS,'
      '     PF.FLGTIPOLANC,'
      '     PF.FLGLANCINTEGRA,'
      '     PF.DATAPAGAMENTO,'
      '     PF.VLRPAGO,'
      '     PF.VLRPRESTCORRIG,'
      '     PF.VLRMULTACORRIG,'
      '     PF.VLRJUROSCORRIG,'
      '     LD1.VALOR VLRDEVIDO'
      'FROM'
      '     PARCFINANCIMOV PF,'
      '     CONDPAGIMOVEL  CP,'
      '     CONTRATOIMOVEL CI,'
      ''
      '     ( SELECT CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL,'
      '              I.CODTIPIMOVEL AS CODTIPIMOVEL'
      '       FROM'
      '              CONTRATOXIMOVEL CXI,'
      '              IMOVEL I,'
      '              IMOVEL M'
      '       WHERE'
      '              CXI.IDIMOVEL = I.IDIMOVEL AND'
      '              I.IDIMOVELMESTRE = M.IDIMOVEL'
      '       GROUP BY CXI.IDCONTRATOIMOVEL, I.CODTIPIMOVEL ) IM,     '
      ''
      '     ( SELECT A.IDCONDINICIAL  AS IDCONDINICIAL,'
      '              A.NUMPARCELAS    AS NUMPARCELAS,'
      '              A.DATAINI,'
      '              A.IDCONDPAGIMOVEL'
      '       FROM   CONDPAGIMOVEL A,'
      '              (SELECT   IDCONDINICIAL,'
      '                        MAX(DATAINI) AS DATAINI'
      '               FROM     CONDPAGIMOVEL'
      '               GROUP BY IDCONDINICIAL) B'
      '       WHERE   B.IDCONDINICIAL = A.IDCONDINICIAL'
      '         AND   B.DATAINI       = A.DATAINI ) CPFINAL,         '
      
        '      (SELECT LD.VALOR, LD.CODDOCUMENTO FROM LANCTODOCUM LD  WHE' +
        'RE'
      
        '       (LD.CODALTERADOR IS NOT NULL) AND (LD.OPERACAO IN ('#39'2'#39','#39'4' +
        #39'))) LD1'
      ''
      'WHERE    (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)'
      '     AND (CP.TIPOCONDPAG = '#39'P'#39' OR CP.TIPOCONDPAG = '#39'C'#39')'
      '     AND (CP.IDCONTRATOIMOVEL = IM.IDCONTRATOIMOVEL(+))'
      '     AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      '     AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)'
      '     AND (LD1.CODDOCUMENTO(+)     = PF.CODDOCUMENTO)'
      '     AND (CP.IDCONDPAGIMOVEL  = :pIDCONDPAGIMOVEL)  '
      'ORDER BY PF.DATAVENCIMENTO'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 587
    Top = 242
    ParamData = <
      item
        DataType = ftString
        Name = 'pIDCONDPAGIMOVEL'
        ParamType = ptInput
      end>
    object qryParcIDPARCFINANCIMOV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPARCFINANCIMOV'
    end
    object qryParcIDCONDPAGIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryParcIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryParcNUMPARCELA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Parc'
      DisplayWidth = 5
      FieldName = 'NUMPARCELA'
      Size = 81
    end
    object qryParcDATAVENCIMENTO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      DisplayWidth = 18
      FieldName = 'DATAVENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = 'dd/mm/yyyy'
    end
    object qryParcVLRPRESTACAO: TFloatField
      DisplayLabel = 'Valor Prestação'
      DisplayWidth = 10
      FieldName = 'VLRPRESTACAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryParcFLGTIPOLANC: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGTIPOLANC'
    end
    object qryParcDATAPAGAMENTO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Pagamento'
      DisplayWidth = 18
      FieldName = 'DATAPAGAMENTO'
    end
    object qryParcVLRPAGO: TFloatField
      DisplayLabel = 'Valor Pago'
      DisplayWidth = 10
      FieldName = 'VLRPAGO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryParcVLRDEVIDO: TFloatField
      DisplayLabel = 'Valor Devido'
      DisplayWidth = 10
      FieldName = 'VLRDEVIDO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryParcCAL_TIPO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'CAL_TIPO'
      Calculated = True
    end
    object qryParcVLRJUROS: TFloatField
      DisplayLabel = 'Juros Financ'
      FieldName = 'VLRJUROS'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryParcCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryParcFLGLANCINTEGRA: TFloatField
      FieldName = 'FLGLANCINTEGRA'
    end
    object qryParcVLRPRESTCORRIG: TFloatField
      FieldName = 'VLRPRESTCORRIG'
    end
    object qryParcVLRMULTACORRIG: TFloatField
      FieldName = 'VLRMULTACORRIG'
    end
    object qryParcVLRJUROSCORRIG: TFloatField
      FieldName = 'VLRJUROSCORRIG'
    end
    object qryParcVLRAMORTIZACAO: TFloatField
      FieldName = 'VLRAMORTIZACAO'
    end
    object qryParcFLGTIPOCONTRATO: TStringField
      FieldName = 'FLGTIPOCONTRATO'
      FixedChar = True
      Size = 1
    end
    object qryParcCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryParcVLRRESIDUOATUALI: TFloatField
      FieldName = 'VLRRESIDUOATUALI'
    end
    object qryParcCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryParcPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
  end
  object cdsAlterador: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 271
    Top = 329
    Data = {
      F50000009619E0BD010000001800000007000000000003000000F5000B494444
      4F43554D454E544F08000400000000000C434F44414C54455241444F52080004
      00000000000C564C52414C54455241444F5208000400000000000C434F445449
      50494D4F56454C01004900000001000557494454480200020005000543484156
      450100490000000100055749445448020002002D000944455343524943414F01
      004900000001000557494454480200020023000A4F42534552564143414F0100
      490000000100055749445448020002003C0002000D44454641554C545F4F5244
      455202008200010000000600044C4349440400010009080000}
    object cdsAlteradorDESCRICAO: TStringField
      DisplayLabel = 'Tipo do Alterador'
      DisplayWidth = 28
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object cdsAlteradorCODTIPIMOVEL: TStringField
      DisplayLabel = 'Tipo Imóvel'
      DisplayWidth = 13
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object cdsAlteradorVLRALTERADOR: TFloatField
      DisplayLabel = 'Valor Alterador'
      DisplayWidth = 15
      FieldName = 'VLRALTERADOR'
      DisplayFormat = '##,###.00'
    end
    object cdsAlteradorOBSERVACAO: TStringField
      DisplayLabel = 'Observação'
      DisplayWidth = 60
      FieldName = 'OBSERVACAO'
      Size = 60
    end
    object cdsAlteradorIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Visible = False
    end
    object cdsAlteradorCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Visible = False
    end
  end
  object dsAlterador: TwwDataSource
    DataSet = cdsAlterador
    Left = 216
    Top = 328
  end
  object cdsAlteradorXTipoImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 271
    Top = 281
    object cdsAlteradorXTipoImovelCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object cdsAlteradorXTipoImovelCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
    end
    object cdsAlteradorXTipoImovelDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object cdsAlteradorXTipoImovelACRESDECRES: TStringField
      FieldName = 'ACRESDECRES'
      FixedChar = True
      Size = 1
    end
    object cdsAlteradorXTipoImovelRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object cdsAlteradorXTipoImovelCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 45
    end
  end
  object cdsImoveis: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 65
    Top = 217
    Data = {
      430100009619E0BD01000000180000000B000000000003000000430110494443
      4F4E545241544F494D4F56454C0800040000000000084944494D4F56454C0800
      04000000000009494D4F434F4449474F01004900000001000557494454480200
      02000F0007494D4F4E4F4D450100490000000100055749445448020002006400
      09434F4E4E554D45524F01004900000001000557494454480200020014000749
      44475255504F080004000000000006434C415353450100490000000200075355
      4254595045020049000A0046697865644368617200055749445448020002000F
      000C434F44544950494D4F56454C010049000000010005574944544802000200
      3C000A50455243454E5455414C080004000000000009564C52494D4F56454C08
      0004000000000008564C5256454E444108000400000000000100044C43494404
      00010009080000}
    object cdsImoveisIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object cdsImoveisIMONOME: TStringField
      FieldName = 'IMONOME'
      Size = 100
    end
    object cdsImoveisCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object cdsImoveisCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object cdsImoveisPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      DisplayFormat = '#,##0.0000'
      EditFormat = '#,##0.0000'
    end
    object cdsImoveisVLRIMOVEL: TFloatField
      FieldName = 'VLRIMOVEL'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsImoveisIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object cdsImoveisIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsImoveisVLRVENDA: TFloatField
      FieldName = 'VLRVENDA'
    end
    object cdsImoveisIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object cdsImoveisCLASSE: TStringField
      FieldName = 'CLASSE'
      FixedChar = True
      Size = 15
    end
  end
  object dsImoveis: TwwDataSource
    DataSet = cdsImoveis
    Left = 112
    Top = 229
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      
        'SELECT C.IDCONTRATOIMOVEL, I.IDIMOVEL, I.IMOCODIGO, I.IMONOME, C' +
        '.CONNUMERO, '
      'G.IDGRUPO, G.CLASSE, G.NOME AS CODTIPIMOVEL, '
      '0 AS PERCENTUAL, 0 AS VLRIMOVEL, CX.VLRVENDA '
      'FROM CONTRATOXIMOVEL CX, IMOVEL I, CONTRATOIMOVEL C, GRUPO G '
      'WHERE 1= 2'
      '  AND  I.IDIMOVEL         = CX.IDIMOVEL '
      '  AND CX.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL '
      '  AND  G.FLGIMOVEL = 1  '
      '  AND  G.TIPO = '#39'A'#39'   '
      '  AND  G.STATUS = '#39'A'#39' '
      ''
      ' '
      ' ')
    ClientDataSet = cdsImoveis
    Left = 155
    Top = 211
  end
  object qryParamGlobal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PG.USACRESPON, PG.USAABC, PG.CODCENTRORESPON,'
      '   PG.UNIDNEGOC, PG.MOEDACORRENTE,'
      '   PG.IDPATRO, PG.IDPLANOPREV,'
      '   M.MOESIGLA, L.NOME AS PLANPREV, P.NOME AS PATRO'
      'FROM'
      
        '   PARAMGLOBAL PG, MOEDA M, PLANPREVCONTABIL L, PESSOA P, PATRO ' +
        'PA'
      'WHERE'
      '   ( PG.IDPESSOA =:PIDPESSOA )'
      '   AND ( PG.MOEDACORRENTE = M.MOECODIGO(+) )'
      '   AND ( PG.IDPLANOPREV = L.IDPLANOPREV (+))'
      '   AND ( PG.IDPATRO = PA.IDPESSOA (+))'
      '   AND ( PA.IDPESSOA = P.IDPESSOA (+))'
      ''
      ' ')
    ValidateWithMask = True
    Left = 192
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamGlobalUSACRESPON: TStringField
      FieldName = 'USACRESPON'
      Origin = 'PARAMGLOBAL.USACRESPON'
      Size = 1
    end
    object qryParamGlobalUSAABC: TStringField
      FieldName = 'USAABC'
      Origin = 'PARAMGLOBAL.USAABC'
      Size = 1
    end
    object qryParamGlobalCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PARAMGLOBAL.CODCENTRORESPON'
      Size = 10
    end
    object qryParamGlobalUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PARAMGLOBAL.UNIDNEGOC'
    end
    object qryParamGlobalMOEDACORRENTE: TFloatField
      FieldName = 'MOEDACORRENTE'
      Origin = 'PARAMGLOBAL.MOEDACORRENTE'
    end
    object qryParamGlobalIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'PARAMGLOBAL.IDPATRO'
    end
    object qryParamGlobalIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'PARAMGLOBAL.IDPLANOPREV'
    end
    object qryParamGlobalMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryParamGlobalPLANPREV: TStringField
      FieldName = 'PLANPREV'
      Size = 50
    end
    object qryParamGlobalPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
  end
  object qryImovelBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      'IMO.IMOCODIGO,'
      '      B.IDBEM,'
      '       CXI.IDIMOVEL,'
      '       B.DESBEM,'
      '       DECODE(IXB.IXBGRUPO,'
      '              '#39'E'#39','
      '              '#39'EDIFICAÇÃO'#39','
      '              '#39'T'#39','
      '              '#39'TERRENO'#39','
      '              '#39'I'#39','
      '              '#39'INSTALAÇÕES'#39') AS TIPO,'
      '       CXI.VLRCONTABIL,'
      '       G.NOME AS GRUPOCONTABIL,'
      '       RP.DATABAIXA AS DATABAIXA'
      '  FROM CONTRATOIMOVEL CI'
      ' INNER JOIN CONTRATOXIMOVEL CXI'
      '    ON (CXI.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      ' INNER JOIN IMOVELXBEM IXB'
      '    ON (IXB.IDIMOVEL = CXI.IDIMOVEL)'
      ' INNER JOIN BEM B'
      '    ON (B.IDBEM = IXB.IDBEM)'
      'INNER JOIN GRUPO G'
      '   ON (G.IDGRUPO = B.IDGRUPO)'
      'INNER JOIN IMOVEL IMO ON (IMO.IDIMOVEL = CXI.IDIMOVEL)'
      
        ' INNER JOIN CONDPAGIMOVEL CPI ON (CPI. IDCONTRATOIMOVEL = CI.IDC' +
        'ONTRATOIMOVEL AND CPI.TIPOCONDPAG = '#39'S'#39')'
      
        ' INNER JOIN PARCFINANCIMOV PFI ON (PFI.IDCONDPAGIMOVEL = CPI.IDC' +
        'ONDPAGIMOVEL AND PFI.NUMPARCELA <> 0 )'
      
        ' INNER JOIN RECBTOPAGTO RP ON (RP.CODDOCUMENTO = PFI.CODDOCUMENT' +
        'O)'
      ' WHERE 1 = 2')
    PictureMasks.Strings = (
      'VLRCONTABIL'#9'0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 709
    Top = 206
    object qryImovelBemIMOCODIGO: TStringField
      DisplayLabel = 'Código Imóvel'
      DisplayWidth = 15
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object qryImovelBemDESBEM: TStringField
      DisplayLabel = 'Nome Imóvel'
      DisplayWidth = 38
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryImovelBemTIPO: TStringField
      DisplayLabel = 'Tipo Imóvel'
      DisplayWidth = 11
      FieldName = 'TIPO'
      Size = 11
    end
    object qryImovelBemGRUPOCONTABIL: TStringField
      DisplayLabel = 'Grupo Contábil'
      DisplayWidth = 28
      FieldName = 'GRUPOCONTABIL'
      Size = 60
    end
    object qryImovelBemVLRCONTABIL: TFloatField
      DisplayLabel = 'Valor Contábil'
      DisplayWidth = 11
      FieldName = 'VLRCONTABIL'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object qryImovelBemDATABAIXA: TDateTimeField
      DisplayLabel = 'Data Baixa'
      DisplayWidth = 14
      FieldName = 'DATABAIXA'
    end
    object qryImovelBemIDIMOVEL: TFloatField
      DisplayLabel = 'Código Imóvel'
      DisplayWidth = 11
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryImovelBemIDBEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBEM'
      Visible = False
    end
  end
  object qryInsRepactua: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO REPCONDPAGIMOV'
      '('
      'IDREPACTUA,  DATAREPACTUA,'
      'VLRSALDOANT, VLRINCORPORADO, PLNCODIGO, TIPOREPACTUA'
      ')'
      'VALUES'
      '('
      ':PIDREPACTUA,  :PDATAREPACTUA,'
      ':PVLRSALDOANT, :PVLRINCORPORADO, :PPLNCODIGO, :PTIPOREPACTUA'
      ')'
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 589
    Top = 347
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDREPACTUA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAREPACTUA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRSALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRINCORPORADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PPLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PTIPOREPACTUA'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 725
    Top = 302
  end
  object qryUpdParc: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PARCFINANCIMOV'
      '   SET FLGCONCILIADO  = :PFLGCONCILIADO,'
      '       FLGLANCINTEGRA = :PFLGLANCINTEGRA,'
      '       VLRPRESTCORRIG = NULL,'
      '       VLRMULTACORRIG = NULL,'
      '       VLRJUROSCORRIG = NULL,'
      '       IDREPACTUA     = :PIDREPACTUA'
      ''
      ' WHERE IDPARCFINANCIMOV = :PIDPARCFINANCIMOV'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 586
    Top = 298
    ParamData = <
      item
        DataType = ftString
        Name = 'PFLGCONCILIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGLANCINTEGRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDREPACTUA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPARCFINANCIMOV'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPARCFINANCIMOV'
    end
    object FloatField2: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object FloatField3: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object StringField1: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Parc'
      DisplayWidth = 5
      FieldName = 'NUMPARCELA'
      Size = 81
    end
    object DateTimeField1: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      DisplayWidth = 18
      FieldName = 'DATAVENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = 'dd/mm/yyyy'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Valor Prestação'
      DisplayWidth = 10
      FieldName = 'VLRPRESTACAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object FloatField5: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGTIPOLANC'
    end
    object DateTimeField2: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Pagamento'
      DisplayWidth = 18
      FieldName = 'DATAPAGAMENTO'
    end
    object FloatField6: TFloatField
      DisplayLabel = 'Valor Pago'
      DisplayWidth = 10
      FieldName = 'VLRPAGO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object FloatField7: TFloatField
      DisplayLabel = 'Valor Devido'
      DisplayWidth = 10
      FieldName = 'VLRDEVIDO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object StringField2: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'CAL_TIPO'
      Calculated = True
    end
    object FloatField8: TFloatField
      DisplayLabel = 'Juros Financ'
      FieldName = 'VLRJUROS'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object FloatField9: TFloatField
      DisplayLabel = 'Resíduo Final'
      FieldName = 'VLRRESIDUOATUALI'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object qryParcAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 725
    Top = 350
  end
  object qryInsertEventoImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO'
      '   EVENTOIMOVEL'
      '   ('
      '   IDEVENTOIMOVEL,'
      '   IDIMOVEL,'
      '   EVIDATA,'
      '   EVICABECALHO,'
      '   EVIDESCRICAO,'
      '   IDUSUARIO,'
      '   IDCONTRATOIMOVEL,'
      '   FLGTIPOEVENTO,'
      '   EVIVLRANTERIOR,'
      '   EVIVLRAJUSTADO,'
      '   EVIDATAPROX,'
      '   EVIPERCENT,'
      '   EVIINDICEREAJUSTE,'
      '   IDTIPOEVENTOIMOB'
      '   )'
      'VALUES'
      '   ('
      '   :PIDEVENTOIMOVEL,'
      '   :PIDIMOVEL,'
      '   :PEVIDATA,'
      '   :PEVICABECALHO,'
      '   :PEVIDESCRICAO,'
      '   :PIDUSUARIO,'
      '   :PIDCONTRATOIMOVEL,'
      '   :PFLGTIPOEVENTO,'
      '   :PEVIVLRANTERIOR,'
      '   :PEVIVLRAJUSTADO,'
      '   :PEVIDATAPROX,'
      '   :PEVIPERCENT,'
      '   :PEVIINDICEREAJUSTE,'
      '   :PIDTIPOEVENTOIMOB'
      '   )')
    ValidateWithMask = True
    Left = 808
    Top = 68
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEVENTOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PEVIDATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PEVICABECALHO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PEVIDESCRICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGTIPOEVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PEVIVLRANTERIOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PEVIVLRAJUSTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PEVIDATAPROX'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PEVIPERCENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEVIINDICEREAJUSTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEVENTOIMOB'
        ParamType = ptUnknown
      end>
    object qryInsertEventoImovelIDREAJUSTECONIMO: TFloatField
      FieldName = 'IDREAJUSTECONIMO'
      Origin = 'REAJUSTECONIMO.IDREAJUSTECONIMO'
    end
    object qryInsertEventoImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'REAJUSTECONIMO.IDIMOVEL'
    end
    object qryInsertEventoImovelIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'REAJUSTECONIMO.IDCONTRATOIMOVEL'
    end
    object qryInsertEventoImovelIDTIPOEVENTOIMOB: TFloatField
      FieldName = 'IDTIPOEVENTOIMOB'
      Origin = 'BASEDADOS.EVENTOIMOVEL.IDTIPOEVENTOIMOB'
    end
    object qryInsertEventoImovelRCODATA: TDateTimeField
      FieldName = 'RCODATA'
      Origin = 'REAJUSTECONIMO.RCODATA'
    end
    object qryInsertEventoImovelFLGTIPOREAJUSTE: TStringField
      FieldName = 'FLGTIPOREAJUSTE'
      Origin = 'REAJUSTECONIMO.FLGTIPOREAJUSTE'
      Size = 1
    end
    object qryInsertEventoImovelRCOVLRALUGUEL: TFloatField
      FieldName = 'RCOVLRALUGUEL'
      Origin = 'REAJUSTECONIMO.RCOVLRALUGUEL'
    end
    object qryInsertEventoImovelRCOVLRCONTRATO: TFloatField
      FieldName = 'RCOVLRCONTRATO'
      Origin = 'REAJUSTECONIMO.RCOVLRCONTRATO'
    end
    object qryInsertEventoImovelRCOMOTIVO: TStringField
      FieldName = 'RCOMOTIVO'
      Origin = 'REAJUSTECONIMO.RCOMOTIVO'
      Size = 40
    end
    object qryInsertEventoImovelRCODATAPROXIMO: TDateTimeField
      FieldName = 'RCODATAPROXIMO'
      Origin = 'REAJUSTECONIMO.RCODATAPROXIMO'
    end
  end
  object qryAssinatura: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CONDATAASSINATURA'
      ' FROM CONTRATOIMOVEL'
      ' WHERE IDCONTRATOIMOVEL = :pIDCONTRATO'
      ' ')
    ValidateWithMask = True
    Left = 412
    Top = 313
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDCONTRATO'
        ParamType = ptUnknown
      end>
    object qryAssinaturaCONDATAASSINATURA: TDateTimeField
      FieldName = 'CONDATAASSINATURA'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CONDATAASSINATURA'
    end
  end
  object qryVerifBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      '  FROM HISTORICOMOVIMENTACAO '
      ' WHERE IDBEM = :pIDBEM'
      '   AND IDTIPOMOVIMENTACAO IN(20,70,6,24)'
      '   AND DATAMOVIMENTACAO = :pDATABAIXA'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 320
    Top = 313
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDATABAIXA'
        ParamType = ptUnknown
      end>
  end
  object updBens: TUpdateSQL
    Left = 576
  end
  object qryBens: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IM.IMONOME || '#39' - '#39' || I.IMONOME AS IMOVEL_EXTENSO, I.IMOCODI' +
        'GO,'
      
        '   IB.IDIMOVEL, IB.IDBEM, IB.IXBPERCENT, IB.IXBGRUPO, B.IDGRUPO,' +
        ' I.CODTIPIMOVEL,'
      
        '   B.IDCONJUNTO, C.IDLOCALIZACAO, C.IDRESPONSAVEL, B.DESBEM, G.N' +
        'OME AS NOME_GRUPO,'
      '   0 AS VLR_BEM, 1 AS SEL_BEM'
      'FROM'
      
        '   IMOVEL I, IMOVEL IM, IMOVELXBEM IB, BEM B, CONJUNTO C, GRUPO ' +
        'G'
      'WHERE'
      '   IB.IDBEM = B.IDBEM'
      '   AND (I.IDIMOVEL = IB.IDIMOVEL)'
      '   AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)'
      '   AND ( B.IDGRUPO = G.IDGRUPO(+))'
      '   AND ( B.IDCONJUNTO = C.IDCONJUNTO(+) )'
      
        '   AND ( (:PBAIXATOTAL IS NULL) OR (B.BAIXATOTAL = :PBAIXATOTAL)' +
        ' )'
      '   AND ( (:PGRUPO IS NULL) OR (IB.IXBGRUPO = :PGRUPO) )'
      '   AND ( (:PIDIMOVEL IS NULL) OR (IB.IDIMOVEL = :PIDIMOVEL) )'
      
        '   AND ( (:PIDIMOVELMESTRE IS NULL) OR ((I.IDIMOVELMESTRE = :PID' +
        'IMOVELMESTRE) AND (I.FLGATIVO = 1)) )'
      '   AND ( (:PIDBEM    IS NULL) OR (IB.IDBEM = :PIDBEM) )'
      
        '   AND ( (:PDATAINCLUSAO IS NULL) OR (B.DTAINCLUSAO = :PDATAINCL' +
        'USAO) )'
      ''
      'ORDER BY IMOVEL_EXTENSO, IDIMOVEL, DESBEM')
    UpdateObject = updBens
    ControlType.Strings = (
      'VLR_BEM;CheckBox;0;1'
      'SEL_BEM;CheckBox;1;0')
    ValidateWithMask = True
    Left = 665
    ParamData = <
      item
        DataType = ftString
        Name = 'PBAIXATOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PBAIXATOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINCLUSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINCLUSAO'
        ParamType = ptUnknown
      end>
    object qryBensSEL_BEM: TFloatField
      DisplayWidth = 5
      FieldName = 'SEL_BEM'
    end
    object qryBensDESBEM: TStringField
      DisplayLabel = 'Bem'
      DisplayWidth = 200
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryBensNOME_GRUPO: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 60
      FieldName = 'NOME_GRUPO'
      Size = 60
    end
    object qryBensVLR_BEM: TFloatField
      DisplayLabel = '   '
      DisplayWidth = 3
      FieldName = 'VLR_BEM'
      Visible = False
      DisplayFormat = '###,###,##0.00'
    end
    object qryBensIXBGRUPO: TStringField
      DisplayWidth = 9
      FieldName = 'IXBGRUPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryBensIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryBensIDBEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBEM'
      Visible = False
    end
    object qryBensIMOVEL_EXTENSO: TStringField
      DisplayWidth = 123
      FieldName = 'IMOVEL_EXTENSO'
      Visible = False
      Size = 123
    end
    object qryBensCODTIPIMOVEL: TStringField
      DisplayWidth = 5
      FieldName = 'CODTIPIMOVEL'
      Visible = False
      Size = 5
    end
    object qryBensIMOCODIGO: TStringField
      DisplayWidth = 15
      FieldName = 'IMOCODIGO'
      Visible = False
      Size = 15
    end
    object qryBensIXBPERCENT: TFloatField
      DisplayWidth = 10
      FieldName = 'IXBPERCENT'
      Visible = False
      DisplayFormat = '##0.00%'
    end
    object qryBensIDGRUPO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPO'
      Visible = False
    end
    object qryBensIDCONJUNTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONJUNTO'
      Visible = False
    end
    object qryBensIDLOCALIZACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLOCALIZACAO'
      Visible = False
    end
    object qryBensIDRESPONSAVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRESPONSAVEL'
      Visible = False
    end
  end
  object dsBens: TwwDataSource
    AutoEdit = False
    DataSet = qryBens
    Left = 627
    Top = 65531
  end
  object qryCondPag: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryCondPagCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CPI.IDCONTRATOIMOVEL,'
      '     CPI.IDCONDPAGIMOVEL,'
      '     CPI.INDCORRECAO,'
      '     M.MOESIGLA    AS DSCINDCORR,'
      '     CPI.IDINDCORRPROJ,'
      '     MP.MOESIGLA   AS DSCINDPROJ,'
      '     CPI.VLRFINANC,'
      '     CPI.DATAVENCIMENTO,'
      '     CPI.DATACARENCIA,'
      '     CPI.DATAINIAMORTIZ,'
      '     CPI.DATAINI,'
      '     CPI.DATAFIM,'
      '     CPI.PRAZO,'
      '     CPI.PERIODO,'
      '     CPI.TAXAJUROS,'
      '     CPI.PERIODOTAXA,'
      '     CPI.NUMPARCELAS,'
      '     CPI.TIPOCONDPAG,'
      '     CPI.IDCONDINICIAL,'
      '     CPI.MESREFREAJUSTE,'
      '     CPI.FORMACALCULO,'
      '     CPI.PERINDPROJ,'
      '     CPI.FLGJURCARENCIA,'
      '     CPI.PERIODOREAJUSTE,'
      '     IM.CODTIPIMOVEL'
      'FROM'
      '     CONDPAGIMOVEL CPI,'
      '     MOEDA M,'
      '     MOEDA MP,'
      '    (SELECT CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL,'
      '             I.CODTIPIMOVEL AS CODTIPIMOVEL'
      '      FROM'
      '             CONTRATOXIMOVEL CXI,'
      '             IMOVEL I,'
      '             IMOVEL M'
      '      WHERE'
      '             CXI.IDIMOVEL = I.IDIMOVEL AND'
      '             I.IDIMOVELMESTRE = M.IDIMOVEL'
      '      GROUP BY CXI.IDCONTRATOIMOVEL, I.CODTIPIMOVEL) IM'
      'WHERE'
      '          (M.MOECODIGO(+) = CPI.INDCORRECAO)'
      '      AND (MP.MOECODIGO(+) = CPI.IDINDCORRPROJ)'
      '      AND (CPI.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      '      AND (IM.IDCONTRATOIMOVEL(+) = CPI.IDCONTRATOIMOVEL)'
      'ORDER BY '
      '      CPI.DATAVENCIMENTO'
      ' ')
    ControlType.Strings = (
      'FLGJURCARENCIA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 400
    Top = 242
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptInput
      end>
    object qryCondPagcal_Tipo: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 7
      FieldKind = fkCalculated
      FieldName = 'cal_Tipo'
      Calculated = True
    end
    object qryCondPagDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Início'
      DisplayWidth = 10
      FieldName = 'DATAVENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryCondPagVLRFINANC: TFloatField
      DisplayLabel = 'Valor '
      DisplayWidth = 13
      FieldName = 'VLRFINANC'
      DisplayFormat = '#,##0.00'
    end
    object qryCondPagNUMPARCELAS: TFloatField
      DisplayLabel = 'Nº Parc'
      DisplayWidth = 7
      FieldName = 'NUMPARCELAS'
    end
    object qryCondPagcal_intervalo: TStringField
      DisplayLabel = 'Intervalo'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'cal_intervalo'
      Calculated = True
    end
    object qryCondPagcal_PerTaxa: TStringField
      DisplayLabel = 'Juros'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'cal_PerTaxa'
      Calculated = True
    end
    object qryCondPagDSCINDCORR: TStringField
      DisplayLabel = 'Ind. Correção'
      DisplayWidth = 12
      FieldName = 'DSCINDCORR'
      Size = 10
    end
    object qryCondPagDSCINDPROJ: TStringField
      DisplayLabel = 'Ind. Projeção'
      DisplayWidth = 12
      FieldName = 'DSCINDPROJ'
      Size = 10
    end
    object qryCondPagMESREFREAJUSTE: TFloatField
      DisplayLabel = 'Usa Indice Mes Anterior'
      DisplayWidth = 19
      FieldName = 'MESREFREAJUSTE'
    end
    object qryCondPagcal_forma: TStringField
      DisplayLabel = 'Forma de Calculo'
      DisplayWidth = 60
      FieldKind = fkCalculated
      FieldName = 'cal_forma'
      Size = 200
      Calculated = True
    end
    object qryCondPagPERINDPROJ: TFloatField
      DisplayLabel = 'Índice Projetado'
      DisplayWidth = 15
      FieldName = 'PERINDPROJ'
      DisplayFormat = '##0.000000'
    end
    object qryCondPagDATACARENCIA: TDateTimeField
      DisplayLabel = 'Carência'
      DisplayWidth = 12
      FieldName = 'DATACARENCIA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryCondPagFLGJURCARENCIA: TStringField
      DisplayLabel = 'Juros na Carência'
      DisplayWidth = 3
      FieldName = 'FLGJURCARENCIA'
      FixedChar = True
      Size = 1
    end
    object qryCondPagPERIODO: TFloatField
      DisplayLabel = 'Período'
      DisplayWidth = 7
      FieldName = 'PERIODO'
      Visible = False
    end
    object qryCondPagcal_PerParc: TStringField
      DisplayLabel = 'Prazo'
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'cal_PerParc'
      Visible = False
      Calculated = True
    end
    object qryCondPagDATAINI: TDateTimeField
      DisplayLabel = 'Início'
      DisplayWidth = 10
      FieldName = 'DATAINI'
      Visible = False
    end
    object qryCondPagTAXAJUROS: TFloatField
      DisplayLabel = 'Juros'
      DisplayWidth = 7
      FieldName = 'TAXAJUROS'
      Visible = False
      DisplayFormat = '##0,0000000000'
      EditFormat = '##0,0000000000'
    end
    object qryCondPagINDCORRECAO: TFloatField
      DisplayLabel = 'Indice Correção'
      DisplayWidth = 13
      FieldName = 'INDCORRECAO'
      Visible = False
    end
    object qryCondPagPRAZO: TStringField
      DisplayLabel = 'Prazo'
      DisplayWidth = 5
      FieldName = 'PRAZO'
      Visible = False
      Size = 1
    end
    object qryCondPagPERIODOTAXA: TStringField
      DisplayLabel = 'Período Juros'
      DisplayWidth = 11
      FieldName = 'PERIODOTAXA'
      Visible = False
      Size = 1
    end
    object qryCondPagIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryCondPagIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
      Visible = False
    end
    object qryCondPagIDINDCORRPROJ: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINDCORRPROJ'
      Visible = False
    end
    object qryCondPagDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
      Visible = False
    end
    object qryCondPagTIPOCONDPAG: TStringField
      FieldName = 'TIPOCONDPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCondPagIDCONDINICIAL: TFloatField
      FieldName = 'IDCONDINICIAL'
      Visible = False
    end
    object qryCondPagFORMACALCULO: TFloatField
      FieldName = 'FORMACALCULO'
      Visible = False
    end
    object qryCondPagDATAINIAMORTIZ: TDateTimeField
      FieldName = 'DATAINIAMORTIZ'
      Visible = False
    end
    object qryCondPagPERIODOREAJUSTE: TFloatField
      FieldName = 'PERIODOREAJUSTE'
      Visible = False
    end
    object qryCondPagCODTIPIMOVEL: TStringField
      DisplayWidth = 5
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
  end
  object dsImovelBem: TwwDataSource
    AutoEdit = False
    DataSet = qryImovelBem
    Left = 756
    Top = 235
  end
  object MontaSelectMS_Contrato: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'C.CONNUMERO'
      'C.CONNOME'
      
        'DECODE(C.FLGSTATUS, '#39'S'#39', '#39'SUSPENSO'#39', '#39'R'#39', '#39'RESCINDIDO'#39', '#39'V'#39', '#39'VI' +
        'GENTE'#39', '#39'ENCERRADO'#39') AS STATUS'
      'PL.NUMDOCUMENTO'
      'PL.NOME'
      'U.NOMEUSUARIO'
      'PR.NOME'
      'TC.IDTIPOCONTRIMOB')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'L')
    Descricao.Strings = (
      'Nº do Contrato'
      'Nome do Contrato'
      'Status'
      'CPF/CNPJ Locatário'
      'Nome do Locatário'
      'Login do Responsável'
      'Nome do Responsável'
      'Tipo de Contrato')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA PR'
      'PESSOA PL'
      'CONTRATOIMOVEL C'
      'USUARIOSISTEMA U'
      'TIPOCONTRIMOB TC')
    CamposChave.Strings = (
      'C.IDCONTRATOIMOVEL'
      'C.CONNUMERO'
      'C.CONNOME'
      'C.FLGTIPOCONTRATO'
      'PL.NOME'
      'PL.RAZAOSOCIAL'
      'C.CONQUANTVAGAS'
      'C.IDLOCATARIO'
      'C.CODPORTFORMA'
      'C.FLGSTATUS')
    Filtro.Strings = (
      'C.IDRESPONSAVEL = PR.IDPESSOA(+)'
      'C.IDLOCATARIO = PL.IDPESSOA(+)'
      'C.IDRESPONSAVEL = U.IDUSUARIO(+)'
      'C.IDTIPOCONTRIMOB = TC.IDTIPOCONTRIMOB(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '30'
      '60'
      '18'
      '60'
      '20'
      '60'
      '5')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      
        'SELECT IDTIPOCONTRIMOB, (TRIM(SIGLA) || '#39' - '#39' || TRIM(NOME)) AS ' +
        'DESCRICAO FROM TIPOCONTRIMOB')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'IDTIPOCONTRIMOB')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'DESCRICAO')
    Left = 104
    Top = 312
  end
end
