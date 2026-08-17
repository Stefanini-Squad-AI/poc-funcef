inherited frmRotinaCalculo: TfrmRotinaCalculo
  Left = 165
  Top = 75
  HelpContext = 40303
  Caption = 'Rotinas de Cálculo'
  ClientHeight = 565
  ClientWidth = 717
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 717
    Height = 479
    object Label1: TLabel
      Left = 22
      Top = 8
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = DBEdit1
    end
    object PgCtrlDetalhe: TPageControl
      Left = 1
      Top = 48
      Width = 715
      Height = 430
      ActivePage = tbshDetalhe
      Align = alBottom
      HotTrack = True
      TabOrder = 0
      object tbshDetalhe: TTabSheet
        Caption = 'Seqüencia de Fórmulas'
        object DbGrdDet: TwwDBGrid
          Left = 0
          Top = 34
          Width = 709
          Height = 281
          Selected.Strings = (
            'NR_ORDEM_FORMULA'#9'9'#9'Seqüência'#9'F'
            'NO_VARIAVEL_RESULT'#9'17'#9'Resultado'#9'F'
            'NO_FORMULA'#9'72'#9'Fórmula'#9'F'
            'NR_ORDEM_APRESENTACAO'#9'19'#9'Ordem de Apresentação'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = DsDet
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        object PnlDetalhe: TPanel
          Left = 0
          Top = 34
          Width = 707
          Height = 280
          TabOrder = 3
          object Label4: TLabel
            Left = 24
            Top = 20
            Width = 45
            Height = 13
            Caption = 'Fórmula'
          end
          object Label5: TLabel
            Left = 24
            Top = 64
            Width = 61
            Height = 13
            Caption = 'Seqüência'
          end
          object Label7: TLabel
            Left = 96
            Top = 64
            Width = 130
            Height = 13
            Caption = 'Ordem de Apresntação'
          end
          object bbtnOkDet: TBitBtn
            Left = 344
            Top = 205
            Width = 81
            Height = 27
            Caption = '&OK'
            Default = True
            TabOrder = 3
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
            Left = 428
            Top = 205
            Width = 81
            Height = 27
            Cancel = True
            Caption = '&Cancelar'
            TabOrder = 4
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
          object DBEdit9: TDBEdit
            Left = 24
            Top = 79
            Width = 34
            Height = 21
            DataField = 'NR_ORDEM_FORMULA'
            DataSource = DsDet
            TabOrder = 1
            OnExit = DBEdit9Exit
          end
          object LkcTbFormula: TwwDBLookupCombo
            Left = 24
            Top = 34
            Width = 610
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NO_VARIAVEL_RESULT'#9'20'#9'Resultado'#9'F'
              'NO_FORMULA'#9'40'#9'Fórmula')
            DataField = 'CD_FORMULA'
            DataSource = DsDet
            LookupTable = qryNoFormula
            LookupField = 'CD_FORMULA'
            Options = [loColLines, loRowLines]
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object DBEdit5: TDBEdit
            Left = 96
            Top = 79
            Width = 34
            Height = 21
            DataField = 'NR_ORDEM_APRESENTACAO'
            DataSource = DsDet
            TabOrder = 2
          end
        end
        object PageControl: TPageControl
          Left = 0
          Top = 314
          Width = 707
          Height = 88
          ActivePage = TabSheet3
          Align = alBottom
          HotTrack = True
          TabOrder = 2
          object TabSheet1: TTabSheet
            Caption = 'Expressão'
            object DBMemo2: TDBMemo
              Left = 0
              Top = 0
              Width = 699
              Height = 60
              Align = alClient
              DataField = 'DS_FORMULA'
              DataSource = DsDet
              TabOrder = 0
            end
          end
          object TabSheet2: TTabSheet
            Caption = 'Resultado'
            object Label2: TLabel
              Left = 20
              Top = 6
              Width = 126
              Height = 13
              Caption = 'Variável de Resultado'
            end
            object DBEdit2: TDBEdit
              Left = 20
              Top = 22
              Width = 99
              Height = 21
              DataField = 'NO_VARIAVEL_RESULT'
              DataSource = DsDet
              TabOrder = 0
            end
          end
          object TabSheet3: TTabSheet
            Caption = 'Somatório'
            object Label3: TLabel
              Left = 20
              Top = 6
              Width = 96
              Height = 13
              Caption = 'Variável Inicial 1'
            end
            object Label6: TLabel
              Left = 296
              Top = 6
              Width = 78
              Height = 13
              Caption = 'Variável Final'
            end
            object Label8: TLabel
              Left = 152
              Top = 6
              Width = 96
              Height = 13
              Caption = 'Variável Inicial 2'
            end
            object DBEdit3: TDBEdit
              Left = 20
              Top = 22
              Width = 99
              Height = 21
              DataField = 'NO_VARIAVEL_INICIAL'
              DataSource = DsDet
              TabOrder = 0
            end
            object DBEdit4: TDBEdit
              Left = 296
              Top = 22
              Width = 99
              Height = 21
              DataField = 'NO_VARIAVEL_FINAL'
              DataSource = DsDet
              TabOrder = 2
            end
            object DBEdit6: TDBEdit
              Left = 152
              Top = 22
              Width = 99
              Height = 21
              DataField = 'NO_VARIAVEL_INICIAL2'
              DataSource = DsDet
              TabOrder = 1
            end
          end
        end
        object pnlBarraDetalhe: TPanel
          Left = 0
          Top = 0
          Width = 707
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
            Enabled = False
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
            Enabled = False
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
            Enabled = False
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
      object TbShObservacoes: TTabSheet
        Caption = 'Observações'
        object DBMemo1: TDBMemo
          Left = 12
          Top = 14
          Width = 681
          Height = 377
          DataField = 'DS_OBSERV_FORMULA'
          DataSource = ds
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
    end
    object DBEdit1: TDBEdit
      Left = 22
      Top = 22
      Width = 558
      Height = 21
      AutoSelect = False
      DataField = 'DS_GRUPO_FORMULA'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 717
    object Toolbar972: TToolbar97
      Left = 256
      Top = 0
      Caption = 'Toolbar971'
      CloseButton = False
      DefaultDock = Dock971
      DockPos = 256
      TabOrder = 1
      object SBtnGerar: TToolbarButton97
        Left = 0
        Top = 0
        Width = 89
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Gerar Rotina'
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
      object SBtnDuplicar: TToolbarButton97
        Left = 97
        Top = 0
        Width = 109
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Duplicar Rotina'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
          FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
          00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
          F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
          00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
          F033777777777337F73309999990FFF0033377777777FFF77333099999000000
          3333777777777777333333399033333333333337773333333333333903333333
          3333333773333333333333303333333333333337333333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = SBtnDuplicarClick
      end
      object ToolbarSep973: TToolbarSep97
        Left = 89
        Top = 0
        Blank = True
        SizeHorz = 8
      end
    end
    object Toolbar973: TToolbar97
      Left = 244
      Top = 0
      Caption = 'Toolbar971'
      CloseButton = False
      DefaultDock = Dock971
      DockPos = 244
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 526
    Width = 717
    inherited tb97Fundo: TToolbar97
      Left = 274
      DockPos = 274
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 105
      DockPos = 105
    end
    inherited dbnav: TDBNavigator
      Left = 14
      Hints.Strings = ()
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 434
    Top = 258
    TargetsData = (
      1
      1
      (
        'TDBRichEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    Left = 434
    Top = 286
  end
  inherited ImlPadrao: TImageList
    Left = 406
    Top = 258
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 462
    Top = 230
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 462
    Top = 258
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 406
    Top = 230
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = QryPrincipalAfterOpen
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_GRUPO_FORMULA'
      'order by DS_GRUPO_FORMULA')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 406
    Top = 286
    object QryPrincipalDS_GRUPO_FORMULA: TStringField
      DisplayLabel = 'Rotina de Cálculo'
      DisplayWidth = 50
      FieldName = 'DS_GRUPO_FORMULA'
      Origin = 'FI_GRUPO_FORMULA.DS_GRUPO_FORMULA'
      Size = 80
    end
    object QryPrincipalCD_GRUPO_FORMULA: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_GRUPO_FORMULA'
      Origin = 'FI_GRUPO_FORMULA.CD_GRUPO_FORMULA'
      Visible = False
    end
    object QryPrincipalIR_GRUPO_CALCULO: TStringField
      DisplayWidth = 1
      FieldName = 'IR_GRUPO_CALCULO'
      Origin = 'FI_GRUPO_FORMULA.IR_GRUPO_CALCULO'
      Visible = False
      Size = 1
    end
    object QryPrincipalDS_OBSERV_FORMULA: TMemoField
      FieldName = 'DS_OBSERV_FORMULA'
      Origin = 'BASEDADOS.FI_GRUPO_FORMULA.DS_OBSERV_FORMULA'
      BlobType = ftMemo
      Size = 1400
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_GRUPO_FORMULA'
      'set'
      '  DS_GRUPO_FORMULA = :DS_GRUPO_FORMULA,'
      '  DS_OBSERV_FORMULA = :DS_OBSERV_FORMULA,'
      '  IR_GRUPO_CALCULO = :IR_GRUPO_CALCULO'
      'where'
      '  CD_GRUPO_FORMULA = :OLD_CD_GRUPO_FORMULA')
    InsertSQL.Strings = (
      'insert into FI_GRUPO_FORMULA'
      '  (CD_GRUPO_FORMULA, DS_GRUPO_FORMULA, DS_OBSERV_FORMULA, '
      '   IR_GRUPO_CALCULO)'
      'values'
      '  (:CD_GRUPO_FORMULA, :DS_GRUPO_FORMULA, :DS_OBSERV_FORMULA, '
      '   :IR_GRUPO_CALCULO)')
    DeleteSQL.Strings = (
      'delete from FI_GRUPO_FORMULA'
      'where'
      '  CD_GRUPO_FORMULA = :OLD_CD_GRUPO_FORMULA')
    Left = 462
    Top = 286
  end
  object QryDetalhe: TwwQuery
    CachedUpdates = True
    BeforePost = QryDetalheBeforePost
    AfterScroll = QryDetalheAfterScroll
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select *'
      'from FI_SEQUENCIA_FORMULA a, FI_FORMULA b'
      'where a.CD_GRUPO_FORMULA = :CD_GRUPO_FORMULA '
      '   and a.CD_FORMULA = b.CD_FORMULA'
      'order by NR_ORDEM_FORMULA')
    UpdateObject = UpdtSQLDet
    ValidateWithMask = True
    Left = 490
    Top = 230
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_GRUPO_FORMULA'
        ParamType = ptUnknown
      end>
    object QryDetalheCD_GRUPO_FORMULA: TFloatField
      FieldName = 'CD_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_SEQUENCIA_FORMULA.CD_GRUPO_FORMULA'
    end
    object QryDetalheCD_FORMULA: TFloatField
      FieldName = 'CD_FORMULA'
      Origin = 'BASEDADOS.FI_SEQUENCIA_FORMULA.CD_FORMULA'
    end
    object QryDetalheNR_ORDEM_FORMULA: TFloatField
      FieldName = 'NR_ORDEM_FORMULA'
      Origin = 'BASEDADOS.FI_SEQUENCIA_FORMULA.NR_ORDEM_FORMULA'
    end
    object QryDetalheNR_ORDEM_APRESENTACAO: TFloatField
      FieldName = 'NR_ORDEM_APRESENTACAO'
      Origin = 'BASEDADOS.FI_SEQUENCIA_FORMULA.NR_ORDEM_APRESENTACAO'
    end
    object QryDetalheCD_FORMULA_1: TFloatField
      FieldName = 'CD_FORMULA_1'
      Origin = 'BASEDADOS.FI_SEQUENCIA_FORMULA.NR_ORDEM_APRESENTACAO'
    end
    object QryDetalheNO_FORMULA: TStringField
      FieldName = 'NO_FORMULA'
      Origin = 'BASEDADOS.FI_SEQUENCIA_FORMULA.NR_ORDEM_APRESENTACAO'
      FixedChar = True
      Size = 80
    end
    object QryDetalheDS_FORMULA: TMemoField
      FieldName = 'DS_FORMULA'
      Origin = 'BASEDADOS.FI_SEQUENCIA_FORMULA.NR_ORDEM_APRESENTACAO'
      BlobType = ftMemo
      Size = 2000
    end
    object QryDetalheNO_VARIAVEL_RESULT: TStringField
      FieldName = 'NO_VARIAVEL_RESULT'
      Origin = 'BASEDADOS.FI_SEQUENCIA_FORMULA.NR_ORDEM_APRESENTACAO'
      FixedChar = True
    end
    object QryDetalheNO_VARIAVEL_INICIAL: TStringField
      FieldName = 'NO_VARIAVEL_INICIAL'
      Origin = 'BASEDADOS.FI_SEQUENCIA_FORMULA.NR_ORDEM_APRESENTACAO'
      FixedChar = True
    end
    object QryDetalheNO_VARIAVEL_FINAL: TStringField
      FieldName = 'NO_VARIAVEL_FINAL'
      Origin = 'BASEDADOS.FI_SEQUENCIA_FORMULA.NR_ORDEM_APRESENTACAO'
      FixedChar = True
    end
    object QryDetalheIR_GRUPO_FORMULA: TStringField
      FieldName = 'IR_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_SEQUENCIA_FORMULA.NR_ORDEM_APRESENTACAO'
      FixedChar = True
      Size = 1
    end
    object QryDetalheNO_VARIAVEL_INICIAL2: TStringField
      FieldName = 'NO_VARIAVEL_INICIAL2'
      Origin = 'BASEDADOS.FI_SEQUENCIA_FORMULA.CD_GRUPO_FORMULA'
      FixedChar = True
    end
  end
  object DsDet: TwwDataSource
    AutoEdit = False
    DataSet = QryDetalhe
    Left = 518
    Top = 230
  end
  object UpdtSQLDet: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_SEQUENCIA_FORMULA'
      'set'
      '  CD_GRUPO_FORMULA = :CD_GRUPO_FORMULA,'
      '  CD_FORMULA = :CD_FORMULA,'
      '  NR_ORDEM_FORMULA = :NR_ORDEM_FORMULA,'
      '  NR_ORDEM_APRESENTACAO = :NR_ORDEM_APRESENTACAO'
      'where'
      '  CD_GRUPO_FORMULA = :OLD_CD_GRUPO_FORMULA and'
      '  CD_FORMULA = :OLD_CD_FORMULA and'
      '  NR_ORDEM_FORMULA = :OLD_NR_ORDEM_FORMULA')
    InsertSQL.Strings = (
      'insert into FI_SEQUENCIA_FORMULA'
      
        '  (CD_GRUPO_FORMULA, CD_FORMULA, NR_ORDEM_FORMULA, NR_ORDEM_APRE' +
        'SENTACAO)'
      'values'
      
        '  (:CD_GRUPO_FORMULA, :CD_FORMULA, :NR_ORDEM_FORMULA, :NR_ORDEM_' +
        'APRESENTACAO)')
    DeleteSQL.Strings = (
      'delete from FI_SEQUENCIA_FORMULA'
      'where'
      '  CD_GRUPO_FORMULA = :OLD_CD_GRUPO_FORMULA and'
      '  CD_FORMULA = :OLD_CD_FORMULA and'
      '  NR_ORDEM_FORMULA = :OLD_NR_ORDEM_FORMULA')
    Left = 546
    Top = 230
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_GRUPO_FORMULA) as Max_CD'
      'from FI_GRUPO_FORMULA')
    ValidateWithMask = True
    Left = 490
    Top = 286
    object qryAuxMAX_CD: TFloatField
      FieldName = 'MAX_CD'
      Origin = 'BASEDADOS.FI_GRUPO_FORMULA.CD_GRUPO_FORMULA'
    end
  end
  object qryNoFormula: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select *'
      'from FI_FORMULA'
      'ORDER BY NO_VARIAVEL_RESULT')
    ValidateWithMask = True
    Left = 546
    Top = 258
    object qryNoFormulaNO_VARIAVEL_RESULT: TStringField
      DisplayLabel = 'Resultado'
      DisplayWidth = 20
      FieldName = 'NO_VARIAVEL_RESULT'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_RESULT'
      FixedChar = True
    end
    object qryNoFormulaNO_FORMULA: TStringField
      DisplayLabel = 'Fórmula'
      DisplayWidth = 40
      FieldName = 'NO_FORMULA'
      Origin = '"CM.FI_FORMULA".NO_FORMULA'
      Size = 80
    end
    object qryNoFormulaCD_FORMULA: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_FORMULA'
      Origin = '"CM.FI_FORMULA".CD_FORMULA'
      Visible = False
    end
    object qryNoFormulaDS_FORMULA: TMemoField
      FieldName = 'DS_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.DS_FORMULA'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object qryNoFormulaNO_VARIAVEL_INICIAL: TStringField
      FieldName = 'NO_VARIAVEL_INICIAL'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_INICIAL'
      Visible = False
      FixedChar = True
    end
    object qryNoFormulaNO_VARIAVEL_FINAL: TStringField
      FieldName = 'NO_VARIAVEL_FINAL'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_FINAL'
      Visible = False
      FixedChar = True
    end
    object qryNoFormulaIR_GRUPO_FORMULA: TStringField
      FieldName = 'IR_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.IR_GRUPO_FORMULA'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_GRUPO_FORMULA.DS_GRUPO_FORMULA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'FI_GRUPO_FORMULA')
    CamposChave.Strings = (
      'FI_GRUPO_FORMULA.CD_GRUPO_FORMULA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '80')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 434
    Top = 230
  end
  object QryFormula: TQuery
    DatabaseName = 'BaseDados'
    DataSource = DsDet
    SQL.Strings = (
      'Select * from FI_FORMULA'
      'where CD_FORMULA = :CD_FORMULA')
    Left = 490
    Top = 258
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_FORMULA'
        ParamType = ptUnknown
      end>
    object QryFormulaCD_FORMULA: TFloatField
      FieldName = 'CD_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.CD_FORMULA'
    end
    object QryFormulaNO_FORMULA: TStringField
      FieldName = 'NO_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.NO_FORMULA'
      FixedChar = True
      Size = 80
    end
    object QryFormulaDS_FORMULA: TMemoField
      FieldName = 'DS_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.DS_FORMULA'
      BlobType = ftMemo
      Size = 2000
    end
    object QryFormulaNO_VARIAVEL_RESULT: TStringField
      FieldName = 'NO_VARIAVEL_RESULT'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_RESULT'
      FixedChar = True
    end
    object QryFormulaNO_VARIAVEL_INICIAL: TStringField
      FieldName = 'NO_VARIAVEL_INICIAL'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_INICIAL'
      FixedChar = True
    end
    object QryFormulaNO_VARIAVEL_FINAL: TStringField
      FieldName = 'NO_VARIAVEL_FINAL'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_FINAL'
      FixedChar = True
    end
    object QryFormulaIR_GRUPO_FORMULA: TStringField
      FieldName = 'IR_GRUPO_FORMULA'
      Origin = 'BASEDADOS.FI_FORMULA.IR_GRUPO_FORMULA'
      FixedChar = True
      Size = 1
    end
  end
  object DtSrcFormula: TDataSource
    DataSet = QryFormula
    Left = 518
    Top = 258
  end
  object QryInsRotina: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_GRUPO_FORMULA'
      
        '(CD_GRUPO_FORMULA, DS_GRUPO_FORMULA, DS_OBSERV_FORMULA, IR_GRUPO' +
        '_CALCULO)'
      'VALUES'
      
        '(:CD_GRUPO_FORMULA, :DS_GRUPO_FORMULA, :DS_OBSERV_FORMULA, :IR_G' +
        'RUPO_CALCULO)'
      ' ')
    ValidateWithMask = True
    Left = 518
    Top = 286
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_FORMULA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DS_GRUPO_FORMULA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DS_OBSERV_FORMULA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'IR_GRUPO_CALCULO'
        ParamType = ptUnknown
      end>
  end
  object QryInsSequencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO FI_SEQUENCIA_FORMULA'
      
        '(CD_GRUPO_FORMULA, CD_FORMULA, NR_ORDEM_FORMULA, NR_ORDEM_APRESE' +
        'NTACAO)'
      'VALUES'
      
        '(:CD_GRUPO_FORMULA, :CD_FORMULA, :NR_ORDEM_FORMULA, :NR_ORDEM_AP' +
        'RESENTACAO)')
    ValidateWithMask = True
    Left = 546
    Top = 286
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO_FORMULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_FORMULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ORDEM_FORMULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ORDEM_APRESENTACAO'
        ParamType = ptUnknown
      end>
  end
end
