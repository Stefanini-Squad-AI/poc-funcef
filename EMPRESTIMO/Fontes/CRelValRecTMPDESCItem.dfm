inherited cfgRelValRecTMPDESCItem: TcfgRelValRecTMPDESCItem
  Left = 96
  Top = 26
  Caption = 'Valores a Receber (Analítico)'
  ClientHeight = 486
  ClientWidth = 625
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 625
    Height = 453
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
      Top = 258
      Width = 109
      Height = 13
      Caption = 'Situação do Titular'
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
      Top = 192
      Width = 289
      Height = 57
      TabOrder = 6
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
    inline molMutuario: TmolMutuario
      Left = 8
      Top = 8
      Width = 609
      inherited btnBuscaPart: TBitBtn
        Left = 552
        OnClick = molMutuariobtnBuscaPartClick
      end
      inherited btnLimpaPart: TBitBtn
        Left = 576
        OnClick = molMutuariobtnLimpaPartClick
      end
      inherited edtNome: TEdit
        Width = 353
      end
    end
    object GroupBox2: TGroupBox
      Left = 256
      Top = 372
      Width = 353
      Height = 65
      TabOrder = 11
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
      Top = 372
      Width = 225
      Height = 65
      Caption = ' Ordenar por: '
      ItemIndex = 1
      Items.Strings = (
        'Matrícula'
        'Nome')
      TabOrder = 10
    end
    inline molListaPatro: TmolListaPatro
      Left = 8
      Top = 88
      Height = 169
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
      Height = 97
      TabOrder = 4
      inherited Label6: TLabel
        Width = 119
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
    object DBcboSitPart: TwwDBLookupCombo
      Left = 16
      Top = 272
      Width = 225
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
      OnExit = DBcboTipoEmptmoExit
    end
    object rdgAnalSint: TRadioGroup
      Left = 16
      Top = 304
      Width = 225
      Height = 65
      Caption = ' Exibir Relatório: '
      ItemIndex = 1
      Items.Strings = (
        'Analítico'
        'Sintético por Patrocinadora')
      TabOrder = 7
    end
    object GroupBox1: TGroupBox
      Left = 256
      Top = 256
      Width = 353
      Height = 41
      Caption = ' Forma(s) de Envio '
      TabOrder = 8
      object chkFolhaPatro: TCheckBox
        Left = 16
        Top = 17
        Width = 137
        Height = 17
        Caption = 'Folha Patrocinadora'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chkFolhaBenef: TCheckBox
        Left = 200
        Top = 17
        Width = 137
        Height = 17
        Caption = 'Folha de Benefícios'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 256
      Top = 304
      Width = 353
      Height = 65
      Caption = ' Exibir Apenas Itens: '
      TabOrder = 9
      object chkValorDiverg: TCheckBox
        Left = 16
        Top = 16
        Width = 257
        Height = 17
        Caption = 'Com divergência de valor'
        TabOrder = 0
      end
      object chkValorZero: TCheckBox
        Left = 200
        Top = 40
        Width = 113
        Height = 17
        Caption = 'NÃO recebidos'
        TabOrder = 2
      end
      object chkValorNAOZero: TCheckBox
        Left = 16
        Top = 40
        Width = 89
        Height = 17
        Caption = 'Recebidos'
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 453
    Width = 625
    inherited tb97Fundo: TToolbar97
      Left = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
end
