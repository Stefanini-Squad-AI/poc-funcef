inherited frmCuringa: TfrmCuringa
  Left = 444
  Top = 356
  Caption = 'Curingas'
  ClientHeight = 161
  ClientWidth = 321
  Font.Style = [fsBold]
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 168
    Top = 8
    Width = 64
    Height = 13
    Alignment = taCenter
    Caption = 'Significado'
  end
  object Label2: TLabel [1]
    Left = 26
    Top = 8
    Width = 44
    Height = 13
    Alignment = taCenter
    Caption = 'Curinga'
  end
  object Memo1: TMemo [2]
    Left = 88
    Top = 24
    Width = 225
    Height = 129
    Lines.Strings = (
      'nº da parcela'
      'quantidade de parcelas'
      ''
      'valor original'
      'valor de correção monetária'
      'valor de juros'
      'valor de multa'
      ''
      'data de validade do cálculo')
    ReadOnly = True
    TabOrder = 0
  end
  object frmCuringa: TMemo [3]
    Left = 8
    Top = 24
    Width = 81
    Height = 129
    Lines.Strings = (
      '<parcela>'
      '<parcelas>'
      ''
      '<valorg>'
      '<cm>'
      '<juros>'
      '<multa>'
      ''
      '<dataval>')
    ReadOnly = True
    TabOrder = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 1018
    Top = 23
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
end
