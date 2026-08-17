inherited frmRegNIDuplicadosMT: TfrmRegNIDuplicadosMT
  Left = 247
  Top = 165
  HelpContext = 90010
  Caption = 'Regulariza Lançamentos não identificados  Duplicados'
  ClientHeight = 405
  ClientWidth = 764
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 764
    Height = 366
    object pnlDadosFiltro: TPanel
      Left = 1
      Top = 1
      Width = 762
      Height = 73
      Align = alTop
      BorderStyle = bsSingle
      TabOrder = 0
      object btnSeleciona: TBitBtn
        Left = 630
        Top = 15
        Width = 114
        Height = 43
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
        Left = 340
        Top = 6
        Width = 277
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
          Left = 150
          Top = 17
          Width = 62
          Height = 13
          Caption = 'Faixa Final'
        end
        object ednValorFim: TRealEdit
          Left = 150
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
          Top = 11
          Width = 125
          Height = 13
          Caption = 'Conta Bancária/Caixa'
        end
        object dblcPortador: TwwDBLookupCombo
          Left = 6
          Top = 26
          Width = 307
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'30'#9'Descrição'#9'F')
          LookupTable = cdsPortadorConta
          LookupField = 'CODPORTADOR'
          Options = [loTitles]
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
      end
    end
    object pnlGrids: TPanel
      Left = 1
      Top = 74
      Width = 762
      Height = 291
      Align = alClient
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 377
        Top = 1
        Width = 3
        Height = 289
        Cursor = crHSplit
      end
      object pnlNaoIdentificados: TPanel
        Left = 1
        Top = 1
        Width = 376
        Height = 289
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object pnlContaDe: TPanel
          Left = 0
          Top = 0
          Width = 376
          Height = 27
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Lançamentos Não Identificados'
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
          Top = 27
          Width = 376
          Height = 262
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
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          DataSource = dsNaoIdent
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
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
        Height = 289
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnlNaoConciliados'
        TabOrder = 1
        object pnlContaPara: TPanel
          Left = 0
          Top = 0
          Width = 381
          Height = 27
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Lançamentos Não Conciliados'
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
          Top = 27
          Width = 381
          Height = 262
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
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          DataSource = dsNaoConc
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
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
          OnCalcCellColors = dbgContaDeCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = dbgContaDeTopRowChanged
          OnUpdateFooter = dbgContaDeUpdateFooter
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
        Left = 222
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
        Left = 224
        HelpContext = 90010
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
    DataSet = cdsNaoConc
    Left = 528
    Top = 184
  end
  object dsNaoIdent: TwwDataSource
    DataSet = cdsNaoIdent
    Left = 176
    Top = 184
  end
  object CmDataRegularizacao: TCmParamReport
    Caption = 'Informe a data da regularização'
    Params = <
      item
        Caption = 'Data da Regularização'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DATAREGU'
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
    ExibeMensagem = True
    Formheight = 125
    FormWidth = 400
    HelpContext = 0
    Left = 485
    Top = 237
  end
end
