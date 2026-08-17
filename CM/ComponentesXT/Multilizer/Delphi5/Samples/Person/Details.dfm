inherited DetailsDialog: TDetailsDialog
  Left = 238
  Top = 318
  Width = 417
  Height = 220
  Caption = 'Personal Details'
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object OKButton: TButton [0]
    Left = 320
    Top = 16
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object CancelButton: TButton [1]
    Left = 320
    Top = 48
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object PageControl: TPageControl [2]
    Left = 8
    Top = 8
    Width = 289
    Height = 177
    ActivePage = OtherSheet
    TabOrder = 0
    object NameSheet: TTabSheet
      Caption = 'Name'
      object Label1: TLabel
        Left = 8
        Top = 14
        Width = 51
        Height = 13
        Caption = '&First name:'
        FocusControl = FirstNameEdit
      end
      object Label3: TLabel
        Left = 8
        Top = 46
        Width = 52
        Height = 13
        Caption = '&Last name:'
        FocusControl = LastNameEdit
      end
      object FirstNameEdit: TEdit
        Left = 96
        Top = 12
        Width = 177
        Height = 21
        TabOrder = 0
      end
      object LastNameEdit: TEdit
        Left = 96
        Top = 44
        Width = 177
        Height = 21
        TabOrder = 1
      end
      object SexRadioGroup: TRadioGroup
        Left = 144
        Top = 80
        Width = 129
        Height = 65
        Caption = 'Sex'
        Items.Strings = (
          '&Male'
          '&Female')
        TabOrder = 3
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 80
        Width = 129
        Height = 65
        Caption = '&Date of birth'
        TabOrder = 2
        object DateLabel: TLabel
          Left = 24
          Top = 44
          Width = 73
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'format'
        end
        object DateEdit: TEdit
          Left = 24
          Top = 20
          Width = 73
          Height = 21
          TabOrder = 0
        end
      end
    end
    object SizeSheet: TTabSheet
      Caption = 'Size'
      object Label2: TLabel
        Left = 8
        Top = 10
        Width = 34
        Height = 13
        Caption = '&Height:'
        FocusControl = HeightEdit
      end
      object Label4: TLabel
        Left = 8
        Top = 42
        Width = 37
        Height = 13
        Caption = '&Weight:'
        FocusControl = WeightEdit
      end
      object WeightLabel: TLabel
        Left = 156
        Top = 42
        Width = 21
        Height = 13
        Caption = 'kilos'
      end
      object HeightLabel: TLabel
        Left = 155
        Top = 10
        Width = 54
        Height = 13
        Caption = 'centimeters'
      end
      object HeightEdit: TEdit
        Left = 72
        Top = 8
        Width = 73
        Height = 21
        TabOrder = 0
      end
      object WeightEdit: TEdit
        Left = 72
        Top = 40
        Width = 73
        Height = 21
        TabOrder = 1
      end
    end
    object ImageSheet: TTabSheet
      Caption = 'Image'
      object Image: TImage
        Left = 8
        Top = 8
        Width = 153
        Height = 137
        Center = True
      end
      object ImageButton: TButton
        Left = 184
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Browse...'
        TabOrder = 0
        OnClick = ImageButtonClick
      end
    end
    object OtherSheet: TTabSheet
      Caption = 'Other'
      object DescriptionLabel: TLabel
        Left = 8
        Top = 32
        Width = 56
        Height = 13
        Caption = '&Description:'
      end
      object Label5: TLabel
        Left = 8
        Top = 8
        Width = 62
        Height = 13
        Caption = 'Favour color:'
      end
      object DescriptionMemo: TMemo
        Left = 8
        Top = 48
        Width = 265
        Height = 97
        TabOrder = 0
      end
      object ColorPanel: TPanel
        Left = 128
        Top = 8
        Width = 145
        Height = 17
        Caption = 'Press to change'
        TabOrder = 1
        OnClick = ColorPanelClick
      end
    end
  end
  object ImageOpenDialog: TOpenDialog [3]
    Filter = 'All files (*.*)|*.*|Windows bitmap (*.bmp;*.dib)|*.bmp;*.dib'
    FilterIndex = 2
    Options = [ofHideReadOnly]
    Left = 352
    Top = 112
  end
  object ColorDialog: TColorDialog [4]
    Ctl3D = True
    Left = 320
    Top = 112
  end
  inherited Translator: TIvTranslator
    DictionaryName = 'Dictionary1'
    Left = 320
    Top = 80
  end
  object IvDialogModule1: TIvDialogModule
    Left = 352
    Top = 80
  end
end
