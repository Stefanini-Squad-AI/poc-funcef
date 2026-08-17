object ActiveFormX: TActiveFormX
  Left = 233
  Top = 376
  Width = 382
  Height = 139
  Caption = 'ActiveForm Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 45
    Height = 13
    Caption = 'Numbers:'
  end
  object ListBox1: TListBox
    Left = 8
    Top = 24
    Width = 137
    Height = 73
    ItemHeight = 13
    Items.Strings = (
      'One'
      'Two'
      'Three')
    TabOrder = 0
  end
  object LanguageButton: TButton
    Left = 288
    Top = 24
    Width = 75
    Height = 25
    Caption = '&Language...'
    TabOrder = 1
    OnClick = LanguageButtonClick
  end
  object CheckBox1: TCheckBox
    Left = 160
    Top = 24
    Width = 113
    Height = 17
    Caption = 'Sample'
    TabOrder = 2
  end
  object RadioButton1: TRadioButton
    Left = 160
    Top = 48
    Width = 113
    Height = 17
    Caption = 'Option'
    TabOrder = 3
  end
  object AboutButton: TButton
    Left = 288
    Top = 56
    Width = 75
    Height = 25
    Caption = '&About...'
    TabOrder = 4
    OnClick = AboutButtonClick
  end
  object IvDictionary1: TIvBinaryDictionary
    DictionaryName = 'Dictionary1'
    FileName = 'diction.mld'
    Storage = ivsEmbedded
    Left = 160
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
      252
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
        
          '%d is an invalid PageIndex value.  PageIndex must be between 0 a' +
          'nd %d'
        ''
        ''
        ''
        
          '%d on v‰‰r‰ PageIndex:n arvo. PageIndex pit‰‰ olla 0:n ja %d:n v' +
          '‰lill‰')
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
        '%s property out of range'
        ''
        ''
        ''
        '%s-ominaisuus on rajojen ulkopuolella')
      (
        '&Abort'
        ''
        ''
        ''
        'Keskeyt‰')
      (
        '&About...'
        'TActiveFormX'
        'AboutButton'
        ''
        '&Tietoja...')
      (
        '&All'
        ''
        ''
        ''
        'Kaikki')
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
        '&Language...'
        'TActiveFormX'
        'LanguageButton'
        ''
        '&Kieli...')
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
        '%s-niminen komponentti on jo olemassa')
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
        'About'
        'TAboutDialog'
        ''
        ''
        'Tietoa')
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
        'ActiveForm Sample'
        'TActiveFormX'
        ''
        ''
        'ActiveForm-esimerkki')
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
        'Peruuta')
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
        'Cannot open clipboard'
        ''
        ''
        ''
        'Leikekirjaa ei voitu avata')
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
        'Class %s not found'
        ''
        ''
        ''
        '%s-luokkaa ei lˆytynyt')
      (
        'Clipboard does not support Icons'
        ''
        ''
        ''
        'Leikekirja ei tue ikoneja')
      (
        'COM Server Warning'
        ''
        ''
        ''
        'Automatio-varoitus')
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
        'Copyright (c) 1998 Innoview Data Technologies Ltd.'
        'TAboutDialog'
        'Label2'
        ''
        'Tekij‰noikeudet (c) Innoview Data Technologies Oy')
      (
        'Ctrl+'
        ''
        ''
        ''
        'Ctrl+')
      (
        'DAX Error'
        ''
        ''
        ''
        'DAX-virhe')
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
        'Dispatch interface missing from class %s'
        ''
        ''
        ''
        '%s-luokan suoritusrajapinta puuttuu')
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
        'Error creating system registry entry'
        ''
        ''
        ''
        'Systeemirekisterin arvoa teht‰ess‰ syntyi virhe')
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
        'External exception %x'
        ''
        ''
        ''
        'Ulkoinen poikkeus %x')
      (
        'Failed to clear tab control'
        ''
        ''
        ''
        'Sarkainkontrollia ei voitu tyhj‰t‰')
      (
        'Failed to delete tab at index %d'
        ''
        ''
        ''
        'Sarkainta ei pystytty poistamaan indeksist‰ %d')
      (
        'Failed to get data for '#39'%s'#39
        ''
        ''
        ''
        'Tietoa ei voitu saada '#39'%s'#39':ta')
      (
        'Failed to get object at index %d'
        ''
        ''
        ''
        'Oloita eo pystytty hakemaan indeksist‰ %d')
      (
        'Failed to read ImageList data from stream'
        ''
        ''
        ''
        'Kuvalistan dataa ei voitu lukea virrasta')
      (
        'Failed to retrieve tab at index %d'
        ''
        ''
        ''
        'Sarkainta ei pystytty hakemaan indeksist‰ %d')
      (
        'Failed to set object at index %d'
        ''
        ''
        ''
        'Oliota ei pystytty asettamaan indeksiin %d')
      (
        'Failed to set tab "%s" at index %d'
        ''
        ''
        ''
        '"%s"-sarkainta ei pystytty asettamaan indeksiin %d')
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
        'File load error'
        ''
        ''
        ''
        'Tiedoston latausvirhe')
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
        'Fixed column count must be less than column count'
        ''
        ''
        ''
        
          'Kiinteiden sarakkeiden m‰‰r‰n on oltava v‰hemm‰n kuin v‰hemm‰n k' +
          'uin sarakkeiden kokonaism‰‰r‰n')
      (
        'Fixed row count must be less than row count'
        ''
        ''
        ''
        
          'Kiinteiden rivien m‰‰r‰n on oltava v‰hemm‰n kuin rivien kokonais' +
          'm‰‰r‰n')
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
        'Grid index out of range'
        ''
        ''
        ''
        'Taulukon indeksi on rajojen ulkopuolella')
      (
        'Grid too large for operation'
        ''
        ''
        ''
        'Taulukko on liian suuri operaatiolle')
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
        'Incorrect type information for class %s'
        ''
        ''
        ''
        '%s-luokan tyyppitiedot ovat virheelliset')
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
        'Invalid class typecast'
        ''
        ''
        ''
        'V‰‰r‰ luokan tyyppimuunnos')
      (
        'Invalid clipboard format'
        ''
        ''
        ''
        'V‰‰r‰ leikekirjaformaatti')
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
        'Invalid index'
        ''
        ''
        ''
        'V‰‰r‰ indeksi')
      (
        'Invalid input value'
        ''
        ''
        ''
        'V‰‰r‰ syˆtt‰arvo')
      (
        'Invalid input value.  Use escape key to abandon changes'
        ''
        ''
        ''
        'V‰‰r‰ syˆttˆarvo. K‰yt‰ Esc-n‰pp‰int‰ peruaksesi muutokset')
      (
        'Invalid numeric input'
        ''
        ''
        ''
        'V‰‰r‰ numeerinen syˆttˆ')
      (
        'Invalid operation on TOleGraphic'
        ''
        ''
        ''
        'V‰‰r‰ operaatio TOleGraphic:lle')
      (
        'Invalid outline index'
        ''
        ''
        ''
        'V‰‰r‰ outline-indeksi')
      (
        'Invalid owner'
        ''
        ''
        ''
        'V‰‰r‰ omistaja')
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
        'Invalid selection'
        ''
        ''
        ''
        'V‰‰r‰ valinta')
      (
        'Invalid stream format'
        ''
        ''
        ''
        'V‰‰r‰ virtamuoto')
      (
        'Invalid value for current item'
        ''
        ''
        ''
        'Nykyisell‰ j‰senell‰ on v‰‰r‰ arvo')
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
        'Left'
        ''
        ''
        ''
        'Vasen')
      (
        'Line too long'
        ''
        ''
        ''
        'Rivi on liian pitk‰')
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
        'List index out of bounds (%d)'
        ''
        ''
        ''
        'Listan indeksi on rajojen ulkopuolella (%d)')
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
        'Maximum outline depth exceeded'
        ''
        ''
        ''
        'Suuri outline-syvyys ylitetty')
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
        'Method '#39'%s'#39' not supported by automation object'
        ''
        ''
        ''
        'OLE-olio ei tue '#39'%s'#39'-metodia')
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
        'MultiLine must be True when TabPosition is tpLeft or tpRight'
        ''
        ''
        ''
        
          'MultiLine:n on oltava tosi, kun TabPosition on tpLeft tai tpRigh' +
          't')
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
        'Not enough timers available'
        ''
        ''
        ''
        'Ajanottajia ei ole tarpeeksi')
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
        'Numbers:'
        'TActiveFormX'
        'Label1'
        ''
        'Numerot:')
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
        'TAboutDialog'
        'OKButton'
        ''
        'OK')
      (
        'OLE error %.8x'
        ''
        ''
        ''
        'OLE-virhe %.8x')
      (
        'One'
        'TActiveFormX'
        'ListBox1'
        ''
        'Yksi')
      (
        'Operation not allowed on sorted string list'
        ''
        ''
        ''
        'Operaatiota ei voi suorittaa lajitellulle listalle')
      (
        'Option'
        'TActiveFormX'
        'RadioButton1'
        ''
        'Optiot')
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
        'Outline index not found'
        ''
        ''
        ''
        'Outline:n indeksi‰ ei lˆytynyt')
      (
        'Parent must be expanded'
        ''
        ''
        ''
        'Is‰nt‰ t‰ytyy olla laajennettu')
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
        'Privileged instruction'
        ''
        ''
        ''
        'Suojattu k‰sky')
      (
        'Properties'
        ''
        ''
        ''
        'Ominaisuudet')
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
        '')
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
        'Sample'
        'TActiveFormX'
        'CheckBox1'
        ''
        'Esimerkki')
      (
        'Sample ActiveForm application'
        'TAboutDialog'
        'Label1'
        ''
        'ActiveForm-esimerkkiohjelma')
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
        'Select Language'
        ''
        ''
        ''
        'Valitse kieli')
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
        'Tab'
        ''
        ''
        ''
        'Sarkain')
      (
        'Tab position incompatible with current tab style'
        ''
        ''
        ''
        
          'Sarkaimen paikka ei ole yhteensopiva nykyisen sarkaintyylin kans' +
          'sa')
      (
        'Tab style incompatible with current tab position'
        ''
        ''
        ''
        
          'Sarkaintyyli ei ole yhteensopiva nykyisen sarkaimen paikan kanss' +
          'a')
      (
        
          'There are still active COM objects in this application.  One or ' +
          'more clients may have references to these objects, so manually c' +
          'losing '
        ''
        ''
        ''
        
          'Automaatio on k‰ynnist‰nyt t‰m‰s sovelluksen ja useammalla kuin ' +
          'yhdell‰ asiakkaalla on yhteys sovellukseen.  Asiakkaiden pit‰isi' +
          ' sulkea sovellus')
      (
        
          'this application may cause those client application(s) to fail.'#13 +
          #10#13#10'Are you sure you want to close this application?'
        ''
        ''
        ''
        
          't‰m‰ sovellus aiheuttaa melko varmasti asiakkaan kaatumisen. '#13#10#13 +
          #10'Oletko varma, ett‰ haluat sulkea t‰m‰n sovelluksen?')
      (
        'Three'
        'TActiveFormX'
        'ListBox1'
        ''
        'Kolme')
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
        'Too many rows or columns deleted'
        ''
        ''
        ''
        'Liian monta rivi tai saraketta poistettu')
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
        'Two'
        'TActiveFormX'
        'ListBox1'
        ''
        'Kaksi')
      (
        'Type information missing for class %s'
        ''
        ''
        ''
        '%s-luokan tyyppitiedot puuttuvat')
      (
        'Unable to insert a line'
        ''
        ''
        ''
        'Rivi‰ ei voitu lis‰t‰')
      (
        'Unable to insert an item'
        ''
        ''
        ''
        'J‰sent‰ ei voitu lis‰t‰')
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
        'Variant does not reference an automation object'
        ''
        ''
        ''
        'Variantti ei viittaa OLE-olioon')
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
    Left = 192
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
        'Items'
        0)
      (
        ''
        'Caption'
        0))
  end
end
