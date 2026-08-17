inherited frmDesfazRegularizacao: TfrmDesfazRegularizacao
  Left = 128
  Top = 169
  Caption = 'Desfaz Regularização de Lançamentos Identificados'
  ClientHeight = 467
  ClientWidth = 764
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 764
    Height = 428
    object pnlDadosFiltro: TPanel
      Left = 1
      Top = 1
      Width = 762
      Height = 109
      Align = alTop
      BorderStyle = bsSingle
      TabOrder = 0
      object btnSeleciona: TBitBtn
        Left = 602
        Top = 67
        Width = 145
        Height = 34
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
        Left = 335
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
          OnEnter = ednValorFimEnter
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
          Top = 30
          Width = 307
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'Descrição'#9'F')
          LookupTable = cdsPortadorConta
          LookupField = 'CODPORTADOR'
          Options = [loTitles]
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
      end
      object gbData: TGroupBox
        Left = 600
        Top = 6
        Width = 147
        Height = 55
        Caption = 'Data de Regularização'
        TabOrder = 3
        object edDataReg: TCMDateTimePicker
          Left = 13
          Top = 23
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
      Left = 1
      Top = 110
      Width = 762
      Height = 317
      Align = alClient
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 377
        Top = 1
        Width = 3
        Height = 315
        Cursor = crHSplit
      end
      object pnlNaoIdentificados: TPanel
        Left = 1
        Top = 1
        Width = 376
        Height = 315
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
          Caption = 'Lançamentos Identificados'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 0
        end
        object dbgContaDe: TwwDBGrid
          Left = 0
          Top = 34
          Width = 376
          Height = 281
          ControlType.Strings = (
            'STATUSCONCILIA;CheckBox;I;J')
          Selected.Strings = (
            'STATUSCONCILIA'#9'5'#9'Status'#9'F'
            'DATACONCILIACAO'#9'11'#9'Data ~Conciliação'#9'F'
            'DATALANCFINAN'#9'11'#9'Data ~Lançamento'#9'F'
            'VALORLANCFINAN'#9'16'#9'Valor ~Moeda Corrente'#9'F'
            'DESCENTRADASAIDA'#9'12'#9'Entrada/~Saída'#9'F'
            'HISTORICO'#9'60'#9'Histórico'#9'F'
            'VALOROUTRAMOEDA'#9'15'#9'Valor ~Outra Moeda'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          DataSource = dsIdent
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = dbgContaDeCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = dbgContaDeTopRowChanged
          OnUpdateFooter = dbgContaDeUpdateFooter
        end
      end
      object pnlNaoConciliados: TPanel
        Left = 380
        Top = 1
        Width = 381
        Height = 315
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnlNaoConciliados'
        TabOrder = 1
        object pnlContaPara: TPanel
          Left = 0
          Top = 0
          Width = 381
          Height = 34
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Lançamentos Conciliados'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 0
        end
        object dbgNaoConciliados: TwwDBGrid
          Left = 0
          Top = 34
          Width = 381
          Height = 281
          ControlType.Strings = (
            'STATUSCONCILIA;CheckBox;I;X')
          Selected.Strings = (
            'STATUSCONCILIA'#9'5'#9'Status'#9'F'
            'DATALANCFINAN'#9'10'#9'Data ~Lançamento'#9'F'
            'VALORLANCFINAN'#9'17'#9'Valor ~Moeda Corrente'#9'F'
            'DESCENTRADASAIDA'#9'12'#9'Entrada/~Saída'#9'F'
            'HISTORICO'#9'60'#9'Histórico'#9'F'
            'VALOROUTRAMOEDA'#9'15'#9'Valor ~Outra Moeda'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          DataSource = dsConc
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = dbgContaDeCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = dbgContaDeTopRowChanged
          OnUpdateFooter = dbgContaDeUpdateFooter
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 428
    Width = 764
    inherited tb97Fundo: TToolbar97
      Left = 439
      DockPos = 439
      inherited sep1: TToolbarSep97
        Left = 236
      end
      inherited bbtnSair: TBitBtn
        Left = 155
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 238
      end
      object bbtnDesfazRegulariza: TBitBtn
        Left = 0
        Top = 0
        Width = 155
        Height = 33
        Cancel = True
        Caption = '&Desfaz Regularização'
        TabOrder = 2
        OnClick = bbtnDesfazRegularizaClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888C888888888888888CC888888888888CCCCC8888888888CCCCCCC88
          988888CCCCCCC88899888CCC88CC888889988CC888C8888889988CC888888988
          89988CC888889988999888CC888999999988888C889999999888888888899999
          8888888888889988888888888888898888888888888888888888}
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object dsIdent: TwwDataSource
    DataSet = cdsIdent
    Left = 88
    Top = 256
  end
  object cdsIdent: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 40
    Top = 256
  end
  object cdsPortadorConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 232
    Top = 16
  end
  object dsConc: TwwDataSource
    DataSet = cdsConc
    Left = 520
    Top = 272
  end
  object cdsConc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 520
    Top = 224
  end
end
