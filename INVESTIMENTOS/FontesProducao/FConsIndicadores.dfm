inherited frmConsIndicadores: TfrmConsIndicadores
  Left = 149
  Top = 89
  HelpContext = 790574
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta de Indicadores por Período'
  ClientHeight = 437
  ClientWidth = 572
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 503
    Top = 29
    Width = 45
    Height = 13
    Caption = 'Carteira'
  end
  inherited pnlFundo: TPanel
    Width = 572
    Height = 398
    object pnlCombos: TPanel
      Left = 1
      Top = 1
      Width = 570
      Height = 92
      Align = alTop
      TabOrder = 0
      object lblIndicador: TLabel
        Left = 165
        Top = 4
        Width = 54
        Height = 13
        Caption = 'Indicador'
      end
      object Label4: TLabel
        Left = 495
        Top = 4
        Width = 62
        Height = 13
        Caption = 'Percentual'
      end
      object Label7: TLabel
        Left = 16
        Top = 5
        Width = 101
        Height = 13
        Caption = 'Tipo de Indicador'
      end
      object lblFundos: TLabel
        Left = 15
        Top = 45
        Width = 36
        Height = 13
        Caption = 'Fundo'
        Visible = False
      end
      object dblConsMoeda: TwwDBLookupCombo
        Left = 165
        Top = 19
        Width = 318
        Height = 21
        Hint = 'Descrição da Moeda'
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOEDESC'#9'20'#9'Moeda'#9'F'
          'CODTRATAIND'#9'5'#9'Tratamento'#9'F')
        LookupTable = qryConsMoeda
        LookupField = 'MOECODIGO'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnChange = dblConsMoedaChange
      end
      object spePercentual: TSpinEdit
        Left = 496
        Top = 18
        Width = 49
        Height = 22
        Hint = 'Percentual sobre a Moeda'
        MaxValue = 0
        MinValue = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Value = 100
      end
      object cmbTipoIndicador: TComboBox
        Left = 15
        Top = 19
        Width = 138
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = cmbTipoIndicadorChange
        Items.Strings = (
          'MOEDA'
          'FUNDO')
      end
      object grbPeriodo: TGroupBox
        Tag = 1
        Left = 312
        Top = 46
        Width = 233
        Height = 41
        Caption = 'Período'
        TabOrder = 4
        object Label5: TLabel
          Left = 112
          Top = 22
          Width = 8
          Height = 13
          Caption = 'a'
        end
        object edDataFim: TCMDateTimePicker
          Left = 128
          Top = 14
          Width = 98
          Height = 21
          Hint = 'Data Final '
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
          TabOrder = 1
          OnExit = edDataFimExit
        end
        object edDataIni: TCMDateTimePicker
          Left = 8
          Top = 14
          Width = 98
          Height = 21
          Hint = 'Data Inicial'
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
          TabOrder = 0
          OnExit = edDataIniExit
        end
      end
      object dblConsFundos: TwwDBLookupCombo
        Left = 15
        Top = 60
        Width = 290
        Height = 21
        Hint = 'Descrição da Moeda'
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'60'#9'Fundo'#9'F')
        LookupTable = qryConsFundos
        LookupField = 'IDFUNDOINVEST'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Visible = False
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
    end
    object pnlLancamentos: TPanel
      Left = 1
      Top = 151
      Width = 570
      Height = 246
      Align = alBottom
      TabOrder = 2
      object dbgMemoria: TDBGrid
        Left = 1
        Top = 1
        Width = 568
        Height = 244
        Align = alClient
        DataSource = DmRelatorios.dsMemoria
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'DATA'
            Title.Caption = 'Data'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COTVALOR'
            Title.Caption = 'Valor'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FATOR'
            Title.Caption = 'Fator'
            Width = 114
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FATACU'
            Title.Caption = 'Fator Acumulado'
            Width = 119
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VARIACAO'
            Title.Caption = 'Variação Diária'
            Width = 116
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TAXA'
            Title.Caption = 'Taxa'
            Width = 96
            Visible = True
          end>
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 93
      Width = 570
      Height = 58
      Align = alClient
      TabOrder = 1
      object lblVariacao: TLabel
        Left = 7
        Top = 19
        Width = 118
        Height = 13
        Caption = 'Variação no Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblVarIndicativo: TLabel
        Left = 232
        Top = 19
        Width = 54
        Height = 13
        Caption = 'Indicador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblPerSInd: TLabel
        Left = 400
        Top = 13
        Width = 81
        Height = 24
        AutoSize = False
        Caption = 'Percentual s/ Indicador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        WordWrap = True
      end
      object pnlVariacao: TPanel
        Tag = 1
        Left = 127
        Top = 14
        Width = 97
        Height = 25
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        PopupMenu = pmnuCopiar
        TabOrder = 0
        OnContextPopup = pnlVariacaoContextPopup
      end
      object pnlCDI: TPanel
        Tag = 2
        Left = 289
        Top = 14
        Width = 97
        Height = 25
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        PopupMenu = pmnuCopiar
        TabOrder = 1
        Visible = False
        OnContextPopup = pnlVariacaoContextPopup
      end
      object pnlPerSInd: TPanel
        Tag = 3
        Left = 484
        Top = 14
        Width = 70
        Height = 25
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        PopupMenu = pmnuCopiar
        TabOrder = 2
        Visible = False
        OnContextPopup = pnlVariacaoContextPopup
      end
    end
  end
  inherited Dock971: TDock97
    Top = 398
    Width = 572
    inherited tb97Fundo: TToolbar97
      Left = 400
      DockPos = 558
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 147
      DockPos = 304
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 165
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
      object bt_Imprime: TBitBtn
        Left = 168
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = bt_ImprimeClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
    object edtValor: TEdit
      Left = 16
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 2
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 5
    Top = 365
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryConsMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT MO.MOEDESC, MO.MOECODIGO, TI.CODTRATAIND'
      'FROM MOEDA MO, TRATAINDICE TI'
      'WHERE MO.MOECODIGO = TI.MOECODIGO'
      'ORDER BY MOEDESC'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 442
    Top = 15
    object qryConsMoedaMOEDESC: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Origin = 'BASEDADOS.MOEDA.MOEDESC'
    end
    object qryConsMoedaCODTRATAIND: TStringField
      DisplayLabel = 'Tratamento'
      DisplayWidth = 5
      FieldName = 'CODTRATAIND'
      Origin = 'BASEDADOS.TRATAINDICE.CODTRATAIND'
      Size = 5
    end
    object qryConsMoedaMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.MOEDA.MOECODIGO'
      Visible = False
    end
  end
  object qryConsFundos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT FUN.DESCFUNDOINVEST, FUN.IDFUNDOINVEST, TFI.IDTI' +
        'POFUNDOINVEST'
      'FROM FUNDOINVEST FUN, TIPOFUNDOINVEST TFI'
      'WHERE FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST AND'
      
        '      (((:IDTIPOINVEST <> 0) AND (TFI.IDTIPOINVEST = :IDTIPOINVE' +
        'ST)) OR'
      '        (:IDTIPOINVEST = 0))'
      'ORDER BY IDTIPOFUNDOINVEST, DESCFUNDOINVEST'
      '')
    ValidateWithMask = True
    Left = 264
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object qryConsFundosDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo'
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object qryConsFundosIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
  end
  object pmnuCopiar: TPopupMenu
    Left = 21
    Top = 365
    object Copiar1: TMenuItem
      Caption = 'Copiar'
      OnClick = Copiar1Click
    end
  end
end
