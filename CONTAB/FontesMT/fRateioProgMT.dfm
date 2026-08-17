inherited frmRateioProgMT: TfrmRateioProgMT
  Left = 280
  Top = 165
  HelpContext = 10122
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Rateio por Programa'
  ClientHeight = 471
  ClientWidth = 612
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 612
    Height = 432
    inherited PagControle: TPageControl
      Width = 610
      Height = 430
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 602
          Caption = 'Rateio por Programa [ seleção ]'
        end
        object Label3: TLabel
          Left = 21
          Top = 58
          Width = 55
          Height = 13
          Caption = 'Exercício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 134
          Top = 58
          Width = 46
          Height = 13
          Caption = 'Período'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 320
          Top = 58
          Width = 65
          Height = 13
          Caption = 'Data Início'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 456
          Top = 58
          Width = 51
          Height = 13
          Caption = 'Data Fim'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPPPCentroCusto: TLabel
          Left = 43
          Top = 182
          Width = 476
          Height = 13
          Caption = 
            'Ou, utilizar um único centro de custos para realizar todos os la' +
            'nçamentos contábeis'
        end
        object dblkExercicio: TwwDBLookupCombo
          Left = 20
          Top = 74
          Width = 93
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'PEREXERCICIO'#9'10'#9'Exercício')
          DataField = 'PEREXERCI'
          LookupTable = cdsExercicio
          LookupField = 'PEREXERCICIO'
          Style = csDropDownList
          DropDownWidth = 8
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = dblkExercicioCloseUp
          OnExit = dblkExercicioExit
        end
        object dblkPeriodo: TwwDBLookupCombo
          Left = 134
          Top = 74
          Width = 157
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'PERNOME'#9'25'#9'Nome')
          DataField = 'PEREXERCI'
          LookupTable = cdsPeriodo
          LookupField = 'PERNUMERO'
          Style = csDropDownList
          DropDownWidth = 8
          Enabled = False
          ParentFont = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = dblkPeriodoCloseUp
        end
        object edDataIni: TCMDateTimePicker
          Left = 318
          Top = 74
          Width = 106
          Height = 21
          Hint = 
            'Esta data será considerada apenas no processo de planilhas com m' +
            'arcação diária.'
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
          ParentShowHint = False
          ShowHint = True
          ShowButton = True
          TabOrder = 2
        end
        object edDataFim: TCMDateTimePicker
          Left = 454
          Top = 74
          Width = 106
          Height = 21
          Hint = 
            'Data fim do processo de planilhas com marcação diária e data de ' +
            'processamento para planilhas com marcação mensal'
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
          ParentShowHint = False
          ShowHint = True
          ShowButton = True
          TabOrder = 3
        end
        object chkAssociaCentroCusto: TCheckBox
          Left = 24
          Top = 113
          Width = 425
          Height = 16
          Caption = 
            'Associa centros de custos não relacionados nas contas de destino' +
            '.'
          TabOrder = 4
        end
        object ChkExcluiPlanilha: TCheckBox
          Left = 24
          Top = 241
          Width = 425
          Height = 16
          Caption = 'Refaz planilhas contábeis'
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
        object StaticText1: TStaticText
          Left = 45
          Top = 256
          Width = 516
          Height = 44
          AutoSize = False
          BorderStyle = sbsSunken
          Caption = 
            'Atenção! Com a marcação deste parâmetro as planilhas serão refei' +
            'tas. Caso desmarcado, apenas lançamentos em contas ou datas nova' +
            's serão realizados, ou seja, a planilha anterior não será excluí' +
            'da.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
        end
        object StaticText2: TStaticText
          Left = 44
          Top = 128
          Width = 517
          Height = 43
          AutoSize = False
          BorderStyle = sbsSunken
          Caption = 
            'Atenção! A marcação deste parâmetro registrará diversos relacion' +
            'amentos de centros de custos nas contas contábeis de destino. Es' +
            'teja certo de que os módulos de origem não utilizem esta paramet' +
            'rização, ex: Folha de Pagamento.'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 8
        end
        object dblkCCusto: TwwDBLookupCombo
          Left = 43
          Top = 196
          Width = 518
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Descrição'#9'F'
            'CODEXTERNO'#9'10'#9'Código'#9'F')
          DataField = 'CODCENTROCUSTO'
          LookupTable = CdsCentroCusto
          LookupField = 'CODCENTROCUSTO'
          DropDownWidth = 350
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object chkIgnoraSegrega: TCheckBox
          Left = 24
          Top = 329
          Width = 425
          Height = 16
          Caption = 'Ignorar Lançamentos Rateados na Origem'
          Enabled = False
          TabOrder = 9
          OnExit = chkIgnoraSegregaExit
        end
        object StaticText3: TStaticText
          Left = 45
          Top = 344
          Width = 516
          Height = 44
          AutoSize = False
          BorderStyle = sbsSunken
          Caption = 
            'Atenção! Com a marção desta Planilha os lançamentos contábeis se' +
            'gregados na origem serão desconsiderados. Esta opção somente ser' +
            'á válida caso seja executada uma planilha para o plano de Operaç' +
            'ões Comuns.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 428
          Caption = 'Rateio por Programa [ seleção - planilhas ]'
        end
        object ListView: TListView
          Left = 0
          Top = 24
          Width = 602
          Height = 357
          Align = alClient
          Checkboxes = True
          Columns = <
            item
              Caption = 'Descrição'
              Width = 360
            end
            item
              Caption = 'PanCodigo'
              Width = 1
            end
            item
              Caption = 'Fase'
              Width = 55
            end
            item
              Caption = 'Conta Base'
              Width = 170
            end>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          ParentFont = False
          SortType = stText
          TabOrder = 0
          ViewStyle = vsReport
        end
        object Panel1: TPanel
          Left = 0
          Top = 381
          Width = 602
          Height = 39
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object Panel2: TPanel
            Left = 248
            Top = 0
            Width = 346
            Height = 39
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object btnMarcarFiltro: TSpeedButton
              Left = 241
              Top = 10
              Width = 97
              Height = 23
              Caption = 'Marcar Fase'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clActiveCaption
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000
                000FFFFFFFF88888888FFFFFFFF07797770FFFFFFFF8FF7FFF8FFFFFF0007999
                770FFFFFF888F777FF8FFFFFF0709979970FFFFFF8F877F77F8FFFF000709777
                990FFFF888F87FFF778FFFF070907777799FFFF8F878FFFFF77FF00070900000
                0099F888F87888888877F070907777799FFFF8F878FFFFF77FFFF07090000000
                99FFF8F87888888877FFF0907777799FFFFFF878FFFFF77FFFFFF09000000099
                FFFFF87888888877FFFFF07777799FFFFFFFF8FFFFF77FFFFFFFF000000099FF
                FFFFF888888877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              NumGlyphs = 2
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btnMarcarFiltroClick
            end
            object spdInverter: TSpeedButton
              Left = 90
              Top = 8
              Width = 81
              Height = 23
              Caption = '&Inverter'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clActiveCaption
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFF88888888FFFFFFFF0777
                7770FFFFFFFF8FFFFFF8FFF000FF07777770FFF788FF8FFFFFF8FFF0FFFF0777
                7770FFF8FFFF8FFFFFF8FF000FFF07777770FF778FFF8FFFFFF8FFF0FFFF0777
                7770FFF8FFFF8FFFFFF8FFFFFFFF00000000FFFFFFFF8888888800000000FFFF
                FFFF88888888FFFFFFFF07797770FFFF0FFF8FF7FFF8FFFF8FFF07999770FFF0
                00FF8F777FF8FFF877FF09979970FFFF0FFF877F77F8FFFF8FFF09777990FF00
                0FFF87FFF778FF887FFF07777799FFFFFFFF8FFFFF77FFFFFFFF000000099FFF
                FFFF888888877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              NumGlyphs = 2
              ParentFont = False
              OnClick = spdInverterClick
            end
            object spdTodos: TSpeedButton
              Left = 6
              Top = 8
              Width = 81
              Height = 23
              Caption = '&Todos'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clActiveCaption
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000
                000FFFFFFFF88888888FFFFFFFF07797770FFFFFFFF8FF7FFF8FFFFFF0007999
                770FFFFFF888F777FF8FFFFFF0709979970FFFFFF8F877F77F8FFFF000709777
                990FFFF888F87FFF778FFFF070907777799FFFF8F878FFFFF77FF00070900000
                0099F888F87888888877F070907777799FFFF8F878FFFFF77FFFF07090000000
                99FFF8F87888888877FFF0907777799FFFFFF878FFFFF77FFFFFF09000000099
                FFFFF87888888877FFFFF07777799FFFFFFFF8FFFFF77FFFFFFFF000000099FF
                FFFFF888888877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              NumGlyphs = 2
              ParentFont = False
              OnClick = spdTodosClick
            end
            object edtFase: TEdit
              Left = 200
              Top = 10
              Width = 41
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 0
            end
          end
        end
      end
      object TabSheet2: TTabSheet
        ImageIndex = 2
        TabVisible = False
        object fcLabel2: TfcLabel
          Left = 0
          Top = 0
          Width = 602
          Height = 24
          Align = alTop
          Caption = 'Rateio por Programa [ resultado ]'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
        end
        object meErros: TwwDBRichEdit
          Left = 0
          Top = 24
          Width = 602
          Height = 396
          Align = alClient
          AutoURLDetect = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          PopupMenu = PopupMenu1
          PrintJobName = 'Delphi 5'
          ReadOnly = True
          TabOrder = 0
          EditorCaption = 'Edit Rich Text'
          EditorPosition.Left = 0
          EditorPosition.Top = 0
          EditorPosition.Width = 0
          EditorPosition.Height = 0
          MeasurementUnits = muInches
          PrintMargins.Top = 1
          PrintMargins.Bottom = 1
          PrintMargins.Left = 1
          PrintMargins.Right = 1
          RichEditVersion = 2
          Data = {
            730000007B5C727466315C616E73695C616E7369637067313235325C64656666
            305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
            4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
            5C706172645C66305C667331345C7061720D0A7D0D0A00}
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 432
    Width = 612
    inherited tb97Fundo: TToolbar97
      Left = 172
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 219
    Top = 65499
    TargetsData = (
      1
      2
      (
        ''
        'Items'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 341
    Top = 65535
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 365
  end
  object CdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 394
  end
  object CdsPlanilhas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
  end
  object dlgSalvar: TSaveDialog
    DefaultExt = 'TXT'
    Filter = 'Arquivo Texto ( *.txt )|*.txt'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 481
  end
  object PopupMenu1: TPopupMenu
    Left = 537
    Top = 3
    object mnuSalvar: TMenuItem
      Caption = 'Salvar'
      OnClick = mnuSalvarClick
    end
    object mnuImprimir: TMenuItem
      Caption = 'Imprimir'
      OnClick = mnuImprimirClick
    end
  end
end
