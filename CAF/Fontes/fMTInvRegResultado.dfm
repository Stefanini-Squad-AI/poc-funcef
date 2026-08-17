inherited frmMTInvRegResultado: TfrmMTInvRegResultado
  Left = 267
  Top = 159
  Caption = 'Resultado de Levantamento de Inventário'
  ClientHeight = 444
  ClientWidth = 775
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 35
    Width = 775
    Height = 370
    inherited pnlMestre: TPanel
      Width = 773
      Height = 52
      object GroupBox1: TGroupBox
        Left = 528
        Top = 8
        Width = 224
        Height = 41
        TabOrder = 0
        object edDataFim: TCMDateTimePicker
          Left = 112
          Top = 13
          Width = 105
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAFIMLEVANT'
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
        object ckbEncerrado: TDBCheckBox
          Left = 8
          Top = 16
          Width = 97
          Height = 17
          Caption = 'Encerrado em'
          DataField = 'STATUS'
          DataSource = ds
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object pnlInventario: TPanel
        Left = 0
        Top = 0
        Width = 523
        Height = 49
        BevelOuter = bvNone
        TabOrder = 1
        object Label1: TLabel
          Left = 16
          Top = 8
          Width = 99
          Height = 13
          Caption = 'Levantamento Nº'
        end
        object Label3: TLabel
          Left = 152
          Top = 8
          Width = 65
          Height = 13
          Caption = 'Data Início'
        end
        object Label2: TLabel
          Left = 272
          Top = 8
          Width = 74
          Height = 13
          Caption = 'Responsável'
        end
        object dbeIdInventario: TwwDBEdit
          Left = 16
          Top = 24
          Width = 129
          Height = 21
          DataField = 'IDINVENTARIOBENS'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeDataInicio: TCMDateTimePicker
          Left = 152
          Top = 24
          Width = 113
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAINILEVANT'
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
        object dbeResponsavel: TwwDBEdit
          Left = 272
          Top = 24
          Width = 246
          Height = 21
          DataField = 'NOMERESPONSAVEL'
          DataSource = ds
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 53
      Width = 773
      Height = 316
      Tabs.Strings = (
        'Bens')
      inherited pgctrlDetalhe: TPageControl
        Width = 675
        Height = 257
        inherited tbsDet: TTabSheet
          Caption = 'Bens'
          inherited pnlControlesDet: TPanel
            Width = 667
            Height = 229
            object Label7: TLabel
              Left = 8
              Top = 8
              Width = 58
              Height = 13
              Caption = 'Resultado'
            end
            object Label6: TLabel
              Left = 8
              Top = 56
              Width = 103
              Height = 13
              Caption = 'Nova Localização'
            end
            object Label5: TLabel
              Left = 8
              Top = 152
              Width = 79
              Height = 13
              Caption = 'Estado Físico'
            end
            object Label8: TLabel
              Left = 8
              Top = 104
              Width = 85
              Height = 13
              Caption = 'Novo Conjunto'
            end
            object cmbFlgPlaca: TComboBox
              Left = 8
              Top = 24
              Width = 155
              Height = 21
              ItemHeight = 13
              TabOrder = 0
              OnChange = cmbFlgPlacaChange
              OnEnter = cmbFlgPlacaEnter
              OnExit = cmbFlgPlacaExit
              Items.Strings = (
                'Placa sem Resultado'
                'Placa Ok'
                'Placa não Encontrada'
                'Placa em Outro Local'
                'Placa de Outro Local'
                'Placa não Cadastrada')
            end
            object dbeSelLocal: TwwDBEdit
              Left = 8
              Top = 72
              Width = 624
              Height = 21
              DataField = 'NOME'
              DataSource = dsLocal
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object bbtnSelLocal: TBitBtn
              Left = 632
              Top = 72
              Width = 21
              Height = 21
              TabOrder = 1
              OnClick = bbtnSelLocalClick
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
            object cmbFlgSitFisica: TComboBox
              Left = 8
              Top = 168
              Width = 155
              Height = 21
              ItemHeight = 13
              TabOrder = 4
              Items.Strings = (
                'Bom'
                'Regular'
                'Ruim'
                'Inservível'
                'Obsoleto')
            end
            object dbeConjunto: TwwDBEdit
              Left = 8
              Top = 120
              Width = 603
              Height = 21
              Constraints.MaxWidth = 624
              Constraints.MinWidth = 603
              DataField = 'DESCCONJUNTO'
              DataSource = dsConjunto
              TabOrder = 6
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object bbtnSelConjunto: TBitBtn
              Left = 632
              Top = 120
              Width = 21
              Height = 21
              TabOrder = 3
              OnClick = bbtnSelConjuntoClick
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
            object bbtnGeraConjunto: TBitBtn
              Left = 611
              Top = 120
              Width = 21
              Height = 21
              TabOrder = 2
              OnClick = bbtnGeraConjuntoClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888888888888F88888888888888778888888888888F77F8888888888800F08
                8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
                88888887788888F7F8888887FFFFFCF088888887F88FF7878F888887FFCCCFFF
                08888887FF77788F7F88888B7FFFFFCF088888F77F88FF7878F88B8B7BFCCCFF
                F088878778F77788F78F888B87FFFFFCFF0888F7F7F88FF788788BBBBBFFCCCF
                FFF08777778F777888F7888B887FFFFFF77888F7F878F888F7788B8B8B87FFF7
                78888787F7878FF77888888B8888777888888887888877788888888888888888
                8888888888888888888888888888888888888888888888888888}
              NumGlyphs = 2
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 667
            Height = 229
            Selected.Strings = (
              'PLACA'#9'14'#9'Placa'#9'F'
              'RESULTADO'#9'20'#9'Resultado'
              'DESBEM'#9'70'#9'Descrição'
              'DESCLOCAL'#9'60'#9'Localização Atual'
              'DESCGRUPO'#9'60'#9'Grupo Contábil Atual'
              'DESCCONJUNTO'#9'60'#9'Conjunto Atual')
            TitleAlignment = taCenter
            TitleButtons = True
            OnTitleButtonClick = dbgrdDetTitleButtonClick
          end
        end
      end
      inherited Dock973: TDock97
        Width = 765
        inherited tb97BotoesDetalhe: TToolbar97
          object ToolbarSep972: TToolbarSep97
            Left = 100
            Top = 0
            Blank = True
            SizeHorz = 3
          end
          object btnMarcaOK: TSpeedButton
            Left = 103
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Marca todos os bens sem resultado como OK|'
            AllowAllUp = True
            GroupIndex = 1
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88887666666666088888788888888878F887E668866666
              608887F88FFF888887F887E6FFF8666660888788777FF888878F7E66FFFF8666
              66087F887777FF88887F7E66FFFFF86666087F8877777FF8887F7E66FF8FFF86
              66087F8877F777FF887F7E66FF86FFF866087F8877F8777F887F7E66FF666FF8
              660878F87788877FF87887E6666666FF608887F88888887787F887E666666666
              6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
              8888888778FFFF77888888888777778888888888877777888888}
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Spacing = 0
            OnClick = btnMarcaOKClick
          end
          object bbtnFillNotFound: TSpeedButton
            Left = 153
            Top = 0
            Width = 25
            Height = 25
            Hint = 
              'Preenche todos os bens não localizados com um conjunto/localizaç' +
              'ão específico|'
            AllowAllUp = True
            GroupIndex = 1
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
              000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
              99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
              0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
              FFFF3333337F337F333333333307B70FFFFF33333373FF733F333333333000FF
              0FFF3333333777337FF3333333333FF000FF33FFFFF3333777FF300000333300
              000F377777F33377777F30EEE0333000000037F337F33777777730EEE0333330
              00FF37F337F3333777F330EEE033333000FF37FFF7F3333777F3300000333330
              00FF3777773333F77733333333333000033F3333333337777333}
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Spacing = 0
            OnClick = bbtnFillNotFoundClick
          end
          object bbtnImportar: TToolbarButton97
            Left = 128
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Lê dados gerados por Coletor de Dados|'
            Alignment = taLeftJustify
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888444488
              88888888887777F888888888884CC48888888888887F87F888888888884CC488
              88888888887F87F888888888884CC48888888888887F87FFF8888888444CC444
              8888888877788777F88888884CCCCCC48888888878F888878888888884CCCC48
              888888FFF78F887FFFF88000004CC400008887777778F77777FF777777744777
              7708777777777777777878FFFFFFFFFF87707F8FFFFFFFFFF7F7787777777777
              87707F777777777787F778888888888887707F888888888887F7788888888882
              87707FFFFFFFFFFFF7F77FFFFFFFFFFFF7707777777777777787878888888888
              8870878FFFFFFFFFFFF788777777777777788877777777777778}
            NumGlyphs = 2
            Opaque = False
            OnClick = bbtnImportarClick
          end
          object sbtnProcurarBem: TToolbarButton97
            Left = 75
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Pesquisar'
            AllowAllUp = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
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
            ImageIndex = 3
            Images = ImlPadrao
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnProcurarBemClick
          end
          object bbtnGeraDet: TSpeedButton
            Left = 178
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Carrega o grid com uma seleção de bens|'
            AllowAllUp = True
            GroupIndex = 1
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
              000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
              99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
              0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
              FFFF3FFFFF7F337F333300000307B70FFFFF77777F73FF733F330EEE033000FF
              0FFF7F337FF777337FF30EEE00033FF000FF7F33777F333777FF0EEE0E033300
              000F7FFF7F7FFF77777F00000E00000000007777737773777777330EEE0E0330
              00FF337FFF7F7F3777F33300000E033000FF337777737F3777F333330EEE0330
              00FF33337FFF7FF77733333300000000033F3333777777777333}
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Spacing = 0
            OnClick = bbtnGeraDetClick
          end
        end
      end
      inherited Dock974: TDock97
        Left = 679
        Height = 257
      end
    end
  end
  inherited Dock972: TDock97
    Width = 775
    Height = 35
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 85
        Height = 29
        Enabled = False
        Layout = blGlyphLeft
        Spacing = 4
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 85
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 255
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 170
        Width = 85
        Height = 29
        Enabled = False
        Layout = blGlyphLeft
        Spacing = 4
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 405
    Width = 775
    inherited tb97Fundo: TToolbar97
      Left = 603
      DockPos = 687
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 434
      DockPos = 518
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 290
    Top = 487
  end
  inherited ds: TwwDataSource
    Left = 470
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    ImageType = itMask
    Left = 672
    Top = 503
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 568
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Left = 436
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Selecione o Levantamento'
    Colunas.Strings = (
      'INVENTARIOBENS.IDINVENTARIOBENS'
      'PESSOA.NOME'
      'INVENTARIOBENS.DATAINILEVANT'
      'INVENTARIOBENS.DATAFIMLEVANT')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'D')
    Descricao.Strings = (
      'Nº do Levantamento'
      'Responsável'
      'Data de Início'
      'Data de Término')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INVENTARIOBENS'
      'PESSOA')
    CamposChave.Strings = (
      'INVENTARIOBENS.IDINVENTARIOBENS'
      'INVENTARIOBENS.IDEMPRESA')
    Filtro.Strings = (
      'INVENTARIOBENS.STATUS < 2'
      'INVENTARIOBENS.IDRESPONSAVEL=PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '10'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 384
    Top = 0
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 636
    Top = 65535
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 215
    Top = 222
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 215
    Top = 224
  end
  object sqlDet: TCMSqlParams
    SQL.Strings = (
      'SELECT I.IDINVENTARIOBENS,'
      '       I.IDEMPRESA,'
      '       I.IIBPLACA,'
      '       I.IIBIDBEM,'
      '       I.IIBFLGPLACA,'
      '       I.IIBLOCALATUAL,'
      '       I.IIBCONJUNTOATUAL,'
      '       I.IIBLOCALNOVO,'
      '       I.IIBCONJUNTONOVO,'
      '       I.IIBFLGSITFISICA,'
      '       B.PLACA,'
      
        '       DECODE(B.DESBEM,NULL,'#39'PLACA NÃO CADASTRADA'#39',B.DESBEM) AS ' +
        'DESBEM,'
      '       B.IDBEM,'
      '       B.IDPESSOA,'
      '       C.IDCONJUNTO,'
      '       C.DESCCONJUNTO,'
      '       L.IDLOCALIZACAO,'
      '       L.NOME AS DESCLOCAL,'
      '       G.NOME AS DESCGRUPO,'
      '       CB.IDCLASSEBEM,'
      '       CB.CODHIERARQ,'
      '       CB.DESCRICAO AS DESCCLASSE,'
      '       ('#39'                    '#39') AS RESULTADO'
      'FROM ITENSINVBENS I,'
      '     BEM B,'
      '     CONJUNTO C,'
      '     LOCALIZACAO L,'
      '     CLASSEDEBEM CB,'
      '     GRUPO G'
      'WHERE I.IDINVENTARIOBENS = -1'
      '  AND I.IDEMPRESA = -1'
      '  AND I.IIBIDBEM = B.IDBEM'
      '  AND I.IDEMPRESA = B.IDPESSOA'
      '  AND B.IDCLASSEBEM = CB.IDCLASSEBEM'
      '  AND B.IDPESSOA = C.IDPESSOA'
      '  AND B.IDGRUPO = G.IDGRUPO'
      '  AND B.IDCONJUNTO = C.IDCONJUNTO'
      '  AND C.IDLOCALIZACAO = L.IDLOCALIZACAO'
      '  AND C.IDPESSOA = L.IDPESSOA'
      'ORDER BY C.IDLOCALIZACAO, B.IDCLASSEBEM, B.PLACA'
      ''
      ' ')
    Left = 215
    Top = 226
  end
  object cdsLocal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 464
    Top = 256
  end
  object dsLocal: TwwDataSource
    AutoEdit = False
    DataSet = cdsLocal
    Left = 464
    Top = 242
  end
  object MSLocal: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecione a Localização'
    Colunas.Strings = (
      'LOCALIZACAO.NOME'
      'PESSOA.NOME'
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Localização'
      'Responsável'
      'Código do C Custo'
      'Nome do C Custo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'LOCALIZACAO'
      'PESSOA'
      'CENTCUST')
    CamposChave.Strings = (
      'LOCALIZACAO.IDLOCALIZACAO'
      'LOCALIZACAO.IDPESSOA')
    Filtro.Strings = (
      'LOCALIZACAO.IDRESPONSAVEL = PESSOA.IDPESSOA'
      'LOCALIZACAO.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO'
      'LOCALIZACAO.IDEMPRESA = CENTCUST.IDEMPRESA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '10'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 464
    Top = 229
  end
  object cdsConjunto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 552
    Top = 307
  end
  object dsConjunto: TwwDataSource
    AutoEdit = False
    DataSet = cdsConjunto
    Left = 552
    Top = 293
  end
  object MSConjunto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecione o Conjunto'
    Colunas.Strings = (
      'CONJUNTO.DESCCONJUNTO'
      'LOCALIZACAO.NOME'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Conjunto'
      'Localização'
      'Responsável')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONJUNTO'
      'LOCALIZACAO'
      'PESSOA')
    CamposChave.Strings = (
      'CONJUNTO.IDCONJUNTO')
    Filtro.Strings = (
      'CONJUNTO.IDLOCALIZACAO = LOCALIZACAO.IDLOCALIZACAO'
      'CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA'
      'CONJUNTO.IDRESPONSAVEL = PESSOA.IDPESSOA'
      '1=1')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '200'
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 552
    Top = 280
  end
  object cdsBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 136
  end
  object MSBem: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'BEM.PLACA'
      'BEM.BAIXATOTAL'
      'BEM.DESBEM'
      'CONJUNTO.DESCCONJUNTO'
      'LOCALIZACAO.NOME'
      'PESSOARESP.NOME'
      'PESSOAFORN.NOME'
      'CLASSEDEBEM.DESCRICAO'
      'GRUPO.NOME'
      'BEM.IDNOTA'
      'BEM.DTAINCLUSAO'
      'BEM.VALHISTORICO'
      'BEM.DESBEM'
      'BEM.DESBEM'
      'BEM.NUMSERIE'
      'BEM.PUBAUTOR'
      'BEM.PUBEDITORA'
      'BEM.PUBANO'
      'BEM.CONTROLE'
      'BEM.IDBEM')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Nº de Tombamento'
      'Baixado'
      'Descrição'
      'Conjunto'
      'Localização'
      'Responsável'
      'Fornecedor'
      'Classe'
      'Grupo Contábil'
      'Documento Aquisição'
      'Data de Aquisição'
      'Valor de Aquisição'
      'Marca'
      'Modelo'
      'Nº de Série'
      'Autor'
      'Editora'
      'Ano Publicação'
      'Controle'
      'ID Bem')
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
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'BEM'
      'CONJUNTO'
      'GRUPO'
      'LOCALIZACAO'
      'CLASSEDEBEM'
      'PESSOA PESSOARESP'
      'PESSOA PESSOAFORN'
      'PLANOGRUPO')
    CamposChave.Strings = (
      'BEM.IDPESSOA'
      'BEM.IDBEM'
      'BEM.PLACA'
      'BEM.DESBEM'
      'CONJUNTO.IDLOCALIZACAO'
      'BEM.IDCONJUNTO')
    Filtro.Strings = (
      'BEM.IDCONJUNTO=CONJUNTO.IDCONJUNTO'
      'BEM.IDPESSOA=CONJUNTO.IDPESSOA'
      'CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO'
      'CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA'
      'CONJUNTO.IDRESPONSAVEL=PESSOARESP.IDPESSOA'
      'BEM.IDGRUPO=PLANOGRUPO.IDGRUPO'
      'PLANOGRUPO.IDGRUPO=GRUPO.IDGRUPO'
      'BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM'
      'BEM.IDFORNSERV=PESSOAFORN.IDPESSOA(+)'
      '1=1')
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
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '1'
      '80'
      '100'
      '60'
      '60'
      '60'
      '60'
      '60'
      '18'
      '10'
      '10'
      '40'
      '40'
      '20'
      '60'
      '60'
      '10'
      '1'
      '10')
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
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
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
      '')
    LookupCampoExibe.Strings = (
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
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 351
    Top = 116
  end
  object cdsPlacaIIB: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 436
    Top = 136
  end
  object sqlPlacaIIB: TCMSqlParams
    SQL.Strings = (
      'SELECT IDINVENTARIOBENS'
      'FROM ITENSINVBENS'
      'WHERE IDINVENTARIOBENS = :IDINVENTARIOBENS'
      '  AND IDEMPRESA = :IDEMPRESA'
      '  AND IIBIDBEM= :IDBEM'
      '')
    ClientDataSet = cdsPlacaIIB
    Left = 437
    Top = 117
  end
end
