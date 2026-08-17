inherited cfgRelItensEnvioContratoCAPCAR: TcfgRelItensEnvioContratoCAPCAR
  Left = 90
  Top = 105
  Caption = 
    'Valores Enviados/Recebidos por Patrocinadora (sintético por Cont' +
    'rato)'
  ClientHeight = 502
  ClientWidth = 626
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 626
    Height = 469
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
    object Label4: TLabel
      Left = 16
      Top = 207
      Width = 181
      Height = 13
      Caption = 'Situação do Participante Titular'
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
      LookupTable = dtmLookEmptmo.qryLookTipoContrato
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
      Top = 384
      Width = 353
      Height = 65
      TabOrder = 12
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
    object rdgOrdenar: TRadioGroup
      Left = 16
      Top = 384
      Width = 225
      Height = 41
      Caption = ' Ordenar por: '
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Contrato'
        'Nome')
      TabOrder = 10
    end
    object chkValorZero: TCheckBox
      Left = 328
      Top = 256
      Width = 273
      Height = 17
      Caption = 'Exibir apenas Contratos SEM valor recebido'
      TabOrder = 6
    end
    object chkValorDiverg: TCheckBox
      Left = 328
      Top = 296
      Width = 273
      Height = 17
      Caption = 'Exibir apenas valores divergentes'
      TabOrder = 8
    end
    inline molMutuario: TmolMutuario
      Left = 8
      Top = 8
      Width = 609
      inherited btnBuscaPart: TBitBtn
        Left = 552
        OnClick = molMutuario1btnBuscaPartClick
      end
      inherited btnLimpaPart: TBitBtn
        Left = 576
        OnClick = molMutuariobtnLimpaPartClick
      end
      inherited edtNome: TEdit
        Width = 353
      end
    end
    object chkValorNAOZero: TCheckBox
      Left = 328
      Top = 276
      Width = 273
      Height = 17
      Caption = 'Exibir apenas Contratos COM valor recebido'
      TabOrder = 7
    end
    inline molListaPatro: TmolListaPatro
      Left = 8
      Top = 88
      Height = 97
      TabOrder = 3
      inherited Label6: TLabel
        Width = 94
      end
      inherited lstPatro: TCheckListBox
        Height = 65
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
      Height = 97
      TabOrder = 4
      inherited Label6: TLabel
        Width = 47
      end
      inherited lstPlano: TCheckListBox
        Height = 73
      end
      inherited btnInvertePlano: TBitBtn
        OnClick = molListaPlanobtnInvertePlanoClick
      end
      inherited btnMarcaTodosPlano: TBitBtn
        OnClick = molListaPlanobtnMarcaTodosPlanoClick
      end
    end
    object chkQuitaAmortiza: TCheckBox
      Left = 328
      Top = 316
      Width = 273
      Height = 17
      Caption = 'Não exibir quitações e amortizações'
      TabOrder = 9
    end
    object chkSintetico: TCheckBox
      Left = 24
      Top = 432
      Width = 217
      Height = 17
      Caption = 'Relatório Sintético'
      TabOrder = 11
    end
    object DBcboSitPart: TwwDBLookupCombo
      Left = 16
      Top = 221
      Width = 289
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
      LookupTable = dtmLookEmptmo.qryLookSitPart
      LookupField = 'IDSITPART'
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 5
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
      OnCloseUp = DBcboTipoEmptmoCloseUp
    end
    object Panel1: TPanel
      Left = 320
      Top = 176
      Width = 289
      Height = 73
      TabOrder = 13
      object Label15: TLabel
        Left = 40
        Top = 10
        Width = 116
        Height = 13
        Caption = 'Cobrança (mês/ano)'
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
      object chkFiltroCobranca: TCheckBox
        Left = 48
        Top = 48
        Width = 217
        Height = 17
        Caption = 'Utilizar filtro por mês de cobrança'
        TabOrder = 2
      end
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 336
      Width = 233
      Height = 41
      Caption = ' Forma(s) de Envio '
      TabOrder = 14
      object chkFinanceiro: TCheckBox
        Left = 16
        Top = 16
        Width = 73
        Height = 17
        Caption = 'a Pagar'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object CheckBox1: TCheckBox
        Left = 104
        Top = 16
        Width = 81
        Height = 17
        Caption = 'a Receber'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 469
    Width = 626
    inherited tb97Fundo: TToolbar97
      Left = 454
      DockPos = 514
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 282
      DockPos = 342
    end
  end
end
