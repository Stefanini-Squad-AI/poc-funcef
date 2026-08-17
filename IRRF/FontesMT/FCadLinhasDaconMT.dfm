inherited FrmCadLinhasDaconmt: TFrmCadLinhasDaconmt
  Left = 300
  Top = 122
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Cadastro de Linhas para Relatório'
  ClientHeight = 560
  ClientWidth = 963
  PixelsPerInch = 96
  TextHeight = 13
  object Image4: TImage [0]
    Left = 548
    Top = 313
    Width = 16
    Height = 16
    AutoSize = True
    Picture.Data = {
      07544269746D617036050000424D360500000000000036040000280000001000
      000010000000010008000000000000010000C40E0000C40E0000000100000000
      000000000000000080000080000000808000800000008000800080800000C0C0
      C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
      E00000400000004020000040400000406000004080000040A0000040C0000040
      E00000600000006020000060400000606000006080000060A0000060C0000060
      E00000800000008020000080400000806000008080000080A0000080C0000080
      E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
      E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
      E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
      E00040000000400020004000400040006000400080004000A0004000C0004000
      E00040200000402020004020400040206000402080004020A0004020C0004020
      E00040400000404020004040400040406000404080004040A0004040C0004040
      E00040600000406020004060400040606000406080004060A0004060C0004060
      E00040800000408020004080400040806000408080004080A0004080C0004080
      E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
      E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
      E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
      E00080000000800020008000400080006000800080008000A0008000C0008000
      E00080200000802020008020400080206000802080008020A0008020C0008020
      E00080400000804020008040400080406000804080008040A0008040C0008040
      E00080600000806020008060400080606000806080008060A0008060C0008060
      E00080800000808020008080400080806000808080008080A0008080C0008080
      E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
      E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
      E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
      E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
      E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
      E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
      E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
      E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
      E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
      E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
      A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00070707070707070707070707070707070707070707070707070707070707
      070707070707FC070707070707070707070707070707FCFC0707070707070707
      070707070707FCFCFC07070707070707070707070707FCFCFCFC070707070707
      070707070707FCFCFCFCFC0707070707070707070707FCFCFCFCFCFC07070707
      070707070707FCFCFCFCFCFCFC070707070707070707FCFCFCFCFFFC07070707
      070707070707FCFCFCFFFC0707070707070707070707FCFCFFFC070707070707
      070707070707FCFFFC07070707070707070707070707FCFC0707070707070707
      070707070707FC07070707070707070707070707070707070707070707070707
      0707}
    Stretch = True
    Transparent = True
  end
  object Label8: TLabel [1]
    Left = 443
    Top = 314
    Width = 104
    Height = 13
    Caption = 'Pesquise o Cargo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited pnlFundo: TPanel
    Width = 963
    Height = 474
    object gbFiltroCad: TGroupBox
      Left = 1
      Top = 1
      Width = 961
      Height = 65
      Align = alTop
      Caption = ' Filtrar por '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lblTipoRelatCad: TLabel
        Left = 8
        Top = 16
        Width = 81
        Height = 13
        Caption = 'Tipo de Relatório'
      end
      object lblNormaCad: TLabel
        Left = 352
        Top = 16
        Width = 31
        Height = 13
        Caption = 'Norma'
      end
      object lblVigenciaCad: TLabel
        Left = 696
        Top = 16
        Width = 86
        Height = 13
        Caption = 'Início da Vigência'
      end
      object sbtnLimparFiltros: TSpeedButton
        Left = 811
        Top = 29
        Width = 25
        Height = 24
        Hint = 'Reinicializar os parâmetros'
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000C6C3C6C6C3C6
          C6C3C6C6C3C60000000000000000000000000000000000000000000000000000
          00000000000000000000C6C3C6C6C3C6C6C3C6C6C3C6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6C3C6C6C3C6
          C6C3C6C6C3C6FFFFFFFFFFFF000000000000FFFFFF0000000000000000000000
          00FFFFFFFFFFFF000000C6C3C6C6C3C6C6C3C6C6C3C6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6C3C6C6C3C6
          C6C3C6C6C3C6FFFFFF000000000000000000FFFFFF000000000000FFFFFF0000
          00000000FFFFFF000000C6C3C6C0C0C0C0C0C0C0C0C0FFFFFFFFFFFFFFFFFFFF
          00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6C3C6C0C0C0
          C0C0C0C0C0C0FFFFFFFFFFFF00007B0000FF00007B00007BFFFFFFFFFFFF0000
          00000000FFFFFF000000C6C3C6C0C0C0C0C0C0C0C0C0FFFFFF00007B0000FF00
          FFFF0000FF00007B00007BFFFFFFFFFFFFFFFFFFFFFFFF000000C6C3C6C0C0C0
          C0C0C000000000007B0000FF00FFFF0000FFFF00FFFF00FF00007BFFFFFFFFFF
          FFFFFFFFFFFFFF000000C6C3C6C0C0C0C0C0C000000000FF000000000000FFFF
          00FFFF00FF0000FF00007BFFFFFFFFFFFFFFFFFFFFFFFF000000C6C3C6000000
          00000000FF0000FF0000FF00000000FF00FF0000FF00007BFFFFFFFFFFFF0000
          00000000000000000000C6C3C600000000000000000000FF0000FF00007D0000
          0000000000FFFFFFFFFFFFFFFFFF000000FFFFFF000000C6C3C600000000FFFF
          00FFFF000000000000007D00007D00000000FFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000C6C3C6C6C3C600FFFFC0C0C000FFFF007D7B00000000000000000000
          0000000000000000000000000000000000C6C3C6C6C3C6C6C3C6C6C3C600FFFF
          00FFFF007D7B007D7B000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C6C3C6C6C3
          C6C6C3C6C6C3C6C6C3C600FFFF00FFFF007D7B007D7B000000000000C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6}
        ParentShowHint = False
        ShowHint = True
        Transparent = False
        OnClick = sbtnLimparFiltrosClick
      end
      object dblcDataInicio: TwwDBLookupCombo
        Left = 696
        Top = 32
        Width = 105
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupTable = cdsFiltroData
        LookupField = 'DataInicio'
        Options = [loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcTipoRelatCad: TwwDBLookupCombo
        Left = 8
        Top = 32
        Width = 337
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupTable = cdsFiltroTipo
        LookupField = 'Descricao'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblcTipoRelatCadChange
        OnCloseUp = dblcTipoRelatCadCloseUp
      end
      object dblcNormaCad: TwwDBLookupCombo
        Left = 352
        Top = 32
        Width = 337
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupTable = cdsFiltroNorma
        LookupField = 'Descricao'
        Options = [loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcNormaCadCloseUp
      end
    end
    object pgLinhasDacom: TPageControl
      Left = 1
      Top = 66
      Width = 961
      Height = 407
      ActivePage = tbLinha
      Align = alClient
      TabOrder = 1
      OnChange = pgLinhasDacomChange
      OnChanging = pgLinhasDacomChanging
      object tbLinha: TTabSheet
        Caption = 'Cadastro das Linhas para o Relatório'
        object pnlDados: TPanel
          Left = 0
          Top = 0
          Width = 953
          Height = 379
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object pnlheader: TPanel
            Left = 0
            Top = 0
            Width = 953
            Height = 121
            Align = alTop
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object lblCodLinha: TLabel
              Left = 8
              Top = 74
              Width = 77
              Height = 13
              Caption = 'Código da Linha'
            end
            object lblDescricaoLinha: TLabel
              Left = 96
              Top = 74
              Width = 92
              Height = 13
              Caption = 'Descrição da Linha'
            end
            object lblNaturezaLinha: TLabel
              Left = 586
              Top = 74
              Width = 87
              Height = 13
              Caption = 'Natureza da Linha'
            end
            object lblCategoria: TLabel
              Left = 700
              Top = 74
              Width = 45
              Height = 13
              Caption = 'Categoria'
            end
            object Label11: TLabel
              Left = 824
              Top = 74
              Width = 107
              Height = 13
              Caption = 'Planos Previdenciários'
            end
            object edDescricaoLinha: TEdit
              Left = 96
              Top = 90
              Width = 485
              Height = 21
              TabOrder = 1
              OnKeyPress = edDescricaoLinhaKeyPress
            end
            object edCodLinha: TEdit
              Left = 8
              Top = 90
              Width = 81
              Height = 21
              TabOrder = 0
            end
            object dblcNaturezaLinha: TwwDBLookupCombo
              Left = 586
              Top = 90
              Width = 110
              Height = 21
              DropDownAlignment = taLeftJustify
              LookupTable = cdsNatureza
              LookupField = 'Descricao'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object gbNorma: TGroupBox
              Left = 0
              Top = 0
              Width = 953
              Height = 65
              Align = alTop
              Caption = ' Norma e Vigência '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              object Label2: TLabel
                Left = 8
                Top = 16
                Width = 31
                Height = 13
                Caption = 'Norma'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label1: TLabel
                Left = 419
                Top = 16
                Width = 81
                Height = 13
                Caption = 'Tipo de Relatório'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label3: TLabel
                Left = 572
                Top = 16
                Width = 86
                Height = 13
                Caption = 'Início da Vigência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label4: TLabel
                Left = 668
                Top = 16
                Width = 75
                Height = 13
                Caption = 'Fim da Vigência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object sbInserir: TSpeedButton
                Left = 780
                Top = 18
                Width = 52
                Height = 37
                Hint = 'Inserir uma Norma'
                Anchors = [akTop, akRight]
                Caption = 'Inserir'
                Flat = True
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FF
                  FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF0000FFFF00848484008484
                  8400FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00FF00FF00
                  FF0000FFFF0000FFFF00FF00FF00FF00FF000000000000000000FFFFFF000000
                  0000FF00FF00FF00FF0000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00
                  FF0000FFFF0000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF000000
                  000000FFFF0000FFFF0000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00
                  FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF000000000000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
                  FF000000000000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
                  FF00FFFFFF000000000000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
                  0000FFFFFF000000000000FFFF0000FFFF00FF00FF00FF00FF0000FFFF0000FF
                  FF0000FFFF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFF
                  FF00FFFFFF00FFFFFF000000000000FFFF0000FFFF0000FFFF00FF00FF00FF00
                  FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FF000000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF0000FFFF0084848400FFFFFF00FFFFFF00FF000000FF000000FF00
                  0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
                  FF00FF00FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF008484840084848400FF00FF00FF00FF00FF00FF00FF00
                  FF0000FFFF0000FFFF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFF
                  FF00848484008484840000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00
                  FF0000FFFF0000FFFF00FF00FF00FF00FF0000FFFF0084848400848484008484
                  8400FF00FF00FF00FF0000FFFF0000FFFF00FF00FF00FF00FF00FF00FF0000FF
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                Layout = blGlyphTop
                ParentShowHint = False
                ShowHint = True
                Spacing = 2
                OnClick = sbInserirClick
              end
              object sbAlterar: TSpeedButton
                Left = 834
                Top = 18
                Width = 52
                Height = 37
                Hint = 'Alterar  uma Norma'
                Anchors = [akTop, akRight]
                Caption = 'Alterar'
                Flat = True
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000C40E0000C40E00000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070000
                  0000000000000000000007070707FFFFFFFFFFFFFFFFFFFFFF0007070707FFFF
                  0000FF00000000FFFF0007070707FFFFFFFFFFFFFFFFFFFFFF0000FBFBFBFB00
                  0000FF00FFFF0000FF0000FBFBFBFBFBFBFF00FF0000FFFFFF0000FBFBFBFB00
                  00000000FB00FF00FF0000FBFBFBFBFBFBFBFBFB00FFFFFFFF0000FBFB000000
                  00000000FF000000FF000000FBFBFB0000FB00FFFFFFFFFFFF00070700000000
                  FB00FFFFFFFF000000000707070700FB00FFFFFFFFFF00FF000707070700FB00
                  FFFFFFFFFFFF00000707070700FB0000000000000000000707070700F9000707
                  0707070707070707070707070007070707070707070707070707}
                Layout = blGlyphTop
                ParentShowHint = False
                ShowHint = True
                Spacing = 2
                OnClick = sbAlterarClick
              end
              object lblNorma: TLabel
                Left = 8
                Top = 32
                Width = 403
                Height = 21
                AutoSize = False
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Layout = tlCenter
              end
              object lblTipoRelatorio: TLabel
                Left = 419
                Top = 32
                Width = 145
                Height = 21
                AutoSize = False
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Layout = tlCenter
              end
              object lblInicioVigencia: TLabel
                Left = 572
                Top = 32
                Width = 88
                Height = 21
                AutoSize = False
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Layout = tlCenter
              end
              object lblFimVigencia: TLabel
                Left = 668
                Top = 32
                Width = 88
                Height = 21
                AutoSize = False
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Layout = tlCenter
              end
              object sbExcluir: TSpeedButton
                Left = 887
                Top = 18
                Width = 52
                Height = 37
                Hint = 'Excluir uma Norma'
                Anchors = [akTop, akRight]
                Caption = 'Excluir'
                Enabled = False
                Flat = True
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  04000000000080000000C40E0000C40E00001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                  777777770000000000007777FFFFFFFFFFF07777FF00F0000FF07777FFFFFFFF
                  FFF07777F000F00F00F07777FFFFFFFFFFF07777FF00F00F00F07777FFFFFFFF
                  FFF0700000000000FFF0999999999990FFF099999999999F000011111111111F
                  0F077777FFFFFFFF007777770000000007777777777777777777}
                Layout = blGlyphTop
                ParentShowHint = False
                ShowHint = True
                Spacing = 2
                OnClick = sbExcluirClick
              end
            end
            object dblcTipoCategoria: TwwDBLookupCombo
              Left = 700
              Top = 90
              Width = 118
              Height = 21
              DropDownAlignment = taLeftJustify
              LookupTable = cdsTipoCategoria
              LookupField = 'CATEGORIA'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnChange = dblcTipoCategoriaChange
              OnExit = dblcTipoCategoriaChange
            end
            object dblcTipoPlano: TwwDBLookupCombo
              Left = 822
              Top = 90
              Width = 118
              Height = 21
              DropDownAlignment = taLeftJustify
              LookupTable = cdsTipoPlano
              LookupField = 'DESCRICAO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnChange = dblcTipoCategoriaChange
              OnExit = dblcTipoCategoriaChange
            end
          end
          object dbgrCds: TwwDBGrid
            Left = 0
            Top = 121
            Width = 953
            Height = 258
            Selected.Strings = (
              'COD_LINHA'#9'18'#9'Código'
              'DESCRICAOLINHA'#9'78'#9'Descrição'
              'NATUREZALINHA'#9'18'#9'Natureza da Linha'
              'CATEGORIA'#9'20'#9'Categoria'
              'TIPOPLANO'#9'15'#9'Planos ~Previdenciários')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = ds
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
      end
      object tbLinhaxCtaContab: TTabSheet
        Caption = 'Assoc. Linhas x  Conta Contábil'
        ImageIndex = 1
        object pnltop: TPanel
          Left = 0
          Top = 0
          Width = 953
          Height = 200
          Align = alTop
          BevelOuter = bvNone
          BorderWidth = 1
          TabOrder = 0
          object gbLinhasRelat: TGroupBox
            Left = 1
            Top = 1
            Width = 473
            Height = 164
            Align = alLeft
            Caption = ' Linhas para o Relatório '
            TabOrder = 0
            object dbgdLinhas: TwwDBGrid
              Left = 2
              Top = 15
              Width = 469
              Height = 147
              Selected.Strings = (
                'COD_LINHA'#9'6'#9'Código'
                'DESCRICAOLINHA'#9'85'#9'Descrição'
                'NATUREZALINHA'#9'18'#9'Natureza da Linha'
                'CATEGORIA'#9'20'#9'Categoria'
                'TIPOPLANO'#9'19'#9'Planos ~Previdenciários')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              OnRowChanged = dbgdRowChanged
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = ds
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyOptions = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 2
              TitleButtons = False
              OnEnter = dbgdEnter
              IndicatorColor = icBlack
            end
          end
          object gbContasContabeis: TGroupBox
            Left = 474
            Top = 1
            Width = 478
            Height = 164
            Align = alClient
            Caption = ' Contas Contábeis '
            TabOrder = 1
            object pnlConta: TPanel
              Left = 2
              Top = 15
              Width = 474
              Height = 31
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Label7: TLabel
                Left = 7
                Top = 9
                Width = 104
                Height = 13
                Caption = 'Pesquise a Conta:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Image1: TImage
                Left = 112
                Top = 7
                Width = 16
                Height = 16
                AutoSize = True
                Picture.Data = {
                  07544269746D617036050000424D360500000000000036040000280000001000
                  000010000000010008000000000000010000C40E0000C40E0000000100000000
                  000000000000000080000080000000808000800000008000800080800000C0C0
                  C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
                  E00000400000004020000040400000406000004080000040A0000040C0000040
                  E00000600000006020000060400000606000006080000060A0000060C0000060
                  E00000800000008020000080400000806000008080000080A0000080C0000080
                  E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
                  E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
                  E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
                  E00040000000400020004000400040006000400080004000A0004000C0004000
                  E00040200000402020004020400040206000402080004020A0004020C0004020
                  E00040400000404020004040400040406000404080004040A0004040C0004040
                  E00040600000406020004060400040606000406080004060A0004060C0004060
                  E00040800000408020004080400040806000408080004080A0004080C0004080
                  E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
                  E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
                  E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
                  E00080000000800020008000400080006000800080008000A0008000C0008000
                  E00080200000802020008020400080206000802080008020A0008020C0008020
                  E00080400000804020008040400080406000804080008040A0008040C0008040
                  E00080600000806020008060400080606000806080008060A0008060C0008060
                  E00080800000808020008080400080806000808080008080A0008080C0008080
                  E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
                  E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
                  E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
                  E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
                  E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
                  E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
                  E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
                  E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
                  E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
                  E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
                  A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                  FF00070707070707070707070707070707070707070707070707070707070707
                  070707070707FC070707070707070707070707070707FCFC0707070707070707
                  070707070707FCFCFC07070707070707070707070707FCFCFCFC070707070707
                  070707070707FCFCFCFCFC0707070707070707070707FCFCFCFCFCFC07070707
                  070707070707FCFCFCFCFCFCFC070707070707070707FCFCFCFCFFFC07070707
                  070707070707FCFCFCFFFC0707070707070707070707FCFCFFFC070707070707
                  070707070707FCFFFC07070707070707070707070707FCFC0707070707070707
                  070707070707FC07070707070707070707070707070707070707070707070707
                  0707}
                Stretch = True
                Transparent = True
              end
              object edContaContabil: TMaskEdit
                Left = 131
                Top = 4
                Width = 164
                Height = 21
                Color = 13565436
                EditMask = '9.9.9.9.99.99.99.99.99.99;0;'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 25
                ParentFont = False
                TabOrder = 0
                OnChange = edContaContabilChange
              end
            end
            object dbgdContabil: TwwDBGrid
              Left = 2
              Top = 46
              Width = 474
              Height = 116
              ControlType.Strings = (
                'SELECAO;CheckBox;1;0')
              PictureMasks.Strings = (
                'PLACONTA'#9'9.9.9.9.99.99.99.99.99.99;0;'#9'F'#9'T')
              Selected.Strings = (
                'SELECAO'#9'2'#9' '
                'PLACONTA'#9'19'#9'Conta'
                'PLANOME'#9'32'#9'Descrição da Conta Contabil'
                'NATUREZA'#9'17'#9'Natureza')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsContabil
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyOptions = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
              ParentFont = False
              TabOrder = 1
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 2
              TitleButtons = False
              OnDblClick = dbgdDblClick
              OnKeyDown = dbgdKeyDown
              IndicatorColor = icBlack
            end
          end
          object pnlbutton1: TPanel
            Left = 1
            Top = 165
            Width = 951
            Height = 34
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
          end
        end
        object pnlCtaContabxLinha: TPanel
          Left = 0
          Top = 200
          Width = 953
          Height = 179
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnlCtaContabxLinha'
          TabOrder = 1
          object pnlbtnCtaContabxLinha: TPanel
            Left = 0
            Top = 146
            Width = 953
            Height = 33
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object btnExcluirAssociacaoLinhaxContaContab: TBitBtn
              Left = 791
              Top = 1
              Width = 161
              Height = 32
              Hint = 'Excluir Associações'
              Anchors = [akTop, akRight]
              Cancel = True
              Caption = '&Excluir Associação'
              ModalResult = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btnExcluirAssociacaoLinhaxContaContabClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888FFFFF8888888888000008888888888F777778FF888888009191900
                88888887788888778F88887991919191088888788888888878F8879919191919
                108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
                19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
                19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
                190878F877787778887887917F919F71908887F88788878887F8879919191919
                1088878F88888888878888799191919108888878FF88888F7888888779999977
                8888888778FFFF77888888888777778888888888877777888888}
              NumGlyphs = 2
            end
            object btnGravarAlteracoesLinhaxCtaContab: TBitBtn
              Left = 624
              Top = 1
              Width = 161
              Height = 32
              Hint = 'Gravar Alterações'
              Anchors = [akTop, akRight]
              Caption = '&Gravar Alterações'
              ModalResult = 1
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = btnGravarAlteracoesLinhaxCtaContabClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
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
              NumGlyphs = 2
            end
          end
          object gbCtaContabxLinha: TGroupBox
            Left = 0
            Top = 0
            Width = 953
            Height = 146
            Align = alClient
            Caption = ' Contas Contábeis Associadas a Linha Selecionada '
            TabOrder = 1
            object dbgLinhasContabeis: TwwDBGrid
              Left = 2
              Top = 15
              Width = 949
              Height = 129
              Selected.Strings = (
                'PLACONTA'#9'18'#9'Conta'
                'PLANOME'#9'119'#9'Descrição da Conta Contábil'
                'NATUREZA'#9'12'#9'Natureza')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsLinhaxConta
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyOptions = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 2
              TitleButtons = False
              IndicatorColor = icBlack
            end
          end
        end
      end
      object tbLinhasRelatXRubrXDesemb: TTabSheet
        Caption = 'Assoc. Linhas x Desembolso'
        ImageIndex = 3
        object pnlTopLinhaxRubrxDesemb: TPanel
          Left = 0
          Top = 0
          Width = 953
          Height = 217
          Align = alTop
          BevelOuter = bvNone
          BorderWidth = 1
          TabOrder = 0
          object pnlTopLeftLinhaxRubrxDesemb: TPanel
            Left = 1
            Top = 1
            Width = 416
            Height = 215
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object gbLinhasRelatorio: TGroupBox
              Left = 0
              Top = 0
              Width = 416
              Height = 177
              Align = alClient
              Caption = ' Linhas para o Relatório '
              TabOrder = 0
              object dbgLinhasRelatorio: TwwDBGrid
                Left = 2
                Top = 15
                Width = 412
                Height = 160
                Selected.Strings = (
                  'COD_LINHA'#9'8'#9'Código'
                  'DESCRICAOLINHA'#9'80'#9'Descrição'
                  'NATUREZALINHA'#9'17'#9'Natureza da Linha'
                  'CATEGORIA'#9'16'#9'Categoria')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                OnRowChanged = dbgdRowChanged
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsLinhasRelat
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                KeyOptions = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleAlignment = taCenter
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 2
                TitleButtons = False
                OnEnter = dbgdEnter
                IndicatorColor = icBlack
              end
            end
            object Panel1: TPanel
              Left = 0
              Top = 177
              Width = 416
              Height = 38
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object Label6: TLabel
                Left = 4
                Top = 5
                Width = 157
                Height = 13
                Caption = 'Pesquise a Linha Relatório:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = bbtnCancelarClick
              end
              object Image3: TImage
                Left = 164
                Top = 3
                Width = 16
                Height = 16
                AutoSize = True
                Picture.Data = {
                  07544269746D617036050000424D360500000000000036040000280000001000
                  000010000000010008000000000000010000C40E0000C40E0000000100000000
                  000000000000000080000080000000808000800000008000800080800000C0C0
                  C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
                  E00000400000004020000040400000406000004080000040A0000040C0000040
                  E00000600000006020000060400000606000006080000060A0000060C0000060
                  E00000800000008020000080400000806000008080000080A0000080C0000080
                  E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
                  E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
                  E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
                  E00040000000400020004000400040006000400080004000A0004000C0004000
                  E00040200000402020004020400040206000402080004020A0004020C0004020
                  E00040400000404020004040400040406000404080004040A0004040C0004040
                  E00040600000406020004060400040606000406080004060A0004060C0004060
                  E00040800000408020004080400040806000408080004080A0004080C0004080
                  E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
                  E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
                  E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
                  E00080000000800020008000400080006000800080008000A0008000C0008000
                  E00080200000802020008020400080206000802080008020A0008020C0008020
                  E00080400000804020008040400080406000804080008040A0008040C0008040
                  E00080600000806020008060400080606000806080008060A0008060C0008060
                  E00080800000808020008080400080806000808080008080A0008080C0008080
                  E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
                  E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
                  E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
                  E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
                  E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
                  E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
                  E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
                  E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
                  E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
                  E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
                  A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                  FF00070707070707070707070707070707070707070707070707070707070707
                  070707070707FC070707070707070707070707070707FCFC0707070707070707
                  070707070707FCFCFC07070707070707070707070707FCFCFCFC070707070707
                  070707070707FCFCFCFCFC0707070707070707070707FCFCFCFCFCFC07070707
                  070707070707FCFCFCFCFCFCFC070707070707070707FCFCFCFCFFFC07070707
                  070707070707FCFCFCFFFC0707070707070707070707FCFCFFFC070707070707
                  070707070707FCFFFC07070707070707070707070707FCFC0707070707070707
                  070707070707FC07070707070707070707070707070707070707070707070707
                  0707}
                Stretch = True
                Transparent = True
              end
              object edLocLinha: TEdit
                Left = 181
                Top = 1
                Width = 222
                Height = 21
                Color = 13565436
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnChange = edLocLinhaChange
              end
            end
          end
          object Panel2: TPanel
            Left = 417
            Top = 1
            Width = 535
            Height = 215
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel2'
            TabOrder = 1
            object Label10: TLabel
              Left = 2
              Top = 185
              Width = 139
              Height = 13
              Caption = 'Pesquise o Desembolso:'
            end
            object Image6: TImage
              Left = 422
              Top = 4
              Width = 16
              Height = 16
              AutoSize = True
              Picture.Data = {
                07544269746D617036050000424D360500000000000036040000280000001000
                000010000000010008000000000000010000C40E0000C40E0000000100000000
                000000000000000080000080000000808000800000008000800080800000C0C0
                C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
                E00000400000004020000040400000406000004080000040A0000040C0000040
                E00000600000006020000060400000606000006080000060A0000060C0000060
                E00000800000008020000080400000806000008080000080A0000080C0000080
                E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
                E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
                E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
                E00040000000400020004000400040006000400080004000A0004000C0004000
                E00040200000402020004020400040206000402080004020A0004020C0004020
                E00040400000404020004040400040406000404080004040A0004040C0004040
                E00040600000406020004060400040606000406080004060A0004060C0004060
                E00040800000408020004080400040806000408080004080A0004080C0004080
                E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
                E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
                E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
                E00080000000800020008000400080006000800080008000A0008000C0008000
                E00080200000802020008020400080206000802080008020A0008020C0008020
                E00080400000804020008040400080406000804080008040A0008040C0008040
                E00080600000806020008060400080606000806080008060A0008060C0008060
                E00080800000808020008080400080806000808080008080A0008080C0008080
                E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
                E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
                E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
                E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
                E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
                E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
                E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
                E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
                E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
                E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
                A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF00070707070707070707070707070707070707070707070707070707070707
                070707070707FC070707070707070707070707070707FCFC0707070707070707
                070707070707FCFCFC07070707070707070707070707FCFCFCFC070707070707
                070707070707FCFCFCFCFC0707070707070707070707FCFCFCFCFCFC07070707
                070707070707FCFCFCFCFCFCFC070707070707070707FCFCFCFCFFFC07070707
                070707070707FCFCFCFFFC0707070707070707070707FCFCFFFC070707070707
                070707070707FCFFFC07070707070707070707070707FCFC0707070707070707
                070707070707FC07070707070707070707070707070707070707070707070707
                0707}
              Stretch = True
              Transparent = True
            end
            object Image7: TImage
              Left = 142
              Top = 185
              Width = 16
              Height = 16
              AutoSize = True
              Picture.Data = {
                07544269746D617036050000424D360500000000000036040000280000001000
                000010000000010008000000000000010000C40E0000C40E0000000100000000
                000000000000000080000080000000808000800000008000800080800000C0C0
                C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
                E00000400000004020000040400000406000004080000040A0000040C0000040
                E00000600000006020000060400000606000006080000060A0000060C0000060
                E00000800000008020000080400000806000008080000080A0000080C0000080
                E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
                E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
                E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
                E00040000000400020004000400040006000400080004000A0004000C0004000
                E00040200000402020004020400040206000402080004020A0004020C0004020
                E00040400000404020004040400040406000404080004040A0004040C0004040
                E00040600000406020004060400040606000406080004060A0004060C0004060
                E00040800000408020004080400040806000408080004080A0004080C0004080
                E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
                E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
                E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
                E00080000000800020008000400080006000800080008000A0008000C0008000
                E00080200000802020008020400080206000802080008020A0008020C0008020
                E00080400000804020008040400080406000804080008040A0008040C0008040
                E00080600000806020008060400080606000806080008060A0008060C0008060
                E00080800000808020008080400080806000808080008080A0008080C0008080
                E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
                E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
                E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
                E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
                E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
                E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
                E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
                E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
                E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
                E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
                A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF00070707070707070707070707070707070707070707070707070707070707
                070707070707FC070707070707070707070707070707FCFC0707070707070707
                070707070707FCFCFC07070707070707070707070707FCFCFCFC070707070707
                070707070707FCFCFCFCFC0707070707070707070707FCFCFCFCFCFC07070707
                070707070707FCFCFCFCFCFCFC070707070707070707FCFCFCFCFFFC07070707
                070707070707FCFCFCFFFC0707070707070707070707FCFCFFFC070707070707
                070707070707FCFFFC07070707070707070707070707FCFC0707070707070707
                070707070707FC07070707070707070707070707070707070707070707070707
                0707}
              Stretch = True
              Transparent = True
            end
            object gbDesembolso: TGroupBox
              Left = 0
              Top = 0
              Width = 535
              Height = 178
              Align = alTop
              Caption = ' Tipo de Desembolso '
              TabOrder = 0
              object dbgdDesembolso: TwwDBGrid
                Left = 2
                Top = 15
                Width = 531
                Height = 161
                ControlType.Strings = (
                  'SELECAO;CheckBox;1;0')
                Selected.Strings = (
                  'SELECAO'#9'10'#9'Seleção'#9'F'
                  'CODTIPRECDES'#9'10'#9'Código'#9'F'
                  'DESCRICAO'#9'41'#9'DESCRICAO'#9'F')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsTipoDesem
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                KeyOptions = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
                ParentFont = False
                TabOrder = 0
                TitleAlignment = taCenter
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 2
                TitleButtons = False
                OnDblClick = dbgdDblClick
                OnKeyDown = dbgdKeyDown
                IndicatorColor = icBlack
              end
            end
            object edPesqDesemb: TEdit
              Left = 162
              Top = 183
              Width = 256
              Height = 21
              TabOrder = 1
              OnChange = edPesqDesembChange
            end
          end
        end
        object pnlBottomLinhaRelatxRubrxDesemb: TPanel
          Left = 0
          Top = 217
          Width = 953
          Height = 162
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object pnlBottomBtnLinhaRelatxRubrxDesemb: TPanel
            Left = 0
            Top = 129
            Width = 953
            Height = 33
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object BtnExcluirAssociacaoLinhaRelatxRubrxDesemb: TBitBtn
              Left = 778
              Top = 2
              Width = 161
              Height = 32
              Hint = 'Excluir Associações'
              Anchors = [akTop, akRight]
              Cancel = True
              Caption = '&Excluir Associação'
              ModalResult = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = BtnExcluirAssociacaoLinhaRelatxRubrxDesembClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888FFFFF8888888888000008888888888F777778FF888888009191900
                88888887788888778F88887991919191088888788888888878F8879919191919
                108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
                19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
                19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
                190878F877787778887887917F919F71908887F88788878887F8879919191919
                1088878F88888888878888799191919108888878FF88888F7888888779999977
                8888888778FFFF77888888888777778888888888877777888888}
              NumGlyphs = 2
            end
            object BtnGravarAssociacaoLinhaRelatxRubrxDesemb: TBitBtn
              Left = 612
              Top = 2
              Width = 161
              Height = 32
              Hint = 'Gravar Alterações'
              Anchors = [akTop, akRight]
              Caption = '&Gravar Alterações'
              ModalResult = 1
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = BtnGravarAssociacaoLinhaRelatxRubrxDesembClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
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
              NumGlyphs = 2
            end
          end
          object gbLinhasxRubricasxDesemb: TGroupBox
            Left = 0
            Top = 0
            Width = 953
            Height = 129
            Align = alClient
            Caption = ' Linhas para Relatório X Tipo de Desembolso '
            TabOrder = 1
            object dbgLinhaxDesembolso: TwwDBGrid
              Left = 2
              Top = 15
              Width = 949
              Height = 112
              Selected.Strings = (
                'LINHA'#9'10'#9'Cod. Linha'
                'DESCRICAO_LINHA'#9'80'#9'Descrição'
                'DESCRICAO_CATEGORIA'#9'20'#9'Categoria'
                'CDES'#9'15'#9'CDES'
                'DESCRICAO_DESEMBOLSO'#9'50'#9'Tipo de Desembolso')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsLInhasRelatxTipoDesemb
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
              TabOrder = 0
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
          end
        end
      end
      object tbCargoxRubr: TTabSheet
        Caption = 'Assoc. Cargos x Rubricas'
        ImageIndex = 2
        object pnlTopCargoxRubricas: TPanel
          Left = 0
          Top = 0
          Width = 953
          Height = 200
          Align = alTop
          BevelOuter = bvNone
          BorderWidth = 1
          TabOrder = 0
          object gbCargo: TGroupBox
            Left = 1
            Top = 1
            Width = 410
            Height = 164
            Align = alLeft
            Caption = ' Cargo '
            TabOrder = 0
            object dbgdCargo: TwwDBGrid
              Left = 2
              Top = 15
              Width = 406
              Height = 147
              Selected.Strings = (
                'TITULO'#9'61'#9'Cargo')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              OnRowChanged = dbgdRowChanged
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsCargo
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyOptions = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 2
              TitleButtons = False
              OnEnter = dbgdEnter
              IndicatorColor = icBlack
            end
          end
          object gbRubricas: TGroupBox
            Left = 411
            Top = 1
            Width = 541
            Height = 164
            Align = alClient
            Caption = ' Rubricas '
            TabOrder = 1
            object dbgdRubricaCargo: TwwDBGrid
              Left = 2
              Top = 15
              Width = 537
              Height = 147
              ControlType.Strings = (
                'SELECAO;CheckBox;1;0')
              Selected.Strings = (
                'SELECAO'#9'10'#9'Seleção'#9'F'
                'Descricao'#9'80'#9'Rubrica'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsRubricas
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyOptions = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
              ParentFont = False
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 2
              TitleButtons = False
              OnDblClick = dbgdDblClick
              OnKeyDown = dbgdKeyDown
              IndicatorColor = icBlack
            end
          end
          object pnlTopbtnCargoxRubricas: TPanel
            Left = 1
            Top = 165
            Width = 951
            Height = 34
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
            object Label5: TLabel
              Left = 5
              Top = 4
              Width = 104
              Height = 13
              Caption = 'Pesquise o Cargo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Image2: TImage
              Left = 110
              Top = 4
              Width = 16
              Height = 16
              AutoSize = True
              Picture.Data = {
                07544269746D617036050000424D360500000000000036040000280000001000
                000010000000010008000000000000010000C40E0000C40E0000000100000000
                000000000000000080000080000000808000800000008000800080800000C0C0
                C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
                E00000400000004020000040400000406000004080000040A0000040C0000040
                E00000600000006020000060400000606000006080000060A0000060C0000060
                E00000800000008020000080400000806000008080000080A0000080C0000080
                E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
                E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
                E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
                E00040000000400020004000400040006000400080004000A0004000C0004000
                E00040200000402020004020400040206000402080004020A0004020C0004020
                E00040400000404020004040400040406000404080004040A0004040C0004040
                E00040600000406020004060400040606000406080004060A0004060C0004060
                E00040800000408020004080400040806000408080004080A0004080C0004080
                E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
                E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
                E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
                E00080000000800020008000400080006000800080008000A0008000C0008000
                E00080200000802020008020400080206000802080008020A0008020C0008020
                E00080400000804020008040400080406000804080008040A0008040C0008040
                E00080600000806020008060400080606000806080008060A0008060C0008060
                E00080800000808020008080400080806000808080008080A0008080C0008080
                E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
                E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
                E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
                E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
                E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
                E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
                E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
                E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
                E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
                E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
                A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF00070707070707070707070707070707070707070707070707070707070707
                070707070707FC070707070707070707070707070707FCFC0707070707070707
                070707070707FCFCFC07070707070707070707070707FCFCFCFC070707070707
                070707070707FCFCFCFCFC0707070707070707070707FCFCFCFCFCFC07070707
                070707070707FCFCFCFCFCFCFC070707070707070707FCFCFCFCFFFC07070707
                070707070707FCFCFCFFFC0707070707070707070707FCFCFFFC070707070707
                070707070707FCFFFC07070707070707070707070707FCFC0707070707070707
                070707070707FC07070707070707070707070707070707070707070707070707
                0707}
              Stretch = True
              Transparent = True
            end
            object Image5: TImage
              Left = 544
              Top = 4
              Width = 16
              Height = 16
              AutoSize = True
              Picture.Data = {
                07544269746D617036050000424D360500000000000036040000280000001000
                000010000000010008000000000000010000C40E0000C40E0000000100000000
                000000000000000080000080000000808000800000008000800080800000C0C0
                C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
                E00000400000004020000040400000406000004080000040A0000040C0000040
                E00000600000006020000060400000606000006080000060A0000060C0000060
                E00000800000008020000080400000806000008080000080A0000080C0000080
                E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
                E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
                E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
                E00040000000400020004000400040006000400080004000A0004000C0004000
                E00040200000402020004020400040206000402080004020A0004020C0004020
                E00040400000404020004040400040406000404080004040A0004040C0004040
                E00040600000406020004060400040606000406080004060A0004060C0004060
                E00040800000408020004080400040806000408080004080A0004080C0004080
                E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
                E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
                E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
                E00080000000800020008000400080006000800080008000A0008000C0008000
                E00080200000802020008020400080206000802080008020A0008020C0008020
                E00080400000804020008040400080406000804080008040A0008040C0008040
                E00080600000806020008060400080606000806080008060A0008060C0008060
                E00080800000808020008080400080806000808080008080A0008080C0008080
                E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
                E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
                E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
                E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
                E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
                E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
                E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
                E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
                E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
                E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
                A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF00070707070707070707070707070707070707070707070707070707070707
                070707070707FC070707070707070707070707070707FCFC0707070707070707
                070707070707FCFCFC07070707070707070707070707FCFCFCFC070707070707
                070707070707FCFCFCFCFC0707070707070707070707FCFCFCFCFCFC07070707
                070707070707FCFCFCFCFCFCFC070707070707070707FCFCFCFCFFFC07070707
                070707070707FCFCFCFFFC0707070707070707070707FCFCFFFC070707070707
                070707070707FCFFFC07070707070707070707070707FCFC0707070707070707
                070707070707FC07070707070707070707070707070707070707070707070707
                0707}
              Stretch = True
              Transparent = True
            end
            object Label9: TLabel
              Left = 427
              Top = 4
              Width = 115
              Height = 13
              Caption = 'Pesquise o Rubrica:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edLocCargo: TEdit
              Left = 129
              Top = 3
              Width = 229
              Height = 21
              CharCase = ecUpperCase
              Color = 13565436
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = edLocCargoChange
            end
            object edRubrica: TEdit
              Left = 563
              Top = 1
              Width = 229
              Height = 21
              CharCase = ecUpperCase
              Color = 13565436
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnChange = edRubricaChange
            end
          end
        end
        object pnlBottomCargoxRubricas: TPanel
          Left = 0
          Top = 200
          Width = 953
          Height = 179
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel1'
          TabOrder = 1
          object pnlBottombtnCargoxRubricas: TPanel
            Left = 0
            Top = 146
            Width = 953
            Height = 33
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object btnExcluirAlteracoesCargoXRubrica: TBitBtn
              Left = 791
              Top = 0
              Width = 161
              Height = 32
              Hint = 'Excluir Associações'
              Anchors = [akTop, akRight]
              Cancel = True
              Caption = '&Excluir Associação'
              ModalResult = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btnExcluirAlteracoesCargoXRubricaClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888FFFFF8888888888000008888888888F777778FF888888009191900
                88888887788888778F88887991919191088888788888888878F8879919191919
                108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
                19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
                19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
                190878F877787778887887917F919F71908887F88788878887F8879919191919
                1088878F88888888878888799191919108888878FF88888F7888888779999977
                8888888778FFFF77888888888777778888888888877777888888}
              NumGlyphs = 2
            end
            object btnGravarAlteracoesCargoxRubrica: TBitBtn
              Left = 625
              Top = 0
              Width = 161
              Height = 32
              Anchors = [akTop, akRight]
              Caption = '&Gravar Alterações'
              ModalResult = 1
              TabOrder = 1
              OnClick = btnGravarAlteracoesCargoxRubricaClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
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
              NumGlyphs = 2
            end
          end
          object gbCargoxRubricas: TGroupBox
            Left = 0
            Top = 0
            Width = 953
            Height = 146
            Align = alClient
            Caption = ' Cargos associados à Rubricas '
            TabOrder = 1
            object dbgCargoxRubrica: TwwDBGrid
              Left = 2
              Top = 15
              Width = 949
              Height = 129
              Selected.Strings = (
                'TITULO'#9'55'#9'Titulo'#9'F'
                'DESCRICAO'#9'80'#9'Descrição')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsCargoxRubrica
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyOptions = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
              ParentFont = False
              ReadOnly = True
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
    end
  end
  inherited Dock972: TDock97
    Width = 963
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Hint = 'Incluir Linhas do Relatório'
        ParentShowHint = False
        ShowHint = True
      end
      inherited sbtnAlterar: TToolbarButton97
        Hint = 'Alterar Linhas do Relatório'
        ParentShowHint = False
        ShowHint = True
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Hint = 'Excluir Linhas do Relatório'
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 521
    Width = 963
    inherited tb97Fundo: TToolbar97
      Left = 640
      DockPos = 640
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 463
      DockPos = 463
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 256
    Top = 8
    TargetsData = (
      1
      2
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0))
  end
  inherited ds: TwwDataSource
    DataSet = cds
    Left = 20
    Top = 276
  end
  inherited upd: TUpdateSQL
    Left = 352
    Top = 8
  end
  inherited MontaSelect: TMontaSelect
    Left = 472
    Top = 8
  end
  inherited ImlPadrao: TImageList
    Left = 312
    Top = 8
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    Left = 408
    Top = 8
  end
  inherited cds: TCMClientDataSet
    AfterScroll = cdsAfterScroll
    Left = 70
    Top = 268
  end
  object cmSqlCds: TCMSqlParams
    SQL.Strings = (
      'select tp.Descricao            as TipoRelatorio,'
      '       tp.idTipo,'
      '       nv.idnorma,'
      '       nv.Descricao            as Norma,'
      '       nv.DataInicio,'
      '       nv.datafim,'
      '       lr.idlinha,'
      '       lr.cod_linha,'
      '       lr.descricao            as DescricaoLinha,'
      '       na.idNatureza,'
      '       na.descricao            as NaturezaLinha,'
      '       tc.descricaocategoria  as categoria,'
      '       tpp.Descricao as TipoPlano,'
      '       lr.TipoContabilizacao,'
      '       tc.idtipodecategoria as idcategoria'
      '  from tipo_relatorio    TP,'
      '       Norma_vigente     NV,'
      '       Linha_Relatorio   LR,'
      '       Natureza_Linha    NA,'
      '       TIPOPLANOPREV_EFD TPP,'
      '       TipoDeCategoria   TC'
      ' where lr.idnorma = nv.idnorma'
      '   and lr.idnatureza = na.idnatureza'
      '   and nv.idtipo = tp.idtipo'
      '   and tp.idTipo = 2'
      '   and nv.IdNorma = 2'
      '   and (nv.datafim = to_date('#39'30/12/1899'#39', '#39'dd/mm/yyyy'#39') or'
      '       nv.datafim is null)'
      '   and tc.idtipodecategoria = lr.idtipodecategoria'
      '   and LR.TipoContabilizacao = Tpp.IdTipoPlano(+)'
      ' order by idNorma, cod_linha')
    ClientDataSet = cds
    Left = 546
    Top = 172
  end
  object cdsNatureza: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 8
  end
  object cdsFiltroTipo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 586
    Top = 66
  end
  object cdsVigencia: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 664
    Top = 8
  end
  object cdsContabil: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Placonta'
    Params = <>
    Left = 200
    Top = 258
    object cdsContabilSELECAO: TFloatField
      DisplayLabel = ' '
      DisplayWidth = 2
      FieldName = 'SELECAO'
    end
    object cdsContabilPLACONTA: TStringField
      DisplayLabel = 'Conta'
      DisplayWidth = 19
      FieldName = 'PLACONTA'
      EditMask = '9.9.9.9.99.99.99.99.99.99;0;_'
      FixedChar = True
      Size = 18
    end
    object cdsContabilPLANOME: TStringField
      DisplayLabel = 'Descrição da Conta Contabil'
      DisplayWidth = 32
      FieldName = 'PLANOME'
      Size = 80
    end
    object cdsContabilNATUREZA: TStringField
      DisplayLabel = 'Natureza'
      DisplayWidth = 17
      FieldName = 'NATUREZA'
      Size = 18
    end
    object cdsContabilPLANATUREZA: TStringField
      DisplayLabel = 'Natureza'
      DisplayWidth = 9
      FieldName = 'PLANATUREZA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsContabilPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
  end
  object dsContabil: TwwDataSource
    DataSet = cdsContabil
    Left = 146
    Top = 238
  end
  object cdsLinhaxConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 244
    Top = 212
    object cdsLinhaxContaPLACONTA: TStringField
      DisplayLabel = 'Conta'
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      EditMask = '9.9.9.9.99.99.99.99.99.99;0;_'
      FixedChar = True
      Size = 18
    end
    object cdsLinhaxContaPLANOME: TStringField
      DisplayLabel = 'Descrição da Conta Contábil'
      DisplayWidth = 119
      FieldName = 'PLANOME'
      Size = 80
    end
    object cdsLinhaxContaNATUREZA: TStringField
      DisplayLabel = 'Natureza'
      DisplayWidth = 12
      FieldName = 'NATUREZA'
      Size = 8
    end
    object cdsLinhaxContaIDASSOCIACAO: TFloatField
      FieldName = 'IDASSOCIACAO'
      Visible = False
    end
    object cdsLinhaxContaIDLINHA: TFloatField
      FieldName = 'IDLINHA'
      Visible = False
    end
    object cdsLinhaxContaPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object cdsLinhaxContaTIPOBASECALC: TFloatField
      FieldName = 'TIPOBASECALC'
    end
    object cdsLinhaxContaCODAJUSTE: TStringField
      FieldName = 'CODAJUSTE'
      FixedChar = True
      Size = 2
    end
    object cdsLinhaxContaNUMPROCESSO: TStringField
      FieldName = 'NUMPROCESSO'
      Size = 60
    end
    object cdsLinhaxContaDESCRAJUSTE: TStringField
      FieldName = 'DESCRAJUSTE'
      Size = 60
    end
    object cdsLinhaxContaINFOAJUSTE: TStringField
      FieldName = 'INFOAJUSTE'
      Size = 100
    end
  end
  object dsLinhaxConta: TwwDataSource
    DataSet = cdsLinhaxConta
    Left = 256
    Top = 266
  end
  object cmSqlLinhaxConta: TCMSqlParams
    SQL.Strings = (
      'select lc.idassociacao,'
      '       lc.idlinha,'
      '       lc.plano,'
      '       lc.placonta,'
      '       pla.planome,'
      '       lc.tipobasecalc, '
      '       lc.codajuste, '
      '       lc.numprocesso,'
      '       lc.descrajuste, '
      '       lc.infoajuste, '
      
        '       decode(lc.planatureza, '#39'C'#39', '#39'Credora'#39', '#39'Devedora'#39') as Nat' +
        'ureza      '
      'from linhaxcontacontabil lc,'
      '     planoconta pla'
      'where pla.plano    = lc.plano'
      '  and pla.placonta = lc.placonta')
    ClientDataSet = cdsLinhaxConta
    Left = 270
    Top = 164
  end
  object cdsFiltroNorma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 782
    Top = 64
  end
  object cdsContabilBackup: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 102
    Top = 192
    object FloatField1: TFloatField
      DisplayLabel = 'Seleção'
      DisplayWidth = 10
      FieldName = 'SELECAO'
    end
    object StringField1: TStringField
      DisplayLabel = 'Conta'
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      EditMask = '9.9.9.9.99.99.99.99.99.99;0;_'
      FixedChar = True
      Size = 18
    end
    object StringField2: TStringField
      DisplayLabel = 'Descrição da Conta Contabil'
      DisplayWidth = 50
      FieldName = 'PLANOME'
      Size = 80
    end
    object FloatField2: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object cdsContabilBackupPLANATUREZA: TStringField
      FieldName = 'PLANATUREZA'
      FixedChar = True
      Size = 1
    end
    object cdsContabilBackupNATUREZA: TStringField
      FieldName = 'NATUREZA'
      Size = 18
    end
  end
  object cdsFiltroData: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 728
    Top = 8
  end
  object cdsCargo: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Titulo'
    Params = <>
    Left = 428
    Top = 320
  end
  object dsCargo: TwwDataSource
    DataSet = cdsCargo
    Left = 374
    Top = 318
  end
  object cdsRubricas: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Descricao'
    Params = <>
    Left = 794
    Top = 134
  end
  object dsRubricas: TwwDataSource
    DataSet = cdsRubricas
    Left = 802
    Top = 234
  end
  object cdsCargoxRubrica: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Titulo'
    Params = <>
    Left = 654
    Top = 360
    object cdsCargoxRubricaTITULO: TStringField
      DisplayLabel = 'Titulo'
      DisplayWidth = 55
      FieldName = 'TITULO'
      Size = 40
    end
    object cdsCargoxRubricaDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 80
      FieldName = 'DESCRICAO'
      Size = 130
    end
    object cdsCargoxRubricaIDASSOCIACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDASSOCIACAO'
      Visible = False
    end
    object cdsCargoxRubricaIDNORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDNORMA'
      Visible = False
    end
    object cdsCargoxRubricaIDCARGO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARGO'
      Visible = False
    end
    object cdsCargoxRubricaIDPROVENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROVENTO'
      Visible = False
    end
  end
  object dsCargoxRubrica: TwwDataSource
    DataSet = cdsCargoxRubrica
    Left = 630
    Top = 298
  end
  object cdsLinhasRelat: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 348
    Top = 218
  end
  object dsLinhasRelat: TwwDataSource
    DataSet = cdsLinhasRelat
    Left = 352
    Top = 162
  end
  object cdsTipoDesemb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 566
    Top = 414
  end
  object dsTipoDesem: TwwDataSource
    DataSet = cdsTipoDesemb
    Left = 644
    Top = 146
  end
  object cdsLinhasRelatxTipoDesemb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 98
    Top = 426
    object cdsLinhasRelatxTipoDesembNORMA: TFloatField
      FieldName = 'NORMA'
      Visible = False
    end
    object cdsLinhasRelatxTipoDesembLINHA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Cod. Linha'
      DisplayWidth = 10
      FieldName = 'LINHA'
      Size = 10
    end
    object cdsLinhasRelatxTipoDesembDESCRICAO_LINHA: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 80
      FieldName = 'DESCRICAO_LINHA'
      Size = 80
    end
    object cdsLinhasRelatxTipoDesembDESCRICAO_CATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      DisplayWidth = 20
      FieldName = 'DESCRICAO_CATEGORIA'
    end
    object cdsLinhasRelatxTipoDesembCDES: TStringField
      DisplayWidth = 15
      FieldName = 'CDES'
      FixedChar = True
      Size = 15
    end
    object cdsLinhasRelatxTipoDesembDESCRICAO_DESEMBOLSO: TStringField
      DisplayLabel = 'Tipo de Desembolso'
      DisplayWidth = 50
      FieldName = 'DESCRICAO_DESEMBOLSO'
      Size = 35
    end
    object cdsLinhasRelatxTipoDesembIDLINHA: TFloatField
      FieldName = 'IDLINHA'
      Visible = False
    end
    object cdsLinhasRelatxTipoDesembIDASSOCIACAO: TFloatField
      FieldName = 'IDASSOCIACAO'
      Visible = False
    end
  end
  object dsLInhasRelatxTipoDesemb: TwwDataSource
    DataSet = cdsLinhasRelatxTipoDesemb
    Left = 264
    Top = 424
  end
  object cmSqlCargoxRubrica: TCMSqlParams
    SQL.Strings = (
      'select cr.idassociacao,'
      '             cr.idnorma,'
      '             cr.idcargo,'
      '             c.titulo,'
      '             cr.idprovento,'
      '             pd.descricao'
      '        from cargoxrubrica cr, cargo c, provdesc pd'
      '       where cr.idcargo = c.idcargo'
      '         and cr.idprovento = pd.idprovento       '
      '      order by cr.idNorma,cr.idCargo')
    ClientDataSet = cdsCargoxRubrica
    Left = 770
    Top = 314
  end
  object cdsRubricasBackup: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 762
    Top = 404
  end
  object cdsTipoDesembBackup: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 558
    Top = 236
  end
  object sqlLinhasRelatxTipoDesemb: TCMSqlParams
    SQL.Strings = (
      'SELECT LT.IDASSOCIACAO,'
      '       LR.IDLINHA            IDLINHA,'
      '       NV.IDNORMA            NORMA,'
      '       LR.COD_LINHA          LINHA,'
      '       LR.DESCRICAO          DESCRICAO_LINHA,'
      '       TP.DESCRICAOCATEGORIA DESCRICAO_CATEGORIA,'
      '       TR.CODTIPRECDES       CDES,'
      '       TR.DESCRICAO          DESCRICAO_DESEMBOLSO'
      '  FROM LINHAXTIPODESEMBOLSO LT,'
      '       LINHA_RELATORIO      LR,'
      '       TIPORECEBDESEMB      TR,'
      '       TIPODECATEGORIA      TP,'
      '       NORMA_VIGENTE        NV'
      ' WHERE LT.IDLINHA = LR.IDLINHA'
      '   AND LT.CODTIPRECDES = TR.CODTIPRECDES'
      '   AND TP.IDTIPODECATEGORIA = LR.IDTIPODECATEGORIA'
      '   AND NV.IDNORMA = LT.IDNORMA'
      '   AND TR.RECPAG = '#39'P'#39
      '   AND LT.IDLINHA = 60'
      '   AND NV.IDNORMA = 2'
      '')
    ClientDataSet = cdsLinhasRelatxTipoDesemb
    Left = 438
    Top = 422
  end
  object cdsLinRubricas: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Descricao'
    Params = <>
    Left = 168
    Top = 186
  end
  object dsLinRubricas: TwwDataSource
    DataSet = cdsLinRubricas
    Left = 212
    Top = 166
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'Select 0 as Selecao,'
      '             td.codtiprecdes,'
      '             td.Descricao'
      '      from tiporecebdesemb td'
      '      where descricao is not null'
      '      order by descricao')
    ClientDataSet = cdsTipoDesemb
    Left = 614
    Top = 212
  end
  object CMSqlCargo: TCMSqlParams
    SQL.Strings = (
      'select * from cargo')
    ClientDataSet = cdsCargo
    Left = 520
    Top = 276
  end
  object cdsTipoCategoria: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 438
    Top = 254
  end
  object cmSqlLinhasRelat: TCMSqlParams
    SQL.Strings = (
      'select tp.Descricao            as TipoRelatorio,'
      '       tp.idTipo,'
      '       nv.idnorma,'
      '       nv.Descricao            as Norma,'
      '       nv.DataInicio,'
      '       nv.datafim,'
      '       lr.idlinha,'
      '       lr.cod_linha,'
      '       lr.descricao            as DescricaoLinha,'
      '       na.idNatureza,'
      '       na.descricao            as NaturezaLinha,'
      '       tpp.Descricao  as TipoPlano,'
      '       lr.tipocontabilizacao,'
      '       tc.descricaocategoria  as categoria,'
      '       tc.idtipodecategoria as idcategoria'
      '  from tipo_relatorio    TP,'
      '       Norma_vigente     NV,'
      '       Linha_Relatorio   LR,'
      '       Natureza_Linha    NA,'
      '       TipoDeCategoria   TC,'
      '       TIPOPLANOPREV_EFD tpp'
      ' where lr.idnorma = nv.idnorma'
      '   and lr.idnatureza = na.idnatureza'
      '   and nv.idtipo = tp.idtipo'
      '   and tp.idTipo = 2'
      '   and nv.IdNorma = 2'
      '   and (nv.datafim = to_date('#39'30/12/1899'#39', '#39'dd/mm/yyyy'#39') or'
      '       nv.datafim is null)'
      '   and tc.idtipodecategoria = lr.idtipodecategoria'
      '   and lr.tipocontabilizacao = tpp.idtipoplano(+)'
      ' order by idNorma, cod_linha'
      ' ')
    ClientDataSet = cdsLinhasRelat
    Left = 354
    Top = 276
  end
  object sqlContabil: TCMSqlParams
    SQL.Strings = (
      
        'Select 0 as Selecao, pla.plano, pla.placonta, pla.planome, pla.p' +
        'lanatureza, '
      
        '       decode(pla.planatureza, '#39'D'#39', '#39'Devedora'#39', '#39'C'#39', '#39'Credora'#39', ' +
        #39'Credora e Devedora'#39') NATUREZA'
      '  from planoconta pla'
      ' where pla.plano = (select plano from paramcontab)'
      ' ')
    ClientDataSet = cdsContabil
    Left = 197
    Top = 353
  end
  object cdsTipoPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 885
    Top = 305
    object cdsTipoPlanoIDTIPOPLANO: TFloatField
      FieldName = 'IDTIPOPLANO'
    end
    object cdsTipoPlanoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 15
    end
  end
end
