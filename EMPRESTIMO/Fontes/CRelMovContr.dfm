inherited cfgRelMovContr: TcfgRelMovContr
  Left = 71
  Top = 80
  Caption = 'Movimentação por Contrato'
  ClientHeight = 429
  ClientWidth = 629
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 629
    Height = 396
    object Label1: TLabel
      Left = 16
      Top = 50
      Width = 112
      Height = 13
      Caption = 'Tipo de Empréstimo'
    end
    object Label2: TLabel
      Left = 320
      Top = 50
      Width = 96
      Height = 13
      Caption = 'Tipo de Contrato'
    end
    object rgOrdenar: TRadioGroup
      Left = 16
      Top = 297
      Width = 233
      Height = 40
      Caption = ' Ordenar por: '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Contrato'
        'Nome Benef.')
      TabOrder = 6
    end
    object Panel1: TPanel
      Left = 320
      Top = 204
      Width = 289
      Height = 85
      TabOrder = 5
      object Label15: TLabel
        Left = 32
        Top = 21
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'de:  '
      end
      object Label3: TLabel
        Left = 28
        Top = 53
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'até:  '
      end
      object DBspnAnoIni: TwwDBSpinEdit
        Left = 208
        Top = 16
        Width = 65
        Height = 21
        Increment = 1
        MaxValue = 2500
        MinValue = 1850
        Value = 1980
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object cboMesIni: TComboBox
        Left = 56
        Top = 16
        Width = 153
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
      object cboMesFim: TComboBox
        Left = 56
        Top = 48
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
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
      object DBspnAnoFim: TwwDBSpinEdit
        Left = 208
        Top = 48
        Width = 65
        Height = 21
        Increment = 1
        MaxValue = 2500
        MinValue = 1850
        Value = 1980
        TabOrder = 3
        UnboundDataType = wwDefault
      end
    end
    object GroupBox1: TGroupBox
      Left = 264
      Top = 296
      Width = 345
      Height = 65
      TabOrder = 9
      object chkCorLinha: TCheckBox
        Left = 16
        Top = 38
        Width = 233
        Height = 17
        Caption = 'Imprimir linhas com cores alternadas: '
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object cboCorLinha: TfcColorCombo
        Left = 252
        Top = 36
        Width = 79
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
        Width = 312
        Height = 17
        Caption = 'Imprimir linhas separadoras'
        TabOrder = 0
      end
    end
    object DBcboTipoEmptmo: TwwDBLookupCombo
      Left = 16
      Top = 64
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
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
      OnCloseUp = DBcboTipoEmptmoCloseUp
      OnExit = DBcboTipoEmptmoExit
    end
    object DBcboTipoContrato: TwwDBLookupCombo
      Left = 320
      Top = 64
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
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
    end
    inline molContratoEmptmo: TmolContratoEmptmo
      Left = 8
      Top = 8
      Width = 609
      inherited edtNome: TEdit
        Width = 369
      end
      inherited btnBuscaContrato: TBitBtn
        Left = 552
      end
      inherited btnLimpaContrato: TBitBtn
        Left = 576
      end
    end
    object chkCentralizador: TCheckBox
      Left = 24
      Top = 348
      Width = 233
      Height = 17
      Caption = 'Exibir apenas itens centralizadores'
      TabOrder = 7
    end
    object chkTrataSaldo: TCheckBox
      Left = 24
      Top = 368
      Width = 297
      Height = 17
      Caption = 'Exibir apenas itens que afetam o Saldo Devedor'
      TabOrder = 8
    end
    inline molListaPatro: TmolListaPatro
      Left = 8
      Top = 88
      Height = 209
      TabOrder = 3
      inherited Label6: TLabel
        Width = 94
      end
      inherited lstPatro: TCheckListBox
        Height = 185
      end
      inherited btnInvertePatro: TBitBtn
        OnClick = molListaPatrobtnInvertePatroClick
      end
      inherited btnMarcaTodosPatro: TBitBtn
        OnClick = molListaPatrobtnMarcaTodosPatroClick
      end
    end
    inline molListaPlano: TmolListaPlano
      Left = 312
      Top = 88
      Height = 113
      TabOrder = 4
      inherited Label6: TLabel
        Width = 47
      end
      inherited lstPlano: TCheckListBox
        Height = 89
      end
      inherited btnInvertePlano: TBitBtn
        OnClick = molListaPlanobtnInvertePlanoClick
      end
      inherited btnMarcaTodosPlano: TBitBtn
        OnClick = molListaPlanobtnMarcaTodosPlanoClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 396
    Width = 629
    inherited tb97Fundo: TToolbar97
      Left = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
end
