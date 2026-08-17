inherited frmExecFolhaAluguelNova: TfrmExecFolhaAluguelNova
  Left = 301
  Top = 174
  HelpContext = 640020
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Folha de Aluguéis'
  ClientHeight = 450
  ClientWidth = 733
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 733
    Height = 417
    object Panel3: TPanel
      Left = 0
      Top = 357
      Width = 733
      Height = 60
      Align = alBottom
      Caption = 'Panel3'
      TabOrder = 0
      object ntbInstrucao: TNotebook
        Left = 1
        Top = 1
        Width = 731
        Height = 58
        Align = alClient
        PageIndex = 7
        TabOrder = 0
        object TPage
          Left = 0
          Top = 0
          Caption = 'Selecao'
          object Memo1: TMemo
            Left = 16
            Top = 10
            Width = 697
            Height = 38
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              ' 1) Escolha o filtro que julgar mais apropriado.'
              
                ' 2) Pressione "Continuar" para prosseguir, reajustando os contra' +
                'tos.')
            ParentFont = False
            TabOrder = 0
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Encerra'
          object Memo4: TMemo
            Left = 16
            Top = 10
            Width = 697
            Height = 38
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              
                ' 1) Os Contratos listados serão rescindidos OU prorrogados na da' +
                'ta indicada.'
              
                ' 2) Pressione "Continuar" para prosseguir ou "Cancelar" para imp' +
                'edir as rescisões / prorrogações;')
            ParentFont = False
            TabOrder = 0
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'ErroEncerra'
          object Memo5: TMemo
            Left = 16
            Top = 10
            Width = 697
            Height = 38
            Color = clMaroon
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              ' Houve ERRO na tentativa de rescindir os Contratos selecionados.'
              ' Favor rescindir os Contratos na tela de "Rescisão Contratual".')
            ParentFont = False
            TabOrder = 0
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Reajuste'
          object Memo2: TMemo
            Left = 16
            Top = 10
            Width = 697
            Height = 38
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              ' 1) Verifique se os contratos foram reajustados corretamente. '
              
                ' 2) Pressione "Continuar" para aplicar os novos valores e prosse' +
                'guir com o cálculo dos aluguéis.')
            ParentFont = False
            TabOrder = 0
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'ErroReajuste'
          object Memo6: TMemo
            Left = 16
            Top = 10
            Width = 697
            Height = 38
            Color = clMaroon
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              
                ' Houve ERRO na tentativa de reajuste dos Contratos (o erro está ' +
                'indicado ao lado de cada Contrato).'
              
                ' Favor corrigir os erros antes de executar novamente a Folha de ' +
                'Aluguéis.')
            ParentFont = False
            TabOrder = 0
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Confirma'
          object Memo3: TMemo
            Left = 16
            Top = 10
            Width = 697
            Height = 38
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              ' 1) Verifique se os valores dos aluguéis estão corretos.'
              ' 2) Pressione "Confirmar" para efetuar os Lançamentos.')
            ParentFont = False
            TabOrder = 0
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Progresso'
          object lblContador: TLabel
            Left = 620
            Top = 13
            Width = 93
            Height = 13
            Alignment = taRightJustify
            Caption = '00000 de 00000'
            Visible = False
          end
          object lblProgress: TLabel
            Left = 16
            Top = 13
            Width = 141
            Height = 13
            Caption = 'Processando Relatório...'
            Visible = False
          end
          object ProgressBar: TProgressBar
            Left = 16
            Top = 28
            Width = 697
            Height = 16
            Min = 0
            Max = 100
            Step = 1
            TabOrder = 0
            Visible = False
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Confissao'
          object Memo7: TMemo
            Left = 16
            Top = 10
            Width = 697
            Height = 38
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              ' 1) Verifique se os valores calculados estão corretos.'
              ' 2) Pressione "Confirmar" para efetuar os Lançamentos.')
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 733
      Height = 357
      Align = alClient
      Caption = 'Panel1'
      TabOrder = 1
      object lblTitulo: TfcLabel
        Left = 16
        Top = 8
        Width = 281
        Height = 24
        Caption = 'Folha de Aluguéis [Seleção]'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object ntbPrincipal: TNotebook
        Left = 1
        Top = 41
        Width = 731
        Height = 315
        Align = alBottom
        PageIndex = 5
        TabOrder = 0
        OnPageChanged = ntbPrincipalPageChanged
        object TPage
          Left = 0
          Top = 0
          Caption = 'Selecao'
          object rdgVariavel: TRadioGroup
            Left = 744
            Top = 141
            Width = 241
            Height = 70
            Caption = ' Calcular: '
            ItemIndex = 0
            Items.Strings = (
              'Apenas a parte fixa do aluguel'
              'Apenas o complemento'
              'Aluguel total (fixo + complemento)')
            TabOrder = 0
            Visible = False
          end
          object rdgUsoIndicador: TRadioGroup
            Left = 712
            Top = 104
            Width = 249
            Height = 17
            Color = clTeal
            Columns = 2
            ItemIndex = 1
            Items.Strings = (
              'usar apenas o último indicador apurado'
              'usar todos os indicadores disponíveis')
            ParentColor = False
            TabOrder = 2
            Visible = False
          end
          object Panel2: TPanel
            Left = 16
            Top = 176
            Width = 273
            Height = 127
            TabOrder = 1
            object Label15: TLabel
              Left = 16
              Top = 6
              Width = 184
              Height = 13
              Caption = 'Competência (mês/ano) - Início:'
            end
            object Label5: TLabel
              Left = 16
              Top = 81
              Width = 101
              Height = 13
              Caption = 'Data Lançamento'
            end
            object Label6: TLabel
              Left = 147
              Top = 82
              Width = 78
              Height = 13
              Caption = 'Data Emissão'
            end
            object Label7: TLabel
              Left = 16
              Top = 44
              Width = 170
              Height = 13
              Caption = 'Competência (mês/ano) - Fim:'
            end
            object DBspnAno: TwwDBSpinEdit
              Left = 187
              Top = 19
              Width = 65
              Height = 21
              Increment = 1
              TabOrder = 1
              UnboundDataType = wwDefault
              OnExit = DBspnAnoExit
            end
            object edtDataLancamento: TCMDateTimePicker
              Left = 16
              Top = 95
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
              TabOrder = 2
            end
            object cboMes: TComboBox
              Left = 16
              Top = 19
              Width = 165
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              OnExit = cboMesExit
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
            object edtDataEmissao: TCMDateTimePicker
              Left = 147
              Top = 95
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
            object cboMesFim: TComboBox
              Left = 16
              Top = 57
              Width = 165
              Height = 21
              Style = csDropDownList
              Color = clBtnFace
              Enabled = False
              ItemHeight = 13
              TabOrder = 4
              OnExit = cboMesExit
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
            object DBspnAnoFim: TwwDBSpinEdit
              Left = 187
              Top = 57
              Width = 65
              Height = 21
              Increment = 1
              Color = clBtnFace
              Enabled = False
              TabOrder = 5
              UnboundDataType = wwDefault
              OnExit = DBspnAnoExit
            end
          end
          object btnContinuaSelecao: TfcShapeBtn
            Left = 528
            Top = 272
            Width = 89
            Height = 29
            Caption = 'Continuar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
              88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
              B08887F88888888887F887FBBBBB0BBBB088878888887F88878F7FBBBBBB00BB
              BB087F88FFFF77F8887F7FB00000000BBB087F877777777F887F7FB000000000
              BB087F8777777777887F7FB00000000BBB087F8777777778887F7FBBBBBB00BB
              BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
              B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
              8888888778FFFF77888888888777778888888888877777888888}
            Layout = blGlyphRight
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            ParentShowHint = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            ShowHint = True
            TabOrder = 3
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnContinuaSelecaoClick
          end
          object GroupBox1: TGroupBox
            Left = 16
            Top = 8
            Width = 705
            Height = 153
            Caption = 'Filtros '
            TabOrder = 4
            object Label1: TLabel
              Left = 16
              Top = 61
              Width = 84
              Height = 13
              Caption = 'Administradora'
            end
            object Label22: TLabel
              Left = 466
              Top = 17
              Width = 111
              Height = 13
              Caption = 'Forma de Cobrança'
            end
            object Label4: TLabel
              Left = 466
              Top = 60
              Width = 108
              Height = 13
              Caption = 'Indice de Reajuste'
            end
            object Label21: TLabel
              Left = 466
              Top = 103
              Width = 92
              Height = 13
              Caption = 'Tipo de Receita'
            end
            object Label2: TLabel
              Left = 16
              Top = 104
              Width = 67
              Height = 13
              Caption = 'Nº Contrato'
            end
            object Label3: TLabel
              Left = 124
              Top = 104
              Width = 103
              Height = 13
              Caption = 'Nome do Contrato'
            end
            inline MolResponsavel1: TmolResponsavel
              Left = 8
              Top = 16
              Width = 441
              inherited edtResponsavel: TEdit
                Width = 377
              end
              inherited btnBuscaResponsavel: TBitBtn
                Left = 384
              end
              inherited btnLimpaResponsavel: TBitBtn
                Left = 408
              end
              inherited btnAbrePessoa: TBitBtn
                Left = 240
                Visible = False
              end
            end
            object edtAdminImovel: TEdit
              Left = 16
              Top = 75
              Width = 377
              Height = 21
              Enabled = False
              TabOrder = 1
            end
            object btnBuscaAdminImovel: TBitBtn
              Left = 392
              Top = 75
              Width = 24
              Height = 22
              Hint = 'Busca uma Administradora'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = btnBuscaAdminImovelClick
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
            object btnLimpaAdminImovel: TBitBtn
              Left = 416
              Top = 75
              Width = 23
              Height = 22
              Hint = 'Limpa a seleção de Administradora'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnClick = btnLimpaAdminImovelClick
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
            object DBcboPortadorForma: TwwDBLookupCombo
              Left = 466
              Top = 32
              Width = 231
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              LookupTable = dtmLookImobiliario.qryLookPortadorForma
              LookupField = 'CODPORTFORMA'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 4
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = DBcboPortadorFormaCloseUp
            end
            object DBcboIndiceReajuste: TwwDBLookupCombo
              Left = 466
              Top = 75
              Width = 231
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'10'#9'Sigla'#9'F'
                'MOEDESC'#9'20'#9'Descrição'#9'F')
              LookupTable = dtmLookImobiliario.qryLookMoeda
              LookupField = 'MOECODIGO'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 5
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = DBcboIndiceReajusteCloseUp
            end
            object DBcboTipoRecCusto: TwwDBLookupCombo
              Left = 466
              Top = 118
              Width = 231
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCUSTORECIMO'#9'60'#9'DESCCUSTORECIMO')
              LookupTable = qryLookTipoRecContr
              LookupField = 'IDTIPOCUSTORECIMO'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 6
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = DBcboTipoRecCustoCloseUp
            end
            object edtNumContrato: TEdit
              Left = 16
              Top = 118
              Width = 105
              Height = 21
              Enabled = False
              TabOrder = 7
            end
            object edtNomeContrato: TEdit
              Left = 124
              Top = 118
              Width = 269
              Height = 21
              Enabled = False
              TabOrder = 8
            end
            object btnBuscaContrato: TBitBtn
              Left = 392
              Top = 118
              Width = 24
              Height = 22
              Hint = 'Busca um Contrato'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 9
              OnClick = btnBuscaContratoClick
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
            object btnLimpaContrato: TBitBtn
              Left = 416
              Top = 118
              Width = 23
              Height = 22
              Hint = 'Limpa a seleção de Contrato'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 10
              OnClick = btnLimpaContratoClick
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
          end
          object GroupBox2: TGroupBox
            Left = 307
            Top = 171
            Width = 414
            Height = 54
            Caption = 'Forma de Cobrança Diferenciada '
            TabOrder = 5
            object dbcboPortadorFormaDif: TwwDBLookupCombo
              Left = 20
              Top = 21
              Width = 375
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              LookupTable = dtmLookImobiliario.qryLookPortadorForma
              LookupField = 'CODPORTFORMA'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
            end
          end
          object GroupBox3: TGroupBox
            Left = 308
            Top = 227
            Width = 413
            Height = 38
            Caption = ' Tipo de Contrato '
            TabOrder = 6
            object chkAluguel: TCheckBox
              Left = 16
              Top = 16
              Width = 81
              Height = 17
              Caption = 'Aluguel'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object chkConfissao: TCheckBox
              Left = 192
              Top = 16
              Width = 145
              Height = 17
              Caption = 'Confissão de dívida'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Encerra'
          object DBgrdRescisao: TwwDBGrid
            Left = 16
            Top = 34
            Width = 699
            Height = 228
            Selected.Strings = (
              'CONNUMERO'#9'16'#9'Nº Contrato'#9'No'
              'CONNOME'#9'50'#9'Nome Contrato'#9'No'
              'CONDATAINICIO'#9'13'#9'Data Início'#9'No'
              'CONDATAFIM'#9'13'#9'Data Fim'#9'No')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsRescisao
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            TabOrder = 2
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            OnCalcCellColors = DBgrdRescisaoCalcCellColors
            IndicatorColor = icBlack
            OnTopRowChanged = DBgrdRescisaoTopRowChanged
          end
          object btnCancelaEncerra: TfcShapeBtn
            Left = 432
            Top = 272
            Width = 89
            Height = 29
            Caption = 'Cancelar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888009191900
              88888887788888778F88887991919191088888788888888878F8879919191919
              108887F88888888887F88791919191919088878888888888878F791919191919
              19087F88FFFFFFFFF87F79988888888891087F8777777777F87F791FFFFFFFF8
              19087F8777777777F87F799FFFFFFFF891087F8777777777887F791919191919
              190878F8888888888878879191919191908887F88888888887F8879919191919
              1088878F88888888878888799191919108888878FF88888F7888888779999977
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 0
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnCancelaEncerraClick
          end
          object btnContinuaEncerra: TfcShapeBtn
            Left = 528
            Top = 272
            Width = 89
            Height = 29
            Caption = 'Continuar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
              88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
              B08887F88888888887F887FBBBBB0BBBB088878888887F88878F7FBBBBBB00BB
              BB087F88FFFF77F8887F7FB00000000BBB087F877777777F887F7FB000000000
              BB087F8777777777887F7FB00000000BBB087F8777777778887F7FBBBBBB00BB
              BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
              B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
              8888888778FFFF77888888888777778888888888877777888888}
            Layout = blGlyphRight
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 1
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnContinuaEncerraClick
          end
          object Panel4: TPanel
            Left = 16
            Top = 7
            Width = 699
            Height = 27
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Contratos a Encerrar / Prorrogar '
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'ErroEncerra'
          object wwDBGrid1: TwwDBGrid
            Left = 16
            Top = 34
            Width = 699
            Height = 223
            Selected.Strings = (
              'CONNUMERO'#9'15'#9'Nº Contrato'#9'No'
              'CONNOME'#9'46'#9'Nome Contrato'#9'No'
              'CONDATAINICIO'#9'10'#9'Data Início'#9'No'
              'CONDATAFIM'#9'10'#9'Data Fim'#9'No')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsRescisao
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            OnCalcCellColors = DBgrdRescisaoCalcCellColors
            IndicatorColor = icBlack
            OnTopRowChanged = DBgrdRescisaoTopRowChanged
          end
          object btnCancelaErroEncerra: TfcShapeBtn
            Left = 432
            Top = 272
            Width = 89
            Height = 29
            Caption = 'Cancelar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888009191900
              88888887788888778F88887991919191088888788888888878F8879919191919
              108887F88888888887F88791919191919088878888888888878F791919191919
              19087F88FFFFFFFFF87F79988888888891087F8777777777F87F791FFFFFFFF8
              19087F8777777777F87F799FFFFFFFF891087F8777777777887F791919191919
              190878F8888888888878879191919191908887F88888888887F8879919191919
              1088878F88888888878888799191919108888878FF88888F7888888779999977
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 1
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnCancelaEncerraClick
          end
          object Panel5: TPanel
            Left = 16
            Top = 7
            Width = 699
            Height = 27
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Contratos NÃO Encerrados '
            Color = clMaroon
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Reajuste'
          object DBgrdReajuste: TwwDBGrid
            Left = 16
            Top = 34
            Width = 696
            Height = 223
            Selected.Strings = (
              'CONNUMERO'#9'13'#9'Nº Contrato'#9'F'
              'CONNOME'#9'35'#9'Nome Contrato'#9'F'
              'CONDATAREAJUSTE'#9'10'#9'Data'
              'CONVLRTOTAL'#9'13'#9'Vlr. Anterior'#9'F'
              'CONVLRAJUSTADO'#9'13'#9'Novo Vlr.'#9'F'
              'MOESIGLA'#9'6'#9'Índice'#9'F'
              'PERCENTREAJUSTE'#9'9'#9'Fator p/ Data Base'#9'F'
              'PERCENTVLRANO'#9'10'#9'Fator p/ Valor Futuro'#9'F'
              'PERCENTFIXO'#9'10'#9'Fator fixo'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsReajuste
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            OnCalcCellColors = DBgrdReajusteCalcCellColors
            IndicatorColor = icBlack
            OnTopRowChanged = DBgrdReajusteTopRowChanged
          end
          object btnCancelaReajuste: TfcShapeBtn
            Left = 432
            Top = 272
            Width = 89
            Height = 29
            Caption = 'Cancelar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888009191900
              88888887788888778F88887991919191088888788888888878F8879919191919
              108887F88888888887F88791919191919088878888888888878F791919191919
              19087F88FFFFFFFFF87F79988888888891087F8777777777F87F791FFFFFFFF8
              19087F8777777777F87F799FFFFFFFF891087F8777777777887F791919191919
              190878F8888888888878879191919191908887F88888888887F8879919191919
              1088878F88888888878888799191919108888878FF88888F7888888779999977
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 1
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnCancelaReajusteClick
          end
          object btnContinuaReajuste: TfcShapeBtn
            Left = 528
            Top = 272
            Width = 89
            Height = 29
            Caption = 'Continuar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
              88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
              B08887F88888888887F887FBBBBB0BBBB088878888887F88878F7FBBBBBB00BB
              BB087F88FFFF77F8887F7FB00000000BBB087F877777777F887F7FB000000000
              BB087F8777777777887F7FB00000000BBB087F8777777778887F7FBBBBBB00BB
              BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
              B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
              8888888778FFFF77888888888777778888888888877777888888}
            Layout = blGlyphRight
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 2
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnContinuaReajusteClick
          end
          object btnConsultaIndice: TfcShapeBtn
            Left = 168
            Top = 272
            Width = 137
            Height = 29
            Caption = 'Consulta Índices'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
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
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 3
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnConsultaIndiceClick
          end
          object Panel6: TPanel
            Left = 16
            Top = 7
            Width = 696
            Height = 27
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Contratos Reajustados '
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'ErroReajuste'
          object wwDBGrid2: TwwDBGrid
            Left = 16
            Top = 34
            Width = 697
            Height = 223
            Selected.Strings = (
              'CONNUMERO'#9'12'#9'Nº Contrato'#9'No'
              'CONNOME'#9'42'#9'Nome Contrato'#9'No'
              'CONINDICEREAJUSTE'#9'6'#9'Índice'#9'No'
              'CONVLRTOTAL'#9'10'#9'Vlr. Anterior'#9'No'
              'CONVLRAJUSTADO'#9'10'#9'Novo Vlr.'#9'No'
              'CONDATAREAJUSTE'#9'7'#9'Reajuste'#9'No'
              'CONPROXREAJUSTE'#9'6'#9'Próximo'#9'No'
              'CONDATAINICIO'#9'10'#9'Data Início'#9'No'
              'CONDATAFIM'#9'10'#9'Data Fim'#9'No')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsReajuste
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            OnCalcCellColors = DBgrdReajusteCalcCellColors
            IndicatorColor = icBlack
            OnTopRowChanged = DBgrdReajusteTopRowChanged
          end
          object btnCancelaErroReajuste: TfcShapeBtn
            Left = 432
            Top = 272
            Width = 89
            Height = 29
            Caption = 'Cancelar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888009191900
              88888887788888778F88887991919191088888788888888878F8879919191919
              108887F88888888887F88791919191919088878888888888878F791919191919
              19087F88FFFFFFFFF87F79988888888891087F8777777777F87F791FFFFFFFF8
              19087F8777777777F87F799FFFFFFFF891087F8777777777887F791919191919
              190878F8888888888878879191919191908887F88888888887F8879919191919
              1088878F88888888878888799191919108888878FF88888F7888888779999977
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 1
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnCancelaReajusteClick
          end
          object Panel7: TPanel
            Left = 16
            Top = 7
            Width = 697
            Height = 27
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Contratos NÃO Reajustados'
            Color = clMaroon
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Lancamentos'
          object pgcLancamentos: TPageControl
            Left = 16
            Top = 29
            Width = 699
            Height = 244
            ActivePage = tbsLancamentos
            HotTrack = True
            MultiLine = True
            ParentShowHint = False
            ShowHint = False
            TabHeight = 21
            TabOrder = 2
            TabPosition = tpBottom
            TabWidth = 161
            object tbsLancamentos: TTabSheet
              Caption = 'Lançamentos Gerados'
              object DBgrdLancamentos: TwwDBGrid
                Left = 0
                Top = 0
                Width = 691
                Height = 213
                Selected.Strings = (
                  'CONTRATO'#9'83'#9'Contrato'#9'F'
                  'IMOVEL'#9'123'#9'Imóvel'#9'F'
                  'MESCOMPETENCIA'#9'10'#9'Mês'#9'F'
                  'ANOCOMPETENCIA'#9'10'#9'Ano'#9'F'
                  'DATAVENCIMENTO'#9'18'#9'Vencimento'#9'F'
                  'DATALIMITE'#9'18'#9'Limite'#9'F'
                  'VLRLANCRECEB'#9'10'#9'Valor'#9'F'
                  'IDDOCUMENTO'#9'10'#9'ID Documento'#9'F'
                  'NODOCUMENTO'#9'10'#9'Nr. Documento'#9'F'
                  'DTINICTBDIARIA'#9'18'#9'Início Ctb Diária'#9'F'
                  'DTFIMCTBDIARIA'#9'18'#9'Término Ctb Diária'#9'F'
                  'CODTIPIMOVEL'#9'5'#9'CODTIPIMOVEL'#9'F'
                  'DATAEMISSAO'#9'18'#9'DATAEMISSAO'#9'F')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsLancFolha
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                KeyOptions = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
                ParentFont = False
                PopupMenu = mnuMsgLanc
                TabOrder = 0
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                OnCalcCellColors = DBgrdLancamentosCalcCellColors
                IndicatorColor = icBlack
                OnTopRowChanged = DBgrdLancamentosTopRowChanged
              end
            end
            object tbsErro: TTabSheet
              Caption = 'Ocorrências'
              object memErro: TMemo
                Left = 0
                Top = 0
                Width = 691
                Height = 213
                Align = alClient
                ScrollBars = ssBoth
                TabOrder = 0
                WantTabs = True
                WordWrap = False
              end
            end
          end
          object btnCancelaLanc: TfcShapeBtn
            Left = 432
            Top = 272
            Width = 89
            Height = 29
            Caption = 'Cancelar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888009191900
              88888887788888778F88887991919191088888788888888878F8879919191919
              108887F88888888887F88791919191919088878888888888878F791919191919
              19087F88FFFFFFFFF87F79988888888891087F8777777777F87F791FFFFFFFF8
              19087F8777777777F87F799FFFFFFFF891087F8777777777887F791919191919
              190878F8888888888878879191919191908887F88888888887F8879919191919
              1088878F88888888878888799191919108888878FF88888F7888888779999977
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 0
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnCancelaLancClick
          end
          object btnConfirmaLanc: TfcShapeBtn
            Left = 624
            Top = 272
            Width = 89
            Height = 29
            Caption = 'Confirmar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888002222200
              88888887788888778F88887222222222088888788888888878F887A228822222
              208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
              22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
              22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
              220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
              2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
              8888888778FFFF77888888888777778888888888877777888888}
            Layout = blGlyphRight
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 1
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnConfirmaLancClick
          end
          object btnContinuaLanc: TfcShapeBtn
            Left = 528
            Top = 272
            Width = 89
            Height = 29
            Caption = 'Continuar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
              88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
              B08887F88888888887F887FBBBBB0BBBB088878888887F88878F7FBBBBBB00BB
              BB087F88FFFF77F8887F7FB00000000BBB087F877777777F887F7FB000000000
              BB087F8777777777887F7FB00000000BBB087F8777777778887F7FBBBBBB00BB
              BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
              B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
              8888888778FFFF77888888888777778888888888877777888888}
            Layout = blGlyphRight
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 4
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnContinuaLancClick
          end
          object Panel8: TPanel
            Left = 16
            Top = 8
            Width = 699
            Height = 27
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Lançamentos  '
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Alteradores'
          object DBgrdAlteraLanc: TwwDBGrid
            Left = 16
            Top = 35
            Width = 697
            Height = 220
            Selected.Strings = (
              'CONNOME'#9'42'#9'Contrato'#9'F'
              'DESCRICAO'#9'19'#9'Alterador'#9'F'
              'VLRBRUTO'#9'15'#9'Vlr Bruto'#9'F'
              'VLRALTERADOR'#9'15'#9'Desconto'#9'F'
              'VLRLIQUIDO'#9'15'#9'Vlr Líquido'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dtsAlteradores
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            ParentFont = False
            TabOrder = 3
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = DBgrdLancamentosCalcCellColors
            IndicatorColor = icBlack
            OnTopRowChanged = DBgrdLancamentosTopRowChanged
          end
          object Panel9: TPanel
            Left = 16
            Top = 8
            Width = 698
            Height = 27
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Descontos Programados'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object btnCancelaAltera: TfcShapeBtn
            Left = 432
            Top = 272
            Width = 89
            Height = 29
            Caption = 'Cancelar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888009191900
              88888887788888778F88887991919191088888788888888878F8879919191919
              108887F88888888887F88791919191919088878888888888878F791919191919
              19087F88FFFFFFFFF87F79988888888891087F8777777777F87F791FFFFFFFF8
              19087F8777777777F87F799FFFFFFFF891087F8777777777887F791919191919
              190878F8888888888878879191919191908887F88888888887F8879919191919
              1088878F88888888878888799191919108888878FF88888F7888888779999977
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 1
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnCancelaAlteraClick
          end
          object btnConfirmaAltera: TfcShapeBtn
            Left = 624
            Top = 272
            Width = 89
            Height = 29
            Caption = 'Confirmar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888002222200
              88888887788888778F88887222222222088888788888888878F887A228822222
              208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
              22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
              22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
              220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
              2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
              8888888778FFFF77888888888777778888888888877777888888}
            Layout = blGlyphRight
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 2
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnConfirmaAlteraClick
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Confissao'
          object Panel10: TPanel
            Left = 16
            Top = 7
            Width = 699
            Height = 27
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Confissão de Dívidas'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object wwDBGrid3: TwwDBGrid
            Left = 16
            Top = 34
            Width = 699
            Height = 228
            Selected.Strings = (
              'CONNUMERO'#9'12'#9'Nº Contrato'#9'No'
              'CONNOME'#9'36'#9'Nome Contrato'#9'No'
              'DESCCUSTORECIMO'#9'34'#9'Item'#9'F'
              'HMIVALOR'#9'10'#9'Valor'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsHistMovImob
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            OnCalcCellColors = DBgrdRescisaoCalcCellColors
            IndicatorColor = icBlack
            OnTopRowChanged = DBgrdRescisaoTopRowChanged
          end
          object btnConfirmaConfissao: TfcShapeBtn
            Left = 624
            Top = 272
            Width = 89
            Height = 29
            Caption = 'Confirmar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888002222200
              88888887788888778F88887222222222088888788888888878F887A228822222
              208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
              22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
              22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
              220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
              2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
              8888888778FFFF77888888888777778888888888877777888888}
            Layout = blGlyphRight
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 2
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnConfirmaConfissaoClick
          end
          object chkItemCentralizador: TCheckBox
            Left = 24
            Top = 272
            Width = 217
            Height = 17
            Caption = 'Exibir apenas item centralizador'
            Checked = True
            State = cbChecked
            TabOrder = 3
            OnClick = chkItemCentralizadorClick
          end
          object fcShapeBtn1: TfcShapeBtn
            Left = 528
            Top = 272
            Width = 89
            Height = 29
            Caption = 'Cancelar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888009191900
              88888887788888778F88887991919191088888788888888878F8879919191919
              108887F88888888887F88791919191919088878888888888878F791919191919
              19087F88FFFFFFFFF87F79988888888891087F8777777777F87F791FFFFFFFF8
              19087F8777777777F87F799FFFFFFFF891087F8777777777887F791919191919
              190878F8888888888878879191919191908887F88888888887F8879919191919
              1088878F88888888878888799191919108888878FF88888F7888888779999977
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 4
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnCancelaAlteraClick
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 417
    Width = 733
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  object dsRescisao: TwwDataSource
    AutoEdit = False
    DataSet = dtmImobiliario.qryContratosRescisao
    Left = 464
    Top = 1
  end
  object dsReajuste: TwwDataSource
    AutoEdit = False
    DataSet = dtmImobiliario.qryContratosReajuste
    Left = 520
    Top = 109
  end
  object dsLancFolha: TwwDataSource
    AutoEdit = False
    DataSet = qryLancFolha
    Left = 665
    Top = 81
  end
  object updLancFolha: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCAMENTOSIMOVEL'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDIMOVEL = :IDIMOVEL,'
      '  IDTIPOCUSTORECIMO = :IDTIPOCUSTORECIMO,'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL,'
      '  DATALANCAMENTO = :DATALANCAMENTO,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  ANOREFERENCIA = :ANOREFERENCIA,'
      '  MESCOMPETENCIA = :MESCOMPETENCIA,'
      '  ANOCOMPETENCIA = :ANOCOMPETENCIA,'
      '  RECPAG = :RECPAG,'
      '  VLRLANCOMRECEB = :VLRLANCOMRECEB,'
      '  VLRLANCRECEB = :VLRLANCRECEB,'
      '  MOEDARECEB = :MOEDARECEB,'
      '  IDFORCLI = :IDFORCLI,'
      '  FLGAGRUPAR = :FLGAGRUPAR,'
      '  FLGAGRUPADO = :FLGAGRUPADO,'
      '  FLGTIPOLANCAMENTO = :FLGTIPOLANCAMENTO,'
      '  FLGINTEGRADO = :FLGINTEGRADO,'
      '  FLGORIGEMLANC = :FLGORIGEMLANC,'
      '  IDUSUARIOSISTEMA = :IDUSUARIOSISTEMA,'
      '  VLRJUROS = :VLRJUROS,'
      '  VLRMULTA = :VLRMULTA,'
      '  VLRCORRECAOMON = :VLRCORRECAOMON,'
      '  VLRCOMISSAO = :VLRCOMISSAO,'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  NODOCUMENTO = :NODOCUMENTO,'
      '  IDPROGRAMA = :IDPROGRAMA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  DATALIMITE = :DATALIMITE,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  IDMODULO = :IDMODULO,'
      '  DTINICTBDIARIA = :DTINICTBDIARIA,'
      '  DTFIMCTBDIARIA = :DTFIMCTBDIARIA,'
      '  CODTIPIMOVEL = :CODTIPIMOVEL'
      'where'
      '  IDLANCIMOVEL = :OLD_IDLANCIMOVEL'
      ' ')
    InsertSQL.Strings = (
      'insert into LANCAMENTOSIMOVEL'
      '  (IDLANCIMOVEL, IDPESSOA, IDIMOVEL, IDTIPOCUSTORECIMO, '
      'IDCONTRATOIMOVEL, '
      '   DATALANCAMENTO, DATAVENCIMENTO, DATAEMISSAO, MESREFERENCIA, '
      'ANOREFERENCIA, '
      '   MESCOMPETENCIA, ANOCOMPETENCIA, RECPAG, VLRLANCOMRECEB, '
      'VLRLANCRECEB, '
      '   MOEDARECEB, IDFORCLI, FLGAGRUPAR, FLGAGRUPADO, '
      'FLGTIPOLANCAMENTO, FLGINTEGRADO, '
      '   FLGORIGEMLANC, IDUSUARIOSISTEMA, VLRJUROS, VLRMULTA, '
      'VLRCORRECAOMON, '
      '   VLRCOMISSAO, IDDOCUMENTO, NODOCUMENTO, IDPROGRAMA, '
      'IDEMPRESA, CODCENTROCUSTO, '
      '   DATALIMITE, CODPORTFORMA, IDMODULO, DTINICTBDIARIA, '
      'DTFIMCTBDIARIA, CODTIPIMOVEL)'
      'values'
      '  (:IDLANCIMOVEL, :IDPESSOA, :IDIMOVEL, :IDTIPOCUSTORECIMO,'
      ':IDCONTRATOIMOVEL,'
      '   :DATALANCAMENTO, :DATAVENCIMENTO, :DATAEMISSAO,'
      ':MESREFERENCIA, :ANOREFERENCIA,'
      '   :MESCOMPETENCIA, :ANOCOMPETENCIA, :RECPAG, :VLRLANCOMRECEB,'
      ':VLRLANCRECEB,'
      '   :MOEDARECEB, :IDFORCLI, :FLGAGRUPAR, :FLGAGRUPADO,'
      ':FLGTIPOLANCAMENTO,'
      '   :FLGINTEGRADO, :FLGORIGEMLANC, :IDUSUARIOSISTEMA, :VLRJUROS,'
      ':VLRMULTA,'
      '   :VLRCORRECAOMON, :VLRCOMISSAO, :IDDOCUMENTO, :NODOCUMENTO,'
      ':IDPROGRAMA,'
      '   :IDEMPRESA, :CODCENTROCUSTO, :DATALIMITE, :CODPORTFORMA,'
      ':IDMODULO,'
      '   :DTINICTBDIARIA, :DTFIMCTBDIARIA, :CODTIPIMOVEL)'
      ' ')
    DeleteSQL.Strings = (
      'delete from LANCAMENTOSIMOVEL'
      'where'
      '  IDLANCIMOVEL = :OLD_IDLANCIMOVEL')
    Left = 513
    Top = 15
  end
  object mnuMsgLanc: TPopupMenu
    Left = 381
    Top = 3
    object AlterarMensagemPadro1: TMenuItem
      Caption = 'Alterar Mensagem Padrão'
      OnClick = AlterarMensagemPadro1Click
    end
  end
  object qryInsertPrevisao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO LANCAMENTOSIMOVEL'
      '('
      '   IDLANCIMOVEL,'
      '   IDPESSOA,'
      '   IDIMOVEL,'
      '   IDTIPOCUSTORECIMO,'
      '   IDCONTRATOIMOVEL,'
      ''
      '   DATALANCAMENTO, DATAVENCIMENTO,'
      ''
      '   MESREFERENCIA, ANOREFERENCIA,'
      '   MESCOMPETENCIA, ANOCOMPETENCIA,'
      ''
      '   RECPAG,'
      '   VLRLANCOMRECEB, VLRLANCRECEB,'
      '   MOEDARECEB,'
      ''
      '   IDFORCLI,'
      ''
      '   FLGAGRUPAR, FLGAGRUPADO,'
      '   FLGTIPOLANCAMENTO,'
      '   FLGINTEGRADO,'
      ''
      '   FLGORIGEMLANC, IDUSUARIOSISTEMA,'
      ''
      '   VLRJUROS, VLRMULTA, VLRCORRECAOMON, VLRCOMISSAO,'
      ''
      '   IDDOCUMENTO, NODOCUMENTO,'
      ''
      '   IDPROGRAMA, IDEMPRESA, CODCENTROCUSTO,'
      ''
      '   DATALIMITE, IDMODULO, DTINICTBDIARIA, DTFIMCTBDIARIA'
      ')'
      ''
      'VALUES'
      ''
      '('
      '   :PIDLANCIMOVEL,'
      '   :PIDPESSOA,'
      '   :PIDIMOVEL,'
      '   :PIDTIPOCUSTORECIMO,'
      '   :PIDCONTRATOIMOVEL,'
      ''
      '   :PDATALANCAMENTO, :PDATAVENCIMENTO,'
      ''
      '   :PMESREFERENCIA, :PANOREFERENCIA,'
      '   :PMESCOMPETENCIA, :PANOCOMPETENCIA,'
      ''
      '   :PRECPAG,'
      '   :PVLRLANCOMRECEB, :PVLRLANCRECEB,'
      '   :PMOEDARECEB,'
      ''
      '   :PIDFORCLI,'
      ''
      '   :PFLGAGRUPAR, :PFLGAGRUPADO,'
      '   :PFLGTIPOLANCAMENTO,'
      '   :PFLGINTEGRADO,'
      ''
      '   :PFLGORIGEMLANC, :PIDUSUARIOSISTEMA,'
      ''
      '   :PVLRJUROS, :PVLRMULTA, :PVLRCORRECAOMON, :PVLRCOMISSAO,'
      ''
      '   :PIDDOCUMENTO, :PNODOCUMENTO,'
      ''
      '   :PIDPROGRAMA, :PIDEMPRESA, :PCODCENTROCUSTO,'
      ''
      '   :PDATALIMITE, :PIDMODULO, :PDTINICTBDIARIA, :PDTFIMCTBDIARIA'
      ')')
    ValidateWithMask = True
    Left = 677
    Top = 369
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLANCIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRLANCOMRECEB'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRLANCRECEB'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMOEDARECEB'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGAGRUPAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGAGRUPADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGTIPOLANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGINTEGRADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGORIGEMLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIOSISTEMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRJUROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRMULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRCORRECAOMON'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRCOMISSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PNODOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPROGRAMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALIMITE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDTINICTBDIARIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDTFIMCTBDIARIA'
        ParamType = ptUnknown
      end>
  end
  object qryLancFolha: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   '#39'                                                            ' +
        '                       '#39' AS CONTRATO,'
      
        '   '#39'                                                            ' +
        '                                                               '#39 +
        ' AS IMOVEL,'
      ''
      '   IDLANCIMOVEL,'
      '   IDPESSOA,'
      '   IDIMOVEL,'
      '   CODTIPIMOVEL,'
      '   IDTIPOCUSTORECIMO,'
      '   IDCONTRATOIMOVEL,'
      ''
      '   DATALANCAMENTO, DATAVENCIMENTO, DATAEMISSAO,'
      ''
      '   MESREFERENCIA, ANOREFERENCIA,'
      '   MESCOMPETENCIA, ANOCOMPETENCIA,'
      ''
      '   RECPAG,'
      '   VLRLANCOMRECEB, VLRLANCRECEB,'
      '   MOEDARECEB,'
      ''
      '   IDFORCLI,'
      ''
      '   FLGAGRUPAR, FLGAGRUPADO,'
      '   FLGTIPOLANCAMENTO,'
      '   FLGINTEGRADO,'
      ''
      '   FLGORIGEMLANC, IDUSUARIOSISTEMA,'
      ''
      '   VLRJUROS, VLRMULTA, VLRCORRECAOMON, VLRCOMISSAO,'
      ''
      '   IDDOCUMENTO, NODOCUMENTO,'
      ''
      '   IDPROGRAMA, IDEMPRESA, CODCENTROCUSTO,'
      ''
      '   DATALIMITE, CODPORTFORMA,'
      '   IDMODULO,'
      '   DTINICTBDIARIA, DTFIMCTBDIARIA'
      ''
      'FROM'
      '   LANCAMENTOSIMOVEL'
      ''
      'WHERE'
      '   IDLANCIMOVEL = 0'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updLancFolha
    ValidateWithMask = True
    Left = 665
    Top = 28
    object qryLancFolhaCONTRATO: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 83
      FieldName = 'CONTRATO'
      FixedChar = True
      Size = 83
    end
    object qryLancFolhaIMOVEL: TStringField
      DisplayLabel = 'Imóvel'
      DisplayWidth = 123
      FieldName = 'IMOVEL'
      FixedChar = True
      Size = 123
    end
    object qryLancFolhaMESCOMPETENCIA: TFloatField
      DisplayLabel = 'Mês'
      DisplayWidth = 10
      FieldName = 'MESCOMPETENCIA'
    end
    object qryLancFolhaANOCOMPETENCIA: TFloatField
      DisplayLabel = 'Ano'
      DisplayWidth = 10
      FieldName = 'ANOCOMPETENCIA'
    end
    object qryLancFolhaDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 18
      FieldName = 'DATAVENCIMENTO'
    end
    object qryLancFolhaDATALIMITE: TDateTimeField
      DisplayLabel = 'Limite'
      DisplayWidth = 18
      FieldName = 'DATALIMITE'
    end
    object qryLancFolhaVLRLANCRECEB: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLRLANCRECEB'
    end
    object qryLancFolhaIDDOCUMENTO: TFloatField
      DisplayLabel = 'ID Documento'
      DisplayWidth = 10
      FieldName = 'IDDOCUMENTO'
    end
    object qryLancFolhaNODOCUMENTO: TFloatField
      DisplayLabel = 'Nr. Documento'
      DisplayWidth = 10
      FieldName = 'NODOCUMENTO'
    end
    object qryLancFolhaDTINICTBDIARIA: TDateTimeField
      DisplayLabel = 'Início Ctb Diária'
      DisplayWidth = 18
      FieldName = 'DTINICTBDIARIA'
    end
    object qryLancFolhaDTFIMCTBDIARIA: TDateTimeField
      DisplayLabel = 'Término Ctb Diária'
      DisplayWidth = 18
      FieldName = 'DTFIMCTBDIARIA'
    end
    object qryLancFolhaCODTIPIMOVEL: TStringField
      DisplayWidth = 5
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryLancFolhaDATAEMISSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAEMISSAO'
    end
    object qryLancFolhaIDLANCIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLANCIMOVEL'
      Visible = False
    end
    object qryLancFolhaIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryLancFolhaIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryLancFolhaIDTIPOCUSTORECIMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCUSTORECIMO'
      Visible = False
    end
    object qryLancFolhaIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryLancFolhaDATALANCAMENTO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATALANCAMENTO'
      Visible = False
    end
    object qryLancFolhaMESREFERENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'MESREFERENCIA'
      Visible = False
    end
    object qryLancFolhaANOREFERENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'ANOREFERENCIA'
      Visible = False
    end
    object qryLancFolhaRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryLancFolhaVLRLANCOMRECEB: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRLANCOMRECEB'
      Visible = False
    end
    object qryLancFolhaMOEDARECEB: TFloatField
      DisplayWidth = 10
      FieldName = 'MOEDARECEB'
      Visible = False
    end
    object qryLancFolhaIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object qryLancFolhaFLGAGRUPAR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGAGRUPAR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryLancFolhaFLGAGRUPADO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGAGRUPADO'
      Visible = False
    end
    object qryLancFolhaFLGTIPOLANCAMENTO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTIPOLANCAMENTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryLancFolhaFLGINTEGRADO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGINTEGRADO'
      Visible = False
    end
    object qryLancFolhaFLGORIGEMLANC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGORIGEMLANC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryLancFolhaIDUSUARIOSISTEMA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUSUARIOSISTEMA'
      Visible = False
    end
    object qryLancFolhaVLRJUROS: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRJUROS'
      Visible = False
    end
    object qryLancFolhaVLRMULTA: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRMULTA'
      Visible = False
    end
    object qryLancFolhaVLRCORRECAOMON: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRCORRECAOMON'
      Visible = False
    end
    object qryLancFolhaVLRCOMISSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRCOMISSAO'
      Visible = False
    end
    object qryLancFolhaIDPROGRAMA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROGRAMA'
      Visible = False
    end
    object qryLancFolhaIDEMPRESA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object qryLancFolhaCODCENTROCUSTO: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryLancFolhaCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object qryLancFolhaIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Visible = False
    end
  end
  object qryExistePrevisaoImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT VLRLANCRECEB'
      '  FROM LANCAMENTOSIMOVEL'
      ' WHERE FLGORIGEMLANC = '#39'V'#39
      '   AND IDPESSOA         = :PIDPESSOA'
      '   AND MESCOMPETENCIA   = :PMESCOMPETENCIA'
      '   AND ANOCOMPETENCIA   = :PANOCOMPETENCIA'
      '   AND IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL'
      '   AND IDIMOVEL         = :PIDIMOVEL'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 589
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end>
  end
  object qryExistePrevisaoContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDDOCUMENTO, CODDOCUMENTO, PLNCODIGO,'
      '       SUM(VLRLANCRECEB) AS VLRLANCRECEB'
      '  FROM LANCAMENTOSIMOVEL'
      ' WHERE FLGORIGEMLANC = '#39'V'#39
      '   AND IDPESSOA         = :PIDPESSOA'
      
        '   AND (:PMESCOMPETENCIA IS NULL OR MESCOMPETENCIA   = :PMESCOMP' +
        'ETENCIA )'
      
        '   AND (:PANOCOMPETENCIA IS NULL OR ANOCOMPETENCIA   = :PANOCOMP' +
        'ETENCIA )'
      
        '   AND (:PANOMESCOMP     IS NULL OR (TO_CHAR(ANOCOMPETENCIA) || ' +
        'TO_CHAR(MESCOMPETENCIA)) >= :PANOMESCOMP )'
      '   AND IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL'
      ' GROUP BY IDDOCUMENTO, CODDOCUMENTO, PLNCODIGO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 589
    Top = 356
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PANOMESCOMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PANOMESCOMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryExistePrevisaoContratoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.PLNCODIGO'
    end
    object qryExistePrevisaoContratoVLRLANCRECEB: TFloatField
      FieldName = 'VLRLANCRECEB'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.VLRLANCRECEB'
    end
    object qryExistePrevisaoContratoIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.IDDOCUMENTO'
    end
    object qryExistePrevisaoContratoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.CODDOCUMENTO'
    end
  end
  object qryContratoXDesc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       CD.CODALTERADOR,'
      '       CD.VLRDESCONTO,'
      '       CD.MOECODIGO,'
      '       CD.PERDESCONTO,'
      ''
      '       CD.OBSERVACAO,'
      ''
      '       IM.CODTIPIMOVEL,'
      '       CI.CONNUMERO || '#39' - '#39' || CI.CONNOME AS CONNOME,'
      '       MO.MOESIGLA,'
      '       TA.DESCRICAO,'
      '       TI.DESCTIPOIMOVEL'
      'FROM   CONTRATOXDESC     CD,'
      '       CONTRATOIMOVEL    CI,'
      '       CONTRATOXIMOVEL   CM,'
      '       IMOVEL            IM,'
      '       MOEDA             MO,'
      '       TIPOALTERADOR     TA,'
      '       TIPOIMOVEL        TI'
      'WHERE  CD.IDCONTRATOIMOVEL =  CI.IDCONTRATOIMOVEL'
      '  AND  CI.IDCONTRATOIMOVEL =  CM.IDCONTRATOIMOVEL'
      '  AND  CM.IDIMOVEL         =  IM.IDIMOVEL'
      '  AND  CD.CODALTERADOR     =  TA.CODALTERADOR'
      '  AND  IM.CODTIPIMOVEL     =  TI.CODTIPIMOVEL'
      '  AND  CD.MOECODIGO        =  MO.MOECODIGO (+)'
      '  AND  CI.IDCONTRATOIMOVEL =  :IDCONTRATOIMOVEL'
      '  AND  CD.DATAINICIO       <= :DATAVENC'
      '  AND  ( CD.DATAFIM        >= :DATAVENC'
      '   OR    CD.DATAFIM        IS NULL )'
      '')
    ValidateWithMask = True
    Left = 409
    Top = 356
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAVENC'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAVENC'
        ParamType = ptInput
      end>
    object qryContratoXDescCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
    end
    object qryContratoXDescVLRDESCONTO: TFloatField
      FieldName = 'VLRDESCONTO'
    end
    object qryContratoXDescMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryContratoXDescPERDESCONTO: TFloatField
      FieldName = 'PERDESCONTO'
    end
    object qryContratoXDescCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryContratoXDescMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryContratoXDescDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryContratoXDescDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      Size = 60
    end
    object qryContratoXDescCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 83
    end
    object qryContratoXDescOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 60
    end
  end
  object qryCotacaoMoeda: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COTVALOR '
      'FROM   COTACAOMOEDA'
      'WHERE  MOECODIGO = :MOECODIGO  '
      '  AND  COTDATA             <= :DATA'
      '  AND  ( COTDATAFIM        >= :DATA  '
      '   OR    COTDATAFIM        IS NULL )'
      ' ')
    ValidateWithMask = True
    Left = 537
    Top = 300
    ParamData = <
      item
        DataType = ftFloat
        Name = 'MOECODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptInput
      end>
    object qryCotacaoMoedaCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
      Origin = 'BASEDADOS.COTACAOMOEDA.COTVALOR'
    end
  end
  object dtsAlteradores: TwwDataSource
    AutoEdit = False
    DataSet = qryAlteradores
    Left = 632
    Top = 237
  end
  object qryAlteradores: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       A.IDDOCUMENTO,'
      '       L.IDCONTRATOIMOVEL,'
      '       A.CODALTERADOR,'
      '       A.VLRALTERADOR,'
      '       A.CODTIPIMOVEL,'
      ''
      '       A.OBSERVACAO,'
      ''
      '       T.DESCRICAO,'
      '       I.DESCTIPOIMOVEL,'
      '       0 AS VLRBRUTO,'
      '       0 AS VLRLIQUIDO,'
      
        '       '#39'                                                        ' +
        '    '#39' AS CONNOME'
      'FROM   ALTERALANCIMOVEL  A,'
      '       LANCAMENTOSIMOVEL L,'
      '       TIPOALTERADOR     T,'
      '       TIPOIMOVEL        I'
      'WHERE  A.CODALTERADOR = T.CODALTERADOR'
      '  AND  A.CODTIPIMOVEL = I.CODTIPIMOVEL'
      '  AND  A.IDDOCUMENTO  = L.IDDOCUMENTO'
      '  AND  A.IDDOCUMENTO  = :IDDOCUMENTO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updAlteradores
    ValidateWithMask = True
    Left = 633
    Top = 251
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDDOCUMENTO'
        ParamType = ptInput
      end>
    object qryAlteradoresCONNOME: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 42
      FieldName = 'CONNOME'
      FixedChar = True
      Size = 60
    end
    object qryAlteradoresDESCRICAO: TStringField
      DisplayLabel = 'Alterador'
      DisplayWidth = 19
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPOALTERADOR.DESCRICAO'
      Size = 35
    end
    object qryAlteradoresVLRBRUTO: TFloatField
      DisplayLabel = 'Vlr Bruto'
      DisplayWidth = 15
      FieldName = 'VLRBRUTO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryAlteradoresVLRALTERADOR: TFloatField
      DisplayLabel = 'Desconto'
      DisplayWidth = 15
      FieldName = 'VLRALTERADOR'
      Origin = 'BASEDADOS.ALTERALANCIMOVEL.VLRALTERADOR'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryAlteradoresVLRLIQUIDO: TFloatField
      DisplayLabel = 'Vlr Líquido'
      DisplayWidth = 15
      FieldName = 'VLRLIQUIDO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qryAlteradoresDESCTIPOIMOVEL: TStringField
      DisplayLabel = 'Tipo de Imóvel'
      DisplayWidth = 57
      FieldName = 'DESCTIPOIMOVEL'
      Origin = 'BASEDADOS.TIPOIMOVEL.DESCTIPOIMOVEL'
      Visible = False
      Size = 60
    end
    object qryAlteradoresIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'BASEDADOS.ALTERALANCIMOVEL.IDDOCUMENTO'
      Visible = False
    end
    object qryAlteradoresCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Origin = 'BASEDADOS.ALTERALANCIMOVEL.CODALTERADOR'
      Visible = False
    end
    object qryAlteradoresCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'BASEDADOS.ALTERALANCIMOVEL.CODTIPIMOVEL'
      Visible = False
      Size = 5
    end
    object qryAlteradoresIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryAlteradoresOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 60
    end
  end
  object updAlteradores: TUpdateSQL
    ModifySQL.Strings = (
      'update ALTERALANCIMOVEL'
      'set'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  CODALTERADOR = :CODALTERADOR,'
      '  VLRALTERADOR = :VLRALTERADOR,'
      '  CODTIPIMOVEL = :CODTIPIMOVEL,'
      '  OBSERVACAO = :OBSERVACAO'
      'where'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO and'
      '  CODALTERADOR = :OLD_CODALTERADOR and'
      '  VLRALTERADOR = :OLD_VLRALTERADOR and'
      '  CODTIPIMOVEL = :OLD_CODTIPIMOVEL and'
      '  OBSERVACAO = :OLD_OBSERVACAO')
    InsertSQL.Strings = (
      'insert into ALTERALANCIMOVEL'
      
        '  (IDDOCUMENTO, CODALTERADOR, VLRALTERADOR, CODTIPIMOVEL, OBSERV' +
        'ACAO)'
      'values'
      
        '  (:IDDOCUMENTO, :CODALTERADOR, :VLRALTERADOR, :CODTIPIMOVEL, :O' +
        'BSERVACAO)')
    DeleteSQL.Strings = (
      'delete from ALTERALANCIMOVEL'
      'where'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO and'
      '  CODALTERADOR = :OLD_CODALTERADOR and'
      '  VLRALTERADOR = :OLD_VLRALTERADOR and'
      '  CODTIPIMOVEL = :OLD_CODTIPIMOVEL and'
      '  OBSERVACAO = :OLD_OBSERVACAO')
    Left = 633
    Top = 227
  end
  object qryLookTipoRecContr: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT T.IDTIPOCUSTORECIMO, T.DESCCUSTORECIMO, T.RECCUSTO, T.COD' +
        'TIPDOC,'
      '       T.FLGOBRIGAORC, T.IDTIPODESPESA, T.FLGDIARIO'
      '  FROM TIPOCUSTORECIMOV T'
      
        ' WHERE T.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT IDTIPOCUSTORECIM' +
        'O'
      '                                  FROM CONTRATOIMOVEL'
      '                                 WHERE FLGSTATUS = '#39'V'#39
      '                                   AND FLGTIPOCONTRATO = '#39'L'#39' )'
      ' ORDER BY T.DESCCUSTORECIMO'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 656
    Top = 144
    object qryLookTipoRecContrDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Tipo de Receita'
      DisplayWidth = 30
      FieldName = 'DESCCUSTORECIMO'
      Origin = 'TIPOCUSTORECIMOV.DESCCUSTORECIMO'
      Size = 60
    end
    object qryLookTipoRecContrIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Origin = 'TIPOCUSTORECIMOV.IDTIPOCUSTORECIMO'
      Visible = False
    end
    object qryLookTipoRecContrRECCUSTO: TStringField
      FieldName = 'RECCUSTO'
      Origin = 'TIPOCUSTORECIMOV.RECCUSTO'
      Visible = False
      Size = 1
    end
    object qryLookTipoRecContrCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'TIPOCUSTORECIMOV.CODTIPDOC'
      Visible = False
    end
    object qryLookTipoRecContrFLGOBRIGAORC: TFloatField
      FieldName = 'FLGOBRIGAORC'
      Origin = 'TIPOCUSTORECIMOV.FLGOBRIGAORC'
      Visible = False
    end
    object qryLookTipoRecContrIDTIPODESPESA: TFloatField
      FieldName = 'IDTIPODESPESA'
      Visible = False
    end
    object qryLookTipoRecContrFLGDIARIO: TStringField
      FieldName = 'FLGDIARIO'
      Origin = 'BASEDADOS.TIPOCUSTORECIMOV.FLGDIARIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object QryContratosPend: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '/* Contratos Vigentes sem receita Gerada no mês */'
      'SELECT CI.IDCONTRATOIMOVEL,'
      '       CI.CONNUMERO,'
      '       CI.CONNOME,'
      '       CI.CONDATAINICIO, '
      '       CI.CONDATAFIM,'
      '       CI.IDTIPOCUSTORECIMO'
      '  FROM CONTRATOIMOVEL CI'
      ' WHERE FLGTIPOCONTRATO = '#39'L'#39
      '   AND FLGSTATUS <> '#39'S'#39
      
        '   AND ((CI.FLGINDETERMINADO IS NULL AND TO_CHAR(CI.CONDATACAREN' +
        'CIA,'#39'YYYYMM'#39') <= :ANOMES) OR'
      '        (CI.FLGINDETERMINADO IS NOT NULL AND'
      '         TO_CHAR(CI.CONDATACARENCIA,'#39'YYYYMM'#39') <= :ANOMES AND '
      '         TO_CHAR(CI.CONDATAFIM,'#39'YYYYMM'#39') >= :ANOMES ) )  '
      '   AND NOT EXISTS ( SELECT 1 FROM ( '
      '                                   SELECT DISTINCT '
      '                                          L.IDCONTRATOIMOVEL,'
      '                                          L.IDTIPOCUSTORECIMO'
      '                                     FROM LANCAMENTOSIMOVEL L'
      '                                    WHERE RECPAG = '#39'R'#39
      
        '                                      AND MESCOMPETENCIA = :MES ' +
        '                     '
      
        '                                      AND ANOCOMPETENCIA = :ANO ' +
        ') CO'
      '   '
      
        '                            WHERE CI.IDCONTRATOIMOVEL  = CO.IDCO' +
        'NTRATOIMOVEL'
      
        '                              AND CI.IDTIPOCUSTORECIMO = CO.IDTI' +
        'POCUSTORECIMO   '
      '                  )')
    ValidateWithMask = True
    Left = 393
    Top = 300
    ParamData = <
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANO'
        ParamType = ptInput
      end>
    object QryContratosPendIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object QryContratosPendCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object QryContratosPendCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object QryContratosPendCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
    end
    object QryContratosPendCONDATAFIM: TDateTimeField
      FieldName = 'CONDATAFIM'
    end
    object QryContratosPendIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
    end
  end
  object dsVerificaContrato: TwwDataSource
    Left = 25
    Top = 297
  end
  object qryVerificaContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CI.CONDATAFIM, CI.CONPROXREAJUSTE, CI.CONINDICEREAJUSTE, ' +
        'CI.FLGINDETERMINADO, CX.CIMDTFIM, CI.CONPERALUGUEL,'
      '       CI.CONDATACARENCIA'
      'FROM CONTRATOXIMOVEL CX, CONTRATOIMOVEL CI'
      'WHERE CX.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL'
      '  AND CX.IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 33
    Top = 305
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryVerificaContratoCONDATAFIM: TDateTimeField
      FieldName = 'CONDATAFIM'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CONDATAFIM'
    end
    object qryVerificaContratoCONPROXREAJUSTE: TDateTimeField
      FieldName = 'CONPROXREAJUSTE'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CONPROXREAJUSTE'
    end
    object qryVerificaContratoCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CONINDICEREAJUSTE'
    end
    object qryVerificaContratoFLGINDETERMINADO: TStringField
      FieldName = 'FLGINDETERMINADO'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.FLGINDETERMINADO'
      FixedChar = True
      Size = 1
    end
    object qryVerificaContratoCIMDTFIM: TDateTimeField
      FieldName = 'CIMDTFIM'
      Origin = 'BASEDADOS.CONTRATOXIMOVEL.CIMDTFIM'
    end
    object qryVerificaContratoCONPERALUGUEL: TFloatField
      FieldName = 'CONPERALUGUEL'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CONPERALUGUEL'
    end
    object qryVerificaContratoCONDATACARENCIA: TDateTimeField
      FieldName = 'CONDATACARENCIA'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CONDATACARENCIA'
    end
  end
  object cdsCondPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 121
    Top = 225
  end
  object cdsHistMovImob: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 81
    Top = 265
    object cdsHistMovImobNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsHistMovImobCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object cdsHistMovImobCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object cdsHistMovImobDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object cdsHistMovImobIDHISTMOVIMOB: TFloatField
      FieldName = 'IDHISTMOVIMOB'
    end
    object cdsHistMovImobIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object cdsHistMovImobIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
    end
    object cdsHistMovImobIDITEMCENTRALIZA: TFloatField
      FieldName = 'IDITEMCENTRALIZA'
    end
    object cdsHistMovImobHMIDATAMOV: TDateTimeField
      FieldName = 'HMIDATAMOV'
    end
    object cdsHistMovImobHMIVALOR: TFloatField
      FieldName = 'HMIVALOR'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsHistMovImobHMIDOCUMENTO: TFloatField
      FieldName = 'HMIDOCUMENTO'
    end
    object cdsHistMovImobPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object cdsHistMovImobIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object cdsHistMovImobHMITIPOEVENTO: TFloatField
      FieldName = 'HMITIPOEVENTO'
    end
    object cdsHistMovImobHMIPARCELA: TFloatField
      FieldName = 'HMIPARCELA'
    end
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      '   SELECT'
      '       FCI.NOME,'
      '       CI.IDCONTRATOIMOVEL,'
      '       CI.CONNUMERO,'
      '       CI.CONNOME,'
      '       TCR.DESCCUSTORECIMO,'
      '       HMI.IDHISTMOVIMOB,'
      '       HMI.IDCONDPAGIMOVEL,'
      '       HMI.IDTIPOCUSTORECIMO,'
      '       HMI.IDITEMCENTRALIZA,'
      '       HMI.HMIDATAMOV,'
      '       HMI.HMIVALOR,'
      '       HMI.HMIDOCUMENTO,'
      '       HMI.HMITIPOEVENTO,'
      '       HMI.PLNCODIGO,'
      '       HMI.HMIPARCELA'
      '   FROM'
      '       HISTMOVIMOB HMI,'
      '       CONDPAGIMOVEL CPI,'
      '       CONTRATOIMOVEL CI,'
      '       FORMACALCIMOB FCI,'
      '       TIPOCUSTORECIMOV TCR'
      '   WHERE'
      '       CPI.IDCONDPAGIMOVEL   = HMI.IDCONDPAGIMOVEL'
      '   AND CI.IDCONTRATOIMOVEL   = CPI.IDCONTRATOIMOVEL'
      '   AND FCI.IDFORMACALCIMOB   = CPI.IDFORMACALCIMOB'
      '   AND TCR.IDTIPOCUSTORECIMO = HMI.IDTIPOCUSTORECIMO'
      '   AND CPI.IDCONDPAGIMOVEL       =  -2'
      ''
      ''
      ''
      ' '
      ' ')
    ClientDataSet = cdsHistMovImob
    Left = 113
    Top = 305
  end
  object dsHistMovImob: TDataSource
    DataSet = cdsHistMovImob
    Left = 113
    Top = 265
  end
  object cdsContratoXImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 57
    Top = 145
  end
  object cdsContratoXAlterador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 49
    Top = 201
  end
  object cdsItensCalc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 169
    Top = 161
  end
  object cdsBloqueioImob: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 249
    Top = 193
  end
  object qryContratoXDescRateio: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       CD.DATAINICIO,'
      '       CD.DATAFIM,'
      ''
      '       CD.CODALTERADOR,'
      '       CD.VLRDESCONTO,'
      '       CD.MOECODIGO,'
      '       CD.PERDESCONTO,'
      ''
      '       CD.OBSERVACAO,'
      ''
      '       IM.CODTIPIMOVEL,'
      '       CI.CONNUMERO || '#39' - '#39' || CI.CONNOME AS CONNOME,'
      '       MO.MOESIGLA,'
      '       TA.DESCRICAO,'
      '       TI.DESCTIPOIMOVEL'
      'FROM   CONTRATOXDESC     CD,'
      '       CONTRATOIMOVEL    CI,'
      '       CONTRATOXIMOVEL   CM,'
      '       IMOVEL            IM,'
      '       MOEDA             MO,'
      '       TIPOALTERADOR     TA,'
      '       TIPOIMOVEL        TI'
      'WHERE  CD.IDCONTRATOIMOVEL =  CI.IDCONTRATOIMOVEL'
      '  AND  CI.IDCONTRATOIMOVEL =  CM.IDCONTRATOIMOVEL'
      '  AND  CM.IDIMOVEL         =  IM.IDIMOVEL'
      '  AND  CD.CODALTERADOR     =  TA.CODALTERADOR'
      '  AND  IM.CODTIPIMOVEL     =  TI.CODTIPIMOVEL'
      '  AND  CD.MOECODIGO        =  MO.MOECODIGO (+)'
      '  AND  CI.IDCONTRATOIMOVEL =  :PIDCONTRATOIMOVEL'
      
        '  AND ((:PERIODO BETWEEN TO_CHAR(CD.DATAINICIO,'#39'YYYYMM'#39') AND TO_' +
        'CHAR(CD.DATAFIM,'#39'YYYYMM'#39')) OR'
      
        '       (CD.DATAFIM IS NULL AND :PERIODO = TO_CHAR(CD.DATAINICIO,' +
        #39'YYYYMM'#39')))'
      'ORDER BY CD.DATAINICIO'
      '')
    ValidateWithMask = True
    Left = 257
    Top = 348
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PERIODO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PERIODO'
        ParamType = ptInput
      end>
    object qryContratoXDescRateioDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
    end
    object qryContratoXDescRateioCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
    end
    object qryContratoXDescRateioVLRDESCONTO: TFloatField
      FieldName = 'VLRDESCONTO'
    end
    object qryContratoXDescRateioMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryContratoXDescRateioPERDESCONTO: TFloatField
      FieldName = 'PERDESCONTO'
    end
    object qryContratoXDescRateioOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 60
    end
    object qryContratoXDescRateioCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryContratoXDescRateioCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 83
    end
    object qryContratoXDescRateioMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryContratoXDescRateioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryContratoXDescRateioDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      Size = 60
    end
    object qryContratoXDescRateioDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
    end
  end
  object qryImoveis: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT C.IDCONTRATOIMOVEL, CXI.IDIMOVEL, CXI.FLGRATEIO, CXI.CIMP' +
        'ERCENTRATEIO, '
      '       C.CONNUMERO,        C.CONNOME,    C.IDLOCATARIO, '
      '       CXI.CIMDESCRICAO '
      '  FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI '
      ' WHERE ( C.IDPESSOA = :PIDPESSOA ) '
      '   AND C.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL '
      
        '   AND (((CXI.CIMDTFIM IS NOT NULL AND :PCOMP BETWEEN TO_CHAR(CX' +
        'I.CIMDTINI,'#39'YYYYMM'#39') AND TO_CHAR(CXI.CIMDTFIM,'#39'YYYYMM'#39')) ) OR '
      
        '        ((CXI.CIMDTFIM IS NULL     AND :PCOMP >= TO_CHAR(CXI.CIM' +
        'DTINI,'#39'YYYYMM'#39')) ) ) '
      
        '   AND ( (:PIDCONTRATOIMOVEL IS NULL) OR (CXI.IDCONTRATOIMOVEL =' +
        ' :PIDCONTRATOIMOVEL) ) '
      ' ORDER BY CXI.IDIMOVEL  ')
    ValidateWithMask = True
    Left = 553
    Top = 188
    ParamData = <
      item
        DataType = ftString
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCOMP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCOMP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptInput
      end>
  end
end
