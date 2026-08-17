inherited frmEventoTransfPlanoNOVO: TfrmEventoTransfPlanoNOVO
  Left = 12
  Top = 76
  Caption = 'Evento Transferência de Plano'
  ClientHeight = 476
  ClientWidth = 773
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 773
    Height = 436
    object pgctrlEtapas: TPageControl
      Left = 1
      Top = 1
      Width = 771
      Height = 434
      ActivePage = tbsEtapa6
      Align = alClient
      MultiLine = True
      TabOrder = 0
      TabPosition = tpBottom
      object tbsEtapa1: TTabSheet
        Caption = 'Início'
        object Label6: TLabel
          Left = 0
          Top = 0
          Width = 763
          Height = 23
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'Simulação de Migração de Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -17
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
        end
        object GroupBox2: TGroupBox
          Left = 6
          Top = 33
          Width = 691
          Height = 42
          TabOrder = 0
          object Label7: TLabel
            Left = 9
            Top = 7
            Width = 199
            Height = 23
            AutoSize = False
            Caption = 'Data Base para Dados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -17
            Font.Name = 'Bookman Old Style'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object dtDataREF: TCMDateTimePicker
            Left = 207
            Top = 14
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
            OnEnter = dtDataREFEnter
          end
        end
        object GroupBox3: TGroupBox
          Left = 6
          Top = 77
          Width = 691
          Height = 79
          TabOrder = 1
          object lblValores: TLabel
            Left = 9
            Top = 10
            Width = 454
            Height = 23
            AutoSize = False
            Caption = 'Selecione o Participante Titular '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -17
            Font.Name = 'Bookman Old Style'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object lblCampoBusca: TLabel
            Left = 9
            Top = 32
            Width = 55
            Height = 13
            Caption = 'Matrícula'
          end
          object Label3: TLabel
            Left = 207
            Top = 32
            Width = 33
            Height = 13
            Caption = 'Nome'
          end
          object edCampoBusca: TEdit
            Left = 9
            Top = 47
            Width = 163
            Height = 21
            TabOrder = 0
            OnExit = edCampoBuscaExit
          end
          object edNome: TEdit
            Left = 207
            Top = 47
            Width = 367
            Height = 21
            Color = clSilver
            ReadOnly = True
            TabOrder = 1
            OnExit = edCampoBuscaExit
          end
          object bbtnProcurar: TBitBtn
            Left = 175
            Top = 44
            Width = 30
            Height = 28
            Hint = 'Procurar participante'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
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
        end
        object GroupBox4: TGroupBox
          Left = 6
          Top = 158
          Width = 691
          Height = 178
          TabOrder = 2
          object Label2: TLabel
            Left = 9
            Top = 13
            Width = 454
            Height = 23
            AutoSize = False
            Caption = 'Situação Atual do Participante'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -17
            Font.Name = 'Bookman Old Style'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object lblPlanoOrigem: TLabel
            Left = 9
            Top = 38
            Width = 191
            Height = 13
            Caption = 'Patrocinadora/Plano de Origem : '
          end
          object lblInscricaoData: TLabel
            Left = 9
            Top = 62
            Width = 90
            Height = 13
            Caption = 'Inscrito deste : '
          end
          object lblSitPart: TLabel
            Left = 9
            Top = 85
            Width = 137
            Height = 13
            Caption = 'Situação na Fundação :'
          end
          object lblBeneficio: TLabel
            Left = 9
            Top = 109
            Width = 137
            Height = 13
            Caption = 'Recebendo Benefício : '
          end
          object lblFalecido: TLabel
            Left = 9
            Top = 132
            Width = 61
            Height = 13
            Caption = 'Falecido : '
          end
          object lblDataTransacao: TLabel
            Left = 9
            Top = 155
            Width = 116
            Height = 13
            Caption = 'Data da Simulação :'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object lblPeriodoMigracao: TLabel
            Left = 353
            Top = 155
            Width = 119
            Height = 13
            Caption = 'Período de migração'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
        end
        object GroupBox5: TGroupBox
          Left = 6
          Top = 337
          Width = 691
          Height = 58
          TabOrder = 3
          object Label1: TLabel
            Left = 9
            Top = 9
            Width = 454
            Height = 23
            AutoSize = False
            Caption = 'Indique o Plano Previdenciário de Destino'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -17
            Font.Name = 'Bookman Old Style'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object dblkpcmbNovoPlano: TwwDBLookupCombo
            Left = 9
            Top = 32
            Width = 511
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'Plano Previdenciário'#9'F')
            LookupTable = qryPlanoDestino
            LookupField = 'IDPLANOPREV'
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
        end
      end
      object tbsEtapa2: TTabSheet
        Caption = 'Dados do Participante'
        ImageIndex = 1
        object Label4: TLabel
          Left = 8
          Top = 29
          Width = 427
          Height = 23
          AutoSize = False
          Caption = 'Parâmetros Usados nos Cálculos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -17
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object lblTituloEtapa2: TLabel
          Left = 8
          Top = 0
          Width = 538
          Height = 25
          AutoSize = False
          Caption = 'Matrícula : 99999 - Fulano de Tal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -17
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object dbgrdInfBanco: TwwDBGrid
          Left = 8
          Top = 55
          Width = 688
          Height = 339
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'DESCRICAO'
            'VALOR'#9'20'#9'VALOR')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 2
          ShowHorzScrollBar = True
          DataSource = dsInfBanco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
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
      object tbsEtapa3: TTabSheet
        Caption = 'Opções'
        ImageIndex = 2
        object lblTituloEtapa3: TLabel
          Left = 9
          Top = 0
          Width = 538
          Height = 25
          AutoSize = False
          Caption = 'Matrícula : 99999 - Fulano de Tal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -17
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 9
          Top = 29
          Width = 454
          Height = 23
          AutoSize = False
          Caption = 'Opções do Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -17
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 9
          Top = 372
          Width = 109
          Height = 13
          Caption = 'Opção Escolhida : '
        end
        object memOpcoes: TMemo
          Left = 2
          Top = 60
          Width = 758
          Height = 304
          Anchors = [akLeft, akTop, akRight]
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object edOpcao: TEdit
          Left = 132
          Top = 369
          Width = 121
          Height = 21
          TabOrder = 1
        end
      end
      object tbsEtapa4: TTabSheet
        Caption = 'Valores '
        ImageIndex = 6
        object lblTituloEtapa4: TLabel
          Left = 8
          Top = 0
          Width = 538
          Height = 25
          AutoSize = False
          Caption = 'Matrícula : 99999 - Fulano de Tal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -17
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 8
          Top = 29
          Width = 427
          Height = 23
          AutoSize = False
          Caption = 'Informe os Valores a Seguir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -17
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object dbgrdInputTransfPlano: TwwDBGrid
          Left = 8
          Top = 55
          Width = 688
          Height = 339
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'DESCRICAO'
            'VALOR'#9'30'#9'VALOR')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 1
          ShowHorzScrollBar = True
          DataSource = dsInputTransfPlano
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnColExit = dbgrdInputTransfPlanoColExit
          IndicatorColor = icBlack
          OnFieldChanged = dbgrdInputTransfPlanoFieldChanged
        end
      end
      object tbsEtapa5: TTabSheet
        Caption = 'Estimativas'
        ImageIndex = 5
        object lblTituloEtapa5: TLabel
          Left = 9
          Top = 0
          Width = 538
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = 'Matrícula : 99999 - Fulano de Tal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -17
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object lblEstimativa: TLabel
          Left = 9
          Top = 29
          Width = 454
          Height = 23
          AutoSize = False
          Caption = 'Estimativas da Opção #'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -17
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object memEstimativas: TMemo
          Left = 2
          Top = 60
          Width = 758
          Height = 334
          Anchors = [akLeft, akTop, akRight]
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object tbsEtapa6: TTabSheet
        Caption = 'Relatórios e Confirmação'
        ImageIndex = 3
        object lblTituloEtapa6: TLabel
          Left = 57
          Top = 0
          Width = 649
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = 'Matrícula : 99999 - Fulano de Tal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -17
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object bbtnPrintOpcoes: TBitBtn
          Left = 158
          Top = 72
          Width = 445
          Height = 61
          Caption = 'Imprimir Opções de Migração'
          TabOrder = 0
          OnClick = bbtnPrintOpcoesClick
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
          NumGlyphs = 2
        end
        object bbtnPrintTermo: TBitBtn
          Left = 158
          Top = 164
          Width = 445
          Height = 61
          Caption = 'Imprimir Termos para Migração'
          TabOrder = 1
          OnClick = bbtnPrintTermoClick
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
          NumGlyphs = 2
        end
        object bbtnEfetuaMigracao: TBitBtn
          Left = 158
          Top = 258
          Width = 445
          Height = 61
          Caption = 'Confirmar Migração de Plano'
          Default = True
          TabOrder = 2
          OnClick = bbtnEfetuaMigracaoClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object GroupBox1: TGroupBox
          Left = 162
          Top = 327
          Width = 442
          Height = 65
          Caption = ' Data da Adesão ao Novo Plano ( Preencha para Confirmar )'
          TabOrder = 3
          object dtDataTRANSACAO: TCMDateTimePicker
            Left = 12
            Top = 23
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
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 436
    Width = 773
    Height = 40
    inherited tb97Fundo: TToolbar97
      Left = 526
      DockPos = 526
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 247
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object ToolbarSep973: TToolbarSep97 [2]
        Left = 164
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 83
        Height = 34
        Caption = '&Próximo'
        Enabled = False
        ModalResult = 0
        OnClick = bbtnConfirmarClick
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
      end
      inherited bbtnCancelar: TBitBtn
        Left = 250
        OnClick = bbtnCancelarClick
      end
      object bbtnAnterior: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = 'A&nterior'
        Enabled = False
        TabOrder = 2
        OnClick = bbtnAnteriorClick
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
        NumGlyphs = 2
      end
      object bbtnConfirmacaoFinal: TBitBtn
        Left = 167
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        TabOrder = 3
        OnClick = bbtnConfirmacaoFinalClick
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
    Left = 12
    Top = 448
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante Titular'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV'
      'SITPLANOPREV'
      'SITPART'
      'SITFUNC')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'PARTPREVPLAN.SEQPROPOSTA'
      'SITPLANOPREV.IDSITPLANOPREV'
      'SITPLANOPREV.DESCRICAO'
      'SITPART.DESCRICAO'
      'SITFUNC.DESCRICAO'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'SITPART.FLGINTERNO'
      'PARTPREVPLAN.SALPARTICIPACAO'
      'PARTPREVPLAN.SALMANTIDO'
      'PARTPREVPLAN.IDSITPART'
      'ELEGPATRO.IDSITFUNC')
    Filtro.Strings = (
      'PESSOA.IDPESSOA      = PARTPREVPLAN.IDPESSOA'
      'PATRO.IDPESSOA       = PARTPREVPLAN.IDPESSJUR'
      'ELEGPATRO.IDPESSJUR  = PARTPREVPLAN.IDPESSJUR'
      'ELEGPATRO.IDPESSOA   = PARTPREVPLAN.IDPESSOA'
      'PLANPREV.IDPLANOPREV = PARTPREVPLAN.IDPLANOPREV'
      'SITPLANOPREV.IDSITPLANOPREV = PARTPREVPLAN.IDSITPLANOPREV'
      'PARTPREVPLAN.IDPLANOPREV IN (3,16)'
      'SITPART.IDSITPART    = PARTPREVPLAN.IDSITPART'
      'SITFUNC.IDSITFUNC    = ELEGPATRO.IDSITFUNC')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 367
    Top = 6
  end
  object qryPlanoDestino: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT   PL.IDPLANOPREV, PL.NOME, PL.FLGAUTONUMINSC, PL.IDREGRAT' +
        'RANSFPLA'
      'FROM     PLANPREV PL'
      'ORDER BY PL.NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 624
    Top = 39
  end
  object qryInputTransfPlano: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDINPUT, DESCRICAO, IDREGRA, FLGTIPO, TABELA, CAMPO, NOME' +
        'PARAREGRA,'
      '       '#39'                              '#39' AS VALOR,'
      
        '       FLGATIVO, FLGMANTIDO, FLGMANTPARC, FLGASSISTIDO, FLGBENEF' +
        'ICIARIO,'
      
        '       FLGPODEALTERAR, ORDEM, VALORDEFAULT, IDREGRAVALIDA, IDREG' +
        'RAVLRDEFAULT'
      'FROM   INPUTTRANSFPLANO'
      'WHERE  IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'AND    FLGATIVO        = :FLGATIVO'
      'AND    FLGMANTIDO      = :FLGMANTIDO'
      'AND    FLGMANTPARC     = :FLGMANTPARC'
      'AND    FLGASSISTIDO    = :FLGASSISTIDO'
      'AND    FLGBENEFICIARIO = :FLGBENEFICIARIO'
      'AND    FLGTIPO         = '#39'I'#39
      'ORDER BY ORDEM, DESCRICAO'
      ''
      ''
      ''
      '')
    UpdateObject = updInputTransfPlano
    ValidateWithMask = True
    Left = 624
    Top = 162
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
        Value = '45'
      end
      item
        DataType = ftInteger
        Name = 'FLGATIVO'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'FLGMANTIDO'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'FLGMANTPARC'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'FLGASSISTIDO'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'FLGBENEFICIARIO'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object qryTiposTransf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TIPOSTRANSFPLANO'
      'WHERE IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'AND FLGTIPO = :FLGTIPO'
      'ORDER BY VALORAMIGRAR  ')
    ValidateWithMask = True
    Left = 624
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGTIPO'
        ParamType = ptUnknown
      end>
  end
  object dsInputTransfPlano: TwwDataSource
    DataSet = qryInputTransfPlano
    Left = 624
    Top = 178
  end
  object updInputTransfPlano: TUpdateSQL
    Left = 624
    Top = 194
  end
  object qryConfigTransf: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOTRANSF, IDCONFIG, NOME, IDREGRA, IDREGRA2,'
      '       ORDEM,'
      '       '#39'                              '#39' AS VALOR, TIPODADO,'
      '       '#39'                              '#39' AS VALOR2'
      'FROM   CONFIGTRANSFPLANO'
      'WHERE  IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'ORDER BY IDTIPOTRANSF, ORDEM'
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updConfigTransf
    ValidateWithMask = True
    Left = 627
    Top = 356
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end>
  end
  object qrySitPlanoDestino: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCRICAO , IDSITPLANOPREV'
      'FROM SITPLANOPREV'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 631
    Top = 57
  end
  object qrySitPlanoOrigem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SIT.DESCRICAO , SIT.IDSITPLANOPREV, SIT.FLGINTERNO'
      'FROM SITPLANOPREV SIT , EVENTOXSITPLAPREV E'
      'WHERE '
      'SIT.IDSITPLANOPREV = E.IDSITPLANOPREV'
      'AND E.IDEVENTOGERADOR = :IDEVENTO'
      'ORDER BY SIT.DESCRICAO')
    ValidateWithMask = True
    Left = 621
    Top = 73
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEVENTO'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 438
    Top = 6
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 438
    Top = 29
  end
  object qryGrava: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 438
    Top = 53
  end
  object qryParticipanteOrigem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT S.IDPESSJUR,          S.IDPLANOPREV,        S.IDPESSOA,  ' +
        '       S.SEQPROPOSTA,'
      
        '        S.MATRICULA,          S.INSCRICAODATA,      S.SITUACAO, ' +
        '        S.IDADEAPOS,'
      
        '        S.DATANASC,           S.DATAMORTE,          S.ESTADOCIVI' +
        'L AS ESTCIVIL,'
      
        '        S.SEXO,               S.DATAADMISSAO,       S.DATADEMISS' +
        'AO,'
      '        S.SITUACAO AS FLGINTERNO,'
      
        '        EL.TEMPONAOCREDITADO, EL.TEMPOSERVANTERIOR, EL.TEMPOSERV' +
        'ANTREAL,'
      
        '        EL.TEMPOSERVCALC,     EL.TEMPOSERVPRIVANT,  EL.TEMPOSERV' +
        'PUBLANT,'
      
        '        EL.TEMPOSERVTOTAL,    EL.TEMPOSERVTOTDIA,   EL.TEMPOSERV' +
        'TOTMES,'
      
        '        EL.TEMPOSITESPECIAL,  S.SALPARTICIPACAO     AS VALORPROV' +
        'ENTO,'
      
        '        S.SALPARTICIPACAO,    S.REMUNERACAO,        S.CONTRIBUIC' +
        'AO,'
      
        '        S.TEMPOINSS,          S.JOIA,               S.PRAZOJOIAF' +
        'ALTA,'
      
        '        S.PRAZOJOIAPAGO,      S.RPTRIBUTAVEL,       S.RPNAOTRIBU' +
        'TAVEL,'
      
        '        S.SRB,                S.FATORPREVIDENC,     S.TEMPOMINCO' +
        'NTRIB,'
      
        '        S.DATAINICIOFUND,     S.VALORATUAL,         S.VLRINFINSS' +
        ','
      
        '        S.IDBENEFICIO,        S.VALORABONO,         S.DATAULTSIM' +
        'ULA,'
      
        '        S.PROPORCAO,          S.COTAPENSAO,         S.DATANASCVI' +
        'T,'
      '        S.DATANASCTEMP,       S.NUMDEPEN,'
      
        '        S.OPCAO,              S.TAXAJOIA,           S.NOMESITUAC' +
        'AO, S.NOMEBENEFICIO,'
      '        S.CAMPOOP1,           S.CAMPOOP2,           S.CAMPOOP3,'
      '        S.CAMPOOP4,           S.CAMPOOP5,'
      '        S.CAMPOOP6,           S.CONTRIBUICAOEXTRA,'
      '        S.NOME AS NOMEPARTICIP, PP.IDSITPLANOPREV,'
      '        PAT.NOME AS NOMEPATRO, PL.NOME AS NOMEPLANO,'
      '        B.FLGBENEFTEMP, :DATAREF AS DATAREF,'
      '        EG.DATATRANSACAO'
      
        ' FROM   PESSOA P, PESSOA PAT, ELEGPATRO EL, PARTPREVPLAN PP, SIM' +
        'ULAMIGRACAO S, EVENTOGERADOR EG, PLANPREV PL,'
      '        BENEFICIO B, BENEFPLANPREV BP'
      ' WHERE  EG.IDEVENTOGERADOR = :IDEVENTOGERADOR'
      ' AND    S.IDPESSJUR        = :IDPESSJUR'
      ' AND    S.IDPLANOPREV      = :IDPLANOPREV'
      ' AND    S.IDPESSOA         = :IDPESSOA'
      ' AND    S.SEQPROPOSTA      = :SEQPROPOSTA'
      
        ' AND    S.ANOMESREF        = TO_CHAR(NVL(TO_DATE(:DATAREF,'#39'DD/MM' +
        '/YYYY'#39'),SYSDATE),'#39'YYYY/MM'#39')'
      ' AND    EL.IDPESSJUR       = S.IDPESSJUR'
      ' AND    EL.IDPESSOA        = S.IDPESSOA'
      ' AND    P.IDPESSOA         = EL.IDPESSOA'
      ' AND    PAT.IDPESSOA       = EL.IDPESSJUR'
      ' AND    PL.IDPLANOPREV     = S.IDPLANOPREV'
      ' AND    B.IDBENEFICIO(+)   = S.IDBENEFICIO'
      ' AND    BP.IDPLANOPREV(+)  = S.IDPLANOPREV'
      ' AND    BP.IDBENEFICIO(+)  = S.IDBENEFICIO'
      ' AND    PP.IDPESSJUR       = EL.IDPESSJUR'
      ' AND    PP.IDPESSOA        = EL.IDPESSOA'
      ' AND    PP.FLGDESATIVADO   = 0'
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 496
    Top = 11
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end>
  end
  object dsConfigTransf: TwwDataSource
    DataSet = qryConfigTransf
    Left = 627
    Top = 313
  end
  object updConfigTransf: TUpdateSQL
    ModifySQL.Strings = (
      'update CONFIGTRANSFPLANO'
      'set'
      '  NOME = :NOME,'
      '  IDREGRA = :IDREGRA,'
      '  ORDEM = :ORDEM,'
      '  VALOR = :VALOR'
      'where'
      '  IDTIPOTRANSF = :OLD_IDTIPOTRANSF and'
      '  IDCONFIG = :OLD_IDCONFIG')
    InsertSQL.Strings = (
      'insert into CONFIGTRANSFPLANO'
      '  (IDTIPOTRANSF, IDCONFIG, NOME, IDREGRA, ORDEM, VALOR)'
      'values'
      '  (:IDTIPOTRANSF, :IDCONFIG, :NOME, :IDREGRA, :ORDEM, :VALOR)')
    DeleteSQL.Strings = (
      'delete from CONFIGTRANSFPLANO'
      'where'
      '  IDTIPOTRANSF = :OLD_IDTIPOTRANSF and'
      '  IDCONFIG = :OLD_IDCONFIG')
    Left = 627
    Top = 392
  end
  object qryDadosAssistido: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BF.IDBENEFICIO,'
      '       BF.DATAINICIOFUND,'
      '       BF.VALORSRB,'
      '       INSS.VALORATUAL AS VLRCALCINSS,'
      '       INSS.VALORATUAL AS VLRINFINSS,'
      '       SUM(BF.VALORATUAL) AS VALORATUAL'
      'FROM   BENEFBFCIARIO BF, BENEFPLANPREV BPSUPL,'
      '       (SELECT DISTINCT INSS.NUMEROPROCESSO, INSS.VALORATUAL'
      '        FROM   BENEFPLANPREV BPINSS, BENEFBFCIARIO INSS'
      '        WHERE  INSS.IDPESSJUR       = :IDPESSJUR'
      '        AND    INSS.IDPLANOPREV     = :IDPLANOPREV'
      '        AND    INSS.IDPESSOA        = :IDPESSOA'
      '        AND    INSS.SEQPROPOSTA     = :SEQPROPOSTA'
      '        AND    BPINSS.IDPLANOPREV   = INSS.IDPLANOPREV'
      '        AND    BPINSS.IDBENEFICIO   = INSS.IDBENEFICIO'
      '        AND    BPINSS.FLGREFERENCIA = 1 ) INSS'
      'WHERE  BF.IDPESSJUR           = :IDPESSJUR'
      'AND    BF.IDPLANOPREV         = :IDPLANOPREV'
      'AND    BF.IDPESSOA            = :IDPESSOA'
      'AND    BF.SEQPROPOSTA         = :SEQPROPOSTA'
      'AND    BPSUPL.IDPLANOPREV     = BF.IDPLANOPREV'
      'AND    BPSUPL.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND    BPSUPL.FLGREFERENCIA   = 0'
      'AND    INSS.NUMEROPROCESSO(+) = BF.NUMEROPROCESSO'
      'GROUP BY BF.IDBENEFICIO,'
      '         BF.DATAINICIOFUND,'
      '         BF.VALORSRB,'
      '         INSS.VALORATUAL')
    ValidateWithMask = True
    Left = 495
    Top = 32
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
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
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
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 495
    Top = 54
  end
  object qryInfBanco: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDINPUT, DESCRICAO, IDREGRA, FLGTIPO, TABELA, CAMPO, NOME' +
        'PARAREGRA,'#39'                              '#39' AS VALOR,'
      
        '       FLGATIVO, FLGMANTIDO, FLGMANTPARC, FLGASSISTIDO, FLGBENEF' +
        'ICIARIO,'
      
        '       FLGPODEALTERAR, ORDEM, VALORDEFAULT , TIPODADO, IDREGRAVL' +
        'RDEFAULT'
      'FROM   INPUTTRANSFPLANO'
      'WHERE  IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'AND    FLGATIVO        = :FLGATIVO'
      'AND    FLGMANTIDO      = :FLGMANTIDO'
      'AND    FLGMANTPARC     = :FLGMANTPARC'
      'AND    FLGASSISTIDO    = :FLGASSISTIDO'
      'AND    FLGBENEFICIARIO = :FLGBENEFICIARIO'
      'AND    FLGTIPO         <> '#39'I'#39
      'ORDER BY ORDEM, DESCRICAO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updInfBanco
    ValidateWithMask = True
    Left = 627
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
        Value = '45'
      end
      item
        DataType = ftInteger
        Name = 'FLGATIVO'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'FLGMANTIDO'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'FLGMANTPARC'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'FLGASSISTIDO'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'FLGBENEFICIARIO'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object dsInfBanco: TwwDataSource
    DataSet = qryInfBanco
    Left = 628
    Top = 271
  end
  object updInfBanco: TUpdateSQL
    Left = 628
    Top = 278
  end
  object qryPreviaMigra: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'IDPESSJUR,'
      'IDPLANOPREV,'
      'IDPESSOA,'
      'SEQPROPOSTA,'
      'IDPLANODEST,'
      'CODCAMPOMIGRA,'
      'VALORAMIGRAR,'
      'IDEVENTOGERADOR,'
      
        #39'                                                            '#39' A' +
        'S DESCRICAO'
      'FROM PREVIAMIGRAPLANO'
      'WHERE  IDPESSOA = -1'
      ' '
      ' ')
    UpdateObject = updPreviaMigra
    ValidateWithMask = True
    Left = 516
    Top = 142
  end
  object dsPreviaMigra: TwwDataSource
    DataSet = qryPreviaMigra
    Left = 517
    Top = 157
  end
  object updPreviaMigra: TUpdateSQL
    ModifySQL.Strings = (
      'update PREVIAMIGRAPLANO'
      'set'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPESSOA = :IDPESSOA,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  IDPLANODEST = :IDPLANODEST,'
      '  CODCAMPOMIGRA = :CODCAMPOMIGRA,'
      '  VALORAMIGRAR = :VALORAMIGRAR'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPLANODEST = :OLD_IDPLANODEST and'
      '  CODCAMPOMIGRA = :OLD_CODCAMPOMIGRA')
    InsertSQL.Strings = (
      'insert into PREVIAMIGRAPLANO'
      '  (IDPESSJUR, IDPLANOPREV, IDPESSOA, SEQPROPOSTA, IDPLANODEST, '
      'CODCAMPOMIGRA, VALORAMIGRAR, IDEVENTOGERADOR)'
      'values'
      
        '  (:IDPESSJUR, :IDPLANOPREV, :IDPESSOA, :SEQPROPOSTA, :IDPLANODE' +
        'ST,'
      ':CODCAMPOMIGRA, :VALORAMIGRAR, :IDEVENTOGERADOR)'
      ' ')
    DeleteSQL.Strings = (
      'delete from PREVIAMIGRAPLANO'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPLANODEST = :OLD_IDPLANODEST and'
      '  CODCAMPOMIGRA = :OLD_CODCAMPOMIGRA')
    Left = 514
    Top = 170
  end
end
