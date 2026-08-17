inherited frmdeletaFolhaMT: TfrmdeletaFolhaMT
  Left = 379
  Top = 126
  HelpContext = 240010
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Apagar Geração da Folha'
  ClientHeight = 537
  ClientWidth = 662
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 662
    Height = 498
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 660
      Height = 496
      Align = alClient
      TabOrder = 0
      object gbPeriodo: TGroupBox
        Left = 1
        Top = 45
        Width = 658
        Height = 90
        Align = alTop
        Caption = 'Apagar Lançamentos por...'
        TabOrder = 1
        object pnlVersaoPagto: TPanel
          Left = 168
          Top = 9
          Width = 465
          Height = 73
          BevelOuter = bvNone
          TabOrder = 3
          object gbxVersao: TGroupBox
            Left = 16
            Top = 3
            Width = 393
            Height = 70
            Caption = 'Versão da Folha de Benefícios :'
            TabOrder = 0
            object dblcNatureza: TwwDBLookupCombo
              Left = 6
              Top = 17
              Width = 379
              Height = 21
              DropDownAlignment = taLeftJustify
              LookupTable = qryVersoes
              LookupField = 'HISTORICO'
              Options = [loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnChange = dblcNaturezaChange
              OnCloseUp = dblcNaturezaCloseUp
            end
          end
        end
        object pnlData: TPanel
          Left = 170
          Top = 8
          Width = 439
          Height = 75
          BevelOuter = bvNone
          TabOrder = 2
          object grbPeriodoVersao: TGroupBox
            Left = 16
            Top = 3
            Width = 393
            Height = 70
            Caption = 'Datas'
            TabOrder = 0
            object Label1: TLabel
              Left = 10
              Top = 20
              Width = 66
              Height = 13
              Caption = 'Data Inicial'
            end
            object Label2: TLabel
              Left = 10
              Top = 45
              Width = 59
              Height = 13
              Caption = 'Data Final'
            end
            object dtInicio: TCMDateTimePicker
              Left = 81
              Top = 16
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
              TabOrder = 0
              OnCloseUp = dtInicioCloseUp
              OnChange = dtInicioCloseUp
            end
            object dtFim: TCMDateTimePicker
              Left = 81
              Top = 41
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
              OnCloseUp = dtFimCloseUp
              OnChange = dtFimCloseUp
            end
          end
        end
        object rdbData: TRadioButton
          Left = 16
          Top = 25
          Width = 153
          Height = 17
          Caption = 'Data de Lançamento'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rdbDataClick
        end
        object rdbVersao: TRadioButton
          Left = 16
          Top = 51
          Width = 153
          Height = 17
          Caption = 'Versão de Pagamento'
          TabOrder = 1
          OnClick = rdbVersaoClick
        end
      end
      object pnlPosicao: TPanel
        Left = 1
        Top = 473
        Width = 658
        Height = 22
        Align = alBottom
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Color = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object rdgNatureza: TRadioGroup
        Left = 1
        Top = 135
        Width = 658
        Height = 75
        Align = alTop
        Caption = 'Natureza de Rendimento'
        ItemIndex = 0
        Items.Strings = (
          'Todas'
          'Específica')
        TabOrder = 3
        OnClick = rdgNaturezaClick
      end
      object dblcNatRendimento: TwwDBLookupCombo
        Left = 100
        Top = 184
        Width = 292
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'Descrição'
          'CODNATUREZA'#9'4'#9'Código')
        LookupTable = cdsNaturRendimento
        LookupField = 'CODNATUREZA'
        Options = [loTitles]
        TabOrder = 4
        Visible = False
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblcNatRendimentoCloseUp
      end
      inline frmFrameListaBenef: TfrmFrameListaBenef
        Left = 1
        Top = 210
        Width = 658
        Height = 263
        Align = alClient
        TabOrder = 5
        inherited Panel3: TPanel
          Width = 658
          inherited Dock971: TDock97
            Width = 656
            inherited TB97oKCancelar: TToolbar97
              inherited lblQuant: TLabel
                Width = 5
              end
            end
          end
        end
        inherited dbgrdPessoas: TwwDBGrid
          Width = 658
          Height = 229
        end
      end
      object rgSistema: TGroupBox
        Left = 1
        Top = 1
        Width = 658
        Height = 44
        Align = alTop
        Caption = 'Selecione o Tipo de Folha :'
        TabOrder = 0
        object rbDesfazFlPagto: TRadioButton
          Left = 27
          Top = 19
          Width = 113
          Height = 17
          Caption = '&Pagamento'
          TabOrder = 0
          OnClick = rbDesfazFlPagtoClick
        end
        object rbDesfazFlBenef: TRadioButton
          Left = 166
          Top = 19
          Width = 113
          Height = 17
          Caption = '&Benefícios'
          Enabled = False
          TabOrder = 1
          Visible = False
          OnClick = rbDesfazFlPagtoClick
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 498
    Width = 662
    inherited tb97Fundo: TToolbar97
      Left = 14
      DockPos = 14
      inherited sep1: TToolbarSep97
        Left = 298
      end
      inherited bbtnSair: TBitBtn
        Left = 217
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 300
      end
      object bbtnConfirmaGeracao: TBitBtn
        Left = 0
        Top = 0
        Width = 137
        Height = 33
        Cancel = True
        Caption = '&Apagar '
        TabOrder = 2
        OnClick = bbtnConfirmaGeracaoClick
        Glyph.Data = {
          16030000424D160300000000000076000000280000003F000000150000000100
          040000000000A002000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777777777777777777777777777770777888888888
          8888887777778888888888888887777778888888888888887770770000000000
          000008888770000000000000008888770000000000000008888070B7B7B70FBF
          BFB7B000070B7B7B70FBFBFB7B000070B7B7B70FBFBFB7B0000070FBFFFF0BFB
          FBFB7B7B770FBFFFF0BFBFBFB7B7B770FBFFFF0BFBFBFB7B7B7077000000BFBF
          BFFFB7B7B77000000BFBFBFFFB7B7B77000000BFBFBFFFB7B7B0707B7B7B0BFB
          FBFBFBFBF707B7B7B0BFBFBFBFBFBF707B7B7B0BFBFBFBFBFBF070BFBFFF0FFF
          FFFFBFBFB70BFBFFF0FFFFFFFBFBFB70BFBFFF0FFFFFFFBFBFB077000000FBFF
          FFFBFFFBF77000000FBFFFFFBFFFBF77000000FBFFFFFBFFFBF070B7B7BF0FF0
          FFFFFFBFF70B7B7BF0FF0FFFFFFBFF70B7B7BF0FF0FFFFFFBFF070FBFFFB0B0F
          FBFBFBFBF70FBFFFB0B0FFBFBFBFBF70FBFFFB0B0FFBFBFBFBF077000000BF0F
          BFFFFFFFF77000000BF0FBFFFFFFFF77000000BF0FBFFFFFFFF0707B7BFB00FB
          FBFBFBFBF707B7BFB00FBFBFBFBFBF707B7BFB00FBFBFBFBFBF070BFBFFF00FF
          BFBF0000070BFBFFF00FFBFBF0000070BFBFFF00FFBFBF0000007700000000FB
          FBF0777777700000000FBFBF0777777700000000FBFBF08888807777777770BF
          BF07777777777777770BFBF07777777777777770BFBF08888880777777770BFB
          F07777777777777770BFBF07777777777777770BFBF088777770777777770FBF
          077777777777777770FBF077777777777777770FBF0887777770777777770BF0
          777777777777777770BF0777777777777777770BF08877777770777777770FB0
          777777777777777770FB0777777777777777770FB08777777770777777777007
          7777777777777777770077777777777777777770087777777770}
        NumGlyphs = 3
        Spacing = 2
      end
      object bbtnCancelar: TBitBtn
        Left = 137
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 3
        OnClick = bbtnCancelarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 351
    Top = 3
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object dsVersoes: TDataSource
    Left = 295
    Top = 3
  end
  object qryVersoes: TQuery
    DatabaseName = 'BaseDados'
    DataSource = dsVersoes
    SQL.Strings = (
      'SELECT'
      #9'IDHSTFOLHABENEF||'#39'-'#39'||HISTORICO AS HISTORICO,'
      #9'IDHSTFOLHABENEF,'
      #9'DATAPREVPAGTO'
      'FROM'
      #9'HSTFOLHABENEF'
      'WHERE'
      #9'DATAPREVPAGTO IS NOT NULL'
      'ORDER BY DATAPREVPAGTO DESC'
      ' ')
    Left = 267
    Top = 3
  end
  object MontaSelectBenef: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.NOME'
      'DEPENTIT.MATRICULA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'CPF'
      'Nome'
      'Matrícula')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'S')
    Tabelas.Strings = (
      'PESSOA'
      'HISTRUBSAL'
      'DEPENTIT')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'DEPENTIT.MATRICULA')
    Filtro.Strings = (
      'HISTRUBSAL.IDMODULO = 18'
      '((HISTRUBSAL.FLGESTORNO = 0) OR (HISTRUBSAL.FLGESTORNO IS NULL))'
      'HISTRUBSAL.IDPESSOA = PESSOA.IDPESSOA'
      'DEPENTIT.IDPESSOA = P.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '60'
      '15')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 323
    Top = 3
  end
  object cdsNaturRendimento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 240
    Top = 4
  end
end
