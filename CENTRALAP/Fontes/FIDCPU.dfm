object frmCpuAtend: TfrmCpuAtend
  Left = 232
  Top = 203
  Width = 376
  Height = 176
  Caption = 'Cpu de atendimento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 49
    Top = 24
    Width = 77
    Height = 13
    Caption = 'Num. da CPU'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 49
    Top = 64
    Width = 80
    Height = 13
    Caption = 'Nome da CPU'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit_ID_CPU: TEdit
    Left = 136
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit_Nome_CPU: TEdit
    Left = 136
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 152
    Top = 104
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
end
