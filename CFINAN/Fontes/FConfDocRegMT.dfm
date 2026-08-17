inherited frmConfDocRegMT: TfrmConfDocRegMT
  Top = 153
  HelpContext = 90048
  Caption = 'Conferência de Documentos Regularizados'
  ClientHeight = 518
  ClientWidth = 742
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 742
    Height = 479
    object Splitter1: TSplitter
      Left = 5
      Top = 285
      Width = 732
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object pnlTopo: TPanel
      Left = 5
      Top = 5
      Width = 732
      Height = 76
      Align = alTop
      TabOrder = 0
      object rgpDocumentos: TRadioGroup
        Left = 509
        Top = 8
        Width = 121
        Height = 57
        Anchors = [akTop, akRight]
        Caption = 'Documentos'
        ItemIndex = 0
        Items.Strings = (
          'Não Marcados'
          'Marcados')
        TabOrder = 2
      end
      object gpPeriodo: TGroupBox
        Left = 8
        Top = 8
        Width = 233
        Height = 57
        Caption = 'Período'
        TabOrder = 0
        OnExit = gpPeriodoExit
        object Label1: TLabel
          Left = 111
          Top = 27
          Width = 8
          Height = 13
          Caption = 'à'
        end
        object dtpDataInicial: TCMDateTimePicker
          Left = 6
          Top = 23
          Width = 101
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
        object dtpDataFinal: TCMDateTimePicker
          Left = 126
          Top = 23
          Width = 101
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
        end
      end
      object grpContaBancaria: TGroupBox
        Left = 248
        Top = 8
        Width = 257
        Height = 57
        Caption = 'Conta Bancária'
        TabOrder = 1
        object dblcContas: TwwDBLookupCombo
          Left = 10
          Top = 23
          Width = 239
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'Conta'#9'F')
          LookupTable = cdsPortadorConta
          LookupField = 'CODPORTADOR'
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object btnSeleciona: TBitBtn
        Left = 636
        Top = 19
        Width = 89
        Height = 41
        Caption = '&Seleciona'
        TabOrder = 3
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
    end
    object pnlDetalhe: TPanel
      Left = 5
      Top = 288
      Width = 732
      Height = 186
      Align = alBottom
      TabOrder = 1
      object Splitter3: TSplitter
        Left = 408
        Top = 1
        Width = 3
        Height = 184
        Cursor = crHSplit
        Align = alRight
      end
      object Panel2: TPanel
        Left = 411
        Top = 1
        Width = 320
        Height = 184
        Align = alRight
        TabOrder = 0
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 318
          Height = 24
          Align = alTop
          BevelInner = bvLowered
          BorderWidth = 1
          Caption = 'Rateio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object grdRateioDetalhe: TwwDBGrid
          Left = 1
          Top = 25
          Width = 318
          Height = 158
          Selected.Strings = (
            'NOME'#9'19'#9'Plano'#9'F'
            'RECPAG'#9'7'#9'Rec/Des'#9'F'
            'VALOR'#9'12'#9'Valor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsRateioRelacionados
          ReadOnly = True
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
      object pnlDadosDetalhe: TPanel
        Left = 1
        Top = 1
        Width = 407
        Height = 184
        Align = alClient
        TabOrder = 1
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 405
          Height = 24
          Align = alTop
          BevelInner = bvLowered
          BorderWidth = 1
          Caption = 'Relacionados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object grdDetalhe: TwwDBGrid
          Left = 1
          Top = 25
          Width = 405
          Height = 158
          Selected.Strings = (
            'DATALANCFINAN'#9'12'#9'Data'#9'F'
            'VALORLANCFINAN'#9'10'#9'Valor'#9'F'
            'DESCRICAO'#9'30'#9'Descrição'#9'F'
            'HISTORICO'#9'30'#9'Histórico'#9'F'
            'CODLANCFINANC'#9'10'#9'Lançamento'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsRelacionados
          ReadOnly = True
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
    object pnlMestre: TPanel
      Left = 5
      Top = 81
      Width = 732
      Height = 204
      Align = alClient
      TabOrder = 2
      object Splitter2: TSplitter
        Left = 408
        Top = 1
        Width = 3
        Height = 202
        Cursor = crHSplit
        Align = alRight
      end
      object pnlRateioMestre: TPanel
        Left = 411
        Top = 1
        Width = 320
        Height = 202
        Align = alRight
        TabOrder = 1
        object Panel1: TPanel
          Left = 1
          Top = 1
          Width = 318
          Height = 24
          Align = alTop
          BevelInner = bvLowered
          BorderWidth = 1
          Caption = 'Rateio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object grdRateioMestre: TwwDBGrid
          Left = 1
          Top = 25
          Width = 318
          Height = 176
          Selected.Strings = (
            'NOME'#9'19'#9'Plano'#9'F'
            'RECPAG'#9'7'#9'Rec/Des'#9'F'
            'VALOR'#9'12'#9'Valor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsRateioRegularizados
          ReadOnly = True
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
      object PnlDadosMestre: TPanel
        Left = 1
        Top = 1
        Width = 407
        Height = 202
        Align = alClient
        TabOrder = 0
        object Panel4: TPanel
          Left = 1
          Top = 1
          Width = 405
          Height = 24
          Align = alTop
          BevelInner = bvLowered
          BorderWidth = 1
          Caption = 'Regularizados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object grdMestre: TwwDBGrid
          Left = 1
          Top = 25
          Width = 405
          Height = 176
          ControlType.Strings = (
            'FLGMARCADO;CheckBox;S;N')
          Selected.Strings = (
            'FLGMARCADO'#9'2'#9'Ok'#9'F'
            'IDRELACIONANI'#9'5'#9'Grupo'#9'F'
            'DATALANCFINAN'#9'12'#9'Data'#9'F'
            'VALORLANCFINAN'#9'10'#9'Valor'#9'F'
            'DESCRICAO'#9'16'#9'Descrição'#9'F'
            'HISTORICO'#9'30'#9'Histórico'#9'F'
            'CODLANCFINANC'#9'10'#9'Lançamento'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsRegularizados
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
    Top = 479
    Width = 742
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 90048
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 475
  end
  object dsRegularizados: TwwDataSource
    DataSet = cdsRegularizados
    Left = 184
    Top = 224
  end
  object dsRateioRegularizados: TwwDataSource
    DataSet = cdsRateioRegularizados
    Left = 597
    Top = 225
  end
  object dsRelacionados: TwwDataSource
    DataSet = cdsRelacionados
    Left = 176
    Top = 416
  end
  object dsRateioRelacionados: TwwDataSource
    DataSet = cdsRateioRelacionados
    Left = 597
    Top = 417
  end
  object cdsPortadorConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 400
    Top = 8
  end
  object cdsRegularizados: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    AfterInsert = cdsRegularizadosAfterInsert
    AfterScroll = cdsRegularizadosAfterScroll
    Left = 96
    Top = 224
  end
  object cdsRateioRegularizados: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'DataSetProvider4'
    Left = 480
    Top = 224
  end
  object cdsRelacionados: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'DataSetProvider2'
    AfterScroll = cdsRelacionadosAfterScroll
    Left = 96
    Top = 416
  end
  object cdsRateioRelacionados: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'DataSetProvider3'
    Left = 480
    Top = 416
  end
end
