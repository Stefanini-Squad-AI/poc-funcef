inherited frmReajustaSalarioMantido: TfrmReajustaSalarioMantido
  Left = -1083
  Top = 166
  HelpContext = 160038
  Caption = 'Reajusta Salário de Manutenção'
  ClientHeight = 382
  ClientWidth = 764
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 764
    Height = 343
    object pnlResult: TPanel
      Left = 1
      Top = 1
      Width = 762
      Height = 341
      Align = alClient
      TabOrder = 2
      object memResult: TMemo
        Left = 1
        Top = 1
        Width = 634
        Height = 334
        TabOrder = 0
      end
      object bbtnVoltarResult: TBitBtn
        Left = 641
        Top = 9
        Width = 100
        Height = 38
        Caption = '&Voltar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = bbtnVoltarResultClick
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
        Left = 641
        Top = 53
        Width = 100
        Height = 38
        Caption = 'S&alvar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
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
    end
    object pnldetalhe: TPanel
      Left = 1
      Top = 1
      Width = 762
      Height = 341
      Align = alClient
      TabOrder = 1
      Visible = False
      object lblDetalhe: TLabel
        Left = 5
        Top = 5
        Width = 252
        Height = 23
        Caption = 'Detalhamento de Mantidos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object bbtnProcessarReajuste: TBitBtn
        Left = 651
        Top = 94
        Width = 100
        Height = 38
        Hint = 'Calcular Reajuste'
        Caption = '&Processar '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = bbtnProcessarReajusteClick
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
      object bbtnVoltarDetalhe: TBitBtn
        Left = 651
        Top = 143
        Width = 100
        Height = 38
        Caption = '&Voltar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = bbtnVoltarDetalheClick
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
      object bbtnVerResultado: TBitBtn
        Left = 651
        Top = 193
        Width = 100
        Height = 38
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
        TabOrder = 2
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
      object pnlProgresso: TPanel
        Left = 125
        Top = 110
        Width = 427
        Height = 94
        BevelWidth = 3
        Caption = 'pnlProgresso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object lblContador: TLabel
          Left = 48
          Top = 64
          Width = 53
          Height = 13
          Caption = 'lblContador'
          Visible = False
        end
        object lblReserva: TLabel
          Left = 18
          Top = 15
          Width = 137
          Height = 13
          Caption = 'Reajustando Salários ...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object pBar: TProgressBar
          Left = 48
          Top = 41
          Width = 361
          Height = 15
          Min = 0
          Max = 100
          Step = 1
          TabOrder = 0
        end
      end
      object dbgrdDetalhe: TwwDBGrid
        Left = 5
        Top = 83
        Width = 636
        Height = 255
        Selected.Strings = (
          'PROCESSA'#9'5'#9'Reaj.'
          'PARTICIPANTE'#9'40'#9'Participante'
          'SALMANTIDO'#9'10'#9'Salário ~Atual'
          'PATROCINADORA'#9'30'#9'Patrocinadora'
          'PLANO'#9'30'#9'Plano ~Previdenciário'
          'SITUACAOFUNDACAO'#9'50'#9'Situação ~na Fundação'
          'MATRICULA'#9'13'#9'Matrícula')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsDetalhe
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        PopupMenu = pmnu
        TabOrder = 4
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        OnEnter = dbgrdDetalheEnter
        IndicatorColor = icBlack
      end
      object bbtnAlterar: TBitBtn
        Left = 650
        Top = 242
        Width = 100
        Height = 38
        Caption = 'Alterar'
        TabOrder = 5
        OnClick = bbtnAlterarClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000000000FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484
          8484FFFFFFFFFFFF000000848484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF848484848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFF
          FFFF848484848484FFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF848484FFFFFFFFFFFF000000000000FFFFFF000000FFFFFFFFFFFF0000
          00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000FFFFFFFF
          FFFFFFFFFF000000FFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF
          000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFF
          FF000000FF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0000FFFFFF000000FFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF
          848484FFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF0000FFFFFF000000FFFFFF848484848484FF00FFFF00FFFF00FF
          FF00FF848484FFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFF0000
          00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF848484FFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFF
          FFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484848484FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF848484FFFFFFFFFFFFFFFFFF848484848484FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84
          8484848484848484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object gbxPosicionar: TGroupBox
        Left = 8
        Top = 40
        Width = 344
        Height = 41
        Caption = 'Posicionar'
        TabOrder = 6
        object Label3: TLabel
          Left = 9
          Top = 18
          Width = 55
          Height = 13
          Caption = 'Matrícula'
        end
        object edtPosicionar: TEdit
          Left = 112
          Top = 12
          Width = 195
          Height = 21
          TabOrder = 0
        end
        object bbtnPosicionar: TBitBtn
          Left = 310
          Top = 9
          Width = 29
          Height = 27
          TabOrder = 1
          OnClick = bbtnPosicionarClick
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
      object bbtnSelecionarTodos: TBitBtn
        Left = 365
        Top = 47
        Width = 132
        Height = 33
        Caption = 'Seleciona Todos'
        TabOrder = 7
        OnClick = bbtnSelecionarTodosClick
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
      end
      object bbtnInverterSelecao: TBitBtn
        Left = 507
        Top = 47
        Width = 132
        Height = 33
        Caption = 'Inverte Seleção'
        TabOrder = 8
        OnClick = bbtnInverterSelecaoClick
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
      end
    end
    object pnlOpcoes: TPanel
      Left = 1
      Top = 1
      Width = 762
      Height = 341
      Align = alClient
      TabOrder = 0
      object lblValores: TLabel
        Left = 11
        Top = 5
        Width = 65
        Height = 23
        Caption = 'Opções'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 276
        Top = 13
        Width = 97
        Height = 13
        Caption = 'Mês de Rejuste: '
      end
      object pnlLista: TPanel
        Left = 10
        Top = 44
        Width = 627
        Height = 181
        TabOrder = 0
        object Label2: TLabel
          Left = 11
          Top = 8
          Width = 86
          Height = 13
          Caption = 'Patrocinadoras'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 321
          Top = 10
          Width = 130
          Height = 13
          Caption = 'Planos Previdenciários'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object chklstPatro: TCheckListBox
          Left = 11
          Top = 23
          Width = 298
          Height = 146
          OnClickCheck = chklstPatroClickCheck
          Columns = 2
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
          Left = 320
          Top = 23
          Width = 298
          Height = 146
          Columns = 2
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
      object rgSituacao: TRadioGroup
        Left = 10
        Top = 228
        Width = 185
        Height = 69
        Caption = 'Situação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'Mantido'
          'Mantido Parcial')
        ParentFont = False
        TabOrder = 1
      end
      object bbtnDetalhe: TBitBtn
        Left = 641
        Top = 45
        Width = 100
        Height = 38
        Caption = '&Detalhar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = bbtnDetalheClick
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888800008888888888888888888800008888777777778888888800008800
          00000000788888880000880BFFFBFFF0777777880000880F444444F000000078
          0000880FFBFFFBF0FBFFF0780000880F444444F04444F0780000880BFFFBFFF0
          FFFBF0780000880F444444F04444F0780000880FFBFFFBF0FBFFF0780000880F
          44F000004477F0780000880BFFF0FFF0FF0007780000880F44F0FB00F70A0778
          0000880FFBF0F0FF000A00080000880000000F470AAAAA080000888888880FFB
          000A00080000888888880000770A088800008888888888888800088800008888
          88888888888888880000}
      end
      object chkResult: TCheckBox
        Left = 10
        Top = 307
        Width = 148
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Exibir exceções ...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object edMesReaj: TMaskEdit
        Left = 372
        Top = 9
        Width = 77
        Height = 21
        EditMask = '9999/99;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        TabOrder = 4
        Text = '    /  '
      end
    end
  end
  inherited Dock971: TDock97
    Top = 343
    Width = 764
    inherited tb97Fundo: TToolbar97
      Left = 592
      DockPos = 621
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 415
      DockPos = 442
      inherited ToolbarSep971: TToolbarSep97
        Left = 89
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 89
        Caption = '&Confirmar'
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 92
        ModalResult = 0
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 66
    Top = 65528
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 183
    Top = 340
  end
  object qryDetalhe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT 1 as processa, P.NOME AS PARTICIPANTE, PATRO.NOM' +
        'E AS PATROCINADORA,'
      '       PL.NOME AS PLANO, E.MATRICULA,  P.IDPESSOA,'
      '       PP.SALMANTIDO, S.FLGINTERNO,'
      
        '       E.IDPESSJUR, PL.IDPLANOPREV, S.DESCRICAO AS SITUACAOFUNDA' +
        'CAO'
      
        'FROM   PLANPREV PL, PARTPREVPLAN PP, SITPART S, PESSOA P, ELEGPA' +
        'TRO E, PESSOA PATRO'
      'WHERE  P.IDPESSOA       = E.IDPESSOA AND '
      '       E.IDPESSOA       = PP.IDPESSOA AND '
      '       E.IDPESSJUR      = PP.IDPESSJUR AND '
      '       PP.IDPLANOPREV   = PL.IDPLANOPREV AND '
      '       PATRO.IDPESSOA   = E.IDPESSJUR AND'
      '       PP.IDSITPART     = S.IDSITPART and '
      '       1=2')
    UpdateObject = updDetalhe
    ControlType.Strings = (
      'PROCESSA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 29
    Top = 340
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  PT.IDPESSOA = P.IDPESSOA'
      'AND    PT.IDFUNDACAO =:IDFUNDACAO'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 83
    Top = 340
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PLANPREV'
      
        'WHERE IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO ' +
        'PLP, PATRO PT'
      '                      WHERE PT.IDFUNDACAO = :IDFUNDACAO'
      '                      AND   PLP.IDPESSJUR = PT.IDPESSOA )'
      'ORDER BY NOME'
      ''
      ' ')
    ValidateWithMask = True
    Left = 131
    Top = 340
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar Reajuste de Salário de Mantidos'
    Left = 229
    Top = 340
  end
  object regCalculo: TRegra
    QueryIn = qryRegra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 286
    Top = 340
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 337
    Top = 340
  end
  object pmnu: TPopupMenu
    Left = 380
    Top = 344
    object DesmarcarTodos1: TMenuItem
      Caption = '&Desmarcar Todos'
      OnClick = DesmarcarTodos1Click
    end
    object MarcarTodos1: TMenuItem
      Caption = '&Marcar Todos'
      OnClick = MarcarTodos1Click
    end
  end
  object dsDetalhe: TwwDataSource
    DataSet = qryDetalhe
    Left = 24
    Top = 309
  end
  object updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update PLANPREV'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    InsertSQL.Strings = (
      'insert into PLANPREV'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PLANPREV'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    Left = 68
    Top = 288
  end
end
