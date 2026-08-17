object Form2: TForm2
  Left = 9
  Top = 101
  Width = 786
  Height = 463
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object fcOutlookBar1: TfcOutlookBar
    Left = 16
    Top = 8
    Width = 209
    Height = 393
    ActivePage = BtnFuncionario
    Animation.Enabled = True
    Animation.Interval = 1
    Animation.Steps = 7
    AutoBold = False
    BevelOuter = bvNone
    BorderStyle = bsSingle
    ButtonSize = 20
    ButtonClassName = 'TfcShapeBtn'
    Layout = loVertical
    Options = [cboAutoCreateOutlookList]
    PanelAlignment = paDynamic
    ShowButtons = True
    TabOrder = 0
    object BtnFuncionario: TfcShapeBtn
      Left = 0
      Top = 0
      Width = 205
      Height = 20
      Caption = '&Funcionario'
      Color = clBtnFace
      DitherColor = clWhite
      Down = True
      GroupIndex = 1
      NumGlyphs = 0
      ParentClipping = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      TabOrder = 0
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
    end
    object fcOutlookBar1fcShapeBtn2: TfcShapeBtn
      Left = 0
      Top = 369
      Width = 205
      Height = 20
      Caption = 'fcOutlookBar1fcShapeBtn2'
      Color = clBtnFace
      DitherColor = clWhite
      GroupIndex = 1
      ParentClipping = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      TabOrder = 2
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
    end
    object TfcOutlookPanel
      Left = 0
      Top = 20
      Width = 205
      Height = 349
      object fcOutlookBar1OutlookList1: TfcOutlookList
        Left = 0
        Top = 0
        Width = 205
        Height = 349
        Align = alClient
        BorderStyle = bsNone
        ClickStyle = csClick
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HotTrackStyle = hsIconHilite
        ItemHighlightColor = clBtnFace
        ItemHotTrackColor = clBtnShadow
        ItemLayout = blGlyphTop
        ItemShadowColor = clBtnText
        ItemSelectedDitherColor = clBtnHighlight
        Items = <
          item
            ImageIndex = 0
            Selected = False
            Separation = 10
            Tag = 0
            Text = '&Dados Funcionais'
          end>
        ItemSpacing = 20
        ItemsWidth = 0
        Layout = loVertical
        ScrollButtonsVisible = True
        ScrollInterval = 250
        Transparent = False
      end
    end
    object TfcOutlookPanel
      Left = 0
      Top = 0
      Width = 205
      Height = 0
      object fcOutlookBar1OutlookList2: TfcOutlookList
        Left = 0
        Top = 0
        Width = 205
        Height = 0
        Align = alClient
        BorderStyle = bsNone
        ClickStyle = csClick
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HotTrackStyle = hsIconHilite
        ItemHighlightColor = clBtnFace
        ItemHotTrackColor = clBtnShadow
        ItemLayout = blGlyphTop
        ItemShadowColor = clBtnText
        ItemSelectedDitherColor = clBtnHighlight
        Items = <>
        ItemSpacing = 20
        ItemsWidth = 0
        Layout = loVertical
        ScrollButtonsVisible = True
        ScrollInterval = 250
        Transparent = False
      end
    end
  end
end
