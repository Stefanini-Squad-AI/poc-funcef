inherited frmExecGeraDocConvenio: TfrmExecGeraDocConvenio
  Left = 152
  Top = 192
  BorderStyle = bsSingle
  Caption = 'Geração de Documentos e Arquivos para Entidades Conveniadas'
  ClientHeight = 387
  ClientWidth = 701
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 701
    Height = 348
    inherited PagControle: TPageControl
      Width = 699
      Height = 346
      ActivePage = TabSheet1
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 691
          Caption = 'Geração de Documentos e Arquivos para Entidades Conveniadas'
        end
        object Label15: TLabel
          Left = 8
          Top = 34
          Width = 160
          Height = 13
          Caption = 'Mês/Ano de Processamento'
        end
        object Label1: TLabel
          Left = 576
          Top = 34
          Width = 87
          Height = 13
          Caption = 'Previsão Pagto'
        end
        object rdgRelatorio: TRadioGroup
          Left = 9
          Top = 264
          Width = 192
          Height = 65
          Caption = ' Relatório '
          ItemIndex = 0
          Items.Strings = (
            'por Favorecido (analítico)'
            'por Favorecido (líquido)'
            'pelo Rateio')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
        end
        object cboMes: TComboBox
          Left = 8
          Top = 48
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnExit = cboMesExit
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
        object DBspnAno: TwwDBSpinEdit
          Left = 152
          Top = 48
          Width = 65
          Height = 21
          Increment = 1
          TabOrder = 1
          UnboundDataType = wwDefault
          OnExit = cboMesExit
        end
        inline molVersaoPagto: TmolVersaoPagto
          Left = 8
          Top = 104
          Width = 681
          Height = 161
          TabOrder = 3
          inherited lstVersao: TCheckListBox
            Width = 673
            Height = 153
          end
          inherited sqlVersaoPagto: TCMSqlParams
            Top = 24
          end
          inherited cdsVersaoPagto: TCMClientDataSet
            Top = 8
          end
        end
        object Panel3: TPanel
          Left = 8
          Top = 80
          Width = 673
          Height = 25
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Versões de Pagamento'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object edtPrevisaoPagto: TCMDateTimePicker
          Left = 576
          Top = 48
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 4
        end
        object btnRelatorio: TBitBtn
          Left = 584
          Top = 282
          Width = 97
          Height = 33
          Caption = 'Relatório'
          TabOrder = 5
          OnClick = btnRelatorioClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
            77777777777F8887F77777777788FF08777777777F887778F777777788FFFFF0
            7777777788777FF8F7777778FFFF88F077777778F77F88F87F777778FF00F0FF
            077777787F8878F78F77777700FFF0FF0777777F8877787F87F77700FFFFFF0F
            F077778877777F8F787F778FFFFFCF0FFF07778F77FF8787F787778FFCCCFFF0
            FFF07787F88877F8F7F87778FFFFFCF0F8877778F77FF87878877778FFCCCFFF
            077777787F88877F87F777778FFFFFCFF07777778F77FF87787F77778FFCCCFF
            FF07777787F888777F87777778FFFFFF88777777787F777F88777777778FFF88
            777777777787FF88777777777778887777777777777888777777}
          NumGlyphs = 2
          Spacing = 6
        end
        object GroupBox1: TGroupBox
          Left = 216
          Top = 264
          Width = 353
          Height = 65
          TabOrder = 7
          object chkCorLinha: TCheckBox
            Left = 16
            Top = 40
            Width = 233
            Height = 17
            Caption = 'Imprimir linhas com cores alternadas: '
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object cboCorLinha: TfcColorCombo
            Left = 250
            Top = 38
            Width = 87
            Height = 21
            AlignmentVertical = fcavCenter
            AutoSelect = False
            ColorDialogOptions = []
            ColorListOptions.ColorWidth = 119
            ColorListOptions.Font.Charset = DEFAULT_CHARSET
            ColorListOptions.Font.Color = clWindowText
            ColorListOptions.Font.Height = -11
            ColorListOptions.Font.Name = 'MS Sans Serif'
            ColorListOptions.Font.Style = []
            ColorListOptions.GreyScaleIncrement = 1
            ColorListOptions.Options = [ccoShowCustomColors]
            CustomColors.Strings = (
              'ColorA=FFFFFF'
              'ColorC=00C0FFFF'
              'ColorD=00C6F9CC'
              'ColorE=00F3E6CD'
              'ColorF=00A0A0A0'
              'ColorG=00BEBEBE'
              'ColorH=00D2D2D2'
              'ColorI=00E3E3E3')
            DropDownCount = 8
            DropDownWidth = 8
            ReadOnly = False
            ShowMatchText = False
            SelectedColor = clWhite
            TabOrder = 2
          end
          object chkLinhas: TCheckBox
            Left = 16
            Top = 16
            Width = 321
            Height = 17
            Caption = 'Imprimir linhas separadoras'
            TabOrder = 0
          end
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 691
          Caption = 'Geração de Documentos e Arquivos para Entidades Conveniadas'
        end
        object PageControl1: TPageControl
          Left = -2
          Top = 32
          Width = 696
          Height = 321
          ActivePage = tbsArquivo
          TabOrder = 1
          object tbsArquivo: TTabSheet
            Caption = 'Lista de Registros do Arquivo'
            object Label2: TLabel
              Left = 0
              Top = 0
              Width = 688
              Height = 17
              Align = alTop
              Alignment = taCenter
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblRateio: TLabel
              Left = 296
              Top = 222
              Width = 175
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Valor total:  000.000.000,00'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object lblLinhasTotal: TLabel
              Left = 296
              Top = 238
              Width = 175
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Linhas: 10.000'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object lblDesconto2: TLabel
              Left = 296
              Top = 270
              Width = 175
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Desconto:  000.000.000,00'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object lblLinhasRateio: TLabel
              Left = 296
              Top = 254
              Width = 175
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Linhas: 10.000'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object DBgrdArquivo: TwwDBGrid
              Left = 0
              Top = 24
              Width = 673
              Height = 193
              Selected.Strings = (
                'NOME'#9'57'#9'Favorecido'#9'F'
                'VALOR'#9'13'#9'Valor'#9'F'
                'LINHAS'#9'6'#9'Linhas'#9'F'
                'VALORDESCONTO'#9'13'#9'Vlr. Desconto'#9'F'
                'CONTALIQUIDO'#9'17'#9'Conta Líquido'#9'F'
                'IDPESSOA'#9'10'#9'IDPESSOA'#9'F'
                'RAZAOSOCIAL'#9'60'#9'RAZAOSOCIAL'#9'F'
                'NUMDOCUMENTO'#9'18'#9'NUMDOCUMENTO'#9'F'
                'CONTACORRENTE'#9'15'#9'CONTACORRENTE'#9'F'
                'NUMAGENCIA'#9'15'#9'NUMAGENCIA'#9'F'
                'CODBANCOFAVORECIDO'#9'21'#9'CODBANCOFAVORECIDO'#9'F'
                'LOGRADOURO'#9'12'#9'LOGRADOURO'#9'F'
                'NUMERO'#9'7'#9'NUMERO'#9'F'
                'COMPLEMENTO'#9'13'#9'COMPLEMENTO'#9'F'
                'BAIRRO'#9'6'#9'BAIRRO'#9'F'
                'CIDADE'#9'6'#9'CIDADE'#9'F'
                'CODESTADO'#9'10'#9'CODESTADO'#9'F'
                'CEP'#9'3'#9'CEP'#9'F'
                'IDFORCLI'#9'10'#9'IDFORCLI'#9'F'
                'CODDOCUMENTO'#9'15'#9'CODDOCUMENTO'#9'F'
                'VALORJUROS'#9'11'#9'VALORJUROS'#9'F'
                'DATAVENCTO'#9'11'#9'DATAVENCTO'#9'F'
                'DATAPROGRAMADA'#9'17'#9'DATAPROGRAMADA'#9'F'
                'TIPOMOEDA'#9'10'#9'TIPOMOEDA'#9'F'
                'NUMLOTE'#9'10'#9'NUMLOTE'#9'F'
                'CODPORTFORMA'#9'14'#9'CODPORTFORMA'#9'F'
                'CODPORTADOR'#9'13'#9'CODPORTADOR'#9'F'
                'CODFORMAPAGTO'#9'15'#9'CODFORMAPAGTO'#9'F'
                'CODTIPOPAGTO'#9'13'#9'CODTIPOPAGTO'#9'F'
                'FLGEMITEAVISO'#9'14'#9'FLGEMITEAVISO'#9'F'
                'CODARQUIVOREMESSA'#9'20'#9'CODARQUIVOREMESSA'#9'F'
                'IDBANCO'#9'10'#9'IDBANCO'#9'F'
                'NOCONTACORR'#9'15'#9'NOCONTACORR'#9'F'
                'CODBARRA'#9'9'#9'CODBARRA'#9'F'
                'CODBARRAVALOR'#9'15'#9'CODBARRAVALOR'#9'F'
                'NODOCUMENTO'#9'82'#9'NODOCUMENTO'#9'F'
                'COMPLDOCUMENTO'#9'17'#9'COMPLDOCUMENTO'#9'F'
                'TIPO'#9'4'#9'TIPO'#9'F'
                'NUMEMPRESABANCO'#9'20'#9'NUMEMPRESABANCO'#9'F'
                'DEBCRE'#9'7'#9'DEBCRE'#9'F'
                'TIPOCONTA'#9'10'#9'TIPOCONTA'#9'F'
                'NOMEAGENCIA'#9'60'#9'NOMEAGENCIA'#9'F'
                'LIVRE'#9'25'#9'LIVRE'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              DataSource = dtsListaArquivo
              KeyOptions = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
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
            object Panel1: TPanel
              Left = 0
              Top = 0
              Width = 673
              Height = 25
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'Lista de Registros do Arquivo'
              Color = clNavy
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object Panel2: TPanel
              Left = 480
              Top = 216
              Width = 193
              Height = 61
              TabOrder = 2
              object Label4: TLabel
                Left = 8
                Top = 26
                Width = 179
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = '__________________________'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblTotalArquivo: TLabel
                Left = 8
                Top = 6
                Width = 175
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Valor total:  000.000.000,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblDesconto: TLabel
                Left = 8
                Top = 22
                Width = 175
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Desconto:  000.000.000,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblLiquido: TLabel
                Left = 8
                Top = 42
                Width = 175
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Valor líquido:  000.000.000,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
          end
          object TabSheet2: TTabSheet
            Caption = 'Rateio documento de consignação sem arquivo'
            ImageIndex = 2
            object dbgDocSemArq: TwwDBGrid
              Left = 0
              Top = 24
              Width = 673
              Height = 193
              Selected.Strings = (
                'NOME'#9'77'#9'Favorecido'
                'VALOR'#9'13'#9'Valor'
                'CODPORTFORMA'#9'14'#9'CODPORTFORMA')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              DataSource = dtsRateioSemArquivo
              KeyOptions = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
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
            object Panel5: TPanel
              Left = 480
              Top = 216
              Width = 193
              Height = 25
              TabOrder = 1
              object lblTotalSemArquivo: TLabel
                Left = 8
                Top = 6
                Width = 175
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Valor total:  000.000.000,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object Panel6: TPanel
              Left = 0
              Top = 0
              Width = 673
              Height = 25
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'Rateio documento de consignação sem arquivo'
              Color = clNavy
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 274
          Width = 289
          Height = 61
          BevelOuter = bvNone
          TabOrder = 0
          object chkGravaArquivo: TCheckBox
            Left = 16
            Top = 38
            Width = 233
            Height = 17
            Caption = 'Gravar arquivo de remessa'
            TabOrder = 0
            Visible = False
          end
          object chkGeraDocSemArquivo: TCheckBox
            Left = 16
            Top = 22
            Width = 233
            Height = 17
            Caption = 'Gerar documentos sem arquivo'
            TabOrder = 1
          end
          object chkGeraDocComArquivo: TCheckBox
            Left = 16
            Top = 6
            Width = 233
            Height = 17
            Caption = 'Gerar documentos com arquivo'
            TabOrder = 2
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 348
    Width = 701
    inherited tb97Fundo: TToolbar97
      Left = 241
      inherited sep1: TToolbarSep97
        Left = 87
      end
      inherited CMSeparaWizard2: TToolbarSep97
        Left = 89
      end
      inherited CMSeparaWizard1: TToolbarSep97
        Left = 176
      end
      inherited bbtnSair: TBitBtn
        Left = 286
        Width = 85
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 371
        Width = 85
      end
      inherited btnContinuar: TfcShapeBtn
        Left = 91
        Width = 85
        Layout = blGlyphRight
      end
      inherited btnVoltar: TfcShapeBtn
        Width = 85
      end
      inherited btnConfirmar: TfcShapeBtn
        Left = 201
        Width = 85
        OnClick = btnConfirmarClick
      end
    end
  end
  object dtsListaArquivo: TwwDataSource
    DataSet = cdsListaArquivo
    Left = 344
    Top = 152
  end
  object cdsListaArquivo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 136
    object cdsListaArquivoNOME: TStringField
      DisplayLabel = 'Favorecido'
      DisplayWidth = 57
      FieldName = 'NOME'
      Size = 60
    end
    object cdsListaArquivoVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 13
      FieldName = 'VALOR'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object cdsListaArquivoLINHAS: TFloatField
      DisplayLabel = 'Linhas'
      DisplayWidth = 6
      FieldName = 'LINHAS'
    end
    object cdsListaArquivoVALORDESCONTO: TFloatField
      DisplayLabel = 'Vlr. Desconto'
      DisplayWidth = 13
      FieldName = 'VALORDESCONTO'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object cdsListaArquivoCONTALIQUIDO: TStringField
      DisplayLabel = 'Conta Líquido'
      DisplayWidth = 17
      FieldName = 'CONTALIQUIDO'
      Size = 18
    end
    object cdsListaArquivoIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
    end
    object cdsListaArquivoRAZAOSOCIAL: TStringField
      DisplayWidth = 60
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object cdsListaArquivoNUMDOCUMENTO: TStringField
      DisplayWidth = 18
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object cdsListaArquivoCONTACORRENTE: TStringField
      DisplayWidth = 15
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object cdsListaArquivoNUMAGENCIA: TStringField
      DisplayWidth = 15
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object cdsListaArquivoCODBANCOFAVORECIDO: TStringField
      DisplayWidth = 21
      FieldName = 'CODBANCOFAVORECIDO'
      Size = 10
    end
    object cdsListaArquivoLOGRADOURO: TStringField
      DisplayWidth = 12
      FieldName = 'LOGRADOURO'
      FixedChar = True
      Size = 1
    end
    object cdsListaArquivoNUMERO: TStringField
      DisplayWidth = 7
      FieldName = 'NUMERO'
      FixedChar = True
      Size = 1
    end
    object cdsListaArquivoCOMPLEMENTO: TStringField
      DisplayWidth = 13
      FieldName = 'COMPLEMENTO'
      FixedChar = True
      Size = 1
    end
    object cdsListaArquivoBAIRRO: TStringField
      DisplayWidth = 6
      FieldName = 'BAIRRO'
      FixedChar = True
      Size = 1
    end
    object cdsListaArquivoCIDADE: TStringField
      DisplayWidth = 6
      FieldName = 'CIDADE'
      FixedChar = True
      Size = 1
    end
    object cdsListaArquivoCODESTADO: TStringField
      DisplayWidth = 10
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 1
    end
    object cdsListaArquivoCEP: TStringField
      DisplayWidth = 3
      FieldName = 'CEP'
      FixedChar = True
      Size = 1
    end
    object cdsListaArquivoIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
    end
    object cdsListaArquivoCODDOCUMENTO: TFloatField
      DisplayWidth = 15
      FieldName = 'CODDOCUMENTO'
    end
    object cdsListaArquivoVALORJUROS: TFloatField
      DisplayWidth = 11
      FieldName = 'VALORJUROS'
    end
    object cdsListaArquivoDATAVENCTO: TStringField
      DisplayWidth = 11
      FieldName = 'DATAVENCTO'
      FixedChar = True
      Size = 10
    end
    object cdsListaArquivoDATAPROGRAMADA: TStringField
      DisplayWidth = 17
      FieldName = 'DATAPROGRAMADA'
      FixedChar = True
      Size = 10
    end
    object cdsListaArquivoTIPOMOEDA: TFloatField
      DisplayWidth = 10
      FieldName = 'TIPOMOEDA'
    end
    object cdsListaArquivoNUMLOTE: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMLOTE'
    end
    object cdsListaArquivoCODPORTFORMA: TFloatField
      DisplayWidth = 14
      FieldName = 'CODPORTFORMA'
    end
    object cdsListaArquivoCODPORTADOR: TFloatField
      DisplayWidth = 13
      FieldName = 'CODPORTADOR'
    end
    object cdsListaArquivoCODFORMAPAGTO: TFloatField
      DisplayWidth = 15
      FieldName = 'CODFORMAPAGTO'
    end
    object cdsListaArquivoCODTIPOPAGTO: TFloatField
      DisplayWidth = 13
      FieldName = 'CODTIPOPAGTO'
    end
    object cdsListaArquivoFLGEMITEAVISO: TStringField
      DisplayWidth = 14
      FieldName = 'FLGEMITEAVISO'
      FixedChar = True
      Size = 1
    end
    object cdsListaArquivoCODARQUIVOREMESSA: TFloatField
      DisplayWidth = 20
      FieldName = 'CODARQUIVOREMESSA'
    end
    object cdsListaArquivoIDBANCO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBANCO'
    end
    object cdsListaArquivoNOCONTACORR: TStringField
      DisplayWidth = 15
      FieldName = 'NOCONTACORR'
      FixedChar = True
      Size = 15
    end
    object cdsListaArquivoCODBARRA: TStringField
      DisplayWidth = 9
      FieldName = 'CODBARRA'
      FixedChar = True
      Size = 1
    end
    object cdsListaArquivoCODBARRAVALOR: TStringField
      DisplayWidth = 15
      FieldName = 'CODBARRAVALOR'
      FixedChar = True
      Size = 1
    end
    object cdsListaArquivoNODOCUMENTO: TStringField
      DisplayWidth = 82
      FieldName = 'NODOCUMENTO'
      Size = 82
    end
    object cdsListaArquivoCOMPLDOCUMENTO: TStringField
      DisplayWidth = 17
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 2
    end
    object cdsListaArquivoTIPO: TStringField
      DisplayWidth = 4
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsListaArquivoNUMEMPRESABANCO: TStringField
      DisplayWidth = 20
      FieldName = 'NUMEMPRESABANCO'
    end
    object cdsListaArquivoDEBCRE: TStringField
      DisplayWidth = 7
      FieldName = 'DEBCRE'
      FixedChar = True
      Size = 1
    end
    object cdsListaArquivoTIPOCONTA: TStringField
      DisplayWidth = 10
      FieldName = 'TIPOCONTA'
      FixedChar = True
      Size = 1
    end
    object cdsListaArquivoNOMEAGENCIA: TStringField
      DisplayWidth = 60
      FieldName = 'NOMEAGENCIA'
      Size = 60
    end
    object cdsListaArquivoLIVRE: TStringField
      DisplayWidth = 25
      FieldName = 'LIVRE'
      FixedChar = True
      Size = 25
    end
    object cdsListaArquivoPAGTOTERC: TFloatField
      FieldName = 'PAGTOTERC'
      Visible = False
    end
    object cdsListaArquivoIDFAVORECIDOPAI: TFloatField
      FieldName = 'IDFAVORECIDOPAI'
      Visible = False
    end
    object cdsListaArquivoIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
      Visible = False
    end
    object cdsListaArquivoIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
      Visible = False
    end
    object cdsListaArquivoVLRORIGEM: TFloatField
      FieldName = 'VLRORIGEM'
    end
    object cdsListaArquivoFLGARQUIVO: TStringField
      FieldName = 'FLGARQUIVO'
      Visible = False
      Size = 1
    end
    object cdsListaArquivoCODFORMA: TFloatField
      FieldName = 'CODFORMA'
      Visible = False
    end
  end
  object sqlListaArquivo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CONTALIQUIDO,'
      '  IDFAVORECIDO AS IDPESSOA,'
      '  NOME,'
      '  NOME AS RAZAOSOCIAL,'
      '  NUMDOCUMENTO,'
      '  CONTACORRENTE,'
      '  NUMAGENCIA ,'
      '  NUMBANCO AS CODBANCOFAVORECIDO, '
      '  '#39' '#39' LOGRADOURO, '
      '  '#39' '#39' NUMERO, '
      '  '#39' '#39' COMPLEMENTO, '
      '  '#39' '#39' BAIRRO, '
      '  '#39' '#39' CIDADE,'
      '  '#39' '#39' CODESTADO, '
      '  '#39' '#39' CEP, '
      '  IDFAVORECIDO AS IDFORCLI, '
      '  IDFAVORECIDO AS CODDOCUMENTO,'
      '  LINHAS,'
      '  VALOR,'
      '  0.00 VALORDESCONTO, '
      '  0.00 VALORJUROS, '
      '  '#39'19/12/2006'#39' AS DATAVENCTO,'
      '  '#39'19/12/2006'#39' AS DATAPROGRAMADA,'
      '  0 TIPOMOEDA,'
      '  0 NUMLOTE,'
      '  CODPORTFORMA,'
      '  CODPORTFORMA AS CODPORTADOR,'
      '  CODFORMAPAGTO,'
      '  CODTIPOPAGTO,'
      '  FLGEMITEAVISO,'
      '  CODARQUIVOREMESSA,'
      '  IDBANCO,'
      '  NOCONTACORR,'
      '  '#39' '#39' CODBARRA,'
      '  '#39' '#39' CODBARRAVALOR,'
      '  IDFAVORECIDO||'#39'-'#39'||IDFAVORECIDO||'#39'-'#39' AS NODOCUMENTO,'
      '  '#39'02'#39' AS COMPLDOCUMENTO,'
      '  '#39'F'#39' AS TIPO,'
      '  NUMEMPRESABANCO,'
      '  '#39' '#39' AS DEBCRE,'
      '  '#39'1'#39' AS TIPOCONTA,'
      '  NOMEAGENCIA,'
      '  '#39'                         '#39' AS LIVRE'
      ', PAGTOTERC'
      ', 0 IDFAVORECIDOPAI'
      ', IDCBANCARIA'
      ', IDRUBRICA'
      ', 0.00 AS VLRORIGEM'
      'FROM'
      '  ('
      '  SELECT'
      '    LD.CODPORTFORMAFAV AS CODPORTFORMA,'
      
        '    DECODE(H.FLGDESCONTO, 1, H.PLACONTAC, H.PLACONTAD) AS CONTAL' +
        'IQUIDO,'
      '    LD.FLGGERACPAGAR AS FLGGERACAP,'
      '    LD.FLGELETRONICO,'
      '    PF.NOME,'
      '    H.IDFAVORECIDO,'
      '    CB.CONTACORRENTE,'
      '    AG.NUMAGENCIA,'
      '    BC.NUMBANCO,'
      '    PF.NUMDOCUMENTO,'
      '    PFR.CODARQUIVOREMESSA,'
      '    PFR.PATHARQUIVOREM,'
      '    PFR.DMAIS,'
      '    PFR.CONTROLEREMESSA,'
      '    PFR.CODFORMAPAGTO,'
      '    PFR.FLGEMITEAVISO,'
      '    PFR.CODTIPOPAGTO,'
      '    PFR.NUMEMPRESABANCO,'
      '    PCT.IDBANCO,'
      '    PCT.NOCONTACORR,'
      '    PA.NOME AS NOMEAGENCIA,'
      '    COUNT(*) AS LINHAS,'
      
        '    SUM(DECODE(H.FLGDESCONTO, 1, H.VALORPROVENTO, 0 - H.VALORPRO' +
        'VENTO)) AS VALOR'
      ', RXB.PAGTOTERC'
      ', RXB.IDCBANCARIA'
      ', decode(RXB.pagtoterc, 1, h.idrubrica, 0) as idrubrica'
      ''
      '  FROM'
      '    HISTRUBSAL             H,   '
      '    PROVDESC               PD,  '
      '    PESSOA                 PF,  '
      '    RUBRICAXCONTABANCARIA  RXB, '
      '    CONTABANCARIA          CB,  '
      '    AGENCIABANCARIA        AG,  '
      '    BANCO                  BC,  '
      '    PORTADORFORMA          PFR, '
      '    PORTADORCONTA          PCT, '
      '    PESSOA                 PA,  '
      '    ( '
      '    SELECT '
      '      MIN(IDLAYOUT) IDLAYOUT, IDFAVORECIDO '
      '    FROM '
      '      LAYOUTXCOLUNAS '
      '    GROUP BY '
      '      IDFAVORECIDO '
      '    ) LC, '
      '    LAYOUTDESCONTO         LD '
      '  WHERE '
      '        H.IDHSTFOLHABENEF    IN (1002) '
      '    AND H.IDFAVORECIDO       = PF.IDPESSOA '
      '    AND H.IDMODULO           = 18 '
      '    AND H.IDRUBRICA          = PD.IDPROVENTO '
      '    AND H.FLGDESCONTO        IN (0,1)'
      '    AND H.FLGESPECIAL        = 0 '
      '    AND H.FLGPENSAOALIM      = 0 '
      '    AND H.FLGTIPODESC        IN ('#39'C'#39','#39'Y'#39') '
      '    AND PFR.RECPAG           = '#39'P'#39' '
      '    AND PCT.CODPORTADOR      = PFR.CODPORTADOR '
      '    AND PFR.CODPORTFORMA     = LD.CODPORTFORMAFAV '
      '    AND NVL(PF.TIPO, '#39'F'#39')  = '#39'J'#39' '
      '    AND RXB.IDPESSOA(+)      = H.IDFAVORECIDO '
      '    AND RXB.IDRUBRICA(+)     = H.IDRUBRICA'
      '    AND CB.IDCBANCARIA(+)    = RXB.IDCBANCARIA '
      '    AND CB.IDPESSOA(+)       = RXB.IDPESSOA '
      '    AND AG.IDPESSOA(+)       = CB.IDAGENCIA '
      '    AND AG.IDPESSOA          = PA.IDPESSOA(+) '
      '    AND BC.IDPESSOA(+)       = AG.IDBANCO '
      '    AND LC.IDFAVORECIDO(+)   = H.IDFAVORECIDO '
      '    AND LD.IDLAYOUT(+)       = LC.IDLAYOUT '
      '    AND LD.FLGGERACPAGAR(+)  = 1 '
      '  GROUP BY '
      '    H.IDFAVORECIDO, PF.NOME, CB.CONTACORRENTE, AG.NUMAGENCIA, '
      '    DECODE(H.FLGDESCONTO, 1, H.PLACONTAC, H.PLACONTAD), '
      '    PF.NUMDOCUMENTO, PFR.CODARQUIVOREMESSA, PFR.PATHARQUIVOREM, '
      '    PFR.DMAIS, PFR.CONTROLEREMESSA, PFR.CODFORMAPAGTO, '
      '    PFR.FLGEMITEAVISO, PFR.CODTIPOPAGTO, PFR.NUMEMPRESABANCO,'
      '    PCT.IDBANCO, PCT.NOCONTACORR, PA.NOME,'
      
        '    BC.NUMBANCO, LD.CODPORTFORMAFAV, LD.FLGGERACPAGAR, LD.FLGELE' +
        'TRONICO'
      ', RXB.PAGTOTERC,  RXB.IDCBANCARIA,'
      '    decode(RXB.pagtoterc, 1, h.idrubrica, 0)'
      '  )'
      'WHERE'
      '      FLGELETRONICO  = 1'
      '  AND FLGGERACAP     = 1'
      '  AND CONTACORRENTE  IS NOT NULL'
      '  AND NUMAGENCIA     IS NOT NULL'
      '  AND NUMBANCO       IS NOT NULL'
      '  AND VALOR          > 0'
      'ORDER BY'
      '  NOME, CONTACORRENTE')
    ClientDataSet = cdsListaArquivo
    Left = 344
    Top = 120
  end
  object sqlRateio: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  LD.CODPORTFORMAFAV AS CODPORTFORMA,'
      '  LD.FLGGERACPAGAR AS FLGGERACAP,'
      '  LD.FLGELETRONICO,'
      '  LD.PLACONTABAIXA,'
      '  LD.IDREGRATXADMIN,'
      '  LD.CODTIPRECDES,'
      '  PF.NOME,'
      '  RP.UNIDNEGOC,'
      '  NVL(RP.CODTIPRECDESFAV, H.CODTIPRECDES) AS CODTIPRECDESFAV,'
      '  RP.CODCENTRORESPON,'
      '  H.IDFAVORECIDO,'
      '  CB.CONTACORRENTE,'
      '  PF.NUMDOCUMENTO,'
      '  PI.IDPLANPREVCONTAB AS IDPLANOCONTABIL,'
      '  H.IDPATRO,'
      
        '  DECODE(H.FLGDESCONTO, 1, H.PLACONTAC, H.PLACONTAD) AS PLACONTA' +
        ','
      
        '  SUM(DECODE(H.FLGDESCONTO, 1, H.VALORPROVENTO, 0 - H.VALORPROVE' +
        'NTO)) AS VALOR,'
      '  COUNT(H.FLGDESCONTO) AS LINHAS'
      'FROM'
      '  HISTRUBSAL             H,'
      '  PESSOA                 PF,'
      '  RUBRICAXCONTABANCARIA  RXB,'
      '  CONTABANCARIA          CB,'
      '  PROVDESC               PD,'
      '  RUBRICAXPLANO          RP,'
      '  ('
      '  SELECT'
      '    MIN(IDLAYOUT) IDLAYOUT, IDFAVORECIDO'
      '  FROM'
      '    LAYOUTXCOLUNAS'
      '  GROUP BY'
      '    IDFAVORECIDO'
      '  ) LC,'
      '  LAYOUTDESCONTO         LD,'
      '  PERFILINVEST  PI'
      'WHERE'
      '      LD.FLGELETRONICO     = 1'
      '  AND H.IDHSTFOLHABENEF    IN (1002)'
      '  AND H.IDFAVORECIDO       = PF.IDPESSOA'
      '  AND H.IDMODULO           = 18'
      '  AND H.FLGDESCONTO        IN (0,1)'
      '  AND H.FLGESPECIAL        = 0'
      '  AND H.IDRUBRICA          = PD.IDPROVENTO'
      '  AND H.IDRUBRICA          = RP.IDRUBRICA'
      '  AND H.IDPLANOPREV        = RP.IDPLANOPREV'
      '  AND H.IDPATRO            = RP.IDPESSJUR'
      '  AND H.FLGPENSAOALIM      = 0'
      '  AND H.FLGTIPODESC        IN ('#39'C'#39','#39'Y'#39')'
      '  AND NVL(PF.TIPO, '#39'F'#39')  = '#39'J'#39
      '  AND RXB.IDPESSOA(+)      = H.IDFAVORECIDO'
      '  AND RXB.IDRUBRICA(+)     = H.IDRUBRICA'
      '  AND CB.IDCBANCARIA(+)    = RXB.IDCBANCARIA'
      '  AND CB.IDPESSOA(+)       = RXB.IDPESSOA'
      '  AND LC.IDFAVORECIDO(+)   = H.IDFAVORECIDO'
      '  AND LD.IDLAYOUT(+)       = LC.IDLAYOUT'
      '  AND LD.FLGGERACPAGAR(+)  = 1'
      ' AND H.IDPERFILINVEST = PI.IDPERFILINVEST'
      ''
      'GROUP BY'
      '  H.IDFAVORECIDO, PF.NOME, CB.CONTACORRENTE,'
      '  PF.NUMDOCUMENTO, NVL(RP.CODTIPRECDESFAV, H.CODTIPRECDES),'
      '  LD.CODPORTFORMAFAV, LD.FLGGERACPAGAR, LD.FLGELETRONICO,'
      '  LD.PLACONTABAIXA, LD.IDREGRATXADMIN, LD.CODTIPRECDES,'
      '  RP.UNIDNEGOC, RP.CODCENTRORESPON,'
      '  PI.IDPLANPREVCONTAB, H.IDPATRO'
      ''
      'ORDER BY'
      '  PF.NOME, CB.CONTACORRENTE')
    ClientDataSet = cdsRateio
    Left = 152
    Top = 136
  end
  object cdsRateio: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 120
    Data = {
      C67500009619E0BD01000000180000001100D40000000300000049020C434F44
      504F5254464F524D4108000400000000000A464C474745524143415008000400
      000000000D464C47454C4554524F4E49434F08000400000000000D504C41434F
      4E5441424149584101004900000002000753554254595045020049000A004669
      78656443686172000557494454480200020012000E4944524547524154584144
      4D494E08000400000000000C434F445449505245434445530100490000000200
      0753554254595045020049000A00466978656443686172000557494454480200
      02000F00044E4F4D450100490000000100055749445448020002003C0009554E
      49444E45474F4308000400000000000F434F4454495052454344455346415601
      00490000000100055749445448020002000F000F434F4443454E54524F524553
      504F4E01004900000002000753554254595045020049000A0046697865644368
      617200055749445448020002000A000C49444641564F52454349444F08000400
      000000000D434F4E5441434F5252454E54450100490000000100055749445448
      020002000F000C4E554D444F43554D454E544F01004900000002000753554254
      595045020049000A00466978656443686172000557494454480200020012000F
      4944504C414E4F434F4E544142494C0800040000000000074944504154524F08
      000400000000000556414C4F520800040000000000064C494E48415308000400
      0000000002000D44454641554C545F4F52444552020082000200000007000C00
      044C434944040001000908000000400500010000000000004058400000000000
      00F03F000000000000F03F0A4144564F4345462D4446000000000000F0BF0F30
      313130303037202020202020202004303430330000000048112A410C30303330
      30303130313631360000000000000040000000000000F03F7B14AE47E1DA4B40
      00000000000008400040050001000000000000405840000000000000F03F0000
      00000000F03F0A4144564F4345462D4446000000000000F0BF0F303131303030
      37202020202020202004303430330000000048112A410C303033303030313031
      3631360000000000003C40000000000000F03F5C8FC2F528E474400000000000
      0032400040050001000000000000405840000000000000F03F000000000000F0
      3F0A4144564F4345462D4446000000000000F0BF0F3031313030303720202020
      2020202004303430330000000048112A410C3030333030303130313631360000
      000000805040000000000000F03F52B81E85EB91424000000000000000400040
      050001000000000000405840000000000000F03F000000000000F03F09414745
      4345462D5052000000000000F0BF0F3031313030303720202020202020200430
      343033000000004A112A410C3030333030303030313435370000000000003C40
      000000000000F03F0000000000406A400000000000002C400040050001000000
      000000405840000000000000F03F000000000000F03F094147454345462D5052
      000000000000F0BF0F3031313030303720202020202020200430343033000000
      004A112A410C3030333030303030313435370000000000805040000000000000
      F03F0000000000002E40000000000000F03F0040050001000000000000405840
      000000000000F03F000000000000F03F094147454345462D524A000000000000
      F0BF0F303131303030372020202020202020043034303300000000F0102A410C
      3030333030303030343938340000000000000040000000000000F03F00000000
      00003240000000000000F03F0040050001000000000000405840000000000000
      F03F000000000000F03F094147454345462D524A000000000000F0BF0F303131
      303030372020202020202020043034303300000000F0102A410C303033303030
      3030343938340000000000003C40000000000000F03F0000000000005B400000
      0000000018400040050001000000000000405840000000000000F03F00000000
      0000F03F094147454345462D5350000000000000F0BF0F303131303030372020
      2020202020200430343033000000004E112A410C303232303030303130303036
      0000000000000040000000000000F03FB81E85EB51B82E40000000000000F03F
      0040050001000000000000405840000000000000F03F000000000000F03F0941
      47454345462D5350000000000000F0BF0F303131303030372020202020202020
      0430343033000000004E112A410C303232303030303130303036000000000000
      3C40000000000000F03F0AD7A3703D0A57400000000000001840004005000100
      0000000000405840000000000000F03F000000000000F03F07414E4150484142
      000000000000F0BF0F3031313030303720202020202020200430343033000000
      0018142A410C3030333030303030323430350000000000000040000000000000
      F03F85EB51B81E25594000000000000018400040050001000000000000405840
      000000000000F03F000000000000F03F07414E4150484142000000000000F0BF
      0F30313130303037202020202020202004303430330000000018142A410C3030
      333030303030323430350000000000805040000000000000F03F000000000038
      BE400000000000206F400040050001000000000000405840000000000000F03F
      000000000000F03F07414E4150484142000000000000F0BF0F30313130303037
      202020202020202004303430330000000018142A410C30303330303030303234
      30350000000000003C40000000000000F03F33333333334B8140000000000000
      28400040050001000000000000405840000000000000F03F000000000000F03F
      3A4150414345462F4553202D204153534F432E20504149532C20414D49474F53
      204520504553534F41532044454649432E204441204345462F45530000000000
      00F0BF0F30313130303037202020202020202004303430330000000066842C41
      0C3030333030303032343439330000000000000040000000000000F03F9A9999
      9999994840000000000000104000400500010000000000004058400000000000
      00F03F000000000000F03F3A4150414345462F4553202D204153534F432E2050
      4149532C20414D49474F53204520504553534F41532044454649432E20444120
      4345462F4553000000000000F0BF0F3031313030303720202020202020200430
      3430330000000066842C410C3030333030303032343439330000000000003C40
      000000000000F03F7B14AE47E17A454000000000000010400040050001000000
      000000405840000000000000F03F000000000000F03F04415341530000000000
      00F0BF0F30313130303037202020202020202004303430330000000016142A41
      0C3030333030373839303434320000000000000040000000000000F03FA4703D
      0AD7233B40000000000000104000400500010000000000004058400000000000
      00F03F000000000000F03F0441534153000000000000F0BF0F30313130303037
      202020202020202004303430330000000016142A410C30303330303738393034
      34320000000000003C40000000000000F03FB81E85EB51585840000000000000
      34400040050001000000000000405840000000000000F03F000000000000F03F
      0441534153000000000000F0BF0F303131303030372020202020202020043034
      30330000000016142A410C303033303037383930343432000000000080504000
      0000000000F03F52B81E85EB29CC400000000000FC9740004005000100000000
      0000405840000000000000F03F000000000000F03F0A415343454645522D524A
      000000000000F0BF0F3031313030303720202020202020200430343033000000
      0050112A410C3030333030303033343933340000000000000040000000000000
      F03FCDCCCCCC4C99A9400000000000805A400040050001000000000000405840
      000000000000F03F000000000000F03F0A415343454645522D524A0000000000
      00F0BF0F30313130303037202020202020202004303430330000000050112A41
      0C3030333030303033343933340000000000003C40000000000000F03F52B81E
      852BE4B540000000000000644000400500010000000000004058400000000000
      00F03F000000000000F03F0A415343454645522D524A000000000000F0BF0F30
      313130303037202020202020202004303430330000000050112A410C30303330
      30303033343933340000000000805040000000000000F03FCDCCCCCCCCC68D40
      00000000008041400040050001000000000000405840000000000000F03F0000
      00000000F03F1D4153534F43494143414F20444F532041504F53454E5441444F
      532D414C000000000000F0BF0F30313130303037202020202020202004303430
      330000000088112A410C30303330303030343530393200000000000000400000
      00000000F03F00000000006093400000000000004F4000400500010000000000
      00405840000000000000F03F000000000000F03F1D4153534F43494143414F20
      444F532041504F53454E5441444F532D414C000000000000F0BF0F3031313030
      3037202020202020202004303430330000000088112A410C3030333030303034
      353039320000000000003C40000000000000F03F00000000003CB94000000000
      003074400040050001000000000000405840000000000000F03F000000000000
      F03F1D4153534F43494143414F20444F532041504F53454E5441444F532D414C
      000000000000F0BF0F3031313030303720202020202020200430343033000000
      0088112A410C3030333030303034353039320000000000C05240000000000000
      F03F000000000000444000000000000000400040050001000000000000405840
      000000000000F03F000000000000F03F1D4153534F43494143414F20444F5320
      41504F53454E5441444F532D414D000000000000F0BF0F303131303030372020
      2020202020200430343033000000008A112A410C303033303030303232353535
      0000000000000040000000000000F03F5C8FC2F528007D400000000000002C40
      0040050001000000000000405840000000000000F03F000000000000F03F1D41
      53534F43494143414F20444F532041504F53454E5441444F532D414D00000000
      0000F0BF0F3031313030303720202020202020200430343033000000008A112A
      410C3030333030303032323535350000000000805040000000000000F03F90C2
      F5285CFB87400000000000003940004005000100000000000040584000000000
      0000F03F000000000000F03F1D4153534F43494143414F20444F532041504F53
      454E5441444F532D414D000000000000F0BF0F30313130303037202020202020
      20200430343033000000008A112A410C30303330303030323235353500000000
      00003C40000000000000F03F713D0AD7A36DAC40000000000000584000400500
      01000000000000405840000000000000F03F000000000000F03F1D4153534F43
      494143414F20444F532041504F53454E5441444F532D4241000000000000F0BF
      0F3031313030303720202020202020200430343033000000008C112A410C3030
      333030303030313238360000000000000040000000000000F03F295C8FC2D5D0
      C0400000000000607C400040050001000000000000405840000000000000F03F
      000000000000F03F1D4153534F43494143414F20444F532041504F53454E5441
      444F532D4241000000000000F0BF0F3031313030303720202020202020200430
      343033000000008C112A410C3030333030303030313238360000000000805040
      000000000000F03F7B14AE47E10A9E400000000000805C400040050001000000
      000000405840000000000000F03F000000000000F03F1D4153534F4349414341
      4F20444F532041504F53454E5441444F532D4241000000000000F0BF0F303131
      3030303720202020202020200430343033000000008C112A410C303033303030
      3030313238360000000000003C40000000000000F03F9A999999598CDF400000
      000000C094400040050001000000000000405840000000000000F03F00000000
      0000F03F1D4153534F43494143414F20444F532041504F53454E5441444F532D
      4345000000000000F0BF0F303131303030372020202020202020043034303300
      00000090112A410C303033303030303233383530000000000000004000000000
      0000F03F15AE47E1FAECA3400000000000006C40004005000100000000000040
      5840000000000000F03F000000000000F03F1D4153534F43494143414F20444F
      532041504F53454E5441444F532D4345000000000000F0BF0F30313130303037
      202020202020202004303430330000000090112A410C30303330303030323338
      35300000000000003C40000000000000F03F15AE47E11A8CD1400000000000E0
      92400040050001000000000000405840000000000000F03F000000000000F03F
      1D4153534F43494143414F20444F532041504F53454E5441444F532D43450000
      00000000F0BF0F30313130303037202020202020202004303430330000000090
      112A410C3030333030303032333835300000000000805040000000000000F03F
      85EB51B89EFAA5400000000000E06C4000400500010000000000004058400000
      00000000F03F000000000000F03F1D4153534F43494143414F20444F53204150
      4F53454E5441444F532D4446000000000000F0BF0F3031313030303720202020
      202020200430343033000000008E112A410C3030333030303530333932350000
      000000000040000000000000F03F3E0AD7A3B0C0B5400000000000E064400040
      050001000000000000405840000000000000F03F000000000000F03F1D415353
      4F43494143414F20444F532041504F53454E5441444F532D4446000000000000
      F0BF0F3031313030303720202020202020200430343033000000008E112A410C
      3030333030303530333932350000000000003340000000000000F03FF6285C8F
      C2753740000000000000F03F0040050001000000000000405840000000000000
      F03F000000000000F03F1D4153534F43494143414F20444F532041504F53454E
      5441444F532D4446000000000000F0BF0F303131303030372020202020202020
      0430343033000000008E112A410C303033303030353033393235000000000080
      5040000000000000F03FB81E85EBD1E6A8400000000000005340004005000100
      0000000000405840000000000000F03F000000000000F03F1D4153534F434941
      43414F20444F532041504F53454E5441444F532D4446000000000000F0BF0F30
      31313030303720202020202020200430343033000000008E112A410C30303330
      30303530333932350000000000C05240000000000000F03FF6285C8FC2753740
      000000000000F03F0040050001000000000000405840000000000000F03F0000
      00000000F03F1D4153534F43494143414F20444F532041504F53454E5441444F
      532D4446000000000000F0BF0F30313130303037202020202020202004303430
      33000000008E112A410C3030333030303530333932350000000000003C400000
      00000000F03F3E0AD7A348CFEA40000000000078924000400500010000000000
      00405840000000000000F03F000000000000F03F1D4153534F43494143414F20
      444F532041504F53454E5441444F532D4553000000000000F0BF0F3031313030
      3037202020202020202004303430330000000092112A410C3030333030303032
      323736380000000000000040000000000000F03F8FC2F5285C15A64000000000
      006061400040050001000000000000405840000000000000F03F000000000000
      F03F1D4153534F43494143414F20444F532041504F53454E5441444F532D4553
      000000000000F0BF0F3031313030303720202020202020200430343033000000
      0092112A410C3030333030303032323736380000000000003C40000000000000
      F03F9A99999959ECC9400000000000C07A400040050001000000000000405840
      000000000000F03F000000000000F03F1D4153534F43494143414F20444F5320
      41504F53454E5441444F532D4553000000000000F0BF0F303131303030372020
      20202020202004303430330000000092112A410C303033303030303232373638
      0000000000805040000000000000F03F48E17A14AEA699400000000000003E40
      0040050001000000000000405840000000000000F03F000000000000F03F1D41
      53534F43494143414F20444F532041504F53454E5441444F532D474F00000000
      0000F0BF0F303131303030372020202020202020043034303300000000B0102A
      410C3031333030383230343137360000000000000040000000000000F03F15AE
      47E17A268B400000000000004B40004005000100000000000040584000000000
      0000F03F000000000000F03F1D4153534F43494143414F20444F532041504F53
      454E5441444F532D474F000000000000F0BF0F30313130303037202020202020
      2020043034303300000000B0102A410C30313330303832303431373600000000
      00003C40000000000000F03F67666666E6EBAB40000000000060694000400500
      01000000000000405840000000000000F03F000000000000F03F1D4153534F43
      494143414F20444F532041504F53454E5441444F532D474F000000000000F0BF
      0F303131303030372020202020202020043034303300000000B0102A410C3031
      333030383230343137360000000000805040000000000000F03F9A99999999D9
      314000000000000008400040050001000000000000405840000000000000F03F
      000000000000F03F1D4153534F43494143414F20444F532041504F53454E5441
      444F532D4D41000000000000F0BF0F3031313030303720202020202020200430
      34303300000000B2102A410C3030333030303034393836390000000000000040
      000000000000F03FCDCCCCCCCC3476400000000000003B400040050001000000
      000000405840000000000000F03F000000000000F03F1D4153534F4349414341
      4F20444F532041504F53454E5441444F532D4D41000000000000F0BF0F303131
      303030372020202020202020043034303300000000B2102A410C303033303030
      3034393836390000000000003C40000000000000F03F0AD7A3703DC692400000
      0000004057400040050001000000000000405840000000000000F03F00000000
      0000F03F1D4153534F43494143414F20444F532041504F53454E5441444F532D
      4D41000000000000F0BF0F303131303030372020202020202020043034303300
      000000B2102A410C303033303030303439383639000000000080504000000000
      0000F03FD7A3703D0AD739400000000000000040004005000100000000000040
      5840000000000000F03F000000000000F03F1D4153534F43494143414F20444F
      532041504F53454E5441444F532D4D47000000000000F0BF0F30313130303037
      2020202020202020043034303300000000B6102A410C30303330303530363839
      37310000000000000040000000000000F03F52B81E85EBF3B740000000000080
      48400040050001000000000000405840000000000000F03F000000000000F03F
      1D4153534F43494143414F20444F532041504F53454E5441444F532D4D470000
      00000000F0BF0F303131303030372020202020202020043034303300000000B6
      102A410C3030333030353036383937310000000000003C40000000000000F03F
      0AD7A3705516E0400000000000E06F4000400500010000000000004058400000
      00000000F03F000000000000F03F1D4153534F43494143414F20444F53204150
      4F53454E5441444F532D4D47000000000000F0BF0F3031313030303720202020
      20202020043034303300000000B6102A410C3030333030353036383937310000
      000000805040000000000000F03F15AE47E17A749E4000000000000030400040
      050001000000000000405840000000000000F03F000000000000F03F1D415353
      4F43494143414F20444F532041504F53454E5441444F532D4D47000000000000
      F0BF0F303131303030372020202020202020043034303300000000B6102A410C
      3031333030313333313235360000000000000040000000000000F03F9A999999
      599BC1400000000000407D400040050001000000000000405840000000000000
      F03F000000000000F03F1D4153534F43494143414F20444F532041504F53454E
      5441444F532D4D47000000000000F0BF0F303131303030372020202020202020
      043034303300000000B6102A410C303133303031333331323536000000000080
      5040000000000000F03FCDCCCCCCCCAE93400000000000405040004005000100
      0000000000405840000000000000F03F000000000000F03F1D4153534F434941
      43414F20444F532041504F53454E5441444F532D4D47000000000000F0BF0F30
      3131303030372020202020202020043034303300000000B6102A410C30313330
      30313333313235360000000000003C40000000000000F03FD7A3703D2AC0D840
      00000000009494400040050001000000000000405840000000000000F03F0000
      00000000F03F1D4153534F43494143414F20444F532041504F53454E5441444F
      532D4D53000000000000F0BF0F30313130303037202020202020202004303430
      3300000000AE102A410C30303330303030313334363000000000000000400000
      00000000F03FE17A14AE47839E40000000000080554000400500010000000000
      00405840000000000000F03F000000000000F03F1D4153534F43494143414F20
      444F532041504F53454E5441444F532D4D53000000000000F0BF0F3031313030
      30372020202020202020043034303300000000AE102A410C3030333030303031
      333436300000000000003C40000000000000F03FB81E85EB31D0C84000000000
      00A076400040050001000000000000405840000000000000F03F000000000000
      F03F1D4153534F43494143414F20444F532041504F53454E5441444F532D4D53
      000000000000F0BF0F3031313030303720202020202020200430343033000000
      00AE102A410C3030333030303031333436300000000000805040000000000000
      F03F333333333337764000000000000033400040050001000000000000405840
      000000000000F03F000000000000F03F1D4153534F43494143414F20444F5320
      41504F53454E5441444F532D4D54000000000000F0BF0F303131303030372020
      202020202020043034303300000000B4102A410C303033303030303335393232
      0000000000000040000000000000F03F0000000000B083400000000000004540
      0040050001000000000000405840000000000000F03F000000000000F03F1D41
      53534F43494143414F20444F532041504F53454E5441444F532D4D5400000000
      0000F0BF0F303131303030372020202020202020043034303300000000B4102A
      410C3030333030303033353932320000000000805040000000000000F03F0000
      000000004E400000000000001440004005000100000000000040584000000000
      0000F03F000000000000F03F1D4153534F43494143414F20444F532041504F53
      454E5441444F532D4D54000000000000F0BF0F30313130303037202020202020
      2020043034303300000000B4102A410C30303330303030333539323200000000
      00003C40000000000000F03F00000000004C9D400000000000405F4000400500
      01000000000000405840000000000000F03F000000000000F03F1D4153534F43
      494143414F20444F532041504F53454E5441444F532D5041000000000000F0BF
      0F303131303030372020202020202020043034303300000000B8102A410C3030
      333030353034363437300000000000000040000000000000F03F90C2F5285CFD
      8D4000000000000040400040050001000000000000405840000000000000F03F
      000000000000F03F1D4153534F43494143414F20444F532041504F53454E5441
      444F532D5041000000000000F0BF0F3031313030303720202020202020200430
      34303300000000B8102A410C3030333030353034363437300000000000805040
      000000000000F03F85EB51B81E9D894000000000000034400040050001000000
      000000405840000000000000F03F000000000000F03F1D4153534F4349414341
      4F20444F532041504F53454E5441444F532D5041000000000000F0BF0F303131
      303030372020202020202020043034303300000000B8102A410C303033303035
      3034363437300000000000003C40000000000000F03F8FC2F5281CDAC2400000
      000000E06A400040050001000000000000405840000000000000F03F00000000
      0000F03F1D4153534F43494143414F20444F532041504F53454E5441444F532D
      5042000000000000F0BF0F303131303030372020202020202020043034303300
      000000BA102A410C303033303030303432303036000000000000004000000000
      0000F03F0000000000A4A3400000000000C05640004005000100000000000040
      5840000000000000F03F000000000000F03F1D4153534F43494143414F20444F
      532041504F53454E5441444F532D5042000000000000F0BF0F30313130303037
      2020202020202020043034303300000000BA102A410C30303330303030343230
      30360000000000805040000000000000F03F0000000000E07140000000000000
      2C400040050001000000000000405840000000000000F03F000000000000F03F
      1D4153534F43494143414F20444F532041504F53454E5441444F532D50420000
      00000000F0BF0F303131303030372020202020202020043034303300000000BA
      102A410C3030333030303034323030360000000000003C40000000000000F03F
      D7A3703D0AD6CF40000000000050704000400500010000000000004058400000
      00000000F03F000000000000F03F1D4153534F43494143414F20444F53204150
      4F53454E5441444F532D5045000000000000F0BF0F3031313030303720202020
      20202020043034303300000000BE102A410C3030333030303030313230390000
      000000000040000000000000F03F713D0AD7239BCA4000000000000071400040
      050001000000000000405840000000000000F03F000000000000F03F1D415353
      4F43494143414F20444F532041504F53454E5441444F532D5045000000000000
      F0BF0F303131303030372020202020202020043034303300000000BE102A410C
      3030333030303030313230390000000000805040000000000000F03FCDCCCCCC
      8C90B1400000000000405F400040050001000000000000405840000000000000
      F03F000000000000F03F1D4153534F43494143414F20444F532041504F53454E
      5441444F532D5045000000000000F0BF0F303131303030372020202020202020
      043034303300000000BE102A410C303033303030303031323039000000000000
      3C40000000000000F03F5C8FC2F560E7F1400000000000D89040004005000100
      0000000000405840000000000000F03F000000000000F03F1D4153534F434941
      43414F20444F532041504F53454E5441444F532D5049000000000000F0BF0F30
      3131303030372020202020202020043034303300000000C0102A410C30303330
      30303033303633380000000000000040000000000000F03F0000000000F88640
      00000000000045400040050001000000000000405840000000000000F03F0000
      00000000F03F1D4153534F43494143414F20444F532041504F53454E5441444F
      532D5049000000000000F0BF0F30313130303037202020202020202004303430
      3300000000C0102A410C3030333030303033303633380000000000003C400000
      00000000F03F0000000000569840000000000040564000400500010000000000
      00405840000000000000F03F000000000000F03F1D4153534F43494143414F20
      444F532041504F53454E5441444F532D5049000000000000F0BF0F3031313030
      30372020202020202020043034303300000000C0102A410C3030333030303033
      303633380000000000805040000000000000F03F000000000080314000000000
      0000F03F0040050001000000000000405840000000000000F03F000000000000
      F03F1D4153534F43494143414F20444F532041504F53454E5441444F532D5052
      000000000000F0BF0F3031313030303720202020202020200430343033000000
      00BC102A410C3030333030313032323933300000000000000040000000000000
      F03F0000000000DAA6400000000000206C400040050001000000000000405840
      000000000000F03F000000000000F03F1D4153534F43494143414F20444F5320
      41504F53454E5441444F532D5052000000000000F0BF0F303131303030372020
      202020202020043034303300000000BC102A410C303033303031303232393330
      0000000000003C40000000000000F03F00000000006DC8400000000000208E40
      0040050001000000000000405840000000000000F03F000000000000F03F1D41
      53534F43494143414F20444F532041504F53454E5441444F532D505200000000
      0000F0BF0F303131303030372020202020202020043034303300000000BC102A
      410C3030333030313032323933300000000000805040000000000000F03F0000
      0000000C90400000000000C05340004005000100000000000040584000000000
      0000F03F000000000000F03F1D4153534F43494143414F20444F532041504F53
      454E5441444F532D5052000000000000F0BF0F30313130303037202020202020
      2020043034303300000000BC102A410C30313330303430313833353300000000
      00000040000000000000F03F85EB51B8DEAAB040000000000080434000400500
      01000000000000405840000000000000F03F000000000000F03F1D4153534F43
      494143414F20444F532041504F53454E5441444F532D5052000000000000F0BF
      0F303131303030372020202020202020043034303300000000BC102A410C3031
      333030343031383335330000000000003C40000000000000F03FB81E85EB09FD
      E4400000000000B074400040050001000000000000405840000000000000F03F
      000000000000F03F1D4153534F43494143414F20444F532041504F53454E5441
      444F532D5052000000000000F0BF0F3031313030303720202020202020200430
      34303300000000BC102A410C3031333030343031383335330000000000805040
      000000000000F03F1F85EB51B8EE584000000000000010400040050001000000
      000000405840000000000000F03F000000000000F03F1D4153534F4349414341
      4F20444F532041504F53454E5441444F532D524A000000000000F0BF0F303131
      303030372020202020202020043034303300000000C6102A410C303033303037
      3836383731340000000000000040000000000000F03F0AD7A3706522E0400000
      000000B895400040050001000000000000405840000000000000F03F00000000
      0000F03F1D4153534F43494143414F20444F532041504F53454E5441444F532D
      524A000000000000F0BF0F303131303030372020202020202020043034303300
      000000C6102A410C303033303037383638373134000000000080504000000000
      0000F03F0AD7A370DD02CC400000000000288540004005000100000000000040
      5840000000000000F03F000000000000F03F1D4153534F43494143414F20444F
      532041504F53454E5441444F532D524A000000000000F0BF0F30313130303037
      2020202020202020043034303300000000C6102A410C30303330303738363837
      31340000000000003C40000000000000F03F15AE47E1969FF84000000000000C
      AD400040050001000000000000405840000000000000F03F000000000000F03F
      1D4153534F43494143414F20444F532041504F53454E5441444F532D524E0000
      00000000F0BF0F303131303030372020202020202020043034303300000000C2
      102A410C3030333030303031393931370000000000000040000000000000F03F
      0000000000F08E40000000000080504000400500010000000000004058400000
      00000000F03F000000000000F03F1D4153534F43494143414F20444F53204150
      4F53454E5441444F532D524E000000000000F0BF0F3031313030303720202020
      20202020043034303300000000C2102A410C3030333030303031393931370000
      000000805040000000000000F03F0000000000A0644000000000000026400040
      050001000000000000405840000000000000F03F000000000000F03F1D415353
      4F43494143414F20444F532041504F53454E5441444F532D524E000000000000
      F0BF0F303131303030372020202020202020043034303300000000C2102A410C
      3030333030303031393931370000000000003C40000000000000F03F00000000
      0082A4400000000000E065400040050001000000000000405840000000000000
      F03F000000000000F03F1D4153534F43494143414F20444F532041504F53454E
      5441444F532D524E000000000000F0BF0F303131303030372020202020202020
      043034303300000000C2102A410C303232303030303032303432000000000000
      0040000000000000F03F33333333330B65400000000000000040004005000100
      0000000000405840000000000000F03F000000000000F03F1D4153534F434941
      43414F20444F532041504F53454E5441444F532D524E000000000000F0BF0F30
      3131303030372020202020202020043034303300000000C2102A410C30323230
      30303030323034320000000000003C40000000000000F03F9A9999991904A740
      00000000000036400040050001000000000000405840000000000000F03F0000
      00000000F03F1D4153534F43494143414F20444F532041504F53454E5441444F
      532D5253000000000000F0BF0F30313130303037202020202020202004303430
      3300000000C4102A410C30303330303230313732353500000000000000400000
      00000000F03F15AE47E1621BE4400000000000E88D4000400500010000000000
      00405840000000000000F03F000000000000F03F1D4153534F43494143414F20
      444F532041504F53454E5441444F532D5253000000000000F0BF0F3031313030
      30372020202020202020043034303300000000C4102A410C3030333030323031
      373235350000000000003C40000000000000F03FC3F5285C6790F44000000000
      00D09A400040050001000000000000405840000000000000F03F000000000000
      F03F1D4153534F43494143414F20444F532041504F53454E5441444F532D5253
      000000000000F0BF0F3031313030303720202020202020200430343033000000
      00C4102A410C3030333030323031373235350000000000805040000000000000
      F03F7B14AE47E101A7400000000000804E400040050001000000000000405840
      000000000000F03F000000000000F03F1D4153534F43494143414F20444F5320
      41504F53454E5441444F532D5343000000000000F0BF0F303131303030372020
      202020202020043034303300000000C8102A410C303033303030303031323230
      0000000000000040000000000000F03F52B81E85EB696040000000000000F03F
      0040050001000000000000405840000000000000F03F000000000000F03F1D41
      53534F43494143414F20444F532041504F53454E5441444F532D534300000000
      0000F0BF0F303131303030372020202020202020043034303300000000C8102A
      410C3030333030303030313232300000000000805040000000000000F03F52B8
      1E85EB696040000000000000F03F004005000100000000000040584000000000
      0000F03F000000000000F03F1D4153534F43494143414F20444F532041504F53
      454E5441444F532D5343000000000000F0BF0F30313130303037202020202020
      2020043034303300000000C8102A410C30303330303030303132323000000000
      00003C40000000000000F03FCDCCCCCC8C8AB440000000000000354000400500
      01000000000000405840000000000000F03F000000000000F03F1D4153534F43
      494143414F20444F532041504F53454E5441444F532D5343000000000000F0BF
      0F303131303030372020202020202020043034303300000000C8102A410C3030
      333030303030313239380000000000000040000000000000F03F5C8FC2F5A8B6
      BD4000000000008067400040050001000000000000405840000000000000F03F
      000000000000F03F1D4153534F43494143414F20444F532041504F53454E5441
      444F532D5343000000000000F0BF0F3031313030303720202020202020200430
      34303300000000C8102A410C3030333030303030313239380000000000805040
      000000000000F03F8FC2F5285C8D824000000000000022400040050001000000
      000000405840000000000000F03F000000000000F03F1D4153534F4349414341
      4F20444F532041504F53454E5441444F532D5343000000000000F0BF0F303131
      303030372020202020202020043034303300000000C8102A410C303033303030
      3030313239380000000000003C40000000000000F03F295C8FC28580DE400000
      0000007085400040050001000000000000405840000000000000F03F00000000
      0000F03F1D4153534F43494143414F20444F532041504F53454E5441444F532D
      5345000000000000F0BF0F303131303030372020202020202020043034303300
      000000CC102A410C303033303030303230343538000000000000004000000000
      0000F03FA4703D0AD7C371400000000000003740004005000100000000000040
      5840000000000000F03F000000000000F03F1D4153534F43494143414F20444F
      532041504F53454E5441444F532D5345000000000000F0BF0F30313130303037
      2020202020202020043034303300000000CC102A410C30303330303030323034
      35380000000000805040000000000000F03FB91E85EB51186F40000000000000
      10400040050001000000000000405840000000000000F03F000000000000F03F
      1D4153534F43494143414F20444F532041504F53454E5441444F532D53450000
      00000000F0BF0F303131303030372020202020202020043034303300000000CC
      102A410C3030333030303032303435380000000000003C40000000000000F03F
      85EB51B81EC58340000000000080484000400500010000000000004058400000
      00000000F03F000000000000F03F1D4153534F43494143414F20444F53204150
      4F53454E5441444F532D5350000000000000F0BF0F3031313030303720202020
      20202020043034303300000000CA102A410C3030333030303032343532320000
      000000000040000000000000F03F1F85EB5118BBD34000000000006885400040
      050001000000000000405840000000000000F03F000000000000F03F1D415353
      4F43494143414F20444F532041504F53454E5441444F532D5350000000000000
      F0BF0F303131303030372020202020202020043034303300000000CA102A410C
      3030333030303032343532320000000000003340000000000000F03F00000000
      00003740000000000000F03F0040050001000000000000405840000000000000
      F03F000000000000F03F1D4153534F43494143414F20444F532041504F53454E
      5441444F532D5350000000000000F0BF0F303131303030372020202020202020
      043034303300000000CA102A410C303033303030303234353232000000000080
      5040000000000000F03F9A999999996899400000000000005040004005000100
      0000000000405840000000000000F03F000000000000F03F1D4153534F434941
      43414F20444F532041504F53454E5441444F532D5350000000000000F0BF0F30
      3131303030372020202020202020043034303300000000CA102A410C30303330
      30303032343532320000000000003C40000000000000F03F295C8FC2BDE0FC40
      00000000007EA9400040050001000000000000405840000000000000F03F0000
      00000000F03F1D4153534F43494143414F20444F532041504F53454E5441444F
      532D5350000000000000F0BF0F30313130303037202020202020202004303430
      3300000000CA102A410C30303330303030323435343900000000000000400000
      00000000F03F000000000053B640000000000000374000400500010000000000
      00405840000000000000F03F000000000000F03F1D4153534F43494143414F20
      444F532041504F53454E5441444F532D5350000000000000F0BF0F3031313030
      30372020202020202020043034303300000000CA102A410C3030333030303032
      343534390000000000003C40000000000000F03F00000000B0AFEE4000000000
      00E067400040050001000000000000405840000000000000F03F000000000000
      F03F1D4153534F43494143414F20444F532041504F53454E5441444F532D5350
      000000000000F0BF0F3031313030303720202020202020200430343033000000
      00CA102A410C3030333030303032343534390000000000805040000000000000
      F03F0000000000906040000000000000F03F0040050001000000000000405840
      000000000000F03F000000000000F03F1C4153534F43494143414F20444F5320
      454D5052454741444F532D414C000000000000F0BF0F30313130303037202020
      202020202004303430330000000054112A410C30303330303030303130313200
      00000000000040000000000000F03F15AE47E17AAC8340000000000000414000
      40050001000000000000405840000000000000F03F000000000000F03F1C4153
      534F43494143414F20444F5320454D5052454741444F532D414C000000000000
      F0BF0F30313130303037202020202020202004303430330000000054112A410C
      3030333030303030313031320000000000003C40000000000000F03F8FC2F528
      5CE5A6400000000000C063400040050001000000000000405840000000000000
      F03F000000000000F03F1C4153534F43494143414F20444F5320454D50524547
      41444F532D414D000000000000F0BF0F30313130303037202020202020202004
      303430330000000056112A410C30303330303030323030303400000000000000
      40000000000000F03FC3F5285C8FCA6D40000000000000184000400500010000
      00000000405840000000000000F03F000000000000F03F1C4153534F43494143
      414F20444F5320454D5052454741444F532D414D000000000000F0BF0F303131
      30303037202020202020202004303430330000000056112A410C303033303030
      3032303030340000000000003C40000000000000F03F15AE47E17A8B91400000
      000000003C400040050001000000000000405840000000000000F03F00000000
      0000F03F1C4153534F43494143414F20444F5320454D5052454741444F532D41
      4D000000000000F0BF0F30313130303037202020202020202004303430330000
      000056112A410C30303330303030323030303400000000008050400000000000
      00F03F5C8FC2F528DC3140000000000000F03F00400500010000000000004058
      40000000000000F03F000000000000F03F1C4153534F43494143414F20444F53
      20454D5052454741444F532D4241000000000000F0BF0F303131303030372020
      20202020202004303430330000000058112A410C303033303030303031323030
      0000000000000040000000000000F03F00000000001494400000000000805E40
      0040050001000000000000405840000000000000F03F000000000000F03F1C41
      53534F43494143414F20444F5320454D5052454741444F532D42410000000000
      00F0BF0F30313130303037202020202020202004303430330000000058112A41
      0C3030333030303030313230300000000000003C40000000000000F03F000000
      00009BAE400000000000B0794000400500010000000000004058400000000000
      00F03F000000000000F03F1C4153534F43494143414F20444F5320454D505245
      4741444F532D4241000000000000F0BF0F303131303030372020202020202020
      04303430330000000058112A410C303033303030303031323030000000000080
      5040000000000000F03F00000000004060400000000000003040004005000100
      0000000000405840000000000000F03F000000000000F03F1C4153534F434941
      43414F20444F5320454D5052454741444F532D4345000000000000F0BF0F3031
      313030303720202020202020200430343033000000005C112A410C3030333030
      303030373339370000000000000040000000000000F03FEC51B81E856B854000
      00000000804F400040050001000000000000405840000000000000F03F000000
      000000F03F1C4153534F43494143414F20444F5320454D5052454741444F532D
      4345000000000000F0BF0F303131303030372020202020202020043034303300
      0000005C112A410C3030333030303030373339370000000000003C4000000000
      0000F03F333333333339AF400000000000607A40004005000100000000000040
      5840000000000000F03F000000000000F03F1C4153534F43494143414F20444F
      5320454D5052454741444F532D4345000000000000F0BF0F3031313030303720
      202020202020200430343033000000005C112A410C3030333030303030373339
      370000000000805040000000000000F03FF6285C8FC2855D4000000000000032
      400040050001000000000000405840000000000000F03F000000000000F03F1C
      4153534F43494143414F20444F5320454D5052454741444F532D444600000000
      0000F0BF0F3031313030303720202020202020200430343033000000005A112A
      410C3030333030303530303030340000000000000040000000000000F03F6766
      666666E5AA400000000000C06040004005000100000000000040584000000000
      0000F03F000000000000F03F1C4153534F43494143414F20444F5320454D5052
      454741444F532D4446000000000000F0BF0F3031313030303720202020202020
      200430343033000000005A112A410C3030333030303530303030340000000000
      805040000000000000F03FCDCCCCCCCC52914000000000000046400040050001
      000000000000405840000000000000F03F000000000000F03F1C4153534F4349
      4143414F20444F5320454D5052454741444F532D4446000000000000F0BF0F30
      31313030303720202020202020200430343033000000005A112A410C30303330
      30303530303030340000000000003C40000000000000F03F67666666A66DD440
      0000000000688C400040050001000000000000405840000000000000F03F0000
      00000000F03F1C4153534F43494143414F20444F5320454D5052454741444F53
      2D4553000000000000F0BF0F3031313030303720202020202020200430343033
      000000005E112A410C3030333030303031373534330000000000000040000000
      000000F03FAE47E17A94A1AE4000000000002060400040050001000000000000
      405840000000000000F03F000000000000F03F1C4153534F43494143414F2044
      4F5320454D5052454741444F532D4553000000000000F0BF0F30313130303037
      20202020202020200430343033000000005E112A410C30303330303030313735
      34330000000000003C40000000000000F03F0AD7A3707D74C940000000000080
      7B400040050001000000000000405840000000000000F03F000000000000F03F
      1C4153534F43494143414F20444F5320454D5052454741444F532D4553000000
      000000F0BF0F3031313030303720202020202020200430343033000000005E11
      2A410C3030333030303031373534330000000000805040000000000000F03FB8
      1E85EB51087C4000000000000034400040050001000000000000405840000000
      000000F03F000000000000F03F1C4153534F43494143414F20444F5320454D50
      52454741444F532D474F000000000000F0BF0F30313130303037202020202020
      202004303430330000000062112A410C30303330303037353730303000000000
      00000040000000000000F03FAE47E17A141B99400000000000C0564000400500
      01000000000000405840000000000000F03F000000000000F03F1C4153534F43
      494143414F20444F5320454D5052454741444F532D474F000000000000F0BF0F
      30313130303037202020202020202004303430330000000062112A410C303033
      3030303735373030300000000000003C40000000000000F03F0AD7A3707D24B5
      400000000000C073400040050001000000000000405840000000000000F03F00
      0000000000F03F1C4153534F43494143414F20444F5320454D5052454741444F
      532D4D41000000000000F0BF0F30313130303037202020202020202004303430
      330000000064112A410C30303330303030303139393600000000000000400000
      00000000F03F7B14AE47E15E82400000000000002A4000400500010000000000
      00405840000000000000F03F000000000000F03F1C4153534F43494143414F20
      444F5320454D5052454741444F532D4D41000000000000F0BF0F303131303030
      37202020202020202004303430330000000064112A410C303033303030303031
      3939360000000000805040000000000000F03F5C8FC2F5289C56400000000000
      0000400040050001000000000000405840000000000000F03F000000000000F0
      3F1C4153534F43494143414F20444F5320454D5052454741444F532D4D410000
      00000000F0BF0F30313130303037202020202020202004303430330000000064
      112A410C3030333030303030313939360000000000003C40000000000000F03F
      C3F5285C8F4FA140000000000080484000400500010000000000004058400000
      00000000F03F000000000000F03F1C4153534F43494143414F20444F5320454D
      5052454741444F532D4D47000000000000F0BF0F303131303030372020202020
      20202004303430330000000068112A410C303033303035303038313030000000
      0000000040000000000000F03FC3F5285C2F16D2400000000000108240004005
      0001000000000000405840000000000000F03F000000000000F03F1C4153534F
      43494143414F20444F5320454D5052454741444F532D4D47000000000000F0BF
      0F30313130303037202020202020202004303430330000000068112A410C3030
      333030353030383130300000000000805040000000000000F03FB81E85EB51C6
      954000000000000047400040050001000000000000405840000000000000F03F
      000000000000F03F1C4153534F43494143414F20444F5320454D505245474144
      4F532D4D47000000000000F0BF0F303131303030372020202020202020043034
      30330000000068112A410C3030333030353030383130300000000000003C4000
      0000000000F03FE17A14AEA7BBE6400000000000D09340004005000100000000
      0000405840000000000000F03F000000000000F03F1C4153534F43494143414F
      20444F5320454D5052454741444F532D4D47000000000000F0BF0F3031313030
      3037202020202020202004303430330000000068112A410C3030333030353030
      383239310000000000000040000000000000F03F52B81E85EB71524000000000
      00001C400040050001000000000000405840000000000000F03F000000000000
      F03F1C4153534F43494143414F20444F5320454D5052454741444F532D4D4700
      0000000000F0BF0F303131303030372020202020202020043034303300000000
      68112A410C3030333030353030383239310000000000003C40000000000000F0
      3FC3F5285C8F325C400000000000002240004005000100000000000040584000
      0000000000F03F000000000000F03F1C4153534F43494143414F20444F532045
      4D5052454741444F532D4D53000000000000F0BF0F3031313030303720202020
      2020202004303430330000000060112A410C3030333030303031383336350000
      000000000040000000000000F03F000000000000544000000000000010400040
      050001000000000000405840000000000000F03F000000000000F03F1C415353
      4F43494143414F20444F5320454D5052454741444F532D4D53000000000000F0
      BF0F30313130303037202020202020202004303430330000000060112A410C30
      30333030303031383336350000000000003C40000000000000F03F0000000000
      4080400000000000003A400040050001000000000000405840000000000000F0
      3F000000000000F03F1C4153534F43494143414F20444F5320454D5052454741
      444F532D4D53000000000000F0BF0F3031313030303720202020202020200430
      3430330000000060112A410C3030333030303031383336350000000000805040
      000000000000F03F000000000000444000000000000000400040050001000000
      000000405840000000000000F03F000000000000F03F1C4153534F4349414341
      4F20444F5320454D5052454741444F532D4D54000000000000F0BF0F30313130
      303037202020202020202004303430330000000066112A410C30303330303030
      30393130300000000000000040000000000000F03FCDCCCCCCCC888240000000
      00008045400040050001000000000000405840000000000000F03F0000000000
      00F03F1C4153534F43494143414F20444F5320454D5052454741444F532D4D54
      000000000000F0BF0F3031313030303720202020202020200430343033000000
      0066112A410C3030333030303030393130300000000000003C40000000000000
      F03F295C8FC2F593A04000000000008061400040050001000000000000405840
      000000000000F03F000000000000F03F1C4153534F43494143414F20444F5320
      454D5052454741444F532D4D54000000000000F0BF0F30313130303037202020
      202020202004303430330000000066112A410C30303330303030303931303000
      00000000805040000000000000F03F85EB51B81EC54340000000000000084000
      40050001000000000000405840000000000000F03F000000000000F03F1C4153
      534F43494143414F20444F5320454D5052454741444F532D5041000000000000
      F0BF0F3031313030303720202020202020200430343033000000006A112A410C
      3030333030303031373030350000000000000040000000000000F03F00000000
      0050694000000000000022400040050001000000000000405840000000000000
      F03F000000000000F03F1C4153534F43494143414F20444F5320454D50524547
      41444F532D5041000000000000F0BF0F30313130303037202020202020202004
      30343033000000006A112A410C30303330303030313730303500000000008050
      40000000000000F03F0000000000806640000000000000204000400500010000
      00000000405840000000000000F03F000000000000F03F1C4153534F43494143
      414F20444F5320454D5052454741444F532D5041000000000000F0BF0F303131
      3030303720202020202020200430343033000000006A112A410C303033303030
      3031373030350000000000003C40000000000000F03F000000000031A0400000
      0000000057400040050001000000000000405840000000000000F03F00000000
      0000F03F1C4153534F43494143414F20444F5320454D5052454741444F532D50
      42000000000000F0BF0F30313130303037202020202020202004303430330000
      00006C112A410C30303330303030303530303300000000000000400000000000
      00F03FF6285C8FC23CA2400000000000005C4000400500010000000000004058
      40000000000000F03F000000000000F03F1C4153534F43494143414F20444F53
      20454D5052454741444F532D5042000000000000F0BF0F303131303030372020
      2020202020200430343033000000006C112A410C303033303030303035303033
      0000000000003C40000000000000F03FA4703D0AD75DB1400000000000307040
      0040050001000000000000405840000000000000F03F000000000000F03F1C41
      53534F43494143414F20444F5320454D5052454741444F532D50450000000000
      00F0BF0F30313130303037202020202020202004303430330000000070112A41
      0C3030333030303030323430300000000000000040000000000000F03F5C8FC2
      F5288D9440000000000000524000400500010000000000004058400000000000
      00F03F000000000000F03F1C4153534F43494143414F20444F5320454D505245
      4741444F532D5045000000000000F0BF0F303131303030372020202020202020
      04303430330000000070112A410C303033303030303032343030000000000000
      3C40000000000000F03FB81E85EBD1DABB400000000000107740004005000100
      0000000000405840000000000000F03F000000000000F03F1C4153534F434941
      43414F20444F5320454D5052454741444F532D5045000000000000F0BF0F3031
      3130303037202020202020202004303430330000000070112A410C3030333030
      303030323430300000000000805040000000000000F03F15AE47E17A4C7B4000
      000000000038400040050001000000000000405840000000000000F03F000000
      000000F03F1C4153534F43494143414F20444F5320454D5052454741444F532D
      5049000000000000F0BF0F303131303030372020202020202020043034303300
      00000076112A410C303033303030303030303239000000000000004000000000
      0000F03FD7A3703D0A6F93400000000000005F40004005000100000000000040
      5840000000000000F03F000000000000F03F1C4153534F43494143414F20444F
      5320454D5052454741444F532D5049000000000000F0BF0F3031313030303720
      2020202020202004303430330000000076112A410C3030333030303030303032
      390000000000003C40000000000000F03FF6285C8F4217A3400000000000806A
      400040050001000000000000405840000000000000F03F000000000000F03F1C
      4153534F43494143414F20444F5320454D5052454741444F532D504900000000
      0000F0BF0F30313130303037202020202020202004303430330000000076112A
      410C3030333030303030303032390000000000805040000000000000F03F90C2
      F5285C2F4D400000000000001840004005000100000000000040584000000000
      0000F03F000000000000F03F1C4153534F43494143414F20444F5320454D5052
      454741444F532D5052000000000000F0BF0F3031313030303720202020202020
      200430343033000000006E112A410C3030333030303030393938380000000000
      000040000000000000F03FAE47E17A141E7E4000000000008046400040050001
      000000000000405840000000000000F03F000000000000F03F1C4153534F4349
      4143414F20444F5320454D5052454741444F532D5052000000000000F0BF0F30
      31313030303720202020202020200430343033000000006E112A410C30303330
      30303030393938380000000000003C40000000000000F03FC3F5285C4F84BD40
      00000000000075400040050001000000000000405840000000000000F03F0000
      00000000F03F1C4153534F43494143414F20444F5320454D5052454741444F53
      2D5052000000000000F0BF0F3031313030303720202020202020200430343033
      000000006E112A410C3030333030303030393939360000000000000040000000
      000000F03F1F85EB513850A8400000000000C050400040050001000000000000
      405840000000000000F03F000000000000F03F1C4153534F43494143414F2044
      4F5320454D5052454741444F532D5052000000000000F0BF0F30313130303037
      20202020202020200430343033000000006E112A410C30303330303030303939
      39360000000000805040000000000000F03F3E0AD7A370F17840000000000000
      22400040050001000000000000405840000000000000F03F000000000000F03F
      1C4153534F43494143414F20444F5320454D5052454741444F532D5052000000
      000000F0BF0F3031313030303720202020202020200430343033000000006E11
      2A410C3030333030303030393939360000000000003C40000000000000F03FA4
      703D0A974FC8400000000000A070400040050001000000000000405840000000
      000000F03F000000000000F03F1C4153534F43494143414F20444F5320454D50
      52454741444F532D524A000000000000F0BF0F30313130303037202020202020
      20200430343033000000007C112A410C30303330303030303135353900000000
      00003C40000000000000F03F3E0AD7A370BD6540000000000000224000400500
      01000000000000405840000000000000F03F000000000000F03F1C4153534F43
      494143414F20444F5320454D5052454741444F532D524A000000000000F0BF0F
      3031313030303720202020202020200430343033000000007C112A410C303033
      3030303030313535390000000000805040000000000000F03F295C8FC2F5185E
      4000000000000008400040050001000000000000405840000000000000F03F00
      0000000000F03F1C4153534F43494143414F20444F5320454D5052454741444F
      532D524A000000000000F0BF0F30313130303037202020202020202004303430
      33000000007C112A410C30303330303030303632323200000000000000400000
      00000000F03F1F85EB51A843DB400000000000B08E4000400500010000000000
      00405840000000000000F03F000000000000F03F1C4153534F43494143414F20
      444F5320454D5052454741444F532D524A000000000000F0BF0F303131303030
      3720202020202020200430343033000000007C112A410C303033303030303036
      3232320000000000003C40000000000000F03FA4703D0A5FC4EA400000000000
      D49E400040050001000000000000405840000000000000F03F000000000000F0
      3F1C4153534F43494143414F20444F5320454D5052454741444F532D524A0000
      00000000F0BF0F3031313030303720202020202020200430343033000000007C
      112A410C3030333030303030363232320000000000805040000000000000F03F
      F6285C8FC2C7C6400000000000407F4000400500010000000000004058400000
      00000000F03F000000000000F03F1C4153534F43494143414F20444F5320454D
      5052454741444F532D524E000000000000F0BF0F303131303030372020202020
      20202004303430330000000078112A410C303033303030303231313433000000
      0000000040000000000000F03FE17A14AE472788400000000000004540004005
      0001000000000000405840000000000000F03F000000000000F03F1C4153534F
      43494143414F20444F5320454D5052454741444F532D524E000000000000F0BF
      0F30313130303037202020202020202004303430330000000078112A410C3030
      333030303032313134330000000000805040000000000000F03F1F85EB51B87E
      6C4000000000000028400040050001000000000000405840000000000000F03F
      000000000000F03F1C4153534F43494143414F20444F5320454D505245474144
      4F532D524E000000000000F0BF0F303131303030372020202020202020043034
      30330000000078112A410C3030333030303032313134330000000000003C4000
      0000000000F03FCDCCCCCCCC9FA9400000000000C06440004005000100000000
      0000405840000000000000F03F000000000000F03F1C4153534F43494143414F
      20444F5320454D5052454741444F532D5253000000000000F0BF0F3031313030
      303720202020202020200430343033000000007A112A410C3030333030323032
      373234320000000000000040000000000000F03FF6285C8FC25DC74000000000
      003885400040050001000000000000405840000000000000F03F000000000000
      F03F1C4153534F43494143414F20444F5320454D5052454741444F532D525300
      0000000000F0BF0F303131303030372020202020202020043034303300000000
      7A112A410C3030333030323032373234320000000000805040000000000000F0
      3F1F85EB51B88279400000000000003C40004005000100000000000040584000
      0000000000F03F000000000000F03F1C4153534F43494143414F20444F532045
      4D5052454741444F532D5253000000000000F0BF0F3031313030303720202020
      202020200430343033000000007A112A410C3030333030323032373234320000
      000000003C40000000000000F03F1F85EB519840D34000000000008490400040
      050001000000000000405840000000000000F03F000000000000F03F1C415353
      4F43494143414F20444F5320454D5052454741444F532D5253000000000000F0
      BF0F3031313030303720202020202020200430343033000000007A112A410C30
      30333030393030313834350000000000000040000000000000F03F3E0AD7A370
      45964000000000008051400040050001000000000000405840000000000000F0
      3F000000000000F03F1C4153534F43494143414F20444F5320454D5052454741
      444F532D5253000000000000F0BF0F3031313030303720202020202020200430
      343033000000007A112A410C3030333030393030313834350000000000003C40
      000000000000F03FAE47E17AD44EB1400000000000A068400040050001000000
      000000405840000000000000F03F000000000000F03F1C4153534F4349414341
      4F20444F5320454D5052454741444F532D5253000000000000F0BF0F30313130
      30303720202020202020200430343033000000007A112A410C30303330303930
      30313834350000000000805040000000000000F03F0000000000805640000000
      00000014400040050001000000000000405840000000000000F03F0000000000
      00F03F1C4153534F43494143414F20444F5320454D5052454741444F532D5343
      000000000000F0BF0F3031313030303720202020202020200430343033000000
      007E112A410C3030333030303030323130370000000000000040000000000000
      F03FEC51B81E85BEB8400000000000C064400040050001000000000000405840
      000000000000F03F000000000000F03F1C4153534F43494143414F20444F5320
      454D5052454741444F532D5343000000000000F0BF0F30313130303037202020
      20202020200430343033000000007E112A410C30303330303030303231303700
      00000000805040000000000000F03FAE47E17A144E8040000000000000284000
      40050001000000000000405840000000000000F03F000000000000F03F1C4153
      534F43494143414F20444F5320454D5052454741444F532D5343000000000000
      F0BF0F3031313030303720202020202020200430343033000000007E112A410C
      3030333030303030323130370000000000003C40000000000000F03FF6285C8F
      82E8D0400000000000C07B400040050001000000000000405840000000000000
      F03F000000000000F03F1C4153534F43494143414F20444F5320454D50524547
      41444F532D5345000000000000F0BF0F30313130303037202020202020202004
      303430330000000082112A410C30303330303030313034363700000000000000
      40000000000000F03F0000000000D09140000000000000434000400500010000
      00000000405840000000000000F03F000000000000F03F1C4153534F43494143
      414F20444F5320454D5052454741444F532D5345000000000000F0BF0F303131
      30303037202020202020202004303430330000000082112A410C303033303030
      3031303436370000000000003C40000000000000F03F0000000000109D400000
      000000004F400040050001000000000000405840000000000000F03F00000000
      0000F03F1C4153534F43494143414F20444F5320454D5052454741444F532D53
      45000000000000F0BF0F30313130303037202020202020202004303430330000
      000082112A410C30303330303030313034363700000000008050400000000000
      00F03F0000000000806640000000000000184000400500010000000000004058
      40000000000000F03F000000000000F03F1C4153534F43494143414F20444F53
      20454D5052454741444F532D5350000000000000F0BF0F303131303030372020
      20202020202004303430330000000080112A410C303033303030313037303034
      0000000000000040000000000000F03F1F85EB51484ADB400000000000949540
      0040050001000000000000405840000000000000F03F000000000000F03F1C41
      53534F43494143414F20444F5320454D5052454741444F532D53500000000000
      00F0BF0F30313130303037202020202020202004303430330000000080112A41
      0C3030333030303130373030340000000000805040000000000000F03F676666
      6666C592400000000000804F4000400500010000000000004058400000000000
      00F03F000000000000F03F1C4153534F43494143414F20444F5320454D505245
      4741444F532D5350000000000000F0BF0F303131303030372020202020202020
      04303430330000000080112A410C303033303030313037303034000000000000
      3340000000000000F03F3E0AD7A370B560400000000000002640004005000100
      0000000000405840000000000000F03F000000000000F03F1C4153534F434941
      43414F20444F5320454D5052454741444F532D5350000000000000F0BF0F3031
      3130303037202020202020202004303430330000000080112A410C3030333030
      303130373030340000000000003C40000000000000F03FD7A3703D3683F44000
      0000000040AE400040050001000000000000405840000000000000F03F000000
      000000F03F1C4153534F43494143414F20444F5320454D5052454741444F532D
      544F000000000000F0BF0F303131303030372020202020202020043034303300
      000000F6102A410C3030333030333030303132350000000000003C4000000000
      0000F03F0000000000005E400000000000001040000000000000000000000040
      5840000000000000F03F000000000000F03F0A31323131303130313032000000
      0080C4D84007303130303035301742414E434F2050414E414D45524943414E4F
      204C544441000000000000F0BF0F303131303030372020202020202020043034
      303300000000C4622C410C3030333030353233303030330E3539323835343131
      3030303131330000000000003C40000000000000F03F6766666666D66E400000
      0000000000400000000000000000000000405840000000000000F03F00000000
      0000F03F0A313231313031303130320000000080C4D840073031303030353017
      42414E434F2050414E414D45524943414E4F204C544441000000000000F0BF0F
      303131303030372020202020202020043034303300000000C4622C410C303033
      3030353233303030330E35393238353431313030303131330000000000805040
      000000000000F03F33333333739CC94000000000008049400000000001000000
      000000405840000000000000F03F000000000000F03F0A313231313031303130
      320000000080C4D840073031303030353009434150454D492D44460000000000
      00F0BF0F30313130303037202020202020202004303430330000000026112A41
      0C3030333030303031343639340000000000000040000000000000F03F7B14AE
      47E1CE9C40000000000000244000000000010000000000004058400000000000
      00F03F000000000000F03F0A313231313031303130320000000080C4D8400730
      31303030353009434150454D492D4446000000000000F0BF0F30313130303037
      202020202020202004303430330000000026112A410C30303330303030313436
      39340000000000003C40000000000000F03F33333333734EB240000000000000
      4B400040050001000000000000405840000000000000F03F000000000000F03F
      1E43494120554E49414F2044452053454755524F53204745524149532D444600
      0000000000F0BF0F303131303030372020202020202020043034303300000000
      3E112A410C3030333030303032393639320000000000000040000000000000F0
      3FD7A3703D0AE1AA400000000000C05240004005000100000000000040584000
      0000000000F03F000000000000F03F1E43494120554E49414F20444520534547
      55524F53204745524149532D4446000000000000F0BF0F303131303030372020
      2020202020200430343033000000003E112A410C303033303030303239363932
      0000000000805040000000000000F03F7B14AE47E1A082400000000000003540
      0040050001000000000000405840000000000000F03F000000000000F03F1E43
      494120554E49414F2044452053454755524F53204745524149532D4446000000
      000000F0BF0F3031313030303720202020202020200430343033000000003E11
      2A410C3030333030303032393639320000000000003C40000000000000F03FE1
      7A14AE278BD0400000000000507A400040050001000000000000405840000000
      000000F03F000000000000F03F1E43494120554E49414F204445205345475552
      4F53204745524149532D5052000000000000F0BF0F3031313030303720202020
      2020202004303430330000000040112A410C3030333030303032393639320000
      000000000040000000000000F03F1F85EB51B8A68B4000000000000030400040
      050001000000000000405840000000000000F03F000000000000F03F1E434941
      20554E49414F2044452053454755524F53204745524149532D50520000000000
      00F0BF0F30313130303037202020202020202004303430330000000040112A41
      0C3030333030303032393639320000000000003C40000000000000F03F3E0AD7
      A35011C2400000000000C0654000400500010000000000004058400000000000
      00F03F000000000000F03F1E43494120554E49414F2044452053454755524F53
      204745524149532D5052000000000000F0BF0F30313130303037202020202020
      202004303430330000000040112A410C30303330303030323936393200000000
      00805040000000000000F03F3E0AD7A370A57C400000000000002A4000400500
      01000000000000405840000000000000F03F000000000000F03F0A46454E4143
      45462D4446000000000000F0BF0F303131303030372020202020202020043034
      3033000000003C112A410C303133303036343137373737000000000000004000
      0000000000F03F00000000400EE240000000000022B840004005000100000000
      0000405840000000000000F03F000000000000F03F0A46454E414345462D4446
      000000000000F0BF0F3031313030303720202020202020200430343033000000
      003C112A410C3031333030363431373737370000000000003C40000000000000
      F03F00000000C0BDF240000000008013C9400040050001000000000000405840
      000000000000F03F000000000000F03F0A46454E414345462D44460000000000
      00F0BF0F3031313030303720202020202020200430343033000000003C112A41
      0C3031333030363431373737370000000000C05240000000000000F03F000000
      00005897400000000000206F4000400500010000000000004058400000000000
      00F03F000000000000F03F0A46454E414345462D4446000000000000F0BF0F30
      31313030303720202020202020200430343033000000003C112A410C30313330
      30363431373737370000000000805040000000000000F03F0000000000D6C140
      0000000000D097400040050001000000000000405840000000000000F03F0000
      00000000F03F0A46454E414345462D4446000000000000F0BF0F303131303030
      3720202020202020200430343033000000003C112A410C303133303036343137
      3737370000000000003340000000000000F03F0000000000805C400000000000
      0033400040050001000000000000405840000000000000F03F000000000000F0
      3F0A46454E414345462D524A000000000000F0BF0F3031313030303720202020
      202020200430343033000000000C112A410C3030333030303431353736360000
      000000000040000000000000F03FEC51B81E7D92F2400000000000A063400040
      050001000000000000405840000000000000F03F000000000000F03F0A46454E
      414345462D524A000000000000F0BF0F30313130303037202020202020202004
      30343033000000000C112A410C3030333030303431353736360000000000003C
      40000000000000F03FD7A3703DE4031641000000000020864000400500010000
      00000000405840000000000000F03F000000000000F03F0A46454E414345462D
      524A000000000000F0BF0F303131303030372020202020202020043034303300
      0000000C112A410C303033303030343135373636000000000080504000000000
      0000F03FAE47E17AD498B3400000000000001C40004005000100000000000040
      5840000000000000F03F000000000000F03F0846454E41452D44460000000000
      00F0BF0F3031313030303720202020202020200430343033000000003A112A41
      0C3030333030303530313734340000000000000040000000000000F03FE17A14
      AE47D994400000000000405A4000400500010000000000004058400000000000
      00F03F000000000000F03F0846454E41452D4446000000000000F0BF0F303131
      3030303720202020202020200430343033000000003A112A410C303033303030
      3530313734340000000000003C40000000000000F03F3E0AD7A3F0F5B9400000
      0000004880400000000001000000000000405840000000000000F03F00000000
      0000F03F0A313231313031303130320000000080C4D84007303130303035300B
      4D4F4E474552414C2D524A000000000000F0BF0F303131303030372020202020
      20202004303430330000000020112A410C303033303037383432303537000000
      0000000040000000000000F03FD7A3703DCAF0B5400000000000003F40000000
      0001000000000000405840000000000000F03F000000000000F03F0A31323131
      3031303130320000000080C4D84007303130303035300B4D4F4E474552414C2D
      524A000000000000F0BF0F303131303030372020202020202020043034303300
      00000020112A410C303033303037383432303537000000000080504000000000
      0000F03FB81E85EB510692400000000000002040000000000100000000000040
      5840000000000000F03F000000000000F03F0A31323131303130313032000000
      0080C4D84007303130303035300B4D4F4E474552414C2D524A000000000000F0
      BF0F30313130303037202020202020202004303430330000000020112A410C30
      30333030373834323035370000000000003C40000000000000F03FC3F5285C3F
      DED94000000000008065400040050001000000000000405840000000000000F0
      3F000000000000F03F20505245564841422D454E5449444144455320434F4E56
      454E454E5445532D524A000000000000F0BF0F30313130303037202020202020
      20200430343033000000000A112A410C30303330303739303339313000000000
      00003C40000000000000F03F6766666666867940000000000000144000400500
      01000000000000405840000000000000F03F000000000000F03F205052455648
      41422D454E5449444144455320434F4E56454E454E5445532D524A0000000000
      00F0BF0F3031313030303720202020202020200430343033000000000A112A41
      0C3030333030373930333931300000000000805040000000000000F03F52B81E
      85EB78A740000000000000324000400500010000000000004058400000000000
      00F03F000000000000F03F0853424143452D524A000000000000F0BF0F303131
      30303037202020202020202004303430330000000044112A410C303033303037
      3836303038300000000000000040000000000000F03F7B14AE47213BB7400000
      0000008058400040050001000000000000405840000000000000F03F00000000
      0000F03F0853424143452D524A000000000000F0BF0F30313130303037202020
      202020202004303430330000000044112A410C30303330303738363030383000
      00000000003C40000000000000F03F3E0AD7A308B2E340000000000008814000
      40050001000000000000405840000000000000F03F000000000000F03F085342
      4143452D524A000000000000F0BF0F3031313030303720202020202020200430
      3430330000000044112A410C3030333030373836303038300000000000805040
      000000000000F03FEC51B81E8551A9400000000000004B400040050001000000
      000000405840000000000000F03F000000000000F03F3553494E44494341544F
      20444F5320454D5052454741444F532042414E43C152494F53204E4F20455354
      41444F20444F205049415549000000000000F0BF0F3031313030303720202020
      20202020043034303300000000607A2C410C3030333030303033313030360000
      000000000040000000000000F03F0000000000206C400000000000002E400040
      050001000000000000405840000000000000F03F000000000000F03F3553494E
      44494341544F20444F5320454D5052454741444F532042414E43C152494F5320
      4E4F2045535441444F20444F205049415549000000000000F0BF0F3031313030
      30372020202020202020043034303300000000607A2C410C3030333030303033
      313030360000000000003C40000000000000F03F000000000090754000000000
      000037400040050001000000000000405840000000000000F03F000000000000
      F03F3553494E44494341544F20444F5320454D5052454741444F532042414E43
      C152494F53204E4F2045535441444F20444F205049415549000000000000F0BF
      0F303131303030372020202020202020043034303300000000607A2C410C3030
      333030303033313030360000000000805040000000000000F03F000000000000
      2E40000000000000F03F0040050001000000000000405840000000000000F03F
      000000000000F03F07554E45492D524A000000000000F0BF0F30313130303037
      202020202020202004303430330000000046112A410C30303330303735393032
      33360000000000000040000000000000F03F48E17A148671EA400000000000C6
      A9400040050001000000000000405840000000000000F03F000000000000F03F
      07554E45492D524A000000000000F0BF0F303131303030372020202020202020
      04303430330000000046112A410C303033303037353930323336000000000000
      3C40000000000000F03F676666663A460E4100000000008AC740004005000100
      0000000000405840000000000000F03F000000000000F03F07554E45492D524A
      000000000000F0BF0F3031313030303720202020202020200430343033000000
      0046112A410C3030333030373539303233360000000000805040000000000000
      F03FA4703D0A2734D9400000000000B495400040050001000000000000405840
      000000000000F03F000000000000F03F07554E45492D524A000000000000F0BF
      0F30313130303037202020202020202004303430330000000046112A410C3030
      333030373539303233360000000000C05240000000000000F03F000000000040
      55400000000000001440}
  end
  object sqlRateioSemArquivo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  IDPLANOCONTABIL, IDPATRO, IDFAVORECIDO, NOME, CODTIPRECDESFAV,' +
        ' '
      
        '  PLACONTA, UNIDNEGOC, CODCENTRORESPON, CODPORTFORMA, SUM(VALOR)' +
        ' AS VALOR '
      'FROM '
      '  ( '
      '  SELECT '
      
        '    PI.IDPLANPREVCONTAB AS IDPLANOCONTABIL, HRS.IDPATRO, HRS.IDF' +
        'AVORECIDO, PFA.NOME, '
      
        '    NVL(RXP.CODTIPRECDESFAV, HRS.CODTIPRECDES) AS CODTIPRECDESFA' +
        'V, '
      
        '    DECODE(HRS.FLGDESCONTO, 1, HRS.PLACONTAC, HRS.PLACONTAD) AS ' +
        'PLACONTA, '
      
        '    RXP.UNIDNEGOC, RXP.CODCENTRORESPON, LOD.CODPORTFORMAFAV AS C' +
        'ODPORTFORMA, '
      
        '    SUM(DECODE(PVD.FLGDESCONTO, 1, HRS.VALORPROVENTO, 0 - HRS.VA' +
        'LORPROVENTO)) AS VALOR '
      '  FROM '
      '    HISTRUBSAL     HRS, '
      '    PROVDESC       PVD, '
      '    RUBRICAXPLANO  RXP, '
      '    PESSOA         PFA, '
      '    ( '
      '    SELECT '
      '      MIN(LC.IDLAYOUT) AS IDLAYOUT, LC.IDFAVORECIDO '
      '    FROM '
      '      LAYOUTXCOLUNAS LC '
      '    GROUP BY '
      '      LC.IDFAVORECIDO '
      '    ) LXC, '
      '    LAYOUTDESCONTO LOD,'
      '    PERFILINVEST  PI  '
      '  WHERE '
      '        HRS.IDHSTFOLHABENEF        IN (1002) '
      '    AND HRS.IDFAVORECIDO           = PFA.IDPESSOA '
      '    AND HRS.IDMODULO               = 18 '
      '    AND HRS.IDRUBRICA              = PVD.IDPROVENTO '
      '    AND HRS.IDRUBRICA              = RXP.IDRUBRICA '
      '    AND HRS.IDPLANOPREV            = RXP.IDPLANOPREV '
      '    AND HRS.FLGDESCONTO            IN (0, 1) '
      '    AND HRS.FLGESPECIAL            = 0 '
      '    AND HRS.IDPATRO                = RXP.IDPESSJUR '
      '    AND HRS.FLGPENSAOALIM          = 0 '
      '    AND HRS.FLGTIPODESC            IN ('#39'C'#39','#39'Y'#39') '
      '    AND NVL(PFA.TIPO, '#39'F'#39')         = '#39'J'#39' '
      '    AND LXC.IDFAVORECIDO           = HRS.IDFAVORECIDO '
      '    AND LXC.IDLAYOUT               = LOD.IDLAYOUT '
      '    AND NVL(LOD.FLGGERACPAGAR, 0)  = 1 '
      '    AND NVL(LOD.FLGELETRONICO, 0)  = 0'
      '    AND HRS.IDPERFILINVEST = PI.IDPERFILINVEST '
      
        '    AND EXISTS (                                                ' +
        '                                             '
      '               SELECT 1 '
      '               FROM '
      '                 LAYOUTXCOLUNAS LCO, '
      '                 LAYOUTDESCONTO LDO  '
      '               WHERE '
      
        '                     LCO.IDFAVORECIDO           = HRS.IDFAVORECI' +
        'DO '
      '                 AND LDO.IDLAYOUT               = LCO.IDLAYOUT '
      '                 AND LDO.FLGGERACPAGAR          = 1 '
      '                 AND NVL(LDO.FLGELETRONICO, 0)  = 0 '
      '               ) '
      '  GROUP BY '
      
        '    PI.IDPLANPREVCONTAB, HRS.IDPATRO, PVD.FLGDESCONTO, NVL(RXP.C' +
        'ODTIPRECDESFAV, HRS.CODTIPRECDES), '
      
        '    DECODE(HRS.FLGDESCONTO, 1, HRS.PLACONTAC, HRS.PLACONTAD), HR' +
        'S.IDFAVORECIDO, PFA.NOME, '
      '    RXP.UNIDNEGOC, RXP.CODCENTRORESPON, LOD.CODPORTFORMAFAV '
      '  ) '
      'GROUP BY '
      
        '  IDPLANOCONTABIL, IDPATRO, IDFAVORECIDO, NOME, CODTIPRECDESFAV,' +
        ' PLACONTA, UNIDNEGOC, '
      '  CODCENTRORESPON, CODPORTFORMA'
      'ORDER BY'
      '  IDFAVORECIDO')
    ClientDataSet = cdsRateioSemArquivo
    Left = 240
    Top = 152
  end
  object cdsRateioSemArquivo: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 136
    Data = {
      3B0600009619E0BD01000000180000000A000A0000000300000047010F494450
      4C414E4F434F4E544142494C0800040000000000074944504154524F08000400
      000000000C49444641564F52454349444F0800040000000000044E4F4D450100
      490000000100055749445448020002003C000F434F4454495052454344455346
      41560100490000000100055749445448020002000F0008504C41434F4E544101
      0049000000010005574944544802000200120009554E49444E45474F43080004
      00000000000F434F4443454E54524F524553504F4E0100490000000200075355
      4254595045020049000A0046697865644368617200055749445448020002000A
      000C434F44504F5254464F524D4108000400000000000556414C4F5208000400
      0000000002000D44454641554C545F4F5244455202008200010000000300044C
      4349440400010009080000000000000000000000000040000000000038F64000
      000000A0A912412843414958412045434F4E4F4D494341204645444552414C20
      2D2052554252494341532043414958410F303131303031322020202020202020
      083231313830333031000000000000F0BF04303430330000000000005C407B14
      AE4717951941000000000000000000003340000000000038F64000000000A0A9
      12412843414958412045434F4E4F4D494341204645444552414C202D20525542
      52494341532043414958410F3031313030313220202020202020200832313138
      30333031000000000000F0BF04303430330000000000005C408FC2F5285C1385
      40000000000000000000003C40000000000038F64000000000A0A91241284341
      4958412045434F4E4F4D494341204645444552414C202D205255425249434153
      2043414958410F30313130303132202020202020202008323131383033303100
      0000000000F0BF04303430330000000000005C4000000080AAB92D4100000000
      0000000000805040000000000038F64000000000A0A912412843414958412045
      434F4E4F4D494341204645444552414C202D2052554252494341532043414958
      410F303131303031322020202020202020083231313830333031000000000000
      F0BF04303430330000000000005C405C8FC2F514F8FF40000000000000000000
      000040000000000038F64000000000386C2A412C43414958412045434F4E4F4D
      494341204645444552414C202D20434F4E5349474E41C7D54553202833333529
      0F303131303030362020202020202020083231313830333031000000000000F0
      BF04303430330000000000C05B40295C8FC2C1AF254100000000000000000000
      3340000000000038F64000000000386C2A412C43414958412045434F4E4F4D49
      4341204645444552414C202D20434F4E5349474E41C7D545532028333335290F
      303131303030362020202020202020083231313830333031000000000000F0BF
      04303430330000000000C05B40EC51B81E85C77D40000000000000000000003C
      40000000000038F64000000000386C2A412C43414958412045434F4E4F4D4943
      41204645444552414C202D20434F4E5349474E41C7D545532028333335290F30
      3131303030362020202020202020083231313830333031000000000000F0BF04
      303430330000000000C05B40C3F528BC590B4641000000000000000000805040
      000000000038F64000000000386C2A412C43414958412045434F4E4F4D494341
      204645444552414C202D20434F4E5349474E41C7D545532028333335290F3031
      31303030362020202020202020083231313830333031000000000000F0BF0430
      3430330000000000C05B409A999999E304104100000000000000000000004000
      0000000038F640000000003A6C2A413343414958412045434F4E4F4D49434120
      4645444552414C202D204352C94449544F20494D4F42494C494152494F202833
      3530290F30313130303036202020202020202008323131383033303100000000
      0000F0BF04303430330000000000C0594048E17A14EE61C34000000000000000
      0000003C40000000000038F640000000003A6C2A413343414958412045434F4E
      4F4D494341204645444552414C202D204352C94449544F20494D4F42494C4941
      52494F2028333530290F30313130303036202020202020202008323131383033
      3031000000000000F0BF04303430330000000000C059401F85EB512012E140}
    object cdsRateioSemArquivoNOME: TStringField
      DisplayLabel = 'Favorecido'
      DisplayWidth = 77
      FieldName = 'NOME'
      Size = 60
    end
    object cdsRateioSemArquivoVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 13
      FieldName = 'VALOR'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object cdsRateioSemArquivoCODPORTFORMA: TFloatField
      DisplayWidth = 14
      FieldName = 'CODPORTFORMA'
    end
    object cdsRateioSemArquivoIDPLANOCONTABIL: TFloatField
      FieldName = 'IDPLANOCONTABIL'
      Visible = False
    end
    object cdsRateioSemArquivoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Visible = False
    end
    object cdsRateioSemArquivoIDFAVORECIDO: TFloatField
      FieldName = 'IDFAVORECIDO'
      Visible = False
    end
    object cdsRateioSemArquivoCODTIPRECDESFAV: TStringField
      FieldName = 'CODTIPRECDESFAV'
      Visible = False
      Size = 15
    end
    object cdsRateioSemArquivoPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Visible = False
      Size = 18
    end
    object cdsRateioSemArquivoUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
    object cdsRateioSemArquivoCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Visible = False
      FixedChar = True
      Size = 10
    end
  end
  object dtsRateioSemArquivo: TwwDataSource
    DataSet = cdsRateioSemArquivo
    Left = 240
    Top = 120
  end
  object qryPortadorForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  PFO.CODPORTFORMA, PFO.DESCRICAO, PFO.CODARQUIVOREMESSA, PFO.PA' +
        'THARQUIVOREM,'
      
        '  PFO.DMAIS, PFO.CONTROLEREMESSA, PFO.CODFORMAPAGTO, PFO.FLGEMIT' +
        'EAVISO,'
      '  PFO.CODTIPOPAGTO, PFO.NUMEMPRESABANCO, PFO.CODFORMA,'
      ''
      '  PCT.IDBANCO, PCT.NOCONTACORR'
      ''
      'FROM'
      '  PORTADORFORMA PFO,'
      '  PORTADORCONTA PCT'
      ''
      'WHERE'
      '      PFO.RECPAG        = '#39'P'#39
      '  AND PFO.CODPORTFORMA  =:PCODPORTFORMA'
      '  AND PCT.CODPORTADOR   = PFO.CODPORTADOR')
    ValidateWithMask = True
    Left = 536
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptInput
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 536
    Top = 120
  end
  object qryInsertProcConvenioDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO PROCCONVENIODOC'
      '('
      'IDFUNDACAO,'
      'IDPROCCONV,'
      'IDFAVORECIDO,'
      'CODDOCUMENTO,'
      'DATAPAGAMENTO,'
      'VALORLIQUIDO,'
      'VALOREFETIVO,'
      'RECPAG'
      ')'
      'VALUES'
      '('
      ':PIDFUNDACAO,'
      ':PIDPROCCONV,'
      ':PIDFAVORECIDO,'
      ':PCODDOCUMENTO,'
      ':PDATAPAGAMENTO,'
      ':PVALORLIQUIDO,'
      ':PVALOREFETIVO,'
      ':PRECPAG'
      ')')
    ValidateWithMask = True
    Left = 80
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDFUNDACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPROCCONV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDFAVORECIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAPAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVALORLIQUIDO'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVALOREFETIVO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptInput
      end>
  end
  object qryInsertProcConvRateio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into PROCONVRATEIO'
      '('
      'IDPROCCONVRATEIO,'
      'IDPATRO,'
      'IDEMPRESAPROP,'
      'RECPAG,'
      'CODTIPRECDES,'
      'IDPLANPREVCONTABIL,'
      'IDPROCCONV,'
      'CODDOCUMENTO,'
      'IDFUNDACAO,'
      'VALOR,'
      'IDFAVORECIDO,'
      'IDFAVRATEIO'
      ')'
      'VALUES'
      '('
      ':PIDPROCCONVRATEIO,'
      ':PIDPATRO,'
      ':PIDEMPRESAPROP,'
      ':PRECPAG,'
      ':PCODTIPRECDES,'
      ':PIDPLANPREVCONTABIL,'
      ':PIDPROCCONV,'
      ':PCODDOCUMENTO,'
      ':PIDFUNDACAO,'
      ':PVALOR,'
      ':PIDFAVORECIDO,'
      ':PIDFAVRATEIO'
      ')')
    ValidateWithMask = True
    Left = 80
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPROCCONVRATEIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODTIPRECDES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANPREVCONTABIL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPROCCONV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDFUNDACAO'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVALOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDFAVORECIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDFAVRATEIO'
        ParamType = ptInput
      end>
  end
  object qryInsertConvDocXVersao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into CONVDOCXVERSAO'
      '('
      'CODDOCUMENTO,'
      'IDHSTFOLHABENEF'
      ')'
      'VALUES'
      '('
      ':PCODDOCUMENTO,'
      ':PIDHSTFOLHABENEF'
      ')')
    ValidateWithMask = True
    Left = 80
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDHSTFOLHABENEF'
        ParamType = ptInput
      end>
  end
  object sqlRelatorio: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PES.NOME AS FAVORECIDO,'
      ''
      
        '  PPC.NOME AS PLANO, PTR.NOME AS PATRO, TRD.DESCRICAO AS TIPODES' +
        'EMB,'
      ''
      '  PCR.VALOR '
      ''
      'FROM '
      '  PESSOA           PES, '
      '  PROCONVRATEIO    PCR, '
      '  PROCCONVENIODOC  PCD,'
      ''
      '  PLANPREVCONTABIL PPC,'
      '  PESSOA           PTR,'
      '  TIPORECEBDESEMB  TRD,'
      ''
      '  ( '
      '  SELECT DISTINCT '
      '    CODDOCUMENTO '
      '  FROM '
      '    CONVDOCXVERSAO '
      '  WHERE '
      '    IDHSTFOLHABENEF IN (1003) '
      '  ) CXV '
      ''
      'WHERE'
      '      CXV.CODDOCUMENTO       = PCD.CODDOCUMENTO '
      '  AND PCD.CODDOCUMENTO       = PCR.CODDOCUMENTO '
      '  AND PCR.IDFAVORECIDO       = PES.IDPESSOA '
      '  AND PCR.IDPATRO            = PTR.IDPESSOA '
      '  AND PCR.IDPLANPREVCONTABIL = PPC.IDPLANOPREV'
      '  AND PCR.CODTIPRECDES       = TRD.CODTIPRECDES '
      '  AND TRD.RECPAG             = '#39'P'#39
      ''
      'ORDER BY'
      '  PES.NOME')
    ClientDataSet = cdsRelatorio
    Left = 432
    Top = 216
  end
  object cdsRelatorio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 432
    Top = 200
  end
  object rptAnalitico: TppReport
    AutoStop = False
    DataPipeline = pplAnalitico
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 
      'Empréstimo - Provisão para Perdas (sintético) - por Plano e Patr' +
      'ocinadora'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 496
    Top = 216
    Version = '7.04'
    mmColumnWidth = 270542
    DataPipelineName = 'pplAnalitico'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 37835
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Repasse de Convênios - com Arquivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 43392
        mmTop = 8731
        mmWidth = 183621
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'rptProvPerdaSint_lblEmpresa'
        AutoSize = False
        Caption = 'FUNCEF - Fundação dos Economiários Federais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 794
        mmWidth = 183621
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'Versões da Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 21960
        mmWidth = 27517
        BandType = 0
      end
      object rptProvPerdaSint_memPatro: TppRichText
        UserName = 'memPatro'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todas >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 28310
        mmTop = 21960
        mmWidth = 242359
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppShape18: TppShape
        UserName = 'Shape1'
        Brush.Color = 15263976
        ParentWidth = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 33073
        mmWidth = 270542
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label1'
        Caption = 'Favorecido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 794
        mmTop = 33867
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 106892
        mmTop = 33867
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 147109
        mmTop = 33867
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Tipo Desembolso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 178859
        mmTop = 33867
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 262996
        mmTop = 33867
        mmWidth = 7144
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape11: TppShape
        OnPrint = ppShape11Print
        UserName = 'Shape11'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Color = clNone
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppLine9: TppLine
        OnPrint = ppLine9Print
        UserName = 'Line9'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText101'
        DataField = 'FAVORECIDO'
        DataPipeline = pplAnalitico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnalitico'
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 529
        mmWidth = 101865
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PLANO'
        DataPipeline = pplAnalitico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnalitico'
        mmHeight = 3175
        mmLeft = 106892
        mmTop = 529
        mmWidth = 38365
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PATRO'
        DataPipeline = pplAnalitico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnalitico'
        mmHeight = 3175
        mmLeft = 147109
        mmTop = 529
        mmWidth = 29898
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'TIPODESEMB'
        DataPipeline = pplAnalitico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnalitico'
        mmHeight = 3175
        mmLeft = 178859
        mmTop = 529
        mmWidth = 63765
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'VALOR'
        DataPipeline = pplAnalitico
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnalitico'
        mmHeight = 3175
        mmLeft = 248709
        mmTop = 529
        mmWidth = 21431
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 270542
        BandType = 8
      end
      object ppLabel5: TppLabel
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 2117
        mmWidth = 23813
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 126207
        mmTop = 2117
        mmWidth = 18256
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 243946
        mmTop = 2117
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 19844
      mmPrintPosition = 0
      object ppLine11: TppLine
        UserName = 'Line11'
        Pen.Width = 2
        ParentHeight = True
        ParentWidth = True
        Weight = 1.5
        mmHeight = 19844
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 7
      end
      object ppShape13: TppShape
        UserName = 'Shape13'
        Pen.Width = 2
        mmHeight = 5556
        mmLeft = 245005
        mmTop = 2910
        mmWidth = 24606
        BandType = 7
      end
      object ppDBCalc40: TppDBCalc
        UserName = 'DBCalc40'
        DataField = 'VALOR'
        DataPipeline = pplAnalitico
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnalitico'
        mmHeight = 3260
        mmLeft = 246592
        mmTop = 3969
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Valor do Documento:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 213519
        mmTop = 3969
        mmWidth = 31221
        BandType = 7
      end
    end
  end
  object pplAnalitico: TppBDEPipeline
    DataSource = dtsRelatorio
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'pplAnalitico'
    Left = 496
    Top = 200
    object pplAnaliticoppField1: TppField
      FieldAlias = 'FAVORECIDO'
      FieldName = 'FAVORECIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplAnaliticoppField2: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplAnaliticoppField3: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplAnaliticoppField4: TppField
      FieldAlias = 'TIPODESEMB'
      FieldName = 'TIPODESEMB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplAnaliticoppField5: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
  object dtsRelatorio: TwwDataSource
    DataSet = cdsRelatorio
    Left = 432
    Top = 184
  end
  object pplSintetico: TppBDEPipeline
    DataSource = dtsRelatorio
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'pplSintetico'
    Left = 560
    Top = 216
    object pplSinteticoppField1: TppField
      FieldAlias = 'FAVORECIDO'
      FieldName = 'FAVORECIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplSinteticoppField2: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplSinteticoppField3: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplSinteticoppField4: TppField
      FieldAlias = 'TIPODESEMB'
      FieldName = 'TIPODESEMB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplSinteticoppField5: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
  object rptSintetico: TppReport
    AutoStop = False
    DataPipeline = pplSintetico
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 
      'Empréstimo - Provisão para Perdas (sintético) - por Plano e Patr' +
      'ocinadora'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 560
    Top = 200
    Version = '7.04'
    mmColumnWidth = 270542
    DataPipelineName = 'pplSintetico'
    object ppHeaderBand3: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 37835
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Repasse de Convênios - com Arquivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8731
        mmWidth = 183621
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'rptProvPerdaSint_lblEmpresa'
        AutoSize = False
        Caption = 'FUNCEF - Fundação dos Economiários Federais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 794
        mmWidth = 183621
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'Versões da Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 21960
        mmWidth = 27517
        BandType = 0
      end
      object ppRichText1: TppRichText
        UserName = 'memPatro'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todas >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 28310
        mmTop = 21960
        mmWidth = 242359
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = 15263976
        ParentWidth = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 33073
        mmWidth = 183542
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label1'
        Caption = 'Favorecido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 794
        mmTop = 33867
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label9'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 174890
        mmTop = 33867
        mmWidth = 7144
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape2: TppShape
        OnPrint = ppShape11Print
        UserName = 'Shape11'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Color = clNone
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 183542
        BandType = 4
      end
      object ppLine2: TppLine
        OnPrint = ppLine9Print
        UserName = 'Line9'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 183542
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText101'
        DataField = 'FAVORECIDO'
        DataPipeline = pplSintetico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSintetico'
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 529
        mmWidth = 101865
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText2'
        DataField = 'VALOR'
        DataPipeline = pplSintetico
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSintetico'
        mmHeight = 3175
        mmLeft = 160602
        mmTop = 529
        mmWidth = 21431
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 183542
        BandType = 8
      end
      object ppLabel17: TppLabel
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 2117
        mmWidth = 23813
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 82550
        mmTop = 2117
        mmWidth = 18256
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 155840
        mmTop = 2117
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 19844
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line11'
        Pen.Width = 2
        ParentHeight = True
        ParentWidth = True
        Weight = 1.5
        mmHeight = 19844
        mmLeft = 0
        mmTop = 0
        mmWidth = 183542
        BandType = 7
      end
      object ppShape3: TppShape
        UserName = 'Shape13'
        Pen.Width = 2
        mmHeight = 5556
        mmLeft = 159279
        mmTop = 2646
        mmWidth = 24606
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc40'
        DataField = 'VALOR'
        DataPipeline = pplSintetico
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSintetico'
        mmHeight = 3260
        mmLeft = 160602
        mmTop = 3704
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel19: TppLabel
        UserName = 'Label18'
        Caption = 'Valor do Documento:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 127794
        mmTop = 3704
        mmWidth = 31221
        BandType = 7
      end
    end
  end
  object sqlPlanPatro: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDPLANOPREV, IDPATRO'
      'FROM'
      '  PLANPREVCONTABPATRO'
      'ORDER BY'
      '  IDPLANOPREV, IDPATRO')
    ClientDataSet = cdsPlanPatro
    Left = 240
    Top = 216
  end
  object cdsPlanPatro: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 200
    Data = {
      7F0500009619E0BD01000000180000000200510000000300000065000B494450
      4C414E4F505245560800040000000000074944504154524F0800040000000000
      02000D44454641554C545F4F52444552020082000200000001000200044C4349
      4404000100090800000005000500050005000500050005000500050001000000
      00CAF630410000000000000000F03F000000000000F03F0000000000000000F0
      3F00000000000000400000000000000000F03F00000000000008400000000000
      000000F03F0000000000C05B400000000000000000F03F0000000010F6304100
      00000000000000F03F00000000D2F630410000000000000000F03F0000000048
      8232410000000000000000F03F000000003A7637410000000000000000F03F00
      000000019C374100000000000000000840000000000000F03F00000000000000
      0008400000000000000840000000000000000008400000000000001040000000
      000000000008400000000000C05B40000000000000000008400000000010F630
      4100000000000000000840000000004882324100000000000000000840000000
      003A7637410000000000000000084000000000019C374100000000000000002C
      40000000000000F03F00000000000000002C4000000000000000400000000000
      0000002C40000000000000084000000000000000002C40000000000000104000
      000000000000002C400000000000C05B4000000000000000002C400000000010
      F6304100000000000000002C400000000039F6304100000000000000002C4000
      000000BCF6304100000000000000002C4000000000C6F6304100000000000000
      002C4000000000CAF6304100000000000000002C4000000000D0F63041000000
      00000000002C4000000000D2F6304100000000000000002C4000000000488232
      4100000000000000002C40000000003A76374100000000000000002C40000000
      00019C374100000000000000804040000000000000F03F000000000000008040
      400000000000000040000000000000008040400000000000C05B400000000000
      00008040400000000010F630410000000000000080404000000000CAF6304100
      00000000000080404000000000D0F630410000000000000080404000000000D2
      F630410000000000000080404000000000488232410000000000000080424000
      0000000000F03F00000000000000804240000000000000004000000000000000
      8042400000000000000840000000000000008042400000000000001040000000
      000000008042400000000000C05B40000000000000008042400000000010F630
      41000000000000008042400000000039F6304100000000000000804240000000
      00BCF630410000000000000080424000000000C6F63041000000000000008042
      4000000000CAF630410000000000000080424000000000D0F630410000000000
      000080424000000000D2F6304100000000000000804240000000004882324100
      000000000000804240000000003A763741000000000000008042400000000001
      9C374100000000000000004440000000000000F03F0000000000000000444000
      0000000000084000000000000000004440000000000000104000000000000000
      0044400000000000C05B400000000000000000444000000000C6F63041000000
      00000000004440000000003A7637410000000000000000464000000000000000
      4000000000000000004640000000000000084000000000000000004640000000
      0000C05B40000000000000000046400000000010F63041000000000000000046
      40000000003A7637410000000000000000464000000000019C37410000000000
      0000804E40000000000000104000000000000000804E40000000003A76374100
      000000000000804E4000000000019C374100000000000000C05940000000003A
      763741}
    object cdsPlanPatroIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object cdsPlanPatroIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
  end
  object qryBuscaTerc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RBT.IDPESSOATERC, RBT.IDCBANCARIATERC, RBT.PERCENTUAL,'
      '    LD.CODPORTFORMAFAV AS CODPORTFORMA, '
      '    LD.FLGGERACPAGAR AS FLGGERACAP, '
      '    LD.FLGELETRONICO, '
      '    LD.PLACONTABAIXA,'
      '    LD.IDREGRATXADMIN,'
      '    LD.CODTIPRECDES,'
      '    LD.IDLAYOUT, '
      '    PF.NOME, '
      '    CB.CONTACORRENTE, '
      '    AG.NUMAGENCIA, '
      '    BC.NUMBANCO, '
      '    PF.NUMDOCUMENTO, '
      '    PFR.CODARQUIVOREMESSA,'
      '    PFR.PATHARQUIVOREM, '
      '    PFR.DMAIS, '
      '    PFR.CONTROLEREMESSA, '
      '    PFR.CODFORMAPAGTO, '
      '    PFR.FLGEMITEAVISO, '
      '    PFR.CODTIPOPAGTO, '
      '    PFR.NUMEMPRESABANCO, '
      '    PCT.IDBANCO,'
      '    PCT.NOCONTACORR,'
      '    RBT.IDPESSOATERC||'#39'-'#39'||RBT.IDPESSOATERC||'#39'-'#39' AS NODOCUMENTO,'
      '    '#39'02'#39' AS COMPLDOCUMENTO,'
      '    '#39'F'#39' AS TIPO,'
      '    '#39'1'#39' AS TIPOCONTA,'
      '    PA.NOME AS NOMEAGENCIA,'
      '    RBT.IDPESSOA AS FAVORECIDOPAI,'
      '    RBT.IDRUBRICA,'
      '    NVL(PFR.FLGARQUIVO,'#39'N'#39') AS FLGARQUIVO'
      '  FROM RUBRICAXCONTABANCARIATERC RBT'
      '       JOIN PESSOA PF ON PF.IDPESSOA = RBT.IDPESSOATERC'
      
        '       LEFT JOIN CONTABANCARIA CB ON CB.IDCBANCARIA = RBT.IDCBAN' +
        'CARIATERC'
      
        '                                 AND CB.IDPESSOA    = RBT.IDPESS' +
        'OATERC'
      
        '       LEFT JOIN AGENCIABANCARIA  AG ON AG.IDPESSOA = CB.IDAGENC' +
        'IA '
      
        '       LEFT JOIN PESSOA PA ON  PA.IDPESSOA = AG.IDPESSOA        ' +
        ' '
      '       LEFT JOIN BANCO BC  ON  BC.IDPESSOA = AG.IDBANCO'
      '       LEFT JOIN (SELECT MIN(IDLAYOUT) IDLAYOUT, IDFAVORECIDO '
      '                    FROM LAYOUTXCOLUNAS '
      
        '                   GROUP BY IDFAVORECIDO ) LC ON LC.IDFAVORECIDO' +
        ' = RBT.IDPESSOA'
      '       LEFT JOIN LAYOUTDESCONTO LD ON LD.IDLAYOUT = LC.IDLAYOUT '
      '                                  AND LD.FLGGERACPAGAR = 1'
      
        '       JOIN PORTADORFORMA PFR ON PFR.CODPORTFORMA  = LD.CODPORTF' +
        'ORMAFAV'
      '                             AND PFR.RECPAG = '#39'P'#39
      
        '       JOIN PORTADORCONTA PCT ON PCT.CODPORTADOR   = PFR.CODPORT' +
        'ADOR'
      ''
      ' WHERE RBT.IDPESSOA    = :IDPESSOA'
      '   AND RBT.IDRUBRICA   = :IDRUBRICA'
      '   AND RBT.IDCBANCARIA = :IDCBANCARIA'
      
        '   AND TO_DATE(:DTPAGAMENTO, '#39'DD/MM/YYYY'#39') BETWEEN RBT.DTINICIO ' +
        'AND RBT.DTFIM'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 631
    Top = 87
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCBANCARIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DTPAGAMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryRateioPerc: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 631
    Top = 135
  end
end
