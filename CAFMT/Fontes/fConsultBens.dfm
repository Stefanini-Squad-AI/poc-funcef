inherited frmConsultBens: TfrmConsultBens
  Left = 15
  Top = 119
  HelpContext = 70050
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Patrimônio'
  ClientHeight = 398
  ClientWidth = 765
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 765
    Height = 359
    object Label3: TLabel
      Left = 17
      Top = 48
      Width = 51
      Height = 13
      Caption = 'Conjunto'
    end
    object Label4: TLabel
      Left = 16
      Top = 128
      Width = 69
      Height = 13
      Caption = 'Localização'
    end
    object Label5: TLabel
      Left = 392
      Top = 128
      Width = 74
      Height = 13
      Caption = 'Responsável'
    end
    object Label6: TLabel
      Left = 295
      Top = 48
      Width = 98
      Height = 13
      Caption = 'Rateio de Custos'
    end
    object dbgBens: TwwDBGrid
      Left = 5
      Top = 177
      Width = 756
      Height = 176
      Cursor = crHandPoint
      Hint = 
        'Selecione o bem com um Duplo Clique. Ordene a lista clicando no ' +
        'cabeçalho do campo'
      Selected.Strings = (
        'PLACA'#9'10'#9'Patrimônio'
        'DESBEM'#9'70'#9'Descrição'
        'DTAINCLUSAO'#9'10'#9'Aquisição em')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsSelBem
      KeyOptions = [dgEnterToTab]
      Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = True
      OnTitleButtonClick = dbgBensTitleButtonClick
      OnDblClick = dbgBensDblClick
      IndicatorColor = icBlack
    end
    object pgctlBem: TPageControl
      Left = 5
      Top = 177
      Width = 755
      Height = 178
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
        object lblBaixado: TfcLabel
          Left = 260
          Top = 56
          Width = 53
          Height = 16
          Caption = 'Baixado'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.ExtrudeEffects.Orientation = fcTopLeft
          TextOptions.OutlineColor = clWhite
          TextOptions.ShadeColor = clRed
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
            DataSource = dsSelBem
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
            DataSource = dsSelBem
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
            DataSource = dsSelBem
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
          object Label43: TLabel
            Left = 8
            Top = 56
            Width = 129
            Height = 13
            Caption = 'Identificação Opcional'
          end
          object dbePlaca: TwwDBEdit
            Left = 8
            Top = 24
            Width = 169
            Height = 21
            DataField = 'PLACA'
            DataSource = dsSelBem
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
            DataSource = dsSelBem
            TabOrder = 1
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
            DataSource = dsSelBem
            TabOrder = 2
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
        end
        object dbeDescClasse: TwwDBEdit
          Left = 8
          Top = 24
          Width = 305
          Height = 21
          DataField = 'DESCCLASSE'
          DataSource = dsSelBem
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
          DataSource = dsSelBem
          TabOrder = 1
        end
        object dbeSituacao: TwwDBEdit
          Left = 520
          Top = 24
          Width = 223
          Height = 21
          DataField = 'DESCSITUACAO'
          DataSource = dsSelBem
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
            Width = 169
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
          DataSource = dsSelBem
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
          DataSource = dsSelBem
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
          DataSource = dsSelBem
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
          DataSource = dsSelBem
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
          DataSource = dsSelBem
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
          DataSource = dsSelBem
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
          DataSource = dsSelBem
        end
        object dbeProcesso: TwwDBEdit
          Left = 456
          Top = 24
          Width = 145
          Height = 21
          DataField = 'PROCESSOAQUIS'
          DataSource = dsSelBem
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
          DataSource = dsSelBem
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
          Top = 8
          Width = 73
          Height = 13
          Caption = 'Depreciação'
        end
        object Label11: TLabel
          Left = 480
          Top = 32
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
          Top = 8
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
          Left = 384
          Top = 56
          Width = 104
          Height = 13
          Caption = 'Atividade/ Projeto'
        end
        object dbeDescGrupo: TwwDBEdit
          Left = 8
          Top = 24
          Width = 337
          Height = 21
          DataField = 'DESCGRUPO'
          DataSource = dsSelBem
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeDescSubConta: TwwDBEdit
          Left = 8
          Top = 72
          Width = 337
          Height = 21
          DataField = 'DESCSUBCONTA'
          DataSource = dsSelBem
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeAtivProj: TwwDBEdit
          Left = 384
          Top = 72
          Width = 337
          Height = 21
          DataField = 'DESCATIVPROJ'
          DataSource = dsSelBem
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeDataIniDep: TCMDateTimePicker
          Left = 528
          Top = 24
          Width = 121
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAINICIODEP'
          DataSource = dsSelBem
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
          Top = 24
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
          DataField = 'TAXADEP'
          DataSource = dsSelBem
        end
      end
      object TabValores: TTabSheet
        Caption = 'Valores Atuais do Bem'
        Enabled = False
        object GroupBox1: TGroupBox
          Left = 1
          Top = 0
          Width = 248
          Height = 145
          Caption = 'Valores em Moeda Corrente'
          TabOrder = 0
          object Label15: TLabel
            Left = 19
            Top = 19
            Width = 56
            Height = 13
            Caption = 'Aquisição'
            Layout = tlCenter
          end
          object Label20: TLabel
            Left = 19
            Top = 43
            Width = 82
            Height = 13
            Caption = 'C.M.Aquisição'
            Layout = tlCenter
          end
          object Label21: TLabel
            Left = 19
            Top = 67
            Width = 73
            Height = 13
            Caption = 'Depreciação'
            Layout = tlCenter
          end
          object Label22: TLabel
            Left = 19
            Top = 91
            Width = 72
            Height = 13
            Caption = 'C.M.Deprec.'
            Layout = tlCenter
          end
          object Label2: TLabel
            Left = 19
            Top = 115
            Width = 50
            Height = 13
            Caption = 'Residual'
            Layout = tlCenter
          end
          object dbeValOrg: TDBRealEdit
            Left = 115
            Top = 19
            Width = 105
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
            DataField = 'VALORG0'
            DataSource = dsSldCtb
          end
          object dbeCmBem: TDBRealEdit
            Left = 115
            Top = 43
            Width = 105
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'CMBEM0'
            DataSource = dsSldCtb
          end
          object dbeDepLanc: TDBRealEdit
            Left = 115
            Top = 67
            Width = 105
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
            DataField = 'DEPLANC0'
            DataSource = dsSldCtb
          end
          object dbeCmDep: TDBRealEdit
            Left = 115
            Top = 91
            Width = 105
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'CMDEP0'
            DataSource = dsSldCtb
          end
          object DBRealEdit1: TDBRealEdit
            Left = 115
            Top = 115
            Width = 105
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 4
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VALCTB0'
            DataSource = dsSldCtb
          end
        end
        object GroupBox4: TGroupBox
          Left = 256
          Top = 0
          Width = 489
          Height = 145
          Caption = 'Última Reavaliação'
          TabOrder = 1
          object Label37: TLabel
            Left = 16
            Top = 24
            Width = 87
            Height = 13
            Caption = 'Valor do Laudo'
          end
          object Label41: TLabel
            Left = 344
            Top = 24
            Width = 28
            Height = 13
            Caption = 'Data'
          end
          object Label42: TLabel
            Left = 540
            Top = 16
            Width = 49
            Height = 13
            Caption = 'Vida Útil'
          end
          object Label45: TLabel
            Left = 536
            Top = 56
            Width = 75
            Height = 13
            Caption = 'Observações'
          end
          object Label19: TLabel
            Left = 185
            Top = 24
            Width = 49
            Height = 13
            Caption = 'Vida Útil'
          end
          object Label23: TLabel
            Left = 248
            Top = 39
            Width = 37
            Height = 13
            Caption = 'Meses'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object Label24: TLabel
            Left = 17
            Top = 80
            Width = 75
            Height = 13
            Caption = 'Observações'
          end
          object dbeReavValOrg: TDBRealEdit
            Left = 17
            Top = 40
            Width = 112
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
            DataField = 'VALORGLAUDO'
            DataSource = dsSelBemReav
          end
          object dbeReavData: TCMDateTimePicker
            Left = 344
            Top = 40
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAREAVALIACAO'
            DataSource = dsSelBemReav
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
          object dbeReavTaxaDep: TDBRealEdit
            Left = 540
            Top = 32
            Width = 73
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
            DataField = 'TAXADEP'
            DataSource = dsSelBemReav
          end
          object dbeReavObs: TwwDBEdit
            Left = 536
            Top = 72
            Width = 137
            Height = 21
            DataField = 'OBSREAVAL'
            DataSource = dsSelBemReav
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeReavVidaUtil: TDBRealEdit
            Left = 184
            Top = 40
            Width = 57
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 4
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
            DataField = 'VIDAUTIL'
            DataSource = dsSelBemReav
          end
          object dbeObs: TwwDBEdit
            Left = 16
            Top = 96
            Width = 449
            Height = 21
            DataField = 'OBSREAVAL'
            DataSource = dsSelBemReav
            TabOrder = 5
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
      end
    end
    object dbeDescConjunto: TDBMemo
      Left = 16
      Top = 64
      Width = 256
      Height = 57
      DataField = 'DESCCONJUNTO'
      DataSource = dsSelConjunto
      MaxLength = 200
      TabOrder = 0
    end
    object dbeDescLocalizacao: TwwDBEdit
      Left = 16
      Top = 144
      Width = 361
      Height = 21
      DataField = 'DESCLOCALIZACAO'
      DataSource = dsSelConjunto
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeNomeResponsavel: TwwDBEdit
      Left = 392
      Top = 144
      Width = 359
      Height = 21
      DataField = 'DESCRESPONSAVEL'
      DataSource = dsSelConjunto
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbgRateio: TwwDBGrid
      Left = 295
      Top = 64
      Width = 456
      Height = 57
      Selected.Strings = (
        'CODCENTROCUSTO'#9'12'#9'Centro de Custo'
        'DESCCCUSTO'#9'35'#9'Descrição'
        'PARTICIPACAO'#9'6'#9'    (%)')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsRateio
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
      IndicatorColor = icBlack
    end
    object Dock972: TDock97
      Left = 5
      Top = 5
      Width = 755
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
  end
  inherited Dock971: TDock97
    Top = 359
    Width = 765
    inherited tb97Fundo: TToolbar97
      Left = 455
      DockPos = 455
      inherited sep1: TToolbarSep97
        Left = 212
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
        Left = 214
        HelpContext = 70050
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 755
    Top = 515
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
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
      'WHERE (C.IDCONJUNTO    = :PIDCONJUNTO)'
      '  AND (C.IDLOCALIZACAO = L.IDLOCALIZACAO(+))'
      '  AND (C.IDRESPONSAVEL = P.IDPESSOA(+))'
      'ORDER BY C.DESCCONJUNTO'
      '')
    ValidateWithMask = True
    Left = 136
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONJUNTO'
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
  object dsSelConjunto: TwwDataSource
    AutoEdit = False
    DataSet = qrySelConjunto
    Left = 216
    Top = 64
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
    Left = 440
    Top = 64
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
    Left = 632
    Top = 64
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
      DisplayWidth = 12
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryRateioDESCCCUSTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCCCUSTO'
      Size = 30
    end
    object qryRateioPARTICIPACAO: TFloatField
      DisplayLabel = '    (%)'
      DisplayWidth = 6
      FieldName = 'PARTICIPACAO'
    end
  end
  object dsRateio: TwwDataSource
    AutoEdit = False
    DataSet = qryRateio
    Left = 680
    Top = 64
  end
  object qrySelBem: TwwQuery
    AfterScroll = qrySelBemAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT B.*, G.NOME AS DESCGRUPO, S.DESCSITUACAO, F.NOME AS NOMEF' +
        'ORN,'
      '       T.NOME AS NOMETERC, CB.DESCRICAO AS DESCCLASSE,'
      '       SC.NOMESUBCONTA AS DESCSUBCONTA, AP.NOME AS DESCATIVPROJ'
      'FROM BEM         B,'
      '     GRUPO       G,'
      '     PESSOA      F,'
      '     PESSOA      T,'
      '     SITUACAO    S,'
      '     CLASSEDEBEM CB,'
      '     SUBCONTA    SC,'
      '     UNIDNEGOCIO AP'
      'WHERE (B.IDCONJUNTO  = :PIDCONJUNTO)'
      '  AND (B.IDGRUPO     = G.IDGRUPO(+))'
      '  AND (B.IDFORNSERV  = F.IDPESSOA(+))'
      '  AND (B.IDTERCEIRO  = T.IDPESSOA(+))'
      '  AND (B.IDSITUACAO  = S.IDSITUACAO(+))'
      '  AND (B.IDCLASSEBEM = CB.IDCLASSEBEM(+))'
      '  AND (B.CODSUBCONTA = SC.CODSUBCONTA(+))'
      '  AND (B.UNIDNEGOC   = AP.UNIDNEGOC(+))'
      '')
    ValidateWithMask = True
    Left = 40
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONJUNTO'
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
    object qrySelBemDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
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
    object qrySelBemNOMETERC: TStringField
      FieldName = 'NOMETERC'
      Size = 60
    end
    object qrySelBemDESCCLASSE: TStringField
      FieldName = 'DESCCLASSE'
      Size = 60
    end
    object qrySelBemDESCSUBCONTA: TStringField
      FieldName = 'DESCSUBCONTA'
      Size = 60
    end
    object qrySelBemDESCATIVPROJ: TStringField
      FieldName = 'DESCATIVPROJ'
      Size = 25
    end
  end
  object dsSelBem: TwwDataSource
    AutoEdit = False
    DataSet = qrySelBem
    Left = 96
    Top = 352
  end
  object qrySelBemReav: TwwQuery
    OnCalcFields = qrySelBemReavCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.*, HM.OBSREAVAL, HM.VALORGLAUDO'
      'FROM REAVALIACAO R, HISTORICOMOVIMENTACAO HM'
      'WHERE (R.IDBEM    = :PIDBEM)'
      '  AND (R.IDPESSOA = :PIDPESSOA)'
      '  AND (R.FLGULTREAVAL = 1)'
      '  AND (HM.IDTIPOMOVIMENTACAO = 08)'
      '  AND (R.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      ''
      ' ')
    ValidateWithMask = True
    Left = 176
    Top = 352
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
    object qrySelBemReavIDREAVALIACAO: TFloatField
      FieldName = 'IDREAVALIACAO'
    end
    object qrySelBemReavIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qrySelBemReavIDMOVIMENTACAO: TFloatField
      FieldName = 'IDMOVIMENTACAO'
    end
    object qrySelBemReavVALORG: TFloatField
      FieldName = 'VALORG'
    end
    object qrySelBemReavIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qrySelBemReavVALFIS: TFloatField
      FieldName = 'VALFIS'
    end
    object qrySelBemReavDEPFIS: TFloatField
      FieldName = 'DEPFIS'
    end
    object qrySelBemReavVALGER: TFloatField
      FieldName = 'VALGER'
    end
    object qrySelBemReavDEPGER: TFloatField
      FieldName = 'DEPGER'
    end
    object qrySelBemReavDEPLANC: TFloatField
      FieldName = 'DEPLANC'
    end
    object qrySelBemReavCMBEM: TFloatField
      FieldName = 'CMBEM'
    end
    object qrySelBemReavCMDEP: TFloatField
      FieldName = 'CMDEP'
    end
    object qrySelBemReavDATAREAVALIACAO: TDateTimeField
      FieldName = 'DATAREAVALIACAO'
    end
    object qrySelBemReavFLGDEPREC: TFloatField
      FieldName = 'FLGDEPREC'
    end
    object qrySelBemReavFLGULTREAVAL: TFloatField
      FieldName = 'FLGULTREAVAL'
    end
    object qrySelBemReavOBSREAVAL: TStringField
      FieldName = 'OBSREAVAL'
      Size = 60
    end
    object qrySelBemReavVALORGLAUDO: TFloatField
      FieldName = 'VALORGLAUDO'
    end
    object qrySelBemReavVIDAUTIL: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'VIDAUTIL'
      Calculated = True
    end
    object qrySelBemReavTAXADEP: TFloatField
      FieldName = 'TAXADEP'
    end
  end
  object dsSelBemReav: TwwDataSource
    AutoEdit = False
    DataSet = qrySelBemReav
    Left = 256
    Top = 352
  end
  object qrySldCtb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBEM, B.TAXADEP, B.DATAULTDEP,'
      
        '       (SB.VALORG + SB.REAVVALORG + SB.ULTREAVVALORG)       AS V' +
        'ALORG0,'
      
        '       (SB.CMBEM + SB.REAVCMBEM + SB.ULTREAVCMBEM)          AS C' +
        'MBEM0,'
      
        '       (SB.DEPLANC + SB.REAVDEPLANC + SB.ULTREAVDEPLANC)    AS D' +
        'EPLANC0,'
      
        '       (SB.CMDEP + SB.REAVCMDEP + SB.ULTREAVCMDEP)          AS C' +
        'MDEP0,'
      '       (SB.VALORG + SB.CMBEM -'
      '        SB.DEPLANC - SB.CMDEP +'
      '        SB.REAVVALORG + SB.REAVCMBEM -'
      '        SB.REAVDEPLANC - SB.REAVCMDEP) +'
      '       (SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '        SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)                AS V' +
        'ALCTB0,'
      ''
      
        '       B.DESBEM, B.IDGRUPO, B.IDCONJUNTO, C.DESCCONJUNTO, G.NOME' +
        ' AS DESCGRUPO'
      ''
      'FROM (SELECT SCB.IDBEM, SCB.DATASLDBEM,'
      '             SCB.VALORG, SCB.REAVVALORG, SCB.ULTREAVVALORG,'
      '             SCB.CMBEM, SCB.REAVCMBEM, SCB.ULTREAVCMBEM,'
      '             SCB.DEPLANC, SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,'
      '             SCB.CMDEP, SCB.REAVCMDEP, SCB.ULTREAVCMDEP'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :PDATASLD)'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE (SCB.IDBEM = :PIDBEM)'
      '        AND (SCB.IDPESSOA = :PIDPESSOA)'
      '        AND (SCB.DATASLDBEM = DTAMAX.DATA)'
      '        AND (SCB.IDBEM = DTAMAX.IDBEM) ) SB,'
      ''
      '     BEM B, GRUPO G, CONJUNTO C'
      ''
      'WHERE (B.IDBEM    = :PIDBEM)'
      '  AND (B.IDPESSOA = :PIDPESSOA)'
      '  AND (B.DATAINICIODEP <= :PDATASLD)'
      '  AND (B.IDGRUPO = G.IDGRUPO(+))'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO(+))'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 336
    Top = 352
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end>
    object qrySldCtbIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qrySldCtbVALORG0: TFloatField
      FieldName = 'VALORG0'
    end
    object qrySldCtbCMBEM0: TFloatField
      FieldName = 'CMBEM0'
    end
    object qrySldCtbDEPLANC0: TFloatField
      FieldName = 'DEPLANC0'
    end
    object qrySldCtbCMDEP0: TFloatField
      FieldName = 'CMDEP0'
    end
    object qrySldCtbVALCTB0: TFloatField
      FieldName = 'VALCTB0'
    end
  end
  object dsSldCtb: TwwDataSource
    AutoEdit = False
    DataSet = qrySldCtb
    Left = 384
    Top = 352
  end
  object qryUltDep: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT MAX(G.DATAULTDEP) AS ULTDEP'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      'WHERE (G.FLGIMOVEL = 0)'
      '  AND (PG.IDPESSOA = :PIDPESSOA)'
      '  AND (PG.IDGRUPO  = G.IDGRUPO)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 408
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryUltDepULTDEP: TDateTimeField
      FieldName = 'ULTDEP'
      Origin = 'BASEDADOS.GRUPO.DATAULTDEP'
    end
  end
end
