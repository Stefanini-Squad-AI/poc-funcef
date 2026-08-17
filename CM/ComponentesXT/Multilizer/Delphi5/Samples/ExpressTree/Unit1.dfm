object Form1: TForm1
  Left = 222
  Top = 122
  Width = 367
  Height = 197
  Caption = 'Express Tree Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object LanguageButton: TButton
    Left = 264
    Top = 8
    Width = 89
    Height = 25
    Caption = '&Language...'
    TabOrder = 0
    OnClick = LanguageButtonClick
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 249
    Height = 153
    ActivePage = DBSheet
    TabOrder = 1
    object Sheet: TTabSheet
      Caption = 'TdxTreeView'
      object dxTreeView1: TdxTreeView
        Left = 8
        Top = 8
        Width = 225
        Height = 113
        ShowNodeHint = True
        Indent = 19
        Items.Data = {
          030000001C0000000000000000000000FFFFFFFFFFFFFFFF0000000002000000
          034F6E651C0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
          034F6E651C0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
          0354776F1C0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
          0354776F1E0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
          055468726565}
        ParentColor = False
        SelectedIndex = -1
        TabOrder = 0
      end
    end
    object DBSheet: TTabSheet
      Caption = 'TdxDBTreeView'
      ImageIndex = 1
      object dxDBTreeView1: TdxDBTreeView
        Left = 8
        Top = 8
        Width = 225
        Height = 113
        ShowNodeHint = True
        DataSource = DataSource1
        DisplayField = 'EnglishName'
        KeyField = 'Id'
        ListField = 'EnglishName'
        ParentField = 'Parent'
        SeparatedSt = ' - '
        RaiseOnError = True
        Indent = 19
        ParentColor = False
        Options = [trDBCanDelete, trDBConfirmDelete, trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
        SelectedIndex = -1
        TabOrder = 0
      end
    end
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    Left = 296
    Top = 40
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
        'Filter'
        0))
  end
  object IvExpressTreeModule1: TIvExpressTreeModule
    Left = 328
    Top = 40
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 296
    Top = 72
  end
  object Table1: TTable
    Active = True
    TableName = 'data.db'
    Left = 264
    Top = 72
  end
  object IvBinaryDictionary1: TIvBinaryDictionary
    DictionaryName = 'Dictionary1'
    OnLanguageChange = IvBinaryDictionary1LanguageChange
    FileName = 'Project1.mld'
    Storage = ivsEmbedded
    Left = 264
    Top = 40
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
      355
      (
        ' - Dock zone has no control'
        ''
        '65314'
        ''
        ' - kiinnitysalueella ei ole yht‰‰n kontrollia')
      (
        ' - Dock zone not found'
        ''
        '65313'
        ''
        ' - kiinnitysaluetta ei lˆytynyt')
      (
        
          '%d is an invalid PageIndex value.  PageIndex must be between 0 a' +
          'nd %d'
        ''
        '65326'
        ''
        
          '%d on v‰‰r‰ PageIndex:n arvo. PageIndex pit‰‰ olla 0:n ja %d:n v' +
          '‰lill‰')
      (
        
          '%g is not a valid value for field '#39'%s'#39'. The allowed range is %g ' +
          'to %g'
        ''
        '65303'
        ''
        
          '%g ei ole oikea arvo '#39'%s'#39'-kent‰lle. Mahdolliset arvot ovat %g:st' +
          '‰ %g:‰‰n')
      (
        '%s (%s, line %d)'
        ''
        '65502'
        ''
        '%s (%s, rivi %d)')
      (
        #39'%s'#39' is not a valid boolean value for field '#39'%s'#39
        ''
        '65305'
        ''
        #39'%s'#39' ei ole oikea totuusarvo '#39'%s'#39'-kent‰lle')
      (
        #39#39'%s'#39#39' is not a valid component name'
        ''
        '65436'
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
        '65306'
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
        '65304'
        ''
        #39'%s'#39' ei ole oikea kokonaislukuarvo '#39'%s'#39'-kent‰lle')
      (
        #39'%s'#39' is not a valid time'
        ''
        '65523'
        ''
        #39'%s'#39' ei ole aika')
      (
        '%s property out of range'
        ''
        '65399'
        ''
        '%s-ominaisuus on rajojen ulkopuolella')
      (
        '&Abort'
        ''
        '65374'
        ''
        '&Keskeyt‰')
      (
        '&All'
        ''
        '65345'
        ''
        '&Kaikki')
      (
        '&Close'
        ''
        ''
        ''
        '&Sulje')
      (
        '&Help'
        ''
        '65373'
        ''
        '&Ohje')
      (
        '&Ignore'
        ''
        '65344'
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
        '&Siirr‰')
      (
        '&Next'
        ''
        ''
        ''
        '&Seuraava')
      (
        '&No'
        ''
        '65370'
        ''
        '&Ei')
      (
        '&Restore'
        ''
        ''
        ''
        '&Palauta')
      (
        '&Retry'
        ''
        '65375'
        ''
        '&Uudestaan')
      (
        '&Size'
        ''
        ''
        ''
        '&Koko')
      (
        '&Yes'
        ''
        '65369'
        ''
        '&Kyll‰')
      (
        #39'('#39' expected but %s found'
        ''
        '65270'
        ''
        #39'('#39':‰ odotettiin, mutta %s saatiin')
      (
        '(Overflow)'
        ''
        '65311'
        ''
        '(ylivuoto)')
      (
        #39')'#39' expected but %s found'
        ''
        '65271'
        ''
        #39')'#39':‰ odotettiin, mutta %s saatiin')
      (
        #39')'#39' or '#39','#39' expected but %s found'
        ''
        '65272'
        ''
        #39')'#39':‰ tai '#39','#39':‰ odotettiin, mutta %s saatiin')
      (
        'A class named %s already exists'
        ''
        '65437'
        ''
        '%s-niminen luokka on jo olemassa')
      (
        'A component named %s already exists'
        ''
        '65435'
        ''
        'Kaksi samaa nime‰ ('#39'%s'#39') %s:ssa')
      (
        'A control cannot have itself as its parent'
        ''
        '65406'
        ''
        'Kontrollin is‰nt‰ ei voi olla kontrolli itse')
      (
        'A Win32 API function failed'
        ''
        '65474'
        ''
        'Win32API-functio ep‰onnistui')
      (
        'Abstract Error'
        ''
        '65503'
        ''
        'Abstrakti virhe')
      (
        'Access violation at address %p in module '#39'%s'#39'. %s of address %p'
        ''
        '65472'
        ''
        'K‰sittelyvirhe osoitteessa %p, '#39'%s'#39'-modulissa. %s:n osoite %p')
      (
        'Access violation at address %p. %s of address %p'
        ''
        '65512'
        ''
        'K‰sittelyvirhe %p-osoittessa. %s osoite %p')
      (
        'Aggregate expressions not allowed in filters'
        ''
        '65252'
        ''
        'Yhdistetyt lausekkeet eiv‰t ole mahdollisia suotimissa')
      (
        'Alt+'
        ''
        '65333'
        ''
        '')
      (
        
          'An error occurred while attempting to initialize the Borland Dat' +
          'abase Engine (error $%.4x)'
        ''
        '65220'
        ''
        
          'Virhe tapautui kun Borlandin tietokantamoottoria yritettiin alus' +
          'taa (virhe $%.4x)')
      (
        'Ancestor for '#39'%s'#39' not found'
        ''
        '65411'
        ''
        #39'%s'#39':n ‰iti‰ ei lˆydy')
      (
        'Application Error'
        ''
        '65518'
        ''
        'Sovellusvirhe')
      (
        'Application is not licensed to use this feature'
        ''
        '65475'
        ''
        'Sovellusta ei ole lisennˆity k‰ytt‰m‰‰n t‰t‰ ominaisuutta')
      (
        'Apr'
        ''
        '65479'
        ''
        'huhti')
      (
        'April'
        ''
        '65459'
        ''
        'huhtikuu')
      (
        'Arithmetic in filter expressions not supported'
        ''
        '65249'
        ''
        'Suodinlausekkeessa ei voi k‰ytt‰‰ aritmetiikkaa')
      (
        'Assertion failed'
        ''
        '65499'
        ''
        'Testaus ep‰onnistui')
      (
        'Aug'
        ''
        '65483'
        ''
        'elo')
      (
        'August'
        ''
        '65463'
        ''
        'elokuu')
      (
        'Australia'
        ''
        ''
        ''
        'Australia')
      (
        'BDE error $%.4x'
        ''
        '65222'
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
        '65412'
        ''
        'Bittikarttakuva ei ole oikea')
      (
        'Bitmaps'
        ''
        '65379'
        ''
        'Bittikartat')
      (
        'Bits index out of range'
        ''
        '65339'
        ''
        'Bitin indeksi on rajojen ulkopuolella')
      (
        'BkSp'
        ''
        '65348'
        ''
        '')
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
        '65372'
        ''
        'Peruuta')
      (
        'Cannot access field '#39'%s'#39' as type %s'
        ''
        '65301'
        ''
        #39'%s'#39'-kentt‰‰ ei voitu k‰sitell‰ %s-tyyppin‰')
      (
        'Cannot access field '#39'%s'#39' in a filter'
        ''
        '65228'
        ''
        '"%s"-kentt‰‰n ei ole p‰‰sy‰')
      (
        'Cannot access index field '#39'%s'#39
        ''
        '65286'
        ''
        'Indeksin kentt‰ puuttuu')
      (
        
          'Cannot add a session to the form or data-module while session '#39'%' +
          's'#39' has AutoSessionName enabled'
        ''
        '65237'
        ''
        
          'Lomakkeelle tai datamodulille ei voi asettaa sessiota, jos '#39'%s'#39'-' +
          'sessiolla on AutoSessionName tosi')
      (
        'Cannot assign a %s to a %s'
        ''
        '65450'
        ''
        'Ei voi sijoittaa %s:ta %s:n')
      (
        'Cannot change the size of an icon'
        ''
        '65415'
        ''
        'Ikonin kokoa ei voi muuttaa')
      (
        'Cannot change Visible in OnShow or OnHide'
        ''
        '65397'
        ''
        'OnShow- ja OnHide-eventeiss‰ ei voi muuttaa Visible-ominaisuutta')
      (
        'Cannot connect to database '#39'%s'#39
        ''
        '65219'
        ''
        #39'%s'#39'-tietokantaa ei voitu ottaa yhteytt‰')
      (
        'Cannot create file %s'
        ''
        '65451'
        ''
        'Ei voi luoda %s-tiedostoa')
      (
        'Cannot create form. No MDI forms are currently active'
        ''
        '65405'
        ''
        
          'Lomaketta ei voitu luoda. Yht‰‰n MDI-lomaketta ei ole aktiivisen' +
          'a')
      (
        'Cannot drag a form'
        ''
        '65407'
        ''
        'Lomaketta ei voi vet‰‰')
      (
        
          'Cannot enable AutoSessionName property with more than one sessio' +
          'n on a form or data-module'
        ''
        '65236'
        ''
        
          'AutoSessionName-ominaisuutta ei asettaa kuin yhdelle lomakkeen t' +
          'ai datamodulin sessiolle')
      (
        'Cannot focus a disabled or invisible window'
        ''
        '65394'
        ''
        'J‰‰dytetty tai n‰kym‰tˆn ikkuna ei voi saada fokusta')
      (
        'Cannot hide an MDI Child Form'
        ''
        '65396'
        ''
        'MDI-lapsilomaketta ei voi k‰tke‰')
      (
        'Cannot insert or delete rows from grid'
        ''
        '65385'
        ''
        'Revej‰ ei voi poistaa tai lis‰t‰ taulukkoon')
      (
        'Cannot make a visible window modal'
        ''
        '65398'
        ''
        'N‰kyv‰‰ ikkunaa ei voi tehd‰ modaaliksi')
      (
        'Cannot modify a read-only dataset'
        ''
        '65264'
        ''
        'Luettavaa tiedostoa ei voi muokata')
      (
        'Cannot modify SessionName while AutoSessionName is enabled'
        ''
        '65238'
        ''
        'SessionName:a ei voi muokata, jos AutoSessionName on tosi')
      (
        'Cannot open clipboard'
        ''
        '65337'
        ''
        'Leikekirjaa ei voitu avata')
      (
        'Cannot open file %s'
        ''
        '65452'
        ''
        'Ei voi avata %s-tiedostoa')
      (
        'Cannot perform this operation on a closed database'
        ''
        '65245'
        ''
        'Toimintoa ei voida suorittaa: tietokanta ei ole auki')
      (
        'Cannot perform this operation on a closed dataset'
        ''
        '65294'
        ''
        'Tiedosto suljettu')
      (
        'Cannot perform this operation on an active session'
        ''
        '65247'
        ''
        'T‰t‰ toimintoa ei voida suorittaa aktiiviselle sessiolle')
      (
        'Cannot perform this operation on an empty dataset'
        ''
        '65295'
        ''
        'T‰t‰ toimintoa ei voi suorittaa tyhj‰lle tiedostolle')
      (
        'Cannot perform this operation on an open database'
        ''
        '65244'
        ''
        'Toimintoa ei voida suorittaa: tietokanta on auki')
      (
        'Cannot perform this operation on an open dataset'
        ''
        '65292'
        ''
        'Tiedostoavaus')
      (
        'Can'#39't write to a read-only resource stream'
        ''
        '65424'
        ''
        'Luettavaan resurssivirtaan ei voi kirjoittaa')
      (
        'Canvas does not allow drawing'
        ''
        '65418'
        ''
        'Kanvakselle ei voi piirt‰‰')
      (
        'Caribbean'
        ''
        ''
        ''
        '')
      (
        'Circular datalinks are not allowed'
        ''
        '65289'
        ''
        'DataLink:n ympyr‰viittaus')
      (
        'Class %s not found'
        ''
        '65425'
        ''
        '%s-luokkaa ei lˆytynyt')
      (
        'Clipboard does not support Icons'
        ''
        '65336'
        ''
        'Leikekirja ei tue ikoneja')
      (
        'Confirm'
        ''
        '65368'
        ''
        'Vahvista')
      (
        'Constant is not correct type %s'
        ''
        '65251'
        ''
        'Vakio ei ole oikeaa %s-tyyppi‰')
      (
        'Constant out of range'
        ''
        '65276'
        ''
        'Vakio on rajojen ulkopuolella')
      (
        'Control '#39'%s'#39' has no parent window'
        ''
        '65395'
        ''
        #39'%s'#39'-kontrollilla ei ole is‰nt‰ikkunaa')
      (
        'Control-C hit'
        ''
        '65514'
        ''
        'Kontrolli-C painettu')
      (
        'Ctrl+'
        ''
        '65332'
        ''
        'Ctrl+')
      (
        'Database handle owned by a different session'
        ''
        '65246'
        ''
        'Toinen sessio omista tietokannan kahvan')
      (
        'Database name missing'
        ''
        '65242'
        ''
        'Tietokanna nimi puuttuu')
      (
        'Dataset not in edit or insert mode'
        ''
        '65293'
        ''
        'Muokkaus ei ole p‰‰ll‰')
      (
        'DataSource cannot be changed'
        ''
        '65291'
        ''
        'DataSource:a ei voi muuttaa')
      (
        'Dec'
        ''
        '65487'
        ''
        'joulu')
      (
        'December'
        ''
        '65467'
        ''
        'joulukuu')
      (
        'Del'
        ''
        '65330'
        ''
        '')
      (
        'Disk full'
        ''
        '65533'
        ''
        'Levy on t‰ynn‰')
      (
        'Division by zero'
        ''
        '65535'
        ''
        'Nollalla jako')
      (
        'Do you want to delete the item'
        ''
        '37201'
        ''
        '')
      (
        'Docked control must have a name'
        ''
        '65343'
        ''
        'Kiinitetyll‰ kontrollilla t‰ytyy olla nimi')
      (
        'Down'
        ''
        '65328'
        ''
        'Alas')
      (
        'Duplicate database name '#39'%s'#39
        ''
        '65239'
        ''
        'Tietokantanimi '#39'%s'#39' ei ole yksiselitteinen')
      (
        'Duplicate field name '#39'%s'#39
        ''
        '65299'
        ''
        'Kaksi samaa kent‰n nime‰ '#39'%s'#39)
      (
        'Duplicate session name '#39'%s'#39
        ''
        '65240'
        ''
        'Sessionimi '#39'%s'#39' ei ole yksiselitteinen')
      (
        'End'
        ''
        '65355'
        ''
        'loppu')
      (
        'English'
        ''
        ''
        ''
        'englanti')
      (
        'EnglishName'
        ''
        ''
        'EnglishName'
        'FinnishName')
      (
        'Enhanced Metafiles'
        ''
        '65377'
        ''
        'Parannetut Metatiedostot')
      (
        'Enter'
        ''
        '65351'
        ''
        '')
      (
        'Error'
        ''
        '65366'
        ''
        'Virhe')
      (
        'Error creating cursor handle'
        ''
        '65216'
        ''
        'Kursorikahvaa ei voitu luoda')
      (
        'Error creating variant array'
        ''
        '65495'
        ''
        'Varianttitaulukon luonnissa tapahtui virhe')
      (
        'Error creating window class'
        ''
        '65393'
        ''
        'Virhe tapahtui luotaessa ikkunaluokkaa')
      (
        'Error creating window device context'
        ''
        '65392'
        ''
        'Virhe tapahtui luotaessa ikkunan laitekontekstia')
      (
        'Error reading %s%s%s: %s'
        ''
        '65410'
        ''
        'Virhe lukiessa %s%s%s: %s')
      (
        'Error removing control from dock tree'
        ''
        '65312'
        ''
        'Kontrollia ei voitu poistaa kiinnityspuusta')
      (
        'Esc'
        ''
        '65350'
        ''
        '')
      (
        'Exception %s in module %s at %p.'#10'%s%s'
        ''
        '65517'
        ''
        '%s-poikkeus %s-modulissa osoitteessa %p.'#10'%s%s')
      (
        'Exception in safecall method'
        ''
        '65501'
        ''
        'Poikkeus turvallisessa kutsussa')
      (
        'Execute not supported: %s'
        ''
        '65261'
        ''
        'Ruorotusta ei tueta: %s')
      (
        'Express Tree Sample'
        'TForm1'
        ''
        ''
        'ExpressTree-esimerkki')
      (
        'Expression expected but %s found'
        ''
        '65273'
        ''
        'Lauseketta odotettiin, mutta %s saatiin')
      (
        'Expression is not an aggregate expression'
        ''
        '65250'
        ''
        'Lauseke ei ole yhdistetty lauseke')
      (
        'External exception %x'
        ''
        '65498'
        ''
        'Ulkoinen poikkeus %x')
      (
        'Failed to clear tab control'
        ''
        '65316'
        ''
        'Sarkainkontrollia ei voitu tyhj‰t‰')
      (
        'Failed to delete tab at index %d'
        ''
        '65317'
        ''
        'Sarkainta ei pystytty poistamaan indeksist‰ %d')
      (
        'Failed to get data for '#39'%s'#39
        ''
        '65341'
        ''
        'Tietoa ei voitu saada '#39'%s'#39':ta')
      (
        'Failed to get object at index %d'
        ''
        '65319'
        ''
        'Oloita eo pystytty hakemaan indeksist‰ %d')
      (
        'Failed to read ImageList data from stream'
        ''
        '65422'
        ''
        'Kuvalistan dataa ei voitu lukea virrasta')
      (
        'Failed to retrieve tab at index %d'
        ''
        '65318'
        ''
        'Sarkainta ei pystytty hakemaan indeksist‰ %d')
      (
        'Failed to set object at index %d'
        ''
        '65321'
        ''
        'Oliota ei pystytty asettamaan indeksiin %d')
      (
        'Failed to set tab "%s" at index %d'
        ''
        '65320'
        ''
        '"%s"-sarkainta ei pystytty asettamaan indeksiin %d')
      (
        'Failed to write ImageList data to stream'
        ''
        '65423'
        ''
        'Kuvalistan dataa ei voitu kirjoittaa virtaan')
      (
        'False'
        ''
        '65255'
        ''
        'ep‰tosi')
      (
        'Feb'
        ''
        '65477'
        ''
        'helmi')
      (
        'February'
        ''
        '65457'
        ''
        'helmikuu')
      (
        'Field '#39'%s'#39' cannot be a calculated or lookup field'
        ''
        '65282'
        ''
        #39'%s'#39'-kentt‰ ei voi olla laskettu- tai hakukentt‰')
      (
        'Field '#39'%s'#39' cannot be modified'
        ''
        '65283'
        ''
        '"%s"-kentt‰‰ voidaan vain lukea')
      (
        'Field '#39'%s'#39' cannot be used in a filter expression'
        ''
        '65274'
        ''
        #39'%s'#39'-kentt‰‰ ei voi k‰ytt‰‰ suotimen lausekkeessa')
      (
        'Field '#39'%s'#39' has no dataset'
        ''
        '65281'
        ''
        #39'%s'#39'-kent‰ll‰ ei ole tiedostoa')
      (
        'Field '#39'%s'#39' is not indexed and cannot be modified'
        ''
        '65285'
        ''
        #39'%s'#39'-kentt‰ ei ole indeksoitu eik‰ sit‰ voi muokata')
      (
        
          'Field '#39'%s'#39' is not the correct type of calculated field to be use' +
          'd in an aggregate, use an internalcalc'
        ''
        '65262'
        ''
        
          #39'%s'#39'-kentt‰ ei ole oikean tyyppinen laskettu kentt‰, jotta sit‰ ' +
          'voitaisiin k‰ytt‰‰ tyypinmuutokseen - k‰yt‰ sis‰ist‰ laskentaa')
      (
        'Field '#39'%s'#39' is of an unknown type'
        ''
        '65297'
        ''
        #39'%s'#39'-kentt‰ll‰ on tuntematon tyyppi')
      (
        'Field '#39'%s'#39' is of an unsupported type'
        ''
        '65259'
        ''
        #39'%s'#39'-kentt‰ on tukematonta tyyppi‰')
      (
        'Field '#39'%s'#39' must have a value'
        ''
        '65280'
        ''
        #39'%s'#39'-kent‰ll‰ t‰ytyy olla arvo')
      (
        'Field '#39'%s'#39' not found'
        ''
        '65300'
        ''
        '%0:s: "%1:s"-kentt‰‰ ei lˆydy')
      (
        'Field index out of range'
        ''
        '65284'
        ''
        'Kent‰n indeksi on rajojen ulkopuolella')
      (
        'Field name missing'
        ''
        '65298'
        ''
        'Kent‰n nimi puuttuu')
      (
        'File access denied'
        ''
        '65531'
        ''
        'Tietoston k‰sittely ei ole mahdollista')
      (
        'File load error'
        ''
        '65362'
        ''
        'Tiedoston latausvirhe')
      (
        'File not found'
        ''
        '65528'
        ''
        'Tiedostoa ei lˆytynyt')
      (
        'Filter expression incorrectly terminated'
        ''
        '65266'
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
        'Fixed column count must be less than column count'
        ''
        '65383'
        ''
        
          'Kiinteiden sarakkeiden m‰‰r‰n on oltava v‰hemm‰n kuin v‰hemm‰n k' +
          'uin sarakkeiden kokonaism‰‰r‰n')
      (
        'Fixed row count must be less than row count'
        ''
        '65384'
        ''
        
          'Kiinteiden rivien m‰‰r‰n on oltava v‰hemm‰n kuin rivien kokonais' +
          'm‰‰r‰n')
      (
        'Floating point division by zero'
        ''
        '65507'
        ''
        'Liukuluvun nollalla jako')
      (
        'Floating point overflow'
        ''
        '65508'
        ''
        'Liukuluvun ylivuoto')
      (
        'Floating point underflow'
        ''
        '65509'
        ''
        'Liukuluvun alivuoto')
      (
        'Format '#39'%s'#39' invalid or incompatible with argument'
        ''
        '65519'
        ''
        #39'%s'#39'-muoto on v‰‰r‰ tai sopimaton argumentiksi')
      (
        'Format string too long'
        ''
        '65494'
        ''
        'Muotoilumerkkijono on liian pitk‰')
      (
        'Fri'
        ''
        '65441'
        ''
        'pe')
      (
        'Friday'
        ''
        '65448'
        ''
        'perjantai')
      (
        'Grid index out of range'
        ''
        '65382'
        ''
        'Taulukon indeksi on rajojen ulkopuolella')
      (
        'Grid too large for operation'
        ''
        '65380'
        ''
        'Taulukko on liian suuri operaatiolle')
      (
        'GroupIndex cannot be less than a previous menu item'#39's GroupIndex'
        ''
        '65404'
        ''
        
          'GroupIndex ei voi olla v‰hemm‰n kuin edellisen valikon GroupInde' +
          'x')
      (
        'Home'
        ''
        '65356'
        ''
        '')
      (
        'I/O error %d'
        ''
        '65527'
        ''
        'I/O-virhe %d')
      (
        'Icon image is not valid'
        ''
        '65413'
        ''
        'Ikonikuva ei ole oikea')
      (
        'Icons'
        ''
        '65378'
        ''
        'Ikonit')
      (
        'IN predicate list may not be empty'
        ''
        '65253'
        ''
        'IN-predikaattilista ei voi olla tyhj‰')
      (
        'Incorrectly formed filter expression'
        ''
        '65277'
        ''
        'V‰‰rin muotoiltu suodinlauseke')
      (
        'Index '#39'%s'#39' not found'
        ''
        '65288'
        ''
        #39'%s'#39'-indeksi‰ ei lˆydy')
      (
        'Index does not exist. Index: %s'
        ''
        '65223'
        ''
        'Indeksi‰ ei ole olemassa. Indeksi: %s')
      (
        'Information'
        ''
        '65367'
        ''
        'Tiedotus')
      (
        'Ins'
        ''
        '65329'
        ''
        '')
      (
        'Integer overflow'
        ''
        '65505'
        ''
        'Kokonaisluvun ylivuoto')
      (
        'Interface not supported'
        ''
        '65500'
        ''
        'Rajapintaa ei tueta')
      (
        'Invalid alias name %s'
        ''
        '65227'
        ''
        'Aliasnimi %s on v‰‰r‰')
      (
        'Invalid argument to date encode'
        ''
        '65525'
        ''
        'V‰‰r‰t arvot p‰iv‰m‰‰r‰n koodauksessa')
      (
        'Invalid class typecast'
        ''
        '65511'
        ''
        'V‰‰r‰ luokan tyyppimuunnos')
      (
        'Invalid clipboard format'
        ''
        '65335'
        ''
        'V‰‰r‰ leikekirjaformaatti')
      (
        'Invalid data type for '#39'%s'#39
        ''
        '65340'
        ''
        'V‰‰r‰ tietotyyppi '#39'%s'#39':lle')
      (
        'Invalid field size'
        ''
        '65327'
        ''
        'V‰‰r‰ kent‰n koko')
      (
        'Invalid FieldKind'
        ''
        '65296'
        ''
        'V‰‰r‰ FieldKind')
      (
        'Invalid filename'
        ''
        '65529'
        ''
        'V‰‰r‰ tiedostonimi')
      (
        'Invalid filter expression character: '#39'%s'#39
        ''
        '65269'
        ''
        'V‰‰r‰ suodinlausekkeen merkki: '#39'%s'#39)
      (
        'Invalid floating point operation'
        ''
        '65506'
        ''
        'V‰‰r‰ luikulukuoperaatio')
      (
        'Invalid image size'
        ''
        '65419'
        ''
        'V‰‰r‰ kuvan koko')
      (
        'Invalid ImageList'
        ''
        '65420'
        ''
        'V‰‰r‰ kuvalistan')
      (
        'Invalid ImageList Index'
        ''
        '65421'
        ''
        'V‰‰r‰ kuvalistan indeksi')
      (
        'Invalid index'
        ''
        '65323'
        ''
        'V‰‰r‰ indeksi')
      (
        'Invalid input value'
        ''
        '65390'
        ''
        'V‰‰r‰ syˆtt‰arvo')
      (
        'Invalid input value.  Use escape key to abandon changes'
        ''
        '65391'
        ''
        'V‰‰r‰ syˆttˆarvo. K‰yt‰ Esc-n‰pp‰int‰ peruaksesi muutokset')
      (
        'Invalid numeric input'
        ''
        '65534'
        ''
        'V‰‰r‰ numeerinen syˆttˆ')
      (
        'Invalid outline index'
        ''
        '65360'
        ''
        'V‰‰r‰ outline-indeksi')
      (
        'Invalid owner'
        ''
        '65325'
        ''
        'V‰‰r‰ omistaja')
      (
        'Invalid pointer operation'
        ''
        '65510'
        ''
        'V‰‰r‰ osoitinoperaatio')
      (
        'Invalid property path'
        ''
        '65439'
        ''
        'V‰‰r‰ ominaisuuden polku')
      (
        'Invalid property value'
        ''
        '65386'
        ''
        'V‰‰r‰ ominaisuuden arvo')
      (
        'Invalid property value'
        ''
        '65438'
        ''
        'V‰‰r‰ ominaisuuden arvo')
      (
        'Invalid selection'
        ''
        '65361'
        ''
        'V‰‰r‰ valinta')
      (
        'Invalid session name %s'
        ''
        '65241'
        ''
        'V‰‰r‰ sessionimi %s')
      (
        'Invalid stream format'
        ''
        '65426'
        ''
        'V‰‰r‰ virtamuoto')
      (
        'Invalid use of keyword'
        ''
        '65254'
        ''
        'Avainsanan v‰‰r‰ k‰yttˆ')
      (
        'Invalid value for current item'
        ''
        '65389'
        ''
        'Nykyisell‰ j‰senell‰ on v‰‰r‰ arvo')
      (
        'Invalid value for field '#39'%s'#39
        ''
        '65302'
        ''
        #39'%s'#39'-kent‰ll‰ on v‰‰r‰ arvo')
      (
        'Invalid variant operation'
        ''
        '65490'
        ''
        'V‰‰r‰ variantin toiminto')
      (
        'Invalid variant type conversion'
        ''
        '65489'
        ''
        'V‰‰r‰ variantin tyyppimuunnos')
      (
        'Invalid variant type or size for field '#39'%s'#39
        ''
        '65309'
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
        '65476'
        ''
        'tammi')
      (
        'January'
        ''
        '65456'
        ''
        'tammikuu')
      (
        'Jul'
        ''
        '65482'
        ''
        'hein‰')
      (
        'July'
        ''
        '65462'
        ''
        'hein‰kuu')
      (
        'Jun'
        ''
        '65481'
        ''
        'kes‰')
      (
        'June'
        ''
        '65461'
        ''
        'kes‰kuu')
      (
        'Left'
        ''
        '65357'
        ''
        'Vasen')
      (
        'Line too long'
        ''
        '65363'
        ''
        'Rivi on liian pitk‰')
      (
        'List capacity out of bounds (%d)'
        ''
        '65429'
        ''
        'Listan kapasiteetti on rajojen ulkopuolella (%d)')
      (
        'List count out of bounds (%d)'
        ''
        '65430'
        ''
        'Listan koko on rajojen ulkopuolella (%d)')
      (
        'List does not allow duplicates ($0%x)'
        ''
        '65315'
        ''
        'Listassa ei voi olla kahdennettuja ($0%x)')
      (
        'List index out of bounds (%d)'
        ''
        '65428'
        ''
        'Listan indeksi on rajojen ulkopuolella (%d)')
      (
        'Lookup information for field '#39'%s'#39' is incomplete'
        ''
        '65290'
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
        '65478'
        ''
        'maalis')
      (
        'March'
        ''
        '65458'
        ''
        'maaliskuu')
      (
        'Maximum outline depth exceeded'
        ''
        '65364'
        ''
        'Suuri outline-syvyys ylitetty')
      (
        'May'
        ''
        '65460'
        ''
        'touko')
      (
        'May'
        ''
        '65480'
        ''
        'touko')
      (
        'Menu '#39'%s'#39' is already being used by another form'
        ''
        '65342'
        ''
        #39'%s'#39'-valikkoa k‰ytt‰‰ jo toinen lomake')
      (
        'Menu index out of range'
        ''
        '65400'
        ''
        'Valikon indeksi on rajojen ulkopuolella')
      (
        'Menu inserted twice'
        ''
        '65401'
        ''
        'Valikko on lis‰tty kahdesti')
      (
        'Metafile is not valid'
        ''
        '65414'
        ''
        'Metafile ei ole oikea')
      (
        'Metafiles'
        ''
        '65376'
        ''
        'Metatiedostot')
      (
        'Method '#39'%s'#39' not supported by automation object'
        ''
        '65234'
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
        '65225'
        ''
        'DataSetField-ominaisuus puuttuu')
      (
        'Missing TableName property'
        ''
        '65224'
        ''
        'Tietueita ei voi selvitt‰‰.  Taulun nime‰ ei lˆydy.')
      (
        'Mon'
        ''
        '65469'
        ''
        'ma')
      (
        'Monday'
        ''
        '65444'
        ''
        'maanantai')
      (
        'MultiLine must be True when TabPosition is tpLeft or tpRight'
        ''
        '65322'
        ''
        
          'MultiLine:n on oltava tosi, kun TabPosition on tpLeft tai tpRigh' +
          't')
      (
        'N&o to All'
        ''
        '65346'
        ''
        '&Ei kaikkiin')
      (
        'Nested dataset must inherit from %s'
        ''
        '65265'
        ''
        'Sis‰kk‰isten tiedostojen pit‰‰ olla peritty %s:st‰')
      (
        'New Zealand'
        ''
        ''
        ''
        'Uusi-Seelanti')
      (
        'No argument for format '#39'%s'#39
        ''
        '65488'
        ''
        #39'%s'#39'-muodossa ei ole argumenttia')
      (
        'No index for fields '#39'%s'#39
        ''
        '65287'
        ''
        #39'%s'#39'-kentille ei ole indeksi‰')
      (
        'No value for parameter '#39'%s'#39
        ''
        '65218'
        ''
        #39'%s'#39'-parametrilla ei ole arvoa')
      (
        'Not enough timers available'
        ''
        '65403'
        ''
        'Ajanottajia ei ole tarpeeksi')
      (
        'Not in cached update mode'
        ''
        '65226'
        ''
        'Ei ole v‰limuistip‰ivitystilassa')
      (
        'nothing'
        ''
        '65278'
        ''
        'ei mit‰‰n')
      (
        'Nov'
        ''
        '65486'
        ''
        'marras')
      (
        'November'
        ''
        '65466'
        ''
        'marraskuu')
      (
        'NULL only allowed with '#39'='#39' and '#39'<>'#39
        ''
        '65275'
        ''
        'NULL on sallittu vain '#39'='#39':n ja '#39'<>'#39':n kanssa')
      (
        'Oct'
        ''
        '65485'
        ''
        'loka')
      (
        'October'
        ''
        '65465'
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
        '65371'
        ''
        'OK')
      (
        'OLE error %.8x'
        ''
        '65233'
        ''
        'OLE-virhe %.8x')
      (
        'One'
        'TForm1'
        'dxTreeView1'
        ''
        'Yksi')
      (
        'Operation aborted'
        ''
        '65516'
        ''
        'Toiminto keskeytetty')
      (
        'Operation cannot mix aggregate value with record-varying value'
        ''
        '65248'
        ''
        
          'Operaatio ei voi sekoittaa yhdistetty‰ arvoa tietueesta saatuun ' +
          'arvoon')
      (
        'Operation not allowed on sorted string list'
        ''
        '65431'
        ''
        'Tapahtuma ei ole mahdollinen lajitetuille listoille.')
      (
        'Out of memory'
        ''
        '65526'
        ''
        'Muisti loppui')
      (
        'Out of memory while expanding memory stream'
        ''
        '65455'
        ''
        'Muisti loppui k‰sitelt‰ess‰ tiedostovirtaa')
      (
        'Out of system resources'
        ''
        '65417'
        ''
        'J‰rjestelm‰resurssit ovat loppu')
      (
        'Outline index not found'
        ''
        '65387'
        ''
        'Outline:n indeksi‰ ei lˆytynyt')
      (
        'Parameter '#39'%s'#39' not found'
        ''
        '65257'
        ''
        #39'%s'#39'-parametria ei lˆytynyt')
      (
        'Parent must be expanded'
        ''
        '65388'
        ''
        'Is‰nt‰ t‰ytyy olla laajennettu')
      (
        'PgDn'
        ''
        '65354'
        ''
        '')
      (
        'PgUp'
        ''
        '65353'
        ''
        '')
      (
        'Privileged instruction'
        ''
        '65515'
        ''
        'Suojattu k‰sky')
      (
        'Property does not exist'
        ''
        '65408'
        ''
        'Ominaisuutta ei ole olemassa')
      (
        'Property is read-only'
        ''
        '65409'
        ''
        'Ominaisuus on vain luettava')
      (
        'Range check error'
        ''
        '65504'
        ''
        'Rajatarkistusvirhe')
      (
        'Read'
        ''
        '65492'
        ''
        'Lue')
      (
        'Read beyond end of file'
        ''
        '65532'
        ''
        'Tieton lopun j‰lkeen yritettiin lukea')
      (
        'Record changed by another user'
        ''
        '65263'
        ''
        'Toinen k‰ytt‰j‰ on muuttanut tietuetta')
      (
        'Record not found'
        ''
        '65232'
        ''
        'Tietuetta ei lˆytynyt')
      (
        'ReferenceTableName not specified for field '#39'%s'#39
        ''
        '65217'
        ''
        'ReferenceTableName:‰ ei ole m‰‰ritelty '#39'%s'#39'-kent‰lle')
      (
        'Republic of the Philippines'
        ''
        ''
        ''
        '')
      (
        'Resource %s not found'
        ''
        '65427'
        ''
        '%s-resurssia ei lˆydy')
      (
        'Right'
        ''
        '65359'
        ''
        'Oikea')
      (
        'Sat'
        ''
        '65442'
        ''
        'la')
      (
        'Saturday'
        ''
        '65449'
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
        '65484'
        ''
        'syys')
      (
        'September'
        ''
        '65464'
        ''
        'syyskuu')
      (
        'Session name missing'
        ''
        '65243'
        ''
        'Sessionimi puuttuu')
      (
        
          'Set trSmartRecordLoad in the  Options property to decrease the l' +
          'oading time. Do you want to do it now ?'
        ''
        '37202'
        ''
        '')
      (
        'Shift+'
        ''
        '65331'
        ''
        'Vaihto+')
      (
        'Size mismatch for field '#39'%s'#39', expecting: %d actual: %d'
        ''
        '65308'
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
        '65352'
        ''
        '')
      (
        'SQL not supported: %s'
        ''
        '65260'
        ''
        'SQL:‰‰ ei tueta: %s')
      (
        'Stack overflow'
        ''
        '65513'
        ''
        'Pinon ylivuoto')
      (
        'Stream read error'
        ''
        '65453'
        ''
        'Tiedostovirran lukuvirhe')
      (
        'Stream write error'
        ''
        '65454'
        ''
        'Tiedostovirran kirjoitusvirhe')
      (
        'String list does not allow duplicates'
        ''
        '65432'
        ''
        'Merkkijonolistalla ei voi olla kahdennettuja arvoja.')
      (
        'Sub-menu is not in menu'
        ''
        '65402'
        ''
        'Alivalikko ei ole valikossa')
      (
        'Sun'
        ''
        '65468'
        ''
        'su')
      (
        'Sunday'
        ''
        '65443'
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
        '65349'
        ''
        'Sarkain')
      (
        'Tab position incompatible with current tab style'
        ''
        '65433'
        ''
        
          'Sarkaimen paikka ei ole yhteensopiva nykyisen sarkaintyylin kans' +
          'sa')
      (
        'Tab style incompatible with current tab position'
        ''
        '65434'
        ''
        
          'Sarkaintyyli ei ole yhteensopiva nykyisen sarkaimen paikan kanss' +
          'a')
      (
        'TdxDBTreeView'
        'TForm1'
        'DBSheet'
        ''
        'TdxDBTreeView')
      (
        'TdxTreeView'
        'TForm1'
        'Sheet'
        ''
        'TdxTreeView')
      (
        'Text exceeds memo capacity'
        ''
        '65338'
        ''
        'Teksti ylitt‰‰ muistion kapasiteetin')
      (
        
          'The transaction isolation level must be dirty read for local dat' +
          'abases'
        ''
        '65230'
        ''
        
          'Paikallistn tietokantojen tapahtuman eristystaso on oltava "lika' +
          'inen luku"')
      (
        'Three'
        'TForm1'
        'dxTreeView1'
        ''
        'Kolme')
      (
        'Thu'
        ''
        '65440'
        ''
        'to')
      (
        'Thursday'
        ''
        '65447'
        ''
        'torstai')
      (
        'Too many open files'
        ''
        '65530'
        ''
        'Liian monta avoinna olevaa tiedostoa')
      (
        'Too many rows or columns deleted'
        ''
        '65381'
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
        '65256'
        ''
        'tosi')
      (
        'Tue'
        ''
        '65470'
        ''
        'ti')
      (
        'Tuesday'
        ''
        '65445'
        ''
        'tiistai')
      (
        'Two'
        'TForm1'
        'dxTreeView1'
        ''
        'Kaksi')
      (
        'Type mismatch for field '#39'%s'#39', expecting: %s actual: %s'
        ''
        '65307'
        ''
        #39'%s'#39'-kent‰n tyyppi ei t‰sm‰‰, oletettiin: %s, on: %s')
      (
        'Type mismatch in expression'
        ''
        '65279'
        ''
        'Lausekkeen tyypit eiv‰t t‰sm‰‰')
      (
        'Unable to insert a line'
        ''
        '65334'
        ''
        'Rivi‰ ei voitu lis‰t‰')
      (
        'Unable to insert an item'
        ''
        '65324'
        ''
        'J‰sent‰ ei voitu lis‰t‰')
      (
        'Unable to load bind parameters'
        ''
        '65258'
        ''
        'Sidontaparametrej‰ ei voitu ladata')
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
        'Unsupported clipboard format'
        ''
        '65416'
        ''
        'Leikekirjaformaattia ei tueta')
      (
        'Unterminated field name'
        ''
        '65267'
        ''
        'Kent‰ nime‰ ei ole p‰‰tetty')
      (
        'Unterminated string constant'
        ''
        '65268'
        ''
        'Merkkijonovakiota ei ole p‰‰tetty')
      (
        'Untitled Application'
        ''
        '65229'
        ''
        '(nimetˆn)')
      (
        'Up'
        ''
        '65358'
        ''
        'Ylˆs')
      (
        'Value of field '#39'%s'#39' is out of range'
        ''
        '65310'
        ''
        #39'%s'#39'-kent‰n arvo on rajojen ulkopuolella')
      (
        'Variant array index out of bounds'
        ''
        '65497'
        ''
        'Varianttitaulukon indeksi on rajojen ulkopuolella')
      (
        'Variant does not reference an automation object'
        ''
        '65235'
        ''
        'Variantti ei viittaa OLE-olioon')
      (
        'Variant is not an array'
        ''
        '65496'
        ''
        'Variantti ei ole taulukko')
      (
        'Variant method calls not supported'
        ''
        '65491'
        ''
        'Variantin metodin kutsua ei ole tuettu')
      (
        'Warning'
        ''
        '65365'
        ''
        'Varoitus')
      (
        'Wed'
        ''
        '65471'
        ''
        'ke')
      (
        'Wednesday'
        ''
        '65446'
        ''
        'keskiviikko')
      (
        'Win32 Error.  Code: %d.'#10'%s'
        ''
        '65473'
        ''
        'Win32-virhe.  Koodi: %d.'#10'%s')
      (
        'Write'
        ''
        '65493'
        ''
        'Kirjoita')
      (
        'Yes to &All'
        ''
        '65347'
        ''
        '&Kyll‰ kaikkiin')
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
end
