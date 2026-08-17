inherited frmAssociacaoGruposCampos: TfrmAssociacaoGruposCampos
  Left = 59
  Top = 49
  BorderStyle = bsSingle
  Caption = 'Associação de Campos a Grupos'
  ClientHeight = 472
  ClientWidth = 672
  Constraints.MinHeight = 499
  Constraints.MinWidth = 680
  Position = poDesigned
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 672
    Height = 433
    BorderWidth = 2
    object Splitter1: TSplitter
      Left = 4
      Top = 207
      Width = 664
      Height = 5
      Cursor = crVSplit
      Align = alTop
      Color = clBlack
      ParentColor = False
    end
    object Panel3: TPanel
      Left = 4
      Top = 212
      Width = 664
      Height = 217
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 0
      object Bevel4: TBevel
        Left = 352
        Top = 57
        Width = 311
        Height = 159
        Anchors = [akTop, akRight, akBottom]
        Style = bsRaised
      end
      object Bevel2: TBevel
        Left = 352
        Top = 6
        Width = 311
        Height = 50
        Anchors = [akTop, akRight]
        Style = bsRaised
      end
      object Bevel1: TBevel
        Left = 1
        Top = 6
        Width = 311
        Height = 50
        Anchors = [akLeft, akTop, akRight]
        Style = bsRaised
      end
      object spbtnInserir: TSpeedButton
        Left = 316
        Top = 99
        Width = 32
        Height = 29
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
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
        OnClick = spbtnInserirClick
      end
      object spbtnExcluir: TSpeedButton
        Left = 316
        Top = 144
        Width = 32
        Height = 29
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
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
        OnClick = spbtnExcluirClick
      end
      object fcLabel1: TfcLabel
        Left = 9
        Top = 17
        Width = 211
        Height = 26
        Caption = 'Campos Selecionados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Shadow.Enabled = True
        TextOptions.Shadow.XOffset = 2
        TextOptions.Shadow.YOffset = 2
        TextOptions.VAlignment = vaTop
      end
      object Bevel3: TBevel
        Left = 1
        Top = 57
        Width = 311
        Height = 159
        Anchors = [akLeft, akTop, akRight, akBottom]
        Style = bsRaised
      end
      object fcLabel2: TfcLabel
        Left = 360
        Top = 17
        Width = 191
        Height = 26
        Anchors = [akTop, akRight]
        Caption = 'Campos Disponíveis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Shadow.Enabled = True
        TextOptions.Shadow.XOffset = 2
        TextOptions.Shadow.YOffset = 2
        TextOptions.VAlignment = vaTop
      end
      object wwDBGrid2: TwwDBGrid
        Left = 6
        Top = 62
        Width = 301
        Height = 149
        Selected.Strings = (
          'DESCR'#9'75'#9'DESCR'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        Ctl3D = True
        DataSource = dsSel
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Options = [dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        UseTFields = False
        IndicatorColor = icBlack
      end
      object bbtnProcurarSel: TBitBtn
        Left = 263
        Top = 11
        Width = 44
        Height = 40
        Anchors = [akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = bbtnProcurarSelClick
        Glyph.Data = {
          76060000424D7606000000000000760000002800000060000000200000000100
          0400000000000006000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          8888888888888888888888888888777777777777777777788888888888888888
          8888888888888888888888888888777777777777777777788888888888887777
          7777777777777778888888888888777777777777777777888888888888887777
          7777777777777778888888888880000000000000000007788888888888F7FFFF
          FFFFFFFFFFFFF78888888888888877777777777777777778888888888880FFFF
          FFFFFFFFFFFF07788888888888F78888888888888888F7888888887888000000
          0000000000007778888888888880FFFFFFFFFFFFFFFF07788888888888F7888F
          FFF88FFFFF88F78888888877880FFFFFFFFFFFFFFFF07778888888888880FF88
          888F888888FF07788888888888F78877777877777788F78888888807780FFFFF
          FFFFFFFFFFF07778888888888880FFFFFFFFFFFFFFFF07788888888888F78888
          FFFFFF88FF88F78888888810770FF88888F888888FF07778888888888880FFF8
          888888F888FF07788888888888F788F7778877F77788F78888888811070FFFFF
          FFFFFFFFFFF07778888880888880FFFFFFFFFFFFFFFF0778888887F888F78888
          88FFF88FFF88F78888888811100FFF8888888F888FF07778888881088880FF88
          F8888F8888FF07788888887F88F78877F77778777788F78888888811110FFFFF
          FFFFFFFFFFF07778888881108880FFFFFFFFFFFFFFFF077888888887F8F7888F
          F88FFF88FF88F7888888880111100F000000F8888FF07778888881110880FF88
          8F8888F888FF0778888888887FF78877787777F77788F78888888880111100BB
          BBBB00FFFFF07778888881111080FFFFFFFFFFFFFFFF07788888888887F78FFF
          FFF888FFFF88F788888888880110BBB0000BBB088FF07778888880111100F000
          0008F88888FF0778888887888877F777777FF7777788F78888888888800BB00F
          88F00BB0FFF077788888880111100BBBBBB00FFFFFFF07788888887888877888
          88877F888F88F7888888888880BB08F8888FF0BB0FF0777888888880110BBB00
          00BBB08F88FF07788888888788788877778887F87788F7888888888880B08F8C
          CCC88F0B0FF077788888888800BB00F8F800BB0FFFFF07788888888877887788
          8F77887F8F88F788888888880BB0F88C88FC8F0BB0F07778888888880BB08F8F
          8F8F0BB088FF0778888888887887888888FF7887F788F788888888880B0F8F8C
          F88CF8F0B0F07778888888880B08FCF8F8C8F0B0FFFF07788888888878788788
          8878F787F888F788888888880B08F88CCCC88F80B0F0777888888880BB0F8C88
          88CF80BB08FF07788888888788788788887887887F88F788888888880B0F8F8C
          88FCF8F0B0F0777888888880B0F88CCCCCC8F80B0FFF07788888888787888777
          777888787F88F788888888880BB0FF8CF88C8F0BB0F0777888888880B08F8C8F
          8FCF8F0B0FFF07788888888787888788887888787F88F7888888888880B08FFC
          CCCF8F0B0FF0777888888880B0F888C8FCF8F80B000007888888888787888878
          878888787F7778888888888880BB08F8F8F8F0BB0FF0778888888880BB0FF8CF
          8C8F80BB0FFF088888888887887FF878878887887F8F788888888888880BB00F
          8F800BB000007888888888880B08FF8CC8F8F0B0FFF08888888888887878FF87
          7888878788F78888888888888800BBB0000BBB00FFF08888888888880BB08F8F
          8F8F0BB0FF0888888888888878878F88888878F78F78888888888888880F00BB
          BBBB000FFF0888888888888880BB00F8F800BB00F08888888888888887887788
          88778F78F788888888888888880FFF000000FF0FF088888888888888880BBB00
          00BBB000088888888888888888788877778877777888888888888888880FFFFF
          FFFFFF0F088888888888888888800BBBBBB00888888888888888888888877888
          8887788888888888888888888800000000000000888888888888888888888000
          0008888888888888888888888888877777788888888888888888888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          8888888888888888888888888888888888888888888888888888}
        NumGlyphs = 3
      end
      object wwDBGrid1: TwwDBGrid
        Left = 357
        Top = 62
        Width = 301
        Height = 149
        Selected.Strings = (
          'DESCR'#9'75'#9'Descrição'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Anchors = [akTop, akRight, akBottom]
        Ctl3D = True
        DataSource = dsDisp
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Options = [dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        UseTFields = False
        IndicatorColor = icBlack
      end
      object bbtnProcurarDisp: TBitBtn
        Left = 614
        Top = 11
        Width = 44
        Height = 40
        Anchors = [akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = bbtnProcurarDispClick
        Glyph.Data = {
          76060000424D7606000000000000760000002800000060000000200000000100
          0400000000000006000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          8888888888888888888888888888777777777777777777788888888888888888
          8888888888888888888888888888777777777777777777788888888888887777
          7777777777777778888888888888777777777777777777888888888888887777
          7777777777777778888888888880000000000000000007788888888888F7FFFF
          FFFFFFFFFFFFF78888888888888877777777777777777778888888888880FFFF
          FFFFFFFFFFFF07788888888888F78888888888888888F7888888887888000000
          0000000000007778888888888880FFFFFFFFFFFFFFFF07788888888888F7888F
          FFF88FFFFF88F78888888877880FFFFFFFFFFFFFFFF07778888888888880FF88
          888F888888FF07788888888888F78877777877777788F78888888807780FFFFF
          FFFFFFFFFFF07778888888888880FFFFFFFFFFFFFFFF07788888888888F78888
          FFFFFF88FF88F78888888810770FF88888F888888FF07778888888888880FFF8
          888888F888FF07788888888888F788F7778877F77788F78888888811070FFFFF
          FFFFFFFFFFF07778888880888880FFFFFFFFFFFFFFFF0778888887F888F78888
          88FFF88FFF88F78888888811100FFF8888888F888FF07778888881088880FF88
          F8888F8888FF07788888887F88F78877F77778777788F78888888811110FFFFF
          FFFFFFFFFFF07778888881108880FFFFFFFFFFFFFFFF077888888887F8F7888F
          F88FFF88FF88F7888888880111100F000000F8888FF07778888881110880FF88
          8F8888F888FF0778888888887FF78877787777F77788F78888888880111100BB
          BBBB00FFFFF07778888881111080FFFFFFFFFFFFFFFF07788888888887F78FFF
          FFF888FFFF88F788888888880110BBB0000BBB088FF07778888880111100F000
          0008F88888FF0778888887888877F777777FF7777788F78888888888800BB00F
          88F00BB0FFF077788888880111100BBBBBB00FFFFFFF07788888887888877888
          88877F888F88F7888888888880BB08F8888FF0BB0FF0777888888880110BBB00
          00BBB08F88FF07788888888788788877778887F87788F7888888888880B08F8C
          CCC88F0B0FF077788888888800BB00F8F800BB0FFFFF07788888888877887788
          8F77887F8F88F788888888880BB0F88C88FC8F0BB0F07778888888880BB08F8F
          8F8F0BB088FF0778888888887887888888FF7887F788F788888888880B0F8F8C
          F88CF8F0B0F07778888888880B08FCF8F8C8F0B0FFFF07788888888878788788
          8878F787F888F788888888880B08F88CCCC88F80B0F0777888888880BB0F8C88
          88CF80BB08FF07788888888788788788887887887F88F788888888880B0F8F8C
          88FCF8F0B0F0777888888880B0F88CCCCCC8F80B0FFF07788888888787888777
          777888787F88F788888888880BB0FF8CF88C8F0BB0F0777888888880B08F8C8F
          8FCF8F0B0FFF07788888888787888788887888787F88F7888888888880B08FFC
          CCCF8F0B0FF0777888888880B0F888C8FCF8F80B000007888888888787888878
          878888787F7778888888888880BB08F8F8F8F0BB0FF0778888888880BB0FF8CF
          8C8F80BB0FFF088888888887887FF878878887887F8F788888888888880BB00F
          8F800BB000007888888888880B08FF8CC8F8F0B0FFF08888888888887878FF87
          7888878788F78888888888888800BBB0000BBB00FFF08888888888880BB08F8F
          8F8F0BB0FF0888888888888878878F88888878F78F78888888888888880F00BB
          BBBB000FFF0888888888888880BB00F8F800BB00F08888888888888887887788
          88778F78F788888888888888880FFF000000FF0FF088888888888888880BBB00
          00BBB000088888888888888888788877778877777888888888888888880FFFFF
          FFFFFF0F088888888888888888800BBBBBB00888888888888888888888877888
          8887788888888888888888888800000000000000888888888888888888888000
          0008888888888888888888888888877777788888888888888888888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          8888888888888888888888888888888888888888888888888888}
        NumGlyphs = 3
      end
    end
    object Panel1: TPanel
      Left = 4
      Top = 4
      Width = 664
      Height = 203
      Align = alTop
      TabOrder = 1
      object Panel2: TPanel
        Left = 5
        Top = 5
        Width = 654
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        Caption = 'Grupo de Arquivos'
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -20
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object wwDBGrid3: TwwDBGrid
        Left = 5
        Top = 34
        Width = 654
        Height = 164
        Selected.Strings = (
          'DESCGRUPOARQUIVO'#9'108'#9'DESCGRUPOARQUIVO'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        Ctl3D = True
        DataSource = ds
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Options = [dgTabs, dgRowSelect, dgAlwaysShowSelection]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        UseTFields = False
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    Top = 433
    Width = 672
    inherited tb97Fundo: TToolbar97
      Left = 506
      DockPos = 514
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 461
    Top = 426
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = Cds
    Left = 55
    Top = 60
  end
  object dsSel: TwwDataSource
    AutoEdit = False
    DataSet = CdsSel
    Left = 101
    Top = 308
  end
  object dsDisp: TwwDataSource
    AutoEdit = False
    DataSet = CdsDisp
    Left = 437
    Top = 293
  end
  object MontaSelectSel: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Campo'
    Colunas.Strings = (
      'CMPBD.IDCAMPO'
      'CMPBD.DESCRICAODOCAMPO'
      'CMPBD.ENTIDADE'
      'CMPBD.NOMEDOCAMPO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Identificador do Campo'
      'Descrição do Campo'
      'Nome da Tabela'
      'Nome do Campo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CMPBD')
    CamposChave.Strings = (
      'CMPBD.IDCAMPO')
    Filtro.Strings = (
      'CMPBD.CAMPODOBANCO > 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '60'
      '30'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 277
    Top = 157
  end
  object MontaSelectDisp: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Campo'
    Colunas.Strings = (
      'CMPBD.IDCAMPO'
      'CMPBD.DESCRICAODOCAMPO'
      'CMPBD.ENTIDADE'
      'CMPBD.NOMEDOCAMPO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Identificador do Campo'
      'Descrição do Campo'
      'Nome da Tabela'
      'Nome do Campo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CMPBD'
      'CMPBDGRP')
    CamposChave.Strings = (
      'CMPBD.IDCAMPO')
    Filtro.Strings = (
      'CMPBD.IDCAMPO = CMPBDGRP.IDCAMPO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '60'
      '30'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 605
    Top = 157
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODGRUPOARQUIVO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'DESCGRUPOARQUIVO'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <
      item
        Name = 'CdsIndex'
        CaseInsFields = 'DESCGRUPOARQUIVO'
        Fields = 'DESCGRUPOARQUIVO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsIndex'
    Params = <>
    StoreDefs = True
    BeforeScroll = CdsBeforeScroll
    AfterScroll = CdsAfterScroll
    Left = 27
    Top = 60
  end
  object CdsSel: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODGRUPOARQUIVO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'IDCAMPO'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'DESCRICAODOCAMPO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DESCR'
        DataType = ftString
        Size = 75
      end>
    IndexDefs = <
      item
        Name = 'CdsSelIndex'
        CaseInsFields = 'IDCAMPO'
        Fields = 'IDCAMPO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsSelIndex'
    Params = <>
    StoreDefs = True
    Left = 67
    Top = 308
  end
  object CdsDisp: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCR'
        DataType = ftString
        Size = 75
      end
      item
        Name = 'IDCAMPO'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'DESCRICAODOCAMPO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TABELA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CAMPO'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'CdsDispIndex'
        CaseInsFields = 'IDCAMPO'
        Fields = 'IDCAMPO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsDispIndex'
    Params = <>
    StoreDefs = True
    Left = 396
    Top = 293
  end
end
