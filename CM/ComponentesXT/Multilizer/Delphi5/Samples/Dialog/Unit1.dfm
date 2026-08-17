object Form1: TForm1
  Left = 214
  Top = 254
  Width = 417
  Height = 165
  Caption = 'Common Dialog Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object OpenButton: TButton
    Left = 8
    Top = 8
    Width = 105
    Height = 25
    Caption = '&Open...'
    TabOrder = 0
    OnClick = OpenButtonClick
  end
  object SaveButton: TButton
    Left = 8
    Top = 40
    Width = 105
    Height = 25
    Caption = '&Save...'
    TabOrder = 1
    OnClick = SaveButtonClick
  end
  object OpenPictureButton: TButton
    Left = 8
    Top = 72
    Width = 105
    Height = 25
    Caption = 'Open &Picture...'
    TabOrder = 2
    OnClick = OpenPictureButtonClick
  end
  object SavePictureButton: TButton
    Left = 8
    Top = 104
    Width = 105
    Height = 25
    Caption = 'S&ave Picture...'
    TabOrder = 3
    OnClick = SavePictureButtonClick
  end
  object FontButton: TButton
    Left = 152
    Top = 8
    Width = 105
    Height = 25
    Caption = '&Font...'
    TabOrder = 4
    OnClick = FontButtonClick
  end
  object ColorButton: TButton
    Left = 152
    Top = 40
    Width = 105
    Height = 25
    Caption = '&Color...'
    TabOrder = 5
    OnClick = ColorButtonClick
  end
  object PrintButton: TButton
    Left = 152
    Top = 72
    Width = 105
    Height = 25
    Caption = '&Print...'
    TabOrder = 6
    OnClick = PrintButtonClick
  end
  object PrinterSetupButton: TButton
    Left = 152
    Top = 104
    Width = 105
    Height = 25
    Caption = 'Printer &Setup...'
    TabOrder = 7
    OnClick = PrinterSetupButtonClick
  end
  object FindButton: TButton
    Left = 296
    Top = 8
    Width = 105
    Height = 25
    Caption = 'F&ind...'
    TabOrder = 8
    OnClick = FindButtonClick
  end
  object ReplaceButton: TButton
    Left = 296
    Top = 40
    Width = 105
    Height = 25
    Caption = '&Replace...'
    TabOrder = 9
    OnClick = ReplaceButtonClick
  end
  object LanguageButton: TButton
    Left = 296
    Top = 104
    Width = 105
    Height = 25
    Caption = '&Language...'
    TabOrder = 10
    OnClick = LanguageButtonClick
  end
  object OpenDialog1: TOpenDialog
    Left = 120
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Left = 120
    Top = 40
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Title = 'Open Picture'
    Left = 120
    Top = 72
  end
  object SavePictureDialog1: TSavePictureDialog
    Title = 'Save Picture As'
    Left = 120
    Top = 104
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Device = fdBoth
    MinFontSize = 0
    MaxFontSize = 0
    Left = 264
    Top = 8
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 264
    Top = 40
  end
  object PrintDialog1: TPrintDialog
    Left = 264
    Top = 72
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 264
    Top = 104
  end
  object FindDialog1: TFindDialog
    Left = 376
    Top = 8
  end
  object ReplaceDialog1: TReplaceDialog
    Left = 376
    Top = 40
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    Left = 328
    Top = 72
    TargetsData = (
      1
      4
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
        'Filter'
        0)
      (
        ''
        'Title'
        0))
  end
  object IvDialogModule1: TIvDialogModule
    Left = 360
    Top = 72
  end
  object IvBinaryDictionary1: TIvBinaryDictionary
    DictionaryName = 'Dictionary1'
    FileName = 'Project1.mld'
    Storage = ivsEmbedded
    Left = 296
    Top = 72
  end
end
