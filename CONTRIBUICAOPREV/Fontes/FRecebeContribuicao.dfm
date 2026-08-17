inherited frmRecebeContribuicao: TfrmRecebeContribuicao
  Left = 494
  Top = 139
  HelpContext = 160045
  Caption = 'Recebimento de Contribuições via Folha'
  ClientHeight = 438
  ClientWidth = 636
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 161
    Width = 636
    Height = 238
    object Label1: TLabel
      Left = 8
      Top = 96
      Width = 188
      Height = 13
      Caption = 'Integrar com Contabilidade ? Sim'
    end
    object pgctrlOpcoes: TPageControl
      Left = 1
      Top = 1
      Width = 634
      Height = 236
      ActivePage = tbsOpcoes
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object tbsOpcoes: TTabSheet
        Caption = 'Opções Básicas'
        object pnlTabSheet1: TPanel
          Left = 0
          Top = 0
          Width = 626
          Height = 208
          Align = alClient
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object lbPatro: TLabel
            Left = 7
            Top = 5
            Width = 71
            Height = 13
            Caption = 'Patrocinadoras'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 318
            Top = 5
            Width = 107
            Height = 13
            Caption = 'Planos Previdenciários'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object chklstPatro: TCheckListBox
            Left = 6
            Top = 21
            Width = 305
            Height = 181
            OnClickCheck = chklstPatroClickCheck
            Columns = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
          end
          object chklstPlano: TCheckListBox
            Left = 315
            Top = 21
            Width = 305
            Height = 181
            Columns = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = '... Outras Opções'
        ImageIndex = 2
        object GroupBox2: TGroupBox
          Left = 3
          Top = 6
          Width = 325
          Height = 187
          Caption = ' Escolher um Pagador '
          TabOrder = 0
          object lblParticip: TLabel
            Left = 11
            Top = 19
            Width = 86
            Height = 13
            Caption = 'Nome do Pagador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 11
            Top = 58
            Width = 97
            Height = 13
            Caption = 'Plano Previdenciário'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblPatro: TLabel
            Left = 11
            Top = 97
            Width = 66
            Height = 13
            Caption = 'Patrocinadora'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblMatricula: TLabel
            Left = 205
            Top = 97
            Width = 45
            Height = 13
            Caption = 'Matrícula'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edNome: TEdit
            Left = 11
            Top = 34
            Width = 304
            Height = 24
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object edPlano: TEdit
            Left = 11
            Top = 74
            Width = 304
            Height = 24
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object edPatro: TEdit
            Left = 11
            Top = 114
            Width = 188
            Height = 24
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object edMatricula: TEdit
            Left = 205
            Top = 114
            Width = 110
            Height = 24
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object bbtnProcurar: TBitBtn
            Left = 12
            Top = 141
            Width = 88
            Height = 37
            Hint = 'Procurar participante'
            Caption = '&Procurar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnClick = bbtnProcurarClick
            Glyph.Data = {
              4E010000424D4E01000000000000760000002800000012000000120000000100
              040000000000D800000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
              DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
              FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
              0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
              870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
              FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
              0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
              DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
          end
          object btndesfazselec: TBitBtn
            Left = 102
            Top = 141
            Width = 88
            Height = 37
            Hint = 'Procurar participante'
            Caption = 'Limpar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = btndesfazselecClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
              555557777F777555F55500000000555055557777777755F75555005500055055
              555577F5777F57555555005550055555555577FF577F5FF55555500550050055
              5555577FF77577FF555555005050110555555577F757777FF555555505099910
              555555FF75777777FF555005550999910555577F5F77777775F5500505509990
              3055577F75F77777575F55005055090B030555775755777575755555555550B0
              B03055555F555757575755550555550B0B335555755555757555555555555550
              BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
              50BB555555555555575F555555555555550B5555555555555575}
            NumGlyphs = 2
          end
        end
        object grpFolhaBen: TGroupBox
          Left = 334
          Top = 6
          Width = 279
          Height = 187
          Caption = ' Apenas para Folha de Benefícios ... '
          TabOrder = 1
          object Label2: TLabel
            Left = 11
            Top = 19
            Width = 198
            Height = 13
            Caption = 'Processar apenas contribuições do lote ...'
          end
          object dblkpcmbLote: TwwDBLookupCombo
            Left = 11
            Top = 34
            Width = 262
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'IDLOTE'#9'10'#9'No.'#9'F'
              'MESREFERENCIA'#9'7'#9'Mês'#9'F'
              'DESCRICAO'#9'40'#9'Lote'#9'F')
            LookupTable = qryLote
            LookupField = 'IDLOTE'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object chkOutrosMotivos: TCheckBox
            Left = 19
            Top = 64
            Width = 209
            Height = 17
            Caption = 'Receber motivos desconhecidos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object tbsResultado: TTabSheet
        Caption = 'Resultado'
        object pnlTabSheet4: TPanel
          Left = 0
          Top = 0
          Width = 626
          Height = 208
          Align = alClient
          BevelOuter = bvLowered
          Caption = 'pnlTabSheet4'
          TabOrder = 0
          object bbtnSalvar: TBitBtn
            Left = 525
            Top = 5
            Width = 91
            Height = 38
            Caption = 'S&alvar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = bbtnSalvarClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777770000000000007770330770000330777033077000033077703307700003
              30777033000000033077703333333333307770330000000330777030FFFFFFF0
              30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
              8077777CCC777700007777CCC77777777777777C777777777777}
          end
          object memResult: TMemo
            Left = 1
            Top = 1
            Width = 522
            Height = 206
            Align = alLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 399
    Width = 636
    inherited tb97Fundo: TToolbar97
      Left = 430
      DockPos = 430
      inherited sep1: TToolbarSep97
        Left = 159
      end
      inherited sep3: TToolbarSep97
        Left = 162
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 81
        Width = 78
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 261
      DockPos = 261
      inherited bbtnConfirmar: TBitBtn
        Hint = 'Imprimir Demonstrativo de Recebimento'
        Caption = '&Imprimir'
        ModalResult = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = bbtnConfirmarClick
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
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 636
    Height = 161
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object grpMesAnoRef: TGroupBox
      Left = 8
      Top = 8
      Width = 201
      Height = 53
      Caption = ' Mês/Ano de Cobrança (Competência) '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = grpMesAnoRefExit
      object cmbMesCob: TComboBox
        Left = 8
        Top = 24
        Width = 113
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        Text = 'cmbMesCob'
        Items.Strings = (
          'janeiro'
          'fevereiro'
          'março'
          'abril'
          'maio'
          'junho'
          'julho'
          'agosto'
          'setembro '
          'outubro'
          'novembro'
          'dezembro')
      end
      object spedAnoCob: TSpinEdit
        Left = 120
        Top = 24
        Width = 65
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 1998
      end
    end
    object bbtnReceber: TBitBtn
      Left = 535
      Top = 36
      Width = 91
      Height = 38
      Caption = '&Receber'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = bbtnReceberClick
      Glyph.Data = {
        06010000424D060100000000000076000000280000000B000000120000000100
        0400000000009000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333A
        000033833333333F00003088333333380000300883333337000030A088333338
        000030AA088333300000307A70883338000030AAAA08833F000030A7A7A08837
        000030AAAAAA03300000307A7A703338000030AAAA033338000030A7A0333330
        000030AA0333333800003070333333380000300333333338000030333333333F
        00003333333333300000}
    end
    object GroupBox3: TGroupBox
      Left = 376
      Top = 8
      Width = 137
      Height = 53
      Caption = ' Data de Recebimento '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object dtRecebimento: TCMDateTimePicker
        Left = 16
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 0
      end
    end
    object bbtnDesfazer: TBitBtn
      Left = 535
      Top = 84
      Width = 91
      Height = 38
      Caption = '&Desfazer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = bbtnDesfazerClick
      Glyph.Data = {
        06010000424D060100000000000076000000280000000B000000120000000100
        0400000000009000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333330
        0000333333338330000033333338803000003333338800300000333338809030
        0000333388099030000033388079703000003388099990300000388097979030
        0000330999999030000033307979703000003333099990300000333330979030
        0000333333099030000033333330703000003333333300300000333333333030
        00003333333333300000}
    end
    object rgrpTipoFolha: TRadioGroup
      Left = 216
      Top = 8
      Width = 153
      Height = 53
      Caption = ' Tipo de Folha '
      ItemIndex = 0
      Items.Strings = (
        'Folha da Patrocinadora'
        'Folha de Benefícios')
      TabOrder = 4
      OnClick = rgrpTipoFolhaClick
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 64
      Width = 505
      Height = 49
      TabOrder = 5
      object lblIntegraCAR: TLabel
        Left = 6
        Top = 10
        Width = 177
        Height = 13
        Caption = 'Integrar com Contas a Receber ? Sim'
      end
      object lblIntegraContab: TLabel
        Left = 6
        Top = 26
        Width = 155
        Height = 13
        Caption = 'Integrar com Contabilidade ? Sim'
      end
      object chkIntegra: TCheckBox
        Left = 192
        Top = 9
        Width = 145
        Height = 17
        Caption = 'Efetuar apenas integração'
        TabOrder = 0
        OnClick = chkIntegraClick
      end
      object chkIntegraLocal: TCheckBox
        Left = 192
        Top = 24
        Width = 217
        Height = 17
        Caption = 'Marca/Desmarca integração localmente'
        TabOrder = 1
        OnClick = chkIntegraLocalClick
      end
      object chkDocDia: TCheckBox
        Left = 344
        Top = 9
        Width = 156
        Height = 17
        Caption = 'Documentos distintos por dia'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        OnClick = chkDocDiaClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 112
      Width = 505
      Height = 38
      TabOrder = 6
      object Label4: TLabel
        Left = 6
        Top = 22
        Width = 374
        Height = 13
        Caption = '(somente para FOLHA DE BENEFÍCIOS e FOLHA DA FUNDAÇÃO)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object chkDataRecTmpDesc: TCheckBox
        Left = 6
        Top = 7
        Width = 387
        Height = 17
        Caption = 'Considerar data de recebimento efetivamente gravada'
        TabOrder = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 1027
    Top = 65499
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar cálculo de contribuições'
    Left = 580
    Top = 305
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.IDPESSOA, P.NOME, PT.FLGANO13, PT.IDRUBSALPARTICIP, PT.' +
        'FLGGERACAR'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  PT.IDPESSOA = P.IDPESSOA'
      'ORDER BY P.NOME'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 228
    Top = 331
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 236
    Top = 280
  end
  object qryRecebimento: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 358
    Top = 324
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   '#39'PT'#39'AS FLGINTERNO,'
      '         SUM(HT.VALORACUMULADO) AS VALORACUMULADO,'
      '         SUM(HT.VALORACUMULADO) AS VALORPROVENTO,'
      '         :IDPESSJUR AS IDPESSJUR, :IDPLANOPREV AS IDPLANOPREV,'
      '         :IDCONTRIBUICAO AS IDCONTRIBUICAO,'
      '         :IDREGRACALCULO AS IDREGRACALCULO,'
      '         :VALORBASE1 AS VALORBASE1, :VALORBASE2 AS VALORBASE2,'
      
        '         :VALORBASE3 AS VALORBASE3, RP.CODPROVDESC,   RP.IDRUBRI' +
        'CA,'
      '         :DATAREF AS DATAREF'
      'FROM     HSTRUBRICAXPESS     HT,'
      '         RUBRICAXPESS        RP'
      'WHERE    RP.IDPESSOA         = :IdPessJur   AND'
      '         HT.IDPESSOA         = :IdPessJur   AND'
      '         HT.IDPLANOPREV      = :IdPlanoPrev AND'
      '         HT.IDRUBRICA        = RP.IDRUBRICA AND'
      '         HT.MESREFERENCIA    = :pMesReferencia'
      'GROUP BY RP.CODPROVDESC,   RP.IDRUBRICA'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 26
    Top = 366
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDREGRACALCULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'VALORBASE1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'VALORBASE2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'VALORBASE3'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMesReferencia'
        ParamType = ptUnknown
      end>
  end
  object qryTotalPatro: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 166
    Top = 325
  end
  object qryContribPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT TP.QTDEMESES,  CP.ULTMESPREPARO, CP.IDPESSOA, CP.IDPESSOA' +
        ' AS IDPESSJUR, CP.IDPLANOPREV,'
      '       CP.IDCONTRIBUICAO, CP.UNIDNEGOC, CP.TIPCODIGO,'
      
        '       CP.CODCENTRORESPON, CP.IDEMPRESA, CP.IDEMPRESAPROP, CP.PL' +
        'ANO, CP.CODSUBCONTA,'
      
        '       CP.PLACONTAC, CP.CODPORTFORMA, CP.PLACONTAD, CP.CODCENTRO' +
        'CUSTOC, CP.CODCENTROCUSTOD,'
      
        '       CP.DIAVENCIMENTO, CP.VALORBASE1, CP.VALORBASE2, CP.VALORB' +
        'ASE3,'
      
        '       DATAINICIO, DATAFINAL,   C.IDREGRACALCULO, C.FLGACEITAOPC' +
        'AO,C.NUMOPCOES ,'
      '       CONT.NOME AS CONTRIBUICAO, -1 AS NUMRECEBIMENTO,'
      '       C.IDREGRAPRIMPAGTO,C.IDREGRAULTPAGTO, '#39'PT'#39' AS FLGINTERNO,'
      
        '       0 AS FLGDESCFOLHA, 0 AS IDHISTPROPOSTA, 1 AS SEQPROPOSTA,' +
        ' CP.QTDEPARCELAS,'
      '       TO_CHAR(SYSDATE,'#39'dd/mm/yyyy'#39') AS INSCRICAODATA,'
      
        '       TO_CHAR(SYSDATE,'#39'dd/mm/yyyy'#39') AS DATANASC, '#39'Patrocinadora' +
        #39' AS MATRICULA'
      
        'FROM   PLANPREV PL, CONTPREV C, CONTRIBUICAO  CONT, CONTRIBPREVP' +
        'ATRO CP,  TPPERIODICIDADE TP,'
      '       PATRO PT, CONTPREVEVENTO CPE, EVENTOGERADOR EG'
      'WHERE  (CP.IDPESSOA       = :piIdPessJur)'
      'AND    (CP.FLGCOBRA       = 1)'
      'AND    (CP.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE(+) )'
      'AND    (CP.IDPLANOPREV       = C.IDPLANOPREV)'
      'AND    (CP.IDCONTRIBUICAO    = C.IDCONTRIBUICAO)'
      
        'AND    ( (CP.DATAFINAL IS NULL) OR (TO_CHAR(CP.DATAFINAL,'#39'YYYY/M' +
        'M'#39') >= :ANOMESCOBRANCA) )'
      'AND    (C.IDCONTRIBUICAO     = CONT.IDCONTRIBUICAO)'
      'AND    (C.IDPLANOPREV        = PL.IDPLANOPREV)'
      'AND    (CP.IDPESSOA          = PT.IDPESSOA)'
      'AND    (C.IDPLANOPREV        = CPE.IDPLANOPREV)'
      'AND    (C.IDCONTRIBUICAO     = CPE.IDCONTRIBUICAO)'
      'AND    (CPE.IDEVENTOGERADOR  = EG.IDEVENTOGERADOR)'
      
        'AND    ( (EG.FLGINTERNO      = '#39'IP'#39') or (EG.FLGINTERNO = '#39'RM'#39') o' +
        'r (EG.FLGINTERNO = '#39'MP'#39') )')
    ValidateWithMask = True
    Left = 96
    Top = 322
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piIdPessJur'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftString
        Name = 'ANOMESCOBRANCA'
        ParamType = ptUnknown
      end>
  end
  object qryEnvio: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 288
    Top = 329
  end
  object regcalculo: TRegra
    QueryIn = qryContribPatro
    DatabaseName = 'basedados'
    IdCalculo = 0
    IdEmpresa = -1
    ExibeMensagens = False
    Left = 578
    Top = 345
  end
  object qryContab: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 30
    Top = 325
  end
  object qryContabil: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT LC.PLACONTA, LC.CODSUBCONTA, LC.LACDEBCRE, LC.LACVALOR, L' +
        'C.LACVALHIST, LC.LACHIST1, LC.LACHIST2,'
      
        '                        LC.LACHIST3, LC.PLNCODIGO, LC.LACNUMLAN,' +
        ' LC.HITCODHIST, LC.IDPESSOA, LC.IDEMPRESA, LC.IDMODULO, '
      
        '                        LC.UNIDNEGOC, LC.IDUSUARIOINCLUSAO, LC.P' +
        'LANO, LC.LACTIPO, LC.LACNUMDOC, LC.LACHIST4, LC.LACHIST5, '
      
        '                        LC.LACTIPCONVOFICIAL, LC.LACVALOFICIAL, ' +
        'LC.LACTIPCONVGER, LC.LACVALGERENCIAL, '
      
        '                        LC.LACTIPCONVGEREN1, LC.LACVALGEREN1, LC' +
        '.LACTIPCONVGEREN2, LC.LACVALGEREN2, LC.LACATOUTMOEDA, '
      
        '                        LC.LACORIGEMAPLIC, LC.TIPCODIGO, LC.IDEL' +
        'EMDEMONSTRAT, LC.CODCENTROCUSTO,'
      
        '                        U.NOME,CC.NOME,CC.CODCENTROCUSTO, PL.PLN' +
        'DATDIA, -1.00 AS IDPESSJUR, -1.00 AS IDPLANOPREV'
      
        '                        FROM LANCAMENTO LC, UNIDNEGOCIO U, CENTC' +
        'UST CC, PLANILHA PL WHERE'
      '                        (LC.PLNCODIGO =  :plncodigo) AND'
      '                        (LC.PLNCODIGO = PL.PLNCODIGO) AND'
      
        '                        (CC.IDEMPRESA(+)      = LC.IDEMPRESA) AN' +
        'D'
      
        '                        (CC.CODCENTROCUSTO(+) = LC.CODCENTROCUST' +
        'O) AND'
      
        '                        (LC.IDPESSOA          = U.IDPESSOA(+)) A' +
        'ND'
      '                        (LC.UNIDNEGOC         = U.UNIDNEGOC(+))'
      ' ')
    UpdateObject = updContabil
    ValidateWithMask = True
    Left = 235
    Top = 237
    ParamData = <
      item
        DataType = ftInteger
        Name = 'plncodigo'
        ParamType = ptUnknown
      end>
    object qryContabilPLACONTA: TStringField
      DisplayLabel = 'Conta Contábil'
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      Size = 18
    end
    object qryContabilCODSUBCONTA: TFloatField
      DisplayLabel = 'Sub-Conta'
      DisplayWidth = 10
      FieldName = 'CODSUBCONTA'
    end
    object qryContabilNOME_1: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 20
      FieldName = 'NOME_1'
      Size = 30
    end
    object qryContabilNOME: TStringField
      DisplayLabel = 'Atividade'
      DisplayWidth = 20
      FieldName = 'NOME'
      Size = 25
    end
    object qryContabilLACDEBCRE: TStringField
      DisplayLabel = 'D/C'
      DisplayWidth = 1
      FieldName = 'LACDEBCRE'
      Size = 1
    end
    object qryContabilLACVALOR: TFloatField
      DisplayLabel = 'Valor Moeda Corrente'
      DisplayWidth = 10
      FieldName = 'LACVALOR'
      DisplayFormat = '#,##0.00'
    end
    object qryContabilLACVALHIST: TFloatField
      DisplayLabel = 'Valor Outra Moeda'
      DisplayWidth = 10
      FieldName = 'LACVALHIST'
    end
    object qryContabilLACHIST1: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST1'
      Size = 40
    end
    object qryContabilLACHIST2: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST2'
      Size = 40
    end
    object qryContabilLACHIST3: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST3'
      Size = 40
    end
    object qryContabilPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryContabilLACNUMLAN: TFloatField
      FieldName = 'LACNUMLAN'
      Visible = False
    end
    object qryContabilHITCODHIST: TStringField
      FieldName = 'HITCODHIST'
      Visible = False
      Size = 4
    end
    object qryContabilIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryContabilIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object qryContabilIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryContabilUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
    object qryContabilIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Visible = False
    end
    object qryContabilCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
    object qryContabilPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object qryContabilLACTIPO: TStringField
      FieldName = 'LACTIPO'
      Visible = False
      Size = 1
    end
    object qryContabilLACNUMDOC: TStringField
      FieldName = 'LACNUMDOC'
      Visible = False
      Size = 15
    end
    object qryContabilLACHIST4: TStringField
      FieldName = 'LACHIST4'
      Visible = False
      Size = 40
    end
    object qryContabilLACHIST5: TStringField
      FieldName = 'LACHIST5'
      Visible = False
      Size = 40
    end
    object qryContabilLACTIPCONVOFICIAL: TStringField
      FieldName = 'LACTIPCONVOFICIAL'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALOFICIAL: TFloatField
      FieldName = 'LACVALOFICIAL'
      Visible = False
    end
    object qryContabilLACTIPCONVGER: TStringField
      FieldName = 'LACTIPCONVGER'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGERENCIAL: TFloatField
      FieldName = 'LACVALGERENCIAL'
      Visible = False
    end
    object qryContabilLACTIPCONVGEREN1: TStringField
      FieldName = 'LACTIPCONVGEREN1'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGEREN1: TFloatField
      FieldName = 'LACVALGEREN1'
      Visible = False
    end
    object qryContabilLACTIPCONVGEREN2: TStringField
      FieldName = 'LACTIPCONVGEREN2'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGEREN2: TFloatField
      FieldName = 'LACVALGEREN2'
      Visible = False
    end
    object qryContabilLACATOUTMOEDA: TStringField
      FieldName = 'LACATOUTMOEDA'
      Visible = False
      Size = 1
    end
    object qryContabilLACORIGEMAPLIC: TStringField
      FieldName = 'LACORIGEMAPLIC'
      Visible = False
      Size = 1
    end
    object qryContabilTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Visible = False
      Size = 2
    end
    object qryContabilIDELEMDEMONSTRAT: TFloatField
      FieldName = 'IDELEMDEMONSTRAT'
      Visible = False
    end
    object qryContabilCODCENTROCUSTO_1: TStringField
      FieldName = 'CODCENTROCUSTO_1'
      Visible = False
      Size = 10
    end
    object qryContabilPLNDATDIA: TDateTimeField
      FieldName = 'PLNDATDIA'
    end
    object qryContabilIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryContabilIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
  end
  object updContabil: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCAMENTO'
      'set'
      '  PLACONTA = :PLACONTA,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  LACDEBCRE = :LACDEBCRE,'
      '  LACVALOR = :LACVALOR,'
      '  LACVALHIST = :LACVALHIST,'
      '  LACHIST1 = :LACHIST1,'
      '  LACHIST2 = :LACHIST2,'
      '  LACHIST3 = :LACHIST3,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  LACNUMLAN = :LACNUMLAN,'
      '  HITCODHIST = :HITCODHIST,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDMODULO = :IDMODULO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO,'
      '  PLANO = :PLANO,'
      '  LACTIPO = :LACTIPO,'
      '  LACNUMDOC = :LACNUMDOC,'
      '  LACHIST4 = :LACHIST4,'
      '  LACHIST5 = :LACHIST5,'
      '  LACTIPCONVOFICIAL = :LACTIPCONVOFICIAL,'
      '  LACVALOFICIAL = :LACVALOFICIAL,'
      '  LACTIPCONVGER = :LACTIPCONVGER,'
      '  LACVALGERENCIAL = :LACVALGERENCIAL,'
      '  LACTIPCONVGEREN1 = :LACTIPCONVGEREN1,'
      '  LACVALGEREN1 = :LACVALGEREN1,'
      '  LACTIPCONVGEREN2 = :LACTIPCONVGEREN2,'
      '  LACVALGEREN2 = :LACVALGEREN2,'
      '  LACATOUTMOEDA = :LACATOUTMOEDA,'
      '  LACORIGEMAPLIC = :LACORIGEMAPLIC,'
      '  TIPCODIGO = :TIPCODIGO,'
      '  IDELEMDEMONSTRAT = :IDELEMDEMONSTRAT,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  PLNDATDIA = :PLNDATDIA'
      'where'
      '  PLNCODIGO = :OLD_PLNCODIGO')
    InsertSQL.Strings = (
      'insert into LANCAMENTO'
      
        '  (PLACONTA, CODSUBCONTA, LACDEBCRE, LACVALOR, LACVALHIST, LACHI' +
        'ST1, LACHIST2, '
      
        '   LACHIST3, PLNCODIGO, LACNUMLAN, HITCODHIST, IDPESSOA, IDEMPRE' +
        'SA, IDMODULO, '
      
        '   UNIDNEGOC, IDUSUARIOINCLUSAO, PLANO, LACTIPO, LACNUMDOC, LACH' +
        'IST4, LACHIST5, '
      
        '   LACTIPCONVOFICIAL, LACVALOFICIAL, LACTIPCONVGER, LACVALGERENC' +
        'IAL, LACTIPCONVGEREN1, '
      
        '   LACVALGEREN1, LACTIPCONVGEREN2, LACVALGEREN2, LACATOUTMOEDA, ' +
        'LACORIGEMAPLIC, '
      '   TIPCODIGO, IDELEMDEMONSTRAT, CODCENTROCUSTO, PLNDATDIA)'
      'values'
      
        '  (:PLACONTA, :CODSUBCONTA, :LACDEBCRE, :LACVALOR, :LACVALHIST, ' +
        ':LACHIST1, '
      
        '   :LACHIST2, :LACHIST3, :PLNCODIGO, :LACNUMLAN, :HITCODHIST, :I' +
        'DPESSOA, '
      
        '   :IDEMPRESA, :IDMODULO, :UNIDNEGOC, :IDUSUARIOINCLUSAO, :PLANO' +
        ', :LACTIPO, '
      
        '   :LACNUMDOC, :LACHIST4, :LACHIST5, :LACTIPCONVOFICIAL, :LACVAL' +
        'OFICIAL, '
      
        '   :LACTIPCONVGER, :LACVALGERENCIAL, :LACTIPCONVGEREN1, :LACVALG' +
        'EREN1, '
      
        '   :LACTIPCONVGEREN2, :LACVALGEREN2, :LACATOUTMOEDA, :LACORIGEMA' +
        'PLIC, :TIPCODIGO, '
      '   :IDELEMDEMONSTRAT, :CODCENTROCUSTO, :PLNDATDIA)')
    DeleteSQL.Strings = (
      'delete from LANCAMENTO'
      'where'
      '  PLNCODIGO = :OLD_PLNCODIGO')
    Left = 360
    Top = 237
  end
  object updDocumentos: TUpdateSQL
    ModifySQL.Strings = (
      'update documento'
      'set'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLANO = :PLANO,'
      '  PLACONTA = :PLACONTA,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  NUMLANCTO = :NUMLANCTO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  VALOR = :VALOR,'
      '  RECPAG = :RECPAG,'
      '  IDPLANPREVCONTAB = :IDPLANPREVCONTAB,'
      ' IDPESSJURCEDIDO = :IDPESSJURCEDIDO'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    InsertSQL.Strings = (
      'insert into documento'
      
        '  (CODDOCUMENTO, PLANO, PLACONTA, PLNCODIGO, NUMLANCTO, UNIDNEGO' +
        'C, CODCENTRORESPON, '
      
        '   CODTIPRECDES, VALOR, RECPAG, IDPLANPREVCONTAB, IDPESSJURCEDID' +
        'O)'
      'values'
      
        '  (:CODDOCUMENTO, :PLANO, :PLACONTA, :PLNCODIGO, :NUMLANCTO, :UN' +
        'IDNEGOC, '
      
        '   :CODCENTRORESPON, :CODTIPRECDES, :VALOR, :RECPAG, :IDPLANPREV' +
        'CONTAB, :IDPESSJURCEDIDO)')
    DeleteSQL.Strings = (
      'delete from documento'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    Left = 130
    Top = 269
  end
  object qryDocumentos: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT D.CODDOCUMENTO,D.PLANO,D.PLACONTA,L.PLNCODIGO ,L.NUMLANCT' +
        'O,'
      '       R.UNIDNEGOC,R.CODCENTRORESPON,R.CODTIPRECDES,R.VALOR,'
      
        '       -1.00 AS IDPESSJUR, -1.00 AS IDPLANOPREV, -1.00 AS IDCONT' +
        'RIBUICAO,'
      
        '       -1.00 AS FLGDEVOLUCAO, '#39'R'#39' AS RECPAG, -1.00 AS IDPLANPREV' +
        'CONTAB,'
      '       -1.00 AS IDPESSJURCEDIDO'
      'FROM   DOCUMENTO D , LANCTODOCUM L, RATEIODOCUM R'
      'WHERE  D.CODDOCUMENTO = :CODDOCUMENTO'
      'AND    D.CODDOCUMENTO = L.CODDOCUMENTO'
      'AND    D.CODDOCUMENTO = R.CODDOCUMENTO'
      'ORDER BY D.PLANO,D.PLACONTA'
      ''
      ' ')
    UpdateObject = updDocumentos
    ValidateWithMask = True
    Left = 30
    Top = 269
    ParamData = <
      item
        DataType = ftInteger
        Name = 'coddocumento'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryDocumentosCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
    end
    object qryDocumentosPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'DOCUMENTO.PLANO'
    end
    object qryDocumentosPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'DOCUMENTO.PLACONTA'
      Size = 18
    end
    object qryDocumentosPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'LANCTODOCUM.PLNCODIGO'
    end
    object qryDocumentosNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Origin = 'LANCTODOCUM.NUMLANCTO'
    end
    object qryDocumentosUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'RATEIODOCUM.UNIDNEGOC'
    end
    object qryDocumentosCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'RATEIODOCUM.CODCENTRORESPON'
      Size = 10
    end
    object qryDocumentosCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'RATEIODOCUM.CODTIPRECDES'
      Size = 15
    end
    object qryDocumentosVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'RATEIODOCUM.VALOR'
    end
    object qryDocumentosIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryDocumentosIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryDocumentosIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
    end
    object qryDocumentosFLGDEVOLUCAO: TFloatField
      FieldName = 'FLGDEVOLUCAO'
    end
    object qryDocumentosRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryDocumentosIDPLANPREVCONTAB: TFloatField
      FieldName = 'IDPLANPREVCONTAB'
    end
    object qryDocumentosIDPESSJURCEDIDO: TFloatField
      FieldName = 'IDPESSJURCEDIDO'
    end
  end
  object qryPlanPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' ')
    ValidateWithMask = True
    Left = 96
    Top = 363
  end
  object qryContribPartPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CPP.IDPESSJUR,      CPP.IDPLANOPREV,   CPP.IDPESSOA,   CP' +
        'P.SEQPROPOSTA,'
      
        '       CPP.IDCONTRIBUICAO, CPP.VALORBASE1,    CPP.VALORBASE2, CP' +
        'P.VALORBASE3,'
      '       CPP.DATAINICIO,     CPP.DATAFINAL,     CPP.ULTMESPREPARO,'
      
        '       PF.DATANASC,        PP.INSCRICAODATA,  PP.IDSITPART,   PP' +
        '.SALPARTICIPACAO,'
      '       SP.FLGINTERNO,      CP.IDREGRACALCULO,'
      
        '       :MESREFERENCIA AS MESREFERENCIA, :MESCOBRANCA AS MESCOBRA' +
        'NCA,'
      '       :IDMOTIVO AS IDMOTIVO,'
      
        '       CPP.IDPESSOA AS IDTITULAR, CPP.IDCONTRIBUICAO AS IDDESCON' +
        'TO,'
      
        '       C.NOME AS NOMECONTRIB, CP.VLRACEITADIVERG, :VALOR AS VALO' +
        'R,'
      '       :VALORRECEBIDO AS VALORRECEBIDO, '#39'-'#39' AS CODDOCUMENTOPREV,'
      
        '       '#39'-'#39' AS CODPORTFORMA, '#39'-'#39' AS CODDOCUMENTOEFET, '#39'-'#39' AS PLNC' +
        'ODIGOPREV,'
      '       '#39'-'#39' AS PLNCODIGOEFET, EL.MATRICULA, 0 AS FLGDESCFOLHA,'
      '       CPL.FLGTPVLR, 0 AS FLGPARCELAMENTO'
      
        'FROM   CONTRIBUICAO C, CONTPREV CP, CONTPLANPATRO CPL, CONTRIBPR' +
        'EVPARTP CPP,'
      '       PARTPREVPLAN PP, PESSOAFISICA PF,'
      '       SITPART SP, ELEGPATRO EL'
      'WHERE  (CPP.IDPESSJUR      = :IDPESSJUR)'
      'AND    (CPP.IDPLANOPREV    = :IDPLANOPREV)'
      
        'AND    ( (CP.FLGCOBRADECTERC = :FLGCOBRADECTERC1) OR (CP.FLGCOBR' +
        'ADECTERC = :FLGCOBRADECTERC2) )'
      
        'AND    ( (CPP.DATAFINAL IS NULL) OR (TO_CHAR(CPP.DATAFINAL,'#39'YYYY' +
        '/MM'#39') >= :MESCOBRANCA) )'
      'AND    (CP.FLGPAGADOR      = '#39'P'#39')'
      
        'AND    ((CP.FLGINTERNO     = '#39'AS'#39') OR ((PLP.FLGRECECONTPATRO = 1' +
        ') AND (CP.FLGINTERNO <> '#39'AS'#39')) )'
      'AND    (CPP.IDPLANOPREV    = CP.IDPLANOPREV)'
      'AND    (CPP.IDCONTRIBUICAO = CP.IDCONTRIBUICAO)'
      'AND    (CP.IDCONTRIBUICAO  = C.IDCONTRIBUICAO)'
      'AND    (CPP.IDPESSJUR      = PP.IDPESSJUR)'
      'AND    (CPP.IDPLANOPREV    = PP.IDPLANOPREV)'
      'AND    (CPP.IDPESSOA       = PP.IDPESSOA)'
      'AND    (CPP.SEQPROPOSTA    = PP.SEQPROPOSTA)'
      'AND    (PP.IDPESSOA        = PF.IDPESSOA)'
      'AND    (PP.IDSITPART       = SP.IDSITPART)'
      'AND    (PP.IDPESSJUR       = EL.IDPESSJUR)'
      'AND    (PP.IDPESSOA        = EL.IDPESSOA)'
      'AND    (CPL.IDPESSJUR      = CPP.IDPESSJUR)'
      'AND    (CPL.IDPLANOPREV    = CPP.IDPLANOPREV)'
      'AND    (CPL.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO)'
      'ORDER BY CPP.IDCONTRIBUICAO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 161
    Top = 379
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALORRECEBIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGCOBRADECTERC1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGCOBRADECTERC2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end>
  end
  object qryReduzContrib: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 302
    Top = 147
  end
  object qryPlanReduz: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 188
    Top = 152
  end
  object qrySalPart: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 91
    Top = 215
  end
  object qryResumoCobr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT PATROCINADORA, PLANO, IDPLANOPREV, IDCONTRIBUICA' +
        'O,'
      
        '   '#9' CODDOCUMENTOPREV, NOME, NODOCUMENTO, PLNCODIGO, PLNPLANIL, ' +
        'DATAEMISSAO,'
      '       DATAVENCTO, PLACONTAC, PLACONTAD, VALORHST'
      'FROM ('
      'SELECT P.NOME AS PATROCINADORA,'
      #9'    PL.NOME AS PLANO,'
      #9'    H.IDPLANOPREV, H.IDCONTRIBUICAO, H.CODDOCUMENTOPREV,'
      
        '       C.NOME, D.NODOCUMENTO, L.PLNCODIGO, PLN.PLNPLANIL, D.DATA' +
        'EMISSAO, D.DATAVENCTO ,'
      '       DECODE(SUBSTR(H.MESREFERENCIA, 6,2),    '#39'13'#39','
      
        '                                               DECODE(CPL.PLACON' +
        'TAC13,  NULL, CP.PLACONTAC13, CPL.PLACONTAC13),'
      
        '                                               DECODE(CPL.PLACON' +
        'TAC,    NULL, CP.PLACONTAC,   CPL.PLACONTAC)    ) AS PLACONTAC,'
      '       DECODE( H.MESREFERENCIA,                H.MESCOBRANCA,'
      
        '                                               DECODE(CPL.PLACON' +
        'TAD,        NULL, CP.PLACONTAD, CPL.PLACONTAD),'
      
        '                                               DECODE(SUBSTR(H.M' +
        'ESREFERENCIA, 6,2), '#39'13'#39','
      
        '                                                                ' +
        '                    DECODE(CPL.PLACONTAD13,  NULL, CP.PLACONTAD1' +
        '3, CPL.PLACONTAD13),'
      
        '                                                                ' +
        '                    DECODE(CPL.PLACONTAOUTROMES, NULL, CP.PLACON' +
        'TAOUTROMES, CPL.PLACONTAD))) AS PLACONTAD,'
      #9'    SUM(H.VALORRECEBIDO) AS VALORHST'
      
        'FROM   PESSOA P, PLANPREV PL, HSTCONTRIBPREV H, DOCUMENTO D, LAN' +
        'CTODOCUM L,'
      
        '       PLANILHA PLN, CONTRIBUICAO C, CONTPLANPATRO CPL, CONTPREV' +
        ' CP'
      'WHERE  H.MESCOBRANCA = :MESCOBRANCA'
      'AND    H.IDPESSJUR   = :IDPESSJUR'
      'AND    H.FLGDESCFOLHA = 1'
      'AND    H.FOLHAORIGEM = :FOLHAORIGEM'
      'AND    H.VALORESPERADO > 0'
      'AND    H.VALORRECEBIDO > 0'
      'AND    H.SITRECEBIMENTO >= 2'
      'AND    H.SITRECEBIMENTO <= 3'
      'AND    D.CODDOCUMENTO  = H.CODDOCUMENTOPREV'
      'AND    L.CODDOCUMENTO  = D.CODDOCUMENTO'
      'AND    PLN.PLNCODIGO   = L.PLNCODIGO'
      'AND    C.IDCONTRIBUICAO = H.IDCONTRIBUICAO'
      'AND    P.IDPESSOA       = H.IDPESSJUR'
      'AND    PL.IDPLANOPREV   = H.IDPLANOPREV'
      'AND    CPL.IDPESSJUR    = H.IDPESSJUR'
      'AND    CPL.IDPLANOPREV  = H.IDPLANOPREV'
      'AND    CPL.IDCONTRIBUICAO = H.IDCONTRIBUICAO'
      'AND    CP.IDPLANOPREV = H.IDPLANOPREV'
      'AND    CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO'
      
        'GROUP BY P.NOME, PL.NOME, H.IDPLANOPREV, H.IDCONTRIBUICAO, H.COD' +
        'DOCUMENTOPREV,'
      
        '       C.NOME, D.NODOCUMENTO, L.PLNCODIGO, PLN.PLNPLANIL, D.DATA' +
        'EMISSAO, D.DATAVENCTO ,'
      #9' H.MESREFERENCIA , H.MESCOBRANCA,'
      
        '       CPL.PLACONTAC13,  CP.PLACONTAC13,  CPL.PLACONTAC,    CP.P' +
        'LACONTAC,'
      
        '       CPL.PLACONTAD,    CP.PLACONTAD,    CPL.PLACONTAD13,  CP.P' +
        'LACONTAD13,'
      '       CPL.PLACONTAOUTROMES, CP.PLACONTAOUTROMES'
      ')'
      'ORDER BY PLANO, NOME'
      ''
      '')
    ValidateWithMask = True
    Left = 493
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FOLHAORIGEM'
        ParamType = ptUnknown
      end>
  end
  object dsResumoCobr: TwwDataSource
    DataSet = qryResumoCobr
    Left = 529
    Top = 257
  end
  object ppResumoCobr: TppBDEPipeline
    DataSource = dsResumoCobr
    UserName = 'ResumoCobr'
    Left = 493
    Top = 96
  end
  object rpResumoCobr: TppReport
    AutoStop = False
    DataPipeline = ppResumoCobr
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 493
    Top = 65
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppResumoCobr'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33073
      mmPrintPosition = 0
      object lblTitulo: TppLabel
        UserName = 'lblTitulo'
        Caption = 'Resumo Mensal de Recebimentos via Folha - Mês Cob. : 04/2002'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 33602
        mmTop = 26988
        mmWidth = 129911
        BandType = 0
      end
      object rpResumoCobrDBImage1: TppDBImage
        UserName = 'rpResumoCobrDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object rpResumoCobrDBText1: TppDBText
        UserName = 'rpResumoCobrDBText1'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object rpResumoCobrDBText2: TppDBText
        UserName = 'rpResumoCobrDBText2'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object rpResumoCobrDBText3: TppDBText
        UserName = 'rpResumoCobrDBText3'
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 12965
        mmWidth = 69586
        BandType = 0
      end
      object rpResumoCobrDBText10: TppDBText
        UserName = 'rpResumoCobrDBText10'
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 113242
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object rpResumoCobrDBText11: TppDBText
        UserName = 'rpResumoCobrDBText11'
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
      object rpResumoCobrDBText12: TppDBText
        UserName = 'rpResumoCobrDBText12'
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 64029
        mmTop = 17463
        mmWidth = 48419
        BandType = 0
      end
      object rpResumoCobrDBText13: TppDBText
        UserName = 'rpResumoCobrDBText13'
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 112977
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object rpResumoCobrDBText14: TppDBText
        UserName = 'rpResumoCobrDBText14'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 50800
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object rpResumoCobrLabel10: TppLabel
        UserName = 'rpResumoCobrLabel10'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 21960
        mmWidth = 5027
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object rpResumoCobrDBText5: TppDBText
        UserName = 'rpResumoCobrDBText5'
        DataField = 'NOME'
        DataPipeline = ppResumoCobr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResumoCobr'
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 0
        mmWidth = 66675
        BandType = 4
      end
      object rpResumoCobrDBText7: TppDBText
        UserName = 'rpResumoCobrDBText7'
        DataField = 'VALORHST'
        DataPipeline = ppResumoCobr
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppResumoCobr'
        mmHeight = 3704
        mmLeft = 179388
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText156: TppDBText
        UserName = 'DBText156'
        AutoSize = True
        DataField = 'NODOCUMENTO'
        DataPipeline = ppResumoCobr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResumoCobr'
        mmHeight = 3175
        mmLeft = 121709
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText157: TppDBText
        UserName = 'DBText157'
        DataField = 'PLNPLANIL'
        DataPipeline = ppResumoCobr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResumoCobr'
        mmHeight = 3704
        mmLeft = 72761
        mmTop = 0
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DATAVENCTO'
        DataPipeline = ppResumoCobr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResumoCobr'
        mmHeight = 3175
        mmLeft = 161396
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DATAEMISSAO'
        DataPipeline = ppResumoCobr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResumoCobr'
        mmHeight = 3175
        mmLeft = 143404
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PLACONTAD'
        DataPipeline = ppResumoCobr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResumoCobr'
        mmHeight = 3175
        mmLeft = 85196
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PLACONTAC'
        DataPipeline = ppResumoCobr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResumoCobr'
        mmHeight = 3175
        mmLeft = 103188
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object ppLabel5: TppLabel
        UserName = 'ppLabel5'
        AutoSize = False
        Caption = '         AdmPREV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 284163
        BandType = 8
      end
      object ppCalc3: TppSystemVariable
        UserName = 'Calc3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 283898
        BandType = 8
      end
      object ppLine4: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppCalc4: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 247915
        mmTop = 3175
        mmWidth = 36513
        BandType = 8
      end
    end
    object rpResumoCobrGroup2: TppGroup
      BreakName = 'NOMEPATRO'
      DataPipeline = ppResumoCobr
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpResumoCobrGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppResumoCobr'
      object rpResumoCobrGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object rpResumoCobrLabel1: TppLabel
          UserName = 'rpResumoCobrLabel1'
          Caption = 'Patrocinadora : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 5027
          mmTop = 1323
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object rpResumoCobrDBText4: TppDBText
          UserName = 'rpResumoCobrDBText4'
          AutoSize = True
          DataField = 'PATROCINADORA'
          DataPipeline = ppResumoCobr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppResumoCobr'
          mmHeight = 3969
          mmLeft = 42598
          mmTop = 1323
          mmWidth = 30956
          BandType = 3
          GroupNo = 0
        end
      end
      object rpResumoCobrGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppLabel171: TppLabel
          UserName = 'Label171'
          Caption = 'Total da Patrocinadora :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 118004
          mmTop = 265
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object rpResumoRecebidoPatro: TppDBCalc
          UserName = 'rpRecebidoTot1'
          AutoSize = True
          DataField = 'VALORHST'
          DataPipeline = ppResumoCobr
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpResumoCobrGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppResumoCobr'
          mmHeight = 3175
          mmLeft = 170921
          mmTop = 529
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpResumoCobrGroup1: TppGroup
      BreakName = 'NOMEPLANO'
      DataPipeline = ppResumoCobr
      OutlineSettings.CreateNode = True
      UserName = 'rpResumoCobrGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppResumoCobr'
      object rpResumoCobrGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14552
        mmPrintPosition = 0
        object rpResumoCobrLabel2: TppLabel
          UserName = 'rpResumoCobrLabel2'
          Caption = 'Contribuição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 5027
          mmTop = 5556
          mmWidth = 17463
          BandType = 3
          GroupNo = 1
        end
        object rpResumoCobrLabel4: TppLabel
          UserName = 'rpResumoCobrLabel4'
          Caption = 'Valor '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 188648
          mmTop = 5556
          mmWidth = 7938
          BandType = 3
          GroupNo = 1
        end
        object rpResumoCobrLabel12: TppLabel
          UserName = 'rpResumoCobrLabel12'
          Caption = 'Plano Previdenciário : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 5027
          mmTop = 794
          mmWidth = 34925
          BandType = 3
          GroupNo = 1
        end
        object rpResumoCobrDBText15: TppDBText
          UserName = 'rpResumoCobrDBText15'
          AutoSize = True
          DataField = 'PLANO'
          DataPipeline = ppResumoCobr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppResumoCobr'
          mmHeight = 3969
          mmLeft = 41804
          mmTop = 794
          mmWidth = 11906
          BandType = 3
          GroupNo = 1
        end
        object rpResumoCobrLine2: TppLine
          UserName = 'rpResumoCobrLine2'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 13495
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object rpResumoCobrLine5: TppLine
          UserName = 'rpResumoCobrLine5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel169: TppLabel
          UserName = 'Label169'
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 121709
          mmTop = 5556
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object ppLabel170: TppLabel
          UserName = 'Label170'
          Caption = 'Planilha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 72761
          mmTop = 5556
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Vencto. em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 161396
          mmTop = 5556
          mmWidth = 15081
          BandType = 3
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Enviado em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 143404
          mmTop = 5556
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 85196
          mmTop = 5556
          mmWidth = 7938
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Débito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 85196
          mmTop = 9260
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label5'
          Caption = 'Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 103188
          mmTop = 5556
          mmWidth = 7938
          BandType = 3
          GroupNo = 1
        end
        object ppLabel7: TppLabel
          UserName = 'Label6'
          Caption = 'Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 103188
          mmTop = 9260
          mmWidth = 9790
          BandType = 3
          GroupNo = 1
        end
      end
      object rpResumoCobrGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object rpResumoCobrLabel6: TppLabel
          UserName = 'rpResumoCobrLabel6'
          Caption = 'Total do Plano :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 118004
          mmTop = 1323
          mmWidth = 25665
          BandType = 5
          GroupNo = 1
        end
        object rpRecebidoTot: TppDBCalc
          UserName = 'rpRecebidoTot'
          AutoSize = True
          DataField = 'VALORHST'
          DataPipeline = ppResumoCobr
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpResumoCobrGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppResumoCobr'
          mmHeight = 3175
          mmLeft = 170921
          mmTop = 1323
          mmWidth = 25665
          BandType = 5
          GroupNo = 1
        end
        object rpResumoCobrLine3: TppLine
          UserName = 'rpResumoCobrLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object rpResumoCobrLine4: TppLine
          UserName = 'rpResumoCobrLine4'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5556
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      ( P.IDPESSOA =  E.IDPESSOA(+)) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      ( P.IDIMAGEM = I.IDIMAGEM(+))'
      ' ')
    ValidateWithMask = True
    Left = 525
    Top = 335
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pFundacao'
        ParamType = ptUnknown
      end>
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 526
    Top = 324
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 526
    Top = 311
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Pagador'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'DEPENTIT.MATRICULA'
      'PESSOA.NOME'
      'PESSOAB.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C'
      ''
      '')
    Descricao.Strings = (
      'Matrícula Titular'
      'Matrícula Beneficiário'
      'Nome do Titular'
      'Nome do Beneficiário'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOA PESSOAB'
      'PESSOA PATRO'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'DEPENTIT'
      'PLANPREV')
    CamposChave.Strings = (
      'PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV'
      'DEPENTIT.IDPESSOA'
      'PARTPREVPLAN.SEQPROPOSTA'
      'ELEGPATRO.MATRICULA'
      'DEPENTIT.MATRICULA'
      'PESSOAB.NOME'
      'PLANPREV.NOME'
      'PATRO.NOME'
      'DEPENTIT.IDTITULAR'
      'PESSOA.NOME')
    Filtro.Strings = (
      'PARTPREVPLAN.FLGDESATIVADO = 0'
      'PESSOA.IDPESSOA      = PARTPREVPLAN.IDPESSOA'
      'DEPENTIT.IDTITULAR   = PARTPREVPLAN.IDPESSOA'
      'PESSOAB.IDPESSOA     = DEPENTIT.IDPESSOA'
      'ELEGPATRO.IDPESSJUR  = PARTPREVPLAN.IDPESSJUR'
      'ELEGPATRO.IDPESSOA   = PARTPREVPLAN.IDPESSOA'
      'PATRO.IDPESSOA       = PARTPREVPLAN.IDPESSJUR'
      'PLANPREV.IDPLANOPREV = PARTPREVPLAN.IDPLANOPREV')
    Mascaras.Strings = (
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
      '30'
      '30'
      '10'
      '20'
      '20')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 495
    Top = 4
  end
  object qryLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT L.IDLOTE, L.MESREFERENCIA, L.DESCRICAO'
      'FROM   CTRLINTERFACE L'
      'WHERE  L.MESREFERENCIA = :MESCOBRANCA'
      
        'AND    EXISTS ( SELECT 1 FROM LOTEXHSTFOLHABENEF LX , HSTFOLHABE' +
        'NEF H'
      '                WHERE  LX.IDLOTE         = L.IDLOTE'
      '                AND    H.IDHSTFOLHABENEF = LX.IDHSTFOLHABENEF'
      '                AND    H.FLGESTADO       <> 2  )'
      'ORDER BY L.MESREFERENCIA DESC, L.DESCRICAO '
      ' ')
    ValidateWithMask = True
    Left = 494
    Top = 34
    ParamData = <
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end>
  end
  object qryloop: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 292
    Top = 224
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 589
    Top = 210
  end
end
