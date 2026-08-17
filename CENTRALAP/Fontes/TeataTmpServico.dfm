inherited frmSairAjuda1: TfrmSairAjuda1
  Left = 152
  Top = 130
  Caption = 'frmSairAjuda1'
  ClientHeight = 370
  ClientWidth = 640
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 640
    Height = 331
    object BitBtn1: TBitBtn
      Left = 136
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Calcular'
      TabOrder = 0
    end
    object Memo1: TMemo
      Left = 5
      Top = 64
      Width = 630
      Height = 262
      Align = alBottom
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      Lines.Strings = (
        'Memo1')
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 331
    Width = 640
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object QRY: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM ELEGPATRO'
      'ORDER BY MATRICULA')
    ValidateWithMask = True
    Left = 456
    Top = 32
  end
end
