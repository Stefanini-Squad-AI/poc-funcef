inherited frmConsultar: TfrmConsultar
  Left = 384
  Top = 188
  Caption = 'frmConsultar'
  ClientHeight = 446
  ClientWidth = 594
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 166
    Width = 594
    Height = 222
    TabOrder = 2
    object Panel3: TPanel
      Left = 427
      Top = 0
      Width = 185
      Height = 41
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 388
    Width = 594
  end
  object pnlPesquisa: TPanel [2]
    Left = 0
    Top = 0
    Width = 594
    Height = 166
    Align = alTop
    TabOrder = 0
    object Panel4: TPanel
      Left = 438
      Top = 105
      Width = 148
      Height = 55
      BevelOuter = bvLowered
      TabOrder = 0
      object bbtnConsultar: TButton
        Left = 57
        Top = 12
        Width = 85
        Height = 31
        Caption = '&Consultar'
        TabOrder = 0
        OnClick = bbtnConsultarClick
      end
      object anmLupa: TAnimate
        Left = 5
        Top = 2
        Width = 48
        Height = 50
        Active = False
        CommonAVI = aviFindFile
        StopFrame = 23
      end
    end
  end
  object tsetResult: TTabSet [3]
    Left = 0
    Top = 427
    Width = 594
    Height = 19
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Tabs.Strings = (
      'Informações Principais')
    TabIndex = 0
  end
  object grpResultado: TGroupBox [4]
    Left = 0
    Top = 166
    Width = 594
    Height = 222
    Align = alClient
    Caption = 'Resultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -19
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 3
    object Panel1: TPanel
      Left = 2
      Top = 25
      Width = 590
      Height = 195
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object dbgrdResultado: TwwDBGrid
        Left = 0
        Top = 0
        Width = 590
        Height = 195
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = ds
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    Left = 68
    Top = 272
  end
end
`v&cªšÀ
