inherited frmRegNIDuplicados: TfrmRegNIDuplicados
  Left = 199
  Top = 173
  Caption = 'Regulariza Lançamentos não identificados  Duplicados'
  ClientHeight = 405
  ClientWidth = 764
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 764
    Height = 366
    object pnlDadosFiltro: TPanel
      Left = 5
      Top = 5
      Width = 754
      Height = 68
      Align = alTop
      BorderStyle = bsSingle
      TabOrder = 0
      object btnSeleciona: TBitBtn
        Left = 637
        Top = 11
        Width = 97
        Height = 41
        Caption = '&Seleciona'
        TabOrder = 2
        OnClick = btnSelecionaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
          55555575555555775F55509999999901055557F55555557F75F5001111111101
          105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
          01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
          8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
          0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
          0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
          05555555575FF777755555555500055555555555557775555555}
        NumGlyphs = 2
      end
      object gbFaixaValor: TGroupBox
        Left = 351
        Top = 6
        Width = 262
        Height = 55
        Caption = 'Faixa de Valor'
        TabOrder = 1
        object lblSaldo: TLabel
          Left = 9
          Top = 17
          Width = 69
          Height = 13
          Caption = 'Faixa Inicial'
        end
        object Label1: TLabel
          Left = 135
          Top = 17
          Width = 62
          Height = 13
          Caption = 'Faixa Final'
        end
        object ednValorFim: TRealEdit
          Left = 135
          Top = 30
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 1
          WordWrap = False
          IntDigits = 17
          DecDigits = 2
          NumberFormat = fNumber
          Signal = True
        end
        object ednValorIni: TRealEdit
          Left = 9
          Top = 30
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 0
          WordWrap = False
          IntDigits = 17
          DecDigits = 2
          NumberFormat = fNumber
          Signal = True
        end
      end
      object gbBanco: TGroupBox
        Left = 3
        Top = 6
        Width = 328
        Height = 55
        TabOrder = 0
        object lblContaBanco: TLabel
          Left = 6
          Top = 15
          Width = 125
          Height = 13
          Caption = 'Conta Bancária/Caixa'
        end
        object dblcPortador: TwwDBLookupCombo
          Left = 6
          Top = 27
          Width = 307
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'DESCRICAO')
          LookupField = 'CODPORTADOR'
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
      end
    end
    object pnlRodape: TPanel
      Left = 5
      Top = 293
      Width = 754
      Height = 68
      Align = alBottom
      BorderStyle = bsSingle
      TabOrder = 1
      object gbTotais: TGroupBox
        Left = 222
        Top = 6
        Width = 316
        Height = 55
        Caption = 'Totais'
        Enabled = False
        TabOrder = 0
        object Label4: TLabel
          Left = 9
          Top = 17
          Width = 92
          Height = 13
          Caption = 'Não Identifcado'
        end
        object Label5: TLabel
          Left = 171
          Top = 17
          Width = 87
          Height = 13
          Caption = 'Não Conciliado'
        end
        object reNaoConc: TRealEdit
          Left = 171
          Top = 30
          Width = 136
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 0
          WordWrap = False
          IntDigits = 17
          DecDigits = 2
          NumberFormat = fNumber
          Signal = True
        end
        object reNaoIdent: TRealEdit
          Left = 9
          Top = 30
          Width = 136
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 1
          WordWrap = False
          IntDigits = 17
          DecDigits = 2
          NumberFormat = fNumber
          Signal = True
        end
      end
      object gbData: TGroupBox
        Left = 24
        Top = 6
        Width = 163
        Height = 55
        Caption = 'Data de Regularização'
        TabOrder = 1
        object edDataReg: TCMDateTimePicker
          Left = 22
          Top = 24
          Width = 121
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
        end
      end
    end
    object pnlGrids: TPanel
      Left = 5
      Top = 73
      Width = 754
      Height = 220
      Align = alClient
      TabOrder = 2
      object Splitter1: TSplitter
        Left = 377
        Top = 1
        Width = 3
        Height = 218
        Cursor = crHSplit
      end
      object pnlNaoIdentificados: TPanel
        Left = 1
        Top = 1
        Width = 376
        Height = 218
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object pnlContaDe: TPanel
          Left = 0
          Top = 0
          Width = 376
          Height = 34
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Não Identificados'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dbgContaDe: TwwDBGrid
          Left = 0
          Top = 34
          Width = 376
          Height = 184
          ControlType.Strings = (
            'STATUSCONCILIA;CheckBox;J;I')
          Selected.Strings = (
            'STATUSCONCILIA'#9'5'#9'Status'#9'F'
            'DATALANCFINAN'#9'10'#9'Data'#9'F'
            'ENTRADASAIDA'#9'3'#9'E/S'#9'F'
            'VALORLANCFINAN'#9'17'#9'Valor Moeda Corrente'#9'F'
            'HISTORICO'#9'60'#9'Histórico'#9'F'
            'VALOROUTRAMOEDA'#9'15'#9'Valor Outra Moeda'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsNaoIdent
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
      end
      object pnlNaoConciliados: TPanel
        Left = 380
        Top = 1
        Width = 373
        Height = 218
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnlNaoConciliados'
        TabOrder = 1
        object pnlContaPara: TPanel
          Left = 0
          Top = 0
          Width = 373
          Height = 34
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Lançamentos não Conciliados'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dbgNaoConciliados: TwwDBGrid
          Left = 0
          Top = 34
          Width = 373
          Height = 184
          ControlType.Strings = (
            'STATUSCONCILIA;CheckBox;X;N')
          Selected.Strings = (
            'STATUSCONCILIA'#9'1'#9'Status'#9'F'
            'DATALANCFINAN'#9'10'#9'Data '#9'F'
            'ENTRADASAIDA'#9'1'#9'E/S'#9'F'
            'VALORLANCFINAN'#9'10'#9'Valor Moeda Corrente'#9'F'
            'HISTORICO'#9'60'#9'Histórico'#9'F'
            'VALOROUTRAMOEDA'#9'10'#9'Valor Outra Moeda'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsNaoConc
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
      end
    end
  end
  inherited Dock971: TDock97
    Top = 366
    Width = 764
    inherited tb97Fundo: TToolbar97
      Left = 229
      DockPos = 229
      inherited sep1: TToolbarSep97
        Left = 221
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 139
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 141
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 223
      end
      object bbtnRegulariza: TBitBtn
        Left = 0
        Top = 0
        Width = 139
        Height = 33
        Cancel = True
        Caption = '&Regulariza'
        TabOrder = 2
        OnClick = bbtnRegularizaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
          00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
          00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
          F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
          F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
          F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
          FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
          0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
          0033333337FFFFFF773333333000000003333333377777777333}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 707
    Top = 307
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object cdsPortadorConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 232
    Top = 16
  end
  object cdsNaoIdent: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 176
    Top = 136
  end
  object cdsNaoConc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 528
    Top = 136
  end
  object dsNaoConc: TwwDataSource
    AutoEdit = False
    DataSet = cdsNaoConc
    Left = 528
    Top = 184
  end
  object dsNaoIdent: TwwDataSource
    AutoEdit = False
    DataSet = cdsNaoIdent
    Left = 176
    Top = 184
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'select * from movimfinanc where (1=2)')
    ClientDataSet = cdsNaoIdent
    Left = 261
    Top = 225
  end
end
