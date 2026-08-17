inherited cfgRelConfereParcela: TcfgRelConfereParcela
  Left = 124
  Top = 77
  Caption = 'Conferência do Valor das Parcelas Geradas'
  ClientHeight = 411
  ClientWidth = 625
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 625
    Height = 378
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
    object Label3: TLabel
      Left = 232
      Top = 282
      Width = 22
      Height = 16
      Caption = ' % '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 284
      Width = 160
      Height = 13
      Caption = 'Diferença máxima admitida: '
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
    object Panel1: TPanel
      Left = 320
      Top = 232
      Width = 289
      Height = 57
      TabOrder = 8
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
      Left = 256
      Top = 296
      Width = 353
      Height = 65
      TabOrder = 10
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
      Width = 305
      Height = 129
      TabOrder = 3
      inherited Label6: TLabel
        Width = 86
      end
      inherited lstPatro: TCheckListBox
        Height = 113
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
      Height = 129
      TabOrder = 4
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
    object DBedtDiferenca: TDBRealEdit
      Left = 176
      Top = 280
      Width = 57
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      TabOrder = 7
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object rdgOrdenacao: TRadioGroup
      Left = 16
      Top = 312
      Width = 225
      Height = 49
      Caption = ' Ordenar por: '
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Nº Contrato'
        'Matrícula'
        'Nome'
        '%')
      TabOrder = 9
    end
    object chkCOMAmortizacao: TCheckBox
      Left = 24
      Top = 232
      Width = 273
      Height = 17
      Caption = 'Exibir apenas Contratos COM Amortização'
      TabOrder = 5
    end
    object chkSEMAmortizacao: TCheckBox
      Left = 24
      Top = 256
      Width = 273
      Height = 17
      Caption = 'Exibir apenas Contratos SEM Amortização'
      TabOrder = 6
    end
  end
  inherited Dock971: TDock97
    Top = 378
    Width = 625
    inherited tb97Fundo: TToolbar97
      Left = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
end
