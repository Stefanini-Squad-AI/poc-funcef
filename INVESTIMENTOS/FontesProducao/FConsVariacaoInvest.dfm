inherited FrmConsVariacaoInvest: TFrmConsVariacaoInvest
  Left = 300
  Top = 157
  HelpContext = 790575
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Consulta Variação dos Investimentos '
  ClientHeight = 325
  ClientWidth = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 400
    Height = 286
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 398
      Height = 284
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      OnChange = PageControl1Change
      object TabSheet1: TTabSheet
        Caption = 'Consulta'
        object Label1: TLabel
          Left = 17
          Top = 13
          Width = 73
          Height = 13
          Caption = 'Investimento'
        end
        object Label2: TLabel
          Left = 17
          Top = 59
          Width = 63
          Height = 13
          Caption = 'Data Inicio'
        end
        object Label3: TLabel
          Left = 153
          Top = 59
          Width = 51
          Height = 13
          Caption = 'Data Fim'
        end
        object DbLkcInvestimento: TwwDBLookupCombo
          Left = 17
          Top = 29
          Width = 351
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCINVESTIMENTO'#9'40'#9'Investimento')
          LookupTable = QryInvestimento
          LookupField = 'IDINVESTIMENTO'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = DbLkcInvestimentoChange
        end
        object DateEdit1: TCMDateTimePicker
          Left = 17
          Top = 75
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
          OnExit = DbLkcInvestimentoChange
        end
        object DateEdit2: TCMDateTimePicker
          Left = 153
          Top = 75
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
          OnExit = DbLkcInvestimentoChange
        end
        object BitBtn1: TBitBtn
          Left = 286
          Top = 55
          Width = 81
          Height = 48
          Caption = 'Consulta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = DbLkcInvestimentoChange
          Glyph.Data = {
            42010000424D4201000000000000760000002800000011000000110000000100
            040000000000CC00000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            77777000000070000000007777777000000070FFFFFFF07777700000000070F7
            7777F07777000000000070F77777F07770007000000070F77780008700077000
            000070F7700FFF0000777000000070F708FFFF0807777000000070F80E000F07
            08777000000070F0EFEFEF0770777000000070F0F0000F077077700000007000
            EFEFFF0770777000000077780000000708777000000077770077777807777000
            0000777770077700777770000000777777800087777770000000777777777777
            777770000000}
        end
        object GroupBox1: TGroupBox
          Left = 14
          Top = 103
          Width = 353
          Height = 130
          Caption = ' Resultado '
          TabOrder = 4
          object Label4: TLabel
            Left = 12
            Top = 26
            Width = 86
            Height = 13
            Caption = 'Cotação Inicial'
          end
          object Label5: TLabel
            Left = 196
            Top = 24
            Width = 79
            Height = 13
            Caption = 'Cotação Final'
          end
          object Label6: TLabel
            Left = 151
            Top = 82
            Width = 51
            Height = 13
            Caption = 'Variação'
          end
          object Panel1: TPanel
            Left = 12
            Top = 42
            Width = 145
            Height = 20
            Alignment = taRightJustify
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object Panel2: TPanel
            Left = 196
            Top = 40
            Width = 145
            Height = 20
            Alignment = taRightJustify
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object Panel3: TPanel
            Left = 104
            Top = 98
            Width = 145
            Height = 20
            Alignment = taRightJustify
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Histórico'
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 25
          Width = 382
          Height = 223
          Selected.Strings = (
            'DATACOTACAO'#9'14'#9'Data da Cotação'
            'VLRCONTABIL'#9'15'#9'Valor'
            'QTDTITLOTE'#9'13'#9'Qtd. Lote ')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = DsConsulta
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 382
          Height = 25
          Align = alTop
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 286
    Width = 400
    inherited tb97Fundo: TToolbar97
      Left = 207
      DockPos = 207
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 38
      DockPos = 38
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 305
    Top = 0
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object DsConsulta: TwwDataSource
    DataSet = QryConsulta
    Left = 272
  end
  object QryConsulta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * '
      ''
      'FROM COTACAOINVEST '
      ''
      'WHERE '#9'(IDINVESTIMENTO = :IDINVESTIMENTO) AND '
      #9'(DATACOTACAO   >=TO_DATE(:DATACOTAINI,'#39'DD/MM/YYYY'#39')) AND '
      #9'(DATACOTACAO   <=TO_DATE(:DATACOTAFIM,'#39'DD/MM/YYYY'#39'))'
      ''
      'ORDER BY DATACOTACAO ')
    ValidateWithMask = True
    Left = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATACOTAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATACOTAFIM'
        ParamType = ptUnknown
      end>
    object QryConsultaIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryConsultaDATACOTACAO: TDateTimeField
      FieldName = 'DATACOTACAO'
    end
    object QryConsultaVLRCONTABIL: TFloatField
      FieldName = 'VLRCONTABIL'
      DisplayFormat = '###,###,##0.00'
    end
    object QryConsultaVLRGERENCIAL: TFloatField
      FieldName = 'VLRGERENCIAL'
    end
    object QryConsultaQTDTITLOTE: TFloatField
      FieldName = 'QTDTITLOTE'
    end
  end
  object QryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT IV.IDINVESTIMENTO, IV.DESCINVESTIMENTO '
      ''
      'FROM COTACAOINVEST CI, INVESTIMENTO IV'
      ''
      'WHERE CI.IDINVESTIMENTO = IV.IDINVESTIMENTO '
      ''
      'ORDER BY  IV.DESCINVESTIMENTO')
    ValidateWithMask = True
    Left = 208
  end
end
