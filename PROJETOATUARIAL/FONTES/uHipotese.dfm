inherited frmHipotese: TfrmHipotese
  Left = 312
  Top = 184
  Caption = 'Hipótese de Cálculo'
  ClientHeight = 413
  ClientWidth = 639
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 639
    Height = 327
    object Label7: TLabel
      Left = 10
      Top = 8
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label3: TLabel
      Left = 462
      Top = 10
      Width = 98
      Height = 13
      Caption = 'Data de Geração'
    end
    object Label4: TLabel
      Left = 10
      Top = 48
      Width = 35
      Height = 13
      Caption = 'Regra'
    end
    object DBEdit1: TDBEdit
      Left = 10
      Top = 22
      Width = 410
      Height = 21
      AutoSelect = False
      DataField = 'DS_HIPOTESE'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 462
      Top = 24
      Width = 150
      Height = 21
      AutoSelect = False
      Color = clSilver
      DataField = 'DT_GERACAO'
      DataSource = ds
      ReadOnly = True
      TabOrder = 1
    end
    object PgCtrlDetalhe: TPageControl
      Left = 1
      Top = 89
      Width = 637
      Height = 237
      ActivePage = tbshDetalhe
      Align = alBottom
      TabOrder = 2
      object tbshDetalhe: TTabSheet
        Caption = 'Ocorrências'
        object DbGrdDet: TwwDBGrid
          Left = 0
          Top = 34
          Width = 629
          Height = 202
          Selected.Strings = (
            'DS_ITEM_HIPOTESE'#9'36'#9'Item de Hipótese'
            'DS_VERSAO_COMUTACAO'#9'56'#9'Versão da Tábua de Serviço'#9'F'
            'VL_HIPOTESE'#9'10'#9'Valor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsDetalhe
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 2
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
        object PnlDetalhe: TPanel
          Left = 0
          Top = -12
          Width = 629
          Height = 221
          Align = alBottom
          TabOrder = 1
          object Label8: TLabel
            Left = 12
            Top = 53
            Width = 97
            Height = 13
            Caption = 'Item de Hipótese'
          end
          object bbtnOkDet: TBitBtn
            Left = 514
            Top = 61
            Width = 95
            Height = 27
            Caption = '&OK'
            Default = True
            TabOrder = 1
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
            Spacing = 0
          end
          object bbtnCancelarDet: TBitBtn
            Left = 514
            Top = 96
            Width = 95
            Height = 27
            Cancel = True
            Caption = '&Cancelar'
            TabOrder = 2
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
            Spacing = 0
          end
          object DBCmbBxItem: TwwDBLookupCombo
            Left = 12
            Top = 68
            Width = 373
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DS_ITEM_HIPOTESE'#9'50'#9'Item Hipotese')
            LookupTable = qryItem
            LookupField = 'CD_ITEM_HIPOTESE'
            Options = [loColLines, loRowLines]
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnChange = DBCmbBxItemChange
          end
          object plValor: TPanel
            Left = 7
            Top = 96
            Width = 385
            Height = 38
            BevelOuter = bvNone
            TabOrder = 3
            object Label6: TLabel
              Left = 5
              Top = 3
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object dbeVl_Hipotese: TDBEdit
              Left = 5
              Top = 17
              Width = 88
              Height = 21
              AutoSelect = False
              DataField = 'VL_HIPOTESE'
              DataSource = dsDetalhe
              TabOrder = 0
            end
          end
          object plTabua: TPanel
            Left = 7
            Top = 94
            Width = 506
            Height = 122
            BevelOuter = bvNone
            TabOrder = 4
            Visible = False
            object Label5: TLabel
              Left = 5
              Top = 5
              Width = 232
              Height = 13
              Caption = 'Versão da Tábua de Serviço (Masculino)'
            end
            object Label1: TLabel
              Left = 5
              Top = 44
              Width = 225
              Height = 13
              Caption = 'Versão da Tábua de Serviço (Feminino)'
            end
            object Label2: TLabel
              Left = 5
              Top = 84
              Width = 217
              Height = 13
              Caption = 'Versão da Tábua de Serviço (Pensão)'
            end
            object DBCmbBxTabua_Mas: TwwDBLookupCombo
              Left = 5
              Top = 19
              Width = 493
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DS_VERSAO_COMUTACAO'#9'100'#9'Versão da Tabela de Comutação'#9'F')
              LookupTable = qryTabua_Mas
              LookupField = 'SQ_VERSAO_COMUTACAO'
              Options = [loColLines, loRowLines]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object DBCmbBxTabua_Fem: TwwDBLookupCombo
              Left = 5
              Top = 58
              Width = 493
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DS_VERSAO_COMUTACAO'#9'100'#9'Versão da Tabela de Comutação'#9'F')
              LookupTable = qryTabua_Fem
              LookupField = 'SQ_VERSAO_COMUTACAO'
              Options = [loColLines, loRowLines]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object DBCmbBxTabua_Pen: TwwDBLookupCombo
              Left = 5
              Top = 98
              Width = 493
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DS_VERSAO_COMUTACAO'#9'100'#9'Versão da Tabela de Comutação'#9'F')
              LookupTable = qryTabua_Pen
              LookupField = 'SQ_VERSAO_COMUTACAO'
              Options = [loColLines, loRowLines]
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
          end
        end
        object pnlBarraDetalhe: TPanel
          Left = 0
          Top = 0
          Width = 629
          Height = 34
          Align = alTop
          TabOrder = 0
          object BtProc: TSpeedButton
            Left = 86
            Top = 4
            Width = 25
            Height = 25
            Hint = 'Procurar por registro|'
            AllowAllUp = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
              33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
              8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
              F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
              F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
              0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
              B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
              B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
              333333333777733333333333FBFBFB3333333333333333333333}
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Spacing = 0
            OnClick = BtProcClick
          end
          object BtExcl: TSpeedButton
            Left = 61
            Top = 4
            Width = 25
            Height = 25
            Hint = 'Remover o registro selecionado'
            AllowAllUp = True
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
            OnClick = BtExclClick
          end
          object btAlt: TSpeedButton
            Left = 36
            Top = 4
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
            OnClick = btAltClick
          end
          object BtIns: TSpeedButton
            Left = 11
            Top = 4
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
            OnClick = BtInsClick
          end
        end
      end
    end
    object wwDBLookupCombo1: TwwDBLookupCombo
      Left = 10
      Top = 62
      Width = 348
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEREGRA'#9'60'#9'NOMEREGRA'#9'F')
      DataField = 'IDREGRA'
      DataSource = ds
      LookupTable = qryRegra
      LookupField = 'IDREGRA'
      Options = [loColLines, loRowLines]
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnChange = DBCmbBxItemChange
    end
  end
  inherited Dock972: TDock97
    Width = 639
    object Toolbar972: TToolbar97
      Left = 244
      Top = 0
      Caption = 'Toolbar971'
      CloseButton = False
      DefaultDock = Dock971
      DockPos = 244
      TabOrder = 1
      object SBtnGerar: TToolbarButton97
        Left = 8
        Top = 0
        Width = 99
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Gerar Hipótese'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = SBtnGerarClick
      end
      object ToolbarSep972: TToolbarSep97
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 8
      end
    end
  end
  inherited Dock971: TDock97
    Top = 374
    Width = 639
    inherited tb97Fundo: TToolbar97
      Left = 324
      DockPos = 324
      TabOrder = 2
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 155
      DockPos = 155
      TabOrder = 1
    end
    inherited dbnav: TDBNavigator
      Left = 33
      Hints.Strings = ()
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 462
    Top = 96
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    Left = 574
    Top = 96
  end
  inherited ImlPadrao: TImageList
    Left = 462
    Top = 124
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 490
    Top = 124
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 518
    Top = 124
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 490
    Top = 96
  end
  object qryItem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_ITEM_HIPOTESE'
      'order by DS_ITEM_HIPOTESE')
    ValidateWithMask = True
    Left = 398
    Top = 207
    object qryItemDS_ITEM_HIPOTESE: TStringField
      DisplayLabel = 'Item Hipotese'
      DisplayWidth = 50
      FieldName = 'DS_ITEM_HIPOTESE'
      Origin = 'FI_ITEM_HIPOTESE.DS_ITEM_HIPOTESE'
      Size = 50
    end
    object qryItemCD_ITEM_HIPOTESE: TFloatField
      FieldName = 'CD_ITEM_HIPOTESE'
      Origin = 'FI_ITEM_HIPOTESE.CD_ITEM_HIPOTESE'
      Visible = False
    end
    object qryItemCD_TIPO_TABUA: TFloatField
      FieldName = 'CD_TIPO_TABUA'
      Origin = 'FI_ITEM_HIPOTESE.CD_TIPO_TABUA'
      Visible = False
    end
    object qryItemIR_ITEM_HIPOTESE: TStringField
      FieldName = 'IR_ITEM_HIPOTESE'
      Origin = 'FI_ITEM_HIPOTESE.IR_ITEM_HIPOTESE'
      Visible = False
      Size = 1
    end
    object qryItemNO_VARIAVEL: TStringField
      FieldName = 'NO_VARIAVEL'
      Origin = 'FI_ITEM_HIPOTESE.NO_VARIAVEL'
      Visible = False
    end
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = QryPrincipalAfterOpen
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_HIPOTESE'
      'order by DS_HIPOTESE')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 546
    Top = 96
    object QryPrincipalDS_HIPOTESE: TStringField
      DisplayLabel = 'Hipótese de Cálculo'
      DisplayWidth = 50
      FieldName = 'DS_HIPOTESE'
      Origin = 'FI_HIPOTESE.DS_HIPOTESE'
      Size = 50
    end
    object QryPrincipalDT_GERACAO: TDateTimeField
      DisplayLabel = 'Data de Geração'
      DisplayWidth = 10
      FieldName = 'DT_GERACAO'
      Origin = 'FI_HIPOTESE.DT_GERACAO'
    end
    object QryPrincipalCD_HIPOTESE: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_HIPOTESE'
      Origin = 'FI_HIPOTESE.CD_HIPOTESE'
      Visible = False
    end
    object QryPrincipalNR_IDADE_MIN_TB_SERV: TFloatField
      DisplayWidth = 10
      FieldName = 'NR_IDADE_MIN_TB_SERV'
      Origin = 'FI_HIPOTESE.NR_IDADE_MIN_TB_SERV'
      Visible = False
    end
    object QryPrincipalNR_IDADE_MAX_TB_SERV: TFloatField
      DisplayWidth = 10
      FieldName = 'NR_IDADE_MAX_TB_SERV'
      Origin = 'FI_HIPOTESE.NR_IDADE_MAX_TB_SERV'
      Visible = False
    end
    object QryPrincipalIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.FI_HIPOTESE.IDREGRA'
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_HIPOTESE'
      'set'
      '  DS_HIPOTESE = :DS_HIPOTESE,'
      '  DT_GERACAO = :DT_GERACAO,'
      '  NR_IDADE_MIN_TB_SERV = :NR_IDADE_MIN_TB_SERV,'
      '  NR_IDADE_MAX_TB_SERV = :NR_IDADE_MAX_TB_SERV,'
      '  IDREGRA = :IDREGRA'
      'where'
      '  CD_HIPOTESE = :OLD_CD_HIPOTESE')
    InsertSQL.Strings = (
      'insert into FI_HIPOTESE'
      '  (CD_HIPOTESE, DS_HIPOTESE, DT_GERACAO, NR_IDADE_MIN_TB_SERV, '
      '   NR_IDADE_MAX_TB_SERV, IDREGRA)'
      'values'
      
        '  (:CD_HIPOTESE, :DS_HIPOTESE, :DT_GERACAO, :NR_IDADE_MIN_TB_SER' +
        'V, '
      '   :NR_IDADE_MAX_TB_SERV, :IDREGRA)')
    DeleteSQL.Strings = (
      'delete from FI_HIPOTESE'
      'where'
      '  CD_HIPOTESE = :OLD_CD_HIPOTESE')
    Left = 602
    Top = 96
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCRICAOREGRA, IDREGRA, IDTIPOREGRA,'
      '               NOMEREGRA, PUBLICADA'
      'FROM REGRA'
      'ORDER BY NOMEREGRA'
      '')
    ValidateWithMask = True
    Left = 359
    Top = 105
    object qryRegraNOMEREGRA: TStringField
      DisplayWidth = 60
      FieldName = 'NOMEREGRA'
      Origin = 'BASEDADOS.REGRA.NOMEREGRA'
      Size = 60
    end
    object qryRegraDESCRICAOREGRA: TMemoField
      DisplayWidth = 10
      FieldName = 'DESCRICAOREGRA'
      Origin = 'BASEDADOS.REGRA.DESCRICAOREGRA'
      Visible = False
      BlobType = ftMemo
      Size = 1
    end
    object qryRegraIDREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.REGRA.IDREGRA'
      Visible = False
    end
    object qryRegraIDTIPOREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOREGRA'
      Origin = 'BASEDADOS.REGRA.IDTIPOREGRA'
      Visible = False
    end
    object qryRegraPUBLICADA: TFloatField
      DisplayWidth = 10
      FieldName = 'PUBLICADA'
      Origin = 'BASEDADOS.REGRA.PUBLICADA'
      Visible = False
    end
  end
  object qryDetalhe: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetalheBeforePost
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select  a.*, '
      '            b1.DS_VERSAO_COMUTACAO as "DS_VERSAO_COMUTACAO_MAS",'
      '            b2.DS_VERSAO_COMUTACAO as "DS_VERSAO_COMUTACAO_FEM",'
      
        '            b3.DS_VERSAO_COMUTACAO as "DS_VERSAO_COMUTACAO_PEN",' +
        ' c.DS_ITEM_HIPOTESE, '
      '            IR_ITEM_HIPOTESE'
      'from FI_COMPOSICAO_HIPOTESE a, '
      '        FI_TABUA_COMUTACAO b1, '
      '        FI_TABUA_COMUTACAO b2, '
      '        FI_TABUA_COMUTACAO b3, '
      '        FI_ITEM_HIPOTESE c'
      'where a.CD_HIPOTESE = :CD_HIPOTESE'
      '   and a.SQ_VERSAO_COMUTACAO_Mas = b1.SQ_VERSAO_COMUTACAO (+)'
      '   and a.SQ_VERSAO_COMUTACAO_Fem = b2.SQ_VERSAO_COMUTACAO (+)'
      '   and a.SQ_VERSAO_COMUTACAO_Pen = b3.SQ_VERSAO_COMUTACAO (+)'
      '   and a.CD_ITEM_HIPOTESE = c.CD_ITEM_HIPOTESE'
      ' ')
    UpdateObject = UpdtSQLDetalhe
    ValidateWithMask = True
    Left = 546
    Top = 124
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_HIPOTESE'
        ParamType = ptUnknown
      end>
    object qryDetalheDS_ITEM_HIPOTESE: TStringField
      DisplayLabel = 'Item de Hipótese'
      DisplayWidth = 36
      FieldName = 'DS_ITEM_HIPOTESE'
      FixedChar = True
      Size = 50
    end
    object qryDetalheDS_VERSAO_COMUTACAO_MAS: TStringField
      FieldName = 'DS_VERSAO_COMUTACAO_MAS'
      Size = 100
    end
    object qryDetalheDS_VERSAO_COMUTACAO_FEM: TStringField
      FieldName = 'DS_VERSAO_COMUTACAO_FEM'
      Size = 100
    end
    object qryDetalheDS_VERSAO_COMUTACAO_PEN: TStringField
      FieldName = 'DS_VERSAO_COMUTACAO_PEN'
      Size = 100
    end
    object qryDetalheVL_HIPOTESE: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VL_HIPOTESE'
      DisplayFormat = '###,##0.000000'
    end
    object qryDetalheCD_HIPOTESE: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_HIPOTESE'
      Visible = False
    end
    object qryDetalheCD_ITEM_HIPOTESE: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_ITEM_HIPOTESE'
      Visible = False
    end
    object qryDetalheIR_GERA_TAB_SERVICO: TStringField
      DisplayWidth = 1
      FieldName = 'IR_GERA_TAB_SERVICO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetalheSQ_VERSAO_COMUTACAO_MAS: TFloatField
      FieldName = 'SQ_VERSAO_COMUTACAO_MAS'
    end
    object qryDetalheSQ_VERSAO_COMUTACAO_FEM: TFloatField
      FieldName = 'SQ_VERSAO_COMUTACAO_FEM'
    end
    object qryDetalheSQ_VERSAO_COMUTACAO_PEN: TFloatField
      FieldName = 'SQ_VERSAO_COMUTACAO_PEN'
    end
    object qryDetalheIR_ITEM_HIPOTESE: TStringField
      FieldName = 'IR_ITEM_HIPOTESE'
      FixedChar = True
      Size = 1
    end
  end
  object dsDetalhe: TwwDataSource
    AutoEdit = False
    DataSet = qryDetalhe
    Left = 574
    Top = 124
  end
  object UpdtSQLDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_COMPOSICAO_HIPOTESE'
      'set'
      '  CD_HIPOTESE = :CD_HIPOTESE,'
      '  CD_ITEM_HIPOTESE = :CD_ITEM_HIPOTESE,'
      '  VL_HIPOTESE = :VL_HIPOTESE,'
      '  IR_GERA_TAB_SERVICO = :IR_GERA_TAB_SERVICO,'
      '  SQ_VERSAO_COMUTACAO_MAS = :SQ_VERSAO_COMUTACAO_MAS,'
      '  SQ_VERSAO_COMUTACAO_FEM = :SQ_VERSAO_COMUTACAO_FEM,'
      '  SQ_VERSAO_COMUTACAO_PEN = :SQ_VERSAO_COMUTACAO_PEN'
      'where'
      '  CD_HIPOTESE = :OLD_CD_HIPOTESE and'
      '  CD_ITEM_HIPOTESE = :OLD_CD_ITEM_HIPOTESE')
    InsertSQL.Strings = (
      'insert into FI_COMPOSICAO_HIPOTESE'
      
        '  (CD_HIPOTESE, CD_ITEM_HIPOTESE, VL_HIPOTESE, IR_GERA_TAB_SERVI' +
        'CO, '
      '   SQ_VERSAO_COMUTACAO_MAS, SQ_VERSAO_COMUTACAO_FEM, '
      '   SQ_VERSAO_COMUTACAO_PEN)'
      'values'
      
        '  (:CD_HIPOTESE, :CD_ITEM_HIPOTESE, :VL_HIPOTESE, :IR_GERA_TAB_S' +
        'ERVICO, '
      '   :SQ_VERSAO_COMUTACAO_MAS, :SQ_VERSAO_COMUTACAO_FEM,'
      '   :SQ_VERSAO_COMUTACAO_PEN)'
      '')
    DeleteSQL.Strings = (
      'delete from FI_COMPOSICAO_HIPOTESE'
      'where'
      '  CD_HIPOTESE = :OLD_CD_HIPOTESE and'
      '  CD_ITEM_HIPOTESE = :OLD_CD_ITEM_HIPOTESE')
    Left = 602
    Top = 124
  end
  object dsItem: TwwDataSource
    AutoEdit = False
    DataSet = qryItem
    Left = 426
    Top = 207
  end
  object qryTabua_Mas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_TABUA_COMUTACAO'
      'where IR_VERSAO_COMUTACAO in ('#39'N'#39', '#39'A'#39')'
      'order by DS_VERSAO_COMUTACAO')
    ValidateWithMask = True
    Left = 510
    Top = 255
    object qryTabua_MasDS_VERSAO_COMUTACAO: TStringField
      FieldName = 'DS_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.DS_VERSAO_COMUTACAO'
      Size = 100
    end
    object qryTabua_MasSQ_VERSAO_COMUTACAO: TFloatField
      FieldName = 'SQ_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.SQ_VERSAO_COMUTACAO'
    end
    object qryTabua_MasCD_TABUA_ROTATIV: TFloatField
      FieldName = 'CD_TABUA_ROTATIV'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_ROTATIV'
    end
    object qryTabua_MasCD_TABUA_ENTRADA_INVALID: TFloatField
      FieldName = 'CD_TABUA_ENTRADA_INVALID'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_ENTRADA_INVALID'
    end
    object qryTabua_MasCD_TABUA_INVALID: TFloatField
      FieldName = 'CD_TABUA_INVALID'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_INVALID'
    end
    object qryTabua_MasCD_TABUA_MORTAL: TFloatField
      FieldName = 'CD_TABUA_MORTAL'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_MORTAL'
    end
    object qryTabua_MasIR_VERSAO_COMUTACAO: TStringField
      FieldName = 'IR_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.IR_VERSAO_COMUTACAO'
      FixedChar = True
      Size = 1
    end
    object qryTabua_MasDT_GERACAO: TDateTimeField
      FieldName = 'DT_GERACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.DT_GERACAO'
    end
    object qryTabua_MasTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.TRGDTINCLUSAO'
    end
    object qryTabua_MasTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryTabua_MasCD_GRUPO_FORMULA: TFloatField
      FieldName = 'CD_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_GRUPO_FORMULA'
    end
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_HIPOTESE.DS_HIPOTESE'
      'FI_HIPOTESE.DT_GERACAO')
    TipodeDado.Strings = (
      'C'
      'D')
    Descricao.Strings = (
      'Descrição'
      'Data de Geração')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'FI_HIPOTESE')
    CamposChave.Strings = (
      'FI_HIPOTESE.CD_HIPOTESE')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '50'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 518
    Top = 96
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_HIPOTESE) as Max_CD'
      'from FI_HIPOTESE')
    ValidateWithMask = True
    Left = 424
    Top = 65
  end
  object qryTabua_Fem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_TABUA_COMUTACAO'
      'where IR_VERSAO_COMUTACAO in ('#39'N'#39', '#39'A'#39')'
      'order by DS_VERSAO_COMUTACAO'
      '')
    ValidateWithMask = True
    Left = 510
    Top = 295
    object StringField1: TStringField
      DisplayLabel = 'Versão da Tabela de Comutação'
      DisplayWidth = 100
      FieldName = 'DS_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.DS_VERSAO_COMUTACAO'
      Size = 100
    end
    object FloatField1: TFloatField
      FieldName = 'SQ_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.SQ_VERSAO_COMUTACAO'
      Visible = False
    end
    object FloatField2: TFloatField
      FieldName = 'CD_TABUA_ROTATIV'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_ROTATIV'
      Visible = False
    end
    object FloatField3: TFloatField
      FieldName = 'CD_TABUA_ENTRADA_INVALID'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_ENTRADA_INVALID'
      Visible = False
    end
    object FloatField4: TFloatField
      FieldName = 'CD_TABUA_INVALID'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_INVALID'
      Visible = False
    end
    object FloatField5: TFloatField
      FieldName = 'CD_TABUA_MORTAL'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_MORTAL'
      Visible = False
    end
    object StringField2: TStringField
      FieldName = 'IR_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.IR_VERSAO_COMUTACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DT_GERACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.DT_GERACAO'
      Visible = False
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.TRGDTINCLUSAO'
      Visible = False
    end
    object StringField3: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object FloatField6: TFloatField
      FieldName = 'CD_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_GRUPO_FORMULA'
      Visible = False
    end
  end
  object qryTabua_Pen: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_TABUA_COMUTACAO'
      'where IR_VERSAO_COMUTACAO = '#39'P'#39
      'order by DS_VERSAO_COMUTACAO')
    ValidateWithMask = True
    Left = 510
    Top = 335
    object StringField4: TStringField
      DisplayLabel = 'Versão da Tabela de Comutação'
      DisplayWidth = 100
      FieldName = 'DS_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.DS_VERSAO_COMUTACAO'
      Size = 100
    end
    object FloatField7: TFloatField
      FieldName = 'SQ_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.SQ_VERSAO_COMUTACAO'
      Visible = False
    end
    object FloatField8: TFloatField
      FieldName = 'CD_TABUA_ROTATIV'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_ROTATIV'
      Visible = False
    end
    object FloatField9: TFloatField
      FieldName = 'CD_TABUA_ENTRADA_INVALID'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_ENTRADA_INVALID'
      Visible = False
    end
    object FloatField10: TFloatField
      FieldName = 'CD_TABUA_INVALID'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_INVALID'
      Visible = False
    end
    object FloatField11: TFloatField
      FieldName = 'CD_TABUA_MORTAL'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_TABUA_MORTAL'
      Visible = False
    end
    object StringField5: TStringField
      FieldName = 'IR_VERSAO_COMUTACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.IR_VERSAO_COMUTACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DT_GERACAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.DT_GERACAO'
      Visible = False
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.TRGDTINCLUSAO'
      Visible = False
    end
    object StringField6: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object FloatField12: TFloatField
      FieldName = 'CD_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_TABUA_COMUTACAO.CD_GRUPO_FORMULA'
      Visible = False
    end
  end
end
