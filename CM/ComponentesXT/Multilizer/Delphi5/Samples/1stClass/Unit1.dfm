object Form1: TForm1
  Left = 235
  Top = 352
  Width = 270
  Height = 182
  Caption = '1stClass Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object fcColorCombo1: TfcColorCombo
    Left = 136
    Top = 8
    Width = 121
    Height = 21
    ColorListOptions.Font.Charset = DEFAULT_CHARSET
    ColorListOptions.Font.Color = clWindowText
    ColorListOptions.Font.Height = -11
    ColorListOptions.Font.Name = 'MS Sans Serif'
    ColorListOptions.Font.Style = []
    DropDownCount = 8
    ReadOnly = False
    SelectedColor = 268435455
    TabOrder = 0
  end
  object fcColorList1: TfcColorList
    Left = 8
    Top = 8
    Width = 121
    Height = 137
    ColorWidth = 12
    CustomColors.Strings = (
      'Almost White=F0F0F0'
      'Almost Black=101010'
      'Dark Red=0000D0')
    GreyScaleIncrement = 10
    Options = [ccoShowCustomColors, ccoShowColorNames]
    SelectedColor = 268435455
    TabOrder = 1
    ItemHeight = 16
  end
  object Button1: TButton
    Left = 136
    Top = 40
    Width = 121
    Height = 25
    Caption = '&Language...'
    TabOrder = 2
    OnClick = Button1Click
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    Left = 168
    Top = 72
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
        'CustomColors'
        0))
  end
  object Iv1stClassModule1: TIv1stClassModule
    Left = 200
    Top = 72
  end
  object IvBinaryDictionary1: TIvBinaryDictionary
    DictionaryName = 'Dictionary1'
    FileName = 'Project1.mld'
    Storage = ivsEmbedded
    Left = 136
    Top = 72
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
      74
      (
        '&Close'
        ''
        ''
        ''
        '&Sulje')
      (
        '&Language...'
        'TForm1'
        'Button1'
        ''
        '&Kieli...')
      (
        '&Move'
        ''
        ''
        ''
        '&Siirrä')
      (
        '&Next'
        ''
        ''
        ''
        '&Seuraava')
      (
        '&Restore'
        ''
        ''
        ''
        '&Palauta')
      (
        '&Size'
        ''
        ''
        ''
        '&Koko')
      (
        '1stClass Sample'
        'TForm1'
        ''
        ''
        '1stClass-esimerkki')
      (
        '3DDkShadow'
        ''
        ''
        ''
        'Tumma 3D-varjo')
      (
        '3DLight'
        ''
        ''
        ''
        'Vaalea 3D')
      (
        'ActiveBorder'
        ''
        ''
        ''
        'Aktiivinen kehys')
      (
        'ActiveCaption'
        ''
        ''
        ''
        'Aktiivinen otsikko')
      (
        'Almost Black'
        'TForm1'
        'fcColorList1'
        ''
        'Melkein musta')
      (
        'Almost White'
        'TForm1'
        'fcColorList1'
        ''
        'Melkein valkoinen')
      (
        'AppWorkSpace'
        ''
        ''
        ''
        'Ohjelman työpöytä')
      (
        'Aqua'
        ''
        ''
        ''
        'Turkoosi')
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
        'Belize'
        ''
        ''
        ''
        'Belize')
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
        ''
        'Painikkeen etupuoli')
      (
        'BtnHighlight'
        ''
        ''
        ''
        'Valaistu painike')
      (
        'BtnShadow'
        ''
        ''
        ''
        'Painikkeen varjo')
      (
        'BtnText'
        ''
        ''
        ''
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
        'CaptionText'
        ''
        ''
        ''
        'Otsikon teksti')
      (
        'Caribbean'
        ''
        ''
        ''
        'Karibia')
      (
        'Dark Red'
        'TForm1'
        'fcColorList1'
        ''
        'Tumma punainen')
      (
        'English'
        ''
        ''
        ''
        'englanti')
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
        'Fuchsia'
        ''
        ''
        ''
        'Vaaleanpunainen')
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
        ''
        'Harmaa teksti')
      (
        'Green'
        ''
        ''
        ''
        'Vihreä')
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
        ''
        'Valaustu teksti')
      (
        'InactiveBorder'
        ''
        ''
        ''
        'Passivinen kehys')
      (
        'InactiveCaption'
        ''
        ''
        ''
        'Passivinen otsikko')
      (
        'InactiveCaptionText'
        ''
        ''
        ''
        'Passivisen otsikon teksti')
      (
        'InfoBk'
        ''
        ''
        ''
        'Info-painike')
      (
        'InfoText'
        ''
        ''
        ''
        'Info-teksti')
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
        'Lime'
        ''
        ''
        ''
        'Sitruunanvihreä')
      (
        'Ma&ximize'
        ''
        ''
        ''
        '&Suurenna')
      (
        'Maroon'
        ''
        ''
        ''
        'Ruskeanpunainen')
      (
        'Menu'
        ''
        ''
        ''
        'Valikko')
      (
        'MenuText'
        ''
        ''
        ''
        'Valikon teksti')
      (
        'Mi&nimize'
        ''
        ''
        ''
        '&Pienennä')
      (
        'Navy'
        ''
        ''
        ''
        'Tummansininen')
      (
        'New Zealand'
        ''
        ''
        ''
        'Uusi-Seelanti')
      (
        'None'
        ''
        ''
        ''
        'Tyhjä')
      (
        'OK'
        ''
        ''
        ''
        'OK')
      (
        'Olive'
        ''
        ''
        ''
        'Oliivi')
      (
        'Purple'
        ''
        ''
        ''
        'Violetti')
      (
        'Red'
        ''
        ''
        ''
        'Punainen')
      (
        'Republic of the Philippines'
        ''
        ''
        ''
        'Filippiinit')
      (
        'ScrollBar'
        ''
        ''
        ''
        'Vierityspalkki')
      (
        'Select Language'
        ''
        ''
        ''
        'Valitse kieli')
      (
        'Silver'
        ''
        ''
        ''
        'Hopea')
      (
        'South Africa'
        ''
        ''
        ''
        'Etelä-Afrikka')
      (
        'Sweden'
        ''
        ''
        ''
        'Ruotsi')
      (
        'Teal'
        ''
        ''
        ''
        'Tummanvihreä')
      (
        'Trinidad y Tobago'
        ''
        ''
        ''
        'Trinidad ja Tobago')
      (
        'United Kingdom'
        ''
        ''
        ''
        'Iso-Britannia')
      (
        'United States'
        ''
        ''
        ''
        'Yhdysvallat')
      (
        'White'
        ''
        ''
        ''
        'Valkoinen')
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
        ''
        'Ikkunan kehys')
      (
        'WindowText'
        ''
        ''
        ''
        'Ikkunan teksti')
      (
        'Yellow'
        ''
        ''
        ''
        'Keltainen')
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
        'fin'
        'Sweden'
        0
        'kr'
        3
        8
        2
        ' '
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
        'kesä'
        'heinä'
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
        'kesäkuu'
        'heinäkuu'
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
end
