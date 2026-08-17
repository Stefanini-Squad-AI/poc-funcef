inherited frmImportaVersao: TfrmImportaVersao
  Left = 359
  Top = 284
  HelpContext = 40148
  Caption = 'Importa dados para uma nova versão'
  ClientHeight = 463
  ClientWidth = 558
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 558
    Height = 424
    object GroupBox2: TGroupBox
      Left = 3
      Top = 69
      Width = 552
      Height = 64
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Dados da Versão de Base Destino'
      TabOrder = 1
      object Label3: TLabel
        Left = 9
        Top = 19
        Width = 189
        Height = 13
        Caption = 'Descrição da versão a ser criada'
      end
      object edDesNovaVersao: TEdit
        Left = 8
        Top = 34
        Width = 536
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnChange = edDesNovaVersaoChange
      end
    end
    object GroupBox3: TGroupBox
      Left = 4
      Top = 138
      Width = 552
      Height = 283
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Criticas da importação '
      TabOrder = 2
      object BtBtnImporta: TBitBtn
        Left = 416
        Top = 247
        Width = 131
        Height = 31
        Hint = 
          'Assistente para construção da condição de enquadramento do parti' +
          'cipante'
        Anchors = [akRight, akBottom]
        Caption = ' importação >>'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = BtBtnImportaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
          1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
          1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
          193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
          11155557F755F777777555000755033305555577755F75F77F55555555503335
          0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
          05555757F75F75557F5505000333555505557F777FF755557F55000000355557
          07557777777F55557F5555000005555707555577777FF5557F55553000075557
          0755557F7777FFF5755555335000005555555577577777555555}
        NumGlyphs = 2
      end
      object pcCriticas: TPageControl
        Left = 3
        Top = 49
        Width = 546
        Height = 193
        ActivePage = tbsDados
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        object tbsDetalhe: TTabSheet
          Caption = 'tbsDetalhe'
          TabVisible = False
          object dbgCriticas: TwwDBGrid
            Left = 0
            Top = 0
            Width = 538
            Height = 183
            Selected.Strings = (
              'DS_ALTERADOR'#9'28'#9'Alterador'
              'IR_CONDICAO'#9'10'#9'Condição'
              'VL_ALTERADOR'#9'10'#9'Alterado para'
              'DS_CARGO'#9'20'#9'Para o cargo')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsCriticas
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        object tbsDados: TTabSheet
          Caption = 'tbsDados'
          ImageIndex = 1
          TabVisible = False
          object plDados: TPanel
            Left = 0
            Top = 0
            Width = 538
            Height = 183
            Align = alClient
            BevelInner = bvSpace
            BevelOuter = bvLowered
            TabOrder = 0
            object bbtnOkDet: TBitBtn
              Left = 454
              Top = 13
              Width = 79
              Height = 27
              Anchors = [akRight, akBottom]
              Caption = '&OK'
              Default = True
              TabOrder = 0
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
              Left = 454
              Top = 48
              Width = 79
              Height = 27
              Anchors = [akRight, akBottom]
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
              Spacing = 0
            end
            object pcTipos: TPageControl
              Left = 5
              Top = 5
              Width = 446
              Height = 172
              ActivePage = tbsTempo
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 2
              object tbsTempo: TTabSheet
                Caption = 'Tempo '
                object Label4: TLabel
                  Left = 150
                  Top = 56
                  Width = 77
                  Height = 13
                  Caption = 'Alterado para'
                end
                object Label5: TLabel
                  Left = 6
                  Top = 58
                  Width = 54
                  Height = 13
                  Caption = 'Condição'
                end
                object Label9: TLabel
                  Left = 6
                  Top = 13
                  Width = 82
                  Height = 13
                  Caption = 'Tipo de tempo'
                end
                object Label15: TLabel
                  Left = 6
                  Top = 103
                  Width = 34
                  Height = 13
                  Caption = 'Cargo'
                end
                object dbeAlteradoTempo: TwwDBEdit
                  Left = 150
                  Top = 72
                  Width = 121
                  Height = 21
                  DataField = 'VL_ALTERADOR'
                  DataSource = dsCriticas
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                  OnExit = dbeAlteradoTempoExit
                  OnKeyPress = dbeAlteradoTempoKeyPress
                end
                object dbcbTipoTempo: TwwDBLookupCombo
                  Left = 6
                  Top = 27
                  Width = 395
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DS_TIPO_TEMPO'#9'60'#9'DS_TIPO_TEMPO'#9'T')
                  DataField = 'DS_ALTERADOR'
                  DataSource = dsCriticas
                  LookupTable = qryListaTempo
                  LookupField = 'DS_TIPO_TEMPO'
                  TabOrder = 0
                  AutoDropDown = False
                  ShowButton = True
                  AllowClearKey = False
                end
                object dbcbCondicaoTempo: TwwDBComboBox
                  Left = 6
                  Top = 72
                  Width = 121
                  Height = 21
                  ShowButton = True
                  Style = csDropDown
                  MapList = False
                  AllowClearKey = False
                  DataField = 'IR_CONDICAO'
                  DataSource = dsCriticas
                  DropDownCount = 8
                  ItemHeight = 0
                  Items.Strings = (
                    'data exata'
                    'adiciona dias'
                    'diminui dias')
                  Sorted = False
                  TabOrder = 2
                  UnboundDataType = wwDefault
                  OnChange = dbcbCondicaoTempoChange
                end
                object dbcbCargoTempo: TwwDBLookupCombo
                  Left = 6
                  Top = 117
                  Width = 395
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DS_TIPO_CAT_PROF_ESP'#9'60'#9'DS_TIPO_CAT_PROF_ESP'#9'T')
                  DataField = 'DS_CARGO'
                  DataSource = dsCriticas
                  LookupTable = qryCargos
                  LookupField = 'DS_TIPO_CAT_PROF_ESP'
                  TabOrder = 3
                  AutoDropDown = False
                  ShowButton = True
                  AllowClearKey = False
                end
              end
              object tbsValores: TTabSheet
                Caption = 'Valores'
                ImageIndex = 1
                object Label10: TLabel
                  Left = 6
                  Top = 13
                  Width = 76
                  Height = 13
                  Caption = 'Tipo de valor'
                end
                object Label11: TLabel
                  Left = 6
                  Top = 58
                  Width = 54
                  Height = 13
                  Caption = 'Condição'
                end
                object Label12: TLabel
                  Left = 78
                  Top = 56
                  Width = 77
                  Height = 13
                  Caption = 'Alterado para'
                end
                object Label13: TLabel
                  Left = 157
                  Top = 76
                  Width = 10
                  Height = 13
                  Caption = '%'
                end
                object Label16: TLabel
                  Left = 6
                  Top = 103
                  Width = 34
                  Height = 13
                  Caption = 'Cargo'
                end
                object dbcbTipoValor: TwwDBLookupCombo
                  Left = 6
                  Top = 27
                  Width = 395
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DS_TIPO_VALOR'#9'60'#9'DS_TIPO_VALOR'#9'T')
                  DataField = 'DS_ALTERADOR'
                  DataSource = dsCriticas
                  LookupTable = qryListaValor
                  LookupField = 'DS_TIPO_VALOR'
                  TabOrder = 0
                  AutoDropDown = False
                  ShowButton = True
                  AllowClearKey = False
                end
                object dbcbCondicaoValor: TwwDBComboBox
                  Left = 6
                  Top = 72
                  Width = 59
                  Height = 21
                  ShowButton = True
                  Style = csDropDown
                  MapList = False
                  AllowClearKey = False
                  DataField = 'IR_CONDICAO'
                  DataSource = dsCriticas
                  DropDownCount = 8
                  ItemHeight = 0
                  Items.Strings = (
                    '+'
                    '-')
                  Sorted = False
                  TabOrder = 1
                  UnboundDataType = wwDefault
                end
                object dbedAlteradoValor: TwwDBEdit
                  Left = 78
                  Top = 72
                  Width = 75
                  Height = 21
                  DataField = 'VL_ALTERADOR'
                  DataSource = dsCriticas
                  TabOrder = 2
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                  OnKeyPress = dbedAlteradoValorKeyPress
                end
                object dbcbCargoValor: TwwDBLookupCombo
                  Left = 6
                  Top = 117
                  Width = 395
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DS_TIPO_CAT_PROF_ESP'#9'60'#9'DS_TIPO_CAT_PROF_ESP'#9'T')
                  DataField = 'DS_CARGO'
                  DataSource = dsCriticas
                  LookupTable = qryCargos
                  LookupField = 'DS_TIPO_CAT_PROF_ESP'
                  TabOrder = 3
                  AutoDropDown = False
                  ShowButton = True
                  AllowClearKey = False
                end
              end
              object tbsPlano: TTabSheet
                Caption = 'Plano'
                ImageIndex = 2
                object Label14: TLabel
                  Left = 6
                  Top = 13
                  Width = 67
                  Height = 13
                  Caption = 'Novo Plano'
                end
                object Label1: TLabel
                  Left = 6
                  Top = 63
                  Width = 34
                  Height = 13
                  Caption = 'Cargo'
                end
                object dbcbPlano: TwwDBLookupCombo
                  Left = 6
                  Top = 27
                  Width = 395
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NO_PLANO'#9'60'#9'NO_PLANO'#9'T')
                  DataField = 'DS_ALTERADOR'
                  DataSource = dsCriticas
                  LookupTable = qryPlano
                  LookupField = 'NO_PLANO'
                  TabOrder = 0
                  AutoDropDown = False
                  ShowButton = True
                  AllowClearKey = False
                end
                object dbcbPlanoValor: TwwDBLookupCombo
                  Left = 6
                  Top = 77
                  Width = 395
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DS_TIPO_CAT_PROF_ESP'#9'60'#9'DS_TIPO_CAT_PROF_ESP'#9'T')
                  DataField = 'DS_CARGO'
                  DataSource = dsCriticas
                  LookupTable = qryCargos
                  LookupField = 'DS_TIPO_CAT_PROF_ESP'
                  TabOrder = 1
                  AutoDropDown = False
                  ShowButton = True
                  AllowClearKey = False
                end
              end
            end
          end
        end
      end
      object pnlBarraDetalhe: TPanel
        Left = 2
        Top = 15
        Width = 548
        Height = 34
        Align = alTop
        TabOrder = 0
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
        object lbInfo: TLabel
          Left = 281
          Top = 13
          Width = 5
          Height = 13
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 3
      Width = 553
      Height = 64
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Dados da Versão de Base Origem'
      TabOrder = 0
      object Label2: TLabel
        Left = 11
        Top = 19
        Width = 40
        Height = 13
        Caption = 'Versão'
      end
      object EdtVersao: TEdit
        Left = 11
        Top = 32
        Width = 530
        Height = 21
        TabStop = False
        Color = clSilver
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 424
    Width = 558
    inherited tb97Fundo: TToolbar97
      Left = 390
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 325
    Top = 430
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object qryParticipante: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 269
    Top = 431
  end
  object qryDependente: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsParticipante
    SQL.Strings = (
      'select *  '
      'from FI_DEPENDENTE'
      'where CD_VERSAO = :CD_VERSAO and'
      '      CD_PARTIC = :CD_PARTIC')
    ValidateWithMask = True
    Left = 149
    Top = 431
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end>
  end
  object dsParticipante: TwwDataSource
    AutoEdit = False
    DataSet = qryParticipante
    Left = 269
    Top = 402
  end
  object qryValorParticipante: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsParticipante
    SQL.Strings = (
      'select * '
      'from FI_VALOR_PARTICIPANTE'
      'where CD_VERSAO = :CD_VERSAO and'
      '           CD_PARTIC = :CD_PARTIC')
    ValidateWithMask = True
    Left = 179
    Top = 431
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end>
  end
  object qryTempoParticipante: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsParticipante
    SQL.Strings = (
      'select * '
      'from FI_TEMPO_PARTICIPANTE'
      'where CD_VERSAO = :CD_VERSAO and'
      '           CD_PARTIC = :CD_PARTIC')
    ValidateWithMask = True
    Left = 209
    Top = 431
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end>
  end
  object qryBeneficiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * '
      'from FI_BENEFICIARIO'
      'where CD_VERSAO = :CD_VERSAO and'
      '           CD_PARTIC = :CD_PARTIC')
    ValidateWithMask = True
    Left = 239
    Top = 431
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end>
  end
  object qryVersao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_VERSAO_BASE '
      
        '( CD_VERSAO,  DS_VERSAO,  DT_GERACAO,  LOGIN,  DT_REFER_BASE,  I' +
        'R_BASE_HISTORICA) '
      'VALUES '
      
        '(:CD_VERSAO, :DS_VERSAO, :DT_GERACAO, :LOGIN, :DT_REFER_BASE, :I' +
        'R_BASE_HISTORICA)')
    ValidateWithMask = True
    Left = 39
    Top = 430
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DS_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_GERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOGIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_REFER_BASE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IR_BASE_HISTORICA'
        ParamType = ptUnknown
      end>
  end
  object qryBaseVersao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_BASE_PLANO_PATRONAL '
      '( CD_VERSAO,  CD_PESSOA_PATROC,  CD_PESSOA_ENTID,  CD_PLANO) '
      'VALUES '
      '(:CD_VERSAO, :CD_PESSOA_PATROC, :CD_PESSOA_ENTID, :CD_PLANO)')
    ValidateWithMask = True
    Left = 71
    Top = 430
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 103
    Top = 430
  end
  object qryNovaVersao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select max(CD_VERSAO)+1 NOVAVERSAO from FI_VERSAO_BASE')
    ValidateWithMask = True
    Left = 7
    Top = 430
  end
  object qryListaValor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * '
      'from FI_TIPO_VALOR')
    ValidateWithMask = True
    Left = 44
    Top = 394
  end
  object qryListaTempo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * '
      'from FI_TIPO_TEMPO')
    ValidateWithMask = True
    Left = 76
    Top = 394
  end
  object dsCriticas: TwwDataSource
    AutoEdit = False
    DataSet = cdsCriticas
    Left = 14
    Top = 365
  end
  object qryCargos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from FI_TIPO_CATEG_PROF_ESPECIAL')
    ValidateWithMask = True
    Left = 108
    Top = 394
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT CD_PLANO, NO_PLANO'
      'FROM FI_PLANO_PATRONAL'
      'ORDER BY NO_PLANO')
    ValidateWithMask = True
    Left = 140
    Top = 395
  end
  object cdsCriticas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 13
    Top = 393
    object cdsCriticasTP_CRITICA: TIntegerField
      DisplayWidth = 10
      FieldName = 'TP_CRITICA'
      Visible = False
    end
    object cdsCriticasID_ALTERADOR: TIntegerField
      DisplayWidth = 10
      FieldName = 'ID_ALTERADOR'
      Visible = False
    end
    object cdsCriticasDS_ALTERADOR: TStringField
      DisplayLabel = 'Alterador'
      DisplayWidth = 28
      FieldName = 'DS_ALTERADOR'
      Size = 60
    end
    object cdsCriticasIR_CONDICAO: TStringField
      FieldName = 'IR_CONDICAO'
      Size = 15
    end
    object cdsCriticasVL_ALTERADOR: TStringField
      DisplayLabel = 'Alterado para'
      DisplayWidth = 10
      FieldName = 'VL_ALTERADOR'
      Size = 10
    end
    object cdsCriticasID_CARGO: TIntegerField
      DisplayWidth = 10
      FieldName = 'ID_CARGO'
      Visible = False
    end
    object cdsCriticasDS_CARGO: TStringField
      DisplayLabel = 'Para o cargo'
      DisplayWidth = 20
      FieldName = 'DS_CARGO'
      Size = 60
    end
  end
end
