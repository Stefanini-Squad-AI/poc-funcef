inherited FrmSimulacaoEnquadramento: TFrmSimulacaoEnquadramento
  Left = 131
  Top = 167
  HelpContext = 4520002
  Caption = 'Processamento de Cálculos Retroativos'
  ClientHeight = 425
  ClientWidth = 779
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 779
    Height = 386
    object pnlEtapas: TPanel
      Left = 1
      Top = 1
      Width = 157
      Height = 384
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'pnlEtapas'
      TabOrder = 0
      object TwCons: TTreeWzd
        Left = 0
        Top = 0
        Width = 160
        Height = 384
        Align = alLeft
        Color = clGray
        BevelInner = bvLowered
        BevelWidth = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Etapa.Caption.Strings = (
          'Selecionar participante'
          'Informações para o cálculo'
          'Demonstrativo de resultado')
        Etapa.Forma = stRoundSquare
        Etapa.LinhaWidth = 1
        Etapa.Top = 20
        Etapa.Espaco = 15
        Etapa.Quantidade = 3
        Etapa.BorderWidth = 1
        Etapa.Left = 10
        Etapa.Identacao = 31
        Etapa.Height = 40
        Etapa.Width = 20
        Etapa.BoderColor = clNavy
        Etapa.BrushColor = clWhite
        Etapa.Imagem.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777744777777777777746647777777777746666477777777746666664777
          77774666E66664777777666E7E6664777777E6E777E6664777777E77777E6664
          777777777777E6664777777777777E6664777777777777E6664777777777777E
          6664777777777777E6647777777777777E6677777777777777E7}
        Etapa.Pos = 1
      end
      object BtnAnterior: TBitBtn
        Tag = 8
        Left = 7
        Top = 317
        Width = 71
        Height = 25
        Caption = 'Anteriror'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = BtnAnteriorClick
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
      object BtnProximo: TBitBtn
        Tag = 9
        Left = 82
        Top = 317
        Width = 71
        Height = 25
        Caption = 'Próximo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = BtnProximoClick
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
        NumGlyphs = 2
      end
      object BtnEncerra: TBitBtn
        Left = 7
        Top = 351
        Width = 71
        Height = 25
        Caption = 'Encerra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = bbtnSairClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88887666666666088888788888888878F887E668866666
          608887F88FFF888887F887E6FFF8666660888788777FF888878F7E66FFFF8666
          66087F887777FF88887F7E66FFFFF86666087F8877777FF8887F7E66FF8FFF86
          66087F8877F777FF887F7E66FF86FFF866087F8877F8777F887F7E66FF666FF8
          660878F87788877FF87887E6666666FF608887F88888887787F887E666666666
          6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
      object BtnCancela: TBitBtn
        Left = 82
        Top = 351
        Width = 71
        Height = 25
        Caption = 'Cancela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = BtnCancelaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
    end
    object pnlFundoRetro: TPanel
      Left = 158
      Top = 1
      Width = 620
      Height = 384
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Label29: TLabel
        Left = 3
        Top = 471
        Width = 46
        Height = 13
        Caption = 'Label29'
      end
      object pnlTitulo: TPanel
        Left = 0
        Top = 0
        Width = 620
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        Caption = 
          'Simulação de enquadramento - Matrícula : xxxx - Data : dd/mm/aaa' +
          'a'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object PgCtrlEtapa: TPageControl
        Left = 0
        Top = 25
        Width = 620
        Height = 359
        ActivePage = TbsSelecao
        Align = alClient
        HotTrack = True
        TabOrder = 1
        OnChange = PgCtrlEtapaChange
        object TbsSelecao: TTabSheet
          Caption = 'Seleção do participante'
          ImageIndex = 5
          object Label4: TLabel
            Left = 38
            Top = 18
            Width = 69
            Height = 13
            Caption = 'Participante'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 38
            Top = 63
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 293
            Top = 63
            Width = 117
            Height = 13
            Caption = 'Plano previdenciário'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 38
            Top = 151
            Width = 99
            Height = 13
            Caption = 'Número processo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 37
            Top = 199
            Width = 56
            Height = 13
            Caption = 'Benefício'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 294
            Top = 151
            Width = 22
            Height = 13
            Caption = 'DIB'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 38
            Top = 261
            Width = 207
            Height = 13
            Caption = 'Regra de cálculo do enquadramento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 38
            Top = 107
            Width = 55
            Height = 13
            Caption = 'Matrícula'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 293
            Top = 107
            Width = 224
            Height = 13
            Caption = 'Situação atual na fundação (Categoria)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel1: TBevel
            Left = 39
            Top = 254
            Width = 529
            Height = 2
          end
          object bbtnProcurar: TBitBtn
            Left = 483
            Top = 25
            Width = 85
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
            TabOrder = 0
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
          object lblParticipante: TStaticText
            Left = 38
            Top = 34
            Width = 431
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 1
          end
          object lblPatro: TStaticText
            Left = 38
            Top = 77
            Width = 242
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 2
          end
          object lblPlano: TStaticText
            Left = 293
            Top = 77
            Width = 275
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 3
          end
          object lblNUmProc: TStaticText
            Left = 38
            Top = 165
            Width = 162
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 4
          end
          object lblDIB: TStaticText
            Left = 294
            Top = 165
            Width = 116
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 5
          end
          object lblBeneficio: TStaticText
            Left = 37
            Top = 213
            Width = 531
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 6
          end
          object lblNomeRegraSimulacao: TStaticText
            Left = 38
            Top = 276
            Width = 530
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 7
          end
          object lblMatricula: TStaticText
            Left = 38
            Top = 121
            Width = 162
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 8
          end
          object lblSituacaoAtual: TStaticText
            Left = 293
            Top = 121
            Width = 275
            Height = 20
            AutoSize = False
            BorderStyle = sbsSunken
            Color = cl3DLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 9
          end
        end
        object TbsInfomacoesCalculo: TTabSheet
          Caption = 'Informações para cálculo'
          ImageIndex = 9
          object GroupBox3: TGroupBox
            Left = 0
            Top = 0
            Width = 612
            Height = 54
            Align = alTop
            Anchors = [akBottom]
            TabOrder = 0
            object Label19: TLabel
              Left = 11
              Top = 23
              Width = 91
              Height = 13
              Caption = 'Calcular do mês'
            end
            object Label20: TLabel
              Left = 208
              Top = 23
              Width = 60
              Height = 13
              Caption = 'até o mês '
            end
            object edAnoMesIni: TMaskEdit
              Left = 130
              Top = 15
              Width = 67
              Height = 21
              EditMask = '!9999/99;1;_'
              MaxLength = 7
              TabOrder = 0
              Text = '    /  '
            end
            object edAnoMesFim: TMaskEdit
              Left = 284
              Top = 15
              Width = 67
              Height = 21
              EditMask = '!9999/99;1;_'
              MaxLength = 7
              TabOrder = 1
              Text = '    /  '
            end
          end
          object PnlFundoCadastros: TPanel
            Left = 0
            Top = 54
            Width = 612
            Height = 277
            Align = alClient
            TabOrder = 1
            object PgCtrlDetalhe: TPageControl
              Left = 1
              Top = 1
              Width = 520
              Height = 275
              ActivePage = TbsATS
              Align = alClient
              TabOrder = 0
              OnChange = PgCtrlDetalheChange
              object TbsCargo: TTabSheet
                Caption = 'Cargos'
                object DbGrdCargo: TwwDBGrid
                  Left = 0
                  Top = 31
                  Width = 512
                  Height = 216
                  Selected.Strings = (
                    'CODIGO'#9'12'#9'Código'
                    'CARGO'#9'40'#9'Cargo'
                    'DATAINICIO'#9'12'#9'Data de ~Início'
                    'DATAFINAL'#9'12'#9'Data de ~Término'
                    'DESCMODO'#9'14'#9'Modo'
                    'DESCORIGEM'#9'20'#9'Origem'
                    'DESCSITCADASTRADA'#9'10'#9'Situação ~Cadastrada'
                    'DESCSIT'#9'10'#9'Situação na~Época'#9'F')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = DsEvolFuncPrev
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  KeyOptions = []
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                  ParentFont = False
                  TabOrder = 1
                  TitleAlignment = taLeftJustify
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -9
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = [fsBold]
                  TitleLines = 2
                  TitleButtons = False
                  OnCalcCellColors = DbGrdCargoCalcCellColors
                  IndicatorColor = icBlack
                end
                object pnlControlesDet: TPanel
                  Left = 0
                  Top = 31
                  Width = 512
                  Height = 216
                  Align = alClient
                  BevelInner = bvLowered
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label1: TLabel
                    Left = 302
                    Top = 17
                    Width = 83
                    Height = 13
                    Caption = 'Data de Início'
                  end
                  object lblTituloTipo: TLabel
                    Left = 8
                    Top = 17
                    Width = 34
                    Height = 13
                    Caption = 'Cargo'
                  end
                  object Label5: TLabel
                    Left = 8
                    Top = 65
                    Width = 32
                    Height = 13
                    Caption = 'Modo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label33: TLabel
                    Left = 302
                    Top = 65
                    Width = 117
                    Height = 13
                    Caption = 'Situação (Categoria)'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object dbDataInicio: TCMDateTimePicker
                    Left = 302
                    Top = 32
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAINICIO'
                    DataSource = DsEvolFuncPrev
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
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = True
                    TabOrder = 0
                  end
                  object dblkpcmbModoCargo: TwwDBLookupCombo
                    Left = 8
                    Top = 80
                    Width = 265
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'21'#9'Modo'#9'F')
                    DataField = 'MODOFUNCAO'
                    DataSource = DsEvolFuncPrev
                    LookupTable = CdsModoCargo
                    LookupField = 'CODIGO'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dblkpcmbSitCargo: TwwDBLookupCombo
                    Left = 302
                    Top = 80
                    Width = 171
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'15'#9'Descrição'#9'F')
                    DataField = 'FLGSITPART'
                    DataSource = DsEvolFuncPrev
                    LookupTable = CdsSituacao
                    LookupField = 'FLGSITPART'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dblkpcmbCargoxNivel: TwwDBLookupCombo
                    Left = 8
                    Top = 32
                    Width = 265
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'TITULO'#9'40'#9'Título'#9'F')
                    DataField = 'IDCARGOEXT'
                    DataSource = DsEvolFuncPrev
                    LookupTable = CdsCargo
                    LookupField = 'IDCARGOEXT'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 3
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                end
                object Dock973: TDock97
                  Left = 0
                  Top = 0
                  Width = 512
                  Height = 31
                  AllowDrag = False
                  BoundLines = [blTop, blBottom, blLeft, blRight]
                  object Shape5: TShape
                    Left = 184
                    Top = 9
                    Width = 16
                    Height = 12
                    Brush.Color = 13303807
                  end
                  object Label47: TLabel
                    Left = 204
                    Top = 9
                    Width = 54
                    Height = 15
                    AutoSize = False
                    Caption = 'Assistido'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Shape1: TShape
                    Left = 108
                    Top = 9
                    Width = 17
                    Height = 12
                    Brush.Color = clWindow
                  end
                  object Label48: TLabel
                    Left = 128
                    Top = 9
                    Width = 56
                    Height = 15
                    AutoSize = False
                    Caption = 'Ativo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object tb97BotoesDetalhe: TToolbar97
                    Left = 1
                    Top = 0
                    Caption = 'tb97BotoesDetalhe'
                    DockPos = 1
                    TabOrder = 0
                    object SbtnInsCargo: TToolbarButton97
                      Left = 0
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Inserir'
                      AllowAllUp = True
                      GroupIndex = 2
                      ImageIndex = 0
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnInsCargoClick
                    end
                    object SbtnAltCargo: TToolbarButton97
                      Left = 25
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Alterar'
                      AllowAllUp = True
                      GroupIndex = 2
                      ImageIndex = 1
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnAltCargoClick
                    end
                    object SbtnExcCargo: TToolbarButton97
                      Left = 50
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Excluir'
                      AllowAllUp = True
                      ImageIndex = 2
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnExcCargoClick
                    end
                  end
                end
              end
              object TbsFuncao: TTabSheet
                Caption = 'Funções'
                object DbGrdFuncao: TwwDBGrid
                  Left = 0
                  Top = 31
                  Width = 512
                  Height = 216
                  Selected.Strings = (
                    'CODIGO'#9'15'#9'Código'#9'F'
                    'GRUPO'#9'15'#9'Grupo'#9'F'
                    'FUNCAO'#9'40'#9'Função'#9'F'
                    'DATAINICIO'#9'12'#9'Data de ~Início'#9'F'
                    'DATAFINAL'#9'12'#9'Data de ~Término'#9'F'
                    'PERCFUNCAO'#9'11'#9'Percentual%'#9'F'
                    'DESCMODO'#9'21'#9'Modo'#9'F'
                    'DESCORIGEM'#9'23'#9'Origem'#9'F'
                    'DESCSITCADASTRADA'#9'10'#9'Situação ~Cadastrada'#9'F'
                    'DESCSIT'#9'10'#9'Situação na ~Época'#9'F')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = DsEvolFuncPrev
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  KeyOptions = []
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                  ParentFont = False
                  TabOrder = 1
                  TitleAlignment = taLeftJustify
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -9
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = [fsBold]
                  TitleLines = 2
                  TitleButtons = False
                  OnCalcCellColors = DbGrdCargoCalcCellColors
                  IndicatorColor = icBlack
                end
                object pnlControlesFuncao: TPanel
                  Left = 0
                  Top = 31
                  Width = 512
                  Height = 216
                  Align = alClient
                  BevelOuter = bvLowered
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  object Label2: TLabel
                    Left = 10
                    Top = 72
                    Width = 83
                    Height = 13
                    Caption = 'Data de Início'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label6: TLabel
                    Left = 10
                    Top = 25
                    Width = 43
                    Height = 13
                    Caption = 'Função'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label18: TLabel
                    Left = 10
                    Top = 118
                    Width = 32
                    Height = 13
                    Caption = 'Modo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label7: TLabel
                    Left = 135
                    Top = 72
                    Width = 59
                    Height = 13
                    Caption = 'Data Final'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label13: TLabel
                    Left = 293
                    Top = 30
                    Width = 62
                    Height = 13
                    Caption = 'Percentual'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label34: TLabel
                    Left = 293
                    Top = 118
                    Width = 117
                    Height = 13
                    Caption = 'Situação (Categoria)'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object dblkpcmbFuncao: TwwDBLookupCombo
                    Left = 10
                    Top = 40
                    Width = 245
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'CODIGO'#9'15'#9'Código'
                      'TITULO'#9'40'#9'Funções'#9'F')
                    DataField = 'IDFUNCAO'
                    DataSource = DsEvolFuncPrev
                    LookupTable = CdsFuncao
                    LookupField = 'IDCARGOEXT'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dbDataInicioFuncao: TCMDateTimePicker
                    Left = 10
                    Top = 87
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAINICIO'
                    DataSource = DsEvolFuncPrev
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
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = True
                    TabOrder = 2
                  end
                  object dbDataFinalFuncao: TCMDateTimePicker
                    Left = 135
                    Top = 87
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAFINAL'
                    DataSource = DsEvolFuncPrev
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
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = True
                    TabOrder = 3
                  end
                  object dblkpcmbModoFuncao: TwwDBLookupCombo
                    Left = 10
                    Top = 133
                    Width = 245
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'21'#9'Modo'#9'F')
                    DataField = 'MODOFUNCAO'
                    DataSource = DsEvolFuncPrev
                    LookupTable = CdsModoFuncao
                    LookupField = 'CODIGO'
                    Options = [loTitles]
                    TabOrder = 4
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dbEdPercFuncao: TwwDBEdit
                    Left = 293
                    Top = 45
                    Width = 100
                    Height = 21
                    DataField = 'PERCFUNCAO'
                    DataSource = DsEvolFuncPrev
                    TabOrder = 1
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                  object wwDBLookupCombo5: TwwDBLookupCombo
                    Left = 293
                    Top = 133
                    Width = 171
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'15'#9'Descrição'#9'F')
                    DataField = 'FLGSITPART'
                    DataSource = DsEvolFuncPrev
                    LookupTable = CdsSituacao
                    LookupField = 'FLGSITPART'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 5
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                end
                object Dock972: TDock97
                  Left = 0
                  Top = 0
                  Width = 512
                  Height = 31
                  AllowDrag = False
                  BoundLines = [blTop, blBottom, blLeft, blRight]
                  object Shape2: TShape
                    Left = 184
                    Top = 9
                    Width = 16
                    Height = 12
                    Brush.Color = 13303807
                  end
                  object Label49: TLabel
                    Left = 204
                    Top = 9
                    Width = 54
                    Height = 15
                    AutoSize = False
                    Caption = 'Assistido'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Shape3: TShape
                    Left = 108
                    Top = 9
                    Width = 17
                    Height = 12
                    Brush.Color = clWindow
                  end
                  object Label50: TLabel
                    Left = 128
                    Top = 9
                    Width = 56
                    Height = 15
                    AutoSize = False
                    Caption = 'Ativo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Toolbar971: TToolbar97
                    Left = 1
                    Top = 0
                    Caption = 'tb97BotoesDetalhe'
                    DockPos = 1
                    TabOrder = 0
                    object SbtnInsFuncao: TToolbarButton97
                      Left = 0
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Inserir'
                      AllowAllUp = True
                      GroupIndex = 2
                      ImageIndex = 0
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnInsCargoClick
                    end
                    object SbtnAltFuncao: TToolbarButton97
                      Left = 25
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Alterar'
                      AllowAllUp = True
                      GroupIndex = 2
                      ImageIndex = 1
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnAltCargoClick
                    end
                    object SbtnExcFuncao: TToolbarButton97
                      Left = 50
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Excluir'
                      AllowAllUp = True
                      ImageIndex = 2
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnExcCargoClick
                    end
                  end
                end
              end
              object TbsAdicCompens: TTabSheet
                Caption = 'Adic. Compensatório'
                ImageIndex = 6
                object DbGrdAdicCompens: TwwDBGrid
                  Left = 0
                  Top = 31
                  Width = 512
                  Height = 216
                  Selected.Strings = (
                    'CODIGO'#9'15'#9'Código'
                    'GRUPO'#9'15'#9'Grupo'
                    'FUNCAO'#9'40'#9'Função Base'
                    'DATAINICIO'#9'12'#9'Data de ~Início'
                    'DATAFINAL'#9'12'#9'Data de ~Término'
                    'PERC1AC'#9'10'#9'Percentual (%)'
                    'DESCORIGEM'#9'23'#9'Origem'
                    'DESCSITCADASTRADA'#9'10'#9'Situação ~Cadastrada'
                    'DESCSIT'#9'10'#9'Situação na ~Época'#9'F')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = DsEvolFuncPrev
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  KeyOptions = []
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                  ParentFont = False
                  TabOrder = 1
                  TitleAlignment = taLeftJustify
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -9
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = [fsBold]
                  TitleLines = 2
                  TitleButtons = False
                  OnCalcCellColors = DbGrdCargoCalcCellColors
                  IndicatorColor = icBlack
                end
                object pnlAdicCompensatorio: TPanel
                  Left = 0
                  Top = 31
                  Width = 512
                  Height = 216
                  Align = alClient
                  BevelOuter = bvLowered
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  object Label15: TLabel
                    Left = 274
                    Top = 17
                    Width = 83
                    Height = 13
                    Caption = 'Data de Início'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label17: TLabel
                    Left = 10
                    Top = 17
                    Width = 236
                    Height = 13
                    Caption = 'Função Base do Adicional Compensatório'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label21: TLabel
                    Left = 402
                    Top = 17
                    Width = 59
                    Height = 13
                    Caption = 'Data Final'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label22: TLabel
                    Left = 11
                    Top = 65
                    Width = 62
                    Height = 13
                    Caption = 'Percentual'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label35: TLabel
                    Left = 274
                    Top = 65
                    Width = 117
                    Height = 13
                    Caption = 'Situação (Categoria)'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label40: TLabel
                    Left = 139
                    Top = 65
                    Width = 78
                    Height = 13
                    Caption = '2º Percentual'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object dblkpcmbFuncaoAdicCompens: TwwDBLookupCombo
                    Left = 10
                    Top = 32
                    Width = 246
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'CODIGO'#9'15'#9'Código'
                      'TITULO'#9'40'#9'Funções'#9'F')
                    DataField = 'IDFUNCAO'
                    DataSource = DsEvolFuncPrev
                    LookupTable = CdsFuncao
                    LookupField = 'IDCARGOEXT'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dtInicioAdicCompens: TCMDateTimePicker
                    Left = 274
                    Top = 32
                    Width = 101
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAINICIO'
                    DataSource = DsEvolFuncPrev
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
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = True
                    TabOrder = 1
                  end
                  object dtFimAdicCompens: TCMDateTimePicker
                    Left = 402
                    Top = 32
                    Width = 101
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAFINAL'
                    DataSource = DsEvolFuncPrev
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
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = True
                    TabOrder = 2
                  end
                  object dbEdPercAdicComp1: TwwDBEdit
                    Left = 11
                    Top = 80
                    Width = 82
                    Height = 21
                    DataField = 'PERC1AC'
                    DataSource = DsEvolFuncPrev
                    TabOrder = 3
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                  object dblkpcmbSitPartAdicCompens: TwwDBLookupCombo
                    Left = 274
                    Top = 80
                    Width = 229
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'15'#9'Descrição'#9'F')
                    DataField = 'FLGSITPART'
                    DataSource = DsEvolFuncPrev
                    LookupTable = CdsSituacao
                    LookupField = 'FLGSITPART'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 5
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dbEdPercAdicComp2: TwwDBEdit
                    Left = 139
                    Top = 80
                    Width = 86
                    Height = 21
                    DataField = 'PERC2AC'
                    DataSource = DsEvolFuncPrev
                    TabOrder = 4
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                end
                object Dock975: TDock97
                  Left = 0
                  Top = 0
                  Width = 512
                  Height = 31
                  AllowDrag = False
                  BoundLines = [blTop, blBottom, blLeft, blRight]
                  object Shape4: TShape
                    Left = 184
                    Top = 9
                    Width = 16
                    Height = 12
                    Brush.Color = 13303807
                  end
                  object Label51: TLabel
                    Left = 204
                    Top = 9
                    Width = 54
                    Height = 15
                    AutoSize = False
                    Caption = 'Assistido'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Shape6: TShape
                    Left = 108
                    Top = 9
                    Width = 17
                    Height = 12
                    Brush.Color = clWindow
                  end
                  object Label52: TLabel
                    Left = 128
                    Top = 9
                    Width = 56
                    Height = 15
                    AutoSize = False
                    Caption = 'Ativo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Toolbar972: TToolbar97
                    Left = 1
                    Top = 0
                    Caption = 'tb97BotoesDetalhe'
                    DockPos = 1
                    TabOrder = 0
                    object SbtnInsAdicComp: TToolbarButton97
                      Left = 0
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Inserir'
                      AllowAllUp = True
                      GroupIndex = 2
                      ImageIndex = 0
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnInsCargoClick
                    end
                    object SbtnAltAdicComp: TToolbarButton97
                      Left = 25
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Alterar'
                      AllowAllUp = True
                      GroupIndex = 2
                      ImageIndex = 1
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnAltCargoClick
                    end
                    object SbtnExcAdicComp: TToolbarButton97
                      Left = 50
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Excluir'
                      AllowAllUp = True
                      ImageIndex = 2
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnExcCargoClick
                    end
                  end
                end
              end
              object TbsATS: TTabSheet
                Caption = 'Adic. por Tempo de Serviço'
                object DbGrdATS: TwwDBGrid
                  Left = 0
                  Top = 31
                  Width = 512
                  Height = 216
                  Selected.Strings = (
                    'DATAINICIO'#9'15'#9'Data de ~Início'
                    'DATAFINAL'#9'15'#9'Data de ~Término'
                    'PERCATS'#9'20'#9'Percentual (%)'#9'F'
                    'DESCORIGEM'#9'30'#9'Origem'
                    'DESCSITCADASTRADA'#9'10'#9'Situação ~Cadastrada'#9'F'
                    'DESCSIT'#9'10'#9'Situação na ~Época'#9'F')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = DsEvolFuncPrev
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  KeyOptions = []
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                  ParentFont = False
                  TabOrder = 0
                  TitleAlignment = taLeftJustify
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -9
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = [fsBold]
                  TitleLines = 2
                  TitleButtons = False
                  UseTFields = False
                  OnCalcCellColors = DbGrdCargoCalcCellColors
                  IndicatorColor = icBlack
                end
                object pnlATS: TPanel
                  Left = 0
                  Top = 31
                  Width = 512
                  Height = 216
                  Align = alClient
                  BevelInner = bvLowered
                  BevelOuter = bvNone
                  TabOrder = 1
                  object Label23: TLabel
                    Left = 9
                    Top = 23
                    Width = 83
                    Height = 13
                    Caption = 'Data de Início'
                  end
                  object Label24: TLabel
                    Left = 174
                    Top = 23
                    Width = 95
                    Height = 13
                    Caption = 'Data de Término'
                  end
                  object Label25: TLabel
                    Left = 9
                    Top = 71
                    Width = 83
                    Height = 13
                    Caption = 'Percentual (%)'
                  end
                  object spbtnCalcPercATS: TSpeedButton
                    Left = 134
                    Top = 85
                    Width = 23
                    Height = 22
                    Hint = 'Calcular Percentual do Adicional'
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
                      73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
                      0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
                      0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                      0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                      0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
                      0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
                      0333337F777777737F333308888888880333337F333333337F33330888888888
                      03333373FFFFFFFF733333700000000073333337777777773333}
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    Visible = False
                  end
                  object Label36: TLabel
                    Left = 175
                    Top = 71
                    Width = 117
                    Height = 13
                    Caption = 'Situação (Categoria)'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object dbDataInicioATS: TCMDateTimePicker
                    Left = 9
                    Top = 38
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAINICIO'
                    DataSource = DsEvolFuncPrev
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
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = True
                    TabOrder = 0
                  end
                  object dbDataFinalATS: TCMDateTimePicker
                    Left = 174
                    Top = 38
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAFINAL'
                    DataSource = DsEvolFuncPrev
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
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = True
                    TabOrder = 1
                  end
                  object dbEdPercATS: TDBEdit2
                    Left = 9
                    Top = 86
                    Width = 121
                    Height = 21
                    DataField = 'PERCATS'
                    DataSource = DsEvolFuncPrev
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    MaxLength = 15
                    ParentFont = False
                    TabOrder = 2
                    IntDigits = 10
                    DecDigits = 5
                  end
                  object wwDBLookupCombo1: TwwDBLookupCombo
                    Left = 175
                    Top = 86
                    Width = 229
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'15'#9'Descrição'#9'F')
                    DataField = 'FLGSITPART'
                    DataSource = DsEvolFuncPrev
                    LookupTable = CdsSituacao
                    LookupField = 'FLGSITPART'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 3
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                end
                object Dock976: TDock97
                  Left = 0
                  Top = 0
                  Width = 512
                  Height = 31
                  AllowDrag = False
                  BoundLines = [blTop, blBottom, blLeft, blRight]
                  object Shape7: TShape
                    Left = 184
                    Top = 9
                    Width = 16
                    Height = 12
                    Brush.Color = 13303807
                  end
                  object Label53: TLabel
                    Left = 204
                    Top = 9
                    Width = 54
                    Height = 15
                    AutoSize = False
                    Caption = 'Assistido'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Shape8: TShape
                    Left = 108
                    Top = 9
                    Width = 17
                    Height = 12
                    Brush.Color = clWindow
                  end
                  object Label54: TLabel
                    Left = 128
                    Top = 9
                    Width = 56
                    Height = 15
                    AutoSize = False
                    Caption = 'Ativo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Toolbar973: TToolbar97
                    Left = 1
                    Top = 0
                    Caption = 'tb97BotoesDetalhe'
                    DockPos = 1
                    TabOrder = 0
                    object SbtnInsATS: TToolbarButton97
                      Left = 0
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Inserir'
                      AllowAllUp = True
                      GroupIndex = 2
                      ImageIndex = 0
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnInsCargoClick
                    end
                    object SbtnAltATS: TToolbarButton97
                      Left = 25
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Alterar'
                      AllowAllUp = True
                      GroupIndex = 2
                      ImageIndex = 1
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnAltCargoClick
                    end
                    object SbtnExcATS: TToolbarButton97
                      Left = 50
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Excluir'
                      AllowAllUp = True
                      ImageIndex = 2
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnExcCargoClick
                    end
                  end
                end
              end
              object TbsAdicInsalub: TTabSheet
                Caption = 'Adic. Insalubridade'
                ImageIndex = 4
                object DbGrdAdicInsalub: TwwDBGrid
                  Left = 0
                  Top = 31
                  Width = 512
                  Height = 216
                  Selected.Strings = (
                    'DATAINICIO'#9'15'#9'Data de ~Início'
                    'DATAFINAL'#9'15'#9'Data de ~Término'
                    'PERCINSALUB'#9'20'#9'Percentual (%)'
                    'DESCORIGEM'#9'30'#9'Origem'
                    'DESCSITCADASTRADA'#9'10'#9'Situação ~Cadastrada'
                    'DESCSIT'#9'10'#9'Situação na ~época')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = DsEvolFuncPrev
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  KeyOptions = []
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                  ParentFont = False
                  TabOrder = 0
                  TitleAlignment = taLeftJustify
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -9
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = [fsBold]
                  TitleLines = 2
                  TitleButtons = False
                  OnCalcCellColors = DbGrdCargoCalcCellColors
                  IndicatorColor = icBlack
                end
                object Panel1: TPanel
                  Left = 0
                  Top = 31
                  Width = 512
                  Height = 216
                  Align = alClient
                  BevelInner = bvLowered
                  BevelOuter = bvNone
                  TabOrder = 1
                  object Label26: TLabel
                    Left = 9
                    Top = 23
                    Width = 83
                    Height = 13
                    Caption = 'Data de Início'
                  end
                  object Label27: TLabel
                    Left = 175
                    Top = 23
                    Width = 95
                    Height = 13
                    Caption = 'Data de Término'
                  end
                  object Label28: TLabel
                    Left = 9
                    Top = 71
                    Width = 83
                    Height = 13
                    Caption = 'Percentual (%)'
                  end
                  object SpeedButton1: TSpeedButton
                    Left = 133
                    Top = 85
                    Width = 23
                    Height = 22
                    Hint = 'Calcular Percentual do Adicional'
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
                      73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
                      0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
                      0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                      0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                      0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
                      0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
                      0333337F777777737F333308888888880333337F333333337F33330888888888
                      03333373FFFFFFFF733333700000000073333337777777773333}
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    Visible = False
                  end
                  object Label37: TLabel
                    Left = 175
                    Top = 71
                    Width = 117
                    Height = 13
                    Caption = 'Situação (Categoria)'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object dtInicioAdicInsalub: TCMDateTimePicker
                    Left = 9
                    Top = 38
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAINICIO'
                    DataSource = DsEvolFuncPrev
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
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = True
                    TabOrder = 0
                  end
                  object dtFimAdicInsalub: TCMDateTimePicker
                    Left = 175
                    Top = 38
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAFINAL'
                    DataSource = DsEvolFuncPrev
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
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = True
                    TabOrder = 1
                  end
                  object dbEdPercAdicInsalub: TDBEdit2
                    Left = 9
                    Top = 86
                    Width = 121
                    Height = 21
                    DataField = 'PERCINSALUB'
                    DataSource = DsEvolFuncPrev
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    MaxLength = 15
                    ParentFont = False
                    TabOrder = 2
                    IntDigits = 10
                    DecDigits = 5
                  end
                  object wwDBLookupCombo2: TwwDBLookupCombo
                    Left = 175
                    Top = 86
                    Width = 229
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'15'#9'Descrição'#9'F')
                    DataField = 'FLGSITPART'
                    DataSource = DsEvolFuncPrev
                    LookupTable = CdsSituacao
                    LookupField = 'FLGSITPART'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 3
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                end
                object Dock977: TDock97
                  Left = 0
                  Top = 0
                  Width = 512
                  Height = 31
                  AllowDrag = False
                  BoundLines = [blTop, blBottom, blLeft, blRight]
                  object Shape9: TShape
                    Left = 184
                    Top = 9
                    Width = 16
                    Height = 12
                    Brush.Color = 13303807
                  end
                  object Label55: TLabel
                    Left = 204
                    Top = 9
                    Width = 54
                    Height = 15
                    AutoSize = False
                    Caption = 'Assistido'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Shape10: TShape
                    Left = 108
                    Top = 9
                    Width = 17
                    Height = 12
                    Brush.Color = clWindow
                  end
                  object Label56: TLabel
                    Left = 128
                    Top = 9
                    Width = 56
                    Height = 15
                    AutoSize = False
                    Caption = 'Ativo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Toolbar974: TToolbar97
                    Left = 1
                    Top = 0
                    Caption = 'tb97BotoesDetalhe'
                    DockPos = 1
                    TabOrder = 0
                    object SbtnInsAdicIns: TToolbarButton97
                      Left = 0
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Inserir'
                      AllowAllUp = True
                      GroupIndex = 2
                      ImageIndex = 0
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnInsCargoClick
                    end
                    object SbtnAltAdicIns: TToolbarButton97
                      Left = 25
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Alterar'
                      AllowAllUp = True
                      GroupIndex = 2
                      ImageIndex = 1
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnAltCargoClick
                    end
                    object SbtnExcAdicIns: TToolbarButton97
                      Left = 50
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Excluir'
                      AllowAllUp = True
                      ImageIndex = 2
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnExcCargoClick
                    end
                  end
                end
              end
              object TbsAdicNoturno: TTabSheet
                Caption = 'Adic. Noturno'
                ImageIndex = 7
                object DbGrdAdicNoturno: TwwDBGrid
                  Left = 0
                  Top = 31
                  Width = 512
                  Height = 216
                  Selected.Strings = (
                    'DATAINICIO'#9'15'#9'Data de ~Início'
                    'DATAFINAL'#9'15'#9'Data de ~Término'
                    'QTDEMINUTOS'#9'10'#9'Qtde. Minutos'
                    'PERCADNOT'#9'10'#9'Percentual (%)'
                    'DESCORIGEM'#9'30'#9'Origem'
                    'DESCSITCADASTRADA'#9'10'#9'Situação ~Cadastrada'
                    'DESCSIT'#9'10'#9'Situação na ~Época')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = DsEvolFuncPrev
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  KeyOptions = []
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                  ParentFont = False
                  TabOrder = 0
                  TitleAlignment = taLeftJustify
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -9
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = [fsBold]
                  TitleLines = 2
                  TitleButtons = False
                  OnCalcCellColors = DbGrdCargoCalcCellColors
                  IndicatorColor = icBlack
                end
                object pnlAdicNoturno: TPanel
                  Left = 0
                  Top = 31
                  Width = 512
                  Height = 216
                  Align = alClient
                  BevelInner = bvLowered
                  BevelOuter = bvNone
                  TabOrder = 1
                  object Label30: TLabel
                    Left = 9
                    Top = 23
                    Width = 83
                    Height = 13
                    Caption = 'Data de Início'
                  end
                  object Label31: TLabel
                    Left = 159
                    Top = 23
                    Width = 95
                    Height = 13
                    Caption = 'Data de Término'
                  end
                  object Label32: TLabel
                    Left = 159
                    Top = 71
                    Width = 83
                    Height = 13
                    Caption = 'Percentual (%)'
                  end
                  object Label38: TLabel
                    Left = 12
                    Top = 71
                    Width = 80
                    Height = 13
                    Caption = 'Qtde. Minutos'
                  end
                  object Label39: TLabel
                    Left = 511
                    Top = 15
                    Width = 117
                    Height = 13
                    Caption = 'Situação (Categoria)'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object dtInicioAdicNoturno: TCMDateTimePicker
                    Left = 9
                    Top = 38
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAINICIO'
                    DataSource = DsEvolFuncPrev
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
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = True
                    TabOrder = 0
                  end
                  object dtFimAdicNoturno: TCMDateTimePicker
                    Left = 159
                    Top = 38
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAFINAL'
                    DataSource = DsEvolFuncPrev
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
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = True
                    TabOrder = 1
                  end
                  object dbEdPercAdicNot: TDBEdit2
                    Left = 159
                    Top = 86
                    Width = 121
                    Height = 21
                    DataField = 'PERCADNOT'
                    DataSource = DsEvolFuncPrev
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    MaxLength = 15
                    ParentFont = False
                    TabOrder = 3
                    IntDigits = 10
                    DecDigits = 5
                  end
                  object dbedQtdeMinutos: TDBEdit2
                    Left = 12
                    Top = 86
                    Width = 121
                    Height = 21
                    DataField = 'QTDEMINUTOS'
                    DataSource = DsEvolFuncPrev
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    MaxLength = 15
                    ParentFont = False
                    TabOrder = 2
                    IntDigits = 10
                    DecDigits = 5
                  end
                  object wwDBLookupCombo3: TwwDBLookupCombo
                    Left = 511
                    Top = 30
                    Width = 137
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'21'#9'Modo'#9'F')
                    DataField = 'FLGSITPART'
                    LookupField = 'FLGSITPART'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 4
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                end
                object Dock978: TDock97
                  Left = 0
                  Top = 0
                  Width = 512
                  Height = 31
                  AllowDrag = False
                  BoundLines = [blTop, blBottom, blLeft, blRight]
                  object Shape11: TShape
                    Left = 184
                    Top = 9
                    Width = 16
                    Height = 12
                    Brush.Color = 13303807
                  end
                  object Label57: TLabel
                    Left = 204
                    Top = 9
                    Width = 54
                    Height = 15
                    AutoSize = False
                    Caption = 'Assistido'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Shape12: TShape
                    Left = 108
                    Top = 9
                    Width = 17
                    Height = 12
                    Brush.Color = clWindow
                  end
                  object Label58: TLabel
                    Left = 128
                    Top = 9
                    Width = 56
                    Height = 15
                    AutoSize = False
                    Caption = 'Ativo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Toolbar975: TToolbar97
                    Left = 1
                    Top = 0
                    Caption = 'tb97BotoesDetalhe'
                    DockPos = 1
                    TabOrder = 0
                    object SbtnInsAdicNot: TToolbarButton97
                      Left = 0
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Inserir'
                      AllowAllUp = True
                      GroupIndex = 2
                      ImageIndex = 0
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnInsCargoClick
                    end
                    object SbtnAltAdicNot: TToolbarButton97
                      Left = 25
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Alterar'
                      AllowAllUp = True
                      GroupIndex = 2
                      ImageIndex = 1
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnAltCargoClick
                    end
                    object SbtnExcAdicNot: TToolbarButton97
                      Left = 50
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Excluir'
                      AllowAllUp = True
                      ImageIndex = 2
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnExcCargoClick
                    end
                  end
                end
              end
              object TbsAdicPericul: TTabSheet
                Caption = 'Adic. Periculosidade'
                ImageIndex = 5
                object DbGrdAdicPericul: TwwDBGrid
                  Left = 0
                  Top = 31
                  Width = 512
                  Height = 216
                  Selected.Strings = (
                    'DATAINICIO'#9'15'#9'Data de ~Início'
                    'DATAFINAL'#9'15'#9'Data de ~Término'
                    'PERCPERICUL'#9'20'#9'Percentual (%)'
                    'DESCORIGEM'#9'30'#9'Origem'
                    'DESCSITCADASTRADA'#9'10'#9'Situação ~Cadastrada'
                    'DESCSIT'#9'20'#9'Situação na ~Época')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = DsEvolFuncPrev
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  KeyOptions = []
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                  ParentFont = False
                  TabOrder = 0
                  TitleAlignment = taLeftJustify
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -9
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = [fsBold]
                  TitleLines = 2
                  TitleButtons = False
                  OnCalcCellColors = DbGrdCargoCalcCellColors
                  IndicatorColor = icBlack
                end
                object Panel2: TPanel
                  Left = 0
                  Top = 31
                  Width = 512
                  Height = 216
                  Align = alClient
                  BevelInner = bvLowered
                  BevelOuter = bvNone
                  TabOrder = 1
                  object Label41: TLabel
                    Left = 9
                    Top = 23
                    Width = 83
                    Height = 13
                    Caption = 'Data de Início'
                  end
                  object SpeedButton2: TSpeedButton
                    Left = 133
                    Top = 85
                    Width = 23
                    Height = 22
                    Hint = 'Calcular Percentual do Adicional'
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
                      73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
                      0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
                      0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                      0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                      0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
                      0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
                      0333337F777777737F333308888888880333337F333333337F33330888888888
                      03333373FFFFFFFF733333700000000073333337777777773333}
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    Visible = False
                  end
                  object Label42: TLabel
                    Left = 9
                    Top = 71
                    Width = 83
                    Height = 13
                    Caption = 'Percentual (%)'
                  end
                  object Label43: TLabel
                    Left = 175
                    Top = 71
                    Width = 117
                    Height = 13
                    Caption = 'Situação (Categoria)'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label44: TLabel
                    Left = 175
                    Top = 23
                    Width = 95
                    Height = 13
                    Caption = 'Data de Término'
                  end
                  object CMDateTimePicker2: TCMDateTimePicker
                    Left = 9
                    Top = 38
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAINICIO'
                    DataSource = DsEvolFuncPrev
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
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = True
                    TabOrder = 0
                  end
                  object dbEdPercAdicPeric: TDBEdit2
                    Left = 9
                    Top = 86
                    Width = 121
                    Height = 21
                    DataField = 'PERCINSALUB'
                    DataSource = DsEvolFuncPrev
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    MaxLength = 15
                    ParentFont = False
                    TabOrder = 1
                    IntDigits = 10
                    DecDigits = 5
                  end
                  object wwDBLookupCombo4: TwwDBLookupCombo
                    Left = 175
                    Top = 86
                    Width = 229
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'15'#9'Descrição'#9'F')
                    DataField = 'FLGSITPART'
                    DataSource = DsEvolFuncPrev
                    LookupTable = CdsSituacao
                    LookupField = 'FLGSITPART'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object CMDateTimePicker3: TCMDateTimePicker
                    Left = 175
                    Top = 38
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAFINAL'
                    DataSource = DsEvolFuncPrev
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
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = True
                    TabOrder = 3
                  end
                end
                object Dock979: TDock97
                  Left = 0
                  Top = 0
                  Width = 512
                  Height = 31
                  AllowDrag = False
                  BoundLines = [blTop, blBottom, blLeft, blRight]
                  object Shape13: TShape
                    Left = 184
                    Top = 9
                    Width = 16
                    Height = 12
                    Brush.Color = 13303807
                  end
                  object Label59: TLabel
                    Left = 204
                    Top = 9
                    Width = 54
                    Height = 15
                    AutoSize = False
                    Caption = 'Assistido'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Shape14: TShape
                    Left = 108
                    Top = 9
                    Width = 17
                    Height = 12
                    Brush.Color = clWindow
                  end
                  object Label60: TLabel
                    Left = 128
                    Top = 9
                    Width = 56
                    Height = 15
                    AutoSize = False
                    Caption = 'Ativo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Toolbar976: TToolbar97
                    Left = 1
                    Top = 0
                    Caption = 'tb97BotoesDetalhe'
                    DockPos = 1
                    TabOrder = 0
                    object SbtnInsAdicPer: TToolbarButton97
                      Left = 0
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Inserir'
                      AllowAllUp = True
                      GroupIndex = 2
                      ImageIndex = 0
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnInsCargoClick
                    end
                    object SbtnAltAdicPer: TToolbarButton97
                      Left = 25
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Alterar'
                      AllowAllUp = True
                      GroupIndex = 2
                      ImageIndex = 1
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnAltCargoClick
                    end
                    object SbtnExcAdicPer: TToolbarButton97
                      Left = 50
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Excluir'
                      AllowAllUp = True
                      ImageIndex = 2
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnExcCargoClick
                    end
                  end
                end
              end
              object TbsRubSal: TTabSheet
                Caption = 'Outras Rubricas Salariais'
                object DbGrdRubSal: TwwDBGrid
                  Left = 0
                  Top = 31
                  Width = 512
                  Height = 216
                  Selected.Strings = (
                    'CODPROVDESC'#9'7'#9'Código ~da Rubrica'#9'F'
                    'MES'#9'7'#9'Mês de ~Referência'#9'F'
                    'MESCOBRANCA'#9'7'#9'Mês de ~Cobrança'#9'F'
                    'VALORPROVENTO'#9'10'#9'Valor da ~Rubrica'#9'F'
                    'VALORNADIB'#9'10'#9'Valor na ~Data  Ref.'#9'F'
                    'PERCENTUALNADIB'#9'10'#9'Percentual ~na Data Ref.'#9'F'
                    'MODULO'#9'21'#9'Módulo'#9'F'
                    'DESCRPROVDESC'#9'60'#9'Nome da Rubrica'#9'F')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = DsHistRubSal
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  KeyOptions = []
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                  ParentFont = False
                  TabOrder = 0
                  TitleAlignment = taLeftJustify
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -9
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = [fsBold]
                  TitleLines = 2
                  TitleButtons = False
                  OnCalcCellColors = DbGrdCargoCalcCellColors
                  IndicatorColor = icBlack
                end
                object pnlControlesRubSalarial: TPanel
                  Left = 0
                  Top = 31
                  Width = 512
                  Height = 216
                  Align = alClient
                  BevelInner = bvLowered
                  BevelOuter = bvNone
                  TabOrder = 1
                  object GroupBox2: TGroupBox
                    Left = 6
                    Top = 70
                    Width = 329
                    Height = 94
                    Caption = 'Informações da Rubrica'
                    TabOrder = 2
                    object Label45: TLabel
                      Left = 7
                      Top = 15
                      Width = 45
                      Height = 13
                      Caption = 'Rubrica'
                    end
                    object Label46: TLabel
                      Left = 7
                      Top = 53
                      Width = 30
                      Height = 13
                      Caption = 'Valor'
                    end
                    object dbedValor: TwwDBEdit
                      Left = 7
                      Top = 66
                      Width = 121
                      Height = 21
                      DataField = 'VALORPROVENTO'
                      DataSource = DsHistRubSal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 1
                      UnboundDataType = wwDefault
                      WantReturns = False
                      WordWrap = False
                    end
                    object dblkpcmbRubrica: TwwDBLookupCombo
                      Left = 7
                      Top = 29
                      Width = 314
                      Height = 21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRPROVDESC'#9'130'#9'Rubrica'
                        'CODPROVDESC'#9'7'#9'Código')
                      DataField = 'IDRUBRICA'
                      DataSource = DsHistRubSal
                      LookupTable = CdsRubrica
                      LookupField = 'IDRUBRICA'
                      ParentFont = False
                      TabOrder = 0
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = False
                    end
                  end
                  object grpMesAnoRef: TGroupBox
                    Left = 6
                    Top = 6
                    Width = 160
                    Height = 52
                    Caption = 'Ano e Mês de Referência'
                    TabOrder = 0
                    object dbedAnoMesRefRubSal: TwwDBEdit
                      Left = 9
                      Top = 22
                      Width = 121
                      Height = 21
                      DataField = 'MES'
                      DataSource = DsHistRubSal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                      UnboundDataType = wwDefault
                      WantReturns = False
                      WordWrap = False
                    end
                  end
                  object GroupBox1: TGroupBox
                    Left = 171
                    Top = 6
                    Width = 163
                    Height = 52
                    Caption = 'Ano e Mês de Cobr/Pgmto'
                    TabOrder = 1
                    object dbedAnoMesCobRubSal: TwwDBEdit
                      Left = 9
                      Top = 22
                      Width = 121
                      Height = 21
                      DataField = 'MESCOBRANCA'
                      DataSource = DsHistRubSal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                      UnboundDataType = wwDefault
                      WantReturns = False
                      WordWrap = False
                    end
                  end
                end
                object Dock9710: TDock97
                  Left = 0
                  Top = 0
                  Width = 512
                  Height = 31
                  AllowDrag = False
                  BoundLines = [blTop, blBottom, blLeft, blRight]
                  object Shape15: TShape
                    Left = 184
                    Top = 9
                    Width = 16
                    Height = 12
                    Brush.Color = 13303807
                  end
                  object Label61: TLabel
                    Left = 204
                    Top = 9
                    Width = 54
                    Height = 15
                    AutoSize = False
                    Caption = 'Assistido'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Shape16: TShape
                    Left = 108
                    Top = 9
                    Width = 17
                    Height = 12
                    Brush.Color = clWindow
                  end
                  object Label62: TLabel
                    Left = 128
                    Top = 9
                    Width = 56
                    Height = 15
                    AutoSize = False
                    Caption = 'Ativo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Toolbar977: TToolbar97
                    Left = 1
                    Top = 0
                    Caption = 'tb97BotoesDetalhe'
                    DockPos = 1
                    TabOrder = 0
                    object SbtnInsOutras: TToolbarButton97
                      Left = 0
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Inserir'
                      AllowAllUp = True
                      GroupIndex = 2
                      ImageIndex = 0
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnInsCargoClick
                    end
                    object SbtnAltOutras: TToolbarButton97
                      Left = 25
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Alterar'
                      AllowAllUp = True
                      GroupIndex = 2
                      ImageIndex = 1
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnAltCargoClick
                    end
                    object SbtnExcOutras: TToolbarButton97
                      Left = 50
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Excluir'
                      AllowAllUp = True
                      ImageIndex = 2
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SbtnExcCargoClick
                    end
                  end
                end
              end
            end
            object Dock974: TDock97
              Left = 521
              Top = 1
              Width = 90
              Height = 275
              AllowDrag = False
              BoundLines = [blLeft]
              Position = dpRight
              Visible = False
              object tb97Detalhe: TToolbar97
                Left = 0
                Top = 0
                Caption = 'tb97Detalhe'
                DockPos = 0
                TabOrder = 0
                object bbtnOkDet: TBitBtn
                  Left = 0
                  Top = 0
                  Width = 85
                  Height = 27
                  Caption = 'OK'
                  TabOrder = 0
                  OnClick = bbtnOkDetClick
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
                object bbtnCancelarDet: TBitBtn
                  Left = 0
                  Top = 27
                  Width = 85
                  Height = 27
                  Cancel = True
                  Caption = 'Cancelar'
                  TabOrder = 1
                  OnClick = bbtnCancelarDetClick
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
                  Spacing = -1
                end
                object bbtnVoltarDet: TBitBtn
                  Left = 0
                  Top = 54
                  Width = 85
                  Height = 27
                  Cancel = True
                  Caption = '&Voltar'
                  TabOrder = 2
                  OnClick = bbtnCancelarDetClick
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
                  NumGlyphs = 2
                end
              end
            end
          end
        end
        object TbsResultadoProcesso: TTabSheet
          Caption = 'Resultado do processo'
          ImageIndex = 8
          object MemoResultado: TRichEdit
            Left = 0
            Top = 0
            Width = 507
            Height = 331
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            PlainText = True
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
            WordWrap = False
          end
          object Dock9711: TDock97
            Left = 507
            Top = 0
            Width = 105
            Height = 331
            AllowDrag = False
            BoundLines = [blLeft]
            Position = dpRight
            object Toolbar978: TToolbar97
              Left = 0
              Top = 0
              Caption = 'tb97Detalhe'
              DockPos = 0
              TabOrder = 0
              object BtnRelatorio: TBitBtn
                Left = 0
                Top = 0
                Width = 100
                Height = 40
                Caption = 'Imprimir'
                TabOrder = 0
                OnClick = BtnRelatorioClick
                Glyph.Data = {
                  DE010000424DDE01000000000000760000002800000024000000120000000100
                  0400000000006801000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
                  8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
                  0000888800880007700888888F778F7778F778FF000088008800877007700888
                  778F7787F778F778000080880088877770077087FF778887F88778F700008700
                  888887777770008777888887FF888777000080888888F77777777087F8888F77
                  78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
                  87777087FF778888888778F7000087FF88899888888770877788888888888777
                  000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
                  778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
                  88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
                  8F888F77000088888888887FFF7788888888888878FF77880000888888888887
                  7788888888888888877788880000888888888888888888888888888888888888
                  0000}
                NumGlyphs = 2
              end
              object BtnSalvar: TBitBtn
                Left = 0
                Top = 40
                Width = 100
                Height = 40
                Cancel = True
                Caption = 'Salvar'
                TabOrder = 1
                OnClick = BtnSalvarClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888444488
                  88888888887777F888888888884CC48888888888887F87F888888888884CC488
                  88888888887F87F888888888884CC48888888888887F87FFF8888888444CC444
                  8888888877788777F88888884CCCCCC48888888878F888878888888884CCCC48
                  888888FFF78F887FFFF88000004CC400008887777778F77777FF777777744777
                  7708777777777777777878FFFFFFFFFF87707F8FFFFFFFFFF7F7787777777777
                  87707F777777777787F778888888888887707F888888888887F7788888888882
                  87707FFFFFFFFFFFF7F77FFFFFFFFFFFF7707777777777777787878888888888
                  8870878FFFFFFFFFFFF788777777777777788877777777777778}
                NumGlyphs = 2
                Spacing = -1
              end
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 386
    Width = 779
    inherited tb97Fundo: TToolbar97
      Left = 421
      inherited sep1: TToolbarSep97
        Left = 0
        Visible = False
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 83
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 2
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 85
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 993
    Top = 6
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object OpenDlg: TOpenDialog
    Title = 'Arquivo com Matrículas para Revisão'
    Left = 40
    Top = 286
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'EL.MATRICULA'
      'PP.INSCRICAONUMERO'
      'PES.NOME'
      'BF.NOME'
      'DEPENTIT.MATRICULA'
      'BENEF.NOME'
      'P.DTEVENTO'
      'BF.NOME AS BENEFICIO'
      'P.NUMEROPROCESSO')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'D'
      'C'
      'N')
    Descricao.Strings = (
      'Matrícula do Titular'
      'Nº de Inscrição'
      'Participante Titular'
      'Benefício Requerido'
      'Matrícula do Beneficiário'
      'Beneficiário'
      'Data do Evento'
      'Benefício'
      'Nº do Processo')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROCESSOBENEF P'
      'BENEFBFCIARIO B'
      'ELEGPATRO EL'
      'PARTPREVPLAN PP'
      'PESSOA PES'
      'BENEFPLANPREV BPL'
      'BENEFICIO BF'
      'PESSOA PAT'
      'PLANPREV PL'
      'PESSOA BENEF'
      'SITPART SP'
      'DEPENTIT'
      'REGRA')
    CamposChave.Strings = (
      'PP.IDPESSOA'
      'PP.IDPESSOA'
      'PP.SEQPROPOSTA'
      'PP.IDPESSJUR'
      'DECODE(B.IDPLANOPREV, NULL, PP.IDPLANOPREV, B.IDPLANOPREV)'
      'PES.NOME'
      'BF.NOME'
      'PP.IDSITPART'
      'EL.IDSITFUNC'
      'PP.IDSITPLANOPREV'
      'B.FLGPOSSUIACOMPINSS'
      'B.DATAINICIOFUND'
      'PAT.NOME'
      'PL.NOME'
      'P.DTEVENTO'
      'EL.MATRICULA'
      'PP.INSCRICAONUMERO'
      'B.DATAINICIOINSS'
      'B.DATAFINAL'
      'NVL(B.IDBENEFICIO,0)'
      'B.DATAINICIO'
      'B.IDPESSOA'
      'BENEF.NOME'
      'P.NUMEROPROCESSO'
      'SP.FLGINTERNO'
      'DECODE(B.IDPLANOORIGEM, NULL, PP.IDPLANOPREV, B.IDPLANOORIGEM)'
      'REGRA.NOMEREGRA'
      'REGRA.IDREGRA')
    Filtro.Strings = (
      '( PP.IDPESSJUR        = EL.IDPESSJUR )'
      '( PP.IDPESSOA         = EL.IDPESSOA )'
      '( PES.IDPESSOA        = EL.IDPESSOA )'
      '( PAT.IDPESSOA        = PP.IDPESSJUR )'
      '( PL.IDPLANOPREV      = PP.IDPLANOPREV )'
      '( B.IDPESSJUR(+)      = PP.IDPESSJUR )'
      '( B.IDPLANOORIGEM(+)  = PP.IDPLANOPREV )'
      '( B.IDTITULAR(+)      = PP.IDPESSOA )'
      '( B.SEQPROPOSTA(+)    = PP.SEQPROPOSTA )'
      '( P.NUMEROPROCESSO(+) = B.NUMEROPROCESSO )'
      '( BPL.IDPLANOPREV(+)  = B.IDPLANOPREV )'
      '( BPL.IDBENEFICIO(+)  = B.IDBENEFICIO )'
      '( BF.IDBENEFICIO(+)   = B.IDBENEFICIO )'
      
        '( (BPL.FLGREFERENCIA = 0) OR ((BPL.FLGREFERENCIA = 1) AND (BPL.F' +
        'LGPAGAINSS = 1))  OR (BPL.FLGREFERENCIA IS NULL ) )'
      '( BENEF.IDPESSOA(+)   = B.IDPESSOA            )'
      '( SP.IDSITPART = PP.IDSITPART )'
      '( B.IDTITULAR = DEPENTIT.IDTITULAR(+) )'
      '( B.IDPESSOA = DEPENTIT.IDPESSOA(+) )'
      '( PL.IDREGRASIMULAENQ  = REGRA.IDREGRA(+) )')
    Mascaras.Strings = (
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
      '13'
      '10'
      '30'
      '30'
      '15'
      '30'
      '15'
      '60'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 8
    Top = 286
  end
  object ImlPadrao: TImageList
    Left = 17
    Top = 682
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000084000000840000008400000084000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000084000000FF00000084000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      0000008400000084000000000000000000000084000000840000008400000084
      0000008400000084000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      84000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      00000000000000000000000000000000000000000000000000008484840000FF
      000000840000FFFFFF00FFFFFF00FFFFFF000000000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0084848400000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      00008400000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008400000084
      00000084000000840000008400000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000084
      000000840000008400000084000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      000000840000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF000000000000000000000000008484840000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF000000000000840000FFFFFF00FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF00000084000000
      FF00000084000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00000084000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00008400000084000000840000FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00848484000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      000084000000840000008400000000000000FFFFFF00FFFFFF00840000008400
      00008400000084000000000000000000000000000000000000008484840000FF
      000000840000008400000084000000840000008400000084000000840000FFFF
      FF00FFFFFF00008400000000000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000FFFFFF00FFFFFF00840000008400000000000000FFFFFF00FFFFFF008400
      00008400000084000000000000000000000000000000000000008484840000FF
      0000008400000084000000840000008400000084000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      0000FFFFFF00FFFFFF00000000008400000000000000FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000000000000000000008484
      840000FF000000FF000000840000008400000084000000840000008400000084
      00000084000000000000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000848484008484840000FF000000FF000000FF000000FF000000FF00008484
      8400848484000000000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      840000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000084848400FF00
      0000FF00000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000FF000000FF000000FF000000FF000000FF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FF000000FF000000FF000000FF000000FF000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000FFFF0000FFFF008484840084848400000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000000000000000000000000000000000000000840000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000840000008400000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000FFFF0000FFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF0000008400FFFFFF00FFFFFF00FF000000FFFF
      FF00000000000000000000000000000000000000840000008400000084000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000FFFF0000FFFF0000FFFF008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000008400FF000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000008400000084000000
      840000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF000000000000000000000000000000000000FFFF0000FF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000FFFFFF008484840084848400000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000084000000
      0000FFFF000000000000FFFF0000000000000000000084840000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF000000FF000000
      0000FFFFFF00FFFFFF000000FF000000FF0000008400FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000FFFFFF00FFFF
      FF00FFFFFF0084848400848484000000000000000000000000000000000000FF
      FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF00FFFF
      FF00FFFFFF00000000000000FF000000FF0000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000FFFFFF008484
      840084848400000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF008484
      840084848400000000000000000000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000848484000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF00848484008484840084848400000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000084008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      84000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      E007000000000000F00F000000000000F81F000000000000FC3F000000000000
      FE7F000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FC1FFFFFFFFFFFFFF007F83FF83FF83F
      E003E00FE00FE00FC301C007C007C007C0818003800380038040800380038003
      8020000100010001811000010001008181080001000100818008000100010101
      C001000100010081C001800380038283E003800380038023F007C007C007C007
      FC1FE00FE00FE00FFFFFF83FF83FF83FFEFFFF1FFFFFFF9FBC3DFC0FFF9FFE1F
      CC33F00FFE1FF81FC003E00FF81FE00FC007E007E00FE00FC00FF007E00F6007
      C007C003C0073007C003C001800710030000C00000038001C003E0012001C500
      E001E0071000CA81E003F0030401D507C003F0012007CA9FCC33F803801FD53F
      BEFDFC0FC1FFEA7FFEFFFE3FFFFFF0FF00000000000000000000000000000000
      000000000000}
  end
  object CdsCargo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 175
    Top = 344
  end
  object CdsModoCargo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 207
    Top = 344
  end
  object CdsSituacao: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 271
    Top = 344
    Data = {
      9F0000009619E0BD01000000180000000200010000000300000094000A464C47
      5349545041525401004900000002000753554254595045020049000A00466978
      656443686172000557494454480200020002000944455343524943414F010049
      00000002000753554254595045020049000A0046697865644368617200055749
      4454480200020005000100044C43494404000100090800000000024154054174
      69766F}
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT '#39'AT'#39' AS FLGSITPART, '#39'Ativo'#39'     AS DESCRICAO FROM DUAL')
    ClientDataSet = CdsSituacao
    Left = 247
    Top = 296
  end
  object DsEvolFuncPrev: TDataSource
    DataSet = CdsEvolFuncPrev
    Left = 327
    Top = 297
  end
  object CdsEvolFuncPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 295
    Top = 297
  end
  object CdsFuncao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 239
    Top = 344
  end
  object CdsModoFuncao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 335
    Top = 344
  end
  object CdsHistRubSal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 383
    Top = 297
  end
  object DsHistRubSal: TDataSource
    DataSet = CdsHistRubSal
    Left = 414
    Top = 297
  end
  object CdsRubrica: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 303
    Top = 344
  end
  object RegraMT: TRegraMT
    IdCalculo = 0
    DbConnectionType = cntBDE
    Left = 447
    Top = 296
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.txt'
    FileName = 'Resultado'
    Filter = 'Arquivo texto (*.txt)|txt'
    Title = 'Salvar resultado '
    Left = 105
    Top = 286
  end
  object CdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 399
    Top = 344
  end
end
