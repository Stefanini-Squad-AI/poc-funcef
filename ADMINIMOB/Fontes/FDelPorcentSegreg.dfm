inherited frmDelPorcentagemSegreg: TfrmDelPorcentagemSegreg
  Left = 330
  Top = 119
  Caption = 'Desfazer Cadastro de Percentuais de segregação'
  ClientHeight = 482
  ClientWidth = 689
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 689
    Height = 447
    object ntbPrincipal: TNotebook
      Left = 0
      Top = 0
      Width = 689
      Height = 447
      Align = alClient
      PageIndex = 2
      TabOrder = 0
      OnPageChanged = ntbPrincipalPageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'Default'
        object rgAplicarPerc: TRadioGroup
          Left = 7
          Top = 13
          Width = 676
          Height = 164
          Caption = 'Aplicar para:'
          ItemIndex = 1
          Items.Strings = (
            'Segmento'
            'Todos os Imóveis'
            'Selecionar Imóvel (is)')
          TabOrder = 0
          OnClick = rgAplicarPercClick
        end
        object cboTipoImovel: TwwDBLookupCombo
          Left = 146
          Top = 40
          Width = 121
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOIMOVEL'#9'25'#9'Descrição'#9'F')
          LookupTable = dtmLookImobiliario.qryLookTipoImovel
          LookupField = 'CODTIPIMOVEL'
          TabOrder = 1
          Visible = False
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object GroupBox1: TGroupBox
          Left = 8
          Top = 211
          Width = 674
          Height = 129
          Caption = 'Período de Vigência'
          TabOrder = 2
          object Label1: TLabel
            Left = 191
            Top = 81
            Width = 8
            Height = 13
            Caption = 'a'
          end
          object Label2: TLabel
            Left = 24
            Top = 53
            Width = 66
            Height = 13
            Caption = 'Data Inicial'
          end
          object Label3: TLabel
            Left = 253
            Top = 54
            Width = 59
            Height = 13
            Caption = 'Data Final'
          end
          object dtpVigenciaInicial: TCMDateTimePicker
            Left = 24
            Top = 77
            Width = 121
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
          end
          object dtpVigenciaFinal: TCMDateTimePicker
            Left = 251
            Top = 77
            Width = 121
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
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Imovel'
        object Panel4: TPanel
          Left = 9
          Top = 167
          Width = 670
          Height = 241
          BevelOuter = bvNone
          Caption = 'Panel4'
          TabOrder = 1
          object grdImovel: TwwDBGrid
            Left = 0
            Top = 0
            Width = 670
            Height = 190
            ControlType.Strings = (
              'SEL;CheckBox;Yes;No')
            Selected.Strings = (
              'SEL'#9'2'#9#9'F'
              'CODIGO'#9'15'#9'Código'#9'F'
              'NOME'#9'100'#9'Nome do Imóvel'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alTop
            DataSource = dsImovel
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
            IndicatorColor = icBlack
          end
        end
        object Panel3: TPanel
          Left = 9
          Top = 9
          Width = 669
          Height = 137
          BevelInner = bvSpace
          BevelOuter = bvLowered
          TabOrder = 0
          inline molImovelMestre: TmolImovelMestre
            Left = 11
            Top = 5
            Width = 633
            inherited Label5: TLabel
              Left = 2
            end
            inherited edtImovel: TEdit
              Left = 0
              Width = 572
            end
            inherited btnBuscaImovel: TBitBtn
              Left = 576
              Top = 15
            end
            inherited btnLimpaImovel: TBitBtn
              Left = 600
              Top = 15
            end
          end
          object btnInsImovel: TBitBtn
            Left = 446
            Top = 97
            Width = 90
            Height = 25
            Caption = 'Adicionar'
            TabOrder = 1
            OnClick = btnInsImovelClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
              333333333337F33333333333333033333333333333373F333333333333090333
              33333333337F7F33333333333309033333333333337373F33333333330999033
              3333333337F337F33333333330999033333333333733373F3333333309999903
              333333337F33337F33333333099999033333333373333373F333333099999990
              33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
              33333333337F7F33333333333309033333333333337F7F333333333333090333
              33333333337F7F33333333333309033333333333337F7F333333333333090333
              33333333337F7F33333333333300033333333333337773333333}
            Layout = blGlyphRight
            NumGlyphs = 2
          end
          object btnDelImovel: TBitBtn
            Left = 545
            Top = 97
            Width = 90
            Height = 25
            Caption = 'Retirar'
            TabOrder = 2
            OnClick = btnDelImovelClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
              3333333333777F33333333333309033333333333337F7F333333333333090333
              33333333337F7F33333333333309033333333333337F7F333333333333090333
              33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
              3333333777737777F333333099999990333333373F3333373333333309999903
              333333337F33337F33333333099999033333333373F333733333333330999033
              3333333337F337F3333333333099903333333333373F37333333333333090333
              33333333337F7F33333333333309033333333333337373333333333333303333
              333333333337F333333333333330333333333333333733333333}
            Layout = blGlyphRight
            NumGlyphs = 2
          end
          inline molImovel: TmolImovel
            Left = 4
            Top = 51
            Width = 637
            TabOrder = 3
            inherited edtImovel: TEdit
              Width = 572
            end
            inherited btnBuscaImovel: TBitBtn
              Left = 584
            end
            inherited btnLimpaImovel: TBitBtn
              Left = 608
            end
          end
        end
        object bbtnInverteSelEstab: TBitBtn
          Left = 520
          Top = 390
          Width = 131
          Height = 25
          Caption = '   Inverte Seleção'
          TabOrder = 2
          TabStop = False
          OnClick = bbtnInverteSelEstabClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333000000003333333388888888333333330FFF
            FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
            FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
            FFF0333833338FFFFFF833333333000000003333333388888888000000003333
            333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
            00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
            033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
            3333888888877333333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
        object bbtnSelTodosEstab: TBitBtn
          Left = 377
          Top = 391
          Width = 136
          Height = 25
          Caption = '   Seleciona Todos'
          TabOrder = 3
          TabStop = False
          OnClick = bbtnSelTodosEstabClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333333333333333333333333300000
            0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
            FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
            9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
            00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
            993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
            3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
            3333388888887733333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'ImoveisSelecionados'
        object obs: TLabel
          Left = 16
          Top = 408
          Width = 34
          Height = 13
          Caption = 'OBS.:'
        end
        object Label4: TLabel
          Left = 53
          Top = 409
          Width = 288
          Height = 13
          Caption = '1 - A data de vigência está no período bloqueado.'
        end
        object Label5: TLabel
          Left = 54
          Top = 423
          Width = 250
          Height = 13
          Caption = '2 - A data informada não é a ultima vigente.'
        end
        object pnlDesfaz: TPanel
          Left = 0
          Top = 0
          Width = 689
          Height = 409
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label6: TLabel
            Left = 8
            Top = 10
            Width = 121
            Height = 16
            Caption = 'Desfazer Vigências'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 9
            Top = 191
            Width = 141
            Height = 16
            Caption = 'Vigências Bloqueadas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbgDesfazVigencias: TwwDBGrid
            Left = 8
            Top = 37
            Width = 671
            Height = 134
            ControlType.Strings = (
              'SEL;CheckBox;Yes;No')
            Selected.Strings = (
              'DATA'#9'10'#9'Data'
              'CODIGO'#9'10'#9'Código'
              'NOMEIMOVEL'#9'68'#9'Nome do Imóvel')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsDesfazVigenc
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
          object dbgVigenciasBloqueadas: TwwDBGrid
            Left = 9
            Top = 218
            Width = 670
            Height = 124
            ControlType.Strings = (
              'SEL;CheckBox;Yes;No')
            Selected.Strings = (
              'DATA'#9'10'#9'Data'
              'CODIGO'#9'10'#9'Código'
              'NOMEIMOVEL'#9'58'#9'Nome do Imóvel'
              'OBSERVACAO'#9'10'#9'Obs.')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsVigencBloq
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
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 447
    Width = 689
    Height = 35
    inherited tb97Fundo: TToolbar97
      Left = 177
      DockPos = 343
      inherited sep1: TToolbarSep97
        Left = 423
      end
      inherited ToolbarSep971: TToolbarSep97
        Left = 259
      end
      inherited ToolbarSep972: TToolbarSep97
        Left = 506
      end
      inherited bbtnSair: TBitBtn
        Left = 342
        Top = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 425
        Top = 1
      end
      object btnCancelar: TBitBtn
        Left = 261
        Top = 1
        Width = 81
        Height = 27
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 2
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
      object BtnContinuar: TBitBtn
        Left = 170
        Top = 0
        Width = 89
        Height = 29
        Caption = 'Continuar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = BtnContinuarClick
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
      end
      object BtnVoltar: TBitBtn
        Left = 81
        Top = 0
        Width = 89
        Height = 29
        Caption = 'Voltar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        Visible = False
        OnClick = BtnVoltarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
          88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
          B08887F8888F888887F887FBBB0BBBBBB0888788887F8888878F7FBBB00BBBBB
          BB087F88877FFFFFF87F7FBB00000000BB087F8877777777F87F7FB000000000
          BB087F8777777777F87F7FBB00000000BB087F8877777777887F7FBBB00BBBBB
          BB0878F8877F8888887887FBBB0BBBBBB08887F88878888887F887FBBBBBBBBB
          B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
      object btnOK: TBitBtn
        Left = 0
        Top = 1
        Width = 81
        Height = 27
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 5
        Visible = False
        OnClick = btnOKClick
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
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object CMSqlParams: TCMSqlParams
    SQL.Strings = (
      ''
      '/*SELECT IDPLANOPREV,'
      '       NOME'
      '  FROM PLANPREVCONTABIL'
      ' WHERE 1=1*/'
      ''
      '/*SELECT P.IDPESSOA, P.NOME'
      '  FROM PESSOA P, PATRO PT'
      ' WHERE PT.IDPESSOA   = P.IDPESSOA'
      '   AND PT.IDFUNDACAO = 1'
      ' ORDER BY NOME*/'
      '/*'
      'SELECT '#39'  '#39' AS SEL,'
      '       PPI.IDPLANOPREV,'
      '       PPC.NOME AS NOMEPLANO,'
      '       PPI.IDPATRO,'
      '       PES.NOME AS NOMEPATRO,'
      '       PPI.PERCENTRATEIO AS PPIPERCENTRATEIO,'
      '       PPI.DATAVIGENCIA,'
      '       '#39' '#39' AS FLGTIPO'
      '  FROM PLANOPATROXVIGENCIAIMOB PPI,'
      '       PESSOA PES,'
      '       PLANPREVCONTABIL PPC'
      ' WHERE PPI.IDIMOVEL = -1'
      '   AND PPI.IDPATRO = PES.IDPESSOA'
      ''
      'SELECT '#39'  '#39' AS SEL,'
      '       I.IDIMOVEL,'
      '       I.IMOCODIGO AS CODIGO,'
      '       I.IMONOME AS NOME'
      '  FROM IMOVEL I'
      ' WHERE I.IDIMOVEL = -1'
      '   GROUP BY I.IDIMOVEL,I.IMOCODIGO,I.IMONOME*/'
      '/* SELECT '#39'              '#39' AS DATA,'
      '         0 as IDIMOVEL,'
      '        '#39'              '#39' AS CODIGO,'
      
        '        '#39'                                                       ' +
        '                                                   '#39' AS NOMEIMOV' +
        'EL,'
      '        0 AS OBSERVACAO'
      'FROM DUAL'
      '  WHERE 1=2'
      'SELECT DISTINCT I.IDIMOVEL,'
      '                  I.IMONOME AS NOME,'
      '                  I.IMOCODIGO AS CODIGO,'
      '                  P.DATAVIGENCIA AS DATA,'
      '                  (SELECT MAX(DATAVIGENCIA)'
      '                      FROM PLANOPATROXVIGENCIAIMOB'
      '                     WHERE 1=2 ) AS MAXDATA'
      '             FROM IMOVEL I, PLANOPATROXVIGENCIAIMOB P'
      '            WHERE 1=2'
      '/*'
      '')
    ClientDataSet = cdsVigenciaBloqueada
    Left = 641
    Top = 7
  end
  object dsImovel: TwwDataSource
    DataSet = cdsImovel
    Left = 602
    Top = 216
  end
  object cdsImovel: TwwClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ControlType.Strings = (
      'SEL;CheckBox;S;N')
    ValidateWithMask = True
    Left = 568
    Top = 224
    Data = {
      9C0000009619E0BD0100000018000000040000000000030000009C000353454C
      01004900000002000753554254595045020049000A0046697865644368617200
      055749445448020002000200084944494D4F56454C080004000000000006434F
      4449474F0100490000000100055749445448020002000F00044E4F4D45010049
      00000001000557494454480200020064000100044C4349440400010009080000}
    object cdsImovelSEL: TStringField
      FieldName = 'SEL'
      FixedChar = True
      Size = 2
    end
    object cdsImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsImovelCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 15
    end
    object cdsImovelNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
  end
  object dsTipoImovel: TwwDataSource
    DataSet = dtmLookImobiliario.qryLookTipoImovel
    Left = 546
    Top = 12
  end
  object cdsDesfazVigencia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 384
    Top = 80
  end
  object cdsVigenciaBloqueada: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 432
    Top = 297
  end
  object dsDesfazVigenc: TwwDataSource
    DataSet = cdsDesfazVigencia
    Left = 504
    Top = 72
  end
  object dsVigencBloq: TwwDataSource
    DataSet = cdsVigenciaBloqueada
    Left = 432
    Top = 256
  end
  object dsVigencias: TwwDataSource
    DataSet = qryVigencias
    Left = 554
    Top = 344
  end
  object qryVigencias: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT I.IDIMOVEL,'
      '                  I.IMONOME AS NOME,'
      '                  I.IMOCODIGO AS CODIGO,'
      '                  P.DATAVIGENCIA AS DATA,'
      '                  (SELECT MAX(DATAVIGENCIA)'
      '                      FROM PLANOPATROXVIGENCIAIMOB'
      '                     WHERE 1=2 ) AS MAXDATA'
      '             FROM IMOVEL I, PLANOPATROXVIGENCIAIMOB P'
      '            WHERE 1=2')
    ValidateWithMask = True
    Left = 313
    Top = 375
    object qryVigenciasIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryVigenciasNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object qryVigenciasCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 15
    end
    object qryVigenciasDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object qryVigenciasMAXDATA: TDateTimeField
      FieldName = 'MAXDATA'
    end
  end
end
