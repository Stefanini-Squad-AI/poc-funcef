object MainForm: TMainForm
  Left = 196
  Top = 242
  Width = 601
  Height = 292
  Caption = 'Address demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object LanguageGroup: TGroupBox
    Left = 8
    Top = 8
    Width = 193
    Height = 49
    Caption = 'Language'
    TabOrder = 0
    object LanguageCombo: TComboBox
      Left = 8
      Top = 16
      Width = 177
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      Sorted = True
      TabOrder = 0
      OnChange = LanguageComboChange
    end
  end
  object LocaleGroup: TGroupBox
    Left = 208
    Top = 8
    Width = 193
    Height = 49
    Caption = 'Locale'
    TabOrder = 1
    object LocaleCombo: TComboBox
      Left = 8
      Top = 16
      Width = 177
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      Sorted = True
      TabOrder = 0
      OnChange = LocaleComboChange
    end
  end
  object AddressGroup: TGroupBox
    Left = 8
    Top = 64
    Width = 577
    Height = 169
    Caption = 'Address'
    TabOrder = 2
    object FirstNameLabel: TLabel
      Left = 8
      Top = 18
      Width = 50
      Height = 13
      Caption = 'First Name'
    end
    object MiddleNameLabel: TLabel
      Left = 8
      Top = 42
      Width = 62
      Height = 13
      Caption = 'Middle Name'
    end
    object LastNameLabel: TLabel
      Left = 8
      Top = 66
      Width = 51
      Height = 13
      Caption = 'Last Name'
    end
    object CompanyLabel: TLabel
      Left = 8
      Top = 90
      Width = 44
      Height = 13
      Caption = 'Company'
    end
    object Address1Label: TLabel
      Left = 8
      Top = 114
      Width = 47
      Height = 13
      Caption = 'Address 1'
    end
    object Address2Label: TLabel
      Left = 8
      Top = 138
      Width = 47
      Height = 13
      Caption = 'Address 2'
    end
    object CityLabel: TLabel
      Left = 240
      Top = 18
      Width = 17
      Height = 13
      Caption = 'City'
    end
    object StateLabel: TLabel
      Left = 240
      Top = 42
      Width = 25
      Height = 13
      Caption = 'State'
    end
    object CountryLabel: TLabel
      Left = 240
      Top = 66
      Width = 36
      Height = 13
      Caption = 'Country'
    end
    object PostalCodeLabel: TLabel
      Left = 240
      Top = 90
      Width = 57
      Height = 13
      Caption = 'Postal Code'
    end
    object FirstName: TEdit
      Left = 96
      Top = 16
      Width = 105
      Height = 21
      TabOrder = 0
    end
    object MiddleName: TEdit
      Left = 96
      Top = 40
      Width = 105
      Height = 21
      TabOrder = 1
    end
    object LastName: TEdit
      Left = 96
      Top = 64
      Width = 105
      Height = 21
      TabOrder = 2
    end
    object Company: TEdit
      Left = 96
      Top = 88
      Width = 105
      Height = 21
      TabOrder = 3
    end
    object Address1: TEdit
      Left = 96
      Top = 112
      Width = 337
      Height = 21
      TabOrder = 4
    end
    object Address2: TEdit
      Left = 96
      Top = 136
      Width = 337
      Height = 21
      TabOrder = 5
    end
    object City: TEdit
      Left = 328
      Top = 16
      Width = 105
      Height = 21
      TabOrder = 6
    end
    object State: TEdit
      Left = 328
      Top = 40
      Width = 105
      Height = 21
      TabOrder = 7
    end
    object Country: TEdit
      Left = 328
      Top = 64
      Width = 105
      Height = 21
      TabOrder = 8
    end
    object PostalCode: TEdit
      Left = 328
      Top = 88
      Width = 105
      Height = 21
      TabOrder = 9
    end
  end
  object MainMenu1: TMainMenu
    Left = 424
    Top = 8
    object EditMenu: TMenuItem
      Caption = 'Edit'
      object ClearMenu: TMenuItem
        Caption = 'Clear'
        ShortCut = 16451
        OnClick = ClearMenuClick
      end
    end
    object OptionsMenu: TMenuItem
      Caption = 'Options'
      OnClick = OptionsMenuClick
      object BindMenu: TMenuItem
        Caption = 'Bind language and locale'
        ShortCut = 16450
        OnClick = BindMenuClick
      end
    end
    object Info1: TMenuItem
      Caption = 'Info'
      object Customlocales1: TMenuItem
        Caption = 'Custom locales...'
        OnClick = Customlocales1Click
      end
      object Systemlocales1: TMenuItem
        Caption = 'System locale ids...'
        OnClick = Systemlocales1Click
      end
      object Alllocales1: TMenuItem
        Caption = 'All locale ids...'
        OnClick = Alllocales1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Locale1: TMenuItem
        Caption = 'Locale...'
        OnClick = Locale1Click
      end
    end
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    OnLocaleChange = IvTranslator1LocaleChange
    OnLanguageChange = IvTranslator1LanguageChange
    Left = 456
    Top = 8
    TargetsData = (
      1
      4
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
        'Items'
        0)
      (
        ''
        'Text'
        0))
  end
  object IvDictionary1: TIvBinaryDictionary
    DictionaryName = 'Dictionary1'
    FileName = 'diction.mld'
    Storage = ivsEmbedded
    Left = 488
    Top = 8
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
      231
      (
        ' - Dock zone has no control'
        ''
        ''
        ''
        ' - kiinnitysalueella ei ole yht‰‰n kontrollia')
      (
        ' - Dock zone not found'
        ''
        ''
        ''
        ' - kiinnitysaluetta ei lˆytynyt')
      (
        '%s (%s, line %d)'
        ''
        ''
        ''
        '%s (%s, rivi %d)')
      (
        #39#39'%s'#39#39' is not a valid component name'
        ''
        ''
        ''
        #39#39'%s'#39#39' ei ole oikea komponentin nimi')
      (
        #39'%s'#39' is not a valid integer value'
        ''
        ''
        ''
        #39'%s'#39' ei ole kokonaislukuarvo')
      (
        '&Abort'
        ''
        ''
        ''
        'Keskeyt‰')
      (
        '&All'
        ''
        ''
        ''
        'Kaikki')
      (
        '&Close'
        ''
        ''
        ''
        'Sulje')
      (
        '&Help'
        ''
        ''
        ''
        'Ohje')
      (
        '&Ignore'
        ''
        ''
        ''
        'Hylk‰‰')
      (
        '&No'
        ''
        ''
        ''
        'Ei')
      (
        '&Retry'
        ''
        ''
        ''
        'Uudestaan')
      (
        '&Yes'
        ''
        ''
        ''
        'Kyll‰')
      (
        'A class named %s already exists'
        ''
        ''
        ''
        '%s-niminen luokka on jo olemassa')
      (
        'A component named %s already exists'
        ''
        ''
        ''
        'Kaksi samaa nime‰ ('#39'%s'#39') %s:ssa')
      (
        'A control cannot have itself as its parent'
        ''
        ''
        ''
        'Kontrollin is‰nt‰ ei voi olla kontrolli itse')
      (
        'A Win32 API function failed'
        ''
        ''
        ''
        'Win32API-functio ep‰onnistui')
      (
        'Abort'
        ''
        ''
        ''
        'Keskeyt‰')
      (
        'Abstract Error'
        ''
        ''
        ''
        'Abstrakti virhe')
      (
        'Access violation at address %p in module '#39'%s'#39'. %s of address %p'
        ''
        ''
        ''
        'K‰sittelyvirhe osoitteessa %p, '#39'%s'#39'-modulissa. %s:n osoite %p')
      (
        'Access violation at address %p. %s of address %p'
        ''
        ''
        ''
        'K‰sittelyvirhe %p-osoittessa. %s osoite %p')
      (
        'Address'
        'TMainForm'
        'AddressGroup'
        ''
        'Osoite')
      (
        'Address 1'
        'TMainForm'
        'Address1Label'
        ''
        'Osoite 1')
      (
        'Address 2'
        'TMainForm'
        'Address2Label'
        ''
        'Osoite 2')
      (
        'Address demo'
        'TMainForm'
        ''
        ''
        'Osoite-esimerkki')
      (
        'All Locale Ids'
        ''
        ''
        ''
        'Kaikki paikannetunnukset')
      (
        'All locale ids...'
        'TMainForm'
        'Alllocales1'
        ''
        'Kaikki paikannetunnukset...')
      (
        'Alt+'
        ''
        ''
        ''
        'Alt+')
      (
        'Ancestor for '#39'%s'#39' not found'
        ''
        ''
        ''
        #39'%s'#39':n ‰iti‰ ei lˆydy')
      (
        'Application Error'
        ''
        ''
        ''
        'Sovellusvirhe')
      (
        'Apr'
        ''
        ''
        ''
        'huhti')
      (
        'April'
        ''
        ''
        ''
        'huhtikuu')
      (
        'Assertion failed'
        ''
        ''
        ''
        'Testaus ep‰onnistui')
      (
        'Aug'
        ''
        ''
        ''
        'elo')
      (
        'August'
        ''
        ''
        ''
        'elokuu')
      (
        'Australia'
        ''
        ''
        ''
        'Australia')
      (
        'Belize'
        ''
        ''
        ''
        'Belize')
      (
        'Bind language and locale'
        'TMainForm'
        'BindMenu'
        ''
        'Sido kieli ja paikanne')
      (
        'Bitmap image is not valid'
        ''
        ''
        ''
        'Bittikarttakuva ei ole oikea')
      (
        'Bitmaps'
        ''
        ''
        ''
        'Bittikartat')
      (
        'Bits index out of range'
        ''
        ''
        ''
        'Bitin indeksi on rajojen ulkopuolella')
      (
        'BkSp'
        ''
        ''
        ''
        'BkSp')
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
        'Peru')
      (
        'Cannot assign a %s to a %s'
        ''
        ''
        ''
        'Ei voi sijoittaa %s:ta %s:n')
      (
        'Cannot change the size of an icon'
        ''
        ''
        ''
        'Ikonin kokoa ei voi muuttaa')
      (
        'Cannot change Visible in OnShow or OnHide'
        ''
        ''
        ''
        'OnShow- ja OnHide-eventeiss‰ ei voi muuttaa Visible-ominaisuutta')
      (
        'Cannot create file %s'
        ''
        ''
        ''
        'Ei voi luoda %s-tiedostoa')
      (
        'Cannot create form. No MDI forms are currently active'
        ''
        ''
        ''
        
          'Lomaketta ei voitu luoda. Yht‰‰n MDI-lomaketta ei ole aktiivisen' +
          'a')
      (
        'Cannot drag a form'
        ''
        ''
        ''
        'Lomaketta ei voi vet‰‰')
      (
        'Cannot focus a disabled or invisible window'
        ''
        ''
        ''
        'J‰‰dytetty tai n‰kym‰tˆn ikkuna ei voi saada fokusta')
      (
        'Cannot hide an MDI Child Form'
        ''
        ''
        ''
        'MDI-lapsilomaketta ei voi k‰tke‰')
      (
        'Cannot make a visible window modal'
        ''
        ''
        ''
        'N‰kyv‰‰ ikkunaa ei voi tehd‰ modaaliksi')
      (
        'Cannot open file %s'
        ''
        ''
        ''
        'Ei voi avata %s-tiedostoa')
      (
        'Can'#39't write to a read-only resource stream'
        ''
        ''
        ''
        'Luettavaan resurssivirtaan ei voi kirjoittaa')
      (
        'Canvas does not allow drawing'
        ''
        ''
        ''
        'Kanvakselle ei voi piirt‰‰')
      (
        'Caribbean'
        ''
        ''
        ''
        'Karibia')
      (
        'City'
        'TMainForm'
        'CityLabel'
        ''
        'Postitoimipaikka')
      (
        'Class %s not found'
        ''
        ''
        ''
        '%s-luokkaa ei lˆytynyt')
      (
        'Clear'
        'TMainForm'
        'ClearMenu'
        ''
        'Tyhjenn‰')
      (
        'Clipboard does not support Icons'
        ''
        ''
        ''
        'Leikekirja ei tue ikoneja')
      (
        'Company'
        'TMainForm'
        'CompanyLabel'
        ''
        'Yritys')
      (
        'Confirm'
        ''
        ''
        ''
        'Vahvista')
      (
        'Control '#39'%s'#39' has no parent window'
        ''
        ''
        ''
        #39'%s'#39'-kontrollilla ei ole is‰nt‰ikkunaa')
      (
        'Control-C hit'
        ''
        ''
        ''
        'Kontrolli-C painettu')
      (
        'Country'
        'TMainForm'
        'CountryLabel'
        ''
        'Maa')
      (
        'Ctrl+'
        ''
        ''
        ''
        'Ctrl+')
      (
        'Custom Locale Ids'
        ''
        ''
        ''
        'Omat paikannetunnukset')
      (
        'Custom locales...'
        'TMainForm'
        'Customlocales1'
        ''
        'Muokkaa')
      (
        'Dec'
        ''
        ''
        ''
        'joulu')
      (
        'December'
        ''
        ''
        ''
        'joulukuu')
      (
        'Del'
        ''
        ''
        ''
        'Del')
      (
        'Disk full'
        ''
        ''
        ''
        'Levy on t‰ynn‰')
      (
        'Division by zero'
        ''
        ''
        ''
        'Nollalla jako')
      (
        'Docked control must have a name'
        ''
        ''
        ''
        'Kiinitetyll‰ kontrollilla t‰ytyy olla nimi')
      (
        'Down'
        ''
        ''
        ''
        'Alas')
      (
        'Edit'
        'TMainForm'
        'EditMenu'
        ''
        'Muokkaa')
      (
        'End'
        ''
        ''
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
        ''
        ''
        'Parannetut Metatiedostot')
      (
        'Enter'
        ''
        ''
        ''
        'Enter')
      (
        'Error'
        ''
        ''
        ''
        'Virhe')
      (
        'Error creating variant array'
        ''
        ''
        ''
        'Varianttitaulukon luonnissa tapahtui virhe')
      (
        'Error creating window class'
        ''
        ''
        ''
        'Virhe tapahtui luotaessa ikkunaluokkaa')
      (
        'Error creating window device context'
        ''
        ''
        ''
        'Virhe tapahtui luotaessa ikkunan laitekontekstia')
      (
        'Error reading %s%s%s: %s'
        ''
        ''
        ''
        'Virhe lukiessa %s.%s: %s')
      (
        'Error removing control from dock tree'
        ''
        ''
        ''
        'Kontrollia ei voitu poistaa kiinnityspuusta')
      (
        'Esc'
        ''
        ''
        ''
        'Esc')
      (
        'Exception %s in module %s at %p.'#10'%s%s'
        ''
        ''
        ''
        '%s-poikkeus %s-modulissa osoitteessa %p.'#10'%s%s')
      (
        'Exception in safecall method'
        ''
        ''
        ''
        '')
      (
        'External exception %x'
        ''
        ''
        ''
        'Ulkoinen poikkeus %x')
      (
        'Failed to get data for '#39'%s'#39
        ''
        ''
        ''
        'Tietoa ei voitu saada '#39'%s'#39':ta')
      (
        'Failed to read ImageList data from stream'
        ''
        ''
        ''
        'Kuvalistan dataa ei voitu lukea virrasta')
      (
        'Failed to write ImageList data to stream'
        ''
        ''
        ''
        'Kuvalistan dataa ei voitu kirjoittaa virtaan')
      (
        'Feb'
        ''
        ''
        ''
        'helmi')
      (
        'February'
        ''
        ''
        ''
        'helmikuu')
      (
        'File access denied'
        ''
        ''
        ''
        'Tietoston k‰sittely ei ole mahdollista')
      (
        'File not found'
        ''
        ''
        ''
        'Tiedostoa ei lˆydy')
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
        'First Name'
        'TMainForm'
        'FirstNameLabel'
        ''
        'Etunimi')
      (
        'Floating point division by zero'
        ''
        ''
        ''
        'Liukuluvun nollalla jako')
      (
        'Floating point overflow'
        ''
        ''
        ''
        'Liukuluvun ylivuoto')
      (
        'Floating point underflow'
        ''
        ''
        ''
        'Liukuluvun alivuoto')
      (
        'Format '#39'%s'#39' invalid or incompatible with argument'
        ''
        ''
        ''
        #39'%s'#39'-muoto on v‰‰r‰ tai sopimaton argumentiksi')
      (
        'Fri'
        ''
        ''
        ''
        'pe')
      (
        'Friday'
        ''
        ''
        ''
        'perjantai')
      (
        'GroupIndex cannot be less than a previous menu item'#39's GroupIndex'
        ''
        ''
        ''
        
          'GroupIndex ei voi olla v‰hemm‰n kuin edellisen valikon GroupInde' +
          'x')
      (
        'Home'
        ''
        ''
        ''
        'Home')
      (
        'I/O error %d'
        ''
        ''
        ''
        'I/O-virhe %d')
      (
        'Icon image is not valid'
        ''
        ''
        ''
        'Ikonikuva ei ole oikea')
      (
        'Icons'
        ''
        ''
        ''
        'Ikonit')
      (
        'Info'
        'TMainForm'
        'Info1'
        ''
        'Tiedot')
      (
        'Information'
        ''
        ''
        ''
        'Tiedotus')
      (
        'Ins'
        ''
        ''
        ''
        'Ins')
      (
        'Integer overflow'
        ''
        ''
        ''
        'Kokonaisluvun ylivuoto')
      (
        'Interface not supported'
        ''
        ''
        ''
        'Rajapintaa ei tueta')
      (
        'Invalid argument to date encode'
        ''
        ''
        ''
        'V‰‰r‰t arvot p‰iv‰m‰‰r‰n koodauksessa')
      (
        'Invalid class typecast'
        ''
        ''
        ''
        'V‰‰r‰ luokan tyyppimuunnos')
      (
        'Invalid data type for '#39'%s'#39
        ''
        ''
        ''
        'V‰‰r‰ tietotyyppi '#39'%s'#39':lle')
      (
        'Invalid filename'
        ''
        ''
        ''
        'V‰‰r‰ tiedostonimi')
      (
        'Invalid floating point operation'
        ''
        ''
        ''
        'V‰‰r‰ luikulukuoperaatio')
      (
        'Invalid image size'
        ''
        ''
        ''
        'V‰‰r‰ kuvan koko')
      (
        'Invalid ImageList'
        ''
        ''
        ''
        'V‰‰r‰ kuvalistan')
      (
        'Invalid ImageList Index'
        ''
        ''
        ''
        'V‰‰r‰ kuvalistan indeksi')
      (
        'Invalid numeric input'
        ''
        ''
        ''
        'V‰‰r‰ numeerinen syˆttˆ')
      (
        'Invalid pointer operation'
        ''
        ''
        ''
        'V‰‰r‰ osoitinoperaatio')
      (
        'Invalid property path'
        ''
        ''
        ''
        'V‰‰r‰ ominaisuuden polku')
      (
        'Invalid property value'
        ''
        ''
        ''
        'V‰‰r‰ ominaisuuden arvo')
      (
        'Invalid stream format'
        ''
        ''
        ''
        'V‰‰r‰ virtamuoto')
      (
        'Invalid variant operation'
        ''
        ''
        ''
        'V‰‰r‰ variantin toiminto')
      (
        'Invalid variant type conversion'
        ''
        ''
        ''
        'V‰‰r‰ variantin tyyppimuunnos')
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
        ''
        ''
        'tammi')
      (
        'January'
        ''
        ''
        ''
        'tammikuu')
      (
        'Jul'
        ''
        ''
        ''
        'hein‰')
      (
        'July'
        ''
        ''
        ''
        'hein‰kuu')
      (
        'Jun'
        ''
        ''
        ''
        'kes‰')
      (
        'June'
        ''
        ''
        ''
        'kes‰kuu')
      (
        'Language'
        'TMainForm'
        'LanguageGroup'
        ''
        'Kieli')
      (
        'Last Name'
        'TMainForm'
        'LastNameLabel'
        ''
        'Sukunimi')
      (
        'Left'
        ''
        ''
        ''
        'Vasen')
      (
        'List capacity out of bounds (%d)'
        ''
        ''
        ''
        'Listan kapasiteetti on rajojen ulkopuolella (%d)')
      (
        'List count out of bounds (%d)'
        ''
        ''
        ''
        'Listan koko on rajojen ulkopuolella (%d)')
      (
        'List does not allow duplicates ($0%x)'
        ''
        ''
        ''
        '')
      (
        'List index out of bounds (%d)'
        ''
        ''
        ''
        'Listan indeksi on rajojen ulkopuolella (%d)')
      (
        'Locale'
        'TMainForm'
        'LocaleGroup'
        ''
        'Maakieli')
      (
        'Locale...'
        'TMainForm'
        'Locale1'
        ''
        'Paikanne...')
      (
        'Mar'
        ''
        ''
        ''
        'maalis')
      (
        'March'
        ''
        ''
        ''
        'maaliskuu')
      (
        'May'
        ''
        ''
        ''
        'touko')
      (
        'Menu '#39'%s'#39' is already being used by another form'
        ''
        ''
        ''
        #39'%s'#39'-valikkoa k‰ytt‰‰ jo toinen lomake')
      (
        'Menu index out of range'
        ''
        ''
        ''
        'Valikon indeksi on rajojen ulkopuolella')
      (
        'Menu inserted twice'
        ''
        ''
        ''
        'Valikko on lis‰tty kahdesti')
      (
        'Metafile is not valid'
        ''
        ''
        ''
        'Metafile ei ole oikea')
      (
        'Metafiles'
        ''
        ''
        ''
        'Metatiedostot')
      (
        'Middle Name'
        'TMainForm'
        'MiddleNameLabel'
        ''
        'Toinen nimi')
      (
        'Mon'
        ''
        ''
        ''
        'ma')
      (
        'Monday'
        ''
        ''
        ''
        'maanantai')
      (
        'N&o to All'
        ''
        ''
        ''
        'Ei kaikkiin')
      (
        'New Zealand'
        ''
        ''
        ''
        'Uusi-Seelanti')
      (
        'No argument for format '#39'%s'#39
        ''
        ''
        ''
        #39'%s'#39'-muodossa ei ole argumenttia')
      (
        'Nov'
        ''
        ''
        ''
        'marras')
      (
        'November'
        ''
        ''
        ''
        'marraskuu')
      (
        'Oct'
        ''
        ''
        ''
        'loka')
      (
        'October'
        ''
        ''
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
        'TListDialog'
        'OKBtn'
        ''
        'OK')
      (
        'Operation not allowed on sorted string list'
        ''
        ''
        ''
        'Operaatiota ei voi suorittaa lajitellulle listalle')
      (
        'Options'
        'TMainForm'
        'OptionsMenu'
        ''
        'Asetukset')
      (
        'Out of memory'
        ''
        ''
        ''
        'Muisti loppui')
      (
        'Out of memory while expanding memory stream'
        ''
        ''
        ''
        'Muisti loppui k‰sitelt‰ess‰ tiedostovirtaa')
      (
        'Out of system resources'
        ''
        ''
        ''
        'J‰rjestelm‰resurssit ovat loppu')
      (
        'PgDn'
        ''
        ''
        ''
        'PgDn')
      (
        'PgUp'
        ''
        ''
        ''
        'PgUp')
      (
        'Postal Code'
        ''
        ''
        ''
        'Postinumero')
      (
        'Postal Code'
        'TMainForm'
        'PostalCodeLabel'
        ''
        'Postinumero')
      (
        'Privileged instruction'
        ''
        ''
        ''
        'Suojattu k‰sky')
      (
        'Property does not exist'
        ''
        ''
        ''
        'Ominaisuutta ei ole olemassa')
      (
        'Property is read-only'
        ''
        ''
        ''
        'Ominaisuus on vain luettava')
      (
        'Province'
        ''
        ''
        ''
        'Provinssi')
      (
        'Range check error'
        ''
        ''
        ''
        'Rajatarkistusvirhe')
      (
        'Read'
        ''
        ''
        ''
        'Lue')
      (
        'Read beyond end of file'
        ''
        ''
        ''
        'Tieton lopun j‰lkeen yritettiin lukea')
      (
        'Republic of the Philippines'
        ''
        ''
        ''
        'Filippiinit')
      (
        'Resource %s not found'
        ''
        ''
        ''
        '%s-resurssia ei lˆytynyt')
      (
        'Right'
        ''
        ''
        ''
        'Oikea')
      (
        'Sat'
        ''
        ''
        ''
        'la')
      (
        'Saturday'
        ''
        ''
        ''
        'lauantai')
      (
        'Sep'
        ''
        ''
        ''
        'syys')
      (
        'September'
        ''
        ''
        ''
        'syyskuu')
      (
        'Shift+'
        ''
        ''
        ''
        'Vaihto+')
      (
        'South Africa'
        ''
        ''
        ''
        'Etel‰-Afrikka')
      (
        'Space'
        ''
        ''
        ''
        'Space')
      (
        'Stack overflow'
        ''
        ''
        ''
        'Pinon ylivuoto')
      (
        'State'
        ''
        ''
        ''
        'Osavaltio')
      (
        'State'
        'TMainForm'
        'StateLabel'
        ''
        'Osavaltio')
      (
        'Stream read error'
        ''
        ''
        ''
        'Tiedostovirran lukuvirhe')
      (
        'Stream write error'
        ''
        ''
        ''
        'Tiedostovirran kirjoitusvirhe')
      (
        'String list does not allow duplicates'
        ''
        ''
        ''
        'Merkkijonolistassa ei voi olla samaa j‰sent‰ kahdesti')
      (
        'Sub-menu is not in menu'
        ''
        ''
        ''
        'Alivalikko ei ole valikossa')
      (
        'Sun'
        ''
        ''
        ''
        'su')
      (
        'Sunday'
        ''
        ''
        ''
        'sunnuntai')
      (
        'Sweden'
        ''
        ''
        ''
        'Ruotsi')
      (
        'System Locale Ids'
        ''
        ''
        ''
        'Systeemin paikannetunnukset')
      (
        'System locale ids...'
        'TMainForm'
        'Systemlocales1'
        ''
        'Systeemin paikannetunnukset...')
      (
        'Tab'
        ''
        ''
        ''
        'Sarkain')
      (
        'Text exceeds memo capacity'
        ''
        ''
        ''
        'Teksti ylitt‰‰ muistion kapasiteetin')
      (
        'Thu'
        ''
        ''
        ''
        'to')
      (
        'Thursday'
        ''
        ''
        ''
        'torstai')
      (
        'Too many open files'
        ''
        ''
        ''
        'Liian monta avoinna olevaa tiedostoa')
      (
        'Trinidad y Tobago'
        ''
        ''
        ''
        'Trinidad ja Tobago')
      (
        'Tue'
        ''
        ''
        ''
        'ti')
      (
        'Tuesday'
        ''
        ''
        ''
        'tiistai')
      (
        'Unable to insert a line'
        ''
        ''
        ''
        'Rivi‰ ei voitu lis‰t‰')
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
        'Unsupported clipboard format'
        ''
        ''
        ''
        'Leikekirjaformaattia ei tueta')
      (
        'Up'
        ''
        ''
        ''
        'Ylˆs')
      (
        'Variant array index out of bounds'
        ''
        ''
        ''
        'Varianttitaulukon indeksi on rajojen ulkopuolella')
      (
        'Variant is not an array'
        ''
        ''
        ''
        'Variantti ei ole taulukko')
      (
        'Variant method calls not supported'
        ''
        ''
        ''
        'Variantin metodin kutsua ei ole tuettu')
      (
        'Warning'
        ''
        ''
        ''
        'Varoitus')
      (
        'Wed'
        ''
        ''
        ''
        'ke')
      (
        'Wednesday'
        ''
        ''
        ''
        'keskiviikko')
      (
        'Win32 Error.  Code: %d.'#10'%s'
        ''
        ''
        ''
        'Win32-virhe.  Koodi: %d.'#10'%s')
      (
        'Write'
        ''
        ''
        ''
        'Kirjoita')
      (
        'Yes to &All'
        ''
        ''
        ''
        'Kyll‰ kaikkiin')
      (
        'Zimbabwe'
        ''
        ''
        ''
        'Zimbabwe')
      (
        'Zip'
        ''
        ''
        ''
        'Postinumero'))
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
end
