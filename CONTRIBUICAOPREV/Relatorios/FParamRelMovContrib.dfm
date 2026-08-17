inherited ParamRelMovContrib: TParamRelMovContrib
  Left = 233
  Top = 171
  BorderStyle = bsDialog
  Caption = 'ParamRelMovContrib'
  ClientHeight = 564
  ClientWidth = 823
  DefaultMonitor = dmDesktop
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 823
    Height = 525
    object LabMatricula: TLabel
      Left = 7
      Top = 10
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object LabNome: TLabel
      Left = 110
      Top = 10
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object EdtMatricula: TEdit
      Left = 8
      Top = 25
      Width = 97
      Height = 21
      Color = clGrayText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object EdtNome: TEdit
      Left = 111
      Top = 25
      Width = 420
      Height = 21
      Color = clGrayText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object btPesquisa: TBitBtn
      Left = 532
      Top = 22
      Width = 32
      Height = 25
      TabOrder = 6
      OnClick = btPesquisaClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484848484FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        0000000000FFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF000000000000FFFFFFFFFFFFFFFFFF000000FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF000000FF00
        FFFF00FFFF00FFFF00FF000084FF00FFFF00FF848484FFFFFFFFFFFFFF0000FF
        0000FF0000FFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF000084000084
        FF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF0000
        00FF00FFFF00FFFF00FF000084000084000084FF00FF848484FFFFFFFFFFFFFF
        0000FF0000FF0000FFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF000084
        000084000084000000000000000000000000FFFFFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFF000000FF00FFFF00FFFF00FF000084000000FFFF00FF00FFFFFF00FF
        00FF000000848400FF0000FFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF
        000000FFFF00FF00FFFFFF00FF00FFFFFF00FF00FF000000FFFFFFFFFFFFFFFF
        FF848484848484FF00FFFF00FFFF00FF000000FF00FFFFFF00FF00FFFFFF00FF
        00FFFFFF00000000FFFFFF848484848484FF00FFFF00FFFF00FFFF00FFFF00FF
        000000FFFF00FF00FFFFFF00FF00FFFFFF00FF00FF000000848484FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFFFF00FF00FFFFFF00FF
        00FFFFFF00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF000000FF00FFFFFF00FF00FFFFFF00000000FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000
        0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object btClear: TBitBtn
      Left = 567
      Top = 22
      Width = 32
      Height = 25
      TabOrder = 7
      OnClick = btClearClick
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
      NumGlyphs = 2
    end
    object GBCobranca1: TGroupBox
      Left = 9
      Top = 50
      Width = 170
      Height = 54
      Caption = 'Mês/Ano Inclusão Inicial '
      TabOrder = 0
      object CbMesInicio: TComboBox
        Left = 5
        Top = 21
        Width = 89
        Height = 24
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 0
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
      object seAnoInicio: TSpinEdit
        Left = 97
        Top = 21
        Width = 54
        Height = 26
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 0
      end
    end
    object pnListas: TPanel
      Left = 8
      Top = 160
      Width = 803
      Height = 357
      TabOrder = 8
      object pnPatrocinadora: TPanel
        Left = 6
        Top = 8
        Width = 788
        Height = 77
        TabOrder = 0
        object LabPatrocinadoras: TLabel
          Left = 4
          Top = 0
          Width = 86
          Height = 13
          Caption = 'Patrocinadoras'
        end
        object chkListPatro: TCheckListBox
          Left = 175
          Top = 4
          Width = 455
          Height = 68
          OnClickCheck = chkListPatroClickCheck
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          Style = lbOwnerDrawFixed
          TabOrder = 0
          OnDrawItem = chkListPatroDrawItem
        end
        object btSelTudoPatro: TBitBtn
          Left = 636
          Top = 5
          Width = 140
          Height = 25
          Caption = 'Seleciona Tudo '
          TabOrder = 1
          OnClick = btSelTudoPatroClick
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
        end
        object btDesSelTudoPatro: TBitBtn
          Left = 636
          Top = 32
          Width = 140
          Height = 25
          Caption = 'Inverte Seleção'
          TabOrder = 2
          OnClick = btSelTudoPatroClick
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
        end
      end
      object pnPlanosContabeis: TPanel
        Left = 6
        Top = 86
        Width = 788
        Height = 77
        TabOrder = 1
        object LabPlanosContabeis: TLabel
          Left = 4
          Top = 0
          Width = 99
          Height = 13
          Caption = 'Planos Contábeis'
        end
        object chkListPlanos: TCheckListBox
          Left = 175
          Top = 4
          Width = 455
          Height = 68
          OnClickCheck = chkListPlanosClickCheck
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          Style = lbOwnerDrawFixed
          TabOrder = 0
          OnDrawItem = chkListPlanosDrawItem
        end
        object btSelTudoPlanos: TBitBtn
          Left = 636
          Top = 5
          Width = 140
          Height = 25
          Caption = 'Seleciona Tudo '
          TabOrder = 1
          OnClick = btSelTudoPatroClick
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
        end
        object btDesSelTudoPlanos: TBitBtn
          Left = 636
          Top = 32
          Width = 140
          Height = 25
          Caption = 'Inverte Seleção'
          TabOrder = 2
          OnClick = btSelTudoPatroClick
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
        end
      end
      object pnSituacoesDosPagamentos: TPanel
        Left = 6
        Top = 164
        Width = 788
        Height = 77
        TabOrder = 2
        object LabSituacoesDosParticipantes: TLabel
          Left = 4
          Top = 0
          Width = 163
          Height = 13
          Caption = 'Situações dos Participantes '
        end
        object chkListSituacoes: TCheckListBox
          Left = 175
          Top = 4
          Width = 455
          Height = 69
          OnClickCheck = chkListSituacoesClickCheck
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          Style = lbOwnerDrawFixed
          TabOrder = 0
          OnDrawItem = chkListSituacoesDrawItem
        end
        object btSelTudoSituacoes: TBitBtn
          Left = 636
          Top = 5
          Width = 140
          Height = 25
          Caption = 'Seleciona Tudo '
          TabOrder = 1
          OnClick = btSelTudoPatroClick
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
        end
        object btDesSelTudoSituacoes: TBitBtn
          Left = 636
          Top = 32
          Width = 140
          Height = 25
          Caption = 'Inverte Seleção'
          TabOrder = 2
          OnClick = btSelTudoPatroClick
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
        end
      end
      object pnContribuicoes: TPanel
        Left = 6
        Top = 243
        Width = 788
        Height = 111
        TabOrder = 3
        object LabContribuicoes: TLabel
          Left = 4
          Top = 0
          Width = 78
          Height = 13
          Caption = 'Contribuições'
        end
        object chkListContribuicoes: TCheckListBox
          Left = 175
          Top = 4
          Width = 455
          Height = 89
          OnClickCheck = chkListContribuicoesClickCheck
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          Style = lbOwnerDrawFixed
          TabOrder = 0
          OnDrawItem = chkListContribuicoesDrawItem
        end
        object btSelTudoContribuicoes: TBitBtn
          Left = 636
          Top = 5
          Width = 140
          Height = 25
          Caption = 'Seleciona Tudo '
          TabOrder = 1
          OnClick = btSelTudoPatroClick
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
        end
        object btDesSelTudoContribuicoes: TBitBtn
          Left = 636
          Top = 32
          Width = 140
          Height = 25
          Caption = 'Inverte Seleção'
          TabOrder = 2
          OnClick = btSelTudoPatroClick
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
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 185
      Top = 50
      Width = 170
      Height = 54
      Caption = 'Mês/Ano Inclusão Final  '
      TabOrder = 1
      object CbMesFim: TComboBox
        Left = 5
        Top = 21
        Width = 89
        Height = 24
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 0
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
      object seAnoFim: TSpinEdit
        Left = 97
        Top = 21
        Width = 54
        Height = 26
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 9
      Top = 106
      Width = 170
      Height = 54
      Caption = 'Data Base'
      TabOrder = 2
      object cmdtDataBase: TCMDateTimePicker
        Left = 30
        Top = 21
        Width = 116
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
        OnExit = cmdtDataBaseExit
      end
    end
    object rgApresentacao: TRadioGroup
      Left = 638
      Top = 50
      Width = 147
      Height = 71
      BiDiMode = bdLeftToRight
      Caption = 'Apresentação '
      ItemIndex = 0
      Items.Strings = (
        'Por Plano'
        'Por Participante')
      ParentBiDiMode = False
      TabOrder = 3
      OnClick = rgApresentacaoClick
    end
  end
  inherited Dock971: TDock97
    Top = 525
    Width = 823
    inherited tb97Fundo: TToolbar97
      Left = 651
      DockPos = 711
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 482
      DockPos = 541
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 371
    Top = 107
    TargetsData = (
      1
      3
      (
        ''
        'Filter'
        0)
      (
        ''
        'Title'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'CPF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ELEGPATRO'
      'PESSOA')
    CamposChave.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '60'
      '18')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 368
    Top = 56
  end
end
