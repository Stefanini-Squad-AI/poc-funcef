object Form1: TForm1
  Left = 194
  Top = 217
  Width = 473
  Height = 341
  Caption = 'TeeChart demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Chart1: TChart
    Left = 8
    Top = 8
    Width = 353
    Height = 297
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Foot.Text.Strings = (
      'Spring 1999')
    Title.Text.Strings = (
      'Vehicle')
    LeftAxis.Title.Caption = 'Amount'
    TabOrder = 0
    object Series1: TBarSeries
      Marks.ArrowLength = 20
      Marks.Visible = True
      SeriesColor = clRed
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1
      YValues.Order = loNone
    end
  end
  object LanguageButton: TButton
    Left = 368
    Top = 8
    Width = 89
    Height = 25
    Caption = '&Language...'
    TabOrder = 1
    OnClick = LanguageButtonClick
  end
  object IvBinaryDictionary1: TIvBinaryDictionary
    DictionaryName = 'Dictionary1'
    FileName = 'Project1.mld'
    Storage = ivsEmbedded
    Left = 368
    Top = 40
    Languages = (
      2
      4
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
        False)
      (
        10
        ''
        1
        0
        1252
        'Spanish'
        'Español'
        ''
        0
        False
        False))
    Translations = (
      2
      1
      55
      (
        '&Close'
        ''
        ''
        ''
        '&Sulje'
        '&Cerrar')
      (
        '&Language...'
        'TForm1'
        'LanguageButton'
        ''
        '&Kieli...'
        '&Idioma...')
      (
        '&Move'
        ''
        ''
        ''
        '&Siirrä'
        '&Mover')
      (
        '&Restore'
        ''
        ''
        ''
        '&Palauta'
        '&Restaurar')
      (
        '&Size'
        ''
        ''
        ''
        '&Koko'
        '&Tamaño')
      (
        'Amount'
        'TForm1'
        'Chart1'
        ''
        'Määrä'
        'Cantidad')
      (
        'Argentina'
        ''
        ''
        ''
        'Argentiina'
        'Argentina')
      (
        'Australia'
        ''
        ''
        ''
        'Australia'
        'Australia')
      (
        'Bar'
        'TForm1'
        'Series1'
        ''
        'Palkki'
        'Barra')
      (
        'Belize'
        ''
        ''
        ''
        'Belize'
        'Belice')
      (
        'Bicycle'
        ''
        ''
        ''
        'Pyörä'
        'Bicicleta')
      (
        'Bolivia'
        ''
        ''
        ''
        'Bolivia'
        'Bolivia')
      (
        'Buss'
        ''
        ''
        ''
        'Bussi'
        'Autobús')
      (
        'Canada'
        ''
        ''
        ''
        'Kanada'
        'Canadá')
      (
        'Cancel'
        ''
        ''
        ''
        'Peru'
        'Cancelar')
      (
        'Car'
        ''
        ''
        ''
        'Auto'
        'Coche')
      (
        'Caribbean'
        ''
        ''
        ''
        'Karibia'
        'Caríbico')
      (
        'Chile'
        ''
        ''
        ''
        'Chile'
        'Chile')
      (
        'Colombia'
        ''
        ''
        ''
        'Kolumbia'
        'Colombia')
      (
        'Costa Rica'
        ''
        ''
        ''
        'Costa Rica'
        'Costa Rica')
      (
        'Dominican Republic'
        ''
        ''
        ''
        'Dominikaaninen tasavalta'
        'República dominicana')
      (
        'Ecuador'
        ''
        ''
        ''
        'Ecuador'
        'Ecuador')
      (
        'El Salvador'
        ''
        ''
        ''
        'El Salvador'
        'El Salvador')
      (
        'English'
        ''
        ''
        ''
        'englanti'
        'Inglés')
      (
        'Finland'
        ''
        ''
        ''
        'Suomi'
        'Finlandia')
      (
        'Finnish'
        ''
        ''
        ''
        'suomi'
        'Finés')
      (
        'Guatemala'
        ''
        ''
        ''
        'Guatemala'
        'Guatemala')
      (
        'Honduras'
        ''
        ''
        ''
        'Honduras'
        'Honduras')
      (
        'Ireland'
        ''
        ''
        ''
        'Irlanti'
        'Irlanda')
      (
        'Jamaica'
        ''
        ''
        ''
        'Jamaika'
        'Jamaica')
      (
        'Ma&ximize'
        ''
        ''
        ''
        '&Suurenna'
        '&Maximizar')
      (
        'Mexico'
        ''
        ''
        ''
        'Meksiko'
        'México')
      (
        'Mi&nimize'
        ''
        ''
        ''
        '&Pienennä'
        '&Minimizar')
      (
        'New Zealand'
        ''
        ''
        ''
        'Uusi-Seelanti'
        'Nueva Zelanda')
      (
        'Nicaragua'
        ''
        ''
        ''
        'Nicaragua'
        'Nicaragua')
      (
        'OK'
        ''
        ''
        'OK'
        'OK'
        'Aceptar')
      (
        'Panama'
        ''
        ''
        ''
        'Panama'
        'Panamá')
      (
        'Paraguay'
        ''
        ''
        ''
        'Paraguay'
        'Paraguay')
      (
        'Peru'
        ''
        ''
        ''
        'Peru'
        'Perú')
      (
        'Puerto Rico'
        ''
        ''
        ''
        'Puerto Rico'
        'Puerto Rico')
      (
        'Select Language'
        ''
        ''
        ''
        'Valitse kieli'
        'Elegir la lengua')
      (
        'South Africa'
        ''
        ''
        ''
        'Etelä-Afrikka'
        'Sudáfrica')
      (
        'Spain'
        ''
        ''
        ''
        'Espanja'
        'España')
      (
        'Spanish'
        ''
        ''
        ''
        'espanja'
        'Español')
      (
        'Spring 1999'
        'TForm1'
        'Chart1'
        ''
        'Kevät 1999'
        'Primavera 1999')
      (
        'Sweden'
        ''
        ''
        ''
        'Ruotsi'
        'Suecia')
      (
        'Swedish'
        ''
        ''
        ''
        'ruotsi'
        'Sueco')
      (
        'TeeChart demo'
        'TForm1'
        ''
        ''
        'TeeChart-esimerkki'
        'Ejemplo TeeChart')
      (
        'Trinidad y Tobago'
        ''
        ''
        ''
        'Trinidad ja Tobago'
        '')
      (
        'United Kingdom'
        ''
        ''
        ''
        'Iso-Britannia'
        'Reino Unido')
      (
        'United States'
        ''
        ''
        ''
        'Yhdysvallat'
        'Estados Unidos')
      (
        'Uruguay'
        ''
        ''
        ''
        'Uruguay'
        'Uruguay')
      (
        'Vehicle'
        'TForm1'
        'Chart1'
        ''
        'Ajoneuvo'
        'Vehículo')
      (
        'Venezuela'
        ''
        ''
        ''
        'Venezuela'
        'Venezuela')
      (
        'X'
        'TForm1'
        'Series1'
        ''
        ''
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
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    Left = 400
    Top = 40
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
        'Text'
        0))
  end
  object IvChartModule1: TIvChartModule
    Left = 432
    Top = 40
  end
end
