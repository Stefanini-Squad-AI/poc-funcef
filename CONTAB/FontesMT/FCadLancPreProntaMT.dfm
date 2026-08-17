inherited frmCadLancPreProntaMT: TfrmCadLancPreProntaMT
  Left = 176
  Top = 212
  Caption = 'Lançamentos - Planilhas Pré-Prontas'
  ClientHeight = 439
  ClientWidth = 765
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 765
    Height = 400
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 763
      Height = 56
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label4: TLabel
        Left = 128
        Top = 8
        Width = 110
        Height = 13
        Caption = 'Planilha Pré-Pronta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 16
        Top = 8
        Width = 28
        Height = 13
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 240
        Top = 112
        Width = 71
        Height = 13
        Caption = 'Total Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 448
        Top = 8
        Width = 74
        Height = 13
        Caption = 'Total Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 320
        Top = 8
        Width = 71
        Height = 13
        Caption = 'Total Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dteData: TCMDateTimePicker
        Left = 16
        Top = 24
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
        TabOrder = 0
      end
      object dblkPrePronta: TwwDBLookupCombo
        Left = 128
        Top = 24
        Width = 177
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PANDESCRICAO'#9'20'#9'PANDESCRICAO')
        DataField = 'PANCODIGO'
        LookupTable = CdsPlanilhaPrePronta
        LookupField = 'PANCODIGO'
        Style = csDropDownList
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblkPreProntaCloseUp
      end
      object redDeb: TRealEdit
        Left = 320
        Top = 24
        Width = 113
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        WordWrap = False
        IntDigits = 18
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object redCre: TRealEdit
        Left = 448
        Top = 24
        Width = 113
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        WordWrap = False
        IntDigits = 18
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object btnProximo: TBitBtn
        Left = 664
        Top = 16
        Width = 82
        Height = 33
        Caption = '&Próximo'
        Enabled = False
        TabOrder = 4
        OnClick = btnProximoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88880666666666088888788888F88878F880E6666F6666
          608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
          66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
          66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
          660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
          6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
          8888888778FFFF77888888888000008888888888877777888888}
        Layout = blGlyphRight
        Margin = 4
        NumGlyphs = 2
      end
      object btnAnterior: TBitBtn
        Left = 584
        Top = 16
        Width = 81
        Height = 33
        Caption = '&Anterior'
        Enabled = False
        TabOrder = 5
        OnClick = btnAnteriorClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88880666666666088888788888F88878F880E6666F6666
          608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
          66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
          66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
          660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
          6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
          8888888778FFFF77888888888000008888888888877777888888}
        Margin = 6
        NumGlyphs = 2
      end
    end
    object pgc1: TPageControl
      Left = 1
      Top = 57
      Width = 763
      Height = 342
      ActivePage = tbsLancamentos
      Align = alClient
      TabOrder = 1
      OnChange = pgc1Change
      object tbsLancamentos: TTabSheet
        Caption = 'Lançamentos'
        object Panel4: TPanel
          Left = 16
          Top = 1
          Width = 369
          Height = 25
          Color = clBtnShadow
          TabOrder = 0
          object lblStatus: TLabel
            Left = 8
            Top = 2
            Width = 353
            Height = 20
            AutoSize = False
            Caption = 'Lançamento Nº 0 de 0 - Natureza'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object Panel2: TPanel
          Left = 16
          Top = 42
          Width = 369
          Height = 126
          Caption = 'Panel2'
          TabOrder = 1
          object lblCCustoDeb: TLabel
            Left = 225
            Top = 7
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
            Enabled = False
          end
          object lblSubContaDeb: TLabel
            Left = 224
            Top = 49
            Width = 60
            Height = 13
            Caption = 'Sub-Conta'
            Enabled = False
          end
          object dblkCCustoDeb: TwwDBLookupCombo
            Left = 225
            Top = 21
            Width = 136
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'NOME')
            DataField = 'CODCENTROCUSTO'
            DataSource = ds
            LookupTable = CdsCentroCustoD
            LookupField = 'CODCENTROCUSTO'
            DropDownWidth = 8
            Enabled = False
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object btnSubContaDeb: TBitBtn
            Left = 333
            Top = 63
            Width = 25
            Height = 21
            Enabled = False
            TabOrder = 2
            OnClick = btnSubContaDebClick
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
          object edtNomeSubContaDeb: TEdit
            Left = 32
            Top = 92
            Width = 325
            Height = 21
            TabStop = False
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object mskSubContaDeb: TMaskEdit
            Left = 224
            Top = 63
            Width = 108
            Height = 21
            Enabled = False
            TabOrder = 1
            OnExit = mskSubContaDebExit
          end
          object Panel10: TPanel
            Left = 1
            Top = -159
            Width = 25
            Height = 121
            BevelOuter = bvNone
            Caption = 'Panel10'
            Color = clGray
            TabOrder = 4
          end
          object Panel11: TPanel
            Left = 1
            Top = -1
            Width = 20
            Height = 128
            BevelOuter = bvNone
            Caption = 'Panel11'
            Color = clGray
            TabOrder = 5
            object fcLabel3: TfcLabel
              Left = -1
              Top = 34
              Width = 23
              Height = 55
              AutoSize = False
              Caption = 'Débito'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TextOptions.Alignment = taLeftJustify
              TextOptions.Rotation = 90
              TextOptions.VAlignment = vaTop
            end
          end
          object cmpContaDeb: TCMProcuraMaskContabil
            Left = 29
            Top = 4
            Width = 185
            Height = 74
            Caption = 'Conta Contábil'
            TabOrder = 6
            OnExit = cmpContaDebExit
            MostraMensagens = True
            MostraDescricao = True
            DataSource = ds
            Mensagens.EmBranco = 'Conta não pode estar em branco'
            Mensagens.NaoExiste = 'Conta não existe'
            Mensagens.Sintetica = 'Conta não pode ser sintética'
            Mensagens.Analitica = 'Conta não pode ser analítica'
            PermiteChaveInvalida = True
            PermiteChaveEmBranco = True
            AceitaTipoConta = Indiferente
            Plano = 0
            Status = scAmbas
          end
        end
        object Panel3: TPanel
          Left = 16
          Top = 179
          Width = 369
          Height = 126
          Caption = 'Panel3'
          TabOrder = 2
          object lblCCustoCre: TLabel
            Left = 225
            Top = 8
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
            Enabled = False
          end
          object lblSubContaCre: TLabel
            Left = 224
            Top = 50
            Width = 60
            Height = 13
            Caption = 'Sub-Conta'
            Enabled = False
          end
          object dblkCCustoCre: TwwDBLookupCombo
            Left = 224
            Top = 22
            Width = 137
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'NOME')
            DataField = 'CODCENTROCUSTO'
            DataSource = ds
            LookupTable = CdsCentroCustoC
            LookupField = 'CODCENTROCUSTO'
            DropDownWidth = 8
            Enabled = False
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object btnSubContaCre: TBitBtn
            Left = 334
            Top = 64
            Width = 25
            Height = 21
            Enabled = False
            TabOrder = 2
            OnClick = btnSubContaCreClick
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
          object edtNomeSubContaCre: TEdit
            Left = 31
            Top = 93
            Width = 327
            Height = 21
            TabStop = False
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object mskSubContaCre: TMaskEdit
            Left = 224
            Top = 64
            Width = 109
            Height = 21
            Enabled = False
            TabOrder = 1
            OnExit = mskSubContaCreExit
          end
          object Panel12: TPanel
            Left = 1
            Top = 1
            Width = 20
            Height = 128
            BevelOuter = bvNone
            Caption = 'Panel12'
            Color = clGray
            TabOrder = 4
            object fcLabel4: TfcLabel
              Left = -1
              Top = 31
              Width = 23
              Height = 63
              AutoSize = False
              Caption = 'Crédito'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TextOptions.Alignment = taLeftJustify
              TextOptions.Rotation = 90
              TextOptions.VAlignment = vaTop
            end
          end
          object cmpContaCre: TCMProcuraMaskContabil
            Left = 31
            Top = 7
            Width = 186
            Height = 79
            Caption = 'Conta Contábil'
            TabOrder = 5
            OnExit = cmpContaCreExit
            MostraMensagens = True
            MostraDescricao = True
            DataSource = ds
            Mensagens.EmBranco = 'Conta não pode estar em branco'
            Mensagens.NaoExiste = 'Conta não existe'
            Mensagens.Sintetica = 'Conta não pode ser sintética'
            Mensagens.Analitica = 'Conta não pode ser analítica'
            PermiteChaveInvalida = True
            PermiteChaveEmBranco = True
            AceitaTipoConta = Indiferente
            Plano = 0
            Status = scAmbas
          end
        end
        object Panel13: TPanel
          Left = 392
          Top = 1
          Width = 361
          Height = 305
          TabOrder = 3
          object pnlPlanoPatroC: TPanel
            Left = 1
            Top = 1
            Width = 359
            Height = 43
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object lblPlanoPrevC: TLabel
              Left = 9
              Top = 3
              Width = 33
              Height = 13
              Caption = 'Plano'
            end
            object lblPatroC: TLabel
              Left = 186
              Top = 3
              Width = 80
              Height = 13
              Caption = 'Patrocinadora'
            end
            object dblcPlanoPrevC: TwwDBLookupCombo
              Left = 9
              Top = 16
              Width = 162
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome')
              DataField = 'IDPLANOPREV'
              DataSource = ds
              LookupTable = CdsPlanoPrev
              LookupField = 'IDPLANOPREV'
              Options = [loColLines]
              DropDownCount = 5
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcPatroC: TwwDBLookupCombo
              Left = 186
              Top = 16
              Width = 162
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome')
              DataField = 'IDPATRO'
              DataSource = ds
              LookupTable = CdsPatro
              LookupField = 'IDPESSOA'
              Options = [loColLines]
              DropDownCount = 5
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
          object panSegregacao: TPanel
            Left = 1
            Top = 44
            Width = 359
            Height = 46
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Label3: TLabel
              Left = 10
              Top = 1
              Width = 142
              Height = 13
              Caption = 'Critério para Segregação'
            end
            object Label6: TLabel
              Left = 237
              Top = 1
              Width = 90
              Height = 13
              Caption = 'Data do Critério'
            end
            object wwDBLookupCombo1: TwwDBLookupCombo
              Left = 10
              Top = 16
              Width = 218
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'60'#9'Descrição'#9'F')
              DataField = 'IDSEGREGACRITER'
              DataSource = ds
              LookupTable = cdsSegrega
              LookupField = 'IDSEGREGACRITER'
              Options = [loColLines]
              DropDownCount = 5
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object CMDateTimePicker1: TCMDateTimePicker
              Left = 236
              Top = 16
              Width = 113
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATASEGREGACRITER'
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
          end
          object Panel5: TPanel
            Left = 1
            Top = 90
            Width = 359
            Height = 214
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object Label11: TLabel
              Left = 237
              Top = -2
              Width = 81
              Height = 13
              Caption = 'Cód. Histórico'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label9: TLabel
              Left = 9
              Top = -2
              Width = 65
              Height = 13
              Caption = 'Documento'
            end
            object Label19: TLabel
              Left = 7
              Top = 137
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label21: TLabel
              Left = 8
              Top = 34
              Width = 51
              Height = 13
              Caption = 'Histórico'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 7
              Top = 173
              Width = 100
              Height = 13
              Caption = 'Atividade/Projeto'
            end
            object Label2: TLabel
              Left = 176
              Top = 137
              Width = 103
              Height = 13
              Caption = 'Tipo de Operação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object mskUnidNegoc: TMaskEdit
              Left = 48
              Top = 187
              Width = 17
              Height = 21
              Color = clAqua
              TabOrder = 8
              Visible = False
            end
            object dblkHistorico: TwwDBLookupCombo
              Left = 237
              Top = 11
              Width = 112
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'HITCODHIST'#9'4'#9'Código'
                'HITDESCR1'#9'40'#9'Histórico')
              DataField = 'HITCODHIST'
              DataSource = ds
              LookupTable = CdsHistoPadrao
              LookupField = 'HITCODHIST'
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnExit = dblkHistoricoExit
            end
            object edtAtivProj: TEdit
              Left = 131
              Top = 187
              Width = 217
              Height = 21
              TabStop = False
              ReadOnly = True
              TabOrder = 11
            end
            object btnAtivProj: TBitBtn
              Left = 83
              Top = 187
              Width = 25
              Height = 21
              TabOrder = 10
              OnClick = btnAtivProjClick
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
            object Memo1: TMemo
              Left = 8
              Top = 47
              Width = 339
              Height = 87
              Enabled = False
              TabOrder = 1
            end
            object mskHist1: TMaskEdit
              Left = 12
              Top = 52
              Width = 327
              Height = 13
              BorderStyle = bsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 40
              ParentFont = False
              TabOrder = 2
              OnChange = mskHist1Change
            end
            object mskHist2: TMaskEdit
              Left = 12
              Top = 68
              Width = 327
              Height = 13
              BorderStyle = bsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 40
              ParentFont = False
              TabOrder = 3
              OnChange = mskHist1Change
            end
            object mskHist3: TMaskEdit
              Left = 12
              Top = 84
              Width = 327
              Height = 13
              BorderStyle = bsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 40
              ParentFont = False
              TabOrder = 4
              OnChange = mskHist1Change
            end
            object mskHist4: TMaskEdit
              Left = 12
              Top = 100
              Width = 327
              Height = 13
              BorderStyle = bsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 40
              ParentFont = False
              TabOrder = 5
              OnChange = mskHist1Change
            end
            object mskHist5: TMaskEdit
              Left = 12
              Top = 116
              Width = 327
              Height = 13
              BorderStyle = bsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 40
              ParentFont = False
              TabOrder = 6
              OnChange = mskHist1Change
            end
            object dblkTipoOper: TwwDBLookupCombo
              Left = 176
              Top = 150
              Width = 174
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
              DataField = 'TIPCODIGO'
              DataSource = ds
              LookupTable = CdsTipoOper
              LookupField = 'TIPCODIGO'
              ParentFont = False
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dbDocumento: TDBEdit
              Left = 9
              Top = 11
              Width = 199
              Height = 21
              DataField = 'NUMDOC'
              DataSource = ds
              TabOrder = 12
              OnExit = dbDocumentoExit
            end
            object RedValor: TDBRealEdit
              Left = 8
              Top = 150
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 13
              WordWrap = False
              OnExit = RedValorExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALOR'
              DataSource = ds
            end
            object mskAtivProj: TMaskEdit
              Left = 8
              Top = 187
              Width = 75
              Height = 21
              TabOrder = 9
              OnExit = mskAtivProjExit
            end
          end
        end
      end
      object tblDetalhes: TTabSheet
        Caption = 'Detalhes do Lançamento'
        object Panel6: TPanel
          Left = 16
          Top = 32
          Width = 353
          Height = 241
          TabOrder = 0
          object lbConvOfDeb: TLabel
            Left = 40
            Top = 8
            Width = 61
            Height = 13
            Caption = 'Conversão'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbConvG1Deb: TLabel
            Left = 40
            Top = 48
            Width = 61
            Height = 13
            Caption = 'Conversão'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbConvG2Deb: TLabel
            Left = 40
            Top = 88
            Width = 61
            Height = 13
            Caption = 'Conversão'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbConvG3Deb: TLabel
            Left = 40
            Top = 128
            Width = 61
            Height = 13
            Caption = 'Conversão'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label23: TLabel
            Left = 216
            Top = 184
            Width = 93
            Height = 13
            Caption = 'Moeda Histórica'
          end
          object Panel9: TPanel
            Left = 1
            Top = 1
            Width = 25
            Height = 240
            BevelOuter = bvNone
            Color = clGray
            TabOrder = 4
            object fcLabel1: TfcLabel
              Left = 1
              Top = 96
              Width = 23
              Height = 136
              AutoSize = False
              Caption = 'Contra-Partida'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TextOptions.Alignment = taLeftJustify
              TextOptions.Rotation = 90
              TextOptions.VAlignment = vaBottom
            end
          end
          object cmbConvOfDeb: TComboBox
            Left = 40
            Top = 24
            Width = 161
            Height = 21
            Style = csDropDownList
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
            Items.Strings = (
              'Não Converte'
              'Histórico Médio'
              'Diário'
              'Moeda Corrente do Último Dia'
              'Manual')
          end
          object cmbConvG1Deb: TComboBox
            Left = 40
            Top = 64
            Width = 161
            Height = 21
            Style = csDropDownList
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 13
            ParentFont = False
            TabOrder = 1
            Items.Strings = (
              'Não Converte'
              'Histórico Médio'
              'Diário'
              'Moeda Corrente do Último Dia'
              'Manual')
          end
          object cmbConvG2Deb: TComboBox
            Left = 40
            Top = 104
            Width = 161
            Height = 21
            Style = csDropDownList
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 13
            ParentFont = False
            TabOrder = 2
            Items.Strings = (
              'Não Converte'
              'Histórico Médio'
              'Diário'
              'Moeda Corrente do Último Dia'
              'Manual')
          end
          object cmbConvG3Deb: TComboBox
            Left = 40
            Top = 144
            Width = 161
            Height = 21
            Style = csDropDownList
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 13
            ParentFont = False
            TabOrder = 3
            Items.Strings = (
              'Não Converte'
              'Histórico Médio'
              'Diário'
              'Moeda Corrente do Último Dia'
              'Manual')
          end
          object redHistDeb: TDBRealEdit
            Left = 216
            Top = 200
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '0,00')
            TabOrder = 5
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'REDHISTDEB'
            DataSource = ds
          end
          object redOfDeb: TDBRealEdit
            Left = 216
            Top = 24
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Color = clBtnFace
            Enabled = False
            Lines.Strings = (
              '0,00')
            TabOrder = 6
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'REDOFDEB'
            DataSource = ds
          end
          object redG1Deb: TDBRealEdit
            Left = 216
            Top = 64
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Color = clBtnFace
            Enabled = False
            Lines.Strings = (
              '0,00')
            TabOrder = 7
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'REDG1DEB'
            DataSource = ds
          end
          object redG3Deb: TDBRealEdit
            Left = 216
            Top = 144
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Color = clBtnFace
            Enabled = False
            Lines.Strings = (
              '0,00')
            TabOrder = 8
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'REDG3DEB'
            DataSource = ds
          end
          object redG2Deb: TDBRealEdit
            Left = 216
            Top = 103
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Color = clBtnFace
            Enabled = False
            Lines.Strings = (
              '0,00')
            TabOrder = 9
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'REDG1DEB'
            DataSource = ds
          end
        end
        object Panel7: TPanel
          Left = 376
          Top = 32
          Width = 353
          Height = 241
          TabOrder = 1
          object lbConvOfCre: TLabel
            Left = 40
            Top = 8
            Width = 61
            Height = 13
            Caption = 'Conversão'
          end
          object lbConvG1Cre: TLabel
            Left = 40
            Top = 48
            Width = 61
            Height = 13
            Caption = 'Conversão'
          end
          object lbConvG2Cre: TLabel
            Left = 40
            Top = 88
            Width = 61
            Height = 13
            Caption = 'Conversão'
          end
          object lbConvG3Cre: TLabel
            Left = 40
            Top = 128
            Width = 61
            Height = 13
            Caption = 'Conversão'
          end
          object Label24: TLabel
            Left = 216
            Top = 184
            Width = 93
            Height = 13
            Caption = 'Moeda Histórica'
          end
          object Panel8: TPanel
            Left = 1
            Top = 1
            Width = 25
            Height = 240
            BevelOuter = bvNone
            Color = clGray
            TabOrder = 4
            object fcLabel2: TfcLabel
              Left = 1
              Top = 40
              Width = 23
              Height = 192
              AutoSize = False
              Caption = 'Conta a ser Rateada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TextOptions.Alignment = taLeftJustify
              TextOptions.Rotation = 90
              TextOptions.VAlignment = vaBottom
            end
          end
          object cmbConvOfCre: TComboBox
            Left = 40
            Top = 24
            Width = 161
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Não Converte'
              'Histórico Médio'
              'Diário'
              'Moeda Corrente do Último Dia'
              'Manual')
          end
          object cmbConvG1Cre: TComboBox
            Left = 40
            Top = 64
            Width = 161
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 1
            Items.Strings = (
              'Não Converte'
              'Histórico Médio'
              'Diário'
              'Moeda Corrente do Último Dia'
              'Manual')
          end
          object cmbConvG2Cre: TComboBox
            Left = 40
            Top = 104
            Width = 161
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 2
            Items.Strings = (
              'Não Converte'
              'Histórico Médio'
              'Diário'
              'Moeda Corrente do Último Dia'
              'Manual')
          end
          object cmbConvG3Cre: TComboBox
            Left = 40
            Top = 144
            Width = 161
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 3
            Items.Strings = (
              'Não Converte'
              'Histórico Médio'
              'Diário'
              'Moeda Corrente do Último Dia'
              'Manual')
          end
          object redHistCre: TDBRealEdit
            Left = 216
            Top = 200
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '0,00')
            TabOrder = 5
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'REDHISTCRE'
            DataSource = ds
          end
          object redOfCre: TDBRealEdit
            Left = 216
            Top = 24
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Color = clBtnFace
            Enabled = False
            Lines.Strings = (
              '0,00')
            TabOrder = 6
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'REDOFCRE'
            DataSource = ds
          end
          object redG1Cre: TDBRealEdit
            Left = 216
            Top = 64
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Color = clBtnFace
            Enabled = False
            Lines.Strings = (
              '0,00')
            TabOrder = 7
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'REDG1CRE'
            DataSource = ds
          end
          object redG3Cre: TDBRealEdit
            Left = 216
            Top = 144
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Color = clBtnFace
            Enabled = False
            Lines.Strings = (
              '0,00')
            TabOrder = 8
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'REDG3CRE'
            DataSource = ds
          end
          object redG2Cre: TDBRealEdit
            Left = 216
            Top = 100
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Color = clBtnFace
            Enabled = False
            Lines.Strings = (
              '0,00')
            TabOrder = 9
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'REDG2CRE'
            DataSource = ds
          end
        end
      end
      object tbsRegraZero: TTabSheet
        Caption = 'Regra Prova Zero'
        ImageIndex = 2
        object dbGrid: TwwDBGrid
          Left = 0
          Top = 0
          Width = 755
          Height = 314
          Selected.Strings = (
            'PLANO'#9'37'#9'Plano'
            'PATRO'#9'39'#9'Patrocinadora'
            'CRITERIO'#9'40'#9'Critério de Segregação'
            'DTCRITERIO'#9'14'#9'Data Critério'
            'DEBITO'#9'15'#9'Débito'
            'CREDITO'#9'15'#9'Crédito'
            'SALDO'#9'13'#9'Saldo')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsRegraZero
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = dbGridCalcCellColors
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 400
    Width = 765
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 403
    TargetsData = (
      1
      3
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object CdsPlanilhaPrePronta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 317
    Top = 237
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 200
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 312
  end
  object CdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 245
    Top = 344
  end
  object CdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 378
    Top = 200
  end
  object CdsHistoPadrao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 165
    Top = 184
  end
  object MontaSelectSubConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'SUBCONTA.CODSUBCONTA'
      'SUBCONTA.NOMESUBCONTA')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome da Sub-Conta')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'SUBCONTA')
    CamposChave.Strings = (
      'SUBCONTA.CODSUBCONTA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 168
    Top = 224
  end
  object MontaSelectAtivProj: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'UNIDNEGOCIO.UNECODIGO'
      'UNIDNEGOCIO.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'UNIDNEGOCIO')
    CamposChave.Strings = (
      'UNIDNEGOCIO.UNECODIGO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '25')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 312
    Top = 352
  end
  object CdsCentroCustoD: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 77
    Top = 320
  end
  object CdsCentroCustoC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 237
    Top = 248
  end
  object cdsLancamentos: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'RegraZero_idx'
        Fields = 'IDPLANOPREV; IDPATRO; IDSEGREGACRITER; DATASEGREGACRITER;'
      end>
    Params = <>
    StoreDefs = True
    Left = 56
    Top = 176
  end
  object cdsTotalDebCre: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 328
  end
  object ds: TwwDataSource
    DataSet = cdsLancamentos
    Left = 493
    Top = 45
  end
  object cdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 346
    Top = 295
  end
  object cdsConsiste: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 309
    Top = 197
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 517
    Top = 317
  end
  object sqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT   PLNPLANIL,PLNDATDIA, PLNCODIGO '
      'FROM  PLANILHA'
      'WHERE  PLNCODIGO =:PLNCODIGO ')
    ClientDataSet = cdsAux
    Left = 517
    Top = 341
  end
  object cdsSegrega: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 157
    Top = 264
  end
  object dsRegraZero: TwwDataSource
    DataSet = CdsRegraZero
    Left = 661
    Top = 225
  end
  object CdsRegraZero: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    AfterOpen = CdsRegraZeroAfterOpen
    Left = 669
    Top = 281
    Data = {
      240100009619E0BD010000001800000007000000000003000000240105504C41
      4E4F01004900000002000753554254595045020049000A004669786564436861
      720005574944544802000200500005504154524F010049000000020007535542
      54595045020049000A0046697865644368617200055749445448020002005000
      08435249544552494F01004900000002000753554254595045020049000A0046
      6978656443686172000557494454480200020050000A4454435249544552494F
      01004900000002000753554254595045020049000A0046697865644368617200
      055749445448020002000A000644454249544F08000400000000000743524544
      49544F08000400000000000553414C444F08000400000000000100044C434944
      0400010016080000}
  end
  object SqlRegraZero: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   '#39'                                                            ' +
        '                    '#39'  AS PLANO,'
      
        '   '#39'                                                            ' +
        '                    '#39'  AS PATRO, '
      
        '   '#39'                                                            ' +
        '                    '#39'  AS CRITERIO,'
      '   '#39'          '#39' AS DTCRITERIO,'
      '   -1 AS DEBITO,'
      '   -1 AS CREDITO,'
      '   -1 AS SALDO'
      'FROM'
      '   DUAL    '
      'WHERE'
      '   1 = 2'
      ' ')
    ClientDataSet = CdsRegraZero
    Left = 669
    Top = 169
  end
end
