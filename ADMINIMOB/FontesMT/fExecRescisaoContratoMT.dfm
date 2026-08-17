inherited frmExecRescisaoContratoMT: TfrmExecRescisaoContratoMT
  Left = 279
  Top = 148
  HelpContext = 640030
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Rescisão Contratual'
  ClientHeight = 323
  ClientWidth = 685
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 685
    Height = 284
    inherited PagControle: TPageControl
      Width = 683
      Height = 282
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 675
          Caption = 'Rescisão Contratual [ Seleção ]'
        end
        inline molContrato1: TmolContrato
          Left = 44
          Top = 27
          Width = 585
          inherited edtContrato: TEdit
            Width = 513
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 520
            OnClick = molContrato1btnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 544
          end
        end
        object chkExcluiLanc: TCheckBox
          Left = 53
          Top = 144
          Width = 577
          Height = 17
          Caption = 'Excluir Lançamentos com data posterior à Rescisão'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object GroupBox1: TGroupBox
          Left = 53
          Top = 168
          Width = 562
          Height = 89
          Caption = 'Observações do Evento'
          TabOrder = 4
          object Panel1: TPanel
            Left = 2
            Top = 15
            Width = 558
            Height = 72
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 5
            TabOrder = 0
            object memObs: TMemo
              Left = 5
              Top = 5
              Width = 548
              Height = 62
              Align = alClient
              TabOrder = 0
            end
          end
        end
        object GroupBox2: TGroupBox
          Left = 53
          Top = 72
          Width = 249
          Height = 59
          Caption = 'Vigência'
          TabOrder = 1
          object Label5: TLabel
            Left = 16
            Top = 16
            Width = 34
            Height = 13
            Caption = 'Início'
          end
          object Label6: TLabel
            Left = 128
            Top = 16
            Width = 46
            Height = 13
            Caption = 'Término'
          end
          object DBedtDataIni: TCMDateTimePicker
            Left = 16
            Top = 30
            Width = 105
            Height = 21
            TabStop = False
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'CONDATAINICIO'
            DataSource = dsContrato
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
            TabOrder = 0
          end
          object DBedtDataFim: TCMDateTimePicker
            Left = 128
            Top = 30
            Width = 105
            Height = 21
            TabStop = False
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'CONDATAFIM'
            DataSource = dsContrato
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
            TabOrder = 1
          end
        end
        object GroupBox3: TGroupBox
          Left = 366
          Top = 72
          Width = 249
          Height = 59
          Caption = 'Rescisão'
          TabOrder = 2
          object Label1: TLabel
            Left = 16
            Top = 16
            Width = 64
            Height = 13
            Caption = 'Solicitação'
          end
          object Label2: TLabel
            Left = 128
            Top = 16
            Width = 53
            Height = 13
            Caption = 'Rescisão'
          end
          object edtDataSolicitacao: TCMDateTimePicker
            Left = 16
            Top = 30
            Width = 105
            Height = 21
            TabStop = False
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'CONDATASOLRESC'
            DataSource = dsContrato
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
          object edtDataRescisao: TCMDateTimePicker
            Left = 128
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
            TabOrder = 1
          end
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 313
          Caption = 'Rescisão Contratual [ Débitos ]'
        end
        object DBgrdConcilia: TwwDBGrid
          Left = 14
          Top = 63
          Width = 647
          Height = 195
          Selected.Strings = (
            'CODDOCUMENTO'#9'9'#9'Documento'
            'MESCOMPETENCIA'#9'4'#9'Mês'
            'ANOCOMPETENCIA'#9'4'#9'Ano'
            'DATAVENCIMENTO'#9'10'#9'Vencimento'
            'DATALIMITE'#9'10'#9'Limite'
            'TOT_RECEBER'#9'13'#9'Vlr. Receber'
            'TOT_RECEBIDO'#9'13'#9'Vlr. Recebido'
            'JUROS'#9'10'#9'Juros'
            'MULTA'#9'10'#9'Multa'
            'CORRECAO'#9'10'#9'Correção'
            'PROPORCAO'#9'10'#9'Proporção'
            'JUROSDIF'#9'10'#9'Juros Dif.'
            'MULTADIF'#9'10'#9'Multa Dif.'
            'CORRECAODIF'#9'10'#9'Correção Dif.'
            'DIFERENCA'#9'10'#9'Diferença')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoSearchOwnerForm, ecoDisableDateTimePicker]
          DataSource = dsConcilia
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit, dgShowFooter]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = True
          OnTitleButtonClick = DBgrdConciliaTitleButtonClick
          IndicatorColor = icBlack
          OnUpdateFooter = DBgrdConciliaUpdateFooter
          FooterHeight = 23
          object DBgrdConciliaIButton: TwwIButton
            Left = 0
            Top = 0
            Width = 13
            Height = 16
            AllowAllUp = True
          end
        end
        object Panel3: TPanel
          Left = 14
          Top = 36
          Width = 647
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Débitos existentes do contrato'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object tbMulta: TTabSheet
        Caption = 'tbMulta'
        ImageIndex = 2
        TabVisible = False
        object fcLabel2: TfcLabel
          Left = 0
          Top = 0
          Width = 675
          Height = 24
          Align = alTop
          Caption = 'Rescisão Contratual [ Multa Rescisória ]'
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
        object GroupBox9: TGroupBox
          Left = 416
          Top = 48
          Width = 169
          Height = 65
          Caption = 'Valor da Multa'
          Enabled = False
          TabOrder = 0
          object edtMultaRes: TDBRealEdit
            Left = 27
            Top = 27
            Width = 113
            Height = 21
            Alignment = taRightJustify
            Color = clSilver
            Lines.Strings = (
              '0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 3
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        object GroupBox4: TGroupBox
          Left = 32
          Top = 48
          Width = 369
          Height = 65
          Caption = 'Regra de Cálculo'
          Enabled = False
          TabOrder = 1
          object edtNomeRegra: TEdit
            Left = 18
            Top = 26
            Width = 329
            Height = 21
            Color = clSilver
            TabOrder = 0
          end
        end
        object btnCobraMulta: TBitBtn
          Left = 418
          Top = 135
          Width = 167
          Height = 50
          Anchors = [akTop, akRight]
          Caption = 'Gera &Cobrança'
          TabOrder = 2
          OnClick = btnCobraMultaClick
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
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 284
    Width = 685
    inherited tb97Fundo: TToolbar97
      Left = 270
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
        'TMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object cdsConcilia: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 201
    Top = 195
  end
  object dsConcilia: TDataSource
    DataSet = cdsConcilia
    Left = 201
    Top = 209
  end
  object cdsContrato: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 279
    Top = 195
    object cdsContratoCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
    end
    object cdsContratoCONDATAFIM: TDateTimeField
      FieldName = 'CONDATAFIM'
    end
    object cdsContratoCONDATASOLRESC: TDateTimeField
      FieldName = 'CONDATASOLRESC'
    end
    object cdsContratoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object cdsContratoCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object cdsContratoCONBANCOFIANCA: TFloatField
      FieldName = 'CONBANCOFIANCA'
    end
    object cdsContratoCONDATAASSINATURA: TDateTimeField
      FieldName = 'CONDATAASSINATURA'
    end
    object cdsContratoCONDATAAVDENUNCIA: TDateTimeField
      FieldName = 'CONDATAAVDENUNCIA'
    end
    object cdsContratoCONDATAAVRENEGOC: TDateTimeField
      FieldName = 'CONDATAAVRENEGOC'
    end
    object cdsContratoCONDATACARENCIA: TDateTimeField
      FieldName = 'CONDATACARENCIA'
    end
    object cdsContratoCONDATADENUNCIA: TDateTimeField
      FieldName = 'CONDATADENUNCIA'
    end
    object cdsContratoCONDATAFIANCAAV: TDateTimeField
      FieldName = 'CONDATAFIANCAAV'
    end
    object cdsContratoCONDATAFIANCAFIM: TDateTimeField
      FieldName = 'CONDATAFIANCAFIM'
    end
    object cdsContratoCONDATAFIANCAINI: TDateTimeField
      FieldName = 'CONDATAFIANCAINI'
    end
    object cdsContratoCONDATAINICAREN: TDateTimeField
      FieldName = 'CONDATAINICAREN'
    end
    object cdsContratoCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
    end
    object cdsContratoCONDATARENEGOC: TDateTimeField
      FieldName = 'CONDATARENEGOC'
    end
    object cdsContratoCONDESCRICAO: TMemoField
      FieldName = 'CONDESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object cdsContratoCONDIASREPASSE: TFloatField
      FieldName = 'CONDIASREPASSE'
    end
    object cdsContratoCONDIASTOLERANCIA: TFloatField
      FieldName = 'CONDIASTOLERANCIA'
    end
    object cdsContratoCONDIAVENCIMENTO: TFloatField
      FieldName = 'CONDIAVENCIMENTO'
    end
    object cdsContratoCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
    end
    object cdsContratoCONMESREFREAJUSTE: TStringField
      FieldName = 'CONMESREFREAJUSTE'
      FixedChar = True
      Size = 1
    end
    object cdsContratoCONMOEDAMORA: TFloatField
      FieldName = 'CONMOEDAMORA'
    end
    object cdsContratoCONMOEDAMULTA: TFloatField
      FieldName = 'CONMOEDAMULTA'
    end
    object cdsContratoCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object cdsContratoCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object cdsContratoCONOBSFIANCA: TMemoField
      FieldName = 'CONOBSFIANCA'
      BlobType = ftMemo
      Size = 2000
    end
    object cdsContratoCONPERALUGUEL: TFloatField
      FieldName = 'CONPERALUGUEL'
    end
    object cdsContratoCONPERCENTMORA: TFloatField
      FieldName = 'CONPERCENTMORA'
    end
    object cdsContratoCONPERCENTMULTA: TFloatField
      FieldName = 'CONPERCENTMULTA'
    end
    object cdsContratoCONPERMORA: TStringField
      FieldName = 'CONPERMORA'
      FixedChar = True
      Size = 1
    end
    object cdsContratoCONPERREAJUSTE: TFloatField
      FieldName = 'CONPERREAJUSTE'
    end
    object cdsContratoCONPROXREAJUSTE: TDateTimeField
      FieldName = 'CONPROXREAJUSTE'
    end
    object cdsContratoCONQUANTVAGAS: TFloatField
      FieldName = 'CONQUANTVAGAS'
    end
    object cdsContratoCONTAXAADMIN: TFloatField
      FieldName = 'CONTAXAADMIN'
    end
    object cdsContratoCONVLRAJUSTADO: TFloatField
      FieldName = 'CONVLRAJUSTADO'
    end
    object cdsContratoCONVLRFIANCA: TFloatField
      FieldName = 'CONVLRFIANCA'
    end
    object cdsContratoCONVLRMORA: TFloatField
      FieldName = 'CONVLRMORA'
    end
    object cdsContratoCONVLRMULTA: TFloatField
      FieldName = 'CONVLRMULTA'
    end
    object cdsContratoCONVLRTOTAL: TFloatField
      FieldName = 'CONVLRTOTAL'
    end
    object cdsContratoFLGCOBRANCAAUTO: TFloatField
      FieldName = 'FLGCOBRANCAAUTO'
    end
    object cdsContratoFLGCOMPETALUGUEL: TStringField
      FieldName = 'FLGCOMPETALUGUEL'
      FixedChar = True
      Size = 1
    end
    object cdsContratoFLGFIANCA: TStringField
      FieldName = 'FLGFIANCA'
      FixedChar = True
      Size = 1
    end
    object cdsContratoFLGINDETERMINADO: TStringField
      FieldName = 'FLGINDETERMINADO'
      FixedChar = True
      Size = 1
    end
    object cdsContratoFLGMORAPROPORC: TFloatField
      FieldName = 'FLGMORAPROPORC'
    end
    object cdsContratoFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      FixedChar = True
      Size = 1
    end
    object cdsContratoFLGTIPOCONTRATO: TStringField
      FieldName = 'FLGTIPOCONTRATO'
      FixedChar = True
      Size = 1
    end
    object cdsContratoFLGTIPODIATOLERA: TStringField
      FieldName = 'FLGTIPODIATOLERA'
      FixedChar = True
      Size = 1
    end
    object cdsContratoFLGTIPODIAVENC: TStringField
      FieldName = 'FLGTIPODIAVENC'
      FixedChar = True
      Size = 1
    end
    object cdsContratoIDADMINIMOVEL: TFloatField
      FieldName = 'IDADMINIMOVEL'
    end
    object cdsContratoIDATIVIDADE: TFloatField
      FieldName = 'IDATIVIDADE'
    end
    object cdsContratoIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
    end
    object cdsContratoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object cdsContratoIDINDCORRECAO: TFloatField
      FieldName = 'IDINDCORRECAO'
    end
    object cdsContratoIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
    end
    object cdsContratoIDMARCA: TFloatField
      FieldName = 'IDMARCA'
    end
    object cdsContratoIDMSGBOLETO: TFloatField
      FieldName = 'IDMSGBOLETO'
    end
    object cdsContratoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object cdsContratoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object cdsContratoIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object cdsContratoIDSITCONTIMOB: TFloatField
      FieldName = 'IDSITCONTIMOB'
    end
    object cdsContratoIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
    end
    object cdsContratoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object cdsContratoPERALUGUELIDEAL: TFloatField
      FieldName = 'PERALUGUELIDEAL'
    end
    object cdsContratoPERCTXJURMERC: TFloatField
      FieldName = 'PERCTXJURMERC'
    end
    object cdsContratoPERITXJURMERC: TStringField
      FieldName = 'PERITXJURMERC'
      FixedChar = True
      Size = 1
    end
    object cdsContratoVLRCONTABIL: TFloatField
      FieldName = 'VLRCONTABIL'
    end
    object cdsContratoVLRPRESENTE: TFloatField
      FieldName = 'VLRPRESENTE'
    end
    object cdsContratoVLRPROPOSTA: TFloatField
      FieldName = 'VLRPROPOSTA'
    end
    object cdsContratoFLGTIPOALUGUEL: TStringField
      FieldName = 'FLGTIPOALUGUEL'
      FixedChar = True
      Size = 1
    end
    object cdsContratoIDREGRARES: TFloatField
      FieldName = 'IDREGRARES'
    end
    object cdsContratoDSC_ADMINISTRADORA: TStringField
      FieldName = 'DSC_ADMINISTRADORA'
      Size = 60
    end
    object cdsContratoDSC_LOCATARIO: TStringField
      FieldName = 'DSC_LOCATARIO'
      Size = 60
    end
    object cdsContratoDSC_RESPONSAVEL: TStringField
      FieldName = 'DSC_RESPONSAVEL'
      Size = 60
    end
  end
  object dsContrato: TDataSource
    DataSet = cdsContrato
    Left = 278
    Top = 209
  end
  object Query1: TQuery
    DataSource = dsConcilia
    SQL.Strings = (
      
        'SELECT DISTINCT V.CODDOCUMENTO,      V.DATAVENCIMENTO,    V.DATA' +
        '_BAIXA,    DD.TOT_RECEBER,     DD.RECEBIDO,'
      
        '                V.FLGNAOCONCILIADO,  V.IDCONTRATOIMOVEL,  V.IDCI' +
        'DADES,      V.IDPAIS,           V.CODESTADO,'
      
        '                V.CONDIASTOLERANCIA, V.FLGTIPODIATOLERA,  V.RS_F' +
        'ORCLI,      V.IDFORCLI,         V.DATALIMITE,'
      
        '                V.CONTRATO_EXTENSO,  V.MESCOMPETENCIA,    V.ANOC' +
        'OMPETENCIA, V.VLRJUROS,         V.VLRMULTA,'
      
        '                V.VLRCORRECAOMON,    V.IDINDCORRECAO,     V.CONM' +
        'OEDAMULTA,  V.CONPERCENTMULTA,  V.CONVLRMULTA,'
      
        '                V.CONPERMORA,        V.FLGMORAPROPORC,    V.CONP' +
        'ERCENTMORA, V.CONVLRMORA,       V.CONMOEDAMORA,'
      
        '                V.CODTIPIMOVEL,      V.CONMESREFREAJUSTE, V.STAT' +
        'US_DOC,'
      ''
      '                CM.VLRACUM AS CORRECAO,'
      '                JR.VLRACUM AS JUROS,'
      '                MT.VLRACUM AS MULTA,'
      ''
      '               (DD.TOT_RECEBER+CM.VLRACUM) AS VC,'
      ''
      
        '         ROUND((DD.TOT_RECEBER + NVL(CM.VLRACUM,0) + NVL(JR.VLRA' +
        'CUM,0) + NVL(MT.VLRACUM,0) - DD.RECEBIDO),2) AS DIFERENCA'
      ''
      'FROM VWLANCAMENTO V, CONTRATOIMOVEL C,'
      ''
      
        '   ( SELECT LI.CODDOCUMENTO, LI.IDCONTRATOIMOVEL, LI.MESCOMPETEN' +
        'CIA, LI.ANOCOMPETENCIA, LI.DATAVENCIMENTO,'
      
        '            LI.DATALIMITE, LI.CODTIPIMOVEL, LI.IDTIPOCUSTORECIMO' +
        ','
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
      ''
      
        '            SUM( DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG' +
        ', '#39'R'#39', LD.VALOR, 0), 0) * LI.VLRLANCRECEB / TRD.VALOR ) AS RECEB' +
        'IDO'
      ''
      
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
      
        '       AND ( LD.DATALANCTO <= TO_DATE('#39'12/02/2005'#39', '#39'DD/MM/YYYY'#39 +
        ') )'
      '       AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )'
      '       AND ( D.CODDOCUMENTO  = LD.CODDOCUMENTO )'
      '       AND ( D.CODDOCUMENTO  = TRD.CODDOCUMENTO )'
      '       AND ( LI.CODTIPIMOVEL = T.CODTIPIMOVEL )'
      '       AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) )'
      '       AND LI.IDCONTRATOIMOVEL = '#39'601'#39
      
        '       AND ( (LD.CODALTERADOR IS NULL) OR (LD.CODALTERADOR IN(T.' +
        'CODALTMULTA, T.CODALTJUROS, T.CODALTCORRMON)'
      '       AND   LD.DATALANCTO < TO_DATE('#39'31/12/2004'#39','#39'DD/MM/YYYY'#39')'
      
        '       AND NOT EXISTS ( SELECT 1 FROM LANCOPERDIAIMOB WHERE CODD' +
        'OCUMENTO = LD.CODDOCUMENTO ) ) OR (LD.CODALTERADOR <> NVL(T.CODA' +
        'LTMULTA,0)'
      '       AND   LD.CODALTERADOR <> NVL(T.CODALTJUROS,0)'
      '       AND   LD.CODALTERADOR <> NVL(T.CODALTCORRMON,0)) )'
      
        '     GROUP BY LI.CODDOCUMENTO, LI.IDCONTRATOIMOVEL, LI.MESCOMPET' +
        'ENCIA, LI.ANOCOMPETENCIA, LI.DATAVENCIMENTO, LI.DATALIMITE,'
      '              LI.CODTIPIMOVEL, LI.IDTIPOCUSTORECIMO ) DD,'
      ''
      
        '     ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, SUM(LO.VLRAC' +
        'UM) AS VLRACUM'
      '       FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,'
      '          ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA'
      '            FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2'
      '            WHERE LO2.IDOPERACAO = PI2.IDOPERATUALCM'
      
        '              AND ( LO2.DATAOPER <= TO_DATE('#39'12/02/2005'#39', '#39'DD/MM' +
        '/YYYY'#39') )'
      '            GROUP BY LO2.CODDOCUMENTO ) UD'
      '       WHERE LO.IDOPERACAO   = PI.IDOPERATUALCM'
      '         AND   LO.CODDOCUMENTO = UD.CODDOCUMENTO (+)'
      '         AND   LO.DATAOPER     = UD.ULTDIA'
      '         AND   LO.IDCONTRATOIMOVEL = '#39'601'#39
      
        '       GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERA' +
        'CAO ) CM,'
      ''
      
        '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO,' +
        ' SUM(LO.VLRACUM) AS VLRACUM'
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,'
      '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA'
      '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2'
      '          WHERE LO2.IDOPERACAO = PI2.IDOPERATUALJUROS'
      
        '            AND ( LO2.DATAOPER <= TO_DATE('#39'12/02/2005'#39', '#39'DD/MM/Y' +
        'YYY'#39') )'
      '          GROUP BY LO2.CODDOCUMENTO ) UD'
      '     WHERE LO.IDOPERACAO   = PI.IDOPERATUALJUROS'
      '       AND LO.DATAOPER     = UD.ULTDIA'
      '       AND LO.CODDOCUMENTO = UD.CODDOCUMENTO (+)'
      '       AND LO.IDCONTRATOIMOVEL = '#39'601'#39
      
        '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACA' +
        'O ) JR,'
      ''
      
        '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO,' +
        ' SUM(LO.VLRACUM) AS VLRACUM'
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,'
      '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA'
      '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2'
      '          WHERE LO2.IDOPERACAO = PI2.IDOPERATUALMULTA'
      
        '            AND ( LO2.DATAOPER <= TO_DATE('#39'12/02/2005'#39', '#39'DD/MM/Y' +
        'YYY'#39') )'
      '          GROUP BY LO2.CODDOCUMENTO ) UD'
      '     WHERE LO.IDOPERACAO   = PI.IDOPERATUALMULTA'
      '       AND LO.DATAOPER     = UD.ULTDIA'
      '       AND LO.CODDOCUMENTO = UD.CODDOCUMENTO (+)'
      '       AND LO.IDCONTRATOIMOVEL = '#39'601'#39
      
        '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACA' +
        'O ) MT'
      ''
      'WHERE   V.FLGNAOCONCILIADO = '#39'1'#39
      '  AND   V.IDMODULO         = '#39'64'#39
      '  AND   V.IDCONTRATOIMOVEL = '#39'601'#39
      '  AND ( V.IDCONTRATOIMOVEL  = C.IDCONTRATOIMOVEL  (+) )'
      '  AND ( V.CODDOCUMENTO      = CM.CODDOCUMENTO     (+) )'
      '  AND ( V.IDCONTRATOIMOVEL  = CM.IDCONTRATOIMOVEL (+) )'
      '  AND ( V.CODDOCUMENTO      = JR.CODDOCUMENTO     (+) )'
      '  AND ( V.IDCONTRATOIMOVEL  = JR.IDCONTRATOIMOVEL (+) )'
      '  AND ( V.CODDOCUMENTO      = MT.CODDOCUMENTO     (+) )'
      '  AND ( V.IDCONTRATOIMOVEL  = MT.IDCONTRATOIMOVEL (+) )'
      
        '  AND ( ROUND((DD.TOT_RECEBER + NVL(CM.VLRACUM,0) + NVL(JR.VLRAC' +
        'UM,0) + NVL(MT.VLRACUM,0) - DD.RECEBIDO),2) > 0 )'
      
        '  AND ( (DD.DATALIMITE IS NOT NULL AND DD.DATALIMITE <= TO_DATE(' +
        #39'01/03/2006'#39', '#39'DD/MM/YYYY'#39')) OR'
      
        '        (DD.DATALIMITE IS NULL AND DD.DATAVENCIMENTO <= TO_DATE(' +
        #39'01/03/2006'#39', '#39'DD/MM/YYYY'#39')) )'
      '  AND   V.DATAVENCIMENTO  <= SYSDATE'
      'ORDER BY V.CODDOCUMENTO, V.IDCONTRATOIMOVEL'
      ' ')
    Left = 629
    Top = 7
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      
        'SELECT REC_DES.CODDOCUMENTO, REC_DES.MESCOMPETENCIA, REC_DES.ANO' +
        'COMPETENCIA, REC_DES.DATAVENCIMENTO,'
      
        '       REC_DES.DATA_BAIXA, REC_DES.DATALIMITE,   REC_DES.TOT_REC' +
        'EBER,    REC_DES.TOT_RECEBIDO,'
      
        '       ROUND((REC_DES.TOT_RECEBER+NVL(CM.VLRACUM,0)+NVL(JR.VLRAC' +
        'UM,0)+NVL(MT.VLRACUM,0))-NVL(REC_DES.TOT_RECEBIDO,0),2) AS DIFER' +
        'ENCA,'
      
        '       NVL(CM.VLRACUM,0) AS CORRECAO, NVL(JR.VLRACUM,0) AS JUROS' +
        ', NVL(MT.VLRACUM,0) AS MULTA,'
      
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
        'TUAL, 0 AS VLRDIVERG, 0 AS DIFERENCA, 0 AS PROPORCAO,'
      '       0 AS ABONO'
      ''
      'FROM CONTRATOIMOVEL C, '
      
        '   ( SELECT LI.IDCONTRATOIMOVEL, LI.CODDOCUMENTO, LI.MESCOMPETEN' +
        'CIA, LI.ANOCOMPETENCIA, LI.DATALIMITE, '
      
        '            LI.DATAVENCIMENTO, LI.IDMODULO, LI.IDUSUARIOSISTEMA,' +
        ' LI.IDFORCLI, LI.FLGORIGEMLANC, '
      '            LI.TRGDTINCLUSAO, '
      '            SUM( '
      
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
      '               ) AS TOT_RECEBER, '
      
        '            SUM(DECODE(RTRIM(LD.OPERACAO),'#39'5'#39',DECODE(D.RECPAG,'#39'R' +
        #39',DECODE(LD.DEBCRE,'#39'C'#39',LD.VALOR*LI.VLRLANCRECEB/TRD.VALOR,LD.VAL' +
        'OR*(-1)*LI.VLRLANCRECEB/TRD.VALOR),0),0)) AS TOT_RECEBIDO,'
      
        '            DECODE(LI.FLGIMPORTADO,'#39'1'#39',LI.DATAVENCIMENTO,DECODE(' +
        'RTRIM(D.STATUS),'#39'2'#39',BX.DATABAIXA,NULL)) AS DATA_BAIXA '
      
        '     FROM DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL LI, TIP' +
        'OIMOVEL T, CONTRATOIMOVEL C, '
      '        ( SELECT CODDOCUMENTO, VALOR '
      '          FROM LANCTODOCUM '
      
        '          WHERE RTRIM(OPERACAO) = '#39'1'#39' OR RTRIM(OPERACAO) = '#39'2'#39' O' +
        'R RTRIM(OPERACAO) = '#39'3'#39') TRD, '
      '        ( SELECT D.CODDOCUMENTO, MAX(RP.DATABAIXA) AS DATABAIXA '
      '          FROM DOCUMENTO D, RECBTOPAGTO RP '
      '          WHERE ( D.IDMODULO = 64 ) '
      '            AND ( D.CODDOCUMENTO = RP.CODDOCUMENTO ) '
      '          GROUP BY D.CODDOCUMENTO ) BX '
      '     WHERE ( LI.CODDOCUMENTO   = D.CODDOCUMENTO ) '
      
        '       AND ( LD.DATALANCTO    <= TO_DATE( '#39'11/08/2006'#39','#39'DD/MM/YY' +
        'YY'#39') ) '
      
        '       AND ( C.FLGTIPOCONTRATO = '#39'L'#39' OR LI.IDCONTRATOIMOVEL IS N' +
        'ULL ) '
      '       AND ( LD.ESTORNO IS NULL ) '
      '       AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) ) '
      '       AND ( D.CODDOCUMENTO      = LD.CODDOCUMENTO ) '
      '       AND ( D.CODDOCUMENTO      = TRD.CODDOCUMENTO ) '
      '       AND ( LI.CODTIPIMOVEL     = T.CODTIPIMOVEL ) '
      
        '       AND ( (LD.CODALTERADOR IS NULL) OR (LD.CODALTERADOR IN(T.' +
        'CODALTMULTA,T.CODALTJUROS,T.CODALTCORRMON) '
      '       AND LD.DATALANCTO < TO_DATE('#39'31/12/2004'#39','#39'DD/MM/YYYY'#39') '
      
        '       AND NOT EXISTS ( SELECT 1 FROM LANCOPERDIAIMOB WHERE CODD' +
        'OCUMENTO = LD.CODDOCUMENTO AND FLGTIPO <> '#39'S'#39' ) ) OR (LD.CODALTE' +
        'RADOR <> NVL(T.CODALTMULTA,0) '
      '       AND LD.CODALTERADOR <> NVL(T.CODALTJUROS,0) '
      '       AND LD.CODALTERADOR <> NVL(T.CODALTCORRMON,0)) ) '
      
        '       AND ( (LI.DATALIMITE IS NOT NULL AND LI.DATALIMITE <= TO_' +
        'DATE( '#39'11/08/2006'#39','#39'DD/MM/YYYY'#39')) OR '
      
        '             (LI.DATALIMITE IS NULL AND LI.DATAVENCIMENTO <= TO_' +
        'DATE( '#39'11/08/2006'#39','#39'DD/MM/YYYY'#39')) ) '
      
        '     GROUP BY LI.IDCONTRATOIMOVEL, LI.CODDOCUMENTO, LI.MESCOMPET' +
        'ENCIA, LI.ANOCOMPETENCIA, LI.DATALIMITE, '
      
        '              LI.DATAVENCIMENTO, LI.IDMODULO, LI.IDUSUARIOSISTEM' +
        'A, LI.IDFORCLI, LI.FLGORIGEMLANC, LI.TRGDTINCLUSAO, '
      
        '              LI.FLGIMPORTADO, D.STATUS, BX.DATABAIXA ) REC_DES,' +
        ' '
      
        '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO,' +
        ' SUM(LO.VLRACUM) AS VLRACUM '
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI, '
      '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA '
      '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2 '
      '          WHERE LO2.IDOPERACAO  = PI2.IDOPERATUALCM '
      
        '            AND LO2.DATAOPER   <= TO_DATE( '#39'11/08/2006'#39','#39'DD/MM/Y' +
        'YYY'#39') '
      '            AND LO2.FLGTIPO <> '#39'S'#39' '
      '          GROUP BY LO2.CODDOCUMENTO ) UD '
      '     WHERE LO.IDOPERACAO       = PI.IDOPERATUALCM '
      '       AND LO.DATAOPER         = UD.ULTDIA '
      '       AND LO.CODDOCUMENTO     = UD.CODDOCUMENTO(+) '
      '       AND LO.IDCONTRATOIMOVEL = 294'
      '       AND LO.FLGTIPO <> '#39'S'#39' '
      
        '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACA' +
        'O ) CM, '
      
        '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO,' +
        ' SUM(LO.VLRACUM) AS VLRACUM '
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI, '
      '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA '
      '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2 '
      '          WHERE LO2.IDOPERACAO  = PI2.IDOPERATUALJUROS '
      
        '            AND LO2.DATAOPER   <= TO_DATE( '#39'11/08/2006'#39','#39'DD/MM/Y' +
        'YYY'#39') '
      '            AND LO2.FLGTIPO <> '#39'S'#39' '
      '          GROUP BY LO2.CODDOCUMENTO ) UD '
      '     WHERE LO.IDOPERACAO       = PI.IDOPERATUALJUROS '
      '       AND LO.DATAOPER         = UD.ULTDIA '
      '       AND LO.CODDOCUMENTO     = UD.CODDOCUMENTO(+) '
      '       AND LO.IDCONTRATOIMOVEL = 294'
      '       AND LO.FLGTIPO <> '#39'S'#39' '
      
        '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACA' +
        'O ) JR, '
      
        '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO,' +
        ' SUM(LO.VLRACUM) AS VLRACUM '
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI, '
      '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA '
      '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2 '
      '          WHERE LO2.IDOPERACAO  = PI2.IDOPERATUALMULTA '
      
        '            AND LO2.DATAOPER   <= TO_DATE( '#39'11/08/2006'#39','#39'DD/MM/Y' +
        'YYY'#39') '
      '            AND LO2.FLGTIPO <> '#39'S'#39' '
      '          GROUP BY LO2.CODDOCUMENTO ) UD '
      '     WHERE LO.IDOPERACAO       = PI.IDOPERATUALMULTA '
      '       AND LO.DATAOPER         = UD.ULTDIA '
      '       AND LO.CODDOCUMENTO     = UD.CODDOCUMENTO(+) '
      '       AND LO.IDCONTRATOIMOVEL = 294'
      '       AND LO.FLGTIPO <> '#39'S'#39' '
      
        '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACA' +
        'O ) MT '
      'WHERE ( REC_DES.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) ) '
      '  AND ( REC_DES.IDCONTRATOIMOVEL = CM.IDCONTRATOIMOVEL(+) ) '
      '  AND ( REC_DES.CODDOCUMENTO     = CM.CODDOCUMENTO(+) ) '
      '  AND ( REC_DES.IDCONTRATOIMOVEL = JR.IDCONTRATOIMOVEL(+) ) '
      '  AND ( REC_DES.CODDOCUMENTO     = JR.CODDOCUMENTO(+) ) '
      '  AND ( REC_DES.IDCONTRATOIMOVEL = MT.IDCONTRATOIMOVEL(+) ) '
      '  AND ( REC_DES.CODDOCUMENTO     = MT.CODDOCUMENTO(+) ) '
      
        '  AND ( ROUND((REC_DES.TOT_RECEBER+NVL(CM.VLRACUM,0)+NVL(JR.VLRA' +
        'CUM,0)+NVL(MT.VLRACUM,0)-NVL(REC_DES.TOT_RECEBIDO,0)),2)>0) '
      '  AND REC_DES.IDMODULO         = 64'
      '  AND C.IDCONTRATOIMOVEL       = 294'
      'ORDER BY REC_DES.CODDOCUMENTO '
      ' ')
    ClientDataSet = cdsConcilia
    Left = 413
    Top = 191
  end
end
