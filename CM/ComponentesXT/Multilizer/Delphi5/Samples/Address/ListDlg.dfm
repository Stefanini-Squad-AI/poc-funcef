object ListDialog: TListDialog
  Left = 197
  Top = 265
  BorderStyle = bsDialog
  Caption = 'Dialog'
  ClientHeight = 179
  ClientWidth = 256
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 153
    Height = 161
    Shape = bsFrame
  end
  object OKBtn: TButton
    Left = 172
    Top = 8
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object List: TListBox
    Left = 16
    Top = 16
    Width = 137
    Height = 145
    ItemHeight = 13
    Sorted = True
    TabOrder = 1
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    Left = 176
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
end
