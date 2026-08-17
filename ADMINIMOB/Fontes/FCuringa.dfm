inherited frmCuringa: TfrmCuringa
  Left = 182
  Top = 183
  Caption = 'Curingas'
  ClientHeight = 265
  ClientWidth = 409
  Font.Style = [fsBold]
  Position = poScreenCenter
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
    Width = 313
    Height = 233
    Lines.Strings = (
      'nº da parcela'
      'quantidade de parcelas'
      ''
      'valor original'
      'valor de correção monetária'
      'valor de juros'
      'valor de multa'
      'periodicidade de cobrança de juros ("dia" ou "mês")'
      ''
      'data de validade do cálculo'
      ''
      'Imóvel'
      'tipo de Receita ou Despesa'
      ''
      'data de tolerância')
    ReadOnly = True
    TabOrder = 0
  end
  object frmCuringa: TMemo [3]
    Left = 8
    Top = 24
    Width = 81
    Height = 233
    Lines.Strings = (
      '<parcela>'
      '<parcelas>'
      ''
      '<valorg>'
      '<cm>'
      '<juros>'
      '<multa>'
      '<periodo>'
      ''
      '<dataval>'
      ''
      '<imovel>'
      '<recdes>'
      ''
      '<tolera>')
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
