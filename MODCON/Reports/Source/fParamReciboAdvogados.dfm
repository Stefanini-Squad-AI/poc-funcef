inherited frmParamReciboAdvogados: TfrmParamReciboAdvogados
  Left = 178
  Top = 122
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Recibo de Pagamento de Honorários Advocatícios'
  ClientHeight = 390
  ClientWidth = 437
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 437
    Height = 351
    BorderWidth = 2
    object pgctrlPrincipal: TPageControl
      Left = 4
      Top = 4
      Width = 429
      Height = 343
      ActivePage = tbshRelatorio
      Align = alClient
      HotTrack = True
      TabOrder = 0
      OnChange = pgctrlPrincipalChange
      object tbshRelatorio: TTabSheet
        Caption = 'Relatório'
        object gbxFavorecidos: TGroupBox
          Left = 5
          Top = 0
          Width = 410
          Height = 257
          Caption = 'Favorecidos'
          TabOrder = 0
          object chklstFavorecido: TColorCheckListBox
            Left = 8
            Top = 15
            Width = 262
            Height = 234
            OnClickCheck = chklstFavorecidoClickCheck
            ItemHeight = 13
            Style = lbOwnerDrawFixed
            TabOrder = 0
          end
          object bbtnSelTodosFunc: TBitBtn
            Left = 273
            Top = 15
            Width = 131
            Height = 25
            Caption = '   Seleciona Todos'
            TabOrder = 1
            TabStop = False
            OnClick = bbtnSelTodosFuncClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333333333333333333333333300000
              0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
              FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
              9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
              00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
              993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
              3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
              3333388888887733333333333333333333333333333333333333}
            NumGlyphs = 2
            Spacing = 0
          end
          object bbtnInverteSelFunc: TBitBtn
            Left = 273
            Top = 42
            Width = 131
            Height = 25
            Caption = '   Inverte Seleção'
            TabOrder = 2
            TabStop = False
            OnClick = bbtnInverteSelFuncClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333000000003333333388888888333333330FFF
              FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
              FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
              FFF0333833338FFFFFF833333333000000003333333388888888000000003333
              333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
              00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
              033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
              3333888888877333333333333333333333333333333333333333}
            NumGlyphs = 2
            Spacing = 0
          end
        end
        object gbxMesAnoRef: TGroupBox
          Left = 5
          Top = 266
          Width = 111
          Height = 43
          Caption = 'Data de Referência'
          TabOrder = 1
          object dtedDataRef: TCMDateTimePicker
            Left = 9
            Top = 15
            Width = 93
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
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
            TabOrder = 0
            OnChange = dtedDataRefChange
          end
        end
        object rgImprimirAut: TRadioGroup
          Left = 247
          Top = 266
          Width = 168
          Height = 43
          Caption = 'Inclui Rodapé de Autorizações?'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 2
        end
      end
      object tbshCAP: TTabSheet
        Caption = 'Contas a Pagar'
        ImageIndex = 1
        object pgctrlCAP: TPageControl
          Left = 0
          Top = 0
          Width = 421
          Height = 315
          ActivePage = tbshSelecaoCAP
          Align = alClient
          HotTrack = True
          TabOrder = 0
          object tbshSelecaoCAP: TTabSheet
            Caption = 'Seleções'
            object bvAguarde: TBevel
              Left = 1
              Top = 232
              Width = 397
              Height = 46
              Shape = bsFrame
              Style = bsRaised
            end
            object Label11: TLabel
              Left = 34
              Top = 128
              Width = 80
              Height = 13
              Caption = 'Data Pagamento'
            end
            object Label1: TLabel
              Left = 14
              Top = 6
              Width = 94
              Height = 13
              Caption = 'Tipo de Documento'
            end
            object lblProcesso: TLabel
              Left = 7
              Top = 238
              Width = 385
              Height = 13
              AutoSize = False
              Caption = 'lblProcesso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object Label2: TLabel
              Left = 14
              Top = 64
              Width = 97
              Height = 13
              Caption = 'Tipo de Desembolso'
            end
            object dtPagamento: TCMDateTimePicker
              Left = 34
              Top = 142
              Width = 100
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 0
              OnChange = dblkcbTipoDocChange
            end
            object dblkcbTipoDoc: TwwDBLookupCombo
              Left = 14
              Top = 20
              Width = 376
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'DESCRICAO')
              LookupTable = CdsTipoDoc
              LookupField = 'CODTIPDOC'
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnChange = dblkcbTipoDocChange
            end
            object chkRateioCC: TCheckBox
              Left = 34
              Top = 180
              Width = 172
              Height = 17
              Caption = '   Ratear por Centro de Custo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object bbtnGerarCAP: TBitBtn
              Left = 230
              Top = 126
              Width = 129
              Height = 73
              Caption = '  &Gerar Contas a Pagar'
              Default = True
              TabOrder = 3
              OnClick = bbtnGerarCAPClick
              Glyph.Data = {
                76040000424D7604000000000000760000002800000040000000200000000100
                0400000000000004000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                88888888888888888888888888888888888888FFFFFFFFFFFFF8888888888888
                88888000000000000088888888888888888887777777777777F8888888888888
                8888807707FFF70770888888888888888888877777F7F77777F8888888888888
                8888807707FCF70770888888888888888888877777F7F77777F8888888888888
                8888807707FCF70770888888888888888888877777F7F77777F8888888888888
                8888807777F6F77770888888888888888888877777F7F77777F8888888888888
                8888807777FCF77770888888888888888888877777F7F7777788888888888888
                8888880000000000088888888888888888888877777777777888888888888888
                8888888888888888888888888888888888888888888FFF888888888888888888
                888888888800088888888888888888888888888888777FF88888888888888888
                88888888803B3088888888888888888888888888877777F88888888888888888
                8888888880B3B088888888888888888888888888877777F88888888888888888
                88888888803B3088888888888888888888888888877777888888888888888888
                8888888888000888888888888888888888888888887778888888888888888888
                88888888888F88888888888FF888FFF888FF88888888F888888888BB888B4B88
                8BB8888888F4888888888877FFF777F8F77F88888887FF88888888BBBB84CC8B
                BBB888888F4CC8888888887777F777F77778888888777FF88888888B84CCCCCC
                8B888888F4CCCC8888888887F7777777F7F88888877777FF8888888B4C88C88C
                4B8888884CCCCCC88888888777F87F87778888887777777888888888CC88C88C
                488888888F4CC8888888888877887F877F88888888777F88888888888888C88C
                488888888F4CC88888888888F8887FF778F8888888777F888888888B8884CCCC
                8B8888888F4CC88888888887F8F7777787FF888888777F88888888BB84CCCC88
                8BB8F8F8FF4CC88888888877F77777888778F8F8FF777F888888888B4C88C888
                8B84848444CCC8888888888777F87F88F787F7F777777F88888888884C88C88C
                488C8C8CCCCCC8888888888877F87F877FF7F7F7777778888888888B4C88C88C
                4B8C8C8CCCCC88888888888777FF7FF777F78787777788888888888B8CCCCCC4
                8B8888888888888888888887F7777777F7FF788888888888888888BBBB8CC48B
                BBB888888888888888888877778777F7777F888888888888888888BB888BCB88
                8BB8888888888888888888778887778887788888888888888888888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888}
              Layout = blGlyphTop
              NumGlyphs = 2
              Spacing = 2
            end
            object pbProgresso: TProgressBar
              Left = 7
              Top = 256
              Width = 385
              Height = 16
              Min = 0
              Max = 100
              Step = 1
              TabOrder = 4
            end
            object dblckTipoDesemb: TwwDBLookupCombo
              Left = 14
              Top = 78
              Width = 376
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'DESCRICAO')
              LookupTable = CdsTipoDesemb
              LookupField = 'CODTIPRECDES'
              Style = csDropDownList
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
          end
          object tbshResultCAP: TTabSheet
            Caption = 'Resultado'
            ImageIndex = 1
            object Bevel1: TBevel
              Left = 1
              Top = 247
              Width = 397
              Height = 38
            end
            object memResult: TMemo
              Left = 1
              Top = 0
              Width = 397
              Height = 243
              Color = clBlack
              Font.Charset = ANSI_CHARSET
              Font.Color = clLime
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 0
              OnChange = memResultChange
            end
            object bbtnSalvar: TBitBtn
              Left = 5
              Top = 251
              Width = 116
              Height = 30
              Caption = 'S&alvar'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnClick = bbtnSalvarClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
                7700333333337777777733333333008088003333333377F73377333333330088
                88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
                000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
                FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
                99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
                99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
                99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
                93337FFFF7737777733300000033333333337777773333333333}
              NumGlyphs = 2
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 351
    Width = 437
    inherited tb97Fundo: TToolbar97
      Left = 267
      DockPos = 416
      inherited sep1: TToolbarSep97
        Left = 83
      end
      inherited sep3: TToolbarSep97
        Left = 0
      end
      inherited bbtnSair: TBitBtn
        Left = 3
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 86
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 100
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Cancel = False
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 368
    Top = 283
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited Cmp_Padrao: TCmParamReport
    Params = <
      item
        Caption = 'DataRef'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DataRef'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'ListaIdFavorecido'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'ListaIdFavorecido'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'ImprimirAutorizacoes'
        Controle = tcEdit
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'ImprimirAutorizacoes'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end>
    Left = 264
    Top = 272
  end
  object svdlgDialogo: TOpenDialog
    DefaultExt = '*.TXT'
    FileName = 'C:\TICKET\TICKET.TXT'
    Filter = 'Arquivos Texto|*.TXT|Todos|*.*'
    InitialDir = 'C:\TICKET'
    Options = [ofHideReadOnly, ofPathMustExist, ofNoNetworkButton]
    Title = 'Escolha a Pasta para a Geração do Ticket Magnético'
    Left = 368
    Top = 269
  end
  object CdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 22
    Top = 345
  end
  object CdsTipoDesemb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 106
    Top = 345
  end
end
