inherited frmCadBens: TfrmCadBens
  Left = 9
  Top = 109
  HelpContext = 70021
  Caption = 'Cadastro de Bens'
  ClientHeight = 431
  ClientWidth = 775
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 16
    Top = 248
    Width = 38
    Height = 13
    Caption = 'Classe'
  end
  inherited pnlFundo: TPanel
    Width = 775
    Height = 345
    object Label49: TLabel
      Left = 592
      Top = 416
      Width = 65
      Height = 13
      Caption = 'Fornecedor'
    end
    object Label48: TLabel
      Left = 336
      Top = 376
      Width = 48
      Height = 13
      Caption = 'Terceiro'
    end
    object pnlConjunto: TPanel
      Left = 1
      Top = 1
      Width = 773
      Height = 132
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label3: TLabel
        Left = 16
        Top = 8
        Width = 51
        Height = 13
        Caption = 'Conjunto'
      end
      object Label6: TLabel
        Left = 292
        Top = 8
        Width = 98
        Height = 13
        Caption = 'Rateio de Custos'
      end
      object Label4: TLabel
        Left = 16
        Top = 88
        Width = 69
        Height = 13
        Caption = 'Localização'
      end
      object Label5: TLabel
        Left = 392
        Top = 88
        Width = 74
        Height = 13
        Caption = 'Responsável'
      end
      object dbeDescConjunto: TDBMemo
        Left = 16
        Top = 24
        Width = 265
        Height = 57
        DataField = 'DESCCONJUNTO'
        DataSource = dsSelConjunto
        MaxLength = 200
        TabOrder = 0
      end
      object dbgRateio: TwwDBGrid
        Left = 292
        Top = 24
        Width = 459
        Height = 57
        Selected.Strings = (
          'CODCENTROCUSTO'#9'14'#9'Centro de Custo'
          'DESCCCUSTO'#9'40'#9'Descrição'#9'F'
          'PARTICIPACAO'#9'6'#9'(%)')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsRateio
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ReadOnly = True
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
      object dbeDescLocalizacao: TwwDBEdit
        Left = 16
        Top = 104
        Width = 359
        Height = 21
        DataField = 'DESCLOCALIZACAO'
        DataSource = dsSelConjunto
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeNomeResponsavel: TwwDBEdit
        Left = 392
        Top = 104
        Width = 359
        Height = 21
        DataField = 'DESCRESPONSAVEL'
        DataSource = dsSelConjunto
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object pgctlBem: TPageControl
      Left = 5
      Top = 144
      Width = 764
      Height = 196
      ActivePage = TabIdent
      TabOrder = 1
      OnChange = pgctlBemChange
      object TabIdent: TTabSheet
        Caption = 'Identificação do Bem'
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 38
          Height = 13
          Caption = 'Classe'
        end
        object Label7: TLabel
          Left = 8
          Top = 56
          Width = 104
          Height = 13
          Caption = 'Descrição do Bem'
        end
        object Label27: TLabel
          Left = 336
          Top = 8
          Width = 48
          Height = 13
          Caption = 'Controle'
        end
        object Label29: TLabel
          Left = 520
          Top = 8
          Width = 51
          Height = 13
          Caption = 'Situação'
        end
        object pnlLivros: TPanel
          Left = 328
          Top = 48
          Width = 425
          Height = 105
          BevelOuter = bvNone
          TabOrder = 6
          object Label52: TLabel
            Left = 8
            Top = 8
            Width = 31
            Height = 13
            Caption = 'Autor'
          end
          object Label53: TLabel
            Left = 8
            Top = 56
            Width = 41
            Height = 13
            Caption = 'Editora'
          end
          object Ano: TLabel
            Left = 336
            Top = 56
            Width = 23
            Height = 13
            Caption = 'Ano'
          end
          object bbtnRetornaPlaca: TBitBtn
            Left = 395
            Top = 72
            Width = 21
            Height = 21
            Hint = 'Retorna'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = bbtnRetornaPlacaClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333333333333333333333C3333333333333337F3333333333333C0C3333
              333333333777F33333333333C0F0C3333333333377377F333333333C0FFF0C33
              3333333777F377F3333333CCC0FFF0C333333373377F377F33333CCCCC0FFF0C
              333337333377F377F3334CCCCCC0FFF0C3337F3333377F377F33C4CCCCCC0FFF
              0C3377F333F377F377F33C4CC0CCC0FFF0C3377F3733F77F377333C4CCC0CC0F
              0C333377F337F3777733333C4C00CCC0333333377F773337F3333333C4CCCCCC
              3333333377F333F7333333333C4CCCC333333333377F37733333333333C4C333
              3333333333777333333333333333333333333333333333333333}
            NumGlyphs = 2
          end
          object edPubAutor: TEdit
            Left = 8
            Top = 24
            Width = 409
            Height = 21
            TabOrder = 1
          end
          object edPubEditora: TEdit
            Left = 8
            Top = 72
            Width = 313
            Height = 21
            TabOrder = 2
          end
          object edPubAno: TRealEdit
            Left = 336
            Top = 72
            Width = 59
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 3
            WordWrap = False
            IntDigits = 4
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
          end
        end
        object pnlPlaca: TPanel
          Left = 328
          Top = 48
          Width = 425
          Height = 105
          BevelOuter = bvNone
          TabOrder = 5
          object Label43: TLabel
            Left = 8
            Top = 56
            Width = 131
            Height = 13
            Caption = 'Identificação Adicional'
          end
          object Label13: TLabel
            Left = 8
            Top = 8
            Width = 96
            Height = 13
            Caption = 'Nº de Patrimônio'
          end
          object Label28: TLabel
            Left = 192
            Top = 8
            Width = 66
            Height = 13
            Caption = 'Nº de Série'
          end
          object edPlaca: TMaskEdit
            Left = 8
            Top = 24
            Width = 150
            Height = 21
            TabOrder = 0
          end
          object bbtnGeraPlaca: TBitBtn
            Left = 158
            Top = 24
            Width = 20
            Height = 20
            Cursor = crHandPoint
            Hint = 
              'Gera um número de Patrimônio baseado nos parâmetros iniciais do ' +
              'sistema'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = bbtnGeraPlacaClick
            Glyph.Data = {
              36060000424D3606000000000000360400002800000020000000100000000100
              0800000000000002000000000000000000000001000000010000000000000000
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
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F7A400A4A4A4
              00F7F7F7F7F7F7F7F700F7F7A4FFF7FFA4FFF7F7F7F7F7FFF7A407A400A40000
              00F7F7F7F7A400A4F700F7FFA4F7A4A4F6F7F7F7F7F7A4F7FFA40000A4A400F7
              F7F7F7F7F700A4000000A4A4F7F7A4FFF7F7F7F7F7A4F7A4A4A40707A40000F7
              F7F7F7F7F7A40000A4A4F7F7FFA4A4F7FFF7F7F7F7F7A4A4F7F7A4000000A400
              F7F7F7F7F7F700A4A400F7A4A4A4F7A4F7F7F7F7F7FFA4FFF7A4A400F7A400A4
              F7F7F7F70000000700A4F7A4FFF7A4F7F7F7F7F7A4A4A4F7A4FF0000F7F7F7F7
              F7F7F7F700A4A4070007A4A4F7F7FFFFFFF7F7F7A4FFFFFFA4FFF7F7F7000000
              F7F7F7F70000000700A4F7FFF7A4A4A4FFF7F7FFA4A4A4FFA4F700A4F700A400
              F7A400A4F7F700A40700A4F7FFA4FFA4FFFFA4F7FFF7A4FFFFA4A4000000A400
              0000A400F7A40000A407F7A4A4A4F7A4A4A4FFA4F7F7A4A4FFFF0000A4A4A4A4
              A40000A4F700A4000000A4A4F7F7FFFFFFA4A4FFF7A4F7A4A4A400A4A4000000
              A4A400F7F7A400A4F700A4FFF7A4A4A4F7FFA4FFFFFFA4F7F7A4000700A4A4A4
              00A4000000F7F7F7F700A4F7A4FFF7FFA4FFA4A4A4FFF7F7F7A4A407000700A4
              00A4A4A400F7F7F7F7F7F7FFA4FFA4F7A4FFF7FFA4FFF7F7F7F7000700A407A4
              00A4000000F7F7F7F7F7A4FFA4F7FFFFA4F7F7A4A4F7F7F7F7F700A407000000
              A4A400F7F7F7F7F7F7F7A4F7F7A4A4A4F7F7A4F7F7F7F7F7F7F7}
            NumGlyphs = 2
            Spacing = 0
          end
          object edNumSerie: TEdit
            Left = 192
            Top = 24
            Width = 225
            Height = 21
            TabOrder = 2
          end
          object bbtnLivros: TBitBtn
            Left = 395
            Top = 72
            Width = 21
            Height = 21
            Hint = 'Dados adicionais de Livros e Publicações'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = bbtnLivrosClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
              333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
              C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
              F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
              F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
              00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
              3333333373FF7333333333333000333333333333377733333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
          end
          object edIdOpcional: TMaskEdit
            Left = 8
            Top = 72
            Width = 387
            Height = 21
            TabOrder = 4
          end
        end
        object edDescBem: TMemo
          Left = 8
          Top = 72
          Width = 305
          Height = 69
          MaxLength = 200
          TabOrder = 4
        end
        object bbtnSelClasse: TBitBtn
          Left = 296
          Top = 24
          Width = 21
          Height = 21
          TabOrder = 1
          OnClick = bbtnSelClasseClick
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
        object cmbControle: TComboBox
          Left = 336
          Top = 24
          Width = 169
          Height = 21
          ItemHeight = 13
          TabOrder = 2
          Items.Strings = (
            'Total'
            'Físico')
        end
        object cmbSituacao: TwwDBLookupCombo
          Left = 520
          Top = 24
          Width = 225
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCSITUACAO'#9'45'#9'Descrição')
          LookupTable = qrySelSituacao
          LookupField = 'IDSITUACAO'
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object edDescClasse: TwwDBEdit
          Left = 8
          Top = 24
          Width = 289
          Height = 21
          DataField = 'DESCRICAO'
          DataSource = dsClasse
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object TabDocAquis: TTabSheet
        Caption = 'Documento de Entrada do Bem'
        object Label44: TLabel
          Left = 144
          Top = 105
          Width = 129
          Height = 13
          Caption = 'Valor Total da Entrada'
        end
        object Label16: TLabel
          Left = 328
          Top = 8
          Width = 96
          Height = 13
          Caption = 'Data Documento'
        end
        object Label14: TLabel
          Left = 136
          Top = 8
          Width = 65
          Height = 13
          Caption = 'Documento'
        end
        object Label19: TLabel
          Left = 8
          Top = 105
          Width = 66
          Height = 13
          Caption = 'Quantidade'
        end
        object Label9: TLabel
          Left = 8
          Top = 8
          Width = 76
          Height = 13
          Caption = 'Data Entrada'
        end
        object Label50: TLabel
          Left = 456
          Top = 8
          Width = 53
          Height = 13
          Caption = 'Processo'
        end
        object Label51: TLabel
          Left = 600
          Top = 8
          Width = 53
          Height = 13
          Caption = 'Empenho'
        end
        object edValHistorico: TRealEdit
          Left = 144
          Top = 121
          Width = 129
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 8
          WordWrap = False
          OnExit = edValHistoricoExit
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object edDataNota: TCMDateTimePicker
          Left = 328
          Top = 24
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
        object edNota: TEdit
          Left = 136
          Top = 24
          Width = 105
          Height = 21
          MaxLength = 18
          TabOrder = 1
        end
        object edComplNota: TEdit
          Left = 240
          Top = 24
          Width = 65
          Height = 21
          MaxLength = 5
          TabOrder = 2
        end
        object edQtde: TEdit
          Left = 8
          Top = 121
          Width = 113
          Height = 21
          TabOrder = 7
        end
        object edDataInclusao: TCMDateTimePicker
          Left = 8
          Top = 24
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
          TabOrder = 0
          OnExit = edDataInclusaoExit
        end
        object edProcesso: TEdit
          Left = 456
          Top = 24
          Width = 121
          Height = 21
          TabOrder = 4
        end
        object edEmpenho: TEdit
          Left = 600
          Top = 24
          Width = 121
          Height = 21
          TabOrder = 5
        end
        object CMProcuraForCli: TCMProcuraForCli
          Left = 8
          Top = 52
          Width = 732
          Height = 50
          Caption = ' Fornecedor '
          TabOrder = 6
          OnExit = CMProcuraForCliExit
          CampoEdit = ceRazaoSocial
          MostraMensagens = True
          Mensagens.EmBranco = 'Chave não pode estar em branco'
          Mensagens.NaoExiste = 'Chave não existe'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = True
          ForCli = fcFornecedor
          MostraEndereco = False
          StatusForCli = fcAtivo
          MostraStatusCredito = False
        end
        object CMProcuraTerceiro: TCMProcuraSubTipo
          Left = 283
          Top = 104
          Width = 457
          Height = 50
          Caption = ' Terceiro '
          Enabled = False
          TabOrder = 9
          OnExit = CMProcuraTerceiroExit
          CampoEdit = ceRazaoSocial
          MostraMensagens = True
          DataSource = dsTerceiro
          DataField = 'IDPESSOA'
          Mensagens.EmBranco = 'Chave não pode estar em branco'
          Mensagens.NaoExiste = 'Chave não existe'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = True
          SubTipo = stTerceiro
          FiltraSubTipo = True
        end
      end
      object TabContab: TTabSheet
        Caption = 'Dados Contábeis do Bem'
        object Label8: TLabel
          Left = 8
          Top = 56
          Width = 35
          Height = 13
          Caption = 'Grupo'
        end
        object Label10: TLabel
          Left = 384
          Top = 56
          Width = 73
          Height = 13
          Caption = 'Depreciação'
        end
        object Label11: TLabel
          Left = 480
          Top = 80
          Width = 31
          Height = 14
          Caption = '% a.a.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 528
          Top = 56
          Width = 108
          Height = 13
          Caption = 'Inicio Depreciação'
        end
        object Label18: TLabel
          Left = 8
          Top = 104
          Width = 56
          Height = 13
          Caption = 'SubConta'
        end
        object Label17: TLabel
          Left = 384
          Top = 104
          Width = 104
          Height = 13
          Caption = 'Atividade/ Projeto'
        end
        object Label54: TLabel
          Left = 384
          Top = 8
          Width = 133
          Height = 13
          Caption = 'Data da Contabilização'
        end
        object bbtnSelGrupo: TBitBtn
          Left = 344
          Top = 72
          Width = 21
          Height = 21
          TabOrder = 2
          OnClick = bbtnSelGrupoClick
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
        object edTaxaDep: TRealEdit
          Left = 384
          Top = 72
          Width = 89
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 3
          WordWrap = False
          IntDigits = 3
          DecDigits = 6
          NumberFormat = fNumber
          Signal = False
        end
        object edDataInicioDep: TCMDateTimePicker
          Left = 528
          Top = 72
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
          TabOrder = 4
          OnExit = edDataInicioDepExit
        end
        object bbtnSelAtivProjeto: TBitBtn
          Left = 720
          Top = 120
          Width = 21
          Height = 21
          TabOrder = 9
          OnClick = bbtnSelAtivProjetoClick
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
        object bbtnSelSubConta: TBitBtn
          Left = 344
          Top = 120
          Width = 21
          Height = 21
          TabOrder = 7
          OnClick = bbtnSelSubContaClick
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
        object edDescGrupo: TwwDBEdit
          Left = 8
          Top = 72
          Width = 337
          Height = 21
          DataField = 'NOME'
          DataSource = dsGrupo
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object edDescSubConta: TwwDBEdit
          Left = 8
          Top = 120
          Width = 337
          Height = 21
          DataField = 'NOMESUBCONTA'
          DataSource = dsSubConta
          TabOrder = 6
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object edAtivProjeto: TwwDBEdit
          Left = 384
          Top = 120
          Width = 337
          Height = 21
          DataField = 'NOME'
          DataSource = dsAtivProj
          TabOrder = 8
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object pnlIntegraContab: TPanel
          Left = 8
          Top = 8
          Width = 356
          Height = 41
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object ckbFlgBemIntContab: TCheckBox
            Left = 38
            Top = 12
            Width = 281
            Height = 17
            Caption = 'Integrar este lançamento com a Contabilidade'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
        end
        object edDtaContab: TCMDateTimePicker
          Left = 384
          Top = 24
          Width = 133
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
          UnboundDataType = wwDTEdtDate
          OnExit = edDtaContabExit
        end
      end
      object TabValores: TTabSheet
        Caption = 'Valores Iniciais do Bem'
        object GroupBox1: TGroupBox
          Left = 1
          Top = 0
          Width = 382
          Height = 64
          Caption = 'Valores em Moeda Atual'
          TabOrder = 0
          object Label15: TLabel
            Left = 8
            Top = 16
            Width = 56
            Height = 13
            Caption = 'Aquisição'
          end
          object Label20: TLabel
            Left = 101
            Top = 16
            Width = 82
            Height = 13
            Caption = 'C.M.Aquisição'
          end
          object Label21: TLabel
            Left = 193
            Top = 16
            Width = 73
            Height = 13
            Caption = 'Depreciação'
          end
          object Label22: TLabel
            Left = 285
            Top = 16
            Width = 72
            Height = 13
            Caption = 'C.M.Deprec.'
          end
          object eValOrg: TRealEdit
            Left = 9
            Top = 32
            Width = 90
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 0
            WordWrap = False
            OnExit = eValOrgExit
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object eCmValOrg: TRealEdit
            Left = 101
            Top = 32
            Width = 90
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object eValDepIni: TRealEdit
            Left = 193
            Top = 32
            Width = 90
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 2
            WordWrap = False
            OnExit = eValDepIniExit
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object eCMValDepIni: TRealEdit
            Left = 285
            Top = 32
            Width = 90
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
        end
        object GroupBox2: TGroupBox
          Left = 384
          Top = 0
          Width = 183
          Height = 64
          Caption = 'Valores Fiscais'
          TabOrder = 1
          object Label23: TLabel
            Left = 8
            Top = 16
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object Label24: TLabel
            Left = 96
            Top = 16
            Width = 73
            Height = 13
            Caption = 'Depreciação'
          end
          object eValFis: TRealEdit
            Left = 8
            Top = 32
            Width = 80
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object eDepFis: TRealEdit
            Left = 96
            Top = 32
            Width = 80
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        object GroupBox3: TGroupBox
          Left = 568
          Top = 0
          Width = 185
          Height = 64
          Caption = 'Valores Gerenciais'
          TabOrder = 2
          object Label25: TLabel
            Left = 8
            Top = 16
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object Label26: TLabel
            Left = 96
            Top = 16
            Width = 73
            Height = 13
            Caption = 'Depreciação'
          end
          object eValGer: TRealEdit
            Left = 8
            Top = 32
            Width = 80
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object eDepGer: TRealEdit
            Left = 96
            Top = 32
            Width = 80
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        object GroupBox4: TGroupBox
          Left = 0
          Top = 64
          Width = 754
          Height = 103
          Caption = 'Reavaliações'
          TabOrder = 3
          object Label30: TLabel
            Left = 8
            Top = 16
            Width = 33
            Height = 13
            Caption = 'Saldo'
          end
          object Label31: TLabel
            Left = 104
            Top = 16
            Width = 63
            Height = 13
            Caption = 'C.M. Saldo'
          end
          object Label32: TLabel
            Left = 200
            Top = 16
            Width = 73
            Height = 13
            Caption = 'Depreciação'
          end
          object Label33: TLabel
            Left = 296
            Top = 16
            Width = 76
            Height = 13
            Caption = 'C.M. Deprec.'
          end
          object Label34: TLabel
            Left = 392
            Top = 16
            Width = 28
            Height = 13
            Caption = 'Data'
          end
          object Label35: TLabel
            Left = 496
            Top = 16
            Width = 78
            Height = 13
            Caption = 'Taxa Deprec.'
          end
          object Label36: TLabel
            Left = 624
            Top = 16
            Width = 75
            Height = 13
            Caption = 'Observações'
          end
          object Label37: TLabel
            Left = 8
            Top = 59
            Width = 36
            Height = 13
            Caption = 'Última'
          end
          object Label38: TLabel
            Left = 104
            Top = 59
            Width = 66
            Height = 13
            Caption = 'C.M. Última'
          end
          object Label39: TLabel
            Left = 200
            Top = 59
            Width = 73
            Height = 13
            Caption = 'Depreciação'
          end
          object Label40: TLabel
            Left = 296
            Top = 59
            Width = 76
            Height = 13
            Caption = 'C.M. Deprec.'
          end
          object Label41: TLabel
            Left = 392
            Top = 59
            Width = 28
            Height = 13
            Caption = 'Data'
          end
          object Label42: TLabel
            Left = 496
            Top = 59
            Width = 78
            Height = 13
            Caption = 'Taxa Deprec.'
          end
          object Label45: TLabel
            Left = 624
            Top = 59
            Width = 75
            Height = 13
            Caption = 'Observações'
          end
          object Label46: TLabel
            Left = 584
            Top = 40
            Width = 31
            Height = 14
            Caption = '% a.a.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label47: TLabel
            Left = 584
            Top = 83
            Width = 31
            Height = 14
            Caption = '% a.a.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object eReavValOrg: TRealEdit
            Left = 8
            Top = 32
            Width = 90
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object eReavCMValOrg: TRealEdit
            Left = 104
            Top = 32
            Width = 90
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object eReavValDepIni: TRealEdit
            Left = 200
            Top = 32
            Width = 90
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object eReavCMValDepIni: TRealEdit
            Left = 296
            Top = 32
            Width = 90
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object eReavData: TCMDateTimePicker
            Left = 392
            Top = 32
            Width = 97
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
            TabOrder = 4
          end
          object eReavTaxaDep: TRealEdit
            Left = 496
            Top = 32
            Width = 81
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 5
            WordWrap = False
            IntDigits = 3
            DecDigits = 6
            NumberFormat = fNumber
            Signal = False
          end
          object eReavObs: TEdit
            Left = 624
            Top = 32
            Width = 121
            Height = 21
            TabOrder = 6
          end
          object eUltReavValOrg: TRealEdit
            Left = 8
            Top = 75
            Width = 90
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 7
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object eUltReavCMValOrg: TRealEdit
            Left = 104
            Top = 75
            Width = 90
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 8
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object eUltReavValDepIni: TRealEdit
            Left = 200
            Top = 75
            Width = 90
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 9
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object eUltReavCMValDepIni: TRealEdit
            Left = 296
            Top = 75
            Width = 90
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 10
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object eUltReavData: TCMDateTimePicker
            Left = 392
            Top = 75
            Width = 97
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
            TabOrder = 11
          end
          object eUltReavTaxaDep: TRealEdit
            Left = 496
            Top = 75
            Width = 81
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 12
            WordWrap = False
            IntDigits = 3
            DecDigits = 6
            NumberFormat = fNumber
            Signal = False
          end
          object eUltReavObs: TEdit
            Left = 624
            Top = 75
            Width = 121
            Height = 21
            TabOrder = 13
          end
        end
      end
    end
    object edFornec: TwwDBEdit
      Left = 592
      Top = 432
      Width = 169
      Height = 21
      DataField = 'RAZAOSOCIAL'
      DataSource = dsFornec
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnSelFornec: TBitBtn
      Left = 760
      Top = 432
      Width = 21
      Height = 21
      TabOrder = 3
      OnClick = bbtnSelFornecClick
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
    object edTerceiro: TwwDBEdit
      Left = 336
      Top = 392
      Width = 425
      Height = 21
      DataField = 'NOME'
      DataSource = dsTerceiro
      ReadOnly = True
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnSelTerceiro: TBitBtn
      Left = 760
      Top = 392
      Width = 21
      Height = 21
      TabOrder = 5
      OnClick = bbtnSelTerceiroClick
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
  end
  inherited Dock972: TDock97
    Width = 775
    object Toolbar972: TToolbar97
      Left = 244
      Top = 0
      Caption = 'Toolbar971'
      CloseButton = False
      DefaultDock = Dock972
      DockPos = 244
      TabOrder = 1
      object bbtnSelConjunto: TToolbarButton97
        Left = 95
        Top = 0
        Width = 100
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = ' &Busca Conjunto'
        Font.Charset = ANSI_CHARSET
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
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        ParentFont = False
        Spacing = 0
        OnClick = bbtnSelConjuntoClick
      end
      object bbtnNovoConjunto: TToolbarButton97
        Left = 0
        Top = 0
        Width = 95
        Height = 41
        Hint = 'Acessa o Cadastro de Conjuntos'
        AllowAllUp = True
        GroupIndex = 1
        Caption = ' &Conjunto'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 1
        OnClick = bbtnNovoConjuntoClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 392
    Width = 775
    inherited tb97Fundo: TToolbar97
      Left = 594
      DockPos = 594
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70021
        Kind = bkHelp
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 417
      DockPos = 417
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 592
    Top = 504
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 728
    Top = 504
  end
  inherited upd: TUpdateSQL
    Left = 760
    Top = 504
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona um bem'
    Left = 648
    Top = 504
  end
  inherited ImlPadrao: TImageList
    Left = 656
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 294
    Top = 138
  end
  inherited qry: TwwQuery
    Left = 696
    Top = 504
  end
  object qrySelConjunto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT C.DESCCONJUNTO, C.IDCONJUNTO, C.IDLOCALIZACAO, C.IDRESPON' +
        'SAVEL,'
      
        '       L.NOME AS DESCLOCALIZACAO, P.NOME AS DESCRESPONSAVEL, C.I' +
        'DPESSOA,'
      '       C.DISPONIVEL, C.ALUGADO'
      'FROM CONJUNTO C, LOCALIZACAO L, PESSOA P'
      'WHERE (C.IDCONJUNTO = :PIDCONJUNTO)'
      '  AND (C.IDPESSOA = :IDPESSOA)'
      '  AND (C.IDLOCALIZACAO = L.IDLOCALIZACAO(+))'
      '  AND (C.IDPESSOA = L.IDPESSOA(+))'
      '  AND (C.IDRESPONSAVEL = P.IDPESSOA(+))'
      'ORDER BY C.DESCCONJUNTO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 408
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySelConjuntoDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object qrySelConjuntoIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object qrySelConjuntoIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
    end
    object qrySelConjuntoIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qrySelConjuntoDESCLOCALIZACAO: TStringField
      FieldName = 'DESCLOCALIZACAO'
      Size = 60
    end
    object qrySelConjuntoDESCRESPONSAVEL: TStringField
      FieldName = 'DESCRESPONSAVEL'
      Size = 60
    end
    object qrySelConjuntoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qrySelConjuntoDISPONIVEL: TFloatField
      FieldName = 'DISPONIVEL'
    end
    object qrySelConjuntoALUGADO: TFloatField
      FieldName = 'ALUGADO'
    end
  end
  object MSConjunto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Cadastro de Conjuntos'
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
      'CONJUNTO.IDCONJUNTO'
      'CONJUNTO.IDPESSOA')
    Filtro.Strings = (
      'CONJUNTO.IDLOCALIZACAO = LOCALIZACAO.IDLOCALIZACAO(+)'
      'CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA(+)'
      'CONJUNTO.IDRESPONSAVEL = PESSOA.IDPESSOA(+)')
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
    Left = 568
    Top = 80
  end
  object qryRateio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RD.CODCENTROCUSTO, CC.NOME AS DESCCCUSTO, RD.PARTICIPACAO'
      'FROM RATEIODEPRECIACAO RD,'
      '     CENTCUST CC'
      'WHERE (RD.IDEMPRESA  = :PIDPESSOA)'
      '  AND (RD.IDCONJUNTO = :PIDCONJUNTO)'
      '  AND (RD.CODCENTROCUSTO = CC.CODCENTROCUSTO)'
      '  AND (RD.IDEMPRESA      = CC.IDEMPRESA)'
      '')
    ValidateWithMask = True
    Left = 640
    Top = 80
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end>
    object qryRateioCODCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 14
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryRateioDESCCCUSTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCCCUSTO'
      Size = 30
    end
    object qryRateioPARTICIPACAO: TFloatField
      DisplayLabel = '(%)'
      DisplayWidth = 6
      FieldName = 'PARTICIPACAO'
    end
  end
  object dsRateio: TwwDataSource
    AutoEdit = False
    DataSet = qryRateio
    Left = 688
    Top = 80
  end
  object dsSelConjunto: TwwDataSource
    AutoEdit = False
    DataSet = qrySelConjunto
    Left = 480
    Top = 80
  end
  object qrySelClasse: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDCLASSEBEM,CODHIERARQ,DESCRICAO,ANASINT,MASCARAIDOPCIONA' +
        'L'
      'FROM CLASSEDEBEM'
      'WHERE (IDCLASSEBEM = :PIDCLASSEBEM)')
    ValidateWithMask = True
    Left = 24
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCLASSEBEM'
        ParamType = ptUnknown
      end>
    object qrySelClasseIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
      Origin = '"CM.CLASSEDEBEM".IDCLASSEBEM'
    end
    object qrySelClasseCODHIERARQ: TStringField
      FieldName = 'CODHIERARQ'
      Origin = '"CM.CLASSEDEBEM".CODHIERARQ'
      Size = 15
    end
    object qrySelClasseDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"CM.CLASSEDEBEM".DESCRICAO'
      Size = 60
    end
    object qrySelClasseANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = '"CM.CLASSEDEBEM".ANASINT'
      Size = 1
    end
    object qrySelClasseMASCARAIDOPCIONAL: TStringField
      FieldName = 'MASCARAIDOPCIONAL'
      Origin = '"CM.CLASSEDEBEM".MASCARAIDOPCIONAL'
    end
  end
  object qrySelSituacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITUACAO,DESCSITUACAO FROM SITUACAO'
      'ORDER BY DESCSITUACAO')
    ValidateWithMask = True
    Left = 96
    Top = 456
    object qrySelSituacaoDESCSITUACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 45
      FieldName = 'DESCSITUACAO'
      Origin = 'SITUACAO.DESCSITUACAO'
      Size = 45
    end
    object qrySelSituacaoIDSITUACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITUACAO'
      Origin = 'SITUACAO.IDSITUACAO'
      Visible = False
    end
  end
  object qrySelAtivProj: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME,UNIDNEGOC, IDPESSOA,UNECODIGO'
      'FROM UNIDNEGOCIO'
      'WHERE (IDPESSOA  =  :PIDPESSOA)'
      '  AND (UNIDNEGOC = :PIDATIVPROJETO)'
      '  AND (UNETIPO = '#39'A'#39')'
      '  AND (UNIDNEGOC > 0)      '
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 512
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDATIVPROJETO'
        ParamType = ptUnknown
      end>
    object qrySelAtivProjNOME: TStringField
      DisplayLabel = 'Atividade/Projeto'
      DisplayWidth = 25
      FieldName = 'NOME'
      Origin = '"CM.UNIDNEGOCIO".NOME'
      Size = 25
    end
    object qrySelAtivProjUNECODIGO: TStringField
      DisplayLabel = 'Hierarquia'
      DisplayWidth = 10
      FieldName = 'UNECODIGO'
      Origin = '"CM.UNIDNEGOCIO".UNECODIGO'
      Size = 10
    end
    object qrySelAtivProjUNIDNEGOC: TFloatField
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Origin = '"CM.UNIDNEGOCIO".UNIDNEGOC'
      Visible = False
    end
    object qrySelAtivProjIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = '"CM.UNIDNEGOCIO".IDPESSOA'
      Visible = False
    end
  end
  object qryPlaca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA,PLACA,DESBEM'
      'FROM BEM'
      'WHERE (PLACA = :PPLACA)'
      '  AND (IDPESSOA = :IDPESSOA)'
      ' ')
    ValidateWithMask = True
    Left = 160
    Top = 456
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PPLACA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryPlacaPLACA: TFloatField
      FieldName = 'PLACA'
      Origin = '"CM.BEM".PLACA'
    end
    object qryPlacaDESBEM: TStringField
      FieldName = 'DESBEM'
      Origin = '"CM.BEM".DESBEM'
      Size = 200
    end
  end
  object qrySelTerceiro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P.IDPESSOA  '
      'FROM PESSOA P, TERCEIRO T          '
      'WHERE (P.IDPESSOA = :PIDPESSOA)'
      '      AND (P.IDPESSOA = T.IDPESSOA)')
    ValidateWithMask = True
    Left = 288
    Top = 456
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySelTerceiroNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qrySelTerceiroIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
      Visible = False
    end
  end
  object MSFornec: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Cadastro de Fornecedores'
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Razão Social'
      'Nome do Fornecedor')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'EMPRESAFORN'
      'PESSOA')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'EMPRESAFORN.IDFORCLI=PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 24
    Top = 384
  end
  object MSTerceiros: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Cadastro de Terceiros'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'TERCEIRO')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = TERCEIRO.IDPESSOA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 88
    Top = 384
  end
  object MSSubConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'SubConta'
    Colunas.Strings = (
      'SUBCONTA.NOMESUBCONTA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'SUBCONTA')
    CamposChave.Strings = (
      'SUBCONTA.CODSUBCONTA'
      'SUBCONTA.IDPESSOA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 240
    Top = 384
  end
  object MSAtivProjeto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Atividade/Projeto'
    Colunas.Strings = (
      'UNIDNEGOCIO.NOME'
      'UNIDNEGOCIO.UNECODIGO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Código')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'UNIDNEGOCIO')
    CamposChave.Strings = (
      'UNIDNEGOCIO.UNIDNEGOC'
      'UNIDNEGOCIO.IDPESSOA')
    Filtro.Strings = (
      'UNIDNEGOCIO.UNIDNEGOC > 0'
      'UNIDNEGOCIO.UNETIPO = '#39'A'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '25'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 168
    Top = 384
  end
  object qrySelFornec: TwwQuery
    AfterOpen = qrySelFornecAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P.IDPESSOA, P.RAZAOSOCIAL,'
      '       F.IDFORCLI, F.CODSUBCONTA'
      'FROM EMPRESAFORN F,'
      '     PESSOA P'
      'WHERE (F.IDFORCLI = :IDFORCLI)'
      '  AND (F.IDPESSOA = :IDEMPRESA)'
      '  AND (F.IDFORCLI = P.IDPESSOA)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 456
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
    object qrySelFornecNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qrySelFornecIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qrySelFornecRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qrySelFornecIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qrySelFornecCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'EMPRESAFORN.CODSUBCONTA'
    end
  end
  object qrySelSubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOMESUBCONTA, IDPESSOA,CODSUBCONTA'
      'FROM SUBCONTA'
      'WHERE (IDPESSOA    = :PIDPESSOA)'
      '  AND (CODSUBCONTA = :PSUBCONTA)')
    ValidateWithMask = True
    Left = 432
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PSUBCONTA'
        ParamType = ptUnknown
      end>
    object qrySelSubContaNOMESUBCONTA: TStringField
      FieldName = 'NOMESUBCONTA'
      Origin = '"CM.SUBCONTA".NOMESUBCONTA'
      Size = 60
    end
    object qrySelSubContaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.SUBCONTA".IDPESSOA'
    end
    object qrySelSubContaCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = '"CM.SUBCONTA".CODSUBCONTA'
    end
  end
  object qrySelGrupo: TwwQuery
    AfterOpen = qrySelGrupoAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT G.NOME, G.IDGRUPO, G.DEPRECIACAO, G.ULTIDBEM, G.CLASSE, G' +
        '.FLGSEMPLACA'
      'FROM  GRUPO G, PLANOGRUPO P'
      'WHERE (G.IDGRUPO = :PIDGRUPO)'
      '  AND (P.IDPESSOA = :PIDPESSOA)'
      '  AND (G.STATUS   = '#39'A'#39')'
      '  AND (G.TIPO     = '#39'A'#39')'
      '  AND (P.IDGRUPO  = G.IDGRUPO)'
      'ORDER BY G.CLASSE')
    ValidateWithMask = True
    Left = 360
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySelGrupoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qrySelGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
    object qrySelGrupoDEPRECIACAO: TFloatField
      FieldName = 'DEPRECIACAO'
      Origin = 'GRUPO.DEPRECIACAO'
    end
    object qrySelGrupoULTIDBEM: TFloatField
      FieldName = 'ULTIDBEM'
      Origin = 'GRUPO.ULTIDBEM'
    end
    object qrySelGrupoCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
    object qrySelGrupoFLGSEMPLACA: TFloatField
      FieldName = 'FLGSEMPLACA'
      Origin = 'GRUPO.FLGSEMPLACA'
    end
  end
  object qryParamCaf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ALUGUELINTERNO,SEQBEMEMP,EDITACODBEM,'
      '       MOEDAFISCAL,MOEDAGERENCIAL,MOEDAOFICIAL,'
      '       MASCCODGRUPO,SISTEMAS,INTEGRACONTAB,INTEGRACAP,'
      '       INTEGRACAR,FLGCLSDESBEM'
      'FROM   PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 584
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamCafALUGUELINTERNO: TFloatField
      FieldName = 'ALUGUELINTERNO'
      Origin = 'PARAMETROSCAFMANUT.ALUGUELINTERNO'
    end
    object qryParamCafSEQBEMEMP: TFloatField
      FieldName = 'SEQBEMEMP'
      Origin = 'PARAMETROSCAFMANUT.SEQBEMEMP'
    end
    object qryParamCafEDITACODBEM: TFloatField
      FieldName = 'EDITACODBEM'
      Origin = 'PARAMETROSCAFMANUT.EDITACODBEM'
    end
    object qryParamCafMOEDAFISCAL: TFloatField
      FieldName = 'MOEDAFISCAL'
      Origin = 'PARAMETROSCAFMANUT.MOEDAFISCAL'
    end
    object qryParamCafMOEDAGERENCIAL: TFloatField
      FieldName = 'MOEDAGERENCIAL'
      Origin = 'PARAMETROSCAFMANUT.MOEDAGERENCIAL'
    end
    object qryParamCafMOEDAOFICIAL: TFloatField
      FieldName = 'MOEDAOFICIAL'
      Origin = 'PARAMETROSCAFMANUT.MOEDAOFICIAL'
    end
    object qryParamCafMASCCODGRUPO: TStringField
      FieldName = 'MASCCODGRUPO'
      Origin = 'PARAMETROSCAFMANUT.MASCCODGRUPO'
    end
    object qryParamCafSISTEMAS: TStringField
      FieldName = 'SISTEMAS'
      Origin = 'PARAMETROSCAFMANUT.SISTEMAS'
      Size = 8
    end
    object qryParamCafINTEGRACONTAB: TStringField
      FieldName = 'INTEGRACONTAB'
      Origin = 'PARAMETROSCAFMANUT.INTEGRACONTAB'
      Size = 1
    end
    object qryParamCafINTEGRACAP: TStringField
      FieldName = 'INTEGRACAP'
      Origin = 'PARAMETROSCAFMANUT.INTEGRACAP'
      Size = 1
    end
    object qryParamCafINTEGRACAR: TStringField
      FieldName = 'INTEGRACAR'
      Origin = 'PARAMETROSCAFMANUT.INTEGRACAR'
      Size = 1
    end
    object qryParamCafFLGCLSDESBEM: TFloatField
      FieldName = 'FLGCLSDESBEM'
      Origin = '"CM.PARAMETROSCAFMANUT".FLGCLSDESBEM'
    end
  end
  object qryReavaliacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREAVALIACAO,IDMOVIMENTACAO,IDBEM,IDPESSOA,VALORG,'
      '       VALFIS,VALGER,TAXADEP,DEPLANC,DEPFIS,DEPGER,CMBEM,CMDEP,'
      '       DATAULTDEP,DATAREAVALIACAO,FLGDEPREC,FLGULTREAVAL'
      'FROM  REAVALIACAO'
      'WHERE (IDBEM = :PIDBEM)'
      '  AND (IDPESSOA = :PIDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 656
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryReavaliacaoIDREAVALIACAO: TFloatField
      FieldName = 'IDREAVALIACAO'
    end
    object qryReavaliacaoIDMOVIMENTACAO: TFloatField
      FieldName = 'IDMOVIMENTACAO'
    end
    object qryReavaliacaoIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryReavaliacaoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryReavaliacaoVALORG: TFloatField
      FieldName = 'VALORG'
    end
    object qryReavaliacaoVALFIS: TFloatField
      FieldName = 'VALFIS'
    end
    object qryReavaliacaoVALGER: TFloatField
      FieldName = 'VALGER'
    end
    object qryReavaliacaoTAXADEP: TFloatField
      FieldName = 'TAXADEP'
    end
    object qryReavaliacaoDEPLANC: TFloatField
      FieldName = 'DEPLANC'
    end
    object qryReavaliacaoDEPFIS: TFloatField
      FieldName = 'DEPFIS'
    end
    object qryReavaliacaoDEPGER: TFloatField
      FieldName = 'DEPGER'
    end
    object qryReavaliacaoCMBEM: TFloatField
      FieldName = 'CMBEM'
    end
    object qryReavaliacaoCMDEP: TFloatField
      FieldName = 'CMDEP'
    end
    object qryReavaliacaoDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object qryReavaliacaoDATAREAVALIACAO: TDateTimeField
      FieldName = 'DATAREAVALIACAO'
    end
    object qryReavaliacaoFLGDEPREC: TFloatField
      FieldName = 'FLGDEPREC'
    end
    object qryReavaliacaoFLGULTREAVAL: TFloatField
      FieldName = 'FLGULTREAVAL'
    end
  end
  object qryReaval: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOVIMENTACAO, TAXADEPANT, OBS'
      'FROM REAVAL'
      'WHERE IDMOVIMENTACAO = :PIDMOVIMENTACAO')
    ValidateWithMask = True
    Left = 728
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
    object qryReavalIDMOVIMENTACAO: TFloatField
      FieldName = 'IDMOVIMENTACAO'
      Origin = 'REAVAL.IDMOVIMENTACAO'
    end
    object qryReavalTAXADEPANT: TFloatField
      FieldName = 'TAXADEPANT'
      Origin = 'REAVAL.TAXADEPANT'
    end
    object qryReavalOBS: TStringField
      FieldName = 'OBS'
      Origin = 'REAVAL.OBS'
      Size = 60
    end
  end
  object MSClasse: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Cadastro de Classes'
    Colunas.Strings = (
      'CLASSEDEBEM.CODHIERARQ'
      'CLASSEDEBEM.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CLASSEDEBEM')
    CamposChave.Strings = (
      'CLASSEDEBEM.IDCLASSEBEM')
    Filtro.Strings = (
      'CLASSEDEBEM.ANASINT = '#39'A'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 312
    Top = 384
  end
  object MSGrupos: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Grupo Contábil'
    Colunas.Strings = (
      'GRUPO.CLASSE'
      'GRUPO.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPO'
      'PLANOGRUPO')
    CamposChave.Strings = (
      'GRUPO.IDGRUPO'
      'PLANOGRUPO.IDPESSOA')
    Filtro.Strings = (
      'GRUPO.TIPO = '#39'A'#39
      'GRUPO.IDGRUPO=PLANOGRUPO.IDGRUPO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 368
    Top = 384
  end
  object qryHistMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOVIMENTACAO'
      'FROM   HISTORICOMOVIMENTACAO'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      '  AND (IDBEM    = :PIDBEM)'
      
        '  AND (IDTIPOMOVIMENTACAO <> 1)   /* ENTRADA TOTAL              ' +
        '                        */'
      
        '  AND (IDTIPOMOVIMENTACAO <> 3)   /* ENTRADA FISICA             ' +
        '                        */'
      
        '  AND (IDTIPOMOVIMENTACAO <> 17)  /* INCLUSAO DE DEPRECIACAO    ' +
        '                        */'
      
        '  AND (IDTIPOMOVIMENTACAO <> 15)  /* CORRECAO MONETARIA         ' +
        '                        */'
      
        '  AND (IDTIPOMOVIMENTACAO <> 21)  /* CORRECAO MONETARIA DA DEPRE' +
        'CIACAO                  */'
      
        '  AND (IDTIPOMOVIMENTACAO <> 32)  /* INCLUSAO DO SALDO DE REAVAL' +
        'IACAO                   */'
      
        '  AND (IDTIPOMOVIMENTACAO <> 33)  /* INCLUSAO DA DEPRECIACAO DO ' +
        'SALDO DE REAVALIACAO    */'
      
        '  AND (IDTIPOMOVIMENTACAO <> 22)  /* CORRECAO MONETARIA DA REAVA' +
        'LIACAO                  */'
      
        '  AND (IDTIPOMOVIMENTACAO <> 19)  /* CORRECAO MONETARIA DA DEPRE' +
        'CIACAO DA REAVALIACAO   */'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 24
    Top = 504
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
    object qryHistMovIDMOVIMENTACAO: TFloatField
      FieldName = 'IDMOVIMENTACAO'
      Origin = '"CM.HISTORICOMOVIMENTACAO".IDMOVIMENTACAO'
    end
  end
  object dsClasse: TwwDataSource
    AutoEdit = False
    DataSet = qrySelClasse
    Left = 192
    Top = 504
  end
  object dsFornec: TwwDataSource
    AutoEdit = False
    DataSet = qrySelFornec
    Left = 240
    Top = 504
  end
  object dsTerceiro: TwwDataSource
    AutoEdit = False
    DataSet = qrySelTerceiro
    Left = 296
    Top = 504
  end
  object dsGrupo: TwwDataSource
    AutoEdit = False
    DataSet = qrySelGrupo
    Left = 352
    Top = 504
  end
  object dsSubConta: TwwDataSource
    AutoEdit = False
    DataSet = qrySelSubConta
    Left = 408
    Top = 504
  end
  object dsAtivProj: TwwDataSource
    AutoEdit = False
    DataSet = qrySelAtivProj
    Left = 472
    Top = 504
  end
  object qryBuscaGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT GXCC.IDGRUPO'
      'FROM PLANOGRUPO PG,'
      '     CLASSEXGRUPO CXG,'
      '     GRUPOBEMXCC GXCC,'
      '     LOCALIZACAO L'
      'WHERE (CXG.IDCLASSEBEM = :PIDCLASSE)'
      '  AND (L.IDLOCALIZACAO = :PIDLOCAL)'
      '  AND (L.IDPESSOA      = :PIDPESSOA)'
      '  AND (PG.IDPESSOA     = :PIDPESSOA)'
      '  AND (PG.IDGRUPO          = CXG.IDGRUPO)'
      '  AND (CXG.IDGRUPO         = GXCC.IDGRUPO)'
      '  AND (GXCC.CODCENTROCUSTO = L.CODCENTROCUSTO)'
      '  AND (GXCC.IDEMPRESA      = L.IDEMPRESA)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 584
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCLASSE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDLOCAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryBuscaGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPOBEMXCC.IDGRUPO'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 712
  end
  object qryVerificaClasse: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCLASSEBEM,IDGRUPO'
      'FROM   CLASSEXGRUPO'
      'WHERE (IDCLASSEBEM = :PIDCLASSEBEM)'
      '  AND (IDGRUPO     = :PIDGRUPO)'
      '')
    ValidateWithMask = True
    Left = 136
    Top = 80
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCLASSEBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end>
    object qryVerificaClasseIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
      Origin = 'CLASSEXGRUPO.IDCLASSEBEM'
    end
    object qryVerificaClasseIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'CLASSEXGRUPO.IDGRUPO'
    end
  end
  object qryVerificaGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT GXCC.IDGRUPO'
      'FROM CONJUNTO C,'
      '     LOCALIZACAO L,'
      '     GRUPOBEMXCC GXCC'
      'WHERE (C.IDCONJUNTO     = :PIDCONJUNTO)'
      '  AND (C.IDPESSOA       = :IDPESSOA)'
      '  AND (GXCC.IDGRUPO     = :PIDGRUPO)'
      '  AND (GXCC.IDEMPRESA   = :IDPESSOA)'
      '  AND (C.IDLOCALIZACAO  = L.IDLOCALIZACAO)'
      '  AND (C.IDPESSOA       = L.IDPESSOA)'
      '  AND (L.CODCENTROCUSTO = GXCC.CODCENTROCUSTO)'
      '  AND (L.IDEMPRESA      = GXCC.IDEMPRESA)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 224
    Top = 80
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryVerificaGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPOBEMXCC.IDGRUPO'
    end
  end
  object qryImovelxBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDIMOVEL, IDBEM, IDPESSOA,'
      '       IXBGRUPO, IXBPERCENT'
      'FROM IMOVELXBEM'
      'WHERE (IDBEM    = :PIDBEM)'
      '  AND (IDPESSOA = :PIDPESSOA)'
      '')
    UpdateObject = updImovelxBem
    ValidateWithMask = True
    Left = 499
    Top = 148
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryImovelxBemIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'IMOVELXBEM.IDIMOVEL'
    end
    object qryImovelxBemIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'IMOVELXBEM.IDBEM'
    end
    object qryImovelxBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'IMOVELXBEM.IDPESSOA'
    end
    object qryImovelxBemIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      Origin = 'IMOVELXBEM.IXBGRUPO'
      Size = 1
    end
    object qryImovelxBemIXBPERCENT: TFloatField
      FieldName = 'IXBPERCENT'
      Origin = 'IMOVELXBEM.IXBPERCENT'
    end
  end
  object updImovelxBem: TUpdateSQL
    ModifySQL.Strings = (
      'update IMOVELXBEM'
      'set'
      '  IDIMOVEL = :IDIMOVEL,'
      '  IDBEM = :IDBEM,'
      '  IDPESSOA = :IDPESSOA,'
      '  IXBGRUPO = :IXBGRUPO,'
      '  IXBPERCENT = :IXBPERCENT'
      'where'
      '  IDIMOVEL = :OLD_IDIMOVEL and'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into IMOVELXBEM'
      '  (IDIMOVEL, IDBEM, IDPESSOA, IXBGRUPO, IXBPERCENT)'
      'values'
      '  (:IDIMOVEL, :IDBEM, :IDPESSOA, :IXBGRUPO, :IXBPERCENT)')
    DeleteSQL.Strings = (
      'delete from IMOVELXBEM'
      'where'
      '  IDIMOVEL = :OLD_IDIMOVEL and'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 499
    Top = 136
  end
  object qryBemSel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SBB.IDSELBAIXA, SB.SBXTERMO, SB.SBTIPOMOV'
      'FROM SELBAIXABENS SBB,'
      '     SELBAIXA SB'
      'WHERE (SBB.IDPESSOA = :PIDPESSOA)'
      '  AND (SBB.IDBEM    = :PIDBEM)'
      '  AND (SB.SBXFLGEXECUTADO <> 1)'
      '  AND (SBB.IDSELBAIXA = SB.IDSELBAIXA)'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 704
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
    object qryBemSelIDSELBAIXA: TFloatField
      FieldName = 'IDSELBAIXA'
      Origin = '"CM.SELBAIXABENS".IDSELBAIXA'
    end
    object qryBemSelSBXTERMO: TFloatField
      FieldName = 'SBXTERMO'
      Origin = 'BASEDADOS.SELBAIXA.SBXTERMO'
    end
    object qryBemSelSBTIPOMOV: TFloatField
      FieldName = 'SBTIPOMOV'
      Origin = 'BASEDADOS.SELBAIXA.SBTIPOMOV'
    end
  end
  object qrySelBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT B.*,C.DESCCONJUNTO, G.NOME, G.FLGIMOVEL, S.DESCSITUACAO, ' +
        'P.NOME AS NOMEFORN,'
      
        '       CB.DESCRICAO AS NOMECLASSE, C.IDLOCALIZACAO, C.IDRESPONSA' +
        'VEL'
      'FROM BEM         B,'
      '     CONJUNTO    C,'
      '     PLANOGRUPO PG,'
      '     GRUPO       G,'
      '     SITUACAO    S,'
      '     PESSOA      P,'
      '     CLASSEDEBEM CB'
      'WHERE (B.IDBEM       = :PIDBEM)'
      '  AND (B.IDPESSOA    = :PIDPESSOA)'
      '  AND (B.IDCONJUNTO  = C.IDCONJUNTO(+))'
      '  AND (B.IDPESSOA    = C.IDPESSOA(+))'
      '  AND (B.IDGRUPO     = PG.IDGRUPO(+))'
      '  AND (B.IDPESSOA    = PG.IDPESSOA(+))'
      '  AND (PG.IDGRUPO    = G.IDGRUPO(+))'
      '  AND (B.IDFORNSERV  = P.IDPESSOA(+))'
      '  AND (B.IDSITUACAO  = S.IDSITUACAO(+))'
      '  AND (B.IDCLASSEBEM = CB.IDCLASSEBEM(+))'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 503
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySelBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qrySelBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qrySelBemIDFORNSERV: TFloatField
      FieldName = 'IDFORNSERV'
    end
    object qrySelBemIDTERCEIRO: TFloatField
      FieldName = 'IDTERCEIRO'
    end
    object qrySelBemIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
    end
    object qrySelBemIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qrySelBemCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object qrySelBemIDITENSRECDEV: TFloatField
      FieldName = 'IDITENSRECDEV'
    end
    object qrySelBemUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qrySelBemIDIMAGEM: TFloatField
      FieldName = 'IDIMAGEM'
    end
    object qrySelBemIDSITUACAO: TFloatField
      FieldName = 'IDSITUACAO'
    end
    object qrySelBemIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object qrySelBemIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qrySelBemREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Size = 1
    end
    object qrySelBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qrySelBemDTAINCLUSAO: TDateTimeField
      FieldName = 'DTAINCLUSAO'
    end
    object qrySelBemDTANOTA: TDateTimeField
      FieldName = 'DTANOTA'
    end
    object qrySelBemDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
    end
    object qrySelBemTAXADEP: TFloatField
      FieldName = 'TAXADEP'
    end
    object qrySelBemPROPBAIXA: TFloatField
      FieldName = 'PROPBAIXA'
    end
    object qrySelBemCONTROLE: TStringField
      FieldName = 'CONTROLE'
      Size = 1
    end
    object qrySelBemVALORG: TFloatField
      FieldName = 'VALORG'
    end
    object qrySelBemVALFIS: TFloatField
      FieldName = 'VALFIS'
    end
    object qrySelBemDEPFIS: TFloatField
      FieldName = 'DEPFIS'
    end
    object qrySelBemVALGER: TFloatField
      FieldName = 'VALGER'
    end
    object qrySelBemDEPGER: TFloatField
      FieldName = 'DEPGER'
    end
    object qrySelBemVALDEPINI: TFloatField
      FieldName = 'VALDEPINI'
    end
    object qrySelBemNUMSERIE: TStringField
      FieldName = 'NUMSERIE'
    end
    object qrySelBemBAIXATOTAL: TStringField
      FieldName = 'BAIXATOTAL'
      Size = 1
    end
    object qrySelBemIDNOTA: TStringField
      FieldName = 'IDNOTA'
      Size = 18
    end
    object qrySelBemCOMPLNOTA: TStringField
      FieldName = 'COMPLNOTA'
      Size = 5
    end
    object qrySelBemDEPLANC: TFloatField
      FieldName = 'DEPLANC'
    end
    object qrySelBemCMDEP: TFloatField
      FieldName = 'CMDEP'
    end
    object qrySelBemCMBEM: TFloatField
      FieldName = 'CMBEM'
    end
    object qrySelBemDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object qrySelBemDATARECALCDEP: TDateTimeField
      FieldName = 'DATARECALCDEP'
    end
    object qrySelBemPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qrySelBemVALHISTORICO: TFloatField
      FieldName = 'VALHISTORICO'
    end
    object qrySelBemFLGDEPREC: TFloatField
      FieldName = 'FLGDEPREC'
    end
    object qrySelBemFLGSAIDATEMP: TFloatField
      FieldName = 'FLGSAIDATEMP'
    end
    object qrySelBemPRIORIDADE: TFloatField
      FieldName = 'PRIORIDADE'
    end
    object qrySelBemDATAINSTALACAO: TDateTimeField
      FieldName = 'DATAINSTALACAO'
    end
    object qrySelBemDATATERMINOGAR: TDateTimeField
      FieldName = 'DATATERMINOGAR'
    end
    object qrySelBemIDOPCIONAL: TStringField
      FieldName = 'IDOPCIONAL'
      Size = 30
    end
    object qrySelBemPROCESSOAQUIS: TStringField
      FieldName = 'PROCESSOAQUIS'
      Size = 30
    end
    object qrySelBemEMPENHOAQUIS: TStringField
      FieldName = 'EMPENHOAQUIS'
      Size = 30
    end
    object qrySelBemPUBAUTOR: TStringField
      FieldName = 'PUBAUTOR'
      Size = 60
    end
    object qrySelBemPUBEDITORA: TStringField
      FieldName = 'PUBEDITORA'
      Size = 60
    end
    object qrySelBemPUBANO: TFloatField
      FieldName = 'PUBANO'
    end
    object qrySelBemDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object qrySelBemNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qrySelBemDESCSITUACAO: TStringField
      FieldName = 'DESCSITUACAO'
      Size = 45
    end
    object qrySelBemNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      Size = 60
    end
    object qrySelBemNOMECLASSE: TStringField
      FieldName = 'NOMECLASSE'
      Size = 60
    end
    object qrySelBemFLGIMOVEL: TFloatField
      FieldName = 'FLGIMOVEL'
    end
    object qrySelBemFLGBEMINTCONTAB: TFloatField
      FieldName = 'FLGBEMINTCONTAB'
    end
    object qrySelBemDTACONTAB: TDateTimeField
      FieldName = 'DTACONTAB'
    end
    object qrySelBemIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
    end
    object qrySelBemIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
  end
  object qryAltBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDBEM,IDPESSOA,IDCONJUNTO,IDTERCEIRO,IDGRUPO,CODSUBCONTA,' +
        'IDCLASSEBEM,'
      
        '       IDMODULO,IDITENSRECDEV,IDFORNSERV,IDSITUACAO,IDIMAGEM,REG' +
        'ISTRO,CONTROLE,'
      
        '       PLACA,DESBEM,IDNOTA,COMPLNOTA,DTANOTA,NUMSERIE,DTAINCLUSA' +
        'O,VALHISTORICO,'
      
        '       VALORG,CMBEM,VALFIS,VALGER,DATAINICIODEP,VALDEPINI,TAXADE' +
        'P,DEPLANC,CMDEP,'
      
        '       DEPFIS,DEPGER,DATAULTDEP,DATARECALCDEP,FLGDEPREC,PROPBAIX' +
        'A,BAIXATOTAL,'
      
        '       IDOPCIONAL,UNIDNEGOC,PROCESSOAQUIS,EMPENHOAQUIS,PUBAUTOR,' +
        'PUBEDITORA,PUBANO,'
      '       FLGBEMINTCONTAB,DTACONTAB '
      'FROM BEM'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      '  AND (IDBEM    = :PIDBEM)'
      ' '
      ' ')
    UpdateObject = updAltBem
    ValidateWithMask = True
    Left = 144
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
    object qryAltBemIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = '"CM.BEM".IDBEM'
    end
    object qryAltBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.BEM".IDPESSOA'
    end
    object qryAltBemIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Origin = '"CM.BEM".IDCONJUNTO'
    end
    object qryAltBemIDTERCEIRO: TFloatField
      FieldName = 'IDTERCEIRO'
      Origin = '"CM.BEM".IDTERCEIRO'
    end
    object qryAltBemIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = '"CM.BEM".IDGRUPO'
    end
    object qryAltBemCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = '"CM.BEM".CODSUBCONTA'
    end
    object qryAltBemIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
      Origin = '"CM.BEM".IDCLASSEBEM'
    end
    object qryAltBemIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = '"CM.BEM".IDMODULO'
    end
    object qryAltBemIDITENSRECDEV: TFloatField
      FieldName = 'IDITENSRECDEV'
      Origin = '"CM.BEM".IDITENSRECDEV'
    end
    object qryAltBemIDFORNSERV: TFloatField
      FieldName = 'IDFORNSERV'
      Origin = '"CM.BEM".IDFORNSERV'
    end
    object qryAltBemIDSITUACAO: TFloatField
      FieldName = 'IDSITUACAO'
      Origin = '"CM.BEM".IDSITUACAO'
    end
    object qryAltBemIDIMAGEM: TFloatField
      FieldName = 'IDIMAGEM'
      Origin = '"CM.BEM".IDIMAGEM'
    end
    object qryAltBemREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Origin = '"CM.BEM".REGISTRO'
      Size = 1
    end
    object qryAltBemCONTROLE: TStringField
      FieldName = 'CONTROLE'
      Origin = '"CM.BEM".CONTROLE'
      Size = 1
    end
    object qryAltBemPLACA: TFloatField
      FieldName = 'PLACA'
      Origin = '"CM.BEM".PLACA'
    end
    object qryAltBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Origin = '"CM.BEM".DESBEM'
      Size = 200
    end
    object qryAltBemIDNOTA: TStringField
      FieldName = 'IDNOTA'
      Origin = '"CM.BEM".IDNOTA'
      Size = 18
    end
    object qryAltBemCOMPLNOTA: TStringField
      FieldName = 'COMPLNOTA'
      Origin = '"CM.BEM".COMPLNOTA'
      Size = 5
    end
    object qryAltBemDTANOTA: TDateTimeField
      FieldName = 'DTANOTA'
      Origin = '"CM.BEM".DTANOTA'
    end
    object qryAltBemNUMSERIE: TStringField
      FieldName = 'NUMSERIE'
      Origin = '"CM.BEM".NUMSERIE'
    end
    object qryAltBemDTAINCLUSAO: TDateTimeField
      FieldName = 'DTAINCLUSAO'
      Origin = '"CM.BEM".DTAINCLUSAO'
    end
    object qryAltBemVALHISTORICO: TFloatField
      FieldName = 'VALHISTORICO'
      Origin = '"CM.BEM".VALHISTORICO'
    end
    object qryAltBemVALORG: TFloatField
      FieldName = 'VALORG'
      Origin = '"CM.BEM".VALORG'
    end
    object qryAltBemCMBEM: TFloatField
      FieldName = 'CMBEM'
      Origin = '"CM.BEM".CMBEM'
    end
    object qryAltBemVALFIS: TFloatField
      FieldName = 'VALFIS'
      Origin = '"CM.BEM".VALFIS'
    end
    object qryAltBemVALGER: TFloatField
      FieldName = 'VALGER'
      Origin = '"CM.BEM".VALGER'
    end
    object qryAltBemDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
      Origin = '"CM.BEM".DATAINICIODEP'
    end
    object qryAltBemVALDEPINI: TFloatField
      FieldName = 'VALDEPINI'
      Origin = '"CM.BEM".VALDEPINI'
    end
    object qryAltBemTAXADEP: TFloatField
      FieldName = 'TAXADEP'
      Origin = '"CM.BEM".TAXADEP'
    end
    object qryAltBemDEPLANC: TFloatField
      FieldName = 'DEPLANC'
      Origin = '"CM.BEM".DEPLANC'
    end
    object qryAltBemCMDEP: TFloatField
      FieldName = 'CMDEP'
      Origin = '"CM.BEM".CMDEP'
    end
    object qryAltBemDEPFIS: TFloatField
      FieldName = 'DEPFIS'
      Origin = '"CM.BEM".DEPFIS'
    end
    object qryAltBemDEPGER: TFloatField
      FieldName = 'DEPGER'
      Origin = '"CM.BEM".DEPGER'
    end
    object qryAltBemDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
      Origin = '"CM.BEM".DATAULTDEP'
    end
    object qryAltBemDATARECALCDEP: TDateTimeField
      FieldName = 'DATARECALCDEP'
      Origin = '"CM.BEM".DATARECALCDEP'
    end
    object qryAltBemFLGDEPREC: TFloatField
      FieldName = 'FLGDEPREC'
      Origin = '"CM.BEM".FLGDEPREC'
    end
    object qryAltBemPROPBAIXA: TFloatField
      FieldName = 'PROPBAIXA'
      Origin = '"CM.BEM".PROPBAIXA'
    end
    object qryAltBemBAIXATOTAL: TStringField
      FieldName = 'BAIXATOTAL'
      Origin = '"CM.BEM".BAIXATOTAL'
      Size = 1
    end
    object qryAltBemIDOPCIONAL: TStringField
      FieldName = 'IDOPCIONAL'
      Origin = '"CM.BEM".IDOPCIONAL'
      Size = 30
    end
    object qryAltBemUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = '"CM.BEM".UNIDNEGOC'
    end
    object qryAltBemPROCESSOAQUIS: TStringField
      FieldName = 'PROCESSOAQUIS'
      Origin = '"CM.BEM".PROCESSOAQUIS'
      Size = 30
    end
    object qryAltBemEMPENHOAQUIS: TStringField
      FieldName = 'EMPENHOAQUIS'
      Origin = '"CM.BEM".EMPENHOAQUIS'
      Size = 30
    end
    object qryAltBemPUBAUTOR: TStringField
      FieldName = 'PUBAUTOR'
      Origin = '"CM.BEM".PUBAUTOR'
      Size = 60
    end
    object qryAltBemPUBEDITORA: TStringField
      FieldName = 'PUBEDITORA'
      Origin = '"CM.BEM".PUBEDITORA'
      Size = 60
    end
    object qryAltBemPUBANO: TFloatField
      FieldName = 'PUBANO'
      Origin = '"CM.BEM".PUBANO'
    end
    object qryAltBemFLGBEMINTCONTAB: TFloatField
      FieldName = 'FLGBEMINTCONTAB'
    end
    object qryAltBemDTACONTAB: TDateTimeField
      FieldName = 'DTACONTAB'
    end
  end
  object updAltBem: TUpdateSQL
    ModifySQL.Strings = (
      'update BEM'
      'set'
      '  IDCONJUNTO = :IDCONJUNTO,'
      '  IDTERCEIRO = :IDTERCEIRO,'
      '  IDGRUPO = :IDGRUPO,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  IDCLASSEBEM = :IDCLASSEBEM,'
      '  IDMODULO = :IDMODULO,'
      '  IDITENSRECDEV = :IDITENSRECDEV,'
      '  IDFORNSERV = :IDFORNSERV,'
      '  IDSITUACAO = :IDSITUACAO,'
      '  IDIMAGEM = :IDIMAGEM,'
      '  REGISTRO = :REGISTRO,'
      '  CONTROLE = :CONTROLE,'
      '  PLACA = :PLACA,'
      '  DESBEM = :DESBEM,'
      '  IDNOTA = :IDNOTA,'
      '  COMPLNOTA = :COMPLNOTA,'
      '  DTANOTA = :DTANOTA,'
      '  NUMSERIE = :NUMSERIE,'
      '  DTAINCLUSAO = :DTAINCLUSAO,'
      '  VALHISTORICO = :VALHISTORICO,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  VALFIS = :VALFIS,'
      '  VALGER = :VALGER,'
      '  DATAINICIODEP = :DATAINICIODEP,'
      '  VALDEPINI = :VALDEPINI,'
      '  TAXADEP = :TAXADEP,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  DEPFIS = :DEPFIS,'
      '  DEPGER = :DEPGER,'
      '  DATAULTDEP = :DATAULTDEP,'
      '  DATARECALCDEP = :DATARECALCDEP,'
      '  FLGDEPREC = :FLGDEPREC,'
      '  PROPBAIXA = :PROPBAIXA,'
      '  BAIXATOTAL = :BAIXATOTAL,'
      '  IDOPCIONAL = :IDOPCIONAL,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  PROCESSOAQUIS = :PROCESSOAQUIS,'
      '  EMPENHOAQUIS = :EMPENHOAQUIS,'
      '  PUBAUTOR = :PUBAUTOR,'
      '  PUBEDITORA = :PUBEDITORA,'
      '  PUBANO = :PUBANO,'
      '  FLGBEMINTCONTAB = :FLGBEMINTCONTAB,'
      '  DTACONTAB = :DTACONTAB'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into BEM'
      
        '  (IDBEM, IDPESSOA, IDCONJUNTO, IDTERCEIRO, IDGRUPO, CODSUBCONTA' +
        ', IDCLASSEBEM, '
      
        '   IDMODULO, IDITENSRECDEV, IDFORNSERV, IDSITUACAO, IDIMAGEM, RE' +
        'GISTRO, '
      
        '   CONTROLE, PLACA, DESBEM, IDNOTA, COMPLNOTA, DTANOTA, NUMSERIE' +
        ', DTAINCLUSAO, '
      
        '   VALHISTORICO, VALORG, CMBEM, VALFIS, VALGER, DATAINICIODEP, V' +
        'ALDEPINI, '
      
        '   TAXADEP, DEPLANC, CMDEP, DEPFIS, DEPGER, DATAULTDEP, DATARECA' +
        'LCDEP, '
      
        '   FLGDEPREC, PROPBAIXA, BAIXATOTAL, IDOPCIONAL, UNIDNEGOC, PROC' +
        'ESSOAQUIS, '
      
        '   EMPENHOAQUIS, PUBAUTOR, PUBEDITORA, PUBANO, FLGBEMINTCONTAB, ' +
        'DTACONTAB)'
      'values'
      
        '  (:IDBEM, :IDPESSOA, :IDCONJUNTO, :IDTERCEIRO, :IDGRUPO, :CODSU' +
        'BCONTA, '
      
        '   :IDCLASSEBEM, :IDMODULO, :IDITENSRECDEV, :IDFORNSERV, :IDSITU' +
        'ACAO, :IDIMAGEM, '
      
        '   :REGISTRO, :CONTROLE, :PLACA, :DESBEM, :IDNOTA, :COMPLNOTA, :' +
        'DTANOTA, '
      
        '   :NUMSERIE, :DTAINCLUSAO, :VALHISTORICO, :VALORG, :CMBEM, :VAL' +
        'FIS, :VALGER, '
      
        '   :DATAINICIODEP, :VALDEPINI, :TAXADEP, :DEPLANC, :CMDEP, :DEPF' +
        'IS, :DEPGER, '
      
        '   :DATAULTDEP, :DATARECALCDEP, :FLGDEPREC, :PROPBAIXA, :BAIXATO' +
        'TAL, :IDOPCIONAL, '
      
        '   :UNIDNEGOC, :PROCESSOAQUIS, :EMPENHOAQUIS, :PUBAUTOR, :PUBEDI' +
        'TORA, :PUBANO, '
      '   :FLGBEMINTCONTAB, :DTACONTAB)')
    DeleteSQL.Strings = (
      'delete from BEM'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 200
    Top = 296
  end
end
