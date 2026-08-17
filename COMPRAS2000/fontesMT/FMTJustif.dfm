inherited FrmMTJustif: TFrmMTJustif
  Left = 160
  Top = 195
  Caption = 'Justificativa'
  ClientHeight = 203
  ClientWidth = 445
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 445
    Height = 164
    object mem: TMemo
      Left = 5
      Top = 5
      Width = 435
      Height = 154
      Align = alClient
      Lines.Strings = (
        '')
      MaxLength = 200
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 164
    Width = 445
    inherited tb97Fundo: TToolbar97
      Left = 279
    end
    object RgFrete: TRadioGroup
      Left = 8
      Top = 0
      Width = 153
      Height = 33
      Caption = ' Frete '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'FOB'
        'CIF')
      TabOrder = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 3
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
end
