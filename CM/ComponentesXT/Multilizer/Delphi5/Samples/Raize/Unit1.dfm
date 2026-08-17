object Form1: TForm1
  Left = 208
  Top = 124
  Width = 624
  Height = 432
  Caption = 'Raize Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 505
    Height = 369
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Raize'
      object RzGroupBox1: TRzGroupBox
        Left = 8
        Top = 120
        Width = 153
        Height = 49
        Caption = 'TRzLabel:'
        GroupStyle = gsStandard
        TabOrder = 0
        object RzLabel1: TRzLabel
          Left = 8
          Top = 16
          Width = 20
          Height = 13
          Hint = 'To translate TRzLabel add the ".Caption" target'
          AutoSize = False
          Caption = 'One'
          BevelWidth = 0
          FrameSides = []
        end
      end
      object RzGroupBox12: TRzGroupBox
        Left = 328
        Top = 8
        Width = 153
        Height = 105
        Caption = 'TRzMemo:'
        GroupStyle = gsStandard
        TabOrder = 1
        object RzMemo1: TRzMemo
          Left = 8
          Top = 16
          Width = 137
          Height = 81
          Hint = 'To translate TRzMemo add the ".Lines" target'
          Lines.Strings = (
            'This is a sample memo test '
            'for Raize sample '
            'application')
          TabOrder = 0
        end
      end
      object RzGroupBox13: TRzGroupBox
        Left = 8
        Top = 64
        Width = 153
        Height = 49
        Caption = 'TRzMenuButton:'
        GroupStyle = gsStandard
        TabOrder = 2
        object RzMenuButton1: TRzMenuButton
          Left = 8
          Top = 16
          Width = 137
          Hint = 'To translate TRzMenuButton add the ".Caption" target'
          Alignment = taLeftJustify
          Caption = '&Press'
          TabOrder = 0
          DropDownMenu = PopupMenu1
        end
      end
      object RzGroupBox14: TRzGroupBox
        Left = 8
        Top = 8
        Width = 153
        Height = 49
        Caption = 'TRzButton:'
        GroupStyle = gsStandard
        TabOrder = 3
        object RzButton1: TRzButton
          Left = 8
          Top = 16
          Width = 137
          Hint = 'To translate TRzButton add the ".Caption" target'
          Caption = '&Press'
          TabOrder = 0
        end
      end
      object RzGroupBox15: TRzGroupBox
        Left = 8
        Top = 176
        Width = 153
        Height = 57
        Caption = 'TRzCheckBox:'
        GroupStyle = gsStandard
        TabOrder = 4
        object RzCheckBox1: TRzCheckBox
          Left = 8
          Top = 16
          Width = 115
          Height = 17
          Hint = 'To translate TRzCheckBox add the ".Caption" target'
          Caption = 'One'
          State = cbUnchecked
          TabOrder = 0
        end
      end
      object RzGroupBox16: TRzGroupBox
        Left = 168
        Top = 8
        Width = 153
        Height = 105
        Caption = 'TRzListBox:'
        GroupStyle = gsStandard
        TabOrder = 5
        object RzListBox1: TRzListBox
          Left = 8
          Top = 16
          Width = 137
          Height = 81
          Hint = 'To translate TRzListBox add the ".Items" target'
          ItemHeight = 13
          Items.Strings = (
            'One'
            'Two'
            'Three')
          TabOrder = 0
        end
      end
      object RzGroupBox17: TRzGroupBox
        Left = 168
        Top = 120
        Width = 153
        Height = 49
        Caption = 'TRzComboBox:'
        GroupStyle = gsStandard
        TabOrder = 6
        object RzComboBox1: TRzComboBox
          Left = 8
          Top = 16
          Width = 137
          Height = 21
          Hint = 'To translate TRzComboBox add the ".Items" target'
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'One'
            'Two'
            'Three')
        end
      end
      object RzRadioGroup1: TRzRadioGroup
        Left = 328
        Top = 120
        Width = 153
        Height = 113
        Hint = 'To translate TRzRadioGroup add the ".Items" target'
        Caption = 'TRzRadioGroup:'
        GroupStyle = gsStandard
        ItemFont.Charset = DEFAULT_CHARSET
        ItemFont.Color = clWindowText
        ItemFont.Height = -11
        ItemFont.Name = 'MS Sans Serif'
        ItemFont.Style = []
        Items.Strings = (
          'One'
          'Two'
          'Three')
        TabOrder = 7
      end
      object RzGroupBox18: TRzGroupBox
        Left = 168
        Top = 176
        Width = 153
        Height = 57
        Caption = 'TRzRadioButton:'
        GroupStyle = gsStandard
        TabOrder = 8
        object RzRadioButton2: TRzRadioButton
          Left = 8
          Top = 16
          Width = 137
          Height = 17
          Hint = 'To translate TRzRadioButton add the ".Caption" target'
          Caption = '&One'
          TabOrder = 0
        end
        object RzRadioButton1: TRzRadioButton
          Left = 8
          Top = 32
          Width = 137
          Height = 17
          Hint = 'To translate TRzRadioButton add the ".Caption" target'
          Caption = '&Two'
          TabOrder = 1
        end
      end
      object RzGroupBox5: TRzGroupBox
        Left = 8
        Top = 240
        Width = 473
        Height = 49
        Caption = 'TRzResourceStatus:'
        GroupStyle = gsStandard
        TabOrder = 9
        object RzResourceStatus1: TRzResourceStatus
          Left = 8
          Top = 16
          Width = 457
          ParentShowHint = False
          ResourceType = rtMemory
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Raize List'
      ImageIndex = 1
      object RzGroupBox2: TRzGroupBox
        Left = 8
        Top = 8
        Width = 153
        Height = 105
        Caption = 'TRzCheckList:'
        GroupStyle = gsStandard
        TabOrder = 0
        object RzCheckList1: TRzCheckList
          Left = 8
          Top = 16
          Width = 137
          Height = 81
          Hint = 'To translate TRzCheckList add the ".Items" target'
          ItemHeight = 15
          Items.Strings = (
            'One'
            'Two'
            'Three')
          Items.ItemEnabled = (
            True
            True
            True)
          Items.ItemState = (
            0
            0
            0)
          TabOrder = 0
        end
      end
      object RzGroupBox3: TRzGroupBox
        Left = 8
        Top = 120
        Width = 153
        Height = 105
        Caption = 'TRzTabbedListBox:'
        GroupStyle = gsStandard
        TabOrder = 1
        object RzTabbedListBox1: TRzTabbedListBox
          Left = 8
          Top = 16
          Width = 137
          Height = 81
          Hint = 'To translate TRzTabbedListBox add the ".Items" target'
          ItemHeight = 13
          Items.Strings = (
            'One'
            #9'One'
            #9'Two'
            'Two'
            'Three')
          TabOrder = 0
        end
      end
      object RzGroupBox4: TRzGroupBox
        Left = 168
        Top = 8
        Width = 153
        Height = 49
        Caption = 'TRzColorComboBox:'
        GroupStyle = gsStandard
        TabOrder = 2
        object RzColorComboBox1: TRzColorComboBox
          Left = 8
          Top = 16
          Width = 137
          Height = 21
          Hint = 'To translate TRzColorComboBox add the "TRzColorNames." target'
          ItemHeight = 16
          TabOrder = 0
        end
      end
      object RzGroupBox6: TRzGroupBox
        Left = 8
        Top = 232
        Width = 153
        Height = 105
        Caption = 'TRzEditListBox:'
        GroupStyle = gsStandard
        TabOrder = 3
        object RzEditListBox1: TRzEditListBox
          Left = 8
          Top = 16
          Width = 137
          Height = 81
          Hint = 'To translate TRzEditListBox add the ".Items" target'
          ItemHeight = 13
          Items.Strings = (
            'One'
            'Two'
            'Three')
          TabOrder = 0
        end
      end
      object RzGroupBox7: TRzGroupBox
        Left = 168
        Top = 64
        Width = 153
        Height = 49
        Caption = 'TRzMRUComboBox:'
        GroupStyle = gsStandard
        TabOrder = 4
        object RzMRUComboBox1: TRzMRUComboBox
          Left = 8
          Top = 16
          Width = 137
          Height = 21
          Hint = 'To translate TRzMRUComboBox add the ".Items" target'
          RemoveItemCaption = '&Remove item from history list'
          ItemHeight = 13
          Items.Strings = (
            'One'
            'Two'
            'Three')
          TabOrder = 0
        end
      end
      object RzGroupBox8: TRzGroupBox
        Left = 328
        Top = 8
        Width = 153
        Height = 105
        Caption = 'TRzListView:'
        GroupStyle = gsStandard
        TabOrder = 5
        object RzListView1: TRzListView
          Left = 8
          Top = 16
          Width = 137
          Height = 81
          Hint = 
            'To translate TRzListView add the TIvRaizeModule to the main form' +
            ' and add the ".Items" target'
          Columns = <
            item
              Caption = 'One'
            end
            item
              Caption = 'Two'
            end
            item
              Caption = 'Three'
              Width = 33
            end>
          Items.Data = {
            520000000300000000000000FFFFFFFFFFFFFFFF0000000000000000034F6E65
            00000000FFFFFFFFFFFFFFFF00000000000000000354776F00000000FFFFFFFF
            FFFFFFFF0000000000000000055468726565}
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object RzGroupBox9: TRzGroupBox
        Left = 328
        Top = 120
        Width = 153
        Height = 105
        Caption = 'TRzTreeView:'
        GroupStyle = gsStandard
        TabOrder = 6
        object RzTreeView1: TRzTreeView
          Left = 8
          Top = 16
          Width = 137
          Height = 81
          Hint = 
            'To translate TRzTreeView add the TIvRaizeModule to the main form' +
            ' and add the ".Items" target'
          SelectionPen.Color = clBtnShadow
          Indent = 19
          TabOrder = 0
          Items.Data = {
            030000001C0000000000000000000000FFFFFFFFFFFFFFFF0000000002000000
            034F6E651C0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
            034F6E651C0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
            0354776F1C0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
            0354776F1E0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
            055468726565}
        end
      end
      object RzGroupBox10: TRzGroupBox
        Left = 328
        Top = 232
        Width = 153
        Height = 105
        Caption = 'TRzCheckTree:'
        GroupStyle = gsStandard
        TabOrder = 7
        object RzCheckTree1: TRzCheckTree
          Left = 8
          Top = 16
          Width = 137
          Height = 81
          Hint = 
            'To translate TRzCheckTree add the TIvRaizeModule to the main for' +
            'm and add the ".Items" target'
          Indent = 19
          SelectionPen.Color = clBtnShadow
          TabOrder = 0
          Items.Data = {
            030000001C000000000000000000000001000000FFFFFFFF0000000002000000
            034F6E651C000000000000000000000001000000FFFFFFFF0000000000000000
            034F6E651C000000000000000000000001000000FFFFFFFF0000000000000000
            0354776F1C000000000000000000000001000000FFFFFFFF0000000000000000
            0354776F1E000000000000000000000001000000FFFFFFFF0000000000000000
            055468726565}
        end
      end
      object RzGroupBox11: TRzGroupBox
        Left = 168
        Top = 120
        Width = 153
        Height = 49
        Caption = 'TRzLineComboBox:'
        GroupStyle = gsStandard
        TabOrder = 8
        object RzLineComboBox1: TRzLineComboBox
          Left = 8
          Top = 16
          Width = 137
          Height = 21
          Hint = 'To translate TRzLineComboBox add the ".Items" target'
          Color = clBtnFace
          ItemHeight = 13
          Items.Strings = (
            'One'
            'Two'
            'Three')
          ParentColor = True
          ParentCtl3D = False
          TabOrder = 0
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Raize Misc'
      ImageIndex = 2
      object RzGroupBox19: TRzGroupBox
        Left = 8
        Top = 8
        Width = 153
        Height = 57
        Caption = 'TRzLEDDisplay:'
        GroupStyle = gsStandard
        TabOrder = 0
        object RzLEDDisplay1: TRzLEDDisplay
          Left = 8
          Top = 16
          Width = 137
          Height = 33
          Hint = 'To translate TRzLEDDisplay add the ".Caption" target'
          Caption = 'Test'
        end
      end
      object RzGroupBox21: TRzGroupBox
        Left = 8
        Top = 72
        Width = 153
        Height = 65
        Caption = 'TRzBmpButton:'
        GroupStyle = gsStandard
        TabOrder = 1
        object RzBmpButton1: TRzBmpButton
          Left = 8
          Top = 16
          Width = 137
          Height = 41
          Hint = 'To translate TRzBmpButton add the ".Caption" target'
          Bitmaps.TransparentColor = clOlive
          Color = clBtnFace
          Caption = '&Press this'
          TabOrder = 0
        end
      end
      object RzGroupBox22: TRzGroupBox
        Left = 8
        Top = 144
        Width = 153
        Height = 41
        Caption = 'TRzURLLabel:'
        GroupStyle = gsStandard
        TabOrder = 2
        object RzURLLabel1: TRzURLLabel
          Left = 8
          Top = 16
          Width = 123
          Height = 13
          Hint = 'To translate TRzURLLabel add the ".Caption" target'
          AutoSize = False
          Caption = 'MULTILIZER Home Page'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          BevelWidth = 0
          FrameSides = []
          URL = 'http://www.multilizer.com'
        end
      end
      object RzGroupBox24: TRzGroupBox
        Left = 8
        Top = 192
        Width = 153
        Height = 81
        Caption = 'TRzLookupDialog:'
        GroupStyle = gsStandard
        TabOrder = 3
        object LookupDialogButton: TRzButton
          Left = 8
          Top = 16
          Width = 137
          Hint = 'To translate TRzLookupDialog add the ".Caption" target'
          Caption = '&Press...'
          TabOrder = 0
          OnClick = LookupDialogButtonClick
        end
        object LookupEdit: TRzEdit
          Left = 8
          Top = 48
          Width = 137
          Height = 21
          TabOrder = 1
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Raize Data'
      ImageIndex = 3
      object RzGroupBox25: TRzGroupBox
        Left = 8
        Top = 8
        Width = 481
        Height = 273
        Caption = 'TDBGrid:'
        GroupStyle = gsStandard
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 8
          Top = 16
          Width = 465
          Height = 249
          DataSource = DataSource1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object RzGroupBox26: TRzGroupBox
        Left = 8
        Top = 288
        Width = 153
        Height = 49
        Caption = 'TRzDBLookupDialog:'
        GroupStyle = gsStandard
        TabOrder = 1
        object DBLookupDialogButton: TRzButton
          Left = 8
          Top = 16
          Width = 137
          Caption = '&Press...'
          TabOrder = 0
          OnClick = DBLookupDialogButtonClick
        end
      end
    end
  end
  object RzStatusBar1: TRzStatusBar
    Left = 0
    Top = 386
    Width = 616
    Height = 19
    AutoStyle = False
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    FrameSides = []
    TabOrder = 1
    object RzClockStatus1: TRzClockStatus
      Left = -1
      Top = 1
      Height = 19
      Align = alLeft
    end
    object RzKeyStatus1: TRzKeyStatus
      Left = 149
      Top = 1
      Height = 19
      Align = alLeft
      Enabled = False
    end
    object RzGlyphStatus1: TRzGlyphStatus
      Left = 194
      Top = 1
      Height = 19
      Align = alLeft
      Caption = 'Test'
    end
    object RzProgressBar1: TRzProgressBar
      Left = 294
      Top = 1
      Height = 19
      Align = alLeft
      BackColor = clBtnFace
      BorderInner = fsStatus
      BorderOuter = fsNone
      BorderWidth = 1
      InteriorOffset = 0
      PartsComplete = 0
      Percent = 0
      TotalParts = 0
    end
    object RzMarqueeStatus1: TRzMarqueeStatus
      Left = 494
      Top = 1
      Height = 19
      Align = alLeft
      Caption = 'Test'
    end
  end
  object LanguageButton: TButton
    Left = 520
    Top = 24
    Width = 89
    Height = 25
    Caption = '&Language...'
    TabOrder = 2
    OnClick = LanguageButtonClick
  end
  object RzFrameController1: TRzFrameController
    Left = 520
    Top = 120
  end
  object IvDialogModule1: TIvDialogModule
    Left = 520
    Top = 88
  end
  object IvRaizeModule1: TIvRaizeModule
    Left = 552
    Top = 88
  end
  object RzLauncher1: TRzLauncher
    Action = 'Open'
    Timeout = -1
    Left = 552
    Top = 120
  end
  object PopupMenu1: TPopupMenu
    Left = 520
    Top = 152
    object One1: TMenuItem
      Caption = 'One...'
    end
    object Two1: TMenuItem
      Caption = 'Two'
    end
    object Tree1: TMenuItem
      Caption = 'Three'
    end
  end
  object RzLookupDialog1: TRzLookupDialog
    Prompt = 'Enter the string:'
    List.Strings = (
      'One'
      'Two'
      'Three')
    SearchEdit = LookupEdit
    Caption = 'Lookup Caption'
    CaptionOK = 'OK'
    CaptionCancel = 'Cancel'
    CaptionHelp = '&Help'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 584
    Top = 120
  end
  object RzBalloonHints1: TRzBalloonHints
    Alignment = taLeftJustify
    Bitmaps.TransparentColor = clOlive
    CaptionWidth = 100
    Color = clInfoBk
    BalloonStyle = bsStandard
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HintPause = 500
    HintShortPause = 0
    Shadow = True
    ShowBalloon = True
    Left = 552
    Top = 152
  end
  object RzDBLookupDialog1: TRzDBLookupDialog
    Dataset = Table1
    Prompt = 'Select the birthday'
    KeyField = 'Name'
    SearchField = 'Name'
    ShowNavigatorHints = True
    Caption = 'Database Lookup Caption'
    CaptionOK = 'OK'
    CaptionCancel = 'Cancel'
    CaptionHelp = '&Help'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 584
    Top = 184
  end
  object Table1: TTable
    Active = True
    TableName = '..\sample.DB'
    Left = 520
    Top = 184
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 552
    Top = 184
  end
  object IvBinaryDictionary1: TIvBinaryDictionary
    DictionaryName = 'Dictionary1'
    FileName = 'Project1.mld'
    Storage = ivsEmbedded
    Left = 520
    Top = 56
    DictionaryCode = 4
    Languages = (
      2
      3
      (
        0
        ''
        0
        0
        0
        'Native'
        'Native'
        ''
        0
        False
        True)
      (
        9
        ''
        1
        0
        1252
        'English'
        'English'
        ''
        0
        False
        False)
      (
        11
        ''
        1
        0
        1252
        'Finnish'
        'suomi'
        ''
        0
        False
        False))
    Translations = (
      2
      1
      579
      (
        ' - Dock zone has no control'
        ''
        '65308'
        ''
        ' - kiinnitysalueella ei ole yht‰‰n kontrollia')
      (
        ' - Dock zone not found'
        ''
        '65307'
        ''
        ' - kiinnitysaluetta ei lˆytynyt')
      (
        ' (%dx%d)'
        ''
        '65303'
        ''
        ' (%dx%d)')
      (
        #9'One'
        'TForm1'
        'RzTabbedListBox1'
        ''
        #9'Yksi')
      (
        #9'Two'
        'TForm1'
        'RzTabbedListBox1'
        ''
        #9'Kaksi')
      (
        
          '%d is an invalid PageIndex value.  PageIndex must be between 0 a' +
          'nd %d'
        ''
        '65288'
        ''
        
          '%d on v‰‰r‰ PageIndex:n arvo. PageIndex pit‰‰ olla 0:n ja %d:n v' +
          '‰lill‰')
      (
        
          '%g is not a valid value for field '#39'%s'#39'. The allowed range is %g ' +
          'to %g'
        ''
        '65265'
        ''
        
          '%g ei ole oikea arvo '#39'%s'#39'-kent‰lle. Mahdolliset arvot ovat %g:st' +
          '‰ %g:‰‰n')
      (
        '%s (%s, line %d)'
        ''
        '65503'
        ''
        '%s (%s, rivi %d)')
      (
        #39'%s'#39' is not a valid boolean value for field '#39'%s'#39
        ''
        '65267'
        ''
        #39'%s'#39' ei ole oikea totuusarvo '#39'%s'#39'-kent‰lle')
      (
        #39#39'%s'#39#39' is not a valid component name'
        ''
        '65437'
        ''
        #39#39'%s'#39#39' ei ole oikea komponentin nimi')
      (
        #39'%s'#39' is not a valid date'
        ''
        '65522'
        ''
        #39'%s'#39' ei ole p‰iv‰m‰‰r‰')
      (
        #39'%s'#39' is not a valid date and time'
        ''
        '65524'
        ''
        #39'%s'#39' ei ole oikea p‰iv‰m‰‰r‰ ja aika')
      (
        #39'%s'#39' is not a valid floating point value'
        ''
        '65521'
        ''
        #39'%s'#39' ei ole liukulukuarvo')
      (
        #39'%s'#39' is not a valid floating point value for field '#39'%s'#39
        ''
        '65268'
        ''
        #39'%s'#39' ei ole oikea liukulukuarvo '#39'%s'#39'-kent‰lle')
      (
        #39'%s'#39' is not a valid integer value'
        ''
        '65520'
        ''
        #39'%s'#39' ei ole kokonaislukuarvo')
      (
        #39'%s'#39' is not a valid integer value for field '#39'%s'#39
        ''
        '65266'
        ''
        #39'%s'#39' ei ole oikea kokonaislukuarvo '#39'%s'#39'-kent‰lle')
      (
        #39'%s'#39' is not a valid time'
        ''
        '65523'
        ''
        #39'%s'#39' ei ole aika')
      (
        '%s on %s'
        ''
        '65378'
        ''
        '%s %s:lla')
      (
        '%s property out of range'
        ''
        '65402'
        ''
        '%s-ominaisuus on rajojen ulkopuolella')
      (
        '&Abort'
        ''
        '65359'
        ''
        '&Keskeyt‰')
      (
        '&All'
        ''
        '65330'
        ''
        '&Kaikki')
      (
        '&All'
        ''
        '65391'
        ''
        '&Kaikki')
      (
        '&Close'
        ''
        ''
        ''
        '&Sulje')
      (
        '&Close'
        ''
        '65387'
        ''
        '&Sulje')
      (
        '&Help'
        ''
        '65358'
        ''
        '&Ohje')
      (
        '&Help'
        ''
        '65386'
        ''
        '&Ohje')
      (
        '&Help'
        'TForm1'
        'RzDBLookupDialog1'
        ''
        '&Ohje')
      (
        '&Help'
        'TForm1'
        'RzLookupDialog1'
        ''
        '&Ohje')
      (
        '&Ignore'
        ''
        '65329'
        ''
        '&Ohita')
      (
        '&Ignore'
        ''
        '65388'
        ''
        '&Ohita')
      (
        '&Language...'
        'TForm1'
        'LanguageButton'
        ''
        '&Kieli...')
      (
        '&Move'
        ''
        ''
        ''
        '&Siirt‰minen')
      (
        '&Next'
        ''
        ''
        ''
        '&Seuraava')
      (
        '&No'
        ''
        '65355'
        ''
        '&Ei')
      (
        '&No'
        ''
        '65385'
        ''
        '&Ei')
      (
        '&One'
        'TForm1'
        'RzRadioButton2'
        ''
        '&Yksi')
      (
        '&Press'
        'TForm1'
        'RzButton1'
        ''
        '&Paina')
      (
        '&Press'
        'TForm1'
        'RzMenuButton1'
        ''
        '&Paina')
      (
        '&Press this'
        'TForm1'
        'RzBmpButton1'
        ''
        '&Paina t‰st‰')
      (
        '&Press...'
        'TForm1'
        'DBLookupDialogButton'
        ''
        '&Paina...')
      (
        '&Press...'
        'TForm1'
        'LookupDialogButton'
        ''
        '&Paina...')
      (
        '&Remove item from history list'
        'TForm1'
        'RzMRUComboBox1'
        ''
        '&Poista j‰sen historialistasta')
      (
        '&Restore'
        ''
        ''
        ''
        '&Palauta')
      (
        '&Retry'
        ''
        '65328'
        ''
        '&Yrit‰ uudelleen')
      (
        '&Retry'
        ''
        '65389'
        ''
        '&Yrit‰ uudelleen')
      (
        '&Size'
        ''
        ''
        ''
        '&Koko')
      (
        '&Two'
        'TForm1'
        'RzRadioButton1'
        ''
        '&Kaksi')
      (
        '&Yes'
        ''
        '65354'
        ''
        '&Kyll‰')
      (
        '&Yes'
        ''
        '65384'
        ''
        '&Kyll‰')
      (
        #39'('#39' expected but %s found'
        ''
        '65232'
        ''
        #39'('#39':‰ odotettiin, mutta %s saatiin')
      (
        '(None)'
        ''
        '65319'
        ''
        '(ei mit‰‰n)')
      (
        '(Overflow)'
        ''
        '65273'
        ''
        '(ylivuoto)')
      (
        #39')'#39' expected but %s found'
        ''
        '65233'
        ''
        #39')'#39':‰ odotettiin, mutta %s saatiin')
      (
        #39')'#39' or '#39','#39' expected but %s found'
        ''
        '65234'
        ''
        #39')'#39':‰ tai '#39','#39':‰ odotettiin, mutta %s saatiin')
      (
        '3DDkShadow'
        ''
        ''
        '3D dark shadow'
        'Tumma 3D-varjo')
      (
        '3DLight'
        ''
        ''
        '3D light'
        'Vaalea 3D')
      (
        'A class named %s already exists'
        ''
        '65438'
        ''
        '%s-niminen luokka on jo olemassa')
      (
        'A component named %s already exists'
        ''
        '65436'
        ''
        'Kaksi samaa nime‰ ('#39'%s'#39') %s:ssa')
      (
        'A control cannot have itself as its parent'
        ''
        '65381'
        ''
        'Kontrollin is‰nt‰ ei voi olla kontrolli itse')
      (
        'A dynamic-link library (DLL) file is invalid'
        ''
        '42020'
        ''
        '')
      (
        'A library required separate data segments for each task'
        ''
        '42006'
        ''
        '')
      (
        'A Win32 API function failed'
        ''
        '65475'
        ''
        'Win32API-functio ep‰onnistui')
      (
        'Abort'
        ''
        '65390'
        ''
        'Keskeyt‰')
      (
        'Abstract Error'
        ''
        '65472'
        ''
        'Abstrakti virhe')
      (
        'Access violation at address %p in module '#39'%s'#39'. %s of address %p'
        ''
        '65473'
        ''
        'K‰sittelyvirhe osoitteessa %p, '#39'%s'#39'-modulissa. %s:n osoite %p')
      (
        'Access violation at address %p. %s of address %p'
        ''
        '65513'
        ''
        'K‰sittelyvirhe %p-osoittessa. %s osoite %p')
      (
        'ActiveBorder'
        ''
        ''
        'Active border'
        'Valittu kehys')
      (
        'ActiveCaption'
        ''
        ''
        'Active caption'
        'Valittu otsikko')
      (
        'Aggregate expressions not allowed in filters'
        ''
        '65246'
        ''
        'Yhdistetyt lausekkeet eiv‰t ole mahdollisia suotimissa')
      (
        'All'
        ''
        '65320'
        ''
        'Kaikki')
      (
        'Alt+'
        ''
        '65318'
        ''
        'Alt+')
      (
        
          'An error occurred while attempting to initialize the Borland Dat' +
          'abase Engine (error $%.4x)'
        ''
        '65197'
        ''
        
          'Virhe tapautui kun Borlandin tietokantamoottoria yritettiin alus' +
          'taa (virhe $%.4x)')
      (
        'Ancestor for '#39'%s'#39' not found'
        ''
        '65412'
        ''
        #39'%s'#39':n ‰iti‰ ei lˆydy')
      (
        'Application Error'
        ''
        '65519'
        ''
        'Sovellusvirhe')
      (
        'Application is not licensed to use this feature'
        ''
        '65476'
        ''
        'Sovellusta ei ole lisennˆity k‰ytt‰m‰‰n t‰t‰ ominaisuutta')
      (
        'Application requires Windows 32-bit extensions'
        ''
        '42021'
        ''
        '')
      (
        'Application was designed for a different operating system'
        ''
        '42012'
        ''
        '')
      (
        'Application was designed for MS-DOS 4.0'
        ''
        '42013'
        ''
        '')
      (
        'AppWorkSpace'
        ''
        ''
        'Application work space'
        'Sovellustila')
      (
        'Apr'
        ''
        '65480'
        ''
        'huhti')
      (
        'April'
        ''
        '65460'
        ''
        'huhtikuu')
      (
        'Aqua'
        ''
        ''
        ''
        'Vesi')
      (
        'Arithmetic in filter expressions not supported'
        ''
        '65243'
        ''
        'Suodinlausekkeessa ei voi k‰ytt‰‰ aritmetiikkaa')
      (
        'Assertion failed'
        ''
        '65500'
        ''
        'Testaus ep‰onnistui')
      (
        'Aug'
        ''
        '65484'
        ''
        'elo')
      (
        'August'
        ''
        '65464'
        ''
        'elokuu')
      (
        'Australia'
        ''
        ''
        ''
        'Australia')
      (
        'Background'
        ''
        ''
        ''
        'Tausta')
      (
        'BDE error $%.4x'
        ''
        '65199'
        ''
        'BDE virhe $%.4x')
      (
        'Belize'
        ''
        ''
        ''
        'Belize')
      (
        'Bitmap image is not valid'
        ''
        '65413'
        ''
        'Bittikarttakuva ei ole oikea')
      (
        'Bitmaps'
        ''
        '65364'
        ''
        'Bittikartat')
      (
        'Bits index out of range'
        ''
        '65296'
        ''
        'Bitin indeksi on rajojen ulkopuolella')
      (
        'BkSp'
        ''
        '65333'
        ''
        'BkSp')
      (
        'Black'
        ''
        ''
        ''
        'Musta')
      (
        'Blue'
        ''
        ''
        ''
        'Sininen')
      (
        'BtnFace'
        ''
        ''
        'Button face'
        'Painike')
      (
        'BtnHighlight'
        ''
        ''
        'Button highlight'
        'Valaistu painike')
      (
        'BtnShadow'
        ''
        ''
        'Button shadow'
        'Painikkeen varjo')
      (
        'BtnText'
        ''
        ''
        'Button text'
        'Painikkeen teksti')
      (
        'Canada'
        ''
        ''
        ''
        'Kanada')
      (
        'Cancel'
        ''
        ''
        ''
        'Peruuta')
      (
        'Cancel'
        ''
        '65357'
        ''
        'Peruuta')
      (
        'Cancel'
        ''
        '65383'
        ''
        'Peruuta')
      (
        'Cancel'
        'TForm1'
        'RzDBLookupDialog1'
        ''
        'Peruuta')
      (
        'Cancel'
        'TForm1'
        'RzLookupDialog1'
        ''
        'Peruuta')
      (
        'Cancel edit'
        ''
        '65202'
        ''
        'Peru tietue')
      (
        'Cannot access field '#39'%s'#39' as type %s'
        ''
        '65295'
        ''
        #39'%s'#39'-kentt‰‰ ei voitu k‰sitell‰ %s-tyyppin‰')
      (
        'Cannot access field '#39'%s'#39' in a filter'
        ''
        '65173'
        ''
        'Ei voi k‰sitell‰ suotimessa olavaa '#39'%s'#39'-tietuetta')
      (
        'Cannot access index field '#39'%s'#39
        ''
        '65248'
        ''
        'Indeksoitua '#39'%s'#39'-kentt‰‰ ei voi k‰sitell‰')
      (
        
          'Cannot add a session to the form or data-module while session '#39'%' +
          's'#39' has AutoSessionName enabled'
        ''
        '65214'
        ''
        
          'Lomakkeelle tai datamodulille ei voi asettaa sessiota, jos '#39'%s'#39'-' +
          'sessiolla on AutoSessionName tosi')
      (
        'Cannot assign a %s to a %s'
        ''
        '65451'
        ''
        'Ei voi sijoittaa %s:ta %s:n')
      (
        'Cannot change the size of an icon'
        ''
        '65416'
        ''
        'Ikonin kokoa ei voi muuttaa')
      (
        'Cannot change Visible in OnShow or OnHide'
        ''
        '65400'
        ''
        'OnShow- ja OnHide-eventeiss‰ ei voi muuttaa Visible-ominaisuutta')
      (
        'Cannot connect to database '#39'%s'#39
        ''
        '65196'
        ''
        #39'%s'#39'-tietokantaa ei voitu ottaa yhteytt‰')
      (
        'Cannot create file %s'
        ''
        '65452'
        ''
        'Ei voi luoda %s-tiedostoa')
      (
        'Cannot create form. No MDI forms are currently active'
        ''
        '65380'
        ''
        
          'Lomaketta ei voitu luoda. Yht‰‰n MDI-lomaketta ei ole aktiivisen' +
          'a')
      (
        'Cannot drag a form'
        ''
        '65360'
        ''
        'Lomaketta ei voi vet‰‰')
      (
        
          'Cannot enable AutoSessionName property with more than one sessio' +
          'n on a form or data-module'
        ''
        '65213'
        ''
        
          'AutoSessionName-ominaisuutta ei asettaa kuin yhdelle lomakkeen t' +
          'ai datamodulin sessiolle')
      (
        'Cannot focus a disabled or invisible window'
        ''
        '65397'
        ''
        'J‰‰dytetty tai n‰kym‰tˆn ikkuna ei voi saada fokusta')
      (
        'Cannot hide an MDI Child Form'
        ''
        '65399'
        ''
        'MDI-lapsilomaketta ei voi k‰tke‰')
      (
        'Cannot insert or delete rows from grid'
        ''
        '65370'
        ''
        'Revej‰ ei voi poistaa tai lis‰t‰ taulukkoon')
      (
        'Cannot load a compressed executable file'
        ''
        '42019'
        ''
        '')
      (
        'Cannot load a real-mode application'
        ''
        '42015'
        ''
        '')
      (
        
          'Cannot load a second instance of an executable file containing m' +
          'ultiple, non-read-only data segments'
        ''
        '42016'
        ''
        '')
      (
        'Cannot make a visible window modal'
        ''
        '65401'
        ''
        'N‰kyv‰‰ ikkunaa ei voi tehd‰ modaaliksi')
      (
        'Cannot modify a read-only dataset'
        ''
        '65258'
        ''
        'Luettavaa tietojoukkua ei voi muokata')
      (
        'Cannot modify SessionName while AutoSessionName is enabled'
        ''
        '65215'
        ''
        'SessionName:a ei voi muokata, jos AutoSessionName on tosi')
      (
        'Cannot open clipboard'
        ''
        '65324'
        ''
        'Leikekirjaa ei voitu avata')
      (
        'Cannot open file %s'
        ''
        '65453'
        ''
        'Ei voi avata %s-tiedostoa')
      (
        'Cannot perform this operation on a closed database'
        ''
        '65190'
        ''
        'T‰t‰ toimintoa ei voida suorittaa suljetulle tietokannalle')
      (
        'Cannot perform this operation on a closed dataset'
        ''
        '65256'
        ''
        'T‰t‰ toimintoa ei voi suorittaa suljetulle tietojoukolle')
      (
        'Cannot perform this operation on an active session'
        ''
        '65192'
        ''
        'T‰t‰ toimintoa ei voida suorittaa aktiiviselle sessiolle')
      (
        'Cannot perform this operation on an empty dataset'
        ''
        '65257'
        ''
        'T‰t‰ toimintoa ei voi suorittaa tyhj‰lle tietojoukolle')
      (
        'Cannot perform this operation on an open database'
        ''
        '65189'
        ''
        'T‰t‰ toimintoa ei voida suorittaa avatulle tietokannalle')
      (
        'Cannot perform this operation on an open dataset'
        ''
        '65254'
        ''
        'Avonaiselle tietojoukolle ei voi suorittaa t‰t‰ toimintoa')
      (
        'Can'#39't write to a read-only resource stream'
        ''
        '65425'
        ''
        'Luettavaan resurssivirtaan ei voi kirjoittaa')
      (
        'Canvas does not allow drawing'
        ''
        '65420'
        ''
        'Kanvakselle ei voi piirt‰‰')
      (
        'CaptionText'
        ''
        ''
        'Caption text'
        'Otsikon teksti')
      (
        'Caribbean'
        ''
        ''
        ''
        '')
      (
        'Circular datalinks are not allowed'
        ''
        '65251'
        ''
        'Ympyr‰datalinkit eiv‰t ole sallittuja')
      (
        'Class %s not found'
        ''
        '65426'
        ''
        '%s-luokkaa ei lˆytynyt')
      (
        'Clipboard does not support Icons'
        ''
        '65323'
        ''
        'Leikekirja ei tue ikoneja')
      (
        'Column parameter out of range'
        ''
        '42472'
        ''
        '')
      (
        'Confirm'
        ''
        '65353'
        ''
        'Vahvista')
      (
        'Constant is not correct type %s'
        ''
        '65245'
        ''
        'Vakio ei ole oikeaa %s-tyyppi‰')
      (
        'Constant out of range'
        ''
        '65238'
        ''
        'Vakio on rajojen ulkopuolella')
      (
        'Control '#39'%s'#39' has no parent window'
        ''
        '65398'
        ''
        #39'%s'#39'-kontrollilla ei ole is‰nt‰ikkunaa')
      (
        'Control-C hit'
        ''
        '65515'
        ''
        'Kontrolli-C painettu')
      (
        'Ctrl+'
        ''
        '65317'
        ''
        'Ctrl+')
      (
        'Custom'
        ''
        ''
        ''
        'Oma')
      (
        'Database handle owned by a different session'
        ''
        '65191'
        ''
        'Toinen sessio omista tietokannan kahvan')
      (
        'Database Lookup Caption'
        'TForm1'
        'RzDBLookupDialog1'
        ''
        'Tietokannan katselun otsikko')
      (
        'Database name missing'
        ''
        '65187'
        ''
        'Tietokantanimi puuttuu')
      (
        'Dataset not in edit or insert mode'
        ''
        '65255'
        ''
        'Tietojoukko ei ole editointi- tai lis‰ystilassa')
      (
        'DataSource cannot be changed'
        ''
        '65253'
        ''
        'DataSource:a ei voi muuttaa')
      (
        'Dec'
        ''
        '65456'
        ''
        'joulu')
      (
        'December'
        ''
        '65468'
        ''
        'joulukuu')
      (
        'Default'
        ''
        ''
        ''
        'Oletus')
      (
        'Del'
        ''
        '65315'
        ''
        'Del')
      (
        'Delete all selected records?'
        ''
        '65205'
        ''
        'Poistetaanko kaikki valitut tietueet?')
      (
        'Delete record'
        ''
        '65231'
        ''
        'Poista tietue')
      (
        'Delete record?'
        ''
        '65204'
        ''
        'Poistetaanko tietue?')
      (
        'Disk full'
        ''
        '65534'
        ''
        'Levy on t‰ynn‰')
      (
        'Division by zero'
        ''
        '65504'
        ''
        'Nollalla jako')
      (
        'Docked control must have a name'
        ''
        '65305'
        ''
        'Kiinitetyll‰ kontrollilla t‰ytyy olla nimi')
      (
        'Down'
        ''
        '65313'
        ''
        'Alanuoli')
      (
        'Duplicate database name '#39'%s'#39
        ''
        '65184'
        ''
        'Tietokantanimi '#39'%s'#39' ei ole yksiselitteinen')
      (
        'Duplicate field name '#39'%s'#39
        ''
        '65293'
        ''
        'Kaksi samaa kent‰n nime‰ '#39'%s'#39)
      (
        'Duplicate session name '#39'%s'#39
        ''
        '65185'
        ''
        'Sessionimi '#39'%s'#39' ei ole yksiselitteinen')
      (
        'Edit record'
        ''
        '65200'
        ''
        'Muokkaa tietuetta')
      (
        'Email'
        ''
        ''
        ''
        'S‰hkˆposti')
      (
        'End'
        ''
        '65340'
        ''
        'End')
      (
        'English'
        ''
        ''
        ''
        'englanti')
      (
        'Enhanced Metafiles'
        ''
        '65362'
        ''
        'Parannetut Metatiedostot')
      (
        'Enter'
        ''
        '65336'
        ''
        'Enter')
      (
        'Enter the string:'
        'TForm1'
        'RzLookupDialog1'
        ''
        'Anna merkkijono:')
      (
        'Error'
        ''
        '65351'
        ''
        'Virhe')
      (
        'Error creating cursor handle'
        ''
        '65193'
        ''
        'Kursorikahvaa ei voitu luoda')
      (
        'Error creating variant array'
        ''
        '65496'
        ''
        'Varianttitaulukon luonnissa tapahtui virhe')
      (
        'Error creating window class'
        ''
        '65396'
        ''
        'Virhe tapahtui luotaessa ikkunaluokkaa')
      (
        'Error creating window device context'
        ''
        '65395'
        ''
        'Virhe tapahtui luotaessa ikkunan laitekontekstia')
      (
        'Error reading %s%s%s: %s'
        ''
        '65411'
        ''
        'Virhe lukiessa %s.%s: %s')
      (
        'Error removing control from dock tree'
        ''
        '65306'
        ''
        'Kontrollia ei voitu poistaa kiinnityspuusta')
      (
        'Esc'
        ''
        '65335'
        ''
        'Esc')
      (
        'Exception %s in module %s at %p.'#10'%s%s'
        ''
        '65518'
        ''
        '%s-poikkeus %s-modulissa osoitteessa %p.'#10'%s%s')
      (
        'Exception in safecall method'
        ''
        '65502'
        ''
        '')
      (
        'Execute not supported: %s'
        ''
        '65223'
        ''
        '')
      (
        'Expression expected but %s found'
        ''
        '65235'
        ''
        'Lauseketta odotettiin, mutta %s saatiin')
      (
        'Expression is not an aggregate expression'
        ''
        '65244'
        ''
        'Lauseke ei ole yhdistetty lauseke')
      (
        'External exception %x'
        ''
        '65499'
        ''
        'Ulkoinen poikkeus %x')
      (
        'Failed to clear tab control'
        ''
        '65310'
        ''
        'Sarkainkontrollia ei voitu tyhj‰t‰')
      (
        'Failed to create key %s'
        ''
        '65298'
        ''
        '%s-avainta ei voitu luoda')
      (
        'Failed to delete tab at index %d'
        ''
        '65311'
        ''
        'Sarkainta ei pystytty poistamaan indeksist‰ %d')
      (
        'Failed to get data for '#39'%s'#39
        ''
        '65300'
        ''
        'Tietoa ei voitu saada '#39'%s'#39':ta')
      (
        'Failed to get object at index %d'
        ''
        '65281'
        ''
        'Oloita eo pystytty hakemaan indeksist‰ %d')
      (
        'Failed to read ImageList data from stream'
        ''
        '65393'
        ''
        'Kuvalistan dataa ei voitu lukea virrasta')
      (
        'Failed to retrieve tab at index %d'
        ''
        '65280'
        ''
        'Sarkainta ei pystytty hakemaan indeksist‰ %d')
      (
        'Failed to set data for '#39'%s'#39
        ''
        '65299'
        ''
        'Tietoa ei voitu asettaa '#39'%s'#39':lle')
      (
        'Failed to set object at index %d'
        ''
        '65283'
        ''
        'Oliota ei pystytty asettamaan indeksiin %d')
      (
        'Failed to set tab "%s" at index %d'
        ''
        '65282'
        ''
        '"%s"-sarkainta ei pystytty asettamaan indeksiin %d')
      (
        'Failed to write ImageList data to stream'
        ''
        '65394'
        ''
        'Kuvalistan dataa ei voitu kirjoittaa virtaan')
      (
        'False'
        ''
        '65217'
        ''
        'ep‰tosi')
      (
        'Feb'
        ''
        '65478'
        ''
        'helmi')
      (
        'February'
        ''
        '65458'
        ''
        'helmikuu')
      (
        'Field '#39'%s'#39' cannot be a calculated or lookup field'
        ''
        '65276'
        ''
        #39'%s'#39'-kentt‰ ei voi olla laskettu- tai hakukentt‰')
      (
        'Field '#39'%s'#39' cannot be modified'
        ''
        '65277'
        ''
        #39'%s'#39'-kent‰‰ ei voi muokata')
      (
        'Field '#39'%s'#39' cannot be used in a filter expression'
        ''
        '65236'
        ''
        #39'%s'#39'-kentt‰‰ ei voi k‰ytt‰‰ suotimen lausekkeessa')
      (
        'Field '#39'%s'#39' has no dataset'
        ''
        '65275'
        ''
        #39'%s'#39'-kent‰ll‰ ei ole tietojoukkoa')
      (
        'Field '#39'%s'#39' is not indexed and cannot be modified'
        ''
        '65279'
        ''
        #39'%s'#39'-kentt‰ ei ole indeksoitu eik‰ sit‰ voi muokata')
      (
        
          'Field '#39'%s'#39' is not the correct type of calculated field to be use' +
          'd in an aggregate, use an internalcalc'
        ''
        '65224'
        ''
        '')
      (
        'Field '#39'%s'#39' is of an unknown type'
        ''
        '65291'
        ''
        #39'%s'#39'-kentt‰ll‰ on tuntematon tyyppi')
      (
        'Field '#39'%s'#39' is of an unsupported type'
        ''
        '65221'
        ''
        #39'%s'#39'-tietueen tyyppi‰ ei tueta')
      (
        'Field '#39'%s'#39' must have a value'
        ''
        '65274'
        ''
        #39'%s'#39'-kent‰ll‰ t‰ytyy olla arvo')
      (
        'Field '#39'%s'#39' not found'
        ''
        '65294'
        ''
        #39'%s'#39'-kentt‰‰ ei lˆytynyt')
      (
        'Field index out of range'
        ''
        '65278'
        ''
        'Kent‰n indeksi on rajojen ulkopuolella')
      (
        'Field name missing'
        ''
        '65292'
        ''
        'Kent‰n nimi puuttuu')
      (
        'File access denied'
        ''
        '65532'
        ''
        'Tietoston k‰sittely ei ole mahdollista')
      (
        
          'File is not a Windows application or there was an error in the .' +
          'EXE image'
        ''
        '42011'
        ''
        '')
      (
        'File load error'
        ''
        '65347'
        ''
        'Tiedoston latausvirhe')
      (
        'File not found'
        ''
        '65529'
        ''
        'Tiedostoa ei lˆydy')
      (
        'File was not found'
        ''
        '42002'
        ''
        '')
      (
        'Filter expression incorrectly terminated'
        ''
        '65260'
        ''
        'Suotimen kaava on v‰‰rin lopetettu')
      (
        'Finland'
        ''
        ''
        ''
        'Suomi')
      (
        'Finnish'
        ''
        ''
        ''
        'suomi')
      (
        'First record'
        ''
        '65226'
        ''
        'Ensimm‰inen tietue')
      (
        'FirstName'
        ''
        ''
        'First Name'
        'Etunimi')
      (
        'Fixed column count must be less than column count'
        ''
        '65368'
        ''
        
          'Kiinteiden sarakkeiden m‰‰r‰n on oltava v‰hemm‰n kuin v‰hemm‰n k' +
          'uin sarakkeiden kokonaism‰‰r‰n')
      (
        'Fixed row count must be less than row count'
        ''
        '65369'
        ''
        
          'Kiinteiden rivien m‰‰r‰n on oltava v‰hemm‰n kuin rivien kokonais' +
          'm‰‰r‰n')
      (
        'Floating point division by zero'
        ''
        '65508'
        ''
        'Liukuluvun nollalla jako')
      (
        'Floating point overflow'
        ''
        '65509'
        ''
        'Liukuluvun ylivuoto')
      (
        'Floating point underflow'
        ''
        '65510'
        ''
        'Liukuluvun alivuoto')
      (
        'Format '#39'%s'#39' invalid or incompatible with argument'
        ''
        '65488'
        ''
        #39'%s'#39'-muoto on v‰‰r‰ tai sopimaton argumentiksi')
      (
        'Format string too long'
        ''
        '65495'
        ''
        'Muotoilumerkkijono on liian pitk‰')
      (
        'Fri'
        ''
        '65442'
        ''
        'pe')
      (
        'Friday'
        ''
        '65449'
        ''
        'perjantai')
      (
        'Fuchsia'
        ''
        ''
        ''
        'Purppura')
      (
        'GDI'
        ''
        ''
        ''
        'GDI')
      (
        'Gray'
        ''
        ''
        ''
        'Harmaa')
      (
        'GrayText'
        ''
        ''
        'Gray text'
        'Harmaa teksti')
      (
        'Green'
        ''
        ''
        ''
        'Vihre‰')
      (
        'Grid index out of range'
        ''
        '65367'
        ''
        'Taulukon indeksi on rajojen ulkopuolella')
      (
        'Grid requested to display more than 256 columns'
        ''
        '65209'
        ''
        'Talukkoa on pyydetty n‰ytt‰m‰‰n enemm‰n kuin 256 saraketta')
      (
        'Grid too large for operation'
        ''
        '65365'
        ''
        'Taulukko on liian suuri operaatiolle')
      (
        'GroupIndex cannot be less than a previous menu item'#39's GroupIndex'
        ''
        '65379'
        ''
        
          'GroupIndex ei voi olla v‰hemm‰n kuin edellisen valikon GroupInde' +
          'x')
      (
        'Highlight'
        ''
        ''
        ''
        'Valaistu')
      (
        'HighlightText'
        ''
        ''
        'Highlight text'
        'Valaistu teksti')
      (
        'Home'
        ''
        '65341'
        ''
        'Home')
      (
        'I/O error %d'
        ''
        '65528'
        ''
        'I/O-virhe %d')
      (
        'Icon image is not valid'
        ''
        '65414'
        ''
        'Ikonikuva ei ole oikea')
      (
        'Icons'
        ''
        '65363'
        ''
        'Ikonit')
      (
        'IN predicate list may not be empty'
        ''
        '65247'
        ''
        'IN-predikaattilista ei voi olla tyhj‰')
      (
        'InactiveBorder'
        ''
        ''
        'Inactive border'
        'Toimeton kehys')
      (
        'InactiveCaption'
        ''
        ''
        'Inactive caption'
        'Toimeton otsikko')
      (
        'InactiveCaptionText'
        ''
        ''
        'Inactive caption text'
        'Toimettoman otsikon teksti')
      (
        'Incorrect version of Windows'
        ''
        '42010'
        ''
        '')
      (
        'Incorrectly formed filter expression'
        ''
        '65239'
        ''
        'V‰‰rin muotoiltu suodinlauseke')
      (
        'Index '#39'%s'#39' not found'
        ''
        '65250'
        ''
        #39'%s'#39'-indeksi‰ ei lˆydy')
      (
        'Index does not exist. Index: %s'
        ''
        '65168'
        ''
        'Indeksi‰ ei ole olemassa. Indeksi: %s')
      (
        'InfoBk'
        ''
        ''
        'Info background'
        'Info-tausta')
      (
        'Information'
        ''
        '65352'
        ''
        'Erikois')
      (
        'InfoText'
        ''
        ''
        'Info text'
        'Info-teksti')
      (
        'Ins'
        ''
        '65314'
        ''
        'Ins')
      (
        'Insert record'
        ''
        '65230'
        ''
        'Lis‰‰ tietue')
      (
        'Insufficient memory to start application'
        ''
        '42008'
        ''
        '')
      (
        'Integer overflow'
        ''
        '65506'
        ''
        'Kokonaisluvun ylivuoto')
      (
        'Interface not supported'
        ''
        '65501'
        ''
        'Rajapintaa ei tueta')
      (
        'Invalid alias name %s'
        ''
        '65172'
        ''
        'V‰‰r‰ alias-nimi - %s')
      (
        'Invalid argument to date encode'
        ''
        '65526'
        ''
        'V‰‰r‰t arvot p‰iv‰m‰‰r‰n koodauksessa')
      (
        'Invalid argument to time encode'
        ''
        '65525'
        ''
        'V‰‰r‰t arvot ajan koodauksessa')
      (
        'Invalid class typecast'
        ''
        '65512'
        ''
        'V‰‰r‰ luokan tyyppimuunnos')
      (
        'Invalid clipboard format'
        ''
        '65322'
        ''
        'V‰‰r‰ leikekirjaformaatti')
      (
        'Invalid data type for '#39'%s'#39
        ''
        '65297'
        ''
        'V‰‰r‰ tietotyyppi '#39'%s'#39':lle')
      (
        'Invalid field size'
        ''
        '65289'
        ''
        'V‰‰r‰ kent‰n koko')
      (
        'Invalid FieldKind'
        ''
        '65290'
        ''
        'V‰‰r‰ FieldKind')
      (
        'Invalid filename'
        ''
        '65530'
        ''
        'V‰‰r‰ tiedostonimi')
      (
        'Invalid filter expression character: '#39'%s'#39
        ''
        '65263'
        ''
        'V‰‰r‰ suodinlausekkeen merkki: '#39'%s'#39)
      (
        'Invalid floating point operation'
        ''
        '65507'
        ''
        'V‰‰r‰ luikulukuoperaatio')
      (
        'Invalid image size'
        ''
        '65421'
        ''
        'V‰‰r‰ kuvan koko')
      (
        'Invalid ImageList'
        ''
        '65422'
        ''
        'V‰‰r‰ kuvalistan')
      (
        'Invalid ImageList Index'
        ''
        '65392'
        ''
        'V‰‰r‰ kuvalistan indeksi')
      (
        'Invalid index'
        ''
        '65285'
        ''
        'V‰‰r‰ indeksi')
      (
        'Invalid input value'
        ''
        '65375'
        ''
        'V‰‰r‰ syˆtt‰arvo')
      (
        'Invalid input value.  Use escape key to abandon changes'
        ''
        '65344'
        ''
        'V‰‰r‰ syˆttˆarvo. K‰yt‰ Esc-n‰pp‰int‰ peruaksesi muutokset')
      (
        'Invalid numeric input'
        ''
        '65535'
        ''
        'V‰‰r‰ numeerinen syˆttˆ')
      (
        'Invalid outline index'
        ''
        '65345'
        ''
        'V‰‰r‰ outline-indeksi')
      (
        'Invalid owner'
        ''
        '65287'
        ''
        'V‰‰r‰ omistaja')
      (
        'Invalid pointer operation'
        ''
        '65511'
        ''
        'V‰‰r‰ osoitinoperaatio')
      (
        'Invalid property path'
        ''
        '65408'
        ''
        'V‰‰r‰ ominaisuuden polku')
      (
        'Invalid property value'
        ''
        '65371'
        ''
        'V‰‰r‰ ominaisuuden arvo')
      (
        'Invalid property value'
        ''
        '65439'
        ''
        'V‰‰r‰ ominaisuuden arvo')
      (
        'Invalid selection'
        ''
        '65346'
        ''
        'V‰‰r‰ valinta')
      (
        'Invalid session name %s'
        ''
        '65186'
        ''
        'V‰‰r‰ sessionimi %s')
      (
        'Invalid stream format'
        ''
        '65427'
        ''
        'V‰‰r‰ virtamuoto')
      (
        'Invalid use of keyword'
        ''
        '65216'
        ''
        'Avainsanan v‰‰r‰ k‰yttˆ')
      (
        'Invalid value for current item'
        ''
        '65374'
        ''
        'Nykyisell‰ j‰senell‰ on v‰‰r‰ arvo')
      (
        'Invalid value for field '#39'%s'#39
        ''
        '65264'
        ''
        #39'%s'#39'-kent‰ll‰ on v‰‰r‰ arvo')
      (
        'Invalid variant operation'
        ''
        '65491'
        ''
        'V‰‰r‰ variantin toiminto')
      (
        'Invalid variant type conversion'
        ''
        '65490'
        ''
        'V‰‰r‰ variantin tyyppimuunnos')
      (
        'Invalid variant type or size for field '#39'%s'#39
        ''
        '65271'
        ''
        'V‰‰r‰ variantin tyyppi tai koko '#39'%s'#39'-kent‰lle')
      (
        'Ireland'
        ''
        ''
        ''
        'Irlanti')
      (
        'Jamaica'
        ''
        ''
        ''
        'Jamaika')
      (
        'Jan'
        ''
        '65477'
        ''
        'tammi')
      (
        'January'
        ''
        '65457'
        ''
        'tammikuu')
      (
        'Jul'
        ''
        '65483'
        ''
        'hein‰')
      (
        'July'
        ''
        '65463'
        ''
        'hein‰kuu')
      (
        'Jun'
        ''
        '65482'
        ''
        'kes‰')
      (
        'June'
        ''
        '65462'
        ''
        'kes‰kuu')
      (
        'Last record'
        ''
        '65229'
        ''
        'Viimeinen tietue')
      (
        'LastName'
        ''
        ''
        'Last Name'
        'Sukunimi')
      (
        'Left'
        ''
        '65342'
        ''
        'Vasen')
      (
        'Lime'
        ''
        ''
        ''
        'Sitruuna')
      (
        'Line too long'
        ''
        '65348'
        ''
        'Rivi on liian pitk‰')
      (
        'List capacity out of bounds (%d)'
        ''
        '65430'
        ''
        'Listan kapasiteetti on rajojen ulkopuolella (%d)')
      (
        'List count out of bounds (%d)'
        ''
        '65431'
        ''
        'Listan koko on rajojen ulkopuolella (%d)')
      (
        'List does not allow duplicates ($0%x)'
        ''
        '65309'
        ''
        '')
      (
        'List index out of bounds (%d)'
        ''
        '65429'
        ''
        'Listan indeksi on rajojen ulkopuolella (%d)')
      (
        'Lookup Caption'
        'TForm1'
        'RzLookupDialog1'
        ''
        'Katselun otsikko')
      (
        'Lookup information for field '#39'%s'#39' is incomplete'
        ''
        '65252'
        ''
        #39'%s'#39'-kent‰n katsontatiedot ovat ep‰t‰ydellisi‰')
      (
        'Ma&ximize'
        ''
        ''
        ''
        '&Suurennus')
      (
        'Mar'
        ''
        '65479'
        ''
        'maalis')
      (
        'March'
        ''
        '65459'
        ''
        'maaliskuu')
      (
        'Maroon'
        ''
        ''
        ''
        'Ruskea')
      (
        'Maximum outline depth exceeded'
        ''
        '65349'
        ''
        'Suuri outline-syvyys ylitetty')
      (
        'May'
        ''
        '65461'
        ''
        'touko')
      (
        'May'
        ''
        '65481'
        ''
        'touko')
      (
        'Memory'
        ''
        ''
        ''
        'Muisti')
      (
        'Menu'
        ''
        ''
        ''
        'Valikko')
      (
        'Menu '#39'%s'#39' is already being used by another form'
        ''
        '65301'
        ''
        #39'%s'#39'-valikkoa k‰ytt‰‰ jo toinen lomake')
      (
        'Menu index out of range'
        ''
        '65403'
        ''
        'Valikon indeksi on rajojen ulkopuolella')
      (
        'Menu inserted twice'
        ''
        '65404'
        ''
        'Valikko on lis‰tty kahdesti')
      (
        'MenuText'
        ''
        ''
        'Menu text'
        'Valikon teksti')
      (
        'Metafile is not valid'
        ''
        '65415'
        ''
        'Metafile ei ole oikea')
      (
        'Metafiles'
        ''
        '65361'
        ''
        'Metatiedostot')
      (
        'Method '#39'%s'#39' not supported by automation object'
        ''
        '65211'
        ''
        'OLE-olio ei tue '#39'%s'#39'-metodia')
      (
        'Mi&nimize'
        ''
        ''
        ''
        '&Pienennys')
      (
        'Missing DataSetField property'
        ''
        '65170'
        ''
        'DataSetField-ominaisuus puuttuu')
      (
        'Missing TableName property'
        ''
        '65169'
        ''
        'TableName-ominaisuus puuttuu')
      (
        'Mon'
        ''
        '65470'
        ''
        'ma')
      (
        'Monday'
        ''
        '65445'
        ''
        'maanantai')
      (
        'MultiLine must be True when TabPosition is tpLeft or tpRight'
        ''
        '65284'
        ''
        
          'MultiLine:n on oltava tosi, kun TabPosition on tpLeft tai tpRigh' +
          't')
      (
        'MULTILIZER Home Page'
        'TForm1'
        'RzURLLabel1'
        ''
        'MULTILIZER:n kotisivu')
      (
        'N&o to All'
        ''
        '65331'
        ''
        '&Ei kaikkiin')
      (
        'Navy'
        ''
        ''
        ''
        'Laivasto')
      (
        'Nested dataset must inherit from %s'
        ''
        '65259'
        ''
        'Sis‰kk‰isten tietojoukkojen pit‰‰ olla peritty %s:st‰')
      (
        'New Zealand'
        ''
        ''
        ''
        'Uusi-Seelanti')
      (
        'Next record'
        ''
        '65228'
        ''
        'Seuraava tietue')
      (
        'No argument for format '#39'%s'#39
        ''
        '65489'
        ''
        #39'%s'#39'-muodossa ei ole argumenttia')
      (
        'No association for specified file type'
        ''
        '42031'
        ''
        '')
      (
        'No index for fields '#39'%s'#39
        ''
        '65249'
        ''
        #39'%s'#39'-kentille ei ole indeksi‰')
      (
        'No value for parameter '#39'%s'#39
        ''
        '65195'
        ''
        #39'%s'#39'-parametrilla ei ole arvoa')
      (
        'Not enough timers available'
        ''
        '65406'
        ''
        'Ajanottajia ei ole tarpeeksi')
      (
        'Not in cached update mode'
        ''
        '65171'
        ''
        'Ei ole v‰limuistip‰ivitystilassa')
      (
        'nothing'
        ''
        '65240'
        ''
        'ei mit‰‰n')
      (
        'Nov'
        ''
        '65487'
        ''
        'marras')
      (
        'November'
        ''
        '65467'
        ''
        'marraskuu')
      (
        'NULL only allowed with '#39'='#39' and '#39'<>'#39
        ''
        '65237'
        ''
        'NULL on sallittu vain '#39'='#39':n ja '#39'<>'#39':n kanssa')
      (
        'Oct'
        ''
        '65486'
        ''
        'loka')
      (
        'October'
        ''
        '65466'
        ''
        'lokakuu')
      (
        'OK'
        ''
        ''
        ''
        'OK')
      (
        'OK'
        ''
        '65356'
        ''
        'OK')
      (
        'OK'
        ''
        '65382'
        ''
        'OK')
      (
        'OK'
        'TForm1'
        'RzDBLookupDialog1'
        ''
        'OK')
      (
        'OK'
        'TForm1'
        'RzLookupDialog1'
        ''
        'OK')
      (
        'OLE error %.8x'
        ''
        '65210'
        ''
        'OLE-virhe %.8x')
      (
        'Olive'
        ''
        ''
        ''
        'Oliivi')
      (
        'One'
        'TForm1'
        'RzCheckBox1'
        ''
        'Yksi')
      (
        'One'
        'TForm1'
        'RzCheckList1'
        ''
        'Yksi')
      (
        'One'
        'TForm1'
        'RzCheckTree1'
        ''
        'Yksi')
      (
        'One'
        'TForm1'
        'RzComboBox1'
        ''
        'Yksi')
      (
        'One'
        'TForm1'
        'RzEditListBox1'
        ''
        'Yksi')
      (
        'One'
        'TForm1'
        'RzLabel1'
        ''
        'Yksi')
      (
        'One'
        'TForm1'
        'RzLineComboBox1'
        ''
        'Yksi')
      (
        'One'
        'TForm1'
        'RzListBox1'
        ''
        'Yksi')
      (
        'One'
        'TForm1'
        'RzListView1'
        ''
        'Yksi')
      (
        'One'
        'TForm1'
        'RzLookupDialog1'
        ''
        'Yksi')
      (
        'One'
        'TForm1'
        'RzMRUComboBox1'
        ''
        'Yksi')
      (
        'One'
        'TForm1'
        'RzRadioGroup1'
        ''
        'Yksi')
      (
        'One'
        'TForm1'
        'RzTabbedListBox1'
        ''
        'Yksi')
      (
        'One'
        'TForm1'
        'RzTreeView1'
        ''
        'Yksi')
      (
        'One...'
        'TForm1'
        'One1'
        ''
        'Yksi...')
      (
        
          'Only THeader and THeaderControl components can be passed to TRzT' +
          'abbedListBox.UpdateFromHeader'
        ''
        '42470'
        ''
        '')
      (
        'Open'
        'TForm1'
        'RzLauncher1'
        ''
        'Avaa')
      (
        'Operation aborted'
        ''
        '65517'
        ''
        'Toiminto keskeytetty')
      (
        'Operation cannot mix aggregate value with record-varying value'
        ''
        '65242'
        ''
        
          'Operaatio ei voi sekoittaa yhdistetty‰ arvoa tietueesta saatuun ' +
          'arvoon')
      (
        'Operation not allowed in a DBCtrlGrid'
        ''
        '65207'
        ''
        'Toimintoa ei voi suorittaa DBCtrlGrid:lle')
      (
        'Operation not allowed on sorted string list'
        ''
        '65432'
        ''
        'Operaatiota ei voi suorittaa lajitellulle listalle')
      (
        'Operation not supported on selected printer'
        ''
        '65326'
        ''
        'Valittu tulostin ei tue valittua toimintoa')
      (
        'Out of memory'
        ''
        '65527'
        ''
        'Muisti loppui')
      (
        'Out of memory or executable file is corrupt'
        ''
        '42000'
        ''
        '')
      (
        'Out of memory while expanding memory stream'
        ''
        '65424'
        ''
        'Muisti loppui k‰sitelt‰ess‰ tiedostovirtaa')
      (
        'Out of system resources'
        ''
        '65419'
        ''
        'J‰rjestelm‰resurssit ovat loppu')
      (
        'Outline index not found'
        ''
        '65372'
        ''
        'Outline:n indeksi‰ ei lˆytynyt')
      (
        'Parameter '#39'%s'#39' not found'
        ''
        '65219'
        ''
        #39'%s'#39'-parametri‰ ei lˆytynyt')
      (
        'Parent must be expanded'
        ''
        '65373'
        ''
        'Is‰nt‰ t‰ytyy olla laajennettu')
      (
        'Path was not found'
        ''
        '42003'
        ''
        '')
      (
        'PgDn'
        ''
        '65339'
        ''
        'PgDn')
      (
        'PgUp'
        ''
        '65338'
        ''
        'PgUp')
      (
        'Picture:'
        ''
        '65302'
        ''
        'Kuva:')
      (
        'Post edit'
        ''
        '65201'
        ''
        'P‰ivit‰ tietue')
      (
        'Preview'
        ''
        '65304'
        ''
        'Esikatselu')
      (
        'Printer is not currently printing'
        ''
        '65407'
        ''
        'Tulostin ei ole tulostamassa')
      (
        'Printer selected is not valid'
        ''
        '65377'
        ''
        'Valittu tulostin ei ole oikea')
      (
        'Printing in progress'
        ''
        '65376'
        ''
        'Tulostus k‰ynniss‰')
      (
        'Prior record'
        ''
        '65227'
        ''
        'Edellinen tietue')
      (
        'Privileged instruction'
        ''
        '65516'
        ''
        'Suojattu k‰sky')
      (
        'Property already defined by lookup field'
        ''
        '65208'
        ''
        'Ominaisuus on jo m‰‰ritelty hakutaulussa')
      (
        'Property does not exist'
        ''
        '65409'
        ''
        'Ominaisuutta ei ole olemassa')
      (
        'Property is read-only'
        ''
        '65410'
        ''
        'Ominaisuus on vain luettava')
      (
        'Purple'
        ''
        ''
        ''
        'Violetti')
      (
        'Raize'
        'TForm1'
        'TabSheet1'
        ''
        'Raize')
      (
        'Raize Data'
        'TForm1'
        'TabSheet4'
        ''
        'Raize-tietokanta')
      (
        'Raize List'
        'TForm1'
        'TabSheet2'
        ''
        'Raize-lista')
      (
        'Raize Misc'
        'TForm1'
        'TabSheet3'
        ''
        'Raize-muut')
      (
        'Raize Sample'
        'TForm1'
        ''
        ''
        'Raize:n esimerkki')
      (
        'Range check error'
        ''
        '65505'
        ''
        'Rajatarkistusvirhe')
      (
        'Read'
        ''
        '65493'
        ''
        'Lue')
      (
        'Read beyond end of file'
        ''
        '65533'
        ''
        'Tieton lopun j‰lkeen yritettiin lukea')
      (
        'Record changed by another user'
        ''
        '65225'
        ''
        '')
      (
        'Record not found'
        ''
        '65206'
        ''
        'Tietuetta ei lˆytynyt')
      (
        'Red'
        ''
        ''
        ''
        'Punainen')
      (
        'ReferenceTableName not specified for field '#39'%s'#39
        ''
        '65194'
        ''
        'ReferenceTableName:‰ ei ole m‰‰ritelty '#39'%s'#39'-kent‰lle')
      (
        'Refresh data'
        ''
        '65203'
        ''
        'Refresh Data')
      (
        'Republic of the Philippines'
        ''
        ''
        ''
        'Filippiinit')
      (
        'Resource %s not found'
        ''
        '65428'
        ''
        '%s-resurssia ei lˆytynyt')
      (
        'Right'
        ''
        '65312'
        ''
        'Oikea')
      (
        'Row parameter out of range'
        ''
        '42471'
        ''
        '')
      (
        'RzDBLookupDialog Error: Dataset property must be specified'
        ''
        '42401'
        ''
        '')
      (
        'RzDBLookupDialog Error: Search field must be selected'
        ''
        '42400'
        ''
        '')
      (
        'Sat'
        ''
        '65443'
        ''
        'la')
      (
        'Saturday'
        ''
        '65450'
        ''
        'lauantai')
      (
        'ScrollBar'
        ''
        ''
        'Scroll bar'
        'Vierityspalkki')
      (
        'Select Language'
        ''
        ''
        ''
        'Valitse kieli')
      (
        'Select the birthday'
        'TForm1'
        'RzDBLookupDialog1'
        ''
        'Valitse syntym‰p‰iv‰')
      (
        'Sep'
        ''
        '65485'
        ''
        'syys')
      (
        'September'
        ''
        '65465'
        ''
        'syyskuu')
      (
        'Session name missing'
        ''
        '65188'
        ''
        'Sessionimi puuttuu')
      (
        'Sharing violation or netword error'
        ''
        '42005'
        ''
        '')
      (
        'Shift+'
        ''
        '65316'
        ''
        'Vaihto+')
      (
        'Silver'
        ''
        ''
        ''
        'Hopea')
      (
        'Size mismatch for field '#39'%s'#39', expecting: %d actual: %d'
        ''
        '65270'
        ''
        #39'%s'#39'-kent‰n koko ei t‰sm‰‰, oletettiin: %d, on: %d')
      (
        'South Africa'
        ''
        ''
        ''
        'Etel‰-Afrikka')
      (
        'Space'
        ''
        '65337'
        ''
        'Space')
      (
        'SQL not supported: %s'
        ''
        '65222'
        ''
        '')
      (
        'Stack overflow'
        ''
        '65514'
        ''
        'Pinon ylivuoto')
      (
        'Stream read error'
        ''
        '65454'
        ''
        'Tiedostovirran lukuvirhe')
      (
        'Stream write error'
        ''
        '65455'
        ''
        'Tiedostovirran kirjoitusvirhe')
      (
        'String list does not allow duplicates'
        ''
        '65433'
        ''
        'Merkkijonolistassa ei voi olla samaa j‰sent‰ kahdesti')
      (
        'Sub-menu is not in menu'
        ''
        '65405'
        ''
        'Alivalikko ei ole valikossa')
      (
        'Sun'
        ''
        '65469'
        ''
        'su')
      (
        'Sunday'
        ''
        '65444'
        ''
        'sunnuntai')
      (
        'Sweden'
        ''
        ''
        ''
        'Ruotsi')
      (
        'System'
        ''
        ''
        ''
        'Systeemi')
      (
        'Tab'
        ''
        '65334'
        ''
        'Sarkain')
      (
        'Tab position incompatible with current tab style'
        ''
        '65434'
        ''
        
          'Sarkaimen paikka ei ole yhteensopiva nykyisen sarkaintyylin kans' +
          'sa')
      (
        'Tab style incompatible with current tab position'
        ''
        '65435'
        ''
        
          'Sarkaintyyli ei ole yhteensopiva nykyisen sarkaimen paikan kanss' +
          'a')
      (
        'TDBGrid:'
        'TForm1'
        'RzGroupBox25'
        ''
        'TDBGrid:')
      (
        'Teal'
        ''
        ''
        ''
        'Tummanvihre‰')
      (
        'Test'
        'TForm1'
        'RzGlyphStatus1'
        ''
        'Testi')
      (
        'Test'
        'TForm1'
        'RzLEDDisplay1'
        ''
        'Testi')
      (
        'Test'
        'TForm1'
        'RzMarqueeStatus1'
        ''
        'Testi')
      (
        'Text exceeds memo capacity'
        ''
        '65325'
        ''
        'Teksti ylitt‰‰ muistion kapasiteetin')
      (
        
          'The transaction isolation level must be dirty read for local dat' +
          'abases'
        ''
        '65175'
        ''
        
          'Paikallistn tietokantojen tapahtuman eristystaso on oltava "lika' +
          'inen luku"')
      (
        'There is no default printer currently selected'
        ''
        '65327'
        ''
        'Oletustulostinta ei ole valittu')
      (
        'This is a sample memo test '#13#10'for Raize sample '#13#10'application'
        'TForm1'
        'RzMemo1'
        ''
        'T‰m‰ on esimerkki testi'#13#10'Raize-esimerkkiohjelmaa'#13#10'varten')
      (
        'Three'
        'TForm1'
        'RzCheckList1'
        ''
        'Kolme')
      (
        'Three'
        'TForm1'
        'RzCheckTree1'
        ''
        'Kolme')
      (
        'Three'
        'TForm1'
        'RzComboBox1'
        ''
        'Kolme')
      (
        'Three'
        'TForm1'
        'RzEditListBox1'
        ''
        'Kolme')
      (
        'Three'
        'TForm1'
        'RzLineComboBox1'
        ''
        'Kolme')
      (
        'Three'
        'TForm1'
        'RzListBox1'
        ''
        'Kolme')
      (
        'Three'
        'TForm1'
        'RzListView1'
        ''
        'Kolme')
      (
        'Three'
        'TForm1'
        'RzLookupDialog1'
        ''
        'Kolme')
      (
        'Three'
        'TForm1'
        'RzMRUComboBox1'
        ''
        'Kolme')
      (
        'Three'
        'TForm1'
        'RzRadioGroup1'
        ''
        'Kolme')
      (
        'Three'
        'TForm1'
        'RzTabbedListBox1'
        ''
        'Kolme')
      (
        'Three'
        'TForm1'
        'RzTreeView1'
        ''
        'Kolme')
      (
        'Three'
        'TForm1'
        'Tree1'
        ''
        'Kolme')
      (
        'Thu'
        ''
        '65441'
        ''
        'to')
      (
        'Thursday'
        ''
        '65448'
        ''
        'torstai')
      (
        'To translate TRzBmpButton add the ".Caption" target'
        'TForm1'
        'RzBmpButton1'
        ''
        'K‰‰nt‰‰ksesi TRzBmpButton:n lis‰‰ ".Caption"-kohde')
      (
        'To translate TRzButton add the ".Caption" target'
        'TForm1'
        'RzButton1'
        ''
        'K‰‰nt‰‰ksesi TRzButton:n lis‰‰ ".Caption"-kohde')
      (
        'To translate TRzCheckBox add the ".Caption" target'
        'TForm1'
        'RzCheckBox1'
        ''
        'K‰‰nt‰‰ksesi TRzCheckBox:n lis‰‰ ".Caption"-kohde')
      (
        'To translate TRzCheckList add the ".Items" target'
        'TForm1'
        'RzCheckList1'
        ''
        'K‰‰nt‰‰ksesi TRzCheckList:n lis‰‰ ".Items"-kohde')
      (
        
          'To translate TRzCheckTree add the TIvRaizeModule to the main for' +
          'm and add the ".Items" target'
        'TForm1'
        'RzCheckTree1'
        ''
        
          'K‰‰nt‰‰ksesi TRzCheckTree:n lis‰‰ TIvRaizeModule p‰‰lomakkeelle ' +
          'ja lis‰‰ ".Items"-kohde')
      (
        'To translate TRzColorComboBox add the "TRzColorNames." target'
        'TForm1'
        'RzColorComboBox1'
        ''
        
          'K‰‰nt‰‰ksesi TRzColorComboBox:n lis‰‰ TIvRaizeModule p‰‰lomakkee' +
          'lle ja lis‰‰ "TRzColorNames."-kohde')
      (
        'To translate TRzComboBox add the ".Items" target'
        'TForm1'
        'RzComboBox1'
        ''
        'K‰‰nt‰‰ksesi TRzComboBox:n lis‰‰ ".Items"-kohde')
      (
        'To translate TRzEditListBox add the ".Items" target'
        'TForm1'
        'RzEditListBox1'
        ''
        'K‰‰nt‰‰ksesi TRzEditListBox:n lis‰‰ ".Items"-kohde')
      (
        'To translate TRzLabel add the ".Caption" target'
        'TForm1'
        'RzLabel1'
        ''
        'K‰‰nt‰‰ksesi TRzLabel:n lis‰‰ ".Caption"-kohde')
      (
        'To translate TRzLEDDisplay add the ".Caption" target'
        'TForm1'
        'RzLEDDisplay1'
        ''
        'K‰‰nt‰‰ksesi TRzLEDDisplay:n lis‰‰ ".Caption"-kohde')
      (
        'To translate TRzLineComboBox add the ".Items" target'
        'TForm1'
        'RzLineComboBox1'
        ''
        'K‰‰nt‰‰ksesi TRzLineComboBox:n lis‰‰ ".Items"-kohde')
      (
        'To translate TRzListBox add the ".Items" target'
        'TForm1'
        'RzListBox1'
        ''
        'K‰‰nt‰‰ksesi TRzListBox:n lis‰‰ ".Items"-kohde')
      (
        
          'To translate TRzListView add the TIvRaizeModule to the main form' +
          ' and add the ".Items" target'
        'TForm1'
        'RzListView1'
        ''
        
          'K‰‰nt‰‰ksesi TRzListView:n lis‰‰ TIvRaizeModule p‰‰lomakkeelle j' +
          'a lis‰‰ ".Items"-kohde')
      (
        'To translate TRzLookupDialog add the ".Caption" target'
        'TForm1'
        'LookupDialogButton'
        ''
        'K‰‰nt‰‰ksesi TRzLookupDialog:n lis‰‰ ".Caption"-kohde')
      (
        'To translate TRzMemo add the ".Lines" target'
        'TForm1'
        'RzMemo1'
        ''
        'K‰‰nt‰‰ksesi TRzMemo:n lis‰‰ ".Caption"-kohde')
      (
        'To translate TRzMenuButton add the ".Caption" target'
        'TForm1'
        'RzMenuButton1'
        ''
        'K‰‰nt‰‰ksesi TRzMenuButton:n lis‰‰ ".Caption"-kohde')
      (
        'To translate TRzMRUComboBox add the ".Items" target'
        'TForm1'
        'RzMRUComboBox1'
        ''
        'K‰‰nt‰‰ksesi TRzMRUComboBox:n lis‰‰ ".Items"-kohde')
      (
        'To translate TRzRadioButton add the ".Caption" target'
        'TForm1'
        'RzRadioButton1'
        ''
        'K‰‰nt‰‰ksesi TRzRadioButton:n lis‰‰ ".Caption"-kohde')
      (
        'To translate TRzRadioButton add the ".Caption" target'
        'TForm1'
        'RzRadioButton2'
        ''
        'K‰‰nt‰‰ksesi TRzRadioButton:n lis‰‰ ".Caption"-kohde')
      (
        'To translate TRzRadioGroup add the ".Items" target'
        'TForm1'
        'RzRadioGroup1'
        ''
        'K‰‰nt‰‰ksesi TRzRadioGroup:n lis‰‰ ".Items"-kohde')
      (
        'To translate TRzTabbedListBox add the ".Items" target'
        'TForm1'
        'RzTabbedListBox1'
        ''
        'K‰‰nt‰‰ksesi TRzTabbedListBox:n lis‰‰ ".Items"-kohde')
      (
        
          'To translate TRzTreeView add the TIvRaizeModule to the main form' +
          ' and add the ".Items" target'
        'TForm1'
        'RzTreeView1'
        ''
        
          'K‰‰nt‰‰ksesi TRzCTreeView:n lis‰‰ TIvRaizeModule p‰‰lomakkeelle ' +
          'ja lis‰‰ ".Items"-kohde')
      (
        'To translate TRzURLLabel add the ".Caption" target'
        'TForm1'
        'RzURLLabel1'
        ''
        'K‰‰nt‰‰ksesi TRzCheckBox:n lis‰‰ ".Caption"-kohde')
      (
        'Too many open files'
        ''
        '65531'
        ''
        'Liian monta avoinna olevaa tiedostoa')
      (
        'Too many rows or columns deleted'
        ''
        '65366'
        ''
        'Liian monta rivi tai saraketta poistettu')
      (
        'Trinidad y Tobago'
        ''
        ''
        ''
        '')
      (
        'True'
        ''
        '65218'
        ''
        'tosi')
      (
        'TRzBmpButton:'
        'TForm1'
        'RzGroupBox21'
        ''
        'TRzBmpButton:')
      (
        'TRzButton:'
        'TForm1'
        'RzGroupBox14'
        ''
        'TRzButton:')
      (
        'TRzCheckBox:'
        'TForm1'
        'RzGroupBox15'
        ''
        'TRzCheckBox:')
      (
        'TRzCheckList:'
        'TForm1'
        'RzGroupBox2'
        ''
        'TRzCheckList:')
      (
        'TRzCheckTree:'
        'TForm1'
        'RzGroupBox10'
        ''
        'TRzCheckTree:')
      (
        'TRzColorComboBox:'
        'TForm1'
        'RzGroupBox4'
        ''
        'TRzColorComboBox:')
      (
        'TRzComboBox:'
        'TForm1'
        'RzGroupBox17'
        ''
        'TRzComboBox:')
      (
        'TRzDBLookupDialog:'
        'TForm1'
        'RzGroupBox26'
        ''
        'TRzDBLookupDialog:')
      (
        'TRzEditListBox:'
        'TForm1'
        'RzGroupBox6'
        ''
        'TRzEditListBox:')
      (
        'TRzLabel:'
        'TForm1'
        'RzGroupBox1'
        ''
        'TRzLabel:')
      (
        'TRzLEDDisplay:'
        'TForm1'
        'RzGroupBox19'
        ''
        'TRzLEDDisplay:')
      (
        'TRzLineComboBox:'
        'TForm1'
        'RzGroupBox11'
        ''
        'TRzLineComboBox:')
      (
        'TRzListBox:'
        'TForm1'
        'RzGroupBox16'
        ''
        'TRzListBox:')
      (
        'TRzListView:'
        'TForm1'
        'RzGroupBox8'
        ''
        'TRzListView:')
      (
        'TRzLookupDialog:'
        'TForm1'
        'RzGroupBox24'
        ''
        'TRzLookupDialog:')
      (
        'TRzMemo:'
        'TForm1'
        'RzGroupBox12'
        ''
        'TRzMemo:')
      (
        'TRzMenuButton:'
        'TForm1'
        'RzGroupBox13'
        ''
        'TRzMenuButton:')
      (
        'TRzMRUComboBox:'
        'TForm1'
        'RzGroupBox7'
        ''
        'TRzMRUComboBox:')
      (
        'TRzRadioButton:'
        'TForm1'
        'RzGroupBox18'
        ''
        'TRzRadioButton:')
      (
        'TRzRadioGroup:'
        'TForm1'
        'RzRadioGroup1'
        ''
        'TRzRadioGroup:')
      (
        'TRzResourceStatus:'
        'TForm1'
        'RzGroupBox5'
        ''
        '')
      (
        'TRzTabbedListBox:'
        'TForm1'
        'RzGroupBox3'
        ''
        'TRzTabbedListBox:')
      (
        'TRzTreeView:'
        'TForm1'
        'RzGroupBox9'
        ''
        'TRzTreeView:')
      (
        'TRzURLLabel:'
        'TForm1'
        'RzGroupBox22'
        ''
        'TRzURLLabel:')
      (
        'Tue'
        ''
        '65471'
        ''
        'ti')
      (
        'Tuesday'
        ''
        '65446'
        ''
        'tiistai')
      (
        'Two'
        'TForm1'
        'RzCheckList1'
        ''
        'Kaksi')
      (
        'Two'
        'TForm1'
        'RzCheckTree1'
        ''
        'Kaksi')
      (
        'Two'
        'TForm1'
        'RzComboBox1'
        ''
        'Kaksi')
      (
        'Two'
        'TForm1'
        'RzEditListBox1'
        ''
        'Kaksi')
      (
        'Two'
        'TForm1'
        'RzLineComboBox1'
        ''
        'Kaksi')
      (
        'Two'
        'TForm1'
        'RzListBox1'
        ''
        'Kaksi')
      (
        'Two'
        'TForm1'
        'RzListView1'
        ''
        'Kaksi')
      (
        'Two'
        'TForm1'
        'RzLookupDialog1'
        ''
        'Kaksi')
      (
        'Two'
        'TForm1'
        'RzMRUComboBox1'
        ''
        'Kaksi')
      (
        'Two'
        'TForm1'
        'RzRadioGroup1'
        ''
        'Kaksi')
      (
        'Two'
        'TForm1'
        'RzTabbedListBox1'
        ''
        'Kaksi')
      (
        'Two'
        'TForm1'
        'RzTreeView1'
        ''
        'Kaksi')
      (
        'Two'
        'TForm1'
        'Two1'
        ''
        'Kaksi')
      (
        'Type mismatch for field '#39'%s'#39', expecting: %s actual: %s'
        ''
        '65269'
        ''
        #39'%s'#39'-kent‰n tyyppi ei t‰sm‰‰, oletettiin: %s, on: %s')
      (
        'Type mismatch in expression'
        ''
        '65241'
        ''
        'Lausekkeen tyypit eiv‰t t‰sm‰‰')
      (
        'Unable to insert a line'
        ''
        '65321'
        ''
        'Rivi‰ ei voitu lis‰t‰')
      (
        'Unable to insert an item'
        ''
        '65286'
        ''
        'J‰sent‰ ei voitu lis‰t‰')
      (
        'Unable to load bind parameters'
        ''
        '65220'
        ''
        'Sidontaparametrej‰ ei voinnut ladata')
      (
        'Unable to Replace Image'
        ''
        '65423'
        ''
        'Kuvaa ei voi korvata')
      (
        'United Kingdom'
        ''
        ''
        ''
        'Iso-Britannia ja Pohjois-Irlanti')
      (
        'United States'
        ''
        ''
        ''
        'Yhdysvallat')
      (
        'Unknown executable file type'
        ''
        '42014'
        ''
        '')
      (
        'Unknown picture file extension (.%s)'
        ''
        '65417'
        ''
        'Tuntematon kuvatiedoston p‰‰te (.%s)')
      (
        'Unsupported clipboard format'
        ''
        '65418'
        ''
        'Leikekirjaformaattia ei tueta')
      (
        'Unterminated field name'
        ''
        '65261'
        ''
        'Kent‰ nime‰ ei ole p‰‰tetty')
      (
        'Unterminated string constant'
        ''
        '65262'
        ''
        'Merkkijonovakiota ei ole p‰‰tetty')
      (
        'Untitled Application'
        ''
        '65174'
        ''
        '(nimetˆn)')
      (
        'Up'
        ''
        '65343'
        ''
        'Ylˆs')
      (
        'User'
        ''
        ''
        ''
        'K‰ytt‰j‰')
      (
        'Value of field '#39'%s'#39' is out of range'
        ''
        '65272'
        ''
        #39'%s'#39'-kent‰n arvo on rajojen ulkopuolella')
      (
        'Variant array index out of bounds'
        ''
        '65498'
        ''
        'Varianttitaulukon indeksi on rajojen ulkopuolella')
      (
        'Variant does not reference an automation object'
        ''
        '65212'
        ''
        'Variantti ei viittaa OLE-olioon')
      (
        'Variant is not an array'
        ''
        '65497'
        ''
        'Variantti ei ole taulukko')
      (
        'Variant method calls not supported'
        ''
        '65492'
        ''
        'Variantin metodin kutsua ei ole tuettu')
      (
        'Warning'
        ''
        '65350'
        ''
        'Varoitus')
      (
        'Wed'
        ''
        '65440'
        ''
        'ke')
      (
        'Wednesday'
        ''
        '65447'
        ''
        'keskiviikko')
      (
        'White'
        ''
        ''
        ''
        'Valkoinen')
      (
        'Win32 Error.  Code: %d.'#10'%s'
        ''
        '65474'
        ''
        'Win32-virhe.  Koodi: %d.'#10'%s')
      (
        'Window'
        ''
        ''
        ''
        'Ikkuna')
      (
        'WindowFrame'
        ''
        ''
        'Window frame'
        'Ikkunan kehys')
      (
        'WindowText'
        ''
        ''
        'Window text'
        'Ikkunan teksti')
      (
        'Write'
        ''
        '65494'
        ''
        'Kirjoitus')
      (
        'Yellow'
        ''
        ''
        ''
        'Keltainen')
      (
        'Yes to &All'
        ''
        '65332'
        ''
        '&Kyll‰ kaikkiin')
      (
        'Zimbabwe'
        ''
        ''
        ''
        'Zimbabwe'))
    Locales = (
      2
      1
      (
        11
        2
        0
        1252
        True
        'Finnish'
        'Sweden'
        'suomi'
        'Ruotsi'
        'FIN'
        'Sweden'
        0
        'kr'
        3
        8
        2
        '†'
        ','
        '.'
        'd.M.yyyy'
        'd. MMMM'#39'ta '#39'yyyy'
        ':'
        ''
        ''
        False
        1
        0
        1
        0
        0
        2
        'tammi'
        'helmi'
        'maalis'
        'huhti'
        'touko'
        'kes‰'
        'hein‰'
        'elo'
        'syys'
        'loka'
        'marras'
        'joulu'
        'tammikuu'
        'helmikuu'
        'maaliskuu'
        'huhtikuu'
        'toukokuu'
        'kes‰kuu'
        'hein‰kuu'
        'elokuu'
        'syyskuu'
        'lokakuu'
        'marraskuu'
        'joulukuu'
        'ma'
        'ti'
        'ke'
        'to'
        'pe'
        'la'
        'su'
        'maanantai'
        'tiistai'
        'keskiviikko'
        'torstai'
        'perjantai'
        'lauantai'
        'sunnuntai'))
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    Left = 552
    Top = 56
    TargetsData = (
      1
      12
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
        'Lines'
        0)
      (
        ''
        'Items'
        0)
      (
        'TRzColorNames'
        ''
        0)
      (
        ''
        'Prompt'
        0)
      (
        ''
        'CaptionOK'
        0)
      (
        ''
        'CaptionHelp'
        0)
      (
        ''
        'CaptionCancel'
        0)
      (
        ''
        'List'
        0)
      (
        ''
        'Filter'
        0)
      (
        'TRzResourceStrings'
        ''
        0))
  end
end
