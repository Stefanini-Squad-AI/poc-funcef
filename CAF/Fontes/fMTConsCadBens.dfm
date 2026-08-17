inherited frmMTConsCadBens: TfrmMTConsCadBens
  Left = 465
  Top = 198
  HelpContext = 70050
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Patrimônio'
  ClientHeight = 400
  ClientWidth = 765
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 36
    Width = 765
    Height = 325
    object Label3: TLabel
      Left = 17
      Top = 8
      Width = 51
      Height = 13
      Caption = 'Conjunto'
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
    object Label6: TLabel
      Left = 295
      Top = 8
      Width = 98
      Height = 13
      Caption = 'Rateio de Custos'
    end
    object dbgBens: TwwDBGrid
      Left = 5
      Top = 132
      Width = 755
      Height = 181
      Cursor = crHandPoint
      Hint = 
        'Selecione o bem com um Duplo Clique. Ordene a lista clicando no ' +
        'cabeçalho do campo'
      Selected.Strings = (
        'PLACA'#9'15'#9'Patrimônio'
        'DESBEM'#9'76'#9'Descrição'#9'F'
        'DTAINCLUSAO'#9'12'#9'Aquisição em')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsBem
      KeyOptions = [dgEnterToTab]
      Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = True
      UseTFields = False
      OnTitleButtonClick = dbgBensTitleButtonClick
      OnDblClick = dbgBensDblClick
      IndicatorColor = icBlack
    end
    object pgctlBem: TPageControl
      Left = 5
      Top = 132
      Width = 755
      Height = 188
      ActivePage = TabIdent
      TabOrder = 4
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
        object lblStatus: TfcLabel
          Left = 174
          Top = 56
          Width = 139
          Height = 16
          Caption = 'Em Saída Temporária'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taRightJustify
          TextOptions.ExtrudeEffects.Orientation = fcTopLeft
          TextOptions.OutlineColor = clWhite
          TextOptions.ShadeColor = clMaroon
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
        end
        object pnlLivros: TPanel
          Left = 328
          Top = 48
          Width = 417
          Height = 99
          BevelOuter = bvNone
          TabOrder = 4
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
            Left = 335
            Top = 56
            Width = 23
            Height = 13
            Caption = 'Ano'
          end
          object bbtnRetornaPlaca: TBitBtn
            Left = 394
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
          object dbePubAutor: TwwDBEdit
            Left = 8
            Top = 24
            Width = 407
            Height = 21
            DataField = 'PUBAUTOR'
            DataSource = dsBem
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbePubEditora: TwwDBEdit
            Left = 8
            Top = 72
            Width = 307
            Height = 21
            DataField = 'PUBEDITORA'
            DataSource = dsBem
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbePubAno: TwwDBEdit
            Left = 335
            Top = 72
            Width = 59
            Height = 21
            DataField = 'PUBANO'
            DataSource = dsBem
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object pnlPlaca: TPanel
          Left = 328
          Top = 48
          Width = 417
          Height = 99
          BevelOuter = bvNone
          TabOrder = 3
          object Label13: TLabel
            Left = 8
            Top = 8
            Width = 48
            Height = 13
            Caption = 'Nº RFID'
          end
          object Label28: TLabel
            Left = 192
            Top = 8
            Width = 66
            Height = 13
            Caption = 'Nº de Série'
          end
          object Label43: TLabel
            Left = 8
            Top = 56
            Width = 129
            Height = 13
            Caption = 'Identificação Opcional'
          end
          object Label2: TLabel
            Left = 91
            Top = 8
            Width = 78
            Height = 13
            Caption = 'Nº Patrimônio'
          end
          object dbePlaca: TwwDBEdit
            Left = 8
            Top = 24
            Width = 72
            Height = 21
            DataField = 'PLACA'
            DataSource = dsBem
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeNumSerie: TwwDBEdit
            Left = 192
            Top = 24
            Width = 223
            Height = 21
            DataField = 'NUMSERIE'
            DataSource = dsBem
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeOpcional: TwwDBEdit
            Left = 8
            Top = 72
            Width = 386
            Height = 21
            DataField = 'IDOPCIONAL'
            DataSource = dsBem
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object bbtnLivros: TBitBtn
            Left = 394
            Top = 72
            Width = 21
            Height = 21
            Hint = 'Dados adicionais de Livros e Publicações'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
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
          object dbePatrimonio: TwwDBEdit
            Left = 93
            Top = 24
            Width = 87
            Height = 21
            DataField = 'PATRIMONIO'
            DataSource = dsBem
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object dbeDescClasse: TwwDBEdit
          Left = 8
          Top = 24
          Width = 305
          Height = 21
          DataField = 'DESCCLASSE'
          DataSource = dsBem
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeDesBem: TDBMemo
          Left = 8
          Top = 72
          Width = 305
          Height = 69
          DataField = 'DESBEM'
          DataSource = dsBem
          TabOrder = 1
        end
        object dbeSituacao: TwwDBEdit
          Left = 520
          Top = 24
          Width = 223
          Height = 21
          DataField = 'DESCSITUACAO'
          DataSource = dsBem
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object Panel1: TPanel
          Left = 336
          Top = 24
          Width = 175
          Height = 22
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 5
          object edControle: TEdit
            Left = 0
            Top = 0
            Width = 174
            Height = 21
            TabOrder = 0
          end
        end
      end
      object TabDocAquis: TTabSheet
        Caption = 'Documento de Entrada do Bem'
        Enabled = False
        object Label49: TLabel
          Left = 8
          Top = 56
          Width = 65
          Height = 13
          Caption = 'Fornecedor'
        end
        object Label44: TLabel
          Left = 8
          Top = 104
          Width = 84
          Height = 13
          Caption = 'Valor Histórico'
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
        object Label9: TLabel
          Left = 8
          Top = 8
          Width = 76
          Height = 13
          Caption = 'Data Entrada'
        end
        object Label48: TLabel
          Left = 168
          Top = 104
          Width = 48
          Height = 13
          Caption = 'Terceiro'
        end
        object Label50: TLabel
          Left = 456
          Top = 8
          Width = 53
          Height = 13
          Caption = 'Processo'
        end
        object Label51: TLabel
          Left = 616
          Top = 8
          Width = 53
          Height = 13
          Caption = 'Empenho'
        end
        object dbeFornec: TwwDBEdit
          Left = 8
          Top = 72
          Width = 733
          Height = 21
          DataField = 'NOMEFORN'
          DataSource = dsBem
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeTerceiro: TwwDBEdit
          Left = 168
          Top = 120
          Width = 573
          Height = 21
          DataField = 'NOMETERC'
          DataSource = dsBem
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeDtaInclusao: TCMDateTimePicker
          Left = 8
          Top = 24
          Width = 113
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DTAINCLUSAO'
          DataSource = dsBem
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
        object dbeIdNota: TwwDBEdit
          Left = 136
          Top = 24
          Width = 105
          Height = 21
          DataField = 'IDNOTA'
          DataSource = dsBem
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeComplNota: TwwDBEdit
          Left = 240
          Top = 24
          Width = 73
          Height = 21
          DataField = 'COMPLNOTA'
          DataSource = dsBem
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeDtaNota: TCMDateTimePicker
          Left = 328
          Top = 24
          Width = 113
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DTANOTA'
          DataSource = dsBem
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
        object dbeValHistorico: TDBRealEdit
          Left = 8
          Top = 120
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 6
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VALHISTORICO'
          DataSource = dsBem
        end
        object dbeProcesso: TwwDBEdit
          Left = 456
          Top = 24
          Width = 145
          Height = 21
          DataField = 'PROCESSOAQUIS'
          DataSource = dsBem
          TabOrder = 7
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeEmpenho: TwwDBEdit
          Left = 616
          Top = 24
          Width = 123
          Height = 21
          DataField = 'EMPENHOAQUIS'
          DataSource = dsBem
          TabOrder = 8
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object TabContab: TTabSheet
        Caption = 'Dados Contábeis do Bem'
        Enabled = False
        object Label8: TLabel
          Left = 8
          Top = 8
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
          Left = 384
          Top = 104
          Width = 108
          Height = 13
          Caption = 'Inicio Depreciação'
        end
        object Label18: TLabel
          Left = 8
          Top = 56
          Width = 56
          Height = 13
          Caption = 'SubConta'
        end
        object Label17: TLabel
          Left = 8
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
        object dbeDescGrupo: TwwDBEdit
          Left = 8
          Top = 24
          Width = 353
          Height = 21
          DataField = 'DESCGRUPO'
          DataSource = dsBem
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeDescSubConta: TwwDBEdit
          Left = 8
          Top = 72
          Width = 353
          Height = 21
          DataField = 'DESCSUBCONTA'
          DataSource = dsBem
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeAtivProj: TwwDBEdit
          Left = 8
          Top = 120
          Width = 353
          Height = 21
          DataField = 'DESCATIVPROJ'
          DataSource = dsBem
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeDataIniDep: TCMDateTimePicker
          Left = 384
          Top = 120
          Width = 121
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAINICIODEP'
          DataSource = dsBem
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
        object dbeTaxaDep: TDBRealEdit
          Left = 384
          Top = 72
          Width = 89
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 4
          WordWrap = False
          IntDigits = 3
          DecDigits = 6
          NumberFormat = fNumber
          Signal = False
          DataField = 'TAXADEP1'
          DataSource = dsBem
        end
        object dbeDtaContab: TCMDateTimePicker
          Left = 384
          Top = 24
          Width = 137
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DTACONTAB'
          DataSource = dsBem
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
      end
      object TabValores: TTabSheet
        Caption = 'Valores Atuais do Bem'
        Enabled = False
        object pnlValores: TPanel
          Left = 0
          Top = 0
          Width = 747
          Height = 160
          Align = alTop
          Enabled = False
          TabOrder = 0
          object fcLabel2: TfcLabel
            Left = 20
            Top = 28
            Width = 35
            Height = 16
            Caption = 'Custo'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
          end
          object fcLabel3: TfcLabel
            Left = 486
            Top = 4
            Width = 79
            Height = 16
            Caption = 'Reavaliação'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
            Transparent = True
          end
          object fcLabel4: TfcLabel
            Left = 657
            Top = 4
            Width = 32
            Height = 16
            Caption = 'Total'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
            Transparent = True
          end
          object fcLabel5: TfcLabel
            Left = 342
            Top = 5
            Width = 62
            Height = 16
            Caption = 'Aquisição'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
            Transparent = True
          end
          object fcLabel6: TfcLabel
            Left = 20
            Top = 46
            Width = 138
            Height = 16
            Caption = 'Parcelas Reavaliação'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
          end
          object fcLabel8: TfcLabel
            Left = 20
            Top = 64
            Width = 202
            Height = 16
            Caption = 'Correção Monetária Acumulada'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
          end
          object fcLabel10: TfcLabel
            Left = 20
            Top = 82
            Width = 156
            Height = 16
            Caption = 'Depreciação Acumulada'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
          end
          object fcLabel11: TfcLabel
            Left = 20
            Top = 100
            Width = 275
            Height = 16
            Caption = 'Correção Monetária da Deprec. Acumulada'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
          end
          object fcLabel12: TfcLabel
            Left = 20
            Top = 118
            Width = 94
            Height = 16
            Caption = 'Saldo Contábil'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
          end
          object lblCotacaoBem: TfcLabel
            Left = 20
            Top = 136
            Width = 113
            Height = 16
            Caption = 'Valor de Mercado'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
          end
          object eSoma1: TRealEdit
            Left = 609
            Top = 28
            Width = 128
            Height = 18
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object eSoma2: TRealEdit
            Left = 609
            Top = 46
            Width = 128
            Height = 18
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object eSoma4: TRealEdit
            Left = 609
            Top = 64
            Width = 128
            Height = 18
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object eSoma6: TRealEdit
            Left = 609
            Top = 82
            Width = 128
            Height = 18
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object eSoma7: TRealEdit
            Left = 609
            Top = 100
            Width = 128
            Height = 18
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object eSoma8: TRealEdit
            Left = 609
            Top = 118
            Width = 128
            Height = 18
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object edAquisicao1: TRealEdit
            Left = 312
            Top = 28
            Width = 128
            Height = 18
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object edAquisicao2: TRealEdit
            Left = 312
            Top = 46
            Width = 128
            Height = 18
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object edAquisicao4: TRealEdit
            Left = 312
            Top = 64
            Width = 128
            Height = 18
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object edAquisicao6: TRealEdit
            Left = 312
            Top = 82
            Width = 128
            Height = 18
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object edAquisicao7: TRealEdit
            Left = 312
            Top = 100
            Width = 128
            Height = 18
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object edAquisicao8: TRealEdit
            Left = 312
            Top = 118
            Width = 128
            Height = 18
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object edReaval1: TRealEdit
            Left = 463
            Top = 28
            Width = 128
            Height = 18
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object edReaval2: TRealEdit
            Left = 463
            Top = 46
            Width = 128
            Height = 18
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object edReaval4: TRealEdit
            Left = 463
            Top = 64
            Width = 128
            Height = 18
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 14
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object edReaval6: TRealEdit
            Left = 463
            Top = 82
            Width = 128
            Height = 18
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 15
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object edReaval7: TRealEdit
            Left = 463
            Top = 100
            Width = 128
            Height = 18
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 16
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object edReaval8: TRealEdit
            Left = 463
            Top = 118
            Width = 128
            Height = 18
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 17
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
          object eCotacaoBem: TRealEdit
            Left = 312
            Top = 136
            Width = 128
            Height = 18
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 18
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
          end
        end
      end
    end
    object dbeDescConjunto: TDBMemo
      Left = 16
      Top = 24
      Width = 256
      Height = 57
      DataField = 'DESCCONJUNTO'
      DataSource = dsConjunto
      MaxLength = 200
      TabOrder = 0
    end
    object dbeDescLocalizacao: TwwDBEdit
      Left = 16
      Top = 104
      Width = 361
      Height = 21
      DataField = 'DESCLOCAL'
      DataSource = dsConjunto
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeNomeResponsavel: TwwDBEdit
      Left = 392
      Top = 104
      Width = 359
      Height = 21
      DataField = 'NOMERESP'
      DataSource = dsConjunto
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbgRateio: TwwDBGrid
      Left = 295
      Top = 24
      Width = 456
      Height = 57
      Selected.Strings = (
        'CODCENTROCUSTO'#9'12'#9'Centro de Custo'
        'DESCCCUSTO'#9'41'#9'Descrição'#9'F'
        'PARTICIPACAO'#9'6'#9'    (%)')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsRateioN
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
      TabOrder = 3
      TitleAlignment = taLeftJustify
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
  inherited Dock971: TDock97
    Top = 361
    Width = 765
    inherited tb97Fundo: TToolbar97
      Left = 455
      DockPos = 455
      inherited sep1: TToolbarSep97
        Left = 213
      end
      object bbtnSelBem: TToolbarButton97 [1]
        Left = 0
        Top = 0
        Width = 130
        Height = 33
        Alignment = taLeftJustify
        Caption = 'Seleciona Bem'
        Flat = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF3333333333333FFF3FF3FFFFF3333777003000003333
          3FFF77F777773F333777400FFFFF033333337773333F7F33333F40FFFF000333
          33FF77F3337773F3337740FFFFFFF03333FF77F3333FF7FFF37740FFFF000000
          333377F3337777773F3F40FFFFFFFFFF03CC77F33FFFFFFF737740FF00000000
          33CC77FF777777773377000FFF03333333337773FF733333333F333000333333
          33FF333777333333337733333333333333FF3333333333333377333333333333
          333333333333333333FF3333333333333FFF3333333333333777333333333333
          3FFF333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = bbtnSelBemClick
      end
      object ToolbarSep971: TToolbarSep97 [2]
        Left = 130
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 132
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 215
        HelpContext = 70050
      end
    end
  end
  object Dock972: TDock97 [2]
    Left = 0
    Top = 0
    Width = 765
    Height = 36
    AllowDrag = False
    Background.Data = {
      760F0000424D760F0000000000007600000028000000800000003C0000000100
      040000000000000F000000000000000000001000000000000000000000008080
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      777777777777171717777777777777177771777777777777777077F7FF7FFFF7
      77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
      777777777771717717777777777777777717777777777777777777777FFFFF7F
      7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
      77777777777777171777777777777777717777777777777777777777777FF7FF
      7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
      7777777777771771777777777777777771777777777777777777777777777FFF
      FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
      777777777777771777777777777777777777777777777777777777777777777F
      F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
      7777777777777777777777777777777777777777777777777777777777777777
      FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
      7777777777777777777777777777777777777777777777777777777777777777
      7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
      7777777777777777777777777777777777777777777777777777777777777771
      77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
      7777777777777177777777777777777777777777777777777777777777777777
      777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
      7777777777777777771777777777777777777777777777777777777777777777
      7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
      7777777777777717771777777777777777777777777777777777777777777777
      77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
      7777777777777771777777777777777777777777777777777777777777777777
      777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
      7777777777777777777777777777777777777777777777777777777777777777
      777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
      7777777777777777177777777777777777777777777777777777777777777777
      7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
      7777777777777777717777777777777777777777777777777777777777777777
      7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
      7777777777777777777771777777777777777777777777777777777777777777
      7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
      F7F7777777777777771777777777177777777777777777777777777777777777
      77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
      777F7F7777777777777177177771717777777777777777777777777777777777
      77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
      77777F7F77777777777717771777777777777777777777777777777777777777
      777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
      1777777777777777777771717717777177777777777777777777777777777777
      777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
      7777777777771777777777177771777777777777777777777777777777777777
      77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
      7777777777777777777771777777777777777777777777777777777777777777
      777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
      7777777777171777777717777777777777777777777777777777777777777777
      77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
      7777777777777177777771777777777777777777777777777777777777777777
      777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
      7777777777777777777771177777777777777777777777777777777777777777
      7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
      7777777777777777777777777777777777777777777777777777777777777777
      7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
      7777777777777777777771717777777777777777777777777777777777777777
      777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
      7777777777777777777777171777777777777777777777777777777777777777
      71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
      7777777777777777777777177777777777777777777777777777777777777717
      77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
      77777777777777777777777777777777777F7777777777777777777777777171
      7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
      771777777777777777777777777777777177F777777777777777777777777717
      171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
      7777777777777777777777777777777777777F77777777777777777777777777
      77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
      7177777177777777777777777777777777777FF7F77771777777777777777777
      1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
      7777777717777777777777777777777777777777777777777777777777777777
      717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
      7177777777777777777777777777777777771777777777777777777777777777
      77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
      777777F777777777777777777777777777777777717177717777777777777777
      77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
      171777F7F7777777777777177777777777777777777777777777777777777777
      777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
      7777777F77777777777777777777777777777777777777777777777777777777
      77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
      7717777F77777777777777717177777777777777777777777777777777777777
      7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
      777777777F777777777777777717777777777777777777777777777777777777
      777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
      7777777777777777777777771777777777777777777777777777777777777777
      77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
      7777777777777777777777777717177777777771777777777777777777777777
      7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
      7777777777777177777777777777777777777717177777777777777777777777
      77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
      7777777777717777777777777717177777777777777777777777777777777777
      777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
      777777777717171717777777777777777777777771777777777F777777777777
      777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
      77777777171777777777777777777777777777777777777777F7F77777777777
      77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
      7777777777171777777777777777777777777777777777777777777777777777
      777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
      7777777717177777777777777777777777777777777777777777777777777777
      77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
      7777777777171777777777777777777777777777777777777777777777777777
      7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
      77777777777777777F7F77777717777777777777777777777777777771777777
      7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
      77777777777777777F7F7F777777777777777777777777777777771777777777
      77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
      777777777777777777FFF77F7777717777777777777777777777777777177777
      77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
      77F7777777777777777777F77777777777777777777777777777777777777777
      77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
      F77777777777777777777777F7F7777777777777777777777777777777777777
      777777777717777777777777777777777777717777777777777F7F7F7F77F77F
      77F77777777F77777717777777F7777777777777777777777777777777777777
      77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
      7F77F77777777F77777717777777777777777777777777777777777777777777
      7777777777771777777777777777777777777777777777777F77F7F7F777F777
      F77F777777777777771771777777771777777777777777777777777777777777
      777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
      F7F7777777777777777717171777777777777777777777777777777777777777
      77777777777771777777777777777177777777777771777777777777F777F777
      7777777777777777777171717177771777777777777777777777777777777777
      77777777777777777777777777777777777777777777777777777F7F7F7F7777
      F77F77F777777777777771771717177777777777777777777777777777777777
      7777777777777777777777777777777777777777777177777777}
    BoundLines = [blTop, blBottom]
    object lblUltDep: TfcLabel
      Left = 485
      Top = 7
      Width = 261
      Height = 20
      Caption = 'Último Fechamento : 99/99/9999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
      Transparent = True
    end
    object Toolbar971: TToolbar97
      Left = 0
      Top = 0
      ActivateParent = False
      Caption = 'Toolbar971'
      CloseButton = False
      DefaultDock = Dock972
      DockPos = 0
      TabOrder = 0
      object bbtnSelConjunto: TToolbarButton97
        Left = 0
        Top = 0
        Width = 150
        Height = 30
        Alignment = taLeftJustify
        Caption = 'Pesquisa Conjunto'
        Flat = False
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
        Opaque = False
        OnClick = bbtnSelConjuntoClick
      end
      object bbtnSelConjBem: TToolbarButton97
        Left = 150
        Top = 0
        Width = 140
        Height = 30
        Alignment = taLeftJustify
        Caption = 'Pesquisa Bem'
        Flat = False
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
        Opaque = False
        OnClick = bbtnSelConjBemClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 402
    Top = 455
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object sqlBem: TCMSqlParams
    SQL.Strings = (
      
        'SELECT B.*, G.NOME AS DESCGRUPO, S.DESCSITUACAO, F.NOME AS NOMEF' +
        'ORN,'
      '       T.NOME AS NOMETERC, CB.DESCRICAO AS DESCCLASSE,'
      '       SC.NOMESUBCONTA AS DESCSUBCONTA, AP.NOME AS DESCATIVPROJ,'
      '       BD.TAXADEP AS TAXADEP1,'
      '       B.PATRIMONIO        /*116473*/'
      'FROM BEM         B,'
      '     BEMXDEP     BD,'
      '     PLANOGRUPO  PG,'
      '     GRUPO       G,'
      '     PESSOA      F,'
      '     PESSOA      T,'
      '     SITUACAO    S,'
      '     CLASSEDEBEM CB,'
      '     SUBCONTA    SC,'
      '     UNIDNEGOCIO AP'
      'WHERE (B.IDCONJUNTO  = :IDCONJUNTO)'
      '  AND (B.IDPESSOA    = :IDPESSOA)'
      '  AND (BD.MOECODIGO  = :MOECODIGO)'
      '  AND (BD.IDBEMXDEP  = :IDTAXADEP)'
      '  AND (BD.IDBEM      = B.IDBEM)'
      '  AND (BD.IDPESSOA   = B.IDPESSOA)'
      '  AND (B.IDGRUPO     = PG.IDGRUPO)'
      '  AND (B.IDPESSOA    = PG.IDPESSOA)'
      '  AND (PG.IDGRUPO    = G.IDGRUPO)'
      '  AND (B.IDFORNSERV  = F.IDPESSOA(+))'
      '  AND (B.IDTERCEIRO  = T.IDPESSOA(+))'
      '  AND (B.IDSITUACAO  = S.IDSITUACAO(+))'
      '  AND (B.IDCLASSEBEM = CB.IDCLASSEBEM(+))'
      '  AND (B.CODSUBCONTA = SC.CODSUBCONTA(+))'
      '  AND (B.IDPESSOA    = SC.IDPESSOA(+))'
      '  AND (B.UNIDNEGOC   = AP.UNIDNEGOC(+))'
      '  AND (B.IDPESSOA    = AP.IDPESSOA(+))'
      ''
      'ORDER BY B.PLACA'
      ' ')
    ClientDataSet = cdsBem
    Left = 216
    Top = 90
  end
  object dsBem: TwwDataSource
    AutoEdit = False
    DataSet = cdsBem
    Left = 216
    Top = 76
  end
  object cdsBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsBemAfterScroll
    Left = 216
    Top = 62
  end
  object MSBem: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona um Bem'
    Colunas.Strings = (
      'BEM.PLACA'
      'BEM.PATRIMONIO'
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
      'BEM.CONTROLE')
    TipodeDado.Strings = (
      'N'
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
      '')
    Descricao.Strings = (
      'Nº RFID'
      'Nº Patrimonio'
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
      'Controle')
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
      'N'
      'N')
    Tabelas.Strings = (
      'BEM'
      'CONJUNTO'
      'GRUPO'
      'LOCALIZACAO'
      'CLASSEDEBEM'
      'PESSOA PESSOARESP'
      'PESSOA PESSOAFORN')
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
      'CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO(+)'
      'CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA(+)'
      'CONJUNTO.IDRESPONSAVEL=PESSOARESP.IDPESSOA(+)'
      'BEM.IDGRUPO=GRUPO.IDGRUPO(+)'
      'BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM(+)'
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
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
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
    ComparaMaiuscula.Strings = (
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
    Left = 216
    Top = 48
  end
  object dsRateioN: TwwDataSource
    AutoEdit = False
    DataSet = cdsRateioN
    Left = 547
    Top = 76
  end
  object cdsRateioN: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 547
    Top = 62
  end
  object sqlRateioN: TCMSqlParams
    SQL.Strings = (
      'SELECT RD.CODCENTROCUSTO, CC.NOME AS DESCCCUSTO, RD.PARTICIPACAO'
      'FROM RATEIODEPRECIACAO RD,'
      '     CENTCUST CC'
      'WHERE (RD.IDEMPRESA  = :PIDPESSOA)'
      '  AND (RD.IDCONJUNTO = :PIDCONJUNTO)'
      '  AND (RD.CODCENTROCUSTO = CC.CODCENTROCUSTO)'
      '  AND (RD.IDEMPRESA      = CC.IDEMPRESA)'
      '')
    ClientDataSet = cdsRateioN
    Left = 548
    Top = 48
  end
  object dsConjunto: TwwDataSource
    AutoEdit = False
    DataSet = cdsConjunto
    Left = 144
    Top = 75
  end
  object cdsConjunto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 61
  end
  object MSConjunto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Conjunto'
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
      'CONJUNTO.IDLOCALIZACAO = LOCALIZACAO.IDLOCALIZACAO(+)'
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
    Left = 144
    Top = 48
  end
  object cdsUltFechamento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 433
    Top = 20
  end
  object sqlUltFechamento: TCMSqlParams
    SQL.Strings = (
      'SELECT MAX(PG.DATAULTFEC) AS ULTDEP'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      'WHERE (G.FLGIMOVEL = 0)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.IDGRUPO   = PG.IDGRUPO)')
    ClientDataSet = cdsUltFechamento
    Left = 434
    Top = 6
  end
end
