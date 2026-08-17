inherited cfgRelItensGeradosTipoContr: TcfgRelItensGeradosTipoContr
  Left = 66
  Top = 93
  Caption = 'Itens Gerados por Tipo de Contrato (Sintético)'
  ClientHeight = 379
  ClientWidth = 626
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 626
    Height = 346
    object Label2: TLabel
      Left = 320
      Top = 10
      Width = 96
      Height = 13
      Caption = 'Tipo de Contrato'
    end
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 112
      Height = 13
      Caption = 'Tipo de Empréstimo'
    end
    object Label7: TLabel
      Left = 320
      Top = 218
      Width = 41
      Height = 13
      Caption = 'Evento'
    end
    object Label8: TLabel
      Left = 44
      Top = 233
      Width = 194
      Height = 13
      Caption = 'que não abatem do saldo devedor'
    end
    object DBcboTipoContr: TwwDBLookupCombo
      Left = 320
      Top = 24
      Width = 289
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TCEDESCRICAO'#9'60'#9'TCEDESCRICAO'#9'F')
      LookupTable = dtmLookEmptmo.qryLookTipoContr
      LookupField = 'IDTIPOCONTREMPTMO'
      DropDownWidth = 8
      Enabled = False
      ParentFont = False
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
    end
    object DBcboTipoEmptmo: TwwDBLookupCombo
      Left = 16
      Top = 24
      Width = 289
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOEMPTMO'#9'30'#9'Tipo de Empréstimo'#9'F')
      LookupTable = dtmLookEmptmo.qryLookTipoEmptmo
      LookupField = 'IDTIPOEMPTMO'
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
      OnCloseUp = DBcboTipoEmptmoCloseUp
      OnExit = DBcboTipoEmptmoExit
    end
    object GroupBox2: TGroupBox
      Left = 272
      Top = 264
      Width = 337
      Height = 65
      TabOrder = 8
      object chkCorLinha: TCheckBox
        Left = 16
        Top = 40
        Width = 233
        Height = 17
        Caption = 'Imprimir linhas com cores alternadas: '
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object cboCorLinha: TfcColorCombo
        Left = 248
        Top = 38
        Width = 81
        Height = 21
        AlignmentVertical = fcavCenter
        AutoSelect = False
        ColorDialogOptions = []
        ColorListOptions.ColorWidth = 119
        ColorListOptions.Font.Charset = DEFAULT_CHARSET
        ColorListOptions.Font.Color = clWindowText
        ColorListOptions.Font.Height = -11
        ColorListOptions.Font.Name = 'MS Sans Serif'
        ColorListOptions.Font.Style = []
        ColorListOptions.GreyScaleIncrement = 1
        ColorListOptions.Options = [ccoShowCustomColors]
        CustomColors.Strings = (
          'ColorA=FFFFFF'
          'ColorC=00C0FFFF'
          'ColorD=00C6F9CC'
          'ColorE=00F3E6CD'
          'ColorF=00A0A0A0'
          'ColorG=00BEBEBE'
          'ColorH=00D2D2D2'
          'ColorI=00E3E3E3')
        DropDownCount = 8
        DropDownWidth = 8
        ReadOnly = False
        ShowMatchText = False
        SelectedColor = clWhite
        TabOrder = 2
      end
      object chkLinhas: TCheckBox
        Left = 16
        Top = 16
        Width = 299
        Height = 17
        Caption = 'Imprimir linhas separadoras'
        TabOrder = 0
      end
    end
    object Panel5: TPanel
      Left = 16
      Top = 256
      Width = 241
      Height = 73
      TabOrder = 7
      object Label4: TLabel
        Left = 16
        Top = 10
        Width = 147
        Height = 13
        Caption = 'Mês/Ano de Competência'
      end
      object chkCompetencia: TCheckBox
        Left = 24
        Top = 48
        Width = 105
        Height = 17
        Caption = 'Aplicar filtro'
        TabOrder = 2
      end
      object DBspnAno: TwwDBSpinEdit
        Left = 160
        Top = 24
        Width = 65
        Height = 21
        Increment = 1
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object cboMes: TComboBox
        Left = 16
        Top = 24
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
    end
    inline molListaPatro: TmolListaPatro
      Left = 8
      Top = 48
      Width = 305
      Height = 169
      TabOrder = 2
      inherited Label6: TLabel
        Width = 86
      end
      inherited lstPatro: TCheckListBox
        Height = 145
      end
      inherited btnInvertePatro: TBitBtn
        OnClick = molListaPatrobtnInvertePatroClick
      end
      inherited btnMarcaTodosPatro: TBitBtn
        OnClick = molListaPatrobtnMarcaTodosPatroClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 320
      Top = 164
      Width = 289
      Height = 45
      Caption = ' Período de Datas (Previstas) '
      TabOrder = 4
      object Label5: TLabel
        Left = 8
        Top = 20
        Width = 27
        Height = 13
        Caption = 'de:  '
      end
      object Label6: TLabel
        Left = 150
        Top = 20
        Width = 27
        Height = 13
        Caption = 'até: '
      end
      object edtDataIni: TwwDBDateTimePicker
        Left = 32
        Top = 16
        Width = 97
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonWidth = 20
        ButtonGlyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
          7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
          7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
          7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
        ShowButton = True
        TabOrder = 0
        UnboundDataType = wwDTEdtDate
        DisplayFormat = 'dd/mm/yyyy'
      end
      object edtDataFim: TwwDBDateTimePicker
        Left = 176
        Top = 16
        Width = 97
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonWidth = 20
        ButtonGlyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
          7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
          7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
          7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
        ShowButton = True
        TabOrder = 1
        UnboundDataType = wwDTEdtDate
        DisplayFormat = 'dd/mm/yyyy'
      end
    end
    object cboEvento: TComboBox
      Left = 320
      Top = 232
      Width = 265
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      Items.Strings = (
        'Concessão / Renovação'
        'Prestação'
        'Amortização / Refinanciamento'
        'Quitação'
        'Encargos'
        'Atualização Diária'
        'CARGA'
        'Ajustes (a Pagar / Receber)'
        'Ajustes de Saldo')
    end
    object btnLimpaContrato: TBitBtn
      Left = 584
      Top = 232
      Width = 23
      Height = 21
      Hint = 'Limpa a seleção de Contrato'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnLimpaContratoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888FF8888888888888008888888888888F77F8888888888800F08888
        8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
        88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
        888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
        0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
        03088878F88878F878788887F8888090B03088878F888787878788887888880B
        0B038888788888787878888888888880B0B38888888888878788888888888888
        0BBB88888888888878F888888888888880BB8888888888888788}
      NumGlyphs = 2
    end
    inline molListaPlano: TmolListaPlanoContab
      Left = 312
      Top = 48
      Height = 113
      TabOrder = 3
      inherited Label6: TLabel
        Width = 117
      end
      inherited lstPlano: TCheckListBox
        Height = 97
      end
      inherited btnInvertePlano: TBitBtn
        OnClick = molListaPlanobtnInvertePlanoClick
      end
      inherited btnMarcaTodosPlano: TBitBtn
        OnClick = molListaPlanobtnMarcaTodosPlanoClick
      end
    end
    object chkPrestacaoSuspensa: TCheckBox
      Left = 24
      Top = 216
      Width = 281
      Height = 17
      Caption = 'Não exibir prestações suspensas'
      Checked = True
      State = cbChecked
      TabOrder = 9
    end
  end
  inherited Dock971: TDock97
    Top = 346
    Width = 626
    inherited tb97Fundo: TToolbar97
      Left = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
end
