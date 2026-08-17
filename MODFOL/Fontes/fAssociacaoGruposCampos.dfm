inherited frmAssociacaoGruposCampos: TfrmAssociacaoGruposCampos
  Left = -4
  Top = -4
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Associação de Campos a Grupos'
  ClientHeight = 553
  ClientWidth = 800
  Position = poDesigned
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 800
    Height = 514
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 790
      Height = 207
      Align = alTop
      Caption = 'Panel1'
      TabOrder = 0
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 788
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Grupo de Arquivos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object dblkpVariaveis: TDBLookupListBox
        Left = 1
        Top = 26
        Width = 788
        Height = 180
        Align = alClient
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        KeyField = 'CODGRUPOARQUIVO'
        ListField = 'DESCGRUPOARQUIVO'
        ListSource = ds
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 5
      Top = 212
      Width = 790
      Height = 297
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 0
        Top = 0
        Width = 790
        Height = 6
        Cursor = crVSplit
        Align = alTop
      end
      object Panel4: TPanel
        Left = 0
        Top = 6
        Width = 365
        Height = 291
        Align = alLeft
        TabOrder = 0
        object Panel7: TPanel
          Left = 1
          Top = 1
          Width = 363
          Height = 43
          Align = alTop
          Alignment = taLeftJustify
          Caption = '    Campos Selecionados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object BitBtn2: TBitBtn
            Left = 316
            Top = 3
            Width = 44
            Height = 38
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = BitBtn2Click
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
        object wwDBGrid2: TwwDBGrid
          Left = 1
          Top = 44
          Width = 363
          Height = 246
          Selected.Strings = (
            'DESCR'#9'75'#9'DESCR')
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          BorderStyle = bsNone
          Ctl3D = True
          DataSource = dsSel
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Options = [dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          IndicatorColor = icBlack
        end
      end
      object Panel5: TPanel
        Left = 365
        Top = 6
        Width = 48
        Height = 291
        Align = alLeft
        TabOrder = 1
        object Panel9: TPanel
          Left = 1
          Top = 1
          Width = 46
          Height = 43
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
        end
        object Panel10: TPanel
          Left = 1
          Top = 44
          Width = 46
          Height = 169
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object SpeedButton1: TSpeedButton
            Left = 7
            Top = 64
            Width = 32
            Height = 29
            Caption = '>'
            Flat = True
            OnClick = SpeedButton1Click
          end
          object SpeedButton4: TSpeedButton
            Left = 7
            Top = 35
            Width = 32
            Height = 29
            Caption = '<'
            Flat = True
            OnClick = SpeedButton4Click
          end
        end
      end
      object Panel6: TPanel
        Left = 413
        Top = 6
        Width = 377
        Height = 291
        Align = alClient
        TabOrder = 2
        object Panel8: TPanel
          Left = 1
          Top = 1
          Width = 375
          Height = 43
          Align = alTop
          Alignment = taLeftJustify
          Caption = '   Campos Disponíveis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object BitBtn1: TBitBtn
            Left = 326
            Top = 3
            Width = 44
            Height = 38
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = BitBtn1Click
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
        object wwDBGrid1: TwwDBGrid
          Left = 1
          Top = 44
          Width = 375
          Height = 246
          Selected.Strings = (
            'DESCR'#9'75'#9'Descrição')
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          BorderStyle = bsNone
          Ctl3D = True
          DataSource = dsDisp
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Options = [dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 514
    Width = 800
  end
  object Qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      G.CODGRUPOARQUIVO, G.DESCGRUPOARQUIVO'
      'FROM'
      '    GRPARQUIVO G'
      'ORDER BY'
      '      G.DESCGRUPOARQUIVO')
    ValidateWithMask = True
    Left = 96
    Top = 64
  end
  object ds: TwwDataSource
    DataSet = Qry
    OnDataChange = dsDataChange
    Left = 166
    Top = 62
  end
  object QrySel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      G.CODGRUPOARQUIVO, C.IDCAMPO, C.DESCRICAODOCAMPO,'
      '      (C.IDCAMPO||'#39' - '#39'||C.DESCRICAODOCAMPO) DESCR'
      'FROM'
      '    CMPBDGRP G, CMPBD C'
      'WHERE'
      '     (G.IDCAMPO = C.IDCAMPO) AND (G.CODGRUPOARQUIVO = :CODIGO)'
      'ORDER BY'
      '      G.IDCAMPO')
    Params.Data = {0100010006434F4449474F0001020030000000}
    ValidateWithMask = True
    Left = 93
    Top = 117
  end
  object dsSel: TwwDataSource
    DataSet = QrySel
    Left = 165
    Top = 117
  end
  object QryDisp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '      C.IDCAMPO, C.DESCRICAODOCAMPO, C.ENTIDADE TABELA, C.NOMEDO' +
        'CAMPO CAMPO,'
      '      C.IDCAMPO||'#39' - '#39'||C.DESCRICAODOCAMPO DESCR'
      'FROM'
      '    CMPBD C'
      'WHERE'
      '     (C.CAMPODOBANCO > 0) AND'
      
        '     (C.IDCAMPO NOT IN (SELECT C.IDCAMPO FROM CMPBDGRP G, CMPBD ' +
        'C WHERE (G.IDCAMPO = C.IDCAMPO) AND (G.CODGRUPOARQUIVO = :CODIGO' +
        ')))'
      'ORDER BY'
      '      C.IDCAMPO')
    Params.Data = {0100010006434F4449474F0001020030000000}
    ValidateWithMask = True
    Left = 229
    Top = 61
  end
  object dsDisp: TwwDataSource
    DataSet = QryDisp
    Left = 229
    Top = 117
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 413
    Top = 93
  end
  object ms: TMontaSelect
    Caption = 'Seleciona'
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
    Left = 493
    Top = 133
  end
  object ms1: TMontaSelect
    Caption = 'Seleciona'
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
    Left = 141
    Top = 165
  end
end
