object frmXMLTestDemo: TfrmXMLTestDemo
  Left = 406
  Top = 344
  Width = 368
  Height = 335
  Caption = 'TXMLReader & TXMLWriter Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblTimeToRun: TLabel
    Left = 244
    Top = 12
    Width = 66
    Height = 13
    Caption = 'lblTimeToRun'
  end
  object tvNodes: TTreeView
    Left = 4
    Top = 36
    Width = 353
    Height = 269
    Anchors = [akLeft, akTop, akRight, akBottom]
    Indent = 19
    TabOrder = 0
  end
  object btnOpen: TButton
    Left = 4
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 1
    OnClick = btnOpenClick
  end
  object btnFullExpand: TButton
    Left = 84
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Full Expand'
    TabOrder = 2
    OnClick = btnFullExpandClick
  end
  object btnWriteTest: TButton
    Left = 164
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Write Test'
    TabOrder = 3
    OnClick = btnWriteTestClick
  end
  object opdXMLFile: TOpenDialog
    DefaultExt = '*.xml'
    Filter = 'XML Files (*.xml)|*.xml'
    Title = 'Open XML File'
    Left = 8
    Top = 40
  end
  object svdXMLFile: TSaveDialog
    DefaultExt = '*.xml'
    Filter = 'XML Files (*.xml)|*.xml'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Save XML File'
    Left = 40
    Top = 40
  end
end
