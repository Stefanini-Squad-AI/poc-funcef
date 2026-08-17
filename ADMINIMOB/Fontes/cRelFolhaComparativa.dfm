inherited cfgRelFolhaComparativa: TcfgRelFolhaComparativa
  Left = 75
  Top = 79
  Caption = 'Comparativo de Folha de Alugéis'
  ClientHeight = 389
  ClientWidth = 447
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 447
    Height = 356
    object Label15: TLabel
      Left = 32
      Top = 126
      Width = 176
      Height = 13
      Caption = 'Competência (mês/ano) - Atual'
    end
    object Label1: TLabel
      Left = 32
      Top = 174
      Width = 191
      Height = 13
      Caption = 'Competência (mês/ano) - Anterior'
    end
    inline MolResponsavel1: TmolResponsavel
      Left = 24
      Top = 16
      inherited btnAbrePessoa: TBitBtn
        Left = 256
        Visible = False
      end
    end
    inline molContrato1: TmolContrato
      Left = 24
      Top = 64
      TabOrder = 1
    end
    object cboMesFim: TComboBox
      Left = 32
      Top = 140
      Width = 161
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
      Left = 192
      Top = 140
      Width = 65
      Height = 21
      Increment = 1
      TabOrder = 3
      UnboundDataType = wwDefault
    end
    object cboMesIni: TComboBox
      Left = 32
      Top = 188
      Width = 161
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
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
    object DBspnAnoIni: TwwDBSpinEdit
      Left = 192
      Top = 188
      Width = 65
      Height = 21
      Increment = 1
      TabOrder = 5
      UnboundDataType = wwDefault
    end
    object chkLinhas: TCheckBox
      Left = 32
      Top = 296
      Width = 225
      Height = 17
      Caption = 'Imprimir linhas separadoras'
      TabOrder = 6
    end
    object chkCorLinha: TCheckBox
      Left = 32
      Top = 330
      Width = 233
      Height = 17
      Caption = 'Imprimir linhas com cores alternadas: '
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object cboCorLinha: TfcColorCombo
      Left = 272
      Top = 326
      Width = 129
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
      DropDownWidth = 119
      ReadOnly = False
      ShowMatchText = False
      SelectedColor = clWhite
      TabOrder = 8
    end
    object rdgOrdenacao: TRadioGroup
      Left = 32
      Top = 224
      Width = 369
      Height = 57
      Caption = ' Ordenar por: '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Nº Contrato'
        'Nome do Contrato')
      TabOrder = 9
    end
  end
  inherited Dock971: TDock97
    Top = 356
    Width = 447
    inherited tb97Fundo: TToolbar97
      Left = 275
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 103
    end
  end
end
