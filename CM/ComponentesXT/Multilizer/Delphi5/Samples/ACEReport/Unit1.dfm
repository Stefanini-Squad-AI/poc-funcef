object Form1: TForm1
  Left = 267
  Top = 311
  Width = 622
  Height = 447
  Caption = 'ACE Report Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 512
    Top = 0
    Width = 102
    Height = 420
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object LanguageButton: TButton
      Left = 8
      Top = 8
      Width = 89
      Height = 25
      Caption = '&Language...'
      TabOrder = 0
      OnClick = LanguageButtonClick
    end
    object ReportButton: TButton
      Left = 8
      Top = 40
      Width = 89
      Height = 25
      Caption = '&Report...'
      TabOrder = 1
      OnClick = ReportButtonClick
    end
  end
  object SctReport1: TSctReport
    Left = 0
    Top = 0
    Width = 512
    Height = 420
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    Align = alClient
    TabOrder = 1
    Visible = False
    Minimized = False
    Prompt = True
    AutoRun = False
    SuppressStatus = False
    PixelsPerInch = 96
    STop = 0
    SLeft = 0
    SWidth = 512
    SHeight = 420
    MTop = 0
    MLeft = 0
    SAlign = alNone
    Version = vAce1_0
    object ReportPage: TSctGrouppage
      Left = 35
      Top = 55
      Width = 457
      Height = 345
      Color = clWhite
      ParentColor = False
      TabOrder = 2
      ClipLabels = False
      PageSetup.Height = 11
      PageSetup.Width = 8.5
      BorderType = btNone
      CloseDataSet = False
      DataRange = drAllRecords
      OmitLastPgFt = False
      Head = ReportHeaderBand
      Detail = DetailBand
      Foot = ReportFooterBand
      PageHead = PageHeaderBand
      PageFoot = PageFooterBand
      DataSource = Source1
      Order = 1
      object ReportHeaderBandlevel: TSctLevel
        Left = 0
        Top = 0
        Width = 0
        Height = 0
        IsHeader = True
      end
      object PageHeaderBandlevel: TSctLevel
        Left = 0
        Top = 0
        Width = 0
        Height = 0
        IsHeader = True
      end
      object DetailBandlevel: TSctLevel
        Left = 0
        Top = 0
        Width = 0
        Height = 0
      end
      object PageFooterBandlevel: TSctLevel
        Left = 0
        Top = 0
        Width = 0
        Height = 0
      end
      object ReportFooterBandlevel: TSctLevel
        Left = 0
        Top = 0
        Width = 0
        Height = 0
      end
      object svarDateTime: TSctDateTimeVar
        Left = 0
        Top = 0
        Width = 0
        Height = 0
        UpdateLevel = ReportHeaderBandlevel
        AutoVar = True
        ID = vidDateTimeVar
      end
      object svarPage: TSctPageVar
        Left = 0
        Top = 0
        Width = 0
        Height = 0
        UpdateLevel = PageHeaderBandlevel
        AutoVar = True
        ID = vidPageVar
      end
      object DataSourceGuide: TSctDataSourceGuide
        Left = 0
        Top = 0
        Width = 0
        Height = 0
        CreateVariables = True
        UpdateLevel = DetailBandlevel
        DataSource = Source1
      end
      object table1FirstNameVar: TSctDBVar
        Left = 0
        Top = 0
        Width = 0
        Height = 0
        DataField = 'FirstName'
        DataSource = Source1
        UpdateLevel = DetailBandlevel
        AutoVar = True
        ID = vidAutoDataVar
      end
      object table1LastNameVar: TSctDBVar
        Left = 0
        Top = 0
        Width = 0
        Height = 0
        DataField = 'LastName'
        DataSource = Source1
        UpdateLevel = DetailBandlevel
        AutoVar = True
        ID = vidAutoDataVar
      end
      object table1EmailVar: TSctDBVar
        Left = 0
        Top = 0
        Width = 0
        Height = 0
        DataField = 'Email'
        DataSource = Source1
        UpdateLevel = DetailBandlevel
        AutoVar = True
        ID = vidAutoDataVar
      end
      object ReportHeaderBand: TSctBand
        Left = 0
        Top = 0
        Width = 770
        Height = 5
        ParentColor = True
        BandName = 'Report Header'
        Updatelevel = ReportHeaderBandlevel
        Visible = False
      end
      object PageHeaderBand: TSctBand
        Left = 0
        Top = 20
        Width = 770
        Height = 20
        ParentColor = True
        BandName = 'Page Header'
        Updatelevel = PageHeaderBandlevel
        object Sctvarlabel1: TSctvarlabel
          Left = 192
          Top = 0
          Width = 65
          Height = 17
          AlignHorizontal = laRight
          Caption = 'Page'
        end
        object Sctvarlabel2: TSctvarlabel
          Left = 264
          Top = 0
          Width = 65
          Height = 17
          Variable = svarPage
        end
      end
      object DetailBand: TSctBand
        Left = 0
        Top = 55
        Width = 770
        Height = 58
        ParentColor = True
        BandName = 'Detail'
        Updatelevel = DetailBandlevel
        Stretch = True
        BorderType = btSingle
        object varlabel: TSctvarlabel
          Left = 8
          Top = 16
          Width = 97
          Height = 17
          Variable = table1FirstNameVar
        end
        object varlabel1: TSctvarlabel
          Left = 112
          Top = 16
          Width = 281
          Height = 17
          Variable = table1LastNameVar
        end
        object varlabel2: TSctvarlabel
          Left = 8
          Top = 36
          Width = 280
          Height = 17
          Variable = table1EmailVar
        end
        object Sctvarlabel3: TSctvarlabel
          Left = 8
          Top = 0
          Width = 65
          Height = 17
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Caption = 'Name:'
        end
      end
      object PageFooterBand: TSctBand
        Left = 0
        Top = 128
        Width = 770
        Height = 20
        ParentColor = True
        BandName = 'Page Footer'
        Updatelevel = PageFooterBandlevel
      end
      object ReportFooterBand: TSctBand
        Left = 0
        Top = 163
        Width = 770
        Height = 20
        ParentColor = True
        BandName = 'Report Footer'
        Updatelevel = ReportFooterBandlevel
      end
    end
  end
  object Source1: TDataSource
    DataSet = Table1
    Left = 520
    Top = 104
  end
  object Table1: TTable
    TableName = '..\sample.db'
    Left = 552
    Top = 104
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    Left = 552
    Top = 72
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
        'Filter'
        0)
      (
        ''
        'Lines'
        0))
  end
  object IvBinaryDictionary1: TIvBinaryDictionary
    DictionaryName = 'Dictionary1'
    FileName = 'Project1.mld'
    Storage = ivsEmbedded
    Left = 520
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
      475
      (
        ' - Dock zone has no control'
        ''
        '65309'
        ''
        ' - kiinnitysalueella ei ole yht‰‰n kontrollia')
      (
        ' - Dock zone not found'
        ''
        '65308'
        ''
        ' - kiinnitysaluetta ei lˆytynyt')
      (
        ' (%dx%d)'
        ''
        '65304'
        ''
        ' (%dx%d)')
      (
        
          '%d is an invalid PageIndex value.  PageIndex must be between 0 a' +
          'nd %d'
        ''
        '65173'
        ''
        
          '%d on v‰‰r‰ PageIndex:n arvo. PageIndex pit‰‰ olla 0:n ja %d:n v' +
          '‰lill‰')
      (
        
          '%g is not a valid value for field '#39'%s'#39'. The allowed range is %g ' +
          'to %g'
        ''
        '65287'
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
        '65289'
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
        '65290'
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
        '65288'
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
        '65381'
        ''
        '%s %s:lla')
      (
        '%s property out of range'
        ''
        '65404'
        ''
        '%s-ominaisuus on rajojen ulkopuolella')
      (
        '&Abort'
        ''
        '65330'
        ''
        '&Keskeyt‰')
      (
        '&All'
        ''
        '65333'
        ''
        '&Kaikki')
      (
        '&All'
        ''
        '65362'
        ''
        '&Kaikki')
      (
        '&Cancel'
        ''
        '56431'
        ''
        '&Peruuta')
      (
        '&Cancel'
        ''
        '56463'
        ''
        '&Peruuta')
      (
        '&Close'
        ''
        ''
        ''
        '&Sulje')
      (
        '&Close'
        ''
        '56475'
        ''
        '&Sulje')
      (
        '&Close'
        ''
        '56488'
        ''
        '&Sulje')
      (
        '&Close'
        ''
        '65390'
        ''
        '&Sulje')
      (
        '&Exit'
        ''
        '56479'
        ''
        '&Lopeta')
      (
        '&File'
        ''
        '56471'
        ''
        '&Tiedosto')
      (
        '&Go'
        ''
        '56462'
        ''
        '&Mene')
      (
        '&Help'
        ''
        '65329'
        ''
        '&Ohje')
      (
        '&Help'
        ''
        '65389'
        ''
        '&Ohje')
      (
        '&Ignore'
        ''
        '65332'
        ''
        '&Ohita')
      (
        '&Ignore'
        ''
        '65391'
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
        '&Name:'
        ''
        ''
        ''
        '&Nimi:')
      (
        '&Navigate'
        ''
        '56473'
        ''
        '&Selaa')
      (
        '&Next'
        ''
        ''
        ''
        '&Seuraava')
      (
        '&No'
        ''
        '65358'
        ''
        '&Ei')
      (
        '&No'
        ''
        '65388'
        ''
        '&Ei')
      (
        '&Open'
        ''
        '56474'
        ''
        '&Avaa')
      (
        '&Options'
        ''
        '56472'
        ''
        '&Asetukset')
      (
        '&Print'
        ''
        '56430'
        ''
        '&Tulosta')
      (
        '&Properties'
        ''
        ''
        ''
        '&Ominaisuudet')
      (
        '&Report...'
        'TForm1'
        'ReportButton'
        ''
        '&Raportti...')
      (
        '&Restore'
        ''
        ''
        ''
        '&Palauta')
      (
        '&Retry'
        ''
        '65331'
        ''
        '&Yrit‰ uudelleen')
      (
        '&Retry'
        ''
        '65360'
        ''
        '&Yrit‰ uudelleen')
      (
        '&Save'
        ''
        '56476'
        ''
        '&Tallenna')
      (
        '&Size'
        ''
        ''
        ''
        '&Koko')
      (
        '&Source:'
        ''
        ''
        ''
        '&L‰hde:')
      (
        '&Synchronize'
        ''
        '56480'
        ''
        '&Synkronoi')
      (
        '&Toolbar'
        ''
        '56481'
        ''
        '&Tyˆkalurivi')
      (
        '&Yes'
        ''
        '65357'
        ''
        '&Kyll‰')
      (
        '&Yes'
        ''
        '65387'
        ''
        '&Kyll‰')
      (
        #39'('#39' expected but %s found'
        ''
        '65253'
        ''
        #39'('#39':‰ odotettiin, mutta %s saatiin')
      (
        '(None)'
        ''
        '65322'
        ''
        '(ei mik‰‰n)')
      (
        '(Overflow)'
        ''
        '65295'
        ''
        '(ylivuoto)')
      (
        #39')'#39' expected but %s found'
        ''
        '65254'
        ''
        #39')'#39':‰ odotettiin, mutta %s saatiin')
      (
        #39')'#39' or '#39','#39' expected but %s found'
        ''
        '65255'
        ''
        #39')'#39':‰ tai '#39','#39':‰ odotettiin, mutta %s saatiin')
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
        '65384'
        ''
        'Kontrollin is‰nt‰ ei voi olla kontrolli itse')
      (
        'A Win32 API function failed'
        ''
        '65475'
        ''
        'Win32API-functio ep‰onnistui')
      (
        'Abort'
        ''
        '56444'
        ''
        'Keskeyt‰')
      (
        'Abort'
        ''
        '65361'
        ''
        'Keskeyt‰')
      (
        'Abort Report'
        ''
        '56491'
        ''
        'Keskeyt‰ raportti')
      (
        'Abort Report?'
        ''
        '56453'
        ''
        'Keskeyt‰nkˆ raportin?')
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
        'ACE Report Sample'
        'TForm1'
        ''
        ''
        'ACE Report -esimerkki')
      (
        'Ace Viewer'
        ''
        '56470'
        ''
        'Ace-katselin')
      (
        'Aggregate expressions not allowed in filters'
        ''
        '65235'
        ''
        'Yhdistetyt lausekkeet eiv‰t ole mahdollisia suotimissa')
      (
        'All'
        ''
        '56426'
        ''
        'Kaikki')
      (
        'All'
        ''
        '65323'
        ''
        'Kaikki')
      (
        'Alt+'
        ''
        '65321'
        ''
        'Alt+')
      (
        
          'An error occurred while attempting to initialize the Borland Dat' +
          'abase Engine (error $%.4x)'
        ''
        '65213'
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
        'Are you sure you want to delete this report?'
        ''
        '56403'
        ''
        'Oletko varma, ett‰ haluat poistaa t‰m‰n raportin?')
      (
        'Arithmetic in filter expressions not supported'
        ''
        '65232'
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
        'BDE error $%.4x'
        ''
        '65215'
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
        '65367'
        ''
        'Bittikartat')
      (
        'Bits index out of range'
        ''
        '65299'
        ''
        'Bitin indeksi on rajojen ulkopuolella')
      (
        'BkSp'
        ''
        '65336'
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
        'Cancel'
        ''
        '65328'
        ''
        'Peruuta')
      (
        'Cancel'
        ''
        '65386'
        ''
        'Peruuta')
      (
        'Cancel - Continue generating report'
        ''
        '56452'
        ''
        'Peruuta - Jatka raportin muodostamista')
      (
        'Cancel edit'
        ''
        '65223'
        ''
        'Peru tietue')
      (
        'Cannot access field '#39'%s'#39' as type %s'
        ''
        '65285'
        ''
        #39'%s'#39'-kentt‰‰ ei voitu k‰sitell‰ %s-tyyppin‰')
      (
        'Cannot access field '#39'%s'#39' in a filter'
        ''
        '65189'
        ''
        'Ei voi k‰sitell‰ suotimessa olavaa '#39'%s'#39'-tietuetta')
      (
        'Cannot access index field '#39'%s'#39
        ''
        '65270'
        ''
        'Indeksoitua '#39'%s'#39'-kentt‰‰ ei voi k‰sitell‰')
      (
        
          'Cannot add a session to the form or data-module while session '#39'%' +
          's'#39' has AutoSessionName enabled'
        ''
        '65230'
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
        'Cannot change the size of a JPEG image'
        ''
        '65174'
        ''
        'JPEG-kuvan kokoa ei voi muuttaa')
      (
        'Cannot change the size of an icon'
        ''
        '65418'
        ''
        'Ikonin kokoa ei voi muuttaa')
      (
        'Cannot change Visible in OnShow or OnHide'
        ''
        '65402'
        ''
        'OnShow- ja OnHide-eventeiss‰ ei voi muuttaa Visible-ominaisuutta')
      (
        'Cannot connect to database '#39'%s'#39
        ''
        '65212'
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
        '65383'
        ''
        
          'Lomaketta ei voitu luoda. Yht‰‰n MDI-lomaketta ei ole aktiivisen' +
          'a')
      (
        'Cannot drag a form'
        ''
        '65363'
        ''
        'Lomaketta ei voi vet‰‰')
      (
        
          'Cannot enable AutoSessionName property with more than one sessio' +
          'n on a form or data-module'
        ''
        '65229'
        ''
        
          'AutoSessionName-ominaisuutta ei asettaa kuin yhdelle lomakkeen t' +
          'ai datamodulin sessiolle')
      (
        'Cannot focus a disabled or invisible window'
        ''
        '65399'
        ''
        'J‰‰dytetty tai n‰kym‰tˆn ikkuna ei voi saada fokusta')
      (
        'Cannot hide an MDI Child Form'
        ''
        '65401'
        ''
        'MDI-lapsilomaketta ei voi k‰tke‰')
      (
        'Cannot insert or delete rows from grid'
        ''
        '65373'
        ''
        'Revej‰ ei voi poistaa tai lis‰t‰ taulukkoon')
      (
        'Cannot make a visible window modal'
        ''
        '65403'
        ''
        'N‰kyv‰‰ ikkunaa ei voi tehd‰ modaaliksi')
      (
        'Cannot modify a read-only dataset'
        ''
        '65279'
        ''
        'Luettavaa tietojoukkua ei voi muokata')
      (
        'Cannot modify SessionName while AutoSessionName is enabled'
        ''
        '65231'
        ''
        'SessionName:a ei voi muokata, jos AutoSessionName on tosi')
      (
        'Cannot open clipboard'
        ''
        '65327'
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
        '65206'
        ''
        'T‰t‰ toimintoa ei voida suorittaa suljetulle tietokannalle')
      (
        'Cannot perform this operation on a closed dataset'
        ''
        '65278'
        ''
        'T‰t‰ toimintoa ei voi suorittaa suljetulle tietojoukolle')
      (
        'Cannot perform this operation on an active session'
        ''
        '65208'
        ''
        'T‰t‰ toimintoa ei voida suorittaa aktiiviselle sessiolle')
      (
        'Cannot perform this operation on an open database'
        ''
        '65205'
        ''
        'T‰t‰ toimintoa ei voida suorittaa avatulle tietokannalle')
      (
        'Cannot perform this operation on an open dataset'
        ''
        '65276'
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
        '65422'
        ''
        'Kanvakselle ei voi piirt‰‰')
      (
        'Caribbean'
        ''
        ''
        ''
        'Karibia')
      (
        'Circular datalinks are not allowed'
        ''
        '65273'
        ''
        'Ympyr‰datalinkit eiv‰t ole sallittuja')
      (
        'Circular variable reference for variable: %s'
        ''
        '56413'
        ''
        'Ympyr‰viittaus muuttujaan: %s')
      (
        'Class %s not found'
        ''
        '65426'
        ''
        '%s-luokkaa ei lˆytynyt')
      (
        'Clipboard does not support Icons'
        ''
        '65326'
        ''
        'Leikekirja ei tue ikoneja')
      (
        'Close the Preview Window'
        ''
        '56489'
        ''
        'Sulje esikatseluikkuna')
      (
        'Collate'
        ''
        '56420'
        ''
        'Lajittele')
      (
        'Comment:'
        ''
        ''
        ''
        'Kommentti:')
      (
        'Confirm'
        ''
        '65356'
        ''
        'Vahvista')
      (
        'Constant is not correct type %s'
        ''
        '65234'
        ''
        'Vakio ei ole oikeaa %s-tyyppi‰')
      (
        'Constant out of range'
        ''
        '65259'
        ''
        'Vakio on rajojen ulkopuolella')
      (
        'Control '#39'%s'#39' has no parent window'
        ''
        '65400'
        ''
        #39'%s'#39'-kontrollilla ei ole is‰nt‰ikkunaa')
      (
        'Control-C hit'
        ''
        '65515'
        ''
        'Kontrolli-C painettu')
      (
        'Copies'
        ''
        '56433'
        ''
        'Kopioiden m‰‰r‰')
      (
        'Could not run report, Error: 60655'
        ''
        '56406'
        ''
        'Raporttia ei voiti ajaa, virhe: 60655')
      (
        'Ctrl+'
        ''
        '65320'
        ''
        'Ctrl+')
      (
        'Current Page'
        ''
        '56440'
        ''
        'Nykyinen sivu')
      (
        
          'Data for variable: %s is not setup correctly.  Make sure all the' +
          ' properties are filled in correctly.'
        ''
        '56412'
        ''
        
          '%s-muuttujen tietoa ei ole asetettu oikein. Varmista, ett‰ kaikk' +
          'i ominaisuudet on t‰ytetty oikein.')
      (
        'Database handle owned by a different session'
        ''
        '65207'
        ''
        'Toinen sessio omista tietokannan kahvan')
      (
        'Database name missing'
        ''
        '65203'
        ''
        'Tietokantanimi puuttuu')
      (
        'Dataset not in edit or insert mode'
        ''
        '65277'
        ''
        'Tietojoukko ei ole editointi- tai lis‰ystilassa')
      (
        'DataSource cannot be changed'
        ''
        '65275'
        ''
        'DataSource:a ei voi muuttaa')
      (
        'Datatype is bad for variable: %s'
        ''
        '56414'
        ''
        '%s-muuttujan tietotyyppi on v‰‰r‰')
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
        'Del'
        ''
        '65318'
        ''
        'Del')
      (
        'Delete record'
        ''
        '65220'
        ''
        'Poista tietue')
      (
        'Delete?'
        ''
        '56404'
        ''
        'Poista?')
      (
        'Destination'
        ''
        '56423'
        ''
        'Kohde')
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
        '65306'
        ''
        'Kiinitetyll‰ kontrollilla t‰ytyy olla nimi')
      (
        'Double Click for Jump to specific page'
        ''
        '56493'
        ''
        'Kaksoisn‰p‰yt‰ hypp‰‰ksesi halutulle sivulle')
      (
        'Double Click Toolbar for Zoom Toggle between Page/100%'
        ''
        '56492'
        ''
        
          'Kaksoinn‰p‰yt‰ tyˆkalupalkkia vaihtaaksesti tarkennusta sivun ja' +
          ' 100 %:n v‰lill‰')
      (
        'Down'
        ''
        '65316'
        ''
        'Alanuoli')
      (
        'Duplicate database name '#39'%s'#39
        ''
        '65200'
        ''
        'Tietokantanimi '#39'%s'#39' ei ole yksiselitteinen')
      (
        'Duplicate field name '#39'%s'#39
        ''
        '65283'
        ''
        'Kaksi samaa kent‰n nime‰ '#39'%s'#39)
      (
        'Duplicate session name '#39'%s'#39
        ''
        '65201'
        ''
        'Sessionimi '#39'%s'#39' ei ole yksiselitteinen')
      (
        'Edit record'
        ''
        '65221'
        ''
        'Muokkaa tietuetta')
      (
        'End'
        ''
        '65343'
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
        '65365'
        ''
        'Parannetut Metatiedostot')
      (
        'Enter'
        ''
        '65339'
        ''
        'Enter')
      (
        'Error'
        ''
        '65354'
        ''
        'Virhe')
      (
        'Error creating cursor handle'
        ''
        '65209'
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
        '65398'
        ''
        'Virhe tapahtui luotaessa ikkunaluokkaa')
      (
        'Error creating window device context'
        ''
        '65397'
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
        '65307'
        ''
        'Kontrollia ei voitu poistaa kiinnityspuusta')
      (
        'Esc'
        ''
        '65338'
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
        'Poikkeus turvallisessa metodissa')
      (
        'Execute not supported: %s'
        ''
        '65244'
        ''
        'Ajo ei ole mahdollinen: %s')
      (
        'Expression expected but %s found'
        ''
        '65256'
        ''
        'Lauseketta odotettiin, mutta %s saatiin')
      (
        'Expression is not an aggregate expression'
        ''
        '65233'
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
        '65192'
        ''
        'Sarkainkontrollia ei voitu tyhj‰t‰')
      (
        'Failed to delete tab at index %d'
        ''
        '65193'
        ''
        'Sarkainta ei pystytty poistamaan indeksist‰ %d')
      (
        'Failed to get data for '#39'%s'#39
        ''
        '65301'
        ''
        'Tietoa ei voitu saada '#39'%s'#39':ta')
      (
        'Failed to get object at index %d'
        ''
        '65195'
        ''
        'Oloita eo pystytty hakemaan indeksist‰ %d')
      (
        'Failed to Load Stream'
        ''
        '65171'
        ''
        'Tietovirtaa ei voitu ladata')
      (
        'Failed to read ImageList data from stream'
        ''
        '65395'
        ''
        'Kuvalistan dataa ei voitu lukea virrasta')
      (
        'Failed to retrieve tab at index %d'
        ''
        '65194'
        ''
        'Sarkainta ei pystytty hakemaan indeksist‰ %d')
      (
        'Failed to Save Stream'
        ''
        '65172'
        ''
        'Tietovirtaan ei voitu tallettaa')
      (
        'Failed to set object at index %d'
        ''
        '65197'
        ''
        'Oliota ei pystytty asettamaan indeksiin %d')
      (
        'Failed to set tab "%s" at index %d'
        ''
        '65196'
        ''
        '"%s"-sarkainta ei pystytty asettamaan indeksiin %d')
      (
        'Failed to write ImageList data to stream'
        ''
        '65396'
        ''
        'Kuvalistan dataa ei voitu kirjoittaa virtaan')
      (
        'False'
        ''
        '65238'
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
        '65266'
        ''
        #39'%s'#39'-kentt‰ ei voi olla laskettu- tai hakukentt‰')
      (
        'Field '#39'%s'#39' cannot be modified'
        ''
        '65267'
        ''
        #39'%s'#39'-kent‰‰ ei voi muokata')
      (
        'Field '#39'%s'#39' cannot be used in a filter expression'
        ''
        '65257'
        ''
        #39'%s'#39'-kentt‰‰ ei voi k‰ytt‰‰ suotimen lausekkeessa')
      (
        'Field '#39'%s'#39' has no dataset'
        ''
        '65265'
        ''
        #39'%s'#39'-kent‰ll‰ ei ole tietojoukkoa')
      (
        'Field '#39'%s'#39' is not indexed and cannot be modified'
        ''
        '65269'
        ''
        #39'%s'#39'-kentt‰ ei ole indeksoitu eik‰ sit‰ voi muokata')
      (
        
          'Field '#39'%s'#39' is not the correct type of calculated field to be use' +
          'd in an aggregate, use an internalcalc'
        ''
        '65245'
        ''
        '')
      (
        'Field '#39'%s'#39' is of an unknown type'
        ''
        '65281'
        ''
        #39'%s'#39'-kentt‰ll‰ on tuntematon tyyppi')
      (
        'Field '#39'%s'#39' is of an unsupported type'
        ''
        '65242'
        ''
        #39'%s'#39'-tietueen tyyppi‰ ei tueta')
      (
        'Field '#39'%s'#39' must have a value'
        ''
        '65264'
        ''
        #39'%s'#39'-kent‰ll‰ t‰ytyy olla arvo')
      (
        'Field '#39'%s'#39' not found'
        ''
        '65284'
        ''
        #39'%s'#39'-kentt‰‰ ei lˆytynyt')
      (
        'Field index out of range'
        ''
        '65268'
        ''
        'Kent‰n indeksi on rajojen ulkopuolella')
      (
        'Field name missing'
        ''
        '65282'
        ''
        'Kent‰n nimi puuttuu')
      (
        'File access denied'
        ''
        '65532'
        ''
        'Tietoston k‰sittely ei ole mahdollista')
      (
        'File load error'
        ''
        '65350'
        ''
        'Tiedoston latausvirhe')
      (
        'File not found'
        ''
        '65529'
        ''
        'Tiedostoa ei lˆydy')
      (
        'Fill in the database field for TSctDbVAr: %s'
        ''
        '56411'
        ''
        'T‰yt‰ TSctDbVar-kent‰n arvo tietokantaan: %s')
      (
        'Filter expression incorrectly terminated'
        ''
        '65249'
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
        'First Page'
        ''
        '56485'
        ''
        'Ensimm‰inen sivu')
      (
        'First record'
        ''
        '65247'
        ''
        'Ensimm‰inen tietue')
      (
        'Fixed column count must be less than column count'
        ''
        '65371'
        ''
        
          'Kiinteiden sarakkeiden m‰‰r‰n on oltava v‰hemm‰n kuin v‰hemm‰n k' +
          'uin sarakkeiden kokonaism‰‰r‰n')
      (
        'Fixed row count must be less than row count'
        ''
        '65372'
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
        'From'
        ''
        '56428'
        ''
        'Mist‰')
      (
        'Generating, Please Wait ...'
        ''
        '56442'
        ''
        'Muodostan, odota hetki...')
      (
        'GoTo Page:'
        ''
        '56461'
        ''
        'Mene sivulle:')
      (
        'Grid index out of range'
        ''
        '65370'
        ''
        'Taulukon indeksi on rajojen ulkopuolella')
      (
        'Grid too large for operation'
        ''
        '65368'
        ''
        'Taulukko on liian suuri operaatiolle')
      (
        'GroupIndex cannot be less than a previous menu item'#39's GroupIndex'
        ''
        '65382'
        ''
        
          'GroupIndex ei voi olla v‰hemm‰n kuin edellisen valikon GroupInde' +
          'x')
      (
        'Home'
        ''
        '65312'
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
        '65366'
        ''
        'Ikonit')
      (
        'IN predicate list may not be empty'
        ''
        '65236'
        ''
        'IN-predikaattilista ei voi olla tyhj‰')
      (
        'Incorrectly formed filter expression'
        ''
        '65260'
        ''
        'V‰‰rin muotoiltu suodinlauseke')
      (
        'Index '#39'%s'#39' not found'
        ''
        '65272'
        ''
        #39'%s'#39'-indeksi‰ ei lˆydy')
      (
        'Index does not exist. Index: %s'
        ''
        '65184'
        ''
        'Indeksi‰ ei ole olemassa. Indeksi: %s')
      (
        'Information'
        ''
        '65355'
        ''
        'Erikois')
      (
        'Ins'
        ''
        '65317'
        ''
        'Ins')
      (
        'Insert record'
        ''
        '65219'
        ''
        'Lis‰‰ tietue')
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
        'Invalid access to totalvar: %s'
        ''
        '56415'
        ''
        'V‰‰r‰ yhteism‰‰r‰ hakuun: %s')
      (
        'Invalid alias name %s'
        ''
        '65188'
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
        '65325'
        ''
        'V‰‰r‰ leikekirjaformaatti')
      (
        'Invalid data type for '#39'%s'#39
        ''
        '65300'
        ''
        'V‰‰r‰ tietotyyppi '#39'%s'#39':lle')
      (
        'Invalid field size'
        ''
        '65311'
        ''
        'V‰‰r‰ kent‰n koko')
      (
        'Invalid FieldKind'
        ''
        '65280'
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
        '65252'
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
        '65423'
        ''
        'V‰‰r‰ kuvan koko')
      (
        'Invalid ImageList'
        ''
        '65392'
        ''
        'V‰‰r‰ kuvalistan')
      (
        'Invalid ImageList Index'
        ''
        '65394'
        ''
        'V‰‰r‰ kuvalistan indeksi')
      (
        'Invalid index'
        ''
        '65199'
        ''
        'V‰‰r‰ indeksi')
      (
        'Invalid input value'
        ''
        '65346'
        ''
        'V‰‰r‰ syˆtt‰arvo')
      (
        'Invalid input value.  Use escape key to abandon changes'
        ''
        '65347'
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
        '65348'
        ''
        'V‰‰r‰ outline-indeksi')
      (
        'Invalid owner'
        ''
        '65169'
        ''
        'V‰‰r‰ omistaja')
      (
        'Invalid pixel format'
        ''
        '65416'
        ''
        'Pikselimuoto on v‰‰r‰')
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
        '65374'
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
        '65349'
        ''
        'V‰‰r‰ valinta')
      (
        'Invalid session name %s'
        ''
        '65202'
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
        '65237'
        ''
        'Avainsanan v‰‰r‰ k‰yttˆ')
      (
        'Invalid value for current item'
        ''
        '65345'
        ''
        'Nykyisell‰ j‰senell‰ on v‰‰r‰ arvo')
      (
        'Invalid value for field '#39'%s'#39
        ''
        '65286'
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
        '65293'
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
        'JPEG error #%d'
        ''
        '65175'
        ''
        'JPEG virhe #%d')
      (
        'JPEG Image File'
        ''
        '65176'
        ''
        'JPEG-kuvatiedosto')
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
        'Jump To Page'
        ''
        '56487'
        ''
        'Siirry sivulle')
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
        'L&andscape'
        ''
        ''
        ''
        '&Vaaka')
      (
        'Last Page'
        ''
        '56486'
        ''
        'Viimeinen sivu')
      (
        'Last record'
        ''
        '65218'
        ''
        'Viimeinen tietue')
      (
        'Left'
        ''
        '65313'
        ''
        'Vasen')
      (
        'Line too long'
        ''
        '65351'
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
        '65310'
        ''
        'Listassa ei voi olla kahdennettuja ($0%x)')
      (
        'List index out of bounds (%d)'
        ''
        '65429'
        ''
        'Listan indeksi on rajojen ulkopuolella (%d)')
      (
        'Lookup information for field '#39'%s'#39' is incomplete'
        ''
        '65274'
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
        'Max'
        ''
        '56407'
        ''
        'Maksimi')
      (
        'Maximum outline depth exceeded'
        ''
        '65352'
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
        'Menu '#39'%s'#39' is already being used by another form'
        ''
        '65302'
        ''
        #39'%s'#39'-valikkoa k‰ytt‰‰ jo toinen lomake')
      (
        'Menu index out of range'
        ''
        '65405'
        ''
        'Valikon indeksi on rajojen ulkopuolella')
      (
        'Menu inserted twice'
        ''
        '65406'
        ''
        'Valikko on lis‰tty kahdesti')
      (
        'Metafile is not valid'
        ''
        '65415'
        ''
        'Metafile ei ole oikea')
      (
        'Metafiles'
        ''
        '65364'
        ''
        'Metatiedostot')
      (
        'Method '#39'%s'#39' not supported by automation object'
        ''
        '65227'
        ''
        'OLE-olio ei tue '#39'%s'#39'-metodia')
      (
        'Mi&nimize'
        ''
        ''
        ''
        '&Pienennys')
      (
        'Min'
        ''
        '56408'
        ''
        'Minimi')
      (
        'Missing DataSetField property'
        ''
        '65186'
        ''
        'DataSetField-ominaisuus puuttuu')
      (
        'Missing TableName property'
        ''
        '65185'
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
        '65198'
        ''
        
          'MultiLine:n on oltava tosi, kun TabPosition on tpLeft tai tpRigh' +
          't')
      (
        'N&o to All'
        ''
        '65334'
        ''
        '&Ei kaikkiin')
      (
        'Name:'
        'TForm1'
        'Sctvarlabel3'
        ''
        'Nimi:')
      (
        'Nested dataset must inherit from %s'
        ''
        '65248'
        ''
        'Sis‰kk‰isten tietojoukkojen pit‰‰ olla peritty %s:st‰')
      (
        'Net&work...'
        ''
        ''
        ''
        '&Verkko...')
      (
        'New Zealand'
        ''
        ''
        ''
        'Uusi-Seelanti')
      (
        'Next Page'
        ''
        '56483'
        ''
        'Seuraava sivu')
      (
        'Next record'
        ''
        '65217'
        ''
        'Seuraava tietue')
      (
        'No       - Retain partial report'
        ''
        '56451'
        ''
        'Ei       - Pid‰ osittainen raportti')
      (
        'No argument for format '#39'%s'#39
        ''
        '65489'
        ''
        #39'%s'#39'-muodossa ei ole argumenttia')
      (
        'No index for fields '#39'%s'#39
        ''
        '65271'
        ''
        #39'%s'#39'-kentille ei ole indeksi‰')
      (
        'No value for parameter '#39'%s'#39
        ''
        '65211'
        ''
        #39'%s'#39'-parametrilla ei ole arvoa')
      (
        'Not enough timers available'
        ''
        '65376'
        ''
        'Ajanottajia ei ole tarpeeksi')
      (
        'Not in cached update mode'
        ''
        '65187'
        ''
        'Ei ole v‰limuistip‰ivitystilassa')
      (
        'nothing'
        ''
        '65261'
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
        '65258'
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
        '65359'
        ''
        'OK')
      (
        'OK'
        ''
        '65385'
        ''
        'OK')
      (
        'OLE error %.8x'
        ''
        '65226'
        ''
        'OLE-virhe %.8x')
      (
        'Operation aborted'
        ''
        '65517'
        ''
        'Toiminto keskeytetty')
      (
        'Operation cannot mix aggregate value with record-varying value'
        ''
        '65263'
        ''
        
          'Operaatio ei voi sekoittaa yhdistetty‰ arvoa tietueesta saatuun ' +
          'arvoon')
      (
        'Operation not allowed on sorted string list'
        ''
        '65432'
        ''
        'Operaatiota ei voi suorittaa lajitellulle listalle')
      (
        'Operation not supported on selected printer'
        ''
        '65297'
        ''
        'Operaatio ei ole mahdollinen valitulle tulostimelle')
      (
        'Orientation'
        ''
        ''
        ''
        'Suunta')
      (
        'Out of memory'
        ''
        '65527'
        ''
        'Muisti loppui')
      (
        'Out of memory while expanding memory stream'
        ''
        '65424'
        ''
        'Muisti loppui k‰sitelt‰ess‰ tiedostovirtaa')
      (
        'Out of system resources'
        ''
        '65421'
        ''
        'J‰rjestelm‰resurssit ovat loppu')
      (
        'Outline index not found'
        ''
        '65375'
        ''
        'Outline:n indeksi‰ ei lˆytynyt')
      (
        'P&ortrait'
        ''
        ''
        ''
        '&Pysty')
      (
        'P&rinter'
        ''
        '56424'
        ''
        '&Kirjoitin')
      (
        'Page'
        'TForm1'
        'Sctvarlabel1'
        ''
        'Sivu')
      (
        'Page Movement'
        ''
        '56460'
        ''
        'Sivulla liikkuminen')
      (
        'Page:'
        ''
        '56443'
        ''
        'sivu:')
      (
        'Pages'
        ''
        '56427'
        ''
        'Pages')
      (
        'Paper'
        ''
        ''
        ''
        'Paperi')
      (
        'Parameter '#39'%s'#39' not found'
        ''
        '65240'
        ''
        #39'%s'#39'-parametri‰ ei lˆytynyt')
      (
        'Parent must be expanded'
        ''
        '65344'
        ''
        'Is‰nt‰ t‰ytyy olla laajennettu')
      (
        'PgDn'
        ''
        '65342'
        ''
        'PgDn')
      (
        'PgUp'
        ''
        '65341'
        ''
        'PgUp')
      (
        'Picture:'
        ''
        '65303'
        ''
        'Kuva:')
      (
        'Post edit'
        ''
        '65222'
        ''
        'P‰ivit‰ tietue')
      (
        'Preview'
        ''
        '65305'
        ''
        'Esikatselu')
      (
        'Previous Page'
        ''
        '56484'
        ''
        'Edellinen sivu')
      (
        'Print'
        ''
        '56478'
        ''
        'Tulosta')
      (
        'Print Setup'
        ''
        ''
        ''
        'Kirjoittimen asetukset')
      (
        'Print Status'
        ''
        '56445'
        ''
        'Tulostuksen tila')
      (
        'Printer'
        ''
        ''
        ''
        'Kirjoitin')
      (
        'Printer &Setup'
        ''
        '56432'
        ''
        '&Kirjotinasetukset')
      (
        'Printer index out of range'
        ''
        '65379'
        ''
        'Tulostimen indeksi on rajojen ulkopuolella')
      (
        'Printer is not currently printing'
        ''
        '65377'
        ''
        'Tulostin ei ole tulostamassa')
      (
        'Printer selected is not valid'
        ''
        '65380'
        ''
        'Valittu tulostin ei ole oikea')
      (
        'PrinterSetup'
        ''
        '56477'
        ''
        'Tulostimen asetus')
      (
        'Printing in progress'
        ''
        '65378'
        ''
        'Tulostus k‰ynniss‰')
      (
        'Printing, Please Wait...'
        ''
        '56441'
        ''
        'Tulosta, odota hetki...')
      (
        'Prior record'
        ''
        '65216'
        ''
        'Edellinen tietue')
      (
        'Privileged instruction'
        ''
        '65516'
        ''
        'Suojattu k‰sky')
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
        'Range'
        ''
        '56422'
        ''
        'Alue')
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
        '65246'
        ''
        'Toinen k‰ytt‰j‰ on muuttanut tietuetta')
      (
        'Record not found'
        ''
        '65225'
        ''
        'Tietuetta ei lˆytynyt')
      (
        'ReferenceTableName not specified for field '#39'%s'#39
        ''
        '65210'
        ''
        'ReferenceTableName:‰ ei ole m‰‰ritelty '#39'%s'#39'-kent‰lle')
      (
        'Refresh data'
        ''
        '65224'
        ''
        'Refresh Data')
      (
        'Report Destination'
        ''
        '56421'
        ''
        'Raportin kohde')
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
        'RichEdit line insertion error'
        ''
        '65170'
        ''
        'RichEdit-rivin lis‰ysvirhe')
      (
        'Right'
        ''
        '65315'
        ''
        'Oikea')
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
        'Scan line index out of range'
        ''
        '65417'
        ''
        'Luotausrivin indeksi on rajojen ulkopuolella')
      (
        'Scr&een'
        ''
        '56425'
        ''
        '&N‰yttˆ')
      (
        'Select Language'
        ''
        ''
        ''
        'Valitse kieli')
      (
        'Send To Printer, Right-Click to skip prompt'
        ''
        '56490'
        ''
        'L‰het‰ tulostimelle, n‰ps‰yt‰ oikealla ohittaaksesi kehotteen')
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
        '65204'
        ''
        'Sessionimi puuttuu')
      (
        'Shift+'
        ''
        '65319'
        ''
        'Vaihto+')
      (
        'Si&ze:'
        ''
        ''
        ''
        '&Koko:')
      (
        'Size mismatch for field '#39'%s'#39', expecting: %d actual: %d'
        ''
        '65292'
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
        '65340'
        ''
        'Space')
      (
        'SQL not supported: %s'
        ''
        '65243'
        ''
        'SQL ei ole mahdollinen: %s')
      (
        'Stack overflow'
        ''
        '65514'
        ''
        'Pinon ylivuoto')
      (
        'Status:'
        ''
        ''
        ''
        'Tila:')
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
        '65407'
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
        'Tab'
        ''
        '65337'
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
        'Text exceeds memo capacity'
        ''
        '65296'
        ''
        'Teksti ylitt‰‰ muistion kapasiteetin')
      (
        
          'The DataSource property on the TSctGroupPage component is not fi' +
          'lled in.  You need to set this property to let the report know w' +
          'hat database to skip thru.  Right click the glasses button, this' +
          ' selects the TSctGroupPage component.'
        ''
        '56400'
        ''
        
          'TSctGroupPage-komponentin DataSource-ominaisuus on tyhj‰. T‰yt‰ ' +
          't‰m‰ ominaisuus, jotta raportti tiet‰‰ mit‰ tietokantaa k‰sitell' +
          '‰. Klikkaa oikealla silm‰lasipainiketta valitaksesi TSctGroupPag' +
          'e-komponentin.')
      (
        'The printer is busy, please wait.'
        ''
        '56405'
        ''
        'Tulostus on kesken. Odota hetki...')
      (
        
          'The transaction isolation level must be dirty read for local dat' +
          'abases'
        ''
        '65191'
        ''
        
          'Paikallistn tietokantojen tapahtuman eristystaso on oltava "lika' +
          'inen luku"')
      (
        'There is no default printer currently selected'
        ''
        '65298'
        ''
        'Oletustulostinta ei ole valittu')
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
        'To'
        ''
        '56429'
        ''
        'Minne')
      (
        'Too many open files'
        ''
        '65531'
        ''
        'Liian monta avoinna olevaa tiedostoa')
      (
        'Too many rows or columns deleted'
        ''
        '65369'
        ''
        'Liian monta rivi tai saraketta poistettu')
      (
        'Trinidad y Tobago'
        ''
        ''
        ''
        'Trinidad ja Tobago')
      (
        'True'
        ''
        '65239'
        ''
        'tosi')
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
        'Two Pa&ge'
        ''
        '56482'
        ''
        '&Kaksi sivua')
      (
        'Type mismatch for field '#39'%s'#39', expecting: %s actual: %s'
        ''
        '65291'
        ''
        #39'%s'#39'-kent‰n tyyppi ei t‰sm‰‰, oletettiin: %s, on: %s')
      (
        'Type mismatch in expression'
        ''
        '65262'
        ''
        'Lausekkeen tyypit eiv‰t t‰sm‰‰')
      (
        'Type:'
        ''
        ''
        ''
        'Tyyppi:')
      (
        'Unable to insert a line'
        ''
        '65324'
        ''
        'Rivi‰ ei voitu lis‰t‰')
      (
        'Unable to insert an item'
        ''
        '65168'
        ''
        'J‰sent‰ ei voitu lis‰t‰')
      (
        'Unable to load bind parameters'
        ''
        '65241'
        ''
        'Sidontaparametrej‰ ei voinnut ladata')
      (
        'Unable to Replace Image'
        ''
        '65393'
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
        'Unknown picture file extension (.%s)'
        ''
        '65419'
        ''
        'Tuntematon kuvatiedoston jatke (.%s)')
      (
        'Unsupported clipboard format'
        ''
        '65420'
        ''
        'Leikekirjaformaattia ei tueta')
      (
        'Unterminated field name'
        ''
        '65250'
        ''
        'Kent‰ nime‰ ei ole p‰‰tetty')
      (
        'Unterminated string constant'
        ''
        '65251'
        ''
        'Merkkijonovakiota ei ole p‰‰tetty')
      (
        'Untitled Application'
        ''
        '65190'
        ''
        '(nimetˆn)')
      (
        'Up'
        ''
        '65314'
        ''
        'Ylˆs')
      (
        'Value of field '#39'%s'#39' is out of range'
        ''
        '65294'
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
        '65228'
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
        '65353'
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
        'Where:'
        ''
        ''
        ''
        'Where:')
      (
        'Win32 Error.  Code: %d.'#10'%s'
        ''
        '65474'
        ''
        'Win32-virhe.  Koodi: %d.'#10'%s')
      (
        'Write'
        ''
        '65494'
        ''
        'Kirjoitus')
      (
        'Yes      - Discard Report'
        ''
        '56450'
        ''
        'Kyll‰    - Hylk‰‰ raportti')
      (
        'Yes to &All'
        ''
        '65335'
        ''
        '&Kyll‰ kaikkiin')
      (
        
          'You are not allowed to delete a band outside of the page manager' +
          '.'
        ''
        '56402'
        ''
        'Sivuhallinnan ulkopuolella olevaa lohkoa ei voi poistaa.')
      (
        
          'You are not allowed to delete a group outside of the page manage' +
          'r'
        ''
        '56401'
        ''
        'Sivuhallinnan ulkopuolella olevaa ryhm‰‰ ei voi poistaa.')
      (
        'You cannot delete this Group Page'
        ''
        '56410'
        ''
        'T‰t‰ sivuryhm‰‰ ei voi poistaa')
      (
        'You cannot delete this page'
        ''
        '56409'
        ''
        'T‰t‰ sivua ei voi poistaa')
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
  object IvDialogModule1: TIvDialogModule
    Left = 584
    Top = 72
  end
end
