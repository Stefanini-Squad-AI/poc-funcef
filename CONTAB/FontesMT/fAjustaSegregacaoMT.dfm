inherited FrmAjustaSegregacaoMT: TFrmAjustaSegregacaoMT
  Left = 163
  Top = 141
  HelpContext = 10147
  Caption = 'Ajuste de planilhas divergentes'
  ClientHeight = 472
  ClientWidth = 704
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 43
    Top = 104
    Width = 69
    Height = 13
    Caption = 'Data inicial:'
  end
  object Label2: TLabel [1]
    Left = 251
    Top = 104
    Width = 60
    Height = 13
    Caption = 'Data final:'
  end
  object Label4: TLabel [2]
    Left = 251
    Top = 168
    Width = 78
    Height = 13
    Caption = 'Planilha final:'
  end
  inherited pnlFundo: TPanel
    Width = 704
    Height = 433
    inherited PagControle: TPageControl
      Width = 702
      Height = 431
      ActivePage = TabSheet1
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 694
          Caption = 'Seleção de período para ajuste'
        end
        object Panel1: TPanel
          Left = 0
          Top = 24
          Width = 694
          Height = 397
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel11: TPanel
            Left = 2
            Top = 2
            Width = 690
            Height = 393
            Align = alClient
            TabOrder = 0
            object Bevel1: TBevel
              Left = 7
              Top = 48
              Width = 677
              Height = 297
              Anchors = [akLeft, akTop, akRight, akBottom]
              Shape = bsFrame
            end
            object Label3: TLabel
              Left = 14
              Top = 60
              Width = 66
              Height = 13
              Caption = 'Data Inicial'
            end
            object Label6: TLabel
              Left = 116
              Top = 60
              Width = 63
              Height = 13
              Caption = 'Data Final:'
            end
            object Label7: TLabel
              Left = 14
              Top = 182
              Width = 274
              Height = 13
              Caption = 'Ajustar planilhas com valores divergente de até:'
            end
            object edtInicio: TCMDateTimePicker
              Left = 14
              Top = 76
              Width = 95
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
              UnboundDataType = wwDTEdtDate
            end
            object edtFim: TCMDateTimePicker
              Left = 116
              Top = 76
              Width = 95
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
              TabOrder = 1
              UnboundDataType = wwDTEdtDate
            end
            object edtValorDiverg: TDBRealEdit
              Left = 300
              Top = 178
              Width = 81
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,01')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object Panel9: TPanel
              Left = 1
              Top = 351
              Width = 688
              Height = 41
              Align = alBottom
              BevelInner = bvRaised
              BevelOuter = bvLowered
              TabOrder = 3
            end
            object Panel10: TPanel
              Left = 1
              Top = 1
              Width = 688
              Height = 41
              Align = alTop
              BevelInner = bvRaised
              BevelOuter = bvLowered
              TabOrder = 4
            end
            object rdgPlano: TRadioGroup
              Left = 17
              Top = 117
              Width = 377
              Height = 36
              Caption = ' Plano para ajuste'
              Columns = 2
              Items.Strings = (
                'Comum'
                'Administrativo')
              TabOrder = 5
            end
          end
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 694
          Caption = 'Seleção de planilhas divergentes'
        end
        object Panel2: TPanel
          Left = 0
          Top = 24
          Width = 694
          Height = 397
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel3: TPanel
            Left = 2
            Top = 351
            Width = 690
            Height = 44
            Align = alBottom
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 0
            object spdTodos: TSpeedButton
              Left = 518
              Top = 11
              Width = 81
              Height = 23
              Anchors = [akRight, akBottom]
              Caption = '&Todos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
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
              Left = 602
              Top = 11
              Width = 81
              Height = 23
              Anchors = [akRight, akBottom]
              Caption = '&Inverter'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
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
            object Shape1: TShape
              Left = 5
              Top = 7
              Width = 20
              Height = 11
              Brush.Color = 10395294
            end
            object Label5: TLabel
              Left = 30
              Top = 6
              Width = 195
              Height = 13
              Caption = 'Planilhas que não serão ajustadas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Shape2: TShape
              Left = 5
              Top = 23
              Width = 20
              Height = 11
              Brush.Color = 10526972
            end
            object Label8: TLabel
              Left = 30
              Top = 22
              Width = 188
              Height = 13
              Caption = 'Planos com divergência de saldo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object Panel4: TPanel
            Left = 2
            Top = 2
            Width = 690
            Height = 207
            Align = alTop
            TabOrder = 1
            object Panel5: TPanel
              Left = 1
              Top = 175
              Width = 688
              Height = 31
              Align = alBottom
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'Plano x Patrocinadora'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
              TabOrder = 0
            end
            object Panel6: TPanel
              Left = 1
              Top = 1
              Width = 688
              Height = 44
              Align = alTop
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'Planilhas'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
              TabOrder = 1
            end
            object GridMestre: TwwDBGrid
              Left = 1
              Top = 45
              Width = 688
              Height = 130
              ControlType.Strings = (
                'CHECADO;CheckBox;S;N')
              Selected.Strings = (
                'CHECADO'#9'6'#9'Ajusta'#9'F'
                'PLNPLANIL'#9'10'#9'Planilha'#9'T'
                'LACNUMDOC'#9'15'#9'Num.Doc.'#9'T'
                'PLNDATDIA'#9'18'#9'Data'#9'T'
                'LANDEBITO'#9'13'#9'Débito'#9'T'
                'LANCREDITO'#9'13'#9'Crédito'#9'T'
                'DIFERENCA'#9'12'#9'Saldo'#9'T')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              OnRowChanged = GridMestreRowChanged
              FixedCols = 0
              ShowHorzScrollBar = True
              EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
              Align = alClient
              DataSource = dsLancDivergMestre
              TabOrder = 2
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = True
              OnCalcCellColors = GridMestreCalcCellColors
              OnTitleButtonClick = GridMestreTitleButtonClick
              IndicatorColor = icBlack
              OnTopRowChanged = GridDetTopRowChanged
              OnFieldChanged = GridMestreFieldChanged
            end
          end
          object GridDet: TwwDBGrid
            Left = 2
            Top = 209
            Width = 690
            Height = 142
            ControlType.Strings = (
              'CHECADO;CheckBox;S;N')
            Selected.Strings = (
              'NOMEPLANO'#9'29'#9'Plano'
              'NOMEPATRO'#9'23'#9'Patrocinadora'
              'DESCRICAO'#9'25'#9'Critério de Segregação'
              'DATASEGREGACRITER'#9'10'#9'Data'#9'F'
              'DEBITO'#9'11'#9'Débito'
              'CREDITO'#9'13'#9'Crédito'
              'DIFERENCA'#9'13'#9'Saldo')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            Align = alClient
            DataSource = dsLancDivergDet
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
            TabOrder = 2
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = True
            OnCalcCellColors = GridDetCalcCellColors
            OnTitleButtonClick = GridDetTitleButtonClick
            IndicatorColor = icBlack
            OnTopRowChanged = GridDetTopRowChanged
            OnUpdateFooter = GridDetUpdateFooter
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 2
        TabVisible = False
        object fcLabel2: TfcLabel
          Left = 0
          Top = 72
          Width = 0
          Height = 0
          Align = alTop
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
        object fcLabel3: TfcLabel
          Left = 0
          Top = 0
          Width = 192
          Height = 24
          Align = alTop
          Caption = 'Iniciando processo'
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
        object Panel7: TPanel
          Left = 0
          Top = 24
          Width = 694
          Height = 48
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Erros encontrados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 0
        end
        object Panel8: TPanel
          Left = 0
          Top = 374
          Width = 694
          Height = 47
          Align = alBottom
          TabOrder = 1
          object gaProgresso: TGauge
            Left = 14
            Top = 15
            Width = 666
            Height = 20
            Anchors = [akLeft, akTop, akRight]
            ForeColor = clBlue
            Progress = 0
          end
        end
        object mmLogErros: TMemo
          Left = 0
          Top = 72
          Width = 694
          Height = 302
          Align = alClient
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 433
    Width = 704
    inherited tb97Fundo: TToolbar97
      Left = 254
      inherited sep1: TToolbarSep97
        Left = 363
      end
      inherited CMSeparaWizard2: TToolbarSep97
        Left = 83
      end
      inherited CMSeparaWizard1: TToolbarSep97
        Left = 257
      end
      inherited bbtnSair: TBitBtn
        Left = 282
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 365
      end
      inherited btnContinuar: TfcShapeBtn
        Left = 85
      end
      inherited btnConfirmar: TfcShapeBtn
        Left = 166
        Width = 91
        OnClick = btnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object SqlLancDivergDet: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   PL.PLNCODIGO,    -- FILTRO MESTRE'
      '   L.LACNUMDOC,     -- FILTRO MESTRE'
      '   --L.PLACONTA,'
      '   L.CODCENTROCUSTO,'
      '   L.UNIDNEGOC,'
      '   L.IDPLANOPREV,'
      '   L.IDPATRO,'
      '   S.DESCRICAO,'
      '   L.IDSEGREGACRITER,'
      '   L.DATASEGREGACRITER,'
      '   PC.NOME AS NOMEPLANO,'
      '   PPA.NOME AS NOMEPATRO,'
      '   NVL(SUM(DECODE(L.LACDEBCRE,'#39'D'#39',L.LACVALOR)),0) AS DEBITO,'
      '   NVL(SUM(DECODE(L.LACDEBCRE,'#39'C'#39',L.LACVALOR)),0) AS CREDITO,'
      
        '   NVL(SUM(DECODE(L.LACDEBCRE,'#39'D'#39',NVL(L.LACVALOR,0))),0) - NVL(S' +
        'UM (DECODE(L.LACDEBCRE,'#39'C'#39',NVL(L.LACVALOR,0))),0)AS DIFERENCA'
      ''
      'FROM'
      '   PESSOA PPA, PATRO  PTR, PLANPREVCONTABIL PC,'
      '   PLANILHA PL, LANCAMENTO L, SEGREGACRITER S'
      ''
      'WHERE (PPA.IDPESSOA      = PTR.IDPESSOA)'
      '  AND (PTR.IDPESSOA      = L.IDPATRO)'
      '  AND (PC.IDPLANOPREV    = L.IDPLANOPREV)'
      '  AND (PL.PLNCODIGO      = L.PLNCODIGO)'
      '  AND (L.IDSEGREGACRITER = S.IDSEGREGACRITER (+) )'
      '  AND ((L.LACNUMDOC IS NULL) OR (L.LACNUMDOC = :NUMDOC))'
      '  AND (PL.PLNCODIGO      = :PLNCODIGO)'
      '  AND (PL.PLNDATDIA BETWEEN  :INICIO AND :FIM)'
      'GROUP BY'
      '   PL.PLNCODIGO,    -- FILTRO MESTRE'
      '   L.LACNUMDOC,     -- FILTRO MESTRE'
      '   --L.PLACONTA,'
      '   L.CODCENTROCUSTO,'
      '   L.UNIDNEGOC,'
      '   L.IDPLANOPREV,'
      '   L.IDPATRO,'
      '   S.DESCRICAO,'
      '   L.IDSEGREGACRITER,'
      '   L.DATASEGREGACRITER,'
      '   PC.NOME,'
      '   PPA.NOME'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsLancDivergDet
    Left = 589
    Top = 119
  end
  object cdsLancDivergDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsLancDivergDetAfterOpen
    Left = 589
    Top = 95
  end
  object dsLancDivergDet: TwwDataSource
    DataSet = cdsLancDivergDet
    Left = 589
    Top = 151
  end
  object SqlLancDivergMestre: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      '   '#39'N'#39' AS CHECADO,'
      '   P.PLNCODIGO,'
      '   P.PLNPLANIL,'
      '   L.LACNUMDOC,'
      '   P.PLNDATDIA,'
      '   NVL(SUM(DECODE(L.LACDEBCRE,'#39'C'#39',L.LACVALOR)),0) AS LANCREDITO,'
      '   NVL(SUM(DECODE(L.LACDEBCRE,'#39'D'#39',L.LACVALOR)),0) AS LANDEBITO,'
      
        '   NVL(SUM(DECODE(L.LACDEBCRE,'#39'D'#39',L.LACVALOR)),0) - NVL(SUM(DECO' +
        'DE(L.LACDEBCRE,'#39'C'#39',L.LACVALOR)),0) AS DIFERENCA'
      ''
      ''
      'FROM'
      '   PLANILHA P,'
      '   LANCAMENTO L'
      ''
      ''
      ''
      'WHERE'
      '   (P.PLNDATDIA BETWEEN :INICIO AND :FIM)  AND'
      ''
      ''
      
        '    --  Esta qry tráz os LANCAMENTO que estão com divergências e' +
        ' compara-os com os encontrados'
      '    --na tabela PLANILHA'
      '    EXISTS (SELECT'
      '               PL.PLNPLANIL,'
      '               LC.IDPLANOPREV,'
      '               LC.IDPATRO,'
      '               LC.IDSEGREGACRITER,'
      '               LC.DATASEGREGACRITER,'
      
        '               NVL(SUM(DECODE(LC.LACDEBCRE,'#39'C'#39',LC.LACVALOR)),0) ' +
        'AS CREDITO,'
      
        '               NVL(SUM(DECODE(LC.LACDEBCRE,'#39'D'#39',LC.LACVALOR)),0) ' +
        'AS DEBITO,'
      
        '               NVL(SUM(DECODE(LC.LACDEBCRE,'#39'C'#39',LC.LACVALOR)) - S' +
        'UM(DECODE(LC.LACDEBCRE,'#39'D'#39',LC.LACVALOR)),0)AS DIFERENCA'
      ''
      '            FROM'
      '               PLANILHA PL, LANCAMENTO LC'
      '            WHERE'
      '               (PL.PLNCODIGO = LC.PLNCODIGO) AND'
      ''
      '               -- Aqui é feita a comparação'
      '               (PL.PLNCODIGO = P.PLNCODIGO) AND'
      ''
      '               (PL.PLNDATDIA BETWEEN  :INICIO AND :FIM)'
      '            GROUP BY'
      
        '                PL.PLNPLANIL, LC.IDPLANOPREV, LC.IDPATRO, LC.IDS' +
        'EGREGACRITER, LC.DATASEGREGACRITER'
      '            HAVING'
      
        '               (SUM(DECODE(LC.LACDEBCRE,'#39'C'#39',NVL(LC.LACVALOR,0),0' +
        ')) - SUM(DECODE(LC.LACDEBCRE,'#39'D'#39',NVL(LC.LACVALOR,0),0))) <> 0) A' +
        'ND'
      ''
      ''
      '   (P.PLNCODIGO = L.PLNCODIGO)'
      ''
      ''
      'GROUP BY'
      '   P.PLNCODIGO,'
      '   P.PLNPLANIL,'
      '   L.LACNUMDOC,'
      '   P.PLNDATDIA'
      ''
      'ORDER BY'
      '   P.PLNPLANIL,'
      '   L.LACNUMDOC'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsLancDivergMestre
    Left = 471
    Top = 121
  end
  object cdsLancDivergMestre: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsLancDivergMestreAfterOpen
    Left = 471
    Top = 97
  end
  object dsLancDivergMestre: TwwDataSource
    DataSet = cdsLancDivergMestre
    Left = 472
    Top = 153
  end
  object SqlSelUltConta: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   L.LACNUMLAN,'
      '   L.PLACONTA'
      ''
      'FROM'
      '   LANCAMENTO L, PLANILHA P'
      ''
      'WHERE'
      '  (L.PLNCODIGO   =  P.PLNCODIGO) AND'
      '  (L.PLNCODIGO   = :PLNCODIGO)   AND'
      '  (L.IDPATRO     = :IDPATRO)   AND'
      '  (L.IDPLANOPREV = :IDPLANO)     AND'
      '  ((L.LACNUMDOC IS NULL) OR (L.LACNUMDOC = :NUMDOC)) AND'
      '  (P.PLNDATDIA BETWEEN  :INICIO AND :FIM)'
      ''
      'ORDER BY'
      '   L.LACNUMLAN DESC'
      ' '
      ' ')
    ClientDataSet = CdsSelUltConta
    Left = 469
    Top = 223
  end
  object CdsSelUltConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 469
    Top = 207
  end
end
