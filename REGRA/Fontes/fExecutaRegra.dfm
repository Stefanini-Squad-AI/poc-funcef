inherited frmExecutaRegra: TfrmExecutaRegra
  Left = 257
  Top = 147
  HelpContext = 450018
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Execução de Regras'
  ClientHeight = 437
  ClientWidth = 608
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 608
    Height = 398
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 606
      Height = 106
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label9: TLabel
        Left = 8
        Top = 53
        Width = 93
        Height = 13
        Caption = 'Nome da Regra '
      end
      object Label2: TLabel
        Left = 9
        Top = 9
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label3: TLabel
        Left = 141
        Top = 9
        Width = 82
        Height = 13
        Caption = 'Tipo de Regra'
      end
      object Bevel1: TBevel
        Left = 456
        Top = -2
        Width = 5
        Height = 120
        Shape = bsLeftLine
      end
      object edtNumero: TEdit
        Left = 8
        Top = 25
        Width = 121
        Height = 21
        TabStop = False
        TabOrder = 0
        OnExit = edtNumeroExit
      end
      object btnConsultar: TBitBtn
        Left = 465
        Top = 3
        Width = 134
        Height = 25
        Caption = 'Consultar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnConsultarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33033333333333333F7F3333333333333000333333333333F777333333333333
          000333333333333F777333333333333000333333333333F77733333333333300
          033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
          33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
          3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
          33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
          333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
          333333773FF77333333333370007333333333333777333333333}
        Margin = 10
        NumGlyphs = 2
      end
      object btnDebugar: TBitBtn
        Left = 465
        Top = 53
        Width = 134
        Height = 25
        Caption = 'Passo a Passo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnDebugarClick
        Glyph.Data = {
          06020000424D0602000000000000760000002800000028000000140000000100
          0400000000009001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333333333333333333333333333333333FFFFFFFFFF
          FFFF333330000000000000033333377777777777777F333330FEFEFEFEFEFE03
          333337F333333333337F333330EFEFEFEFEFEF03333337F3FFFF3333337F3333
          30F4444EFEFEFE0333F337F777733333337F303330EFEFEFEFEFEF0337FF37F3
          33FFFFFFF37F300330FEF4444444FE03377FF7F337777777337F300030999999
          99999903377737F333333333337F300330999FFFFFF99903377337F333333333
          337F30333099999999999903373337F333FFFFFFF37F333330FEF4444444FE03
          333337F337777777337F333330EFEFEFEFEFEF03333337F3FFFF333FFF7F3333
          30F4444EFE000003333337F7777333777773333330EFEFEFEF0FE033333337F3
          3333337F3733333330FEFEFEFE0E0333333337F33333337F7333333330EFEFEF
          EF003333333337FFFFFFFF773333333330000000000333333333377777777773
          3333333333333333333333333333333333333333333333333333333333333333
          33333333333333333333}
        Margin = 10
        NumGlyphs = 2
      end
      object btnLimpar: TBitBtn
        Left = 465
        Top = 78
        Width = 134
        Height = 25
        Caption = 'Limpar Variáveis'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnLimparClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888888FF8888888888888008888888888888F77F8888888888800F0888
          88888888F7787F88888888800FFF0888888888F7788878888888800FFFFF8888
          8888877888888FF8888887FFFF880088888887F88888778F888887FFF8801108
          8888878F88878878F888887FF80999108888887F887F88878F88887FF8099991
          08888878F878F88878F88887F880999030888887F8878F87878F8887FF88090B
          030888878F887878787888887F8880B0B038888878F88787878888888788880B
          0B388888878888787888888888888880BBB88888888888878F88888888888888
          0BB888888888888878F888888888888880B88888888888888788}
        Margin = 10
        NumGlyphs = 2
      end
      object edtTipo: TPanel
        Left = 141
        Top = 25
        Width = 306
        Height = 21
        Alignment = taLeftJustify
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 4
      end
      object edtNome: TPanel
        Left = 8
        Top = 69
        Width = 439
        Height = 21
        Alignment = taLeftJustify
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 5
      end
      object btnExecutar: TBitBtn
        Left = 465
        Top = 28
        Width = 134
        Height = 25
        Caption = 'Executar       '
        Default = True
        TabOrder = 6
        OnClick = btnExecutarClick
        Glyph.Data = {
          46050000424D460500000000000036040000280000000D000000110000000100
          08000000000010010000C30E0000C30E00000001000000000000000000008080
          8000000080000080800000800000808000008000000080008000408080004040
          0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
          FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
          80008000FF004080FF00C0DCC000F0CAA60060208000C0FFFF00E0E0A0008000
          60008080FF00C0800000FFC0C000FFCF0000FFFF6900E0FFE000B39CDD00EE8F
          B300F96F2A00CDB83F0036844800418C9500425E8E007A62A000AC4F6200BE2F
          1D007666280000450000013E450013286A006A39850085324A00040404000808
          08000C0C0C0011111100161616001C1C1C002222220029292900303030005F5F
          5F00555555004D4D4D0042424200393939000007000000000D008199B700B499
          840090BDBD00607F7F007F606000000E000000001B00000028002B090800001D
          0000000039009B00000000250000000049003B111100002F000000005D004517
          1700003A000011114900531C1C00FF160000FF002B006C212100141459000051
          00006A1A47006732190000610000FF310000FF0061007B20530067431600E22E
          2E001659260004465100492E68008F520700B8186A0015239000FF530000FF00
          A300124A6A006C3375009A414A000B653700152CA400B11F8300FF2C4E00B651
          2000926408000B566F00AD435900127236001733B00000A100001F5F77007147
          89001C43B0007D2DB70095860000236E7A00009F260001A9730000CA0000015B
          AC00C21D2000705294004CAA240089940A007B6E360090754400A800FF00FF71
          0000FF00DF004A915600F84834008232CC007041E40001CA680042BC3600FF9A
          0000B7229600337D85008CB72500ED5A360000FF5C000048FF00A29B22004DCF
          42005258C20095D32000E024A500B556730000A9A9003C6FD000589F67000BCF
          890000ACFF00FE2EA7007F59E20067DC4C00FF18FF00FF7D3A0018D0B10000FF
          C70000E2FF003D9ADF009F815600BA43C6008B71AF00C9A23800CE53D100659A
          FF00DBCA4600FF4DFF006AE9C800E0DE4C00FF98FF0082C0DF00A5ECE900CDF6
          F500FFD0FF005AACB100AE916300654C22003F4E8D0070705000FFFFD000FFE7
          FF00696969007777770086868600969696009D9D9D00A4A4A400B2B2B200CBCB
          CB00D7D7D700DDDDDD00E3E3E300EAEAEA00F1F1F100F8F8F80066C1B20078BF
          8000F0F0C600FFA4B200FFB3FF00A38ED10037DCC300549EA00070AE7600C19E
          7800BF648300D383A400323FD100007DFF0023784400605F24002C0E0E000000
          BE00001FFF00003931003E85D9008577020081D8B0001D21560030000000B3C8
          88000079A0008170EA0069F15100CD749100FF7CFF00FFFFA200F0FBFF00A4A0
          A000537F200029798A00326932007F05EC00AC112F00423FEE000F0F0F0F0001
          0F0F0F0F0F0F0F0000000F0F0F0F0000010F0F0F0F0F0F0000000F0F0F0F0F00
          00010F0F0F0F0F0000000F0F0F0F0F001100010F0F0F0F0000000F0F0F000000
          001100010F0F0F0000000F0F0F0011110E111100010F0F0000000F0F0F0F000E
          11000000000F0F0000000F0F0F0F00110E1100010F0F0F0000000F0000000000
          110E1100010F0F0000000F000E110E110E110E1100010F0000000F0F000E110E
          11000000000F0F0000000F0F00110E110E1100010F0F0F0000000F0F0F00110E
          110E1100010F0F0000000F0F0F000E0E0E110E0E00010F0000000F0F0F0F000E
          110E0E110E00010000000F0F0F0F0000000000000000000000000F0F0F0F0F0F
          0F0F0F0F0F0F0F000000}
        Margin = 10
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 107
      Width = 606
      Height = 290
      Align = alClient
      BevelOuter = bvLowered
      BorderWidth = 1
      Caption = 'Panel1'
      TabOrder = 1
      object Panel4: TPanel
        Left = 2
        Top = 2
        Width = 602
        Height = 286
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel4'
        TabOrder = 0
        object Label6: TLabel
          Left = 6
          Top = 1
          Width = 127
          Height = 16
          Caption = 'Dados de Entrada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Panel5: TPanel
          Left = 0
          Top = 243
          Width = 602
          Height = 43
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object Label4: TLabel
            Left = 6
            Top = 3
            Width = 58
            Height = 13
            Caption = 'Resultado'
          end
          object Label1: TLabel
            Left = 458
            Top = 3
            Width = 136
            Height = 13
            Alignment = taRightJustify
            Caption = 'Identificador do Cálculo'
          end
          object Panel3: TPanel
            Left = 212
            Top = 10
            Width = 234
            Height = 32
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 3
            object BtOkRegra: TSpeedButton
              Left = 11
              Top = 3
              Width = 220
              Height = 25
              Caption = 'Regra executada com sucesso'
              Flat = True
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000013000000120000000100
                040000000000D800000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333000003333333333333333333000003333344333333333333000003333
                4224333333333330000033342222433333333330000033422222243333333330
                000034222A2222433333333000003222A3A222433333333000003A2A333A2224
                33333330000033A33333A222433333300000333333333A222433333000003333
                333333A222433330000033333333333A222433300000333333333333A2224330
                00003333333333333A224330000033333333333333A223300000333333333333
                333A33300000333333333333333333300000}
              Visible = False
            end
            object BtErroRegra: TSpeedButton
              Left = 11
              Top = 4
              Width = 220
              Height = 25
              Caption = 'Erro na Execução da Regra '
              Flat = True
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000014000000120000000100
                040000000000D800000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33333333333133337733333333333333000033391173333397333333CCC43339
                1117333911733333333133391111739111173333000033339111171111173333
                CCC4333339111111117333333331333333911111173333330000333333311111
                73333333CCC43333333911117333333333313333339111117333333300003333
                3911171117333333CCC433339111739111733333333133339117333911173333
                000033333913333391113333CCC4333333333333391933333331333333333333
                33333333000033333333333333333333CCC4}
              Visible = False
            end
          end
          object chkErroRegra: TCheckBox
            Left = 455
            Top = 20
            Width = 151
            Height = 25
            Caption = 'Ocorreu erro na regra'
            TabOrder = 1
            Visible = False
          end
          object edtResultRegra: TEdit
            Left = 6
            Top = 17
            Width = 202
            Height = 21
            Color = clAqua
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 6
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object EdCalculo: TEdit
            Left = 479
            Top = 18
            Width = 115
            Height = 21
            Color = clBtnFace
            TabOrder = 2
            OnChange = EdCalculoChange
          end
        end
        object ChkBxGravaCalculo: TCheckBox
          Left = 512
          Top = 1
          Width = 88
          Height = 17
          Hint = 'Gravar dados na memória de cálculo '
          Alignment = taLeftJustify
          Caption = 'Grava cálculo'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object ChkBxCarregaRegra: TCheckBox
          Left = 400
          Top = 1
          Width = 102
          Height = 17
          Hint = 'Recarreda dados da regra do Banco de Dados'
          Alignment = taLeftJustify
          Caption = 'Recarrega Regra'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object ChkBx3C: TCheckBox
          Left = 358
          Top = 1
          Width = 34
          Height = 17
          Hint = 'Executa regra em ambiente de "Três Camadas"'
          Alignment = taLeftJustify
          Caption = '3C'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = ChkBx3CClick
        end
        object PgCtrlDados: TPageControl
          Left = 0
          Top = 18
          Width = 602
          Height = 225
          ActivePage = TbsCDS
          Align = alBottom
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          HotTrack = True
          MultiLine = True
          ParentFont = False
          TabOrder = 4
          TabPosition = tpBottom
          OnChange = PgCtrlDadosChange
          object TbsSQL: TTabSheet
            Caption = 'SQL'
            object memSql: TMemo
              Left = 0
              Top = 0
              Width = 594
              Height = 197
              Align = alClient
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
              PopupMenu = PopMnuOpcoes
              ScrollBars = ssVertical
              TabOrder = 0
              OnKeyPress = memSqlKeyPress
            end
            object Editor: TwwDBRichEdit
              Left = 312
              Top = 144
              Width = 265
              Height = 49
              AutoURLDetect = False
              PrintJobName = 'Delphi 5'
              TabOrder = 1
              Visible = False
              OnKeyUp = EditorKeyUp
              EditorCaption = 'Edit Rich Text'
              EditorPosition.Left = 0
              EditorPosition.Top = 0
              EditorPosition.Width = 0
              EditorPosition.Height = 0
              MeasurementUnits = muInches
              PrintMargins.Top = 1
              PrintMargins.Bottom = 1
              PrintMargins.Left = 1
              PrintMargins.Right = 1
              RichEditVersion = 2
              Data = {
                730000007B5C727466315C616E73695C616E7369637067313235325C64656666
                305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
                4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
                5C706172645C66305C667331345C7061720D0A7D0D0A00}
            end
          end
          object TbsCDS: TTabSheet
            Caption = 'Arquivo (CDS)'
            ImageIndex = 1
            object SpeedButton1: TSpeedButton
              Left = 0
              Top = 0
              Width = 113
              Height = 22
              Caption = 'Buscar Arquivo'
              Flat = True
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
              OnClick = SpeedButton1Click
            end
            object BtnApagaArquivo: TSpeedButton
              Left = 570
              Top = 0
              Width = 23
              Height = 22
              Hint = 'Fechar arquivo'
              Flat = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888888888888FF8888888888888778888888888888F77F8888888888800F08
                8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
                88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
                08888877777F788F7F8881999991FFCF088887777777F87878F8999999991CFF
                F088777777777F88F78F998F9FF91FFCFF0877FF78877F8788789998FF991CCF
                FFF0777F88777F7888F7999FF8991FFFF77877788F777F88F778998F9FF91FF7
                788877FF7FF778F7788889999991777888888777777787788888889999988888
                8888887777788888888888888888888888888888888888888888}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = BtnApagaArquivoClick
            end
            object DbGrdCds: TwwDBGrid
              Left = 0
              Top = 24
              Width = 594
              Height = 173
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alBottom
              DataSource = DsCdsDados
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
            object PnlArquivo: TPanel
              Left = 120
              Top = 2
              Width = 449
              Height = 19
              Alignment = taLeftJustify
              BevelOuter = bvLowered
              TabOrder = 1
            end
          end
        end
        object ChkCarregaTabua: TCheckBox
          Left = 200
          Top = 1
          Width = 151
          Height = 17
          Hint = 'Carraga Tábua de Serviços'
          Alignment = taLeftJustify
          Caption = 'Carrega Tábua de Serviços'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = ChkCarregaTabuaClick
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 398
    Width = 608
    inherited tb97Fundo: TToolbar97
      Left = 312
      DockPos = 312
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 268
    Top = 288
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'REGRA.IDREGRA'
      'REGRA.NOMEREGRA'
      'TIPOREGRA.DESCREGRA')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Número da Regra'
      'Nome da Regra'
      'Tipo da Regra')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'REGRA'
      'TIPOREGRA')
    CamposChave.Strings = (
      'REGRA.IDREGRA'
      'REGRA.NOMEREGRA'
      'TIPOREGRA.DESCREGRA'
      'TIPOREGRA.SQLREGRA'
      'TIPOREGRA.IDTIPOREGRA')
    Filtro.Strings = (
      'REGRA.IDTIPOREGRA = TIPOREGRA.IDTIPOREGRA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 298
    Top = 288
  end
  object Qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 475
    Top = 288
  end
  object QryRegra: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  R.IDREGRA, R.NOMEREGRA, R.IDTIPOREGRA, T.SQLREGRA, T.DESCREGRA'
      'FROM '
      '  REGRA R, TIPOREGRA T'
      'WHERE'
      '  R.IDTIPOREGRA = T.IDTIPOREGRA')
    UpdateObject = UpdateSQL1
    ValidateWithMask = True
    Left = 506
    Top = 288
    object QryRegraIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'REGRA.IDREGRA'
    end
    object QryRegraNOMEREGRA: TStringField
      FieldName = 'NOMEREGRA'
      Origin = 'REGRA.NOMEREGRA'
      Size = 60
    end
    object QryRegraIDTIPOREGRA: TFloatField
      FieldName = 'IDTIPOREGRA'
      Origin = 'REGRA.IDTIPOREGRA'
    end
    object QryRegraSQLREGRA: TMemoField
      FieldName = 'SQLREGRA'
      Origin = 'TIPOREGRA.SQLREGRA'
      BlobType = ftMemo
      Size = 1
    end
    object QryRegraDESCREGRA: TStringField
      FieldName = 'DESCREGRA'
      Origin = 'TIPOREGRA.DESCREGRA'
      Size = 60
    end
  end
  object UpdateSQL1: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOREGRA'
      'set'
      '  SQLREGRA = :SQLREGRA'
      'where'
      '  IDTIPOREGRA = :OLD_IDTIPOREGRA')
    InsertSQL.Strings = (
      'insert into TIPOREGRA'
      '  (SQLREGRA)'
      'values'
      '  (:SQLREGRA)')
    DeleteSQL.Strings = (
      'delete from TIPOREGRA'
      'where'
      '  IDTIPOREGRA = :OLD_IDTIPOREGRA')
    Left = 537
    Top = 288
  end
  object PopMnuOpcoes: TPopupMenu
    Left = 237
    Top = 288
    object GravarSQLdaRegra: TMenuItem
      Caption = 'Gravar SQL da Regra'
      OnClick = GravarSQLdaRegraClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object SelecionarTudo1: TMenuItem
      Caption = 'Selecionar tudo'
      OnClick = SelecionarTudo1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Copiar1: TMenuItem
      Caption = 'Copiar'
      OnClick = Copiar1Click
    end
    object Colar1: TMenuItem
      Caption = 'Colar'
      OnClick = Colar1Click
    end
    object Apagar1: TMenuItem
      Caption = 'Apagar tudo'
      OnClick = Apagar1Click
    end
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 567
    Top = 288
  end
  object RegraMT: TRegraMT
    IdCalculo = 0
    DatabaseName = 'BaseDados'
    QueryIn = Qry
    DbConnectionType = cntBDE
    Left = 408
    Top = 289
  end
  object Regra: TRegra
    QueryIn = Qry
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 376
    Top = 289
  end
  object FileOpen: TOpenDialog
    DefaultExt = '*.CDS'
    Filter = 'Arquivos de dados CDS|*.CDS'
    Title = 'Arquivos de Exportação de Regras'
    Left = 329
    Top = 289
  end
  object DsCdsDados: TDataSource
    DataSet = CdsDados
    Left = 71
    Top = 288
  end
  object CdsDados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 41
    Top = 288
  end
end
