inherited FrmConsFornMT: TFrmConsFornMT
  Left = 296
  Top = 160
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Consulta Fornecedores'
  ClientHeight = 473
  ClientWidth = 666
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 666
    Height = 434
    object SpeedButton1: TSpeedButton
      Left = 504
      Top = 8
      Width = 134
      Height = 56
      Caption = 'Seleciona Movimento'
      Glyph.Data = {
        F6060000424DF606000000000000760000002800000063000000200000000100
        0400000000008006000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777778877777777777770000777777777777777777770077777777777777
        7777777777777777788777777777777777777777777777788888877777777777
        000077777777777777777700FF077777777777777777777777777FF887F87777
        77777777777777777777788880088777777777770000777777777777777700FF
        FF0777777777777777777777777FF88777F87777777777777777777777788880
        0FF088777777777000007777777777777700FFFFFFF077777777777777777777
        7FF88777777F877777777777777777777888800FFFF088777777777700007777
        7777788800FFFFFFFFF07777777777777777777FF8877777777F877777777777
        7777777888800FFFFFFF08877777777700007777777744008FFFFFFFFFFF0777
        7777777777777FF8877777777FF7F8777777777777777788800FFFFFFFFF0887
        77777777000077777774224488FFFFFFCCFF077777777777777FF77FF877777F
        F887F877777777777777744008FFFFFFFFFFF088777777770000777777A22224
        488FFFCCFFFFF077777777777FF87777FF877FF887FF7F877777777777774224
        488FFFFFFCCFF08877777777000077777A2222224488CCFFFCCFF07777777777
        7F8777777FF87887FF887F8777777777777A22224488FFFCCFFFFF088777777F
        000077777A22222224488FFCCFFFFF07777777777F87777777FF877F887FF7F8
        7777777777A2222224488CCFFFCCFF0887777777000077777A222222224488CF
        FFCCFF07777777777F877777777FF8787FF887F87777777777A22222224488FF
        CCFFFFF088777777000077777A2222222224488FCCFFFFF0777777777F877777
        7777FF877887FF7F8777777778A222222224488CFFFCCFF08877777700007777
        0A22222222224488FFFCCFF077777777F887777777777FF877FF887F87777777
        88A2222222224488FCCFFFFF0887777700007770FA22222AA22224488CCFFFFF
        0777777F87877777887777FF87887FF7F877777780A22222222224488FFFCCFF
        088777770000770FFA222248AA22224488FFCCFF077777F87787777F7887777F
        F877F887F87777780FA22222AA22224488CCFFFFF08877770000770FFA222248
        CAA22224488CFFFFF07777F87787777F78887777FF8787FF7F877770FFA22224
        8AA22224488FFCCFF088777700007770FA222248FFAA22224488FCCFF077777F
        8787777F77F887777FF87F887F877770FFA222248CAA22224488CFFFFF088777
        000077700AA22248FCCAA2222488CFFFFF07777F8888777F7788887777F8787F
        F7F877770FA222248FFAA22224488FCCFF0887770000777070A2224FFFFFAA22
        24488FCCFF07777F8F88777F777FF88777FF877887F8777700AA22248FCCAA22
        22488CFFFFF088770000770FF7AAAA2FFFCCFAA2224488FFFFF077F877F88888
        77788788777FF877777F8777070A2224FFFFFAA2224488FCCFF088770000770F
        FF70FFF0FFFFFCAA2224488FFFF077F8777F877F8777FF888777FF87777F8770
        FF7AAAA2FFFCCFAA2224488FFFFF0877000070FFFFF70FF0FFFCCFFAA2224488
        FFFF0F877777F87F8777887788777FF87777F870FFF70FFF0FFFFFCAA2224488
        FFFF0887000070FFFFFF70FF0FFFFFCCAA2224488FFF0F8777777F87F8777FF8
        888777FF877FF80FFFFF70FF0FFFCCFFAA2224488FFFF08700007700FFFFF707
        0FFFCCFFFAA222448F0077F8877777F8F87778877788777F8FF8870FFFFFF70F
        F0FFFFFCCAA2224488FFF0770000777700FFFF7070FFFFFFFFAA22240077777F
        F887777F8F87777777788777888777700FFFFF7070FFFCCFFFAA222448F00777
        000077777700FFF700FFFF00007AA224877777777FF88777F887777888878877
        87777777700FFFF7070FFFFFFFFAA2224007777700007777777700FF700FF077
        7707AA2487777777777FF8877F887787777878878777777777700FFF700FFFF0
        0007AA22487777770000777777777700F7000FFFFF707AA27777777777777FF8
        87F8887777778788877777777777700FF700FF0777707AA24877777F00007777
        77777777000FFFFFFFF70777777777777777777FF88877777777787777777777
        777777700F7000FFFFF707AA2777777700007777777777777700000000000777
        77777777777777777FF888888888887777777777777777777000FFFFFFFF7077
        77777777000077777777777777777777777777777777777777777777777FFFFF
        FFFFF77777777777777777777770000000000077777777770000}
      Layout = blGlyphTop
      NumGlyphs = 3
      OnClick = SpeedButton1Click
    end
    object NtbConsultaForn: TNotebook
      Left = 1
      Top = 71
      Width = 664
      Height = 310
      Align = alBottom
      TabOrder = 1
      object TPage
        Left = 0
        Top = 0
        Caption = 'VolNeg'
        object Grafico: TDBChart
          Left = 0
          Top = 97
          Width = 664
          Height = 213
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          MarginBottom = 0
          MarginLeft = 1
          MarginRight = 1
          MarginTop = 0
          Title.Text.Strings = (
            '')
          Title.Visible = False
          LeftAxis.LabelsOnAxis = False
          Legend.ColorWidth = 7
          Legend.DividingLines.Style = psDash
          Legend.HorizMargin = 5
          Legend.TopPos = 5
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object Series2: TBarSeries
            Marks.ArrowLength = 20
            Marks.Visible = False
            DataSource = CdsVolumeLanc
            SeriesColor = clGreen
            Title = 'Lançamentos'
            XLabelsSource = 'COLUNA'
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            XValues.ValueSource = 'TO_NUMBER(MES)'
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 'VALORLANCADO'
          end
          object Series1: TBarSeries
            Marks.ArrowLength = 20
            Marks.BackColor = 8421631
            Marks.Style = smsLabelPercent
            Marks.Visible = False
            DataSource = CdsVolumePg
            PercentFormat = '#0.00%'
            SeriesColor = clRed
            Title = 'Baixas'
            ValueFormat = '#,##0.00'
            XLabelsSource = 'COLUNA'
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            XValues.ValueSource = 'TO_NUMBER(MES)'
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 'VALORPAGO'
          end
        end
        object GroupBox1: TGroupBox
          Left = 12
          Top = 1
          Width = 626
          Height = 55
          Caption = 'Movimento no Período Indicado'
          TabOrder = 0
          object BtnCalcular: TSpeedButton
            Left = 227
            Top = 20
            Width = 79
            Height = 25
            Hint = 'Pesquisa Cliente'
            Caption = 'Calcular'
            Glyph.Data = {
              66010000424D6601000000000000760000002800000014000000140000000100
              040000000000F000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
              DDDDDDDD0000DDDD777777777777DDDD0000DDD00000000000007DDD0000DD0F
              EFEFEFEFEFEF07DD0000DD0E00000E00000E07DD0000DD0F88880F88880F07DD
              0000DD0EFEFEFEFEFEFE07DD0000DD0F00E00F00E00F07DD0000DD0E80F80E80
              F80E07DD0000DD0FEFEFEFEFEFEF07DD0000DD0E00F00E00F00E07DD0000DD0F
              80E80F80E80F07DD0000DD0EFEFEFEFEFEFE07DD0000DD0F00000000000F07DD
              0000DD0E08181881880E07DD0000DD0F08818818180F07DD0000DD0E00000000
              000E07DD0000DD0FEFEFEFEFEFEF0DDD0000DDD0000000000000DDDD0000DDDD
              DDDDDDDDDDDDDDDD0000}
            ParentShowHint = False
            ShowHint = True
            OnClick = BtnCalcularClick
          end
          object Label1: TLabel
            Left = 333
            Top = 9
            Width = 76
            Height = 13
            Caption = 'Lançamentos'
          end
          object Label4: TLabel
            Left = 479
            Top = 9
            Width = 38
            Height = 13
            Caption = 'Baixas'
          end
          object Shape1: TShape
            Left = 312
            Top = 35
            Width = 14
            Height = 7
          end
          object Shape2: TShape
            Left = 312
            Top = 25
            Width = 14
            Height = 7
          end
          object DtFin: TCMDateTimePicker
            Left = 116
            Top = 23
            Width = 107
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
          object DtIni: TCMDateTimePicker
            Left = 8
            Top = 23
            Width = 104
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
          object DbrLanc: TDBRealEdit
            Left = 333
            Top = 23
            Width = 140
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VALORLANC'
            DataSource = DsCalcMov
          end
          object DbrPag: TDBRealEdit
            Left = 480
            Top = 23
            Width = 141
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VALORPAGO'
            DataSource = DsCalcMov
          end
        end
        object RgGrafico: TRadioGroup
          Left = 13
          Top = 57
          Width = 624
          Height = 35
          Caption = ' Movimento Nos Últimos 12 Meses '
          Columns = 3
          ItemIndex = 2
          Items.Strings = (
            'Pagamentos'
            'Lançamentos'
            'Lançamentos X Pagamentos')
          TabOrder = 2
          OnClick = RgGraficoClick
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'DocsAVencer'
        object GrdDocsaVencer: TwwDBGrid
          Left = 0
          Top = 0
          Width = 656
          Height = 280
          Selected.Strings = (
            'NODOCUMENTO'#9'15'#9'Documento'#9'F'
            'COMPLDOCUMENTO'#9'3'#9'Cpl'#9'F'
            'DATAEMISSAO'#9'10'#9'Emissão'#9'F'
            'DATAVENCTO'#9'10'#9'Vencimento'#9'F'
            'DATAPROGRAMADA'#9'10'#9'Programada'#9'F'
            'DIASAVENC'#9'5'#9'Dias -'#9'F'
            'SALDO'#9'15'#9'Saldo'#9'F'
            'SALDOOM'#9'15'#9'Saldo Outra Moeda'#9'F'
            'HISTORICOCOMPL'#9'60'#9'Histórico'#9'F'
            'NUMSLIP'#9'11'#9'SLIP'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = DsAvenc
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
        object PnlTotaVenc: TPanel
          Left = 0
          Top = 280
          Width = 656
          Height = 30
          Align = alBottom
          Alignment = taRightJustify
          BevelInner = bvLowered
          BevelWidth = 2
          Caption = 'Total '
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 1
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'DocsAtraso'
        object GrdDocAtraso: TwwDBGrid
          Left = 0
          Top = 0
          Width = 656
          Height = 280
          Selected.Strings = (
            'NODOCUMENTO'#9'15'#9'Documento'
            'COMPLDOCUMENTO'#9'3'#9'Cpl'
            'DATAEMISSAO'#9'10'#9'Emissão'
            'DATAVENCTO'#9'10'#9'Vencimento'
            'DATAPROGRAMADA'#9'10'#9'Programada'
            'DIASAVENC'#9'5'#9'Dias -'
            'SALDO'#9'15'#9'Saldo'
            'SALDOOM'#9'15'#9'Saldo Outra Moeda'
            'HISTORICOCOMPL'#9'60'#9'Histórico'
            'NUMSLIP'#9'11'#9'SLIP')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = DsVenc
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
        object PnlTotAtraso: TPanel
          Left = 0
          Top = 280
          Width = 656
          Height = 30
          Align = alBottom
          Alignment = taRightJustify
          BevelInner = bvLowered
          BevelWidth = 2
          Caption = 'Total '
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 1
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'DocsBaxados'
        object GrdDocsBaixados: TwwDBGrid
          Left = 0
          Top = 0
          Width = 656
          Height = 280
          Selected.Strings = (
            'NODOCUMENTO'#9'15'#9'Documento'
            'COMPLDOCUMENTO'#9'3'#9'Cpl'
            'DATAEMISSAO'#9'9'#9'Emissão'
            'DATAVENCTO'#9'10'#9'Vencimento'
            'DATAPROGRAMADA'#9'10'#9'Programado'
            'DATALANCTO'#9'9'#9'Data Baixa'
            'VALORORIG'#9'17'#9'Valor Original'
            'VALOR'#9'17'#9'Valor Baixado'
            'VALOROUTRAMOEDA'#9'17'#9'Valor Outra Moeda'
            'HISTORICOCOMPL'#9'60'#9'Histórico'
            'NUMSLIP'#9'11'#9'SLIP'
            'NUMOP'#9'11'#9'N. OP')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = DsBaixa
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
        object PnlDocsBaixados: TPanel
          Left = 0
          Top = 280
          Width = 656
          Height = 30
          Align = alBottom
          Alignment = taRightJustify
          BevelInner = bvLowered
          BevelWidth = 2
          Caption = 'Total '
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 1
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 381
      Width = 664
      Height = 52
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 0
      object SbtDocaVenc: TSpeedButton
        Tag = 1
        Left = 331
        Top = 6
        Width = 158
        Height = 40
        GroupIndex = 1
        Caption = 'Documentos a Vencer'
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          777770000000777770000000000070000000777770F7F000F7F0700000007000
          007F70A07F707000000070F7F0F000A000F070000000707CC070AAAAA0707000
          000070F7F0F000A000F0700000007071107F70A07F707000000070F1F0F7F000
          17F0700000007071107F11111F707000000070F1F0F7F7F7F7F0700000007071
          1000000000007000000070F7F0CCCCCCCCC07000000070000000000000007000
          000070CCCCCCCC07777770000000700000000007777770000000777777777777
          777770000000}
        OnClick = SbtnVolumeClick
      end
      object sBtnDocVenc: TSpeedButton
        Tag = 2
        Left = 495
        Top = 6
        Width = 158
        Height = 40
        GroupIndex = 1
        Caption = 'Documentos em Atraso'
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          777770000000777770000000000070000000777770F7F7F7F7F0700000007000
          0070000000707000000070F7F0F0999990F070000000707CC070999990707000
          000070F7F0F0000000F0700000007071107F7F117F707000000070F1F0F7F7F1
          17F0700000007071107F11111F707000000070F1F0F7F7F7F7F0700000007071
          1000000000007000000070F7F0CCCCCCCCC07000000070000000000000007000
          000070CCCCCCCC07777770000000700000000007777770000000777777777777
          777770000000}
        OnClick = SbtnVolumeClick
      end
      object SbtnVolume: TSpeedButton
        Left = 4
        Top = 6
        Width = 158
        Height = 40
        GroupIndex = 1
        Down = True
        Caption = 'Volume de Negócios'
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777700007777777778888887777700007777777000003888777700007777
          770BBBB03088877700007777770BBBB0308887770000777770BBBB0333088777
          0000777770BBBB03330887770000777770000003330000770000000000078033
          3300A07700000999990000333000A00000000000000BB03330AAAAA000007777
          70BBBB033000A000000077770BBBBBB03300A07700007770BBBBBBBB03000077
          0000777000BBBB00030877770000777770BBBB033308777700007777770BBBB0
          3087777700007777770BBBB03077777700007777777000003777777700007777
          77777777777777770000}
        OnClick = SbtnVolumeClick
      end
      object SpbBaixados: TSpeedButton
        Tag = 3
        Left = 168
        Top = 6
        Width = 158
        Height = 40
        GroupIndex = 1
        Caption = 'Baixas no Período'
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
        OnClick = SbtnVolumeClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 434
    Width = 666
    inherited tb97Fundo: TToolbar97
      Left = 211
    end
  end
  inherited CPForCli: TCMProcuraForCli
    Left = 26
    Top = 8
    Width = 471
    Height = 51
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 35
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object DsAvenc: TwwDataSource
    AutoEdit = False
    DataSet = CdsAvenc
    Left = 355
    Top = 296
  end
  object DsVenc: TwwDataSource
    AutoEdit = False
    DataSet = CdsVenc
    Left = 432
    Top = 296
  end
  object DsVolumePg: TwwDataSource
    AutoEdit = False
    DataSet = CdsVolumePg
    Left = 285
    Top = 296
  end
  object DsVolumeLanc: TwwDataSource
    AutoEdit = False
    DataSet = CdsVolumePg
    Left = 168
    Top = 296
  end
  object DsCalcMov: TwwDataSource
    AutoEdit = False
    DataSet = CdsCalcMov
    Left = 69
    Top = 296
  end
  object DsBaixa: TwwDataSource
    AutoEdit = False
    DataSet = CdsBaixa
    Left = 507
    Top = 296
  end
  object CdsBaixa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 509
    Top = 196
  end
  object SqlBaixa: TCMSqlParams
    SQL.Strings = (
      
        'SELECT D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAEMISSAO, D.DATAVEN' +
        'CTO,'
      
        '       D.DATAPROGRAMADA, L.DATALANCTO, L.HISTORICOCOMPL, L.VALOR' +
        ','
      
        '       L.VALOROUTRAMOEDA, LORIGE.VALOR AS VALORORIG, D.NUMSLIP, ' +
        #39'           '#39' NUMOP,'
      '       D.CODDOCUMENTO'
      'FROM DOCUMENTO D,'
      '     LANCTODOCUM L,'
      '     RECBTOPAGTO RB,'
      
        '     (SELECT L.VALOR, D.CODDOCUMENTO FROM DOCUMENTO D, LANCTODOC' +
        'UM L'
      '      WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '            (D.OPERACAO = L.OPERACAO)         AND'
      '            (D.IDFORCLI = :PIDPESSOA) AND'
      '            (D.RECPAG = :PRECPAG)) LORIGE'
      'WHERE'
      '     (D.IDFORCLI = :PIDPESSOA) AND'
      '     (D.RECPAG = :PRECPAG) AND'
      '     (L.DATALANCTO BETWEEN :PDATAINI AND :PDATAFIN) AND'
      '     (D.CODDOCUMENTO = LORIGE.CODDOCUMENTO) AND'
      '     (L.CODDOCUMENTO = D.CODDOCUMENTO) AND'
      '     (RB.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '     (RB.NUMLANCTO = L.NUMLANCTO)'
      'ORDER BY L.DATALANCTO'
      ''
      ' '
      ' ')
    ClientDataSet = CdsBaixa
    Left = 509
    Top = 252
  end
  object SqlVenc: TCMSqlParams
    SQL.Strings = (
      
        'SELECT D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAEMISSAO, D.DATAVEN' +
        'CTO,'
      
        '       D.DATAPROGRAMADA, TRUNC((SYSDATE - D.DATAPROGRAMADA)) AS ' +
        'DIASAVENC,'
      
        '       L.HISTORICOCOMPL, S.SALDO, S.SALDOOM, D.NUMSLIP, '#39'       ' +
        '    '#39' NUMOP'
      'FROM DOCUMENTO D,'
      '     LANCTODOCUM L,'
      '     (SELECT D.CODDOCUMENTO,'
      
        '      SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOR*-1,L.V' +
        'ALOR),DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1))) AS SALDO,'
      
        '      SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOROUTRAMO' +
        'EDA*-1,L.VALOROUTRAMOEDA),DECODE(L.DEBCRE,'#39'D'#39',L.VALOROUTRAMOEDA,' +
        'L.VALOROUTRAMOEDA*-1))) AS SALDOOM'
      
        '      FROM DOCUMENTO D, LANCTODOCUM L WHERE D.CODDOCUMENTO = L.C' +
        'ODDOCUMENTO GROUP BY D.CODDOCUMENTO) S'
      'WHERE'
      '     (D.IDFORCLI = :PIDPESSOA) AND'
      '    /* (D.OPERACAO IN ('#39'1'#39','#39'2'#39','#39'3'#39')) AND'
      '     (L.OPERACAO IN ('#39'1'#39','#39'2'#39','#39'3'#39')) AND   */'
      '    ( (RTRIM(L.OPERACAO) IN ('#39'2'#39','#39'3'#39')) OR'
      
        '    ( (RTRIM(D.OPERACAO) ='#39'1'#39') AND (D.NUMFATURA IS NULL) AND (L.' +
        'OPERACAO=D.OPERACAO) )) AND'
      ''
      '     (D.STATUS <> '#39'2'#39') AND'
      '     (D.RECPAG = :PRECPAG) AND'
      '     (D.DATAPROGRAMADA < SYSDATE) AND'
      '     (L.CODDOCUMENTO = D.CODDOCUMENTO) AND'
      '     (S.CODDOCUMENTO(+) = D.CODDOCUMENTO)'
      'ORDER BY D.DATAPROGRAMADA'
      '')
    ClientDataSet = CdsVenc
    Left = 429
    Top = 244
  end
  object CdsVenc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 429
    Top = 188
  end
  object CdsCalcMov: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 69
    Top = 180
  end
  object SqlCalcMov: TCMSqlParams
    SQL.Strings = (
      'SELECT VP.VALORPAGO, VL.VALORLANC FROM'
      '(SELECT'
      
        '   ABS(SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOR*-1,L.' +
        'VALOR),DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)))) AS VALORPAGO'
      ' FROM'
      '   DOCUMENTO D, LANCTODOCUM L'
      ' WHERE'
      '   (D.IDFORCLI = :PIDPESSOA) AND'
      '   (L.DATALANCTO BETWEEN :PDATAINI AND :PDATAFIN) AND'
      '   (L.OPERACAO IN ('#39'5'#39','#39'15'#39','#39'10'#39')) AND'
      
        '   /* Marcus Oliveira P. 22704 22/09/06 (D.RECPAG = '#39'P'#39')   AND *' +
        '/'
      '   (D.RECPAG = :PRECPAG)   AND'
      '   (D.CODDOCUMENTO = L.CODDOCUMENTO)) VP,'
      '(SELECT'
      
        '   ABS(SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOR*-1,L.' +
        'VALOR),DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)))) AS VALORLANC'
      ' FROM'
      '   DOCUMENTO D, LANCTODOCUM L'
      ' WHERE'
      '   (D.IDFORCLI = :PIDPESSOA) AND'
      '   (L.DATALANCTO BETWEEN :PDATAINI AND :PDATAFIN) AND'
      '  /* (L.OPERACAO IN ('#39'1'#39','#39'2'#39','#39'3'#39')) AND   */'
      '  ( (RTRIM(L.OPERACAO) IN ('#39'2'#39','#39'3'#39')) OR'
      
        '  ( (RTRIM(D.OPERACAO) ='#39'1'#39') AND (D.NUMFATURA IS NULL) AND (L.OP' +
        'ERACAO=D.OPERACAO) )) AND'
      '  (D.RECPAG = :PRECPAG)   AND'
      '  (D.CODDOCUMENTO = L.CODDOCUMENTO)) VL'
      ''
      ' ')
    ClientDataSet = CdsCalcMov
    Left = 69
    Top = 236
  end
  object CdsVolumePg: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 285
    Top = 180
  end
  object SqlVolumePg: TCMSqlParams
    SQL.Strings = (
      
        'SELECT TO_NUMBER(ANO), TO_NUMBER(MES), (MES || '#39'\'#39' || ANO) AS CO' +
        'LUNA, VALORPAGO'
      'FROM'
      '(SELECT'
      '   RTRIM(TO_CHAR(L.DATALANCTO,'#39'YYYY'#39')) AS ANO,'
      '   RTRIM(TO_CHAR(L.DATALANCTO,'#39'MM'#39')) AS MES,'
      
        '   ABS(SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOR*-1,L.' +
        'VALOR),DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)))) AS VALORPAGO'
      'FROM'
      '   DOCUMENTO D, LANCTODOCUM L'
      'WHERE'
      '   (D.IDFORCLI = :PIDPESSOA) AND'
      '   (L.DATALANCTO >= :PDATALANCTO) AND'
      '   (L.OPERACAO IN ('#39'5'#39','#39'15'#39','#39'10'#39')) AND'
      '   (D.RECPAG = :PRECPAG)   AND'
      '   (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      'GROUP BY    TO_CHAR(L.DATALANCTO,'#39'YYYY'#39'),'
      '            TO_CHAR(L.DATALANCTO,'#39'MM'#39'))'
      'WHERE (ROWNUM <= 12) AND (VALORPAGO > 0)'
      ''
      ''
      '')
    ClientDataSet = CdsVolumePg
    Left = 285
    Top = 236
  end
  object CdsAvenc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 357
    Top = 188
  end
  object SqlAvenc: TCMSqlParams
    SQL.Strings = (
      
        'SELECT D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAEMISSAO, D.DATAVEN' +
        'CTO,'
      
        '       D.DATAPROGRAMADA, TRUNC((D.DATAPROGRAMADA - SYSDATE)) AS ' +
        'DIASAVENC,'
      
        '       L.HISTORICOCOMPL, S.SALDO, S.SALDOOM, D.NUMSLIP, '#39'       ' +
        '    '#39' NUMOP'
      'FROM DOCUMENTO D,'
      '     LANCTODOCUM L,'
      '     (SELECT D.CODDOCUMENTO,'
      
        '      SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOR*-1,L.V' +
        'ALOR),DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1))) AS SALDO,'
      
        '      SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOROUTRAMO' +
        'EDA*-1,L.VALOROUTRAMOEDA),DECODE(L.DEBCRE,'#39'D'#39',L.VALOROUTRAMOEDA,' +
        'L.VALOROUTRAMOEDA*-1))) AS SALDOOM'
      
        '      FROM DOCUMENTO D, LANCTODOCUM L WHERE D.CODDOCUMENTO = L.C' +
        'ODDOCUMENTO GROUP BY D.CODDOCUMENTO) S'
      'WHERE'
      '     (D.IDFORCLI = :PIDPESSOA) AND'
      '   /*  (D.OPERACAO IN ('#39'1'#39','#39'2'#39','#39'3'#39')) AND'
      '     (L.OPERACAO IN ('#39'1'#39','#39'2'#39','#39'3'#39')) AND */'
      '     ((RTRIM(L.OPERACAO) IN ('#39'2'#39','#39'3'#39')) OR'
      
        '     ( (RTRIM(D.OPERACAO) ='#39'1'#39') AND (D.NUMFATURA IS NULL) AND (L' +
        '.OPERACAO=D.OPERACAO) )) AND'
      '     (D.STATUS <> '#39'2'#39') AND'
      '     (D.RECPAG = :PRECPAG) AND'
      '     (D.DATAPROGRAMADA >= SYSDATE) AND'
      '     (L.CODDOCUMENTO = D.CODDOCUMENTO) AND'
      '     (S.CODDOCUMENTO(+) = D.CODDOCUMENTO)'
      'ORDER BY D.DATAPROGRAMADA'
      ''
      ' '
      ' ')
    ClientDataSet = CdsAvenc
    Left = 357
    Top = 244
  end
  object CdsVolumeLanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 165
    Top = 180
  end
  object SqlVolumeLanc: TCMSqlParams
    SQL.Strings = (
      
        'SELECT TO_NUMBER(ANO), TO_NUMBER(MES), (MES || '#39'\'#39' || ANO) AS CO' +
        'LUNA, VALORLANCADO'
      'FROM'
      '(SELECT'
      '   RTRIM(TO_CHAR(L.DATALANCTO,'#39'YYYY'#39')) AS ANO,'
      '   RTRIM(TO_CHAR(L.DATALANCTO,'#39'MM'#39')) AS MES,'
      
        '   ABS(SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOR*-1,L.' +
        'VALOR),DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)))) AS VALORLANCAD' +
        'O'
      'FROM'
      '   DOCUMENTO D, LANCTODOCUM L'
      'WHERE'
      '   (D.IDFORCLI = :PIDPESSOA) AND'
      '   (L.DATALANCTO >= :PDATALANCTO) AND'
      '  ( (RTRIM(L.OPERACAO) IN ('#39'2'#39','#39'3'#39')) OR'
      
        '  ( (RTRIM(D.OPERACAO) ='#39'1'#39') AND (D.NUMFATURA IS NULL) AND (L.OP' +
        'ERACAO=D.OPERACAO) )) AND'
      '   (D.RECPAG = :PRECPAG)   AND'
      '   (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      'GROUP BY    TO_CHAR(L.DATALANCTO,'#39'YYYY'#39'),'
      '            TO_CHAR(L.DATALANCTO,'#39'MM'#39'))'
      'WHERE (ROWNUM <= 12) AND (VALORLANCADO > 0)'
      ''
      ''
      '')
    ClientDataSet = CdsVolumeLanc
    Left = 165
    Top = 236
  end
end
