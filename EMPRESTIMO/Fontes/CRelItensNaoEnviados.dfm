inherited cfgRelItensNaoEnviados: TcfgRelItensNaoEnviados
  Left = 100
  Top = 209
  Caption = 'Contratos com Itens Não Enviados'
  ClientHeight = 234
  ClientWidth = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 598
    Height = 201
    object Panel1: TPanel
      Left = 336
      Top = 56
      Width = 249
      Height = 57
      TabOrder = 3
      object Label15: TLabel
        Left = 16
        Top = 10
        Width = 116
        Height = 13
        Caption = 'Cobrança (mês/ano)'
      end
      object DBspnAno: TwwDBSpinEdit
        Left = 168
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
        Left = 16
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
    object GroupBox2: TGroupBox
      Left = 232
      Top = 123
      Width = 353
      Height = 65
      TabOrder = 4
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
    inline molContratoEmptmo: TmolContratoEmptmo
      Left = 8
      Top = 8
      Width = 585
      Height = 41
      inherited edtNome: TEdit
        Width = 329
      end
      inherited btnBuscaContrato: TBitBtn
        Left = 528
      end
      inherited btnLimpaContrato: TBitBtn
        Left = 552
      end
    end
    object chkFinanceiro: TCheckBox
      Left = 24
      Top = 56
      Width = 265
      Height = 17
      Caption = 'Exibir Itens a enviar para Financeiro'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object chkFolhaPatro: TCheckBox
      Left = 24
      Top = 80
      Width = 297
      Height = 17
      Caption = 'Exibir Itens a enviar para Folhas Patrocinadoras'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object chkFolhaBenef: TCheckBox
      Left = 24
      Top = 104
      Width = 265
      Height = 17
      Caption = 'Exibir Itens a enviar para Folha Benefícios'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
  end
  inherited Dock971: TDock97
    Top = 201
    Width = 598
    inherited tb97Fundo: TToolbar97
      Left = 426
      DockPos = 514
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 254
      DockPos = 342
    end
  end
end
