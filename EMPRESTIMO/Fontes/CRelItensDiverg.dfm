inherited cfgRelItensDiverg: TcfgRelItensDiverg
  Left = 96
  Top = 56
  Caption = 'Itens com divergência'
  ClientHeight = 450
  ClientWidth = 625
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 625
    Height = 417
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
    object GroupBox1: TGroupBox
      Left = 256
      Top = 336
      Width = 353
      Height = 65
      TabOrder = 6
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
    inline molListaPatro: TmolListaPatro
      Left = 8
      Top = 88
      Height = 193
      TabOrder = 3
      inherited Label6: TLabel
        Width = 86
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
    inline molListaPlano: TmolListaPlano
      Left = 311
      Top = 88
      Height = 121
      TabOrder = 4
      inherited Label6: TLabel
        Width = 119
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
    inline molContratoEmptmo: TmolContratoEmptmo
      Left = 8
      Top = 8
      Width = 609
      inherited btnBuscaContrato: TBitBtn [3]
        Left = 552
      end
      inherited btnLimpaContrato: TBitBtn [4]
        Left = 576
      end
      inherited edtNome: TEdit [5]
        Width = 353
      end
      inherited edtMatricula: TEdit [6]
      end
      inherited edtIdContrato: TEdit [7]
      end
    end
    object GroupBox3: TGroupBox
      Left = 320
      Top = 208
      Width = 289
      Height = 121
      Caption = ' Exibir: '
      TabOrder = 5
      object chkRecebInesperado: TCheckBox
        Left = 16
        Top = 32
        Width = 177
        Height = 17
        Caption = 'Recebimentos inesperados'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object chkRecebidoMenor: TCheckBox
        Left = 16
        Top = 48
        Width = 177
        Height = 17
        Caption = 'Valores recebidos a menor'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object chkRecebidoMaior: TCheckBox
        Left = 16
        Top = 64
        Width = 169
        Height = 17
        Caption = 'Valores recebidos a maior'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object chkDivergData: TCheckBox
        Left = 16
        Top = 80
        Width = 153
        Height = 17
        Caption = 'Divergência de datas'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object chkValorEmAberto: TCheckBox
        Left = 16
        Top = 16
        Width = 193
        Height = 17
        Caption = 'Valores AINDA não recebidos'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chkNaoSeraoPagos: TCheckBox
        Left = 16
        Top = 96
        Width = 185
        Height = 17
        Caption = 'Valores não recebidos'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
    end
  end
  inherited Dock971: TDock97
    Top = 417
    Width = 625
    inherited tb97Fundo: TToolbar97
      Left = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
end
