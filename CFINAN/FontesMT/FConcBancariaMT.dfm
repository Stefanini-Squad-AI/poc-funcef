inherited frmConcBancariaMT: TfrmConcBancariaMT
  Left = 236
  Top = 148
  HelpContext = 90007
  Caption = 'Conciliação Bancária'
  ClientHeight = 462
  ClientWidth = 767
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 767
    Height = 423
    object plnSaldos: TPanel
      Left = 1
      Top = 348
      Width = 765
      Height = 74
      Align = alBottom
      TabOrder = 0
      object gbCorrente: TGroupBox
        Left = -1
        Top = 7
        Width = 458
        Height = 67
        Caption = ' Saldo Conciliado em Moeda Corrente em:'
        Enabled = False
        TabOrder = 0
        object lblSaldoConciliadoAn: TLabel
          Left = 168
          Top = 23
          Width = 96
          Height = 13
          Caption = 'Não selecionado'
        end
        object lblSaldoConciliadoAt: TLabel
          Left = 312
          Top = 23
          Width = 110
          Height = 13
          Caption = 'Após a Conciliação'
        end
        object lbDiaAnterior: TLabel
          Left = 16
          Top = 23
          Width = 96
          Height = 13
          Caption = 'Não selecionado'
        end
        object edSaldoAntesConc: TRealEdit
          Left = 168
          Top = 37
          Width = 129
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 1
          WordWrap = False
          IntDigits = 17
          DecDigits = 2
          NumberFormat = fNumber
          Signal = True
        end
        object edSaldoConc: TRealEdit
          Left = 312
          Top = 37
          Width = 129
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 2
          WordWrap = False
          IntDigits = 17
          DecDigits = 2
          NumberFormat = fNumber
          Signal = True
        end
        object edSaldoConcDiaAnt: TRealEdit
          Left = 16
          Top = 37
          Width = 129
          Height = 21
          Alignment = taRightJustify
          Color = clBtnFace
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 17
          DecDigits = 2
          NumberFormat = fNumber
          Signal = True
        end
      end
      object gbOutraMoeda: TGroupBox
        Left = 455
        Top = 7
        Width = 310
        Height = 67
        Caption = ' Saldo Conciliado em Outra Moeda '
        Enabled = False
        TabOrder = 1
        object lblSaldoConciliaOMAt: TLabel
          Left = 160
          Top = 22
          Width = 110
          Height = 13
          Caption = 'Após a Conciliação'
        end
        object lblSaldoConciliaOMAn: TLabel
          Left = 16
          Top = 22
          Width = 121
          Height = 13
          Caption = 'Antes da Conciliação'
        end
        object edSaldoOMAntesConc: TRealEdit
          Left = 16
          Top = 36
          Width = 129
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 0
          WordWrap = False
          IntDigits = 17
          DecDigits = 2
          NumberFormat = fNumber
          Signal = True
        end
        object edSaldoOMConc: TRealEdit
          Left = 160
          Top = 36
          Width = 137
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 1
          WordWrap = False
          IntDigits = 17
          DecDigits = 2
          NumberFormat = fNumber
          Signal = True
        end
      end
    end
    object pnlDadosFiltro: TPanel
      Left = 1
      Top = 1
      Width = 765
      Height = 99
      Align = alTop
      BorderStyle = bsSingle
      TabOrder = 1
      object btnMarcaTodos: TSpeedButton
        Left = 8
        Top = 64
        Width = 81
        Height = 25
        Caption = '&Todos'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clActiveCaption
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000
          000FFFFFFFF88888888FFFFFFFF07797770FFFFFFFF8FF7FFF8FFFFFF0007999
          770FFFFFF888F777FF8FFFFFF0709979970FFFFFF8F877F77F8FFFF000709777
          990FFFF888F87FFF778FFFF070907777799FFFF8F878FFFFF77FF00070900000
          0099F888F87888888877F070907777799FFFF8F878FFFFF77FFFF07090000000
          99FFF8F87888888877FFF0907777799FFFFFF878FFFFF77FFFFFF09000000099
          FFFFF87888888877FFFFF07777799FFFFFFFF8FFFFF77FFFFFFFF000000099FF
          FFFFF888888877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 2
        ParentFont = False
        OnClick = btnMarcaTodosClick
      end
      object btnInverteMarcacao: TSpeedButton
        Left = 96
        Top = 64
        Width = 81
        Height = 25
        Caption = '&Inverter'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clActiveCaption
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFF88888888FFFFFFFF0777
          7770FFFFFFFF8FFFFFF8FFF000FF07777770FFF788FF8FFFFFF8FFF0FFFF0777
          7770FFF8FFFF8FFFFFF8FF000FFF07777770FF778FFF8FFFFFF8FFF0FFFF0777
          7770FFF8FFFF8FFFFFF8FFFFFFFF00000000FFFFFFFF8888888800000000FFFF
          FFFF88888888FFFFFFFF07797770FFFF0FFF8FF7FFF8FFFF8FFF07999770FFF0
          00FF8F777FF8FFF877FF09979970FFFF0FFF877F77F8FFFF8FFF09777990FF00
          0FFF87FFF778FF887FFF07777799FFFFFFFF8FFFFF77FFFFFFFF000000099FFF
          FFFF888888877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 2
        ParentFont = False
        OnClick = btnInverteMarcacaoClick
      end
      object Label3: TLabel
        Left = 188
        Top = 70
        Width = 164
        Height = 13
        Caption = 'Arquivo do Extrato Bancário:'
      end
      object btnSeleciona: TBitBtn
        Left = 624
        Top = 63
        Width = 129
        Height = 25
        Caption = '&Seleciona'
        TabOrder = 6
        OnClick = btnSelecionaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
          55555575555555775F55509999999901055557F55555557F75F5001111111101
          105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
          01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
          8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
          0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
          0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
          05555555575FF777755555555500055555555555557775555555}
        NumGlyphs = 2
      end
      object gbSaldoExtrato: TGroupBox
        Left = 488
        Top = 2
        Width = 265
        Height = 55
        Caption = ' Saldo do Extrato '
        TabOrder = 2
        object lblSaldo: TLabel
          Left = 8
          Top = 13
          Width = 111
          Height = 13
          Caption = 'em Moeda Corrente'
        end
        object Label1: TLabel
          Left = 136
          Top = 13
          Width = 94
          Height = 13
          Caption = 'em Outra Moeda'
        end
        object ednSaldoOMoeda: TRealEdit
          Left = 136
          Top = 26
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 1
          WordWrap = False
          IntDigits = 17
          DecDigits = 2
          NumberFormat = fNumber
          Signal = True
        end
        object ednSaldoCorrente: TRealEdit
          Left = 8
          Top = 26
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 0
          WordWrap = False
          IntDigits = 17
          DecDigits = 2
          NumberFormat = fNumber
          Signal = True
        end
      end
      object gbData: TGroupBox
        Left = 248
        Top = 2
        Width = 233
        Height = 55
        Caption = ' Datas do Extrato '
        TabOrder = 1
        object lblDataExtrato: TLabel
          Left = 8
          Top = 13
          Width = 35
          Height = 13
          Caption = 'Inicial'
        end
        object Label4: TLabel
          Left = 120
          Top = 13
          Width = 28
          Height = 13
          Caption = 'Final'
        end
        object edDataExtrato: TCMDateTimePicker
          Left = 120
          Top = 26
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
          DisplayFormat = 'dd/mm/yyyy'
        end
        object edtDataIni: TCMDateTimePicker
          Left = 8
          Top = 26
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
          DisplayFormat = 'dd/mm/yyyy'
        end
      end
      object gbBanco: TGroupBox
        Left = 8
        Top = 2
        Width = 233
        Height = 55
        TabOrder = 0
        object lblContaBanco: TLabel
          Left = 8
          Top = 13
          Width = 125
          Height = 13
          Caption = 'Conta Bancária/Caixa'
        end
        object dblcPortador: TwwDBLookupCombo
          Left = 8
          Top = 26
          Width = 217
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição'
            'NOCONTACORR'#9'15'#9'Conta')
          LookupTable = cdsPortador
          LookupField = 'CODPORTADOR'
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          OnExit = dblcPortadorExit
        end
      end
      object btnLimpaArquivo: TBitBtn
        Left = 582
        Top = 66
        Width = 23
        Height = 22
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = btnLimpaArquivoClick
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
      object btnAbreArquivo: TBitBtn
        Left = 558
        Top = 66
        Width = 24
        Height = 22
        Hint = 'Seleciona o arquivo para gravação do log de exceções.'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = btnAbreArquivoClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888880000008888888888888888880000008888888888888888880000008800
          00000000008888000000800B8B8B8B8B8B088800000080B0B8B8B8B8B8B08800
          000080F08B8B8B8B8B808800000080BF08B8B8B8B8B80800000080FBF000008B
          8B8B0800000080BFBFBFBF0000008800000080FBFBFBFBFBFB088800000080BF
          BFBFBFBFBF088800000080FBFBFBFBFBFB088800000080BFBFB0000000888800
          0000880000088888888888000000888888888888888888000000888888888888
          888888000000888888888888888888000000}
      end
      object edtArquivo: TEdit
        Left = 356
        Top = 66
        Width = 202
        Height = 21
        TabStop = False
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object pnlExtrato: TPanel
      Left = 445
      Top = 100
      Width = 321
      Height = 248
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      object wwDBGrid1: TwwDBGrid
        Left = 0
        Top = 21
        Width = 321
        Height = 227
        Hint = 
          'Duplo Click no campo Status, troca o status de não conciliado pa' +
          'ra conciliado e vice versa'
        ControlType.Strings = (
          'STATUSCONCILIA;CheckBox;P;N'
          'CONCILIADO;CheckBox;1;0')
        PictureMasks.Strings = (
          'VALORLANCFINAN'#9'#,##0.00;(#,##0.00)'#9'T'#9'T'
          'VALOROUTRAMOEDA'#9'#,##0.00;(#,##0.00)'#9'T'#9'T')
        Selected.Strings = (
          'CONCILIADO'#9'2'#9' '#9'F'
          'DATA'#9'10'#9'Data'#9'F'
          'NUMCHEQUE'#9'11'#9'Documento'#9'F'
          'VALOR'#9'12'#9'Valor'#9'F'
          'DESCRICAO'#9'60'#9'Histórico'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsBanco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = True
        UseTFields = False
        OnTitleButtonClick = dbgExtratoTitleButtonClick
        IndicatorColor = icBlack
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 321
        Height = 21
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Extrato Bancário'
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object pnlMovimFinanc: TPanel
      Left = 1
      Top = 100
      Width = 444
      Height = 248
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      object dbgExtrato: TwwDBGrid
        Left = 0
        Top = 21
        Width = 444
        Height = 227
        Hint = 
          'Duplo Click no campo Status, troca o status de não conciliado pa' +
          'ra conciliado e vice versa'
        ControlType.Strings = (
          'STATUSCONCILIA;CheckBox;P;N')
        PictureMasks.Strings = (
          'VALORLANCFINAN'#9'#,##0.00;(#,##0.00)'#9'T'#9'T'
          'VALOROUTRAMOEDA'#9'#,##0.00;(#,##0.00)'#9'T'#9'T')
        Selected.Strings = (
          'STATUSCONCILIA'#9'2'#9' '#9'F'
          'DATALANCFINAN'#9'10'#9'Data '#9'F'
          'NUMCHQBORDERO'#9'11'#9'Documento'#9'F'
          'ENTRADASAIDA'#9'1'#9'E/S'#9'F'
          'VALORLANCFINAN'#9'12'#9'Valor'#9'F'
          'HISTORICO'#9'60'#9'Histórico'#9'F'
          'VALOROUTRAMOEDA'#9'12'#9'Valor~Outra Moeda'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        Align = alClient
        DataSource = dsExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = True
        UseTFields = False
        OnTitleButtonClick = dbgExtratoTitleButtonClick
        IndicatorColor = icBlack
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 444
        Height = 21
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Movimentação Financeira'
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 423
    Width = 767
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 90007
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Conciliar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 987
    Top = 65531
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object cdsPortador: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 112
    Top = 27
  end
  object cdsExtrato: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'PLNCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'IDMODULO'
        DataType = ftFloat
      end
      item
        Name = 'HISTPADFINAN'
        DataType = ftFloat
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'IDUSUARIOINCLUSAO'
        DataType = ftFloat
      end
      item
        Name = 'CODPORTADOR'
        DataType = ftFloat
      end
      item
        Name = 'VALORLANCFINAN'
        DataType = ftFloat
      end
      item
        Name = 'NUMCHQBORDERO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DATALANCFINAN'
        DataType = ftDateTime
      end
      item
        Name = 'DATACONCILIACAO'
        DataType = ftDateTime
      end
      item
        Name = 'ENTRADASAIDA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'STATUSCONCILIA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCTRANSF'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDNFLIVRO'
        DataType = ftFloat
      end
      item
        Name = 'DATADISPFINANC'
        DataType = ftDateTime
      end
      item
        Name = 'FLGESTORNADO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'AscDATALANCFINAN'
        Fields = 'DATALANCFINAN; NUMCHQBORDERO'
      end
      item
        Name = 'DescDATALANCFINAN'
        Fields = 'DATALANCFINAN; NUMCHQBORDERO'
        Options = [ixDescending]
      end
      item
        Name = 'AscNUMCHQBORDERO'
        Fields = 'NUMCHQBORDERO'
      end
      item
        Name = 'DescNUMCHQBORDERO'
        Fields = 'NUMCHQBORDERO'
        Options = [ixDescending]
      end
      item
        Name = 'AscENTRADASAIDA'
        Fields = 'ENTRADASAIDA;NUMCHQBORDERO'
      end
      item
        Name = 'DescENTRADASAIDA'
        Fields = 'ENTRADASAIDA;NUMCHQBORDERO'
        Options = [ixDescending]
      end
      item
        Name = 'AscVALORLANCFINAN'
        Fields = 'VALORLANCFINAN;NUMCHQBORDERO'
      end
      item
        Name = 'DescVALORLANCFINAN'
        Fields = 'VALORLANCFINAN;NUMCHQBORDERO'
        Options = [ixDescending]
      end
      item
        Name = 'AscVALOROUTRAMOEDA'
        Fields = 'VALOROUTRAMOEDA;NUMCHQBORDERO'
      end
      item
        Name = 'DescVALOROUTRAMOEDA'
        Fields = 'VALOROUTRAMOEDA;NUMCHQBORDERO'
        Options = [ixDescending]
      end
      item
        Name = 'AscHISTORICO'
        Fields = 'HISTORICO;NUMCHQBORDERO'
      end
      item
        Name = 'DescHISTORICO'
        Fields = 'HISTORICO;NUMCHQBORDERO'
        Options = [ixDescending]
      end>
    Params = <>
    StoreDefs = True
    Left = 320
    Top = 200
  end
  object dsExtrato: TwwDataSource
    DataSet = cdsExtrato
    Left = 248
    Top = 200
  end
  object spTeste: TCMSqlParams
    SQL.Strings = (
      'select * from movimfinanc '
      ' ')
    ClientDataSet = cdsExtrato
    Left = 184
    Top = 200
  end
  object dsBanco: TwwDataSource
    DataSet = cdsBanco
    Left = 664
    Top = 184
  end
  object spBanco: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   0     AS CONCILIADO,'
      '   0     AS TIPO,'
      '   0.00  AS VALOR,'
      '   0     AS ID,'
      ''
      '   TO_DATE('#39'01/01/1980'#39', '#39'DD/MM/YYYY'#39') AS DATA,'
      ''
      '   '#39'               '#39' AS NUMCHEQUE,'
      
        '   '#39'                                                            ' +
        #39' AS DESCRICAO'
      ''
      'FROM'
      '   DUAL'
      ''
      'WHERE'
      '   1 = 2')
    ClientDataSet = cdsBanco
    Left = 592
    Top = 200
  end
  object cdsBanco: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CONCILIADO'
        DataType = ftFloat
      end
      item
        Name = 'TIPO'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'ID'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'DATA'
        Attributes = [faReadonly]
        DataType = ftDateTime
      end
      item
        Name = 'NUMCHEQUE'
        Attributes = [faReadonly, faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DESCRICAO'
        Attributes = [faReadonly, faFixed]
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <
      item
        Name = 'AscDATALANCFINAN'
        Fields = 'DATALANCFINAN; NUMCHQBORDERO'
      end
      item
        Name = 'DescDATALANCFINAN'
        Fields = 'DATALANCFINAN; NUMCHQBORDERO'
        Options = [ixDescending]
      end
      item
        Name = 'AscNUMCHQBORDERO'
        Fields = 'NUMCHQBORDERO'
      end
      item
        Name = 'DescNUMCHQBORDERO'
        Fields = 'NUMCHQBORDERO'
        Options = [ixDescending]
      end
      item
        Name = 'AscENTRADASAIDA'
        Fields = 'ENTRADASAIDA;NUMCHQBORDERO'
      end
      item
        Name = 'DescENTRADASAIDA'
        Fields = 'ENTRADASAIDA;NUMCHQBORDERO'
        Options = [ixDescending]
      end
      item
        Name = 'AscVALORLANCFINAN'
        Fields = 'VALORLANCFINAN;NUMCHQBORDERO'
      end
      item
        Name = 'DescVALORLANCFINAN'
        Fields = 'VALORLANCFINAN;NUMCHQBORDERO'
        Options = [ixDescending]
      end
      item
        Name = 'AscVALOROUTRAMOEDA'
        Fields = 'VALOROUTRAMOEDA;NUMCHQBORDERO'
      end
      item
        Name = 'DescVALOROUTRAMOEDA'
        Fields = 'VALOROUTRAMOEDA;NUMCHQBORDERO'
        Options = [ixDescending]
      end
      item
        Name = 'AscHISTORICO'
        Fields = 'HISTORICO;NUMCHQBORDERO'
      end
      item
        Name = 'DescHISTORICO'
        Fields = 'HISTORICO;NUMCHQBORDERO'
        Options = [ixDescending]
      end>
    Params = <>
    StoreDefs = True
    Left = 592
    Top = 184
  end
  object dlgAbreArquivo: TOpenDialog
    DefaultExt = 'txt, tmp'
    Filter = 'Arquivo Quicken|*.ofc;*.ofx|Todos os Arquivos|*.*'
    FilterIndex = 0
    Options = [ofEnableSizing]
    Left = 478
    Top = 4
  end
end
