inherited frmExportarRegras: TfrmExportarRegras
  Left = 155
  Top = 86
  HelpContext = 450005
  Caption = 'Exportação de Regras'
  ClientHeight = 542
  ClientWidth = 853
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 853
    Height = 503
    BorderWidth = 0
    object Panel3: TPanel
      Left = 164
      Top = 0
      Width = 689
      Height = 503
      Align = alClient
      Caption = 'Panel1'
      TabOrder = 0
      object dbgrRegra: TwwDBGrid
        Left = 1
        Top = 28
        Width = 687
        Height = 379
        Selected.Strings = (
          'IDREGRA'#9'9'#9'Número'
          'NOMEREGRA'#9'59'#9'Nome da Regra'
          'DESCREGRA'#9'40'#9'Tipo de Regra')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Ctl3D = True
        DataSource = dsTabRegra
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentCtl3D = False
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
      object Panel5: TPanel
        Left = 1
        Top = 434
        Width = 687
        Height = 68
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 1
        object chklstOpcoes: TCMchklistbox
          Left = 1
          Top = 1
          Width = 456
          Height = 66
          GlyphChecked.Data = {
            E6000000424DE60000000000000076000000280000000E0000000E0000000100
            0400000000007000000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FF00F000000000000F00F0FFFFFFFFFF0F00F0FFF0FFFFFF0F00F0FF000FFFFF
            0F00F0F00000FFFF0F00F0F00F000FFF0F00F0F0FFF000FF0F00F0FFFFFF000F
            0F00F0FFFFFFF00F0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F00000000000
            0F00FFFFFFFFFFFFFF00}
          GlyphUnchecked.Data = {
            E6000000424DE60000000000000076000000280000000E0000000E0000000100
            0400000000007000000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FF00F000000000000F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF
            0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF
            0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F00000000000
            0F00FFFFFFFFFFFFFF00}
          GlyphTopMargin = 0
          GlyphLeftMargin = 0
          TextLeftMargin = 0
          ReadOnly = False
          Align = alLeft
          Ctl3D = False
          ItemHeight = 16
          ItemIndex = 0
          Items.Strings = (
            
              'Exportar as Regras (Pai) que chamam a selecionada em outras ocas' +
              'iões'
            
              'Exportar as Regras (Filhas) que são chamadas pela Regra selecion' +
              'ada'
            'Exportar as regras que utilizam as formulas da regra selecionada'
            'Selecionar somente os parentes de 1ª classe')
          ParentCtl3D = False
          TabOrder = 0
        end
        object btnVerificar: TBitBtn
          Left = 463
          Top = 5
          Width = 119
          Height = 58
          Caption = 'Executar Opções'
          TabOrder = 1
          OnClick = btnVerificarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
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
          Layout = blGlyphTop
          NumGlyphs = 2
        end
      end
      object Panel6: TPanel
        Left = 1
        Top = 407
        Width = 687
        Height = 27
        Align = alBottom
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = '  Opções Complementares  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 687
        Height = 27
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = '  Regras Selecionadas  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 164
      Height = 503
      Align = alLeft
      BevelOuter = bvLowered
      TabOrder = 1
      object Bevel1: TBevel
        Left = 5
        Top = 76
        Width = 154
        Height = 6
      end
      object LstAux: TListBox
        Left = 12
        Top = 332
        Width = 79
        Height = 24
        Color = 16639937
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        Visible = False
      end
      object btnCompactar: TButton
        Left = 12
        Top = 360
        Width = 114
        Height = 28
        Caption = '&Zipados'
        TabOrder = 1
        Visible = False
        OnClick = btnCompactarClick
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 162
        Height = 28
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = ' Selecionar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object btnTodas: TBitBtn
        Left = 8
        Top = 91
        Width = 149
        Height = 28
        Caption = 'Tod&as as Regras'
        TabOrder = 3
        OnClick = btnTodasClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
          77777777777F8887F77777777788FF08777777777F887778F777777788FFFFF0
          7777777788777FF8F7777778FFFF88F077777778F77F88F87F777778FF00F0FF
          077777787F8878F78F77777700FFF0FF0777777F8877787F87F77700FFFFFF0F
          F077778877777F8F787F778FFFFFCF0FFF07778F77FF8787F787778FFCCCFFF0
          FFF07787F88877F8F7F87778FFFFFCF0F8877778F77FF87878877778FFCCCFFF
          077777787F88877F87F777778FFFFFCFF07777778F77FF87787F77778FFCCCFF
          FF07777787F888777F87777778FFFFFF88777777787F777F88777777778FFF88
          777777777787FF88777777777778887777777777777888777777}
        Margin = 10
        NumGlyphs = 2
      end
      object btnRegras: TBitBtn
        Left = 8
        Top = 39
        Width = 149
        Height = 28
        Caption = '&Regra'
        TabOrder = 4
        OnClick = btnRegrasClick
        Glyph.Data = {
          1E060000424D1E06000000000000360000002800000018000000150000000100
          180000000000E8050000CA0E0000C30E00000000000000000000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F60302F60302F7F7F
          7FCF6760BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F60302FFF9790
          FF979000FFFF60302F60302FCF67607F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F60302FFF
          9790FFC8CFFFC8CFFFC8CF00FFFFFFC8CF60302FCF6760CF6760CF67607F7F7F
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F6030
          2FFF9790FFC8CF00FFFFCFFFFFFFC8CFFFC8CFCFFFFFFFC8CFCF676060302FCF
          6760CF6760CF67607F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          7F7F7FCF6760FFC8CF00FFFFFFC8CFFFC8CF7F7F7F7F7F7FCFFFFFFFC8CFCFFF
          FFFFC8CF60302FFF0000CF6760CF6760CF67607F7F7F7F7F7FBFBFBFBFBFBFBF
          BFBFBFBFBF7F7F7FFF9790FFC8CF00FFFFCFFFFF7F7F7F7F7F7FFFC8CF00FFFF
          FFC8CF00FFFFFFC8CFCFFFFFCF67600000FFFF0000FF00007F7F7F7F7F7F7F7F
          7F7F7F7FBFBFBFBFBFBFBFBFBFBFBFBF00FFFFFFC8CFFFC8CF7F7F7FFFC8CFCF
          FFFFFFC8CF7F7F7F7F7F7FCFFFFFCFFFFFFFC8CFCFFFFF60302F0000FFFF0000
          CF67607F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFF
          FFFFFFFF00FFFF7F7F7F7F7F7FCFFFFFCFFFFFCFFFFFFFC8CFCFFFFFFFC8CFCF
          6760FF97900000FFFF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFFFC8CFFFFFFFFFFFFF1F201F7F7F7FCFFFFFCFFFFF7F7F7F7F7F7FCFFF
          FFFFC8CFCFFFFFFFC8CF60302FFFC8CF0000FFFF0000BFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFFFC8CFCF6760CF67601F201F7F7F7F7F7F7F
          CFFFFFCFFFFFFFC8CFCFFFFFFFC8CFCFFFFFCF6760CFFFFFFF97900000FFFF00
          00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFCF6760FFC8CFFF9790CF
          67601F201F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFC8CFFFFFFF60302F
          CFFFFFFF97900000FFCF6760BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFCF6760FFC8
          CFFFC8CFFF9790FF9790CF67601F201F7F7F7FCFFFFFFFFFFFCFFFFFFFFFFFCF
          FFFFFFC8CFCF6760FFFFFFFFFFFFFF00000000FFCF6760BFBFBFBFBFBFBFBFBF
          CF6760FFC8CFFFC8CFFFC8CFFF9790FF9790FF9790CF67601F201F7F7F7FFFFF
          FFFFFFFFFFFFFFFFC8CFCFFFFFFFC8CFFFFFFFFFFFFFFFFFFFCF6760CF6760BF
          BFBFBFBFBFCF6760FFC8CFFFFFFFFFC8CFFFC8CFFF9790CF6760CF6760CF6760
          CF67601F201F7F7F7FFFFFFF3F3700CFFFFFCF6760FFFFFF0000FF0000FF0000
          FFCF6760BFBFBFBFBFBFBFBFBF60302F60302F60302FFFC8CFFFC8CFFF9790CF
          67601F201F1F201F1F201F1F201F1F201FFFFFFFFFFFFFFFC8CFFFFFFFFFFFFF
          FFFFFFFFC8CFCF6760BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFC8
          CFFFC8CFFF9790CF67601F201F60302F60302F60302F60302FFFC8CFFFC8CFFF
          FFFFFF0000FF0000CF6760BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          FF9790FFC8CFFFC8CFFFFFFFFF9790CF67601F201F60302F0000FF0000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFCF6760FFFFFFFFFFFFFFC8CFFF9790CF67601F201F60302F
          BFBFBFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFCF6760FF9790FF9790FF9790FF9790CF
          67601F201F60302FBFBFBFBFBFBFFF0000FF0000BFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFCF6760CF6760CF67
          60CF6760CF67601F201F60302F7F7F7FFFC8CFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBF}
        Margin = 10
      end
      object btnTiposRegras: TBitBtn
        Left = 8
        Top = 122
        Width = 149
        Height = 28
        Caption = 'Regras do &Tipo'
        TabOrder = 5
        OnClick = btnTiposRegrasClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000033
          33333333330F803333333333330F803333333333330F803333333333308F8703
          3333333308F88870333333308F88888703333308F88888887033308F88888888
          870330000000000000033337FFCCCFFF033333337FFFFFCFF03333337FFCCCFF
          FF03333337FFFFFF77333333337FFF7733333333333777333333}
        Margin = 10
      end
      object btnRemover: TBitBtn
        Left = 8
        Top = 197
        Width = 149
        Height = 28
        Caption = 'Regra &Posicionada'
        TabOrder = 6
        OnClick = btnRemoverClick
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
        Margin = 10
        NumGlyphs = 2
      end
      object BtnApagarTudo: TBitBtn
        Left = 8
        Top = 228
        Width = 149
        Height = 28
        Caption = 'To&das as Regras '
        TabOrder = 7
        OnClick = BtnApagarTudoClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000007
          7777777700919190077777789919191910777789919191919107778918F919F8
          190778919FFF9FFF9190789919FFFFF919107891919FFF919190789919FFFFF9
          191078919FFF9FFF9190778918F919F819077789919191919107777899191919
          1077777788999998877777777788888777777777777777777777}
        Margin = 10
      end
      object Panel2: TPanel
        Left = 1
        Top = 162
        Width = 162
        Height = 28
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = ' Remover Seleção'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
      end
    end
  end
  inherited Dock971: TDock97
    Top = 503
    Width = 853
    inherited tb97Fundo: TToolbar97
      Left = 487
      DockPos = 487
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 587
    Top = 171
  end
  object TabRegra: TwwTable
    AfterOpen = TabRegraAfterOpen
    AfterClose = TabRegraAfterClose
    AfterPost = TabRegraAfterPost
    AfterDelete = TabRegraAfterDelete
    TableName = 'REGRA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 473
    Top = 445
  end
  object bmRegra: TBatchMove
    Destination = TabRegra
    Mode = batCopy
    Source = QryRegra
    Left = 473
    Top = 477
  end
  object QryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  R.IDREGRA, R.NOMEREGRA, R.IDTIPOREGRA, R.DESCRICAOREGRA, R.PUB' +
        'LICADA, 0 AS TIPO,'
      '  T.DESCREGRA, R.IDREGRA AS OLDIDREGRA'
      'FROM'
      '  REGRA R, TIPOREGRA T'
      'WHERE'
      '  R.IDREGRA = :ID AND'
      '  R.IDTIPOREGRA = T.IDTIPOREGRA'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 185
    Top = 477
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object dsTabRegra: TwwDataSource
    DataSet = TabRegra
    Left = 66
    Top = 445
  end
  object msRegras: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'REGRA.IDREGRA'
      'REGRA.NOMEREGRA')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Número da Regra'
      'Descrição da Regra')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'REGRA'
      'TIPOREGRA')
    CamposChave.Strings = (
      'REGRA.IDREGRA'
      'REGRA.NOMEREGRA'
      'REGRA.IDTIPOREGRA'
      'REGRA.DESCRICAOREGRA'
      'REGRA.PUBLICADA'
      'TIPOREGRA.DESCREGRA'
      'REGRA.IDREGRA AS OLDIDREGRA')
    Filtro.Strings = (
      'REGRA.IDTIPOREGRA = TIPOREGRA.IDTIPOREGRA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 688
    Top = 171
  end
  object msTipo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'TIPOREGRA.IDTIPOREGRA'
      'TIPOREGRA.DESCREGRA')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Identificador do Tipo'
      'Descrição ')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOREGRA')
    CamposChave.Strings = (
      'TIPOREGRA.IDTIPOREGRA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 719
    Top = 171
  end
  object QrySelTipo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  R.IDREGRA, R.NOMEREGRA, R.IDTIPOREGRA, R.DESCRICAOREGRA, R.PUB' +
        'LICADA,'
      '  T.DESCREGRA, R.IDREGRA AS OLDIDREGRA'
      'FROM'
      '  REGRA R, TIPOREGRA T'
      'WHERE'
      '  (R.IDTIPOREGRA = :ID) AND'
      '  (R.IDTIPOREGRA = T.IDTIPOREGRA) '
      ' ')
    ValidateWithMask = True
    Left = 129
    Top = 445
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object tabFormula: TwwTable
    TableName = 'FORMULA'
    TableType = ttParadox
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 505
    Top = 445
  end
  object QryFormula: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '      F.IDFORMULA, F.CODGRUPOFORMULA, F.EXPRESSAOFORMULA, F.DESC' +
        'RICAOFORMULA,'
      '      F.EXPRESSAOREAL, 0 AS TIPO, F.IDFORMULA AS IDANTIGO'
      'FROM'
      '    (SELECT FORMULA1, TIPOCAMPO2 FROM ALGREGRA) A, FORMULA F'
      'WHERE'
      
        '     (A.FORMULA1 IS NOT NULL) AND (A.FORMULA1=F.IDFORMULA) AND (' +
        'A. TIPOCAMPO2 = 4)'
      'GROUP BY'
      
        '      F.IDFORMULA, F.DESCRICAOFORMULA, F.EXPRESSAOREAL, F.CODGRU' +
        'POFORMULA,'
      '      F.EXPRESSAOFORMULA'
      'ORDER BY'
      '      F.IDFORMULA'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 217
    Top = 477
  end
  object bm1: TBatchMove
    Destination = tabFormula
    Mode = batCopy
    Source = QryFormula
    Left = 505
    Top = 477
  end
  object bm2: TBatchMove
    Destination = TabCmpBd
    Mode = batCopy
    Source = QryCmpBd
    Left = 537
    Top = 477
  end
  object TabCmpBd: TwwTable
    TableName = 'CMPBD'
    TableType = ttParadox
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 537
    Top = 445
  end
  object QryCmpBd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO,'
      '      CAMPODOBANCO, CHAVE, FLGOBRIGATORIO,'
      '      APELIDO, IDTIPODADO'
      'FROM'
      '    CMPBD'
      ''
      '')
    ValidateWithMask = True
    Left = 281
    Top = 477
  end
  object QryCmpBdGrp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      #9'G.CODGRUPOARQUIVO, G.IDCAMPO '
      'FROM '
      #9'CMPBDGRP G, (SELECT'
      '      '#9#9#9'IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO,'
      '      '#9#9#9'CAMPODOBANCO, CHAVE, FLGOBRIGATORIO,'
      '      '#9#9#9'APELIDO, IDTIPODADO'
      #9#9#9'FROM'
      '    '#9#9#9#9'CMPBD) C'
      'WHERE'
      #9'C.IDCAMPO = G.IDCAMPO'
      'ORDER BY'
      #9'G.CODGRUPOARQUIVO, G.IDCAMPO '
      ''
      #9
      #9
      ''
      '')
    ValidateWithMask = True
    Left = 313
    Top = 477
  end
  object TabCmpBdGrp: TwwTable
    TableName = 'CMPBDGRP'
    TableType = ttParadox
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 569
    Top = 445
  end
  object bm3: TBatchMove
    Destination = TabCmpBdGrp
    Mode = batCopy
    Source = QryCmpBdGrp
    Left = 569
    Top = 477
  end
  object QryAlgregra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDREGRA, IDALGORITMODAREG, IDCAMPO, CORRELACAO, FORMULA2,'
      '      IDCAMPO2, VALOR, TIPOALGORITMO, ALGORSUBSEQTRUE, FORMULA1,'
      
        '      ALGORSUBSEQFALSE, DESCRICAOALGORIT, TIPOCAMPO1, TIPOCAMPO2' +
        ','
      '      FORMATACAO, 0 AS TIPO, 0 AS FORM, IDREGRA AS OLDIDREGRA'
      'FROM'
      '    ALGREGRA'
      'WHERE'
      '     IDREGRA = :ID'
      'ORDER BY'
      '      IDREGRA, IDALGORITMODAREG'
      ' ')
    ValidateWithMask = True
    Left = 377
    Top = 477
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object tabAlgregra: TwwTable
    TableName = 'ALGREGRA'
    TableType = ttParadox
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 633
    Top = 445
  end
  object bm5: TBatchMove
    Destination = tabAlgregra
    Mode = batCopy
    Source = QryAlgregra
    Left = 633
    Top = 477
  end
  object bm6: TBatchMove
    Destination = tabTipoRegra
    Mode = batCopy
    Source = QryTipoRegra
    Left = 665
    Top = 477
  end
  object QryTipoRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  T.DESCREGRA, T.SQLREGRA, T.IDTIPOREGRA AS IDANTIGO,'
      '  T.IDGRUPOREGRA, G.DESCRICAO '
      'FROM'
      '  (SELECT IDTIPOREGRA FROM REGRA GROUP BY IDTIPOREGRA) R, '
      '  TIPOREGRA T, GRUPOREGRA G'
      'WHERE'
      '  (T.IDTIPOREGRA  = R.IDTIPOREGRA)  AND '
      '  (T.IDGRUPOREGRA = G.IDGRUPOREGRA)'
      'ORDER BY'
      '  T.IDTIPOREGRA'
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 409
    Top = 477
  end
  object QryGrpFormula: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      GRP.CODGRUPOFORMULA, GRP.DESCGRUPOFORMULA'
      'FROM'
      '    GRPFORMULA GRP,'
      
        '    (SELECT F.IDFORMULA, F.CODGRUPOFORMULA, F.EXPRESSAOFORMULA, ' +
        'F.DESCRICAOFORMULA,'
      '            F.EXPRESSAOREAL'
      '    FROM'
      '        ALGREGRA A, FORMULA F'
      '    WHERE'
      
        '         (A.FORMULA1 IS NOT NULL) AND (A.FORMULA1=F.IDFORMULA) A' +
        'ND (A. TIPOCAMPO2 = 4)'
      '    GROUP BY'
      
        '          F.IDFORMULA, F.DESCRICAOFORMULA, F.EXPRESSAOREAL, F.CO' +
        'DGRUPOFORMULA,'
      '          F.EXPRESSAOFORMULA) F'
      'WHERE'
      #9'GRP.CODGRUPOFORMULA = F.CODGRUPOFORMULA'
      'GROUP BY'
      #9'GRP.CODGRUPOFORMULA, GRP.DESCGRUPOFORMULA'
      'ORDER BY'
      '      GRP.CODGRUPOFORMULA')
    ValidateWithMask = True
    Left = 251
    Top = 477
  end
  object tabTipoRegra: TwwTable
    TableName = 'TIPOREGRA'
    TableType = ttParadox
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 665
    Top = 445
  end
  object tabGrpFormula: TwwTable
    TableName = 'GRPFORMULA'
    TableType = ttParadox
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 699
    Top = 445
  end
  object bm7: TBatchMove
    Destination = tabGrpFormula
    Mode = batCopy
    Source = QryGrpFormula
    Left = 699
    Top = 477
  end
  object bm4: TBatchMove
    Destination = TabGrpArquivo
    Mode = batCopy
    Source = QryGrpArquivo
    Left = 601
    Top = 477
  end
  object TabGrpArquivo: TwwTable
    TableName = 'GRPARQUIVO'
    TableType = ttParadox
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 601
    Top = 445
  end
  object QryGrpArquivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      G.CODGRUPOARQUIVO, G.DESCGRUPOARQUIVO, G.SETORGRUPOS'
      'FROM'
      '    GRPARQUIVO G,'
      '               (SELECT'
      '                      G.CODGRUPOARQUIVO, G.IDCAMPO'
      '               FROM'
      #9'           CMPBDGRP G, (SELECT'
      
        '      '#9#9#9'              IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAO' +
        'DOCAMPO,'
      '      '#9#9#9'              CAMPODOBANCO, CHAVE, FLGOBRIGATORIO,'
      '      '#9#9#9'              APELIDO, IDTIPODADO'
      '                                FROM'
      '    '#9#9#9#9'    CMPBD) C'
      '                                WHERE'
      #9'                             C.IDCAMPO = G.IDCAMPO) GRP'
      'WHERE'
      '     GRP.CODGRUPOARQUIVO = G.CODGRUPOARQUIVO'
      'GROUP BY'
      '      G.CODGRUPOARQUIVO, G.DESCGRUPOARQUIVO, G.SETORGRUPOS'
      'ORDER BY'
      '      CODGRUPOARQUIVO')
    ValidateWithMask = True
    Left = 345
    Top = 477
  end
  object QryForm: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '      R.IDREGRA, R.NOMEREGRA, R.IDTIPOREGRA, R.DESCRICAOREGRA, R' +
        '.PUBLICADA,'
      '      R.IDREGRA AS OLDIDREGRA'
      'FROM'
      '    REGRA R, ALGREGRA A,'
      '    (SELECT'
      
        '           DISTINCT F.IDFORMULA, F.DESCRICAOFORMULA, F.EXPRESSAO' +
        'REAL, A.IDREGRA'
      '    FROM'
      
        '        (SELECT IDREGRA, FORMULA1, TIPOCAMPO2 FROM ALGREGRA WHER' +
        'E TIPOCAMPO2 = 4) A, FORMULA F'
      '    WHERE'
      '         (A.FORMULA1 = F.IDFORMULA) AND (A.IDREGRA = :ID)) F2'
      'WHERE'
      '     (F2.IDFORMULA = A.FORMULA1) AND  (R.IDREGRA = A.IDREGRA)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 307
    Top = 445
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object QryPai: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     DISTINCT A.IDREGRA, R.NOMEREGRA, A.IDREGRA AS OLDIDREGRA'
      'FROM'
      '    ALGREGRA A, REGRA R'
      'WHERE'
      '      (R.IDREGRA = A.IDREGRA) AND (A.TIPOALGORITMO = 14) AND'
      '      (A.IDCAMPO2 = :ID)'
      'ORDER BY'
      #9'A.IDREGRA'
      ''
      ' ')
    ValidateWithMask = True
    Left = 344
    Top = 445
    ParamData = <
      item
        DataType = ftString
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object QryFilha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  R.IDREGRA, R.NOMEREGRA, R.IDTIPOREGRA, R.DESCRICAOREGRA, R.PUB' +
        'LICADA,'
      '  R.IDREGRA AS OLDIDREGRA'
      'FROM'
      '  REGRA R, ALGREGRA A'
      'WHERE'
      '  (A.IDREGRA = :ID)                 AND'
      '  (A.IDCAMPO2 = TO_CHAR(R.IDREGRA)) AND'
      '  (A.TIPOALGORITMO = 14)            AND'
      '  (A.IDCAMPO2 IS NOT NULL)'
      'ORDER BY'
      '      R.NOMEREGRA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 381
    Top = 445
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object QryRegraParadox: TwwQuery
    SQL.Strings = (
      
        'SELECT IDREGRA, NOMEREGRA, IDTIPOREGRA, DESCRICAOREGRA, PUBLICAD' +
        'A, OLDIDREGRA FROM REGRA'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 413
    Top = 444
  end
  object ZipMaster1: TZipMaster
    Verbose = False
    Trace = False
    AddCompLevel = 9
    AddOptions = []
    ExtrOptions = []
    SFXOptions = []
    Unattended = False
    SFXPath = 'ZipSFX.bin'
    SFXOverWriteMode = OvrConfirm
    SFXCaption = 'Self-extracting Archive'
    KeepFreeOnDisk1 = 0
    VersionInfo = '1.52 M'
    Left = 757
    Top = 171
  end
  object QryPlique: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      #9'IDFORMULA, EXPRESSAOREAL, EXPRESSAOFORMULA'
      'FROM'
      #9'FORMULA'
      'WHERE'
      #9'EXPRESSAOREAL LIKE '#39'%'#39#39'%'#39)
    UpdateObject = updPlique
    ValidateWithMask = True
    Left = 189
    Top = 445
  end
  object dsPlique: TwwDataSource
    DataSet = QryPlique
    Left = 218
    Top = 445
  end
  object updPlique: TUpdateSQL
    ModifySQL.Strings = (
      'update FORMULA'
      'set'
      '  IDFORMULA = :IDFORMULA,'
      '  EXPRESSAOREAL = :EXPRESSAOREAL,'
      '  EXPRESSAOFORMULA = :EXPRESSAOFORMULA'
      'where'
      '  IDFORMULA = :OLD_IDFORMULA')
    InsertSQL.Strings = (
      'insert into FORMULA'
      '  (IDFORMULA, EXPRESSAOREAL, EXPRESSAOFORMULA)'
      'values'
      '  (:IDFORMULA, :EXPRESSAOREAL, :EXPRESSAOFORMULA)')
    DeleteSQL.Strings = (
      'delete from FORMULA'
      'where'
      '  IDFORMULA = :OLD_IDFORMULA')
    Left = 269
    Top = 445
  end
  object QryTodas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  R.IDREGRA, R.NOMEREGRA, R.IDTIPOREGRA, R.DESCRICAOREGRA, R.PUB' +
        'LICADA, 0 AS TIPO,'
      '  T.DESCREGRA'
      'FROM'
      '  REGRA R, TIPOREGRA T'
      'WHERE'
      '  R.IDTIPOREGRA = T.IDTIPOREGRA'
      'ORDER BY'
      '  R.IDREGRA')
    ValidateWithMask = True
    Left = 37
    Top = 445
  end
  object bm8: TBatchMove
    Destination = tabTodas
    Mode = batCopy
    Source = QryTodas
    Left = 733
    Top = 477
  end
  object tabTodas: TwwTable
    TableName = 'REGRA.DB'
    TableType = ttParadox
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 733
    Top = 445
  end
  object ds: TSaveDialog
    DefaultExt = '*.exp'
    Filter = 'Arquivos de Exportação de Regra|*.exp'
    Title = 'Arquivo de Exportação de Regras'
    Left = 658
    Top = 171
  end
end
