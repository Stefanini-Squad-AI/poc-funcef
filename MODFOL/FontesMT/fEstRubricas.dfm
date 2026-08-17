inherited frmEstRubricas: TfrmEstRubricas
  Left = 51
  Top = 78
  HelpContext = 210080
  Caption = 'Estatística Evolutiva da Folha de Pagamento'
  ClientHeight = 461
  ClientWidth = 700
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 700
    Height = 422
    BorderWidth = 2
    object pnlResultado: TPanel
      Left = 4
      Top = 4
      Width = 692
      Height = 414
      Align = alClient
      TabOrder = 1
      object Chart1: TChartfx
        Left = 1
        Top = 1
        Width = 632
        Height = 408
        TabOrder = 0
        ControlData = {
          524100002B2A00006000000000000101550200FFFFFFFF500032002800280004
          00000000000000080001000000000000000000000000000000020000FFFF00C0
          C0C000C0C0C000FFFFFF00FF1FFF1F0000000000010000000000000000080000
          2008000060080000000800000008000000080000000800000008000000080000
          0000000000000000000000000000000000000000000000000000000000000000
          0002000000000102000000000102000000000002000000000000000000000000
          00000000000000F03F0200040000000000000000000000000000005940000000
          0000000000000000000000000000000000}
      end
    end
    object pnlSelecao: TPanel
      Left = 4
      Top = 4
      Width = 692
      Height = 414
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Bevel2: TBevel
        Left = 360
        Top = 1
        Width = 331
        Height = 412
        Style = bsRaised
      end
      object Bevel1: TBevel
        Left = 1
        Top = 1
        Width = 358
        Height = 412
        Style = bsRaised
      end
      object Label6: TLabel
        Left = 7
        Top = 56
        Width = 42
        Height = 13
        Caption = 'Rubricas'
      end
      object Label2: TLabel
        Left = 7
        Top = 330
        Width = 159
        Height = 13
        Caption = 'Procura por Rubricas pelo Código'
      end
      object chklstRubrica: TColorCheckListBox
        Left = 7
        Top = 71
        Width = 346
        Height = 252
        OnClickCheck = chklstRubricaClickCheck
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        Style = lbOwnerDrawFixed
        TabOrder = 1
      end
      object grpMesRef: TGroupBox
        Left = 7
        Top = 2
        Width = 346
        Height = 45
        Caption = 'Mês e Ano de Referência Final'
        TabOrder = 0
        object cmbMes: TComboBox
          Left = 75
          Top = 15
          Width = 114
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
        object spnedAno: TSpinEdit
          Left = 204
          Top = 15
          Width = 67
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
          OnChange = spnedAnoChange
        end
      end
      object gbxFiltroCCusto: TGroupBox
        Left = 368
        Top = 110
        Width = 315
        Height = 123
        Caption = 'Filtro por Centro de Custo'
        TabOrder = 5
        object chklstCCusto: TColorCheckListBox
          Left = 7
          Top = 15
          Width = 302
          Height = 71
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
        end
        object bbtnSelTodosCCusto: TBitBtn
          Left = 8
          Top = 91
          Width = 131
          Height = 25
          Caption = '   Seleciona Todos'
          TabOrder = 1
          TabStop = False
          OnClick = bbtnSelTodosCCustoClick
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
        object bbtnInverteSelCCusto: TBitBtn
          Left = 177
          Top = 91
          Width = 131
          Height = 25
          Caption = '   Inverte Seleção'
          TabOrder = 2
          TabStop = False
          OnClick = bbtnInverteSelCCustoClick
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
        object bbtnAplicarSelCCusto: TBitBtn
          Left = 146
          Top = 91
          Width = 26
          Height = 25
          Hint = 'Aplicar seleção dos Centros de Custo'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          TabStop = False
          OnClick = bbtnAplicarSelCCustoClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000C40E0000C40E00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888777778888888888F777778FF888888776666677
            88888887788888778F88887666666666088888788888F88878F887E6666F6666
            608887F888878F8887F887E666FFF66660888788887778F8878F7E666FFFFF66
            66087F888777778F887F7E66FFFFFFF666087F8877777778F87F7E6FFFFFFFFF
            66087F8777777777887F7E6666FFF66666087F8888777F88887F7E6666FFF666
            660878F888777F88887887E666FFF666608887F888777F8887F887E666FFF666
            6088878F887778888788887EE666666608888878FF888888788888800EEEEE00
            8888888778FFFF77888888888000008888888888877777888888}
          NumGlyphs = 2
          Spacing = 0
        end
      end
      object gbxFunc: TGroupBox
        Left = 368
        Top = 235
        Width = 315
        Height = 171
        Caption = 'Empregados'
        TabOrder = 6
        object chklstFunc: TColorCheckListBox
          Left = 7
          Top = 15
          Width = 302
          Height = 122
          OnClickCheck = chklstFuncClickCheck
          ItemHeight = 13
          Style = lbOwnerDrawFixed
          TabOrder = 0
        end
        object bbtnSelTodos: TBitBtn
          Left = 16
          Top = 141
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
          Left = 177
          Top = 141
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
      object edCodRubricas: TEdit
        Left = 7
        Top = 346
        Width = 238
        Height = 21
        Hint = 
          'Digite aqui o código das Rubricas a Procurar separdos por vírgul' +
          'a'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object sbtnMarcarRub: TBitBtn
        Left = 250
        Top = 342
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
        TabOrder = 3
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
      object rgTipAnal: TRadioGroup
        Left = 7
        Top = 372
        Width = 346
        Height = 34
        Caption = 'Tipo de Análise'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Valor Total'
          'Quantidade'
          'Valor Médio')
        TabOrder = 7
      end
      object gbxEstabelecimento: TGroupBox
        Left = 368
        Top = 2
        Width = 315
        Height = 107
        Caption = 'Estabelecimentos'
        TabOrder = 4
        object bbtnSelTodosEstab: TBitBtn
          Left = 8
          Top = 78
          Width = 131
          Height = 25
          Caption = '   Seleciona Todos'
          TabOrder = 0
          TabStop = False
          OnClick = bbtnSelTodosEstabClick
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
        object bbtnInverteSelEstab: TBitBtn
          Left = 177
          Top = 78
          Width = 131
          Height = 25
          Caption = '   Inverte Seleção'
          TabOrder = 1
          TabStop = False
          OnClick = bbtnInverteSelEstabClick
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
        object chklstEstab: TColorCheckListBox
          Left = 7
          Top = 14
          Width = 302
          Height = 60
          OnClickCheck = chklstEstabClickCheck
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
          TabOrder = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 422
    Width = 700
    inherited tb97Fundo: TToolbar97
      Left = 529
      DockPos = 529
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 361
      DockPos = 361
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Caption = '&Voltar'
        Enabled = False
        OnClick = bbtnCancelarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888888888888888888888888888888888888444488
          8888888887777888888888884444444488888887777777788888888444888844
          4888887778888777888888844888888448888877888888778888884488888888
          4488877888888887788888448888888844888778888888877888884488888888
          4488877888888887788888448888888844888778888888877888888448888484
          4888887788887877888888844888844448888877888877778888888888888444
          8888888888887778888888888888844448888888888877778888888888888888
          8888888888888888888888888888888888888888888888888888}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 316
    Top = 25
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object CdsEstab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 23
    Top = 76
  end
  object CdsRubrica: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 75
    Top = 76
  end
  object CdsCCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 130
    Top = 76
  end
  object sqlResultado: TCMSqlParams
    ClientDataSet = CdsResultado
    Left = 99
    Top = 25
  end
  object CdsResultado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 33
    Top = 25
  end
  object CdsFunc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 179
    Top = 76
  end
end
