inherited frmImportaTabGenerica: TfrmImportaTabGenerica
  Left = 306
  Top = 45
  HelpContext = 450003
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Importação de Tabelas Genericas'
  ClientHeight = 433
  ClientWidth = 457
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 457
    Height = 394
    object tbcDetalhe: TTabControlDetalhe
      Left = 5
      Top = 140
      Width = 447
      Height = 249
      Align = alBottom
      TabOrder = 0
      Tabs.Strings = (
        'Campos da Tabela')
      TabIndex = 0
      detdbGrids.Strings = (
        'dbgrdDet')
      object pgctrlDetalhe: TPageControl
        Left = 4
        Top = 55
        Width = 354
        Height = 190
        ActivePage = tbsDet
        Align = alClient
        TabOrder = 1
        object tbsDet: TTabSheet
          Caption = 'Detalhe'
          object dbgrdDet: TwwDBGrid
            Left = 0
            Top = 0
            Width = 346
            Height = 162
            Selected.Strings = (
              'CODCAMPO'#9'15'#9'Código'#9'F'
              'DESCRICAO'#9'49'#9'Descrição'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsCampos
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ReadOnly = True
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
          object pnlControlesDet: TPanel
            Left = 0
            Top = 0
            Width = 346
            Height = 162
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Campos'
            TabOrder = 1
            object Label2: TLabel
              Left = 10
              Top = 19
              Width = 100
              Height = 13
              Caption = 'Código do Campo'
              FocusControl = dedCodCampoCampos
            end
            object Label4: TLabel
              Left = 10
              Top = 101
              Width = 78
              Height = 13
              Caption = 'Tipo de Dado'
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
              Width = 124
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODCAMPO'
              DataSource = dsCampos
              TabOrder = 0
            end
            object dedDescricaoCampos: TDBEdit
              Left = 10
              Top = 75
              Width = 328
              Height = 21
              DataField = 'DESCRICAO'
              DataSource = dsCampos
              TabOrder = 1
            end
            object wwDBLookupCombo1: TwwDBLookupCombo
              Left = 10
              Top = 116
              Width = 215
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMETIPODADO'#9'40'#9'Tipo de Dado'#9'F')
              DataField = 'IDTIPODADO'
              DataSource = dsCampos
              LookupTable = QryTipoDado
              LookupField = 'IDTIPODADO'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
        end
      end
      object Dock973: TDock97
        Left = 4
        Top = 24
        Width = 439
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
        Left = 358
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
        end
      end
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 447
      Height = 135
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Label5: TLabel
        Left = 8
        Top = 10
        Width = 98
        Height = 13
        Caption = 'Nome da Tabela '
      end
      object Label6: TLabel
        Left = 8
        Top = 34
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object BtImportaLinhas: TSpeedButton
        Left = 410
        Top = 4
        Width = 23
        Height = 22
        Hint = 'Importar Linhas'
        Enabled = False
        Glyph.Data = {
          EE000000424DEE000000000000007600000028000000100000000F0000000100
          04000000000078000000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888888888800000000088088880FFFFFFF088008880F00F
          00F000000880FFFFFFF000000080F00F00F000000880FFFFFFF088008884C4C4
          C4C48808888CF4CF4CFC88888884C4C4C44C8888888888888888888888888888
          888888888888888888888888888888888888}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtImportaLinhasClick
      end
      object GrpLinha: TGroupBox
        Left = 7
        Top = 64
        Width = 434
        Height = 65
        Caption = ' Área da Planilha à Importar (Valores Numéricos) '
        TabOrder = 2
        object Label1: TLabel
          Left = 12
          Top = 22
          Width = 69
          Height = 13
          Caption = 'Linha inicial'
        end
        object Label7: TLabel
          Left = 122
          Top = 24
          Width = 63
          Height = 13
          Caption = 'Linha Final'
        end
        object Label8: TLabel
          Left = 233
          Top = 22
          Width = 78
          Height = 13
          Caption = 'Coluna Inicial'
        end
        object Label9: TLabel
          Left = 341
          Top = 23
          Width = 71
          Height = 13
          Caption = 'Coluna Final'
        end
        object Edit1: TEdit
          Left = 12
          Top = 38
          Width = 85
          Height = 21
          TabOrder = 0
          Text = '1'
        end
        object Edit2: TEdit
          Left = 122
          Top = 38
          Width = 85
          Height = 21
          TabOrder = 1
        end
        object Edit3: TEdit
          Left = 231
          Top = 38
          Width = 85
          Height = 21
          TabOrder = 2
          Text = '1'
        end
        object Edit4: TEdit
          Left = 341
          Top = 38
          Width = 85
          Height = 21
          TabOrder = 3
        end
      end
      object dedCodTabela: TwwDBEdit
        Left = 129
        Top = 4
        Width = 277
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CODTABELA'
        DataSource = dsTabela
        MaxLength = 15
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dedCodTabelaExit
      end
      object dedDescricao: TwwDBEdit
        Left = 128
        Top = 28
        Width = 305
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = dsTabela
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dedDescricaoExit
      end
    end
  end
  inherited Dock971: TDock97
    Top = 394
    Width = 457
    inherited tb97Fundo: TToolbar97
      Left = 241
      DockPos = 241
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 73
      DockPos = 73
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 367
    Top = 57
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
      '      CODTABELA, DESCRICAO'
      'FROM'
      '    TABGENER'
      'WHERE'
      '     CODTABELA = :COD')
    UpdateObject = updTabela
    ValidateWithMask = True
    Left = 120
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'COD'
        ParamType = ptUnknown
      end>
  end
  object dsTabela: TwwDataSource
    DataSet = QryTabela
    Left = 312
    Top = 288
  end
  object updTabela: TUpdateSQL
    ModifySQL.Strings = (
      'update TABGENER'
      'set'
      '  CODTABELA = :CODTABELA,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  CODTABELA = :OLD_CODTABELA')
    InsertSQL.Strings = (
      'insert into TABGENER'
      '  (CODTABELA, DESCRICAO)'
      'values'
      '  (:CODTABELA, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from TABGENER'
      'where'
      '  CODTABELA = :OLD_CODTABELA')
    Left = 288
    Top = 288
  end
  object QryValor: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CODTABELA, NUMLINHA, CODCAMPO, VALOR'
      'FROM'
      '    VALTABGENER'
      'WHERE'
      '     CODTABELA = :COD')
    UpdateObject = updValor
    ValidateWithMask = True
    Left = 152
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'COD'
        ParamType = ptUnknown
      end>
    object QryValorCODTABELA: TStringField
      FieldName = 'CODTABELA'
      Origin = 'VALTABGENER.CODTABELA'
      Size = 15
    end
    object QryValorNUMLINHA: TFloatField
      FieldName = 'NUMLINHA'
      Origin = 'VALTABGENER.NUMLINHA'
    end
    object QryValorCODCAMPO: TStringField
      FieldName = 'CODCAMPO'
      Origin = 'VALTABGENER.CODCAMPO'
      Size = 15
    end
    object QryValorVALOR: TStringField
      FieldName = 'VALOR'
      Origin = 'VALTABGENER.VALOR'
      Size = 60
    end
  end
  object dsValor: TwwDataSource
    DataSet = QryValor
    Left = 216
    Top = 288
  end
  object updValor: TUpdateSQL
    ModifySQL.Strings = (
      'update VALTABGENER'
      'set'
      '  CODTABELA = :CODTABELA,'
      '  NUMLINHA = :NUMLINHA,'
      '  CODCAMPO = :CODCAMPO,'
      '  VALOR = :VALOR'
      'where'
      '  CODTABELA = :OLD_CODTABELA')
    InsertSQL.Strings = (
      'insert into VALTABGENER'
      '  (CODTABELA, NUMLINHA, CODCAMPO, VALOR)'
      'values'
      '  (:CODTABELA, :NUMLINHA, :CODCAMPO, :VALOR)')
    DeleteSQL.Strings = (
      'delete from VALTABGENER'
      'where'
      '  CODTABELA = :OLD_CODTABELA')
    Left = 248
    Top = 288
  end
  object QryCampos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  C.CODTABELA, C.CODCAMPO, C.DESCRICAO, C.IDTIPODADO,'
      '  T.DESCRICAO'
      'FROM'
      '  CAMPOTABGENER C, TABGENER T'
      'WHERE'
      '  C.CODTABELA = :VCOD AND'
      '  C.CODTABELA = T.CODTABELA'
      ''
      '')
    UpdateObject = updCampos
    ControlType.Strings = (
      'IDTIPODADO;CustomEdit;dedlIdTipoDadosCampos')
    ValidateWithMask = True
    Left = 40
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'vcod'
        ParamType = ptUnknown
      end>
    object QryCamposCODCAMPO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 15
      FieldName = 'CODCAMPO'
      Origin = 'BASEDADOS.CAMPOTABGENER.CODCAMPO'
      Size = 15
    end
    object QryCamposDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 49
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.CAMPOTABGENER.DESCRICAO'
      Size = 60
    end
    object QryCamposIDTIPODADO: TFloatField
      DisplayLabel = 'Tipo Dado'
      DisplayWidth = 10
      FieldName = 'IDTIPODADO'
      Origin = 'BASEDADOS.CAMPOTABGENER.IDTIPODADO'
      Visible = False
    end
    object QryCamposCODTABELA: TStringField
      DisplayWidth = 15
      FieldName = 'CODTABELA'
      Origin = 'BASEDADOS.CAMPOTABGENER.CODTABELA'
      Visible = False
      Size = 15
    end
    object QryCamposDESCRICAO_1: TStringField
      DisplayWidth = 60
      FieldName = 'DESCRICAO_1'
      Origin = 'BASEDADOS.TABGENER.DESCRICAO'
      Visible = False
      Size = 60
    end
  end
  object dsCampos: TwwDataSource
    DataSet = QryCampos
    Left = 80
    Top = 208
  end
  object updCampos: TUpdateSQL
    ModifySQL.Strings = (
      'update CAMPOTABGENER'
      'set'
      '  CODTABELA = :CODTABELA,'
      '  CODCAMPO = :CODCAMPO,'
      '  DESCRICAO = :DESCRICAO,'
      '  IDTIPODADO = :IDTIPODADO'
      'where'
      '  CODTABELA = :OLD_CODTABELA')
    InsertSQL.Strings = (
      'insert into CAMPOTABGENER'
      '  (CODTABELA, CODCAMPO, DESCRICAO, IDTIPODADO)'
      'values'
      '  (:CODTABELA, :CODCAMPO, :DESCRICAO, :IDTIPODADO)')
    DeleteSQL.Strings = (
      'delete from CAMPOTABGENER'
      'where'
      '  CODTABELA = :OLD_CODTABELA')
    Left = 120
    Top = 208
  end
  object QryTipoDado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDTIPODADO, NOMETIPODADO'
      'FROM'
      '    TIPODADO')
    ValidateWithMask = True
    Left = 184
    Top = 288
    object QryTipoDadoNOMETIPODADO: TStringField
      DisplayLabel = 'Tipo de Dado'
      DisplayWidth = 40
      FieldName = 'NOMETIPODADO'
      Size = 60
    end
    object QryTipoDadoIDTIPODADO: TFloatField
      FieldName = 'IDTIPODADO'
      Visible = False
    end
  end
  object dlg1: TOpenDialog
    DefaultExt = '*.xls'
    Left = 336
    Top = 57
  end
  object QryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 216
    Top = 224
  end
end
