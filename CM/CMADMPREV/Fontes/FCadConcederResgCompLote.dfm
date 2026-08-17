inherited FrmCadConcederResgCompLote: TFrmCadConcederResgCompLote
  Left = 367
  Top = 95
  Caption = 'Concessão de Resgate Complementar em Lote'
  ClientHeight = 560
  ClientWidth = 842
  Scaled = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 842
    Height = 474
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Width = 840
      Height = 374
      Enabled = False
      Tabs.Strings = (
        'Concessão de Resgate Complementar em Lote'
        'LOG'
        'Impressão')
      object SpeedButton1: TSpeedButton [0]
        Left = 64
        Top = 64
        Width = 23
        Height = 22
      end
      object pnl_impressao: TPanel [1]
        Left = 4
        Top = 55
        Width = 742
        Height = 315
        Align = alClient
        TabOrder = 3
        object rg_opcao_impressao: TRadioGroup
          Left = 137
          Top = 57
          Width = 472
          Height = 112
          Items.Strings = (
            'LOG'
            'Demonstrativo de Concessão de Benefícios de INSS em Lote')
          TabOrder = 0
        end
        object bt_imprimir: TButton
          Left = 328
          Top = 176
          Width = 75
          Height = 25
          Caption = 'Imprimir'
          TabOrder = 1
          OnClick = bt_imprimirClick
        end
      end
      object pnl1: TPanel [2]
        Left = 4
        Top = 55
        Width = 742
        Height = 315
        Align = alClient
        TabOrder = 4
        object grid_log: TwwDBGrid
          Left = 0
          Top = 0
          Width = 731
          Height = 247
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Color = clWhite
          DataSource = ds
          ImeMode = imHanguel
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          IndicatorColor = icBlack
        end
      end
      inherited pgctrlDetalhe: TPageControl
        Width = 742
        Height = 315
        inherited tbsDet: TTabSheet
          Caption = ''
          inherited pnlControlesDet: TPanel [0]
            Width = 734
            Height = 287
            object lbl_matri: TLabel
              Left = 8
              Top = 0
              Width = 55
              Height = 13
              Caption = 'Matrícula'
            end
            object Label1: TLabel
              Left = 8
              Top = 48
              Width = 121
              Height = 13
              Caption = 'Número do Benefício'
            end
            object Label2: TLabel
              Left = 296
              Top = 96
              Width = 22
              Height = 13
              Caption = 'DIP'
            end
            object Label3: TLabel
              Left = 150
              Top = 0
              Width = 33
              Height = 13
              Caption = 'Nome'
            end
            object Label4: TLabel
              Left = 150
              Top = 48
              Width = 46
              Height = 13
              Caption = 'Espécie'
            end
            object Label5: TLabel
              Left = 438
              Top = 96
              Width = 22
              Height = 13
              Caption = 'DIB'
            end
            object Label6: TLabel
              Left = 291
              Top = 48
              Width = 56
              Height = 13
              Caption = 'Benefício'
            end
            object Label7: TLabel
              Left = 579
              Top = 96
              Width = 70
              Height = 13
              Caption = 'DIB Anterior'
            end
            object Label8: TLabel
              Left = 8
              Top = 96
              Width = 24
              Height = 13
              Caption = 'RMI'
            end
            object Label9: TLabel
              Left = 152
              Top = 96
              Width = 90
              Height = 13
              Caption = 'Data do Evento'
            end
            object Label10: TLabel
              Left = 434
              Top = 147
              Width = 128
              Height = 13
              Caption = 'Data de Requerimento'
            end
            object Label11: TLabel
              Left = 150
              Top = 150
              Width = 116
              Height = 13
              Caption = 'Data Início-Moléstia'
            end
            object Label12: TLabel
              Left = 291
              Top = 150
              Width = 102
              Height = 13
              Caption = 'Data Fim-Moléstia'
            end
            object Label13: TLabel
              Left = 8
              Top = 199
              Width = 118
              Height = 13
              Caption = 'Benefício Requerido'
            end
            object dbedNumProcINSS: TwwDBEdit
              Left = 8
              Top = 14
              Width = 120
              Height = 21
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit1: TwwDBEdit
              Left = 8
              Top = 62
              Width = 120
              Height = 21
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit2: TwwDBEdit
              Left = 296
              Top = 108
              Width = 120
              Height = 21
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 7
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit3: TwwDBEdit
              Left = 150
              Top = 14
              Width = 257
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit4: TwwDBEdit
              Left = 150
              Top = 62
              Width = 120
              Height = 21
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit5: TwwDBEdit
              Left = 438
              Top = 108
              Width = 120
              Height = 21
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 8
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit6: TwwDBEdit
              Left = 291
              Top = 62
              Width = 366
              Height = 21
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dtDataInicio: TCMDateTimePicker
              Left = 434
              Top = 161
              Width = 121
              Height = 21
              Hint = 'Data de Início do Pagamento do Benefício'
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
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              ShowButton = True
              TabOrder = 13
            end
            object dtEvento: TCMDateTimePicker
              Left = 152
              Top = 108
              Width = 121
              Height = 21
              Hint = 'Data de Início do Pagamento do Benefício'
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
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              ShowButton = True
              TabOrder = 6
            end
            object CMDateTimePicker2: TCMDateTimePicker
              Left = 150
              Top = 163
              Width = 121
              Height = 21
              Hint = 'Data de Início do Pagamento do Benefício'
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
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              ShowButton = True
              TabOrder = 11
            end
            object CMDateTimePicker3: TCMDateTimePicker
              Left = 291
              Top = 163
              Width = 121
              Height = 21
              Hint = 'Data de Início do Pagamento do Benefício'
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
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              ShowButton = True
              TabOrder = 12
            end
            object wwDBEdit9: TwwDBEdit
              Left = 8
              Top = 214
              Width = 149
              Height = 21
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 15
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object rg_molestia: TDBRadioGroup
              Left = 8
              Top = 144
              Width = 121
              Height = 49
              Caption = 'Moléstia'
              Columns = 2
              Items.Strings = (
                'Sim'
                'Não')
              ReadOnly = True
              TabOrder = 10
              TabStop = True
              Values.Strings = (
                'SIM'
                'NAO')
            end
            object wwDBEdit10: TwwDBEdit
              Left = 8
              Top = 108
              Width = 128
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnChange = wwDBEdit10Change
            end
            object dtDataFinal: TCMDateTimePicker
              Left = 580
              Top = 108
              Width = 114
              Height = 21
              Hint = 'Data Final do Pagamento do Benefício'
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
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              ShowButton = True
              TabOrder = 9
              OnChange = dtDataFinalChange
            end
            object cb_validado: TCheckBox
              Left = 168
              Top = 216
              Width = 89
              Height = 17
              Caption = 'Validado'
              TabOrder = 16
            end
            object db_grid_irrf: TDBRadioGroup
              Left = 584
              Top = 144
              Width = 121
              Height = 49
              Caption = 'Isento de IRRF'
              Columns = 2
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 14
              TabStop = True
              Values.Strings = (
                'SIM'
                'NAO')
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 734
            Height = 287
            ControlType.Strings = (
              'SELECIONADO;CheckBox;S;N')
            Selected.Strings = (
              'SELECIONADO'#9'1'#9'S'
              'MATRICULA'#9'15'#9'Matrícula'
              'DATA_ULTIMO_RESGATE'#9'18'#9'Data Último Resgate'
              'SALDO_CONTA_TOTAL'#9'27'#9'Saldo'
              'TIPO_OPCAO_IR'#9'11'#9'Tipo Opção IR'
              'NUMEROPROCESSO'#9'10'#9'NUMEROPROCESSO'
              'VALORATUAL'#9'10'#9'VALORATUAL'
              'VALORTOTAL'#9'10'#9'VALORTOTAL'
              'IDEVENTOSPREV'#9'10'#9'IDEVENTOSPREV')
            Color = clWhite
            ImeMode = imHanguel
            KeyOptions = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
            TitleLines = 2
            TitleButtons = True
            OnTitleButtonClick = dbgrdDetTitleButtonClick
          end
        end
      end
      inherited Dock973: TDock97
        Width = 832
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Visible = False
          end
          inherited sbtnAltDet: TToolbarButton97
            Enabled = False
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Enabled = False
            Visible = False
          end
        end
        object bbtnInverte: TBitBtn
          Left = 287
          Top = -1
          Width = 148
          Height = 30
          Hint = 'Inverte a Seleção das Rubricas'
          Caption = 'Desmarcar Tudo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = bbtnInverteClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333000000003333333388888888333333330FFF
            FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
            FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
            FFF0333833338FFFFFF833333333000000003333333388888888000000003333
            333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
            00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
            033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
            3333888888877333333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
        object bbtnSelTudo: TBitBtn
          Left = 135
          Top = -1
          Width = 148
          Height = 30
          Hint = 'Seleciona Todas as Rubricas'
          Caption = '   Seleciona Tudo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = bbtnSelTudoClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333333333333333333333333300000
            0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
            FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
            9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
            00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
            993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
            3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
            3333388888887733333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
        object tbButtonAlterar: TBitBtn
          Left = 585
          Top = -1
          Width = 90
          Height = 30
          Caption = 'Processar'
          Enabled = False
          TabOrder = 3
          OnClick = tbButtonAlterarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333000003333333333F777773FF333333008877700
            33333337733FFF773F33330887000777033333733F777FFF73F330880FAFAF07
            703337F37733377FF7F33080F00000F07033373733777337F73F087F00A2200F
            77037F3737333737FF7F080A0A2A220A07037F737F3333737F7F0F0F0AAAA20F
            07037F737F3333737F7F0F0A0FAA2A0A08037F737FF33373737F0F7F00FFA00F
            780373F737FFF737F3733080F00000F0803337F73377733737F330F80FAFAF08
            8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
            3333333773FFFF77333333333000003333333333377777333333}
          NumGlyphs = 2
        end
        object tbButtonEnviar: TBitBtn
          Left = 677
          Top = -1
          Width = 90
          Height = 30
          Caption = 'Gravar'
          Enabled = False
          TabOrder = 4
          OnClick = tbButtonEnviarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333000003333333333F777773FF333333008877700
            33333337733FFF773F33330887000777033333733F777FFF73F330880FAFAF07
            703337F37733377FF7F33080F00000F07033373733777337F73F087F00A2200F
            77037F3737333737FF7F080A0A2A220A07037F737F3333737F7F0F0F0AAAA20F
            07037F737F3333737F7F0F0A0FAA2A0A08037F737FF33373737F0F7F00FFA00F
            780373F737FFF737F3733080F00000F0803337F73377733737F330F80FAFAF08
            8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
            3333333773FFFF77333333333000003333333333377777333333}
          NumGlyphs = 2
        end
      end
      inherited Dock974: TDock97
        Left = 746
        Height = 315
        inherited tb97Detalhe: TToolbar97
          object bbtnOpcoes: TBitBtn
            Left = 0
            Top = 81
            Width = 85
            Height = 27
            Hint = 'Verificar Regra de Concessão do Benefício'
            Cancel = True
            Caption = 'O&pções'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            Visible = False
            Glyph.Data = {
              42010000424D4201000000000000760000002800000011000000110000000100
              040000000000CC00000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
              DDDDD0000000DDDDDDDDDDDDDDDDD0000000D00000DDDDD00000D0000000D0FF
              F0DDDDD0FFF0D0000000D0FFF0DDDDD0FFF0D0000000D00000DD0DD00000D000
              0000DDD0DDD0F0DDD0DDD0000000DDD0DD0FFF0DD0DDD0000000DDD000FFFFF0
              00DDD0000000DDDDDD0FFF0DDDDDD0000000DDDDDDD0F0DDDDDDD0000000DDDD
              DDDD0DDDDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDD0FFF0DDDDDD000
              0000DDDDDD0FFF0DDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDDDDDDDD
              DDDDD0000000}
          end
        end
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 840
      object Label18: TLabel
        Left = 196
        Top = 61
        Width = 110
        Height = 13
        Caption = 'Data Requerimento'
        Visible = False
      end
      object Label19: TLabel
        Left = 404
        Top = 61
        Width = 95
        Height = 13
        Caption = 'Data Pagamento'
        Visible = False
      end
      object mk_data_re: TMaskEdit
        Left = 313
        Top = 53
        Width = 73
        Height = 21
        EditMask = '99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
        Visible = False
      end
      object GroupBox2: TGroupBox
        Left = 592
        Top = 56
        Width = 184
        Height = 41
        Caption = 'Tipo Opção IR'
        TabOrder = 1
      end
      object mk_data_pag: TCMDateTimePicker
        Left = 504
        Top = 52
        Width = 80
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
        Visible = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 842
    object ToolbarButton971: TToolbarButton97 [0]
      Left = 120
      Top = 0
      Width = 60
      Height = 41
      AllowAllUp = True
      GroupIndex = 1
      Caption = '&Excluir'
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
      ImageIndex = 2
      Images = ImlPadrao
      Layout = blGlyphTop
      Opaque = False
      Spacing = 0
      OnClick = sbtnApagarClick
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Left = 180
        ParentFont = False
        ParentShowHint = False
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 0
        Enabled = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 240
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 60
        Enabled = False
      end
      object sbtnRequerer: TToolbarButton97
        Left = 120
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Requerer'
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Conceder'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
          000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
          99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
          0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
          FFFF3FFFFF7F337F333300000307B70FFFFF77777F73FF733F330EEE033000FF
          0FFF7F337FF777337FF30EEE00033FF000FF7F33777F333777FF0EEE0E033300
          000F7FFF7F7FFF77777F00000E00000000007777737773777777330EEE0E0330
          00FF337FFF7F7F3777F33300000E033000FF337777737F3777F333330EEE0330
          00FF33337FFF7FF77733333300000000033F3333777777777333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnRequererClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 521
    Width = 842
    object lbl_listados: TLabel [0]
      Left = 328
      Top = 8
      Width = 5
      Height = 13
    end
    inherited tb97Fundo: TToolbar97
      Left = 667
      ActivateParent = False
      DockPos = 667
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 492
      ActivateParent = False
      DockPos = 492
    end
    object bbtnDesfazer: TBitBtn
      Left = 16
      Top = 0
      Width = 75
      Height = 33
      Caption = 'Desfazer'
      Enabled = False
      TabOrder = 2
      OnClick = bbtnDesfazerClick
    end
    object cb_grava_indiv: TCheckBox
      Left = 104
      Top = 8
      Width = 169
      Height = 17
      Caption = 'Gravação Individual'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
  object rd_benefreq: TRadioGroup [3]
    Left = 592
    Top = 52
    Width = 185
    Height = 51
    Caption = 'Resgate Concedido ?'
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      'Sim'
      'Não')
    TabOrder = 3
  end
  object cb_tipo_op: TComboBox [4]
    Left = 602
    Top = 118
    Width = 166
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    OnChange = cb_tipo_opChange
    Items.Strings = (
      'PROGRESSIVA'
      'REGRESSIVA')
  end
  object gbPlano: TGroupBox [5]
    Left = 24
    Top = 59
    Width = 161
    Height = 70
    Caption = 'Plano Previdenciário'
    TabOrder = 5
    object cb_tipo_recebedor: TwwDBLookupCombo
      Left = 8
      Top = 28
      Width = 144
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'50'#9'Plano Previdenciário')
      DataField = 'IDPLANOPREV'
      LookupTable = QryPlanos
      LookupField = 'IDPLANOPREV'
      Options = [loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 48
    Top = 282
    TargetsData = (
      1
      4
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Items'
        0)
      (
        ''
        'Cells'
        0))
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    DataSet = qryDet
    Left = 307
    Top = 154
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update pessoa set nome = '#39#39
      'where 1=2')
    Left = 130
    Top = 266
  end
  inherited MontaSelect: TMontaSelect
    Left = 323
    Top = 10
  end
  inherited ImlPadrao: TImageList
    Top = 290
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 388
    Top = 65522
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select 1 from dual')
    Top = 282
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 460
    Top = 26
  end
  object qry2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 153
    Top = 258
  end
  object qryaux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 185
    Top = 266
  end
  object qryaux2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 185
    Top = 306
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFBFCIARIO'
      ''
      'set'
      '  DIBBENEFANT = :DIBANT'
      ''
      'where'
      ''
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 362
    Top = 65530
  end
  object qrySitPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SIT.DESCRICAO , SIT.IDSITPART, SIT.FLGINTERNO'
      'FROM SITPART SIT , EVENTOXSITPART E'
      'WHERE '
      'SIT.IDSITPART = E.IDSITPART'
      'AND E.IDEVENTOGERADOR = :IDEVENTO'
      'ORDER BY SIT.DESCRICAO')
    ValidateWithMask = True
    Left = 263
    Top = 309
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEVENTO'
        ParamType = ptUnknown
      end>
  end
  object qrySitFunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT SIT.DESCRICAO , SIT.IDSITFUNC, SIT.FLGINTERNO, SIT.TIPOSI' +
        'T'
      'FROM SITFUNC SIT , EVENTOXSITFUNC E'
      'WHERE '
      'SIT.IDSITFUNC = E.IDSITFUNC'
      'AND E.IDEVENTOGERADOR = :IDEVENTO'
      'ORDER BY SIT.DESCRICAO')
    ValidateWithMask = True
    Left = 334
    Top = 309
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEVENTO'
        ParamType = ptUnknown
      end>
  end
  object qrySitPlanoPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SIT.DESCRICAO , SIT.IDSITPLANOPREV, SIT.FLGINTERNO'
      ''
      'FROM SITPLANOPREV SIT , EVENTOXSITPLAPREV E'
      'WHERE '
      'SIT.IDSITPLANOPREV = E.IDSITPLANOPREV'
      'AND E.IDEVENTOGERADOR = :IDEVENTO'
      'ORDER BY SIT.DESCRICAO')
    ValidateWithMask = True
    Left = 404
    Top = 309
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEVENTO'
        ParamType = ptUnknown
      end>
  end
  object IdHTTP1: TIdHTTP
    Request.Accept = 'text/html, */*'
    Request.ContentLength = 0
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ProxyPort = 0
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Left = 424
    Top = 144
  end
  object param: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 201
    Top = 362
  end
  object CrmRptCM: TCmRptManager
    IdUsuario = 0
    IdModulo = 0
    DeviceType = rdtScreen
    ShowPrintDialog = True
    ShowCancelDialog = True
    ConnectionType = cntADO
    Left = 523
    Top = 208
  end
  object DevRptCM: TExtraOptions
    About = 'TExtraDevices 3.00'
    HTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    HTML.BackLink = '&lt&lt'
    HTML.ForwardLink = '&gt&gt'
    HTML.ShowLinks = True
    HTML.UseTextFileName = False
    HTML.ZoomableImages = False
    HTML.Visible = True
    HTML.PixelFormat = pf8bit
    HTML.SingleFileOutput = False
    XHTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    XHTML.BackLink = '&lt&lt'
    XHTML.ForwardLink = '&gt&gt'
    XHTML.ShowLinks = True
    XHTML.UseTextFileName = False
    XHTML.ZoomableImages = False
    XHTML.Visible = True
    XHTML.PixelFormat = pf8bit
    XHTML.SingleFileOutput = False
    RTF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    RTF.Visible = True
    RTF.RichTextAsImage = False
    RTF.UseTextBox = True
    RTF.PixelFormat = pf8bit
    RTF.PixelsPerInch = 96
    Lotus.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Lotus.Visible = True
    Lotus.ColSpacing = 16934
    Quattro.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Quattro.Visible = True
    Quattro.ColSpacing = 16934
    Excel.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Excel.Visible = True
    Excel.ColSpacing = 16934
    Excel.RowSizing = False
    Excel.AutoConvertToNumber = False
    Graphic.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Graphic.PixelFormat = pf8bit
    Graphic.UseTextFileName = False
    Graphic.Visible = True
    Graphic.PixelsPerInch = 96
    Graphic.GrayScale = False
    PDF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    PDF.Creator = 'Cm Soluções Informática LTDA'
    PDF.Title = 'Relatório CM'
    PDF.Author = 'Cm Soluções Informática LTDA'
    PDF.FastCompression = False
    PDF.CompressImages = True
    PDF.ScaleImages = True
    PDF.Visible = True
    PDF.RichTextAsImage = False
    PDF.RichEditPixelFormat = pf1bit
    PDF.PixelFormat = pf24bit
    PDF.PixelsPerInch = 96
    PDF.Permissions = [ppPrint, ppModify, ppCopy, ppModifyAnnot]
    PDF.ViewerPreferences = []
    PDF.AutoEmbedFonts = True
    PDF.ImageFormat = riBitmap
    DotMatrix.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    DotMatrix.Visible = True
    DotMatrix.CharsPerInch = cs10CPI
    DotMatrix.LinesPerInch = ls6LPI
    DotMatrix.Port = 'LPT1'
    DotMatrix.ContinousPaper = False
    DotMatrix.PrinterType = ptEpson
    Left = 464
    Top = 208
  end
  object CmpRptCM: TCmParamReport
    Params = <>
    ExibeMensagem = True
    Formheight = 433
    FormWidth = 525
    HelpContext = 0
    Left = 580
    Top = 208
  end
  object CdsReciboCedidos: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'EMPREGADO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PAGINA'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'C_CUSTO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CARGO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EMPRESA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CGC'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'PIS'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NUMCONTASALARIO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NUMAGENCIA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NUMBANCO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TIPOCONTRATO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NUMDEPIRRF'
        DataType = ftFloat
      end
      item
        Name = 'NUMDEPSALF'
        DataType = ftFloat
      end
      item
        Name = 'NATUREZA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 11
      end
      item
        Name = 'CODRUBRICA1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA1'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO1'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO1'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB1'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA3'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO3'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO3'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB3'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA4'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO4'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO4'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB4'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA5'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO5'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO5'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB5'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA6'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA6'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA6'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO6'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO6'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB6'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA7'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA7'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA7'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO7'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO7'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB7'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA8'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA8'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA8'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO8'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO8'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB8'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA9'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA9'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA9'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO9'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO9'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB9'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA10'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA10'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA10'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO10'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO10'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB10'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA11'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA11'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA11'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO11'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO11'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB11'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA12'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA12'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA12'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO12'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO12'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB12'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA13'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA13'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA13'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO13'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO13'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB13'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA14'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA14'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA14'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO14'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO14'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB14'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA15'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA15'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA15'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO15'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO15'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB15'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA16'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA16'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA16'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO16'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO16'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB16'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA17'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA17'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA17'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO17'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO17'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB17'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA18'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA18'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA18'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO18'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO18'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB18'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA19'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA19'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA19'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO19'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO19'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB19'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA20'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA20'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA20'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO20'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO20'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB20'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA21'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA21'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA21'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO21'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO21'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB21'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA22'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA22'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA22'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO22'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO22'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB22'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA23'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA23'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA23'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO23'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO23'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB23'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA24'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA24'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA24'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO24'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO24'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB24'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA25'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA25'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA25'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO25'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO25'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB25'
        DataType = ftFloat
      end
      item
        Name = 'SALBASE'
        DataType = ftFloat
      end
      item
        Name = 'BASEINSS'
        DataType = ftFloat
      end
      item
        Name = 'SALPART'
        DataType = ftFloat
      end
      item
        Name = 'BASEFGTS'
        DataType = ftFloat
      end
      item
        Name = 'FGTSMES'
        DataType = ftFloat
      end
      item
        Name = 'BASEIRRF'
        DataType = ftFloat
      end
      item
        Name = 'TOT_PROVENTOS'
        DataType = ftFloat
      end
      item
        Name = 'TOT_DESCONTOS'
        DataType = ftFloat
      end
      item
        Name = 'TOT_GERAL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VALORMARGEM1'
        DataType = ftFloat
      end
      item
        Name = 'VALORMARGEM2'
        DataType = ftFloat
      end
      item
        Name = 'EMPREGADO_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PAGINA_2'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA_2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'C_CUSTO_2'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CARGO_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EMPRESA_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CGC_2'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'CPF_2'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'PIS_2'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NUMCONTASALARIO_2'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NUMAGENCIA_2'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NUMBANCO_2'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CODCENTROCUSTO_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TIPOCONTRATO_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NUMDEPIRRF_2'
        DataType = ftFloat
      end
      item
        Name = 'NUMDEPSALF_2'
        DataType = ftFloat
      end
      item
        Name = 'NATUREZA_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 11
      end
      item
        Name = 'CODRUBRICA1_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA1_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA1_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO1_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO1_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB1_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA2_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA2_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA2_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO2_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO2_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB2_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA3_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA3_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA3_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO3_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO3_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB3_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA4_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA4_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA4_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO4_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO4_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB4_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA5_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA5_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA5_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO5_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO5_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB5_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA6_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA6_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA6_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO6_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO6_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB6_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA7_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA7_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA7_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO7_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO7_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB7_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA8_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA8_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA8_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO8_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO8_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB8_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA9_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA9_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA9_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO9_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO9_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB9_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA10_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA10_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA10_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO10_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO10_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB10_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA11_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA11_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA11_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO11_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO11_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB11_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA12_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA12_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA12_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO12_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO12_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB12_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA13_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA13_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA13_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO13_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO13_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB13_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA14_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA14_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA14_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO14_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO14_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB14_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA15_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA15_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA15_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO15_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO15_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB15_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA16_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA16_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA16_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO16_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO16_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB16_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA17_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA17_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA17_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO17_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO17_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB17_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA18_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA18_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA18_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO18_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO18_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB18_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA19_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA19_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA19_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO19_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO19_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB19_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA20_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA20_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA20_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO20_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO20_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB20_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA21_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA21_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA21_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO21_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO21_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB21_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA22_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA22_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA22_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO22_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO22_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB22_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA23_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA23_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA23_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO23_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO23_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB23_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA24_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA24_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA24_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO24_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO24_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB24_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA25_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA25_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA25_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO25_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO25_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB25_2'
        DataType = ftFloat
      end
      item
        Name = 'SALBASE_2'
        DataType = ftFloat
      end
      item
        Name = 'BASEINSS_2'
        DataType = ftFloat
      end
      item
        Name = 'SALPART_2'
        DataType = ftFloat
      end
      item
        Name = 'BASEFGTS_2'
        DataType = ftFloat
      end
      item
        Name = 'FGTSMES_2'
        DataType = ftFloat
      end
      item
        Name = 'BASEIRRF_2'
        DataType = ftFloat
      end
      item
        Name = 'TOT_PROVENTOS_2'
        DataType = ftFloat
      end
      item
        Name = 'TOT_DESCONTOS_2'
        DataType = ftFloat
      end
      item
        Name = 'TOT_GERAL_2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VALORMARGEM1_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORMARGEM2_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORBRUTO1_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORBRUTO2_2'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'IndicePrimario'
        Fields = 'EMPRESA;EMPREGADO'
      end>
    Params = <>
    StoreDefs = True
    Left = 672
    Top = 360
  end
  object sqlReciboCedidos: TCMSqlParams
    SQL.Strings = (
      'SELECT '#39'S'#39' AS SELECIONADO,'
      '       B.IDBENEFHABILITA,'
      '       B.NUMEROPROCESSO,'
      '       B.EVENTOGERADOR,'
      '       (SELECT MATRICULA'
      '          FROM DEPENTIT'
      '         WHERE IDPESSOA = B.IDPESSOA'
      '           AND ROWNUM = 1) AS MATRICULA,'
      
        '       (SELECT NOME FROM PESSOA WHERE IDPESSOA = B.IDPESSOA) AS ' +
        'NOME,'
      '       (SELECT DISTINCT DATAMORTE'
      '          FROM PESSOAFISICA'
      '         WHERE IDPESSOA IN'
      
        '               (SELECT IDPESSOA FROM DEPENTIT WHERE IDPESSOA = I' +
        'DTITULAR)'
      '           AND IDPESSOA = B.IDPESSOA) AS DATAMORTE,'
      '       TEMP.IDPLANOPREV,'
      '       TEMP.IDSITPART,'
      '       TEMP.IDSITFUNC,'
      '       TEMP.IDPESSJUR, '
      '       TEMP.IDSITPLANOPREV,'
      '       TEMP.SEQPROPOSTA,'
      '       TEMP.INSCRICAONUMERO AS INSCNUMERO,'
      '       B.IDBENEFICIO,'
      '       (SELECT NUMPROCINSS'
      '          FROM BENEFBFCIARIO'
      '         WHERE IDTITULAR = B.IDTITULAR'
      '           AND IDPESSOA = B.IDPESSOA'
      '           AND IDBENEFICIO = B.IDBENEFICIO'
      '           AND ROWNUM = 1) AS NUMBENEFICIO,'
      '       B.IDPESSOA,'
      '       B.IDTITULAR,'
      
        '       DECODE(B.IDTITULAR, B.IDPESSOA, '#39'APOSENTADO'#39', '#39'PENSIONIST' +
        'A'#39') AS TIPO,'
      
        '       (SELECT NOME FROM BENEFICIO WHERE IDBENEFICIO = B.IDBENEF' +
        'ICIO) AS BENEFICIO,'
      '       DIB AS "DATA DO EVENTO",'
      '       DIB,'
      '       DIP,'
      '       (SELECT DIBBENEFANT'
      '          FROM BENEFBFCIARIO'
      '         WHERE IDTITULAR = B.IDTITULAR'
      '           AND IDPESSOA = B.IDPESSOA'
      '           AND IDBENEFICIO = B.IDBENEFICIO'
      '           AND ROWNUM = 1) AS DIBANT,'
      '       (SELECT TEMP.RMI'
      '          FROM (SELECT IDPESSOA, IDBENEFICIO, RMREAJ AS RMI'
      '                  FROM DETCONCINSS'
      
        '                 WHERE DTINICIOCRED = '#39'01'#39' || SUBSTR(DTINICIOCRE' +
        'D, 4, 7)'
      '                   AND DTFIMCRED ='
      '                       TO_DATE('#39'01/'#39' ||'
      
        '                               DECODE(SUBSTR(DTINICIOCRED, 4, 2)' +
        ','
      '                                      12,'
      '                                      '#39'01'#39','
      
        '                                      SUBSTR(DTINICIOCRED, 4, 2)' +
        ' + 1) || '#39'/'#39' ||'
      
        '                               DECODE(SUBSTR(DTINICIOCRED, 4, 2)' +
        ','
      '                                      12,'
      
        '                                      SUBSTR(DTINICIOCRED, 7, 4)' +
        ' + 1,'
      
        '                                      SUBSTR(DTINICIOCRED, 7, 4)' +
        ')) - 1'
      '                 ORDER BY IDPESSOA, DTINICIOCRED) TEMP'
      '         WHERE IDPESSOA = B.IDPESSOA'
      '           AND IDBENEFICIO = B.IDBENEFICIO'
      '           AND ROWNUM = 1) AS RMI,'
      '       (SELECT TEMP.DTINICIOCRED'
      
        '          FROM (SELECT IDPESSOA, IDBENEFICIO,DTINICIOCRED, RMREA' +
        'J AS RMI'
      '                  FROM DETCONCINSS'
      
        '                 WHERE DTINICIOCRED = '#39'01'#39' || SUBSTR(DTINICIOCRE' +
        'D, 4, 7)'
      '                   AND DTFIMCRED ='
      '                       TO_DATE('#39'01/'#39' ||'
      
        '                               DECODE(SUBSTR(DTINICIOCRED, 4, 2)' +
        ','
      '                                      12,'
      '                                      '#39'01'#39','
      
        '                                      SUBSTR(DTINICIOCRED, 4, 2)' +
        ' + 1) || '#39'/'#39' ||'
      
        '                               DECODE(SUBSTR(DTINICIOCRED, 4, 2)' +
        ','
      '                                      12,'
      
        '                                      SUBSTR(DTINICIOCRED, 7, 4)' +
        ' + 1,'
      
        '                                      SUBSTR(DTINICIOCRED, 7, 4)' +
        ')) - 1'
      '                 ORDER BY IDPESSOA, DTINICIOCRED) TEMP'
      '         WHERE IDPESSOA = B.IDPESSOA'
      '           AND IDBENEFICIO = B.IDBENEFICIO'
      '           AND ROWNUM = 1) AS DTINICIOCRED,'
      
        '       (DECODE(B.FLGREQUERIMENTO, 0, '#39'NAO'#39', 1, '#39'SIM'#39', '#39'NAO'#39')) AS' +
        ' BENEFREQ,'
      
        '       (SELECT CODBENEFICIO FROM BENEFICIO WHERE IDBENEFICIO = B' +
        '.IDBENEFICIO) AS ESPECIE,'
      
        '       (DECODE((SELECT CODBENEFICIO FROM BENEFICIO WHERE IDBENEF' +
        'ICIO = B.IDBENEFICIO),92,'#39'SIM'#39','#39'NAO'#39')) AS ISENTOIRRF,'
      '       DATAREQUERIMENTO,'
      '       NUMBENEFICIO,'
      
        '       (SELECT DECODE(FLGMOLESTIAGRAVE, 0, '#39'NAO'#39', 1, '#39'SIM'#39', '#39'NAO' +
        #39')'
      '          FROM PESSOAFISICA'
      '         WHERE IDPESSOA = B.IDPESSOA'
      '           AND ROWNUM = 1) AS MOLESTIA,'
      '       (SELECT DATAMOLESTIAGRAVE'
      '          FROM PESSOAFISICA'
      '         WHERE IDPESSOA = B.IDPESSOA) AS DATAINICIO,'
      
        '       (SELECT DATAFIMMOLESTIA FROM PESSOAFISICA WHERE IDPESSOA ' +
        '= B.IDPESSOA) AS DATAFIM'
      '  FROM BENEFHABILITA B,       '
      '       (SELECT D.IDPESSOA,'
      '               D.IDTITULAR,'
      '               P.NOME,'
      '               P.NUMDOCUMENTO,'
      '               PF.DATANASC,'
      '               EL.IDSITFUNC,'
      '               EL.IDPESSJUR,'
      
        '               DECODE(D.MATRICULA, DT.MATRICULA, '#39#39', D.MATRICULA' +
        ') MATRICULADEP,'
      '               DT.MATRICULA AS MATRICULATITULAR,'
      '               (SELECT NVL(BF.IDPLANOPREV, PP.IDPLANOPREV)'
      '                  FROM PARTPREVPLAN PP'
      '                  LEFT JOIN BENEFBFCIARIO BF'
      '                    ON PP.IDPESSOA = BF.IDTITULAR'
      '                      --      AND BF.IDPESSOA = 386679'
      '                   AND BF.IDTPPAGTOBENEFIC = 1'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 1'
      '                   AND (BF.IDPLANPREVCONTAB = 28 OR'
      '                       (BF.IDPLANPREVCONTAB <> 28 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM BENEFBFCIARIO BF1'
      '                           WHERE BF1.IDTPPAGTOBENEFIC = 1'
      '                             AND BF1.FONTEPAGADORA = 1'
      '                             AND BF1.IDPLANPREVCONTAB = 28'
      '                             AND BF1.IDSITBENEFICIO = 1'
      '                             AND BF1.IDTITULAR = BF.IDTITULAR'
      '                             AND BF1.IDPESSOA = BF.IDPESSOA)))'
      '                 WHERE PP.IDPESSOA = D.IDTITULAR'
      
        '                   AND (PP.IDSITPLANOPREV IN (25, 26, 27, 28, 29' +
        ') OR'
      
        '                       (PP.IDSITPLANOPREV NOT IN (25, 26, 27, 28' +
        ', 29) AND'
      '                       PP.FLGDESATIVADO = 0 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM PARTPREVPLAN PPP1'
      '                           WHERE PPP1.IDPESSOA = PP.IDPESSOA'
      
        '                             AND PPP1.IDSITPLANOPREV IN (25, 26,' +
        ' 27, 28, 29))))'
      '                   AND ROWNUM = 1) IDPLANOPREV,'
      '               '
      '               (SELECT IDSITPART'
      '                  FROM PARTPREVPLAN PP'
      '                  LEFT JOIN BENEFBFCIARIO BF'
      '                    ON PP.IDPESSOA = BF.IDTITULAR'
      '                      --       AND BF.IDPESSOA = 386679'
      '                   AND BF.IDTPPAGTOBENEFIC = 1'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 1'
      '                   AND (BF.IDPLANPREVCONTAB = 28 OR'
      '                       (BF.IDPLANPREVCONTAB <> 28 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM BENEFBFCIARIO BF1--A'
      '                           WHERE BF1.IDTPPAGTOBENEFIC = 1'
      '                             AND BF1.FONTEPAGADORA = 1'
      '                             AND BF1.IDPLANPREVCONTAB = 28'
      '                             AND BF1.IDSITBENEFICIO = 1'
      '                             AND BF1.IDTITULAR = BF.IDTITULAR'
      '                             AND BF1.IDPESSOA = BF.IDPESSOA)))'
      '                 WHERE PP.IDPESSOA = D.IDTITULAR'
      
        '                   AND (PP.IDSITPLANOPREV IN (25, 26, 27, 28, 29' +
        ') OR'
      
        '                       (PP.IDSITPLANOPREV NOT IN (25, 26, 27, 28' +
        ', 29) AND'
      '                       PP.FLGDESATIVADO = 0 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM PARTPREVPLAN PPP1'
      '                           WHERE PPP1.IDPESSOA = PP.IDPESSOA'
      
        '                             AND PPP1.IDSITPLANOPREV IN (25, 26,' +
        ' 27, 28, 29))))'
      '                   AND ROWNUM = 1) IDSITPART,'
      '               '
      '               (SELECT IDSITPLANOPREV'
      '                  FROM PARTPREVPLAN PP'
      '                  LEFT JOIN BENEFBFCIARIO BF'
      '                    ON PP.IDPESSOA = BF.IDTITULAR'
      '                      --   AND BF.IDPESSOA = 386679'
      '                   AND BF.IDTPPAGTOBENEFIC = 1'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 1'
      '                   AND (BF.IDPLANPREVCONTAB = 28 OR'
      '                       (BF.IDPLANPREVCONTAB <> 28 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM BENEFBFCIARIO BF1'
      '                           WHERE BF1.IDTPPAGTOBENEFIC = 1'
      '                             AND BF1.FONTEPAGADORA = 1'
      '                             AND BF1.IDPLANPREVCONTAB = 28'
      '                             AND BF1.IDSITBENEFICIO = 1'
      '                             AND BF1.IDTITULAR = BF.IDTITULAR'
      '                             AND BF1.IDPESSOA = BF.IDPESSOA)))'
      '                 WHERE PP.IDPESSOA = D.IDTITULAR'
      
        '                   AND (PP.IDSITPLANOPREV IN (25, 26, 27, 28, 29' +
        ') OR'
      
        '                       (PP.IDSITPLANOPREV NOT IN (25, 26, 27, 28' +
        ', 29) AND'
      '                       PP.FLGDESATIVADO = 0 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM PARTPREVPLAN PPP1'
      '                           WHERE PPP1.IDPESSOA = PP.IDPESSOA'
      
        '                             AND PPP1.IDSITPLANOPREV IN (25, 26,' +
        ' 27, 28, 29))))'
      '                   AND ROWNUM = 1) IDSITPLANOPREV,'
      '               '
      '               (SELECT PP.SEQPROPOSTA'
      '                  FROM PARTPREVPLAN PP'
      '                  LEFT JOIN BENEFBFCIARIO BF'
      '                    ON PP.IDPESSOA = BF.IDTITULAR'
      '                      --      AND BF.IDPESSOA = 386679'
      '                   AND BF.IDTPPAGTOBENEFIC = 1'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 1'
      '                   AND (BF.IDPLANPREVCONTAB = 28 OR'
      '                       (BF.IDPLANPREVCONTAB <> 28 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM BENEFBFCIARIO BF1'
      '                           WHERE BF1.IDTPPAGTOBENEFIC = 1'
      '                             AND BF1.FONTEPAGADORA = 1'
      '                             AND BF1.IDPLANPREVCONTAB = 28'
      '                             AND BF1.IDSITBENEFICIO = 1'
      '                             AND BF1.IDTITULAR = BF.IDTITULAR'
      '                             AND BF1.IDPESSOA = BF.IDPESSOA)))'
      '                 WHERE PP.IDPESSOA = D.IDTITULAR'
      
        '                   AND (PP.IDSITPLANOPREV IN (25, 26, 27, 28, 29' +
        ') OR'
      
        '                       (PP.IDSITPLANOPREV NOT IN (25, 26, 27, 28' +
        ', 29) AND'
      '                       PP.FLGDESATIVADO = 0 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM PARTPREVPLAN PPP1'
      '                           WHERE PPP1.IDPESSOA = PP.IDPESSOA'
      
        '                             AND PPP1.IDSITPLANOPREV IN (25, 26,' +
        ' 27, 28, 29))))'
      '                   AND ROWNUM = 1) SEQPROPOSTA,'
      '               '
      '               (SELECT PP.INSCRICAONUMERO'
      '                  FROM PARTPREVPLAN PP'
      '                  LEFT JOIN BENEFBFCIARIO BF'
      '                    ON PP.IDPESSOA = BF.IDTITULAR'
      '                      --       AND BF.IDPESSOA = 386679'
      '                   AND BF.IDTPPAGTOBENEFIC = 1'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 1'
      '                   AND (BF.IDPLANPREVCONTAB = 28 OR'
      '                       (BF.IDPLANPREVCONTAB <> 28 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM BENEFBFCIARIO BF1'
      '                           WHERE BF1.IDTPPAGTOBENEFIC = 1'
      '                             AND BF1.FONTEPAGADORA = 1'
      '                             AND BF1.IDPLANPREVCONTAB = 28'
      '                             AND BF1.IDSITBENEFICIO = 1'
      '                             AND BF1.IDTITULAR = BF.IDTITULAR'
      '                             AND BF1.IDPESSOA = BF.IDPESSOA)))'
      '                 WHERE PP.IDPESSOA = D.IDTITULAR'
      
        '                   AND (PP.IDSITPLANOPREV IN (25, 26, 27, 28, 29' +
        ') OR'
      
        '                       (PP.IDSITPLANOPREV NOT IN (25, 26, 27, 28' +
        ', 29) AND'
      '                       PP.FLGDESATIVADO = 0 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM PARTPREVPLAN PPP1'
      '                           WHERE PPP1.IDPESSOA = PP.IDPESSOA'
      
        '                             AND PPP1.IDSITPLANOPREV IN (25, 26,' +
        ' 27, 28, 29))))'
      '                   AND ROWNUM = 1) INSCRICAONUMERO'
      '        '
      '          FROM DEPENTIT D'
      '          JOIN PESSOA P'
      '            ON D.IDPESSOA = P.IDPESSOA'
      '          JOIN PESSOAFISICA PF'
      '            ON D.IDPESSOA = PF.IDPESSOA'
      '          JOIN DEPENTIT DT'
      '            ON D.IDTITULAR = DT.IDPESSOA'
      '           AND D.IDTITULAR = DT.IDTITULAR'
      '          JOIN ELEGPATRO EL'
      '            ON EL.IDPESSOA = D.IDPESSOA'
      '        -- WHERE D.IDPESSOA = B.IDPESSOA'
      '        --   AND D.IDTITULAR = B.IDTITULAR) TEMP'
      '        ) TEMP'
      ''
      ' WHERE TEMP.IDPESSOA = B.IDPESSOA'
      '   AND TEMP.IDTITULAR = B.IDTITULAR'
      '   AND B.FLGREQUERIMENTO = 1'
      '   AND B.FLGCONCESSAO = 1'
      '   AND B.IDTITULAR = B.IDPESSOA ---TRAVA'
      '      --  AND B.IDPESSOA = 386679')
    ClientDataSet = CdsReciboCedidos
    Left = 672
    Top = 414
  end
  object qryDETCONCINSS: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 281
    Top = 298
  end
  object qryRubricaxInss: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 345
    Top = 354
  end
  object qryAux3: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 241
    Top = 274
  end
  object qryAux4: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 289
    Top = 282
  end
  object arPreview: TppArchiveReader
    AllowPrintToFile = True
    DeviceType = 'Screen'
    SuppressOutline = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 221
    Top = 282
    Version = '7.04'
  end
  object QExport3PDF1: TQExport3PDF
    About = '(Sobre - Planus - Exportação de Dados)'
    _Version = '3.36'
    Options.PageOptions.MarginLeft = 1.17
    Options.PageOptions.MarginRight = 0.57
    Options.PageOptions.MarginTop = 0.78
    Options.PageOptions.MarginBottom = 0.78
    Left = 597
    Top = 401
  end
  object qeCustomSource1: TqeCustomSource
    Columns = <>
    Left = 501
    Top = 401
  end
  object ExtraOptions1: TExtraOptions
    About = 'TExtraDevices 3.00'
    HTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    HTML.BackLink = '&lt&lt'
    HTML.ForwardLink = '&gt&gt'
    HTML.ShowLinks = True
    HTML.UseTextFileName = False
    HTML.ZoomableImages = False
    HTML.Visible = True
    HTML.PixelFormat = pf8bit
    HTML.SingleFileOutput = False
    XHTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    XHTML.BackLink = '&lt&lt'
    XHTML.ForwardLink = '&gt&gt'
    XHTML.ShowLinks = True
    XHTML.UseTextFileName = False
    XHTML.ZoomableImages = False
    XHTML.Visible = True
    XHTML.PixelFormat = pf8bit
    XHTML.SingleFileOutput = False
    RTF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    RTF.Visible = True
    RTF.RichTextAsImage = False
    RTF.UseTextBox = True
    RTF.PixelFormat = pf8bit
    RTF.PixelsPerInch = 96
    Lotus.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Lotus.Visible = True
    Lotus.ColSpacing = 16934
    Quattro.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Quattro.Visible = True
    Quattro.ColSpacing = 16934
    Excel.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Excel.Visible = True
    Excel.ColSpacing = 16934
    Excel.RowSizing = False
    Excel.AutoConvertToNumber = True
    Graphic.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Graphic.PixelFormat = pf8bit
    Graphic.UseTextFileName = False
    Graphic.Visible = True
    Graphic.PixelsPerInch = 96
    Graphic.GrayScale = False
    PDF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    PDF.FastCompression = False
    PDF.CompressImages = True
    PDF.ScaleImages = True
    PDF.Visible = True
    PDF.RichTextAsImage = False
    PDF.RichEditPixelFormat = pf1bit
    PDF.PixelFormat = pf24bit
    PDF.PixelsPerInch = 96
    PDF.Permissions = [ppPrint, ppModify, ppCopy, ppModifyAnnot]
    PDF.ViewerPreferences = []
    PDF.AutoEmbedFonts = True
    PDF.ImageFormat = riBitmap
    DotMatrix.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    DotMatrix.Visible = True
    DotMatrix.CharsPerInch = cs10CPI
    DotMatrix.LinesPerInch = ls6LPI
    DotMatrix.Port = 'LPT1'
    DotMatrix.ContinousPaper = False
    DotMatrix.PrinterType = ptEpson
    Left = 389
    Top = 145
  end
  object qryDetRel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 329
    Top = 274
    object qryDetRelSELECIONADO: TStringField
      DisplayLabel = 'S'
      DisplayWidth = 1
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qryDetRelNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object qryDetRelNUMBENEFICIO: TStringField
      DisplayLabel = 'Número Benefício'
      DisplayWidth = 15
      FieldName = 'NUMBENEFICIO'
      Size = 15
    end
    object qryDetRelESPECIE: TStringField
      DisplayLabel = 'Espécie'
      DisplayWidth = 6
      FieldName = 'ESPECIE'
      Size = 6
    end
    object qryDetRelBENEFICIO: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 60
      FieldName = 'BENEFICIO'
      Size = 60
    end
    object qryDetRelRMI: TFloatField
      DisplayWidth = 10
      FieldName = 'RMI'
    end
    object qryDetRelDatadoEvento: TDateTimeField
      DisplayWidth = 18
      FieldName = 'Data do Evento'
    end
    object qryDetRelDIB: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DIB'
    end
    object qryDetRelDIP: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DIP'
    end
    object qryDetRelDIBANT: TDateTimeField
      DisplayLabel = 'DIB Anterior'
      DisplayWidth = 18
      FieldName = 'DIBANT'
    end
    object qryDetRelDATAREQUERIMENTO: TDateTimeField
      DisplayLabel = 'Data de Requerimento'
      DisplayWidth = 18
      FieldName = 'DATAREQUERIMENTO'
    end
    object qryDetRelMOLESTIA: TStringField
      DisplayLabel = 'Moléstia'
      DisplayWidth = 3
      FieldName = 'MOLESTIA'
      Size = 3
    end
    object qryDetRelDATAINICIO: TDateTimeField
      DisplayLabel = 'Data Início'
      DisplayWidth = 18
      FieldName = 'DATAINICIO'
    end
    object qryDetRelDATAFIM: TDateTimeField
      DisplayLabel = 'Data Fim'
      DisplayWidth = 18
      FieldName = 'DATAFIM'
    end
    object qryDetRelBENEFREQ: TStringField
      DisplayLabel = 'Benefício Requerido'
      DisplayWidth = 3
      FieldName = 'BENEFREQ'
      Size = 3
    end
    object qryDetRelIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetRelIDTITULAR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryDetRelDATAMORTE: TDateTimeField
      FieldName = 'DATAMORTE'
      Visible = False
    end
    object qryDetRelIDSITPART: TFloatField
      FieldName = 'IDSITPART'
      Visible = False
    end
    object qryDetRelIDSITFUNC: TFloatField
      FieldName = 'IDSITFUNC'
      Visible = False
    end
    object qryDetRelIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryDetRelIDSITPLANOPREV: TFloatField
      FieldName = 'IDSITPLANOPREV'
      Visible = False
    end
    object qryDetRelINSCNUMERO: TFloatField
      FieldName = 'INSCNUMERO'
      Visible = False
    end
    object qryDetRelSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
    object qryDetRelIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryDetRelTIPO: TStringField
      FieldName = 'TIPO'
      Visible = False
      Size = 11
    end
    object qryDetRelIDBENEFHABILITA: TFloatField
      FieldName = 'IDBENEFHABILITA'
      Visible = False
    end
    object qryDetRelIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Visible = False
    end
    object qryDetReleventogerador: TFloatField
      FieldName = 'eventogerador'
      Visible = False
    end
    object qryDetRelnumeroprocesso: TFloatField
      FieldName = 'numeroprocesso'
      Visible = False
    end
    object qryDetRelISENTOIRRF: TStringField
      FieldName = 'ISENTOIRRF'
      Visible = False
      Size = 3
    end
    object qryDetRelFLGREQUERIMENTO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'FLGREQUERIMENTO'
      Visible = False
      Calculated = True
    end
    object qryDetRelIdplanprevcontab: TFloatField
      FieldName = 'Idplanprevcontab'
    end
    object qryDetRelMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 15
      FieldName = 'MATRICULA'
      Size = 15
    end
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    AfterOpen = qryDetAfterOpen
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM (SELECT '#39'S'#39' AS SELECIONADO,'
      '       EL.MATRICULA,'
      '       pp.nome PLANO,'
      '       MAX(HS1.DATAALIMENTACAO) DATA_ULTIMO_RESGATE,'
      '       CASE'
      '         WHEN RS.IDPLANOPREV = 74 THEN'
      
        '               (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-H' +
        'S.VLRCOTAS))'
      '                FROM HISTMOVRESERVA HS'
      '                WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND'
      '                      EL.IDPESSOA = HS.IDPESSOA AND'
      '                      EL.IDPESSJUR = HS.IDPESSJUR AND'
      '                      HS.IDTIPORESERVA IN (100,110,111))'
      '         WHEN RS.IDPLANOPREV = 66 THEN'
      
        '               (SELECT SUM(((DECODE(H1.FLGENTRADA, 1, H1.VLRCOTA' +
        'S, -H1.VLRCOTAS)) * CC.COTVALOR) *'
      '                     (CASE'
      
        '                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365' +
        '.25), 0) >= 10 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN'
      '                            5'
      
        '                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365' +
        '.25), 0) BETWEEN 11 AND 15 AND H1.IDTIPORESERVA IN (62,33,59,60,' +
        '61,170) THEN'
      '                            10'
      
        '                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365' +
        '.25), 0) BETWEEN 16 AND 20 AND H1.IDTIPORESERVA IN (62,33,59,60,' +
        '61,170) THEN'
      '                            15'
      
        '                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365' +
        '.25), 0) >= 21 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN'
      '                            20'
      '                       ELSE'
      '                            100 END/100)) AS VALOR_RESGATAVEL'
      '                FROM HISTMOVRESERVA H1'
      
        '                     JOIN RESERVAXPLANO TP ON H1.IDPLANOPREV = T' +
        'P.IDPLANOPREV'
      
        '                                          AND H1.IDTIPORESERVA =' +
        ' TP.IDTIPORESERVA'
      
        '                     JOIN PARTPREVPLAN PP ON H1.IDPESSOA = PP.ID' +
        'PESSOA'
      
        '                                         AND H1.IDPESSJUR = PP.I' +
        'DPESSJUR'
      
        '                     JOIN COTACAOMOEDA CC ON CC.MOECODIGO = TP.I' +
        'NDICEREAJUSTE'
      '                WHERE PP.IDPLANOPREV = H1.IDPLANOPREV AND'
      '                      NVL(TP.FLGCONTROLE, 0) <> 1 AND'
      '                      NOT EXISTS (SELECT 1'
      '                                  FROM PARTPREVPLAN PPP'
      
        '                                  WHERE PPP.IDPESSOA = H1.IDPESS' +
        'OA AND'
      '                                        PPP.IDPLANOPREV = 2 AND'
      
        '                                        PPP.IDSITPLANOPREV = 1) ' +
        'AND'
      '                      H1.SEQPROPOSTA = 1 AND'
      '                      TP.ANALITICOSINTETI = '#39'A'#39' AND'
      '                      TP.FLGCONTROLE = 0 AND'
      '                      TP.FLGCOLETIVA = 0 AND'
      '                      H1.IDPLANOPREV = RS.IDPLANOPREV AND'
      
        '                      H1.IDTIPORESERVA NOT IN (62,33,59,60,61,17' +
        '0) AND'
      
        '                      SUBSTR(TP.CODHIERARQUIA, 1, 2) IN ('#39'11'#39', '#39 +
        '12'#39') AND'
      '                      CC.COTDATA = (SELECT MAX(COTDATA)'
      '                                    FROM COTACAOMOEDA CM'
      
        '                                    WHERE CM.MOECODIGO = CC.MOEC' +
        'ODIGO) AND'
      '                      H1.IDPESSOA = EL.IDPESSOA)'
      '         ELSE'
      '               0'
      '       END AS SUBCONTA_EMPREGADO,'
      '       CASE'
      '         WHEN RS.IDPLANOPREV = 74 THEN'
      
        '               (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-H' +
        'S.VLRCOTAS))'
      '                FROM HISTMOVRESERVA HS'
      '                WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND'
      '                      EL.IDPESSOA = HS.IDPESSOA AND'
      '                      EL.IDPESSJUR = HS.IDPESSJUR AND'
      '                      HS.IDTIPORESERVA IN (101))'
      '         WHEN RS.IDPLANOPREV = 66 THEN'
      
        '               (SELECT SUM(((DECODE(H1.FLGENTRADA, 1, H1.VLRCOTA' +
        'S, -H1.VLRCOTAS)) * CC.COTVALOR) *'
      '                     (CASE'
      
        '                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365' +
        '.25), 0) >= 10 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN'
      '                            5'
      
        '                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365' +
        '.25), 0) BETWEEN 11 AND 15 AND H1.IDTIPORESERVA IN (62,33,59,60,' +
        '61,170) THEN'
      '                            10'
      
        '                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365' +
        '.25), 0) BETWEEN 16 AND 20 AND H1.IDTIPORESERVA IN (62,33,59,60,' +
        '61,170) THEN'
      '                            15'
      
        '                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365' +
        '.25), 0) >= 21 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN'
      '                            20'
      '                       ELSE'
      '                            100 END/100)) AS VALOR_RESGATAVEL'
      '                FROM HISTMOVRESERVA H1'
      
        '                     JOIN RESERVAXPLANO TP ON H1.IDPLANOPREV = T' +
        'P.IDPLANOPREV'
      
        '                                          AND H1.IDTIPORESERVA =' +
        ' TP.IDTIPORESERVA'
      
        '                     JOIN PARTPREVPLAN PP ON H1.IDPESSOA = PP.ID' +
        'PESSOA'
      
        '                                         AND H1.IDPESSJUR = PP.I' +
        'DPESSJUR'
      
        '                     JOIN COTACAOMOEDA CC ON CC.MOECODIGO = TP.I' +
        'NDICEREAJUSTE'
      '                WHERE PP.IDPLANOPREV = H1.IDPLANOPREV AND'
      '                      NVL(TP.FLGCONTROLE, 0) <> 1 AND'
      '                      NOT EXISTS (SELECT 1'
      '                                  FROM PARTPREVPLAN PPP'
      
        '                                  WHERE PPP.IDPESSOA = H1.IDPESS' +
        'OA AND'
      '                                        PPP.IDPLANOPREV = 2 AND'
      
        '                                        PPP.IDSITPLANOPREV = 1) ' +
        'AND'
      '                      H1.SEQPROPOSTA = 1 AND'
      '                      TP.ANALITICOSINTETI = '#39'A'#39' AND'
      '                      TP.FLGCONTROLE = 0 AND'
      '                      TP.FLGCOLETIVA = 0 AND'
      '                      H1.IDPLANOPREV = RS.IDPLANOPREV AND'
      
        '                      H1.IDTIPORESERVA NOT IN (62,33,59,60,61,17' +
        '0) AND'
      
        '                      SUBSTR(TP.CODHIERARQUIA, 1, 2) IN ('#39'11'#39', '#39 +
        '12'#39') AND'
      '                      CC.COTDATA = (SELECT MAX(COTDATA)'
      '                                    FROM COTACAOMOEDA CM'
      
        '                                    WHERE CM.MOECODIGO = CC.MOEC' +
        'ODIGO) AND'
      '                      H1.IDPESSOA = EL.IDPESSOA)'
      '         ELSE'
      '               0'
      '       END AS SUBCONTA_PATROCINADOR,'
      '       CASE'
      '         WHEN RS.IDPLANOPREV = 74 THEN'
      
        '           (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VL' +
        'RCOTAS))'
      '            FROM HISTMOVRESERVA HS'
      '            WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND'
      '                  EL.IDPESSOA = HS.IDPESSOA AND'
      '                  EL.IDPESSJUR = HS.IDPESSJUR AND'
      '                  HS.IDTIPORESERVA IN (100,101,110,111))'
      '         WHEN RS.IDPLANOPREV = 66 THEN'
      
        '               (SELECT SUM(((DECODE(H1.FLGENTRADA, 1, H1.VLRCOTA' +
        'S, -H1.VLRCOTAS)) * CC.COTVALOR) *'
      '                     (CASE'
      
        '                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365' +
        '.25), 0) >= 10 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN'
      '                            5'
      
        '                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365' +
        '.25), 0) BETWEEN 11 AND 15 AND H1.IDTIPORESERVA IN (62,33,59,60,' +
        '61,170) THEN'
      '                            10'
      
        '                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365' +
        '.25), 0) BETWEEN 16 AND 20 AND H1.IDTIPORESERVA IN (62,33,59,60,' +
        '61,170) THEN'
      '                            15'
      
        '                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365' +
        '.25), 0) >= 21 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN'
      '                            20'
      '                       ELSE'
      '                            100 END/100)) AS VALOR_RESGATAVEL'
      '                FROM HISTMOVRESERVA H1'
      
        '                     JOIN RESERVAXPLANO TP ON H1.IDPLANOPREV = T' +
        'P.IDPLANOPREV'
      
        '                                          AND H1.IDTIPORESERVA =' +
        ' TP.IDTIPORESERVA'
      
        '                     JOIN PARTPREVPLAN PP ON H1.IDPESSOA = PP.ID' +
        'PESSOA'
      
        '                                         AND H1.IDPESSJUR = PP.I' +
        'DPESSJUR'
      
        '                     JOIN COTACAOMOEDA CC ON CC.MOECODIGO = TP.I' +
        'NDICEREAJUSTE'
      '                WHERE PP.IDPLANOPREV = H1.IDPLANOPREV AND'
      '                      NVL(TP.FLGCONTROLE, 0) <> 1 AND'
      '                      NOT EXISTS (SELECT 1'
      '                                  FROM PARTPREVPLAN PPP'
      
        '                                  WHERE PPP.IDPESSOA = H1.IDPESS' +
        'OA AND'
      '                                        PPP.IDPLANOPREV = 2 AND'
      
        '                                        PPP.IDSITPLANOPREV = 1) ' +
        'AND'
      '                      H1.SEQPROPOSTA = 1 AND'
      '                      TP.ANALITICOSINTETI = '#39'A'#39' AND'
      '                      TP.FLGCONTROLE = 0 AND'
      '                      TP.FLGCOLETIVA = 0 AND'
      '                      H1.IDPLANOPREV = RS.IDPLANOPREV AND'
      
        '                      H1.IDTIPORESERVA NOT IN (62,33,59,60,61,17' +
        '0) AND'
      
        '                      SUBSTR(TP.CODHIERARQUIA, 1, 2) IN ('#39'11'#39', '#39 +
        '12'#39') AND'
      '                      CC.COTDATA = (SELECT MAX(COTDATA)'
      '                                    FROM COTACAOMOEDA CM'
      
        '                                    WHERE CM.MOECODIGO = CC.MOEC' +
        'ODIGO) AND'
      '                      H1.IDPESSOA = EL.IDPESSOA)'
      '         ELSE'
      '               0'
      '       END AS SALDO_CONTA_TOTAL,'
      'EL.IDPESSOA ,'
      'RS.IDPLANOPREV,EL.IDPESSJUR, '
      'BF.DATAFINAL ,'
      'BF.NUMEROPROCESSO,'
      
        'DECODE(NVL(PPP.TIPOOPCAOIR,0),0,'#39'Sem Opção'#39',1,'#39'Progressiva'#39',2,'#39'R' +
        'egressiva'#39') TIPO_OPCAO_IR,'
      'BF.VALORATUAL, BF.VALORTOTAL, BF.IDEVENTOSPREV'
      
        ',RS.IDTIPORESERVA, BF.IDTITULAR, 0.00 AS VLR_IRREGR, PPP.TIPOOPC' +
        'AOIR, PB.SEQRESGATE, PE.NOME  /*SIG20491*/'
      ' FROM BENEFBFCIARIO BF'
      '     JOIN ELEGPATRO EL ON EL.IDPESSOA = BF.IDPESSOA'
      '     JOIN PESSOA PE ON PE.IDPESSOA = EL.IDPESSOA'
      '     JOIN RESERVAPART RS ON EL.IDPESSOA = RS.IDPESSOA'
      '                        AND EL.IDPESSJUR = RS.IDPESSJUR'
      '                        AND BF.IDPESSJUR = RS.IDPESSJUR'
      '                        AND BF.IDPLANOPREV = RS.IDPLANOPREV'
      '     JOIN PARTPREVPLAN PPP ON EL.IDPESSOA = PPP.IDPESSOA AND'
      '                              RS.IDPLANOPREV = PPP.IDPLANOPREV'
      '     JOIN Planprev pp ON rs.idplanoprev = pp.idplanoprev'
      '     JOIN HISTMOVRESERVA HS1 ON EL.IDPESSOA = HS1.IDPESSOA'
      '                            AND EL.IDPESSJUR = HS1.IDPESSJUR'
      '                            AND RS.IDPLANOPREV = HS1.IDPLANOPREV'
      
        '                            AND RS.IDTIPORESERVA = HS1.IDTIPORES' +
        'ERVA'
      
        '     JOIN PROCESSOBENF PB ON PB.NUMEROPROCESSO = BF.NUMEROPROCES' +
        'SO'
      'WHERE RS.IDTIPORESERVA IN (100,101,110,111,--NOVO PLANO'
      
        '                           51,52,53,55,59,60,61,62,79,117,134,16' +
        '7,170)--REB'
      
        '  AND HS1.IDBENEFICIO IN (231,323,526,277,418,458,523,378,524,47' +
        '8,510,528,516,493) '
      '  AND RS.IDPLANOPREV IN (66,74)'
      '  AND BF.IDBENEFICIO = 418'
      '  AND BF.IDSITBENEFICIO = 1'
      '  AND BF.IDEVENTOSPREV IS NOT NULL'
      
        'GROUP BY EL.MATRICULA, pp.nome, RS.IDPLANOPREV, EL.IDPESSJUR, EL' +
        '.IDPESSOA,PPP.TIPOOPCAOIR,BF.DATAFINAL,BF.NUMEROPROCESSO,'
      '         BF.VALORATUAL, BF.VALORTOTAL, BF.IDEVENTOSPREV'
      
        '        ,RS.IDTIPORESERVA,BF.IDTITULAR, PB.SEQRESGATE, PE.NOME  ' +
        ' --SIG20491'
      'ORDER BY EL.MATRICULA,EL.IDPESSOA) temp'
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 337
    Top = 194
    object qryDetSELECIONADO: TStringField
      DisplayLabel = 'S'
      DisplayWidth = 1
      FieldName = 'SELECIONADO'
      Size = 1
    end
    object qryDetMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 15
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryDetDATA_ULTIMO_RESGATE: TDateTimeField
      DisplayLabel = 'Data Último Resgate'
      DisplayWidth = 18
      FieldName = 'DATA_ULTIMO_RESGATE'
    end
    object qryDetSALDO_CONTA_TOTAL: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 27
      FieldName = 'SALDO_CONTA_TOTAL'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object qryDetTIPO_OPCAO_IR: TStringField
      DisplayLabel = 'Tipo Opção IR'
      DisplayWidth = 11
      FieldName = 'TIPO_OPCAO_IR'
      Size = 11
    end
    object qryDetNUMEROPROCESSO: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMEROPROCESSO'
    end
    object qryDetVALORATUAL: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORATUAL'
    end
    object qryDetVALORTOTAL: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORTOTAL'
    end
    object qryDetIDEVENTOSPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEVENTOSPREV'
      Visible = False
    end
    object qryDetPLANO: TStringField
      FieldName = 'PLANO'
      Visible = False
      Size = 50
    end
    object qryDetSUBCONTA_EMPREGADO: TFloatField
      FieldName = 'SUBCONTA_EMPREGADO'
      Visible = False
    end
    object qryDetSUBCONTA_PATROCINADOR: TFloatField
      FieldName = 'SUBCONTA_PATROCINADOR'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryDetIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryDetDATAFINAL: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAFINAL'
      Visible = False
    end
    object qryDetDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Visible = False
    end
    object qryDetIDTITULAR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryDetTIPOOPCAOIR: TFloatField
      DisplayWidth = 10
      FieldName = 'TIPOOPCAOIR'
      Visible = False
    end
    object qryDetVLR_IRREGR: TFloatField
      FieldName = 'VLR_IRREGR'
    end
    object qryDetSEQRESGATE: TFloatField
      DisplayWidth = 10
      FieldName = 'SEQRESGATE'
      Visible = False
    end
    object qryDetNOME: TStringField
      FieldName = 'NOME'
      Visible = False
      Size = 50
    end
  end
  object qrydetconcaux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 161
    Top = 362
  end
  object qryDetalhe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      
        'select  '#39'                                                  '#39' mes' +
        'ano, '#39'                                                  '#39' mesref' +
        'erencia, '#39'                                                  '#39' me' +
        'sreembolso , 0 pagar, 0 descontar ,'#39'                            ' +
        '                     '#39' planocontabil'
      'from dual')
    UpdateObject = UpdDetalhe
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 617
    Top = 370
    object qryDetalhemesano: TStringField
      FieldName = 'mesano'
      Size = 15
    end
    object qryDetalhemesreferencia: TStringField
      FieldName = 'mesreferencia'
      Size = 50
    end
    object qryDetalhemesreembolso: TStringField
      FieldName = 'mesreembolso'
      Size = 50
    end
    object qryDetalhepagar: TFloatField
      FieldName = 'pagar'
    end
    object qryDetalhedescontar: TFloatField
      FieldName = 'descontar'
    end
    object qryDetalheplanocontabil: TStringField
      DisplayWidth = 50
      FieldName = 'planocontabil'
      Size = 50
    end
  end
  object dsDetalhe: TwwDataSource
    AutoEdit = False
    DataSet = qryDetalhe
    Left = 616
    Top = 328
  end
  object ppDetalhe: TppBDEPipeline
    DataSource = dsDetalhe
    UserName = 'Detalhe'
    Left = 613
    Top = 281
    object ppDetalheppField6: TppField
      FieldAlias = 'mesano'
      FieldName = 'mesano'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
    object ppDetalheppField1: TppField
      FieldAlias = 'mesreferencia'
      FieldName = 'mesreferencia'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDetalheppField2: TppField
      FieldAlias = 'mesreembolso'
      FieldName = 'mesreembolso'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDetalheppField3: TppField
      FieldAlias = 'pagar'
      FieldName = 'pagar'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDetalheppField4: TppField
      FieldAlias = 'descontar'
      FieldName = 'descontar'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDetalheppField5: TppField
      FieldAlias = 'planocontabil'
      FieldName = 'planocontabil'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object UpdDetalhe: TUpdateSQL
    Left = 618
    Top = 426
  end
  object qryDetalhe2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      
        'select  '#39'                                                  '#39' mes' +
        'ano, '#39'                                                  '#39' mesref' +
        'erencia, '#39'                                                  '#39' me' +
        'sreembolso , 0 pagar, 0 descontar ,'#39'                            ' +
        '                      '#39' planocontabil'
      'from dual')
    UpdateObject = UpdDetalhe2
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 545
    Top = 370
    object qryDetalhe2mesano: TStringField
      FieldName = 'mesano'
      Size = 15
    end
    object qryDetalhe2mesreferencia: TStringField
      FieldName = 'mesreferencia'
      Size = 50
    end
    object qryDetalhe2mesreembolso: TStringField
      FieldName = 'mesreembolso'
      Size = 50
    end
    object qryDetalhe2pagar: TFloatField
      FieldName = 'pagar'
    end
    object qryDetalhe2descontar: TFloatField
      FieldName = 'descontar'
    end
    object qryDetalhe2planocontabil: TStringField
      DisplayWidth = 50
      FieldName = 'planocontabil'
      Size = 50
    end
  end
  object dsDetalhe2: TwwDataSource
    AutoEdit = False
    DataSet = qryDetalhe2
    Left = 544
    Top = 328
  end
  object ppDetalhe2: TppBDEPipeline
    DataSource = dsDetalhe2
    UserName = 'ppDetalhe2'
    Left = 541
    Top = 281
    object ppField1: TppField
      FieldAlias = 'mesano'
      FieldName = 'mesano'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'mesreferencia'
      FieldName = 'mesreferencia'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppField3: TppField
      FieldAlias = 'mesreembolso'
      FieldName = 'mesreembolso'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppField4: TppField
      FieldAlias = 'pagar'
      FieldName = 'pagar'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppField5: TppField
      FieldAlias = 'descontar'
      FieldName = 'descontar'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppField6: TppField
      FieldAlias = 'planocontabil'
      FieldName = 'planocontabil'
      FieldLength = 50
      DisplayFormat = '50'
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object UpdDetalhe2: TUpdateSQL
    Left = 538
    Top = 426
  end
  object rpReciboCedidos: TppReport
    AutoStop = False
    DataPipeline = ppReciboCedidos
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'DEMONSTRATIVO DE REQUERIMENTOE BENEFÍCIOS DO INSS EM LOTE'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 4500
    PrinterSetup.mmMarginLeft = 4500
    PrinterSetup.mmMarginRight = 4500
    PrinterSetup.mmMarginTop = 4500
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 672
    Top = 220
    Version = '7.04'
    mmColumnWidth = 288000
    DataPipelineName = 'ppReciboCedidos'
    object ppDetailBand1: TppDetailBand
      Visible = False
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 114724
      mmPrintPosition = 0
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'memo'
        DataPipeline = ppReciboCedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppReciboCedidos'
        mmHeight = 113242
        mmLeft = 23495
        mmTop = 0
        mmWidth = 133615
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'matricula'
      DataPipeline = ppReciboCedidos
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppReciboCedidos'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 847
        mmPrintPosition = 0
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650611
        44657461696C4265666F72655072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F75726365069570726F63656475726520446574
        61696C4265666F72655072696E743B0D0A626567696E0D0A6966205265636962
        6F43656469646F732E6669656C64735B305D2E4173537472696E673D274E2720
        7468656E0D0A202064657461696C2E76697369626C653A3D66616C73650D0A65
        6C736520200D0A202064657461696C2E76697369626C653A3D747275653B0D0A
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060644657461696C0945
        76656E744E616D65060B4265666F72655072696E74074576656E744944021800
        00}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppReciboCedidos: TppBDEPipeline
    DataSource = dsReciboCedidos
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ReciboCedidos'
    Left = 680
    Top = 256
    object ppReciboCedidosppField1: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField2: TppField
      FieldAlias = 'MEMO'
      FieldName = 'MEMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  object dsReciboCedidos: TwwDataSource
    AutoEdit = False
    DataSet = qry_rel
    Left = 672
    Top = 304
  end
  object qry_rel: TwwQuery
    CachedUpdates = True
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM ('
      'SELECT '#39'             '#39'  MATRICULA,'
      '       CAST('#39'             '#39' AS VARCHAR2(3000)) MEMO FROM DUAL'
      ') T')
    UpdateObject = upd_rel
    ControlType.Strings = (
      'S;CheckBox;S;N')
    ValidateWithMask = True
    Left = 473
    Top = 90
  end
  object upd_rel: TUpdateSQL
    Left = 474
    Top = 146
  end
  object updPrazoAcumulacao: TUpdateSQL
    Left = 73
    Top = 449
  end
  object QryPMP: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        #39'                                                   '#39' as IDHSTCA' +
        'LCULOPMP,'
      
        #39'                                                   '#39' AS IDPLANO' +
        'PREV,'
      
        #39'                                                   '#39' AS MESREFE' +
        'RENCIA,'
      
        #39'                                                   '#39' AS FATORPE' +
        'RMANENCIA,'
      
        #39'                                                   '#39' AS PRAZOME' +
        'DIOPONDERADO,'
      
        #39'                                                   '#39' AS SALDOAC' +
        'UMULADO,'
      #39'                                                   '#39' AS QTDCOTA'
      'FROM DUAL')
    UpdateObject = UpdPmp
    ValidateWithMask = True
    Left = 104
    Top = 448
  end
  object UpdPmp: TUpdateSQL
    Left = 104
    Top = 480
  end
  object QryPrazoAcumulacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        #39'                                                             '#39' ' +
        'AS IDPRAZOACUM,'
      
        #39'                                                             '#39' ' +
        'AS IDPESSJUR,'
      
        #39'                                                             '#39' ' +
        'AS IDPESSOA,'
      
        #39'                                                             '#39' ' +
        'AS IDPLANOPREV,'
      
        #39'                                                             '#39' ' +
        'AS INDICE, '
      
        #39'                                                             '#39' ' +
        'AS DESCRICAOFAIXA,'
      
        #39'                                                             '#39' ' +
        ' AS PERCENTUALIR,'
      
        #39'                                                             '#39' ' +
        'AS VLRVALOR,'
      
        #39'                                                             '#39' ' +
        'AS VLRCOTA,'
      
        #39'                                                             '#39' ' +
        'AS IRRF'
      ''
      ''
      'FROM DUAL')
    UpdateObject = updPrazoAcumulacao
    ValidateWithMask = True
    Left = 72
    Top = 476
  end
  object QryPlanos: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PP.NOME, PP.IDPLANOPREV'
      '  FROM PLANPREV PP'
      ' WHERE PP.IDPLANOPREV IN (66,74)'
      'UNION '
      'SELECT '#39'TODOS'#39' AS NOME, 99 AS IDPLANOPREV FROM DUAL'
      'ORDER BY 1')
    Left = 84
    Top = 104
  end
  object dsPlanos: TDataSource
    DataSet = QryPlanos
    Left = 56
    Top = 104
  end
end
