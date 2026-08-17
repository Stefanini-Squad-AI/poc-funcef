inherited cfgRelatorio: TcfgRelatorio
  Left = 361
  Top = 325
  Caption = 'cfgRelatorio'
  ClientHeight = 309
  ClientWidth = 433
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 433
    Height = 270
    object pnlVisaoRel: TPanel
      Left = 1
      Top = 192
      Width = 431
      Height = 77
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 159
        Height = 13
        Caption = 'Cor das linhas de destaque:'
      end
      object cboCorLinha: TfcColorCombo
        Left = 178
        Top = 12
        Width = 127
        Height = 21
        AlignmentVertical = fcavCenter
        AutoSelect = False
        Color = clWhite
        ColorDialogOptions = []
        ColorListOptions.Color = clWhite
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
          'ColorI=00E3E3E3'
          'ColorJ=00f00000')
        DropDownCount = 8
        DropDownWidth = 8
        ReadOnly = False
        ShowMatchText = False
        SelectedColor = clWhite
        TabOrder = 0
      end
      object ckbImpLinhas: TCheckBox
        Left = 8
        Top = 48
        Width = 177
        Height = 17
        Caption = 'Imprime linhas separadoras'
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 270
    Width = 433
    inherited tb97Fundo: TToolbar97
      Left = 261
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 92
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 1027
    Top = 65499
  end
end
