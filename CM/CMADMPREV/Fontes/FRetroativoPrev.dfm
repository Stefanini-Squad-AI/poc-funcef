inherited frmRetroativoPREV: TfrmRetroativoPREV
  Left = 254
  Top = 56
  Caption = 'Processamento de Cálculos Retroativos'
  ClientHeight = 636
  ClientWidth = 1009
  FormStyle = fsNormal
  Visible = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1009
    Height = 597
    object pnlEtapas: TPanel
      Left = 1
      Top = 1
      Width = 170
      Height = 595
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'pnlEtapas'
      TabOrder = 0
      object TwCons: TTreeWzd
        Left = 0
        Top = 0
        Width = 170
        Height = 595
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
          'Selecionar Tipo (Individual ou Lote)'
          'Selecionar Alterações Desejadas (Apenas para Individual)'
          'Selecionar Revisões Desejadas'
          'Informar Dados para Revisão (Apenas para Individual)'
          'Informar Parâmetros para Possíveis Acertos'
          'Demonstrativo de Resultado'
          'Confirmação de Gravação')
        Etapa.Forma = stRoundSquare
        Etapa.LinhaWidth = 1
        Etapa.Top = 25
        Etapa.Espaco = 15
        Etapa.Quantidade = 7
        Etapa.BorderWidth = 1
        Etapa.Left = 10
        Etapa.Identacao = 30
        Etapa.Height = 30
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
        Top = 373
        Width = 75
        Height = 25
        Caption = 'Anteriror'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
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
        Left = 87
        Top = 373
        Width = 75
        Height = 25
        Caption = 'Próximo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
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
        Top = 407
        Width = 75
        Height = 25
        Caption = 'Encerra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
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
        Left = 87
        Top = 407
        Width = 75
        Height = 25
        Caption = 'Cancela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Visible = False
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
      Left = 171
      Top = 1
      Width = 837
      Height = 595
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
        Width = 837
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        Caption = 
          'Cálculo Retroativo Individual - Matrícula : xxxx - Data : dd/mm/' +
          'aaaa'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object pgctrlEtapa: TPageControl
        Left = 0
        Top = 50
        Width = 837
        Height = 545
        ActivePage = tbsEtapa4
        Align = alClient
        TabOrder = 1
        object tbsEtapa1: TTabSheet
          Caption = 'tbsEtapa1'
          ImageIndex = 5
          object Image7: TImage
            Left = 31
            Top = 18
            Width = 34
            Height = 34
            Picture.Data = {
              07544269746D617076020000424D760200000000000076000000280000002000
              0000200000000100040000000000000200000000000000000000100000000000
              0000000000000000800000800000008080008000000080008000808000008080
              8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF00000000000000000000FFFFFFFFFFFF0FBFBFBFBFBFBFBFBFB0FFFF
              FFFFFFFF0BFBFBFBFBFBFBFBFBF0FFFFFFFFFFFF0FB00000000000000FB0FFFF
              FFFFFFFF0BFBFBFBFBFBFBFBFBF0FFFFFFFFFFFF0FBFBFBFBFBFBFBFBFB0FFFF
              FFFFFFFF0BF00000000000000BF0FFFFFFFFFFFF0FBFBFBFBFBFBFBFBFB0FFFF
              FFFFFFFF0BFBFBFBFBFBFBFBFBF0FFFFFFFFFFFF0FB00000000000000FB0FFFF
              FFFFFFFF0BFBFBFBFBFBFBFBFBF0FFFFFFFFFFFF0FBFBFBFBFBFBFBFBFB0FFFF
              FFFFFFFF0BF00000000000000BF0FFFFFFFFFFFF0FBFBFBFBFBFBFBFBFB0FFFF
              FFFFFFFF0BFBFBFBFBFBFBFBFBF0FFFFFFFFFFFF0FB00000000000000FB0FFFF
              FFFFFFFF0BFBFBFBFBFBFBFBFBF0FFFFFFFFFFFF0FBFBFBFBFBFBFB00000FFFF
              FFFFFFFF0BF00000000000F0FF0FFFFFFFFFFFFF0FBFBFBFBFBFBFB0F0FFFFFF
              FFFFFFFF0BFBFBFBFBFBFBF00FFFFFFFFFFFFFFF0000000000000000FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF}
            Transparent = True
          end
          object Image8: TImage
            Left = 31
            Top = 67
            Width = 34
            Height = 34
            Picture.Data = {
              07544269746D617076020000424D760200000000000076000000280000002000
              0000200000000100040000000000000200000000000000000000100000000000
              0000000000000000800000800000008080008000000080008000808000008080
              8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00FFFFFFFFFF00000000000000000000FFFFFFFFFFFF0FBFBFBFBFBFBFBFBF
              B0FFFFFFFFFFFF0BFBFBFBFBFBFBFBFBF0FFFFFFFFF00000000000000000000F
              B0FFFFFFFFF0FBFBFBFBFBFBFBFBFB0BF0FFFFFFFFF0BFBFBFBFBFBFBFBFBF0F
              B0FFFFFF00000000000000000000FB0BF0FFFFFF0FBFBFBFBFBFBFBFBFB0BF0F
              B0FFFFFF0BFBFBFBFBFBFBFBFBF0FB0BF0FFFFFF0FB00000000000000FB0BF0F
              B0FFFFFF0BFBFBFBFBFBFBFBFBF0FB0BF0FFFFFF0FBFBFBFBFBFBFBFBFB0BF0F
              B0FFFFFF0BF00000000000000BF0FB0BF0FFFFFF0FBFBFBFBFBFBFBFBFB0BF0F
              B0FFFFFF0BFBFBFBFBFBFBFBFBF0FB0BF0FFFFFF0FB00000000000000FB0BF0F
              B0FFFFFF0BFBFBFBFBFBFBFBFBF0FB0BF0FFFFFF0FBFBFBFBFBFBFBFBFB0BF0F
              B0FFFFFF0BF00000000000000BF0FB0BF0FFFFFF0FBFBFBFBFBFBFBFBFB0BF0F
              B0FFFFFF0BFBFBFBFBFBFBFBFBF0FB0BF0FFFFFF0FB00000000000000FB0BF00
              00FFFFFF0BFBFBFBFBFBFBFBFBF0FB0FFFFFFFFF0FBFBFBFBFBFBFB00000BF0F
              FFFFFFFF0BF00000000000F0FF00000FFFFFFFFF0FBFBFBFBFBFBFB0F0FFFFFF
              FFFFFFFF0BFBFBFBFBFBFBF00FFFFFFFFFFFFFFF0000000000000000FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF}
            Transparent = True
          end
          object rbtnIndividual: TRadioButton
            Tag = 999
            Left = 102
            Top = 16
            Width = 373
            Height = 17
            Caption = 'Retroativo Individual ( para um único participante )'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            TabStop = True
            OnClick = rbtnIndividualClick
          end
          object rbnLote: TRadioButton
            Tag = 999
            Left = 102
            Top = 76
            Width = 415
            Height = 17
            Caption = 'Retroativo em Lote ( para um grupo de participantes )'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = rbnLoteClick
          end
          object pgctrlEtapa1: TPageControl
            Left = 3
            Top = 110
            Width = 553
            Height = 317
            ActivePage = tbsEtapa1Indiv
            TabOrder = 2
            object tbsEtapa1Indiv: TTabSheet
              Caption = 'Selecione o Participante ou Beneficiário Desejado ...'
              object Bevel1: TBevel
                Left = 0
                Top = 0
                Width = 545
                Height = 289
                Align = alClient
              end
              object Label4: TLabel
                Left = 12
                Top = 11
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
                Left = 12
                Top = 51
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
                Left = 267
                Top = 51
                Width = 118
                Height = 13
                Caption = 'Plano Previdenciário'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label10: TLabel
                Left = 12
                Top = 126
                Width = 100
                Height = 13
                Caption = 'Número Processo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label11: TLabel
                Left = 267
                Top = 126
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
                Left = 140
                Top = 126
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
                Left = 12
                Top = 164
                Width = 68
                Height = 13
                Caption = 'Beneficiário'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label14: TLabel
                Left = 12
                Top = 90
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
                Left = 267
                Top = 90
                Width = 228
                Height = 13
                Caption = 'Situação Atual na Fundação (Categoria)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object bbtnProcurar: TBitBtn
                Left = 439
                Top = 18
                Width = 91
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
                Left = 12
                Top = 27
                Width = 409
                Height = 20
                AutoSize = False
                BorderStyle = sbsSunken
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
              end
              object lblPatro: TStaticText
                Left = 12
                Top = 65
                Width = 244
                Height = 20
                AutoSize = False
                BorderStyle = sbsSunken
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
              end
              object lblPlano: TStaticText
                Left = 267
                Top = 65
                Width = 260
                Height = 20
                AutoSize = False
                BorderStyle = sbsSunken
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
              end
              object lblNUmProc: TStaticText
                Left = 12
                Top = 140
                Width = 122
                Height = 20
                AutoSize = False
                BorderStyle = sbsSunken
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 4
              end
              object lblDIB: TStaticText
                Left = 140
                Top = 140
                Width = 116
                Height = 20
                AutoSize = False
                BorderStyle = sbsSunken
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 5
              end
              object lblBeneficio: TStaticText
                Left = 267
                Top = 140
                Width = 260
                Height = 20
                AutoSize = False
                BorderStyle = sbsSunken
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 6
              end
              object lblBeneficiario: TStaticText
                Left = 12
                Top = 178
                Width = 515
                Height = 20
                AutoSize = False
                BorderStyle = sbsSunken
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 7
              end
              object lblMatricula: TStaticText
                Left = 12
                Top = 104
                Width = 122
                Height = 20
                AutoSize = False
                BorderStyle = sbsSunken
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 8
              end
              object lblSituacaoAtual: TStaticText
                Left = 267
                Top = 104
                Width = 260
                Height = 20
                AutoSize = False
                BorderStyle = sbsSunken
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 9
              end
            end
            object tbsEtapa1Lote: TTabSheet
              Caption = 'Selecione os Dados do Grupo (Lote) Desejado ...'
              ImageIndex = 1
              object Bevel2: TBevel
                Left = 0
                Top = 0
                Width = 545
                Height = 289
                Align = alClient
              end
              object Label15: TLabel
                Left = 12
                Top = 18
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
              object Label18: TLabel
                Left = 12
                Top = 42
                Width = 118
                Height = 13
                Caption = 'Plano Previdenciário'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label27: TLabel
                Left = 408
                Top = 42
                Width = 94
                Height = 13
                Caption = '[branco = todos]'
              end
              object Label26: TLabel
                Left = 408
                Top = 18
                Width = 94
                Height = 13
                Caption = '[branco = todas]'
              end
              object Label45: TLabel
                Left = 11
                Top = 68
                Width = 83
                Height = 13
                Caption = 'Com DIB entre'
              end
              object Label47: TLabel
                Left = 242
                Top = 68
                Width = 8
                Height = 13
                Caption = 'e'
              end
              object dblkpcmbPatro: TwwDBLookupCombo
                Left = 131
                Top = 14
                Width = 268
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'Patrocinadora'#9'F')
                LookupTable = qryPatro
                LookupField = 'IDPESSOA'
                Options = [loTitles]
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object dblkpcmbPlano: TwwDBLookupCombo
                Left = 131
                Top = 38
                Width = 268
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'Plano Previdenciário'#9'F')
                LookupTable = qryPlano
                LookupField = 'IDPLANOPREV'
                Options = [loTitles]
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object dtDIBInicioLote: TCMDateTimePicker
                Left = 130
                Top = 64
                Width = 110
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
                TabOrder = 2
              end
              object dtDIBFinalLote: TCMDateTimePicker
                Left = 254
                Top = 64
                Width = 110
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
              object rgrpTipoSituacao: TRadioGroup
                Left = 11
                Top = 99
                Width = 391
                Height = 105
                Caption = ' Processar apenas Participantes com Situação Atual igual a ... '
                ItemIndex = 0
                Items.Strings = (
                  'Todas'
                  'Ativo ou Mantido Parcial'
                  'Mantido'
                  'Assistido ou Falecido'
                  'Cancelado')
                TabOrder = 4
              end
              object chkListaPessoas: TCheckBox
                Left = 11
                Top = 204
                Width = 182
                Height = 17
                Caption = 'Indicar Lista de'
                TabOrder = 5
                OnClick = chkListaPessoasClick
              end
              object RdBtnMatricula: TRadioButton
                Left = 138
                Top = 204
                Width = 88
                Height = 17
                Caption = 'Matriculas'
                Checked = True
                TabOrder = 6
                TabStop = True
              end
              object RdBtnInscricao: TRadioButton
                Left = 234
                Top = 204
                Width = 88
                Height = 17
                Caption = 'Inscrições'
                TabOrder = 7
              end
              object grpListaPessoas: TGroupBox
                Left = 11
                Top = 220
                Width = 522
                Height = 65
                TabOrder = 8
                object lblListaPessoas: TLabel
                  Left = 3
                  Top = 8
                  Width = 283
                  Height = 13
                  Caption = 'Selecione o arquivo com a lista ( máximo de 200 )'
                end
                object sbtnListaPessoas: TSpeedButton
                  Left = 495
                  Top = 21
                  Width = 23
                  Height = 22
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    04000000000000010000120B0000120B00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                    5555555555555555555555555555555555555555555555555555555555555555
                    555555555555555555555555555555555555555FFFFFFFFFF555550000000000
                    55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
                    B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
                    000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
                    555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
                    55555575FFF75555555555700007555555555557777555555555555555555555
                    5555555555555555555555555555555555555555555555555555}
                  NumGlyphs = 2
                  OnClick = sbtnListaPessoasClick
                end
                object edListaPessoas: TEdit
                  Left = 3
                  Top = 21
                  Width = 490
                  Height = 21
                  TabOrder = 0
                end
                object ChBxSomentePlanoAtivo: TCheckBox
                  Left = 3
                  Top = 44
                  Width = 206
                  Height = 17
                  Caption = 'Processar somente o plano ativo'
                  TabOrder = 1
                  OnClick = chkListaPessoasClick
                end
              end
            end
          end
        end
        object tbsEtapa2: TTabSheet
          Caption = 'tbsEtapa2'
          object Image11: TImage
            Left = 31
            Top = 18
            Width = 34
            Height = 34
            Picture.Data = {
              07544269746D617076020000424D760200000000000076000000280000002000
              0000200000000100040000000000000200000000000000000000100000000000
              0000000000000000800000800000008080008000000080008000808000008080
              8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00080FFFFF08000FFFFF
              FFFFFFFFFFF00880FFFFFF008880FFFFFFFFFFFFFFF0800C0FFFF0CC000FFFFF
              FFFFFFFFFFFF0CCCC0FFF0CCC0FFFFFFFFFFFFFFFFFF0CCCC0FF0CCCC0FFFFFF
              FFFFFFFFFFFFF0CCCC0F0CCCC0FFFFFFFFFFFFFFFF0FF0CCCC00CCCC0FFFFFFF
              FFFFFFFFF0E0FF0CCCC0CCCC0FFFFFFFFFFFFFFF0EEE0F0CCCCC0CC0FFFFFFFF
              FFFFFFF0EEEEE0F0CCCCC0C0FFFFFFFFFFFFFF0EEEEE0FF0CCCCCC0FFFFFFFFF
              FFFFF0EEEEE00FFF0CCCCC0FFFFFFFFFFFFFFF0EEE0F0FFF0000000FFF00FFFF
              FFFFFFF0E000F00F0BBBBB0F00F0FFFFFFFFFFFF0FFF00B00BBBBB00B00FFFFF
              FFFFFFFFFFFF0BBB0BBBBB0BBB0FFFFFFFFFFFFFFFFFF0BBB0BBBB0BB0FFFFFF
              FFFFFFFFFFFFFF0BBB0BBB0B0FFFFFFFFFFFFFFFFFFFFFF0BBB0BB00FFFFFFFF
              FFFFFFFFFFFFFFFF0BBB0B0FFFFFFFFFFFFFFFFFFFFFFFFFF0BB00FFFFFFFFFF
              FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFF0FFFFFFFFFF
              FFFFFFFFFFFFFFFFF00FF0FFFFFFFFFFFFFFFFFFFFFFFFFFF00000FFFFFFFFFF
              FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF}
            Transparent = True
          end
          object Image12: TImage
            Left = 31
            Top = 67
            Width = 34
            Height = 34
            Picture.Data = {
              07544269746D617076020000424D760200000000000076000000280000002000
              0000200000000100040000000000000200000000000000000000100000000000
              0000000000000000800000800000008080008000000080008000808000008080
              8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF088880FFFFFFFF
              FFFFFFFFFFFFFFFFFF00000FFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFF
              FFFFFFFFFFFFFFFF0EEEEEE0FFFFFFFFFFFFFFFFFFFFFFFF0EEEEEE0FFFFFFFF
              FFFFFFFFFFFFFFFF0EEEEEE0FFFFFFFFFFFFFFFFFFFFFFFF0EEEEEE0FFFFFFFF
              FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFFF0C00C0FFFFFFFFF
              FFFFFFFFFFFFFFFFF00CC00FFFFFFFFFFFFFFFFFFFFFFFFF0000000FFFFFFFFF
              FFFFFFFFFFFFFFFF0B0BB00FFFFFFFFFFFFFFFFFFFFFFFFF0B0BB00FFFFFFFFF
              FFFFFFFFFFFFFFFF0B0BB00FFFFFFFFFFFFFFFFFFFFFFFFF0B0BB00FFFFFFFFF
              FFFFFFFFFFFFFFFF0B0BB00FFFFFFFFFFFFFFFFFFFFFFFFF0B0BB00FFFFFFFFF
              FFFFFFFFFFFFFFFF0B0BB00FFFFFFFFFFFFFFFFFFFFFFFFF0B0BB00FFFFFFFFF
              FFFFFFFFFFFFFFFF0B0BB00FFFFFFFFFFFFFFFFFFFFFFFFFF00000FFFFFFFFFF
              FFFFFFFFFFFFFFFFFF0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFF0FFFFFFFFFF
              FFFFFFFFFFFFFFFFF00FF0FFFFFFFFFFFFFFFFFFFFFFFFFFF00000FFFFFFFFFF
              FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF}
            Transparent = True
          end
          object Image13: TImage
            Left = 31
            Top = 116
            Width = 34
            Height = 34
            Picture.Data = {
              07544269746D617076020000424D760200000000000076000000280000002000
              0000200000000100040000000000000200000000000000000000100000000000
              0000000000000000800000800000008080008000000080008000808000008080
              8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000FFF000000000FFF0000
              00000AAAAAAA0FFF0CCCCCCC0FFF0BBBBBB00AAAAAAA0FFF0CCCCCCC0FFF0BBB
              BBB00AAAAAAA0FFF0CCCCCCC0FFF0BBBBBB00AAAAAAA0FFF0CCCCCCC0FFF0BBB
              BBB00AAAAAAA0FFF0CCCCCCC0FFF0BBBBBB0000000000FFF000000000FFF0000
              0000FFFF0FFFFFFFFFFF0FFFFFFFFFFF0FFFFFFF0FFFFFFFFFFF0FFFFFFFFFFF
              0FFFFFFF0FFFFFFFFFFF0FFFFFFFFFFF0FFFFFFF0FFFFFFFFFFF0FFFFFFFFFFF
              0FFFFFFF0000000000000000000000000FFFFFFFFFFFFFFFFFFF0FFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFF000000000FFFFFFF
              FFFFFFFFFFFFFFFF099999990FFFFFFFFFFFFFFFFFFFFFFF099999990FFFFFFF
              FFFFFFFFFFFFFFFF099999990FFFFFFFFFFFFFFFFFFFFFFF099999990FFFFFFF
              FFFFFFFFFFFFFFFF099999990FFFFFFFFFFFFFFFFFFFFFFF000000000FFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF}
            Transparent = True
          end
          object Image14: TImage
            Left = 31
            Top = 165
            Width = 34
            Height = 34
            Picture.Data = {
              07544269746D617076020000424D760200000000000076000000280000002000
              0000200000000100040000000000000200000000000000000000100000000000
              0000000000000000800000800000008080008000000080008000808000008080
              8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00080FFFFF08000FFFFF
              FFFFFFFFFFF00880FFFFFF008880FFFFFFFFFFFFFFF0800C0FFFF0CC000FFFFF
              FFFFFFFFFFFF0CCCC0FFF0CCC0FFFFFFFFFFFFFFFFFF0CCCC0FF0CCCC0FFFFFF
              FFFFFFFFFFFFF0CCCC0F0CCCC0FFFFFFFFFFFFFFFFFFF0CCCC00CCCC0FFF0FFF
              FFFFFFFFFFFFFF0CCCC0CCCC0FF0E0FFFFFFFFFFFFFFFF0CCC0CCCC0FF0EEE0F
              FFFFFFFFFFFFFFF0CC0CCCC0F0EEEEE0FFFFFFFFFFFFFFF0C0CCCC0FFF0EEEEE
              0FFFFFFFFFFFFFFF0CCCCC0FFF00EEEEE0FFFFFFFFF00FFF0000000FFF0F0EEE
              0FFFFFFFFFF0F00F0BBBBB0F00F000E0FFFFFFFFFFFF00B00BBBBB00B00FFF0F
              FFFFFFFFFFFF0BBB0BBBBB0BBB0FFFFFFFFFFFFFFFFFF0BB0BBBB0BBB0FFFFFF
              FFFFFFFFFFFFFF0B0BBB0BBB0FFFFFFFFFFFFFFFFFFFFFF00BB0BBB0FFFFFFFF
              FFFFFFFFFFFFFFFF0B0BBB0FFFFFFFFFFFFFFFFFFFFFFFFFF00000FFFFFFFFFF
              FFFFFFFFFFFFFFFFFF0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFF0FFFFFFFFFF
              FFFFFFFFFFFFFFFFF00FF0FFFFFFFFFFFFFFFFFFFFFFFFFFF00000FFFFFFFFFF
              FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF}
            Transparent = True
          end
          object Image16: TImage
            Left = 31
            Top = 214
            Width = 34
            Height = 34
            Picture.Data = {
              07544269746D6170BE000000424DBE000000000000003E000000280000002000
              0000200000000100010000000000800000006D0B00006D0B0000020000000200
              000000000000FFFFFF00FFFFFFFFFFF99FFFFFF99FFFFFF99FFFFFF99FFFFF00
              00FFFE00007FFE799E7FFE799E7FFE799E7FFFF99E7FFFF99E7FFFF99E7FFFF9
              9E7FFF00007FFE0000FFFE799FFFFE799FFFFE799FFFFE799E7FFE799E7FFE79
              9E7FFE00007FFF0000FFFFF99FFFFFF99FFFFFF99FFFFFF99FFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF}
            Transparent = True
          end
          object chkTipoIndivCadastral: TCheckBox
            Left = 78
            Top = 27
            Width = 268
            Height = 17
            Caption = 'Alteração Cadastral'
            TabOrder = 0
          end
          object chkTipoIndivFuncional: TCheckBox
            Left = 78
            Top = 76
            Width = 268
            Height = 17
            Caption = 'Alteração Funcional'
            TabOrder = 1
          end
          object chkTipoIndivOpcaoContrib: TCheckBox
            Left = 78
            Top = 125
            Width = 268
            Height = 17
            Caption = 'Alteração de Opção de Contribuição'
            TabOrder = 2
          end
          object chkTipoIndivTipoBeneficio: TCheckBox
            Left = 78
            Top = 174
            Width = 268
            Height = 17
            Caption = 'Alteração de Tipo de Benefício'
            TabOrder = 3
          end
          object chkTipoIndivRevisaoBeneficio: TCheckBox
            Left = 78
            Top = 223
            Width = 268
            Height = 17
            Caption = 'Alteração de Dados do Benefício'
            TabOrder = 4
          end
        end
        object tbsEtapa3: TTabSheet
          Caption = 'tbsEtapa3'
          ImageIndex = 9
          object Image6: TImage
            Left = 17
            Top = 1
            Width = 34
            Height = 34
            Picture.Data = {
              07544269746D6170BE000000424DBE000000000000003E000000280000002000
              0000200000000100010000000000800000006D0B00006D0B0000020000000200
              000000000000FFFFFF00FFFFFFFFFFF99FFFFFF99FFFFFF99FFFFFF99FFFFF00
              00FFFE00007FFE799E7FFE799E7FFE799E7FFFF99E7FFFF99E7FFFF99E7FFFF9
              9E7FFF00007FFE0000FFFE799FFFFE799FFFFE799FFFFE799E7FFE799E7FFE79
              9E7FFE00007FFF0000FFFFF99FFFFFF99FFFFFF99FFFFFF99FFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF}
            Transparent = True
          end
          object Image9: TImage
            Left = 269
            Top = 1
            Width = 34
            Height = 34
            Picture.Data = {
              07544269746D617076020000424D760200000000000076000000280000002000
              0000200000000100040000000000000200000000000000000000100000000000
              0000000000000000800000800000008080008000000080008000808000008080
              8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000
              000FFFFF00CCCCCCCCCCCCCCCCCCCCCCCCC0FFF0C0CCCCCCCCCCCCCCCCCCCCCC
              CCC0FF0CC000000000000000000000000000F0CCC0EEEEEEEEEEEEEEEEEEEEEE
              EEE00CCCC0EEEEE000E000E000EEE0000EE00CCC0EEEEE0EEE0EEE0EEEEEE000
              EE0F0CCC0EEEEEEEEEEEEEEEEEEE0000EE0F0CC0EEEEE000E000E000EEEEEEEE
              E0FF0CC0EEEE0EEE0EEE0EEEE0000000E0FF0C0EEEEEEEEEEEEEEEEE0EEEEE0E
              0FFF0C0EEEE000E000E000EE0EEEEE0E0FFF00EEEE0EEE0EEE0EEEE0000000E0
              FFFF00EEEEEEEEEEEEEEEEEEEEEEEEE0FFFF000000000000000000000000000F
              FFFFFFF088888888888888888880FFFFFFFFFFF088888888888888888880FFFF
              FFFFFFF088088808808808880880FFFFFFFFFFF088008000008000808880FFFF
              FFFFFFF088888888888888888880FFFFFFFFFFF088888888888888888880FFFF
              FFFFFFF088088808808808880880FFFFFFFFFFF088808000800000800880FFFF
              FFFFFFF088888888888888888880FFFFFFFFFFF088888888888888888880FFFF
              FFFFFFF088088808808808880880FFFFFFFFFFF088008000008000808880FFFF
              FFFFFFF088888888888888888880FFFFFFFFFFF000000000000000000000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF}
            Transparent = True
          end
          object lblmesreem: TLabel
            Left = 25
            Top = 315
            Width = 287
            Height = 13
            Caption = 'Revisar Por Mês Cobrança do Reembolso do INSS'
            WordWrap = True
          end
          object grpEtapa3FiltraContrib: TGroupBox
            Left = 8
            Top = 313
            Width = 298
            Height = 129
            Caption = ' Contribuições '
            TabOrder = 6
            TabStop = True
            object dbgrdContribuicoes: TwwDBGrid
              Left = 2
              Top = 15
              Width = 294
              Height = 112
              Selected.Strings = (
                'PROCESSA'#9'4'#9'PROCESSA'
                'NOME'#9'60'#9'NOME')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
              Align = alClient
              DataSource = dsContribuicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyOptions = []
              Options = [dgEditing, dgIndicator, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ParentFont = False
              PopupMenu = pMnu
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              OnKeyPress = dbgrdContribuicoesKeyPress
              IndicatorColor = icBlack
            end
          end
          object rbRecalcBenef: TRadioButton
            Tag = 999
            Left = 61
            Top = 10
            Width = 179
            Height = 17
            Caption = 'Revisão de Benefício'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = rbRecalcBenefClick
          end
          object rbRevisaoContribuicao: TRadioButton
            Tag = 999
            Left = 307
            Top = 10
            Width = 262
            Height = 17
            Caption = 'Revisão de Salários e Contribuições'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = rbRevisaoContribuicaoClick
          end
          object rgrpEtapa3Filtra: TRadioGroup
            Left = 0
            Top = 278
            Width = 609
            Height = 34
            Caption = ' Deseja filtrar apenas alguns benefícios ou contribuições ? '
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Não'
              'Sim')
            TabOrder = 5
            TabStop = True
            OnClick = rgrpEtapa3FiltraClick
          end
          object GroupBox3: TGroupBox
            Left = 0
            Top = 45
            Width = 609
            Height = 106
            TabOrder = 2
            object Label19: TLabel
              Left = 11
              Top = 20
              Width = 107
              Height = 13
              Caption = 'Recalcular do Mês'
            end
            object Label39: TLabel
              Left = 11
              Top = 47
              Width = 91
              Height = 13
              Caption = 'Acertar do Mês '
            end
            object Label20: TLabel
              Left = 191
              Top = 20
              Width = 60
              Height = 13
              Caption = 'até o mês '
            end
            object Label40: TLabel
              Left = 191
              Top = 47
              Width = 60
              Height = 13
              Caption = 'até o mês '
            end
            object Label42: TLabel
              Left = 11
              Top = 86
              Width = 304
              Height = 13
              Caption = 'as rubricas ( códigos internos separados por vírgula )'
            end
            object Label41: TLabel
              Left = 11
              Top = 71
              Width = 244
              Height = 13
              Caption = 'Considerar os acertos via Folha Extra com '
            end
            object Label65: TLabel
              Left = 370
              Top = 12
              Width = 213
              Height = 26
              Caption = 'Reajustar Salário de Participação no Início do processo'
              WordWrap = True
            end
            object Label67: TLabel
              Left = 370
              Top = 42
              Width = 222
              Height = 26
              Caption = 'Recalcular Salário de Participação em todos os mese do processo'
              WordWrap = True
            end
            object edAnoMesIni: TMaskEdit
              Left = 122
              Top = 12
              Width = 67
              Height = 21
              EditMask = '!9999/99;1;_'
              MaxLength = 7
              TabOrder = 0
              Text = '    /  '
              OnExit = edAnoMesIniExit
            end
            object edAnoMesIniAcerto: TMaskEdit
              Left = 122
              Top = 39
              Width = 67
              Height = 21
              EditMask = '!9999/99;1;_'
              MaxLength = 7
              TabOrder = 2
              Text = '    /  '
            end
            object edAnoMesFim: TMaskEdit
              Left = 252
              Top = 12
              Width = 67
              Height = 21
              EditMask = '!9999/99;1;_'
              MaxLength = 7
              TabOrder = 1
              Text = '    /  '
              OnExit = edAnoMesFimExit
            end
            object edAnoMesFimAcerto: TMaskEdit
              Left = 252
              Top = 39
              Width = 67
              Height = 21
              EditMask = '!9999/99;1;_'
              MaxLength = 7
              TabOrder = 3
              Text = '    /  '
            end
            object edRubFolhaExtra: TEdit
              Left = 326
              Top = 78
              Width = 203
              Height = 21
              TabOrder = 4
            end
            object chkReajustaSalPartInicio: TCheckBox
              Left = 351
              Top = 12
              Width = 17
              Height = 17
              TabOrder = 5
            end
            object chkReajustaSalPartSempre: TCheckBox
              Left = 351
              Top = 42
              Width = 17
              Height = 17
              TabOrder = 6
            end
          end
          object grpEtapa3FiltraBenef: TGroupBox
            Left = 312
            Top = 312
            Width = 298
            Height = 129
            Caption = ' Benefícios '
            TabOrder = 7
            TabStop = True
            object dbgrdBeneficios: TwwDBGrid
              Left = 2
              Top = 15
              Width = 294
              Height = 112
              Selected.Strings = (
                'PROCESSA'#9'5'#9'PROCESSA'
                'NOME'#9'60'#9'NOME')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
              Align = alClient
              DataSource = dsBeneficioEscolher
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyOptions = []
              Options = [dgEditing, dgIndicator, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ParentFont = False
              PopupMenu = pMnuBenef
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              OnKeyPress = dbgrdBeneficiosKeyPress
              IndicatorColor = icBlack
            end
          end
          object rgrpRecalculaBeneficio: TRadioGroup
            Left = 0
            Top = 155
            Width = 299
            Height = 86
            ItemIndex = 4
            Items.Strings = (
              'Recalcular SRB e Benefícios '
              'Utilizar Benefício Digitado e Reajustar'
              'Utilizar Benefício Digitado e Não Reajustar'
              'Recalcular Apenas o SRB'
              'Recalcular Benefícios e NÃO Recalcular SRB')
            TabOrder = 3
          end
          object grpInsereMesNaoEncontrado: TRadioGroup
            Left = 302
            Top = 155
            Width = 307
            Height = 86
            ItemIndex = 0
            Items.Strings = (
              'Inserir Valor para Meses não Pagos'
              'Desprezar Meses não Pagos')
            TabOrder = 4
          end
          object PnlBeneficiosRevisar: TPanel
            Left = 0
            Top = 244
            Width = 610
            Height = 28
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Color = clScrollBar
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 8
            object Label56: TLabel
              Left = 16
              Top = 8
              Width = 125
              Height = 13
              Caption = 'Processar benefícios '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object chkConsideraResgate: TCheckBox
              Left = 156
              Top = 6
              Width = 96
              Height = 17
              Caption = 'de resgate'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              State = cbChecked
              TabOrder = 0
            end
            object ChBxProcessaRetidos: TCheckBox
              Left = 253
              Top = 6
              Width = 65
              Height = 17
              Caption = 'retidos'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              State = cbChecked
              TabOrder = 1
              OnClick = chkListaPessoasClick
            end
            object ChBxProcessaEncerrados: TCheckBox
              Left = 331
              Top = 6
              Width = 85
              Height = 17
              Caption = 'encerrados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              OnClick = chkListaPessoasClick
            end
            object ChBxProcessaEmOutrosLote: TCheckBox
              Left = 434
              Top = 6
              Width = 173
              Height = 17
              Hint = 
                'Indica se irá reprocessar os beneficios já revisados em outros l' +
                'otes '
              Caption = 'revisados em outros lotes'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 3
              OnClick = chkListaPessoasClick
            end
          end
          object GbReem: TGroupBox
            Left = 8
            Top = 333
            Width = 226
            Height = 52
            Caption = 'Mês Cobrança Reembolso do INSS'
            TabOrder = 9
            TabStop = True
            Visible = False
            object lblanomesreem: TLabel
              Left = 21
              Top = 25
              Width = 61
              Height = 13
              Caption = 'Ano e Mês'
            end
            object mskanomesreem: TMaskEdit
              Left = 87
              Top = 20
              Width = 67
              Height = 21
              EditMask = '!9999/99;1;_'
              MaxLength = 7
              TabOrder = 0
              Text = '    /  '
              OnExit = edAnoMesFimExit
            end
          end
          object chkmesreem: TCheckBox
            Left = 8
            Top = 314
            Width = 17
            Height = 17
            TabOrder = 10
            OnClick = chkmesreemClick
          end
        end
        object tbsEtapa4: TTabSheet
          Caption = 'tbsEtapa4'
          ImageIndex = 6
          object pgctrlEtapa4: TPageControl
            Left = 0
            Top = 0
            Width = 829
            Height = 517
            ActivePage = tbsEtapa4Indiv5
            Align = alClient
            TabOrder = 0
            object tbsEtapa4Indiv1: TTabSheet
              Caption = '... Cadastral'
              ImageIndex = 3
              object Label55: TLabel
                Left = 2
                Top = 203
                Width = 219
                Height = 13
                Caption = 'Situação do Participante na Fundação'
              end
              object grpDataNasc: TGroupBox
                Left = 1
                Top = 15
                Width = 304
                Height = 186
                TabOrder = 0
                object Label58: TLabel
                  Left = 12
                  Top = 12
                  Width = 116
                  Height = 13
                  Caption = 'Data de Nascimento'
                end
                object Label60: TLabel
                  Left = 12
                  Top = 48
                  Width = 118
                  Height = 13
                  Caption = 'Data do Falecimento'
                end
                object Label46: TLabel
                  Left = 141
                  Top = 48
                  Width = 68
                  Height = 13
                  Caption = 'Estado Civil'
                end
                object lblTituloGrauParentesco: TLabel
                  Left = 141
                  Top = 12
                  Width = 114
                  Height = 13
                  Caption = 'Grau de Parentesco'
                end
                object dtDataNasc: TCMDateTimePicker
                  Left = 12
                  Top = 27
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
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ShowButton = True
                  TabOrder = 0
                end
                object dtDataMorte: TCMDateTimePicker
                  Left = 12
                  Top = 63
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
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ShowButton = True
                  TabOrder = 2
                end
                object cmbEstCiv: TComboBox
                  Left = 141
                  Top = 63
                  Width = 140
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 3
                  Items.Strings = (
                    'Solteiro(a)'
                    'Casado(a) ou Equiparado(a)'
                    'Divorciado(a)'
                    'Desquitado(a)'
                    'Separado(a) Judicial'
                    'Viúvo(a)'
                    'Marital'
                    'Separado(a)'
                    'Outros')
                end
                object dblkpcmbTipoDependencia: TCMDBLookupCombo
                  Left = 141
                  Top = 27
                  Width = 140
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'15'#9'Descrição')
                  LookupTable = qryDependencia
                  LookupField = 'IDDEPENDENCIA'
                  Options = [loTitles]
                  Style = csDropDownList
                  ParentFont = False
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object grpSexo: TRadioGroup
                  Left = 12
                  Top = 87
                  Width = 121
                  Height = 45
                  Caption = 'Sexo'
                  Items.Strings = (
                    'Masculino'
                    'Feminino')
                  TabOrder = 4
                  TabStop = True
                end
                object grpInvalido: TRadioGroup
                  Left = 12
                  Top = 136
                  Width = 121
                  Height = 45
                  Caption = 'Possui Invalidez ?'
                  Items.Strings = (
                    'Sim'
                    'Não')
                  TabOrder = 6
                  TabStop = True
                end
                object grpMolestiaGrave: TRadioGroup
                  Left = 141
                  Top = 87
                  Width = 154
                  Height = 45
                  Caption = 'Possui Moléstia Grave ?'
                  Items.Strings = (
                    'Sim'
                    'Não')
                  TabOrder = 5
                  TabStop = True
                  OnClick = grpMolestiaGraveClick
                end
                object grpIsentoIR: TRadioGroup
                  Left = 141
                  Top = 136
                  Width = 154
                  Height = 45
                  Caption = 'Pessoa Isenta de IR ?'
                  Items.Strings = (
                    'Sim'
                    'Não')
                  TabOrder = 7
                  TabStop = True
                  OnClick = grpMolestiaGraveClick
                end
              end
              object GroupBox6: TGroupBox
                Left = 308
                Top = 15
                Width = 262
                Height = 232
                TabOrder = 1
                object Label59: TLabel
                  Left = 6
                  Top = 12
                  Width = 103
                  Height = 13
                  Caption = 'Data de Admissão'
                end
                object lblDataDemissao: TLabel
                  Left = 6
                  Top = 48
                  Width = 104
                  Height = 13
                  Caption = 'Data de Demissão'
                end
                object Label61: TLabel
                  Left = 134
                  Top = 48
                  Width = 118
                  Height = 13
                  Caption = 'Data da Readmissão'
                end
                object Label62: TLabel
                  Left = 5
                  Top = 87
                  Width = 152
                  Height = 13
                  Caption = 'Tempo de Serviço Anterior'
                  WordWrap = True
                end
                object Label63: TLabel
                  Left = 132
                  Top = 108
                  Width = 36
                  Height = 13
                  Caption = 'meses'
                end
                object Label64: TLabel
                  Left = 134
                  Top = 12
                  Width = 102
                  Height = 13
                  Caption = 'Data de Inscrição'
                end
                object Label17: TLabel
                  Left = 5
                  Top = 185
                  Width = 123
                  Height = 13
                  Caption = 'Vinculação Funcional'
                end
                object dtDataAdmissao: TCMDateTimePicker
                  Left = 6
                  Top = 27
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
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ShowButton = True
                  TabOrder = 0
                end
                object dtDataDemissao: TCMDateTimePicker
                  Left = 6
                  Top = 63
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
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ShowButton = True
                  TabOrder = 2
                end
                object dtDataReadmissao: TCMDateTimePicker
                  Left = 134
                  Top = 63
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
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ShowButton = True
                  TabOrder = 3
                end
                object dtDataInscricao: TCMDateTimePicker
                  Left = 134
                  Top = 27
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
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ShowButton = True
                  TabOrder = 1
                end
                object edTempoServAnt: TEdit
                  Left = 7
                  Top = 101
                  Width = 121
                  Height = 21
                  TabOrder = 4
                end
                object grpCargoDiretoria: TRadioGroup
                  Left = 7
                  Top = 136
                  Width = 121
                  Height = 45
                  Caption = 'Cargo Diretoria ?'
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 5
                  TabStop = True
                end
                object dblkpcmbVinculaFunc: TwwDBLookupCombo
                  Left = 5
                  Top = 198
                  Width = 238
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'30'#9'Vinculação Funcional'#9'F')
                  LookupTable = qryVinculaFunc
                  LookupField = 'CODVINCULAFUNC'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 6
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                end
              end
              object dblkpcmbSituacaoFundacao: TwwDBLookupCombo
                Left = 2
                Top = 216
                Width = 295
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'30'#9'Situação da Patrocinadora'#9'F')
                LookupTable = qrySitPart
                LookupField = 'IDSITPART'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
            end
            object tbsEtapa4Indiv2: TTabSheet
              Caption = '... Funcional'
              ImageIndex = 1
              object bbtnCadEvolFuncional: TBitBtn
                Left = 0
                Top = 3
                Width = 574
                Height = 22
                Caption = 'Clique AQUI para acessar o Cadastro de Evolução Funcional'
                Default = True
                TabOrder = 0
                OnClick = bbtnCadEvolFuncionalClick
              end
              object btnCadContribParticipante: TBitBtn
                Left = 0
                Top = 51
                Width = 574
                Height = 22
                Caption = 'Clique AQUI para acessar as Contribuições do Participante'
                Default = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                OnClick = btnCadContribParticipanteClick
              end
            end
            object tbsEtapa4Indiv3: TTabSheet
              Caption = '... Opção de Contribuição'
              ImageIndex = 2
              object dbgrdOpcaoContrib: TwwDBGrid
                Left = 0
                Top = 22
                Width = 820
                Height = 154
                Selected.Strings = (
                  'PROCESSA'#9'7'#9'Revisar'#9'F'
                  'DATAINICIO'#9'12'#9'Início'
                  'DATAFINAL'#9'12'#9'Término'
                  'NOME'#9'30'#9'Contribuição'
                  'VALORBASE1'#9'10'#9'Opção 1'
                  'VALORBASE2'#9'10'#9'Opção 2'
                  'VALORBASE3'#9'10'#9'Opção 3')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 3
                ShowHorzScrollBar = True
                EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
                Align = alTop
                DataSource = dsOpcaoContribuicao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                KeyOptions = []
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
              object GroupBox1: TGroupBox
                Left = 0
                Top = 176
                Width = 820
                Height = 103
                Align = alTop
                Caption = ' Legenda : '
                TabOrder = 1
                object DBText4: TDBText
                  Left = 160
                  Top = 81
                  Width = 300
                  Height = 17
                  DataField = 'NOMEVALORBASE3'
                  DataSource = dsOpcaoContribuicao
                end
                object DBText1: TDBText
                  Left = 75
                  Top = 14
                  Width = 50
                  Height = 13
                  AutoSize = True
                  DataField = 'NOME'
                  DataSource = dsOpcaoContribuicao
                end
                object DBText2: TDBText
                  Left = 160
                  Top = 39
                  Width = 300
                  Height = 17
                  DataField = 'NOMEVALORBASE1'
                  DataSource = dsOpcaoContribuicao
                end
                object DBText3: TDBText
                  Left = 160
                  Top = 60
                  Width = 300
                  Height = 17
                  DataField = 'NOMEVALORBASE2'
                  DataSource = dsOpcaoContribuicao
                end
                object Label1: TLabel
                  Left = 93
                  Top = 39
                  Width = 61
                  Height = 13
                  Caption = 'Opção 1 : '
                end
                object Label2: TLabel
                  Left = 93
                  Top = 60
                  Width = 57
                  Height = 13
                  Caption = 'Opção 2 :'
                end
                object Label5: TLabel
                  Left = 93
                  Top = 81
                  Width = 57
                  Height = 13
                  Caption = 'Opção 3 :'
                end
              end
              object Panel1: TPanel
                Left = 0
                Top = 0
                Width = 820
                Height = 22
                Align = alTop
                BevelInner = bvLowered
                Caption = 
                  'Analise a lista de contribuições abaixo e efetue as alterações n' +
                  'a própria lista ....'
                Color = clGray
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
              end
            end
            object tbsEtapa4Indiv4: TTabSheet
              Caption = '... Tipo de Benefício'
              ImageIndex = 3
              object Label57: TLabel
                Left = 6
                Top = 27
                Width = 218
                Height = 13
                Caption = 'ALTERAÇÃO DE TIPO DE BENEFICIO'
              end
              object GroupBox7: TGroupBox
                Left = 0
                Top = 0
                Width = 821
                Height = 205
                Align = alTop
                Caption = ' Dados do Novo Tipo de Benefício '
                TabOrder = 0
                object wwDBGrid1: TwwDBGrid
                  Left = 2
                  Top = 15
                  Width = 816
                  Height = 188
                  Selected.Strings = (
                    'IDBENEFICIO'#9'10'#9'Cód. ~Atual'#9'F'
                    'DATAINICIO'#9'10'#9'DIB ~Atual'#9'F'
                    'NOME'#9'40'#9'Benefício ~Atual'#9'F'
                    'NOVOIDBENEFICIO'#9'10'#9'Novo ~Cód.'#9'F'
                    'NOVADATAINICIO'#9'10'#9'Nova ~DIB'#9'F'
                    'NOVONOME'#9'50'#9'Novo ~Benefício'#9'F'
                    'VALORTOTAL'#9'10'#9'Valor ~Total'#9'F'
                    'NOVOVALORTOTAL'#9'10'#9'Novo~Valor Total'#9'F'
                    'VALORATUAL'#9'10'#9'Valor ~Benefício'#9'F'
                    'NOVOVALORATUAL'#9'10'#9'Novo  ~Benefício'#9'F'
                    'VALORSRB'#9'10'#9'SRB'#9'F'
                    'NOVOSRB'#9'10'#9'Novo ~SRB'#9'F')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  ShowVertScrollBar = False
                  Align = alClient
                  DataSource = dsBeneficiosTrocar
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  KeyOptions = []
                  ParentFont = False
                  TabOrder = 0
                  TitleAlignment = taLeftJustify
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = [fsBold]
                  TitleLines = 2
                  TitleButtons = False
                  IndicatorColor = icBlack
                end
              end
              object GroupBox10: TGroupBox
                Left = 3
                Top = 216
                Width = 565
                Height = 153
                Caption = ' Outros Parâmetros '
                TabOrder = 1
                object Label32: TLabel
                  Left = 12
                  Top = 20
                  Width = 356
                  Height = 13
                  Caption = 'Proceder Alteração para o Novo Tipo de Benefício a partir de '
                end
                object Bevel3: TBevel
                  Left = 12
                  Top = 46
                  Width = 473
                  Height = 3
                end
                object Label66: TLabel
                  Left = 10
                  Top = 110
                  Width = 219
                  Height = 13
                  Caption = 'Situação do Participante na Fundação'
                  Visible = False
                end
                object dtDataNovoBenef: TCMDateTimePicker
                  Left = 375
                  Top = 18
                  Width = 110
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
                object ChBxMantenHst: TCheckBox
                  Left = 12
                  Top = 69
                  Width = 465
                  Height = 17
                  Caption = 'Manter histórico do beneficio encerrado'
                  TabOrder = 2
                end
                object ChBxGeraNovoProcesso: TCheckBox
                  Left = 12
                  Top = 52
                  Width = 465
                  Height = 17
                  Caption = 'Gerar novo processo'
                  Checked = True
                  State = cbChecked
                  TabOrder = 1
                end
                object ChBxAcertaContrib: TCheckBox
                  Left = 12
                  Top = 86
                  Width = 465
                  Height = 17
                  Caption = 'Executar acerto nas diferenças de contribuição'
                  TabOrder = 3
                end
                object wwDBLookupCombo1: TwwDBLookupCombo
                  Left = 10
                  Top = 124
                  Width = 295
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'30'#9'Situação da Patrocinadora'#9'F')
                  LookupTable = qrySitPart
                  LookupField = 'IDSITPART'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 4
                  Visible = False
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                end
              end
              object DbLkEscolheBeneficio: TwwDBLookupCombo
                Left = 43
                Top = 408
                Width = 121
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'Beneficio'#9'F')
                DataField = 'NOVONOME'
                DataSource = dsBeneficiosTrocar
                LookupTable = qryListaBeneficio
                LookupField = 'NOME'
                Options = [loRowLines, loTitles]
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                ShowMatchText = True
                OnChange = DbLkEscolheBeneficioChange
              end
            end
            object tbsEtapa4Indiv5: TTabSheet
              Caption = '... Dados do Benefício'
              ImageIndex = 4
              object lblanomesreemindiv: TLabel
                Left = 25
                Top = 323
                Width = 287
                Height = 13
                Caption = 'Revisar Por Mês Cobrança do Reembolso do INSS'
                Visible = False
                WordWrap = True
              end
              object Panel2: TPanel
                Left = 0
                Top = 0
                Width = 821
                Height = 22
                Align = alTop
                BevelInner = bvLowered
                Caption = 
                  'Analise a lista de benefícios abaixo e efetue as alterações na p' +
                  'rópria lista ....'
                Color = clGray
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
              object chkmesreemindiv: TCheckBox
                Left = 8
                Top = 322
                Width = 17
                Height = 17
                TabOrder = 2
              end
              object GbReemindiv: TGroupBox
                Left = 8
                Top = 341
                Width = 226
                Height = 52
                Caption = 'Mês Cobrança Reembolso do INSS'
                TabOrder = 3
                TabStop = True
                Visible = False
                object Label70: TLabel
                  Left = 21
                  Top = 25
                  Width = 61
                  Height = 13
                  Caption = 'Ano e Mês'
                end
                object edMesAno: TMaskEdit
                  Left = 87
                  Top = 20
                  Width = 67
                  Height = 21
                  EditMask = '!9999/99;1;_'
                  MaxLength = 7
                  TabOrder = 0
                  Text = '    /  '
                  OnExit = edAnoMesFimExit
                end
              end
              object wwRecViewPnlBeneficios: TwwRecordViewPanel
                Left = 0
                Top = 22
                Width = 820
                Height = 245
                HorzScrollBar.Visible = False
                TabOrder = 1
                Visible = False
                ControlOptions = []
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'MS Sans Serif'
                LabelFont.Style = []
              end
              object dbSelBeneficio: TDBCheckBox
                Left = 8
                Top = 296
                Width = 17
                Height = 17
                DataField = 'PROCESSA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 4
                ValueChecked = '1'
                ValueUnchecked = '0'
                Visible = False
                OnClick = dbSelBeneficioClick
              end
            end
          end
        end
        object tbsEtapa5: TTabSheet
          Caption = 'tbsEtapa5'
          ImageIndex = 7
          object Label52: TLabel
            Left = 276
            Top = 368
            Width = 255
            Height = 13
            Caption = '(recomendável para processamento em Lote)'
          end
          object Label53: TLabel
            Left = 280
            Top = 416
            Width = 139
            Height = 13
            Caption = 'processamento em Lote)'
          end
          object Label51: TLabel
            Left = 276
            Top = 404
            Width = 246
            Height = 13
            Caption = '(não mostrar na tela  -  recomendável para '
          end
          object Label38: TLabel
            Left = 276
            Top = 386
            Width = 255
            Height = 13
            Caption = '(recomendável para processamento em Lote)'
          end
          object chkCommitIndiv: TCheckBox
            Left = 10
            Top = 365
            Width = 261
            Height = 19
            Alignment = taLeftJustify
            Caption = 'Gravar Revisão por Pessoa'
            TabOrder = 3
          end
          object chkGravaDemons: TCheckBox
            Left = 10
            Top = 403
            Width = 261
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Gravar Demonstrativo APENAS em Disco'
            TabOrder = 4
          end
          object grpParamAcertoFolhaBen: TGroupBox
            Left = 12
            Top = 1
            Width = 527
            Height = 88
            Caption = 
              ' Caso hajam diferenças para Assistidos / Pensionistas lançar os ' +
              'acertos ... '
            TabOrder = 0
            object Label48: TLabel
              Left = 12
              Top = 19
              Width = 44
              Height = 13
              Caption = 'no Lote'
            end
            object Label49: TLabel
              Left = 12
              Top = 44
              Width = 178
              Height = 13
              Caption = 'da Folha de Benefícios do Mês'
            end
            object Label50: TLabel
              Left = 12
              Top = 67
              Width = 140
              Height = 13
              Caption = 'com Data de Pagamento'
            end
            object dblkpcmbLoteAcerto: TwwDBLookupCombo
              Left = 200
              Top = 15
              Width = 318
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'30'#9'Lote'#9'F'
                'IDLOTE'#9'10'#9'Cód. Lote'#9'F'
                'MESREFERENCIA'#9'7'#9'Mês '#9'F'
                'DATAPAGAMENTO'#9'18'#9'Data de Pagamento'#9'F')
              LookupTable = qryLote
              LookupField = 'IDLOTE'
              Options = [loTitles]
              ImeName = '268'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = dblkpcmbLoteAcertoCloseUp
            end
            object dbedMesLote: TDBEdit
              Left = 200
              Top = 40
              Width = 110
              Height = 21
              Color = clBtnFace
              DataField = 'MESREFERENCIA'
              DataSource = dsLote
              ReadOnly = True
              TabOrder = 1
            end
            object dbdtDataPagamentoLote: TCMDateTimePicker
              Left = 200
              Top = 63
              Width = 110
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              Color = clBtnFace
              ButtonStyle = cbsCustom
              DataField = 'DATAPAGAMENTO'
              DataSource = dsLote
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
              ReadOnly = True
              ShowButton = True
              TabOrder = 2
            end
          end
          object GroupBox5: TGroupBox
            Left = 12
            Top = 246
            Width = 527
            Height = 115
            Caption = ' Para todas as situações lançar os acertos ... '
            TabOrder = 2
            object Label33: TLabel
              Left = 12
              Top = 55
              Width = 73
              Height = 13
              Caption = 'Observação '
            end
            object Label25: TLabel
              Left = 145
              Top = 18
              Width = 66
              Height = 13
              Caption = 'com Motivo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label44: TLabel
              Left = 107
              Top = 45
              Width = 104
              Height = 13
              Caption = 'Incluir Alteradores'
            end
            object dblkpcmbMotivo: TwwDBLookupCombo
              Left = 221
              Top = 14
              Width = 290
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'Motivo'#9'F')
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              Options = [loTitles]
              ImeName = '268'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = dblkpcmbMotivoCloseUp
            end
            object edObservacao: TMemo
              Left = 12
              Top = 70
              Width = 498
              Height = 39
              MaxLength = 3999
              TabOrder = 2
            end
            object DbLkcIncluiAlterador: TwwDBLookupCombo
              Left = 221
              Top = 41
              Width = 110
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'Forma de Acerto'#9'F')
              LookupTable = qryIncluiAlterador
              LookupField = 'FLGINCLUIALTERADOR'
              Options = [loTitles]
              ImeName = '268'
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object PnlPagaINSS: TPanel
              Left = 336
              Top = 37
              Width = 178
              Height = 29
              BevelOuter = bvNone
              TabOrder = 3
              Visible = False
              object Label54: TLabel
                Left = 3
                Top = 9
                Width = 75
                Height = 13
                Caption = 'Acertar INSS'
              end
              object DbCbxPagaINSS: TwwDBComboBox
                Left = 82
                Top = 5
                Width = 93
                Height = 21
                ShowButton = True
                Style = csDropDownList
                MapList = True
                AllowClearKey = False
                AutoDropDown = True
                ShowMatchText = True
                DropDownCount = 8
                ItemHeight = 0
                Items.Strings = (
                  'Sim'#9'S'
                  'Não'#9'N')
                ItemIndex = 0
                Sorted = False
                TabOrder = 0
                UnboundDataType = wwDefault
              end
            end
          end
          object grpParamAcertoOutros: TGroupBox
            Left = 12
            Top = 91
            Width = 527
            Height = 153
            Caption = 
              ' Caso hajam diferenças para Ativos / Mantidos lançar os acertos ' +
              '... '
            TabOrder = 1
            object Label21: TLabel
              Left = 12
              Top = 18
              Width = 64
              Height = 13
              Caption = 'para o Mês'
            end
            object Label34: TLabel
              Left = 12
              Top = 40
              Width = 200
              Height = 13
              Caption = 'com Data de Cobrança/Pagamento'
            end
            object Label28: TLabel
              Left = 12
              Top = 64
              Width = 250
              Height = 13
              Caption = 'com Data Prevista de Cobrança/Pagamento'
            end
            object Label37: TLabel
              Left = 377
              Top = 43
              Width = 120
              Height = 13
              Caption = '(para calc. alterador)'
            end
            object edMesAcerto: TMaskEdit
              Left = 264
              Top = 14
              Width = 67
              Height = 21
              EditMask = '!9999/99;1;_'
              MaxLength = 7
              TabOrder = 0
              Text = '    /  '
            end
            object dtDataDeveriaTerPago: TCMDateTimePicker
              Left = 264
              Top = 60
              Width = 110
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
              TabOrder = 2
              OnChange = dtDataDeveriaTerPagoChange
            end
            object dtDataAcerto: TCMDateTimePicker
              Left = 264
              Top = 36
              Width = 110
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
            object GroupBox9: TGroupBox
              Left = 8
              Top = 84
              Width = 511
              Height = 64
              Caption = ' na Forma de Cobrança/Pagamento'
              TabOrder = 3
              object Label22: TLabel
                Left = 12
                Top = 20
                Width = 74
                Height = 13
                Caption = 'Ativos (Hoje)'
              end
              object Label23: TLabel
                Left = 12
                Top = 43
                Width = 90
                Height = 13
                Caption = 'Mantidos (Hoje)'
              end
              object Label30: TLabel
                Left = 253
                Top = 20
                Width = 104
                Height = 13
                Caption = 'Incluir Alteradores'
              end
              object Label31: TLabel
                Left = 253
                Top = 43
                Width = 104
                Height = 13
                Caption = 'Incluir Alteradores'
              end
              object dblkpFormaAtivos: TwwDBLookupCombo
                Left = 120
                Top = 16
                Width = 127
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'40'#9'Forma de Acerto'#9'F')
                LookupTable = qryFormaAcerto
                LookupField = 'FLGDESCFOLHA'
                Options = [loTitles]
                ImeName = '268'
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object dblkpFormaMantidos: TwwDBLookupCombo
                Left = 120
                Top = 39
                Width = 127
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'40'#9'Forma de Acerto'#9'F')
                LookupTable = qryFormaBanco
                LookupField = 'FLGDESCFOLHA'
                Options = [loTitles]
                ImeName = '268'
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object dblkpALTAtivos: TwwDBLookupCombo
                Left = 374
                Top = 16
                Width = 127
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'40'#9'Forma de Acerto'#9'F')
                LookupTable = qryIncluiAlterador
                LookupField = 'FLGINCLUIALTERADOR'
                Options = [loTitles]
                ImeName = '268'
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object dblkpALTMantidos: TwwDBLookupCombo
                Left = 374
                Top = 39
                Width = 127
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'40'#9'Forma de Acerto'#9'F')
                LookupTable = qryIncluiAlterador
                LookupField = 'FLGINCLUIALTERADOR'
                Options = [loTitles]
                ImeName = '268'
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
            end
            object ChBxUtilizaCalendario: TCheckBox
              Left = 377
              Top = 64
              Width = 122
              Height = 17
              Caption = 'Utiliza Calendário'
              TabOrder = 4
            end
          end
          object CkbxGravaDemo: TCheckBox
            Left = 10
            Top = 383
            Width = 261
            Height = 19
            Alignment = taLeftJustify
            Caption = 'Gravar Demonstrativo em disco'
            TabOrder = 5
          end
          object Panel3: TPanel
            Left = 736
            Top = 256
            Width = 409
            Height = 126
            Caption = 'Panel3'
            TabOrder = 6
            Visible = False
            object Label36: TLabel
              Left = 11
              Top = 41
              Width = 231
              Height = 13
              Caption = 'corrigindo os acertos utilizando o indice '
              Visible = False
            end
            object Label24: TLabel
              Left = 11
              Top = 63
              Width = 252
              Height = 13
              Caption = 'aplicando para correção da parcela a Regra'
              Visible = False
            end
            object Label35: TLabel
              Left = 11
              Top = 86
              Width = 203
              Height = 13
              Caption = 'utilizando para correção o alterador'
              Visible = False
            end
            object Label43: TLabel
              Left = 12
              Top = 5
              Width = 221
              Height = 24
              Caption = 'Itens Retirados da Tela '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -19
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dblkpcmbIndiceReaj: TwwDBLookupCombo
              Left = 162
              Top = 37
              Width = 247
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'10'#9'Sigla'#9'F'
                'MOEDESC'#9'20'#9'Descrição'#9'F')
              LookupTable = qryIndiceReaj
              LookupField = 'MOECODIGO'
              Options = [loTitles]
              ImeName = '268'
              TabOrder = 0
              Visible = False
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkpcmbRegraParcela: TwwDBLookupCombo
              Left = 162
              Top = 59
              Width = 247
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra'#9'F'
                'IDREGRA'#9'10'#9'Código'#9'F')
              LookupTable = qryRegraParcela
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ImeName = '268'
              TabOrder = 1
              Visible = False
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object DbLkcAlterador: TwwDBLookupCombo
              Left = 162
              Top = 82
              Width = 247
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'Alterador'#9'F')
              LookupTable = QryAlteradorCorrecao
              LookupField = 'CODALTERADOR'
              Options = [loTitles]
              ImeName = '268'
              TabOrder = 2
              Visible = False
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
          object pnlProcessa: TPanel
            Left = 560
            Top = 1
            Width = 521
            Height = 240
            TabOrder = 7
            Visible = False
            object pnlMatProcessa: TPanel
              Left = 1
              Top = 1
              Width = 519
              Height = 22
              Align = alTop
              BevelInner = bvLowered
              Caption = 'Matrículas Processadas'
              Color = clGray
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object lstProcessadas: TListBox
              Left = 1
              Top = 23
              Width = 519
              Height = 216
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ItemHeight = 14
              Items.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8'
                '9'
                '0'
                '1'
                '2'
                '3'
                '4'
                '5')
              ParentFont = False
              TabOrder = 1
            end
          end
        end
        object tbsEtapa6: TTabSheet
          Caption = 'tbsEtapa6'
          ImageIndex = 8
          object lblProgresso: TLabel
            Left = 0
            Top = 504
            Width = 90
            Height = 13
            Align = alBottom
            Caption = 'Processando ...'
          end
          object mmResult: TRichEdit
            Left = 0
            Top = 0
            Width = 828
            Height = 504
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
          object Panel4: TPanel
            Left = 8
            Top = 298
            Width = 830
            Height = 241
            Caption = 'Panel4'
            TabOrder = 1
            Visible = False
            object Button1: TButton
              Left = 2
              Top = 204
              Width = 68
              Height = 25
              Caption = 'Historico'
              TabOrder = 0
              OnClick = Button1Click
            end
            object Button2: TButton
              Left = 74
              Top = 204
              Width = 68
              Height = 25
              Caption = 'Reservas'
              TabOrder = 1
              OnClick = Button2Click
            end
            object DBGrid1: TDBGrid
              Left = 1
              Top = 1
              Width = 828
              Height = 200
              Align = alTop
              DataSource = DsAux
              TabOrder = 2
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
            end
          end
        end
        object tbsEtapa5OLD: TTabSheet
          Caption = 'tbsEtapa5OLD'
          ImageIndex = 3
          object DBGBenef: TwwDBGrid
            Left = 0
            Top = 0
            Width = 828
            Height = 227
            Selected.Strings = (
              'MESREFERENCIA'#9'10'#9'Mês Ref.'#9'F'
              'BENEFICIO'#9'40'#9'Benefício'#9'F'
              'VALORANTIGO'#9'10'#9'Vlr. Anterior'#9'F'
              'VALORNOVO'#9'10'#9'Vlr. Novo'#9'F'
              'VALORDIF'#9'10'#9'Diferença'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alTop
            DataSource = dsVirtualBenef
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
            OnCalcCellColors = DBGBenefCalcCellColors
            IndicatorColor = icBlack
          end
          object DBGContrib: TwwDBGrid
            Left = 0
            Top = 227
            Width = 828
            Height = 290
            Selected.Strings = (
              'MESREFERENCIA'#9'10'#9'Mês Ref'
              'CONTRIBUICAO'#9'40'#9'Contribuição'
              'VALORANTIGO'#9'10'#9'Vlr. Anterior'
              'VALORNOVO'#9'10'#9'Vlr Novo'#9'F'
              'VALORDIF'#9'10'#9'Diferença')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsVirtualContrib
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
            OnCalcCellColors = DBGContribCalcCellColors
            IndicatorColor = icBlack
          end
        end
      end
      object pnlSubTitulo: TPanel
        Left = 0
        Top = 25
        Width = 837
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Etapa 1'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 597
    Width = 1009
    inherited tb97Fundo: TToolbar97
      Left = 421
      inherited sep1: TToolbarSep97
        Left = 80
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 163
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 165
      end
      object bbtnImprimir: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = bbtnImprimirClick
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
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      5
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'Cells'
        0)
      (
        'TRichEdit'
        'Text'
        0)
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object qryVirtualBenef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  '#39'0000/00'#39' MESREFERENCIA,'
      '        '#39'0000/00'#39' MES,'
      '        0 NUMEROPROCESSO,'
      '        0 IDTITULAR,'
      '        0 IDPESSOA,'
      '        0 IDBENEFICIO,'
      '        0 IDPESSJUR,'
      '        0 IDPLANOPREV,'
      '        0 IDMOTIVO,'
      '        0 SEQPROPOSTA,'
      '        0 FLGDEVOLUCAO,'
      '        0 FLGENVIADO,'
      '        0 SEQBENEFICIO,'
      '        '#39'0123456789012345678901234567890123456789'#39' BENEFICIO,'
      '        0.00 VALORANTIGO,'
      '        0.00 VALORNOVO,'
      '        0.00 VALORDIF,'
      '        0.00 VALORTOTAL'
      'FROM DUAL'
      'WHERE 1=2'
      'ORDER BY MESREFERENCIA, IDPESSOA, IDBENEFICIO'
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updVirtualBenef
    ValidateWithMask = True
    Left = 29
    Top = 57
  end
  object updVirtualBenef: TUpdateSQL
    Left = 29
    Top = 105
  end
  object dsVirtualBenef: TwwDataSource
    DataSet = qryVirtualBenef
    Left = 28
    Top = 164
  end
  object dsVirtualContrib: TwwDataSource
    DataSet = qryVirtualContrib
    Left = 108
    Top = 164
  end
  object updVirtualContrib: TUpdateSQL
    Left = 109
    Top = 113
  end
  object qryVirtualContrib: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  '#39'0000/00'#39' MESREFERENCIA,'
      '        '#39'0000/00'#39' MESCOBRANCA,'
      '        0 IDEVENTOGERADOR,'
      '        0 IDPESSOA,'
      '        0 IDPLANOPREV,'
      '        0 IDCONTRIBUICAO,'
      '        0 IDPESSJUR,'
      '        0 IDPLANOPREV,'
      '        0 IDMOTIVO,'
      '        0 SEQPROPOSTA,'
      '        0 FLGDEVOLUCAO,'
      '        0 FLGENVIADO,'
      '        '#39'0123456789012345678901234567890123456789'#39' CONTRIBUICAO,'
      '        0.00 VALORANTIGO,'
      '        0.00 VALORNOVO,'
      '        0.00 VALORDIF,'
      '        0.00 VALORTOTAL'
      'FROM DUAL'
      'WHERE 1=2'
      'ORDER BY MESREFERENCIA, IDPESSOA, IDCONTRIBUICAO'
      '')
    UpdateObject = updVirtualContrib
    ValidateWithMask = True
    Left = 109
    Top = 49
  end
  object qryHstContrib: TwwQuery
    DatabaseName = 'BaseDados'
    ParamCheck = False
    SQL.Strings = (
      
        'SELECT HST.MESREFERENCIA,    HST.MESCOBRANCA, '#9'HST.VALORESPERADO' +
        ','
      '       HST.VALORESPERADO, HST.IDCONTRIBUICAO,'
      '       C.NOME CONTRIBUICAO, CP.IDREGRACALCULO,'
      '       CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3,'
      '       CP.IDCONTRIBPAI, CP.IDCONTRIBPAI2, CP.IDCONTRIBPAI3,'
      '       ASSOC1.FLGPAGADOR AS FLGPAGADORASSOC1,'
      '       ASSOC2.FLGPAGADOR AS FLGPAGADORASSOC2,'
      '       ASSOC3.FLGPAGADOR AS FLGPAGADORASSOC3'
      ''
      'FROM  HSTCONTRIBPREV HST,'
      '      CONTRIBPREVPARTP CPP,'
      '      CONTPREVEVENTO CPE,'
      '      CONTPREV CP,'
      '      CONTPREV ASSOC1,'
      '      CONTPREV ASSOC2,'
      '      CONTPREV ASSOC3,'
      '      CONTRIBUICAO C'
      ''
      'WHERE HST.MESREFERENCIA '#9'= :MESREFERENCIA'
      '  AND HST.MESCOBRANCA   '#9'= HST.MESREFERENCIA'
      '  AND HST.IDPESSOA '#9#9'= :IDPESSOA'
      '  AND CPE.IDEVENTOGERADOR '#9'= :IDEVENTOGERADOR'
      '  AND CPP.IDPESSOA '#9#9'= HST.IDPESSOA'
      '  AND CPE.IDPLANOPREV '#9#9'= HST.IDPLANOPREV'
      '  AND CPP.IDCONTRIBUICAO '#9'= HST.IDCONTRIBUICAO'
      '  AND CPE.IDCONTRIBUICAO        = HST.IDCONTRIBUICAO'
      '  AND C.IDCONTRIBUICAO          = HST.IDCONTRIBUICAO'
      '  AND CP.IDCONTRIBUICAO'#9'        = HST.IDCONTRIBUICAO'
      '  AND CP.IDPLANOPREV'#9' '#9'= HST.IDPLANOPREV'
      '  AND CP.IDPLANOPREV'#9#9'= ASSOC1.IDPLANOPREV(+)'
      '  AND CP.IDCONTRIBPAI'#9#9'= ASSOC1.IDCONTRIBUICAO(+)'
      '  AND CP.IDPLANOPREV'#9#9'= ASSOC2.IDPLANOPREV(+)'
      '  AND CP.IDCONTRIBPAI2'#9#9'= ASSOC2.IDCONTRIBUICAO(+)'
      '  AND CP.IDPLANOPREV'#9#9'= ASSOC3.IDPLANOPREV(+)'
      '  AND CP.IDCONTRIBPAI3'#9#9'= ASSOC3.IDCONTRIBUICAO(+)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 806
    Top = 556
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end>
  end
  object qryAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALTERADOR,DESCRICAO'
      'FROM   TIPOALTERADOR'
      'WHERE (RECPAG = :RECPAG)'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 508
    Top = 1
    ParamData = <
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end>
  end
  object qryCorrecaoBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALTERADOR, IDREGRACALCULO, IDRUBNORMAL, IDRUBDEVOLUCAO'
      'FROM ALTERADORXBENEF'
      'WHERE IDPLANOPREV = :IDPLANOPREV'
      'AND IDBENEFICIO = :IDBENEFICIO'
      'AND FLGCOBRA = 1'
      'AND FLGATRASO = :PFLGATRASO'
      'AND FLGDEVOL = :PFLGDEVOL'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 368
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGATRASO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGDEVOL'
        ParamType = ptUnknown
      end>
  end
  object qryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  B.IDBENEFICIO, B.TIPOBENEFICIO,'
      
        '        DECODE(BG.IDBENEFICIO, NULL, B.NOME, '#39'Grupo '#39'||G.DESCRIC' +
        'AO) AS NOME ,'
      '        B.NOME AS NOMEBENEFICIO,'
      
        '        DECODE(BG.IDGRUPOBENEF, NULL, -1, BG.IDGRUPOBENEF) AS ID' +
        'GRUPOBENEF,'
      '        B.FLGDESTBENEF, B.IDEVENTOGERADOR,'
      '        B.FLGRESGATE, B.FLGBENEFOBRIGATO, B.NUMORDEMEVENTO,'
      
        '        B.FLGASSOCBENEFREF, B.IDTPPAGTOBENEFIC, B.PRAZOPROVISORI' +
        'O,'
      '        BP.IDREGRACALCULO,  BP.IDREGRASIMULA,'
      
        '        BP.IDREGRAPAGAMENTO, BP.IDREGRAELEGIBILI, BP.FLGACEITAOP' +
        'CAO,'
      '        BP.NOMEVALORBASE1, BP.NOMEVALORBASE2, BP.NOMEVALORBASE3,'
      
        '        BP.NUMOPCOES,BP.FLGEDITAOP1, BP.FLGEDITAOP2, BP.FLGEDITA' +
        'OP3,'
      
        '        BP.IDREGRAINICIO, BP.IDREGRAFIM, BP.IDREGRACALCINSS, BP.' +
        'IDBENEFREF,'
      
        '        BP.FLGQUITAPREVIDEN, BP.FLGQUITAEMPRESTI, BP.FLGQUITAASS' +
        'ISTEN,'
      '        BP.MESREAJBENEF, BP.INDICEREAJBENEF, BP.FLGCALCTODOMES,'
      
        '        BP.IDREGRAREAJBENEF, BP.IDREGRAPRIMPAGTO, BP.IDREGRAULTP' +
        'AGTO,'
      
        '        BP.CODPORTFORMA,    BP.FLGOBRIGANPROC, B.FLGUSADTPREVISA' +
        'O,'
      
        '        BP.FLGREFERENCIA,  BP.FLGOBRIGAOP1, BP.FLGOBRIGAOP2, BP.' +
        'FLGOBRIGAOP3,'
      '        BP.FLGBENEFINF'
      
        'FROM   BENEFICIO B, BENEFPLANPREV BP, BENEFXGRUPO BG, GRUPOBENEF' +
        ' G'
      'WHERE  B.IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'AND    BP.IDPLANOPREV    = :IDPLANOPREV'
      'AND    BP.FLGREFERENCIA = 0'
      'AND    BP.IDBENEFICIO   = B.IDBENEFICIO'
      'AND    BP.IDPLANOPREV   = BG.IDPLANOPREV(+)'
      'AND    BP.IDBENEFICIO   = BG.IDBENEFICIO(+)'
      'AND    BG.IDGRUPOBENEF =  G.IDGRUPOBENEF(+)'
      'AND    ((1 = BG.FLGPRINCIPAL)  OR (BG.FLGPRINCIPAL IS NULL )) ')
    ControlType.Strings = (
      'FLGBENEFOBRIGATO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 969
    Top = 18
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object updBenefAUX: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFBFCIARIO'
      'set'
      '  NUMEROPROCESSO = :NUMEROPROCESSO,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDTITULAR = :IDTITULAR,'
      '  IDPESSOA = :IDPESSOA,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  IDSITBENEFICIO = :IDSITBENEFICIO,'
      '  IDDEPENDENCIA = :IDDEPENDENCIA,'
      '  IDTPPAGTOBENEFIC = :IDTPPAGTOBENEFIC,'
      '  VALORATUAL = :VALORATUAL,'
      '  DATAREQUERIMENTO = :DATAREQUERIMENTO,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  FLGFORMAPAGTO = :FLGFORMAPAGTO,'
      '  VALORCALCULADO = :VALORCALCULADO,'
      '  DATAULTREAJUSTE = :DATAULTREAJUSTE,'
      '  VLRCALCINSS = :VLRCALCINSS,'
      '  VLRINFINSS = :VLRINFINSS,'
      '  DATAINICIOINSS = :DATAINICIOINSS,'
      '  NUMPROCINSS = :NUMPROCINSS,'
      '  DATAINICIOFUND = :DATAINICIOFUND,'
      '  VALORCOTAS = :VALORCOTAS,'
      '  DATACONCESSAO = :DATACONCESSAO,'
      '  FLGPROVISORIO = :FLGPROVISORIO,'
      '  PERCPROVISORIO = :PERCPROVISORIO,'
      '  PRAZOPROVISORIO = :PRAZOPROVISORIO,'
      '  ULTMESREAJUSTE = :ULTMESREAJUSTE,'
      '  ULTVALORATUALREAJ = :ULTVALORATUALREAJ,'
      '  IDAGENCIARESGATE = :IDAGENCIARESGATE,'
      '  DATAFINALPREVISTA = :DATAFINALPREVISTA,'
      '  VALORTOTAL = :VALORTOTAL'
      'where'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    InsertSQL.Strings = (
      'insert into BENEFBFCIARIO'
      '  (NUMEROPROCESSO, IDPESSJUR, IDPLANOPREV, IDTITULAR, IDPESSOA, '
      'SEQPROPOSTA, '
      '   IDBENEFICIO, CODPORTFORMA, IDSITBENEFICIO, IDDEPENDENCIA, '
      'IDTPPAGTOBENEFIC, '
      '   VALORATUAL, DATAREQUERIMENTO, DATAINICIO, DATAFINAL,    '
      'FLGFORMAPAGTO, VALORCALCULADO, DATAULTREAJUSTE, VLRCALCINSS, '
      'VLRINFINSS, '
      '   DATAINICIOINSS, NUMPROCINSS, DATAINICIOFUND, VALORCOTAS, '
      'DATACONCESSAO, '
      '   FLGPROVISORIO, PERCPROVISORIO, PRAZOPROVISORIO, '
      'ULTMESREAJUSTE, ULTVALORATUALREAJ, '
      '   IDAGENCIARESGATE, DATAFINALPREVISTA, VALORTOTAL)'
      'values'
      
        '  (:NUMEROPROCESSO, :IDPESSJUR, :IDPLANOPREV, :IDTITULAR, :IDPES' +
        'SOA, '
      ':SEQPROPOSTA, '
      
        '   :IDBENEFICIO, :CODPORTFORMA, :IDSITBENEFICIO, :IDDEPENDENCIA,' +
        ' '
      ':IDTPPAGTOBENEFIC, '
      '   :VALORATUAL, :DATAREQUERIMENTO, :DATAINICIO, :DATAFINAL,    '
      
        ':FLGFORMAPAGTO, :VALORCALCULADO, :DATAULTREAJUSTE, :VLRCALCINSS,' +
        ' '
      ':VLRINFINSS, '
      '   :DATAINICIOINSS, :NUMPROCINSS, :DATAINICIOFUND, :VALORCOTAS, '
      ':DATACONCESSAO, '
      '   :FLGPROVISORIO, :PERCPROVISORIO, :PRAZOPROVISORIO, '
      ':ULTMESREAJUSTE, '
      '   :ULTVALORATUALREAJ, :IDAGENCIARESGATE, :DATAFINALPREVISTA, '
      ':VALORTOTAL)')
    DeleteSQL.Strings = (
      'delete from BENEFBFCIARIO'
      'where'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    Left = 586
    Top = 41
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOTIVO, DESCRICAO'
      'FROM MOTIVO'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 594
    Top = 5
  end
  object qryAtualiza: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 996
    Top = 35
  end
  object qrySituacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT E.IDSITFUNC, P.IDSITPART, P.IDSITPLANOPREV, P.INSCRICAODA' +
        'TA,'
      '        P.DATACANCELAMENTO'
      'FROM ELEGPATRO E, PARTPREVPLAN P'
      'WHERE E.IDPESSOA = :IDPESSOA'
      '  AND P.IDPESSOA = E.IDPESSOA'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 945
    Top = 505
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BF.NUMEROPROCESSO,   BF.IDPESSJUR,      BF.IDPLANOPREV,'
      '       BF.IDTITULAR,        BF.IDPESSOA,       BF.SEQPROPOSTA,'
      '       BF.IDBENEFICIO,      BF.PERCENTUAL,          '
      '       BF.CODPORTFORMA,     BF.IDSITBENEFICIO, BF.IDDEPENDENCIA,'
      
        '       BF.IDTPPAGTOBENEFIC, BF.VALORATUAL,     BF.DATAREQUERIMEN' +
        'TO,'
      '       BF.DATAINICIO,       BF.DATAFINAL,      '
      
        '       BF.FLGFORMAPAGTO,    BF.VALORCALCULADO, BF.DATAULTREAJUST' +
        'E,'
      
        '       BF.VLRCALCINSS,      BF.VLRINFINSS,     BF.DATAINICIOINSS' +
        ','
      '       BF.NUMPROCINSS,      BF.DATAINICIOFUND, BF.VALORCOTAS,'
      
        '       BF.DATACONCESSAO,    BF.FLGPROVISORIO,  BF.PERCPROVISORIO' +
        ','
      
        '       BF.PRAZOPROVISORIO,  BF.ULTMESREAJUSTE, BF.ULTVALORATUALR' +
        'EAJ,'
      '       BF.IDAGENCIARESGATE, BF.DATAFINALPREVISTA,'
      '       BF.FLGDATAPREVISTA,  BF.FLGTIPOINSS,    BF.DIBBENEFANT,'
      
        '       BF.VALORBENEFANT,    BF.VALORBINSSANT1, BF.VALORBINSSANT2' +
        ', BF.VALORBINSSANT3,'
      
        '       BF.VALORTOTAL,       BF.FLGPOSSUIACOMPINSS, BF.FLGBENEFMI' +
        'N,'
      '       BF.VALORSRB,         BF.IDBENEFREFEREN,'
      '       BPL.FLGREFERENCIA,'
      '       B.NUMORDEMEVENTO,    B.NOME,            S.DESCRICAO,'
      '       B.FLGRESGATE,        BPART.VALORBASE1,  BPART.VALORBASE2,'
      '       BPART.VALORBASE3,    PT.IDRUBSALAUXDOENCA,'
      
        '       BPL.IDREGRAPRIMPAGTO,BPL.IDREGRAULTPAGTO, B.IDTPPAGTOBENE' +
        'FIC,'
      '       BPL.IDREGRAPAGAATRASO, BPL.CODALTERADORCORR,'
      
        '       BPL.FLGCALCTODOMES, BPL.IDREGRASIMULA, PB.IDEVENTOGERADOR' +
        ','
      '       PB.DTEVENTO, PB.DTDIREITO, PB.DTREGISTRO,'
      '       PB.IDSITPROCESSO, BPL.IDRGVALORTOTAL,'
      '       BENEF.NOME  BENEFICIARIO, DEP.NUMSEQUENCIA'
      
        'FROM   BENEFBFCIARIO BF, PROCESSOBENEF PB, BENEFICIO B, BENEFPLA' +
        'NPREV BPL,'
      
        '       SITBENEFICIO S, BENEFPLANOPART BPART, PATRO PT, PESSOA BE' +
        'NEF,'
      '       DEPENTIT DEP'
      'WHERE  BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    BF.IDPESSOA       = :IDPESSOA'
      'AND    BF.IDTITULAR      = :IDTITULAR'
      'AND    PB.NUMEROPROCESSO = BF.NUMEROPROCESSO'
      'AND    B.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND    BPL.IDBENEFICIO   = BF.IDBENEFICIO'
      'AND    BPL.IDPLANOPREV   = BF.IDPLANOPREV'
      'AND    BF.IDPESSJUR      = PT.IDPESSOA'
      'AND    BENEF.IDPESSOA    = BF.IDPESSOA'
      'AND    DEP.IDPESSOA      = BF.IDPESSOA'
      
        'AND    ((BPL.FLGREFERENCIA = 0) OR ((BPL.FLGREFERENCIA = 1) AND ' +
        '(BPL.FLGPAGAINSS = 1) ) )'
      'AND    BF.IDSITBENEFICIO = S.IDSITBENEFICIO'
      'AND    BF.IDTITULAR      = BPART.IDPESSOA(+)'
      'AND    BF.SEQPROPOSTA    = BPART.SEQPROPOSTA(+)'
      'AND    BF.IDPESSJUR      = BPART.IDPESSJUR(+)'
      'AND    BF.IDPLANOPREV    = BPART.IDPLANOPREV(+)'
      'AND    BF.IDBENEFICIO    = BPART.IDBENEFICIO(+)'
      'ORDER  BY BF.IDBENEFICIO')
    ControlType.Strings = (
      'FLGPROVISORIO;CheckBox;1;0'
      'FLGPOSSUIACOMPINSS;CheckBox;1;0')
    PictureMasks.Strings = (
      
        'PERCPROVISORIO'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-' +
        ']#[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#' +
        '][#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#]' +
        '[#]]]}'#9'T'#9'F')
    ValidateWithMask = True
    Left = 1024
    Top = 23
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object qryBenefAUX: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BF.NUMEROPROCESSO,   BF.IDPESSJUR,      BF.IDPLANOPREV,'
      '       BF.IDTITULAR,        BF.IDPESSOA,       BF.SEQPROPOSTA,'
      '       BF.IDBENEFICIO,'
      '       BF.CODPORTFORMA,     BF.IDSITBENEFICIO, BF.IDDEPENDENCIA,'
      
        '       BF.IDTPPAGTOBENEFIC, BF.VALORATUAL,     BF.DATAREQUERIMEN' +
        'TO,'
      '       BF.DATAINICIO,       BF.DATAFINAL,      '
      
        '       BF.FLGFORMAPAGTO,    BF.VALORCALCULADO, BF.DATAULTREAJUST' +
        'E,'
      
        '       BF.VLRCALCINSS,      BF.VLRINFINSS,     BF.DATAINICIOINSS' +
        ','
      '       BF.NUMPROCINSS,      BF.DATAINICIOFUND, BF.VALORCOTAS,'
      
        '       BF.DATACONCESSAO,    BF.FLGPROVISORIO,  BF.PERCPROVISORIO' +
        ','
      
        '       BF.PRAZOPROVISORIO,  BF.ULTMESREAJUSTE, BF.ULTVALORATUALR' +
        'EAJ,'
      '       BF.VALORTOTAL,       BF.FLGPOSSUIACOMPINSS, '
      '       BF.IDAGENCIARESGATE, BF.DATAFINALPREVISTA,'
      '       BPART.VALORBASE1, BPART.VALORBASE2, BPART.VALORBASE3,'
      '       B.NUMORDEMEVENTO, BPL.FLGCALCTODOMES'
      'FROM   BENEFBFCIARIO BF, BENEFPLANOPART BPART, BENEFICIO B,'
      '       BENEFPLANPREV BPL'
      'WHERE  BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    B.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND    BF.IDTITULAR      = BPART.IDPESSOA(+)'
      'AND    BF.SEQPROPOSTA    = BPART.SEQPROPOSTA(+)'
      'AND    BF.IDPESSJUR      = BPART.IDPESSJUR(+)'
      'AND    BF.IDPLANOPREV    = BPART.IDPLANOPREV(+)'
      'AND    BF.IDBENEFICIO    = BPART.IDBENEFICIO(+)'
      'AND    BPL.IDPLANOPREV   = BF.IDPLANOPREV'
      'AND    BPL.IDBENEFICIO   = BF.IDBENEFICIO'
      'ORDER BY B.NUMORDEMEVENTO DESC'
      ' '
      ' '
      ' ')
    UpdateObject = updBenefAUX
    ValidateWithMask = True
    Left = 1154
    Top = 65532
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
  end
  object QryContrib1: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 290
    Top = 80
  end
  object qryPassagem: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 604
    Top = 35
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPLANOPREV, P.NOME'
      'FROM   PLANPREV P'
      
        'WHERE  IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO' +
        ' PLP, PATRO P'
      '                       WHERE   P.IDFUNDACAO  = :IDFUNDACAO'
      '                       AND     PLP.IDPESSJUR = P.IDPESSOA )'
      'ORDER  BY p.NOME'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 707
    Top = 7
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  P.IDPESSOA = PT.IDPESSOA'
      'AND    PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY p.NOME'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 715
    Top = 65516
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object savedlg: TSaveDialog
    Title = 'Salvar resultado '
    Left = 33
    Top = 267
  end
  object printdlg: TPrintDialog
    Left = 99
    Top = 270
  end
  object qryPessoasATratar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM'
      '(SELECT 2 AS ORDEM, P.IDPESSOA, P.NOME'
      ' FROM   PESSOA P, PATRO PT'
      ' WHERE  P.IDPESSOA = PT.IDPESSOA'
      ' UNION'
      ' SELECT 1 AS ORDEM, -1 AS IDPESSOA, '#39'Todas'#39' AS NOME'
      ' FROM   DUAL'
      ')'
      'ORDER BY ORDEM, NOME'
      ' ')
    ValidateWithMask = True
    Left = 1044
    Top = 516
  end
  object qryContribNoMes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM'
      '(SELECT 2 AS ORDEM, P.IDPESSOA, P.NOME'
      ' FROM   PESSOA P, PATRO PT'
      ' WHERE  P.IDPESSOA = PT.IDPESSOA'
      ' UNION'
      ' SELECT 1 AS ORDEM, -1 AS IDPESSOA, '#39'Todas'#39' AS NOME'
      ' FROM   DUAL'
      ')'
      'ORDER BY ORDEM, NOME'
      ' ')
    ValidateWithMask = True
    Left = 1094
    Top = 11
  end
  object qryContribuicao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  1 AS PROCESSA, C.IDCONTRIBUICAO, C.NOME'
      'FROM'
      '  CONTRIBUICAO C'
      'WHERE'
      '  IDCONTRIBUICAO IN (SELECT'
      '                       CP.IDCONTRIBUICAO'
      '                     FROM'
      '                       CONTPREV CP, PLANPREVPATRO PLP, PATRO P'
      '                     WHERE'
      '                           P.IDFUNDACAO  = :IDFUNDACAO'
      
        '                       AND ( (:IDPATRO IS NOT NULL AND PLP.IDPES' +
        'SJUR = :IDPATRO) OR (:IDPATRO IS NULL))'
      
        '                       AND ( (:IDPLANOPREV IS NOT NULL AND PLP.I' +
        'DPLANOPREV = :IDPLANOPREV) OR (:IDPLANOPREV IS NULL))'
      '                       AND PLP.IDPESSJUR = P.IDPESSOA'
      '                       AND CP.IDPLANOPREV = PLP.IDPLANOPREV'
      '                 )'
      'ORDER BY'
      '  C.NOME')
    UpdateObject = updContribuicao
    ControlType.Strings = (
      'PROCESSA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 762
    Top = 11
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end>
  end
  object updContribuicao: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRIBUICAO'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO')
    InsertSQL.Strings = (
      'insert into CONTRIBUICAO'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from CONTRIBUICAO'
      'where'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO')
    Left = 1149
    Top = 32
  end
  object dsContribuicao: TwwDataSource
    DataSet = qryContribuicao
    Left = 1186
    Top = 65529
  end
  object pMnu: TPopupMenu
    Left = 1072
    Top = 590
    object DesmarcarTodas1: TMenuItem
      Caption = 'Desmarcar Todas'
      OnClick = DesmarcarTodas1Click
    end
    object MarcarTodas1: TMenuItem
      Caption = 'Marcar Todas'
      OnClick = MarcarTodas1Click
    end
  end
  object qryRateio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM'
      '(SELECT 2 AS ORDEM, P.IDPESSOA, P.NOME'
      ' FROM   PESSOA P, PATRO PT'
      ' WHERE  P.IDPESSOA = PT.IDPESSOA'
      ' UNION'
      ' SELECT 1 AS ORDEM, -1 AS IDPESSOA, '#39'Todas'#39' AS NOME'
      ' FROM   DUAL'
      ')'
      'ORDER BY ORDEM, NOME'
      ' ')
    ValidateWithMask = True
    Left = 1029
    Top = 540
  end
  object qryFormaAcerto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 AS FLGDESCFOLHA, '#39'Banco'#39' AS DESCRICAO FROM DUAL UNION'
      'SELECT 1 AS FLGDESCFOLHA, '#39'Folha'#39' AS DESCRICAO FROM DUAL '
      '')
    ValidateWithMask = True
    Left = 988
    Top = 520
  end
  object qryIncluiAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT 0 AS FLGINCLUIALTERADOR, '#39'Não'#39' AS DESCRICAO FROM DUAL UNI' +
        'ON'
      'SELECT 1 AS FLGINCLUIALTERADOR, '#39'Sim'#39' AS DESCRICAO FROM DUAL'
      ''
      ' ')
    ValidateWithMask = True
    Left = 1097
    Top = 542
  end
  object qryFormaBanco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 AS FLGDESCFOLHA, '#39'Banco'#39' AS DESCRICAO FROM DUAL ')
    ValidateWithMask = True
    Left = 1103
    Top = 591
  end
  object qryBeneficioEscolher: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  1 AS PROCESSA, B.IDBENEFICIO, B.NOME,'
      
        '  (SELECT DISTINCT FONTEPAGADORA FROM BENEFBFCIARIO  WHERE IDBEN' +
        'EFICIO = B.IDBENEFICIO AND ROWNUM <= 1) AS FONTEPAGADORA'
      'FROM'
      '  BENEFICIO B'
      'WHERE'
      '  IDBENEFICIO IN (SELECT'
      '                    BP.IDBENEFICIO'
      '                  FROM'
      '                    BENEFPLANPREV BP, PLANPREVPATRO PLP, PATRO P'
      '                  WHERE'
      '                        P.IDFUNDACAO  = :IDFUNDACAO'
      
        '                    AND ( (:IDPATRO IS NOT NULL AND PLP.IDPESSJU' +
        'R = :IDPATRO) OR (:IDPATRO IS NULL))'
      
        '                    AND ( (:IDPLANOPREV IS NOT NULL AND PLP.IDPL' +
        'ANOPREV = :IDPLANOPREV) OR (:IDPLANOPREV IS NULL))'
      '                    AND PLP.IDPESSJUR = P.IDPESSOA'
      '                    AND BP.IDPLANOPREV = PLP.IDPLANOPREV'
      '                 )'
      'ORDER BY'
      '  B.NOME'
      ''
      ' ')
    UpdateObject = updBeneficioEscolher
    ControlType.Strings = (
      'PROCESSA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 1279
    Top = 567
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end>
  end
  object dsBeneficioEscolher: TwwDataSource
    DataSet = qryBeneficioEscolher
    Left = 1279
    Top = 584
  end
  object updBeneficioEscolher: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFICIO'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    InsertSQL.Strings = (
      'insert into BENEFICIO'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from BENEFICIO'
      'where'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    Left = 700
    Top = 555
  end
  object qryLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT C.IDLOTE, C.DESCRICAO, C.MESREFERENCIA, 0 AS FECHALOTE, N' +
        'VL(C.FLGINCLUIMESCONC,1) FLGINCLUIMESCONC, C.DATAPAGAMENTO'
      'FROM   CTRLINTERFACE C'
      'WHERE  C.FLGPREPARADO = 1'
      'AND    C.TIPO = '#39'B'#39
      'AND    C.FLGCONCESSAO =1'
      'AND    C.FLGIDATMP = 0'
      'AND    C. FLGRESGATE = 0 '
      'AND    C.FLGLOTEPROCESSADO = 0'
      'ORDER BY C.MESREFERENCIA DESC, C.IDLOTE DESC, C.DESCRICAO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 1276
    Top = 596
  end
  object qryBenefbfciario: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 912
    Top = 533
  end
  object pMnuBenef: TPopupMenu
    Left = 1156
    Top = 602
    object MenuItem1: TMenuItem
      Caption = 'Desmarcar Todas'
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = 'Marcar Todas'
      OnClick = MenuItem2Click
    end
  end
  object qryContribuicoes: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 855
    Top = 558
  end
  object qryDemonstrativo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT '#39'0000/00'#39' AS ANOMES,'
      '       0 AS BENEFICIOPAGO,'
      '       0 AS BENEFICIODEVIDO,'
      '       0 AS CONTRIBDESCONTADA,'
      '       0 AS CONTRIBDEVIDA,'
      '       0 AS DIFBENEFICIO,'
      '       0 AS DIFCONTRIBUICAO,'
      '       0 AS BSDEVIDO,'
      '       0 AS FABDEVIDO,'
      '       0 AS VLRBASEDEFICIT,'
      '       0 AS IDPESSJUR,'
      '       0 AS SEQPROPOSTA,'
      '       0 AS SRBANTES,'
      '       0 AS SRBDEPOIS,'
      '       0 AS CONTRIB1,'
      '       0 AS CONTRIB2,'
      '       0 AS CONTRIB3,'
      '       0 AS CONTRIB4,'
      '       0 AS CODCONTRIB1,'
      '       0 AS CODCONTRIB2,'
      '       0 AS CODCONTRIB3,'
      '       0 AS CODCONTRIB4,'
      '       0 AS RESERVAANTES,'
      '       0 AS RESERVADEPOIS,'
      '       0 AS SALVIRTUALANTES,'
      '       0 AS SALVIRTUALDEPOIS,'
      '       0 AS VALORANTES,'
      '       0 AS VALORDEPOIS,'
      '       0 AS DIFERENCA,'
      '       0 AS DIFERENCACORRIGIDA,'
      '       1 AS INDICE,'
      '       0 AS IDENTIFICADOR,'
      '       '#39'                              '#39' AS DESCRICAO,'
      '       '#39' '#39' AS TIPO,'
      '       1 AS IDTITULAR,'
      '       1 AS IDPLANOPREV,'
      '       1 AS IDPESSOA,'
      
        '       '#39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' ' +
        'AS NOMEBENEF,'
      '       1 AS NUMEROPROCESSO,'
      '       '#39'YYYY/MM'#39' AS DATAINICIO'
      'FROM'
      '       DUAL'
      ''
      ''
      ''
      ' ')
    UpdateObject = updDemonstrativo
    ValidateWithMask = True
    Left = 1008
    Top = 589
  end
  object updDemonstrativo: TUpdateSQL
    ModifySQL.Strings = (
      
        'UPDATE CONTRIBUICAO SET NOME = :NOME WHERE IDCONTRIBUICAO=:IDCON' +
        'TRIBUICAO')
    InsertSQL.Strings = (
      
        'INSERT INTO CONTRIBUICAO (IDCONTRIBUICAO) VALUES (:IDCONTRIBUICA' +
        'O)')
    Left = 903
    Top = 575
  end
  object dsLote: TwwDataSource
    DataSet = qryLote
    Left = 123
    Top = 6
  end
  object qryListaBeneficio: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '  B.IDBENEFICIO, B.NOME'
      'FROM'
      '  BENEFICIO B, BENEFPLANPREV BP'
      'WHERE'
      '  B.IDBENEFICIO = BP.IDBENEFICIO AND'
      '  BP.IDPLANOPREV = :IDPLANOPREV'
      'ORDER BY'
      '  B.NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 470
    Top = 54
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryBeneficiosTrocar: TwwQuery
    CachedUpdates = True
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       -1 AS NOVOIDBENEFICIO,'
      
        '       '#39'                                                        ' +
        '    '#39' AS NOVONOME,'
      '       SYSDATE AS NOVADATAINICIO,'
      
        '       BP.FLGCALCTODOMES,     B.NOME,               BP.IDREGRAUL' +
        'TPAGTO,'
      '       BP.IDREGRACALCULO,     BP.FLGREFERENCIA,'
      
        '       BF.IDPLANOPREV,        BF.IDBENEFICIO,       BF.NUMEROPRO' +
        'CESSO,'
      
        '       BF.IDPESSJUR,          BF.IDTITULAR,         BF.IDPLANOOR' +
        'IGEM,'
      '       BF.IDPESSOA,           BF.SEQPROPOSTA,       BF.VALORSRB,'
      
        '       BF.VALORATUAL,         BF.VALORTOTAL,        BF.VALORCOTA' +
        'S,'
      
        '       BF.DATAFINAL,          BF.IDSITBENEFICIO,    BF.FLGDATAPR' +
        'EVISTA,'
      
        '       BF.DATAINICIO,         BF.ULTMESREAJUSTE,    P.IDEVENTOGE' +
        'RADOR,'
      '       BF.CODPORTFORMA,       B.FLGBENEFTEMP,'
      '       PP.FLGSALVIRTBENEF,'
      '       EG.FLGINTERNO AS FLGINTEVENTO,'
      '       BF.VALORATUAL AS NOVOVALORATUAL,'
      '       BF.VALORTOTAL AS NOVOVALORTOTAL,'
      '       BF.VALORSRB   AS NOVOSRB,'
      '       BF.Fontepagadora,'
      '       BAUX.NUMBENEF'
      
        'FROM   PROCESSOBENEF P, BENEFBFCIARIO BF, BENEFPLANPREV BP, BENE' +
        'FICIO B, EVENTOGERADOR EG,'
      '       PARTPREVPLAN PP,'
      
        '       ( SELECT IDBENEFICIO, COUNT(DISTINCT IDPESSOA) AS NUMBENE' +
        'F'
      '         FROM   BENEFBFCIARIO'
      '         WHERE  NUMEROPROCESSO = :NUMEROPROCESSO'
      '         AND    IDSITBENEFICIO <> 3'
      '         GROUP BY IDBENEFICIO ) BAUX'
      'WHERE  BF.IDPESSJUR   = :IDPESSJUR'
      'AND    BF.IDPLANOPREV = :IDPLANOPREV'
      'AND    BF.IDTITULAR   = :IDTITULAR'
      'AND    BF.NUMEROPROCESSO  = :NUMEROPROCESSO'
      'AND    B.IDBENEFICIO      = BF.IDBENEFICIO'
      'AND    BP.IDPLANOPREV     = BF.IDPLANOPREV'
      'AND    BP.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND    P.NUMEROPROCESSO   = BF.NUMEROPROCESSO'
      'AND    EG.IDEVENTOGERADOR = P.IDEVENTOGERADOR'
      'AND    PP.IDPESSJUR       = BF.IDPESSJUR'
      'AND    PP.IDPLANOPREV     = BF.IDPLANOORIGEM'
      'AND    PP.IDPESSOA        = BF.IDTITULAR'
      'AND    PP.SEQPROPOSTA     = BF.SEQPROPOSTA'
      ''
      ''
      ''
      ''
      ' '
      ' ')
    UpdateObject = updBeneficiosTrocar
    ControlType.Strings = (
      'NOVOIDBENEFICIO;CustomEdit;dblkpcmbListaBeneficio'
      'NOVONOME;CustomEdit;DbLkEscolheBeneficio')
    ValidateWithMask = True
    Left = 140
    Top = 76
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
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
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
  end
  object dsBeneficiosTrocar: TwwDataSource
    DataSet = qryBeneficiosTrocar
    Left = 76
    Top = 440
  end
  object updBeneficiosTrocar: TUpdateSQL
    ModifySQL.Strings = (
      
        'UPDATE CONTRIBUICAO SET NOME = :NOME WHERE IDCONTRIBUICAO=:IDCON' +
        'TRIBUICAO')
    InsertSQL.Strings = (
      
        'INSERT INTO CONTRIBUICAO (IDCONTRIBUICAO) VALUES (:IDCONTRIBUICA' +
        'O)')
    Left = 14
    Top = 440
  end
  object updReservaPart: TUpdateSQL
    ModifySQL.Strings = (
      'update RESERVAPART'
      'set'
      '  IDTIPORESERVA = :IDTIPORESERVA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPESSOA = :IDPESSOA,'
      '  VALORRESERVA = :VALORRESERVA,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  IDPARTICIPANTE = :IDPARTICIPANTE'
      'where'
      '  IDTIPORESERVA = :OLD_IDTIPORESERVA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    InsertSQL.Strings = (
      'insert into RESERVAPART'
      
        '  (IDTIPORESERVA, IDPLANOPREV, IDPESSJUR, IDPESSOA, VALORRESERVA' +
        ', SEQPROPOSTA, '
      '   IDPARTICIPANTE)'
      'values'
      
        '  (:IDTIPORESERVA, :IDPLANOPREV, :IDPESSJUR, :IDPESSOA, :VALORRE' +
        'SERVA, '
      '   :SEQPROPOSTA, :IDPARTICIPANTE)')
    DeleteSQL.Strings = (
      'delete from RESERVAPART'
      'where'
      '  IDTIPORESERVA = :OLD_IDTIPORESERVA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 811
    Top = 47
  end
  object qryReservaPart: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT RP.IDTIPORESERVA,        RP.IDPLANOPREV,   RP.IDPESSJUR, ' +
        '       RP.IDPESSOA,'
      
        '       RP.DATAREFERENCIASA,     RP.VALORRESERVA,  RP.PERCENTUALS' +
        'AQUE,  RP.SEQPROPOSTA,'
      
        '       PF.DATANASC,             EL.DATAADMISSAO,  R.NOME,       ' +
        '       R.CODHIERARQUIA,'
      '       R.INDICEREAJUSTE,        R.FLGDESCIRRF,       M.MOESIGLA,'
      '       R.FLGCONTROLE,'
      '       RP.IDPARTICIPANTE'
      
        'FROM   RESERVAPART RP, RESERVAXPLANO R, MOEDA M, PESSOAFISICA PF' +
        ', ELEGPATRO EL'
      'WHERE  RP.IDPESSJUR         = :IDPESSJUR AND'
      '       RP.IDPLANOPREV       = :IDPLANOPREV AND'
      '       RP.IDPESSOA          = :IDTITULAR AND'
      '       PF.IDPESSOA          = RP.IDPESSOA AND'
      '       EL.IDPESSOA          = RP.IDPESSOA AND'
      '       EL.IDPESSJUR         = :IDPESSJUR AND'
      '       RP.SEQPROPOSTA       = :SEQPROPOSTA AND'
      '       RP.FLGATIVO          = 1 AND'
      '       RP.IDTIPORESERVA     = R.IDTIPORESERVA AND'
      '       RP.IDPLANOPREV       = R.IDPLANOPREV AND'
      '       R.ANALITICOSINTETI   = '#39'A'#39' AND'
      '       R.FLGTIPORESERVA     = 0   AND '
      '       R.INDICEREAJUSTE     = M.MOECODIGO(+)'
      'ORDER BY R.FLGCONTROLE , R.CODHIERARQUIA')
    UpdateObject = updReservaPart
    ValidateWithMask = True
    Left = 816
    Top = 45
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
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object qryDadosPESSOA: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT PF.DATANASC,'
      'PF.DATAMORTE,'
      'DP.IDDEPENDENCIA,'
      'PF.ESTCIVIL,'
      'PF.SEXO,'
      'PF.FLGMOLESTIAGRAVE,'
      'P.FLGINVALIDO,'
      'PF.FLGISENTOIRRF,'
      'EL.FLGDIRETOR,'
      'EL.DATAADMISSAO,'
      'PP.INSCRICAODATA,'
      'PP.IDSITPART,'
      'EL.DATADEMISSAO,'
      'EL.DATAREADMISSAO,'
      'EL.TEMPOSERVANTERIOR,'
      'EL.CODVINCULAFUNC,'
      'ST.DESCRICAO'
      
        'FROM   PESSOA P, PESSOAFISICA PF, ELEGPATRO EL, PARTPREVPLAN PP,' +
        ' DEPENTIT DP, SITPART ST'
      'WHERE  DP.IDTITULAR   = :IDTITULAR'
      'AND    DP.IDPESSOA    = :IDPESSOA'
      'AND    PP.IDPESSJUR   = :IDPESSJUR'
      'AND    PP.IDPLANOPREV = :IDPLANOPREV'
      'AND    PP.IDPESSOA    = DP.IDTITULAR'
      'AND    EL.IDPESSJUR   = PP.IDPESSJUR'
      'AND    EL.IDPESSOA    = PP.IDPESSOA'
      'AND    PF.IDPESSOA    = DP.IDPESSOA'
      'AND    P.IDPESSOA     = PF.IDPESSOA'
      'AND    PP.IDSITPART   = ST.IDSITPART'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 237
    Top = 7
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
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
      end>
  end
  object qryDependencia: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDDEPENDENCIA, DESCRICAO'
      'FROM DEPEN'
      'WHERE IDDEPENDENCIA <> '#39'PRP'#39
      'ORDER BY DESCRICAO ')
    ValidateWithMask = True
    Left = 44
    Top = 440
  end
  object updOpcaoContribuicao: TUpdateSQL
    ModifySQL.Strings = (
      
        'UPDATE CONTRIBUICAO SET NOME = :NOME WHERE IDCONTRIBUICAO=:IDCON' +
        'TRIBUICAO')
    InsertSQL.Strings = (
      
        'INSERT INTO CONTRIBUICAO (IDCONTRIBUICAO) VALUES (:IDCONTRIBUICA' +
        'O)')
    Left = 229
    Top = 70
  end
  object qryOpcaoContribuicao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '  1 AS PROCESSA,'
      ''
      
        '  CPP.IDPESSJUR,      CPP.IDPLANOPREV,   CPP.IDPESSOA,  CPP.SEQP' +
        'ROPOSTA,'
      
        '  CPP.IDCONTRIBUICAO, CPP.DATAINICIO,    CPP.DATAFINAL, CPP.VALO' +
        'RBASE1,'
      '  CPP.VALORBASE2,     CPP.VALORBASE3,'
      '  C.NOME,'
      
        '  CP.NOMEVALORBASE1,  CP.NOMEVALORBASE2, CP.NOMEVALORBASE3,  CPP' +
        '.IDPLANPREVCONTAB'
      'FROM'
      '  CONTRIBPREVPARTP CPP, CONTPREV CP, CONTRIBUICAO C'
      'WHERE'
      '      CPP.IDPESSJUR     = :IDPESSJUR'
      'AND    CPP.IDPLANOPREV   = :IDPLANOPREV'
      'AND    CPP.IDPESSOA      = :IDPESSOA'
      'AND    CPP.SEQPROPOSTA   = :SEQPROPOSTA'
      '  AND TO_CHAR(CPP.DATAINICIO,'#39'YYYY/MM'#39')  <= :ANOMESFIM'
      
        '  AND ( (TO_CHAR(CPP.DATAFINAL,'#39'YYYY/MM'#39') >= :ANOMESINI) OR (CPP' +
        '.DATAFINAL IS NULL) )'
      'AND    CP.IDPLANOPREV    = CPP.IDPLANOPREV'
      'AND    CP.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO'
      'AND    C.IDCONTRIBUICAO  = CP.IDCONTRIBUICAO'
      'ORDER BY'
      '  CPP.DATAINICIO, C.NOME'
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updOpcaoContribuicao
    ControlType.Strings = (
      'PROCESSA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 863
    Top = 50
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
        DataType = ftString
        Name = 'ANOMESFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESINI'
        ParamType = ptUnknown
      end>
  end
  object dsOpcaoContribuicao: TwwDataSource
    DataSet = qryOpcaoContribuicao
    Left = 173
    Top = 10
  end
  object qryDadosBeneficio: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 1 AS PROCESSA, B.NOME, B.NUMORDEMEVENTO,'
      ''
      
        '       BF.IDPESSJUR,        BF.IDPESSOA,         BF.IDTITULAR, B' +
        'F.IDPLANOPREV,'
      
        '       BF.SEQPROPOSTA,      BF.IDBENEFICIO,      BF.IDSITBENEFIC' +
        'IO,'
      '       BF.FLGPAGAINSS AS BENEFICIOPAGAINSS,'
      ''
      '       BP.FLGREFERENCIA,'
      '       BP.FLGPAGAINSS AS PLANOPAGAINSS,'
      
        '       BP.NOMEVALORBASE1,   BP.NOMEVALORBASE2,   BP.NOMEVALORBAS' +
        'E3,'
      ''
      
        '       PF.VLRENQUADRAMENTO, PF.VLRENQUADRAMENTO AS VLRENQUADRAME' +
        'NTO_ANT,'
      ''
      
        '       DECODE(BF.VALORBASE1,NULL,BPP.VALORBASE1, BF.VALORBASE1) ' +
        'VALORBASE1,'
      
        '       DECODE(BF.VALORBASE2,NULL,BPP.VALORBASE2, BF.VALORBASE2) ' +
        'VALORBASE2,'
      
        '       DECODE(BF.VALORBASE3,NULL,BPP.VALORBASE3, BF.VALORBASE3) ' +
        'VALORBASE3,'
      ''
      
        '       DECODE(BF.VALORBASE1,NULL,BPP.VALORBASE1, BF.VALORBASE1) ' +
        'AS VALORBASE1_ANT,'
      
        '       DECODE(BF.VALORBASE2,NULL,BPP.VALORBASE2, BF.VALORBASE2) ' +
        'AS VALORBASE2_ANT,'
      
        '       DECODE(BF.VALORBASE3,NULL,BPP.VALORBASE3, BF.VALORBASE3) ' +
        'AS VALORBASE3_ANT,'
      ''
      
        '       BF.DATAINICIO,       BF.DATAINICIO        AS DATAINICIO_A' +
        'NT,'
      
        '       BF.DATAFINAL,        BF.DATAFINAL         AS DATAFINAL_AN' +
        'T,'
      
        '       BF.DATAINICIOFUND,   BF.DATAINICIOFUND    AS DATAINICIOFU' +
        'ND_ANT,'
      
        '       BF.VALORATUAL,       BF.VALORATUAL        AS VALORATUAL_A' +
        'NT,'
      
        '       BF.VALORTOTAL,       BF.VALORTOTAL        AS VALORTOTAL_A' +
        'NT,'
      ''
      
        '       BF.VLRBSTOTAL,       BF.VLRBSTOTAL        AS VLRBSTOTAL_A' +
        'NT,'
      
        '       BF.VLRBSATUAL,       BF.VLRBSATUAL        AS VLRBSATUAL_A' +
        'NT,'
      
        '       BF.VLRFABTOTAL,      BF.VLRFABTOTAL       AS VLRFABTOTAL_' +
        'ANT,'
      
        '       BF.VLRFABATUAL,      BF.VLRFABATUAL       AS VLRFABATUAL_' +
        'ANT,'
      
        '       BF.VLRBASEDEFICIT,   BF.VLRBASEDEFICIT    AS VLRBASEDEFIC' +
        'IT_ANT,       '
      ''
      
        '       BF.DIBBENEFANT,      BF.DIBBENEFANT       AS DIBBENEFANT_' +
        'ANT,'
      
        '       BF.VALORSRB,         BF.VALORSRB          AS VALORSRB_ANT' +
        ','
      
        '       BF.VLRINFINSS,       BF.VLRINFINSS        AS VLRINFINSS_A' +
        'NT,'
      
        '       BF.VLRCALCINSS,      BF.VLRCALCINSS       AS VLRCALCINSS_' +
        'ANT,'
      
        '       BF.VALORBENEFANT,    BF.VALORBENEFANT     AS VALORBENEFAN' +
        'T_ANT,'
      
        '       BF.DATAINICIOINSS,   BF.DATAREQUERIMENTO,  BF.VALORCOTAS,' +
        ' '
      
        '       '#39'                                                        ' +
        '       '#39' AS NOMEBENEFANT,'
      '       '#39'                    '#39' AS TITULOBENEFANT,'
      '       BF.NUMEROPROCESSO,'
      '       BP.IDREGRACALCOP1,   BP.NOMEVALORBASE1,'
      '       BP.IDREGRACALCOP2,   BP.NOMEVALORBASE2,'
      '       BP.IDREGRACALCOP3,   BP.NOMEVALORBASE3,'
      
        '       BP.IDRUBRICAATRASO , BP.IDRUBDEVOLUCAO, BP.IDRUBRICAREVIS' +
        'AO,'
      ''
      '       PP.IDSITPART, PP.SALPARTICIPACAO,'
      '       PF.DATANASC, PF.NUMDEPIRRF,'
      
        '       NVL(PF.FLGMOLESTIAGRAVE,0) FLGMOLESTIAGRAVE, NVL(PF.FLGIS' +
        'ENTOIRRF,0) FLGISENTOIRRF,'
      '       BTT.IDRESPONSAVEL, BTT.PERCENTUAL AS PERCENTUALPENSAO,'
      '       PP.idsitplanoprev'
      '       , BF.FONTEPAGADORA, BP.FLGCALCTODOMES, BF.IDPERFILINVEST'
      '       --WO22176'
      '       , BF.FABTITULAR, BF.BSTITULAR, BF.VLRTOTALTITULAR'
      '       , BP.FLGAPRESENTABSFAB, BP.FLGAPRESENTADEFICIT'
      '       , (SELECT CASE'
      '                 WHEN'
      '                   BF.IDPESSOA <> BF.IDTITULAR AND'
      '                   BP.FLGAPRESENTABSFAB = 1 AND'
      '                   BF.DATAINICIOFUND >= P.DTNOVOCALCPENSASALDADA'
      '                 THEN 1'
      '                 ELSE 0'
      '               END'
      '          FROM PARAMAPREV P'
      '       ) AS FLGNOVOCALCPENSAO'
      '       --WO22176'
      'FROM'
      
        '  PESSOAFISICA PF, BENEFPLANOPART BPP, BENEFBFCIARIO BF, BENEFIC' +
        'IO B, BENEFPLANPREV BP,'
      '  PARTPREVPLAN PP, BFCIARIOTITPLAN BTT'
      'WHERE  BF.IDPESSJUR      = :IDPESSJUR'
      'AND    BF.IDPLANOPREV    = :IDPLANOPREV'
      'AND    BF.IDTITULAR      = :IDTITULAR'
      'AND    BF.IDPESSOA       = :IDPESSOA'
      'AND    BF.SEQPROPOSTA    = :SEQPROPOSTA'
      'AND    B.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND    BP.IDPLANOPREV    = BF.IDPLANOPREV'
      'AND    BP.IDBENEFICIO    = BF.IDBENEFICIO'
      'AND    PF.IDPESSOA       = BF.IDPESSOA'
      'AND    BPP.IDPESSJUR(+)  = BF.IDPESSJUR'
      'AND    BPP.IDPLANOPREV(+)= BF.IDPLANOPREV'
      'AND    BPP.IDPESSOA(+)   = BF.IDTITULAR'
      'AND    BPP.IDBENEFICIO(+)= BF.IDBENEFICIO'
      'AND    BF.IDPLANOORIGEM  = PP.IDPLANOPREV(+)'
      'AND    BF.IDTITULAR      = PP.IDPESSOA(+)'
      ''
      'AND    BF.IDPESSJUR   = BTT.IDPESSJUR'
      'AND    BF.IDTITULAR   = BTT.IDTITULAR'
      'AND    BF.IDPESSOA    = BTT.IDPESSOA'
      'AND    BF.IDPLANOPREV = BTT.IDPLANOPREV'
      'AND    BF.SEQPROPOSTA = BTT.SEQPROPOSTA'
      'AND    BF.IDPLANOORIGEM  = BTT.IDPLANOORIGEM'
      'AND    BF.IDBENEFICIO = BTT.IDBENEFICIO'
      ''
      'ORDER BY BF.FONTEPAGADORA, BF.IDSITBENEFICIO'
      ' ')
    UpdateObject = updDadosBeneficio
    ControlType.Strings = (
      'PROCESSA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 409
    Top = 43
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
        Name = 'IDTITULAR'
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
  object updDadosBeneficio: TUpdateSQL
    ModifySQL.Strings = (
      
        'UPDATE CONTRIBUICAO SET NOME = :NOME WHERE IDCONTRIBUICAO=:IDCON' +
        'TRIBUICAO')
    InsertSQL.Strings = (
      
        'INSERT INTO CONTRIBUICAO (IDCONTRIBUICAO) VALUES (:IDCONTRIBUICA' +
        'O)')
    Left = 887
    Top = 19
  end
  object dsDadosBeneficio: TwwDataSource
    DataSet = qryDadosBeneficio
    Left = 1207
    Top = 526
  end
  object qryVinculaFunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODVINCULAFUNC, DESCRICAO'
      'FROM VINCULAFUNC'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 75
    Top = 478
  end
  object qryIndiceReaj: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOECODIGO, MOESIGLA, MOEDESC'
      'FROM   MOEDA'
      'ORDER BY MOESIGLA ')
    ValidateWithMask = True
    Left = 372
    Top = 51
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 792
    Top = 511
  end
  object QryContrib2: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 299
    Top = 38
  end
  object OpenDlg: TOpenDialog
    Title = 'Arquivo com Matrículas para Revisão'
    Left = 744
    Top = 8
  end
  object qryAcerto: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 1266
    Top = 460
  end
  object qryRegraParcela: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA,NOMEREGRA'
      'FROM   REGRA'
      'ORDER BY NOMEREGRA'
      ' ')
    ValidateWithMask = True
    Left = 577
    Top = 8
  end
  object QryAlteradorCorrecao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  T.CODALTERADOR, T.DESCRICAO'
      'FROM'
      '  TIPOALTERADOR T'
      'ORDER BY'
      'T.DESCRICAO')
    ValidateWithMask = True
    Left = 428
    Top = 1
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'EL.MATRICULA '
      'PP.INSCRICAONUMERO '
      'PES.NOME '
      'PL.NOME'
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
      'C'
      'D'
      'C'
      'N')
    Descricao.Strings = (
      'Matrícula do Titular'
      'Nº de Inscrição'
      'Participante Titular'
      'Plano'
      'Benefício Requerido'
      'Matrícula do Beneficiário'
      'Beneficiário'
      'Data do Evento'
      'Benefício'
      'Nº do Processo')
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
      'DEPENTIT')
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
      'DECODE(B.IDPLANOORIGEM, NULL, PP.IDPLANOPREV, B.IDPLANOORIGEM)')
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
      '( B.IDPESSOA = DEPENTIT.IDPESSOA(+) )')
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
      '')
    Larguras.Strings = (
      '15'
      '14'
      '30'
      '60'
      '30'
      '15'
      '30'
      '15'
      '60'
      '15')
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
      '')
    Left = 264
    Top = 502
  end
  object DataSetProvider1: TDataSetProvider
    Constraints = True
    Left = 535
    Top = 48
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 543
    Top = 16
  end
  object qrySitPart: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT IDSITPART, DESCRICAO, FLGINTERNO'
      'FROM SITPART'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 130
    Top = 204
  end
  object DsAux: TDataSource
    DataSet = qryAux
    Left = 55
    Top = 579
  end
  object QryUpdate: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 40
    Top = 287
  end
  object QrySubTotalContrib: TQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '       0 AS IDCONTRIBUICAO,'
      
        '       '#39'                                                        ' +
        #39'  AS CONTRIBUICAO,'
      '       0 AS VALORCOBRADO,'
      '       0 AS NOVOVALOR,'
      '       0 AS DIFERENCA,'
      '       0 AS CORRECAOMONET,'
      '       0 AS JUROS,'
      '       0 AS MULTA,'
      '       0 AS TOTAL'
      '  FROM DUAL')
    UpdateObject = updSubTotal
    Left = 583
    Top = 491
  end
  object updSubTotal: TUpdateSQL
    Left = 654
    Top = 497
  end
  object ppDemonstrativo: TppDBPipeline
    DataSource = dsDemonstrativoRel
    UserName = 'Demonstrativo'
    Left = 30
    Top = 585
    object ppDemonstrativoppField1: TppField
      FieldAlias = 'ANOMES'
      FieldName = 'ANOMES'
      FieldLength = 7
      DisplayWidth = 7
      Position = 0
    end
    object ppDemonstrativoppField2: TppField
      FieldAlias = 'SRBANTES'
      FieldName = 'SRBANTES'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object ppDemonstrativoppField3: TppField
      FieldAlias = 'SRBDEPOIS'
      FieldName = 'SRBDEPOIS'
      FieldLength = 3
      DisplayWidth = 3
      Position = 2
    end
    object ppDemonstrativoppField4: TppField
      FieldAlias = 'VALORDEPOIS'
      FieldName = 'VALORDEPOIS'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppDemonstrativoppField5: TppField
      FieldAlias = 'VALORANTES'
      FieldName = 'VALORANTES'
      FieldLength = 7
      DisplayWidth = 7
      Position = 4
    end
    object ppDemonstrativoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTITULAR'
      FieldName = 'IDTITULAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDemonstrativoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDemonstrativoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppDemonstrativoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONTRIBDEVIDA'
      FieldName = 'CONTRIBDEVIDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppDemonstrativoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONTRIBDESCONTADA'
      FieldName = 'CONTRIBDESCONTADA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppDemonstrativoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppDemonstrativoppField12: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 11
    end
    object ppDemonstrativoppField13: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 12
    end
    object ppDemonstrativoppField14: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 13
    end
    object ppDemonstrativoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORDEM'
      FieldName = 'ORDEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppDemonstrativoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDENTIFICADOR'
      FieldName = 'IDENTIFICADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppDemonstrativoppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRIBUICAO'
      FieldName = 'IDCONTRIBUICAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppDemonstrativoppField18: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 17
    end
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 112
    Top = 584
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object dsDemonstrativo: TDataSource
    DataSet = wwQuery1
    Left = 38
    Top = 537
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 112
    Top = 538
  end
  object rptDemonstrativo: TppReport
    AutoStop = False
    DataPipeline = ppDemonstrativo
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    BeforePrint = rptDemonstrativoBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 38
    Top = 489
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppDemonstrativo'
    object ppTitleBand3: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHBandGeral: TppHeaderBand
      BeforePrint = ppHBandGeralBeforePrint
      mmBottomOffset = 0
      mmHeight = 55563
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Matrícula:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2381
        mmTop = 34131
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2381
        mmTop = 38100
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Data de Associação: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2381
        mmTop = 42069
        mmWidth = 28840
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'DIB:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 93927
        mmTop = 42069
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Benefício Revisado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 93927
        mmTop = 34131
        mmWidth = 28840
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'DIP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 117211
        mmTop = 42069
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MATRICULA'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3175
        mmLeft = 17198
        mmTop = 34131
        mmWidth = 28310
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3175
        mmLeft = 12435
        mmTop = 38100
        mmWidth = 79640
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D616765500C0000FFD8FFE000104A46494600010101006000
          600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
          0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
          3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
          3232323232323232323232323232323232323232323232323232323232323232
          32323232323232323232323232FFC00011080067007203012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7FA
          2A1F31A8F31A8026A2A1F31A97CC34012D151893D4572DF11BC512F853C1D3EA
          36A07DA5DD6084B0C8566CF27F234E3172764075267883EC32287FEE93CD499A
          F8C67D5350B9BC6BB9EFEE64B9277199A56DD9F5CE78FC2BDE3E0BF8C6FF005D
          B2BCD275399EE26B10AF1CF21CB346490031EE411D6BA2AE19C23CD71D8F56A2
          A3327A52798D5CC225A2A1F31A8F31A8026A2A1F31AA4425864D003A8A28A008
          7CB3ED4796D535713E3DF8890F815EC965D364BCFB5062364A136E31D720FAD5
          462E4EC80EC3CB6A4208EA2BC77FE1A12CFF00E85D9FFF000297FF0089A46FDA
          0ACCF5F0ECFF00F816BFFC4D6BF57ABD80F62AE7BC6FE1A1E2BF0ADD6961C473
          1C49039E8245E99FCCD79EFF00C34059FF00D0BB71F85DAFFF00135734EF8EDA
          3DCDE2C57FA5DD5942C71E7798250A7DC0038A6A8D58BBD86793DCF80BC59697
          8D68FA05FBC8AC5434509746F70C38239EB5ED7F09FC0D75E15D3AEAF7524097
          F7BB41881CF9718E80FBE49AF43B3BB82F6CA3BAB599268245DD1C887208F506
          BCEBC49F19342D0EF5ACECE09754990ED90C4C1507D1B07354EAD4AAB9120B9E
          8D462BC73FE17FD9E7FE45DB8FFC0B5FFE26957F682B31FF0032ECFF00F816BF
          FC4D47D5EAF6158F64F2DA8F2DABC77FE1A12D3FE85D9FFF000297FF0089ADDF
          087C5EB7F17788A0D1E3D1E5B669559BCC69D580DA33D00F6A4E8544AED01E8D
          E5B7B53D14A8C1A514B588051451400567EA5A1E97AC18CEA36305D7979D9E6A
          E76E7AE2B428A13B6C0601F04F863FE80765FF007E8521F05786003FF123B2FF
          00BF42B6AE9DD2DA478C65D54951EF5C8E93A8EA126AC8AF249207243A37403F
          A57162B32586AB0A524DF31BD2A12A909493D8BCDE09F0C3A156D0AC883C11E5
          D7CF1F117C3B69E18F17CF61605FECC5165456EA991D33F5AFA97DABE71F8D1F
          F23FBFFD7B47FCABD8C2CA5CF6B98A2F7843C4B7F61F077C51141211F6378E38
          9B3CA2CCDB5B1E98EA2BCE749B21A8EB16562CE516E2658CB01D327922BADF0E
          FF00C925F1AFFD77B2FF00D195CEF85FFE46CD27FEBED3F9D75C55B99AFEB419
          F4BD97C3FF000B69F691DB47A35B3AC631BE45DCCDEE4D5B4F0578608FF901D9
          7FDFB15B4DD4FD6B9DF115E5E5BC90A44EF1C2464B2F193F5AF071B8DFAAD175
          A5776EC5D1A4EACD4132C8F04F860FFCC0EC7FEFD0AB363E17D134CBA5BAB1D2
          ED6DE750409234C119A93429EE2E34B47B9CEFC9193D48F5AD2CD6B46BBAD4D4
          D5ECD1138B849C5F4168A28AB2428A28A002A95FB6A0BB3EC2903673BBCD278F
          4C63F1ABB486B3A90E78F2DDAF42A32E577B5CE7AF352D66C23135C5B5A98B38
          2509E3F5A2EB5D820B3867B6810CD382718C631EB56BC4BFF2067FF797F9D727
          3FFC79D97D1BF9D7CCE618AAF84AB2A709B7EEA6AFAB4EF6D0F4F0F4A9D68A93
          56D7A75D0E912E35C7456F22D06467049FF1AF04F8C0666F1BE6E0209BECC9B8
          274AFA3D54EC5C9EC2BE75F8D1FF0023FBFF00D7B47FCABEAF2EA0E9D4BB9B96
          9D7FE18F3E7514B4514BD0A9E1DFF924BE35FF00AEF65FFA32B9CF0CE7FE12AD
          271D7ED49FCEBA3F0EFF00C925F1A7FD77B2FF00D195CEF8639F15E93FF5F69F
          CEBD55F6BFAE841F52B4BAEEF6C4366464E33BBFC6A2B2D65A5BC7B2D4608D59
          727819191F5CD6E37DE3F5AE42E3FE4659FEA7F957C6660EA613D9CE336EF2B3
          4F5563B30EA3579938A565D0D2835AD42FEE244D3EDA0F293BC99E076E86B46D
          1F576B9517715AAC383931E73593E10E7ED5FF0001FEB5D456995AA988A11AF5
          2A3BB6F4E9BF6B138AE5A7374E3156403039A01CD0466851815EC9C62D145140
          11824507269075A90F4A6062F88FFE40D27FBCB5CB4FFF001E765F46FE75D66B
          D1493692E91A33B6E070A326B9B9AC2ECDA5A0FB34B95073F29E39AF90CF294E
          589938A6FDD5FF00A51EBE065154D5DF57F91D7293B17E82BE77F8D1FF0023FB
          FF00D7B47FCABE885E117E82BC13E2FE8DAADEF8E1A6B4D2EFAE22FB3A0F321B
          6775CFA640AFB7C2594F53C9EA63F877FE492F8D3FEBBD97FE8CAE73C31FF235
          E93FF5F69FCEBB1D0744D5E2F85DE2FB69349D41279A6B43144D6AE19C093276
          8C64E3DAB03C37E1ED722F13E97249A2EA491ADCA1676B4900033D49238AEC52
          5EF6BFD580FAA09F9CFD6B93B839F12CC7DCFF002AEADBEF1E7BD73335A5CB78
          826956090A1270C14E3A57C8679094A9D3E557F791D982694A57EC4DE12EB75F
          45FEB5D39C9AE77C316D3C1F69F3A278F2171B8633D6BA451C56D92C5C705052
          567AFE6C8C634EBC9A13185A54E94ADF7685E95EA1CA2D145140118EB58DE23F
          16E8DE168E07D5EE8C0272563C216C90327A56E6D1E95E31F1FF00FE3D345E3A
          CAFF00CAB4A51539A8B03B6D2BE2578575AD4E0D3EC350696EA73B635F29864F
          D715A1A3F8CB43F115FDD69FA6DD34B736E09917CB65C60ED3C9F7AE63C1D61A
          B8D4EDA4D43C1BA1585B2C0592F2D625F34360639F7E6B91F83B85F88DE228DB
          01B130DA4F7130AD1D38D9B5D067A6D9F8CB43D435D9F45B6BB67D420DDE6446
          3200DBF7B9A9342F19E87E25B99ED349BEF3678065D194A1C648E33D79F4AF28
          F06E25F8E1AE327CE99B9F9872318F5AE2FC3B3EA9A26A3378A74F05A1D3AE55
          6E94778DC9EBEC707F4AD3D845DECFA20B1F4668FE31D175CD52EF4AD3EF1E5B
          CB5566950A30C00C14F3DF922A9EABF11FC2BA3DDBDA5E6AC82743B592305F69
          F438AF24F87BA834BE24F196A7641C3B6957371083D41DC081F5CD6BFC1DF0FE
          87ACF87F5ABAD52D60BA9FCEF2D9A6018C69B73919E87393BA94A8C6376FA582
          C7A8CFE29D120F0F9D70DFC7269A3199E2F9C0C903A0FAD62A7C5EF052AE0EA8
          D9EA7F70FF00E15C7EB569E16B0F84DAEDBF85EFCDDC2258DA7DD2162ADBC0FE
          9DBD2B2FC1D61E269FC3169269FE0EF0D6A16A73B6E6F610D2BF3CE49342A50B
          37AEFE8163D5B54F883E1BD1E0B19AF6F9A34BE816E2022263BA33D0F038A7E8
          3F10BC37E23D4469FA65F19AE4A1709E5B0E075E48AF2AF8C513C7AFF86215B5
          855D6DE3516E8A0479DFF700FEEF6FA57A2F836C3548B539A4D4FC25A2692163
          FDDCF631A87639E991DB1512A7154D480EDD8E5684E94B8A00C573885A28A280
          0AE47C71E02B6F1BC566971792DB7D998B02881B39FAD14538C9C5DD01D4C10F
          910471039D8A1727BE062BCFBC41F0874BD635B9756B4D42EF4D9E6E6516C701
          9BB91C8C67BD14538CE51774C0D1F077C3DD2FC1AB7325B4935C5DDCAEC92E25
          EBB7D00EDCD47E18F873A7F872DB55B633BDEC1A900B2A4A800039E9CFBD1453
          7526EF77B80CF06FC32B1F076A9777F6D7B35C0B881A0F2A64180A581FC7A62B
          1EFF00E0B6953DF5C4FA7EAB7FA74339CB5BC272BCF51D471ED4514FDACEF7B8
          1B03E1A69107832E7C3768F2411DC9569AE701A476041C9FF0ED5811FC0CB544
          0B1F893528D07454E00FC035145355A6BA81B7AAFC2BB4D5BFB0FCED52E41D26
          28E3562A18CBB5B765893D6BBFC5145439396E02D1451520145145007FFFD9}
        mmHeight = 25665
        mmLeft = 3175
        mmTop = 1058
        mmWidth = 26194
        BandType = 0
      end
      object lblNomeBeneficio: TppLabel
        UserName = 'lblNomeBeneficio'
        Caption = 'lblNomeBeneficio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 123296
        mmTop = 34131
        mmWidth = 22225
        BandType = 0
      end
      object lblDIP: TppLabel
        UserName = 'lblDIP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 123296
        mmTop = 42069
        mmWidth = 14023
        BandType = 0
      end
      object lblDataAssoc: TppLabel
        UserName = 'Label44'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 31750
        mmTop = 42069
        mmWidth = 14023
        BandType = 0
      end
      object lblDIBrel: TppLabel
        UserName = 'Label45'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 100277
        mmTop = 42069
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Fundação dos Economiários Federais'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 29633
        mmTop = 2646
        mmWidth = 76729
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = 'DIBEN - Diretoria de Benefícios'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 29633
        mmTop = 10054
        mmWidth = 47361
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label46'
        Caption = 'GEBEN - Gerência de Benefícios'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 29633
        mmTop = 15346
        mmWidth = 49361
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label47'
        Caption = 'CMABE - Coordenação de Manutenção de Benefícios'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 29633
        mmTop = 20373
        mmWidth = 80560
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label51'
        Caption = 'DIB Anterior :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 140494
        mmTop = 42069
        mmWidth = 19844
        BandType = 0
      end
      object lblRevisadoEM: TppLabel
        UserName = 'Label48'
        Caption = 'Revisado de :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 93927
        mmTop = 38100
        mmWidth = 19844
        BandType = 0
      end
      object lblMesInicio: TppLabel
        UserName = 'Label50'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 114300
        mmTop = 38100
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'Label54'
        Caption = 'até'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 125942
        mmTop = 38100
        mmWidth = 5821
        BandType = 0
      end
      object lblMesFim: TppLabel
        UserName = 'Label53'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 132292
        mmTop = 38100
        mmWidth = 16933
        BandType = 0
      end
      object lblDibAnt: TppLabel
        UserName = 'Label55'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 160867
        mmTop = 42069
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label61'
        Caption = 'Demonstrativo de Revisão de Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 95250
        mmTop = 25929
        mmWidth = 92869
        BandType = 0
      end
      object lbValorTotal: TppLabel
        UserName = 'lbValorTotal'
        Caption = 'Valor Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 181769
        mmTop = 38100
        mmWidth = 15610
        BandType = 0
      end
      object lblValorTotal: TppLabel
        UserName = 'lblValorTotal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 198173
        mmTop = 38100
        mmWidth = 15875
        BandType = 0
      end
      object lbValorAtual: TppLabel
        UserName = 'Label34'
        Caption = 'Valor Atual:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 225425
        mmTop = 38100
        mmWidth = 15875
        BandType = 0
      end
      object lblValorAtual: TppLabel
        UserName = 'Label35'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 241830
        mmTop = 38100
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label36'
        Caption = 'Percentual: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 181505
        mmTop = 42069
        mmWidth = 16140
        BandType = 0
      end
      object lblPercentual: TppLabel
        UserName = 'lblPercentual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 198438
        mmTop = 42069
        mmWidth = 16404
        BandType = 0
      end
      object lbCabecalhoBSTotal: TppLabel
        UserName = 'lbCabecalhoBSTotal'
        Caption = 'BS Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2117
        mmTop = 51065
        mmWidth = 12435
        BandType = 0
      end
      object lbCabecalhoVlrBSTotal: TppLabel
        UserName = 'Label19'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 15346
        mmTop = 51065
        mmWidth = 16404
        BandType = 0
      end
      object lbCabecalhoBSAtual: TppLabel
        UserName = 'lbCabecalhoBSTotal1'
        Caption = 'BS Atual:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 34660
        mmTop = 51065
        mmWidth = 12700
        BandType = 0
      end
      object lbCabecalhoVlrBSAtual: TppLabel
        UserName = 'Label21'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 48154
        mmTop = 51065
        mmWidth = 16933
        BandType = 0
      end
      object lbCabecalhoFABTotal: TppLabel
        UserName = 'lbCabecalhoBSTotal2'
        Caption = 'FAB Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 68527
        mmTop = 51065
        mmWidth = 13758
        BandType = 0
      end
      object lbCabecalhoVlrFABTotal: TppLabel
        UserName = 'Label22'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 83079
        mmTop = 51065
        mmWidth = 16933
        BandType = 0
      end
      object lbCabecalhoFabBAtual: TppLabel
        UserName = 'Label23'
        Caption = 'FAB Atual:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 102659
        mmTop = 51065
        mmWidth = 14023
        BandType = 0
      end
      object lbCabecalhoVlrFABAtual: TppLabel
        UserName = 'Label24'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 117740
        mmTop = 51065
        mmWidth = 19579
        BandType = 0
      end
      object lbCabecalhoBaseDeficit: TppLabel
        UserName = 'Label27'
        Caption = 'Base de Cálculo do Déficit:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 222780
        mmTop = 51065
        mmWidth = 36513
        BandType = 0
      end
      object lbCabecalhoValorBaseDeficit: TppLabel
        UserName = 'Label28'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 260086
        mmTop = 51065
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Perfil Investimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3703
        mmLeft = 2381
        mmTop = 46038
        mmWidth = 29104
        BandType = 0
      end
      object lblNomePerfil: TppLabel
        UserName = 'lblNomePerfil'
        Caption = 'lblNomePerfil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 32279
        mmTop = 46038
        mmWidth = 16140
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppShpBenefDevDet: TppShape
        UserName = 'ShpBenefDevDet'
        mmHeight = 3704
        mmLeft = 93134
        mmTop = 0
        mmWidth = 29370
        BandType = 4
      end
      object ppShpBenefPagDet: TppShape
        UserName = 'ShpBenefPagDet'
        mmHeight = 3704
        mmLeft = 122238
        mmTop = 0
        mmWidth = 27780
        BandType = 4
      end
      object ppShpDifDet: TppShape
        UserName = 'ShpDifDet'
        mmHeight = 3704
        mmLeft = 149754
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppShpFatorDet: TppShape
        UserName = 'ShpFatorDet'
        mmHeight = 3704
        mmLeft = 167216
        mmTop = 0
        mmWidth = 21960
        BandType = 4
      end
      object ppShpCorrDifDet: TppShape
        UserName = 'ShpCorrDifDet'
        mmHeight = 3704
        mmLeft = 188913
        mmTop = 0
        mmWidth = 27252
        BandType = 4
      end
      object ppShpVlrTotDet: TppShape
        UserName = 'ShpVlrTotDet'
        mmHeight = 3704
        mmLeft = 215636
        mmTop = 0
        mmWidth = 23284
        BandType = 4
      end
      object ppLblCorrDifDet: TppLabel
        UserName = 'LblCorrDifDet'
        OnGetText = ppLblCorrDifDetGetText
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3259
        mmLeft = 190500
        mmTop = 265
        mmWidth = 24077
        BandType = 4
      end
      object ppLblVlrTotDet: TppLabel
        UserName = 'LblVlrTotDet'
        OnGetText = ppLblVlrTotDetGetText
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3259
        mmLeft = 217224
        mmTop = 265
        mmWidth = 20638
        BandType = 4
      end
      object ppLblFatorDet: TppLabel
        UserName = 'LblFatorDet'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3259
        mmLeft = 169068
        mmTop = 265
        mmWidth = 18255
        BandType = 4
      end
      object ppLblBenefDevDet: TppLabel
        UserName = 'LblBenefDevDet'
        OnGetText = ppLblBenefDevDetGetText
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3259
        mmLeft = 94722
        mmTop = 265
        mmWidth = 25928
        BandType = 4
      end
      object ppLblBenefPagDet: TppLabel
        UserName = 'LblBenefPagDet'
        OnGetText = ppLblBenefPagDetGetText
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3259
        mmLeft = 123825
        mmTop = 265
        mmWidth = 25400
        BandType = 4
      end
      object ppLblDifDet: TppLabel
        UserName = 'LblDifDet'
        OnGetText = ppLblDifDetGetText
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3259
        mmLeft = 151077
        mmTop = 265
        mmWidth = 15080
        BandType = 4
      end
      object ppShape16: TppShape
        UserName = 'Shape23'
        mmHeight = 3704
        mmLeft = 528
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppShape17: TppShape
        UserName = 'Shape25'
        mmHeight = 3704
        mmLeft = 16934
        mmTop = 0
        mmWidth = 12964
        BandType = 4
      end
      object ppShpSRBDevDet: TppShape
        UserName = 'Shape26'
        mmHeight = 3704
        mmLeft = 29634
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        OnGetText = ppDBText7GetText
        DataField = 'ANOMES'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 2498
        mmLeft = 529
        mmTop = 528
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'SRBANTES'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3259
        mmLeft = 17198
        mmTop = 265
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'SRBDEPOIS'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3259
        mmLeft = 30427
        mmTop = 265
        mmWidth = 14552
        BandType = 4
      end
      object ppShpFABDevDet: TppShape
        UserName = 'ShpFABDevDet'
        mmHeight = 3704
        mmLeft = 70907
        mmTop = 0
        mmWidth = 22489
        BandType = 4
      end
      object ppLblFABDevDet: TppLabel
        UserName = 'lblBenefDevido1'
        OnGetText = ppLblFABDevDetGetText
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3259
        mmLeft = 71966
        mmTop = 265
        mmWidth = 20109
        BandType = 4
      end
      object ppShpBSDevDet: TppShape
        UserName = 'ShpBSDevDet'
        mmHeight = 3704
        mmLeft = 46833
        mmTop = 0
        mmWidth = 24341
        BandType = 4
      end
      object ppLblBSDevDet: TppLabel
        UserName = 'Label8'
        OnGetText = ppLblBSDevDetGetText
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3259
        mmLeft = 48420
        mmTop = 265
        mmWidth = 20902
        BandType = 4
      end
      object ppShpDeficitDet: TppShape
        UserName = 'Shape5'
        mmHeight = 3704
        mmLeft = 238654
        mmTop = 0
        mmWidth = 43922
        BandType = 4
      end
      object ppLblDeficitDet: TppLabel
        UserName = 'lblValorTotalBenef1'
        OnGetText = ppLblDeficitDetGetText
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3259
        mmLeft = 246858
        mmTop = 265
        mmWidth = 29370
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      BeforePrint = ppFooterBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 40217
      mmPrintPosition = 0
      object ppRegionINSS: TppRegion
        UserName = 'RegionBenef1'
        Pen.Style = psClear
        Stretch = True
        mmHeight = 31485
        mmLeft = 0
        mmTop = 0
        mmWidth = 283898
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel57: TppLabel
          UserName = 'Label62'
          Caption = 'Notas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 1852
          mmTop = 17198
          mmWidth = 7938
          BandType = 8
        end
        object ppLabel58: TppLabel
          UserName = 'Label63'
          Caption = '1. SRB = Salário Real de Benefício.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 1588
          mmTop = 20902
          mmWidth = 38894
          BandType = 8
        end
        object ppLabel59: TppLabel
          UserName = 'Label64'
          Caption = 
            '2. A Fundação adota o Índice Nacional de Preços ao Consumidor (I' +
            'NPC/IBGE) para corrigir monetariamente os benefícios.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 1588
          mmTop = 23813
          mmWidth = 133350
          BandType = 8
        end
        object ppLabel60: TppLabel
          UserName = 'Label65'
          Caption = 
            '3. Sobre o saldo da revisão haverá incidência de Imposto de Rend' +
            'a conforme legislação vigente.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 1588
          mmTop = 26723
          mmWidth = 105040
          BandType = 8
        end
        object ppLabel61: TppLabel
          UserName = 'Label66'
          Caption = 'Técnico:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 195263
          mmTop = 17198
          mmWidth = 10054
          BandType = 8
        end
        object ppLabel62: TppLabel
          UserName = 'Label401'
          Caption = 'Revisão de Benefícios - Lote :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 195527
          mmTop = 20373
          mmWidth = 36777
          BandType = 8
        end
        object ppLabel63: TppLabel
          UserName = 'Label32'
          Caption = 'Início do Processamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 195263
          mmTop = 23548
          mmWidth = 31750
          BandType = 8
        end
        object ppLabel64: TppLabel
          UserName = 'Label33'
          Caption = 'Motivo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 195263
          mmTop = 26723
          mmWidth = 8731
          BandType = 8
        end
        object pLblDataInicio: TppLabel
          UserName = 'pLblDataInicio1'
          Caption = 'pLblDataInicio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 227542
          mmTop = 23548
          mmWidth = 15346
          BandType = 8
        end
        object pLblMotivo: TppLabel
          UserName = 'pLblMotivo1'
          Caption = 'pLblMotivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 205052
          mmTop = 26723
          mmWidth = 11642
          BandType = 8
        end
        object pLblUsuario: TppLabel
          UserName = 'pLblUsuario1'
          Caption = 'pLblUsuario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 205846
          mmTop = 17727
          mmWidth = 12965
          BandType = 8
        end
        object plblLote: TppLabel
          UserName = 'plblLote1'
          Caption = 'plblLote'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 232834
          mmTop = 20373
          mmWidth = 8467
          BandType = 8
        end
        object ppParcelamentoINSS: TppMemo
          UserName = 'Memo1'
          KeepTogether = True
          CharWrap = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 13229
          mmLeft = 1852
          mmTop = 3440
          mmWidth = 278871
          BandType = 8
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppParcelamentoBenef: TppMemo
          UserName = 'ParcelamentoBenef'
          Caption = 'a'#13#10'a'#13#10'a'#13#10'a'#13#10
          CharWrap = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 13229
          mmLeft = 1852
          mmTop = 3440
          mmWidth = 278871
          BandType = 8
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
      object ppLabelVersao: TppLabel
        UserName = 'LabelVersao'
        Caption = 'LabelVersao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 195263
        mmTop = 29898
        mmWidth = 14288
        BandType = 8
      end
      object lblConfRevisao: TppLabel
        UserName = 'lblConfRevisao'
        Caption = 'PARA SIMPLES CONFERÊNCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 124619
        mmTop = 35454
        mmWidth = 42333
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'IDENTIFICADOR'
      DataPipeline = ppDemonstrativo
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDemonstrativo'
      object ppGroupBeneficio: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14552
        mmPrintPosition = 0
        object ppShpTitBenef: TppShape
          UserName = 'ShpTitBenef'
          mmHeight = 4498
          mmLeft = 46833
          mmTop = 265
          mmWidth = 235744
          BandType = 3
          GroupNo = 0
        end
        object ppShpVlrTot: TppShape
          UserName = 'ShpVlrTot'
          mmHeight = 9790
          mmLeft = 215636
          mmTop = 4498
          mmWidth = 23284
          BandType = 3
          GroupNo = 0
        end
        object ppShpFator: TppShape
          UserName = 'ShpFator'
          mmHeight = 9790
          mmLeft = 167216
          mmTop = 4498
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object ppShpDif: TppShape
          UserName = 'ShpDif'
          mmHeight = 9790
          mmLeft = 149754
          mmTop = 4498
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppShpBenefPag: TppShape
          UserName = 'Shape17'
          mmHeight = 9790
          mmLeft = 122238
          mmTop = 4498
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object ppShpBenefDev: TppShape
          UserName = 'Shape15'
          mmHeight = 9790
          mmLeft = 93134
          mmTop = 4498
          mmWidth = 29369
          BandType = 3
          GroupNo = 0
        end
        object ppShpFABDev: TppShape
          UserName = 'ShpFABDev'
          mmHeight = 9790
          mmLeft = 70907
          mmTop = 4498
          mmWidth = 22489
          BandType = 3
          GroupNo = 0
        end
        object ppShape36: TppShape
          UserName = 'Shape35'
          mmHeight = 9790
          mmLeft = 528
          mmTop = 4498
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object ppShape37: TppShape
          UserName = 'Shape37'
          mmHeight = 9790
          mmLeft = 16934
          mmTop = 4498
          mmWidth = 12964
          BandType = 3
          GroupNo = 0
        end
        object ppShpSRBDev: TppShape
          UserName = 'ShpSRBDev'
          mmHeight = 9790
          mmLeft = 29634
          mmTop = 4498
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLblTitBenef: TppLabel
          UserName = 'LblTitBenef'
          AutoSize = False
          Caption = 'Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3810
          mmLeft = 47625
          mmTop = 529
          mmWidth = 233628
          BandType = 3
          GroupNo = 0
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          Caption = 'Mês/Ano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 2117
          mmTop = 7938
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppLabel30: TppLabel
          UserName = 'Label30'
          Caption = 'SRB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 20373
          mmTop = 7938
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object ppLabel31: TppLabel
          UserName = 'Label301'
          AutoSize = False
          Caption = 'SRB Revisado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7409
          mmLeft = 31485
          mmTop = 5822
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppShpBSDev: TppShape
          UserName = 'ShpBSDev'
          mmHeight = 9790
          mmLeft = 46833
          mmTop = 4498
          mmWidth = 24341
          BandType = 3
          GroupNo = 0
        end
        object ppLblBSDev: TppLabel
          UserName = 'LblBSDev'
          AutoSize = False
          Caption = 'BS Devido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3387
          mmLeft = 48420
          mmTop = 7938
          mmWidth = 20902
          BandType = 3
          GroupNo = 0
        end
        object ppLblFABDev: TppLabel
          UserName = 'Label103'
          AutoSize = False
          Caption = 'FAB Devido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3387
          mmLeft = 71966
          mmTop = 7938
          mmWidth = 20109
          BandType = 3
          GroupNo = 0
        end
        object ppLblBenefDev: TppLabel
          UserName = 'LblBenefDev'
          AutoSize = False
          Caption = 'Benefício Devido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3387
          mmLeft = 94722
          mmTop = 7938
          mmWidth = 25928
          BandType = 3
          GroupNo = 0
        end
        object ppLblBenefPag: TppLabel
          UserName = 'LblBenefPag'
          AutoSize = False
          Caption = 'Benefício Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3387
          mmLeft = 123825
          mmTop = 7938
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppLblDif: TppLabel
          UserName = 'Label101'
          AutoSize = False
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3387
          mmLeft = 151077
          mmTop = 7673
          mmWidth = 15080
          BandType = 3
          GroupNo = 0
        end
        object ppLblFator: TppLabel
          UserName = 'LblFator'
          AutoSize = False
          Caption = 'Fator de Atualização'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7409
          mmLeft = 169068
          mmTop = 5822
          mmWidth = 18255
          BandType = 3
          GroupNo = 0
        end
        object ppShpCorrDif: TppShape
          UserName = 'ShpCorrDif'
          mmHeight = 9790
          mmLeft = 188913
          mmTop = 4498
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
        end
        object ppLblCorrDif: TppLabel
          UserName = 'LblCorrDif'
          AutoSize = False
          Caption = 'Correção da Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7409
          mmLeft = 190500
          mmTop = 5822
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppLblVlrTot: TppLabel
          UserName = 'LblVlrTot'
          AutoSize = False
          Caption = 'Valor Total Benefício (A)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7409
          mmLeft = 217224
          mmTop = 5822
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object ppShpDeficit: TppShape
          UserName = 'Shape2'
          mmHeight = 9790
          mmLeft = 238654
          mmTop = 4498
          mmWidth = 43922
          BandType = 3
          GroupNo = 0
        end
        object ppLblDeficit: TppLabel
          UserName = 'LblDeficit'
          AutoSize = False
          Caption = 'Base de Cálculo do Déficit'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7409
          mmLeft = 246858
          mmTop = 5822
          mmWidth = 29370
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand3BeforePrint
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 22753
        mmPrintPosition = 0
        object ppShape20: TppShape
          UserName = 'Shape11'
          mmHeight = 4498
          mmLeft = 529
          mmTop = 0
          mmWidth = 16669
          BandType = 5
          GroupNo = 0
        end
        object ppShape21: TppShape
          UserName = 'Shape21'
          mmHeight = 4498
          mmLeft = 16933
          mmTop = 0
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object ppShpSRBDevTot: TppShape
          UserName = 'ShpSRBDevTot'
          mmHeight = 4498
          mmLeft = 29633
          mmTop = 0
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
        end
        object ppShpBSDevTot: TppShape
          UserName = 'BsDevido1'
          mmHeight = 4498
          mmLeft = 46831
          mmTop = 0
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object ppShpBenefPagTot: TppShape
          UserName = 'ShpBenefPagTot'
          mmHeight = 4498
          mmLeft = 122238
          mmTop = 0
          mmWidth = 27781
          BandType = 5
          GroupNo = 0
        end
        object ppShpDifTot: TppShape
          UserName = 'Shape27'
          mmHeight = 4498
          mmLeft = 149754
          mmTop = 0
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object ppShpFatorTot: TppShape
          UserName = 'Shape28'
          mmHeight = 4498
          mmLeft = 167217
          mmTop = 0
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object ppShpCorrDifTot: TppShape
          UserName = 'Shape29'
          mmHeight = 4498
          mmLeft = 188913
          mmTop = 0
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
        object ppShpVlrTotTot: TppShape
          UserName = 'Shape30'
          mmHeight = 4498
          mmLeft = 215636
          mmTop = 0
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object ppLabel33: TppLabel
          UserName = 'Label18'
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2910
          mmTop = 265
          mmWidth = 10583
          BandType = 5
          GroupNo = 0
        end
        object ppLblFatorTot: TppLabel
          UserName = 'Label20'
          AutoSize = False
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 169069
          mmTop = 265
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppLblCorrDifTot: TppLabel
          UserName = 'Label201'
          AutoSize = False
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 190500
          mmTop = 265
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppLabel36: TppLabel
          UserName = 'Label202'
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 22225
          mmTop = 265
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object ppLabel37: TppLabel
          UserName = 'Label37'
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 37042
          mmTop = 265
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object ppLblBenefPagTot: TppLabel
          UserName = 'LblBenefPagTot'
          OnGetText = ppLblBenefPagTotGetText
          AutoSize = False
          Caption = 'LblBenefPagTot'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 123825
          mmTop = 265
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object ppLblDifTot: TppLabel
          UserName = 'LblDifTot'
          OnGetText = ppLblDifTotGetText
          AutoSize = False
          Caption = 'LblDifTot'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 151077
          mmTop = 265
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppLblVlrTotTot: TppLabel
          UserName = 'LblVlrTotTot'
          OnGetText = ppLblVlrTotTotGetText
          AutoSize = False
          Caption = 'LblVlrTotTot'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 217223
          mmTop = 265
          mmWidth = 20638
          BandType = 5
          GroupNo = 0
        end
        object ppShpBenefDevTot: TppShape
          UserName = 'Shape10'
          mmHeight = 4498
          mmLeft = 93134
          mmTop = 0
          mmWidth = 29369
          BandType = 5
          GroupNo = 0
        end
        object ppLblBenefDevTot: TppLabel
          UserName = 'lblTotalPagoBenef1'
          OnGetText = ppLblBenefPagTotGetText
          AutoSize = False
          Caption = 'lblTotalPagoBenef'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 94721
          mmTop = 265
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
        end
        object ppShpFABDevTot: TppShape
          UserName = 'Shape12'
          mmHeight = 4498
          mmLeft = 70908
          mmTop = 0
          mmWidth = 22490
          BandType = 5
          GroupNo = 0
        end
        object ppShpDeficitTot: TppShape
          UserName = 'Shape301'
          mmHeight = 4498
          mmLeft = 238655
          mmTop = 0
          mmWidth = 43921
          BandType = 5
          GroupNo = 0
        end
        object ppLblDeficitTot: TppLabel
          UserName = 'lblTotalValorTotal1'
          OnGetText = ppLblVlrTotTotGetText
          AutoSize = False
          Caption = 'lblTotalValorTotal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          mmHeight = 3704
          mmLeft = 246857
          mmTop = 265
          mmWidth = 29369
          BandType = 5
          GroupNo = 0
        end
        object ppLblFABDevTot: TppLabel
          UserName = 'lblTotalBsDevido1'
          OnGetText = ppLblFABDevTotGetText
          AutoSize = False
          Caption = 'lblTotalFABDevido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          mmHeight = 3175
          mmLeft = 71967
          mmTop = 265
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object ppLblBSDevTot: TppLabel
          UserName = 'LblBSDevTot'
          OnGetText = ppLblBSDevTotGetText
          AutoSize = False
          Caption = 'LblBSDevTot'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          mmHeight = 3704
          mmLeft = 48419
          mmTop = 265
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppSubContribuicao: TppSubReport
          UserName = 'SubContribuicao'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentWidth = False
          TraverseAllData = False
          DataPipelineName = 'ppContribuicao'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 5821
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object SubContribuicao: TppChildReport
            AutoStop = False
            DataPipeline = ppContribuicao
            OnPrintingComplete = SubContribuicaoPrintingComplete
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.Orientation = poLandscape
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 210000
            PrinterSetup.mmPaperWidth = 297000
            PrinterSetup.PaperSize = 9
            Left = 384
            Top = 272
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppContribuicao'
            object ppHdBdCabContrib: TppHeaderBand
              Visible = False
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDetailBand2: TppDetailBand
              BeforePrint = ppDetailBand2BeforePrint
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
              object ppShape39: TppShape
                UserName = 'Shape203'
                mmHeight = 3969
                mmLeft = 244211
                mmTop = 0
                mmWidth = 38364
                BandType = 4
              end
              object ppDBText10: TppDBText
                UserName = 'DBText10'
                DataField = 'TOTCONTRIB'
                DataPipeline = ppContribuicao
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppContribuicao'
                mmHeight = 3260
                mmLeft = 246327
                mmTop = 0
                mmWidth = 33338
                BandType = 4
              end
              object ppShape13: TppShape
                UserName = 'Shape16'
                mmHeight = 3969
                mmLeft = 137318
                mmTop = 0
                mmWidth = 24077
                BandType = 4
              end
              object ppShape10: TppShape
                UserName = 'Shape10'
                mmHeight = 3969
                mmLeft = 529
                mmTop = 0
                mmWidth = 18255
                BandType = 4
              end
              object ppShape11: TppShape
                UserName = 'Shape13'
                mmHeight = 3969
                mmLeft = 18522
                mmTop = 0
                mmWidth = 99749
                BandType = 4
              end
              object ppShapeContribDevida: TppShape
                UserName = 'Shape14'
                mmHeight = 3969
                mmLeft = 118004
                mmTop = 0
                mmWidth = 19578
                BandType = 4
              end
              object ppShape14: TppShape
                UserName = 'Shape602'
                mmHeight = 3969
                mmLeft = 161133
                mmTop = 0
                mmWidth = 21697
                BandType = 4
              end
              object ppShape15: TppShape
                UserName = 'Shape20'
                mmHeight = 3969
                mmLeft = 182563
                mmTop = 0
                mmWidth = 33338
                BandType = 4
              end
              object ppShape19: TppShape
                UserName = 'Shape202'
                mmHeight = 3969
                mmLeft = 215636
                mmTop = 0
                mmWidth = 28839
                BandType = 4
              end
              object ppmesreferencia: TppDBText
                UserName = 'mesreferencia'
                DataField = 'MESREFERENCIA'
                DataPipeline = ppContribuicao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppContribuicao'
                mmHeight = 3259
                mmLeft = 2381
                mmTop = 0
                mmWidth = 14817
                BandType = 4
              end
              object lblFatorAtContrib: TppLabel
                UserName = 'lblDifContrib1'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3260
                mmLeft = 184944
                mmTop = 0
                mmWidth = 28575
                BandType = 4
              end
              object ppNomeContrib: TppDBText
                UserName = 'mesreferencia1'
                DataField = 'NOME'
                DataPipeline = ppContribuicao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppContribuicao'
                mmHeight = 3259
                mmLeft = 19579
                mmTop = 0
                mmWidth = 96573
                BandType = 4
              end
              object ppDBText3: TppDBText
                UserName = 'mesreferencia2'
                DataField = 'VALORDEVIDO'
                DataPipeline = ppContribuicao
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppContribuicao'
                mmHeight = 3260
                mmLeft = 119856
                mmTop = 0
                mmWidth = 15610
                BandType = 4
              end
              object ppDBText4: TppDBText
                UserName = 'DBText4'
                DataField = 'VALORRECEBIDO'
                DataPipeline = ppContribuicao
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppContribuicao'
                mmHeight = 3260
                mmLeft = 138377
                mmTop = 0
                mmWidth = 21430
                BandType = 4
              end
              object ppDBText5: TppDBText
                UserName = 'DBText5'
                DataField = 'DIFERENCA'
                DataPipeline = ppContribuicao
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppContribuicao'
                mmHeight = 3260
                mmLeft = 162985
                mmTop = 0
                mmWidth = 19050
                BandType = 4
              end
              object ppDBText6: TppDBText
                UserName = 'DBText6'
                DataField = 'CORRECAODIF'
                DataPipeline = ppContribuicao
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppContribuicao'
                mmHeight = 3260
                mmLeft = 217488
                mmTop = 0
                mmWidth = 24087
                BandType = 4
              end
            end
            object ppFooterBand2: TppFooterBand
              Visible = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroup1: TppGroup
              BreakName = 'IDPESSOA'
              DataPipeline = ppContribuicao
              OutlineSettings.CreateNode = True
              UserName = 'Group1'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'ppContribuicao'
              object ppGroupHeaderBand1: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 5821
                mmPrintPosition = 0
                object ppShape2: TppShape
                  UserName = 'Shape1'
                  mmHeight = 5821
                  mmLeft = 529
                  mmTop = 0
                  mmWidth = 282046
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel8: TppLabel
                  UserName = 'Label3'
                  AutoSize = False
                  Caption = 'Contribuição'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 9
                  Font.Style = [fsBold]
                  TextAlignment = taCentered
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 1852
                  mmTop = 1058
                  mmWidth = 279930
                  BandType = 3
                  GroupNo = 0
                end
              end
              object ppGroupFooterBand1: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 5821
                mmPrintPosition = 0
                object ppShape66: TppShape
                  UserName = 'Shape66'
                  mmHeight = 4498
                  mmLeft = 244211
                  mmTop = 0
                  mmWidth = 38365
                  BandType = 5
                  GroupNo = 0
                end
                object ppShape64: TppShape
                  UserName = 'Shape64'
                  mmHeight = 4498
                  mmLeft = 182563
                  mmTop = 0
                  mmWidth = 33338
                  BandType = 5
                  GroupNo = 0
                end
                object ppShape62: TppShape
                  UserName = 'Shape62'
                  mmHeight = 4498
                  mmLeft = 137319
                  mmTop = 0
                  mmWidth = 24077
                  BandType = 5
                  GroupNo = 0
                end
                object ppShape40: TppShape
                  UserName = 'Shape40'
                  mmHeight = 4498
                  mmLeft = 100806
                  mmTop = 0
                  mmWidth = 16669
                  BandType = 5
                  GroupNo = 0
                end
                object ppShape49: TppShape
                  UserName = 'Shape49'
                  mmHeight = 4498
                  mmLeft = 118004
                  mmTop = 0
                  mmWidth = 19579
                  BandType = 5
                  GroupNo = 0
                end
                object ppShape63: TppShape
                  UserName = 'Shape63'
                  mmHeight = 4498
                  mmLeft = 161132
                  mmTop = 0
                  mmWidth = 21696
                  BandType = 5
                  GroupNo = 0
                end
                object ppShape65: TppShape
                  UserName = 'Shape65'
                  mmHeight = 4498
                  mmLeft = 215636
                  mmTop = 0
                  mmWidth = 28840
                  BandType = 5
                  GroupNo = 0
                end
                object ppLabel42: TppLabel
                  UserName = 'Label42'
                  Caption = 'TOTAL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 9
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 103981
                  mmTop = 0
                  mmWidth = 10583
                  BandType = 5
                  GroupNo = 0
                end
                object ppLabel52: TppLabel
                  UserName = 'Label52'
                  Caption = '-'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 9
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 197115
                  mmTop = 265
                  mmWidth = 1058
                  BandType = 5
                  GroupNo = 0
                end
                object ppLabel65: TppLabel
                  UserName = 'Label4'
                  Caption = '-'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 9
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 228865
                  mmTop = 265
                  mmWidth = 1058
                  BandType = 5
                  GroupNo = 0
                end
                object lblTotalDevidoContrib: TppLabel
                  UserName = 'lblTotalDevidoContrib1'
                  AutoSize = False
                  Caption = 'lblTotalDevidoContrib'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 118534
                  mmTop = 265
                  mmWidth = 17463
                  BandType = 5
                  GroupNo = 0
                end
                object lblTotalDifContrib: TppLabel
                  UserName = 'lblTotalDifContrib1'
                  Caption = 'lblTotalDifContrib'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 162984
                  mmTop = 265
                  mmWidth = 19050
                  BandType = 5
                  GroupNo = 0
                end
                object lblTotalValorTotalContrib: TppLabel
                  UserName = 'lblTotalValorTotalContrib1'
                  Caption = 'lblTotalValorTotalContrib'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 249238
                  mmTop = 265
                  mmWidth = 30427
                  BandType = 5
                  GroupNo = 0
                end
                object ppShape1: TppShape
                  UserName = 'Shape3'
                  mmHeight = 265
                  mmLeft = 529
                  mmTop = 0
                  mmWidth = 282046
                  BandType = 5
                  GroupNo = 0
                end
                object lblTotalPagoContrib: TppLabel
                  UserName = 'lblTotalPagoContrib'
                  AutoSize = False
                  Caption = 'lblTotalPagoContrib'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 138377
                  mmTop = 265
                  mmWidth = 21430
                  BandType = 5
                  GroupNo = 0
                end
              end
            end
            object ppGroup2: TppGroup
              BreakName = 'IDENTIFICADOR'
              DataPipeline = ppContribuicao
              OutlineSettings.CreateNode = True
              UserName = 'Group2'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'ppContribuicao'
              object ppGroupHeaderBand2: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 10054
                mmPrintPosition = 0
                object ppShape18: TppShape
                  UserName = 'Shape18'
                  mmHeight = 8730
                  mmLeft = 244211
                  mmTop = 1588
                  mmWidth = 38365
                  BandType = 3
                  GroupNo = 1
                end
                object ppShape5: TppShape
                  UserName = 'Shape2'
                  mmHeight = 8730
                  mmLeft = 215636
                  mmTop = 1588
                  mmWidth = 28840
                  BandType = 3
                  GroupNo = 1
                end
                object ppShape61: TppShape
                  UserName = 'Shape601'
                  mmHeight = 8730
                  mmLeft = 182563
                  mmTop = 1588
                  mmWidth = 33338
                  BandType = 3
                  GroupNo = 1
                end
                object ppShape59: TppShape
                  UserName = 'Shape59'
                  mmHeight = 8730
                  mmLeft = 161132
                  mmTop = 1588
                  mmWidth = 21696
                  BandType = 3
                  GroupNo = 1
                end
                object ppShape60: TppShape
                  UserName = 'Shape60'
                  mmHeight = 8730
                  mmLeft = 137319
                  mmTop = 1588
                  mmWidth = 24077
                  BandType = 3
                  GroupNo = 1
                end
                object ppShape58: TppShape
                  UserName = 'Shape58'
                  mmHeight = 8730
                  mmLeft = 118004
                  mmTop = 1588
                  mmWidth = 19579
                  BandType = 3
                  GroupNo = 1
                end
                object ppShape57: TppShape
                  UserName = 'Shape57'
                  mmHeight = 8730
                  mmLeft = 18521
                  mmTop = 1588
                  mmWidth = 99748
                  BandType = 3
                  GroupNo = 1
                end
                object ppShape56: TppShape
                  UserName = 'Shape56'
                  mmHeight = 8730
                  mmLeft = 529
                  mmTop = 1588
                  mmWidth = 18256
                  BandType = 3
                  GroupNo = 1
                end
                object lbMesanoContrib: TppLabel
                  UserName = 'lbMesanoContrib'
                  Caption = 'Mês/Ano'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 3440
                  mmTop = 3969
                  mmWidth = 13758
                  BandType = 3
                  GroupNo = 1
                end
                object lbNomeContrib: TppLabel
                  UserName = 'lbNomeContrib'
                  Caption = 'Nome Contribuição'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 20373
                  mmTop = 3969
                  mmWidth = 26194
                  BandType = 3
                  GroupNo = 1
                end
                object ppLabel19: TppLabel
                  UserName = 'Label5'
                  Caption = 'Devida'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taCentered
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 119856
                  mmTop = 3969
                  mmWidth = 15875
                  BandType = 3
                  GroupNo = 1
                end
                object ppLabel20: TppLabel
                  UserName = 'Label102'
                  Caption = 'Paga'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taCentered
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 146844
                  mmTop = 3969
                  mmWidth = 6879
                  BandType = 3
                  GroupNo = 1
                end
                object ppLabel25: TppLabel
                  UserName = 'Label25'
                  Caption = 'Diferença'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taCentered
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 166688
                  mmTop = 3969
                  mmWidth = 12965
                  BandType = 3
                  GroupNo = 1
                end
                object ppLabel7: TppLabel
                  UserName = 'Label7'
                  Caption = 'Fator de Atualização'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taCentered
                  Transparent = True
                  WordWrap = True
                  mmHeight = 7408
                  mmLeft = 189707
                  mmTop = 2117
                  mmWidth = 19315
                  BandType = 3
                  GroupNo = 1
                end
                object ppLabel17: TppLabel
                  UserName = 'Label17'
                  Caption = 'Correção da Diferença'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taCentered
                  Transparent = True
                  WordWrap = True
                  mmHeight = 7408
                  mmLeft = 218282
                  mmTop = 2117
                  mmWidth = 24342
                  BandType = 3
                  GroupNo = 1
                end
                object ppLabel21: TppLabel
                  UserName = 'Label6'
                  Caption = 'Valor Total Contribuição (B)'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taCentered
                  Transparent = True
                  WordWrap = True
                  mmHeight = 7408
                  mmLeft = 246328
                  mmTop = 2117
                  mmWidth = 33338
                  BandType = 3
                  GroupNo = 1
                end
              end
              object ppGroupFooterBand2: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
          end
        end
        object SubRodape: TppSubReport
          UserName = 'SubRodape'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = ppSubAcaoJud
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 17727
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport2: TppChildReport
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.Orientation = poLandscape
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 210000
            PrinterSetup.mmPaperWidth = 297000
            PrinterSetup.PaperSize = 9
            Left = 672
            Top = 336
            Version = '7.04'
            mmColumnWidth = 0
            object ppTitleBand2: TppTitleBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 26458
              mmPrintPosition = 0
              object ppRegion1: TppRegion
                UserName = 'Region1'
                Pen.Style = psClear
                Stretch = True
                mmHeight = 24077
                mmLeft = 2117
                mmTop = 1588
                mmWidth = 281782
                BandType = 1
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppLabel40: TppLabel
                  UserName = 'Label31'
                  Caption = 'Saldo da Revisão (A+B)'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 3175
                  mmTop = 9525
                  mmWidth = 30956
                  BandType = 1
                end
                object lblSaldoRevisao: TppLabel
                  UserName = 'Label43'
                  OnGetText = lblSaldoRevisaoGetText
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 39952
                  mmTop = 9525
                  mmWidth = 43392
                  BandType = 1
                end
                object ppLabel53: TppLabel
                  UserName = 'Label49'
                  Caption = 'Saldo Benefício (A)     '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 3175
                  mmTop = 2646
                  mmWidth = 28575
                  BandType = 1
                end
                object ppLabel55: TppLabel
                  UserName = 'Label56'
                  Caption = 'Saldo Contribuição (B)'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 3175
                  mmTop = 6085
                  mmWidth = 29369
                  BandType = 1
                end
                object pLblsaldoContribB: TppLabel
                  UserName = 'Label57'
                  OnGetText = pLblsaldoContribBGetText
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 39952
                  mmTop = 6085
                  mmWidth = 43392
                  BandType = 1
                end
                object pLblSaldoBenefA: TppLabel
                  UserName = 'Label58'
                  OnGetText = pLblSaldoBenefAGetText
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 39952
                  mmTop = 2646
                  mmWidth = 43392
                  BandType = 1
                end
                object lblIgualA: TppLabel
                  UserName = 'Label59'
                  Caption = '='
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 35719
                  mmTop = 2646
                  mmWidth = 1588
                  BandType = 1
                end
                object lblIgualB: TppLabel
                  UserName = 'Label60'
                  Caption = '='
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 35719
                  mmTop = 6085
                  mmWidth = 1588
                  BandType = 1
                end
                object lblIgualAB: TppLabel
                  UserName = 'Label601'
                  Caption = '='
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 35719
                  mmTop = 9525
                  mmWidth = 1588
                  BandType = 1
                end
                object ppLabel69: TppLabel
                  UserName = 'Label69'
                  Caption = 'Observações:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 2910
                  mmTop = 14023
                  mmWidth = 20108
                  BandType = 1
                end
                object lblOBS: TppMemo
                  OnPrint = lblOBSPrint
                  UserName = 'lblOBS1'
                  Caption = 'lblOBS'
                  CharWrap = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Stretch = True
                  Transparent = True
                  mmHeight = 9790
                  mmLeft = 23283
                  mmTop = 14023
                  mmWidth = 258234
                  BandType = 1
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmLeading = 0
                end
              end
            end
            object ppDetailBand3: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppSummaryBand1: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
        object ppSubAcaoJud: TppSubReport
          UserName = 'SubAcaoJud'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = ppSubContribuicao
          TraverseAllData = False
          DataPipelineName = 'ppAcJudDeficit'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 11642
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = ppAcJudDeficit
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.Orientation = poLandscape
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 210000
            PrinterSetup.mmPaperWidth = 297000
            PrinterSetup.PaperSize = 9
            Left = 504
            Top = 316
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppAcJudDeficit'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 10583
              mmPrintPosition = 0
              object ppShapeTitleBandAcJudDeficit1: TppShape
                UserName = 'Shape302'
                mmHeight = 5822
                mmLeft = 528
                mmTop = 0
                mmWidth = 282047
                BandType = 1
              end
              object ppLabelTitleBandAcJudDeficit1: TppLabel
                UserName = 'LabelTitleBandAcJudDeficit1'
                Caption = 'Informações da Ação Judicial'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 2117
                mmTop = 1058
                mmWidth = 279136
                BandType = 1
              end
              object ppShapeTitleBandAcJudDeficit2: TppShape
                UserName = 'ShapeTitleBandAcJudDeficit2'
                mmHeight = 5027
                mmLeft = 529
                mmTop = 5556
                mmWidth = 282046
                BandType = 1
              end
              object ppLabelAcJudANOMESFIMACJUDDEFICIT: TppLabel
                UserName = 'LabelAcJudANOMESFIMACJUDDEFICIT'
                AutoSize = False
                Caption = 'Ano/Mês Fim'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3440
                mmLeft = 243153
                mmTop = 6350
                mmWidth = 37571
                BandType = 1
              end
              object ppLabelAcJudANOMESINIACJUDDEFICIT: TppLabel
                UserName = 'Label1'
                AutoSize = False
                Caption = 'Ano/Mês Início'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3440
                mmLeft = 201613
                mmTop = 6350
                mmWidth = 37571
                BandType = 1
              end
              object ppLabelAcJudPERCACJUDDEFICIT: TppLabel
                UserName = 'LabelAcJudPERCACJUDDEFICIT'
                AutoSize = False
                Caption = 'Percentual'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3440
                mmLeft = 158750
                mmTop = 6350
                mmWidth = 37571
                BandType = 1
              end
              object ppLabelAcJudNOME: TppLabel
                UserName = 'LabelAcJudNOME'
                Caption = 'Contribuição'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 5292
                mmTop = 6615
                mmWidth = 20108
                BandType = 1
              end
              object ppLineTitleBandAcJudDeficit3: TppLine
                UserName = 'LineTitleBandAcJudDeficit3'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5027
                mmLeft = 241300
                mmTop = 5556
                mmWidth = 265
                BandType = 1
              end
              object ppLineTitleBandAcJudDeficit2: TppLine
                UserName = 'LineTitleBandAcJudDeficit2'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5027
                mmLeft = 199232
                mmTop = 5556
                mmWidth = 265
                BandType = 1
              end
              object ppLineTitleBandAcJudDeficit1: TppLine
                UserName = 'LineTitleBandAcJudDeficit1'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5027
                mmLeft = 155046
                mmTop = 5556
                mmWidth = 265
                BandType = 1
              end
            end
            object ppDetailBand4: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object ppShapeDetailBandAcJudDeficit1: TppShape
                UserName = 'ShapeDetailBandAcJudDeficit1'
                mmHeight = 4498
                mmLeft = 528
                mmTop = 0
                mmWidth = 282047
                BandType = 4
              end
              object ppLineDetailBandAcJudDeficit3: TppLine
                UserName = 'LineDetailBandAcJudDeficit3'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4498
                mmLeft = 241300
                mmTop = 0
                mmWidth = 265
                BandType = 4
              end
              object ppLineDetailBandAcJudDeficit2: TppLine
                UserName = 'LineDetailBandAcJudDeficit2'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4498
                mmLeft = 199233
                mmTop = 0
                mmWidth = 265
                BandType = 4
              end
              object ppLineDetailBandAcJudDeficit1: TppLine
                UserName = 'LineDetailBandAcJudDeficit1'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4498
                mmLeft = 155047
                mmTop = 0
                mmWidth = 265
                BandType = 4
              end
              object ppDBTextAcJudANOMESINIACJUDDEFICIT: TppDBText
                UserName = 'DBTextAcJudANOMESINIACJUDDEFICIT'
                DataField = 'ANOMESINIACJUDDEFICIT'
                DataPipeline = ppAcJudDeficit
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppAcJudDeficit'
                mmHeight = 2910
                mmLeft = 201613
                mmTop = 794
                mmWidth = 37572
                BandType = 4
              end
              object ppDBTextAcJudANOMESFIMACJUDDEFICIT: TppDBText
                UserName = 'DBText101'
                DataField = 'ANOMESFIMACJUDDEFICIT'
                DataPipeline = ppAcJudDeficit
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppAcJudDeficit'
                mmHeight = 2910
                mmLeft = 243152
                mmTop = 794
                mmWidth = 37572
                BandType = 4
              end
              object ppDBTextAcJudPERCACJUDDEFICIT: TppDBText
                UserName = 'HCPvlrPag1'
                DataField = 'PERCACJUDDEFICIT'
                DataPipeline = ppAcJudDeficit
                DisplayFormat = ',0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppAcJudDeficit'
                mmHeight = 2910
                mmLeft = 158750
                mmTop = 794
                mmWidth = 37572
                BandType = 4
              end
              object ppDBTextAcJudNOME: TppDBText
                UserName = 'DBTextAcJudNOME'
                DataField = 'NOME'
                DataPipeline = ppAcJudDeficit
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppAcJudDeficit'
                mmHeight = 2910
                mmLeft = 5292
                mmTop = 794
                mmWidth = 147902
                BandType = 4
              end
            end
            object ppSummaryBand2: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
    end
    object ppParameterList1: TppParameterList
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
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 112
    Top = 491
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object wwQuery1: TwwQuery
    CachedUpdates = True
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT '#39'0000/00'#39' AS ANOMES,'
      '       0 AS BENEFICIOPAGO,'
      '       0 AS BENEFICIODEVIDO,'
      '       0 AS CONTRIBDESCONTADA,'
      '       0 AS CONTRIBDEVIDA,'
      '       0 AS DIFBENEFICIO,'
      '       0 AS DIFCONTRIBUICAO,'
      '       0 AS SRBANTES,'
      '       0 AS SRBDEPOIS,'
      '       0 AS CONTRIB1,'
      '       0 AS CONTRIB2,'
      '       0 AS CONTRIB3,'
      '       0 AS CONTRIB4,'
      '       0 AS CODCONTRIB1,'
      '       0 AS CODCONTRIB2,'
      '       0 AS CODCONTRIB3,'
      '       0 AS CODCONTRIB4,'
      '       0 AS RESERVAANTES,'
      '       0 AS RESERVADEPOIS,'
      '       0 AS SALVIRTUALANTES,'
      '       0 AS SALVIRTUALDEPOIS,'
      '       0 AS VALORANTES,'
      '       0 AS VALORDEPOIS,'
      '       0 AS DIFERENCA,'
      '       0 AS DIFERENCACORRIGIDA,'
      '       1 AS INDICE,'
      '       0 AS IDENTIFICADOR,'
      '       '#39'                              '#39' AS DESCRICAO,'
      '       '#39' '#39' AS TIPO,'
      '       1 AS IDTITULAR,'
      '       1 AS IDPLANOPREV,'
      '       1 AS IDPESSOA,'
      
        '       '#39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' ' +
        'AS NOMEBENEF'
      'FROM'
      '       DUAL'
      ''
      ' ')
    ValidateWithMask = True
    Left = 32
    Top = 461
  end
  object QryCabecalho: TQuery
    DatabaseName = 'BaseDados'
    Left = 119
    Top = 445
  end
  object QryDemonstrativoRel: TQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM('
      'SELECT'
      #39'2010/15'#39'AS ANOMES,'
      #39'1'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'16801,89'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL union '
      ''
      'SELECT'
      #39'2010/16'#39'AS ANOMES,'
      #39'1'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1680,89'#39' AS VALORDEPOIS,'
      #39'125'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL union '
      ''
      'SELECT'
      #39'2010/17'#39'AS ANOMES,'
      #39'1'#39' AS SRBANTES,'
      #39'5'#39' AS SRBDEPOIS,'
      #39'1680,89'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL union '
      ''
      'SELECT'
      #39'2010/18'#39'AS ANOMES,'
      #39'1'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1680,89'#39' AS VALORDEPOIS,'
      #39'8'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL union '
      ''
      'SELECT'
      #39'2010/18'#39'AS ANOMES,'
      #39'1'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1680,89'#39' AS VALORDEPOIS,'
      #39'9'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL union '
      ''
      ''
      'SELECT'
      #39'2010/19'#39'AS ANOMES,'
      #39'1'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1680,89'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL union '
      ''
      'SELECT'
      #39'2010/20'#39'AS ANOMES,'
      #39'2'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1680,89'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL union '
      ''
      ''
      'SELECT'
      #39'2010/21'#39'AS ANOMES,'
      #39'3'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1680,89'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL union '
      ' '
      'SELECT'
      #39'2010/22'#39'AS ANOMES,'
      #39'4'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1680,89'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL union '
      ''
      ''
      'SELECT'
      #39'2010/23'#39'AS ANOMES,'
      #39'5'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1680,89'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL union '
      ' '
      ' '
      'SELECT'
      #39'2010/24'#39'AS ANOMES,'
      #39'6'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1680,89'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL union '
      ' '
      ' '
      'SELECT'
      #39'2010/07'#39'AS ANOMES,'
      #39'2'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1680,89'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '1 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL union '
      ' '
      ' '
      'SELECT'
      #39'2010/07'#39'AS ANOMES,'
      #39'2'#39' AS SRBANTES,'
      #39'2'#39' AS SRBDEPOIS,'
      #39'1680,89'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL union '
      ''
      'SELECT'
      #39'2010/07'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1680,89'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2010/06'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1680,89'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2010/05'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1680,89'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2010/04'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1680,89'#39' AS VALORDEPOIS,'
      #39'3529,75'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2010/03'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1680,89'#39' AS VALORDEPOIS,'
      #39'3553,74'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2010/02'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1680,89'#39' AS VALORDEPOIS,'
      #39'3553,74'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2010/01'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1680,89'#39' AS VALORDEPOIS,'
      #39'3553,74'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/12'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1597,22'#39' AS VALORDEPOIS,'
      #39'3354,06'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/13'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1597,22'#39' AS VALORDEPOIS,'
      #39'3354,06'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/11'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1597,22'#39' AS VALORDEPOIS,'
      #39'3354,06'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/10'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1597,22'#39' AS VALORDEPOIS,'
      #39'3354,06'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/09'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1597,22'#39' AS VALORDEPOIS,'
      #39'3354,06'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/08'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1597,22'#39' AS VALORDEPOIS,'
      #39'3354,06'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/07'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1597,22'#39' AS VALORDEPOIS,'
      #39'3354,06'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/06'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1597,22'#39' AS VALORDEPOIS,'
      #39'3354,06'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/05'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1597,22'#39' AS VALORDEPOIS,'
      #39'3354,06'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/04'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1597,22'#39' AS VALORDEPOIS,'
      #39'3354,06'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/03'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1597,22'#39' AS VALORDEPOIS,'
      #39'3354,06'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/02'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1597,22'#39' AS VALORDEPOIS,'
      #39'3354,06'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/01'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1597,22'#39' AS VALORDEPOIS,'
      #39'3354,06'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2008/12'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'1500'#39' AS VALORDEPOIS,'
      #39'3149,9'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'B'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 2 AS ORDEM,'
      '495 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'REG/REPLAN - Suplem Ap T Contr'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2010/07'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2010/06'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2010/05'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2010/04'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2010/03'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2010/02'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2010/01'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/12'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/13'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/11'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/10'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/09'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/08'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/07'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/06'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' '
      ' SELECT'
      #39'2009/05'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' '
      '  SELECT'
      #39'2009/05'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '01 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' '
      '  SELECT'
      #39'2009/05'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'2'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' '
      '  SELECT'
      #39'2009/05'#39'AS ANOMES,'
      #39'5'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' '
      '  SELECT'
      #39'2009/05'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'05'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' '
      '  SELECT'
      #39'2009/05'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'51'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' '
      '  SELECT'
      #39'2009/05'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'19'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' '
      ' SELECT'
      #39'2009/04'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/03'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/02'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' SELECT'
      #39'2009/01'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ''
      ' SELECT'
      #39'2009/01'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '5650 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ''
      ' SELECT'
      #39'2009/01'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'25'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ' '
      '  SELECT'
      #39'2009/01'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'554'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ''
      ''
      ' SELECT'
      #39'2009/01'#39'AS ANOMES,'
      #39'15'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL UNION'
      ''
      ''
      ''
      ''
      ' SELECT'
      #39'2008/12'#39'AS ANOMES,'
      #39'0'#39' AS SRBANTES,'
      #39'0'#39' AS SRBDEPOIS,'
      #39'0'#39' AS VALORDEPOIS,'
      #39'0'#39' AS VALORANTES,'
      '473953 AS IDTITULAR,'
      '2 AS IDPLANOPREV,'
      '473953 AS IDPESSOA,'
      '0 AS CONTRIBDEVIDA,'
      '0 AS CONTRIBDESCONTADA,'
      '91008 AS IDPESSJUR,'
      #39'I'#39' AS TIPO,'
      #39'8560425'#39' AS MATRICULA,'
      #39'SERGIO LUIS DA SILVA FERNANDES'#39' AS NOME,'
      ' 1 AS ORDEM,'
      '148 AS IDENTIFICADOR,'
      ' 0 AS IDCONTRIBUICAO,'
      #39'INSS - Aposentadoria Tempo Con'#39' AS DESCRICAO'
      ' FROM DUAL '
      ' '
      ' '
      ') ORDER BY IDPESSOA ,ORDEM, DESCRICAO, ANOMES DESC '
      ' ')
    UpdateObject = updRel
    Left = 55
    Top = 427
  end
  object updRel: TUpdateSQL
    Left = 123
    Top = 395
  end
  object QryInss: TQuery
    DatabaseName = 'BaseDados'
    Left = 65527
    Top = 285
  end
  object dsDemonstrativoRel: TDataSource
    DataSet = QryDemonstrativoRel
    Left = 63
    Top = 227
  end
  object cdsDados: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    Left = 57
    Top = 302
    object cdsDadosANO: TStringField
      DisplayLabel = 'Ano'
      DisplayWidth = 7
      FieldName = 'ANO'
      Size = 4
    end
    object cdsDadosMES: TStringField
      DisplayLabel = 'Mês'
      DisplayWidth = 7
      FieldName = 'MES'
      Size = 2
    end
    object cdsDadosCOTDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'COTDATA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = 'dd/mm/yyyy'
    end
    object cdsDadosCOTVALOR: TFloatField
      DisplayLabel = 'Cotação'
      DisplayWidth = 18
      FieldName = 'COTVALOR'
      DisplayFormat = '#,##0.000000'
      EditFormat = '#,##0.000000'
    end
    object cdsDadosDOZEMESES: TFloatField
      DisplayLabel = 'Últimos 12 Meses'
      DisplayWidth = 18
      FieldName = 'DOZEMESES'
      DisplayFormat = '#,##0.000000'#39'%'#39
      EditFormat = '#,##0.000000'#39'%'#39
    end
    object cdsDadosACUMULADO: TFloatField
      DisplayLabel = 'Acumulado'
      DisplayWidth = 18
      FieldName = 'ACUMULADO'
      DisplayFormat = '#,##0.000000'
      EditFormat = '#,##0.000000'
    end
    object cdsDadosNUMDIASPRAZO: TFloatField
      DisplayLabel = 'Prazo'
      DisplayWidth = 12
      FieldName = 'NUMDIASPRAZO'
    end
    object cdsDadosMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object cdsDadosCOTMESREF: TStringField
      DisplayWidth = 6
      FieldName = 'COTMESREF'
      Visible = False
      Size = 6
    end
    object cdsDadosMOEDESC: TStringField
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Visible = False
    end
    object cdsDadosMOESIGLA: TStringField
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Visible = False
      Size = 10
    end
    object cdsDadosFLGPERCVALOR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPERCVALOR'
      Visible = False
      Size = 1
    end
    object cdsDadosMOEPERIODICIDADE: TStringField
      FieldName = 'MOEPERIODICIDADE'
      Visible = False
      Size = 1
    end
  end
  object cdsDadosEspelho: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    Left = 97
    Top = 310
    object StringField1: TStringField
      DisplayLabel = 'Ano'
      DisplayWidth = 7
      FieldName = 'ANO'
      Size = 4
    end
    object StringField2: TStringField
      DisplayLabel = 'Mês'
      DisplayWidth = 7
      FieldName = 'MES'
      Size = 2
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'COTDATA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = 'dd/mm/yyyy'
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Cotação'
      DisplayWidth = 18
      FieldName = 'COTVALOR'
      DisplayFormat = '#,##0.000000'
      EditFormat = '#,##0.000000'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Últimos 12 Meses'
      DisplayWidth = 18
      FieldName = 'DOZEMESES'
      DisplayFormat = '#,##0.000000'#39'%'#39
      EditFormat = '#,##0.000000'#39'%'#39
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Acumulado'
      DisplayWidth = 18
      FieldName = 'ACUMULADO'
      DisplayFormat = '#,##0.000000'
      EditFormat = '#,##0.000000'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Prazo'
      DisplayWidth = 12
      FieldName = 'NUMDIASPRAZO'
    end
    object FloatField5: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object StringField3: TStringField
      DisplayWidth = 6
      FieldName = 'COTMESREF'
      Visible = False
      Size = 6
    end
    object StringField4: TStringField
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Visible = False
    end
    object StringField5: TStringField
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Visible = False
      Size = 10
    end
    object StringField6: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPERCVALOR'
      Visible = False
      Size = 1
    end
    object StringField7: TStringField
      FieldName = 'MOEPERIODICIDADE'
      Visible = False
      Size = 1
    end
  end
  object dsDados: TDataSource
    DataSet = cdsDados
    Left = 407
    Top = 437
  end
  object dsDadosEspelho: TDataSource
    DataSet = cdsDadosEspelho
    Left = 431
    Top = 509
  end
  object QryFatorAtualizacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select MESINDICE,'
      '       case when cotacao < 1 then'
      '         1'
      '       else'
      '       cotacao'
      '       end  cotacao'
      'from('
      ''
      
        'SELECT SUBSTR(CM.COTMESREF,3,4)||'#39'/'#39'||SUBSTR(CM.COTMESREF,1,2) M' +
        'ESINDICE,'
      
        '       ROUND((((SELECT (exp(sum(ln(((cm1.cotvalor/100)+1))))-1)*' +
        '100'
      '        FROM COTACAOMOEDA CM1'
      '        WHERE CM1.MOECODIGO = 7 AND'
      
        '              SUBSTR(CM1.COTMESREF,3,4)||'#39'/'#39'||SUBSTR(CM1.COTMESR' +
        'EF,1,2) BETWEEN SUBSTR(CM.COTMESREF,3,4)||'#39'/'#39'||SUBSTR(CM.COTMESR' +
        'EF,1,2)'
      
        '                                                                ' +
        '            AND (SELECT MAX(SUBSTR(CM2.COTMESREF,3,4)||'#39'/'#39'||SUBS' +
        'TR(CM2.COTMESREF,1,2))'
      
        '                                                                ' +
        '                 FROM cotacaomoeda cm2'
      
        '                                                                ' +
        '                 WHERE cm2.moecodigo = 7))/100)+1),6) cotacao'
      'FROM COTACAOMOEDA CM'
      'WHERE CM.MOECODIGO = 7 AND'
      
        '      SUBSTR(CM.COTMESREF,3,4)||'#39'/'#39'||SUBSTR(CM.COTMESREF,1,2) BE' +
        'TWEEN :COTMESREF'
      
        '                                                                ' +
        '  AND (SELECT MAX(SUBSTR(CM1.COTMESREF,3,4)||'#39'/'#39'||SUBSTR(CM1.COT' +
        'MESREF,1,2))'
      
        '                                                                ' +
        '       FROM cotacaomoeda cm1'
      
        '                                                                ' +
        '       WHERE cm1.moecodigo = 7))')
    ValidateWithMask = True
    Left = 135
    Top = 261
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COTMESREF'
        ParamType = ptUnknown
      end>
  end
  object QryTotalContrib: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 335
    Top = 547
  end
  object QryDemonstrativoEspelho: TQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'0000/00'#39' AS ANOMES,'
      '       0 AS VALORANTES,'
      '       0 AS VALORDEPOIS,'
      '       0 AS IDENTIFICADOR,'
      '       '#39' '#39' AS TIPO,'
      '       1 AS IDPLANOPREV,'
      '       1 AS IDPESSOA'
      'FROM'
      '       DUAL ')
    UpdateObject = updEspelhoRel
    Left = 31
    Top = 336
  end
  object dsDemonstrativoEspelho: TDataSource
    DataSet = QryDemonstrativoEspelho
    Left = 31
    Top = 379
  end
  object updEspelhoRel: TUpdateSQL
    Left = 91
    Top = 363
  end
  object QryMesPagamento: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 1280
    Top = 511
  end
  object ppContribuicao: TppDBPipeline
    DataSource = DSDemonstContrib
    UserName = 'ppContribuicao'
    Left = 422
    Top = 585
    object ppContribuicaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppContribuicaoppField2: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 1
    end
    object ppContribuicaoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORDEVIDO'
      FieldName = 'VALORDEVIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppContribuicaoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRECEBIDO'
      FieldName = 'VALORRECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppContribuicaoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCA'
      FieldName = 'DIFERENCA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppContribuicaoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'CORRECAODIF'
      FieldName = 'CORRECAODIF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppContribuicaoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDENTIFICADOR'
      FieldName = 'IDENTIFICADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppContribuicaoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppContribuicaoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORDEPOIS'
      FieldName = 'VALORDEPOIS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppContribuicaoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORANTES'
      FieldName = 'VALORANTES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppContribuicaoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTCONTRIB'
      FieldName = 'TOTCONTRIB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
  end
  object DSDemonstContrib: TwwDataSource
    DataSet = QryDemonstContrib
    Left = 560
    Top = 578
  end
  object QryDemonstContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TMP.NOME,'
      '       TMP.MESREFERENCIA,'
      
        '       NVL(ABS(NVL(TMP.VALORCALCULADO,0) - NVL(TMP.VALORRECEBIDO' +
        ',0)),0) AS VALORDEVIDO,'
      '       TMP.VALORRECEBIDO,'
      '       NVL(ABS(TMP.VALORCALCULADO),0) AS DIFERENCA,'
      '       NVL(TMP.CORRECAODIF,0) AS CORRECAODIF,'
      '       TMP.IDENTIFICADOR,'
      '       TMP.IDPESSOA,'
      '       TMP.VALORDEPOIS,'
      '       TMP.VALORANTES,'
      
        '       NVL(TMP.VALORCALCULADO,0) + NVL(TMP.CORRECAODIF,0) AS TOT' +
        'CONTRIB'
      '  FROM (SELECT C.NOME,'
      '               H.MESREFERENCIA,'
      '               HD.VALORCALCULADO,'
      
        '               SUM(NVL(DECODE(H.FLGDEVOLUCAO, 1, -H.VALORRECEBID' +
        'O, H.VALORRECEBIDO),0)) AS VALORRECEBIDO,'
      '               HD.CORRECAODIF,'
      '               H.IDCONTRIBUICAO AS IDENTIFICADOR,'
      '               H.IDPESSOA,'
      '               HD.VALORDEPOIS,'
      '               HD.VALORANTES'
      '          FROM HSTCONTRIBPREV H'
      '         INNER JOIN CONTRIBUICAO C'
      '            ON (C.IDCONTRIBUICAO = H.IDCONTRIBUICAO)'
      '         INNER JOIN BENEFXTAXA B'
      '            ON (B.IDCONTRIBUICAO = H.IDCONTRIBUICAO)'
      ''
      '         -- SOL271392'
      
        '         inner join contprev cp on h.idcontribuicao = cp.idcontr' +
        'ibuicao and'
      
        '                                   h.idplanoprev = cp.idplanopre' +
        'v'
      '         -- SOL271392'
      ''
      '          left outer JOIN (SELECT HP.IDPESSOA,'
      '                                  HP.MESREFERENCIA,'
      '                                  HP.IDCONTRIBUICAO,'
      '                                  HP.IDPLANOPREV,'
      
        '                                  SUM(NVL(DECODE(HA.FLGTIPO, '#39'D'#39 +
        ', HA.VALOR, -HA.VALOR), 0)) AS CORRECAODIF,'
      
        '                                  SUM(NVL(DECODE(HP.FLGDEVOLUCAO' +
        ', 0, HP.VALORESPERADO), 0)) AS VALORDEPOIS,'
      
        '                                  SUM(NVL(DECODE(HP.FLGDEVOLUCAO' +
        ', 1, HP.VALORESPERADO), 0)) AS VALORANTES,'
      
        '                                  SUM(NVL(DECODE(HP.FLGDEVOLUCAO' +
        ','
      '                                                 1,'
      
        '                                                 HP.VALORCALCULA' +
        'DO,'
      
        '                                                 -HP.VALORCALCUL' +
        'ADO),'
      '                                          0)) AS VALORCALCULADO'
      '                      FROM HSTCONTRIBPREV HP'
      '                     INNER JOIN BENEFXTAXA BT'
      
        '                        ON (BT.IDCONTRIBUICAO = HP.IDCONTRIBUICA' +
        'O)'
      '                      LEFT JOIN HSTATRASOCONTRIB HA'
      
        '                        ON (HA.NUMRECEBIMENTO = HP.NUMRECEBIMENT' +
        'O)'
      ''
      '                     WHERE HP.IDPESSOA = :IDPESSOA'
      '                       AND HP.IDPESSJUR = :IDPESSJUR'
      '                       AND HP.SEQPROPOSTA = :SEQPROPOSTA'
      '                       AND HP.IDPLANOPREV = :IDPLANOPREV'
      
        '                       AND (HP.MESREFERENCIA BETWEEN :MESINI AND' +
        ' :MESFIM OR'
      
        '                           TRIM(SUBSTR(HP.MESREFERENCIA, 1, 5) |' +
        '| DECODE(SUBSTR(HP.MESREFERENCIA,6,2), '#39'13'#39','#39'11'#39','
      
        '                                                                ' +
        '         SUBSTR(HP.MESREFERENCIA,6,2))) BETWEEN :MESINI AND :MES' +
        'FIM)'
      '                       AND BT.IDBENEFICIO = :IDBENEFICIO'
      '                       AND HP.TRGDTINCLUSAO >= :DTRECALCULO'
      '                       --AND HP.FLGDESCFOLHA = 1 --SIG82506'
      '                     GROUP BY HP.IDPESSOA,'
      '                              HP.MESREFERENCIA,'
      '                              HP.IDCONTRIBUICAO,'
      '                              HP.IDPLANOPREV) HD         '
      '            ON (HD.IDPESSOA = H.IDPESSOA)'
      '           AND (HD.IDCONTRIBUICAO = H.IDCONTRIBUICAO)'
      '           AND (HD.IDPLANOPREV = H.IDPLANOPREV)'
      '           AND (HD.MESREFERENCIA = H.MESREFERENCIA)'
      '        '
      '         WHERE H.IDPESSOA = :IDPESSOA'
      '           AND H.IDPESSJUR = :IDPESSJUR'
      '           AND H.IDTITULAR = :IDTITULAR   -- SIG 19417'
      '           AND H.SEQPROPOSTA = :SEQPROPOSTA'
      '           AND H.IDPLANOPREV = :IDPLANOPREV'
      '           AND (H.MESREFERENCIA BETWEEN :MESINI AND :MESFIM OR'
      
        '               TRIM(SUBSTR(H.MESREFERENCIA, 1, 5) || DECODE(SUBS' +
        'TR(H.MESREFERENCIA, 6, 2), '#39'13'#39', '#39'11'#39','
      
        '                                                            SUBS' +
        'TR(H.MESREFERENCIA,6,2))) BETWEEN :MESINI AND :MESFIM)'
      '           AND B.IDBENEFICIO = :IDBENEFICIO'
      ''
      '           AND CP.FLGDESCFOLHA = 1                 -- SOL271392'
      ''
      '         GROUP BY C.NOME,'
      '                  H.MESREFERENCIA,'
      '                  HD.VALORCALCULADO,'
      '                  HD.CORRECAODIF,'
      '                  HD.VALORDEPOIS,'
      '                  HD.VALORANTES,'
      '                  H.IDCONTRIBUICAO,'
      '                  H.IDPESSOA'
      '     ) TMP'
      
        ' WHERE (TMP.VALORCALCULADO IS NOT NULL OR TMP.VALORRECEBIDO <> 0' +
        ' )'
      ' ORDER BY TMP.IDENTIFICADOR, TMP.MESREFERENCIA DESC'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 500
    Top = 547
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DTRECALCULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object qryAcJudDeficit: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT CO.IDCONTRIBUICAO, CO.NOME'
      '      ,AC.PERCACJUDDEFICIT '
      '      ,AC.ANOMESINIACJUDDEFICIT'
      '      ,AC.ANOMESFIMACJUDDEFICIT'
      '  FROM CONTRIBUICAO CO'
      '      ,CONTRIBNUCLEOACJUDDEFICIT AC'
      ' WHERE AC.IDCONTRIBUICAO = CO.IDCONTRIBUICAO'
      'UNION'
      'SELECT DISTINCT CO.IDCONTRIBUICAO, CO.NOME'
      '      ,AC.PERCACJUDDEFICIT '
      '      ,AC.ANOMESINIACJUDDEFICIT'
      '      ,AC.ANOMESFIMACJUDDEFICIT'
      '  FROM CONTRIBUICAO CO'
      '      ,CONTRIBPARTPACJUDDEFICIT AC'
      ' WHERE AC.IDCONTRIBUICAO = CO.IDCONTRIBUICAO'
      ' ORDER BY 1, 4')
    ValidateWithMask = True
    Left = 948
    Top = 208
    object qryAcJudDeficitIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
    end
    object qryAcJudDeficitNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryAcJudDeficitPERCACJUDDEFICIT: TFloatField
      FieldName = 'PERCACJUDDEFICIT'
    end
    object qryAcJudDeficitANOMESINIACJUDDEFICIT: TStringField
      FieldName = 'ANOMESINIACJUDDEFICIT'
      Size = 7
    end
    object qryAcJudDeficitANOMESFIMACJUDDEFICIT: TStringField
      FieldName = 'ANOMESFIMACJUDDEFICIT'
      Size = 7
    end
  end
  object dsAcJudDeficit: TwwDataSource
    AutoEdit = False
    DataSet = qryAcJudDeficit
    Left = 948
    Top = 176
  end
  object ppAcJudDeficit: TppBDEPipeline
    DataSource = dsAcJudDeficit
    UserName = 'ppAcJudDeficit'
    Left = 948
    Top = 144
    object ppAcJudDeficitppField1: TppField
      FieldAlias = 'IDCONTRIBUICAO'
      FieldName = 'IDCONTRIBUICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppAcJudDeficitppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppAcJudDeficitppField3: TppField
      FieldAlias = 'PERCACJUDDEFICIT'
      FieldName = 'PERCACJUDDEFICIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppAcJudDeficitppField4: TppField
      FieldAlias = 'ANOMESINIACJUDDEFICIT'
      FieldName = 'ANOMESINIACJUDDEFICIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppAcJudDeficitppField5: TppField
      FieldAlias = 'ANOMESFIMACJUDDEFICIT'
      FieldName = 'ANOMESFIMACJUDDEFICIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
end
