inherited frmConsOrcamPessoal: TfrmConsOrcamPessoal
  Left = 19
  Top = 67
  HelpContext = 700012
  Caption = 'Consulta Orçado x Realizado da Quantidade de Pessoal (Manpower)'
  ClientHeight = 470
  ClientWidth = 746
  Constraints.MinHeight = 460
  Constraints.MinWidth = 754
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 133
    Width = 746
    Height = 298
    object pnlGrafico: TPanel
      Left = 233
      Top = 5
      Width = 508
      Height = 288
      Align = alClient
      TabOrder = 1
    end
    object pnlGrid: TPanel
      Left = 5
      Top = 5
      Width = 228
      Height = 288
      Align = alLeft
      TabOrder = 0
      object dbgrOrcam: TwwDBGrid
        Left = 1
        Top = 1
        Width = 226
        Height = 286
        Selected.Strings = (
          'MES'#9'10'#9'    Mês     '
          'ORCADO'#9'10'#9'  Orçado    '
          'REALIZADO'#9'10'#9'Real/Projet.')
        IniAttributes.Delimiter = ';;'
        TitleColor = clGray
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsOrcamPessoal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        Visible = False
        IndicatorColor = icYellow
      end
    end
    object Chart1: TChartfx
      Left = 233
      Top = 5
      Width = 508
      Height = 288
      Align = alClient
      TabOrder = 2
      Visible = False
      ControlData = {
        81340000C41D00006000000000000101550200FFFFFFFF320032002800280002
        00000000000000080001000000000000000000000000000000020000FFFF00C0
        C0C000C0C0C000FFFFFF00FF03F7010000000000010000000000000000080000
        2008000060080000000800000008000000080000000800000008000000080000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000000000F0
        3F02000400000000000000000000000000000059400000000000000000000000
        000000000000000000}
    end
  end
  inherited Dock971: TDock97
    Top = 431
    Width = 746
    inherited tb97Fundo: TToolbar97
      Left = 498
      DockPos = 584
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
    object Toolbar972: TToolbar97
      Left = 0
      Top = 0
      Caption = 'TB97oKCancelar'
      DockPos = 0
      TabOrder = 1
      object sbtnImprimirRel: TSpeedButton
        Left = 0
        Top = 0
        Width = 126
        Height = 33
        Caption = '  &Imprimir Relatório'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
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
        ParentShowHint = False
        ShowHint = False
        OnClick = sbtnImprimirRelClick
      end
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 746
    Height = 133
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object pgctrlEmpregados: TPageControl
      Left = 7
      Top = 4
      Width = 546
      Height = 125
      ActivePage = tbshListaFunc
      HotTrack = True
      TabOrder = 0
      OnChange = pgctrlEmpregadosChange
      object tbshListaFunc: TTabSheet
        Caption = 'Cargos'
        object chklstCargo: TColorCheckListBox
          Left = 2
          Top = 2
          Width = 400
          Height = 92
          ItemHeight = 13
          Style = lbOwnerDrawFixed
          TabOrder = 0
        end
      end
      object tbshCCusto: TTabSheet
        Caption = 'Centros de Custo'
        ImageIndex = 2
        object chklstCCusto: TColorCheckListBox
          Left = 2
          Top = 2
          Width = 400
          Height = 92
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
      end
      object tbshEstabelecimento: TTabSheet
        Caption = 'Estabelecimentos'
        ImageIndex = 3
        object chklstEstab: TColorCheckListBox
          Left = 2
          Top = 1
          Width = 400
          Height = 95
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
      end
      object tbshFiltroFunc: TTabSheet
        Caption = 'Tipos de Contrato'
        ImageIndex = 3
        object cbxEfetivos: TCheckBox
          Left = 158
          Top = 17
          Width = 64
          Height = 13
          Caption = 'Efetivos'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object cbxEspeciais: TCheckBox
          Left = 158
          Top = 35
          Width = 90
          Height = 13
          Caption = 'Efet. Especiais'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object cbxTemporarios: TCheckBox
          Left = 158
          Top = 52
          Width = 85
          Height = 13
          Caption = 'Temporários'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object cbxEstagiarios: TCheckBox
          Left = 158
          Top = 69
          Width = 74
          Height = 13
          Caption = 'Estagiários'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object cbxTerceiros: TCheckBox
          Left = 262
          Top = 17
          Width = 66
          Height = 13
          Caption = 'Terceiros'
          TabOrder = 4
        end
        object cbxPropDirSemVinc: TCheckBox
          Left = 262
          Top = 35
          Width = 118
          Height = 13
          Caption = 'Prop/Dir s/ Vinc'
          TabOrder = 5
        end
        object cbxAutonomos: TCheckBox
          Left = 262
          Top = 52
          Width = 75
          Height = 13
          Caption = 'Autônomos'
          TabOrder = 6
        end
      end
    end
    object bbtnSelTodos: TBitBtn
      Left = 417
      Top = 31
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
      Left = 417
      Top = 58
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
    object gbxAno: TGroupBox
      Left = 604
      Top = 40
      Width = 97
      Height = 49
      Caption = 'Ano'
      TabOrder = 3
      object speAno: TSpinEdit
        Left = 23
        Top = 16
        Width = 58
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 81
    Top = 342
  end
  object dsOrcamPessoal: TwwDataSource
    DataSet = CdsOrcamPessoal
    Left = 146
    Top = 278
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Empregado'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA '
      'FUNCIONARIO'
      'CARGO')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDCARGO = CARGO.IDCARGO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 24
    Top = 342
  end
  object CdsOrcamPessoal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 106
    Top = 222
  end
end
