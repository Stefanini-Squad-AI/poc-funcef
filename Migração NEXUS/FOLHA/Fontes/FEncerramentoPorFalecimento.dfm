inherited frmEncerramentoPorFalecimento: TfrmEncerramentoPorFalecimento
  Left = 354
  Top = 96
  BorderStyle = bsNone
  Caption = 'Encerramento de Benefícios'
  ClientHeight = 587
  ClientWidth = 1200
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1200
    Height = 514
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1198
      Height = 34
      Align = alTop
      BevelOuter = bvLowered
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 14
        Top = 8
        Width = 263
        Height = 22
        Caption = 'Encerramento de Benefícios'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 1196
        Height = 34
        Align = alTop
        BevelOuter = bvLowered
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label3: TLabel
          Left = 14
          Top = 8
          Width = 263
          Height = 22
          Caption = 'Encerramento de Benefícios'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 35
      Width = 1198
      Height = 150
      Align = alTop
      TabOrder = 1
      object PageControlFiltro: TPageControl
        Left = 1
        Top = 1
        Width = 1196
        Height = 148
        ActivePage = TabLista
        Align = alClient
        TabOrder = 0
        object TabData: TTabSheet
          Caption = 'Data'
          ImageIndex = 1
          object GroupBoxData: TGroupBox
            Left = 0
            Top = 0
            Width = 1188
            Height = 120
            Align = alClient
            Caption = 'Data'
            TabOrder = 0
            object lbl2: TLabel
              Left = 191
              Top = 12
              Width = 65
              Height = 13
              Caption = 'Data Início'
            end
            object lbl3: TLabel
              Left = 320
              Top = 12
              Width = 51
              Height = 13
              Caption = 'Data Fim'
            end
            object RadioButton1: TRadioButton
              Left = 6
              Top = 32
              Width = 173
              Height = 17
              Caption = 'Data Inclusão do Evento'
              TabOrder = 0
            end
            object RadioButton2: TRadioButton
              Left = 6
              Top = 17
              Width = 113
              Height = 17
              Caption = 'Data Evento'
              Checked = True
              TabOrder = 1
              TabStop = True
            end
            object RadioButton3: TRadioButton
              Left = 6
              Top = 47
              Width = 113
              Height = 17
              Caption = 'Data Morte'
              TabOrder = 2
            end
            object dtInicio: TCMDateTimePicker
              Left = 191
              Top = 26
              Width = 107
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
              TabOrder = 3
            end
            object dtFim: TCMDateTimePicker
              Left = 319
              Top = 26
              Width = 107
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
              TabOrder = 4
            end
            object btnFiltrar: TBitBtn
              Left = 438
              Top = 20
              Width = 101
              Height = 28
              Hint = 'Procurar participante'
              Caption = '&Filtrar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              TabStop = False
              OnClick = btnFiltrarClick
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000012000000120000000100
                040000000000D800000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
                FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
                0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
                870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
                FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
                0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
            end
          end
        end
        object TabPessoa: TTabSheet
          Caption = 'Pessoa'
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 1188
            Height = 120
            Align = alClient
            TabOrder = 0
            object Label4: TLabel
              Left = 8
              Top = 9
              Width = 37
              Height = 13
              Caption = 'Titular'
            end
            object Label5: TLabel
              Left = 520
              Top = 9
              Width = 55
              Height = 13
              Caption = 'Matrícula'
            end
            object Label6: TLabel
              Left = 8
              Top = 50
              Width = 118
              Height = 13
              Caption = 'Plano Previdenciário'
            end
            object Label9: TLabel
              Left = 329
              Top = 50
              Width = 80
              Height = 13
              Caption = 'Patrocinadora'
            end
            object edtMatricula: TEdit
              Left = 521
              Top = 24
              Width = 113
              Height = 21
              CharCase = ecUpperCase
              Color = clMenu
              ReadOnly = True
              TabOrder = 0
            end
            object edtTitular: TEdit
              Left = 8
              Top = 24
              Width = 497
              Height = 21
              CharCase = ecUpperCase
              Color = clMenu
              Enabled = False
              ReadOnly = True
              TabOrder = 1
            end
            object btnProcurar: TBitBtn
              Left = 667
              Top = 15
              Width = 101
              Height = 28
              Hint = 'Procurar participante'
              Caption = '&Procurar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              TabStop = False
              OnClick = bbtnProcurarClick
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000012000000120000000100
                040000000000D800000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
                FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
                0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
                870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
                FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
                0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
            end
            object edtPlanoPrevidenciario: TEdit
              Left = 8
              Top = 65
              Width = 305
              Height = 21
              CharCase = ecUpperCase
              Color = clMenu
              Enabled = False
              ReadOnly = True
              TabOrder = 3
            end
            object edtPatrocinadora: TEdit
              Left = 328
              Top = 65
              Width = 305
              Height = 21
              CharCase = ecUpperCase
              Color = clMenu
              Enabled = False
              ReadOnly = True
              TabOrder = 4
            end
          end
        end
        object TabLista: TTabSheet
          Caption = 'Lista'
          ImageIndex = 2
          object GroupBoxLista: TGroupBox
            Left = 0
            Top = 0
            Width = 1188
            Height = 120
            Align = alClient
            Caption = 'Lista'
            TabOrder = 0
            object lbl1: TLabel
              Left = 180
              Top = 12
              Width = 34
              Height = 13
              Caption = 'Listas'
            end
            object wdblkpcmb1: TwwDBLookupCombo
              Left = 180
              Top = 28
              Width = 369
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'IDLISTA'#9'10'#9'Cod Lista'#9'F'
                'NOME'#9'30'#9'Nome'#9'F'
                'TRGDTINCLUSAO'#9'10'#9'Data Inclusão'#9'F'
                'IDLOTE'#9'10'#9'Lote'#9'F'
                'SITUACAO'#9'10'#9'Situação'#9'F')
              LookupTable = qryLista_CTRL
              LookupField = 'FLGSITUACAO'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = wdblkpcmb1CloseUp
              OnEnter = wdblkpcmb1Enter
            end
            object rbNaoProcessadas: TRadioButton
              Left = 6
              Top = 46
              Width = 123
              Height = 17
              Caption = 'Não Processadas'
              TabOrder = 1
            end
            object rbprocessadas: TRadioButton
              Left = 6
              Top = 31
              Width = 113
              Height = 17
              Caption = 'Processadas'
              TabOrder = 2
            end
            object rbtodas: TRadioButton
              Left = 6
              Top = 16
              Width = 113
              Height = 17
              Caption = 'Todas'
              Checked = True
              TabOrder = 3
              TabStop = True
            end
            object rbParcialmente: TRadioButton
              Left = 6
              Top = 62
              Width = 175
              Height = 17
              Caption = 'Processadas Parcialmente'
              TabOrder = 4
            end
          end
        end
      end
    end
    object dbgrdLista: TwwDBGrid
      Left = 1
      Top = 185
      Width = 1198
      Height = 328
      Selected.Strings = (
        'PROCESSAR'#9'10'#9'Processar'
        'MATRICULA'#9'10'#9'Matrícula'
        'NOME'#9'50'#9'Nome do Beneficiário'
        'DATAFALECIMENTO'#9'18'#9'Data Morte'
        'DATAEVENTO'#9'18'#9'Data Evento'
        'DATAINCLUSAOEVENTO'#9'18'#9'Data Inc. Evento'
        'USUARIOINCLUSAOEVENTO'#9'33'#9'Usuário Evento'
        'DATAPROCESSAMENTO'#9'18'#9'Data Proc. '
        'DATADESFAZIMENTO'#9'10'#9'Data Desfaz. '
        'FLGSITUACAO'#9'20'#9'Situação')
      MemoAttributes = []
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      Align = alClient
      DataSource = dsLista
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgTrailingEllipsis, dgShowCellHint]
      ParentFont = False
      TabOrder = 2
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
      OnFieldChanged = dbgrdListaFieldChanged
    end
  end
  inherited Dock971: TDock97
    Top = 548
    Width = 1200
    inherited tb97Fundo: TToolbar97
      Left = 576
      DockPos = 576
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 280
      DockPos = 280
      inherited ToolbarSep971: TToolbarSep97
        Left = 289
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 105
        Width = 95
        Caption = '&Processar'
        Enabled = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 200
        Width = 89
        Enabled = False
        OnClick = bbtnCancelarClick
      end
      object BtnDesfazer: TBitBtn
        Left = 0
        Top = 0
        Width = 105
        Height = 33
        Caption = '&Desfazer'
        Default = True
        Enabled = False
        ModalResult = 1
        TabOrder = 2
        OnClick = BtnDesfazerClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  object pnlgrid: TPanel [2]
    Left = 0
    Top = 514
    Width = 1200
    Height = 34
    Align = alBottom
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object lblFiltroGrid: TLabel
      Left = 288
      Top = 11
      Width = 31
      Height = 14
      Caption = 'Filtro:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnSelTudo: TBitBtn
      Left = 4
      Top = 2
      Width = 133
      Height = 30
      Hint = 'Selecionar Todas as Pessoas'
      Caption = ' Marcar Todos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnSelTudoClick
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
      Spacing = 0
    end
    object btnDesMarcarTudo: TBitBtn
      Left = 139
      Top = 2
      Width = 133
      Height = 30
      Hint = 'Deselecionar Todas as Pessoas'
      Caption = ' Desmarcar Todos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnDesMarcarTudoClick
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
      Spacing = 0
    end
    object chkProcessados: TCheckBox
      Left = 327
      Top = 9
      Width = 97
      Height = 17
      Caption = 'Processados'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = chkProcessadosClick
    end
    object chkNaoProcessados: TCheckBox
      Left = 424
      Top = 9
      Width = 121
      Height = 17
      Caption = 'Não Processados'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = chkNaoProcessadosClick
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 1099
    Top = 75
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object MSBenef: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DEPENTIT.MATRICULA'
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'PLANPREV.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'CPF'
      'Plano')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DEPENTIT'
      'PESSOA'
      'PLANPREV'
      'PESSOAFISICA'
      'benefbfciario')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'PESSOA.NOME'
      'DEPENTIT.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'PESSOAFISICA.DATAMORTE'
      'PLANPREV.NOME'
      'benefbfciario.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'DEPENTIT.IDTITULAR')
    Filtro.Strings = (
      '( DEPENTIT.IDPESSOA = PESSOA.IDPESSOA )'
      '( depentit.IDPESSOA = PESSOAFISICA.IDPESSOA )'
      '(benefbfciario.IDPESSOA = PESSOAFISICA.IDPESSOA)'
      '(pessoa.idpessoa = pessoafisica.idpessoa )'
      '(benefbfciario.IDPESSOA = DEPENTIT.IDPESSOA)'
      '(benefbfciario.IDTITULAR = DEPENTIT.IDTITULAR)'
      '(benefbfciario.IDPESSOA = PESSOA.IDPESSOA)'
      '(BENEFBFCIARIO.IDPLANOPREV = PLANPREV.IDPLANOPREV)'
      '(PESSOAFISICA.DATAMORTE IS NOT NULL)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '50'
      '15'
      '15')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 1106
    Top = 132
  end
  object dsLista: TwwDataSource
    DataSet = qryLista
    Left = 892
    Top = 438
  end
  object qryLista: TwwQuery
    CachedUpdates = True
    AfterScroll = qryListaAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '   select 0 as PROCESSAR,'
      '      lst.idpessoa idPessoa, '
      '      lst.matricula Matricula,'
      '      lst.nome Nome,'
      '      lst.datamorte DataFalecimento,'
      '      lst.dataeventofalecimento DataEvento,'
      '      lst.datainclusaoevento DataInclusaoEvento,'
      '      lst.usuarioinclusaoevento UsuarioInclusaoEvento,'
      '      lst.flgsituacao as  iFlgSituacao,'
      
        '      decode(lst.FlgSituacao,0,'#39'Não Processado'#39', 1,'#39'Processado'#39',' +
        '3, '#39'Falha ao processar'#39') as FlgSituacao,'
      '      lst.datadesfazimento datadesfazimento, '
      '      lst.dataprocessamento Dataprocessamento'
      '   from ENCERRAFALECIDO_LISTADET lst  '
      'where lst.idlista = 25')
    UpdateObject = updLista
    ControlType.Strings = (
      'PROCESSAR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 937
    Top = 438
    object qryListaPROCESSAR: TFloatField
      DisplayLabel = 'Processar'
      DisplayWidth = 10
      FieldName = 'PROCESSAR'
    end
    object qryListaMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 10
      FieldName = 'MATRICULA'
      ReadOnly = True
      Size = 10
    end
    object qryListaNOME: TStringField
      DisplayLabel = 'Nome do Beneficiário'
      DisplayWidth = 50
      FieldName = 'NOME'
      ReadOnly = True
      Size = 60
    end
    object qryListaDATAFALECIMENTO: TDateTimeField
      DisplayLabel = 'Data Morte'
      DisplayWidth = 18
      FieldName = 'DATAFALECIMENTO'
      ReadOnly = True
    end
    object qryListaDATAEVENTO: TDateTimeField
      DisplayLabel = 'Data Evento'
      DisplayWidth = 18
      FieldName = 'DATAEVENTO'
    end
    object qryListaDATAINCLUSAOEVENTO: TDateTimeField
      DisplayLabel = 'Data Inc. Evento'
      DisplayWidth = 18
      FieldName = 'DATAINCLUSAOEVENTO'
      ReadOnly = True
    end
    object qryListaUSUARIOINCLUSAOEVENTO: TStringField
      DisplayLabel = 'Usuário Evento'
      DisplayWidth = 33
      FieldName = 'USUARIOINCLUSAOEVENTO'
      ReadOnly = True
      Size = 60
    end
    object qryListaDATAPROCESSAMENTO: TDateTimeField
      DisplayLabel = 'Data Proc. '
      DisplayWidth = 18
      FieldName = 'DATAPROCESSAMENTO'
      ReadOnly = True
    end
    object qryListaDATADESFAZIMENTO: TDateTimeField
      DisplayLabel = 'Data Desfaz. '
      DisplayWidth = 10
      FieldName = 'DATADESFAZIMENTO'
      ReadOnly = True
    end
    object qryListaFLGSITUACAO: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 20
      FieldName = 'FLGSITUACAO'
      ReadOnly = True
      Size = 22
    end
    object qryListaIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      ReadOnly = True
      Visible = False
    end
    object qryListaIFLGSITUACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IFLGSITUACAO'
      Visible = False
    end
  end
  object updLista: TUpdateSQL
    InsertSQL.Strings = (
      '')
    Left = 982
    Top = 438
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT 0 as PROCESSAR'
      '     , D.MATRICULA                                       '
      '     , BBF.DATAINICIO DIB                                '
      '     , BBF.VALORATUAL                                    '
      '     , BBF.IDSITBENEFICIO                                '
      '     , SB.DESCRICAO as SITBENEFICIO                      '
      '     , ( SELECT MAX(HBF.DATAPAGAMENTO)                   '
      '        FROM HSTBENEFBFCIARIO HBF                        '
      '        WHERE HBF.IDBENEFICIO = BBF.IDBENEFICIO          '
      '        AND HBF.IDTITULAR = BBF.IDTITULAR                '
      '        AND HBF.IDPLANOPREV = BBF.IDPLANOPREV            '
      '        AND HBF.FLGDEVOLUCAO = 0                         '
      '       ) AS ULTIMO_PAGAMENTO                             '
      '     , BBF.NUMEROPROCESSO                                '
      '     , BBF.NUMPROCINSS                                   '
      '     , PF.DATAMORTE                                      '
      'FROM BENEFBFCIARIO BBF                                   '
      '   , BENEFICIO B                                         '
      '   , SITBENEF SB                                         '
      '   , DEPENTIT D                                          '
      '   , PESSOAFISICA PF                                     '
      'WHERE BBF.IDPESSOA    = D.IDPESSOA                       '
      ' AND BBF.IDPESSOA    = PF.IDPESSOA                       '
      ' AND BBF.IDBENEFICIO = B.IDBENEFICIO                     '
      ' AND BBF.IDSITBENEFICIO = SB.IDSITBENEF(+)               '
      ' AND PF.DATAMORTE >= TO_DATE('#39'29/09/2010'#39','#39'DD/MM/YYYY'#39')')
    ControlType.Strings = (
      'PROCESSAR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 937
    Top = 486
  end
  object qryRub: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT 0 as PROCESSAR'
      '     , D.MATRICULA                                       '
      '     , BBF.DATAINICIO DIB                                '
      '     , BBF.VALORATUAL                                    '
      '     , BBF.IDSITBENEFICIO                                '
      '     , SB.DESCRICAO as SITBENEFICIO                      '
      '     , ( SELECT MAX(HBF.DATAPAGAMENTO)                   '
      '        FROM HSTBENEFBFCIARIO HBF                        '
      '        WHERE HBF.IDBENEFICIO = BBF.IDBENEFICIO          '
      '        AND HBF.IDTITULAR = BBF.IDTITULAR                '
      '        AND HBF.IDPLANOPREV = BBF.IDPLANOPREV            '
      '        AND HBF.FLGDEVOLUCAO = 0                         '
      '       ) AS ULTIMO_PAGAMENTO                             '
      '     , BBF.NUMEROPROCESSO                                '
      '     , BBF.NUMPROCINSS                                   '
      '     , PF.DATAMORTE                                      '
      'FROM BENEFBFCIARIO BBF                                   '
      '   , BENEFICIO B                                         '
      '   , SITBENEF SB                                         '
      '   , DEPENTIT D                                          '
      '   , PESSOAFISICA PF                                     '
      'WHERE BBF.IDPESSOA    = D.IDPESSOA                       '
      ' AND BBF.IDPESSOA    = PF.IDPESSOA                       '
      ' AND BBF.IDBENEFICIO = B.IDBENEFICIO                     '
      ' AND BBF.IDSITBENEFICIO = SB.IDSITBENEF(+)               '
      ' AND PF.DATAMORTE >= TO_DATE('#39'29/09/2010'#39','#39'DD/MM/YYYY'#39')')
    ControlType.Strings = (
      'PROCESSAR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 985
    Top = 486
  end
  object qryRubAcaoJud: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ControlType.Strings = (
      'PROCESSAR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 1025
    Top = 486
  end
  object SP_PROC: TwwStoredProc
    DatabaseName = 'BaseDados'
    StoredProcName = 'CM.PCK_FB_ENCERRAFALECIDO.SP_PROCESSAR'
    ValidateWithMask = True
    Left = 894
    Top = 68
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PLISTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PCODRESULT'
        ParamType = ptOutput
        Value = 1
      end
      item
        DataType = ftString
        Name = 'PMSGRESULT'
        ParamType = ptOutput
        Value = 'Todas as pessoas da lista foram processadas com sucesso.'
      end>
  end
  object qryLista_CTRL: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select tmp.Nome,'
      '       tmp.idlista,'
      '       tmp.trgdtinclusao,'
      '       tmp.idlote,'
      '       tmp.situacao,'
      '       tmp.flgsituacao'
      '  from (select '#39'Selecionar'#39' AS Nome,'
      '               cast(null as number) AS idlista,'
      '               '#39#39' AS trgdtinclusao,'
      '               '#39#39' AS idlote,'
      '               '#39#39' as situacao,'
      '               '#39#39' AS flgsituacao'
      '          from Dual'
      '        union all'
      '        select l.Nome,'
      '               l.idlista as idlista,'
      
        '               to_char(l.trgdtinclusao, '#39'dd/mm/yyyy'#39') AS trgdtin' +
        'clusao,'
      '               to_char(l.idlote) as idlote,'
      '               Decode(l.flgSituacao, 0, '#39'Não Processado'#39', '
      '                             1, '#39'Processado'#39','
      
        '                             2, '#39'Proc. Parcialmente'#39') as situaca' +
        'o,'
      '               to_char(l.flgsituacao) as flgsituacao'
      
        '          from ENCERRAFALECIDO_LISTA l where l.flgListaDesfaz = ' +
        '0 ) tmp'
      ' order by nvl(to_date(tmp.trgdtinclusao), sysdate) desc')
    ControlType.Strings = (
      'PROCESSAR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 897
    Top = 138
  end
  object DsLista_CTRL: TwwDataSource
    DataSet = qryLista_CTRL
    Left = 984
    Top = 138
  end
  object SP_DESFAZPROC: TwwStoredProc
    DatabaseName = 'BaseDados'
    StoredProcName = 'CM.PCK_FB_ENCERRAFALECIDO.SP_DESFAZERENCERRAMENTO'
    ValidateWithMask = True
    Left = 978
    Top = 68
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PLISTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PCODRESULT'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'PMSGRESULT'
        ParamType = ptOutput
      end>
  end
  object SP_AJUSTASITUACAOLISTA: TwwStoredProc
    DatabaseName = 'BaseDados'
    StoredProcName = 'CM.PCK_FB_ENCERRAFALECIDO.SP_AJUSTASITUACAOLISTA'
    ValidateWithMask = True
    Left = 766
    Top = 76
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PLISTA'
        ParamType = ptInput
      end>
  end
end
