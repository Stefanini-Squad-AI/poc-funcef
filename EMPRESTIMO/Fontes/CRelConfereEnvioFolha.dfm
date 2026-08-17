inherited cfgRelConfereEnvioFolha: TcfgRelConfereEnvioFolha
  Left = 94
  Top = 126
  Caption = 'Rubricas Enviadas'
  ClientHeight = 356
  ClientWidth = 625
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 625
    Height = 323
    object Label1: TLabel
      Left = 320
      Top = 50
      Width = 45
      Height = 13
      Caption = 'Rubrica'
    end
    object Label2: TLabel
      Left = 16
      Top = 10
      Width = 112
      Height = 13
      Caption = 'Tipo de Empréstimo'
    end
    object Label3: TLabel
      Left = 320
      Top = 10
      Width = 96
      Height = 13
      Caption = 'Tipo de Contrato'
    end
    object Panel1: TPanel
      Left = 320
      Top = 176
      Width = 289
      Height = 57
      TabOrder = 4
      object Label15: TLabel
        Left = 40
        Top = 10
        Width = 128
        Height = 13
        Caption = 'Mês/Ano de Cobrança'
      end
      object DBspnAno: TwwDBSpinEdit
        Left = 192
        Top = 24
        Width = 65
        Height = 21
        Increment = 1
        MaxValue = 2500
        MinValue = 1980
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object cboMes: TComboBox
        Left = 40
        Top = 24
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
    end
    object DBcboRubrica: TwwDBLookupCombo
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
        'DESCRICAO'#9'1'#9'Rubrica'#9'F')
      LookupTable = dtmLookEmptmo.qryLookRubricaNormal
      LookupField = 'IDPROVENTO'
      ParentFont = False
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
    end
    object GroupBox1: TGroupBox
      Left = 256
      Top = 240
      Width = 353
      Height = 65
      TabOrder = 5
      object chkCorLinha: TCheckBox
        Left = 16
        Top = 40
        Width = 233
        Height = 17
        Caption = 'Imprimir linhas com cores alternadas: '
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cboCorLinha: TfcColorCombo
        Left = 250
        Top = 38
        Width = 87
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
        TabOrder = 1
      end
      object chkLinhas: TCheckBox
        Left = 16
        Top = 16
        Width = 321
        Height = 17
        Caption = 'Imprimir linhas separadoras'
        TabOrder = 2
      end
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
    object DBcboTipoContrato: TwwDBLookupCombo
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
    inline molListaPatro: TmolListaPatro
      Left = 8
      Top = 48
      Height = 193
      TabOrder = 2
      inherited Label6: TLabel
        Width = 94
      end
      inherited lstPatro: TCheckListBox
        Height = 169
      end
      inherited btnInvertePatro: TBitBtn
        OnClick = molListaPatrobtnInvertePatroClick
      end
      inherited btnMarcaTodosPatro: TBitBtn
        OnClick = molListaPatrobtnMarcaTodosPatroClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 323
    Width = 625
    inherited tb97Fundo: TToolbar97
      Left = 453
      DockPos = 514
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 281
      DockPos = 342
    end
  end
end
