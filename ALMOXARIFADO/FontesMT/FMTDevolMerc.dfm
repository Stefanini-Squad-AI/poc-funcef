inherited FrmMTDevolMerc: TFrmMTDevolMerc
  Left = 19
  Top = 46
  Caption = 'Devolução de Mercadoria'
  ClientHeight = 447
  ClientWidth = 756
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 756
    Height = 361
    inherited pnlMestre: TPanel
      Width = 754
      Height = 148
      object Label1: TLabel
        Left = 12
        Top = 52
        Width = 101
        Height = 13
        Caption = 'Nº da Nota Fiscal'
      end
      object lblBarra: TLabel
        Left = 101
        Top = 71
        Width = 7
        Height = 13
        Caption = '/'
      end
      object lblValor: TLabel
        Left = 190
        Top = 52
        Width = 149
        Height = 13
        Caption = 'Valor Total da Nota Fiscal'
      end
      object dblcFornCli: TCMProcuraForCli
        Left = 12
        Top = 4
        Width = 334
        Height = 47
        Caption = ' Favorecido '
        Enabled = False
        TabOrder = 0
        CampoEdit = ceRazaoSocial
        MostraMensagens = True
        DataSource = ds
        DataField = 'IDFORCLI'
        Mensagens.EmBranco = 'Fornecedor em branco'
        Mensagens.NaoExiste = 'Fornecedor não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        ForCli = fcFornecedor
        MostraEndereco = False
        StatusForCli = fcAll
        MostraStatusCredito = False
      end
      object dbenNumDoc: TDBRealEdit
        Left = 12
        Top = 67
        Width = 85
        Height = 21
        Alignment = taRightJustify
        Enabled = False
        Lines.Strings = (
          '         0')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
        DataField = 'NUMNF'
        DataSource = ds
      end
      object gbDatas: TGroupBox
        Left = 12
        Top = 90
        Width = 333
        Height = 53
        Caption = 'Datas'
        TabOrder = 2
        object lblData: TLabel
          Left = 181
          Top = 14
          Width = 45
          Height = 13
          Caption = 'Entrada'
        end
        object lblEmissao: TLabel
          Left = 15
          Top = 14
          Width = 47
          Height = 13
          Caption = 'Emissão'
        end
        object dbeDataLanc: TCMDateTimePicker
          Left = 181
          Top = 28
          Width = 114
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAENTDEVOL'
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
          ShowButton = True
          TabOrder = 1
        end
        object dbeDataEmi: TCMDateTimePicker
          Left = 15
          Top = 28
          Width = 114
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAEMISNF'
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
          ShowButton = True
          TabOrder = 0
        end
      end
      object dbeCompl: TwwDBEdit
        Left = 110
        Top = 67
        Width = 44
        Height = 21
        DataField = 'COMPLNF'
        DataSource = ds
        Enabled = False
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeValorCorrente: TDBRealEdit
        Left = 190
        Top = 67
        Width = 154
        Height = 21
        Alignment = taRightJustify
        Enabled = False
        Lines.Strings = (
          '      0,00')
        TabOrder = 4
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRNOTAFISCAL'
        DataSource = ds
      end
      object gbNotaDev: TGroupBox
        Left = 363
        Top = 4
        Width = 364
        Height = 139
        Caption = ' Nota de Devolução '
        TabOrder = 5
        object Label4: TLabel
          Left = 16
          Top = 16
          Width = 101
          Height = 13
          Caption = 'Nº da Nota Fiscal'
        end
        object Label5: TLabel
          Left = 133
          Top = 38
          Width = 7
          Height = 13
          Caption = '/'
        end
        object Label6: TLabel
          Left = 192
          Top = 16
          Width = 149
          Height = 13
          Caption = 'Valor Total da Nota Fiscal'
        end
        object dbenNumDocDev: TDBRealEdit
          Left = 16
          Top = 32
          Width = 113
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '         0')
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
          DataField = 'NUMNF'
          DataSource = dsDevol
        end
        object mskNumNF: TMaskEdit
          Left = 16
          Top = 32
          Width = 113
          Height = 21
          TabOrder = 4
          OnExit = mskNumNFExit
        end
        object dbeComplDev: TwwDBEdit
          Left = 144
          Top = 32
          Width = 44
          Height = 21
          DataField = 'COMPLNF'
          DataSource = dsDevol
          MaxLength = 3
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeValorCorrenteDev: TDBRealEdit
          Left = 192
          Top = 32
          Width = 154
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
          DataField = 'VLRNOTAFISCAL'
          DataSource = dsDevol
        end
        object GroupBox3: TGroupBox
          Left = 17
          Top = 64
          Width = 332
          Height = 63
          Caption = 'Datas'
          TabOrder = 3
          object Label7: TLabel
            Left = 181
            Top = 14
            Width = 62
            Height = 13
            Caption = 'Devolução'
          end
          object Label8: TLabel
            Left = 15
            Top = 14
            Width = 47
            Height = 13
            Caption = 'Emissão'
          end
          object dbedDataLancDev: TCMDateTimePicker
            Left = 181
            Top = 28
            Width = 114
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAENTDEVOL'
            DataSource = dsDevol
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
          object dbedDataEmiDev: TCMDateTimePicker
            Left = 15
            Top = 28
            Width = 114
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAEMISNF'
            DataSource = dsDevol
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
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 149
      Width = 754
      Height = 211
      Tabs.Strings = (
        'Itens'
        'Contabilização')
      detdbGrids.Strings = (
        'dbgrdDet'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 656
        Height = 152
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 648
            Height = 124
            Selected.Strings = (
              'NUMOC'#9'8'#9'O.C.'
              'CODARTIGO'#9'14'#9'Código Item'
              'DESCPROD'#9'30'#9'Descrição do Item'
              'CODTAMANHO'#9'3'#9'Tam.'
              'CODCOR'#9'5'#9'Cor'
              'QTDERECEBDEVOL'#9'10'#9'Quantidade'
              'QTDEDEV'#9'10'#9'Quantidade~Devolvida '
              'VLRUNITARIO'#9'10'#9'Valor Unitário'
              'CODMEDIDA'#9'4'#9'Unid.'
              'VLRESTOQUE'#9'10'#9'Valor do Estoque'
              'VLRDEV'#9'10'#9'Valor~Devolvido'
              'CODCENTROCUSTO'#9'10'#9'Centro de Custo'
              'CODFISCAL'#9'4'#9'Código Fiscal'
              'DATAVALIDADE'#9'10'#9'Validade'
              'CODALMOXARIFADO'#9'10'#9'Almoxarifado'
              'CODCENTRORESPON'#9'10'#9'C.Respon.'
              'UNIDNEGOC'#9'10'#9'Atividade'
              'CODTIPRECDES'#9'15'#9'Tipo Desemb.')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TitleAlignment = taCenter
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 648
            Height = 124
            object Label3: TLabel
              Left = 16
              Top = 0
              Width = 34
              Height = 13
              Caption = 'Artigo'
            end
            object Label12: TLabel
              Left = 120
              Top = 0
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object Label13: TLabel
              Left = 320
              Top = 0
              Width = 89
              Height = 13
              Caption = 'Qtde Devolvida'
            end
            object Label15: TLabel
              Left = 432
              Top = 0
              Width = 53
              Height = 13
              Caption = 'Un. Med.'
            end
            object Label16: TLabel
              Left = 520
              Top = 0
              Width = 78
              Height = 13
              Caption = 'Valor Unitário'
            end
            object Label2: TLabel
              Left = 16
              Top = 120
              Width = 72
              Height = 13
              Caption = 'Class. Fiscal'
            end
            object dbedQtdeEnt: TDBRealEdit
              Left = 320
              Top = 16
              Width = 105
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '    0,0000')
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDEDEV'
              DataSource = dsDet
            end
            object dbedValUN: TDBRealEdit
              Left = 520
              Top = 16
              Width = 88
              Height = 21
              Alignment = taRightJustify
              Color = clWhite
              Enabled = False
              Lines.Strings = (
                '    0,0000')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRUNITARIO'
              DataSource = dsDet
            end
            object GroupBox1: TGroupBox
              Left = 12
              Top = 43
              Width = 594
              Height = 66
              Caption = 'Destino da Mercadoria'
              TabOrder = 2
              object pnlDestino: TPanel
                Left = 2
                Top = 15
                Width = 590
                Height = 49
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object lblDestEdit: TLabel
                  Left = 304
                  Top = 0
                  Width = 120
                  Height = 13
                  Caption = 'Almoxarifado Destino'
                end
                object dblkpcmbAlmoxa: TwwDBLookupCombo
                  Left = 304
                  Top = 16
                  Width = 274
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCALMOX'#9'40'#9'Descrição'
                    'CODALMOXARIFADO'#9'10'#9'Código')
                  DataField = 'CODALMOXARIFADO'
                  DataSource = dsDet
                  LookupTable = CdsAlmox
                  LookupField = 'CODALMOXARIFADO'
                  Options = [loTitles]
                  Enabled = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
              end
              object dbrgECA: TDBRadioGroup
                Left = 8
                Top = 16
                Width = 268
                Height = 40
                Columns = 3
                DataField = 'FLGDESTINO'
                DataSource = dsDet
                Enabled = False
                Items.Strings = (
                  '&Estoque'
                  '&Custo'
                  '&Ativo Fixo')
                TabOrder = 1
                Values.Strings = (
                  'E'
                  'C'
                  'A')
              end
            end
            object dblkpcmbDesc: TwwDBEdit
              Left = 120
              Top = 16
              Width = 196
              Height = 21
              DataField = 'DESCPROD'
              DataSource = dsDet
              Enabled = False
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblkpcmbArtigo: TwwDBEdit
              Left = 16
              Top = 16
              Width = 94
              Height = 21
              DataField = 'CODARTIGO'
              DataSource = dsDet
              Enabled = False
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblcUnidMedida: TwwDBEdit
              Left = 432
              Top = 16
              Width = 76
              Height = 21
              DataField = 'CODMEDIDA'
              DataSource = dsDet
              Enabled = False
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblcClasFisc: TCMDBLookupCombo
              Left = 96
              Top = 112
              Width = 97
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODFISC'#9'3'#9'CODFISC'#9'F')
              DataField = 'CODFISCAL'
              DataSource = dsDet
              LookupTable = cdsClasFisc
              LookupField = 'CODFISCAL'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
        object TabContab: TTabSheet
          Caption = 'TabContab'
          ImageIndex = 1
          object dbgContab: TwwDBGrid
            Left = 0
            Top = 0
            Width = 648
            Height = 124
            Selected.Strings = (
              'LACNUMLAN'#9'6'#9'Lanç.'
              'LACDEBCRE'#9'1'#9'D/C'
              'PLACONTA'#9'18'#9'Conta'
              'CODSUBCONTA'#9'10'#9'Sub-Conta'
              'LACVALOR'#9'10'#9'Valor'
              'LACNUMDOC'#9'15'#9'Documento'
              'LACHIST1'#9'40'#9'Histórico 1'
              'LACHIST2'#9'40'#9'Histórico 2'
              'UNIDNEGOC'#9'10'#9'Atividade/Projeto'
              'CODCENTROCUSTO'#9'10'#9'Centro de Custo')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsContab
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
        end
      end
      inherited Dock973: TDock97
        Width = 746
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Visible = False
          end
          inherited sbtnAltDet: TToolbarButton97
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777777777777777777777777777777777777777777777777777777777777777
              7777777777777778477777444447777748777744447777777477774447777777
              7477774474777777747777477744777748777777777744448777777777777777
              7777777777777777777777777777777777777777777777777777}
            Images = nil
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Visible = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 660
        Height = 152
      end
    end
  end
  inherited Dock972: TDock97
    Width = 756
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        GroupIndex = -1
        Caption = '&Devolver'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777777777777777777777777777777777777777777
          7777777777777778477777444447777748777744447777777477774447777777
          7477774474777777747777477744777748777777777744448777777777777777
          7777777777777777777777777777777777777777777777777777}
        Images = nil
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 408
    Width = 756
    inherited tb97Fundo: TToolbar97
      Left = 584
      DockPos = 623
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 415
      DockPos = 454
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 762
    Top = 65519
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 262
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 768
    Top = 65527
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 128
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 212
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NOME'
      'NFRECEBDEVOL.NUMNF'
      'NFRECEBDEVOL.COMPLNF'
      'NFRECEBDEVOL.DATAEMISNF'
      'NFRECEBDEVOL.DATAENTDEVOL'
      'NFRECEBDEVOL.VLRNOTAFISCAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'D'
      'D'
      'N')
    Descricao.Strings = (
      'Razão Social'
      'Nome do Fornecedor'
      'Número da NF'
      'Complemento'
      'Data de Emissão'
      'Data da Entrada'
      'Valor da Nota')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'NFRECEBDEVOL'
      'PESSOA')
    CamposChave.Strings = (
      'NFRECEBDEVOL.IDNFRECEBDEVOL')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = NFRECEBDEVOL.IDFORCLI')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '#,##0.00')
    Larguras.Strings = (
      '45'
      '30'
      '10'
      '5'
      '10'
      '10'
      '10')
    Left = 368
    Top = 7
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 164
    Top = 215
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsItemDevol
    Top = 7
  end
  object CdsItemDevol: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 445
    Top = 12
  end
  object dsContab: TwwDataSource
    AutoEdit = False
    DataSet = CdsContab
    Left = 594
    Top = 229
  end
  object CdsContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 595
    Top = 200
  end
  object CdsDevol: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 506
    Top = 9
  end
  object dsDevol: TwwDataSource
    AutoEdit = False
    DataSet = CdsDevol
    Left = 560
    Top = 8
  end
  object CdsAlmox: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 689
    Top = 144
  end
  object cdsClasFisc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClasFisc'
    Left = 342
    Top = 252
  end
end
