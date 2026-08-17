inherited frmExecAtualizaVlrReceb: TfrmExecAtualizaVlrReceb
  Left = 25
  Top = 68
  BorderStyle = bsSingle
  Caption = 'Atualização de Valores a Receber'
  ClientHeight = 408
  ClientWidth = 748
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 748
    Height = 375
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 746
      Height = 373
      ActivePage = tbsParametros
      Align = alClient
      TabOrder = 0
      object tbsParametros: TTabSheet
        Caption = 'Condições'
        object Label2: TLabel
          Left = 45
          Top = 308
          Width = 324
          Height = 13
          Caption = 'Data de Lançamento dos novos alteradores (se houver): '
        end
        object GroupBox2: TGroupBox
          Left = 8
          Top = 200
          Width = 473
          Height = 73
          Caption = ' Correção Monetária '
          TabOrder = 1
          TabStop = True
          object chkCorrecao: TCheckBox
            Left = 16
            Top = 24
            Width = 177
            Height = 17
            Caption = 'Aplicar correção monetária'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object chkMesAnterior: TCheckBox
            Left = 16
            Top = 44
            Width = 241
            Height = 17
            Caption = 'Utilizar índice relativo ao mês anterior'
            TabOrder = 1
          end
        end
        object GroupBox1: TGroupBox
          Left = 8
          Top = 16
          Width = 713
          Height = 161
          TabOrder = 0
          object Label3: TLabel
            Left = 86
            Top = 28
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nº Contrato: '
          end
          object Label4: TLabel
            Left = 50
            Top = 52
            Width = 111
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nome do Contrato: '
          end
          object Label1: TLabel
            Left = 55
            Top = 100
            Width = 106
            Height = 13
            Caption = 'Data Vencimento: '
          end
          object lblMesVencimento: TLabel
            Left = 16
            Top = 124
            Width = 145
            Height = 13
            Caption = 'Competência (Mês/Ano): '
          end
          object Label7: TLabel
            Left = 45
            Top = 76
            Width = 116
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nome do Locatário: '
          end
          object btnBuscaContrato: TBitBtn
            Left = 648
            Top = 48
            Width = 24
            Height = 22
            Hint = 'Busca um Contrato'
            TabOrder = 2
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
            Left = 672
            Top = 48
            Width = 24
            Height = 22
            Hint = 'Limpa Contrato selecionado'
            TabOrder = 3
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
          object edtNumContrato: TEdit
            Left = 168
            Top = 24
            Width = 145
            Height = 21
            TabStop = False
            Enabled = False
            TabOrder = 0
          end
          object edtNomeContrato: TEdit
            Left = 168
            Top = 48
            Width = 481
            Height = 21
            TabStop = False
            Enabled = False
            TabOrder = 1
          end
          object edtDataVenc: TCMDateTimePicker
            Left = 168
            Top = 96
            Width = 113
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
            TabOrder = 7
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 328
            Top = 120
            Width = 65
            Height = 21
            Increment = 1
            MaxValue = 2055
            Value = 1980
            Enabled = False
            TabOrder = 9
            UnboundDataType = wwDefault
          end
          object chkCompetencia: TCheckBox
            Left = 436
            Top = 122
            Width = 197
            Height = 17
            Caption = 'Levar em conta a competência'
            TabOrder = 10
            OnClick = chkCompetenciaClick
          end
          object edtNomeLocatario: TEdit
            Left = 168
            Top = 72
            Width = 481
            Height = 21
            TabStop = False
            Enabled = False
            TabOrder = 4
          end
          object btnBuscaLocatario: TBitBtn
            Left = 648
            Top = 72
            Width = 24
            Height = 22
            Hint = 'Busca um Contrato'
            TabOrder = 5
            OnClick = btnBuscaLocatarioClick
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
          object btnLimpaLocatario: TBitBtn
            Left = 672
            Top = 72
            Width = 24
            Height = 22
            Hint = 'Limpa Contrato selecionado'
            TabOrder = 6
            OnClick = btnLimpaLocatarioClick
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
          object cboMes: TComboBox
            Left = 168
            Top = 120
            Width = 153
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 8
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
        end
        object btnSeleciona: TBitBtn
          Left = 528
          Top = 224
          Width = 185
          Height = 29
          Caption = 'Seleciona Lançamentos'
          TabOrder = 3
          OnClick = btnSelecionaClick
          Glyph.Data = {
            4E010000424D4E01000000000000760000002800000012000000120000000100
            040000000000D800000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            77777700000077770000000000777700000077770FFFFFFFF077770000007777
            0F777777F0777700000077770FFFFFFFF077770000007C770F777777F077C700
            00007CC70FFFFFFFF07CC70000007CCC0F777777F0CCC70000007CCC0FFFFFFF
            F0CCC70000007CC70F777777F07CC70000007C770FFFFFFFF077C70000007777
            0FFFF777F0777700000077770000FFFFF07777000000777770F0F777F0777700
            000077777700FFFFF07777000000777777700000007777000000777777777777
            777777000000777777777777777777000000}
        end
        object edtDataLancamento: TCMDateTimePicker
          Left = 376
          Top = 304
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
          OnExit = edtNovaDataExit
        end
      end
      object tbsResult: TTabSheet
        Caption = 'Resultado'
        object Label9: TLabel
          Left = 8
          Top = 9
          Width = 137
          Height = 13
          Caption = 'Lançamentos em Aberto'
        end
        object Label11: TLabel
          Left = 8
          Top = 218
          Width = 156
          Height = 13
          Caption = 'Alteradores do Lançamento'
        end
        object DBgrdReajuste: TwwDBGrid
          Left = 8
          Top = 24
          Width = 713
          Height = 129
          Selected.Strings = (
            'IMOVEL_EXTENSO'#9'18'#9'Imóvel'
            'DESCCUSTORECIMO'#9'11'#9'Tipo Receita'
            'VLRLANCRECEB'#9'9'#9'a Receber'
            'VLRMULTA'#9'8'#9'Multa'
            'VLRJUROS'#9'7'#9'Juros'
            'VLRCORRECAOMON'#9'9'#9'Correção'
            'MESCOMPETENCIA'#9'4'#9'Mês'
            'ANOCOMPETENCIA'#9'4'#9'Ano'
            'DATAVENCIMENTO'#9'9'#9'Vencimento')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = ds
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = DBgrdReajusteCalcCellColors
          OnEnter = DBgrdReajusteEnter
          OnExit = DBgrdReajusteExit
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdReajusteTopRowChanged
        end
        object DBgrdAlteradoresLanc: TwwDBGrid
          Left = 8
          Top = 232
          Width = 553
          Height = 105
          Selected.Strings = (
            'DATALANCTO'#9'11'#9'Data'
            'DESCRICAO'#9'19'#9'Descrição'
            'HISTORICOCOMPL'#9'19'#9'Histórico'
            'VALOR'#9'13'#9'Valor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsAlterador
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
          TitleButtons = False
          OnCalcCellColors = DBgrdReajusteCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdReajusteTopRowChanged
        end
        object Panel3: TPanel
          Left = 424
          Top = 168
          Width = 297
          Height = 49
          TabOrder = 3
          object Label5: TLabel
            Left = 12
            Top = 18
            Width = 149
            Height = 16
            Caption = 'Atualizar Valores até:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtNovaData: TCMDateTimePicker
            Left = 168
            Top = 16
            Width = 113
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
            OnExit = edtNovaDataExit
          end
        end
        object btnCalcula: TBitBtn
          Left = 576
          Top = 248
          Width = 145
          Height = 33
          Caption = 'Atualizar Valores'
          ModalResult = 1
          TabOrder = 4
          OnClick = btnCalculaClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            77777777777777777777700000000000000766444444444444406E6666666666
            66406E60F0F0F067F0406E666666666666406E60F0F0F0F0F0406E6666666666
            66406E077777776666406E0FFFFFF76666406E000000006666406EEEEEEEEEEE
            EE60766666666666666777777777777777777777777777777777}
          Spacing = 6
        end
        object btnExcluiAlterador: TBitBtn
          Left = 576
          Top = 288
          Width = 145
          Height = 33
          Caption = 'Excluir Alterador'
          ModalResult = 1
          TabOrder = 2
          OnClick = btnExcluiAlteradorClick
          Glyph.Data = {
            BE060000424DBE06000000000000360400002800000024000000120000000100
            0800000000008802000000000000000000000001000000010000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
            0707070707070707070707070707070707070707070707070707070707070707
            0707F8F80707070707070707070707070707070707FF07070707070707070707
            0707070707F90101F80707070707F9F80707070707070707F8F8FF0707070707
            07FF07070707070707F9010101F8070707F90101F8070707070707F8FF07F8FF
            070707FFF8F8FF070707070707F901010101F807F901010101F80707070707F8
            FF0707F8FF07FFF80707F8FF070707070707F901010101F80101010101F80707
            070707F8FF070707F8FFF807070707F8FF070707070707F90101010101010101
            F807070707070707F8FF070707F807070707FFF80707070707070707F9010101
            010101F8070707070707070707F8FF070707070707FFF8070707070707070707
            070101010101F80707070707070707070707F8FF0707070707F8070707070707
            0707070707F901010101F8070707070707070707070707F8FF070707F8070707
            0707070707070707F90101010101F8070707070707070707070707F807070707
            F8FF070707070707070707F9010101F8010101F807070707070707070707F807
            07070707F8FF0707070707070707F9010101F807F9010101F807070707070707
            07F8070707F8FF0707F8FF07070707070707F90101F8070707F9010101F80707
            07070707F8FF0707F807F8FF0707F8FF07070707070707F9010707070707F901
            0101070707070707F8FFFFF8070707F8FF0707F8FF0707070707070707070707
            070707F901F907070707070707F8F80707070707F8FFFFFFF807070707070707
            07070707070707070707070707070707070707070707070707F8F8F807070707
            0707070707070707070707070707070707070707070707070707070707070707
            0707}
          NumGlyphs = 2
          Spacing = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 375
    Width = 748
    inherited tb97Fundo: TToolbar97
      Left = 576
      DockPos = 580
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 337
      DockPos = 337
      inherited ToolbarSep971: TToolbarSep97
        Left = 231
      end
      inherited ToolbarSep974: TToolbarSep97
        Left = 229
      end
      object ToolbarSep975: TToolbarSep97 [3]
        Left = 147
        Top = 0
        Blank = True
        SizeHorz = 1
        SizeVert = 1
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 145
        Caption = 'A&plica Alteradores'
        Default = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 148
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65499
    Top = 65499
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IMOVEL_EXTENSO, DESCCUSTORECIMO, VLRLANCRECEB,'
      '   VLRMULTA, VLRJUROS, VLRCORRECAOMON,'
      '   MESCOMPETENCIA, ANOCOMPETENCIA,'
      '   DATAVENCIMENTO, CONINDICEREAJUSTE,'
      ''
      '   IDLANCIMOVEL,'
      '   IDIMOVEL, IDCONTRATOIMOVEL, IDTIPOCUSTORECIMO,'
      '   IDPESSOA, PLNCODIGO, CODDOCUMENTO,'
      '   VLRLANCOMRECEB, MOEDARECEB,'
      '   FLGTIPOLANCAMENTO, RECPAG,'
      '   DATALANCAMENTO,'
      '   DATACORRECAO, FLGMULTACALCULADA,'
      '   IDLOCATARIO,'
      ''
      '   CONDIASTOLERANCIA, FLGTIPODIATOLERA,'
      '   IDCIDADES, IDPAIS, CODESTADO,'
      '   CONVLRMULTA, CONMOEDAMULTA, CONPERCENTMULTA,'
      '   CONVLRMORA, CONMOEDAMORA, CONINDICEMORA,'
      '   CONPERCENTMORA, CONPERMORA, FLGMORAPROPORC,'
      '   CODALTMULTA, CODALTJUROS, CODALTCORRMON'
      ''
      'FROM'
      '   VWLANCAMENTO'
      'WHERE'
      '   ( IDPESSOA = :PIDPESSOA )'
      '   AND ( RECPAG = '#39'R'#39' )'
      
        '   AND ( (:PIDCONTRATOIMOVEL IS NULL) OR (IDCONTRATOIMOVEL = :PI' +
        'DCONTRATOIMOVEL) )'
      
        '   AND ( (:PDATAVENCIMENTO IS NULL) OR (DATAVENCIMENTO = :PDATAV' +
        'ENCIMENTO) )'
      
        '   AND ( (:PMESCOMPETENCIA IS NULL) OR (MESCOMPETENCIA = :PMESCO' +
        'MPETENCIA) )'
      
        '   AND ( (:PANOCOMPETENCIA IS NULL) OR (ANOCOMPETENCIA = :PANOCO' +
        'MPETENCIA) )'
      
        '   AND ( (:PIDLOCATARIO IS NULL) OR (IDLOCATARIO = :PIDLOCATARIO' +
        ') )'
      '   AND ( (STATUS_DOC IS NULL) OR (STATUS_DOC <> 2) )')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 343
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAVENCIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAVENCIMENTO'
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
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptUnknown
      end>
    object qryIMOVEL_EXTENSO: TStringField
      DisplayLabel = 'Imóvel'
      DisplayWidth = 18
      FieldName = 'IMOVEL_EXTENSO'
      ReadOnly = True
      Size = 123
    end
    object qryDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Tipo Receita'
      DisplayWidth = 11
      FieldName = 'DESCCUSTORECIMO'
      ReadOnly = True
      Size = 60
    end
    object qryVLRLANCRECEB: TFloatField
      DisplayLabel = 'a Receber'
      DisplayWidth = 9
      FieldName = 'VLRLANCRECEB'
      ReadOnly = True
      DisplayFormat = '#,##0.00;(#,##0.00)'
    end
    object qryVLRMULTA: TFloatField
      DisplayLabel = 'Multa'
      DisplayWidth = 8
      FieldName = 'VLRMULTA'
      DisplayFormat = '#,##0.00;(#,##0.00)'
    end
    object qryVLRJUROS: TFloatField
      DisplayLabel = 'Juros'
      DisplayWidth = 7
      FieldName = 'VLRJUROS'
      DisplayFormat = '#,##0.00;(#,##0.00)'
    end
    object qryVLRCORRECAOMON: TFloatField
      DisplayLabel = 'Correção'
      DisplayWidth = 9
      FieldName = 'VLRCORRECAOMON'
      DisplayFormat = '#,##0.00;(#,##0.00)'
    end
    object qryMESCOMPETENCIA: TFloatField
      DisplayLabel = 'Mês'
      DisplayWidth = 4
      FieldName = 'MESCOMPETENCIA'
      ReadOnly = True
    end
    object qryANOCOMPETENCIA: TFloatField
      DisplayLabel = 'Ano'
      DisplayWidth = 4
      FieldName = 'ANOCOMPETENCIA'
      ReadOnly = True
    end
    object qryDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 9
      FieldName = 'DATAVENCIMENTO'
      ReadOnly = True
    end
    object qryIDLANCIMOVEL: TFloatField
      FieldName = 'IDLANCIMOVEL'
      Visible = False
    end
    object qryIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Visible = False
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object qryVLRLANCOMRECEB: TFloatField
      FieldName = 'VLRLANCOMRECEB'
      Visible = False
    end
    object qryMOEDARECEB: TFloatField
      FieldName = 'MOEDARECEB'
      Visible = False
    end
    object qryFLGTIPOLANCAMENTO: TStringField
      FieldName = 'FLGTIPOLANCAMENTO'
      Visible = False
      Size = 1
    end
    object qryRECPAG: TStringField
      FieldName = 'RECPAG'
      Visible = False
      Size = 1
    end
    object qryDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
      Visible = False
    end
    object qryDATACORRECAO: TDateTimeField
      FieldName = 'DATACORRECAO'
      Visible = False
    end
    object qryFLGMULTACALCULADA: TFloatField
      FieldName = 'FLGMULTACALCULADA'
      Visible = False
    end
    object qryCONDIASTOLERANCIA: TFloatField
      FieldName = 'CONDIASTOLERANCIA'
      Visible = False
    end
    object qryFLGTIPODIATOLERA: TStringField
      FieldName = 'FLGTIPODIATOLERA'
      Visible = False
      Size = 1
    end
    object qryIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
      Visible = False
    end
    object qryCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
      Visible = False
    end
    object qryIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Visible = False
    end
    object qryIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Visible = False
    end
    object qryCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Visible = False
      Size = 3
    end
    object qryCONVLRMULTA: TFloatField
      FieldName = 'CONVLRMULTA'
      Visible = False
    end
    object qryCONMOEDAMULTA: TFloatField
      FieldName = 'CONMOEDAMULTA'
      Visible = False
    end
    object qryCONPERCENTMULTA: TFloatField
      FieldName = 'CONPERCENTMULTA'
      Visible = False
    end
    object qryCONVLRMORA: TFloatField
      FieldName = 'CONVLRMORA'
      Visible = False
    end
    object qryCONMOEDAMORA: TFloatField
      FieldName = 'CONMOEDAMORA'
      Visible = False
    end
    object qryCONINDICEMORA: TFloatField
      FieldName = 'CONINDICEMORA'
      Visible = False
    end
    object qryCONPERCENTMORA: TFloatField
      FieldName = 'CONPERCENTMORA'
      Visible = False
    end
    object qryCONPERMORA: TStringField
      FieldName = 'CONPERMORA'
      Visible = False
      Size = 1
    end
    object qryFLGMORAPROPORC: TFloatField
      FieldName = 'FLGMORAPROPORC'
      Visible = False
    end
    object qryCODALTMULTA: TFloatField
      FieldName = 'CODALTMULTA'
    end
    object qryCODALTJUROS: TFloatField
      FieldName = 'CODALTJUROS'
    end
    object qryCODALTCORRMON: TFloatField
      FieldName = 'CODALTCORRMON'
    end
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 375
    Top = 5
  end
  object qrySaldoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   SUM(DECODE(D.RECPAG, '#39'P'#39','
      
        '       DECODE(L.DEBCRE, '#39'D'#39', L.VALOR * -1, L.VALOR), DECODE(L.DE' +
        'BCRE, '#39'D'#39', L.VALOR, L.VALOR * -1)'
      '      ) ) AS SALDO'
      'FROM'
      '   DOCUMENTO D, LANCTODOCUM L'
      'WHERE'
      '   ( D.CODDOCUMENTO =:DOCUMENTO ) AND'
      '   ( D.CODDOCUMENTO = L.CODDOCUMENTO )')
    ValidateWithMask = True
    Left = 672
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DOCUMENTO'
        ParamType = ptUnknown
      end>
    object qrySaldoDocSALDO: TFloatField
      FieldName = 'SALDO'
    end
  end
  object qryDataUltCorrecao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MAX(L.DATALANCTO) AS DATAULTCORRECAO'
      'FROM'
      '   DOCUMENTO D, LANCTODOCUM L'
      'WHERE'
      '   ( D.CODDOCUMENTO =:DOCUMENTO ) AND'
      '   ('
      '   ( L.OPERACAO <> '#39'5'#39' ) OR ( L.OPERACAO IS NULL )'
      '   ) AND'
      '   ( D.CODDOCUMENTO = L.CODDOCUMENTO )')
    ValidateWithMask = True
    Left = 584
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryDataUltCorrecaoDATAULTCORRECAO: TDateTimeField
      FieldName = 'DATAULTCORRECAO'
      Origin = 'LANCTODOCUM.DATALANCTO'
    end
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCAMENTOSIMOVEL'
      'set'
      '  MOEDARECEB = :MOEDARECEB,'
      '  IDIMOVEL = :IDIMOVEL,'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL,'
      '  IDPESSOA = :IDPESSOA,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  IDTIPOCUSTORECIMO = :IDTIPOCUSTORECIMO,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  DATALANCAMENTO = :DATALANCAMENTO,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  VLRLANCPAGAR = :VLRLANCPAGAR,'
      '  VLRLANCOMPAGAR = :VLRLANCOMPAGAR,'
      '  RECPAG = :RECPAG,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  ANOREFERENCIA = :ANOREFERENCIA,'
      '  MESCOMPETENCIA = :MESCOMPETENCIA,'
      '  ANOCOMPETENCIA = :ANOCOMPETENCIA,'
      '  FLGAGRUPAR = :FLGAGRUPAR,'
      '  FLGAGRUPADO = :FLGAGRUPADO,'
      '  FLGTIPOLANCAMENTO = :FLGTIPOLANCAMENTO,'
      '  MOEDAPAGAR = :MOEDAPAGAR,'
      '  VLRLANCOMRECEB = :VLRLANCOMRECEB,'
      '  VLRLANCRECEB = :VLRLANCRECEB,'
      '  VLRJUROS = :VLRJUROS,'
      '  VLRMULTA = :VLRMULTA,'
      '  VLRCORRECAOMON = :VLRCORRECAOMON,'
      '  DATACORRECAO = :DATACORRECAO,'
      '  FLGMULTACALCULADA = :FLGMULTACALCULADA,'
      '  FLGINTEGRADO = :FLGINTEGRADO,'
      '  IDUSUARIOSISTEMA = :IDUSUARIOSISTEMA,'
      '  FLGESTORNADO = :FLGESTORNADO,'
      '  IDFORCLI = :IDFORCLI,'
      '  FLGORIGEMLANC = :FLGORIGEMLANC,'
      '  NODOCUMENTO = :NODOCUMENTO,'
      '  FLGERRO = :FLGERRO,'
      '  IDRATEIODOCUM = :IDRATEIODOCUM,'
      '  IDDOCUMENTO = :IDDOCUMENTO'
      'where'
      '  IDLANCIMOVEL = :OLD_IDLANCIMOVEL')
    InsertSQL.Strings = (
      'insert into LANCAMENTOSIMOVEL'
      '   ('
      '   IDLANCIMOVEL,'
      '   MOEDARECEB,'
      '   IDIMOVEL,'
      '   IDCONTRATOIMOVEL,'
      '   IDPESSOA,'
      '   PLNCODIGO,'
      '   IDTIPOCUSTORECIMO,'
      '   CODDOCUMENTO,'
      '   DATALANCAMENTO,'
      '   DATAVENCIMENTO,'
      '   VLRLANCPAGAR,'
      '   VLRLANCOMPAGAR,'
      '   RECPAG,'
      '   MESREFERENCIA,'
      '   ANOREFERENCIA,'
      '   MESCOMPETENCIA,'
      '   ANOCOMPETENCIA,'
      '   FLGAGRUPAR,'
      '   FLGAGRUPADO,'
      '   FLGTIPOLANCAMENTO,'
      '   MOEDAPAGAR,'
      '   VLRLANCOMRECEB,'
      '   VLRLANCRECEB,'
      '   VLRJUROS,'
      '   VLRMULTA,'
      '   VLRCORRECAOMON,'
      '   DATACORRECAO,'
      '   FLGMULTACALCULADA,'
      '   FLGINTEGRADO,'
      '   IDUSUARIOSISTEMA,'
      '   FLGESTORNADO,'
      '   IDFORCLI,'
      '   FLGORIGEMLANC,'
      '   NODOCUMENTO,'
      '   FLGERRO,'
      '   IDRATEIODOCUM,'
      '   IDDOCUMENTO)'
      ''
      'values'
      '   ('
      '   :IDLANCIMOVEL,'
      '   :MOEDARECEB,'
      '   :IDIMOVEL,'
      '   :IDCONTRATOIMOVEL,'
      '   :IDPESSOA,'
      '   :PLNCODIGO,'
      '   :IDTIPOCUSTORECIMO,'
      '   :CODDOCUMENTO,'
      '   :DATALANCAMENTO,'
      '   :DATAVENCIMENTO,'
      '   :VLRLANCPAGAR,'
      '   :VLRLANCOMPAGAR,'
      '   :RECPAG,'
      '   :MESREFERENCIA,'
      '   :ANOREFERENCIA,'
      '   :MESCOMPETENCIA,'
      '   :ANOCOMPETENCIA,'
      '   :FLGAGRUPAR,'
      '   :FLGAGRUPADO,'
      '   :FLGTIPOLANCAMENTO,'
      '   :MOEDAPAGAR,'
      '   :VLRLANCOMRECEB,'
      '   :VLRLANCRECEB,'
      '   :VLRJUROS,'
      '   :VLRMULTA,'
      '   :VLRCORRECAOMON,'
      '   :DATACORRECAO,'
      '   :FLGMULTACALCULADA,'
      '   :FLGINTEGRADO,'
      '   :IDUSUARIOSISTEMA,'
      '   :FLGESTORNADO,'
      '   :IDFORCLI,'
      '   :FLGORIGEMLANC,'
      '   :NODOCUMENTO,'
      '   :FLGERRO,'
      '   :IDRATEIODOCUM,'
      '   :IDDOCUMENTO'
      '   )')
    DeleteSQL.Strings = (
      'delete from LANCAMENTOSIMOVEL'
      'where'
      '  IDLANCIMOVEL = :OLD_IDLANCIMOVEL')
    Left = 311
    Top = 5
  end
  object qryAlteradoresLanc: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT'
      '   LD.CODDOCUMENTO, LD.NUMLANCTO,'
      '   LD.CODALTERADOR, LD.PLNCODIGO,'
      '   LD.DATALANCTO, LD.VALOR, LD.VALOROUTRAMOEDA,'
      '   LD.DEBCRE, LD.OPERACAO, LD.HISTORICOCOMPL,'
      ''
      '   A.DESCRICAO,'
      ''
      '   D.NODOCUMENTO'
      ''
      'FROM'
      '   LANCTODOCUM LD, TIPOALTERADOR A, DOCUMENTO D'
      ''
      'WHERE'
      '   ( LD.CODDOCUMENTO =:CODDOCUMENTO )'
      '   AND ( RTRIM(LD.OPERACAO) = '#39'4'#39' )'
      '   AND ( LD.CODALTERADOR = A.CODALTERADOR )'
      '   AND ( LD.CODDOCUMENTO = D.CODDOCUMENTO )'
      ''
      'ORDER BY'
      '   LD.DATALANCTO, A.DESCRICAO')
    ValidateWithMask = True
    Left = 209
    Top = 277
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryAlteradoresLancDATALANCTO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 11
      FieldName = 'DATALANCTO'
    end
    object qryAlteradoresLancDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 19
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryAlteradoresLancHISTORICOCOMPL: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 19
      FieldName = 'HISTORICOCOMPL'
      ReadOnly = True
      Size = 60
    end
    object qryAlteradoresLancVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 13
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00;(#,##0.00)'
    end
    object qryAlteradoresLancCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object qryAlteradoresLancNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Visible = False
    end
    object qryAlteradoresLancCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Visible = False
    end
    object qryAlteradoresLancPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryAlteradoresLancVALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
      Visible = False
    end
    object qryAlteradoresLancDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Visible = False
      Size = 1
    end
    object qryAlteradoresLancOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Visible = False
      Size = 2
    end
    object qryAlteradoresLancNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
      Visible = False
    end
  end
  object dsAlterador: TwwDataSource
    DataSet = qryAlteradoresLanc
    Left = 289
    Top = 277
  end
  object qryDataIni: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   D.CODDOCUMENTO, MAX(LD.DATALANCTO) AS DATALANCTO'
      ''
      'FROM'
      '   LANCTODOCUM LD, DOCUMENTO D, VWLANCAMENTO V'
      ''
      'WHERE'
      '   ( LD.CODDOCUMENTO =:PCODDOCUMENTO )'
      '   AND ( RTRIM(LD.OPERACAO) = '#39'4'#39' )'
      '   AND ( LD.CODDOCUMENTO = D.CODDOCUMENTO )'
      '   AND ( D.CODDOCUMENTO  = V.CODDOCUMENTO )'
      '   AND ( ( LD.CODALTERADOR = V.CODALTJUROS ) OR'
      '         ( LD.CODALTERADOR = V.CODALTMULTA ) OR'
      '         ( LD.CODALTERADOR = V.CODALTCORRMON ) )'
      ''
      'GROUP BY'
      '   D.CODDOCUMENTO')
    ValidateWithMask = True
    Left = 393
    Top = 277
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryDataIniCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryDataIniDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
    end
  end
  object qryMultaCalculada: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   D.CODDOCUMENTO'
      ''
      'FROM'
      '   LANCTODOCUM LD, DOCUMENTO D, VWLANCAMENTO V'
      ''
      'WHERE'
      '   ( LD.CODDOCUMENTO =:PCODDOCUMENTO )'
      '   AND ( RTRIM(LD.OPERACAO) = '#39'4'#39' )'
      '   AND ( LD.CODDOCUMENTO = D.CODDOCUMENTO )'
      '   AND ( D.CODDOCUMENTO  = V.CODDOCUMENTO )'
      '   AND ( LD.CODALTERADOR = V.CODALTMULTA )')
    ValidateWithMask = True
    Left = 465
    Top = 277
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
end
