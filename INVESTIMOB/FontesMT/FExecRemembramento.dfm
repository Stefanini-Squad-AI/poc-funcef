inherited frmExecRemembramento: TfrmExecRemembramento
  Left = 418
  Top = 165
  HelpContext = 540074
  Caption = 'Remembramento de Imóveis'
  ClientHeight = 422
  ClientWidth = 610
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 610
    Height = 383
    inherited PagControle: TPageControl
      Width = 608
      Height = 381
      Style = tsTabs
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 600
          Caption = 'Remembramento de Imóveis [ Seleção]'
        end
        object Label3: TLabel
          Left = 476
          Top = 34
          Width = 105
          Height = 13
          Caption = 'Data da Operação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 8
          Top = 82
          Width = 122
          Height = 13
          Caption = 'Imóveis a Remembrar'
        end
        object spdSeleciona: TSpeedButton
          Left = 539
          Top = 76
          Width = 23
          Height = 22
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888006666600
            88888887788888778F88887666666666088888788888888878F887E668866666
            608887F88FFF888887F887E6FFF8666660888788777FF888878F7E66FFFF8666
            66087F887777FF88887F7E66FFFFF86666087F8877777FF8887F7E66FF8FFF86
            66087F8877F777FF887F7E66FF86FFF866087F8877F8777F887F7E66FF666FF8
            660878F87788877FF87887E6666666FF608887F88888887787F887E666666666
            6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
          OnClick = spdSelecionaClick
        end
        object spdExcluiSelecat: TSpeedButton
          Left = 562
          Top = 76
          Width = 23
          Height = 22
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888009191900
            88888887788888778F88887991919191088888788888888878F8879919191919
            108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
            19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
            19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
            190878F877787778887887917F919F71908887F88788878887F8879919191919
            1088878F88888888878888799191919108888878FF88888F7888888779999977
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
          OnClick = spdExcluiSelecatClick
        end
        object edtDataOper: TCMDateTimePicker
          Left = 476
          Top = 48
          Width = 111
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
          DisplayFormat = 'dd/mm/yyyy'
        end
        inline molImovelMestre: TmolImovelMestre
          Top = 29
          Width = 457
          inherited edtImovel: TEdit
            Width = 393
          end
          inherited btnBuscaImovel: TBitBtn
            Left = 402
            OnClick = molImovelMestrebtnBuscaImovelClick
          end
          inherited btnLimpaImovel: TBitBtn
            Left = 426
            OnClick = molImovelMestrebtnLimpaImovelClick
          end
        end
        object dbgImovelARemembrar: TwwDBGrid
          Left = 8
          Top = 97
          Width = 579
          Height = 259
          Selected.Strings = (
            'IMONOME'#9'61'#9'Nome do Imóvel'#9'F'
            'SUMVALCTB'#9'15'#9'Saldo Contábil'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = dsImovelARemembrar
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 2
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = dbgImovelARemembrarCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = dbgImovelARemembrarTopRowChanged
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 600
          Caption = 'Remembramento de Imóveis [ Bens ]'
        end
        object Label5: TLabel
          Left = 2
          Top = 256
          Width = 137
          Height = 13
          Caption = 'Observações do Evento'
        end
        object Label4: TLabel
          Left = 432
          Top = 257
          Width = 85
          Height = 13
          Caption = 'Tipo de Imóvel'
        end
        object Label1: TLabel
          Left = 2
          Top = 168
          Width = 72
          Height = 13
          Caption = 'Novo Imóvel'
        end
        object wwDBGrid2: TwwDBGrid
          Left = 2
          Top = 32
          Width = 590
          Height = 128
          Selected.Strings = (
            'NOME_IMOVEL'#9'27'#9'Imóvel'
            'DESCTIPOIMOVEL'#9'15'#9'Tipo de Imóvel'#9'F'
            'DESBEM'#9'200'#9'Bem'
            'DESCGRUPO'#9'50'#9'Grupo')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsBens
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = dbgImovelARemembrarCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = dbgImovelARemembrarTopRowChanged
        end
        object memEvento: TMemo
          Left = 2
          Top = 273
          Width = 423
          Height = 88
          MaxLength = 2000
          TabOrder = 3
        end
        object dblkTipoImovel: TwwDBLookupCombo
          Left = 432
          Top = 272
          Width = 159
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOIMOVEL'#9'60'#9'Descrição'#9'F'
            'CODTIPIMOVEL'#9'5'#9'Código'#9'F')
          LookupTable = cdsTipoImovel
          LookupField = 'CODTIPIMOVEL'
          TabOrder = 4
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object edtNomeImovel: TEdit
          Left = 2
          Top = 183
          Width = 586
          Height = 21
          TabOrder = 1
        end
        inline molLocalizacao: TmolLocalizacao
          Left = -5
          Top = 209
          Width = 605
          TabOrder = 2
          inherited label1: TLabel
            Width = 69
          end
          inherited edtLocalizacao: TEdit
            Width = 533
          end
          inherited btnBuscaLocalizacao: TBitBtn
            Left = 544
          end
          inherited btnLimpaLocalizacao: TBitBtn
            Left = 568
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 383
    Width = 610
    inherited tb97Fundo: TToolbar97
      Left = 195
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 35
    Top = 387
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object dsImovelARemembrar: TDataSource
    DataSet = cdsImovelAtivo
    Left = 69
    Top = 271
  end
  object cdsImovelAtivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 69
    Top = 288
  end
  object cdsTipoImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 517
    Top = 319
  end
  object dsTipoImovel: TDataSource
    DataSet = cdsTipoImovel
    Left = 512
    Top = 272
  end
  object cdsBens: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 277
    Top = 311
  end
  object dsBens: TDataSource
    DataSet = cdsBens
    Left = 277
    Top = 271
  end
  object cdsImovelResult: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 381
    Top = 295
  end
  object cdsBemResult: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 451
    Top = 115
  end
end
