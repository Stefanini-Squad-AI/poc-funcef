object MainForm: TMainForm
  Left = 225
  Top = 127
  AutoScroll = False
  Caption = 'Driving time calculator'
  ClientHeight = 175
  ClientWidth = 369
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poDefaultPosOnly
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 88
    Width = 69
    Height = 13
    Caption = 'Date and time:'
  end
  object CurrentTime: TLabel
    Left = 176
    Top = 88
    Width = 33
    Height = 13
    Hint = 'The current date and time in the local format'
    Caption = 'dummy'
  end
  object Label3: TLabel
    Left = 8
    Top = 64
    Width = 68
    Height = 13
    Caption = 'Speeding fine:'
  end
  object SpeedingFine: TLabel
    Left = 176
    Top = 64
    Width = 33
    Height = 13
    Hint = 'The speeding fine in the local currency'
    Caption = 'dummy'
  end
  object CurrentLocale: TLabel
    Left = 176
    Top = 112
    Width = 33
    Height = 13
    Hint = 'The locale (i.e. language + country) that is used'
    Caption = 'dummy'
  end
  object Label4: TLabel
    Left = 8
    Top = 112
    Width = 68
    Height = 13
    Caption = 'Current locale:'
  end
  object CurrentLanguage: TLabel
    Left = 176
    Top = 136
    Width = 33
    Height = 13
    Hint = 'The current language of the user interface'
    Caption = 'dummy'
  end
  object Label1: TLabel
    Left = 8
    Top = 136
    Width = 116
    Height = 13
    Caption = 'User interface language:'
  end
  object IvGroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 233
    Height = 49
    Caption = '&Give the driving distance'
    TabOrder = 0
    object UnitLabel: TLabel
      Left = 88
      Top = 18
      Width = 33
      Height = 13
      Hint = 'The distance unit used by the current locale'
      Caption = 'dummy'
    end
    object DistanceEdit: TEdit
      Left = 8
      Top = 16
      Width = 73
      Height = 21
      TabOrder = 0
    end
  end
  object CalculateButton: TButton
    Left = 256
    Top = 24
    Width = 97
    Height = 25
    Hint = 'Calculates the average driving time'
    Caption = '&Calculate'
    Default = True
    TabOrder = 1
    OnClick = CalculateButtonClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 156
    Width = 369
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object MainMenu1: TMainMenu
    Left = 320
    Top = 56
    object Language1: TMenuItem
      Caption = 'File'
      Hint = 'Let you select the language and locale'
      object LanguageMenu: TMenuItem
        Caption = 'Language...'
        Hint = 'Select the active language'
        OnClick = LanguageMenuClick
      end
      object SublanguageMenu: TMenuItem
        Caption = 'Sublanguage...'
        Hint = 'Select the active language and locale'
        OnClick = SublanguageMenuClick
      end
      object LocaleMenu: TMenuItem
        Caption = 'Locale...'
        Hint = 'Select the active locale'
        OnClick = LocaleMenuClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object ExitMenu: TMenuItem
        Caption = 'Exit'
        Hint = 'Quits the application'
        OnClick = ExitMenuClick
      end
    end
    object Options1: TMenuItem
      Caption = 'Options'
      Hint = 'Let you change the options'
      OnClick = Options1Click
      object ShowNativeMenu: TMenuItem
        Caption = 'Show native names'
        Hint = 'If checked the select dialogs use the native names'
        OnClick = ShowNativeMenuClick
      end
      object ShowAllMenu: TMenuItem
        Caption = 'Show all languages'
        Hint = 'If not checked only the enabled languages and locales are shown'
        OnClick = ShowAllMenuClick
      end
      object UseEuroMenu: TMenuItem
        Caption = 'Use Euro'
        Hint = 
          'If checked the Euro monatary symbol is used if the locale is a m' +
          'ember of EMU'
        OnClick = UseEuroMenuClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object BindMenu: TMenuItem
        Caption = 'Bind'
        Hint = 'Set a binding between the language and the locale'
        object NoneMenu: TMenuItem
          Caption = 'None'
          Hint = 'No binding is used'
          OnClick = NoneMenuClick
        end
        object LanguageToLocaleMenu: TMenuItem
          Caption = 'Language to locale'
          Hint = 'The language has been bound to locale'
          OnClick = LanguageToLocaleMenuClick
        end
        object LocaleToLanguageMenu: TMenuItem
          Caption = 'Locale to language'
          Hint = 'The locale has been bound to language'
          OnClick = LocaleToLanguageMenuClick
        end
      end
      object EnabledLanguagesMenu: TMenuItem
        Caption = 'Enabled languages'
        Hint = 'Shows what languages are enabled'
        object AllMenu: TMenuItem
          Caption = 'All'
          Hint = 'All languages and locales are enabled'
          OnClick = AllMenuClick
        end
        object SystemMenu: TMenuItem
          Caption = 'Supported by the system'
          Hint = 'Only languages that are supported by the system are enabled'
          OnClick = SystemMenuClick
        end
        object CodePageMenu: TMenuItem
          Caption = 'Supported by the code page'
          Hint = 
            'Only languages that are supported by the current code page are e' +
            'nabled'
          OnClick = CodePageMenuClick
        end
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      Hint = 'Provides help'
      object AboutMenu: TMenuItem
        Caption = 'About...'
        Hint = 'Shows information about DCALC'
        OnClick = AboutMenuClick
      end
    end
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    OnLocaleChange = IvTranslator1LanguageChange
    OnLanguageChange = IvTranslator1LanguageChange
    Left = 288
    Top = 56
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
  object IvDictionary1: TIvBinaryDictionary
    DictionaryName = 'Dictionary1'
    Euro = iveBusiness
    FileName = 'dcalc.mld'
    Storage = ivsEmbedded
    Left = 256
    Top = 56
    DictionaryCode = 4
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
        2
        0
        1252
        'English'
        'English'
        ''
        0
        False
        False)
      (
        9
        '1,8,9'
        1
        0
        1252
        'English (United States)'
        'English (United States)'
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
      440
      (
        ' - Dock zone has no control'
        ''
        '65318'
        ''
        ''
        ' - kiinnitysalueella ei ole yht‰‰n kontrollia')
      (
        ' - Dock zone not found'
        ''
        '65317'
        ''
        ''
        ' - kiinnitysaluetta ei lˆytynyt')
      (
        '"%s" is not a valid distance!'
        ''
        ''
        ''
        ''
        '"%s" ei ole mahdollinen et‰isyyden arvo!')
      (
        
          '%d is an invalid PageIndex value.  PageIndex must be between 0 a' +
          'nd %d'
        ''
        '65298'
        ''
        ''
        
          '%d on v‰‰r‰ PageIndex:n arvo. PageIndex pit‰‰ olla 0:n ja %d:n v' +
          '‰lill‰')
      (
        '%s (%s, line %d)'
        ''
        '65497'
        ''
        ''
        '%s (%s, rivi %d)')
      (
        #39#39'%s'#39#39' is not a valid component name'
        ''
        '65430'
        ''
        ''
        #39#39'%s'#39#39' ei ole oikea komponentin nimi')
      (
        #39'%s'#39' is not a valid integer value'
        ''
        '65520'
        ''
        ''
        #39'%s'#39' ei ole kokonaislukuarvo')
      (
        '%s property out of range'
        ''
        '65393'
        ''
        ''
        '%s-ominaisuus on rajojen ulkopuolella')
      (
        '&Abort'
        ''
        '65346'
        ''
        ''
        '&Keskeyt‰')
      (
        '&All'
        ''
        '65349'
        ''
        ''
        '&Kaikki')
      (
        '&All'
        ''
        '65378'
        ''
        ''
        '&Kaikki')
      (
        '&Calculate'
        'TMainForm'
        'CalculateButton'
        ''
        ''
        '&Laske')
      (
        '&Close'
        ''
        ''
        ''
        ''
        '&Sulje')
      (
        '&Close'
        ''
        '65406'
        ''
        ''
        '&Sulje')
      (
        '&Give the driving distance'
        'TMainForm'
        'IvGroupBox1'
        ''
        ''
        'Anna ajo&matka')
      (
        '&Help'
        ''
        '65345'
        ''
        ''
        '&Ohje')
      (
        '&Help'
        ''
        '65405'
        ''
        ''
        '&Ohje')
      (
        '&Ignore'
        ''
        '65348'
        ''
        ''
        '&Hylk‰‰')
      (
        '&Ignore'
        ''
        '65407'
        ''
        ''
        '&Hylk‰‰')
      (
        '&Move'
        ''
        ''
        ''
        ''
        '&Siirr‰')
      (
        '&Next'
        ''
        ''
        ''
        ''
        '&Seuraava')
      (
        '&No'
        ''
        '65374'
        ''
        ''
        '&Ei')
      (
        '&No'
        ''
        '65404'
        ''
        ''
        '&Ei')
      (
        '&Restore'
        ''
        ''
        ''
        ''
        '&Palauta')
      (
        '&Retry'
        ''
        '65347'
        ''
        ''
        '&Uudestaan')
      (
        '&Retry'
        ''
        '65376'
        ''
        ''
        '&Uudestaan')
      (
        '&Size'
        ''
        ''
        ''
        ''
        '&Koko')
      (
        '&Yes'
        ''
        '65373'
        ''
        ''
        '&Kyll‰')
      (
        '&Yes'
        ''
        '65403'
        ''
        ''
        '&Kyll‰')
      (
        'A class named %s already exists'
        ''
        '65431'
        ''
        ''
        '%s-niminen luokka on jo olemassa')
      (
        'A component named %s already exists'
        ''
        '65429'
        ''
        ''
        '%s-niminen komponentti on jo olemassa')
      (
        'A control cannot have itself as its parent'
        ''
        '65400'
        ''
        ''
        'Kontrollin is‰nt‰ ei voi olla kontrolli itse')
      (
        'A Win32 API function failed'
        ''
        '65501'
        ''
        ''
        'Win32API-functio ep‰onnistui')
      (
        'Abort'
        ''
        '65377'
        ''
        ''
        'Keskeyt‰')
      (
        'About...'
        'TMainForm'
        'AboutMenu'
        ''
        ''
        'Tietoa...')
      (
        'Abstract Error'
        ''
        '65498'
        ''
        ''
        'Abstrakti virhe')
      (
        'Access violation at address %p in module '#39'%s'#39'. %s of address %p'
        ''
        '65499'
        ''
        ''
        'K‰sittelyvirhe osoitteessa %p, '#39'%s'#39'-modulissa. %s:n osoite %p')
      (
        'Access violation at address %p. %s of address %p'
        ''
        '65509'
        ''
        ''
        'K‰sittelyvirhe %p-osoittessa. %s osoite %p')
      (
        'Afrikaans'
        ''
        ''
        ''
        ''
        'afrikaans')
      (
        'Albania'
        ''
        ''
        ''
        ''
        'Albania')
      (
        'Albanian'
        ''
        ''
        ''
        ''
        'albania')
      (
        'Algeria'
        ''
        ''
        ''
        ''
        'Algeria')
      (
        'All'
        'TMainForm'
        'AllMenu'
        ''
        ''
        'Kaikki')
      (
        'All languages and locales are enabled'
        'TMainForm'
        'AllMenu'
        ''
        ''
        'Kaikki kielet ja maakielet ovat mahdollisia')
      (
        'Alt+'
        ''
        '65337'
        ''
        ''
        'Alt+')
      (
        'Ancestor for '#39'%s'#39' not found'
        ''
        '65437'
        ''
        ''
        #39'%s'#39':n ‰iti‰ ei lˆydy')
      (
        'Application Error'
        ''
        '65514'
        ''
        ''
        'Sovellusvirhe')
      (
        'Apr'
        ''
        '65473'
        ''
        ''
        'huhti')
      (
        'April'
        ''
        '65485'
        ''
        ''
        'huhtikuu')
      (
        'Arabic'
        ''
        ''
        ''
        ''
        'arabia')
      (
        'Argentina'
        ''
        ''
        ''
        ''
        'Argentiina')
      (
        'Assertion failed'
        ''
        '65494'
        ''
        ''
        'Testaus ep‰onnistui')
      (
        'Aug'
        ''
        '65477'
        ''
        ''
        'elo')
      (
        'August'
        ''
        '65457'
        ''
        ''
        'elokuu')
      (
        'Australia'
        ''
        ''
        ''
        ''
        'Australia')
      (
        'Austria'
        ''
        ''
        ''
        ''
        'It‰valta')
      (
        'Bahrain'
        ''
        ''
        ''
        ''
        'Bahrain')
      (
        'Basque'
        ''
        ''
        ''
        ''
        'baski')
      (
        'Belarus'
        ''
        ''
        ''
        ''
        'Valko-Ven‰j‰')
      (
        'Belarusian'
        ''
        ''
        ''
        ''
        'valkoven‰j‰')
      (
        'Belgium'
        ''
        ''
        ''
        ''
        'Belgia')
      (
        'Belize'
        ''
        ''
        ''
        ''
        'Belize')
      (
        'Bind'
        'TMainForm'
        'BindMenu'
        ''
        ''
        'Sido')
      (
        'Bitmap image is not valid'
        ''
        '65438'
        ''
        ''
        'Bittikarttakuva ei ole oikea')
      (
        'Bitmaps'
        ''
        '65383'
        ''
        ''
        'Bittikartat')
      (
        'Bits index out of range'
        ''
        '65343'
        ''
        ''
        'Bitin indeksi on rajojen ulkopuolella')
      (
        'BkSp'
        ''
        '65352'
        ''
        ''
        'BkSp')
      (
        'Bokmal'
        ''
        ''
        ''
        ''
        'bokmÂl')
      (
        'Bolivia'
        ''
        ''
        ''
        ''
        'Bolivia')
      (
        'Brazil'
        ''
        ''
        ''
        ''
        'Brasilia')
      (
        'Bulgaria'
        ''
        ''
        ''
        ''
        'Bulgaria')
      (
        'Bulgarian'
        ''
        ''
        ''
        ''
        'bulgaria')
      (
        'Calculates the average driving time'
        'TMainForm'
        'CalculateButton'
        ''
        ''
        'Laskee keskim‰‰r‰isen ajoajan')
      (
        'Canada'
        ''
        ''
        ''
        ''
        'Kanada')
      (
        'Cancel'
        ''
        ''
        ''
        ''
        'Peruuta')
      (
        'Cancel'
        ''
        '65344'
        ''
        ''
        'Peruuta')
      (
        'Cancel'
        ''
        '65402'
        ''
        ''
        'Peruuta')
      (
        'Cannot assign a %s to a %s'
        ''
        '65444'
        ''
        ''
        'Ei voi sijoittaa %s:ta %s:n')
      (
        'Cannot change the size of an icon'
        ''
        '65409'
        ''
        ''
        'Ikonin kokoa ei voi muuttaa')
      (
        'Cannot change Visible in OnShow or OnHide'
        ''
        '65423'
        ''
        ''
        'OnShow- ja OnHide-eventeiss‰ ei voi muuttaa Visible-ominaisuutta')
      (
        'Cannot create file %s'
        ''
        '65445'
        ''
        ''
        'Ei voi luoda %s-tiedostoa')
      (
        'Cannot create form. No MDI forms are currently active'
        ''
        '65399'
        ''
        ''
        
          'Lomaketta ei voitu luoda. Yht‰‰n MDI-lomaketta ei ole aktiivisen' +
          'a')
      (
        'Cannot drag a form'
        ''
        '65379'
        ''
        ''
        'Lomaketta ei voi vet‰‰')
      (
        'Cannot focus a disabled or invisible window'
        ''
        '65420'
        ''
        ''
        'J‰‰dytetty tai n‰kym‰tˆn ikkuna ei voi saada fokusta')
      (
        'Cannot hide an MDI Child Form'
        ''
        '65422'
        ''
        ''
        'MDI-lapsilomaketta ei voi k‰tke‰')
      (
        'Cannot insert or delete rows from grid'
        ''
        '65389'
        ''
        ''
        'Revej‰ ei voi poistaa tai lis‰t‰ taulukkoon')
      (
        'Cannot make a visible window modal'
        ''
        '65392'
        ''
        ''
        'N‰kyv‰‰ ikkunaa ei voi tehd‰ modaaliksi')
      (
        'Cannot open clipboard'
        ''
        '65341'
        ''
        ''
        'Leikekirjaa ei voitu avata')
      (
        'Cannot open file %s'
        ''
        '65446'
        ''
        ''
        'Ei voi avata %s-tiedostoa')
      (
        'Can'#39't write to a read-only resource stream'
        ''
        '65450'
        ''
        ''
        'Luettavaan resurssivirtaan ei voi kirjoittaa')
      (
        'Canvas does not allow drawing'
        ''
        '65412'
        ''
        ''
        'Kanvakselle ei voi piirt‰‰')
      (
        'Caribbean'
        ''
        ''
        ''
        ''
        'Karibia')
      (
        'Catalan'
        ''
        ''
        ''
        ''
        'katalaani')
      (
        'Chile'
        ''
        ''
        ''
        ''
        'Chile')
      (
        'Chinese'
        ''
        ''
        ''
        ''
        'kiina')
      (
        'Class %s not found'
        ''
        '65451'
        ''
        ''
        '%s-luokkaa ei lˆytynyt')
      (
        'Clipboard does not support Icons'
        ''
        '65340'
        ''
        ''
        'Leikekirja ei tue ikoneja')
      (
        'Colombia'
        ''
        ''
        ''
        ''
        'Kolumbia')
      (
        'Confirm'
        ''
        '65372'
        ''
        ''
        'Vahvista')
      (
        'Control '#39'%s'#39' has no parent window'
        ''
        '65421'
        ''
        ''
        #39'%s'#39'-kontrollilla ei ole is‰nt‰ikkunaa')
      (
        'Control-C hit'
        ''
        '65511'
        ''
        ''
        'Kontrolli-C painettu')
      (
        'Costa Rica'
        ''
        ''
        ''
        ''
        'Costa Rica')
      (
        'Croatia'
        ''
        ''
        ''
        ''
        'Kroatia')
      (
        'Croatian'
        ''
        ''
        ''
        ''
        'kroatia')
      (
        'Ctrl+'
        ''
        '65336'
        ''
        ''
        'Ctrl+')
      (
        'Current locale:'
        'TMainForm'
        'Label4'
        ''
        ''
        'Voimassaoleva paikanne:')
      (
        'Czech'
        ''
        ''
        ''
        ''
        'tsekki')
      (
        'Czech Republic'
        ''
        ''
        ''
        ''
        'Tsekin tasavalta')
      (
        'Danish'
        ''
        ''
        ''
        ''
        'tanska')
      (
        'Date and time:'
        'TMainForm'
        'Label2'
        ''
        ''
        'P‰ivim‰‰r‰ ja aika:')
      (
        
          'Dcalc is a multilingual application that calculates the average ' +
          'driving time'
        ''
        ''
        ''
        ''
        
          'Dcalc on monikieleinen ohjelma, joka laskee kesim‰‰r‰isen ajoaja' +
          'n')
      (
        'Dec'
        ''
        '65481'
        ''
        ''
        'joulu')
      (
        'December'
        ''
        '65461'
        ''
        ''
        'joulukuu')
      (
        'Del'
        ''
        '65334'
        ''
        ''
        'Del')
      (
        'Denmark'
        ''
        ''
        ''
        ''
        'Tanska')
      (
        'Disk full'
        ''
        '65530'
        ''
        ''
        'Levy on t‰ynn‰')
      (
        'Division by zero'
        ''
        '65532'
        ''
        ''
        'Nollalla jako')
      (
        'Docked control must have a name'
        ''
        '65315'
        ''
        ''
        'Kiinitetyll‰ kontrollilla t‰ytyy olla nimi')
      (
        'Dominican Republic'
        ''
        ''
        ''
        ''
        'Dominikaaninen tasavalta')
      (
        'Down'
        ''
        '65332'
        ''
        ''
        'Alas')
      (
        'Driving time calculator'
        'TMainForm'
        ''
        ''
        ''
        'Ajoaikalaskin')
      (
        'Dutch'
        ''
        ''
        ''
        ''
        'hollanti')
      (
        'Ecuador'
        ''
        ''
        ''
        ''
        'Ecuador')
      (
        'Egypt'
        ''
        ''
        ''
        ''
        'Egypti')
      (
        'El Salvador'
        ''
        ''
        ''
        ''
        'El Salvador')
      (
        'Enabled languages'
        'TMainForm'
        'EnabledLanguagesMenu'
        ''
        ''
        'Mahdolliset kielet')
      (
        'End'
        ''
        '65359'
        ''
        ''
        'End')
      (
        'English'
        ''
        ''
        ''
        ''
        'englanti')
      (
        'English (United States)'
        ''
        ''
        ''
        ''
        'amerikanenglanti')
      (
        'Enhanced Metafiles'
        ''
        '65381'
        ''
        ''
        'Parannetut Metatiedostot')
      (
        'Enter'
        ''
        '65355'
        ''
        ''
        'Enter')
      (
        'Error'
        ''
        '65370'
        ''
        ''
        'Virhe')
      (
        'Error creating variant array'
        ''
        '65490'
        ''
        ''
        'Varianttitaulukon luonnissa tapahtui virhe')
      (
        'Error creating window class'
        ''
        '65419'
        ''
        ''
        'Virhe tapahtui luotaessa ikkunaluokkaa')
      (
        'Error creating window device context'
        ''
        '65418'
        ''
        ''
        'Virhe tapahtui luotaessa ikkunan laitekontekstia')
      (
        'Error reading %s%s%s: %s'
        ''
        '65436'
        ''
        ''
        'Virhe lukiessa %s%s%s: %s')
      (
        'Error removing control from dock tree'
        ''
        '65316'
        ''
        ''
        'Kontrollia ei voitu poistaa kiinnityspuusta')
      (
        'Esc'
        ''
        '65354'
        ''
        ''
        'Esc')
      (
        'Estonia'
        ''
        ''
        ''
        ''
        'Eesti')
      (
        'Estonian'
        ''
        ''
        ''
        ''
        'eesti')
      (
        'Exception %s in module %s at %p.'#10'%s%s'
        ''
        '65513'
        ''
        ''
        '%s-poikkeus %s-modulissa osoitteessa %p.'#10'%s%s')
      (
        'Exception in safecall method'
        ''
        '65496'
        ''
        ''
        'Turvakutsun suoritus ep‰onnistui')
      (
        'Exit'
        'TMainForm'
        'ExitMenu'
        ''
        ''
        'Lopeta')
      (
        'External exception %x'
        ''
        '65493'
        ''
        ''
        'Ulkoinen poikkeus %x')
      (
        'Faeroe Islands'
        ''
        ''
        ''
        ''
        'F‰r-saaret')
      (
        'Faeroese'
        ''
        ''
        ''
        ''
        'f‰‰ri')
      (
        'Failed to clear tab control'
        ''
        '65320'
        ''
        ''
        'Sarkainkontrollia ei voitu tyhj‰t‰')
      (
        'Failed to delete tab at index %d'
        ''
        '65321'
        ''
        ''
        'Sarkainta ei pystytty poistamaan indeksist‰ %d')
      (
        'Failed to get data for '#39'%s'#39
        ''
        '65313'
        ''
        ''
        'Tietoa ei voitu saada '#39'%s'#39':ta')
      (
        'Failed to get object at index %d'
        ''
        '65323'
        ''
        ''
        'Oloita eo pystytty hakemaan indeksist‰ %d')
      (
        'Failed to read ImageList data from stream'
        ''
        '65416'
        ''
        ''
        'Kuvalistan dataa ei voitu lukea virrasta')
      (
        'Failed to retrieve tab at index %d'
        ''
        '65322'
        ''
        ''
        'Sarkainta ei pystytty hakemaan indeksist‰ %d')
      (
        'Failed to set object at index %d'
        ''
        '65325'
        ''
        ''
        'Oliota ei pystytty asettamaan indeksiin %d')
      (
        'Failed to set tab "%s" at index %d'
        ''
        '65324'
        ''
        ''
        '"%s"-sarkainta ei pystytty asettamaan indeksiin %d')
      (
        'Failed to write ImageList data to stream'
        ''
        '65417'
        ''
        ''
        'Kuvalistan dataa ei voitu kirjoittaa virtaan')
      (
        'Feb'
        ''
        '65503'
        ''
        ''
        'helmi')
      (
        'February'
        ''
        '65483'
        ''
        ''
        'helmikuu')
      (
        'File'
        'TMainForm'
        'Language1'
        ''
        ''
        'Tiedosto')
      (
        'File access denied'
        ''
        '65528'
        ''
        ''
        'Tietoston k‰sittely ei ole mahdollista')
      (
        'File load error'
        ''
        '65366'
        ''
        ''
        'Tiedoston latausvirhe')
      (
        'File not found'
        ''
        '65525'
        ''
        ''
        'Tiedostoa ei lˆydy')
      (
        'Finland'
        ''
        ''
        ''
        ''
        'Suomi')
      (
        'Finnish'
        ''
        ''
        ''
        ''
        'suomi')
      (
        'Fixed column count must be less than column count'
        ''
        '65387'
        ''
        ''
        
          'Kiinteiden sarakkeiden m‰‰r‰n on oltava v‰hemm‰n kuin v‰hemm‰n k' +
          'uin sarakkeiden kokonaism‰‰r‰n')
      (
        'Fixed row count must be less than row count'
        ''
        '65388'
        ''
        ''
        
          'Kiinteiden rivien m‰‰r‰n on oltava v‰hemm‰n kuin rivien kokonais' +
          'm‰‰r‰n')
      (
        'Floating point division by zero'
        ''
        '65504'
        ''
        ''
        'Liukuluvun nollalla jako')
      (
        'Floating point overflow'
        ''
        '65505'
        ''
        ''
        'Liukuluvun ylivuoto')
      (
        'Floating point underflow'
        ''
        '65506'
        ''
        ''
        'Liukuluvun alivuoto')
      (
        'Format '#39'%s'#39' invalid or incompatible with argument'
        ''
        '65515'
        ''
        ''
        #39'%s'#39'-muoto on v‰‰r‰ tai sopimaton argumentiksi')
      (
        'France'
        ''
        ''
        ''
        ''
        'Ranska')
      (
        'French'
        ''
        ''
        ''
        ''
        'ranska')
      (
        'Fri'
        ''
        '65467'
        ''
        ''
        'pe')
      (
        'Friday'
        ''
        '65442'
        ''
        ''
        'perjantai')
      (
        'German'
        ''
        ''
        ''
        ''
        'saksa')
      (
        'Germany'
        ''
        ''
        ''
        ''
        'Saksa')
      (
        'Give the driving distance in kilometres'
        ''
        ''
        ''
        ''
        'Anna ajomatka kilometreiss‰')
      (
        'Give the driving distance in miles'
        ''
        ''
        ''
        ''
        'Anna ajomatka maileissa')
      (
        'Greece'
        ''
        ''
        ''
        ''
        'Kreikka')
      (
        'Greek'
        ''
        ''
        ''
        ''
        'kreikka')
      (
        'Grid index out of range'
        ''
        '65386'
        ''
        ''
        'Taulukon indeksi on rajojen ulkopuolella')
      (
        'Grid too large for operation'
        ''
        '65384'
        ''
        ''
        'Taulukko on liian suuri operaatiolle')
      (
        'GroupIndex cannot be less than a previous menu item'#39's GroupIndex'
        ''
        '65398'
        ''
        ''
        
          'GroupIndex ei voi olla v‰hemm‰n kuin edellisen valikon GroupInde' +
          'x')
      (
        'Guatemala'
        ''
        ''
        ''
        ''
        'Guatemala')
      (
        'Hebrew'
        ''
        ''
        ''
        ''
        'hebrea')
      (
        'Help'
        'TMainForm'
        'Help1'
        ''
        ''
        'Ohje')
      (
        'Home'
        ''
        '65328'
        ''
        ''
        'Home')
      (
        'Honduras'
        ''
        ''
        ''
        ''
        'Honduras')
      (
        'Hong Kong'
        ''
        ''
        ''
        ''
        'Kong Kong')
      (
        'Hungarian'
        ''
        ''
        ''
        ''
        'unkari')
      (
        'Hungary'
        ''
        ''
        ''
        ''
        'Unkari')
      (
        'I/O error %d'
        ''
        '65524'
        ''
        ''
        'I/O-virhe %d')
      (
        'Iceland'
        ''
        ''
        ''
        ''
        'Islanti')
      (
        'Icelandic'
        ''
        ''
        ''
        ''
        'islanti')
      (
        'Icon image is not valid'
        ''
        '65439'
        ''
        ''
        'Ikonikuva ei ole oikea')
      (
        'Icons'
        ''
        '65382'
        ''
        ''
        'Ikonit')
      (
        
          'If checked the Euro monatary symbol is used if the locale is a m' +
          'ember of EMU'
        'TMainForm'
        'UseEuroMenu'
        ''
        ''
        
          'Jos valittu, niin Euro symbolia k‰ytet‰‰n rahamerkkin‰, mik‰li p' +
          'aikanne kuuluu Emuun.')
      (
        'If checked the select dialogs use the native names'
        'TMainForm'
        'ShowNativeMenu'
        ''
        ''
        'Jos valittu, niin kielet listataan alkuper‰iskielill‰')
      (
        'If not checked only the enabled languages and locales are shown'
        'TMainForm'
        'ShowAllMenu'
        ''
        ''
        'Jo ei ole valittu, niin ainoastaan mahdolliset kielet n‰ytet‰‰n')
      (
        'in kilometres'
        ''
        ''
        ''
        'in kilometres'
        'kilometreiss‰')
      (
        'in miles'
        ''
        ''
        ''
        ''
        'maileissa')
      (
        'Indonesia'
        ''
        ''
        ''
        ''
        'Indonesia')
      (
        'Indonesian'
        ''
        ''
        ''
        ''
        'indonesia')
      (
        'Information'
        ''
        '65371'
        ''
        ''
        'Tiedotus')
      (
        'Ins'
        ''
        '65333'
        ''
        ''
        'Ins')
      (
        'Integer overflow'
        ''
        '65534'
        ''
        ''
        'Kokonaisluvun ylivuoto')
      (
        'Interface not supported'
        ''
        '65495'
        ''
        ''
        'Rajapintaa ei tueta')
      (
        'Invalid argument to date encode'
        ''
        '65522'
        ''
        ''
        'V‰‰r‰t arvot p‰iv‰m‰‰r‰n koodauksessa')
      (
        'Invalid argument to time encode'
        ''
        '65521'
        ''
        ''
        'V‰‰r‰t arvot ajan koodauksessa')
      (
        'Invalid class typecast'
        ''
        '65508'
        ''
        ''
        'V‰‰r‰ luokan tyyppimuunnos')
      (
        'Invalid clipboard format'
        ''
        '65339'
        ''
        ''
        'V‰‰r‰ leikekirjaformaatti')
      (
        'Invalid data type for '#39'%s'#39
        ''
        '65312'
        ''
        ''
        'V‰‰r‰ tietotyyppi '#39'%s'#39':lle')
      (
        'Invalid filename'
        ''
        '65526'
        ''
        ''
        'V‰‰r‰ tiedostonimi')
      (
        'Invalid floating point operation'
        ''
        '65535'
        ''
        ''
        'V‰‰r‰ luikulukuoperaatio')
      (
        'Invalid image size'
        ''
        '65413'
        ''
        ''
        'V‰‰r‰ kuvan koko')
      (
        'Invalid ImageList'
        ''
        '65414'
        ''
        ''
        'V‰‰r‰ kuvalistan')
      (
        'Invalid ImageList Index'
        ''
        '65415'
        ''
        ''
        'V‰‰r‰ kuvalistan indeksi')
      (
        'Invalid index'
        ''
        '65327'
        ''
        ''
        'V‰‰r‰ indeksi')
      (
        'Invalid input value'
        ''
        '65362'
        ''
        ''
        'V‰‰r‰ syˆtt‰arvo')
      (
        'Invalid input value.  Use escape key to abandon changes'
        ''
        '65363'
        ''
        ''
        'V‰‰r‰ syˆttˆarvo. K‰yt‰ Esc-n‰pp‰int‰ peruaksesi muutokset')
      (
        'Invalid numeric input'
        ''
        '65531'
        ''
        ''
        'V‰‰r‰ numeerinen syˆttˆ')
      (
        'Invalid outline index'
        ''
        '65364'
        ''
        ''
        'V‰‰r‰ outline-indeksi')
      (
        'Invalid owner'
        ''
        '65297'
        ''
        ''
        'V‰‰r‰ omistaja')
      (
        'Invalid pointer operation'
        ''
        '65507'
        ''
        ''
        'V‰‰r‰ osoitinoperaatio')
      (
        'Invalid property path'
        ''
        '65433'
        ''
        ''
        'V‰‰r‰ ominaisuuden polku')
      (
        'Invalid property value'
        ''
        '65390'
        ''
        ''
        'V‰‰r‰ ominaisuuden arvo')
      (
        'Invalid property value'
        ''
        '65432'
        ''
        ''
        'V‰‰r‰ ominaisuuden arvo')
      (
        'Invalid selection'
        ''
        '65365'
        ''
        ''
        'V‰‰r‰ valinta')
      (
        'Invalid stream format'
        ''
        '65452'
        ''
        ''
        'V‰‰r‰ virtamuoto')
      (
        'Invalid value for current item'
        ''
        '65361'
        ''
        ''
        'Nykyisell‰ j‰senell‰ on v‰‰r‰ arvo')
      (
        'Invalid variant operation'
        ''
        '65518'
        ''
        ''
        'V‰‰r‰ variantin toiminto')
      (
        'Invalid variant type conversion'
        ''
        '65517'
        ''
        ''
        'V‰‰r‰ variantin tyyppimuunnos')
      (
        'Iraq'
        ''
        ''
        ''
        ''
        'Irak')
      (
        'Ireland'
        ''
        ''
        ''
        ''
        'Irlanti')
      (
        'Israel'
        ''
        ''
        ''
        ''
        'Israel')
      (
        'Italian'
        ''
        ''
        ''
        ''
        'italia')
      (
        'Italy'
        ''
        ''
        ''
        ''
        'Italia')
      (
        'Jamaica'
        ''
        ''
        ''
        ''
        'Jamaika')
      (
        'Jan'
        ''
        '65502'
        ''
        ''
        'tammi')
      (
        'January'
        ''
        '65482'
        ''
        ''
        'tammikuu')
      (
        'Japan'
        ''
        ''
        ''
        ''
        'Japani')
      (
        'Japanese'
        ''
        ''
        ''
        ''
        'japani')
      (
        'Jordan'
        ''
        ''
        ''
        ''
        'Jordania')
      (
        'Jul'
        ''
        '65476'
        ''
        ''
        'hein‰')
      (
        'July'
        ''
        '65456'
        ''
        ''
        'hein‰kuu')
      (
        'Jun'
        ''
        '65475'
        ''
        ''
        'kes‰')
      (
        'June'
        ''
        '65487'
        ''
        ''
        'kes‰kuu')
      (
        'Korea'
        ''
        ''
        ''
        ''
        'Korea')
      (
        'Korean'
        ''
        ''
        ''
        ''
        'korea')
      (
        'Kuwait'
        ''
        ''
        ''
        ''
        'Kuwait')
      (
        'Language to locale'
        'TMainForm'
        'LanguageToLocaleMenu'
        ''
        ''
        'Kieli paikanteeseen')
      (
        'Language...'
        'TMainForm'
        'LanguageMenu'
        ''
        ''
        'Kieli...')
      (
        'Latvia'
        ''
        ''
        ''
        ''
        'Latvia')
      (
        'Latvian'
        ''
        ''
        ''
        ''
        'latvia')
      (
        'Lebanon'
        ''
        ''
        ''
        ''
        'Libanon')
      (
        'Left'
        ''
        '65329'
        ''
        ''
        'Vasen')
      (
        'Let you change the options'
        'TMainForm'
        'Options1'
        ''
        ''
        'Asetusten muokkaus')
      (
        'Let you select the language and locale'
        'TMainForm'
        'Language1'
        ''
        ''
        'Voit valita kielen ja maakielen')
      (
        'Libya'
        ''
        ''
        ''
        ''
        'Libya')
      (
        'Liechtenstein'
        ''
        ''
        ''
        ''
        'Liechtenstein')
      (
        'Line too long'
        ''
        '65367'
        ''
        ''
        'Rivi on liian pitk‰')
      (
        'List capacity out of bounds (%d)'
        ''
        '65455'
        ''
        ''
        'Listan kapasiteetti on rajojen ulkopuolella (%d)')
      (
        'List count out of bounds (%d)'
        ''
        '65424'
        ''
        ''
        'Listan koko on rajojen ulkopuolella (%d)')
      (
        'List does not allow duplicates ($0%x)'
        ''
        '65319'
        ''
        ''
        'Listassa ei voi olla kahdennettuja ($0%x)')
      (
        'List index out of bounds (%d)'
        ''
        '65454'
        ''
        ''
        'Listan indeksi on rajojen ulkopuolella (%d)')
      (
        'Lithuania'
        ''
        ''
        ''
        ''
        'Liettua')
      (
        'Lithuanian'
        ''
        ''
        ''
        ''
        'liettua')
      (
        'Locale to language'
        'TMainForm'
        'LocaleToLanguageMenu'
        ''
        ''
        'Paikanne kieleen')
      (
        'Locale...'
        'TMainForm'
        'LocaleMenu'
        ''
        ''
        'Paikanne...')
      (
        'Luxembourg'
        ''
        ''
        ''
        ''
        'Luxemburg')
      (
        'Ma&ximize'
        ''
        ''
        ''
        ''
        '&Suurenna')
      (
        'Mar'
        ''
        '65472'
        ''
        ''
        'maalis')
      (
        'March'
        ''
        '65484'
        ''
        ''
        'maaliskuu')
      (
        'Maximum outline depth exceeded'
        ''
        '65368'
        ''
        ''
        'Suuri outline-syvyys ylitetty')
      (
        'May'
        ''
        '65474'
        ''
        ''
        'touko')
      (
        'May'
        ''
        '65486'
        ''
        ''
        'touko')
      (
        'Menu '#39'%s'#39' is already being used by another form'
        ''
        '65314'
        ''
        ''
        #39'%s'#39'-valikkoa k‰ytt‰‰ jo toinen lomake')
      (
        'Menu index out of range'
        ''
        '65394'
        ''
        ''
        'Valikon indeksi on rajojen ulkopuolella')
      (
        'Menu inserted twice'
        ''
        '65395'
        ''
        ''
        'Valikko on lis‰tty kahdesti')
      (
        'Metafile is not valid'
        ''
        '65408'
        ''
        ''
        'Metafile ei ole oikea')
      (
        'Metafiles'
        ''
        '65380'
        ''
        ''
        'Metatiedostot')
      (
        'Mexico'
        ''
        ''
        ''
        ''
        'Meksiko')
      (
        'Mi&nimize'
        ''
        ''
        ''
        ''
        '&Pienenn‰')
      (
        'Mon'
        ''
        '65463'
        ''
        ''
        'ma')
      (
        'Monday'
        ''
        '65470'
        ''
        ''
        'maanantai')
      (
        'Morocco'
        ''
        ''
        ''
        ''
        'Marokko')
      (
        'MultiLine must be True when TabPosition is tpLeft or tpRight'
        ''
        '65326'
        ''
        ''
        
          'MultiLine:n on oltava tosi, kun TabPosition on tpLeft tai tpRigh' +
          't')
      (
        'N&o to All'
        ''
        '65350'
        ''
        ''
        '&Ei kaikkiin')
      (
        'N/A'
        ''
        ''
        ''
        ''
        'ei k‰ytˆss‰')
      (
        'Netherlands'
        ''
        ''
        ''
        ''
        'Alankomaat')
      (
        'New Zealand'
        ''
        ''
        ''
        ''
        'Uusi-Seelanti')
      (
        'Nicaragua'
        ''
        ''
        ''
        ''
        'Nicaragua')
      (
        'No argument for format '#39'%s'#39
        ''
        '65516'
        ''
        ''
        #39'%s'#39'-muodossa ei ole argumenttia')
      (
        'No binding is used'
        'TMainForm'
        'NoneMenu'
        ''
        ''
        'Sidosta ei ole')
      (
        'None'
        'TMainForm'
        'NoneMenu'
        ''
        ''
        'Ei k‰ytˆss‰')
      (
        'Norway'
        ''
        ''
        ''
        ''
        'Norja')
      (
        'Norwegian'
        ''
        ''
        ''
        ''
        'norja')
      (
        'Not enough timers available'
        ''
        '65397'
        ''
        ''
        'Ajanottajia ei ole tarpeeksi')
      (
        'Nov'
        ''
        '65480'
        ''
        ''
        'marras')
      (
        'November'
        ''
        '65460'
        ''
        ''
        'marraskuu')
      (
        'Nynorsk'
        ''
        ''
        ''
        ''
        'nynorsk')
      (
        'Oct'
        ''
        '65479'
        ''
        ''
        'loka')
      (
        'October'
        ''
        '65459'
        ''
        ''
        'lokakuu')
      (
        'OK'
        ''
        ''
        ''
        ''
        'OK')
      (
        'OK'
        ''
        '65375'
        ''
        ''
        'OK')
      (
        'OK'
        ''
        '65401'
        ''
        ''
        'OK')
      (
        'Oman'
        ''
        ''
        ''
        ''
        'Oman')
      (
        
          'Only languages that are supported by the current code page are e' +
          'nabled'
        'TMainForm'
        'CodePageMenu'
        ''
        ''
        'Vain koodisivun kanssa yhteensopivat kielet n‰ytet‰‰n')
      (
        'Only languages that are supported by the system are enabled'
        'TMainForm'
        'SystemMenu'
        ''
        ''
        'Vain k‰ytt‰j‰rjestelm‰n kanssa yhteensopivat kielet n‰ytet‰‰n')
      (
        'Operation not allowed on sorted string list'
        ''
        '65425'
        ''
        ''
        'Operaatiota ei voi suorittaa lajitellulle listalle')
      (
        'Options'
        'TMainForm'
        'Options1'
        ''
        ''
        'Asetukset')
      (
        'Out of memory'
        ''
        '65523'
        ''
        ''
        'Muisti loppui')
      (
        'Out of memory while expanding memory stream'
        ''
        '65449'
        ''
        ''
        'Muisti loppui k‰sitelt‰ess‰ tiedostovirtaa')
      (
        'Out of system resources'
        ''
        '65411'
        ''
        ''
        'J‰rjestelm‰resurssit ovat loppu')
      (
        'Outline index not found'
        ''
        '65391'
        ''
        ''
        'Outline:n indeksi‰ ei lˆytynyt')
      (
        'Panama'
        ''
        ''
        ''
        ''
        'Panama')
      (
        'Paraguay'
        ''
        ''
        ''
        ''
        'Paraguay')
      (
        'Parent must be expanded'
        ''
        '65360'
        ''
        ''
        'Is‰nt‰ t‰ytyy olla laajennettu')
      (
        'People'#39's Republic of China'
        ''
        ''
        ''
        ''
        'Kiinan kansantasavalta')
      (
        'Peru'
        ''
        ''
        ''
        ''
        'Peru')
      (
        'PgDn'
        ''
        '65358'
        ''
        ''
        'PgDn')
      (
        'PgUp'
        ''
        '65357'
        ''
        ''
        'PgUp')
      (
        'Poland'
        ''
        ''
        ''
        ''
        'Puola')
      (
        'Polish'
        ''
        ''
        ''
        ''
        'puola')
      (
        'Portugal'
        ''
        ''
        ''
        ''
        'Portugali')
      (
        'Portuguese'
        ''
        ''
        ''
        ''
        'portugali')
      (
        'PR China'
        ''
        ''
        ''
        ''
        'Kiinan kansantasavalta')
      (
        'Privileged instruction'
        ''
        '65512'
        ''
        ''
        'Suojattu k‰sky')
      (
        'Property does not exist'
        ''
        '65434'
        ''
        ''
        'Ominaisuutta ei ole olemassa')
      (
        'Property is read-only'
        ''
        '65435'
        ''
        ''
        'Ominaisuus on vain luettava')
      (
        'Provides help'
        'TMainForm'
        'Help1'
        ''
        ''
        'Tarjoaa opastusta')
      (
        'Puerto Rico'
        ''
        ''
        ''
        ''
        'Puerto Rico')
      (
        'Qatar'
        ''
        ''
        ''
        ''
        'Katar')
      (
        'Quits the application'
        'TMainForm'
        'ExitMenu'
        ''
        ''
        'Lopetta ohjelman')
      (
        'Range check error'
        ''
        '65533'
        ''
        ''
        'Rajatarkistusvirhe')
      (
        'Read'
        ''
        '65488'
        ''
        ''
        'Lue')
      (
        'Read beyond end of file'
        ''
        '65529'
        ''
        ''
        'Tieton lopun j‰lkeen yritettiin lukea')
      (
        'Republic of the Philippines'
        ''
        ''
        ''
        ''
        'Filippiinit')
      (
        'Resource %s not found'
        ''
        '65453'
        ''
        ''
        '%s-resurssia ei lˆytynyt')
      (
        'Right'
        ''
        '65331'
        ''
        ''
        'Oikea')
      (
        'Romania'
        ''
        ''
        ''
        ''
        'Romania')
      (
        'Romanian'
        ''
        ''
        ''
        ''
        'romania')
      (
        'Russia'
        ''
        ''
        ''
        ''
        'Ven‰j‰')
      (
        'Russian'
        ''
        ''
        ''
        ''
        'ven‰j‰')
      (
        'Sat'
        ''
        '65468'
        ''
        ''
        'la')
      (
        'Saturday'
        ''
        '65443'
        ''
        ''
        'lauantai')
      (
        'Saudi Arabia'
        ''
        ''
        ''
        ''
        'Saudi-Arabia')
      (
        'Select Language'
        ''
        ''
        ''
        ''
        'Valitse kieli')
      (
        'Select Locale'
        ''
        ''
        ''
        ''
        'Valitse paikanne')
      (
        'Select Sublanguage'
        ''
        ''
        ''
        ''
        'Valitse alikieli')
      (
        'Select the active language'
        'TMainForm'
        'LanguageMenu'
        ''
        ''
        'Valitse aktiivinen kieli')
      (
        'Select the active language and locale'
        'TMainForm'
        'SublanguageMenu'
        ''
        ''
        'Valitse aktiivinen kieli ja paikanne')
      (
        'Select the active locale'
        'TMainForm'
        'LocaleMenu'
        ''
        ''
        'Valitse aktiivinen paikanne')
      (
        'Sep'
        ''
        '65478'
        ''
        ''
        'syys')
      (
        'September'
        ''
        '65458'
        ''
        ''
        'syyskuu')
      (
        'Serbia'
        ''
        ''
        ''
        ''
        'Serbia')
      (
        'Serbian'
        ''
        ''
        ''
        ''
        'serbia')
      (
        'Serbian-Latin'
        ''
        ''
        ''
        ''
        'serbia latinalaisilla')
      (
        'Set a binding between the language and the locale'
        'TMainForm'
        'BindMenu'
        ''
        ''
        'Asettaa sidoksen kielen ja paikanteen v‰lille')
      (
        'Shift+'
        ''
        '65335'
        ''
        ''
        'Vaihto+')
      (
        'Show all languages'
        'TMainForm'
        'ShowAllMenu'
        ''
        ''
        'N‰yt‰ kaikki kielet')
      (
        'Show native names'
        'TMainForm'
        'ShowNativeMenu'
        ''
        ''
        'N‰yt‰ nimet alkuper‰iskielell‰')
      (
        'Shows information about DCALC'
        'TMainForm'
        'AboutMenu'
        ''
        ''
        'N‰ytt‰‰ tietoa DCALC-ohjelmasta')
      (
        'Shows what languages are enabled'
        'TMainForm'
        'EnabledLanguagesMenu'
        ''
        ''
        'N‰ytt‰‰ mitk‰ kielet ovat mahdollisia')
      (
        'Simplified'
        ''
        ''
        ''
        ''
        'yksinkertaistettu')
      (
        'Singapore'
        ''
        ''
        ''
        ''
        'Singapore')
      (
        'Slovak'
        ''
        ''
        ''
        ''
        'slovakki')
      (
        'Slovakia'
        ''
        ''
        ''
        ''
        'Slovakia')
      (
        'Slovene'
        ''
        ''
        ''
        ''
        'sloveeni')
      (
        'Slovenia'
        ''
        ''
        ''
        ''
        'Slovenia')
      (
        'South Africa'
        ''
        ''
        ''
        ''
        'Etel‰-Afrikka')
      (
        'Space'
        ''
        '65356'
        ''
        ''
        'Space')
      (
        'Spain'
        ''
        ''
        ''
        ''
        'Espania')
      (
        'Spanish'
        ''
        ''
        ''
        ''
        'espania')
      (
        'Speeding fine:'
        'TMainForm'
        'Label3'
        ''
        ''
        'Ylinopeussakko:')
      (
        'Stack overflow'
        ''
        '65510'
        ''
        ''
        'Pinon ylivuoto')
      (
        'Stream read error'
        ''
        '65447'
        ''
        ''
        'Tiedostovirran lukuvirhe')
      (
        'Stream write error'
        ''
        '65448'
        ''
        ''
        'Tiedostovirran kirjoitusvirhe')
      (
        'String list does not allow duplicates'
        ''
        '65426'
        ''
        ''
        'Merkkijonolistassa ei voi olla samaa j‰sent‰ kahdesti')
      (
        'Sublanguage...'
        'TMainForm'
        'SublanguageMenu'
        ''
        ''
        'Alikieli...')
      (
        'Sub-menu is not in menu'
        ''
        '65396'
        ''
        ''
        'Alivalikko ei ole valikossa')
      (
        'Sun'
        ''
        '65462'
        ''
        ''
        'su')
      (
        'Sunday'
        ''
        '65469'
        ''
        ''
        'sunnuntai')
      (
        'Supported by the code page'
        'TMainForm'
        'CodePageMenu'
        ''
        ''
        'Yhteensopivat koodisivun kanssa')
      (
        'Supported by the system'
        'TMainForm'
        'SystemMenu'
        ''
        ''
        'Yhteensopivat k‰yttˆj‰rjestelm‰n kanssa')
      (
        'Sweden'
        ''
        ''
        ''
        ''
        'Ruotsi')
      (
        'Swedish'
        ''
        ''
        ''
        ''
        'ruotsi')
      (
        'Switzerland'
        ''
        ''
        ''
        ''
        'Sveitsi')
      (
        'Syria'
        ''
        ''
        ''
        ''
        'Syyria')
      (
        'Tab'
        ''
        '65353'
        ''
        ''
        'Sarkain')
      (
        'Tab position incompatible with current tab style'
        ''
        '65427'
        ''
        ''
        
          'Sarkaimen paikka ei ole yhteensopiva nykyisen sarkaintyylin kans' +
          'sa')
      (
        'Tab style incompatible with current tab position'
        ''
        '65428'
        ''
        ''
        
          'Sarkaintyyli ei ole yhteensopiva nykyisen sarkaimen paikan kanss' +
          'a')
      (
        'Taiwan'
        ''
        ''
        ''
        ''
        'Taiwan')
      (
        'Text exceeds memo capacity'
        ''
        '65342'
        ''
        ''
        'Teksti ylitt‰‰ muistion kapasiteetin')
      (
        'Thai'
        ''
        ''
        ''
        ''
        'thai')
      (
        'Thailand'
        ''
        ''
        ''
        ''
        'Thaimaa')
      (
        'The average driving time is %0:d hours and %1:d minutes.'
        ''
        ''
        ''
        ''
        'Keskim‰‰r‰inen ajoaika on %0:d tuntia ja %1:d minuuttia.')
      (
        'The current date and time in the local format'
        'TMainForm'
        'CurrentTime'
        ''
        ''
        'P‰iv‰m‰‰r‰ ja aika paikallisesti muotoiltuna')
      (
        'The current language of the user interface'
        'TMainForm'
        'CurrentLanguage'
        ''
        ''
        'K‰yttˆliittym‰n t‰m‰nhetkinen kieli')
      (
        'The distance unit used by the current locale'
        'TMainForm'
        'UnitLabel'
        ''
        ''
        'Pituusyksikkˆ, jota paikanne k‰ytt‰‰')
      (
        'The language has been bound to locale'
        'TMainForm'
        'LanguageToLocaleMenu'
        ''
        ''
        'Kieli on sidottu paikanteeseen')
      (
        'The locale (i.e. language + country) that is used'
        'TMainForm'
        'CurrentLocale'
        ''
        ''
        'Voimassaoleva paikanne (kieli, maa ja muotoilut)')
      (
        'The locale has been bound to language'
        'TMainForm'
        'LocaleToLanguageMenu'
        ''
        ''
        'Paikanne on sidottu kieleen')
      (
        'The speeding fine in the local currency'
        'TMainForm'
        'SpeedingFine'
        ''
        ''
        'Ylinopeussakko paikallisessa valuutassa')
      (
        'Thu'
        ''
        '65466'
        ''
        ''
        'to')
      (
        'Thursday'
        ''
        '65441'
        ''
        ''
        'torstai')
      (
        'Too many open files'
        ''
        '65527'
        ''
        ''
        'Liian monta avoinna olevaa tiedostoa')
      (
        'Too many rows or columns deleted'
        ''
        '65385'
        ''
        ''
        'Liian monta rivi tai saraketta poistettu')
      (
        'Traditional'
        ''
        ''
        ''
        ''
        'perinteinen')
      (
        'Trinidad y Tobago'
        ''
        ''
        ''
        ''
        'Trinidad ja Tobago')
      (
        'Tue'
        ''
        '65464'
        ''
        ''
        'ti')
      (
        'Tuesday'
        ''
        '65471'
        ''
        ''
        'tiistai')
      (
        'Tunisia'
        ''
        ''
        ''
        ''
        'Tunisia')
      (
        'Turkey'
        ''
        ''
        ''
        ''
        'Turkki')
      (
        'Turkish'
        ''
        ''
        ''
        ''
        'turkki')
      (
        'U.A.E.'
        ''
        ''
        ''
        ''
        'Yhdistyneet arabiemiirikunnat')
      (
        'Ukraine'
        ''
        ''
        ''
        ''
        'Ukraina')
      (
        'Ukrainian'
        ''
        ''
        ''
        ''
        'ukraina')
      (
        'Unable to insert a line'
        ''
        '65338'
        ''
        ''
        'Rivi‰ ei voitu lis‰t‰')
      (
        'Unable to insert an item'
        ''
        '65296'
        ''
        ''
        'J‰sent‰ ei voitu lis‰t‰')
      (
        'United Kingdom'
        ''
        ''
        ''
        ''
        'Iso-Britannia')
      (
        'United States'
        ''
        ''
        ''
        ''
        'Yhdysvallat')
      (
        'Unsupported clipboard format'
        ''
        '65410'
        ''
        ''
        'Leikekirjaformaattia ei tueta')
      (
        'Up'
        ''
        '65330'
        ''
        ''
        'Ylˆs')
      (
        'Uruguay'
        ''
        ''
        ''
        ''
        'Uruguay')
      (
        'Use Euro'
        'TMainForm'
        'UseEuroMenu'
        ''
        ''
        'K‰yt‰ Euroa')
      (
        'User interface language:'
        'TMainForm'
        'Label1'
        ''
        ''
        'K‰yttˆliittym‰n kieli:')
      (
        'Variant array index out of bounds'
        ''
        '65492'
        ''
        ''
        'Varianttitaulukon indeksi on rajojen ulkopuolella')
      (
        'Variant is not an array'
        ''
        '65491'
        ''
        ''
        'Variantti ei ole taulukko')
      (
        'Variant method calls not supported'
        ''
        '65519'
        ''
        ''
        'Variantin metodin kutsua ei ole tuettu')
      (
        'Warning'
        ''
        '65369'
        ''
        ''
        'Varoitus')
      (
        'Wed'
        ''
        '65465'
        ''
        ''
        'ke')
      (
        'Wednesday'
        ''
        '65440'
        ''
        ''
        'keskiviikko')
      (
        'Venezuela'
        ''
        ''
        ''
        ''
        'Venezuela')
      (
        'Viet Nam'
        ''
        ''
        ''
        ''
        'Vietnam')
      (
        'Vietnamese'
        ''
        ''
        ''
        ''
        'vietnami')
      (
        'Win32 Error.  Code: %d.'#10'%s'
        ''
        '65500'
        ''
        ''
        'Win32-virhe.  Koodi: %d.'#10'%s')
      (
        'Write'
        ''
        '65489'
        ''
        ''
        'Kirjoita')
      (
        'Yemen'
        ''
        ''
        ''
        ''
        'Jemen')
      (
        'Yes to &All'
        ''
        '65351'
        ''
        ''
        '&Kyll‰ kaikkiin')
      (
        'Zimbabwe'
        ''
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
