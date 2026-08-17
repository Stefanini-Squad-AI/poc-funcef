inherited cfgRelConciliaFolhaPP: TcfgRelConciliaFolhaPP
  Left = 67
  Top = 9
  Caption = 
    'Conciliação de Recebimentos - Folha(s) - por Plano e Patrocinado' +
    'ra'
  ClientHeight = 534
  ClientWidth = 625
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 625
    Height = 501
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
      OnExit = DBcboTipoEmptmoExit
    end
    object GroupBox2: TGroupBox
      Left = 256
      Top = 416
      Width = 353
      Height = 69
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
    object rdgOrdenacao: TRadioGroup
      Left = 16
      Top = 416
      Width = 225
      Height = 69
      Caption = ' Ordenar por: '
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Matrícula'
        'Nome'
        'Contrato')
      TabOrder = 11
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
        Height = 137
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
      Height = 89
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
    object GroupBox1: TGroupBox
      Left = 16
      Top = 352
      Width = 289
      Height = 61
      Caption = ' Forma(s) de Envio '
      TabOrder = 8
      object chkFolhaPatro: TCheckBox
        Left = 16
        Top = 16
        Width = 137
        Height = 17
        Caption = 'Folha Patrocinadora'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chkFolhaBenef: TCheckBox
        Left = 16
        Top = 36
        Width = 137
        Height = 17
        Caption = 'Folha de Benefícios'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 16
      Top = 248
      Width = 289
      Height = 101
      Caption = ' Exibir apenas Rubricas (Folha): '
      TabOrder = 6
      object chkValorDivergFolha: TCheckBox
        Left = 16
        Top = 16
        Width = 169
        Height = 17
        Hint = 'Valor Recebido <> Valor Enviado'
        Caption = 'Com divergência de valor'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object chkValorZeroFolha: TCheckBox
        Left = 16
        Top = 56
        Width = 169
        Height = 17
        Hint = 'Valor Recebido = 0'
        Caption = 'Com Valor recebido ZERO'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object chkValorNAOZeroFolha: TCheckBox
        Left = 16
        Top = 36
        Width = 89
        Height = 17
        Hint = 'Valor Recebido > 0'
        Caption = 'Recebidas'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object chkNaoProcessadoFolha: TCheckBox
        Left = 16
        Top = 76
        Width = 193
        Height = 17
        Caption = 'Não processadas (pela Folha)'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
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
    object chkSintetico: TCheckBox
      Left = 336
      Top = 376
      Width = 273
      Height = 17
      Caption = 'Relatório Sintético'
      TabOrder = 9
    end
    object GroupBox4: TGroupBox
      Left = 320
      Top = 248
      Width = 289
      Height = 121
      Caption = ' Exibir apenas Itens (Emprestimo): '
      TabOrder = 7
      object chkValorDivergEP: TCheckBox
        Left = 16
        Top = 16
        Width = 177
        Height = 17
        Hint = 'Valor Efetivo não nulo e Valor Efetivo <> Valor Previsto'
        Caption = 'Com divergência de valor'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object chkValorZeroEP: TCheckBox
        Left = 16
        Top = 56
        Width = 177
        Height = 17
        Hint = 'Valor Efetivo nulo'
        Caption = 'Não recebidos'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object chkValorNAOZeroEP: TCheckBox
        Left = 16
        Top = 36
        Width = 177
        Height = 17
        Hint = 'Valor Efetivo não nulo'
        Caption = 'Recebidos '
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object chkDivergFolhaEP: TCheckBox
        Left = 16
        Top = 96
        Width = 257
        Height = 17
        Hint = 'Valor Efetivo (Empréstimo) <> Valor Recebido (Folha)'
        Caption = 'Com divergência de valor (para Folha)'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
      object chkNaoProcessadoEP: TCheckBox
        Left = 16
        Top = 76
        Width = 177
        Height = 17
        Hint = 
          'Rubricas processadas pela Folha mas não processadas pelo Emprést' +
          'imo (Recebimento Automático não executado)'
        Caption = 'Não processados'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
    end
    object Panel1: TPanel
      Left = 320
      Top = 184
      Width = 289
      Height = 57
      TabOrder = 5
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
    object chkNaoEnviado: TCheckBox
      Left = 336
      Top = 392
      Width = 273
      Height = 17
      Caption = 'NÃO exibir itens não enviados'
      Checked = True
      State = cbChecked
      TabOrder = 10
    end
  end
  inherited Dock971: TDock97
    Top = 501
    Width = 625
    inherited tb97Fundo: TToolbar97
      Left = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
end
