inherited frmImportaTabLonga: TfrmImportaTabLonga
  Left = 218
  Top = 113
  HelpContext = 450004
  BorderStyle = bsSingle
  Caption = 'Importação de Tabelas Longas'
  ClientHeight = 430
  ClientWidth = 455
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 455
    Height = 391
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 445
      Height = 132
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Label5: TLabel
        Left = 8
        Top = 10
        Width = 102
        Height = 13
        Caption = 'Nome da Tabela :'
      end
      object GrpLinha: TGroupBox
        Left = 4
        Top = 55
        Width = 434
        Height = 70
        Caption = 'Área da Planilha à Importar'
        TabOrder = 1
        object Label1: TLabel
          Left = 12
          Top = 24
          Width = 73
          Height = 13
          Caption = 'Linha inicial:'
        end
        object Label7: TLabel
          Left = 122
          Top = 26
          Width = 64
          Height = 13
          Caption = 'Linha final:'
        end
        object Label8: TLabel
          Left = 233
          Top = 24
          Width = 82
          Height = 13
          Caption = 'Coluna Inicial:'
        end
        object Label9: TLabel
          Left = 341
          Top = 25
          Width = 75
          Height = 13
          Caption = 'Coluna Final:'
        end
        object Edit1: TEdit
          Left = 12
          Top = 40
          Width = 85
          Height = 21
          TabOrder = 0
        end
        object Edit2: TEdit
          Left = 122
          Top = 40
          Width = 85
          Height = 21
          TabOrder = 1
        end
        object Edit3: TEdit
          Left = 231
          Top = 40
          Width = 85
          Height = 21
          TabOrder = 2
        end
        object Edit4: TEdit
          Left = 341
          Top = 40
          Width = 85
          Height = 21
          TabOrder = 3
        end
      end
      object edtNome: TEdit
        Left = 114
        Top = 3
        Width = 319
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object btnCriar: TBitBtn
        Left = 272
        Top = 27
        Width = 161
        Height = 23
        Hint = 'Clique aqui para criar a tabela informada'
        Caption = 'Criar Tabela'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnCriarClick
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDD0000000DDDDDDDDDDDDDDDDD0000000D444444444444444D0000000D4FF
          FFFFFFFFFFF4D0000000D4F000F000F000F4D0000000D4FFFFFFFFFFFFF4D000
          0000D4F000F000F000F4D0000000D4FFFFFFFFFFFFF4D0000000D4F000F000F0
          00F4D0000000D4FFFFFFFFFFFFF4D0000000D4F000F000F000F4D0000000D4FF
          FFFFFFFFFFF4D0000000D444444444444444D0000000D4F444F444F444F4D000
          0000D444444444444444D0000000DDDDDDDDDDDDDDDDD0000000DDDDDDDDDDDD
          DDDDD0000000}
      end
    end
    object tbcDetalhe: TTabControlDetalhe
      Left = 5
      Top = 137
      Width = 445
      Height = 249
      Align = alBottom
      TabOrder = 1
      Tabs.Strings = (
        'Campos da Tabela')
      TabIndex = 0
      detdbGrids.Strings = (
        'dbgrdDet')
      object pgctrlDetalhe: TPageControl
        Left = 4
        Top = 55
        Width = 352
        Height = 190
        ActivePage = tbsDet
        Align = alClient
        TabOrder = 1
        object tbsDet: TTabSheet
          Caption = 'Detalhe'
          object pnlControlesDet: TPanel
            Left = 0
            Top = 0
            Width = 344
            Height = 162
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Campos'
            TabOrder = 1
            object Label2: TLabel
              Left = 10
              Top = 19
              Width = 72
              Height = 13
              Caption = 'Identificador'
              FocusControl = dedCodCampoCampos
            end
            object Label3: TLabel
              Left = 10
              Top = 59
              Width = 58
              Height = 13
              Caption = 'Descrição'
              FocusControl = dedDescricaoCampos
            end
            object dedCodCampoCampos: TDBEdit
              Left = 10
              Top = 35
              Width = 71
              Height = 21
              CharCase = ecUpperCase
              DataField = 'IDCAMPO'
              DataSource = DsCampos
              Enabled = False
              TabOrder = 0
            end
            object dedDescricaoCampos: TDBEdit
              Left = 10
              Top = 75
              Width = 328
              Height = 21
              DataField = 'DESCRICAO'
              DataSource = DsCampos
              TabOrder = 1
            end
          end
          object dbgrdDet: TwwDBGrid
            Left = 0
            Top = 0
            Width = 344
            Height = 162
            Selected.Strings = (
              'IDCAMPO'#9'7'#9'Id.'
              'DESCRICAO'#9'50'#9'Descrição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DsCampos
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        end
      end
      object Dock973: TDock97
        Left = 4
        Top = 24
        Width = 437
        Height = 31
        AllowDrag = False
        BoundLines = [blTop, blBottom, blLeft, blRight]
        object tb97BotoesDetalhe: TToolbar97
          Left = 0
          Top = 0
          Caption = 'tb97BotoesDetalhe'
          DockPos = 0
          TabOrder = 0
          object sbtnInsDet: TSpeedButton
            Left = 0
            Top = 0
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
            Left = 25
            Top = 0
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
            Left = 50
            Top = 0
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
      object Dock972: TDock97
        Left = 356
        Top = 55
        Width = 85
        Height = 190
        AllowDrag = False
        BoundLines = [blLeft]
        Position = dpRight
        Visible = False
        object Toolbar971: TToolbar97
          Left = 0
          Top = 0
          Caption = 'tb97Detalhe'
          DockPos = 0
          TabOrder = 0
          object BitBtn1: TBitBtn
            Left = 0
            Top = 0
            Width = 80
            Height = 27
            Caption = '&OK'
            TabOrder = 0
            OnClick = BitBtn1Click
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
          object BitBtn2: TBitBtn
            Left = 0
            Top = 27
            Width = 80
            Height = 27
            Cancel = True
            Caption = '&Cancelar'
            TabOrder = 1
            OnClick = BitBtn2Click
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
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 391
    Width = 455
    inherited tb97Fundo: TToolbar97
      Left = 282
      DockPos = 282
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 114
      DockPos = 114
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object QryTabela: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDTABELA, DESCRICAO'
      'FROM'
      '    LONGTABGENER'
      'WHERE'
      '     DESCRICAO = :DESCR')
    UpdateObject = updTabela
    ValidateWithMask = True
    Left = 488
    Top = 32
    ParamData = <
      item
        DataType = ftString
        Name = 'DESCR'
        ParamType = ptUnknown
      end>
    object QryTabelaIDTABELA: TFloatField
      FieldName = 'IDTABELA'
    end
    object QryTabelaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object DsTabela: TwwDataSource
    DataSet = QryTabela
    Left = 520
    Top = 32
  end
  object updTabela: TUpdateSQL
    ModifySQL.Strings = (
      'update LONGTABGENER'
      'set'
      '  IDTABELA = :IDTABELA,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDTABELA = :OLD_IDTABELA')
    InsertSQL.Strings = (
      'insert into LONGTABGENER'
      '  (IDTABELA, DESCRICAO)'
      'values'
      '  (:IDTABELA, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from LONGTABGENER'
      'where'
      '  IDTABELA = :OLD_IDTABELA')
    Left = 504
    Top = 72
  end
  object updCampos: TUpdateSQL
    ModifySQL.Strings = (
      'update LONGCMPTABGENER'
      'set'
      '  IDTABELA = :IDTABELA,'
      '  IDCAMPO = :IDCAMPO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDTABELA = :OLD_IDTABELA')
    InsertSQL.Strings = (
      'insert into LONGCMPTABGENER'
      '  (IDTABELA, IDCAMPO, DESCRICAO)'
      'values'
      '  (:IDTABELA, :IDCAMPO, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from LONGCMPTABGENER'
      'where'
      '  IDTABELA = :OLD_IDTABELA')
    Left = 632
    Top = 72
  end
  object DsCampos: TwwDataSource
    DataSet = QryCampos
    Left = 648
    Top = 32
  end
  object QryCampos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDTABELA, IDCAMPO, DESCRICAO'
      'FROM'
      '    LONGCMPTABGENER'
      'WHERE'
      '     IDTABELA= :ID'
      'ORDER BY'
      '      IDCAMPO')
    UpdateObject = updCampos
    ValidateWithMask = True
    Left = 616
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object QryCamposIDCAMPO: TFloatField
      DisplayLabel = 'Id.'
      DisplayWidth = 7
      FieldName = 'IDCAMPO'
      Origin = 'LONGCMPTABGENER.IDCAMPO'
    end
    object QryCamposDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = 'LONGCMPTABGENER.DESCRICAO'
      Size = 60
    end
    object QryCamposIDTABELA: TFloatField
      FieldName = 'IDTABELA'
      Origin = 'LONGCMPTABGENER.IDTABELA'
      Visible = False
    end
  end
  object QryValor: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDTABELA, NUMLINHA,'
      '      C1, C2, C3, C4, C5, C6, C7, C8, C9, C10,'
      '      C11, C12, C13, C14, C15, C16, C17, C18, C19, C20,'
      '      C21, C22, C23, C24, C25, C26, C27, C28, C29, C30,'
      '      C31, C32, C33, C34, C35, C36, C37, C38, C39, C40,'
      '      C41, C42, C43, C44, C45, C46, C47, C48, C49, C50,'
      '      C51, C52, C53, C54, C55, C56, C57, C58, C59, C60,'
      '      C61, C62, C63, C64, C65, C66, C67, C68, C69, C70,'
      '      C71, C72, C73, C74, C75, C76, C77, C78, C79, C80,'
      '      C81, C82, C83, C84, C85, C86, C87, C88, C89, C90,'
      '      C91, C92, C93, C94, C95, C96, C97, C98, C99, C100 '
      'FROM'
      '    LONGVALTABGENER'
      'WHERE'
      '     IDTABELA = :ID'
      'ORDER BY'
      '      NUMLINHA'
      '')
    UpdateObject = updValor
    ValidateWithMask = True
    Left = 712
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object QryValorIDTABELA: TFloatField
      FieldName = 'IDTABELA'
      Origin = 'LONGVALTABGENER.IDTABELA'
    end
    object QryValorNUMLINHA: TFloatField
      FieldName = 'NUMLINHA'
      Origin = 'LONGVALTABGENER.NUMLINHA'
    end
    object QryValorC1: TStringField
      FieldName = 'C1'
      Origin = 'LONGVALTABGENER.C1'
    end
    object QryValorC2: TStringField
      FieldName = 'C2'
      Origin = 'LONGVALTABGENER.C2'
    end
    object QryValorC3: TStringField
      FieldName = 'C3'
      Origin = 'LONGVALTABGENER.C3'
    end
    object QryValorC4: TStringField
      FieldName = 'C4'
      Origin = 'LONGVALTABGENER.C4'
    end
    object QryValorC5: TStringField
      FieldName = 'C5'
      Origin = 'LONGVALTABGENER.C5'
    end
    object QryValorC6: TStringField
      FieldName = 'C6'
      Origin = 'LONGVALTABGENER.C6'
    end
    object QryValorC7: TStringField
      FieldName = 'C7'
      Origin = 'LONGVALTABGENER.C7'
    end
    object QryValorC8: TStringField
      FieldName = 'C8'
      Origin = 'LONGVALTABGENER.C8'
    end
    object QryValorC9: TStringField
      FieldName = 'C9'
      Origin = 'LONGVALTABGENER.C9'
    end
    object QryValorC10: TStringField
      FieldName = 'C10'
      Origin = 'LONGVALTABGENER.C10'
    end
    object QryValorC11: TStringField
      FieldName = 'C11'
      Origin = 'LONGVALTABGENER.C11'
    end
    object QryValorC12: TStringField
      FieldName = 'C12'
      Origin = 'LONGVALTABGENER.C12'
    end
    object QryValorC13: TStringField
      FieldName = 'C13'
      Origin = 'LONGVALTABGENER.C13'
    end
    object QryValorC14: TStringField
      FieldName = 'C14'
      Origin = 'LONGVALTABGENER.C14'
    end
    object QryValorC15: TStringField
      FieldName = 'C15'
      Origin = 'LONGVALTABGENER.C15'
    end
    object QryValorC16: TStringField
      FieldName = 'C16'
      Origin = 'LONGVALTABGENER.C16'
    end
    object QryValorC17: TStringField
      FieldName = 'C17'
      Origin = 'LONGVALTABGENER.C17'
    end
    object QryValorC18: TStringField
      FieldName = 'C18'
      Origin = 'LONGVALTABGENER.C18'
    end
    object QryValorC19: TStringField
      FieldName = 'C19'
      Origin = 'LONGVALTABGENER.C19'
    end
    object QryValorC20: TStringField
      FieldName = 'C20'
      Origin = 'LONGVALTABGENER.C20'
    end
    object QryValorC21: TStringField
      FieldName = 'C21'
      Origin = 'LONGVALTABGENER.C21'
    end
    object QryValorC22: TStringField
      FieldName = 'C22'
      Origin = 'LONGVALTABGENER.C22'
    end
    object QryValorC23: TStringField
      FieldName = 'C23'
      Origin = 'LONGVALTABGENER.C23'
    end
    object QryValorC24: TStringField
      FieldName = 'C24'
      Origin = 'LONGVALTABGENER.C24'
    end
    object QryValorC25: TStringField
      FieldName = 'C25'
      Origin = 'LONGVALTABGENER.C25'
    end
    object QryValorC26: TStringField
      FieldName = 'C26'
      Origin = 'LONGVALTABGENER.C26'
    end
    object QryValorC27: TStringField
      FieldName = 'C27'
      Origin = 'LONGVALTABGENER.C27'
    end
    object QryValorC28: TStringField
      FieldName = 'C28'
      Origin = 'LONGVALTABGENER.C28'
    end
    object QryValorC29: TStringField
      FieldName = 'C29'
      Origin = 'LONGVALTABGENER.C29'
    end
    object QryValorC30: TStringField
      FieldName = 'C30'
      Origin = 'LONGVALTABGENER.C30'
    end
    object QryValorC31: TStringField
      FieldName = 'C31'
      Origin = 'LONGVALTABGENER.C31'
    end
    object QryValorC32: TStringField
      FieldName = 'C32'
      Origin = 'LONGVALTABGENER.C32'
    end
    object QryValorC33: TStringField
      FieldName = 'C33'
      Origin = 'LONGVALTABGENER.C33'
    end
    object QryValorC34: TStringField
      FieldName = 'C34'
      Origin = 'LONGVALTABGENER.C34'
    end
    object QryValorC35: TStringField
      FieldName = 'C35'
      Origin = 'LONGVALTABGENER.C35'
    end
    object QryValorC36: TStringField
      FieldName = 'C36'
      Origin = 'LONGVALTABGENER.C36'
    end
    object QryValorC37: TStringField
      FieldName = 'C37'
      Origin = 'LONGVALTABGENER.C37'
    end
    object QryValorC38: TStringField
      FieldName = 'C38'
      Origin = 'LONGVALTABGENER.C38'
    end
    object QryValorC39: TStringField
      FieldName = 'C39'
      Origin = 'LONGVALTABGENER.C39'
    end
    object QryValorC40: TStringField
      FieldName = 'C40'
      Origin = 'LONGVALTABGENER.C40'
    end
    object QryValorC41: TStringField
      FieldName = 'C41'
      Origin = 'LONGVALTABGENER.C41'
    end
    object QryValorC42: TStringField
      FieldName = 'C42'
      Origin = 'LONGVALTABGENER.C42'
    end
    object QryValorC43: TStringField
      FieldName = 'C43'
      Origin = 'LONGVALTABGENER.C43'
    end
    object QryValorC44: TStringField
      FieldName = 'C44'
      Origin = 'LONGVALTABGENER.C44'
    end
    object QryValorC45: TStringField
      FieldName = 'C45'
      Origin = 'LONGVALTABGENER.C45'
    end
    object QryValorC46: TStringField
      FieldName = 'C46'
      Origin = 'LONGVALTABGENER.C46'
    end
    object QryValorC47: TStringField
      FieldName = 'C47'
      Origin = 'LONGVALTABGENER.C47'
    end
    object QryValorC48: TStringField
      FieldName = 'C48'
      Origin = 'LONGVALTABGENER.C48'
    end
    object QryValorC49: TStringField
      FieldName = 'C49'
      Origin = 'LONGVALTABGENER.C49'
    end
    object QryValorC50: TStringField
      FieldName = 'C50'
      Origin = 'LONGVALTABGENER.C50'
    end
    object QryValorC51: TStringField
      FieldName = 'C51'
      Origin = 'LONGVALTABGENER.C51'
    end
    object QryValorC52: TStringField
      FieldName = 'C52'
      Origin = 'LONGVALTABGENER.C52'
    end
    object QryValorC53: TStringField
      FieldName = 'C53'
      Origin = 'LONGVALTABGENER.C53'
    end
    object QryValorC54: TStringField
      FieldName = 'C54'
      Origin = 'LONGVALTABGENER.C54'
    end
    object QryValorC55: TStringField
      FieldName = 'C55'
      Origin = 'LONGVALTABGENER.C55'
    end
    object QryValorC56: TStringField
      FieldName = 'C56'
      Origin = 'LONGVALTABGENER.C56'
    end
    object QryValorC57: TStringField
      FieldName = 'C57'
      Origin = 'LONGVALTABGENER.C57'
    end
    object QryValorC58: TStringField
      FieldName = 'C58'
      Origin = 'LONGVALTABGENER.C58'
    end
    object QryValorC59: TStringField
      FieldName = 'C59'
      Origin = 'LONGVALTABGENER.C59'
    end
    object QryValorC60: TStringField
      FieldName = 'C60'
      Origin = 'LONGVALTABGENER.C60'
    end
    object QryValorC61: TStringField
      FieldName = 'C61'
      Origin = 'LONGVALTABGENER.C61'
    end
    object QryValorC62: TStringField
      FieldName = 'C62'
      Origin = 'LONGVALTABGENER.C62'
    end
    object QryValorC63: TStringField
      FieldName = 'C63'
      Origin = 'LONGVALTABGENER.C63'
    end
    object QryValorC64: TStringField
      FieldName = 'C64'
      Origin = 'LONGVALTABGENER.C64'
    end
    object QryValorC65: TStringField
      FieldName = 'C65'
      Origin = 'LONGVALTABGENER.C65'
    end
    object QryValorC66: TStringField
      FieldName = 'C66'
      Origin = 'LONGVALTABGENER.C66'
    end
    object QryValorC67: TStringField
      FieldName = 'C67'
      Origin = 'LONGVALTABGENER.C67'
    end
    object QryValorC68: TStringField
      FieldName = 'C68'
      Origin = 'LONGVALTABGENER.C68'
    end
    object QryValorC69: TStringField
      FieldName = 'C69'
      Origin = 'LONGVALTABGENER.C69'
    end
    object QryValorC70: TStringField
      FieldName = 'C70'
      Origin = 'LONGVALTABGENER.C70'
    end
    object QryValorC71: TStringField
      FieldName = 'C71'
      Origin = 'LONGVALTABGENER.C71'
    end
    object QryValorC72: TStringField
      FieldName = 'C72'
      Origin = 'LONGVALTABGENER.C72'
    end
    object QryValorC73: TStringField
      FieldName = 'C73'
      Origin = 'LONGVALTABGENER.C73'
    end
    object QryValorC74: TStringField
      FieldName = 'C74'
      Origin = 'LONGVALTABGENER.C74'
    end
    object QryValorC75: TStringField
      FieldName = 'C75'
      Origin = 'LONGVALTABGENER.C75'
    end
    object QryValorC76: TStringField
      FieldName = 'C76'
      Origin = 'LONGVALTABGENER.C76'
    end
    object QryValorC77: TStringField
      FieldName = 'C77'
      Origin = 'LONGVALTABGENER.C77'
    end
    object QryValorC78: TStringField
      FieldName = 'C78'
      Origin = 'LONGVALTABGENER.C78'
    end
    object QryValorC79: TStringField
      FieldName = 'C79'
      Origin = 'LONGVALTABGENER.C79'
    end
    object QryValorC80: TStringField
      FieldName = 'C80'
      Origin = 'LONGVALTABGENER.C80'
    end
    object QryValorC81: TStringField
      FieldName = 'C81'
      Origin = 'LONGVALTABGENER.C81'
    end
    object QryValorC82: TStringField
      FieldName = 'C82'
      Origin = 'LONGVALTABGENER.C82'
    end
    object QryValorC83: TStringField
      FieldName = 'C83'
      Origin = 'LONGVALTABGENER.C83'
    end
    object QryValorC84: TStringField
      FieldName = 'C84'
      Origin = 'LONGVALTABGENER.C84'
    end
    object QryValorC85: TStringField
      FieldName = 'C85'
      Origin = 'LONGVALTABGENER.C85'
    end
    object QryValorC86: TStringField
      FieldName = 'C86'
      Origin = 'LONGVALTABGENER.C86'
    end
    object QryValorC87: TStringField
      FieldName = 'C87'
      Origin = 'LONGVALTABGENER.C87'
    end
    object QryValorC88: TStringField
      FieldName = 'C88'
      Origin = 'LONGVALTABGENER.C88'
    end
    object QryValorC89: TStringField
      FieldName = 'C89'
      Origin = 'LONGVALTABGENER.C89'
    end
    object QryValorC90: TStringField
      FieldName = 'C90'
      Origin = 'LONGVALTABGENER.C90'
    end
    object QryValorC91: TStringField
      FieldName = 'C91'
      Origin = 'LONGVALTABGENER.C91'
    end
    object QryValorC92: TStringField
      FieldName = 'C92'
      Origin = 'LONGVALTABGENER.C92'
    end
    object QryValorC93: TStringField
      FieldName = 'C93'
      Origin = 'LONGVALTABGENER.C93'
    end
    object QryValorC94: TStringField
      FieldName = 'C94'
      Origin = 'LONGVALTABGENER.C94'
    end
    object QryValorC95: TStringField
      FieldName = 'C95'
      Origin = 'LONGVALTABGENER.C95'
    end
    object QryValorC96: TStringField
      FieldName = 'C96'
      Origin = 'LONGVALTABGENER.C96'
    end
    object QryValorC97: TStringField
      FieldName = 'C97'
      Origin = 'LONGVALTABGENER.C97'
    end
    object QryValorC98: TStringField
      FieldName = 'C98'
      Origin = 'LONGVALTABGENER.C98'
    end
    object QryValorC99: TStringField
      FieldName = 'C99'
      Origin = 'LONGVALTABGENER.C99'
    end
    object QryValorC100: TStringField
      FieldName = 'C100'
      Origin = 'LONGVALTABGENER.C100'
    end
  end
  object dsValor: TwwDataSource
    DataSet = QryValor
    Left = 752
    Top = 88
  end
  object updValor: TUpdateSQL
    ModifySQL.Strings = (
      'update LONGVALTABGENER'
      'set'
      '  IDTABELA = :IDTABELA,'
      '  NUMLINHA = :NUMLINHA,'
      '  C1 = :C1,'
      '  C2 = :C2,'
      '  C3 = :C3,'
      '  C4 = :C4,'
      '  C5 = :C5,'
      '  C6 = :C6,'
      '  C7 = :C7,'
      '  C8 = :C8,'
      '  C9 = :C9,'
      '  C10 = :C10,'
      '  C11 = :C11,'
      '  C12 = :C12,'
      '  C13 = :C13,'
      '  C14 = :C14,'
      '  C15 = :C15,'
      '  C16 = :C16,'
      '  C17 = :C17,'
      '  C18 = :C18,'
      '  C19 = :C19,'
      '  C20 = :C20,'
      '  C21 = :C21,'
      '  C22 = :C22,'
      '  C23 = :C23,'
      '  C24 = :C24,'
      '  C25 = :C25,'
      '  C26 = :C26,'
      '  C27 = :C27,'
      '  C28 = :C28,'
      '  C29 = :C29,'
      '  C30 = :C30,'
      '  C31 = :C31,'
      '  C32 = :C32,'
      '  C33 = :C33,'
      '  C34 = :C34,'
      '  C35 = :C35,'
      '  C36 = :C36,'
      '  C37 = :C37,'
      '  C38 = :C38,'
      '  C39 = :C39,'
      '  C40 = :C40,'
      '  C41 = :C41,'
      '  C42 = :C42,'
      '  C43 = :C43,'
      '  C44 = :C44,'
      '  C45 = :C45,'
      '  C46 = :C46,'
      '  C47 = :C47,'
      '  C48 = :C48,'
      '  C49 = :C49,'
      '  C50 = :C50,'
      '  C51 = :C51,'
      '  C52 = :C52,'
      '  C53 = :C53,'
      '  C54 = :C54,'
      '  C55 = :C55,'
      '  C56 = :C56,'
      '  C57 = :C57,'
      '  C58 = :C58,'
      '  C59 = :C59,'
      '  C60 = :C60,'
      '  C61 = :C61,'
      '  C62 = :C62,'
      '  C63 = :C63,'
      '  C64 = :C64,'
      '  C65 = :C65,'
      '  C66 = :C66,'
      '  C67 = :C67,'
      '  C68 = :C68,'
      '  C69 = :C69,'
      '  C70 = :C70,'
      '  C71 = :C71,'
      '  C72 = :C72,'
      '  C73 = :C73,'
      '  C74 = :C74,'
      '  C75 = :C75,'
      '  C76 = :C76,'
      '  C77 = :C77,'
      '  C78 = :C78,'
      '  C79 = :C79,'
      '  C80 = :C80,'
      '  C81 = :C81,'
      '  C82 = :C82,'
      '  C83 = :C83,'
      '  C84 = :C84,'
      '  C85 = :C85,'
      '  C86 = :C86,'
      '  C87 = :C87,'
      '  C88 = :C88,'
      '  C89 = :C89,'
      '  C90 = :C90,'
      '  C91 = :C91,'
      '  C92 = :C92,'
      '  C93 = :C93,'
      '  C94 = :C94,'
      '  C95 = :C95,'
      '  C96 = :C96,'
      '  C97 = :C97,'
      '  C98 = :C98,'
      '  C99 = :C99,'
      '  C100 = :C100'
      'where'
      '  IDTABELA = :OLD_IDTABELA')
    InsertSQL.Strings = (
      'insert into LONGVALTABGENER'
      
        '  (IDTABELA, NUMLINHA, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, ' +
        'C11, C12, '
      
        '   C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C' +
        '25, C26, '
      
        '   C27, C28, C29, C30, C31, C32, C33, C34, C35, C36, C37, C38, C' +
        '39, C40, '
      
        '   C41, C42, C43, C44, C45, C46, C47, C48, C49, C50, C51, C52, C' +
        '53, C54, '
      
        '   C55, C56, C57, C58, C59, C60, C61, C62, C63, C64, C65, C66, C' +
        '67, C68, '
      
        '   C69, C70, C71, C72, C73, C74, C75, C76, C77, C78, C79, C80, C' +
        '81, C82, '
      
        '   C83, C84, C85, C86, C87, C88, C89, C90, C91, C92, C93, C94, C' +
        '95, C96, '
      '   C97, C98, C99, C100)'
      'values'
      
        '  (:IDTABELA, :NUMLINHA, :C1, :C2, :C3, :C4, :C5, :C6, :C7, :C8,' +
        ' :C9, :C10, '
      
        '   :C11, :C12, :C13, :C14, :C15, :C16, :C17, :C18, :C19, :C20, :' +
        'C21, :C22, '
      
        '   :C23, :C24, :C25, :C26, :C27, :C28, :C29, :C30, :C31, :C32, :' +
        'C33, :C34, '
      
        '   :C35, :C36, :C37, :C38, :C39, :C40, :C41, :C42, :C43, :C44, :' +
        'C45, :C46, '
      
        '   :C47, :C48, :C49, :C50, :C51, :C52, :C53, :C54, :C55, :C56, :' +
        'C57, :C58, '
      
        '   :C59, :C60, :C61, :C62, :C63, :C64, :C65, :C66, :C67, :C68, :' +
        'C69, :C70, '
      
        '   :C71, :C72, :C73, :C74, :C75, :C76, :C77, :C78, :C79, :C80, :' +
        'C81, :C82, '
      
        '   :C83, :C84, :C85, :C86, :C87, :C88, :C89, :C90, :C91, :C92, :' +
        'C93, :C94, '
      '   :C95, :C96, :C97, :C98, :C99, :C100)')
    DeleteSQL.Strings = (
      'delete from LONGVALTABGENER'
      'where'
      '  IDTABELA = :OLD_IDTABELA')
    Left = 728
    Top = 136
  end
  object dlg1: TOpenDialog
    Filter = 'Planilhas Excel|*.XLS'
    Left = 248
    Top = 233
  end
end
