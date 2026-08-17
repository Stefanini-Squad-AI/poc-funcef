inherited frmParamFolhaEmprRub: TfrmParamFolhaEmprRub
  Left = 247
  Top = 36
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Folha de Empregados por Rubrica'
  ClientHeight = 487
  ClientWidth = 476
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 476
    Height = 448
    BorderWidth = 2
    object gbxEstab: TGroupBox
      Left = 10
      Top = 116
      Width = 456
      Height = 43
      Caption = 'Estabelecimento'
      TabOrder = 0
      object dblkcbEstab: TwwDBLookupCombo
        Left = 8
        Top = 14
        Width = 441
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Estabelecimento')
        LookupTable = qryEstab
        LookupField = 'CODIGO'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = dblkcbEstabChange
      end
    end
    object gbxAnoMesRef: TGroupBox
      Left = 10
      Top = 161
      Width = 236
      Height = 43
      Caption = 'Mês e Ano de Referência'
      TabOrder = 1
      object cmbMes: TComboBox
        Left = 8
        Top = 14
        Width = 131
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object speAno: TSpinEdit
        Left = 152
        Top = 14
        Width = 75
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
        OnChange = speAnoChange
      end
    end
    object rgProcesso: TRadioGroup
      Left = 251
      Top = 161
      Width = 215
      Height = 43
      Caption = 'Processo'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Prévia'
        'Final')
      TabOrder = 2
    end
    object gbxRubricas: TGroupBox
      Left = 10
      Top = 206
      Width = 456
      Height = 141
      Caption = 'Rubricas'
      TabOrder = 3
      object Label1: TLabel
        Left = 7
        Top = 94
        Width = 159
        Height = 13
        Caption = 'Procura por Rubricas pelo Código'
      end
      object chklstRubrica: TCheckListBox
        Left = 7
        Top = 15
        Width = 441
        Height = 76
        OnClickCheck = chklstRubricaClickCheck
        ItemHeight = 13
        Style = lbOwnerDrawFixed
        TabOrder = 0
        OnDrawItem = chklstRubricaDrawItem
        OnKeyDown = chklstTipoFolhaKeyDown
      end
      object edCodRubricas: TEdit
        Left = 7
        Top = 110
        Width = 333
        Height = 21
        Hint = 
          'Digite aqui o código das Rubricas a procurar separados por vírgu' +
          'la'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object sbtnMarcarRub: TBitBtn
        Left = 345
        Top = 106
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
        TabOrder = 2
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
    end
    object gbxOrdem: TGroupBox
      Left = 10
      Top = 350
      Width = 456
      Height = 43
      Caption = 'Ordem de Impressão'
      TabOrder = 4
      object cmbOrderBy: TComboBox
        Left = 8
        Top = 14
        Width = 441
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = cmbOrderByChange
        Items.Strings = (
          'Código da Rubrica, Funcionário'
          'Código da Rubrica, Matrícula'
          'Nome da Rubrica, Funcionário'
          'Nome da Rubrica, Matrícula'
          'Código da Rubrica, Código do Centro de Custo, Funcionário'
          'Código da Rubrica, Código do Centro de Custo, Matrícula'
          'Nome da Rubrica, Nome do Centro de Custo, Funcionário'
          'Nome da Rubrica, Nome do Centro de Custo, Matrícula')
      end
    end
    object rgTipoRelat: TRadioGroup
      Left = 10
      Top = 395
      Width = 202
      Height = 43
      Caption = 'Agrupar por Centro de Custo'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Analítico'
        'Sintético')
      TabOrder = 5
    end
    object gbxTipoPapel: TGroupBox
      Left = 217
      Top = 395
      Width = 249
      Height = 43
      Caption = 'Tipo de Papel'
      TabOrder = 6
      object cmbTipoPapel: TComboBox
        Left = 8
        Top = 14
        Width = 233
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object Paginas: TPageControl
      Left = 10
      Top = 8
      Width = 456
      Height = 106
      ActivePage = tbshTipoFolha
      HotTrack = True
      TabOrder = 7
      object tbshTipoFolha: TTabSheet
        Caption = '&Tipos de Folha'
        object chklstTipoFolha: TCheckListBox
          Left = 1
          Top = 2
          Width = 309
          Height = 73
          OnClickCheck = chklstTipoFolhaClickCheck
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style = lbOwnerDrawFixed
          TabOrder = 0
          OnDrawItem = chklstRubricaDrawItem
          OnKeyDown = chklstTipoFolhaKeyDown
        end
      end
      object tbshCCusto: TTabSheet
        Caption = '&Centros de Custo'
        object chklstCCusto: TCheckListBox
          Left = 1
          Top = 2
          Width = 309
          Height = 73
          OnClickCheck = chklstTipoFolhaClickCheck
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style = lbOwnerDrawFixed
          TabOrder = 0
          OnDrawItem = chklstRubricaDrawItem
          OnKeyDown = chklstTipoFolhaKeyDown
        end
      end
    end
    object spbtSelTodos: TBitBtn
      Left = 329
      Top = 35
      Width = 131
      Height = 25
      Caption = '   Seleciona Todos'
      TabOrder = 8
      TabStop = False
      OnClick = spbtSelTodosClick
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
    object spbtInvSelecao: TBitBtn
      Left = 329
      Top = 62
      Width = 131
      Height = 25
      Caption = '   Inverte Seleção'
      TabOrder = 9
      TabStop = False
      OnClick = spbtInvSelecaoClick
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
  inherited Dock971: TDock97
    Top = 448
    Width = 476
    inherited tb97Fundo: TToolbar97
      Left = 228
      DockPos = 340
      inherited sep1: TToolbarSep97
        Left = 162
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnConfirmarClick
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
    Left = 212
    Top = 239
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryEstab: TwwQuery
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
    Left = 165
    Top = 239
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
end
