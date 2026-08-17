object FrmPrincipal: TFrmPrincipal
  Left = 320
  Top = 234
  Width = 136
  Height = 93
  Caption = 'Teste Report'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 7
    Top = 7
    Width = 117
    Height = 20
    Caption = 'Report Screen'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 7
    Top = 39
    Width = 117
    Height = 20
    Caption = 'Report PDF'
    TabOrder = 1
    OnClick = Button2Click
  end
end
