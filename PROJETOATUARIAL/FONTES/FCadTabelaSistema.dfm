inherited frmCadTabelaSistema: TfrmCadTabelaSistema
  Left = 236
  Top = 228
  HelpContext = 40137
  Caption = 'Cadastro das Tabelas do Sistema'
  ClientHeight = 453
  ClientWidth = 548
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 548
    Height = 367
    object Label5: TLabel
      Left = 11
      Top = 13
      Width = 94
      Height = 13
      Caption = 'Nome da Tabela'
    end
    object Label6: TLabel
      Left = 291
      Top = 8
      Width = 122
      Height = 13
      Caption = 'Ordem de Importação'
    end
    object DBEdtNoTabela: TDBEdit
      Left = 10
      Top = 27
      Width = 256
      Height = 21
      DataField = 'NO_TABELA'
      DataSource = ds
      Enabled = False
      TabOrder = 0
    end
    object DBEdtSqAtualizacao: TDBEdit
      Left = 320
      Top = 27
      Width = 61
      Height = 21
      DataField = 'SQ_ATUALIZACAO'
      DataSource = ds
      MaxLength = 2
      TabOrder = 1
    end
    object BtBtnImportar: TBitBtn
      Left = 425
      Top = 20
      Width = 97
      Height = 41
      Hint = 'Importa a estrutura das tabelas do Banco'
      Caption = '&Importar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BtBtnImportarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
        000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
        99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
        0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
        FFFF3FFFFF7F337F333300000307B70FFFFF77777F73FF733F330EEE033000FF
        0FFF7F337FF777337FF30EEE00033FF000FF7F33777F333777FF0EEE0E033300
        000F7FFF7F7FFF77777F00000E00000000007777737773777777330EEE0E0330
        00FF337FFF7F7F3777F33300000E033000FF337777737F3777F333330EEE0330
        00FF33337FFF7FF77733333300000000033F3333777777777333}
      NumGlyphs = 2
    end
    object PgCtrlDetalhe: TPageControl
      Left = 1
      Top = 65
      Width = 546
      Height = 301
      ActivePage = tbshDetalhe
      Align = alBottom
      HotTrack = True
      TabOrder = 3
      object tbshDetalhe: TTabSheet
        Caption = 'Atributos'
        object PnlDetalhe: TPanel
          Left = 0
          Top = 34
          Width = 538
          Height = 239
          Align = alClient
          TabOrder = 1
          object Label3: TLabel
            Left = 6
            Top = 3
            Width = 99
            Height = 13
            Caption = 'Nome do Atributo'
          end
          object Label4: TLabel
            Left = 6
            Top = 43
            Width = 124
            Height = 13
            Caption = 'Descrição do Atributo'
          end
          object Label1: TLabel
            Left = 6
            Top = 148
            Width = 104
            Height = 13
            Caption = 'Tabela de Lookup'
          end
          object Label2: TLabel
            Left = 261
            Top = 148
            Width = 239
            Height = 13
            Caption = 'Atributo da Tabela de Lookup - Descrição'
          end
          object Label7: TLabel
            Left = 6
            Top = 193
            Width = 93
            Height = 13
            Caption = 'Grupo de Dados'
          end
          object bbtnOkDet: TBitBtn
            Left = 333
            Top = 205
            Width = 81
            Height = 27
            Caption = '&OK'
            Default = True
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
            Spacing = 0
          end
          object bbtnCancelarDet: TBitBtn
            Left = 427
            Top = 205
            Width = 81
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
            Spacing = 0
          end
          object DBEdtNomeCampo: TDBEdit
            Left = 5
            Top = 17
            Width = 251
            Height = 21
            DataField = 'NO_ATRIBUTO_TABELA'
            DataSource = dsDetalhe
            TabOrder = 0
          end
          object DBEdtDescrCampo: TDBEdit
            Left = 5
            Top = 57
            Width = 251
            Height = 21
            DataField = 'DS_ATRIBUTO_TABELA'
            DataSource = dsDetalhe
            TabOrder = 1
          end
          object DBRdGrpTipoAtributo: TDBRadioGroup
            Left = 260
            Top = 10
            Width = 266
            Height = 71
            Caption = 'Tipo do Atributo'
            Columns = 2
            DataField = 'TP_ATRIBUTO'
            DataSource = dsDetalhe
            Items.Strings = (
              'Alfanumérico'
              'Numérico inteiro'
              'Numérico decimal'
              'Data'
              'Memo')
            TabOrder = 4
            Values.Strings = (
              'A'
              'N'
              'F'
              'D'
              'M')
          end
          object GrpBxTamanho: TGroupBox
            Left = 5
            Top = 85
            Width = 71
            Height = 56
            Caption = 'Tamanho'
            TabOrder = 5
            object DBEdit1: TDBEdit
              Left = 15
              Top = 22
              Width = 41
              Height = 21
              DataField = 'NR_TAM_ATRIBUTO_TABELA'
              DataSource = dsDetalhe
              MaxLength = 4
              TabOrder = 0
            end
          end
          object DBRdGrpObrigatorio: TDBRadioGroup
            Left = 80
            Top = 85
            Width = 176
            Height = 56
            Caption = 'Campo Obrigatório'
            Columns = 2
            DataField = 'IR_MANDATORIO'
            DataSource = dsDetalhe
            Items.Strings = (
              'Sim'
              'Não')
            TabOrder = 6
            Values.Strings = (
              'S'
              'N')
          end
          object DBRadioGroup2: TDBRadioGroup
            Left = 260
            Top = 85
            Width = 191
            Height = 56
            Caption = 'Carga Obrigatória'
            Columns = 2
            DataField = 'IR_CARGA_OBRIGATORIA'
            DataSource = dsDetalhe
            Items.Strings = (
              'Sim'
              'Não')
            TabOrder = 7
            Values.Strings = (
              'S'
              'N')
          end
          object DBLkpCmbBxGrupoDado: TDBLookupComboBox
            Left = 5
            Top = 210
            Width = 251
            Height = 21
            DataField = 'CD_GRUPO'
            DataSource = dsDetalhe
            KeyField = 'CD_GRUPO'
            ListField = 'NO_GRUPO'
            ListSource = dsGrupo
            TabOrder = 8
            OnKeyDown = DBLkpCmbBxGrupoDadoKeyDown
          end
          object GrpBxOrdem: TGroupBox
            Left = 455
            Top = 85
            Width = 71
            Height = 56
            Caption = 'Ordem'
            TabOrder = 9
            object DBEdit2: TDBEdit
              Left = 15
              Top = 22
              Width = 41
              Height = 21
              DataField = 'NR_ORDEM'
              DataSource = dsDetalhe
              TabOrder = 0
            end
          end
          object DBEdtTabLookup: TDBEdit
            Left = 5
            Top = 162
            Width = 251
            Height = 21
            DataField = 'NO_TABELA_LOOKUP'
            DataSource = dsDetalhe
            TabOrder = 10
          end
          object DBEdtTabAtribLookup: TDBEdit
            Left = 260
            Top = 162
            Width = 251
            Height = 21
            DataField = 'NO_ATRIBUTO_TABELA_LOOKUP'
            DataSource = dsDetalhe
            TabOrder = 11
          end
        end
        object DbGrdDet: TwwDBGrid
          Left = 0
          Top = 34
          Width = 538
          Height = 239
          Selected.Strings = (
            'NO_ATRIBUTO_TABELA'#9'20'#9'Atributo'
            'DS_ATRIBUTO_TABELA'#9'20'#9'Descriçao'
            'TP_ATRIBUTO'#9'3'#9'Tipo'
            'NR_TAM_ATRIBUTO_TABELA'#9'4'#9'Tam'
            'IR_MANDATORIO'#9'5'#9'Obrig.'
            'IR_CARGA_OBRIGATORIA'#9'9'#9'Carga Obrig.'
            'NO_TABELA_LOOKUP'#9'30'#9'Tabela Lookup'
            'NO_ATRIBUTO_TABELA_LOOKUP'#9'30'#9'Atributo Tab. Lookup'
            'DS_GRUPO'#9'20'#9'Grupo')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsDetalhe
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ReadOnly = True
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
        object pnlBarraDetalhe: TPanel
          Left = 0
          Top = 0
          Width = 538
          Height = 34
          Align = alTop
          TabOrder = 0
          object BtProc: TSpeedButton
            Left = 61
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
            Left = 86
            Top = 4
            Width = 25
            Height = 25
            Hint = 'Remover o registro selecionado|'
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
      object TbShtPK: TTabSheet
        Caption = 'Primary Key'
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 0
          Width = 518
          Height = 273
          Selected.Strings = (
            'NO_PK_TABELA'#9'29'#9'Primary Key'
            'NO_ATRIBUTO_TABELA'#9'29'#9'Atributo')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsPk
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
      end
      object TbShtFK: TTabSheet
        Caption = 'Foreign Key'
        object wwDBGrid2: TwwDBGrid
          Left = 0
          Top = 0
          Width = 518
          Height = 273
          Selected.Strings = (
            'NO_FK_TABELA'#9'30'#9'Foraign Key'
            'NO_TABELA_FK'#9'30'#9'Tabela FK'
            'NO_ATRIBUTO_TABELA_FK'#9'30'#9'Atributo Tabela FK'
            'NO_ATRIBUTO_TABELA'#9'30'#9'Atributo')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsFk
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
      end
    end
  end
  inherited Dock972: TDock97
    Width = 548
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 548
    inherited tb97Fundo: TToolbar97
      Left = 292
      DockPos = 292
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 123
      DockPos = 123
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ds: TwwDataSource
    DataSet = qryPrincipal
    Left = 316
    Top = 98
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 288
    Top = 7
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 318
    Top = 8
  end
  object qryAuxLe: TQuery
    DatabaseName = 'BaseDados'
    Left = 460
    Top = 107
  end
  object qryAuxAtualiza: TQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    Left = 490
    Top = 107
  end
  object qryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = qryPrincipalAfterOpen
    BeforePost = qryPrincipalBeforePost
    AfterPost = qryPrincipalAfterPost
    AfterDelete = qryPrincipalAfterDelete
    OnUpdateError = qryPrincipalUpdateError
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM FI_TABELA'
      'ORDER BY NO_TABELA')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 285
    Top = 97
    object qryPrincipalNO_TABELA: TStringField
      FieldName = 'NO_TABELA'
      Origin = 'BASEDADOS.FI_TABELA.NO_TABELA'
      FixedChar = True
      Size = 60
    end
    object qryPrincipalSQ_ATUALIZACAO: TFloatField
      FieldName = 'SQ_ATUALIZACAO'
      Origin = 'BASEDADOS.FI_TABELA.SQ_ATUALIZACAO'
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_TABELA'
      'set'
      '  NO_TABELA = :NO_TABELA,'
      '  SQ_ATUALIZACAO = :SQ_ATUALIZACAO'
      'where'
      '  NO_TABELA = :OLD_NO_TABELA and'
      '  SQ_ATUALIZACAO = :OLD_SQ_ATUALIZACAO')
    InsertSQL.Strings = (
      'insert into FI_TABELA'
      '  (NO_TABELA, SQ_ATUALIZACAO)'
      'values'
      '  (:NO_TABELA, :SQ_ATUALIZACAO)')
    DeleteSQL.Strings = (
      'delete from FI_TABELA'
      'where'
      '  NO_TABELA = :OLD_NO_TABELA and'
      '  SQ_ATUALIZACAO = :OLD_SQ_ATUALIZACAO')
    Left = 345
    Top = 97
  end
  object qryDetalhe: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetalheBeforePost
    AfterPost = qryDetalheAfterPost
    AfterDelete = qryDetalheAfterDelete
    OnUpdateError = qryDetalheUpdateError
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT * FROM FI_ATRIBUTO_TABELA'
      'WHERE RTRIM(NO_TABELA) = :NO_TABELA'
      'ORDER BY NR_ORDEM'
      '')
    UpdateObject = UpdtSQLDetalhe
    ValidateWithMask = True
    Left = 135
    Top = 137
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NO_TABELA'
        ParamType = ptUnknown
      end>
    object qryDetalheNO_TABELA: TStringField
      FieldName = 'NO_TABELA'
      FixedChar = True
      Size = 60
    end
    object qryDetalheNO_ATRIBUTO_TABELA: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA'
      FixedChar = True
      Size = 60
    end
    object qryDetalheDS_ATRIBUTO_TABELA: TStringField
      FieldName = 'DS_ATRIBUTO_TABELA'
      FixedChar = True
      Size = 60
    end
    object qryDetalheTP_ATRIBUTO: TStringField
      FieldName = 'TP_ATRIBUTO'
      FixedChar = True
      Size = 1
    end
    object qryDetalheNR_TAM_ATRIBUTO_TABELA: TFloatField
      FieldName = 'NR_TAM_ATRIBUTO_TABELA'
    end
    object qryDetalheIR_MANDATORIO: TStringField
      FieldName = 'IR_MANDATORIO'
      FixedChar = True
      Size = 1
    end
    object qryDetalheIR_CARGA_OBRIGATORIA: TStringField
      FieldName = 'IR_CARGA_OBRIGATORIA'
      FixedChar = True
      Size = 1
    end
    object qryDetalheNR_ORDEM: TFloatField
      FieldName = 'NR_ORDEM'
    end
    object qryDetalheNO_TABELA_LOOKUP: TStringField
      FieldName = 'NO_TABELA_LOOKUP'
      FixedChar = True
      Size = 60
    end
    object qryDetalheNO_ATRIBUTO_TABELA_LOOKUP: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA_LOOKUP'
      FixedChar = True
      Size = 60
    end
    object qryDetalheCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
    end
  end
  object dsDetalhe: TwwDataSource
    AutoEdit = False
    DataSet = qryDetalhe
    Left = 166
    Top = 138
  end
  object UpdtSQLDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_ATRIBUTO_TABELA'
      'set'
      '  NO_TABELA = :NO_TABELA,'
      '  NO_ATRIBUTO_TABELA = :NO_ATRIBUTO_TABELA,'
      '  DS_ATRIBUTO_TABELA = :DS_ATRIBUTO_TABELA,'
      '  TP_ATRIBUTO = :TP_ATRIBUTO,'
      '  NR_TAM_ATRIBUTO_TABELA = :NR_TAM_ATRIBUTO_TABELA,'
      '  IR_MANDATORIO = :IR_MANDATORIO,'
      '  IR_CARGA_OBRIGATORIA = :IR_CARGA_OBRIGATORIA,'
      '  NR_ORDEM = :NR_ORDEM,'
      '  NO_TABELA_LOOKUP = :NO_TABELA_LOOKUP,'
      '  NO_ATRIBUTO_TABELA_LOOKUP = :NO_ATRIBUTO_TABELA_LOOKUP,'
      '  CD_GRUPO = :CD_GRUPO'
      'where'
      '  NO_TABELA = :OLD_NO_TABELA and'
      '  NO_ATRIBUTO_TABELA = :OLD_NO_ATRIBUTO_TABELA')
    InsertSQL.Strings = (
      'insert into FI_ATRIBUTO_TABELA'
      
        '  (NO_TABELA, NO_ATRIBUTO_TABELA, DS_ATRIBUTO_TABELA, TP_ATRIBUT' +
        'O, NR_TAM_ATRIBUTO_TABELA, '
      
        '   IR_MANDATORIO, IR_CARGA_OBRIGATORIA, NR_ORDEM, NO_TABELA_LOOK' +
        'UP, NO_ATRIBUTO_TABELA_LOOKUP, '
      '   CD_GRUPO)'
      'values'
      
        '  (:NO_TABELA, :NO_ATRIBUTO_TABELA, :DS_ATRIBUTO_TABELA, :TP_ATR' +
        'IBUTO, '
      
        '   :NR_TAM_ATRIBUTO_TABELA, :IR_MANDATORIO, :IR_CARGA_OBRIGATORI' +
        'A, :NR_ORDEM, '
      '   :NO_TABELA_LOOKUP, :NO_ATRIBUTO_TABELA_LOOKUP, :CD_GRUPO)')
    DeleteSQL.Strings = (
      'delete from FI_ATRIBUTO_TABELA'
      'where'
      '  NO_TABELA = :OLD_NO_TABELA and'
      '  NO_ATRIBUTO_TABELA = :OLD_NO_ATRIBUTO_TABELA')
    Left = 195
    Top = 137
  end
  object qryGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM FI_GRUPO_LOGICO')
    ValidateWithMask = True
    Left = 244
    Top = 137
    object qryGrupoCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
      Origin = 'BASEDADOS.FI_GRUPO_LOGICO.CD_GRUPO'
    end
    object qryGrupoNO_GRUPO: TStringField
      FieldName = 'NO_GRUPO'
      Origin = 'BASEDADOS.FI_GRUPO_LOGICO.NO_GRUPO'
      FixedChar = True
      Size = 60
    end
    object qryGrupoNR_ORDEM: TFloatField
      FieldName = 'NR_ORDEM'
      Origin = 'BASEDADOS.FI_GRUPO_LOGICO.NR_ORDEM'
    end
  end
  object dsGrupo: TwwDataSource
    DataSet = qryGrupo
    Left = 274
    Top = 137
  end
  object qryFK: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT * FROM FI_FK_TABELA'
      'WHERE RTRIM(NO_TABELA) = :NO_TABELA'
      'ORDER BY NO_FK_TABELA, NR_ORDEM')
    ValidateWithMask = True
    Left = 399
    Top = 137
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NO_TABELA'
        ParamType = ptUnknown
      end>
    object qryFKNO_TABELA: TStringField
      FieldName = 'NO_TABELA'
      FixedChar = True
      Size = 60
    end
    object qryFKNO_ATRIBUTO_TABELA: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA'
      FixedChar = True
      Size = 60
    end
    object qryFKNO_TABELA_FK: TStringField
      FieldName = 'NO_TABELA_FK'
      FixedChar = True
      Size = 60
    end
    object qryFKNO_ATRIBUTO_TABELA_FK: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA_FK'
      FixedChar = True
      Size = 60
    end
    object qryFKNO_FK_TABELA: TStringField
      FieldName = 'NO_FK_TABELA'
      FixedChar = True
      Size = 60
    end
    object qryFKNR_ORDEM: TFloatField
      FieldName = 'NR_ORDEM'
    end
  end
  object qryPk: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT * FROM FI_PK_TABELA'
      'WHERE RTRIM(NO_TABELA) = :NO_TABELA'
      'ORDER BY NO_PK_TABELA, NR_ORDEM')
    ValidateWithMask = True
    Left = 329
    Top = 137
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NO_TABELA'
        ParamType = ptUnknown
      end>
    object qryPkNO_TABELA: TStringField
      FieldName = 'NO_TABELA'
      FixedChar = True
      Size = 60
    end
    object qryPkNO_ATRIBUTO_TABELA: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA'
      FixedChar = True
      Size = 60
    end
    object qryPkNO_PK_TABELA: TStringField
      FieldName = 'NO_PK_TABELA'
      FixedChar = True
      Size = 60
    end
    object qryPkNR_ORDEM: TFloatField
      FieldName = 'NR_ORDEM'
    end
  end
  object dsPk: TwwDataSource
    DataSet = qryPk
    Left = 359
    Top = 137
  end
  object dsFk: TwwDataSource
    DataSet = qryFK
    Left = 429
    Top = 137
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_TABELA.NO_TABELA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tabela')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'FI_TABELA')
    CamposChave.Strings = (
      'FI_TABELA.NO_TABELA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 208
    Top = 55
  end
  object QryAtualizaConstraints: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE FI_ATRIBUTO_TABELA'
      'SET NO_TABELA_LOOKUP = NULL,'
      '    NO_ATRIBUTO_TABELA_LOOKUP = NULL,'
      '    CD_GRUPO = NULL')
    Left = 460
    Top = 138
  end
  object QryExcluiConstraints: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM FI_GRUPO_LOGICO')
    Left = 488
    Top = 138
  end
end
