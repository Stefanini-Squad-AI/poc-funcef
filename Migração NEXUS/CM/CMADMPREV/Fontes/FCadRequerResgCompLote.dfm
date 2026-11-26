inherited FrmCadRequerResgCompLote: TFrmCadRequerResgCompLote
  Left = 203
  Top = 71
  Caption = 'Requerimento de Resgate Complementar em Lote'
  ClientHeight = 651
  ClientWidth = 1102
  Scaled = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1102
    Height = 565
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 111
      Width = 1100
      Height = 453
      Enabled = False
      Tabs.Strings = (
        'Requerimento de Resgate Complementar em Lote'
        'LOG'
        'Imprimir')
      object SpeedButton1: TSpeedButton [0]
        Left = 64
        Top = 64
        Width = 23
        Height = 22
      end
      object pnl1: TPanel [1]
        Left = 4
        Top = 55
        Width = 1002
        Height = 394
        Align = alClient
        TabOrder = 4
        object grid_log: TwwDBGrid
          Left = 0
          Top = 0
          Width = 1238
          Height = 401
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
      object pnl_impressao: TPanel [2]
        Left = 4
        Top = 55
        Width = 1002
        Height = 394
        Align = alClient
        TabOrder = 3
        object rg_opcao_impressao: TRadioGroup
          Left = 417
          Top = 121
          Width = 472
          Height = 112
          Items.Strings = (
            'LOG'
            'Demonstrativo de Requerimento de Resgate Complementar em Lote')
          TabOrder = 0
        end
        object bt_imprimir: TButton
          Left = 608
          Top = 248
          Width = 75
          Height = 25
          Caption = 'Imprimir'
          TabOrder = 1
          OnClick = bt_imprimirClick
        end
      end
      inherited pgctrlDetalhe: TPageControl
        Width = 1002
        Height = 394
        inherited tbsDet: TTabSheet
          Caption = ''
          inherited pnlControlesDet: TPanel [0]
            Width = 994
            Height = 366
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
              OnClick = cb_validadoClick
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
            Width = 1257
            Height = 385
            ControlType.Strings = (
              'SELECIONADO;CheckBox;S;N')
            Selected.Strings = (
              'SELECIONADO'#9'1'#9'S'
              'MATRICULA'#9'13'#9'Matrícula'
              'PLANO'#9'23'#9'Nome'
              'DATA_ULTIMO_RESGATE'#9'18'#9'Data Último Resgate'
              'SUBCONTA_EMPREGADO'#9'10'#9'Sub Conta Empregado'
              'SUBCONTA_PATROCINADOR'#9'10'#9'Sub Conta Patrocinador'
              'SALDO_CONTA_TOTAL'#9'11'#9'Saldo'
              'TIPO_OPCAO_IR'#9'11'#9'Tipo Opção IR')
            Align = alNone
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
        Width = 1092
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Visible = False
          end
          inherited sbtnAltDet: TToolbarButton97
            Visible = False
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Visible = False
          end
          object sbtnConcedeUm: TToolbarButton97
            Left = 75
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Requerer'
            AllowAllUp = True
            GroupIndex = 2
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
              FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
              990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
              990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
              FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
              00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
              00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
              00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
              03FF33337FFF77777333333300000333333F3333777773333333}
            ImageIndex = 2
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnRequererClick
          end
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
          TabOrder = 1
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
          TabOrder = 2
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
      end
      inherited Dock974: TDock97
        Left = 1006
        Height = 394
        inherited tb97Detalhe: TToolbar97
          inherited bbtnOkDet: TBitBtn
            Visible = False
          end
          inherited bbtnCancelarDet: TBitBtn
            Visible = False
          end
          inherited bbtnVoltarDet: TBitBtn
            Visible = False
          end
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
      Width = 1100
      Height = 110
      object Label18: TLabel
        Left = 176
        Top = 88
        Width = 110
        Height = 13
        Caption = 'Data Requerimento'
      end
      object Label19: TLabel
        Left = 384
        Top = 88
        Width = 95
        Height = 13
        Caption = 'Data Pagamento'
      end
      object GroupBox1: TGroupBox
        Left = 6
        Top = 16
        Width = 158
        Height = 43
        Caption = 'Plano Previdenciário'
        TabOrder = 0
      end
      object GroupBox2: TGroupBox
        Left = 168
        Top = 16
        Width = 368
        Height = 43
        Caption = 'Saldo Residual'
        TabOrder = 1
        object Label14: TLabel
          Left = 8
          Top = 21
          Width = 42
          Height = 13
          Caption = 'Mínimo'
        end
        object Label15: TLabel
          Left = 184
          Top = 21
          Width = 43
          Height = 13
          Caption = 'Máximo'
        end
      end
      object GroupBox3: TGroupBox
        Left = 539
        Top = 16
        Width = 302
        Height = 43
        Caption = 'Período de Resgate Anterior'
        TabOrder = 2
        object Label16: TLabel
          Left = 8
          Top = 21
          Width = 34
          Height = 13
          Caption = 'Início'
        end
        object Label17: TLabel
          Left = 157
          Top = 21
          Width = 28
          Height = 13
          Caption = 'Final'
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1102
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
        Visible = False
      end
      object sbtnRequerer: TToolbarButton97
        Left = 120
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Requerer'
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Requerer'
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
    Top = 612
    Width = 1102
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
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 492
      ActivateParent = False
      DockPos = 492
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
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
  object cb_tipo_recebedor: TComboBox [3]
    Left = 15
    Top = 78
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 9
    Items.Strings = (
      'TODOS'
      'REB'
      'NOVO PLANO')
  end
  object ed_min: TEdit [4]
    Left = 224
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 10
    Text = '0,01'
    OnExit = ed_minExit
    OnKeyPress = ed_minKeyPress
  end
  object ed_max: TEdit [5]
    Left = 401
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '0,01'
    OnExit = ed_maxExit
    OnKeyPress = ed_maxKeyPress
  end
  object rd_benefreq: TRadioGroup [6]
    Left = 13
    Top = 109
    Width = 140
    Height = 43
    Caption = 'Resgate Requerido ?'
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      'Sim'
      'Não')
    TabOrder = 6
  end
  object mk_data_re: TMaskEdit [7]
    Left = 293
    Top = 131
    Width = 73
    Height = 21
    EditMask = '99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 7
    Text = '  /  /    '
    OnExit = mk_dataExit
  end
  object mk_data_pag: TMaskEdit [8]
    Left = 485
    Top = 131
    Width = 73
    Height = 21
    EditMask = '99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 8
    Text = '  /  /    '
    OnExit = mk_dataExit
  end
  object mk_ini: TCMDateTimePicker [9]
    Left = 585
    Top = 78
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
  object mk_fin: TCMDateTimePicker [10]
    Left = 728
    Top = 78
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
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 64
    Top = 122
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
    Left = 331
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 178
    Top = 146
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update pessoa set nome = '#39#39
      'where 1=2')
    Left = 154
    Top = 146
  end
  inherited MontaSelect: TMontaSelect
    Left = 219
    Top = 186
  end
  inherited ImlPadrao: TImageList
    Left = 201
    Top = 66
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 500
    Top = 2
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select 1 from dual')
    Left = 129
    Top = 138
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 564
    Top = 290
  end
  object qry2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 561
    Top = 10
  end
  object qryaux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 601
    Top = 10
  end
  object qryaux2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 641
    Top = 10
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    AfterOpen = qryDetAfterOpen
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      ''
      ''
      'SELECT '#39'S'#39' AS SELECIONADO,'
      '       EL.MATRICULA,'
      '       pp.nome PLANO,'
      '       EL.IDSITFUNC,'
      '       PPP.IDSITPART,'
      '       PPP.IDSITPLANOPREV,'
      '       B.IDEVENTOSPREV,'
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
      '              WHERE PP.IDPLANOPREV = H1.IDPLANOPREV AND'
      '                    NVL(TP.FLGCONTROLE, 0) <> 1 AND'
      '                    NOT EXISTS (SELECT 1'
      '                                FROM PARTPREVPLAN PPP'
      
        '                                WHERE PPP.IDPESSOA = H1.IDPESSOA' +
        ' AND'
      '                                      PPP.IDPLANOPREV = 2 AND'
      
        '                                      PPP.IDSITPLANOPREV = 1) AN' +
        'D'
      '                    H1.SEQPROPOSTA = 1 AND'
      '                    TP.ANALITICOSINTETI = '#39'A'#39' AND'
      '                    TP.FLGCONTROLE = 0 AND'
      '                    TP.FLGCOLETIVA = 0 AND'
      '                    H1.IDPLANOPREV = RS.IDPLANOPREV AND'
      
        '                    H1.IDTIPORESERVA NOT IN (62,33,59,60,61,170)' +
        ' AND'
      
        '                    SUBSTR(TP.CODHIERARQUIA, 1, 2) IN ('#39'11'#39', '#39'12' +
        #39') AND'
      '                    CC.COTDATA = (SELECT MAX(COTDATA)'
      '                                  FROM COTACAOMOEDA CM'
      
        '                                  WHERE CM.MOECODIGO = CC.MOECOD' +
        'IGO) AND'
      '                    H1.IDPESSOA = EL.IDPESSOA)'
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
      '              WHERE PP.IDPLANOPREV = H1.IDPLANOPREV AND'
      '                    NVL(TP.FLGCONTROLE, 0) <> 1 AND'
      '                    NOT EXISTS (SELECT 1'
      '                                FROM PARTPREVPLAN PPP'
      
        '                                WHERE PPP.IDPESSOA = H1.IDPESSOA' +
        ' AND'
      '                                      PPP.IDPLANOPREV = 2 AND'
      
        '                                      PPP.IDSITPLANOPREV = 1) AN' +
        'D'
      '                    H1.SEQPROPOSTA = 1 AND'
      '                    TP.ANALITICOSINTETI = '#39'A'#39' AND'
      '                    TP.FLGCONTROLE = 0 AND'
      '                    TP.FLGCOLETIVA = 0 AND'
      '                    H1.IDPLANOPREV = RS.IDPLANOPREV AND'
      '                    H1.IDTIPORESERVA IN (62,33,59,60,61,170) AND'
      
        '                    SUBSTR(TP.CODHIERARQUIA, 1, 2) IN ('#39'11'#39', '#39'12' +
        #39') AND'
      '                    CC.COTDATA = (SELECT MAX(COTDATA)'
      '                                  FROM COTACAOMOEDA CM'
      
        '                                  WHERE CM.MOECODIGO = CC.MOECOD' +
        'IGO) AND'
      '                    H1.IDPESSOA = EL.IDPESSOA)'
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
      
        '           (SELECT SUM(((DECODE(H1.FLGENTRADA, 1, H1.VLRCOTAS, -' +
        'H1.VLRCOTAS)) * CC.COTVALOR) *'
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
      '              WHERE PP.IDPLANOPREV = H1.IDPLANOPREV AND'
      '                    NVL(TP.FLGCONTROLE, 0) <> 1 AND'
      '                    NOT EXISTS (SELECT 1'
      '                                FROM PARTPREVPLAN PPP'
      
        '                                WHERE PPP.IDPESSOA = H1.IDPESSOA' +
        ' AND'
      '                                      PPP.IDPLANOPREV = 2 AND'
      
        '                                      PPP.IDSITPLANOPREV = 1) AN' +
        'D'
      '                    H1.SEQPROPOSTA = 1 AND'
      '                    TP.ANALITICOSINTETI = '#39'A'#39' AND'
      '                    TP.FLGCONTROLE = 0 AND'
      '                    TP.FLGCOLETIVA = 0 AND'
      '                    H1.IDPLANOPREV = RS.IDPLANOPREV AND'
      
        '                    SUBSTR(TP.CODHIERARQUIA, 1, 2) IN ('#39'11'#39', '#39'12' +
        #39') AND'
      '                    CC.COTDATA = (SELECT MAX(COTDATA)'
      '                                  FROM COTACAOMOEDA CM'
      
        '                                  WHERE CM.MOECODIGO = CC.MOECOD' +
        'IGO) AND'
      '                    H1.IDPESSOA = EL.IDPESSOA)'
      '         ELSE'
      '               0'
      '       END AS SALDO_CONTA_TOTAL,'
      '       EL.IDPESSOA,'
      '       RS.IDPLANOPREV,'
      '       EL.IDPESSJUR,'
      
        '       DECODE(NVL(PPP.TIPOOPCAOIR,0),0,'#39'Sem Opção'#39',1,'#39'Progressiv' +
        'a'#39',2,'#39'Regressiva'#39') TIPO_OPCAO_IR'
      'FROM ELEGPATRO EL'
      '     JOIN RESERVAPART RS ON EL.IDPESSOA = RS.IDPESSOA'
      '                        AND EL.IDPESSJUR = RS.IDPESSJUR'
      '     JOIN PARTPREVPLAN PPP ON EL.IDPESSOA = PPP.IDPESSOA AND'
      
        '                              RS.IDPLANOPREV = PPP.IDPLANOPREV A' +
        'ND'
      '                              RS.IDPESSJUR = PPP.IDPESSJUR'
      '     JOIN Planprev pp ON rs.idplanoprev = pp.idplanoprev'
      '     JOIN HISTMOVRESERVA HS1 ON EL.IDPESSOA = HS1.IDPESSOA'
      '                            AND EL.IDPESSJUR = HS1.IDPESSJUR'
      '                            AND RS.IDPLANOPREV = HS1.IDPLANOPREV'
      
        '                            AND RS.IDTIPORESERVA = HS1.IDTIPORES' +
        'ERVA'
      '                            '
      '     JOIN BENEFBFCIARIO B ON EL.IDPESSOA = B.IDPESSOA AND'
      '                             RS.IDPESSJUR = B.IDPESSJUR AND'
      '                             RS.IDPLANOPREV = B.IDPLANOPREV  '
      '               '
      'WHERE RS.IDPLANOPREV IN (66,74)'
      
        '  AND HS1.IDBENEFICIO IN (231,323,526,277,418,458,523,378,524,47' +
        '8,510,528,516,493) '
      '  AND HS1.DATAALIMENTACAO >= '#39'01/01/2013'#39'--FILTRO DE DATA'
      '  AND HS1.DATAALIMENTACAO  <= '#39'31/01/2013'#39'--FILTRO DE DATA'
      '  AND (CASE'
      '         WHEN RS.IDPLANOPREV = 74 THEN'
      
        '           (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VL' +
        'RCOTAS))'
      '            FROM HISTMOVRESERVA HS'
      '            WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND'
      '                  EL.IDPESSOA = HS.IDPESSOA AND'
      '                  EL.IDPESSJUR = HS.IDPESSJUR AND'
      '                  HS.IDTIPORESERVA IN (100,101,110,111))'
      '         WHEN RS.IDPLANOPREV = 66 THEN'
      
        '           (SELECT SUM(((DECODE(H1.FLGENTRADA, 1, H1.VLRCOTAS, -' +
        'H1.VLRCOTAS)) * CC.COTVALOR) *'
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
      '              WHERE PP.IDPLANOPREV = H1.IDPLANOPREV AND'
      '                    NVL(TP.FLGCONTROLE, 0) <> 1 AND'
      '                    NOT EXISTS (SELECT 1'
      '                                FROM PARTPREVPLAN PPP'
      
        '                                WHERE PPP.IDPESSOA = H1.IDPESSOA' +
        ' AND'
      '                                      PPP.IDPLANOPREV = 2 AND'
      
        '                                      PPP.IDSITPLANOPREV = 1) AN' +
        'D'
      '                    H1.SEQPROPOSTA = 1 AND'
      '                    TP.ANALITICOSINTETI = '#39'A'#39' AND'
      '                    TP.FLGCONTROLE = 0 AND'
      '                    TP.FLGCOLETIVA = 0 AND'
      '                    H1.IDPLANOPREV = RS.IDPLANOPREV AND'
      
        '                    SUBSTR(TP.CODHIERARQUIA, 1, 2) IN ('#39'11'#39', '#39'12' +
        #39') AND'
      '                    CC.COTDATA = (SELECT MAX(COTDATA)'
      '                                  FROM COTACAOMOEDA CM'
      
        '                                  WHERE CM.MOECODIGO = CC.MOECOD' +
        'IGO) AND'
      '                    H1.IDPESSOA = EL.IDPESSOA)'
      '         ELSE'
      '               0'
      '       END) BETWEEN 0.01 AND 200 --FILTRO DE VALOR'
      'GROUP BY EL.MATRICULA, pp.nome, RS.IDPLANOPREV, EL.IDPESSJUR,'
      
        '         EL.IDPESSOA,DECODE(NVL(PPP.TIPOOPCAOIR,0),0,'#39'Sem Opção'#39 +
        ',1,'#39'Progressiva'#39',2,'#39'Regressiva'#39'), '
      '         EL.IDSITFUNC,'
      '         PPP.IDSITPART,'
      '         PPP.IDSITPLANOPREV,'
      '         B.IDEVENTOSPREV'
      'ORDER BY EL.MATRICULA,EL.IDPESSOA'
      '')
    UpdateObject = updDet
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 425
    Top = 2
    object qryDetSELECIONADO: TStringField
      DisplayLabel = 'S'
      DisplayWidth = 1
      FieldName = 'SELECIONADO'
      Size = 1
    end
    object qryDetMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 13
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryDetPLANO: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 23
      FieldName = 'PLANO'
      Size = 50
    end
    object qryDetDATA_ULTIMO_RESGATE: TDateTimeField
      DisplayLabel = 'Data Último Resgate'
      DisplayWidth = 18
      FieldName = 'DATA_ULTIMO_RESGATE'
    end
    object qryDetSUBCONTA_EMPREGADO: TFloatField
      DisplayLabel = 'Sub Conta Empregado'
      DisplayWidth = 10
      FieldName = 'SUBCONTA_EMPREGADO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object qryDetSUBCONTA_PATROCINADOR: TFloatField
      DisplayLabel = 'Sub Conta Patrocinador'
      DisplayWidth = 10
      FieldName = 'SUBCONTA_PATROCINADOR'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object qryDetSALDO_CONTA_TOTAL: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 11
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
    object qryDetIDSITFUNC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITFUNC'
      Visible = False
    end
    object qryDetIDSITPART: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITPART'
      Visible = False
    end
    object qryDetIDSITPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITPLANOPREV'
      Visible = False
    end
    object qryDetIDEVENTOSPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEVENTOSPREV'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryDetIDPESSJUR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryDetINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
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
    Left = 394
    Top = 2
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
    Left = 671
    Top = 13
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
    Left = 710
    Top = 13
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
    Left = 748
    Top = 21
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
    Left = 472
    Top = 352
  end
  object param: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 521
    Top = 290
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
  object CmpRptCM: TCmParamReport
    Params = <>
    ExibeMensagem = True
    Formheight = 433
    FormWidth = 525
    HelpContext = 0
    Left = 580
    Top = 208
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
      mmHeight = 115147
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
      BreakName = 'MATRICULA'
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
        mmHeight = 0
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
      FieldLength = 13
      DisplayWidth = 13
      Position = 0
    end
    object ppReciboCedidosppField2: TppField
      FieldAlias = 'MEMO'
      FieldName = 'MEMO'
      FieldLength = 1002
      DisplayWidth = 1002
      Position = 1
    end
  end
  object dsReciboCedidos: TwwDataSource
    AutoEdit = False
    DataSet = qry_rel
    Left = 672
    Top = 304
  end
  object qryDETCONCINSS: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 649
    Top = 162
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
  object wwQuery1: TwwQuery
    CachedUpdates = True
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT '#39'             '#39'MATRICULA,'#39'                               ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        ' '
      '        '#39' MEMO'
      ' FROM DUAL')
    ControlType.Strings = (
      'S;CheckBox;S;N')
    ValidateWithMask = True
    Left = 605
    Top = 110
    object StringField1: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 13
    end
    object StringField2: TStringField
      FieldName = 'MEMO'
      FixedChar = True
      Size = 1002
    end
  end
end
