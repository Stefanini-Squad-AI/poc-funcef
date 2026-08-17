inherited frmVerificaDadosRAISMagnetico: TfrmVerificaDadosRAISMagnetico
  Left = 112
  Top = 92
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Verificação de Dados para a Geração da RAIS em Meio Magnético'
  ClientHeight = 464
  ClientWidth = 625
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 625
    Height = 425
    BorderWidth = 2
    object gbxAnoMesRef: TGroupBox
      Left = 19
      Top = 16
      Width = 111
      Height = 45
      Caption = 'Ano de Referência'
      TabOrder = 0
      object speAno: TSpinEdit
        Left = 15
        Top = 16
        Width = 81
        Height = 22
        MaxLength = 4
        MaxValue = 3000
        MinValue = 1990
        TabOrder = 0
        Value = 1990
        OnChange = speAnoChange
      end
    end
    object gbxResp: TGroupBox
      Left = 145
      Top = 16
      Width = 460
      Height = 45
      Caption = 'Estabelecimento Responsável pela Informação'
      TabOrder = 1
      object dblkcbResp: TwwDBLookupCombo
        Left = 8
        Top = 16
        Width = 444
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qryNomeResp
        LookupField = 'CODIGO'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnChange = speAnoChange
      end
    end
    object gbxEstab: TGroupBox
      Left = 19
      Top = 72
      Width = 587
      Height = 107
      Caption = 'Estabelecimento(s)'
      TabOrder = 2
      object chklstEstab: TCheckListBox
        Left = 8
        Top = 14
        Width = 433
        Height = 85
        OnClickCheck = chklstEstabClickCheck
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        Style = lbOwnerDrawFixed
        TabOrder = 0
        OnDrawItem = chklstEstabDrawItem
      end
      object bbtnSelTodos: TBitBtn
        Left = 446
        Top = 14
        Width = 131
        Height = 25
        Caption = '   Seleciona Todos'
        TabOrder = 1
        TabStop = False
        OnClick = bbtnSelTodosClick
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
      object bbtnInverteSel: TBitBtn
        Left = 446
        Top = 41
        Width = 131
        Height = 25
        Caption = '   Inverte Seleção'
        TabOrder = 2
        TabStop = False
        OnClick = bbtnInverteSelClick
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
    end
    object gbxRubSal: TGroupBox
      Left = 19
      Top = 189
      Width = 587
      Height = 216
      Caption = 'Rubricas que compõem o Salário / Tipos de Contrato:'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      object lblDescricao1: TLabel
        Left = 8
        Top = 171
        Width = 159
        Height = 13
        Caption = 'Procura por Rubricas pelo Código'
      end
      object edCodRubricas: TEdit
        Left = 8
        Top = 185
        Width = 460
        Height = 21
        Hint = 
          'Digite aqui o código das Rubricas a procurar separados por vírgu' +
          'la'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object sbtnMarcarRub: TBitBtn
        Left = 476
        Top = 182
        Width = 103
        Height = 28
        Caption = '   &Marcar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        TabStop = False
        OnClick = sbtnMarcarRubClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888FF8888888888888778888888888888F77F8888888888800F08
          8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
          88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
          08888877777F788F7F8881999991FFCF088887777777F87878F8998999991CFF
          F088778777777F88F78F99F899991FFCFF0877F877777F87887899FF89991CCF
          FFF077FF87777F7888F799F9F8891FFFF77877F7F8877F88F77899F99FF81FF7
          788877F77FF878F7788889999991777888888777777787788888889999988888
          8888887777788888888888888888888888888888888888888888}
        NumGlyphs = 2
        Spacing = 0
      end
      object Paginas: TPageControl
        Left = 8
        Top = 15
        Width = 571
        Height = 153
        ActivePage = tbshFolhaNormal
        HotTrack = True
        TabOrder = 2
        OnChange = PaginasChange
        object tbshFolhaNormal: TTabSheet
          Caption = 'Para a Folha Normal'
          object chklstRubrica1: TCheckListBox
            Left = 1
            Top = 2
            Width = 422
            Height = 120
            OnClickCheck = chklstRubrica1ClickCheck
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            Style = lbOwnerDrawFixed
            TabOrder = 0
            OnDrawItem = chklstEstabDrawItem
          end
        end
        object tbsh1Parc13: TTabSheet
          Caption = 'Para a 1º Parcela do 13º'
          object chklstRubrica2: TCheckListBox
            Left = 1
            Top = 2
            Width = 422
            Height = 120
            OnClickCheck = chklstRubrica1ClickCheck
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            Style = lbOwnerDrawFixed
            TabOrder = 0
            OnDrawItem = chklstEstabDrawItem
          end
        end
        object tbsh2Parc13: TTabSheet
          Caption = 'Para a 2º Parcela do 13º'
          object chklstRubrica3: TCheckListBox
            Left = 1
            Top = 2
            Width = 422
            Height = 120
            OnClickCheck = chklstRubrica1ClickCheck
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            Style = lbOwnerDrawFixed
            TabOrder = 0
            OnDrawItem = chklstEstabDrawItem
          end
        end
        object tbshTiposContr: TTabSheet
          Caption = 'Tipos de Contrato'
          object gbxTipContra: TGroupBox
            Left = 61
            Top = 14
            Width = 220
            Height = 90
            Caption = 'gbxTipContra'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            object cbxEfetivos: TCheckBox
              Left = 9
              Top = 17
              Width = 64
              Height = 13
              Caption = 'Efetivos'
              Checked = True
              ParentShowHint = False
              ShowHint = False
              State = cbChecked
              TabOrder = 0
            end
            object cbxEspeciais: TCheckBox
              Left = 9
              Top = 35
              Width = 90
              Height = 13
              Caption = 'Efet. Especiais'
              Checked = True
              ParentShowHint = False
              ShowHint = False
              State = cbChecked
              TabOrder = 1
            end
            object cbxTemporarios: TCheckBox
              Left = 9
              Top = 52
              Width = 85
              Height = 13
              Caption = 'Temporários'
              Checked = True
              ParentShowHint = False
              ShowHint = False
              State = cbChecked
              TabOrder = 2
            end
            object cbxEstagiarios: TCheckBox
              Left = 9
              Top = 69
              Width = 74
              Height = 13
              Caption = 'Estagiários'
              ParentShowHint = False
              ShowHint = False
              TabOrder = 3
            end
            object cbxTerceiros: TCheckBox
              Left = 129
              Top = 17
              Width = 66
              Height = 13
              Caption = 'Terceiros'
              ParentShowHint = False
              ShowHint = False
              TabOrder = 4
            end
            object cbxProprietarios: TCheckBox
              Left = 129
              Top = 35
              Width = 80
              Height = 13
              Caption = 'Proprietários'
              ParentShowHint = False
              ShowHint = False
              TabOrder = 5
            end
            object cbxAutonomos: TCheckBox
              Left = 129
              Top = 52
              Width = 75
              Height = 13
              Caption = 'Autônomos'
              ParentShowHint = False
              ShowHint = False
              TabOrder = 6
            end
          end
        end
      end
      object bbtnSelTodasRub: TBitBtn
        Left = 441
        Top = 41
        Width = 131
        Height = 25
        Caption = '   Seleciona Todas'
        TabOrder = 3
        TabStop = False
        OnClick = bbtnSelTodasRubClick
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
      object bbtnInverteSelRub: TBitBtn
        Left = 441
        Top = 68
        Width = 131
        Height = 25
        Caption = '   Inverte Seleção'
        TabOrder = 4
        TabStop = False
        OnClick = bbtnInverteSelRubClick
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
    end
  end
  inherited Dock971: TDock97
    Top = 425
    Width = 625
    inherited tb97Fundo: TToolbar97
      Left = 292
      DockPos = 292
      inherited sep1: TToolbarSep97
        Left = 243
      end
      inherited sep3: TToolbarSep97
        Left = 326
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 133
        Top = 0
        Blank = True
        SizeHorz = 30
      end
      inherited bbtnSair: TBitBtn
        Left = 163
        TabOrder = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 246
        TabOrder = 2
      end
      object rbtnVerificar: TBitBtn
        Left = 0
        Top = 0
        Width = 133
        Height = 33
        Caption = '  &Verificar Geração'
        Default = True
        TabOrder = 0
        OnClick = rbtnVerificarClick
        Glyph.Data = {
          96010000424D9601000000000000760000002800000018000000180000000100
          0400000000002001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777770777777777777777777777770077777777777
          777777777770B077777777777777777777770B077777777777777777700000B0
          7777777777777777770BBBBB0777777777700077770BBB0000777777788FF087
          7770BBB0777777788FFFFF070000BFBF0777778FFFF88F070BFBFB000077778F
          F00F0FF070BFBF07777777700FFF0FF000FBFBF07777700FFFFFF0FF070FBFBF
          077778FFFFFCF0FFF0000000077778FFCCCFFF0FF07777777777778FFFFFCF0F
          887777777777778FFCCCFFF07777777777777778FFFFFCFF0777777777777778
          FFCCCFFFF0777777777777778FFFFFF8877777777777777778FFF88777777777
          7777777777888777777777777777777777777777777777777777}
        Spacing = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      Visible = False
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        ModalResult = 0
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Hint = 'Chama a janela de escolha da pasta para a geração do Arquivo'
        Caption = '&Novo'
        Enabled = False
        ModalResult = 0
        ParentShowHint = False
        ShowHint = True
        Visible = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
          0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
          33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 352
    Top = 111
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryParamRH: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NORMALINI, NORMALFIM, FERIASFIM, PGTO13FIM'
      'FROM'
      '  PARAMRH')
    ValidateWithMask = True
    Left = 91
    Top = 110
  end
  object qryRAIS: TwwQuery
    BeforeOpen = qryRAISBeforeOpen
    AfterOpen = qryRAISAfterOpen
    AfterScroll = qryRAISAfterScroll
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 91
    Top = 98
  end
  object qryNomeResp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PJ.IDPESSOA AS CODIGO, PJ.NOME'
      'FROM'
      '  PESSOA PJ, FILIALPESSOA FP'
      'WHERE'
      ''
      '  (PJ.IDGRUPO        = :EMPRESA) AND'
      '  (FP.IDFILIALPESSOA = PJ.IDPESSOA)')
    ValidateWithMask = True
    Left = 232
    Top = 110
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryResp: TwwQuery
    BeforeOpen = qryRespBeforeOpen
    AfterOpen = qryRespAfterOpen
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 232
    Top = 97
  end
  object qryNomeEstab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PJ.IDPESSOA AS CODIGO, PJ.NOME'
      'FROM'
      '  PESSOA PJ, FILIALPESSOA FP'
      'WHERE'
      ''
      '  (PJ.IDGRUPO        = :EMPRESA) AND'
      '  (FP.IDFILIALPESSOA = PJ.IDPESSOA)')
    ValidateWithMask = True
    Left = 160
    Top = 110
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryEstab: TwwQuery
    BeforeOpen = qryEstabBeforeOpen
    AfterOpen = qryEstabAfterOpen
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 160
    Top = 98
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODPROVDESC, DESCRPROVDESC'
      'FROM'
      '  RUBRICAXPESS'
      'WHERE'
      '  (IDPESSOA = :EMPRESA)'
      'ORDER BY'
      '  UPPER(DESCRPROVDESC)')
    ValidateWithMask = True
    Left = 296
    Top = 110
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
end
