inherited cfgRelReceitaM2: TcfgRelReceitaM2
  Left = 284
  Top = 184
  Caption = 'Quadro de Receitas de Locação por m2'
  ClientHeight = 394
  ClientWidth = 435
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 435
    Height = 361
    object Bevel3: TBevel
      Left = 16
      Top = 256
      Width = 401
      Height = 2
      Shape = bsTopLine
    end
    object Label8: TLabel
      Left = 22
      Top = 110
      Width = 153
      Height = 13
      Caption = 'Tipo de Imóvel (Segmento)'
    end
    object chkArea: TCheckBox
      Left = 24
      Top = 232
      Width = 345
      Height = 17
      Caption = 'Exibir apenas os Imóveis que possuem Área Gerencial'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object chkCorLinha: TCheckBox
      Left = 24
      Top = 289
      Width = 233
      Height = 17
      Caption = 'Imprimir linhas com cores alternadas: '
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object cboCorLinha: TfcColorCombo
      Left = 260
      Top = 287
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
      TabOrder = 2
    end
    object chkLinhas: TCheckBox
      Left = 24
      Top = 265
      Width = 225
      Height = 17
      Caption = 'Imprimir linhas separadoras'
      TabOrder = 3
    end
    inline molImovelMestre1: TmolImovelMestre
      Left = 13
      Top = 16
      TabOrder = 4
    end
    object grpCompetencia: TGroupBox
      Left = 24
      Top = 160
      Width = 361
      Height = 57
      Caption = ' Mês de Competência '
      TabOrder = 5
      TabStop = True
      object DBspnAnoCompetencia: TwwDBSpinEdit
        Left = 256
        Top = 24
        Width = 73
        Height = 21
        Increment = 1
        MaxValue = 2050
        MinValue = 1980
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object cboMesCompetencia: TComboBox
        Left = 32
        Top = 24
        Width = 217
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
    inline molLocatario1: TmolLocatario
      Left = 13
      Top = 63
      TabOrder = 6
      inherited btnAbrePessoa: TBitBtn
        Left = 208
        Visible = False
      end
    end
    object DBcboTipoImovel: TwwDBLookupCombo
      Left = 24
      Top = 124
      Width = 169
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOIMOVEL'#9'25'#9'DESCTIPOIMOVEL')
      LookupTable = dtmLookImobiliario.qryLookTipoImovel
      LookupField = 'CODTIPIMOVEL'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
  end
  inherited Dock971: TDock97
    Top = 361
    Width = 435
    inherited tb97Fundo: TToolbar97
      Left = 263
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 91
    end
  end
end
