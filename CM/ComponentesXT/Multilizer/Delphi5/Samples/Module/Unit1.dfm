object Form1: TForm1
  Left = 211
  Top = 107
  Width = 273
  Height = 109
  Caption = 'Module Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MyControl1: TMyControl
    Left = 8
    Top = 8
    Width = 153
    Height = 65
  end
  object Button1: TButton
    Left = 168
    Top = 8
    Width = 89
    Height = 25
    Caption = '&Language...'
    TabOrder = 0
    OnClick = Button1Click
  end
  object IvBinaryDictionary1: TIvBinaryDictionary
    DictionaryName = 'Dictionary1'
    FileName = 'MLSample.mld'
    Left = 168
    Top = 40
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    Options = [ivtoAutoTranslate, ivtoCheckFont, ivtoScaleMultiByte, ivtoMirrorBiDirectional, ivtoChangeFontCharset, ivtoTranslateSystemMenu]
    Left = 200
    Top = 40
    TargetsData = (
      1
      3
      (
        ''
        'Hint'
        0)
      (
        ''
        'Caption'
        0)
      (
        ''
        'Items'
        0))
  end
  object MyModule1: TMyModule
    Left = 232
    Top = 40
  end
end
