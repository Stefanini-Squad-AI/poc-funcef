inherited cfgRelInscPend: TcfgRelInscPend
  Left = 111
  Top = 159
  Caption = 'Inscrições não Efetivadas'
  ClientHeight = 363
  ClientWidth = 625
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 625
    Height = 330
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 112
      Height = 13
      Caption = 'Tipo de Empréstimo'
    end
    object Label2: TLabel
      Left = 320
      Top = 10
      Width = 96
      Height = 13
      Caption = 'Tipo de Contrato'
    end
    object GroupBox1: TGroupBox
      Left = 256
      Top = 248
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
        TabOrder = 1
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
        TabOrder = 2
      end
      object chkLinhas: TCheckBox
        Left = 16
        Top = 16
        Width = 321
        Height = 17
        Caption = 'Imprimir linhas separadoras'
        TabOrder = 0
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
    object rdgOrdenar: TRadioGroup
      Left = 320
      Top = 184
      Width = 289
      Height = 57
      Caption = ' Ordenar por: '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Nº Inscrição'
        'Nome Titular'
        'Data Inscrição')
      TabOrder = 4
    end
    inline molListaPatro: TmolListaPatro
      Left = 8
      Top = 48
      Height = 201
      TabOrder = 2
      inherited Label6: TLabel
        Width = 86
      end
      inherited lstPatro: TCheckListBox
        Height = 177
      end
      inherited btnInvertePatro: TBitBtn
        OnClick = molListaPatrobtnInvertePatroClick
      end
      inherited btnMarcaTodosPatro: TBitBtn
        OnClick = molListaPatrobtnMarcaTodosPatroClick
      end
    end
    inline molListaPlano: TmolListaPlano
      Left = 311
      Top = 48
      Height = 129
      TabOrder = 3
      inherited Label6: TLabel
        Width = 119
      end
      inherited lstPlano: TCheckListBox
        Height = 113
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
    Top = 330
    Width = 625
    inherited tb97Fundo: TToolbar97
      Left = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
end
