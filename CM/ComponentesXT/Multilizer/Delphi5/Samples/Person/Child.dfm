inherited ChildForm: TChildForm
  Left = 264
  Top = 377
  Width = 493
  Height = 303
  Caption = 'Person'
  Font.Color = clBlack
  FormStyle = fsMDIChild
  Menu = MainMenu
  Position = poDefaultPosOnly
  Visible = True
  OnClick = FormClick
  OnClose = FormClose
  OnDblClick = DetailsMenuClick
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 66
    Top = 8
    Width = 51
    Height = 13
    Alignment = taRightJustify
    Caption = 'First name:'
  end
  object Label2: TLabel [1]
    Left = 83
    Top = 72
    Width = 34
    Height = 13
    Alignment = taRightJustify
    Caption = 'Height:'
  end
  object Label3: TLabel [2]
    Left = 80
    Top = 88
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = 'Weight:'
  end
  object Label4: TLabel [3]
    Left = 55
    Top = 104
    Width = 62
    Height = 13
    Alignment = taRightJustify
    Caption = 'Favour color:'
  end
  object Label5: TLabel [4]
    Left = 56
    Top = 56
    Width = 61
    Height = 13
    Alignment = taRightJustify
    Caption = 'Date of birth:'
  end
  object FirstNameLabel: TLabel [5]
    Left = 128
    Top = 8
    Width = 45
    Height = 13
    Caption = 'first name'
  end
  object HeightLabel: TLabel [6]
    Left = 128
    Top = 72
    Width = 29
    Height = 13
    Caption = 'height'
  end
  object WeightLabel: TLabel [7]
    Left = 128
    Top = 88
    Width = 31
    Height = 13
    Caption = 'weight'
  end
  object DateOfBirthLabel: TLabel [8]
    Left = 128
    Top = 56
    Width = 53
    Height = 13
    Caption = 'dateOfBirth'
  end
  object Label6: TLabel [9]
    Left = 65
    Top = 24
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = 'Last name:'
  end
  object LastNameLabel: TLabel [10]
    Left = 128
    Top = 24
    Width = 45
    Height = 13
    Caption = 'last name'
  end
  object Label8: TLabel [11]
    Left = 96
    Top = 40
    Width = 21
    Height = 13
    Alignment = taRightJustify
    Caption = 'Sex:'
  end
  object SexLabel: TLabel [12]
    Left = 128
    Top = 40
    Width = 16
    Height = 13
    Caption = 'sex'
  end
  object Image: TImage [13]
    Left = 352
    Top = 8
    Width = 121
    Height = 113
  end
  object Label10: TLabel [14]
    Left = 61
    Top = 128
    Width = 56
    Height = 13
    Alignment = taRightJustify
    Caption = 'Description:'
  end
  object DescriptionLabel: TLabel [15]
    Left = 128
    Top = 128
    Width = 345
    Height = 121
    AutoSize = False
    Caption = 'description'
  end
  object ColorPanel: TPanel [16]
    Left = 128
    Top = 104
    Width = 57
    Height = 17
    TabOrder = 0
  end
  object MainMenu: TMainMenu [17]
    Left = 48
    Top = 152
    object PersonMenu: TMenuItem
      Caption = 'Person'
      GroupIndex = 1
      object DetailsMenu: TMenuItem
        Caption = 'Details...'
        OnClick = DetailsMenuClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object FontMenu: TMenuItem
        Caption = 'Font...'
        OnClick = FontMenuClick
      end
    end
  end
  object FontDialog: TFontDialog [18]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 16
    Top = 152
  end
  inherited Translator: TIvTranslator
    DictionaryName = 'Dictionary1'
  end
  object IvDialogModule1: TIvDialogModule
    Left = 8
    Top = 64
  end
end
