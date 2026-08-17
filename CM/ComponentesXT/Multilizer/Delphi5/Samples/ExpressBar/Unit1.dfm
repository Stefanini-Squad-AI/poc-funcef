object Form1: TForm1
  Left = 206
  Top = 108
  Width = 396
  Height = 226
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarManager1: TdxBarManager
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Bars = <
      item
        Caption = 'MainMenu'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 404
        FloatTop = 344
        FloatClientWidth = 23
        FloatClientHeight = 22
        IsMainMenu = True
        ItemLinks = <
          item
            Item = dxBarSubItem1
            Visible = True
          end
          item
            Item = dxBarSubItem2
            Visible = True
          end>
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'Standard'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 23
        DockingStyle = dsTop
        FloatLeft = 404
        FloatTop = 344
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarButton1
            Visible = True
          end
          item
            Item = dxBarButton3
            Visible = True
          end
          item
            Item = dxBarButton2
            Visible = True
          end>
        OneOnRow = True
        Row = 1
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end>
    Categories.Strings = (
      'Standard'
      'Edit'
      'Menus')
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      False)
    UseSystemFont = True
    Left = 8
    Top = 56
    DockControlHeights = (
      0
      0
      49
      0)
    object dxBarEdit1: TdxBarEdit
      Caption = 'Simple Edit'
      Category = 1
      Hint = 'Simple Edit'
      Visible = ivAlways
      Width = 100
    end
    object dxBarButton1: TdxBarButton
      Caption = '&New'
      Category = 0
      Hint = 'New'
      Visible = ivAlways
    end
    object dxBarButton3: TdxBarButton
      Caption = 'Open'
      Category = 0
      Hint = 'Open'
      Visible = ivAlways
    end
    object dxBarButton2: TdxBarButton
      Caption = 'Save'
      Category = 0
      Hint = 'Save'
      Visible = ivAlways
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = '&File'
      Category = 2
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxBarButton1
          Visible = True
        end
        item
          Item = dxBarButton3
          Visible = True
        end
        item
          Item = dxBarButton2
          Visible = True
        end>
    end
    object dxBarButton4: TdxBarButton
      Caption = 'C&ut'
      Category = 1
      Hint = 'Cut'
      Visible = ivAlways
    end
    object dxBarButton5: TdxBarButton
      Caption = '&Copy'
      Category = 1
      Hint = 'Copy'
      Visible = ivAlways
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = '&Edit'
      Category = 2
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxBarButton4
          Visible = True
        end
        item
          Item = dxBarButton5
          Visible = True
        end>
    end
  end
  object IvTestDictionary1: TIvTestDictionary
    DictionaryName = 'Dictionary1'
    SingleByteOptions = [ivstExpand, ivstEnclose]
    Left = 40
    Top = 56
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    Left = 72
    Top = 56
    TargetsData = (
      1
      2
      (
        ''
        'Hint'
        0)
      (
        ''
        'Caption'
        0))
  end
end
