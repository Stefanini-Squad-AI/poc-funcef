inherited FrmFluxo: TFrmFluxo
  Left = 27
  Top = 105
  Caption = 'Fluxo dos Processos'
  ClientHeight = 390
  ClientWidth = 695
  Color = clSilver
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 695
    Height = 304
    object Splitter2: TSplitter
      Left = 267
      Top = 5
      Width = 8
      Height = 294
      Cursor = crHSplit
    end
    object plnAndxEtp: TPanel
      Left = 5
      Top = 5
      Width = 262
      Height = 294
      Align = alLeft
      Color = clSilver
      TabOrder = 0
      object plnEtapa: TPanel
        Left = 1
        Top = 1
        Width = 260
        Height = 292
        Align = alClient
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 0
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 260
          Height = 27
          Align = alTop
          BevelInner = bvLowered
          BevelOuter = bvNone
          Caption = 'Etapas'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 0
        end
        object grdEtapa: TwwDBGrid
          Left = 0
          Top = 27
          Width = 260
          Height = 265
          Selected.Strings = (
            'NOME'#9'30'#9'Descrição')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsEtapa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
    object plnFluxo: TPanel
      Left = 275
      Top = 5
      Width = 415
      Height = 294
      Align = alClient
      TabOrder = 1
      object plnDet: TPanel
        Left = 1
        Top = 59
        Width = 413
        Height = 234
        Align = alClient
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 3
        object Label2: TLabel
          Left = 16
          Top = 64
          Width = 115
          Height = 13
          Caption = 'Etapa Predecessora'
          Transparent = True
        end
        object Label3: TLabel
          Left = 16
          Top = 16
          Width = 64
          Height = 13
          Caption = 'Andamento'
          Transparent = True
        end
        object bbtnOkDet: TBitBtn
          Left = 332
          Top = 1
          Width = 80
          Height = 27
          Caption = '&OK'
          TabOrder = 2
          OnClick = bbtnOkDetClick
          Glyph.Data = {
            BE060000424DBE06000000000000360400002800000024000000120000000100
            0800000000008802000000000000000000000001000000010000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            03030303030303030303030303030303030303030303FF030303030303030303
            03030303030303040403030303030303030303030303030303F8F8FF03030303
            03030303030303030303040202040303030303030303030303030303F80303F8
            FF030303030303030303030303040202020204030303030303030303030303F8
            03030303F8FF0303030303030303030304020202020202040303030303030303
            0303F8030303030303F8FF030303030303030304020202FA0202020204030303
            0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
            040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
            03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
            FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
            0303030303030303030303FA0202020403030303030303030303030303F8FF03
            03F8FF03030303030303030303030303FA020202040303030303030303030303
            0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
            03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
            030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
            0202040303030303030303030303030303F8FF03F8FF03030303030303030303
            03030303FA0202030303030303030303030303030303F8FFF803030303030303
            030303030303030303FA0303030303030303030303030303030303F803030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303}
          NumGlyphs = 2
        end
        object bbtnCancelarDet: TBitBtn
          Left = 332
          Top = 28
          Width = 80
          Height = 27
          Cancel = True
          Caption = '&Cancelar'
          TabOrder = 3
          OnClick = bbtnCancelarDetClick
          Glyph.Data = {
            BE060000424DBE06000000000000360400002800000024000000120000000100
            0800000000008802000000000000000000000001000000010000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303F8F80303030303030303030303030303030303FF03030303030303030303
            0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
            03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
            030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
            FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
            030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
            F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
            010101F8030303030303030303F8FF030303030303FFF8030303030303030303
            030101010101F80303030303030303030303F8FF0303030303F8030303030303
            0303030303F901010101F8030303030303030303030303F8FF030303F8030303
            0303030303030303F90101010101F8030303030303030303030303F803030303
            F8FF030303030303030303F9010101F8010101F803030303030303030303F803
            03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
            03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
            03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
            0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
            030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
            03030303030303030303030303030303030303030303030303F8F8F803030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303}
          NumGlyphs = 2
        end
        object dblcAndamento: TCMDBLookupCombo
          Left = 16
          Top = 32
          Width = 273
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Descrição')
          DataField = 'IDANDAMENTO'
          DataSource = ds
          LookupTable = qryAndamento
          LookupField = 'IDANDAMENTO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblcEtapa: TCMDBLookupCombo
          Left = 16
          Top = 80
          Width = 273
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Descrição')
          DataField = 'IDETAPAANT'
          DataSource = ds
          LookupTable = qryEtapaAnt
          LookupField = 'IDTIPOETAPA'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object GrdFluxo: TwwDBGrid
        Left = 1
        Top = 59
        Width = 413
        Height = 234
        Selected.Strings = (
          'ANDAMENTO'#9'30'#9'Andamento'
          'ETAPAANTES'#9'30'#9'Etapa Predecessora')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = ds
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 413
        Height = 28
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'Predecessores'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object plnBtn: TPanel
        Left = 1
        Top = 29
        Width = 413
        Height = 30
        Align = alTop
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
        object sbtnInsDet: TSpeedButton
          Left = 3
          Top = 3
          Width = 25
          Height = 25
          Hint = 'Inserir novo registro|'
          AllowAllUp = True
          GroupIndex = 1
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
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 0
          OnClick = sbtnInsDetClick
        end
        object sbtnAltDet: TSpeedButton
          Left = 28
          Top = 3
          Width = 25
          Height = 25
          Hint = 'Alterar o registro selecionado|'
          AllowAllUp = True
          GroupIndex = 1
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
            000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
            00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
            F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
            0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
            FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
            FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
            0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
            00333377737FFFFF773333303300000003333337337777777333}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 0
          OnClick = sbtnAltDetClick
        end
        object sbtnExcluiDet: TSpeedButton
          Left = 53
          Top = 3
          Width = 25
          Height = 25
          Hint = 'Remover o registro selecionado|'
          AllowAllUp = True
          GroupIndex = 1
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
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
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 0
          OnClick = sbtnExcluiDetClick
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 695
    object Label1: TLabel [0]
      Left = 273
      Top = 5
      Width = 100
      Height = 13
      Caption = 'Tipo de Processo'
      Transparent = True
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Caption = '&Incluir'
        Glyph.Data = {00000000}
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Caption = '&Atualizar'
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
      end
    end
    object EdProc: TEdit
      Left = 273
      Top = 20
      Width = 359
      Height = 21
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 351
    Width = 695
    inherited tb97Fundo: TToolbar97
      Left = 494
      DockPos = 494
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 326
      DockPos = 326
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      F.IDTIPOPROCESSO,'
      '      F.IDTIPOETAPA,'
      '      F.IDANDAMENTO,'
      '      F.IDETAPAANT,'
      '      A.NOME AS ETAPAANTES,'
      '      AN.NOME AS ANDAMENTO'
      'FROM'
      '      RADFLUXO F,'
      '     RADANDAMENTO AN,'
      '     RADTIPOETAPA A'
      'WHERE'
      '              (F.IDTIPOPROCESSO = :pIDPROC)'
      '     AND (F.IDETAPAANT = A.IDTIPOETAPA)'
      '     AND (F.IDANDAMENTO = AN.IDANDAMENTO)'
      '          '
      ' ')
    Left = 135
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPROC'
        ParamType = ptUnknown
      end>
    object qryANDAMENTO2: TStringField
      DisplayLabel = 'Andamento'
      DisplayWidth = 30
      FieldName = 'ANDAMENTO'
      Size = 30
    end
    object qryIDTIPOPROCESSO: TFloatField
      FieldName = 'IDTIPOPROCESSO'
      Visible = False
    end
    object qryIDTIPOETAPA: TFloatField
      FieldName = 'IDTIPOETAPA'
      Visible = False
    end
    object qryIDANDAMENTO: TFloatField
      FieldName = 'IDANDAMENTO'
      Visible = False
    end
    object qryIDETAPAANT: TFloatField
      FieldName = 'IDETAPAANT'
      Visible = False
    end
    object qryETAPAANTES: TStringField
      FieldName = 'ETAPAANTES'
      Origin = 'RADTIPOETAPA.NOME'
      Size = 60
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 795
    Top = 65523
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update RADFLUXO'
      'set'
      '  IDTIPOPROCESSO = :IDTIPOPROCESSO,'
      '  IDTIPOETAPA = :IDTIPOETAPA,'
      '  IDANDAMENTO = :IDANDAMENTO,'
      '  IDETAPAANT = :IDETAPAANT'
      'where'
      '  IDTIPOPROCESSO = :OLD_IDTIPOPROCESSO and'
      '  IDTIPOETAPA = :OLD_IDTIPOETAPA and'
      '  IDANDAMENTO = :OLD_IDANDAMENTO and'
      '  IDETAPAANT = :OLD_IDETAPAANT')
    InsertSQL.Strings = (
      'insert into RADFLUXO'
      '  (IDTIPOPROCESSO, IDTIPOETAPA, IDANDAMENTO, IDETAPAANT)'
      'values'
      '  (:IDTIPOPROCESSO, :IDTIPOETAPA, :IDANDAMENTO, :IDETAPAANT)')
    DeleteSQL.Strings = (
      'delete from RADFLUXO'
      'where'
      '  IDTIPOPROCESSO = :OLD_IDTIPOPROCESSO and'
      '  IDTIPOETAPA = :OLD_IDTIPOETAPA and'
      '  IDANDAMENTO = :OLD_IDANDAMENTO and'
      '  IDETAPAANT = :OLD_IDETAPAANT')
    Left = 105
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RADTIPOPROCESSO.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo Processo')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'RADTIPOPROCESSO')
    CamposChave.Strings = (
      'RADTIPOPROCESSO.IDTIPOPROCESSO'
      'RADTIPOPROCESSO.NOME')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
    Left = 397
    Top = 0
  end
  inherited ds: TwwDataSource
    Left = 165
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object qryEtapa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      EXP.IDTIPOPROCESSO,'
      '      EXP.IDTIPOETAPA,'
      '      ETP.NOME'
      'FROM'
      '      RADTIPOETAPAXPROC EXP,'
      '      RADTIPOETAPA ETP'
      'WHERE'
      '      (EXP.IDTIPOPROCESSO = :pIDPROC)'
      '  AND (EXP.IDTIPOETAPA  = ETP.IDTIPOETAPA)'
      'ORDER BY EXP.FLGINICIAL DESC,ETP.NOME')
    ValidateWithMask = True
    Left = 504
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPROC'
        ParamType = ptUnknown
      end>
    object qryEtapaIDTIPOPROCESSO: TFloatField
      FieldName = 'IDTIPOPROCESSO'
      Origin = 'RADTIPOETAPAXPROC.IDTIPOPROCESSO'
      Visible = False
    end
    object qryEtapaIDTIPOETAPA: TFloatField
      FieldName = 'IDTIPOETAPA'
      Origin = 'RADTIPOETAPAXPROC.IDTIPOETAPA'
      Visible = False
    end
    object qryEtapaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'RADTIPOETAPA.NOME'
      Size = 60
    end
  end
  object qryAndamento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '         IDANDAMENTO,'
      '         NOME'
      'FROM'
      '      RADANDAMENTO'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 632
    Top = 25
    object qryAndamentoNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'RADANDAMENTO.NOME'
      Size = 30
    end
    object qryAndamentoIDANDAMENTO: TFloatField
      FieldName = 'IDANDAMENTO'
      Origin = 'RADANDAMENTO.IDANDAMENTO'
      Visible = False
    end
  end
  object dsEtapa: TwwDataSource
    AutoEdit = False
    DataSet = qryEtapa
    OnDataChange = dsEtapaDataChange
    Left = 460
    Top = 9
  end
  object qryEtapaAnt: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      EXP.IDTIPOPROCESSO,'
      '      EXP.IDTIPOETAPA,'
      '      ETP.NOME'
      'FROM'
      '      RADTIPOETAPAXPROC EXP,'
      '      RADTIPOETAPA ETP '
      'WHERE'
      '           (EXP.IDTIPOPROCESSO = :pIDPROC)'
      '  AND (EXP.IDTIPOETAPA  = ETP.IDTIPOETAPA)'
      'ORDER BY ETP.NOME')
    ValidateWithMask = True
    Left = 568
    Top = 17
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPROC'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'IDTIPOPROCESSO'
      Origin = 'RADTIPOETAPAXPROC.IDTIPOPROCESSO'
      Visible = False
    end
    object FloatField2: TFloatField
      FieldName = 'IDTIPOETAPA'
      Origin = 'RADTIPOETAPAXPROC.IDTIPOETAPA'
      Visible = False
    end
    object qryEtapaAntNOME: TStringField
      FieldName = 'NOME'
      Origin = 'RADTIPOETAPA.NOME'
      Size = 60
    end
  end
end
