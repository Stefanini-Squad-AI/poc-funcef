inherited frmCadRegOcorr: TfrmCadRegOcorr
  Left = 87
  Top = 98
  HelpContext = 750006
  Caption = 'Registro de Ocorrências, Testes e Exames'
  ClientHeight = 452
  ClientWidth = 634
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 634
    Height = 366
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 626
      Height = 55
      object Label1: TLabel
        Left = 31
        Top = 9
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        FocusControl = dbedMatricula
      end
      object Label10: TLabel
        Left = 197
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Nome'
        FocusControl = dbedMatricula
      end
      object dbedMatricula: TDBEdit
        Left = 94
        Top = 6
        Width = 84
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbedNome: TDBEdit
        Left = 234
        Top = 6
        Width = 360
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbedSit: TDBEdit
        Left = 30
        Top = 30
        Width = 198
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'DESCRICAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object dbedCargo: TDBEdit
        Left = 234
        Top = 30
        Width = 360
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'TITULO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 59
      Width = 626
      Height = 303
      Tabs.Strings = (
        'Ocorrências'
        'Observações')
      detdbGrids.Strings = (
        'dbgrdDet'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 528
        Height = 244
        inherited tbsDet: TTabSheet
          Caption = 'Ocorrências'
          inherited dbgrdDet: TwwDBGrid
            Width = 520
            Height = 216
            Selected.Strings = (
              'DESCRTIPOOCMED'#9'40'#9'Tipo'
              'DATAPLAN'#9'10'#9'Data Planejada'
              'DATAREAL'#9'10'#9'Data Real'
              'AVALIACAO'#9'10'#9'Avaliação'
              'CODCID'#9'10'#9'CID'
              'EXAMINADOR'#9'40'#9'Examinador')
            Font.Style = []
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel
            Width = 520
            Height = 216
            object Label2: TLabel
              Left = 10
              Top = 0
              Width = 191
              Height = 13
              Caption = 'Tipo de Ocorrência/Teste/Exame'
            end
            object Label3: TLabel
              Left = 301
              Top = 0
              Width = 88
              Height = 13
              Caption = 'Data Planejada'
            end
            object Label4: TLabel
              Left = 413
              Top = 0
              Width = 58
              Height = 13
              Caption = 'Data Real'
            end
            object Label6: TLabel
              Left = 10
              Top = 42
              Width = 22
              Height = 13
              Caption = 'CID'
            end
            object Label5: TLabel
              Left = 337
              Top = 83
              Width = 57
              Height = 13
              Caption = 'Avaliação'
            end
            object lblLicenca: TLabel
              Left = 431
              Top = 83
              Width = 81
              Height = 13
              Caption = 'Licença (dias)'
            end
            object Label9: TLabel
              Left = 10
              Top = 123
              Width = 75
              Height = 13
              Caption = 'Observações'
              FocusControl = dbmObser
            end
            object imgApto: TImage
              Left = 341
              Top = 119
              Width = 19
              Height = 16
              Picture.Data = {
                07544269746D617076010000424D760100000000000076000000280000002000
                0000100000000100040000000000000100000000000000000000100000001000
                0000000000000000800000800000008080008000000080008000808000007F7F
                7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF0033BBBBBBBBBBBB33337777777777777F33BB00BBBBBBBB33337F77333333
                F37F33BB0BBBBBB0BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377
                737F33BBB00BB00BBB33337F377F3773337F33BBBB0B00BBBB33337F337F7733
                337F33BBBB000BBBBB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF
                337F33EE0E80000EEE33337F73F77773337F33EEE0800EEEEE33337F37377F33
                337F33EEEE000EEEEE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3
                337F33EEEEEE00EEEE33337F333377F3337F33EEEEEE00EEEE33337F33337733
                337F33EEEEEEEEEEEE33337FFFFFFFFFFF7F33EEEEEEEEEEEE33337777777777
                7773}
              Visible = False
            end
            object lblAprov: TLabel
              Left = 362
              Top = 119
              Width = 52
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '(Aptidão)'
            end
            object imgInapto: TImage
              Left = 341
              Top = 119
              Width = 19
              Height = 16
              Picture.Data = {
                07544269746D617076010000424D760100000000000076000000280000002000
                0000100000000100040000000000000100000000000000000000100000001000
                0000000000000000800000800000008080008000000080008000808000007F7F
                7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF00333333333333333333333333333333333333333333333333333FF3333333
                3FF333003333333300333377FF33333377FF300003333330000337777FFFFFF7
                777F000000000000000077777777777777770F88FFFF8FFF88F07F333F333333
                33370FFF9FFF8FFFFF707F337FF333FFFFF70FF999FF800000037F3777333777
                77730FFF9FFF088880337F3373337F3337330FFFFFFF088803337FFFFFFF7FFF
                73337000000000003333777777777777F3333333333939993933333333333777
                3333333333333393333333333333337333333333333393339333333333333333
                3333333333333393333333333333333333333333333333333333333333333333
                3333}
              Visible = False
            end
            object Label8: TLabel
              Left = 304
              Top = 37
              Width = 28
              Height = 13
              Caption = 'Hora'
            end
            object dblcTipoEntr: TwwDBLookupCombo
              Left = 10
              Top = 12
              Width = 277
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRTIPOOCMED'#9'40'#9'DESCRTIPOOCMED')
              DataField = 'CODTIPOOCMED'
              DataSource = dsDet
              LookupTable = qryTabOcorr
              LookupField = 'CODTIPOOCMED'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
              OnChange = dblcTipoEntrChange
            end
            object dbedDatPlan: TCMDateTimePicker
              Left = 301
              Top = 12
              Width = 100
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAPLAN'
              DataSource = dsDet
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
            object dbedDatReal: TCMDateTimePicker
              Left = 413
              Top = 12
              Width = 100
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAREAL'
              DataSource = dsDet
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
            object dbmObser: TDBMemo
              Left = 10
              Top = 137
              Width = 508
              Height = 70
              DataField = 'OBSERVACAO'
              DataSource = dsDet
              ScrollBars = ssVertical
              TabOrder = 9
            end
            object gbxExaminador: TGroupBox
              Left = 9
              Top = 81
              Width = 321
              Height = 41
              Caption = 'Examinador (Médico/Entidade)'
              TabOrder = 8
              object bbtnProcMedico: TBitBtn
                Left = 292
                Top = 11
                Width = 25
                Height = 24
                Hint = 'Procura Médico ou Entidade'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = bbtnProcMedicoClick
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
                NumGlyphs = 2
              end
              object dbedAvaliador: TDBEdit
                Left = 5
                Top = 13
                Width = 281
                Height = 21
                DataField = 'EXAMINADOR'
                DataSource = dsDet
                TabOrder = 1
              end
            end
            object dbedCODCID: TDBEdit
              Left = 10
              Top = 57
              Width = 77
              Height = 21
              DataField = 'CODCID'
              DataSource = dsDet
              TabOrder = 5
            end
            object bbtnBuscaCID: TBitBtn
              Left = 483
              Top = 55
              Width = 30
              Height = 25
              Hint = 'Busca o CID'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
              OnClick = bbtnBuscaCIDClick
              Glyph.Data = {
                42020000424D4202000000000000420000002800000010000000100000000100
                1000030000000002000000000000000000000000000000000000007C0000E003
                00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104210421F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F00001F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7F00001F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7FFF7FFF7FFF7F00001F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F00001F7C
                1F7C1F7C1F7C00401F7C1F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F0000
                1F7C1F7C1F7C004000401F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F0000
                1F7C1F7C1F7C0040004000401F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F
                00001F7C1F7C1F7C0040004000400000000000000000FF7FFF7FFF7F1F00FF7F
                FF7F00001F7C1F7C1F7C00400000FF031F7CFF031F7C000010021F00FF7FFF7F
                FF7FFF7F00001F7C1F7C0000FF031F7CFF031F7CFF031F7C0000FF7FFF7FFF7F
                104210421F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF030000FF7F10421042
                1F7C1F7C1F7C1F7C1F7C0000FF031F7CFF031F7CFF031F7C000010421F7C1F7C
                1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF0300001F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF0300001F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C}
            end
            object edCID: TEdit
              Left = 93
              Top = 57
              Width = 385
              Height = 21
              TabStop = False
              Color = clBtnFace
              ReadOnly = True
              TabOrder = 6
            end
            object dbedAvaliacao: TDBRealEdit
              Left = 337
              Top = 96
              Width = 84
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 10
              WordWrap = False
              OnExit = dbedAvaliacaoExit
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'AVALIACAO'
              DataSource = dsDet
            end
            object dbedLicenca: TDBRealEdit
              Left = 431
              Top = 96
              Width = 84
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 11
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'LICENCA'
              DataSource = dsDet
            end
            object pnlAleatorio: TPanel
              Left = 295
              Top = 0
              Width = 225
              Height = 50
              BevelOuter = bvNone
              TabOrder = 4
              object Label11: TLabel
                Left = 6
                Top = 2
                Width = 65
                Height = 13
                Caption = 'Data Início'
              end
              object Label12: TLabel
                Left = 118
                Top = 2
                Width = 77
                Height = 13
                Caption = 'Data Retorno'
              end
              object dtedDataRetorno: TCMDateTimePicker
                Left = 118
                Top = 14
                Width = 100
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
                OnChange = dtedDataRetornoChange
              end
              object dbedDatInicio: TCMDateTimePicker
                Left = 6
                Top = 14
                Width = 100
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAREAL'
                DataSource = dsDet
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
                OnChange = dbedDatInicioChange
              end
            end
            object mskedHora: TMaskEdit
              Left = 351
              Top = 34
              Width = 50
              Height = 21
              EditMask = '!90:00;1;_'
              MaxLength = 5
              TabOrder = 2
              Text = '  :  '
            end
          end
        end
        object tbshObserv: TTabSheet
          Caption = 'Observações'
          object dbmemFortes: TDBMemo
            Left = 38
            Top = 15
            Width = 525
            Height = 178
            DataField = 'OBSERVACAO'
            DataSource = dsDet
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      inherited Dock973: TDock97
        Width = 618
      end
      inherited Dock974: TDock97
        Left = 532
        Height = 244
      end
    end
  end
  inherited Dock972: TDock97
    Width = 634
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Width = 120
        Caption = '&Procurar Empregado'
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
      object sbtnFicha: TToolbarButton97
        Left = 440
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Imprimir a Ficha PCMSO'
        Caption = '&Ficha'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
          555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
          05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
          FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
          FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
          FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
          05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
          555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
          9055575757575757775505050505055505557575757575557555}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = sbtnFichaClick
      end
      object ToolbarSep972: TToolbarSep97
        Left = 420
        Top = 0
        Blank = True
        SizeHorz = 20
        SizeVert = 9
      end
      object sbtnProcurarCand: TToolbarButton97
        Left = 300
        Top = 0
        Width = 120
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Procurar &Candidato'
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
        OnClick = sbtnProcurarClick
      end
      object sbtnCAT: TToolbarButton97
        Left = 500
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Imprimir o CAT - Comunicação De Acidente Do Trabalho'
        Caption = '&CAT'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = sbtnCATClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 413
    Width = 634
    inherited tb97Fundo: TToolbar97
      Left = 464
      DockPos = 472
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 297
      DockPos = 305
    end
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT F.MATRICULA, P.NOME, C.TITULO, S.DESCRICAO, F.IDPESSOA'
      'FROM PESSOA P, FUNCIONARIO F, SITFUNC S, CARGO C'
      'WHERE F.IDPESSOA     = P.IDPESSOA'
      'AND   F.IDCARGO           = C.IDCARGO'
      'AND   F.IDPESSOA          = :IDPESSOA'
      'AND   F.IDSITFUNC         = S.IDSITFUNC')
    Left = 352
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 410
    Top = 82
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 492
    Top = 14
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    Left = 324
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Left = 571
    Top = 38
  end
  object MontaSelectFunc: TMontaSelect [8]
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'upper(PESSOA.NOME)'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo'
      'Empresa')
    Tabelas.Strings = (
      'FUNCIONARIO'
      'EMPRESAPROP'
      'PESSOA '
      'CARGO')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDEMPRESA = EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDCARGO = CARGO.IDCARGO')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 571
    Top = 26
  end
  object qryDet: TwwQuery [9]
    CachedUpdates = True
    AfterInsert = qryDetAfterInsert
    BeforePost = qryDetBeforePost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  H.IDPESSOA, H.CODTIPOOCMED, H.NUMSEQ, H.DATAREAL, H.EXAMINADOR' +
        ','
      '  H.CODCID, H.OBSERVACAO, H.DATAPLAN, H.AVALIACAO, H.LICENCA,'
      '  T.DESCRTIPOOCMED, NVL(DATAREAL,DATAPLAN) AS DATAREF,'
      '  H.IDEXAMINADOR'
      'FROM'
      '  HSTASMED H, TIPOCMED T'
      'WHERE'
      '  (H.IDPESSOA     = :IDPESSOA) AND'
      '  (H.CODTIPOOCMED = T.CODTIPOOCMED)'
      'ORDER BY'
      '  DATAREF DESC')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 371
    Top = 82
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '1546'
      end>
  end
  object updDet: TUpdateSQL [10]
    ModifySQL.Strings = (
      'update HSTASMED'
      'set'
      '  DATAREAL = :DATAREAL,'
      '  EXAMINADOR = :EXAMINADOR,'
      '  CODCID = :CODCID,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  DATAPLAN = :DATAPLAN,'
      '  AVALIACAO = :AVALIACAO,'
      '  LICENCA = :LICENCA,'
      '  IDEXAMINADOR = :IDEXAMINADOR'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  CODTIPOOCMED = :OLD_CODTIPOOCMED and'
      '  NUMSEQ = :OLD_NUMSEQ')
    InsertSQL.Strings = (
      'insert into HSTASMED'
      
        '  (IDPESSOA, CODTIPOOCMED, NUMSEQ, DATAREAL, EXAMINADOR, CODCID,' +
        ' '
      'OBSERVACAO, '
      '   DATAPLAN, AVALIACAO, LICENCA, IDEXAMINADOR)'
      'values'
      '  (:IDPESSOA, :CODTIPOOCMED, :NUMSEQ, :DATAREAL, :EXAMINADOR, '
      ':CODCID, '
      '   :OBSERVACAO, :DATAPLAN, :AVALIACAO, :LICENCA, :IDEXAMINADOR)')
    DeleteSQL.Strings = (
      'delete from HSTASMED'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  CODTIPOOCMED = :OLD_CODTIPOOCMED and'
      '  NUMSEQ = :OLD_NUMSEQ')
    Left = 330
    Top = 82
  end
  object qryTabOcorr: TwwQuery [11]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from TIPOCMED order by DESCRTIPOOCMED')
    ValidateWithMask = True
    Left = 464
    Top = 82
  end
  object MontaSelectCand: TMontaSelect [12]
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'CPF (ou equivalente)'
      'Cargo')
    Tabelas.Strings = (
      'CANDIDAT'
      'PESSOA '
      'CARGO')
    CamposChave.Strings = (
      'CANDIDAT.IDPESSOA')
    Filtro.Strings = (
      'CANDIDAT.IDPESSOA = PESSOA.IDPESSOA'
      'CANDIDAT.IDCARGO = CARGO.IDCARGO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 571
    Top = 13
  end
  inherited ds: TwwDataSource
    Left = 380
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 492
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 422
    Top = 15
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 422
    Top = 1
  end
  object qryUltSeq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(NUMSEQ) as ULTSEQ'
      'from hstasmed'
      'where  IDPESSOA = :IDPESSOA'
      'and  CODTIPOOCMED = :CODTIPOOCMED')
    ValidateWithMask = True
    Left = 520
    Top = 82
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODTIPOOCMED'
        ParamType = ptUnknown
      end>
  end
  object MontaSelectCID: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona CID'
    Colunas.Strings = (
      'CODCID'
      'SUBSTR(DESCRCID,1,100) AS DESCRICAO'
      'DESCRCID')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição Abreviada'
      'Descrição Completa')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CID')
    CamposChave.Strings = (
      'CODCID'
      'DESCRCID')
    Larguras.Strings = (
      '10'
      '100'
      '1000')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 571
    Top = 1
  end
  object qryParamRH: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDRUBFALTA, NORMALINI, FLGNUMERAMATRIC, TAMANHOMATRIC'
      'FROM'
      '  PARAMRH')
    ValidateWithMask = True
    Left = 576
    Top = 82
  end
  object qryCID: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsDet
    SQL.Strings = (
      'Select CODCID, DESCRCID'
      'from CID'
      'where  CODCID = :CODCID')
    ValidateWithMask = True
    Left = 264
    Top = 106
    ParamData = <
      item
        DataType = ftString
        Name = 'CODCID'
        ParamType = ptUnknown
      end>
  end
end
