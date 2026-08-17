inherited frmTestaTmpServico: TfrmTestaTmpServico
  Left = 77
  Top = 123
  Caption = 'Cálculo de tempos de serviço'
  ClientHeight = 370
  ClientWidth = 640
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 640
    Height = 331
    object Label1: TLabel
      Left = 224
      Top = 48
      Width = 170
      Height = 13
      Caption = 'Calculando 1 de N registros...'
    end
    object BitBtn1: TBitBtn
      Left = 88
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Calcular'
      TabOrder = 0
      OnClick = BitBtn1Click
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
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object BitBtn2: TBitBtn
      Left = 176
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 2
      OnClick = BitBtn2Click
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
    Left = 480
    Top = 8
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 16
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 568
    Top = 16
  end
  object qryTempoespecial: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 272
    Top = 32
  end
end
