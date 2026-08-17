inherited frmLancPlanAutomMT: TfrmLancPlanAutomMT
  Left = 258
  Top = 328
  Caption = 'Lançamento Automático'
  ClientHeight = 378
  ClientWidth = 604
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 604
    Height = 339
    inherited PagControle: TPageControl
      Width = 602
      Height = 337
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 594
          Caption = 'Lançamento Automático [ Período ]'
        end
        object Label3: TLabel
          Left = 21
          Top = 57
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
          Top = 57
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
        object Label14: TLabel
          Left = 318
          Top = 57
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
          Top = 57
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
        object dblkExerc: TwwDBLookupCombo
          Left = 21
          Top = 74
          Width = 89
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'PEREXERCICIO'#9'10'#9'Exercício'#9'F')
          LookupTable = cdsExercicio
          LookupField = 'PEREXERCICIO'
          Options = [loRowLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = dblkExercCloseUp
          OnExit = dblkExercExit
        end
        object dblkPeriodo: TwwDBLookupCombo
          Left = 135
          Top = 74
          Width = 156
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'PERNOME'#9'13'#9'Período'#9'F')
          LookupTable = CdsPeriodo
          LookupField = 'PERNUMERO'
          Options = [loRowLines, loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = dblkPeriodoCloseUp
        end
        object edtInicio: TCMDateTimePicker
          Left = 318
          Top = 74
          Width = 103
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
          TabOrder = 2
          UnboundDataType = wwDTEdtDate
        end
        object edtFim: TCMDateTimePicker
          Left = 456
          Top = 74
          Width = 103
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
          TabOrder = 3
          UnboundDataType = wwDTEdtDate
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 594
          Caption = 'Lançamento Automático [ Planilhas ]'
        end
        object Panel3: TPanel
          Left = 0
          Top = 279
          Width = 594
          Height = 48
          Align = alBottom
          TabOrder = 0
          object spdTodos: TSpeedButton
            Left = 224
            Top = 12
            Width = 80
            Height = 25
            Anchors = [akRight, akBottom]
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
          object spdInverter: TSpeedButton
            Left = 313
            Top = 12
            Width = 80
            Height = 25
            Anchors = [akRight, akBottom]
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
          object lblComecaCom: TLabel
            Left = 416
            Top = 3
            Width = 137
            Height = 13
            Anchors = [akRight, akBottom]
            Caption = 'Marcar Começando com'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clActiveCaption
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnMarcarFiltro: TSpeedButton
            Left = 560
            Top = 18
            Width = 20
            Height = 20
            Hint = 'Marcar com filtro'
            Anchors = [akRight, akBottom]
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
          object edtFase: TEdit
            Left = 416
            Top = 17
            Width = 25
            Height = 21
            Anchors = [akRight, akBottom]
            CharCase = ecUpperCase
            TabOrder = 0
          end
          object edComecaCom: TEdit
            Left = 440
            Top = 17
            Width = 119
            Height = 21
            Anchors = [akRight, akBottom]
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object PageCtrlDados: TPageControl
          Left = 0
          Top = 24
          Width = 594
          Height = 255
          ActivePage = tbsPlanilhas
          Align = alClient
          TabOrder = 1
          OnChange = PageCtrlDadosChange
          object tbsPlanilhas: TTabSheet
            Caption = 'Planilhas'
            object Grid: TwwDBGrid
              Left = 0
              Top = 0
              Width = 586
              Height = 227
              ControlType.Strings = (
                'SEL;CheckBox;S;N')
              Selected.Strings = (
                'SEL'#9'4'#9'Ok'
                'PANFASE'#9'5'#9'Fase'
                'PANDESCRICAO'#9'45'#9'Planilhas'
                'GERAPLANPOR'#9'21'#9'Peridiocidade')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
              Align = alClient
              DataSource = cdsLaAutomaticas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              OnCalcCellColors = GridCalcCellColors
              IndicatorColor = icBlack
              OnTopRowChanged = GridTopRowChanged
            end
          end
          object tbsContas: TTabSheet
            Caption = 'Contas Contábeis'
            ImageIndex = 1
            object wwDBGrid2: TwwDBGrid
              Left = 0
              Top = 0
              Width = 586
              Height = 227
              Selected.Strings = (
                'PANORIGEM'#9'6'#9'Ordem'
                'PLACONTA'#9'26'#9'Conta Contábil'
                'TIPOCONTA'#9'20'#9'Tipo da Conta'
                'PERCENTUAL'#9'10'#9'Percentual'
                'PANTIPOBASE'#9'6'#9'Sinal')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsContasPlan
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = True
              OnCalcCellColors = GridCalcCellColors
              OnTitleButtonClick = wwDBGrid2TitleButtonClick
              IndicatorColor = icBlack
              OnTopRowChanged = GridTopRowChanged
            end
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 2
        TabVisible = False
        object lbStatus: TfcLabel
          Left = 0
          Top = 0
          Width = 594
          Height = 24
          Align = alTop
          Caption = 'Lançamento Automático [ Resultado ] '
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
          Width = 594
          Height = 303
          ScrollBars = ssBoth
          Align = alClient
          AutoURLDetect = False
          PopupMenu = PopupMenu
          PrintJobName = 'Delphi 5'
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
            750000007B5C727466315C616E73695C616E7369637067313235325C64656666
            305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
            4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
            5C706172645C625C66305C667331345C7061720D0A7D0D0A00}
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 339
    Width = 604
    inherited tb97Fundo: TToolbar97
      Left = 187
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      3
      (
        ''
        'Items'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
  end
  object CdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 432
  end
  object cdsPlaAutomaticas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsPlaAutomaticasAfterOpen
    Left = 32
    Top = 120
  end
  object cdsLaAutomaticas: TwwDataSource
    DataSet = cdsPlaAutomaticas
    Left = 117
    Top = 119
  end
  object CdsContasPlan: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsContasPlanAfterOpen
    Left = 45
    Top = 263
  end
  object SqlContasPlan: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   PLACONTA,'
      '   PANTIPO,'
      
        '   DECODE(PANTIPO,'#39'D'#39','#39'Conta Débito'#39','#39'C'#39','#39'Conta Crédito'#39','#39'B'#39','#39'Co' +
        'nta Base'#39','#39'Conta não-definida'#39') AS TIPOCONTA,'
      '   DECODE(PANPERC,'#39#39','#39#39',PANPERC || '#39'%'#39') AS PERCENTUAL,'
      '   PANTIPOBASE,'
      '   PANORIGEM'
      'FROM'
      '   PREDETALHE'
      'WHERE'
      '   PANCODIGO = :PANCODIGO'
      'ORDER BY'
      '   PANTIPO,  PANORIGEM    '
      ' ')
    ClientDataSet = CdsContasPlan
    Left = 77
    Top = 255
  end
  object dsContasPlan: TwwDataSource
    DataSet = CdsContasPlan
    Left = 125
    Top = 255
  end
  object dlgSalvar: TSaveDialog
    DefaultExt = 'TXT'
    Filter = 'Arquivo Texto ( *.txt )|*.txt'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 513
  end
  object PopupMenu: TPopupMenu
    Left = 561
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
