inherited frmMovBaixa: TfrmMovBaixa
  Left = 59
  Top = 97
  HelpContext = 70032
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Baixa de Bens'
  ClientHeight = 441
  ClientWidth = 685
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 685
    Height = 407
    object PnlDetalhe: TPanel
      Left = 5
      Top = 225
      Width = 675
      Height = 177
      Align = alClient
      BevelInner = bvRaised
      TabOrder = 1
      object GroupBox1: TGroupBox
        Left = 240
        Top = 8
        Width = 169
        Height = 45
        Hint = 'Caso '
        Caption = ' Proporção '
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object Label4: TLabel
          Left = 145
          Top = 18
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edPropBaixar: TRealEdit
          Left = 16
          Top = 16
          Width = 123
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
      object rdgTipoCalcProp: TRadioGroup
        Left = 16
        Top = 8
        Width = 209
        Height = 45
        Hint = 'Selecione a forma de cálculo da proporção da baixa parcial|'
        Caption = ' Cálculo Proporcional por '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Percentual'
          'Valor')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = rdgTipoCalcPropClick
        OnExit = rdgTipoCalcPropExit
      end
      object GroupBox2: TGroupBox
        Left = 424
        Top = 8
        Width = 242
        Height = 45
        Caption = ' Motivo da Baixa '
        TabOrder = 2
        object cmbMotivoBaixa: TwwDBLookupCombo
          Left = 7
          Top = 16
          Width = 227
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCMOTIVOBAIXA'#9'30'#9'Descrição')
          LookupTable = qryMotivoBaixa
          LookupField = 'IDMOTIVOBAIXA'
          Options = [loTitles]
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
      end
      object GroupBox3: TGroupBox
        Left = 240
        Top = 56
        Width = 169
        Height = 65
        Caption = ' Valor da Venda '
        TabOrder = 4
        object Label5: TLabel
          Left = 145
          Top = 30
          Width = 17
          Height = 13
          Caption = 'R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edValVenda: TRealEdit
          Left = 16
          Top = 27
          Width = 123
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 0
          WordWrap = False
          OnExit = edValVendaExit
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
      object edContaDestino: TCMProcuraMaskContabil
        Left = 424
        Top = 56
        Width = 242
        Height = 65
        Caption = ' Conta Contábil - Destino '
        TabOrder = 5
        OnExit = edContaDestinoExit
        MostraMensagens = True
        MostraDescricao = True
        DataSource = dsContaDestino
        DataField = 'PLACONTA'
        Mensagens.EmBranco = 'Chave não pode estar em branco'
        Mensagens.NaoExiste = 'Chave não existe'
        Mensagens.Sintetica = 'Chave não pode ser sintética'
        Mensagens.Analitica = 'Chave não pode ser analítica'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        AceitaTipoConta = SoAnalitica
        Plano = 0
        Status = scSoAtiva
        OnApertouBotao = edContaDestinoApertouBotao
      end
      object rdgDepProRata: TRadioGroup
        Left = 16
        Top = 56
        Width = 209
        Height = 65
        Caption = ' Depreciação Pró-Rata '
        ItemIndex = 0
        Items.Strings = (
          'Data Movimentação - 1'
          'Data Movimentação')
        TabOrder = 3
      end
      object GroupBox4: TGroupBox
        Left = 16
        Top = 124
        Width = 650
        Height = 44
        Caption = ' Informações Adicionais '
        TabOrder = 6
        object edObsBaixa: TMemo
          Left = 8
          Top = 15
          Width = 633
          Height = 21
          TabOrder = 0
        end
      end
    end
    object pgctlBaixaBem: TPageControl
      Left = 5
      Top = 5
      Width = 675
      Height = 220
      ActivePage = TabSelBaixaBem
      Align = alTop
      TabOrder = 0
      OnChange = pgctlBaixaBemChange
      object TabSelBaixaBem: TTabSheet
        Caption = 'Seleção de Bens'
        object Label2: TLabel
          Left = 8
          Top = 8
          Width = 89
          Height = 13
          Caption = 'Termo de Baixa'
        end
        object Processo: TLabel
          Left = 8
          Top = 48
          Width = 53
          Height = 13
          Caption = 'Processo'
        end
        object Label8: TLabel
          Left = 336
          Top = 8
          Width = 141
          Height = 13
          Caption = 'Responsável pelo Termo'
        end
        object Label9: TLabel
          Left = 184
          Top = 8
          Width = 132
          Height = 13
          Caption = 'Data da Movimentação'
        end
        object Label10: TLabel
          Left = 512
          Top = 48
          Width = 85
          Height = 13
          Caption = 'Data do Termo'
        end
        object Label11: TLabel
          Left = 8
          Top = 88
          Width = 109
          Height = 13
          Caption = 'Bens Selecionados'
        end
        object dbeResponsavel: TwwDBEdit
          Left = 336
          Top = 24
          Width = 321
          Height = 21
          DataField = 'SBXNOMERESP'
          DataSource = dsSelTermo
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeSbxProcesso: TwwDBEdit
          Left = 8
          Top = 64
          Width = 481
          Height = 21
          DataField = 'SBXPROCESSO'
          DataSource = dsSelTermo
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object bbtnTermoBaixa: TBitBtn
          Left = 140
          Top = 24
          Width = 21
          Height = 21
          TabOrder = 0
          OnClick = bbtnTermoBaixaClick
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
        object edDataSel: TCMDateTimePicker
          Left = 184
          Top = 24
          Width = 133
          Height = 21
          Hint = 'Data Programada para Pagamento'
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
          ParentShowHint = False
          ShowHint = True
          ShowButton = True
          TabOrder = 1
          OnExit = edDataSelExit
        end
        object dbeSbxData: TCMDateTimePicker
          Left = 512
          Top = 64
          Width = 145
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'SBXDATA'
          DataSource = dsSelTermo
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
          TabOrder = 5
        end
        object dbgSelBaixaBens: TwwDBGrid
          Left = 8
          Top = 104
          Width = 649
          Height = 81
          Selected.Strings = (
            'PLACA'#9'12'#9'Placa'
            'DESBEM'#9'74'#9'Descrição'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsBensSelec
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 6
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object edTermo: TMaskEdit
          Left = 8
          Top = 24
          Width = 133
          Height = 21
          AutoSize = False
          TabOrder = 2
          OnExit = edTermoExit
        end
      end
      object TabBaixaBem: TTabSheet
        Caption = 'Bem'
        object Data: TLabel
          Left = 8
          Top = 8
          Width = 132
          Height = 13
          Caption = 'Data da Movimentação'
        end
        object Label26: TLabel
          Left = 160
          Top = 8
          Width = 127
          Height = 13
          Caption = 'Placa de Tombamento'
        end
        object Label22: TLabel
          Left = 344
          Top = 8
          Width = 104
          Height = 13
          Caption = 'Descrição do Bem'
        end
        object Label1: TLabel
          Left = 8
          Top = 88
          Width = 51
          Height = 13
          Caption = 'Conjunto'
        end
        object Label7: TLabel
          Left = 8
          Top = 128
          Width = 69
          Height = 13
          Caption = 'Localização'
        end
        object Label17: TLabel
          Left = 344
          Top = 128
          Width = 74
          Height = 13
          Caption = 'Responsável'
        end
        object Label3: TLabel
          Left = 8
          Top = 48
          Width = 85
          Height = 13
          Caption = 'Grupo Contábil'
        end
        object edData: TCMDateTimePicker
          Left = 8
          Top = 24
          Width = 133
          Height = 21
          Hint = 'Data Programada para Pagamento'
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
          ParentShowHint = False
          ShowHint = True
          ShowButton = True
          TabOrder = 0
          OnExit = edDataExit
        end
        object edPlaca: TEdit
          Left = 160
          Top = 24
          Width = 147
          Height = 21
          TabOrder = 2
          OnEnter = edPlacaEnter
          OnExit = edPlacaExit
        end
        object spdPesquisa: TBitBtn
          Left = 307
          Top = 24
          Width = 21
          Height = 21
          TabOrder = 1
          OnClick = spdPesquisaClick
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
        object edMemDescBem: TMemo
          Left = 344
          Top = 24
          Width = 313
          Height = 101
          Lines.Strings = (
            '')
          TabOrder = 3
        end
        object edConjunto: TEdit
          Left = 8
          Top = 104
          Width = 321
          Height = 21
          TabStop = False
          MaxLength = 200
          ReadOnly = True
          TabOrder = 5
        end
        object edLocAtual: TEdit
          Left = 8
          Top = 144
          Width = 321
          Height = 21
          TabOrder = 6
        end
        object edRespAtual: TEdit
          Left = 344
          Top = 144
          Width = 317
          Height = 21
          TabOrder = 7
        end
        object dbeGrupoContabil: TwwDBEdit
          Left = 8
          Top = 64
          Width = 321
          Height = 21
          DataField = 'DESCGRUPO'
          DataSource = dsSelBem
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 407
    Width = 685
    Height = 34
    inherited tb97Fundo: TToolbar97
      Left = 478
      DockPos = 478
      inherited bbtnSair: TBitBtn
        Height = 28
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Height = 28
        HelpContext = 70032
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 310
      DockPos = 310
      inherited bbtnConfirmar: TBitBtn
        Height = 28
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Height = 28
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 723
    Top = 499
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryMotivoBaixa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCMOTIVOBAIXA,IDMOTIVOBAIXA'
      'FROM MOTIVOBAIXA'
      'ORDER BY DESCMOTIVOBAIXA')
    ValidateWithMask = True
    Left = 592
    Top = 224
    object qryMotivoBaixaDESCMOTIVOBAIXA: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCMOTIVOBAIXA'
      Origin = 'MOTIVOBAIXA.DESCMOTIVOBAIXA'
      Size = 30
    end
    object qryMotivoBaixaIDMOTIVOBAIXA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOBAIXA'
      Origin = 'MOTIVOBAIXA.IDMOTIVOBAIXA'
      Visible = False
    end
  end
  object qryPlaca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBEM'
      'FROM BEM'
      'WHERE (PLACA = :PPLACA)')
    ValidateWithMask = True
    Left = 368
    Top = 80
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PPLACA'
        ParamType = ptUnknown
      end>
    object qryPlacaIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = '"CM.BEM".IDBEM'
    end
  end
  object qrySelBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BEM.IDPESSOA, BEM.IDBEM, BEM.IDCONJUNTO,'
      '       BEM.PLACA, CONJUNTO.DESCCONJUNTO,'
      '       BEM.DESBEM, LOCALIZACAO.NOME AS DESCLOCALIZACAO,'
      '       PESSOA.NOME AS NOMERESPONSAVEL,'
      '       BEM.IDGRUPO, GRUPO.NOME AS DESCGRUPO'
      'FROM BEM, GRUPO, CONJUNTO, LOCALIZACAO, PESSOA'
      'WHERE (BEM.IDPESSOA = :PIDPESSOA)'
      '  AND (BEM.IDBEM    = :PIDBEM)'
      '  AND (BEM.CONTROLE = '#39'T'#39')'
      '  AND (BEM.BAIXATOTAL <> '#39'S'#39')'
      '  AND (BEM.IDGRUPO = GRUPO.IDGRUPO)'
      '  AND (BEM.IDCONJUNTO = CONJUNTO.IDCONJUNTO)'
      '  AND (CONJUNTO.IDLOCALIZACAO = LOCALIZACAO.IDLOCALIZACAO(+))'
      '  AND (CONJUNTO.IDRESPONSAVEL = PESSOA.IDPESSOA(+))'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 416
    Top = 80
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
  end
  object qryBensSelec: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SBB.IDSELBAIXA, SBB.IDBEM, SBB.IDPESSOA, SBB.SBBVALVENDA,'
      '       B.PLACA, B.DESBEM, B.BAIXATOTAL,'
      '       (B.VALORG + B.CMBEM)-(B.DEPLANC + B.CMDEP) AS VALCTB '
      'FROM SELBAIXABENS SBB,'
      '     BEM B'
      'WHERE (SBB.IDSELBAIXA = :PIDSELBAIXA)'
      '  AND ((B.BAIXATOTAL = '#39'N'#39') OR (B.BAIXATOTAL IS NULL))'
      '  AND (SBB.IDBEM      = B.IDBEM)'
      '  AND (SBB.IDPESSOA   = B.IDPESSOA)'
      ' ')
    UpdateObject = updBensSelec
    ValidateWithMask = True
    Left = 392
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDSELBAIXA'
        ParamType = ptUnknown
      end>
    object qryBensSelecPLACA: TFloatField
      DisplayLabel = 'Placa'
      DisplayWidth = 12
      FieldName = 'PLACA'
      Origin = '"CM.BEM".PLACA'
    end
    object qryBensSelecDESBEM: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 74
      FieldName = 'DESBEM'
      Origin = '"CM.BEM".DESBEM'
      Size = 200
    end
    object qryBensSelecSBBVALVENDA: TFloatField
      DisplayLabel = 'Valor de Alienação'
      DisplayWidth = 16
      FieldName = 'SBBVALVENDA'
      Origin = 'SELBAIXABENS.SBBVALVENDA'
      Visible = False
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBensSelecIDSELBAIXA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSELBAIXA'
      Origin = '"CM.SELBAIXABENS".IDSELBAIXA'
      Visible = False
    end
    object qryBensSelecIDBEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBEM'
      Origin = '"CM.SELBAIXABENS".IDBEM'
      Visible = False
    end
    object qryBensSelecIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = '"CM.SELBAIXABENS".IDPESSOA'
      Visible = False
    end
    object qryBensSelecBAIXATOTAL: TStringField
      DisplayWidth = 1
      FieldName = 'BAIXATOTAL'
      Origin = '"CM.BEM".BAIXATOTAL'
      Visible = False
      Size = 1
    end
    object qryBensSelecVALCTB: TFloatField
      DisplayWidth = 10
      FieldName = 'VALCTB'
      Origin = 'BEM.VALORG'
      Visible = False
    end
  end
  object dsBensSelec: TwwDataSource
    AutoEdit = False
    DataSet = qryBensSelec
    Left = 464
    Top = 160
  end
  object qrySelTermo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT SB.IDSELBAIXA,'
      '       SB.SBXTERMO,'
      '       SB.SBXPROCESSO,'
      '       SB.SBXDATA,'
      '       P.NOME AS SBXNOMERESP,'
      '       SB.SBXFLGEXECUTADO,'
      '       SB.SBXDTAEXECUTADO'
      'FROM SELBAIXA SB,'
      '     PESSOA P'
      'WHERE (SB.IDSELBAIXA    = :PIDSELBAIXA)'
      '  AND (SB.IDRESPONSAVEL = P.IDPESSOA(+))')
    UpdateObject = updSelTermo
    ValidateWithMask = True
    Left = 184
    Top = 160
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDSELBAIXA'
        ParamType = ptUnknown
      end>
    object qrySelTermoIDSELBAIXA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSELBAIXA'
    end
    object qrySelTermoSBXTERMO: TFloatField
      DisplayWidth = 10
      FieldName = 'SBXTERMO'
    end
    object qrySelTermoSBXPROCESSO: TStringField
      DisplayWidth = 80
      FieldName = 'SBXPROCESSO'
      Size = 80
    end
    object qrySelTermoSBXDATA: TDateTimeField
      DisplayWidth = 10
      FieldName = 'SBXDATA'
    end
    object qrySelTermoSBXNOMERESP: TStringField
      DisplayWidth = 60
      FieldName = 'SBXNOMERESP'
      Size = 60
    end
    object qrySelTermoSBXFLGEXECUTADO: TFloatField
      DisplayWidth = 10
      FieldName = 'SBXFLGEXECUTADO'
    end
    object qrySelTermoSBXDTAEXECUTADO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'SBXDTAEXECUTADO'
    end
  end
  object dsSelTermo: TwwDataSource
    AutoEdit = False
    DataSet = qrySelTermo
    Left = 248
    Top = 160
  end
  object MSTermo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'SELBAIXA.SBXTERMO'
      'SELBAIXA.SBXPROCESSO'
      'SELBAIXA.SBXDATA'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'C')
    Descricao.Strings = (
      'Termo de Baixa'
      'Processo'
      'Data da Seleção'
      'Responsável')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'SELBAIXA'
      'PESSOA')
    CamposChave.Strings = (
      'SELBAIXA.SBXTERMO'
      'SELBAIXA.IDSELBAIXA')
    Filtro.Strings = (
      'SELBAIXA.IDRESPONSAVEL=PESSOA.IDPESSOA(+)'
      'SELBAIXA.SBTIPOMOV = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '80'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 128
    Top = 160
  end
  object updSelTermo: TUpdateSQL
    ModifySQL.Strings = (
      'update SELBAIXA'
      'set'
      '  SBXFLGEXECUTADO = :SBXFLGEXECUTADO,'
      '  SBXDTAEXECUTADO = :SBXDTAEXECUTADO'
      'where'
      '  IDSELBAIXA = :OLD_IDSELBAIXA')
    InsertSQL.Strings = (
      'insert into SELBAIXA'
      '  (SBXFLGEXECUTADO, SBXDTAEXECUTADO)'
      'values'
      '  (:SBXFLGEXECUTADO, :SBXDTAEXECUTADO)')
    DeleteSQL.Strings = (
      'delete from SELBAIXA'
      'where'
      '  IDSELBAIXA = :OLD_IDSELBAIXA')
    Left = 312
    Top = 160
  end
  object updBensSelec: TUpdateSQL
    ModifySQL.Strings = (
      'update SELBAIXABENS'
      'set'
      '  SBBVALVENDA = :SBBVALVENDA'
      'where'
      '  IDSELBAIXA = :OLD_IDSELBAIXA and'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into SELBAIXABENS'
      '  (SBBVALVENDA)'
      'values'
      '  (:SBBVALVENDA)')
    DeleteSQL.Strings = (
      'delete from SELBAIXABENS'
      'where'
      '  IDSELBAIXA = :OLD_IDSELBAIXA and'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 536
    Top = 160
  end
  object dsSelBem: TwwDataSource
    AutoEdit = False
    DataSet = qrySelBem
    Left = 472
    Top = 80
  end
  object qryContaDestino: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDGRUPO, IDTIPOMOVIMENTACAO, TIPOLANCAMENTO, PLANO, PLACO' +
        'NTA'
      'FROM   CONTASTIPOSMOVIMENTOGRUPOS'
      'WHERE (IDGRUPO            = :IDGRUPO)'
      '  AND (IDTIPOMOVIMENTACAO = :IDTIPOMOVIMENTACAO)'
      '  AND (TIPOLANCAMENTO     = :TIPOLANCAMENTO)'
      '  AND (PLANO              = :PLANO)'
      ''
      ' ')
    UpdateObject = updContaDestino
    ValidateWithMask = True
    Left = 192
    Top = 102
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOLANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end>
  end
  object dsContaDestino: TwwDataSource
    AutoEdit = False
    DataSet = qryContaDestino
    Left = 192
    Top = 88
  end
  object updContaDestino: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTASTIPOSMOVIMENTOGRUPOS'
      'set'
      '  PLACONTA = :PLACONTA'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO and'
      '  IDTIPOMOVIMENTACAO = :OLD_IDTIPOMOVIMENTACAO and'
      '  TIPOLANCAMENTO = :OLD_TIPOLANCAMENTO and'
      '  PLANO = :OLD_PLANO')
    InsertSQL.Strings = (
      'insert into CONTASTIPOSMOVIMENTOGRUPOS'
      '  (PLACONTA)'
      'values'
      '  (:PLACONTA)')
    DeleteSQL.Strings = (
      'delete from CONTASTIPOSMOVIMENTOGRUPOS'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO and'
      '  IDTIPOMOVIMENTACAO = :OLD_IDTIPOMOVIMENTACAO and'
      '  TIPOLANCAMENTO = :OLD_TIPOLANCAMENTO and'
      '  PLANO = :OLD_PLANO')
    Left = 193
    Top = 74
  end
end
