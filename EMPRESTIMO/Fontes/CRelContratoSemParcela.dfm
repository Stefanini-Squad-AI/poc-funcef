inherited cfgRelContratoSemParcela: TcfgRelContratoSemParcela
  Left = 103
  Top = 70
  Caption = 'Contratos Sem Parcelas Geradas'
  ClientHeight = 419
  ClientWidth = 623
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 623
    Height = 386
    object Label2: TLabel
      Left = 320
      Top = 50
      Width = 96
      Height = 13
      Caption = 'Tipo de Contrato'
    end
    object Label1: TLabel
      Left = 16
      Top = 50
      Width = 112
      Height = 13
      Caption = 'Tipo de Empréstimo'
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
    end
    object GroupBox2: TGroupBox
      Left = 256
      Top = 304
      Width = 353
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
    inline molListaPatro: TmolListaPatro
      Left = 8
      Top = 88
      Height = 161
      TabOrder = 3
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
    inline molListaPlano: TmolListaPlano
      Left = 312
      Top = 88
      Width = 302
      Height = 105
      TabOrder = 4
      inherited Label6: TLabel
        Width = 119
      end
      inherited lstPlano: TCheckListBox
        Height = 81
      end
      inherited btnInvertePlano: TBitBtn
        OnClick = molListaPlanobtnInvertePlanoClick
      end
      inherited btnMarcaTodosPlano: TBitBtn
        OnClick = molListaPlanobtnMarcaTodosPlanoClick
      end
    end
    object rdgOrdenacao: TRadioGroup
      Left = 16
      Top = 304
      Width = 225
      Height = 65
      Caption = ' Ordenar por: '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Matrícula'
        'Contrato'
        'Nome')
      TabOrder = 7
    end
    object Panel1: TPanel
      Left = 320
      Top = 192
      Width = 289
      Height = 57
      TabOrder = 5
      object Label15: TLabel
        Left = 40
        Top = 10
        Width = 135
        Height = 13
        Caption = 'Competência (mês/ano)'
      end
      object DBspnAno: TwwDBSpinEdit
        Left = 192
        Top = 24
        Width = 65
        Height = 21
        Increment = 1
        MaxValue = 2500
        MinValue = 1850
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
    object GroupBox1: TGroupBox
      Left = 16
      Top = 256
      Width = 593
      Height = 41
      TabOrder = 6
      object chkEncerrado: TCheckBox
        Left = 16
        Top = 16
        Width = 217
        Height = 17
        Caption = 'NÃO exibir Contratos encerrados'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chkEmQuitacao: TCheckBox
        Left = 296
        Top = 16
        Width = 217
        Height = 17
        Caption = 'NÃO exibir Contratos em quitação'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 386
    Width = 623
    inherited tb97Fundo: TToolbar97
      Left = 451
      DockPos = 514
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 279
      DockPos = 342
    end
  end
  object qryTipoContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOCONTREMPTMO, TCEDESCRICAO'
      'FROM'
      '   TIPOCONTREMPTMO'
      'WHERE'
      '       ( IDTIPOEMPTMO =:PIDTIPOEMPTMO )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (IDTIPOCONTREMPTMO = :' +
        'PIDTIPOCONTREMPTMO) )'
      'ORDER BY'
      '   TCEDESCRICAO')
    ValidateWithMask = True
    Left = 448
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptUnknown
      end>
    object qryTipoContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOCONTREMPTMO'
    end
    object qryTipoContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEDESCRICAO'
      Size = 60
    end
  end
end
