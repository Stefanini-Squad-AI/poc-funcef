inherited FrmProgressCpmf: TFrmProgressCpmf
  Left = 453
  Top = 188
  BorderStyle = bsDialog
  Caption = 'Aguarde...'
  ClientHeight = 127
  ClientWidth = 298
  Font.Style = [fsBold]
  FormStyle = fsStayOnTop
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LblLote: TLabel [0]
    Left = 11
    Top = 7
    Width = 114
    Height = 13
    Caption = 'Processando o Lote'
  end
  object LblDocumento: TLabel [1]
    Left = 11
    Top = 47
    Width = 153
    Height = 13
    Caption = 'Processando o Documento'
  end
  object LblImposto: TLabel [2]
    Left = 11
    Top = 87
    Width = 126
    Height = 13
    Caption = 'Processando o Rateio'
  end
  object PbLote: TProgressBar [3]
    Left = 11
    Top = 23
    Width = 281
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 0
  end
  object PbDocumento: TProgressBar [4]
    Left = 11
    Top = 63
    Width = 281
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 1
  end
  object PbRateio: TProgressBar [5]
    Left = 11
    Top = 103
    Width = 281
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 2
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 98
    Top = 231
  end
end
