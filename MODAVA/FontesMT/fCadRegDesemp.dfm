inherited frmCadRegDesemp: TfrmCadRegDesemp
  Left = 276
  Top = 108
  HelpContext = 700009
  Caption = 'Registro de Avaliação de Desempenho'
  ClientWidth = 604
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 604
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 600
      Height = 38
      object Label1: TLabel
        Left = 12
        Top = 9
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        FocusControl = dbedMatricula
      end
      object Label10: TLabel
        Left = 178
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Nome'
        FocusControl = dbedMatricula
      end
      object dbedMatricula: TDBEdit
        Left = 75
        Top = 6
        Width = 90
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
        Left = 215
        Top = 6
        Width = 367
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
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 2
      Top = 40
      Width = 600
      Height = 318
      Tabs.Strings = (
        'Dados Gerais'
        'Fatores e Pontos'
        'Fortes e Fracos'
        'Metas e Medidas'
        'Resumo e Comentários')
      detdbGrids.Strings = (
        ''
        'dbgrdDet'
        ''
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 502
        Height = 259
        object tbshGerais: TTabSheet [0]
          Caption = 'tbshGerais'
          object Label2: TLabel
            Left = 58
            Top = 93
            Width = 104
            Height = 13
            Caption = 'Tipo de Avaliação'
          end
          object Label3: TLabel
            Left = 58
            Top = 150
            Width = 88
            Height = 13
            Caption = 'Data Planejada'
          end
          object Label4: TLabel
            Left = 177
            Top = 150
            Width = 58
            Height = 13
            Caption = 'Data Real'
          end
          object Label5: TLabel
            Left = 330
            Top = 150
            Width = 57
            Height = 13
            Caption = 'Avaliação'
            FocusControl = dbedAvaliacao
          end
          object gbxAvaliador: TGroupBox
            Left = 58
            Top = 32
            Width = 447
            Height = 49
            Caption = 'Avaliador'
            TabOrder = 0
            object dbedAvaliador: TDBEdit
              Left = 8
              Top = 17
              Width = 398
              Height = 21
              DataField = 'AVALIADOR'
              DataSource = ds
              MaxLength = 20
              TabOrder = 0
            end
            object bbtnBuscarEmpregado: TBitBtn
              Left = 410
              Top = 15
              Width = 30
              Height = 25
              Hint = 'Busca Empregado como Avaliador'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = bbtnBuscarEmpregadoClick
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
          end
          object dblckTipoEntr: TwwDBLookupCombo
            Left = 58
            Top = 107
            Width = 447
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRTIPOAVAL'#9'30'#9'DESCRTIPOAVAL')
            DataField = 'CODTIPOAVAL'
            DataSource = ds
            LookupTable = CdsTipoAval
            LookupField = 'CODTIPOAVAL'
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
            OnChange = dblckTipoEntrChange
          end
          object dbedDatPlan: TCMDateTimePicker
            Left = 58
            Top = 164
            Width = 100
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAPLAN'
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
          object dbedDatReal: TCMDateTimePicker
            Left = 177
            Top = 164
            Width = 100
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAREAL'
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
            TabOrder = 3
          end
          object dbedAvaliacao: TDBEdit
            Left = 330
            Top = 164
            Width = 84
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'AVALIACAO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          OnShow = tbsDetShow
          inherited pnlControlesDet: TPanel
            Width = 494
            Height = 231
            object Label6: TLabel
              Left = 42
              Top = 51
              Width = 108
              Height = 13
              Caption = 'Fator de Avaliação'
            end
            object Label7: TLabel
              Left = 42
              Top = 114
              Width = 84
              Height = 13
              Caption = 'Grau Atribuído'
            end
            object Label18: TLabel
              Left = 201
              Top = 114
              Width = 80
              Height = 13
              Caption = 'Peso do Fator'
              FocusControl = dbedPeso
            end
            object Label19: TLabel
              Left = 357
              Top = 114
              Width = 88
              Height = 13
              Caption = 'Nota Calculada'
              FocusControl = dbedNota
            end
            object dblckFator: TwwDBLookupCombo
              Left = 42
              Top = 65
              Width = 405
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRFATORAVAL'#9'30'#9'DESCRFATORAVAL')
              DataField = 'IDFATORAVAL'
              DataSource = dsDet
              LookupTable = CdsFator
              LookupField = 'IDFATORAVAL'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dbedPeso: TDBEdit
              Left = 202
              Top = 128
              Width = 85
              Height = 21
              TabStop = False
              Color = clGray
              DataField = 'PESO'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MaxLength = 20
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object dbedNota: TDBEdit
              Left = 358
              Top = 128
              Width = 88
              Height = 21
              TabStop = False
              Color = clGray
              DataField = 'NOTA'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MaxLength = 20
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object rdbedGrau: TDBRealEdit
              Left = 42
              Top = 128
              Width = 82
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 3
              WordWrap = False
              OnChange = rdbedGrauChange
              IntDigits = 3
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'GRAU'
              DataSource = dsDet
            end
            object bbtnDica: TBitBtn
              Left = 231
              Top = 35
              Width = 28
              Height = 22
              Hint = 'Visualizar a Observação do Fator de Avaliação'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = bbtnDicaClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
                333333333337FF3333333333330003333333333333777F333333333333080333
                3333333F33777FF33F3333B33B000B33B3333373F777773F7333333BBB0B0BBB
                33333337737F7F77F333333BBB0F0BBB33333337337373F73F3333BBB0F7F0BB
                B333337F3737F73F7F3333BB0FB7BF0BB3333F737F37F37F73FFBBBB0BF7FB0B
                BBB3773F7F37337F377333BB0FBFBF0BB333337F73F333737F3333BBB0FBF0BB
                B3333373F73FF7337333333BBB000BBB33333337FF777337F333333BBBBBBBBB
                3333333773FF3F773F3333B33BBBBB33B33333733773773373333333333B3333
                333333333337F33333333333333B333333333333333733333333}
              Layout = blGlyphTop
              Margin = 0
              NumGlyphs = 2
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 494
            Height = 231
            ControlType.Strings = (
              'OBSFATORAVAL;Bitmap;Original Size;Source Copy')
            Selected.Strings = (
              'DESCRFATORAVAL'#9'40'#9'Fator de Avaliação'#9'T'
              'GRAU'#9'10'#9'Grau Atribuído'#9'F'
              'PESO'#9'10'#9'Peso'#9'T'
              'NOTA'#9'10'#9'Nota'#9'T')
            MemoAttributes = [mSizeable, mWordWrap, mGridShow]
            KeyOptions = [dgAllowDelete]
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TitleButtons = True
            OnDblClick = nil
          end
        end
        object tbshFortes: TTabSheet
          Caption = 'tbshFortes'
          object Label9: TLabel
            Left = 8
            Top = 5
            Width = 79
            Height = 13
            Caption = 'Pontos Fortes'
            FocusControl = dbrcedFortes
          end
          object Label11: TLabel
            Left = 8
            Top = 94
            Width = 82
            Height = 13
            Caption = 'Pontos Fracos'
            FocusControl = dbrcedFracos
          end
          object Label12: TLabel
            Left = 8
            Top = 183
            Width = 120
            Height = 13
            Caption = 'Principais Limitações'
            FocusControl = dbrcedLimites
          end
          object dbrcedFortes: TDBRichEdit
            Left = 8
            Top = 20
            Width = 562
            Height = 69
            DataField = 'FORTES'
            DataSource = ds
            PlainText = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object dbrcedFracos: TDBRichEdit
            Left = 8
            Top = 109
            Width = 562
            Height = 69
            DataField = 'FRACOS'
            DataSource = ds
            PlainText = True
            ScrollBars = ssVertical
            TabOrder = 1
          end
          object dbrcedLimites: TDBRichEdit
            Left = 8
            Top = 198
            Width = 562
            Height = 69
            DataField = 'LIMITACOES'
            DataSource = ds
            PlainText = True
            ScrollBars = ssVertical
            TabOrder = 2
          end
        end
        object tbshMetas: TTabSheet
          Caption = 'tbshMetas'
          object Label16: TLabel
            Left = 8
            Top = 5
            Width = 173
            Height = 13
            Caption = 'Metas Para o Próximo Período'
          end
          object Label17: TLabel
            Left = 8
            Top = 140
            Width = 139
            Height = 13
            Caption = 'Medidas Recomendadas'
          end
          object spbtnRegIndivPessoa: TSpeedButton
            Left = 172
            Top = 124
            Width = 28
            Height = 28
            Hint = 'Registro Individual de Treinamento'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
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
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = spbtnRegIndivPessoaClick
          end
          object dbrcedMedidas: TDBRichEdit
            Left = 8
            Top = 155
            Width = 562
            Height = 89
            DataField = 'MEDIDAS'
            DataSource = ds
            PlainText = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object dbrcedMetas: TDBRichEdit
            Left = 8
            Top = 20
            Width = 562
            Height = 101
            DataField = 'METAS'
            DataSource = ds
            PlainText = True
            ScrollBars = ssVertical
            TabOrder = 1
          end
        end
        object tbshResumo: TTabSheet
          Caption = 'tbshResumo'
          object Label13: TLabel
            Left = 8
            Top = 5
            Width = 124
            Height = 13
            Caption = 'Resumo da Avaliação'
            FocusControl = dbrcedResumo
          end
          object Label15: TLabel
            Left = 8
            Top = 94
            Width = 145
            Height = 13
            Caption = 'Comentários do Avaliador'
            FocusControl = dbrcedObs1
          end
          object Label14: TLabel
            Left = 8
            Top = 183
            Width = 141
            Height = 13
            Caption = 'Comentários do Avaliado'
            FocusControl = dbrcedObs1
          end
          object dbrcedResumo: TDBRichEdit
            Left = 8
            Top = 20
            Width = 562
            Height = 69
            DataField = 'RESUMO'
            DataSource = ds
            PlainText = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object dbrcedObs1: TDBRichEdit
            Left = 8
            Top = 109
            Width = 562
            Height = 69
            DataField = 'OBSERVAVAL'
            DataSource = ds
            PlainText = True
            ScrollBars = ssVertical
            TabOrder = 1
          end
          object dbrcedObs2: TDBRichEdit
            Left = 8
            Top = 198
            Width = 562
            Height = 69
            DataField = 'COMENT'
            DataSource = ds
            PlainText = True
            ScrollBars = ssVertical
            TabOrder = 2
          end
        end
      end
      inherited Dock973: TDock97
        Width = 592
        object Btndica2: TBitBtn
          Left = 284
          Top = 4
          Width = 28
          Height = 22
          Hint = 'Visualizar a Observação do Fator de Avaliação'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Visible = False
          OnClick = bbtnDicaClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
            333333333337FF3333333333330003333333333333777F333333333333080333
            3333333F33777FF33F3333B33B000B33B3333373F777773F7333333BBB0B0BBB
            33333337737F7F77F333333BBB0F0BBB33333337337373F73F3333BBB0F7F0BB
            B333337F3737F73F7F3333BB0FB7BF0BB3333F737F37F37F73FFBBBB0BF7FB0B
            BBB3773F7F37337F377333BB0FBFBF0BB333337F73F333737F3333BBB0FBF0BB
            B3333373F73FF7337333333BBB000BBB33333337FF777337F333333BBBBBBBBB
            3333333773FF3F773F3333B33BBBBB33B33333733773773373333333333B3333
            333333333337F33333333333333B333333333333333733333333}
          Layout = blGlyphTop
          Margin = 0
          NumGlyphs = 2
        end
      end
      inherited Dock974: TDock97
        Left = 506
        Height = 259
      end
    end
  end
  inherited Dock972: TDock97
    Width = 604
  end
  inherited Dock971: TDock97
    Width = 604
    inherited tb97Fundo: TToolbar97
      Left = 432
      DockPos = 444
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 263
      DockPos = 275
    end
  end
  object townDica: TToolWindow97 [3]
    Left = 114
    Top = 411
    Caption = 'Observação'
    CloseButton = False
    ClientAreaHeight = 146
    ClientAreaWidth = 577
    Resizable = False
    TabOrder = 3
    Visible = False
    object btnFecharDica: TBitBtn
      Left = 239
      Top = 113
      Width = 99
      Height = 30
      Caption = ' &Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnFecharDicaClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000007
        7777777700919190077777789919191910777789919191919107778918F919F8
        190778919FFF9FFF9190789919FFFFF919107891919FFF919190789919FFFFF9
        191078919FFF9FFF9190778918F919F819077789919191919107777899191919
        1077777788999998877777777788888777777777777777777777}
      Spacing = 2
    end
    object dbmemOBS: TDBMemo
      Left = 5
      Top = 1
      Width = 565
      Height = 104
      DataField = 'OBSFATORAVAL'
      DataSource = dsFator
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
      WantTabs = True
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        'TDBRichEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 562
    Top = 242
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 526
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    AutoCalcFields = False
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Registro de Avaliação de Desempenho'
    Colunas.Strings = (
      'upper(PESSOA.NOME)'
      'FUNCIONARIO.MATRICULA'
      'TIPOAVAL.DESCRTIPOAVAL'
      'HSTAVAL.DATAPLAN'
      'HSTAVAL.DATAREAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'D'
      'D')
    Descricao.Strings = (
      'Nome'
      'Matrícula'
      'Tipo de Avaliação'
      'Data Planejada'
      'Data Real')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'TIPOAVAL'
      'HSTAVAL')
    CamposChave.Strings = (
      'HSTAVAL.IDPESSOA'
      'HSTAVAL.CODTIPOAVAL'
      'HSTAVAL.NUMSEQ')
    Filtro.Strings = (
      'HSTAVAL.IDPESSOA        = PESSOA.IDPESSOA'
      'HSTAVAL.IDPESSOA        = FUNCIONARIO.IDPESSOA'
      'HSTAVAL.CODTIPOAVAL = TIPOAVAL.CODTIPOAVAL'
      'TIPOAVAL.FLGTIPOAVAL < 2')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '40'
      '15'
      '15')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    Left = 424
    Top = 28
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 550
    Top = 49
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 351
    Top = 1
  end
  object MontaSelectFunc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Empregado'
    Colunas.Strings = (
      'PESSOA.NOME'
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
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FUNCIONARIO'
      'EMPRESAPROP'
      'PESSOA '
      'CARGO')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.IDPESSOA'
      'FUNCIONARIO.MATRICULA'
      'CARGO.CODGRPFUNC')
    Filtro.Strings = (
      'FUNCIONARIO.IDEMPRESA = EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDCARGO = CARGO.IDCARGO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40'
      '60')
    OperComparador.Strings = (
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
    Left = 448
    Top = 65534
  end
  object CdsDet: TCMClientDataSet
    Active = True
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 315
    Top = 1
    Data = {
      ED0000009619E0BD010000001800000009000000000003000000ED0008494450
      4553534F4108000400000000000B434F445449504F4156414C08000400000000
      000B49444641544F524156414C0800040000000000064E554D53455108000400
      00000000044752415508000400000000000E44455343524641544F524156414C
      0100490000000100055749445448020002003C000C4F42534641544F52415641
      4C04004B00000002000753554254595045020049000500546578740005574944
      5448020002000100045045534F0800040000000000044E4F5441080004000000
      00000100044C4349440400010009080000}
    object CdsDetDESCRFATORAVAL: TStringField
      DisplayLabel = 'Fator de Avaliação'
      DisplayWidth = 40
      FieldName = 'DESCRFATORAVAL'
      Size = 60
    end
    object CdsDetGRAU: TFloatField
      DisplayLabel = 'Grau Atribuído'
      DisplayWidth = 10
      FieldName = 'GRAU'
      OnChange = CdsDetGRAUChange
    end
    object CdsDetPESO: TFloatField
      DisplayLabel = 'Peso'
      DisplayWidth = 10
      FieldName = 'PESO'
    end
    object CdsDetNOTA: TFloatField
      DisplayLabel = 'Nota'
      DisplayWidth = 10
      FieldName = 'NOTA'
    end
    object CdsDetOBSFATORAVAL: TMemoField
      DisplayWidth = 10
      FieldName = 'OBSFATORAVAL'
      Visible = False
      BlobType = ftMemo
      Size = 1
    end
    object CdsDetIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object CdsDetCODTIPOAVAL: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPOAVAL'
      Visible = False
    end
    object CdsDetIDFATORAVAL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFATORAVAL'
      Visible = False
    end
    object CdsDetNUMSEQ: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMSEQ'
      Visible = False
    end
  end
  object CdsTipoAval: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 474
    Top = 278
  end
  object CdsFator: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 538
    Top = 313
  end
  object MontaSelectAvaliador: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Empregado Avaliador'
    Colunas.Strings = (
      'PESSOA.NOME'
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
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FUNCIONARIO'
      'EMPRESAPROP'
      'PESSOA '
      'CARGO')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA'
      'EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDEMPRESA = EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDCARGO = CARGO.IDCARGO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40'
      '60')
    OperComparador.Strings = (
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
    Left = 480
    Top = 9
  end
  object dsFator: TwwDataSource
    DataSet = CdsFator
    OnStateChange = dsStateChange
    Left = 478
    Top = 321
  end
  object CMSqldet: TCMSqlParams
    SQL.Strings = (
      ' SELECT'
      
        '  H.IDPESSOA, H.CODTIPOAVAL, H.IDFATORAVAL, H.NUMSEQ, H.GRAU, FA' +
        '.DESCRFATORAVAL, FA.OBSFATORAVAL, '
      
        '  NVL(PG.PESO,0) AS PESO, ROUND(NVL(PG.PESO,0) * H.GRAU,0) AS NO' +
        'TA'
      'FROM'
      '  HSTDESEMP H, FATORAVAL FA,'
      '  (SELECT IDFATORAVAL, PESO'
      '   FROM   PESOFATGRP'
      '   WHERE  (CODGRPFUNC = '#39#39')) PG'
      'WHERE'
      '  (H.IDPESSOA    = -1) AND'
      '  (H.CODTIPOAVAL = 1) AND'
      '  (H.NUMSEQ      = 1) AND'
      '  (H.IDFATORAVAL = FA.IDFATORAVAL(+)) AND'
      '  (H.IDFATORAVAL = PG.IDFATORAVAL(+))'
      'ORDER BY'
      '  UPPER(FA.DESCRFATORAVAL)')
    ClientDataSet = CdsDet
    Left = 517
    Top = 238
  end
end
