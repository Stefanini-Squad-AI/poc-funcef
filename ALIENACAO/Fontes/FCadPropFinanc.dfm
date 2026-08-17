inherited frmCadPropFinanc: TfrmCadPropFinanc
  Left = 288
  Top = 143
  HelpContext = 1350024
  Caption = 'Proposta de Alienação'
  ClientHeight = 453
  ClientWidth = 822
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 822
    Height = 367
    inherited pnlMestre: TPanel
      Width = 820
      Height = 110
      object lblNumProp: TLabel
        Left = 8
        Top = 1
        Width = 87
        Height = 13
        Caption = 'Nº da Proposta'
        FocusControl = edNumCont
      end
      object Label2: TLabel
        Left = 119
        Top = 1
        Width = 33
        Height = 13
        Caption = 'Nome'
        FocusControl = edNomeCont
      end
      object Label3: TLabel
        Left = 8
        Top = 37
        Width = 82
        Height = 13
        Caption = 'Data Proposta'
        FocusControl = edNomeCont
      end
      object Label15: TLabel
        Left = 404
        Top = 73
        Width = 65
        Height = 13
        Caption = 'Corretagem'
        FocusControl = edNomeCont
      end
      object Label19: TLabel
        Left = 119
        Top = 73
        Width = 90
        Height = 13
        Caption = 'Valor Avaliação'
        FocusControl = edNomeCont
      end
      object Label20: TLabel
        Left = 214
        Top = 73
        Width = 80
        Height = 13
        Caption = 'Valor Contabil'
        FocusControl = edNomeCont
      end
      object Label30: TLabel
        Left = 461
        Top = 90
        Width = 10
        Height = 13
        Caption = '%'
        FocusControl = edNomeCont
      end
      object Label21: TLabel
        Left = 479
        Top = 36
        Width = 154
        Height = 13
        Caption = 'Responsável pelo Contrato'
      end
      object lblComprador: TLabel
        Left = 807
        Top = -4
        Width = 61
        Height = 13
        Caption = 'Comprador'
        Enabled = False
        Visible = False
      end
      object Label44: TLabel
        Left = 479
        Top = 73
        Width = 154
        Height = 13
        Caption = 'Administradora do Contrato'
      end
      object Label48: TLabel
        Left = 8
        Top = 73
        Width = 91
        Height = 13
        Caption = 'Data Assinatura'
        FocusControl = edNomeCont
      end
      object Label50: TLabel
        Left = 309
        Top = 73
        Width = 70
        Height = 13
        Caption = 'Valor Venda'
        FocusControl = edNomeCont
      end
      object edNumCont: TDBEdit
        Left = 8
        Top = 15
        Width = 102
        Height = 21
        DataField = 'CONNUMERO'
        DataSource = ds
        TabOrder = 0
      end
      object edNomeCont: TDBEdit
        Left = 119
        Top = 15
        Width = 623
        Height = 21
        DataField = 'CONNOME'
        DataSource = ds
        TabOrder = 1
      end
      object edDataProp: TCMDateTimePicker
        Left = 8
        Top = 51
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
        ShowButton = True
        TabOrder = 2
      end
      object edPercComiss: TDBRealEdit
        Left = 404
        Top = 87
        Width = 55
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 11
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'CONTAXAADMIN'
        DataSource = ds
      end
      object edValAvali: TDBRealEdit
        Left = 119
        Top = 87
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 8
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'CONVLRAJUSTADO'
        DataSource = ds
      end
      object edValContab: TDBRealEdit
        Left = 214
        Top = 87
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
        TabOrder = 9
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRCONTABIL'
        DataSource = ds
      end
      object DBedtResponsavel: TDBEdit2
        Left = 479
        Top = 51
        Width = 216
        Height = 21
        TabStop = False
        DataField = 'NOMRESPONSAVEL'
        DataSource = ds
        Enabled = False
        TabOrder = 4
      end
      object btnBuscaResp: TBitBtn
        Left = 696
        Top = 51
        Width = 24
        Height = 22
        Hint = 'Busca um Responsável'
        TabOrder = 5
        OnClick = btnBuscaRespClick
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
      object dbedtComprador: TDBEdit2
        Left = 807
        Top = 11
        Width = 350
        Height = 21
        TabStop = False
        DataField = 'RAZAOSOCIAL'
        DataSource = ds
        Enabled = False
        TabOrder = 3
        Visible = False
      end
      object btnLimpaResp: TBitBtn
        Left = 720
        Top = 51
        Width = 24
        Height = 22
        Hint = 'Limpa a seleção do Responsável'
        TabOrder = 6
        OnClick = btnLimpaRespClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
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
      object dbEdtAdmin: TDBEdit2
        Left = 479
        Top = 88
        Width = 216
        Height = 21
        TabStop = False
        DataField = 'NOMADMINIMOVEL'
        DataSource = ds
        Enabled = False
        TabOrder = 12
      end
      object btnBuscaAdmin: TBitBtn
        Left = 696
        Top = 88
        Width = 24
        Height = 22
        Hint = 'Busca uma Administradora'
        TabOrder = 13
        OnClick = btnBuscaAdminClick
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
      object btnLimpaAdmin: TBitBtn
        Left = 720
        Top = 88
        Width = 24
        Height = 22
        Hint = 'Limpa a seleção da Administradora'
        TabOrder = 14
        OnClick = btnLimpaAdminClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
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
      object CMDateTimePicker1: TCMDateTimePicker
        Left = 8
        Top = 87
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
        TabOrder = 7
      end
      object DBRealEdit4: TDBRealEdit
        Left = 309
        Top = 87
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
        TabOrder = 10
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRPROPOSTA'
        DataSource = ds
      end
      inline molComprador1: TmolComprador
        Left = 113
        Top = 37
        Width = 363
        Height = 36
        TabOrder = 15
        inherited Label1: TLabel
          Left = 6
          Top = 1
        end
        inherited edtRazaoSocial: TEdit
          Left = 6
          Top = 14
          Width = 305
        end
        inherited btnBuscaForn: TBitBtn
          Left = 312
          Top = 13
          OnClick = molComprador1btnBuscaFornClick
        end
        inherited btnLimpaForn: TBitBtn
          Left = 336
          Top = 13
        end
      end
      object cbVGV: TCheckBox
        Left = 752
        Top = 16
        Width = 49
        Height = 17
        Caption = 'VGV'
        TabOrder = 16
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 111
      Width = 820
      Height = 255
      Tabs.Strings = (
        'Imóveis'
        'Aluguel'
        'Cond. de Pagamento'
        'Multa / Juros'
        'Cobrança'
        'Obs'
        'Eventos'
        'Análise Inicial'
        'Parcelas'
        'Fiança'
        'Fiadores')
      detdbGrids.Strings = (
        'dbgrdDet'
        ''
        'grdCondPag'
        'grdMultaJuros'
        ''
        ''
        'grdEvento'
        ''
        ''
        ''
        'grdFiador')
      inherited pgctrlDetalhe: TPageControl
        Width = 722
        Height = 196
        ActivePage = TabCond
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 714
            Height = 168
            Selected.Strings = (
              'MESTRE'#9'38'#9'Mestre'
              'IMONOME'#9'28'#9'Imovel'
              'CIMVLRALUGUEL'#9'14'#9'Vlr Aluguel'
              'CAL_ORIGEM'#9'20'#9'Origem'
              'IMOAREA'#9'10'#9'Area'
              'VLRVENDA'#9'14'#9'Vlr Alienação'
              'VLRCONTABIL'#9'14'#9'Vlr Contábil'
              'FLGRATEIO'#9'10'#9'Parcial'
              'CIMPERCENTRATEIO'#9'10'#9'Rateio')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          end
          inherited pnlControlesDet: TPanel
            Width = 714
            Height = 168
            object Label9: TLabel
              Left = 21
              Top = 44
              Width = 94
              Height = 13
              Caption = 'Valor do Aluguel'
            end
            object Label42: TLabel
              Left = 414
              Top = 44
              Width = 108
              Height = 13
              Caption = 'Valor de Alienação'
            end
            object Label43: TLabel
              Left = 218
              Top = 44
              Width = 83
              Height = 13
              Caption = 'Saldo Contabil'
            end
            object Label55: TLabel
              Left = 218
              Top = 87
              Width = 103
              Height = 26
              Caption = 'Percentual Sobre o Saldo Contábil'
              WordWrap = True
            end
            object Label56: TLabel
              Left = 329
              Top = 117
              Width = 10
              Height = 13
              Caption = '%'
            end
            object edValAluguel: TDBRealEdit
              Left = 21
              Top = 58
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 0
              WordWrap = False
              OnChange = edValAluguelChange
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'CIMVLRALUGUEL'
              DataSource = dsDet
            end
            object edValContabil: TDBRealEdit
              Left = 218
              Top = 58
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRCONTABIL'
              DataSource = dsDet
            end
            object edValAliena: TDBRealEdit
              Left = 414
              Top = 58
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRVENDA'
              DataSource = dsDet
            end
            object DBchkRateio: TDBCheckBox
              Left = 24
              Top = 116
              Width = 177
              Height = 17
              Caption = 'Alienação Parcial do Imóvel'
              DataField = 'FLGRATEIO'
              DataSource = dsDet
              TabOrder = 3
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbEdtPercentRateio: TDBRealEdit
              Left = 218
              Top = 114
              Width = 102
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 4
              WordWrap = False
              IntDigits = 8
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'CIMPERCENTRATEIO'
              DataSource = dsDet
            end
            inline molImovelAtivo1: TmolImovelAtivo
              Left = 13
              Top = 2
              Width = 540
              TabOrder = 5
              inherited edtImovel: TEdit
                Width = 465
              end
              inherited btnBuscaImovel: TBitBtn
                Left = 474
                OnClick = molImovelAtivo1btnBuscaImovelClick
              end
              inherited btnLimpaImovel: TBitBtn
                Left = 498
                OnClick = molImovelAtivo1btnLimpaImovelClick
              end
            end
          end
        end
        object tabAlug: TTabSheet
          Caption = 'Aluguel'
          object Label16: TLabel
            Left = 43
            Top = 9
            Width = 127
            Height = 13
            Caption = 'Valor Total do Aluguel'
            FocusControl = edNomeCont
          end
          object sbMediaAluguel: TSpeedButton
            Left = 191
            Top = 23
            Width = 198
            Height = 23
            Hint = 
              'Calcula o valor médio dos aluguéis para os imóveis sem valor de ' +
              'aluguel definido'
            Caption = 'Calcula aluguéis pelo valor médio'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
              73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
              0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
              0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
              0333337F777777737F333308888888880333337F333333337F33330888888888
              03333373FFFFFFFF733333700000000073333337777777773333}
            NumGlyphs = 2
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sbMediaAluguelClick
          end
          object Label18: TLabel
            Left = 423
            Top = 9
            Width = 75
            Height = 13
            Caption = 'Aluguel Ideal'
            FocusControl = edNomeCont
          end
          object Label17: TLabel
            Left = 489
            Top = 29
            Width = 10
            Height = 13
            Caption = '%'
            FocusControl = edNomeCont
          end
          object edValTotAlug: TDBRealEdit
            Left = 43
            Top = 25
            Width = 130
            Height = 21
            Alignment = taRightJustify
            Color = 14876158
            Enabled = False
            Lines.Strings = (
              '0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'CONVLRTOTAL'
            DataSource = ds
          end
          object gbReajuste: TGroupBox
            Left = 38
            Top = 54
            Width = 569
            Height = 112
            Caption = 'Reajuste'
            TabOrder = 1
            object Label5: TLabel
              Left = 48
              Top = 63
              Width = 36
              Height = 13
              Caption = 'Indice'
            end
            object Label6: TLabel
              Left = 280
              Top = 63
              Width = 60
              Height = 13
              Caption = 'Data Base'
            end
            object Label8: TLabel
              Left = 448
              Top = 63
              Width = 78
              Height = 13
              Caption = 'Periodicidade'
            end
            object Label34: TLabel
              Left = 502
              Top = 87
              Width = 37
              Height = 13
              Caption = 'Meses'
            end
            object Label7: TLabel
              Left = 48
              Top = 17
              Width = 270
              Height = 13
              Caption = 'Seleciona pelo reajuste dos aluguéis existentes'
            end
            object dblcIndCorAlug: TCMDBLookupCombo
              Left = 48
              Top = 79
              Width = 209
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOEDESC'#9'20'#9'Descrição'#9'F')
              DataField = 'CONINDICEREAJUSTE'
              DataSource = ds
              LookupTable = qryMoeda
              LookupField = 'MOECODIGO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object edDataReajAlug: TCMDateTimePicker
              Left = 280
              Top = 79
              Width = 137
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'CONDATAREAJUSTE'
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
              ShowButton = True
              TabOrder = 1
            end
            object DBspnPeriodicidadeReajuste: TwwDBSpinEdit
              Left = 448
              Top = 79
              Width = 49
              Height = 21
              Increment = 1
              DataField = 'CONPERREAJUSTE'
              DataSource = ds
              TabOrder = 2
              UnboundDataType = wwDefault
            end
            object dblcReajuste: TCMDBLookupCombo
              Left = 48
              Top = 32
              Width = 489
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOEDESC'#9'20'#9'Indice'#9'F'
                'CONDATAREAJUSTE'#9'18'#9'Data Base'#9'F'
                'CONPERREAJUSTE'#9'5'#9'Período'#9'F'
                'QTDE'#9'5'#9'                    Qtde Imóveis'#9'F')
              LookupTable = qryReajuste
              LookupField = 'CHAVE'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcReajusteCloseUp
            end
          end
          object edPercIdeal: TDBRealEdit
            Left = 423
            Top = 25
            Width = 63
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'PERALUGUELIDEAL'
            DataSource = ds
          end
        end
        object TabCond: TTabSheet
          Caption = 'Cond. Pagamento'
          object grdCondPag: TwwDBGrid
            Left = 0
            Top = 0
            Width = 714
            Height = 168
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
              'cal_forma'#9'74'#9'Forma de Calculo'#9'F'
              'PERINDPROJ'#9'15'#9'Indice Projetado'#9'F'
              'DATACARENCIA'#9'18'#9'Carência'#9'F'
              'FLGJURCARENCIA'#9'1'#9'Juros na Carência'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsCondPag
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
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
            Width = 714
            Height = 168
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblIndCorrec: TLabel
              Left = 139
              Top = 47
              Width = 91
              Height = 13
              Caption = 'Indice Correção'
            end
            object Label11: TLabel
              Left = 139
              Top = 4
              Width = 96
              Height = 13
              Caption = 'Valor Financiado'
            end
            object Label12: TLabel
              Left = 245
              Top = 4
              Width = 100
              Height = 13
              Caption = 'Término Carência'
            end
            object lblJuros: TLabel
              Left = 460
              Top = 47
              Width = 31
              Height = 13
              Caption = 'Juros'
            end
            object lblNumParc: TLabel
              Left = 460
              Top = 4
              Width = 50
              Height = 13
              Caption = 'Parcelas'
            end
            object lblPerc: TLabel
              Left = 553
              Top = 67
              Width = 10
              Height = 13
              Caption = '%'
              FocusControl = edNomeCont
            end
            object lblIndProj: TLabel
              Left = 245
              Top = 47
              Width = 90
              Height = 13
              Caption = 'Indice Projeção'
            end
            object lblPeriod: TLabel
              Left = 569
              Top = 48
              Width = 78
              Height = 13
              Caption = 'Periodicidade'
            end
            object Label46: TLabel
              Left = 244
              Top = 94
              Width = 96
              Height = 13
              Caption = 'Utilizar indice de'
            end
            object Label47: TLabel
              Left = 244
              Top = 109
              Width = 112
              Height = 13
              Caption = 'mes(es) anterior(es)'
            end
            object lblPerProj: TLabel
              Left = 139
              Top = 87
              Width = 77
              Height = 13
              Caption = 'CM Projetada'
            end
            object lblPerProj2: TLabel
              Left = 206
              Top = 109
              Width = 10
              Height = 13
              Caption = '%'
              FocusControl = edNomeCont
            end
            object Label49: TLabel
              Left = 352
              Top = 4
              Width = 83
              Height = 13
              Caption = '1º Vencimento'
            end
            object lblJurCarencia: TLabel
              Left = 506
              Top = 107
              Width = 154
              Height = 13
              Caption = 'o período sem amortização'
            end
            object Label64: TLabel
              Left = 352
              Top = 47
              Width = 86
              Height = 13
              Caption = '1ª Amortização'
            end
            object edDataCarencia: TCMDateTimePicker
              Left = 245
              Top = 21
              Width = 96
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATACARENCIA'
              DataSource = dsCondPag
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
            object edValParc: TDBRealEdit
              Left = 139
              Top = 21
              Width = 97
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRFINANC'
              DataSource = dsCondPag
            end
            object edtJuros: TDBRealEdit
              Left = 460
              Top = 63
              Width = 92
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,0000000000')
              TabOrder = 9
              WordWrap = False
              IntDigits = 14
              DecDigits = 10
              NumberFormat = fNumber
              Signal = False
              DataField = 'TAXAJUROS'
              DataSource = dsCondPag
            end
            object dblcIndCorrec: TCMDBLookupCombo
              Left = 139
              Top = 63
              Width = 97
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'10'#9'Sigla'#9'F'
                'FLGPERCVALOR'#9'1'#9'Tipo'#9'F')
              DataField = 'INDCORRECAO'
              DataSource = dsCondPag
              LookupTable = qryMoeda
              LookupField = 'MOECODIGO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object edtNumParc: TDBRealEdit
              Left = 460
              Top = 21
              Width = 50
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 4
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
              DataField = 'NUMPARCELAS'
              DataSource = dsCondPag
            end
            object dblcIndProj: TCMDBLookupCombo
              Left = 245
              Top = 63
              Width = 96
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'10'#9'Sigla'#9'F'
                'FLGPERCVALOR'#9'1'#9'Tipo'#9'F')
              DataField = 'IDINDCORRPROJ'
              DataSource = dsCondPag
              LookupTable = qryMoeda
              LookupField = 'MOECODIGO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object gbIntervalo: TGroupBox
              Left = 518
              Top = 3
              Width = 129
              Height = 44
              Caption = 'Periodicidade Parc.'
              TabOrder = 5
              object dbspnPeriodo: TwwDBSpinEdit
                Left = 14
                Top = 18
                Width = 37
                Height = 21
                Increment = 1
                DataField = 'PERIODO'
                DataSource = dsCondPag
                TabOrder = 0
                UnboundDataType = wwDefault
              end
              object dbcbPerParc: TwwDBComboBox
                Left = 57
                Top = 18
                Width = 63
                Height = 21
                ShowButton = True
                Style = csDropDownList
                MapList = True
                AllowClearKey = False
                DataField = 'PRAZO'
                DataSource = dsCondPag
                DropDownCount = 5
                ItemHeight = 13
                Items.Strings = (
                  'Mês'#9'M'
                  'Ano'#9'A')
                Sorted = False
                TabOrder = 1
                UnboundDataType = wwDefault
              end
            end
            object dbcbPerJur: TwwDBComboBox
              Left = 568
              Top = 63
              Width = 79
              Height = 21
              ShowButton = True
              Style = csDropDownList
              MapList = True
              AllowClearKey = False
              DataField = 'PERIODOTAXA'
              DataSource = dsCondPag
              DropDownCount = 5
              ItemHeight = 13
              Items.Strings = (
                'Mensal'#9'M'
                'Anual Simples'#9'A'
                'Anual Composto'#9'C')
              Sorted = False
              TabOrder = 10
              UnboundDataType = wwDefault
            end
            object dbrgTipoCond: TDBRadioGroup
              Left = 3
              Top = 4
              Width = 129
              Height = 104
              Caption = 'Tipo de Pagamento'
              DataField = 'TIPOCONDPAG'
              DataSource = dsCondPag
              Items.Strings = (
                'A Vista'
                'Sinal'
                'Caução'
                'Parcelamento')
              TabOrder = 0
              Values.Strings = (
                'V'
                'S'
                'C'
                'P')
              OnChange = dbrgTipoCondChange
            end
            object dbedtMesRefReajuste: TwwDBSpinEdit
              Left = 343
              Top = 89
              Width = 33
              Height = 21
              Increment = 1
              MaxValue = 9
              DataField = 'MESREFREAJUSTE'
              DataSource = dsCondPag
              TabOrder = 12
              UnboundDataType = wwDefault
            end
            object GroupBox3: TGroupBox
              Left = 3
              Top = 124
              Width = 646
              Height = 43
              Caption = 'Forma de Calculo'
              TabOrder = 14
              object dbcbFormaCalculo: TwwDBComboBox
                Left = 9
                Top = 15
                Width = 624
                Height = 21
                ShowButton = True
                Style = csDropDownList
                MapList = True
                AllowClearKey = True
                AutoDropDown = True
                ShowMatchText = True
                DataField = 'FORMACALCULO'
                DataSource = dsCondPag
                DropDownCount = 6
                DropDownWidth = 640
                ItemHeight = 0
                Items.Strings = (
                  
                    'Correção Mensal sobre Saldo Devedor, Parcela calculada sobre sal' +
                    'do devedor por parcelas restantes '#9'18'
                  'FIXA - Sem juros e sem correção'#9'9'
                  
                    'JUROS MENSAL - Atualização mensal da parcela, pelo valor da parc' +
                    'ela anterior, sem alteração do saldo devedor'#9'20'
                  
                    'JUROS MENSAL - Atualização mensal da parcela, sem alteração do s' +
                    'saldo devedor'#9'19'
                  
                    'JUROS MENSAL - Corrige Saldo Dev. COMPOSTO mensal, Juros sobre S' +
                    'aldo Dev. COMPOSTO e Parcela'#9'11'
                  
                    'JUROS MENSAL - Sobre Saldo Dev. e Parcela, com correção e recalc' +
                    'ulo anual'#9'6'
                  'PRICE - Correção Mensal da Parcela'#9'15'
                  
                    'PRICE - Corrige Saldo Dev. anual, Incorpora resíduo, Recalculo a' +
                    'nual da Parcela'#9'1'
                  
                    'PRICE - Corrige Saldo Dev. anual, Não incorpora resíduo, Recalcu' +
                    'lo anual da parcela'#9'4'
                  
                    'PRICE - Corrige Saldo Dev. mensal, parcela fixa com indice proje' +
                    'tado'#9'10'
                  'PRICE - Corrige Saldo Dev. mensal, recalculo anual da Parcela'#9'2'
                  
                    'PRICE - Corrige Saldo Dev. mensal, Sem Recalculo, com Correção a' +
                    'nual da Parcela'#9'14'
                  
                    'PRICE - Corrige Saldo Dev. mensal, Sem Recalculo, com Correção n' +
                    'a Parcela'#9'3'
                  'SAC - Calcula Correção e Juros mensal sobre a Parcela'#9'13'
                  'SAC - Calcula Juros e Correção mensal sobre o Saldo Devedor'#9'16'
                  'SAC - Calcula Juros sobre a Parcela com geração de resíduo'#9'17'
                  
                    'SAC - Corrige Saldo Dev. Anual, Calcula Juros sobre a Parcela, R' +
                    'ecalculo anual da parcela'#9'8'
                  
                    'SAC - Corrige Saldo Dev. Anual, Calcula Juros sobre Saldo Devedo' +
                    'r, Recaculo anual da parcela'#9'12')
                Sorted = True
                TabOrder = 0
                UnboundDataType = wwDefault
              end
            end
            object edtPerProj: TDBRealEdit
              Left = 139
              Top = 103
              Width = 65
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,000000')
              TabOrder = 11
              WordWrap = False
              IntDigits = 10
              DecDigits = 6
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERINDPROJ'
              DataSource = dsCondPag
            end
            object edDataIniParc: TCMDateTimePicker
              Left = 352
              Top = 21
              Width = 96
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAVENCIMENTO'
              DataSource = dsCondPag
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
            object dbcbJurosCarencia: TDBCheckBox
              Left = 485
              Top = 91
              Width = 192
              Height = 17
              Caption = 'Gera parcela de Juros durante'
              DataField = 'FLGJURCARENCIA'
              DataSource = dsCondPag
              TabOrder = 13
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object CMDateTimePicker3: TCMDateTimePicker
              Left = 352
              Top = 63
              Width = 96
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINIAMORTIZ'
              DataSource = dsCondPag
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
              TabOrder = 8
            end
            object gbPeriodoReajuste: TGroupBox
              Left = 379
              Top = 85
              Width = 99
              Height = 41
              Caption = ' Per. Reajuste '
              TabOrder = 15
              object Label72: TLabel
                Left = 54
                Top = 19
                Width = 36
                Height = 13
                Caption = 'meses'
              end
              object wwDBSpinEdit1: TwwDBSpinEdit
                Left = 13
                Top = 15
                Width = 37
                Height = 21
                Increment = 1
                DataField = 'PERIODOREAJUSTE'
                DataSource = dsCondPag
                TabOrder = 0
                UnboundDataType = wwDefault
              end
            end
          end
        end
        object tabMulta: TTabSheet
          Caption = 'Multa / Juros'
          ImageIndex = 6
          object grdMultaJuros: TwwDBGrid
            Left = 0
            Top = 0
            Width = 714
            Height = 168
            Selected.Strings = (
              'DATAINI'#9'10'#9'Data Início'#9'F'
              'DATAFIM'#9'10'#9'Data Fim'#9'F'
              'FLGINDETERMINADO'#9'12'#9'Indeterminado'#9'F'
              'DSCINDCORR'#9'12'#9'Ind. Correção'#9'F'
              'MESREFCORRECAO'#9'11'#9'Mês Correção'#9'F'
              'VLRMULTA'#9'8'#9'Vlr. Multa'#9'F'
              'DSCMOEMULTA'#9'11'#9'Moeda Multa'#9'F'
              'PERCMULTA'#9'7'#9'Multa'#9'F'
              'VLRJUROS'#9'8'#9'Vlr. Juros'#9'F'
              'DSCMOEJUROS'#9'10'#9'Moeda Juros'#9'F'
              'PERCJUROS'#9'6'#9'Juros'#9'F'
              'DSCPERIODOJUROS'#9'6'#9'Período Juros'#9'F'
              'FLGJUROSPROPORC'#9'11'#9'Proporcionais'#9'F'
              'DIASTOLERANCIA'#9'13'#9'Dias Tolerância'#9'F'
              'DSCTIPODIATOLERA'#9'13'#9'Tipo Dia Tolerância'#9'F'
              'DIASREPASSE'#9'11'#9'Dias Repasse'#9'F'
              'DSCTIPODIAREPASS'#9'13'#9'Tipo Dia Repasse'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsMultaJuros
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
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
          object pnlMultaJuros: TPanel
            Left = 0
            Top = 0
            Width = 714
            Height = 168
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object grpMulta: TGroupBox
              Left = 1
              Top = -1
              Width = 382
              Height = 57
              Caption = ' Multa por atraso '
              TabOrder = 2
              TabStop = True
              object Label1: TLabel
                Left = 355
                Top = 30
                Width = 16
                Height = 20
                Caption = '%'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label23: TLabel
                Left = 16
                Top = 13
                Width = 30
                Height = 13
                Caption = 'Valor'
              end
              object Label32: TLabel
                Left = 294
                Top = 13
                Width = 62
                Height = 13
                Caption = 'Percentual'
              end
              object Label33: TLabel
                Left = 262
                Top = 30
                Width = 21
                Height = 20
                Caption = 'ou'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label35: TLabel
                Left = 120
                Top = 13
                Width = 39
                Height = 13
                Caption = 'Moeda'
              end
              object DBedtPercentMulta: TDBRealEdit
                Left = 294
                Top = 27
                Width = 55
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 2
                WordWrap = False
                IntDigits = 7
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'PERCMULTA'
                DataSource = dsMultaJuros
              end
              object DBedtVlrMulta: TDBRealEdit
                Left = 16
                Top = 27
                Width = 97
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 0
                WordWrap = False
                IntDigits = 15
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'VLRMULTA'
                DataSource = dsMultaJuros
              end
              object DBcboMoedaMulta: TwwDBLookupCombo
                Left = 120
                Top = 27
                Width = 129
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'MOESIGLA'#9'10'#9'Sigla'#9'F'
                  'FLGPERCVALOR'#9'1'#9'Tipo'#9'F')
                DataField = 'MOEDAMULTA'
                DataSource = dsMultaJuros
                LookupTable = qryMoeda
                LookupField = 'MOECODIGO'
                Options = [loTitles]
                Style = csDropDownList
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
            end
            object grpMora: TGroupBox
              Left = 389
              Top = -1
              Width = 279
              Height = 106
              Caption = ' Juros de Mora '
              TabOrder = 0
              TabStop = True
              object Label36: TLabel
                Left = 11
                Top = 13
                Width = 30
                Height = 13
                Caption = 'Valor'
              end
              object Label37: TLabel
                Left = 121
                Top = 63
                Width = 16
                Height = 20
                Caption = '%'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label38: TLabel
                Left = 51
                Top = 49
                Width = 62
                Height = 13
                Caption = 'Percentual'
              end
              object Label39: TLabel
                Left = 20
                Top = 63
                Width = 21
                Height = 20
                Caption = 'ou'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label40: TLabel
                Left = 145
                Top = 13
                Width = 39
                Height = 13
                Caption = 'Moeda'
              end
              object Label45: TLabel
                Left = 145
                Top = 49
                Width = 78
                Height = 13
                Caption = 'Periodicidade'
              end
              object DBedtVlrMora: TDBRealEdit
                Left = 11
                Top = 27
                Width = 105
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 0
                WordWrap = False
                IntDigits = 15
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'VLRJUROS'
                DataSource = dsMultaJuros
              end
              object DBedtPercentMora: TDBRealEdit
                Left = 51
                Top = 63
                Width = 65
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,0000')
                TabOrder = 2
                WordWrap = False
                IntDigits = 10
                DecDigits = 4
                NumberFormat = fNumber
                Signal = False
                DataField = 'PERCJUROS'
                DataSource = dsMultaJuros
              end
              object DBedtMoedaMora: TwwDBLookupCombo
                Left = 145
                Top = 27
                Width = 123
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'MOESIGLA'#9'10'#9'Sigla'#9'F'
                  'FLGPERCVALOR'#9'1'#9'Tipo'#9'F')
                DataField = 'MOEDAJUROS'
                DataSource = dsMultaJuros
                LookupTable = qryMoeda
                LookupField = 'MOECODIGO'
                Options = [loTitles]
                Style = csDropDownList
                DropDownCount = 6
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object dblcPeriodicidade: TwwDBComboBox
                Left = 145
                Top = 63
                Width = 123
                Height = 21
                ShowButton = True
                Style = csDropDownList
                MapList = True
                AllowClearKey = False
                DataField = 'PERIODOJUROS'
                DataSource = dsMultaJuros
                DropDownCount = 5
                ItemHeight = 13
                Items.Strings = (
                  'Diária'#9'D'
                  'Mensal'#9'M')
                Sorted = False
                TabOrder = 3
                UnboundDataType = wwDefault
              end
              object cbcbMoraProporc: TDBCheckBox
                Left = 12
                Top = 85
                Width = 205
                Height = 17
                Caption = 'Mora proporcional ao nº de dias'
                DataField = 'FLGJUROSPROPORC'
                DataSource = dsMultaJuros
                TabOrder = 4
                ValueChecked = 'S'
                ValueUnchecked = 'N'
              end
            end
            object GroupBox4: TGroupBox
              Left = 1
              Top = 60
              Width = 208
              Height = 115
              Caption = 'Dias de Limite'
              TabOrder = 3
              object Label54: TLabel
                Left = 7
                Top = 19
                Width = 61
                Height = 13
                Caption = 'Tolerância'
              end
              object Label60: TLabel
                Left = 111
                Top = 19
                Width = 50
                Height = 13
                Caption = 'Repasse'
              end
              object Bevel1: TBevel
                Left = 102
                Top = 20
                Width = 7
                Height = 89
                Shape = bsLeftLine
              end
              object DBspnDiaTolerancia: TwwDBSpinEdit
                Left = 9
                Top = 33
                Width = 49
                Height = 21
                Increment = 1
                MaxValue = 31
                DataField = 'DIASTOLERANCIA'
                DataSource = dsMultaJuros
                TabOrder = 0
                UnboundDataType = wwDefault
                OnChange = DBspnDiaToleranciaChange
              end
              object DBrdgTipoDiaTolera: TDBRadioGroup
                Left = 5
                Top = 54
                Width = 91
                Height = 53
                DataField = 'FLGTIPODIATOLERA'
                DataSource = dsMultaJuros
                Enabled = False
                Items.Strings = (
                  'Dias'
                  'Dias úteis')
                TabOrder = 1
                Values.Strings = (
                  'C'
                  'U')
              end
              object DBspnDiaRepasse: TwwDBSpinEdit
                Left = 111
                Top = 33
                Width = 49
                Height = 21
                Increment = 1
                MaxValue = 31
                DataField = 'DIASREPASSE'
                DataSource = dsMultaJuros
                TabOrder = 2
                UnboundDataType = wwDefault
                OnChange = DBspnDiaRepasseChange
              end
              object DBrdgTipoDiaRepasse: TDBRadioGroup
                Left = 111
                Top = 54
                Width = 91
                Height = 53
                DataField = 'FLGTIPODIAREPASS'
                DataSource = dsMultaJuros
                Enabled = False
                Items.Strings = (
                  'Dias'
                  'Dias úteis')
                TabOrder = 3
                Values.Strings = (
                  'C'
                  'U')
              end
            end
            object GroupBox1: TGroupBox
              Left = 215
              Top = 60
              Width = 168
              Height = 115
              Caption = 'Correção Monetária'
              TabOrder = 1
              object Label58: TLabel
                Left = 7
                Top = 19
                Width = 36
                Height = 13
                Caption = 'Índice'
              end
              object Label59: TLabel
                Left = 8
                Top = 77
                Width = 96
                Height = 13
                Caption = 'Utilizar indice de'
              end
              object Label63: TLabel
                Left = 7
                Top = 92
                Width = 112
                Height = 13
                Caption = 'mes(es) anterior(es)'
              end
              object dblcbIndCM: TCMDBLookupCombo
                Left = 6
                Top = 33
                Width = 156
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'MOESIGLA'#9'10'#9'Sigla'#9'F'
                  'FLGPERCVALOR'#9'1'#9'Tipo'#9'F')
                DataField = 'IDINDCORRECAO'
                DataSource = dsMultaJuros
                LookupTable = qryMoeda
                LookupField = 'MOECODIGO'
                Options = [loTitles]
                Style = csDropDownList
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
                OnChange = dblcbIndCMChange
              end
              object dbSpinMesesAnteriores: TwwDBSpinEdit
                Left = 108
                Top = 70
                Width = 49
                Height = 21
                Increment = 1
                MaxValue = 9
                DataField = 'MESREFCORRECAO'
                DataSource = dsMultaJuros
                Enabled = False
                TabOrder = 1
                UnboundDataType = wwDefault
              end
            end
            object GroupBox2: TGroupBox
              Left = 389
              Top = 105
              Width = 279
              Height = 70
              Caption = 'Vigência'
              TabOrder = 4
              object Label61: TLabel
                Left = 9
                Top = 14
                Width = 66
                Height = 13
                Caption = 'Data Inicial'
              end
              object Label62: TLabel
                Left = 133
                Top = 14
                Width = 59
                Height = 13
                Caption = 'Data Final'
              end
              object edDataIniVigencia: TCMDateTimePicker
                Left = 9
                Top = 28
                Width = 96
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAINI'
                DataSource = dsMultaJuros
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
              object edDataFimVigencia: TCMDateTimePicker
                Left = 133
                Top = 28
                Width = 96
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAFIM'
                DataSource = dsMultaJuros
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
                OnChange = edDataFimVigenciaChange
              end
              object cbDataFimIndeterminada: TDBCheckBox
                Left = 114
                Top = 50
                Width = 162
                Height = 17
                Caption = 'Data Final Indeterminada'
                DataField = 'FLGINDETERMINADO'
                DataSource = dsMultaJuros
                TabOrder = 2
                ValueChecked = 'S'
                ValueUnchecked = 'N'
                OnClick = cbDataFimIndeterminadaClick
              end
            end
          end
        end
        object TabCobranca: TTabSheet
          Caption = 'Cobrança'
          ImageIndex = 7
          object Label26: TLabel
            Left = 384
            Top = 26
            Width = 111
            Height = 13
            Caption = 'Forma de Cobrança'
          end
          object Label53: TLabel
            Left = 386
            Top = 72
            Width = 195
            Height = 13
            Caption = 'Mensagem do Boleto de Cobrança'
          end
          object DBcboPortadorForma: TwwDBLookupCombo
            Left = 385
            Top = 41
            Width = 310
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Descrição'#9'F'
              'FLGATIVO'#9'1'#9'Ativo'#9'F')
            DataField = 'CODPORTFORMA'
            DataSource = ds
            LookupTable = qryLookPortadorForma
            LookupField = 'CODPORTFORMA'
            Options = [loColLines, loTitles]
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = True
          end
          object DBcboMsgBoleto: TwwDBLookupCombo
            Left = 386
            Top = 88
            Width = 310
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MSGDESCRICAO'#9'60'#9'MSGDESCRICAO')
            DataField = 'IDMSGBOLETO'
            DataSource = ds
            LookupTable = qryLookMsgBoleto
            LookupField = 'IDMSGBOLETO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = True
          end
          object Local: TGroupBox
            Left = 3
            Top = 8
            Width = 366
            Height = 121
            Caption = 'Local'
            TabOrder = 0
            object Label27: TLabel
              Left = 17
              Top = 17
              Width = 27
              Height = 13
              Caption = 'País'
            end
            object Label31: TLabel
              Left = 16
              Top = 64
              Width = 40
              Height = 13
              Caption = 'Estado'
            end
            object Label41: TLabel
              Left = 83
              Top = 64
              Width = 40
              Height = 13
              Caption = 'Cidade'
            end
            object dblcPais: TwwDBLookupCombo
              Left = 17
              Top = 33
              Width = 336
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEPAIS'#9'30'#9'NOMEPAIS')
              DataField = 'IDPAIS'
              DataSource = ds
              LookupTable = qryLookPais
              LookupField = 'IDPAIS'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcPaisCloseUp
            end
            object dblcEstado: TwwDBLookupCombo
              Left = 16
              Top = 80
              Width = 57
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODESTADO'#9'3'#9'CODESTADO')
              DataField = 'CODESTADO'
              DataSource = ds
              LookupTable = qryLookEstado
              LookupField = 'CODESTADO'
              Style = csDropDownList
              DropDownWidth = 8
              Enabled = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcEstadoCloseUp
            end
            object dblcCidades: TwwDBLookupCombo
              Left = 83
              Top = 80
              Width = 270
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'50'#9'NOME')
              DataField = 'IDCIDADES'
              DataSource = ds
              LookupTable = qryLookCidade
              LookupField = 'IDCIDADES'
              Style = csDropDownList
              DropDownWidth = 8
              Enabled = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
        object TabObs: TTabSheet
          Caption = 'Obs'
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 714
            Height = 27
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Observações'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object DBmemContrato: TwwDBRichEdit
            Left = 0
            Top = 27
            Width = 714
            Height = 141
            ScrollBars = ssVertical
            Align = alClient
            AutoURLDetect = True
            DataField = 'CONDESCRICAO'
            DataSource = ds
            MaxLength = 1750
            PrintJobName = 'Delphi 5'
            TabOrder = 1
            PopupOptions = [rpoPopupEdit, rpoPopupCut, rpoPopupCopy, rpoPopupPaste, rpoPopupFont]
            EditorCaption = 'Edit Rich Text'
            EditorPosition.Left = 0
            EditorPosition.Top = 0
            EditorPosition.Width = 0
            EditorPosition.Height = 0
            MeasurementUnits = muCentimeters
            PrintMargins.Top = 1
            PrintMargins.Bottom = 1
            PrintMargins.Left = 1
            PrintMargins.Right = 1
            RichEditVersion = 2
            Data = {
              830000007B5C727466315C616E73695C616E7369637067313235325C64656666
              305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
              4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
              5C706172645C625C66305C667331342044426D656D436F6E747261746F5C7061
              720D0A7D0D0A00}
          end
        end
        object tbsEventos: TTabSheet
          Caption = 'Eventos'
          ImageIndex = 8
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 714
            Height = 61
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Panel10: TPanel
              Left = 0
              Top = 0
              Width = 714
              Height = 61
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object Label51: TLabel
                Left = 5
                Top = 9
                Width = 90
                Height = 13
                Caption = 'Data do Evento'
              end
              object Label52: TLabel
                Left = 116
                Top = 9
                Width = 61
                Height = 13
                Caption = 'Cabeçalho'
              end
              object Label57: TLabel
                Left = 540
                Top = 9
                Width = 89
                Height = 13
                Caption = 'Próximo Evento'
              end
              object DBedtDataEvento: TCMDateTimePicker
                Left = 5
                Top = 23
                Width = 103
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'EVIDATA'
                DataSource = dsEvento
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
              object DBedtCabEvento: TDBEdit
                Left = 116
                Top = 23
                Width = 413
                Height = 21
                DataField = 'EVICABECALHO'
                DataSource = dsEvento
                TabOrder = 1
              end
              object CMDateTimePicker2: TCMDateTimePicker
                Left = 540
                Top = 23
                Width = 106
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'EVIDATAPROX'
                DataSource = dsEvento
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
            end
            object grdEvento: TwwDBGrid2
              Left = 0
              Top = 0
              Width = 714
              Height = 61
              Selected.Strings = (
                'EVIDATA'#9'12'#9'Data'#9'T'
                'EVICABECALHO'#9'73'#9'Histórico'#9'T'
                'EVIDATAPROX'#9'12'#9'Próximo'#9'T'
                'NOME'#9'30'#9'Usuário'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsEvento
              KeyOptions = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              TabOrder = 1
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = True
              UseTFields = False
              OnTitleButtonClick = grdEventoTitleButtonClick
              IndicatorColor = icBlack
            end
          end
          object Panel6: TPanel
            Left = 0
            Top = 61
            Width = 714
            Height = 107
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 2
            TabOrder = 1
            object gbEvento: TGroupBox
              Left = 2
              Top = 2
              Width = 710
              Height = 103
              Align = alClient
              Caption = 'Descrição do Evento'
              Enabled = False
              TabOrder = 0
              object Panel7: TPanel
                Left = 2
                Top = 15
                Width = 706
                Height = 86
                Align = alClient
                BevelOuter = bvNone
                BorderWidth = 3
                TabOrder = 0
                object DBmemDescricao: TwwDBRichEdit
                  Left = 3
                  Top = 3
                  Width = 700
                  Height = 80
                  TabStop = False
                  Align = alClient
                  AutoURLDetect = True
                  DataField = 'EVIDESCRICAO'
                  DataSource = dsEvento
                  MaxLength = 1750
                  PrintJobName = 'Delphi 5'
                  TabOrder = 0
                  PopupOptions = [rpoPopupEdit, rpoPopupCut, rpoPopupCopy, rpoPopupPaste, rpoPopupFont]
                  EditorOptions = [reoShowLoad, reoShowSaveExit, reoShowPrint, reoShowPageSetup, reoShowFormatBar, reoShowToolBar, reoShowStatusBar, reoShowHints, reoCloseOnEscape]
                  EditorCaption = 'Descrição'
                  EditorPosition.Left = 0
                  EditorPosition.Top = 0
                  EditorPosition.Width = 0
                  EditorPosition.Height = 0
                  MeasurementUnits = muCentimeters
                  PrintMargins.Top = 1
                  PrintMargins.Bottom = 1
                  PrintMargins.Left = 1
                  PrintMargins.Right = 1
                  RichEditVersion = 2
                  Data = {
                    840000007B5C727466315C616E73695C616E7369637067313235325C64656666
                    305C6465666C616E67313033337B5C666F6E7474626C7B5C66305C666E696C20
                    4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
                    5C706172645C625C66305C667331342044426D656D44657363726963616F5C70
                    61720D0A7D0D0A00}
                end
              end
            end
          end
        end
        object TabAnalIni: TTabSheet
          Caption = 'Análise'
          object btnAnaliseAlug: TSpeedButton
            Left = 552
            Top = 13
            Width = 129
            Height = 38
            Hint = 'Executa analise comparativa dos rendimentos '
            Caption = 'Analise comparativa'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
              C8807FF7777777777FF700000000000000007777777777777777333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btnAnaliseAlugClick
          end
          object Label4: TLabel
            Left = 13
            Top = 13
            Width = 122
            Height = 13
            Caption = 'Data Base p/ Analise'
            FocusControl = edNomeCont
          end
          object Label14: TLabel
            Left = 163
            Top = 13
            Width = 81
            Height = 13
            Caption = 'Tx.Juros Merc'
            FocusControl = edNomeCont
          end
          object Label24: TLabel
            Left = 240
            Top = 35
            Width = 10
            Height = 13
            Caption = '%'
            FocusControl = edNomeCont
          end
          object Label25: TLabel
            Left = 270
            Top = 13
            Width = 78
            Height = 13
            Caption = 'Periodicidade'
          end
          object Panel2: TPanel
            Left = 164
            Top = 63
            Width = 369
            Height = 91
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object lblAvalia: TLabel
              Left = 1
              Top = 4
              Width = 76
              Height = 13
              Caption = 'Avaliação  + '
            end
            object lblAlug: TLabel
              Left = 1
              Top = 52
              Width = 130
              Height = 13
              Caption = 'Aluguel Não Informado'
            end
            object Label28: TLabel
              Left = 208
              Top = 4
              Width = 84
              Height = 13
              Caption = 'Valor Presente'
            end
            object Label29: TLabel
              Left = 208
              Top = 52
              Width = 135
              Height = 13
              Caption = 'Valor Total da Proposta'
            end
            object edValTotProp: TRealEdit
              Left = 208
              Top = 68
              Width = 139
              Height = 18
              TabStop = False
              Alignment = taRightJustify
              BorderStyle = bsNone
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Lines.Strings = (
                '      0,00')
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object edValPresAnal: TRealEdit
              Left = 208
              Top = 20
              Width = 139
              Height = 18
              TabStop = False
              Alignment = taRightJustify
              BorderStyle = bsNone
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Lines.Strings = (
                '      0,00')
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object edValorAlug: TRealEdit
              Left = 1
              Top = 68
              Width = 126
              Height = 18
              TabStop = False
              Alignment = taRightJustify
              BorderStyle = bsNone
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Lines.Strings = (
                '      0,00')
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object edValorAvali: TRealEdit
              Left = 1
              Top = 20
              Width = 126
              Height = 18
              TabStop = False
              Alignment = taRightJustify
              BorderStyle = bsNone
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Lines.Strings = (
                '      0,00')
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
          end
          object edDataAni: TCMDateTimePicker
            Left = 13
            Top = 31
            Width = 114
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAOPERACAO'
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
            ShowButton = True
            TabOrder = 1
          end
          object DBRealEdit3: TDBRealEdit
            Left = 166
            Top = 31
            Width = 70
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,0000')
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
            DataField = 'PERCTXJURMERC'
            DataSource = ds
          end
          object dbcbPeriodicidade: TwwDBComboBox
            Left = 270
            Top = 31
            Width = 78
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = False
            DataField = 'PERITXJURMERC'
            DataSource = ds
            DropDownCount = 5
            ItemHeight = 13
            Items.Strings = (
              'Mensal'#9'M'
              'Anual'#9'A')
            Sorted = False
            TabOrder = 3
            UnboundDataType = wwDefault
          end
        end
        object TabSimula: TTabSheet
          Caption = 'Parcelas'
          ImageIndex = 5
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 714
            Height = 30
            Align = alTop
            BevelOuter = bvLowered
            TabOrder = 0
            object Label10: TLabel
              Left = 6
              Top = 1
              Width = 75
              Height = 26
              AutoSize = False
              Caption = 'Valor Financiado'
              WordWrap = True
            end
            object Label13: TLabel
              Left = 189
              Top = 1
              Width = 52
              Height = 24
              AutoSize = False
              Caption = 'Número Parcelas'
              WordWrap = True
            end
            object sbSimula: TSpeedButton
              Left = 459
              Top = 4
              Width = 72
              Height = 23
              Hint = 'Gera simulação das parcelas'
              Caption = 'Simula'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
                FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
                C8807FF7777777777FF700000000000000007777777777777777333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 2
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = sbSimulaClick
            end
            object Label22: TLabel
              Left = 298
              Top = 1
              Width = 47
              Height = 28
              AutoSize = False
              Caption = 'Total   a Pagar'
              WordWrap = True
            end
            object sbConv: TSpeedButton
              Left = 620
              Top = 4
              Width = 72
              Height = 23
              Hint = 
                'Converte o valor total a pagar para o valor total financiado sem' +
                ' acréscimo'
              Caption = 'Converte'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
                FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
                00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
                F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
                00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
                F033777777777337F73309999990FFF0033377777777FFF77333099999000000
                3333777777777777333333399033333333333337773333333333333903333333
                3333333773333333333333303333333333333337333333333333}
              NumGlyphs = 2
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              Visible = False
              OnClick = sbConvClick
            end
            object sbImprime: TSpeedButton
              Left = 543
              Top = 4
              Width = 72
              Height = 23
              Hint = 'Imprime a simulação das parcelas'
              Caption = 'Imprime'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
                0003377777777777777308888888888888807F33333333333337088888888888
                88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
                8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
                8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
                03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
                03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
                33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
                33333337FFFF7733333333300000033333333337777773333333}
              NumGlyphs = 2
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = sbImprimeClick
            end
            object DBRealEdit1: TDBRealEdit
              Left = 76
              Top = 5
              Width = 96
              Height = 21
              Alignment = taRightJustify
              Color = 14876158
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRFINANC'
              DataSource = dsCondPag
            end
            object DBRealEdit2: TDBRealEdit
              Left = 242
              Top = 5
              Width = 38
              Height = 21
              Alignment = taRightJustify
              Color = 14876158
              Enabled = False
              Lines.Strings = (
                '0')
              TabOrder = 1
              WordWrap = False
              IntDigits = 5
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
              DataField = 'NUMPARCELAS'
              DataSource = dsCondPag
            end
            object edtTotalPago: TRealEdit
              Left = 347
              Top = 5
              Width = 95
              Height = 21
              Alignment = taRightJustify
              Color = 14876158
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
          end
          object dbgrdParc: TwwDBGrid
            Left = 0
            Top = 30
            Width = 714
            Height = 138
            Selected.Strings = (
              'NUMPARCELA'#9'7'#9'Parc'#9'F'
              'DATAVENCIMENTO'#9'10'#9'Vencimento'#9'F'
              'CAL_TIPO'#9'18'#9'Tipo de Parcela'#9'F'
              'VLRSALDOATUAL'#9'13'#9'Saldo Atual'#9'F'
              'VLRNOMINAL'#9'13'#9'Prest. Nominal'#9'F'
              'VLRAMORTIZACAO'#9'12'#9'Amortização'#9'F'
              'VLRJUROS'#9'11'#9'Juros Saldo'#9'F'
              'VLRJUROSPARC'#9'12'#9'Juros Parcela'#9'F'
              'VLRCORRSALDO'#9'13'#9'Correção Saldo'#9'F'
              'VLRRESIDUO'#9'13'#9'Corr / Resíduo'#9'F'
              'VLRPRESTACAO'#9'11'#9'Prest. Real'#9'F'
              'VLRSALDODEVEDOR'#9'13'#9'Saldo Devedor'#9'F'
              'VLRPRESTATUALIZADA'#9'13'#9'Prest. Atualizada'#9'F'
              'VLRRESIDUOATUALI'#9'12'#9'Res. Atualizado'#9'F'
              'FATORCORRECAO'#9'10'#9'Fator'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoSearchOwnerForm, ecoDisableDateTimePicker]
            Align = alClient
            DataSource = dsParc
            TabOrder = 1
            TitleAlignment = taCenter
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
        object TabFianca: TTabSheet
          Caption = 'Fiança'
          ImageIndex = 9
          object Label71: TLabel
            Left = 16
            Top = 130
            Width = 75
            Height = 13
            Caption = 'Observações'
          end
          object DBrdgTipoFianca: TDBRadioGroup
            Left = 16
            Top = 1
            Width = 265
            Height = 61
            Caption = ' Tipo de Fiança '
            Columns = 2
            DataField = 'FLGFIANCA'
            DataSource = ds
            Items.Strings = (
              'Fiador'
              'Fiança Bancária'
              'Outra (especificar)'
              'Seguro Fiança'
              'Depósito Bancário'
              'Não há')
            TabOrder = 0
            TabStop = True
            Values.Strings = (
              'A'
              'F'
              'O'
              'S'
              'D'
              'N')
          end
          object GroupBox5: TGroupBox
            Left = 288
            Top = 1
            Width = 361
            Height = 61
            Caption = ' Datas da Fiança '
            TabOrder = 1
            object Label65: TLabel
              Left = 130
              Top = 18
              Width = 99
              Height = 13
              Caption = 'Término Validade'
            end
            object Label66: TLabel
              Left = 243
              Top = 18
              Width = 99
              Height = 13
              Caption = 'Aviso de Término'
            end
            object Label67: TLabel
              Left = 16
              Top = 18
              Width = 87
              Height = 13
              Caption = 'Início Validade'
            end
            object DBedtTerminoFianca: TCMDateTimePicker
              Left = 130
              Top = 32
              Width = 105
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'CONDATAFIANCAFIM'
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
              ShowButton = True
              TabOrder = 1
            end
            object DBedtAvisoFianca: TCMDateTimePicker
              Left = 243
              Top = 32
              Width = 105
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'CONDATAFIANCAAV'
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
              ShowButton = True
              TabOrder = 2
            end
            object DBedtDataIniFianca: TCMDateTimePicker
              Left = 16
              Top = 32
              Width = 105
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'CONDATAFIANCAINI'
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
              ShowButton = True
              TabOrder = 0
            end
          end
          object GroupBox6: TGroupBox
            Left = 16
            Top = 65
            Width = 633
            Height = 61
            Caption = ' Seguro-fiança / Fiança Bancária '
            TabOrder = 2
            object Label68: TLabel
              Left = 456
              Top = 18
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label69: TLabel
              Left = 16
              Top = 18
              Width = 55
              Height = 13
              Caption = 'Nº Banco'
            end
            object Label70: TLabel
              Left = 89
              Top = 18
              Width = 37
              Height = 13
              Caption = 'Banco'
            end
            object DBedtNumBanco: TDBEdit
              Left = 16
              Top = 32
              Width = 73
              Height = 21
              DataField = 'NUMBANCO'
              DataSource = dsBanco
              Enabled = False
              TabOrder = 0
            end
            object DBcboBanco: TwwDBLookupCombo
              Left = 89
              Top = 32
              Width = 353
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Nome'#9'F')
              DataField = 'CONBANCOFIANCA'
              DataSource = ds
              LookupTable = qryBanco
              LookupField = 'IDPESSOA'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
            end
            object dbedtVlrFianca: TDBRealEdit
              Left = 456
              Top = 32
              Width = 161
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 8
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'CONVLRFIANCA'
              DataSource = ds
            end
          end
          object dbmemObsFianca: TwwDBRichEdit
            Left = 16
            Top = 146
            Width = 633
            Height = 56
            ScrollBars = ssVertical
            AutoURLDetect = True
            DataField = 'CONOBSFIANCA'
            DataSource = ds
            MaxLength = 1750
            PrintJobName = 'Delphi 5'
            TabOrder = 3
            PopupOptions = [rpoPopupEdit, rpoPopupCut, rpoPopupCopy, rpoPopupPaste, rpoPopupFont]
            EditorCaption = 'Edit Rich Text'
            EditorPosition.Left = 0
            EditorPosition.Top = 0
            EditorPosition.Width = 0
            EditorPosition.Height = 0
            MeasurementUnits = muCentimeters
            PrintMargins.Top = 1
            PrintMargins.Bottom = 1
            PrintMargins.Left = 1
            PrintMargins.Right = 1
            RichEditVersion = 2
            Data = {
              840000007B5C727466315C616E73695C616E7369637067313235325C64656666
              305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
              4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
              5C706172645C625C66305C667331342064626D656D4F62734669616E63615C70
              61720D0A7D0D0A00}
          end
        end
        object tbsFiadores: TTabSheet
          Caption = 'Fiadores'
          ImageIndex = 10
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 675
            Height = 168
            Align = alClient
            TabOrder = 1
            inline molFiador1: TmolFiador
              Left = 91
              Top = 72
              Width = 446
              inherited edtFiador: TEdit
                Width = 377
              end
              inherited btnBuscaFiador: TBitBtn
                Left = 384
              end
              inherited btnLimpaFiador: TBitBtn
                Left = 408
              end
            end
          end
          object grdFiador: TwwDBGrid2
            Left = 0
            Top = 0
            Width = 675
            Height = 168
            Selected.Strings = (
              'RS_FIADOR'#9'48'#9'Razão Social'#9'T'
              'NF_FIADOR'#9'46'#9'Nome / Nome Fantasia'#9'T')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsFiador
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
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
            IndicatorColor = icBlack
          end
        end
      end
      inherited Dock973: TDock97
        Width = 812
        object wwDBComboBox1: TwwDBComboBox
          Left = 177
          Top = 4
          Width = 64
          Height = 21
          ShowButton = True
          Style = csDropDownList
          MapList = True
          AllowClearKey = True
          AutoDropDown = True
          ShowMatchText = True
          DataField = 'FORMACALCULO'
          DataSource = dsCondPag
          DropDownCount = 6
          DropDownWidth = 474
          Enabled = False
          ItemHeight = 0
          Items.Strings = (
            'FIXA - Sem juros e sem correção'#9'9'
            'JUROS MENSAL - Não calcula resíduo'#9'8'
            'JUROS MENSAL - Resíduo cobrado na parcela'#9'7'
            'JUROS MENSAL - Saldo atualizado anualmente'#9'5'
            
              'JUROS MENSAL da Parcela e Saldo Devedor, com correção e recalcul' +
              'o anual'#9'6'
            'PRICE - Atualiza Saldo anual, recalculo anual da parcela'#9'1'
            
              'PRICE - Atualiza Saldo mensal, parcela fixa com indice projetado' +
              #9'10'
            'PRICE - Atualiza Saldo mensal, recalculo anual da Parcela'#9'2'
            'PRICE - Não gera resíduo, recalculo anual da parcela'#9'4'
            'PRICE - Resíduo cobrado na parcela, recalculo anual da parcela'#9'3')
          Sorted = True
          TabOrder = 1
          UnboundDataType = wwDefault
          Visible = False
        end
      end
      inherited Dock974: TDock97
        Left = 726
        Height = 196
      end
    end
  end
  inherited Dock972: TDock97
    Width = 822
    object lblTitulo: TLabel [0]
      Left = 366
      Top = 7
      Width = 391
      Height = 29
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Proposta de Alienação'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    inherited Toolbar971: TToolbar97
      Left = 8
      DockPos = 8
      object sbtnProcurarImovel: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'I&móvel'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = sbtnProcurarImovelClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 822
    inherited tb97Fundo: TToolbar97
      Left = 559
      DockPos = 559
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 390
      DockPos = 390
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65531
    TargetsData = (
      1
      6
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 539
    Top = 0
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 450
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOIMOVEL'
      'set'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL,'
      '  CONNUMERO = :CONNUMERO,'
      '  CONNOME = :CONNOME,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  CONDATAINICIO = :CONDATAINICIO,'
      '  CONDATAASSINATURA = :CONDATAASSINATURA,'
      '  FLGTIPOCONTRATO = :FLGTIPOCONTRATO,'
      '  FLGSTATUS = :FLGSTATUS,'
      '  CONTAXAADMIN = :CONTAXAADMIN,'
      '  CONVLRAJUSTADO = :CONVLRAJUSTADO,'
      '  PERALUGUELIDEAL = :PERALUGUELIDEAL,'
      '  PERCTXJURMERC = :PERCTXJURMERC,'
      '  PERITXJURMERC = :PERITXJURMERC,'
      '  IDLOCATARIO = :IDLOCATARIO,'
      '  CONVLRTOTAL = :CONVLRTOTAL,'
      '  CONDESCRICAO = :CONDESCRICAO,'
      '  VLRPROPOSTA = :VLRPROPOSTA,'
      '  VLRPRESENTE = :VLRPRESENTE,'
      '  VLRCONTABIL = :VLRCONTABIL,'
      '  CONINDICEREAJUSTE = :CONINDICEREAJUSTE,'
      '  CONDATAREAJUSTE = :CONDATAREAJUSTE,'
      '  CONPERREAJUSTE = :CONPERREAJUSTE,'
      '  IDMSGBOLETO = :IDMSGBOLETO,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  CODESTADO = :CODESTADO,'
      '  IDPAIS = :IDPAIS,'
      '  IDCIDADES = :IDCIDADES,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL,'
      '  IDADMINIMOVEL = :IDADMINIMOVEL,'
      '  FLGFIANCA = :FLGFIANCA,'
      '  FLGVGV = :FLGVGV,'
      '  CONDATAFIANCAINI = :CONDATAFIANCAINI,'
      '  CONDATAFIANCAFIM = :CONDATAFIANCAFIM,'
      '  CONDATAFIANCAAV = :CONDATAFIANCAAV,'
      '  CONBANCOFIANCA = :CONBANCOFIANCA,'
      '  CONVLRFIANCA = :CONVLRFIANCA,'
      '  CONOBSFIANCA = :CONOBSFIANCA,'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDCONTRATOIMOVEL = :OLD_IDCONTRATOIMOVEL'
      ' ')
    InsertSQL.Strings = (
      'insert into CONTRATOIMOVEL'
      '  (IDCONTRATOIMOVEL, CONNUMERO, CONNOME, DATAOPERACAO, '
      'CONDATAINICIO, CONDATAASSINATURA, '
      '   FLGTIPOCONTRATO, FLGSTATUS, CONTAXAADMIN, CONVLRAJUSTADO, '
      'PERALUGUELIDEAL, '
      '   PERCTXJURMERC, PERITXJURMERC, IDLOCATARIO, CONVLRTOTAL, '
      'CONDESCRICAO, '
      '   VLRPROPOSTA, VLRPRESENTE, VLRCONTABIL, CONINDICEREAJUSTE, '
      'CONDATAREAJUSTE, '
      '   CONPERREAJUSTE, IDMSGBOLETO, CODPORTFORMA, CODESTADO, IDPAIS,'
      'IDCIDADES, '
      '   IDRESPONSAVEL, IDADMINIMOVEL, FLGFIANCA, CONDATAFIANCAINI, '
      'CONDATAFIANCAFIM, '
      '   CONDATAFIANCAAV, CONBANCOFIANCA, CONVLRFIANCA, CONOBSFIANCA, '
      'IDPESSOA, FLGVGV)'
      'values'
      '  (:IDCONTRATOIMOVEL, :CONNUMERO, :CONNOME, :DATAOPERACAO, '
      ':CONDATAINICIO, '
      '   :CONDATAASSINATURA, :FLGTIPOCONTRATO, :FLGSTATUS, '
      ':CONTAXAADMIN, :CONVLRAJUSTADO, '
      
        '   :PERALUGUELIDEAL, :PERCTXJURMERC, :PERITXJURMERC, :IDLOCATARI' +
        'O, '
      ':CONVLRTOTAL, '
      '   :CONDESCRICAO, :VLRPROPOSTA, :VLRPRESENTE, :VLRCONTABIL, '
      ':CONINDICEREAJUSTE, '
      '   :CONDATAREAJUSTE, :CONPERREAJUSTE, :IDMSGBOLETO, '
      ':CODPORTFORMA, :CODESTADO, '
      
        '   :IDPAIS, :IDCIDADES, :IDRESPONSAVEL, :IDADMINIMOVEL, :FLGFIAN' +
        'CA, '
      ':CONDATAFIANCAINI, '
      '   :CONDATAFIANCAFIM, :CONDATAFIANCAAV, :CONBANCOFIANCA, '
      ':CONVLRFIANCA, '
      '   :CONOBSFIANCA, :IDPESSOA, :FLGVGV)'
      ' ')
    DeleteSQL.Strings = (
      'delete from CONTRATOIMOVEL'
      'where'
      '  IDCONTRATOIMOVEL = :OLD_IDCONTRATOIMOVEL')
    Left = 378
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'C.CONNUMERO'
      'C.CONNOME'
      'C.CONDATAINICIO'
      'C.CONDATAASSINATURA'
      'C.FLGTIPOCONTRATO'
      'P.NOME'
      'PL.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'D'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº  da Proposta'
      'Nome'
      'Data da Proposta'
      'Data do Contrato'
      '<P>roposta,  <C>ontrato, <A>cordo'
      'Administradora'
      'Comprador')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOIMOVEL C'
      'ADMINIMOVEL A'
      'PESSOA P'
      'LOCATARIO L'
      'PESSOA PL')
    CamposChave.Strings = (
      'C.IDCONTRATOIMOVEL')
    Filtro.Strings = (
      'C.IDADMINIMOVEL = A.IDADMINIMOVEL(+)'
      'A.IDADMINIMOVEL = P.IDPESSOA(+)'
      'C.IDLOCATARIO = L.IDLOCATARIO(+)'
      'L.IDLOCATARIO = PL.IDPESSOA(+)'
      'C.FLGTIPOCONTRATO IN('#39'C'#39' ,'#39'P'#39', '#39'A'#39')')
    Mascaras.Strings = (
      ''
      ''
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '40'
      '10'
      '10'
      '1'
      '60'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 205
    Top = 42
  end
  inherited ImlPadrao: TImageList
    Left = 329
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 270
    Top = 50
  end
  inherited qry: TwwQuery
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
      '     CI.IDPESSOA,'
      '     PR.NOME                       AS NOMRESPONSAVEL,'
      '     PA.NOME                       AS NOMADMINIMOVEL'
      'FROM'
      '     CONTRATOIMOVEL CI,'
      '     PESSOA P,'
      '     PESSOA PR,'
      '     PESSOA PA'
      'WHERE'
      '     (CI.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      '     AND (CI.IDLOCATARIO = P.IDPESSOA(+))'
      '     AND (CI.IDRESPONSAVEL = PR.IDPESSOA(+))'
      '     AND (CI.IDADMINIMOVEL = PA.IDPESSOA(+))'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 416
    Top = 2
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
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
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 412
    Top = 55
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOXIMOVEL'
      'set'
      '  IDIMOVEL = :IDIMOVEL,'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL,'
      '  CIMVLRALUGUEL = :CIMVLRALUGUEL,'
      '  FLGORIGVLRALUG = :FLGORIGVLRALUG,'
      '  VLRVENDA = :VLRVENDA,'
      '  VLRCONTABIL = :VLRCONTABIL,'
      '  FLGRATEIO = :FLGRATEIO,'
      '  CIMPERCENTRATEIO = :CIMPERCENTRATEIO'
      'where'
      '  IDIMOVEL = :OLD_IDIMOVEL and'
      '  IDCONTRATOIMOVEL = :OLD_IDCONTRATOIMOVEL')
    InsertSQL.Strings = (
      'insert into CONTRATOXIMOVEL'
      
        '  (IDIMOVEL, IDCONTRATOIMOVEL, CIMVLRALUGUEL, FLGORIGVLRALUG, VL' +
        'RVENDA, '
      '   VLRCONTABIL, FLGRATEIO, CIMPERCENTRATEIO)'
      'values'
      
        '  (:IDIMOVEL, :IDCONTRATOIMOVEL, :CIMVLRALUGUEL, :FLGORIGVLRALUG' +
        ', :VLRVENDA, '
      '   :VLRCONTABIL, :FLGRATEIO, :CIMPERCENTRATEIO)')
    DeleteSQL.Strings = (
      'delete from CONTRATOXIMOVEL'
      'where'
      '  IDIMOVEL = :OLD_IDIMOVEL and'
      '  IDCONTRATOIMOVEL = :OLD_IDCONTRATOIMOVEL')
    Left = 577
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforeInsert = qryDetBeforeInsert
    BeforeEdit = qryDetBeforeInsert
    OnCalcFields = qryDetCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    CXI.IDIMOVEL,'
      '    CXI.IDCONTRATOIMOVEL,'
      '    CXI.CIMVLRALUGUEL,'
      '    CXI.FLGORIGVLRALUG,'
      '    CXI.VLRVENDA,'
      '    CXI.VLRCONTABIL,'
      '    CXI.FLGRATEIO,'
      '    CXI.CIMPERCENTRATEIO,'
      '    IM.IMOAREA,'
      '    IM.IMONOME,'
      '    IM.CODTIPIMOVEL,'
      '    IMM.IMONOME AS MESTRE,'
      '    IMM.IDIMOVEL AS IDMESTRE'
      'FROM'
      '    CONTRATOXIMOVEL CXI,'
      '    IMOVEL IM,'
      '    IMOVEL IMM'
      'WHERE'
      '      (CXI.IDCONTRATOIMOVEL = :pIDCONTRATOIMOVEL)'
      '  AND (CXI.IDIMOVEL = IM.IDIMOVEL)'
      '  AND (IM.IDIMOVELMESTRE  = IMM.IDIMOVEL)'
      'ORDER BY MESTRE,IM.IMONOME'
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGRATEIO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 503
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
        Value = '514'
      end>
    object qryDetMESTRE: TStringField
      DisplayLabel = 'Mestre'
      DisplayWidth = 38
      FieldName = 'MESTRE'
      Origin = '"CM.IMOVEL".IMONOME'
      Size = 60
    end
    object qryDetIMONOME: TStringField
      DisplayLabel = 'Imovel'
      DisplayWidth = 28
      FieldName = 'IMONOME'
      Origin = 'IMOVEL.IMONOME'
      Size = 60
    end
    object qryDetCIMVLRALUGUEL: TFloatField
      DisplayLabel = 'Vlr Aluguel'
      DisplayWidth = 14
      FieldName = 'CIMVLRALUGUEL'
      Origin = 'BASEDADOS.CONTRATOXIMOVEL.CIMVLRALUGUEL'
      DisplayFormat = '#,##0.00'
    end
    object qryDetCAL_ORIGEM: TStringField
      DisplayLabel = 'Origem'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'CAL_ORIGEM'
      Calculated = True
    end
    object qryDetIMOAREA: TFloatField
      DisplayLabel = 'Area'
      DisplayWidth = 10
      FieldName = 'IMOAREA'
      Origin = 'BASEDADOS.IMOVEL.IMOAREA'
      DisplayFormat = '#,##0.00'
    end
    object qryDetVLRVENDA: TFloatField
      DisplayLabel = 'Vlr Alienação'
      DisplayWidth = 14
      FieldName = 'VLRVENDA'
      Origin = 'BASEDADOS.CONTRATOXIMOVEL.VLRVENDA'
      DisplayFormat = '#,##0.00'
    end
    object qryDetVLRCONTABIL: TFloatField
      DisplayLabel = 'Vlr Contábil'
      DisplayWidth = 14
      FieldName = 'VLRCONTABIL'
      Origin = 'BASEDADOS.CONTRATOXIMOVEL.VLRCONTABIL'
      DisplayFormat = '#,##0.00'
    end
    object qryDetFLGRATEIO: TFloatField
      DisplayLabel = 'Parcial'
      DisplayWidth = 10
      FieldName = 'FLGRATEIO'
      Origin = 'BASEDADOS.CONTRATOXIMOVEL.FLGRATEIO'
    end
    object qryDetCIMPERCENTRATEIO: TFloatField
      DisplayLabel = 'Rateio'
      DisplayWidth = 10
      FieldName = 'CIMPERCENTRATEIO'
      Origin = 'BASEDADOS.CONTRATOXIMOVEL.CIMPERCENTRATEIO'
      DisplayFormat = '##0.00 %'
    end
    object qryDetIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Origin = 'CONTRATOXIMOVEL.IDIMOVEL'
      Visible = False
    end
    object qryDetIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'CONTRATOXIMOVEL.IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryDetIDMESTRE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMESTRE'
      Origin = 'BASEDADOS.IMOVEL.IDIMOVEL'
      Visible = False
    end
    object qryDetFLGORIGVLRALUG: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGORIGVLRALUG'
      Origin = 'BASEDADOS.CONTRATOXIMOVEL.FLGORIGVLRALUG'
      Visible = False
    end
    object qryDetCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'BASEDADOS.IMOVEL.CODTIPIMOVEL'
      Size = 5
    end
  end
  object dsCondPag: TwwDataSource
    AutoEdit = False
    DataSet = qryCondPag
    Left = 351
    Top = 96
  end
  object updCondPag: TUpdateSQL
    ModifySQL.Strings = (
      'update CONDPAGIMOVEL'
      'set'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL,'
      '  INDCORRECAO = :INDCORRECAO,'
      '  IDINDCORRPROJ = :IDINDCORRPROJ,'
      '  VLRFINANC = :VLRFINANC,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  DATACARENCIA = :DATACARENCIA,'
      '  DATAINIAMORTIZ = :DATAINIAMORTIZ,'
      '  DATAINI = :DATAINI,'
      '  DATAFIM = :DATAFIM,'
      '  PRAZO = :PRAZO,'
      '  PERIODO = :PERIODO,'
      '  TAXAJUROS = :TAXAJUROS,'
      '  PERIODOTAXA = :PERIODOTAXA,'
      '  NUMPARCELAS = :NUMPARCELAS,'
      '  TIPOCONDPAG = :TIPOCONDPAG,'
      '  IDCONDINICIAL = :IDCONDINICIAL,'
      '  MESREFREAJUSTE = :MESREFREAJUSTE,'
      '  FORMACALCULO = :FORMACALCULO,'
      '  PERINDPROJ = :PERINDPROJ,'
      '  FLGJURCARENCIA = :FLGJURCARENCIA,'
      '  PERIODOREAJUSTE = :PERIODOREAJUSTE'
      'where'
      '  IDCONDPAGIMOVEL = :OLD_IDCONDPAGIMOVEL'
      ' ')
    InsertSQL.Strings = (
      'insert into CONDPAGIMOVEL'
      
        '  (IDCONTRATOIMOVEL, IDCONDPAGIMOVEL, INDCORRECAO, IDINDCORRPROJ' +
        ', VLRFINANC,'
      
        '   DATAVENCIMENTO, DATACARENCIA, DATAINIAMORTIZ, DATAINI, DATAFI' +
        'M, PRAZO,'
      
        '   PERIODO, TAXAJUROS, PERIODOTAXA, NUMPARCELAS, TIPOCONDPAG, ID' +
        'CONDINICIAL,'
      
        '   MESREFREAJUSTE, FORMACALCULO, PERINDPROJ, FLGJURCARENCIA, PER' +
        'IODOREAJUSTE)'
      'values'
      
        '  (:IDCONTRATOIMOVEL, :IDCONDPAGIMOVEL, :INDCORRECAO, :IDINDCORR' +
        'PROJ, :VLRFINANC,'
      
        '   :DATAVENCIMENTO, :DATACARENCIA, :DATAINIAMORTIZ, :DATAINI, :D' +
        'ATAFIM,'
      
        '   :PRAZO, :PERIODO, :TAXAJUROS, :PERIODOTAXA, :NUMPARCELAS, :TI' +
        'POCONDPAG,'
      
        '   :IDCONDINICIAL, :MESREFREAJUSTE, :FORMACALCULO, :PERINDPROJ, ' +
        ':FLGJURCARENCIA, :PERIODOREAJUSTE)'
      ' ')
    DeleteSQL.Strings = (
      'delete from CONDPAGIMOVEL'
      'where'
      '  IDCONDPAGIMOVEL = :OLD_IDCONDPAGIMOVEL')
    Left = 351
    Top = 112
  end
  object qryCondPag: TwwQuery
    CachedUpdates = True
    AfterScroll = qryCondPagAfterScroll
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
      '     CPI.PERIODOREAJUSTE'
      'FROM'
      '     CONDPAGIMOVEL CPI,'
      '     MOEDA M,'
      '     MOEDA MP'
      'WHERE'
      '          (M.MOECODIGO(+) = CPI.INDCORRECAO)'
      '      AND (MP.MOECODIGO(+) = CPI.IDINDCORRPROJ)'
      '      AND (CPI.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updCondPag
    ControlType.Strings = (
      'FLGJURCARENCIA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 352
    Top = 130
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
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
      DisplayWidth = 74
      FieldKind = fkCalculated
      FieldName = 'cal_forma'
      Size = 200
      Calculated = True
    end
    object qryCondPagPERINDPROJ: TFloatField
      DisplayLabel = 'Indice Projetado'
      DisplayWidth = 15
      FieldName = 'PERINDPROJ'
      DisplayFormat = '##0.000000'
    end
    object qryCondPagDATACARENCIA: TDateTimeField
      DisplayLabel = 'Carência'
      DisplayWidth = 18
      FieldName = 'DATACARENCIA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryCondPagFLGJURCARENCIA: TStringField
      DisplayLabel = 'Juros na Carência'
      DisplayWidth = 1
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
  end
  object qryMoeda: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    MOECODIGO,'
      '    MOESIGLA,'
      '    MOEDESC,'
      '    FLGPERCVALOR'
      'FROM'
      '    MOEDA'
      'WHERE'
      '      (MOEINATIVO = '#39'A'#39')'
      'ORDER BY 2'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 725
    Top = 353
    object qryMoedaMOESIGLA: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Origin = 'BASEDADOS.MOEDA.MOESIGLA'
      Size = 10
    end
    object qryMoedaFLGPERCVALOR: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 1
      FieldName = 'FLGPERCVALOR'
      Origin = 'BASEDADOS.MOEDA.FLGPERCVALOR'
      FixedChar = True
      Size = 1
    end
    object qryMoedaMOEDESC: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
      Visible = False
    end
    object qryMoedaMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
      Visible = False
    end
  end
  object dsParc: TwwDataSource
    AutoEdit = False
    DataSet = dtmFinanciamento.qryParc
    Left = 560
    Top = 176
  end
  object qryReajuste: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   TO_CHAR(C.CONINDICEREAJUSTE) || TO_CHAR(C.CONDATAREAJUSTE) ||' +
        ' TO_CHAR(C.CONPERREAJUSTE) AS CHAVE,'
      '   COUNT(*) AS QTDE,'
      '   C.CONINDICEREAJUSTE,'
      '   M.MOEDESC,'
      '   C.CONDATAREAJUSTE,'
      '   C.CONPERREAJUSTE'
      ''
      'FROM'
      '   CONTRATOIMOVEL C,'
      '   CONTRATOXIMOVEL CI,'
      '   IMOVEL I,'
      '   MOEDA M'
      ''
      'WHERE'
      '   (C.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      '    AND  (C.MOECODIGO = M.MOECODIGO)'
      '    AND  (CI.IDIMOVEL = I.IDIMOVEL)'
      '    AND  (C.FLGTIPOCONTRATO = '#39'L'#39')'
      '    AND  (CI.CIMVLRAJUSTADO > 0)'
      ''
      ''
      'GROUP BY'
      
        '    TO_CHAR(C.CONINDICEREAJUSTE) || TO_CHAR(C.CONDATAREAJUSTE) |' +
        '| TO_CHAR(C.CONPERREAJUSTE),'
      
        '    C.CONINDICEREAJUSTE, M.MOEDESC, M.FLGPERCVALOR, C.CONDATAREA' +
        'JUSTE, C.CONPERREAJUSTE'
      ''
      ' ')
    ValidateWithMask = True
    Left = 501
    Top = 172
    object qryReajusteQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object qryReajusteCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
    end
    object qryReajusteMOEDESC: TStringField
      FieldName = 'MOEDESC'
    end
    object qryReajusteCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
    end
    object qryReajusteCONPERREAJUSTE: TFloatField
      FieldName = 'CONPERREAJUSTE'
    end
    object qryReajusteCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 88
    end
  end
  object pplParc: TppBDEPipeline
    DataSource = dsParc
    UserName = 'lParc'
    Left = 696
    Top = 176
    object pplParcppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMPARCELA'
      FieldName = 'NUMPARCELA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 7
      Position = 0
    end
    object pplParcppField2: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 1
    end
    object pplParcppField3: TppField
      FieldAlias = 'CAL_TIPO'
      FieldName = 'CAL_TIPO'
      FieldLength = 25
      DisplayWidth = 18
      Position = 2
    end
    object pplParcppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPRESTACAO'
      FieldName = 'VLRPRESTACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 11
      Position = 3
    end
    object pplParcppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRJUROS'
      FieldName = 'VLRJUROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplParcppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRAMORTIZACAO'
      FieldName = 'VLRAMORTIZACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 5
    end
    object pplParcppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSALDODEVEDOR'
      FieldName = 'VLRSALDODEVEDOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 13
      Position = 6
    end
    object pplParcppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPRESTATUALIZADA'
      FieldName = 'VLRPRESTATUALIZADA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 13
      Position = 7
    end
    object pplParcppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRESIDUO'
      FieldName = 'VLRRESIDUO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplParcppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRESIDUOATUALI'
      FieldName = 'VLRRESIDUOATUALI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 9
    end
    object pplParcppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplParcppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'FATORCORRECAO'
      FieldName = 'FATORCORRECAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplParcppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGTIPOLANC'
      FieldName = 'FLGTIPOLANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplParcppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCORRIGIDOATRASO'
      FieldName = 'VLRCORRIGIDOATRASO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplParcppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMULTAATRASO'
      FieldName = 'VLRMULTAATRASO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplParcppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMORAATRASO'
      FieldName = 'VLRMORAATRASO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplParcppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPARCFINANCIMOV'
      FieldName = 'IDPARCFINANCIMOV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplParcppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplParcppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONDPAGIMOVEL'
      FieldName = 'IDCONDPAGIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplParcppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplParcppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGLANCINTEGRA'
      FieldName = 'FLGLANCINTEGRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplParcppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINDCORRECAO'
      FieldName = 'IDINDCORRECAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplParcppField23: TppField
      FieldAlias = 'DATALANCINTEGRA'
      FieldName = 'DATALANCINTEGRA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 22
    end
    object pplParcppField24: TppField
      FieldAlias = 'FLGRESIDUOINCORP'
      FieldName = 'FLGRESIDUOINCORP'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object pplParcppField25: TppField
      FieldAlias = 'FLGCONCILIADO'
      FieldName = 'FLGCONCILIADO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object pplParcppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSALDOATUAL'
      FieldName = 'VLRSALDOATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplParcppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRJUROSPARC'
      FieldName = 'VLRJUROSPARC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplParcppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRNOMINAL'
      FieldName = 'VLRNOMINAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object pplParcppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCORRSALDO'
      FieldName = 'VLRCORRSALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
  end
  object qryLookPortadorForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    CODPORTFORMA, DESCRICAO, NVL(FLGATIVO, '#39'S'#39') AS FLGATIVO'
      'FROM'
      '    PORTADORFORMA'
      'WHERE'
      '    RECPAG = '#39'R'#39
      'AND IDPESSOA =:EMPRESAPROP'
      'ORDER BY'
      '   DESCRICAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 639
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
        Value = '1'
      end>
    object qryLookPortadorFormaDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = 'PORTADORFORMA.DESCRICAO'
      Size = 50
    end
    object qryLookPortadorFormaFLGATIVO: TStringField
      DisplayLabel = 'Ativo'
      DisplayWidth = 1
      FieldName = 'FLGATIVO'
      Size = 1
    end
    object qryLookPortadorFormaCODPORTFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
      Origin = 'PORTADORFORMA.CODPORTFORMA'
      Visible = False
    end
  end
  object qryLookMsgBoleto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDMSGBOLETO, MSGDESCRICAO'
      'FROM'
      '   MSGBOLETO'
      'WHERE '
      '   ( IDMODULO = :pIDMODULO )'
      ''
      'ORDER BY'
      '   MSGDESCRICAO')
    ValidateWithMask = True
    Left = 726
    Top = 301
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDMODULO'
        ParamType = ptUnknown
      end>
    object qryLookMsgBoletoMSGDESCRICAO: TStringField
      DisplayWidth = 60
      FieldName = 'MSGDESCRICAO'
      Origin = 'MSGBOLETO.MSGDESCRICAO'
      Size = 60
    end
    object qryLookMsgBoletoIDMSGBOLETO: TFloatField
      FieldName = 'IDMSGBOLETO'
      Origin = 'MSGBOLETO.IDMSGBOLETO'
      Visible = False
    end
  end
  object qryLookPais: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPAIS, NOMEPAIS'
      'FROM'
      '   PAIS'
      'ORDER BY'
      '   NOMEPAIS')
    ValidateWithMask = True
    Left = 569
    Top = 60
    object qryLookPaisNOMEPAIS: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEPAIS'
      Origin = 'PAIS.NOMEPAIS'
      Size = 30
    end
    object qryLookPaisIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Origin = 'PAIS.IDPAIS'
      Visible = False
    end
  end
  object qryLookEstado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPAIS, CODESTADO, NOMEESTADO, IDESTADO'
      'FROM'
      '   ESTADO'
      'WHERE'
      '   IDPAIS =:PAIS'
      'ORDER BY'
      '   CODESTADO')
    ValidateWithMask = True
    Left = 568
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PAIS'
        ParamType = ptUnknown
      end>
    object qryLookEstadoCODESTADO: TStringField
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Origin = 'ESTADO.CODESTADO'
      Size = 3
    end
    object qryLookEstadoNOMEESTADO: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEESTADO'
      Origin = 'ESTADO.NOMEESTADO'
      Visible = False
      Size = 30
    end
    object qryLookEstadoIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Origin = 'ESTADO.IDPAIS'
      Visible = False
    end
    object qryLookEstadoIDESTADO: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'ESTADO.IDESTADO'
    end
  end
  object qryLookCidade: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCIDADES, CODESTADO, IDPAIS, NOME, CODMUNICIPIO, IDESTADO'
      'FROM'
      '   CIDADES'
      'ORDER BY'
      '   NOME')
    ValidateWithMask = True
    Left = 568
    Top = 36
    object qryLookCidadeNOME: TStringField
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'CIDADES.NOME'
      Size = 50
    end
    object qryLookCidadeIDCIDADES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCIDADES'
      Origin = 'CIDADES.IDCIDADES'
      Visible = False
    end
    object qryLookCidadeCODESTADO: TStringField
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Origin = 'CIDADES.CODESTADO'
      Visible = False
      Size = 3
    end
    object qryLookCidadeIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Origin = 'CIDADES.IDPAIS'
      Visible = False
    end
    object qryLookCidadeCODMUNICIPIO: TStringField
      DisplayWidth = 10
      FieldName = 'CODMUNICIPIO'
      Origin = 'CIDADES.CODMUNICIPIO'
      Visible = False
      Size = 10
    end
    object qryLookCidadeIDESTADO: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'CIDADES.IDESTADO'
    end
  end
  object qryBuscaProxNumero: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(TO_NUMBER(CONNUMERO)) AS ULTNUMERO'
      'FROM CONTRATOIMOVEL'
      'WHERE FLGTIPOCONTRATO IN('#39'P'#39','#39'C'#39','#39'A'#39')'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 621
    Top = 156
    object qryBuscaProxNumeroULTNUMERO: TFloatField
      FieldName = 'ULTNUMERO'
    end
  end
  object MS_Imovel: TMontaSelect
    Template.IdConsulta = 101
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'DECODE(I.FLGATIVO, '#39'1'#39', '#39'Ativo'#39', '#39'Inativo'#39')'
      'I.IMOCODIGO'
      'T.CODTIPIMOVEL'
      'M.MRCNOME'
      'I.IMONOMEENDERECO'
      'I.IMOLOGRADOURO'
      'I.IMOBAIRRO'
      'CI.NOME'
      'CI.UF'
      'C.CONNUMERO'
      'C.FLGTIPOCONTRATO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Nome do Imóvel'
      'Status'
      'Código do Imóvel'
      'Tipo do Imóvel'
      'Marca / Franquia'
      'Nome Endereço'
      'Logradouro'
      'Bairro'
      'Cidade'
      'UF'
      'Nº  da Proposta'
      '<P>roposta, <C>ontrato')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL IM'
      'MARCAS M'
      'TIPOIMOVEL T'
      'CONTRATOIMOVEL C'
      'CONTRATOXIMOVEL CXI'
      'CIDADES CI')
    CamposChave.Strings = (
      'C.IDCONTRATOIMOVEL')
    Filtro.Strings = (
      'I.IDMARCA = M.IDMARCA (+)'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'I.CODTIPIMOVEL = T.CODTIPIMOVEL(+)'
      'I.IDIMOVEL = CXI.IDIMOVEL'
      'CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL'
      'C.FLGTIPOCONTRATO IN('#39'C'#39' ,'#39'P'#39', '#39'A'#39')'
      'I.IDCIDADES = CI.IDCIDADES(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '7'
      '16'
      '6'
      '20'
      '20'
      '30'
      '15'
      '50'
      '3'
      '20'
      '1')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
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
    Left = 344
    Top = 48
  end
  object cdsEvento: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDEVENTOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDCONTRATOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDUSUARIO'
        DataType = ftFloat
      end
      item
        Name = 'IDCONTRATOLOJA'
        DataType = ftFloat
      end
      item
        Name = 'EVIDATAPROX'
        DataType = ftDateTime
      end
      item
        Name = 'EVICABECALHO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EVIDESCRICAO'
        DataType = ftMemo
        Size = 2000
      end
      item
        Name = 'EVIDATA'
        DataType = ftDateTime
      end
      item
        Name = 'FLGTIPOEVENTO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'EVIPERCENT'
        DataType = ftFloat
      end
      item
        Name = 'EVIINDICEREAJUSTE'
        DataType = ftFloat
      end
      item
        Name = 'EVIVLRANTERIOR'
        DataType = ftFloat
      end
      item
        Name = 'EVIVLRAJUSTADO'
        DataType = ftFloat
      end
      item
        Name = 'CODDOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'FLGAVISO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DIASAVISO'
        DataType = ftFloat
      end
      item
        Name = 'USUARIO_EXTE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DSC_INDICE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'NVL(E.TRGUSERINCLUSAO,E.IDUSUAR'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'IDTIPOEVENTOIMOB'
        DataType = ftFloat
      end
      item
        Name = 'DESCTIPOIMOVEL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NOMEUSUARIO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NUMPROCESSO'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    IndexFieldNames = 'EVIDATA'
    Params = <>
    StoreDefs = True
    Left = 443
    Top = 312
    object cdsEventoIDEVENTOIMOVEL: TFloatField
      FieldName = 'IDEVENTOIMOVEL'
    end
    object cdsEventoIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsEventoEVIDATA: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data'
      FieldName = 'EVIDATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsEventoEVICABECALHO: TStringField
      FieldName = 'EVICABECALHO'
      Size = 60
    end
    object cdsEventoEVIDESCRICAO: TMemoField
      FieldName = 'EVIDESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object cdsEventoIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
    end
    object cdsEventoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object cdsEventoFLGTIPOEVENTO: TStringField
      FieldName = 'FLGTIPOEVENTO'
      Size = 2
    end
    object cdsEventoEVIDATAPROX: TDateTimeField
      DisplayLabel = 'Próximo'
      FieldName = 'EVIDATAPROX'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsEventoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
  end
  object dsEvento: TwwDataSource
    AutoEdit = False
    DataSet = cdsEvento
    Left = 507
    Top = 304
  end
  object dsMultaJuros: TwwDataSource
    AutoEdit = False
    DataSet = qryMultaJuros
    Left = 277
    Top = 97
  end
  object updMultaJuros: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOXMULTA'
      'set'
      '  IDINDCORRECAO = :IDINDCORRECAO,'
      '  MOEDAJUROS = :MOEDAJUROS,'
      '  MOEDAMULTA = :MOEDAMULTA,'
      '  FLGINDETERMINADO = :FLGINDETERMINADO,'
      '  VLRMULTA = :VLRMULTA,'
      '  PERCMULTA = :PERCMULTA,'
      '  VLRJUROS = :VLRJUROS,'
      '  PERCJUROS = :PERCJUROS,'
      '  PERIODOJUROS = :PERIODOJUROS,'
      '  FLGJUROSPROPORC = :FLGJUROSPROPORC,'
      '  DATAINI = :DATAINI,'
      '  DATAFIM = :DATAFIM,'
      '  MESREFCORRECAO = :MESREFCORRECAO,'
      '  DIASTOLERANCIA = :DIASTOLERANCIA,'
      '  DIASREPASSE = :DIASREPASSE,'
      '  FLGTIPODIATOLERA = :FLGTIPODIATOLERA,'
      '  FLGTIPODIAREPASS = :FLGTIPODIAREPASS'
      'where'
      '  IDCONTRATOXMULTA = :OLD_IDCONTRATOXMULTA')
    InsertSQL.Strings = (
      'insert into CONTRATOXMULTA'
      '  (IDCONTRATOXMULTA, IDCONTRATOIMOVEL, IDINDCORRECAO, '
      'MOEDAJUROS, MOEDAMULTA, '
      '   FLGINDETERMINADO, VLRMULTA, PERCMULTA, VLRJUROS, PERCJUROS, '
      'PERIODOJUROS, '
      '   FLGJUROSPROPORC, DATAINI, DATAFIM, MESREFCORRECAO, '
      'DIASTOLERANCIA, DIASREPASSE, '
      '   FLGTIPODIATOLERA, FLGTIPODIAREPASS)'
      'values'
      '  (:IDCONTRATOXMULTA, :IDCONTRATOIMOVEL, :IDINDCORRECAO, '
      ':MOEDAJUROS, :MOEDAMULTA, '
      
        '   :FLGINDETERMINADO, :VLRMULTA, :PERCMULTA, :VLRJUROS, :PERCJUR' +
        'OS, '
      ':PERIODOJUROS, '
      '   :FLGJUROSPROPORC, :DATAINI, :DATAFIM, :MESREFCORRECAO, '
      ':DIASTOLERANCIA, '
      '   :DIASREPASSE, :FLGTIPODIATOLERA, :FLGTIPODIAREPASS)')
    DeleteSQL.Strings = (
      'delete from CONTRATOXMULTA'
      'where'
      '  IDCONTRATOXMULTA = :OLD_IDCONTRATOXMULTA')
    Left = 197
    Top = 112
  end
  object qryMultaJuros: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     MJ.IDCONTRATOXMULTA,'
      '     MJ.IDCONTRATOIMOVEL,'
      '     MJ.IDINDCORRECAO,'
      '     M.MOESIGLA AS DSCINDCORR,'
      '     MJ.MOEDAJUROS,'
      '     MP.MOESIGLA AS DSCMOEJUROS,'
      '     MJ.MOEDAMULTA,'
      '     MD.MOESIGLA AS DSCMOEMULTA,'
      '     MJ.FLGINDETERMINADO,'
      '     MJ.VLRMULTA,'
      '     MJ.PERCMULTA,'
      '     MJ.VLRJUROS,'
      '     MJ.PERCJUROS,'
      '     MJ.PERIODOJUROS,'
      '     MJ.FLGJUROSPROPORC,'
      '     MJ.DATAINI,'
      '     MJ.DATAFIM,'
      '     MJ.MESREFCORRECAO,'
      '     MJ.DIASTOLERANCIA,'
      '     MJ.DIASREPASSE,'
      '     MJ.FLGTIPODIATOLERA,'
      '     MJ.FLGTIPODIAREPASS,'
      
        '     DECODE(MJ.PERIODOJUROS,'#39'D'#39','#39'Diário'#39','#39'M'#39','#39'Mensal'#39','#39#39') AS DSC' +
        'PERIODOJUROS,'
      
        '     DECODE(MJ.FLGTIPODIATOLERA,'#39'C'#39','#39'Dias Corridos'#39','#39'U'#39','#39'Dias Út' +
        'eis'#39','#39#39') AS DSCTIPODIATOLERA,'
      
        '     DECODE(MJ.FLGTIPODIAREPASS,'#39'C'#39','#39'Dias Corridos'#39','#39'U'#39','#39'Dias Út' +
        'eis'#39','#39#39') AS DSCTIPODIAREPASS'
      ''
      'FROM'
      '     CONTRATOXMULTA MJ,'
      '     MOEDA M,'
      '     MOEDA MP,'
      '     MOEDA MD'
      ''
      'WHERE'
      '      MJ.IDCONTRATOIMOVEL = :CONTRATOIMOVEL     '
      ' AND  (M.MOECODIGO(+)=MJ.IDINDCORRECAO)'
      ' AND (MP.MOECODIGO(+)=MJ.MOEDAJUROS)'
      ' AND (MD.MOECODIGO(+)=MJ.MOEDAMULTA)'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updMultaJuros
    ControlType.Strings = (
      'FLGINDETERMINADO;CheckBox;S;N'
      'FLGJUROSPROPORC;CheckBox;S;N')
    ValidateWithMask = True
    Left = 277
    Top = 114
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryMultaJurosDATAINI: TDateTimeField
      DisplayLabel = 'Data Início'
      DisplayWidth = 10
      FieldName = 'DATAINI'
    end
    object qryMultaJurosDATAFIM: TDateTimeField
      DisplayLabel = 'Data Fim'
      DisplayWidth = 10
      FieldName = 'DATAFIM'
    end
    object qryMultaJurosFLGINDETERMINADO: TStringField
      DisplayLabel = 'Indeterminado'
      DisplayWidth = 12
      FieldName = 'FLGINDETERMINADO'
      FixedChar = True
      Size = 1
    end
    object qryMultaJurosDSCINDCORR: TStringField
      DisplayLabel = 'Ind. Correção'
      DisplayWidth = 12
      FieldName = 'DSCINDCORR'
      Size = 10
    end
    object qryMultaJurosMESREFCORRECAO: TFloatField
      DisplayLabel = 'Mês Correção'
      DisplayWidth = 11
      FieldName = 'MESREFCORRECAO'
    end
    object qryMultaJurosVLRMULTA: TFloatField
      DisplayLabel = 'Vlr. Multa'
      DisplayWidth = 8
      FieldName = 'VLRMULTA'
      DisplayFormat = '#,##0.00'
    end
    object qryMultaJurosDSCMOEMULTA: TStringField
      DisplayLabel = 'Moeda Multa'
      DisplayWidth = 11
      FieldName = 'DSCMOEMULTA'
      Size = 10
    end
    object qryMultaJurosPERCMULTA: TFloatField
      DisplayLabel = 'Multa'
      DisplayWidth = 7
      FieldName = 'PERCMULTA'
      DisplayFormat = '##0.00%'
    end
    object qryMultaJurosVLRJUROS: TFloatField
      DisplayLabel = 'Vlr. Juros'
      DisplayWidth = 8
      FieldName = 'VLRJUROS'
      DisplayFormat = '#,##0.00'
    end
    object qryMultaJurosDSCMOEJUROS: TStringField
      DisplayLabel = 'Moeda Juros'
      DisplayWidth = 10
      FieldName = 'DSCMOEJUROS'
      Size = 10
    end
    object qryMultaJurosPERCJUROS: TFloatField
      DisplayLabel = 'Juros'
      DisplayWidth = 6
      FieldName = 'PERCJUROS'
      DisplayFormat = '##0.00%'
    end
    object qryMultaJurosDSCPERIODOJUROS: TStringField
      DisplayLabel = 'Período Juros'
      DisplayWidth = 6
      FieldName = 'DSCPERIODOJUROS'
      Size = 6
    end
    object qryMultaJurosFLGJUROSPROPORC: TStringField
      DisplayLabel = 'Proporcionais'
      DisplayWidth = 11
      FieldName = 'FLGJUROSPROPORC'
      FixedChar = True
      Size = 1
    end
    object qryMultaJurosDIASTOLERANCIA: TFloatField
      DisplayLabel = 'Dias Tolerância'
      DisplayWidth = 13
      FieldName = 'DIASTOLERANCIA'
    end
    object qryMultaJurosDSCTIPODIATOLERA: TStringField
      DisplayLabel = 'Tipo Dia Tolerância'
      DisplayWidth = 13
      FieldName = 'DSCTIPODIATOLERA'
      Size = 13
    end
    object qryMultaJurosDIASREPASSE: TFloatField
      DisplayLabel = 'Dias Repasse'
      DisplayWidth = 11
      FieldName = 'DIASREPASSE'
    end
    object qryMultaJurosDSCTIPODIAREPASS: TStringField
      DisplayLabel = 'Tipo Dia Repasse'
      DisplayWidth = 13
      FieldName = 'DSCTIPODIAREPASS'
      Size = 13
    end
    object qryMultaJurosIDCONTRATOXMULTA: TFloatField
      FieldName = 'IDCONTRATOXMULTA'
      Visible = False
    end
    object qryMultaJurosIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryMultaJurosIDINDCORRECAO: TFloatField
      FieldName = 'IDINDCORRECAO'
      Visible = False
    end
    object qryMultaJurosMOEDAJUROS: TFloatField
      FieldName = 'MOEDAJUROS'
      Visible = False
    end
    object qryMultaJurosMOEDAMULTA: TFloatField
      FieldName = 'MOEDAMULTA'
      Visible = False
    end
    object qryMultaJurosPERIODOJUROS: TStringField
      FieldName = 'PERIODOJUROS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryMultaJurosFLGTIPODIATOLERA: TStringField
      FieldName = 'FLGTIPODIATOLERA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryMultaJurosFLGTIPODIAREPASS: TStringField
      FieldName = 'FLGTIPODIAREPASS'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object rptParc: TppReport
    AutoStop = False
    DataPipeline = pplParc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rptParcBeforePrint
    DeviceType = 'Screen'
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 704
    Top = 253
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplParc'
    object HeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 47625
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Projeção de Parcelas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 529
        mmTop = 8731
        mmWidth = 282311
        BandType = 0
      end
      object Line1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 38894
        mmWidth = 284300
        BandType = 0
      end
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 794
        mmTop = 1588
        mmWidth = 282311
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Parc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 1058
        mmTop = 39423
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 10319
        mmTop = 39423
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Prestação Atualizada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 220928
        mmTop = 39423
        mmWidth = 15346
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 47096
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Correção / Resíduo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 129117
        mmTop = 39423
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Resíduo Atualizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 243946
        mmTop = 39423
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Fator'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 270934
        mmTop = 39423
        mmWidth = 6879
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 15610
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Juros Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 87048
        mmTop = 39423
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Amortiz.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 155311
        mmTop = 39423
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Prestação Nominal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 60854
        mmTop = 39423
        mmWidth = 16140
        BandType = 0
      end
      object lblProposta: TppLabel
        UserName = 'Label15'
        Caption = 'Label15'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 17727
        mmWidth = 15875
        BandType = 0
      end
      object ppRegion2: TppRegion
        UserName = 'Region2'
        Brush.Style = bsClear
        Transparent = True
        mmHeight = 12435
        mmLeft = 0
        mmTop = 24077
        mmWidth = 277284
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel19: TppLabel
          UserName = 'Label21'
          AutoSize = False
          Caption = 'Num de Parcelas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 31485
          mmWidth = 26194
          BandType = 0
        end
        object lblAval: TppLabel
          UserName = 'Label22'
          AutoSize = False
          Caption = 'Valor Financiado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 26458
          mmWidth = 24871
          BandType = 0
        end
        object lblPres: TppLabel
          UserName = 'Label23'
          AutoSize = False
          Caption = 'Total a Pagar:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 142346
          mmTop = 30956
          mmWidth = 20638
          BandType = 0
        end
        object lblVlrFinanc: TppLabel
          UserName = 'Label202'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 26723
          mmTop = 26458
          mmWidth = 26194
          BandType = 0
        end
        object lblParc: TppLabel
          UserName = 'Label203'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 40217
          mmTop = 31485
          mmWidth = 12700
          BandType = 0
        end
        object lblVlrTotal: TppLabel
          UserName = 'lblVlrTotal'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 164307
          mmTop = 30956
          mmWidth = 26194
          BandType = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Data da Proposta:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 57679
          mmTop = 31485
          mmWidth = 25665
          BandType = 0
        end
        object lblDtProposta: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 86254
          mmTop = 31485
          mmWidth = 26194
          BandType = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label101'
          AutoSize = False
          Caption = 'Forma de Calculo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 57679
          mmTop = 26458
          mmWidth = 26194
          BandType = 0
        end
        object lblFormaCalculo: TppLabel
          UserName = 'Label16'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 86254
          mmTop = 26458
          mmWidth = 187590
          BandType = 0
        end
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Prestação Efetiva'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 175155
        mmTop = 39423
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Saldo Devedor Atualizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 33338
        mmTop = 39423
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 'Saldo Devedor Amortizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 191559
        mmTop = 39423
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 'Juros Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 107686
        mmTop = 39423
        mmWidth = 14817
        BandType = 0
      end
    end
    object DetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NUMPARCELA'
        DataPipeline = pplParc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParc'
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLRPRESTATUALIZADA'
        DataPipeline = pplParc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParc'
        mmHeight = 3175
        mmLeft = 214048
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VLRRESIDUOATUALI'
        DataPipeline = pplParc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParc'
        mmHeight = 3175
        mmLeft = 237067
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'FATORCORRECAO'
        DataPipeline = pplParc
        DisplayFormat = '#0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParc'
        mmHeight = 3175
        mmLeft = 261144
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLRJUROS'
        DataPipeline = pplParc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParc'
        mmHeight = 3175
        mmLeft = 77523
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VLRAMORTIZACAO'
        DataPipeline = pplParc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParc'
        mmHeight = 3175
        mmLeft = 145786
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VLRNOMINAL'
        DataPipeline = pplParc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParc'
        mmHeight = 3175
        mmLeft = 54769
        mmTop = 0
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'VLRSALDOATUAL'
        DataPipeline = pplParc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParc'
        mmHeight = 3175
        mmLeft = 32015
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DATAVENCIMENTO'
        DataPipeline = pplParc
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParc'
        mmHeight = 3175
        mmLeft = 12965
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText101'
        DataField = 'VLRPRESTACAO'
        DataPipeline = pplParc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParc'
        mmHeight = 3175
        mmLeft = 168540
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'VLRSALDODEVEDOR'
        DataPipeline = pplParc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParc'
        mmHeight = 3175
        mmLeft = 191294
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'VLRJUROSPARC'
        DataPipeline = pplParc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParc'
        mmHeight = 3175
        mmLeft = 100277
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppVariable1: TppVariable
        UserName = 'vCorrecao'
        AutoSize = False
        CalcOrder = 0
        DataType = dtDouble
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 123296
        mmTop = 0
        mmWidth = 21696
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object Calc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 279665
        BandType = 8
      end
      object Line2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object LblSistema: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 280194
        BandType = 8
      end
      object Calc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 253471
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650611
        44657461696C4265666F72655072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F7572636506A370726F63656475726520446574
        61696C4265666F72655072696E743B0D0A626567696E0D0A202076436F727265
        63616F2E4173446F75626C65203A3D206C506172635B27564C52524553494455
        4F275D202B206C506172635B27564C52434F525253414C444F275D3B0D0A2020
        76436F72726563616F2E56697369626C6520203A3D2076436F72726563616F2E
        4173446F75626C65203C3E20303B0D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D65060644657461696C094576656E744E616D65060B4265666F72655072
        696E74074576656E74494402180000}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object dsFiador: TwwDataSource
    AutoEdit = False
    DataSet = qryFiador
    Left = 105
    Top = 97
  end
  object qryFiador: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   AX.IDCONTRATOIMOVEL, AX.IDAVALISTA, '
      '         PA.NOME AS NF_FIADOR, PA.RAZAOSOCIAL AS RS_FIADOR '
      '  FROM   PESSOA PA, AVALISTAXCONTRATO AX '
      ' WHERE   AX.IDAVALISTA = PA.IDPESSOA '
      '   AND   AX.IDCONTRATOIMOVEL = :iIdContrato'
      'ORDER BY NF_FIADOR'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updFiador
    ValidateWithMask = True
    Left = 106
    Top = 122
    ParamData = <
      item
        DataType = ftFloat
        Name = 'iIdContrato'
        ParamType = ptInput
      end>
    object qryFiadorIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'BASEDADOS.AVALISTAXCONTRATO.IDCONTRATOIMOVEL'
    end
    object qryFiadorIDAVALISTA: TFloatField
      FieldName = 'IDAVALISTA'
      Origin = 'BASEDADOS.AVALISTAXCONTRATO.IDAVALISTA'
    end
    object qryFiadorNF_FIADOR: TStringField
      FieldName = 'NF_FIADOR'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryFiadorRS_FIADOR: TStringField
      FieldName = 'RS_FIADOR'
      Origin = 'BASEDADOS.PESSOA.RAZAOSOCIAL'
      Size = 60
    end
  end
  object updFiador: TUpdateSQL
    ModifySQL.Strings = (
      'update AVALISTAXCONTRATO'
      'set'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL,'
      '  IDAVALISTA = :IDAVALISTA'
      'where'
      '  IDCONTRATOIMOVEL = :OLD_IDCONTRATOIMOVEL and'
      '  IDAVALISTA = :OLD_IDAVALISTA')
    InsertSQL.Strings = (
      'insert into AVALISTAXCONTRATO'
      '  (IDCONTRATOIMOVEL, IDAVALISTA)'
      'values'
      '  (:IDCONTRATOIMOVEL, :IDAVALISTA)')
    DeleteSQL.Strings = (
      'delete from AVALISTAXCONTRATO'
      'where'
      '  IDCONTRATOIMOVEL = :OLD_IDCONTRATOIMOVEL and'
      '  IDAVALISTA = :OLD_IDAVALISTA')
    Left = 67
    Top = 114
  end
  object dsBanco: TwwDataSource
    AutoEdit = False
    DataSet = qryBanco
    Left = 633
    Top = 241
  end
  object qryBanco: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  PB.NOME,    '
      '                PB.RAZAOSOCIAL,  '
      '                B.NUMBANCO, '
      '                B.IDPESSOA  '
      'FROM     PESSOA PB, BANCO B '
      'WHERE  B.IDPESSOA = PB.IDPESSOA    '
      'ORDER BY '
      '               PB.RAZAOSOCIAL'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 674
    Top = 242
    object qryBancoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryBancoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'BASEDADOS.PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryBancoNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Origin = 'BASEDADOS.BANCO.NUMBANCO'
      Size = 10
    end
    object qryBancoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.BANCO.IDPESSOA'
    end
  end
end
