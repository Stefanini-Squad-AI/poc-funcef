inherited frmMTCadBem: TfrmMTCadBem
  Left = 354
  Top = 84
  Caption = 'Cadastramento de Bens'
  ClientHeight = 541
  ClientWidth = 770
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 34
    Width = 770
    Height = 468
    inherited pnlMestre: TPanel
      Width = 768
      Height = 141
      object Label27: TLabel
        Left = 344
        Top = 2
        Width = 48
        Height = 13
        Caption = 'Controle'
      end
      object Label29: TLabel
        Left = 528
        Top = 2
        Width = 90
        Height = 13
        Caption = 'Situação Física'
      end
      object Label7: TLabel
        Left = 16
        Top = 36
        Width = 104
        Height = 13
        Caption = 'Descrição do Bem'
      end
      object Label1: TLabel
        Left = 16
        Top = 1
        Width = 38
        Height = 13
        Caption = 'Classe'
      end
      object Label21: TLabel
        Left = 16
        Top = 122
        Width = 130
        Height = 13
        Caption = 'Nº Patrimônio Anterior:'
      end
      object Label25: TLabel
        Left = 16
        Top = 101
        Width = 82
        Height = 13
        Caption = 'Nº Patrimônio:'
      end
      object pnlLivros: TPanel
        Left = 344
        Top = 39
        Width = 412
        Height = 81
        BevelOuter = bvNone
        TabOrder = 7
        object Ano: TLabel
          Left = 329
          Top = 40
          Width = 23
          Height = 13
          Caption = 'Ano'
        end
        object Label53: TLabel
          Left = 1
          Top = 40
          Width = 41
          Height = 13
          Caption = 'Editora'
        end
        object Label52: TLabel
          Left = 1
          Top = 0
          Width = 31
          Height = 13
          Caption = 'Autor'
        end
        object bbtnRetornaPlaca: TBitBtn
          Left = 385
          Top = 56
          Width = 21
          Height = 21
          Hint = 'Retorna'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
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
          Left = 1
          Top = 16
          Width = 405
          Height = 21
          DataField = 'PUBAUTOR'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbePubEditora: TwwDBEdit
          Left = 1
          Top = 56
          Width = 320
          Height = 21
          DataField = 'PUBEDITORA'
          DataSource = ds
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbePubAno: TDBRealEdit
          Left = 328
          Top = 56
          Width = 55
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 2
          WordWrap = False
          IntDigits = 4
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
          DataField = 'PUBANO'
          DataSource = ds
        end
      end
      object pnlPlaca: TPanel
        Left = 344
        Top = 39
        Width = 413
        Height = 81
        BevelOuter = bvNone
        TabOrder = 6
        object Label43: TLabel
          Left = 1
          Top = 40
          Width = 131
          Height = 13
          Caption = 'Identificação Adicional'
        end
        object Label13: TLabel
          Left = 1
          Top = 0
          Width = 48
          Height = 13
          Caption = 'Nº RFID'
        end
        object Label28: TLabel
          Left = 185
          Top = 0
          Width = 66
          Height = 13
          Caption = 'Nº de Série'
        end
        object edPlaca: TMaskEdit
          Left = 1
          Top = 16
          Width = 150
          Height = 21
          TabOrder = 0
        end
        object bbtnGeraPlaca: TBitBtn
          Left = 151
          Top = 16
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
        object bbtnLivros: TBitBtn
          Left = 388
          Top = 56
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
        object dbeNumSerie: TwwDBEdit
          Left = 184
          Top = 16
          Width = 225
          Height = 21
          DataField = 'NUMSERIE'
          DataSource = ds
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeIdOpcional: TwwDBEdit
          Left = 1
          Top = 56
          Width = 386
          Height = 21
          DataField = 'IDOPCIONAL'
          DataSource = ds
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object edDescClasse: TwwDBEdit
        Left = 16
        Top = 14
        Width = 289
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = dsClasse
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object bbtnSelClasse: TBitBtn
        Left = 305
        Top = 18
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
        Left = 344
        Top = 18
        Width = 169
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        Items.Strings = (
          'Total'
          'Físico')
      end
      object cmbSituacao: TwwDBLookupCombo
        Left = 528
        Top = 18
        Width = 225
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCSITUACAO'#9'45'#9'Descrição')
        DataField = 'IDSITUACAO'
        DataSource = ds
        LookupTable = cdsSituacao
        LookupField = 'IDSITUACAO'
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object dbeDesBem: TDBMemo
        Left = 16
        Top = 50
        Width = 309
        Height = 48
        DataField = 'DESBEM'
        DataSource = ds
        MaxLength = 200
        TabOrder = 4
      end
      object edPlacaAnt: TMaskEdit
        Left = 175
        Top = 119
        Width = 150
        Height = 21
        Enabled = False
        TabOrder = 5
      end
      object edPlacaAntigo: TMaskEdit
        Left = 175
        Top = 98
        Width = 150
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 8
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 142
      Width = 768
      Height = 325
      Tabs.Strings = (
        'Documento de Entrada'
        'Conjunto'
        'Dados Contábeis'
        'Depreciação'
        'Rateio Plano/Patrocinadora'
        'Imagem'
        'Anexos')
      detdbGrids.Strings = (
        ''
        ''
        ''
        'dbgDepreciacao'
        'dbgRateio'
        ''
        'dbgAnexos')
      inherited Dock973: TDock97 [0]
        Width = 760
        inherited tb97BotoesDetalhe: TToolbar97
          Left = 1
          DockPos = 1
          inherited sbtnExcluiDet: TToolbarButton97
            Width = 23
          end
        end
        object tbAnexo: TToolbar97
          Left = 105
          Top = 0
          Caption = 'tb97BotoesDetalhe'
          DockPos = 105
          TabOrder = 1
          Visible = False
          object btnVisual: TToolbarButton97
            Left = 0
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Visualizar o arquivo'
            AllowAllUp = True
            GroupIndex = 2
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
              033333777777777773333330777777703333333773F333773333333330888033
              33333FFFF7FFF7FFFFFF0000000000000003777777777777777F0FFFFFFFFFF9
              FF037F3333333337337F0F78888888887F037F33FFFFFFFFF37F0F7000000000
              8F037F3777777777F37F0F70AAAAAAA08F037F37F3333337F37F0F70ADDDDDA0
              8F037F37F3333337F37F0F70A99A99A08F037F37F3333337F37F0F70A99A99A0
              8F037F37F3333337F37F0F70AAAAAAA08F037F37FFFFFFF7F37F0F7000000000
              8F037F3777777777337F0F77777777777F037F3333333333337F0FFFFFFFFFFF
              FF037FFFFFFFFFFFFF7F00000000000000037777777777777773}
            ImageIndex = 0
            NoBorder = True
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnVisualClick
          end
          object btnSalva: TToolbarButton97
            Left = 25
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Salvar o arquivo em disco'
            AllowAllUp = True
            GroupIndex = 2
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
              00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
              00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
              00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
              00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
              00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
              00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
              0003737FFFFFFFFF7F7330099999999900333777777777777733}
            ImageIndex = 0
            NoBorder = True
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnSalvaClick
          end
        end
      end
      inherited pgctrlDetalhe: TPageControl [1]
        Width = 670
        Height = 266
        ActivePage = tbsAnexos
        object tbsDocumento: TTabSheet [0]
          Caption = 'Documento de Entrada'
          ImageIndex = 4
          object Label9: TLabel
            Left = 8
            Top = 8
            Width = 76
            Height = 13
            Caption = 'Data Entrada'
          end
          object Label14: TLabel
            Left = 136
            Top = 8
            Width = 65
            Height = 13
            Caption = 'Documento'
          end
          object Label16: TLabel
            Left = 328
            Top = 8
            Width = 96
            Height = 13
            Caption = 'Data Documento'
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
          object Label19: TLabel
            Left = 8
            Top = 104
            Width = 66
            Height = 13
            Caption = 'Quantidade'
          end
          object Label44: TLabel
            Left = 104
            Top = 104
            Width = 129
            Height = 13
            Caption = 'Valor Total da Entrada'
          end
          object Label22: TLabel
            Left = 252
            Top = 104
            Width = 83
            Height = 13
            Caption = 'Valor Residual'
          end
          object dbeDataInclusao: TCMDateTimePicker
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
            DataField = 'DTAINCLUSAO'
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
            OnExit = dbeDataInclusaoExit
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
            DataField = 'DTANOTA'
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
          object edValHistorico: TRealEdit
            Left = 104
            Top = 120
            Width = 129
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 8
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object dbeNota: TwwDBEdit
            Left = 136
            Top = 24
            Width = 105
            Height = 21
            DataField = 'IDNOTA'
            DataSource = ds
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeComplNota: TwwDBEdit
            Left = 240
            Top = 24
            Width = 65
            Height = 21
            DataField = 'COMPLNOTA'
            DataSource = ds
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeProcesso: TwwDBEdit
            Left = 456
            Top = 24
            Width = 121
            Height = 21
            DataField = 'PROCESSOAQUIS'
            DataSource = ds
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeEmpenho: TwwDBEdit
            Left = 600
            Top = 24
            Width = 121
            Height = 21
            DataField = 'EMPENHOAQUIS'
            DataSource = ds
            TabOrder = 5
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object edQtde: TRealEdit
            Left = 8
            Top = 120
            Width = 73
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 7
            WordWrap = False
            IntDigits = 3
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
          end
          object CMProcuraForCli: TCMProcuraForCli
            Left = 8
            Top = 50
            Width = 714
            Height = 50
            Caption = ' Fornecedor '
            TabOrder = 6
            OnExit = CMProcuraForCliExit
            CampoEdit = ceRazaoSocial
            MostraMensagens = True
            DataSource = ds
            DataField = 'IDFORNSERV'
            Mensagens.EmBranco = 'Chave não pode estar em branco'
            Mensagens.NaoExiste = 'Chave não existe'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = True
            ForCli = fcFornecedor
            MostraEndereco = False
            StatusForCli = fcAtivo
            MostraStatusCredito = False
          end
          object edValResidual: TRealEdit
            Left = 252
            Top = 120
            Width = 129
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 9
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        object tbsConjunto: TTabSheet [1]
          Caption = 'Conjunto'
          ImageIndex = 3
          object Label3: TLabel
            Left = 8
            Top = 65
            Width = 51
            Height = 13
            Caption = 'Conjunto'
          end
          object Label4: TLabel
            Left = 334
            Top = 65
            Width = 69
            Height = 13
            Caption = 'Localização'
          end
          object Label5: TLabel
            Left = 334
            Top = 106
            Width = 74
            Height = 13
            Caption = 'Responsável'
          end
          object Label6: TLabel
            Left = 8
            Top = 149
            Width = 98
            Height = 13
            Caption = 'Rateio de Custos'
          end
          object dbeDescConjunto: TDBMemo
            Left = 8
            Top = 81
            Width = 283
            Height = 63
            DataField = 'DESCCONJUNTO'
            DataSource = dsConjunto
            MaxLength = 200
            TabOrder = 1
          end
          object dbeDescLocalizacao: TwwDBEdit
            Left = 334
            Top = 81
            Width = 407
            Height = 21
            DataField = 'DESCLOCAL'
            DataSource = dsConjunto
            ReadOnly = True
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeNomeResponsavel: TwwDBEdit
            Left = 334
            Top = 122
            Width = 407
            Height = 21
            DataField = 'NOMERESP'
            DataSource = dsConjunto
            ReadOnly = True
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbgRateioCustos: TwwDBGrid
            Left = 8
            Top = 163
            Width = 733
            Height = 68
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsRateioCCusto
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ReadOnly = True
            TabOrder = 4
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
          object bbtnSelConjunto: TBitBtn
            Left = 291
            Top = 116
            Width = 25
            Height = 26
            TabOrder = 6
            OnClick = bbtnSelConjuntoClick
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
          object bbtnGeraConjunto: TBitBtn
            Left = 291
            Top = 81
            Width = 25
            Height = 26
            TabOrder = 5
            OnClick = bbtnGeraConjuntoClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888888B8888
              8888888888888F8888888B8888BB778888B88888888F77F8888888BB8800F088
              BB8888888F7787F8888888BB00FFF0BBBB88888F7788878F88888800FFFFFF0B
              B888887788888F7F8888887FFFFFCF0B8888887F88FF7878F888887FFCCCFFF0
              B8888878F77788F7F88888B7FFFFFCF0BB888887F88FF7878F88BBB7FFCCCFFF
              0BBB88878F77788F78F888BB7FFFFFCFF08888887F88FF78878F888B7FFCCCFF
              FF08888878F777888F78888BB7FFFFFF77888888878F888F778888BBBB7FFF77
              BB8888888878FF77888888BB88B77788BB8888888887778888888B88888B8888
              88B888888888888888888888888B888888888888888888888888}
            NumGlyphs = 2
          end
          object CMProcuraTerceiro: TCMProcuraSubTipo
            Left = 4
            Top = 6
            Width = 737
            Height = 50
            Caption = ' Terceiro '
            Enabled = False
            TabOrder = 0
            OnExit = CMProcuraTerceiroExit
            CampoEdit = ceRazaoSocial
            MostraMensagens = True
            DataSource = ds
            DataField = 'IDTERCEIRO'
            Mensagens.EmBranco = 'Chave não pode estar em branco'
            Mensagens.NaoExiste = 'Chave não existe'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = True
            SubTipo = stTerceiro
            FiltraSubTipo = True
          end
        end
        object tbsContabil: TTabSheet [2]
          Caption = 'Dados Contábeis'
          ImageIndex = 3
          object Label54: TLabel
            Left = 384
            Top = 56
            Width = 133
            Height = 13
            Caption = 'Data da Contabilização'
          end
          object Label8: TLabel
            Left = 8
            Top = 8
            Width = 85
            Height = 13
            Caption = 'Grupo Contábil'
          end
          object Label17: TLabel
            Left = 8
            Top = 56
            Width = 104
            Height = 13
            Caption = 'Atividade/ Projeto'
          end
          object Label18: TLabel
            Left = 8
            Top = 104
            Width = 56
            Height = 13
            Caption = 'SubConta'
          end
          object fcLabel2: TfcLabel
            Left = 384
            Top = 104
            Width = 107
            Height = 13
            Caption = 'Inicio Depreciação'
            TextOptions.Alignment = taLeftJustify
            TextOptions.VAlignment = vaTop
            Transparent = True
          end
          object pnlIntegraContab: TPanel
            Left = 384
            Top = 8
            Width = 317
            Height = 36
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 3
            object ckbFlgBemIntContab: TDBCheckBox
              Left = 20
              Top = 11
              Width = 286
              Height = 17
              Caption = 'Integrar este lançamento com a Contabilidade'
              DataField = 'FLGBEMINTCONTAB'
              DataSource = ds
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = ckbFlgBemIntContabClick
            end
          end
          object dbeDtaContab: TCMDateTimePicker
            Left = 384
            Top = 72
            Width = 137
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DTACONTAB'
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
            TabOrder = 4
            UnboundDataType = wwDTEdtDate
          end
          object edDescGrupo: TwwDBEdit
            Left = 8
            Top = 24
            Width = 337
            Height = 21
            DataField = 'NOME'
            DataSource = dsGrupo
            TabOrder = 6
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object bbtnSelGrupo: TBitBtn
            Left = 344
            Top = 24
            Width = 21
            Height = 21
            TabOrder = 0
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
          object bbtnSelSubConta: TBitBtn
            Left = 344
            Top = 120
            Width = 21
            Height = 21
            TabOrder = 2
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
          object edDescSubConta: TwwDBEdit
            Left = 8
            Top = 120
            Width = 337
            Height = 21
            DataField = 'NOMESUBCONTA'
            DataSource = dsSubConta
            TabOrder = 7
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object edAtivProjeto: TwwDBEdit
            Left = 8
            Top = 72
            Width = 337
            Height = 21
            DataField = 'NOME'
            DataSource = dsAtivProj
            TabOrder = 8
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object bbtnSelAtivProjeto: TBitBtn
            Left = 344
            Top = 72
            Width = 21
            Height = 21
            TabOrder = 1
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
          object dbeDataInicioDep: TCMDateTimePicker
            Left = 384
            Top = 120
            Width = 137
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAINICIODEP'
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
            TabOrder = 5
          end
        end
        object tbsDepreciacao: TTabSheet [3]
          Caption = 'Depreciação'
          ImageIndex = 6
          object PageControl3: TPageControl
            Left = 0
            Top = 0
            Width = 662
            Height = 238
            ActivePage = TabSheet6
            Align = alClient
            TabOrder = 0
            object TabSheet6: TTabSheet
              Caption = 'Dados'
              object dbgDepreciacao: TwwDBGrid
                Left = 0
                Top = 0
                Width = 654
                Height = 210
                Selected.Strings = (
                  'IDBEMXDEP'#9'7'#9'No'#9'F'
                  'TAXADEP'#9'20'#9'Depreciação (% a.a.)'#9'F'
                  'DESCTAXADEP'#9'20'#9'Descrição'#9'F'
                  'VIDAUTIL'#9'20'#9'Vida Útil'#9'F'
                  'DATAINICIODEP'#9'10'#9'Dt.Vigência'#9'F'
                  'DATAFIMDEP'#9'10'#9'Dt.Retroativa'#9'F'
                  'TRGDTINCLUSAO'#9'10'#9'Dt.Alteração'#9'F'
                  'TRGUSERINCLUSAO'#9'25'#9'Usuário '#9'F')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsDet
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
                TabOrder = 1
                TitleAlignment = taCenter
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                OnDblClick = dbgrdDetDblClick
                IndicatorColor = icBlack
              end
              object Panel1: TPanel
                Left = 0
                Top = 0
                Width = 654
                Height = 210
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object Label23: TLabel
                  Left = 304
                  Top = 32
                  Width = 123
                  Height = 13
                  Caption = 'Taxa de Depreciação'
                end
                object Label24: TLabel
                  Left = 425
                  Top = 52
                  Width = 29
                  Height = 13
                  Caption = '% a.a.'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object DBRealEdit1: TDBRealEdit
                  Left = 304
                  Top = 46
                  Width = 121
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,000000')
                  TabOrder = 0
                  WordWrap = False
                  OnExit = DBRealEdit1Exit
                  IntDigits = 4
                  DecDigits = 6
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'TAXADEP'
                  DataSource = dsDet
                end
                object rgDepre: TRadioGroup
                  Left = 88
                  Top = 33
                  Width = 213
                  Height = 73
                  Items.Strings = (
                    'Taxa de Depreciação(% a.a)'
                    'Vida Útil(Meses)')
                  TabOrder = 1
                  OnClick = rgDepreClick
                end
                object edVidaUtil: TDBRealEdit
                  Left = 304
                  Top = 83
                  Width = 121
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,000000')
                  TabOrder = 2
                  WordWrap = False
                  OnExit = edVidaUtilExit
                  IntDigits = 4
                  DecDigits = 6
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VIDAUTIL'
                  DataSource = dsDet
                end
              end
            end
            object TabSheet7: TTabSheet
              Caption = 'Vigências'
              ImageIndex = 1
              object wwDBGrid5: TwwDBGrid
                Left = 0
                Top = 0
                Width = 636
                Height = 209
                Selected.Strings = (
                  'IDBEMXDEP'#9'7'#9'No'#9'F'
                  'TAXADEP'#9'20'#9'Depreciação (% a.a.)'#9'F'
                  'DESCTAXADEP'#9'20'#9'Descrição'#9'F'
                  'VIDAUTIL'#9'20'#9'Vida Útil'#9'F'
                  'DATAINICIODEP'#9'10'#9'Dt.Vigência'#9'F'
                  'DATAFIMDEP'#9'10'#9'Dt.Retroativa'#9'F'
                  'DTINCLUSAO'#9'10'#9'Dt.Alteração'#9'F'
                  'USERINCLUSAO'#9'25'#9'Usuário '#9'F')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsHistDep
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
                TabOrder = 0
                TitleAlignment = taCenter
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                OnDblClick = dbgrdDetDblClick
                IndicatorColor = icBlack
              end
            end
          end
        end
        object tbsPlanoPatro: TTabSheet [4]
          Caption = 'Rateio Plano/Patrocinadora'
          ImageIndex = 4
          object PageControl1: TPageControl
            Left = 0
            Top = 0
            Width = 662
            Height = 238
            ActivePage = TabSheet1
            Align = alClient
            TabOrder = 0
            object TabSheet1: TTabSheet
              Caption = 'Dados'
              object pnlDetPlanoPatro: TPanel
                Left = 0
                Top = 0
                Width = 654
                Height = 210
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object Label2: TLabel
                  Left = 16
                  Top = 8
                  Width = 80
                  Height = 13
                  Caption = 'Patrocinadora'
                end
                object Label12: TLabel
                  Left = 16
                  Top = 56
                  Width = 118
                  Height = 13
                  Caption = 'Plano Previdenciário'
                end
                object Label15: TLabel
                  Left = 344
                  Top = 8
                  Width = 72
                  Height = 13
                  Caption = 'Participação'
                end
                object Label20: TLabel
                  Left = 416
                  Top = 28
                  Width = 10
                  Height = 14
                  Caption = '%'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                end
                object dbcmbPlanoPrev: TwwDBLookupCombo
                  Left = 16
                  Top = 72
                  Width = 297
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'50'#9'Descrição')
                  DataField = 'IDPLANOPREV'
                  DataSource = dsRateio
                  LookupTable = cdsPlanoPrev
                  LookupField = 'IDPLANOPREV'
                  TabOrder = 1
                  AutoDropDown = False
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = False
                end
                object dbcmbPatro: TwwDBLookupCombo
                  Left = 16
                  Top = 24
                  Width = 297
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'60'#9'Descrição')
                  DataField = 'IDPATRO'
                  DataSource = dsRateio
                  LookupTable = cdsPatro
                  LookupField = 'IDPATRO'
                  TabOrder = 0
                  AutoDropDown = False
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = False
                end
                object dbePercRateio: TDBRealEdit
                  Left = 346
                  Top = 24
                  Width = 66
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 2
                  WordWrap = False
                  IntDigits = 3
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'PPBPERCRATEIO'
                  DataSource = dsRateio
                end
              end
              object dbgRateio: TwwDBGrid
                Left = 0
                Top = 0
                Width = 654
                Height = 210
                Selected.Strings = (
                  'NOMEPATRO'#9'44'#9'Patrocinadora'#9'F'
                  'NOMEPLANOPREV'#9'43'#9'Plano Previdenciário'#9'F'
                  'PPBPERCRATEIO'#9'12'#9'Participação (%)'#9'F')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsRateio
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
                TabOrder = 1
                TitleAlignment = taCenter
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                UseTFields = False
                OnDblClick = dbgrdDetDblClick
                IndicatorColor = icBlack
              end
            end
            object TabSheet2: TTabSheet
              Caption = 'Vigências'
              ImageIndex = 1
              object ncia: TwwDBGrid
                Left = 0
                Top = 0
                Width = 636
                Height = 209
                Selected.Strings = (
                  'DATAVIGENCIA'#9'13'#9'Data Vigência'
                  'NOMEPLANO'#9'35'#9'Plano Previdenciário'
                  'NOMEPATRO'#9'25'#9'Patrocinadora'#9'F'
                  'PERCENTRATEIO'#9'15'#9'Percentual')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsPlanoPatroxVigenciaBem
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
        end
        object tbsImagem: TTabSheet [5]
          Caption = 'Imagem'
          ImageIndex = 5
          object dbiImagemBem: TDBImage
            Left = 267
            Top = 0
            Width = 224
            Height = 168
            Cursor = crHandPoint
            Hint = 'Clique para Associar Foto'
            DataField = 'IMAGEM'
            DataSource = dsImagem
            ParentShowHint = False
            ShowHint = True
            Stretch = True
            TabOrder = 0
            OnClick = dbiImagemBemClick
          end
        end
        object tbsAnexos: TTabSheet [6]
          Caption = 'Anexos'
          ImageIndex = 7
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 662
            Height = 238
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label26: TLabel
              Left = 13
              Top = 32
              Width = 36
              Height = 13
              Caption = 'Anexo'
            end
            object bbtnAnexar: TBitBtn
              Left = 376
              Top = 46
              Width = 28
              Height = 25
              TabOrder = 0
              OnClick = bbtnAnexarClick
              Glyph.Data = {
                1E060000424D1E06000000000000360000002800000017000000150000000100
                180000000000E8050000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF000000000000FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000000000FFFF
                FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
                FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF000000000000FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF000000000000FFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF0000
                00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                0000}
            end
            object dbedNomeArquivo: TwwDBEdit
              Left = 13
              Top = 48
              Width = 361
              Height = 21
              DataField = 'NOMEARQUIVO'
              DataSource = dsAnexos
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object dbgAnexos: TwwDBGrid
            Left = 0
            Top = 0
            Width = 662
            Height = 238
            Selected.Strings = (
              'NOMEARQUIVO'#9'50'#9'Anexo')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAnexos
            MultiSelectOptions = [msoAutoUnselect]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap, dgMultiSelect]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnDblClick = dbgAnexosDblClick
            IndicatorColor = icBlack
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'Depreciação1'
          inherited pnlControlesDet: TPanel
            Width = 662
            Height = 238
            object Label10: TLabel
              Left = 240
              Top = 32
              Width = 123
              Height = 13
              Caption = 'Taxa de Depreciação'
            end
            object Label11: TLabel
              Left = 365
              Top = 52
              Width = 29
              Height = 13
              Caption = '% a.a.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dbeTaxaDep: TDBRealEdit
              Left = 240
              Top = 48
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,000000')
              TabOrder = 0
              WordWrap = False
              IntDigits = 4
              DecDigits = 6
              NumberFormat = fNumber
              Signal = False
              DataField = 'TAXADEP'
              DataSource = dsDet
            end
            object PageControl2: TPageControl
              Left = 384
              Top = 8
              Width = 668
              Height = 129
              ActivePage = TabSheet4
              TabOrder = 1
              object TabSheet3: TTabSheet
                Caption = 'Dados'
                object dbgrdDetNew: TwwDBGrid
                  Left = 0
                  Top = 0
                  Width = 660
                  Height = 101
                  Selected.Strings = (
                    'IDBEMXDEP'#9'7'#9'No'#9'F'
                    'TAXADEP'#9'20'#9'Depreciação (% a.a.)'#9'F'
                    'VIDAUTIL'#9'20'#9'Vida Útil'#9'F'
                    'DATAINICIODEP'#9'10'#9'Dt.Vigência'#9'F'
                    'DATAFIMDEP'#9'10'#9'Dt.Retroativa'#9'F'
                    'TRGDTINCLUSAO'#9'10'#9'Dt.Alteração'#9'F'
                    'TRGUSERINCLUSAO'#9'25'#9'Usuário '#9'F')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = dsDet
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
                  TabOrder = 0
                  TitleAlignment = taCenter
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -9
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = [fsBold]
                  TitleLines = 1
                  TitleButtons = False
                  OnDblClick = dbgrdDetDblClick
                  IndicatorColor = icBlack
                end
              end
              object TabSheet4: TTabSheet
                Caption = 'Vigência'
                ImageIndex = 1
                object wwDBGrid2: TwwDBGrid
                  Left = 0
                  Top = 0
                  Width = 660
                  Height = 101
                  Selected.Strings = (
                    'IDBEMXDEP'#9'7'#9'No'#9'F'
                    'TAXADEP'#9'20'#9'Depreciação (% a.a.)'#9'F'
                    'DESCTAXADEP'#9'20'#9'Descrição'#9'F'
                    'VIDAUTIL'#9'20'#9'Vida Útil'#9'F'
                    'DATAINICIODEP'#9'10'#9'Dt.Vigência'#9'F'
                    'DATAFIMDEP'#9'10'#9'Dt.Retroativa'#9'F'
                    'DTINCLUSAO'#9'10'#9'Dt.Alteração'#9'F'
                    'USERINCLUSAO'#9'25'#9'Usuário '#9'F')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = dsHistDep
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
                  TabOrder = 0
                  TitleAlignment = taCenter
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -9
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = [fsBold]
                  TitleLines = 1
                  TitleButtons = False
                  OnDblClick = dbgrdDetDblClick
                  IndicatorColor = icBlack
                end
              end
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Left = 72
            Top = 40
            Width = 177
            Height = 57
            Selected.Strings = (
              'IDBEMXDEP'#9'7'#9'No'#9'F'
              'TAXADEP'#9'20'#9'Depreciação (% a.a.)'#9'F'
              'DESCTAXADEP'#9'20'#9'Descrição'#9'F'
              'VIDAUTIL'#9'20'#9'Vida Útil'#9'F'
              'DATAINICIODEP'#9'10'#9'Dt.Vigência'#9'F'
              'DATAFIMDEP'#9'10'#9'Dt.Retroativa'#9'F'
              'TRGDTINCLUSAO'#9'10'#9'Dt.Alteração'#9'F'
              'TRGUSERINCLUSAO'#9'25'#9'Usuário '#9'F')
            Align = alNone
            TitleAlignment = taCenter
            Visible = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 674
        Height = 266
      end
    end
  end
  inherited Dock972: TDock97
    Width = 770
    Height = 34
    object lblStatus: TfcLabel [0]
      Left = 698
      Top = 5
      Width = 47
      Height = 22
      Align = alRight
      Caption = 'Ativo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
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
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 86
        Height = 28
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 86
        Width = 86
        Height = 28
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 258
        Width = 86
        Height = 28
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 172
        Width = 86
        Height = 28
        Layout = blGlyphLeft
        Spacing = 4
      end
    end
  end
  inherited Dock971: TDock97
    Top = 502
    Width = 770
    inherited tb97Fundo: TToolbar97
      Left = 598
      DockPos = 663
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 429
      DockPos = 494
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 794
    Top = 543
    TargetsData = (
      1
      5
      (
        '*'
        'Filter'
        0)
      (
        'TDBRichEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        ''
        'Title'
        0))
  end
  inherited ds: TwwDataSource
    Left = 664
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 680
    Top = 504
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 488
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    BeforePost = CdsBeforePost
    AfterScroll = CdsAfterScroll
    Left = 624
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona um Bem'
    Colunas.Strings = (
      'BEM.PLACA'
      'BEM.PATRIMONIO'
      'HISTBEM.PLACAANT'
      'HISTBEM.DATAMOVIMENTACAO'
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
      'N'
      'D'
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
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Nº RFID'
      'Nº Patrimonio'
      'Nº Pat./RFID Anterior'
      'Data Troca de Placa'
      'Baixado'
      'Descrição'
      'Conjunto'
      'Localização'
      'Responsável'
      'Fornecedor'
      'Nome Classe'
      'Nome Grupo'
      'Documento Aquisição'
      'Data Aquisição'
      'Valor Historico'
      'Marca'
      'Modelo'
      'Nº Série'
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
      
        '(SELECT IDBEM, IDPESSOA, PLACAANT, DATAMOVIMENTACAO, IDTIPOMOVIM' +
        'ENTACAO  FROM HISTORICOMOVIMENTACAO WHERE IDTIPOMOVIMENTACAO = 4' +
        ') HISTBEM')
    CamposChave.Strings = (
      'BEM.IDPESSOA'
      'BEM.IDBEM'
      'BEM.PLACA'
      'BEM.DESBEM'
      'CONJUNTO.IDLOCALIZACAO'
      'BEM.IDCONJUNTO'
      'HISTBEM.PLACAANT')
    Filtro.Strings = (
      'BEM.IDCONJUNTO=CONJUNTO.IDCONJUNTO'
      'BEM.IDPESSOA=CONJUNTO.IDPESSOA'
      'CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO(+)'
      'CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA(+)'
      'CONJUNTO.IDRESPONSAVEL=PESSOARESP.IDPESSOA(+)'
      'BEM.IDGRUPO=GRUPO.IDGRUPO(+)'
      'BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM(+)'
      'BEM.IDFORNSERV=PESSOAFORN.IDPESSOA(+)'
      'BEM.IDPESSOA=HISTBEM.IDPESSOA(+)'
      'BEM.IDBEM=HISTBEM.IDBEM(+)'
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
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '18'
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
      ''
      ''
      '')
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
      ''
      ''
      '')
    Left = 368
    Top = 0
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 560
    Top = 0
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 517
    Top = 308
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 517
    Top = 256
  end
  object dsRateio: TwwDataSource
    AutoEdit = False
    DataSet = cdsRateio
    Left = 583
    Top = 309
  end
  object cdsRateio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 584
    Top = 296
  end
  object MSClasse: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Cadastro de Classes'
    Colunas.Strings = (
      'CLASSEDEBEM.DESCRICAO'
      'CLASSEDEBEM.CODHIERARQ')
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
      'CLASSEDEBEM')
    CamposChave.Strings = (
      'CLASSEDEBEM.IDCLASSEBEM')
    Filtro.Strings = (
      'CLASSEDEBEM.ANASINT = '#39'A'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '15')
    OperComparador.Strings = (
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N')
    ComparaMaiuscula.Strings = (
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
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 224
    Top = 40
  end
  object dsClasse: TwwDataSource
    AutoEdit = False
    DataSet = cdsClasse
    Left = 176
    Top = 40
  end
  object cdsClasse: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 128
    Top = 40
  end
  object cdsSituacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 696
    Top = 48
  end
  object cdsConjunto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 32
    Top = 437
  end
  object cdsRateioCCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 106
    Top = 437
  end
  object dsConjunto: TwwDataSource
    AutoEdit = False
    DataSet = cdsConjunto
    Left = 32
    Top = 424
  end
  object dsRateioCCusto: TwwDataSource
    AutoEdit = False
    DataSet = cdsRateioCCusto
    Left = 106
    Top = 424
  end
  object MSFornec: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Fornecedores'
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
    Left = 176
    Top = 488
  end
  object MSTerceiro: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Terceiros'
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
    Left = 240
    Top = 488
  end
  object MSAtivProj: TMontaSelect
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
      'UNIDNEGOCIO.UNETIPO = '#39'A'#39
      'UNIDNEGOCIO.ATIVO = '#39'S'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '25'
      '10')
    OperComparador.Strings = (
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
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 688
    Top = 336
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
    Left = 360
    Top = 488
  end
  object MSGrupos: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Grupo Contábil'
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
      'PLANOGRUPO.IDGRUPO'
      'PLANOGRUPO.IDPESSOA')
    Filtro.Strings = (
      'GRUPO.TIPO = '#39'A'#39
      'PLANOGRUPO.INATIVO=0'
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
    Left = 296
    Top = 488
  end
  object MSConjunto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Conjuntos'
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
    Left = 32
    Top = 488
  end
  object cdsFornec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 176
    Top = 437
  end
  object cdsTerceiro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 437
  end
  object cdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsGrupoAfterOpen
    Left = 296
    Top = 436
  end
  object cdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 500
  end
  object cdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 436
  end
  object dsFornec: TwwDataSource
    AutoEdit = False
    DataSet = cdsFornec
    Left = 176
    Top = 424
  end
  object dsTerceiro: TwwDataSource
    AutoEdit = False
    DataSet = cdsTerceiro
    Left = 240
    Top = 424
  end
  object dsGrupo: TwwDataSource
    AutoEdit = False
    DataSet = cdsGrupo
    Left = 296
    Top = 424
  end
  object dsSubConta: TwwDataSource
    AutoEdit = False
    DataSet = cdsSubConta
    Left = 488
    Top = 488
  end
  object dsAtivProj: TwwDataSource
    AutoEdit = False
    DataSet = cdsAtivProj
    Left = 424
    Top = 424
  end
  object cdsParamCAF: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 224
    Top = 136
  end
  object cdsBuscaGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 225
    Top = 123
  end
  object cdsGrupoTaxaDep: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 225
    Top = 110
  end
  object cdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 489
    Top = 436
  end
  object cdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 548
    Top = 436
  end
  object dsPlanoPrev: TwwDataSource
    AutoEdit = False
    DataSet = cdsAtivProj
    Left = 489
    Top = 423
  end
  object dsPatro: TwwDataSource
    AutoEdit = False
    DataSet = cdsAtivProj
    Left = 548
    Top = 424
  end
  object cdsBemxMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 224
    Top = 97
  end
  object dsImagem: TwwDataSource
    DataSet = cdsImagem
    Left = 242
    Top = 283
  end
  object cdsImagem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 242
    Top = 271
  end
  object cdsCAFPaises: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 688
    Top = 184
  end
  object sqlCAFPaises: TCMSqlParams
    SQL.Strings = (
      'SELECT CP.IDCAFPAISES, CP.IDPESSOA, CP.IDPAIS, CP.MOECODIGO,'
      '       CP.FLGCONTABIL, CP.FLGMULTITAXA, P.NOMEPAIS'
      'FROM CAFPAISES CP,'
      '     PAIS P'
      'WHERE CP.IDPESSOA = :IDPESSOA'
      '  AND CP.IDPAIS = P.IDPAIS'
      'ORDER BY CP.IDCAFPAISES'
      '')
    ClientDataSet = cdsCAFPaises
    Left = 688
    Top = 170
  end
  object cdsHstPercSegregaBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 417
    Top = 311
  end
  object dsPlanoPatroxVigenciaBem: TwwDataSource
    DataSet = cdsPlanoPatroxVigenciaBem
    Left = 301
    Top = 335
  end
  object cdsPlanoPatroxVigenciaBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 301
    Top = 327
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT PPB.IDBEM,'
      '       PPB.DATAVIGENCIA,'
      '       PPB.IDPLANOPREV,'
      '       PPC.NOME AS NOMEPLANO,'
      '       PPB.IDPATRO,'
      '       PES.NOME AS NOMEPATRO,'
      '       PPB.PERCENTRATEIO'
      '  FROM PLANOPATROXVIGENCIABEM PPB,'
      '       PESSOA PES,'
      '       PLANPREVCONTABIL PPC'
      ' WHERE 1 = 2'
      '   AND PPB.IDPATRO  = PES.IDPESSOA'
      '   AND PPB.IDPLANOPREV = PPC.IDPLANOPREV')
    Left = 341
    Top = 279
  end
  object cdsHistDep: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 53
    Top = 288
  end
  object dsHistDep: TwwDataSource
    AutoEdit = False
    DataSet = cdsHistDep
    Left = 53
    Top = 324
  end
  object CdsClasseTaxaDep: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 133
    Top = 283
  end
  object qryConsultaHistorico: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT COUNT(*) AS QTDTROCAPLACAHISTORICO'
      '   FROM HISTORICOMOVIMENTACAO'
      '  WHERE IDTIPOMOVIMENTACAO = 4'
      '    AND IDBEM = 7541'
      '    AND IDPESSOA = 1'
      '    AND DATAMOVIMENTACAO >= TO_DATE('#39'01/10/2019'#39','#39'DD/MM/YYYY'#39')'
      '    '
      '    ')
    Left = 424
    Top = 1
  end
  object dsAnexos: TwwDataSource
    AutoEdit = False
    DataSet = cdsAnexos
    Left = 606
    Top = 431
  end
  object cdsAnexos: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforeDelete = cdsAnexosBeforeDelete
    Left = 665
    Top = 448
  end
  object SaveDlg: TSaveDialog
    Filter = 
      'Documentos(*.doc, *.rtf, *.txt, *.pdf)|*.doc; *.rtf; *.txt; *.pd' +
      'f'
    Left = 689
    Top = 392
  end
  object OpenDlg: TOpenDialog
    Filter = 
      'Documentos(*.doc, *.rtf, *.txt, *.pdf)|*.doc; *.rtf; *.txt; *.pd' +
      'f'
    Left = 721
    Top = 392
  end
end
