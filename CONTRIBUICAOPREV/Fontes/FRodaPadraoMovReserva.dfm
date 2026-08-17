inherited FrmRodaPadraoMovReserva: TFrmRodaPadraoMovReserva
  Left = 25
  Top = 97
  HelpContext = 160060
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Movimentação Padrão de Reserva'
  ClientHeight = 385
  ClientWidth = 767
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 767
    Height = 346
    object Panel1: TPanel
      Left = 1
      Top = 73
      Width = 765
      Height = 272
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 3
      TabOrder = 0
      object pnlResult: TPanel
        Left = 5
        Top = 5
        Width = 755
        Height = 262
        Align = alClient
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object memResult: TMemo
          Left = 9
          Top = 30
          Width = 581
          Height = 234
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Lines.Strings = (
            '')
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 2
        end
        object bbtnVoltar: TBitBtn
          Left = 597
          Top = 15
          Width = 115
          Height = 38
          Caption = '&Voltar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = bbtnVoltarClick
          Glyph.Data = {
            E6000000424DE60000000000000076000000280000000E0000000E0000000100
            0400000000007000000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DD00DDDDD4444DDDDD00DDD44444444DDD00DD444DDDD444DD00DD44DDDDDD44
            DD00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD4
            4D00DD44DDDD4D44DD00DD44DDDD4444DD00DDDDDDDD444DDD00DDDDDDDD4444
            DD00DDDDDDDDDDDDDD00}
        end
        object bbtnSalvar: TBitBtn
          Left = 597
          Top = 59
          Width = 115
          Height = 38
          Caption = 'S&alvar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
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
        object StaticText3: TStaticText
          Left = 8
          Top = 3
          Width = 99
          Height = 22
          AutoSize = False
          Caption = 'Resultado'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -19
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentColor = False
          ParentFont = False
          TabOrder = 3
        end
      end
      object pnlOpcoes: TPanel
        Left = 5
        Top = 5
        Width = 755
        Height = 262
        Align = alClient
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object pgctrlReserva: TPageControl
          Left = 1
          Top = 38
          Width = 753
          Height = 223
          ActivePage = tbsPrincipal
          Align = alBottom
          TabOrder = 2
          object tbsPrincipal: TTabSheet
            Caption = ' Opções Básicas'
            object lbPatro: TLabel
              Left = 3
              Top = 11
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
              Left = 255
              Top = 10
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
            object Label4: TLabel
              Left = 503
              Top = 10
              Width = 51
              Height = 13
              Caption = 'Benefícios'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object chklstPatro: TCheckListBox
              Left = 3
              Top = 25
              Width = 230
              Height = 159
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
              Left = 255
              Top = 25
              Width = 230
              Height = 159
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
            object chklstBenef: TCheckListBox
              Left = 503
              Top = 25
              Width = 230
              Height = 159
              Columns = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 2
            end
          end
          object tbshtpart: TTabSheet
            Caption = ' Participante'
            ImageIndex = 1
            object lblParticip: TLabel
              Left = 11
              Top = 55
              Width = 71
              Height = 16
              Caption = 'Participante'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblPatro: TLabel
              Left = 11
              Top = 94
              Width = 85
              Height = 16
              Caption = 'Patrocinadora'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label3: TLabel
              Left = 323
              Top = 56
              Width = 125
              Height = 16
              Caption = 'Plano Previdenciário'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblMatricula: TLabel
              Left = 323
              Top = 94
              Width = 54
              Height = 16
              Caption = 'Matrícula'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object bbtnProcurar: TBitBtn
              Left = 364
              Top = 2
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
            object edNome: TEdit
              Left = 11
              Top = 70
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
              Top = 109
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
              TabOrder = 2
            end
            object edPlano: TEdit
              Left = 323
              Top = 71
              Width = 238
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
            object edMatricula: TEdit
              Left = 323
              Top = 109
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
              TabOrder = 4
            end
            object btndesfazselec: TBitBtn
              Left = 460
              Top = 2
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
        end
        object StaticText2: TStaticText
          Left = 7
          Top = 3
          Width = 176
          Height = 27
          Caption = 'Opções de Seleção'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -19
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object bbtnVerResultado: TBitBtn
          Left = 596
          Top = 7
          Width = 115
          Height = 27
          Hint = 'Ir para tela de resultado '
          Caption = 'Resultado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = bbtnVerResultadoClick
          Glyph.Data = {
            E6000000424DE60000000000000076000000280000000E0000000E0000000100
            0400000000007000000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DD00DD4444DDDDDDDD00DDD444DDDDDDDD00DD4444DDDD44DD00DD44D4DDDD44
            DD00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD4
            4D00DD44DDDDDD44DD00DD444DDDD444DD00DDD44444444DDD00DDDDD4444DDD
            DD00DDDDDDDDDDDDDD00}
        end
      end
    end
    object pnlProgresso: TPanel
      Left = 127
      Top = 105
      Width = 458
      Height = 126
      BevelWidth = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      object lblMatPatro: TLabel
        Left = 10
        Top = 7
        Width = 425
        Height = 15
        AutoSize = False
        Caption = 'Matrícula:                                      Patro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblPlanoBenef: TLabel
        Left = 10
        Top = 29
        Width = 433
        Height = 15
        AutoSize = False
        Caption = 'Plano:                          Benefício:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 10
        Top = 99
        Width = 145
        Height = 16
        Caption = 'Registros Processados:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblcontador: TLabel
        Left = 162
        Top = 99
        Width = 129
        Height = 16
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object pBar: TProgressBar
        Left = 10
        Top = 68
        Width = 440
        Height = 20
        Min = 0
        Max = 100
        TabOrder = 1
      end
      object btncancelaprogress: TBitBtn
        Left = 361
        Top = 92
        Width = 89
        Height = 27
        Cancel = True
        Caption = '&Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btncancelaprogressClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 765
      Height = 72
      Align = alTop
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object StaticText1: TStaticText
        Left = 8
        Top = 3
        Width = 242
        Height = 27
        Caption = 'Escolha a Opção Desejada'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object bbtnProcessar: TBitBtn
        Left = 601
        Top = 6
        Width = 115
        Height = 27
        Caption = 'Processar '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = bbtnProcessarClick
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
      object bbtnDesfazer: TBitBtn
        Left = 601
        Top = 40
        Width = 115
        Height = 27
        Caption = '&Desfazer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
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
    end
  end
  inherited Dock971: TDock97
    Top = 346
    Width = 767
    inherited tb97Fundo: TToolbar97
      Left = 397
      DockPos = 397
      inherited sep1: TToolbarSep97
        Left = 203
      end
      inherited sep3: TToolbarSep97
        Left = 100
      end
      inherited bbtnSair: TBitBtn
        Width = 100
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 103
        Width = 100
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 100
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 100
        Caption = '&Processar'
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 103
        Width = 100
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 435
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object IvExtendedTranslator1: TIvExtendedTranslator
    DictionaryName = 'CMDicionario'
    Left = 739
    Top = 515
    TargetsData = (
      1
      5
      (
        ''
        'Hint'
        0)
      (
        ''
        'Caption'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'Lines'
        0)
      (
        ''
        'Items'
        0))
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PE.NOME'
      'EL.MATRICULA'
      'PP.INSCRICAONUMERO'
      'BE.NOME'
      'PT.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Participante'
      'Matrícula'
      'Nº Inscrição '
      'Benefício'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA PE'
      'PESSOA PT'
      'ELEGPATRO EL'
      'PARTPREVPLAN PP'
      'BENEFBFCIARIO BF'
      'BENEFPLANPREV BP'
      'BENEFICIO BE'
      'PLANPREV PL')
    CamposChave.Strings = (
      'PE.IDPESSOA'
      'PE.NOME'
      'PT.IDPESSOA'
      'PT.NOME'
      'EL.MATRICULA'
      'PP.INSCRICAONUMERO'
      'PP.IDPLANOPREV'
      'PP.SEQPROPOSTA'
      'BF.NUMEROPROCESSO'
      'BF.IDBENEFICIO'
      'BF.DATAINICIO'
      'PL.NOME')
    Filtro.Strings = (
      'PE.IDPESSOA = EL.IDPESSOA'
      'PT.IDPESSOA = EL.IDPESSJUR'
      'EL.IDPESSOA = PP.IDPESSOA'
      'EL.IDPESSJUR = PP.IDPESSJUR'
      'PP.FLGDESATIVADO = 0'
      'BF.IDPLANOPREV = PP.IDPLANOPREV'
      'BF.FLGMOVEURESERVA = 0'
      'BP.IDPLANOPREV = PP.IDPLANOPREV'
      'BP.IDBENEFICIO = BF.IDBENEFICIO'
      'BP.FLGMOVRESAPOSCONC = 1'
      'BE.IDBENEFICIO = BF.IDBENEFICIO'
      'PL.IDPLANOPREV = PP.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '13'
      '10'
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 550
    Top = 55
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar cálculo de Reservas de Participantes'
    Left = 550
    Top = 6
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 690
    Top = 182
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PESSOA.IDPESSOA,    PESSOA.NOME'
      'FROM   PESSOA, PATRO'
      'WHERE  PESSOA.IDPESSOA=PATRO.IDPESSOA'
      'AND    PATRO.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 27
    Top = 140
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 280
    Top = 140
  end
  object qryBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT BF.IDBENEFICIO, BF.NOME'
      'FROM BENEFPLANPREV BP, BENEFICIO BF'
      'WHERE BP.IDBENEFICIO = BF.IDBENEFICIO'
      ' ')
    ValidateWithMask = True
    Left = 528
    Top = 140
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 282
    Top = 6
  end
end
