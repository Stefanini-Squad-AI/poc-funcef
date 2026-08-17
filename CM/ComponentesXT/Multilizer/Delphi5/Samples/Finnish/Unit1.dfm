object Form1: TForm1
  Left = 204
  Top = 107
  Width = 190
  Height = 107
  Caption = 'Lomake'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 42
    Height = 13
    Caption = 'Tunnus1'
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 63
    Height = 13
    Caption = 'Tämä on koe'
  end
  object Button1: TButton
    Left = 96
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Näppäin'
    TabOrder = 0
    OnClick = Button1Click
  end
  object IvTranslator1: TIvTranslator
    Left = 144
    Top = 40
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
  object IvBinaryDictionary1: TIvBinaryDictionary
    DictionaryName = 'Dictionary1'
    FileName = 'Project1.mld'
    Storage = ivsEmbedded
    Left = 112
    Top = 40
    Languages = (
      2
      3
      (
        0
        ''
        0
        0
        1252
        'Native'
        'Native'
        ''
        0
        False
        True)
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
        False)
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
        False))
    Translations = (
      2
      1
      20
      (
        'Australia'
        ''
        ''
        'Australia'
        '')
      (
        'Belize'
        ''
        ''
        'Belize'
        '')
      (
        'Canada'
        ''
        ''
        'Kanada'
        '')
      (
        'Caribbean'
        ''
        ''
        'Karibia'
        '')
      (
        'English'
        ''
        ''
        'englanti'
        '')
      (
        'Finland'
        ''
        ''
        'Suomi'
        '')
      (
        'Finnish'
        ''
        ''
        'suomi'
        '')
      (
        'Ireland'
        ''
        ''
        'Irlanti'
        '')
      (
        'Jamaica'
        ''
        ''
        'Jamaika'
        '')
      (
        'Lomake'
        'TForm1'
        ''
        ''
        'Form')
      (
        'MS Sans Serif'
        'TForm1'
        ''
        ''
        '')
      (
        'New Zealand'
        ''
        ''
        'Uusi-Seelanti'
        '')
      (
        'Näppäin'
        'TForm1'
        'Button1'
        ''
        'Button')
      (
        'South Africa'
        ''
        ''
        'Etelä-Afrikka'
        '')
      (
        'Sweden'
        ''
        ''
        'Ruotsi'
        '')
      (
        'Trinidad y Tobago'
        ''
        ''
        'Trinidad ja Tobago'
        '')
      (
        'Tunnus1'
        'TForm1'
        'Label1'
        ''
        'Label1')
      (
        'Tämä on koe'
        'TForm1'
        'Label2'
        ''
        'This is a test')
      (
        'United Kingdom'
        ''
        ''
        'Iso-Britannia'
        '')
      (
        'United States'
        ''
        ''
        'Yhdysvallat'
        ''))
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
