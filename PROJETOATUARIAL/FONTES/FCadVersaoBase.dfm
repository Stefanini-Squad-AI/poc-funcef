inherited frmCadVersaoBase: TfrmCadVersaoBase
  Left = 390
  Top = 243
  HelpContext = 40151
  Caption = 'Versão da Base de Dados'
  ClientHeight = 441
  ClientWidth = 559
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 559
    Height = 355
    object Label1: TLabel
      Left = 54
      Top = 19
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = DBEdit1
    end
    object Label9: TLabel
      Left = 54
      Top = 61
      Width = 32
      Height = 13
      Caption = 'Login'
    end
    object Label2: TLabel
      Left = 278
      Top = 61
      Width = 162
      Height = 13
      Caption = 'Data de Referência da Base'
    end
    object PgCtrlDetalhe: TPageControl
      Left = 1
      Top = 162
      Width = 557
      Height = 192
      ActivePage = tbshDetalhe
      Align = alBottom
      HotTrack = True
      TabOrder = 0
      object tbshDetalhe: TTabSheet
        Caption = 'Agrupamento'
        object PnlDetalhe: TPanel
          Left = 0
          Top = -58
          Width = 549
          Height = 222
          Align = alBottom
          TabOrder = 1
          object Label3: TLabel
            Left = 12
            Top = 10
            Width = 118
            Height = 13
            Caption = 'Descrição do Grupo '
          end
          object Label4: TLabel
            Left = 24
            Top = 94
            Width = 51
            Height = 13
            Caption = 'Entidade'
          end
          object Label5: TLabel
            Left = 24
            Top = 134
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
          end
          object Label6: TLabel
            Left = 24
            Top = 175
            Width = 33
            Height = 13
            Caption = 'Plano'
          end
          object bbtnOkDet: TBitBtn
            Left = 406
            Top = 107
            Width = 81
            Height = 27
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
            Left = 406
            Top = 136
            Width = 81
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
            Spacing = 0
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 24
            Top = 108
            Width = 320
            Height = 21
            DataField = 'CD_PESSOA_ENTID'
            DataSource = dsBasePlano
            KeyField = 'CD_PESSOA'
            ListField = 'NO_PESSOA'
            ListSource = dsEntidade
            TabOrder = 2
          end
          object DBLookupComboBox2: TDBLookupComboBox
            Left = 24
            Top = 148
            Width = 320
            Height = 21
            DataField = 'CD_PESSOA_PATROC'
            DataSource = dsBasePlano
            KeyField = 'CD_PESSOA'
            ListField = 'NO_PESSOA'
            ListSource = dsPatrocinadora
            TabOrder = 3
          end
          object DBLookupComboBox3: TDBLookupComboBox
            Left = 24
            Top = 189
            Width = 320
            Height = 21
            DataField = 'CD_PLANO'
            DataSource = dsBasePlano
            KeyField = 'CD_PLANO'
            ListField = 'NO_PLANO'
            ListSource = dsPlano
            TabOrder = 4
          end
        end
        object DbGrdDet: TDBGrid
          Left = 0
          Top = 33
          Width = 541
          Height = 131
          DataSource = dsBasePlano
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'ds_Entidade'
              Title.Caption = 'Entidade'
              Width = 119
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ds_Patrocinadora'
              Title.Caption = 'Patrocinadora'
              Width = 203
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ds_Plano'
              Title.Caption = 'Plano'
              Width = 179
              Visible = True
            end>
        end
        object pnlBarraDetalhe: TPanel
          Left = 0
          Top = 0
          Width = 549
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
    object DBEdit1: TDBEdit
      Left = 54
      Top = 34
      Width = 391
      Height = 21
      AutoSelect = False
      DataField = 'DS_VERSAO'
      DataSource = ds
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 54
      Top = 76
      Width = 147
      Height = 21
      Color = clSilver
      DataField = 'LOGIN'
      DataSource = ds
      ReadOnly = True
      TabOrder = 2
    end
    object DtEdtRefer: TCMDateTimePicker
      Left = 278
      Top = 76
      Width = 113
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DT_REFER_BASE'
      DataSource = ds
      Epoch = 1950
      ButtonGlyph.Data = {
        06050000424D06050000000000003604000028000000100000000D0000000100
        080000000000D000000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
        000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
        A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
        FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
        04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
        000000000000000000FF}
      ShowButton = True
      TabOrder = 3
    end
    object GroupBox1: TGroupBox
      Left = 54
      Top = 109
      Width = 391
      Height = 41
      Caption = 'Situação'
      TabOrder = 4
      object DBChkBxBaseHist: TDBCheckBox
        Left = 27
        Top = 19
        Width = 124
        Height = 17
        Caption = 'Base de Histórico'
        DataField = 'IR_BASE_HISTORICA'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 559
  end
  inherited Dock971: TDock97
    Top = 402
    Width = 559
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    Left = 228
    Top = 104
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_VERSAO) as Max_CD'
      'from FI_VERSAO_BASE')
    ValidateWithMask = True
    Left = 374
    Top = 12
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_VERSAO_BASE.DS_VERSAO'
      'FI_VERSAO_BASE.LOGIN'
      'FI_VERSAO_BASE.DT_REFER_BASE')
    TipodeDado.Strings = (
      'C'
      'C'
      'D')
    Descricao.Strings = (
      'Versão'
      'Login'
      'Data de Referência')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FI_VERSAO_BASE')
    CamposChave.Strings = (
      'FI_VERSAO_BASE.CD_VERSAO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '20'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 192
    Top = 55
  end
  object QryDelDependentes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM FI_DEPENDENTE'
      'WHERE CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 358
    Top = 225
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptInput
      end>
    object StringField2: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 60
      FieldName = 'NO_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.NO_PLANO'
      FixedChar = True
      Size = 60
    end
    object FloatField2: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.CD_PLANO'
      Visible = False
    end
  end
  object QryDelValorPartic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM FI_VALOR_PARTICIPANTE'
      'WHERE CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 386
    Top = 225
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 60
      FieldName = 'NO_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.NO_PLANO'
      FixedChar = True
      Size = 60
    end
    object FloatField1: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.CD_PLANO'
      Visible = False
    end
  end
  object QryDelGrupoPartic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM FI_GRUPO_EXPORT_PARTIC'
      'WHERE CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 442
    Top = 225
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptInput
      end>
    object StringField3: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 60
      FieldName = 'NO_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.NO_PLANO'
      FixedChar = True
      Size = 60
    end
    object FloatField3: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.CD_PLANO'
      Visible = False
    end
  end
  object QryDelTempoPartic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM FI_TEMPO_PARTICIPANTE'
      'WHERE CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 414
    Top = 225
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptInput
      end>
    object StringField4: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 60
      FieldName = 'NO_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.NO_PLANO'
      FixedChar = True
      Size = 60
    end
    object FloatField4: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.CD_PLANO'
      Visible = False
    end
  end
  object QryDelParticipante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM FI_PARTICIPANTE'
      'WHERE CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 330
    Top = 225
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptInput
      end>
    object StringField5: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 60
      FieldName = 'NO_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.NO_PLANO'
      FixedChar = True
      Size = 60
    end
    object FloatField5: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.CD_PLANO'
      Visible = False
    end
  end
  object QryPrincipal: TQuery
    CachedUpdates = True
    AfterInsert = QryPrincipalAfterInsert
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM FI_VERSAO_BASE'
      'ORDER BY DS_VERSAO')
    UpdateObject = UpdateSQL1
    Left = 200
    Top = 103
    object QryPrincipalCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'BASEDADOS.FI_VERSAO_BASE.CD_VERSAO'
    end
    object QryPrincipalDS_VERSAO: TStringField
      FieldName = 'DS_VERSAO'
      Origin = 'BASEDADOS.FI_VERSAO_BASE.DS_VERSAO'
      FixedChar = True
      Size = 60
    end
    object QryPrincipalDT_GERACAO: TDateTimeField
      FieldName = 'DT_GERACAO'
      Origin = 'BASEDADOS.FI_VERSAO_BASE.DT_GERACAO'
    end
    object QryPrincipalLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'BASEDADOS.FI_VERSAO_BASE.LOGIN'
      FixedChar = True
    end
    object QryPrincipalDT_REFER_BASE: TDateTimeField
      FieldName = 'DT_REFER_BASE'
      Origin = 'BASEDADOS.FI_VERSAO_BASE.DT_REFER_BASE'
    end
    object QryPrincipalIR_BASE_HISTORICA: TStringField
      FieldName = 'IR_BASE_HISTORICA'
      Origin = 'BASEDADOS.FI_VERSAO_BASE.IR_BASE_HISTORICA'
      FixedChar = True
      Size = 1
    end
  end
  object UpdateSQL1: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_VERSAO_BASE'
      'set'
      '  DS_VERSAO = :DS_VERSAO,'
      '  DT_GERACAO = :DT_GERACAO,'
      '  LOGIN = :LOGIN,'
      '  DT_REFER_BASE = :DT_REFER_BASE,'
      '  IR_BASE_HISTORICA = :IR_BASE_HISTORICA'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO')
    InsertSQL.Strings = (
      'insert into FI_VERSAO_BASE'
      '  (CD_VERSAO, DS_VERSAO, DT_GERACAO, LOGIN, DT_REFER_BASE, '
      'IR_BASE_HISTORICA)'
      'values'
      '  (:CD_VERSAO, :DS_VERSAO, :DT_GERACAO, :LOGIN, :DT_REFER_BASE, '
      ':IR_BASE_HISTORICA)')
    DeleteSQL.Strings = (
      'delete from FI_VERSAO_BASE'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO')
    Left = 256
    Top = 103
  end
  object QryBasePlano: TQuery
    CachedUpdates = True
    BeforePost = QryBasePlanoBeforePost
    AfterPost = QryBasePlanoAfterPost
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT * FROM FI_BASE_PLANO_PATRONAL'
      'WHERE CD_VERSAO = :CD_VERSAO')
    UpdateObject = UpdateSQL2
    Left = 200
    Top = 131
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object QryBasePlanoCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'BASEDADOS.FI_BASE_PLANO_PATRONAL.CD_VERSAO'
    end
    object QryBasePlanoCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'BASEDADOS.FI_BASE_PLANO_PATRONAL.CD_PESSOA_PATROC'
    end
    object QryBasePlanoCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'BASEDADOS.FI_BASE_PLANO_PATRONAL.CD_PESSOA_ENTID'
    end
    object QryBasePlanoCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_BASE_PLANO_PATRONAL.CD_PLANO'
    end
    object QryBasePlanods_Entidade: TStringField
      FieldKind = fkLookup
      FieldName = 'ds_Entidade'
      LookupDataSet = QryEntidade
      LookupKeyFields = 'CD_PESSOA'
      LookupResultField = 'NO_PESSOA'
      KeyFields = 'CD_PESSOA_ENTID'
      Size = 60
      Lookup = True
    end
    object QryBasePlanods_Patrocinadora: TStringField
      FieldKind = fkLookup
      FieldName = 'ds_Patrocinadora'
      LookupDataSet = QryPatrocinadora
      LookupKeyFields = 'CD_PESSOA'
      LookupResultField = 'NO_PESSOA'
      KeyFields = 'CD_PESSOA_PATROC'
      Size = 60
      Lookup = True
    end
    object QryBasePlanods_Plano: TStringField
      FieldKind = fkLookup
      FieldName = 'ds_Plano'
      LookupDataSet = QryPlano
      LookupKeyFields = 'CD_PLANO'
      LookupResultField = 'NO_PLANO'
      KeyFields = 'CD_PLANO'
      Size = 60
      Lookup = True
    end
  end
  object dsBasePlano: TDataSource
    DataSet = QryBasePlano
    Left = 228
    Top = 131
  end
  object UpdateSQL2: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_BASE_PLANO_PATRONAL'
      'set'
      '  CD_PESSOA_PATROC = :CD_PESSOA_PATROC,'
      '  CD_PESSOA_ENTID = :CD_PESSOA_ENTID,'
      '  CD_PLANO = :CD_PLANO'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID and'
      '  CD_PLANO = :OLD_CD_PLANO')
    InsertSQL.Strings = (
      'insert into FI_BASE_PLANO_PATRONAL'
      '  (CD_VERSAO, CD_PESSOA_PATROC, CD_PESSOA_ENTID, CD_PLANO)'
      'values'
      '  (:CD_VERSAO, :CD_PESSOA_PATROC, :CD_PESSOA_ENTID, :CD_PLANO)')
    DeleteSQL.Strings = (
      'delete from FI_BASE_PLANO_PATRONAL'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID and'
      '  CD_PLANO = :OLD_CD_PLANO')
    Left = 256
    Top = 131
  end
  object QryPatrocinadora: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PJ.CD_PESSOA, PJ.NO_PESSOA'
      'FROM FI_PESSOA_JURIDICA PJ, FI_PATROCINADORA P'
      'WHERE P.CD_PESSOA_PATROC = PJ.CD_PESSOA')
    Left = 228
    Top = 159
    object QryPatrocinadoraCD_PESSOA: TFloatField
      FieldName = 'CD_PESSOA'
      Origin = 'BASEDADOS.FI_PESSOA_JURIDICA.CD_PESSOA'
    end
    object QryPatrocinadoraNO_PESSOA: TStringField
      FieldName = 'NO_PESSOA'
      Origin = 'BASEDADOS.FI_PESSOA_JURIDICA.NO_PESSOA'
      FixedChar = True
      Size = 60
    end
  end
  object dsPatrocinadora: TDataSource
    DataSet = QryLkpPatrocinadora
    Left = 228
    Top = 215
  end
  object dsEntidade: TDataSource
    DataSet = QryLkpEntidade
    Left = 200
    Top = 215
  end
  object QryEntidade: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PJ.CD_PESSOA, PJ.NO_PESSOA'
      'FROM FI_PESSOA_JURIDICA PJ, FI_ENTIDADE_PREVIDENCIA E'
      'WHERE E.CD_PESSOA_ENTID = PJ.CD_PESSOA')
    Left = 200
    Top = 159
    object QryEntidadeCD_PESSOA: TFloatField
      FieldName = 'CD_PESSOA'
      Origin = 'BASEDADOS.FI_PESSOA_JURIDICA.CD_PESSOA'
    end
    object QryEntidadeNO_PESSOA: TStringField
      FieldName = 'NO_PESSOA'
      Origin = 'BASEDADOS.FI_PESSOA_JURIDICA.NO_PESSOA'
      FixedChar = True
      Size = 60
    end
  end
  object dsPlano: TDataSource
    DataSet = QryLkpPlano
    Left = 256
    Top = 215
  end
  object QryPlano: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CD_PLANO, NO_PLANO'
      'FROM FI_PLANO_PATRONAL')
    Left = 256
    Top = 159
    object QryPlanoCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.CD_PLANO'
    end
    object QryPlanoNO_PLANO: TStringField
      FieldName = 'NO_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.NO_PLANO'
      FixedChar = True
      Size = 60
    end
  end
  object QryLkpEntidade: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PJ.CD_PESSOA, PJ.NO_PESSOA'
      'FROM FI_PESSOA_JURIDICA PJ, FI_ENTIDADE_PREVIDENCIA E'
      'WHERE E.CD_PESSOA_ENTID = PJ.CD_PESSOA'
      'ORDER BY 2')
    Left = 200
    Top = 187
    object FloatField6: TFloatField
      FieldName = 'CD_PESSOA'
      Origin = 'BASEDADOS.FI_PESSOA_JURIDICA.CD_PESSOA'
    end
    object StringField6: TStringField
      FieldName = 'NO_PESSOA'
      Origin = 'BASEDADOS.FI_PESSOA_JURIDICA.NO_PESSOA'
      FixedChar = True
      Size = 60
    end
  end
  object QryLkpPatrocinadora: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PJ.CD_PESSOA, PJ.NO_PESSOA'
      'FROM FI_PESSOA_JURIDICA PJ, FI_PATROCINADORA P'
      'WHERE P.CD_PESSOA_PATROC = PJ.CD_PESSOA'
      'ORDER BY 2')
    Left = 228
    Top = 187
    object FloatField7: TFloatField
      FieldName = 'CD_PESSOA'
      Origin = 'BASEDADOS.FI_PESSOA_JURIDICA.CD_PESSOA'
    end
    object StringField7: TStringField
      FieldName = 'NO_PESSOA'
      Origin = 'BASEDADOS.FI_PESSOA_JURIDICA.NO_PESSOA'
      FixedChar = True
      Size = 60
    end
  end
  object QryLkpPlano: TQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPatrocinadora
    SQL.Strings = (
      'SELECT CD_PLANO, NO_PLANO'
      'FROM FI_PLANO_PATRONAL'
      'WHERE CD_PESSOA_PATROC = :CD_PESSOA'
      'ORDER BY 2')
    Left = 256
    Top = 187
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object FloatField8: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.CD_PLANO'
    end
    object StringField8: TStringField
      FieldName = 'NO_PLANO'
      Origin = 'BASEDADOS.FI_PLANO_PATRONAL.NO_PLANO'
      FixedChar = True
      Size = 60
    end
  end
end
