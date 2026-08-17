object MainForm: TMainForm
  Left = 244
  Top = 215
  Width = 677
  Height = 527
  Caption = 'Multilingual Report'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 8
    Top = 40
    Width = 816
    Height = 1056
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = QuickRep1BeforePrint
    DataSet = Table1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    OnPreview = QuickRep1Preview
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Letter
    Page.Values = (
      100
      2794
      100
      2159
      100
      100
      0)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = First
    PrintIfEmpty = False
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object DetailBand1: TQRBand
      Left = 38
      Top = 38
      Width = 740
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333
        1957.91666666667)
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 104
        Top = 8
        Width = 61
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          275.166666666667
          21.1666666666667
          161.395833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = Table1
        DataField = 'FirstName'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 8
        Top = 8
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          21.1666666666667
          121.708333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Person:'
        Color = clWhite
        OnPrint = QRLabel1Print
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 192
        Top = 8
        Width = 60
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          508
          21.1666666666667
          158.75)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = Table1
        DataField = 'LastName'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRSysData1: TQRSysData
      Left = 272
      Top = 16
      Width = 80
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        719.666666666667
        42.3333333333333
        211.666666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      Color = clWhite
      Data = qrsPageNumber
      Text = 'Page '
      Transparent = False
      FontSize = 10
    end
  end
  object PreviewButton: TButton
    Left = 104
    Top = 8
    Width = 89
    Height = 25
    Caption = '&Preview...'
    TabOrder = 1
    OnClick = PreviewButtonClick
  end
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
    Left = 200
    Top = 8
    Width = 89
    Height = 25
    Caption = '&Report...'
    TabOrder = 3
    OnClick = ReportButtonClick
  end
  object Table1: TTable
    Active = True
    TableName = '..\sample.DB'
    Left = 336
    Top = 8
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    CharsetChange = ivccAll
    Left = 368
    Top = 8
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
    FileName = 'test.mld'
    Storage = ivsEmbedded
    Left = 400
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
      512
      (
        ' - Dock zone has no control'
        ''
        '65303'
        ''
        ' - kiinnitysalueella ei ole yht‰‰n kontrollia')
      (
        ' - Dock zone not found'
        ''
        '65302'
        ''
        ' - kiinnitysaluetta ei lˆytynyt')
      (
        ' Completed'
        ''
        '65126'
        ''
        '')
      (
        
          '%d is an invalid PageIndex value.  PageIndex must be between 0 a' +
          'nd %d'
        ''
        '65186'
        ''
        
          '%d on v‰‰r‰ PageIndex:n arvo. PageIndex pit‰‰ olla 0:n ja %d:n v' +
          '‰lill‰')
      (
        
          '%g is not a valid value for field '#39'%s'#39'. The allowed range is %g ' +
          'to %g'
        ''
        '65281'
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
        '65283'
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
        '65284'
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
        '65282'
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
        '65379'
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
        '65328'
        ''
        '&Keskeyt‰')
      (
        '&All'
        ''
        '65331'
        ''
        '&Kaikki')
      (
        '&All'
        ''
        '65360'
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
        '65388'
        ''
        '&Sulje')
      (
        '&Help'
        ''
        '65359'
        ''
        '&Ohje')
      (
        '&Help'
        ''
        '65387'
        ''
        '&Ohje')
      (
        '&Ignore'
        ''
        '65330'
        ''
        '&Ohita')
      (
        '&Ignore'
        ''
        '65389'
        ''
        '&Ohita')
      (
        '&Language...'
        'TMainForm'
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
        '65356'
        ''
        '&Ei')
      (
        '&No'
        ''
        '65386'
        ''
        '&Ei')
      (
        '&Preview...'
        'TMainForm'
        'PreviewButton'
        ''
        '&Esikatselu...')
      (
        '&Report...'
        'TMainForm'
        'ReportButton'
        ''
        '&Raportti....')
      (
        '&Restore'
        ''
        ''
        ''
        '&Palauta')
      (
        '&Retry'
        ''
        '65329'
        ''
        '&Uudestaan')
      (
        '&Retry'
        ''
        '65390'
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
        '65355'
        ''
        '&Kyll‰')
      (
        '&Yes'
        ''
        '65385'
        ''
        '&Kyll‰')
      (
        #39'('#39' expected but %s found'
        ''
        '65278'
        ''
        #39'('#39':‰ odotettiin, mutta %s saatiin')
      (
        '(Overflow)'
        ''
        '65289'
        ''
        '(ylivuoto)')
      (
        #39')'#39' expected but %s found'
        ''
        '65279'
        ''
        #39')'#39':‰ odotettiin, mutta %s saatiin')
      (
        #39')'#39' or '#39','#39' expected but %s found'
        ''
        '65248'
        ''
        #39')'#39':‰ tai '#39','#39':‰ odotettiin, mutta %s saatiin')
      (
        '100%'
        ''
        ''
        ''
        '100%')
      (
        '10x14 in'
        ''
        '65171'
        ''
        '')
      (
        '11x17 in'
        ''
        '65172'
        ''
        '')
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
        '65382'
        ''
        'Kontrollin is‰nt‰ ei voi olla kontrolli itse')
      (
        'A Win32 API function failed'
        ''
        '65475'
        ''
        'Win32API-functio ep‰onnistui')
      (
        'A3 297 x 420 mm'
        ''
        '65195'
        ''
        '')
      (
        'A4 210 x 297 mm'
        ''
        '65196'
        ''
        '')
      (
        'A4 Small 210 x 297 mm'
        ''
        '65197'
        ''
        '')
      (
        'A5 148 x 210 mm'
        ''
        '65198'
        ''
        '')
      (
        'Abort'
        ''
        '65391'
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
        'add'
        ''
        '65118'
        ''
        'Lis‰‰ loppuun')
      (
        'Aggregate expressions not allowed in filters'
        ''
        '65260'
        ''
        'Yhdistetyt lausekkeet eiv‰t ole mahdollisia suotimissa')
      (
        'Alt+'
        ''
        '65319'
        ''
        '')
      (
        
          'An error occurred while attempting to initialize the Borland Dat' +
          'abase Engine (error $%.4x)'
        ''
        '65229'
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
        'Argument %d - logical value'
        ''
        '65077'
        ''
        '')
      (
        'Argument %d - numeric value'
        ''
        '65076'
        ''
        '')
      (
        'Argument %d - text Value'
        ''
        '65078'
        ''
        '')
      (
        'Argument %d - value'
        ''
        '65079'
        ''
        '')
      (
        'Arithmetic in filter expressions not supported'
        ''
        '65257'
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
        'B4 250 x 354 mm'
        ''
        '65199'
        ''
        '')
      (
        'B5 182 x 257 mm'
        ''
        '65168'
        ''
        '')
      (
        'BDE error $%.4x'
        ''
        '65231'
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
        '65365'
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
        '65334'
        ''
        '')
      (
        'boolean'
        ''
        '65090'
        ''
        '')
      (
        'boolean value'
        ''
        '65107'
        ''
        '')
      (
        'C size sheet'
        ''
        '65179'
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
        '65358'
        ''
        'Peruuta')
      (
        'Cancel'
        ''
        '65384'
        ''
        'Peruuta')
      (
        'Cannot %s %s expressions'
        ''
        '65117'
        ''
        '')
      (
        'Cannot access field '#39'%s'#39' as type %s'
        ''
        '65311'
        ''
        #39'%s'#39'-kentt‰‰ ei voitu k‰sitell‰ %s-tyyppin‰')
      (
        'Cannot access field '#39'%s'#39' in a filter'
        ''
        '65205'
        ''
        '"%s"-kentt‰‰n ei ole p‰‰sy‰')
      (
        'Cannot access index field '#39'%s'#39
        ''
        '65264'
        ''
        'Indeksin kentt‰ puuttuu')
      (
        
          'Cannot add a session to the form or data-module while session '#39'%' +
          's'#39' has AutoSessionName enabled'
        ''
        '65245'
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
        '65228'
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
        '65381'
        ''
        
          'Lomaketta ei voitu luoda. Yht‰‰n MDI-lomaketta ei ole aktiivisen' +
          'a')
      (
        'Cannot divide by 0'
        ''
        '65093'
        ''
        '')
      (
        'Cannot drag a form'
        ''
        '65361'
        ''
        'Lomaketta ei voi vet‰‰')
      (
        
          'Cannot enable AutoSessionName property with more than one sessio' +
          'n on a form or data-module'
        ''
        '65244'
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
        '65371'
        ''
        'Revej‰ ei voi poistaa tai lis‰t‰ taulukkoon')
      (
        'Cannot make a visible window modal'
        ''
        '65401'
        ''
        'N‰kyv‰‰ ikkunaa ei voi tehd‰ modaaliksi')
      (
        'Cannot modify SessionName while AutoSessionName is enabled'
        ''
        '65246'
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
        '65221'
        ''
        'Toimintoa ei voida suorittaa: tietokanta ei ole auki')
      (
        'Cannot perform this operation on a closed dataset'
        ''
        '65272'
        ''
        'Tiedosto suljettu')
      (
        'Cannot perform this operation on an active session'
        ''
        '65223'
        ''
        'T‰t‰ toimintoa ei voida suorittaa aktiiviselle sessiolle')
      (
        'Cannot perform this operation on an open database'
        ''
        '65220'
        ''
        'Toimintoa ei voida suorittaa: tietokanta on auki')
      (
        'Cannot perform this operation on an open dataset'
        ''
        '65270'
        ''
        'Tiedostoavaus')
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
        'Caribbean'
        ''
        ''
        ''
        'Karibia')
      (
        'Child'
        ''
        '65161'
        ''
        '')
      (
        'ChildBand'
        ''
        '65140'
        ''
        '')
      (
        'Circular datalinks are not allowed'
        ''
        '65267'
        ''
        'DataLink:n ympyr‰viittaus')
      (
        'Circular linking not allowed'
        ''
        '65112'
        ''
        '')
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
        'Column Header'
        ''
        '65159'
        ''
        '')
      (
        'ColumnHeaderBand'
        ''
        '65138'
        ''
        '')
      (
        'Confirm'
        ''
        '65354'
        ''
        'Vahvista')
      (
        'Constant is not correct type %s'
        ''
        '65259'
        ''
        'Vakio ei ole oikeaa %s-tyyppi‰')
      (
        'Constant out of range'
        ''
        '65252'
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
        'Conversion error'
        ''
        '65084'
        ''
        '')
      (
        'Convert a numeric <X> to a string'
        ''
        '65129'
        ''
        '')
      (
        'Converts a string to lower case letters'
        ''
        '65114'
        ''
        '')
      (
        'Converts a string to upper case letters'
        ''
        '65113'
        ''
        '')
      (
        'Ctrl+'
        ''
        '65318'
        ''
        'Ctrl+')
      (
        'Custom Size'
        ''
        '65182'
        ''
        '')
      (
        'D size sheet'
        ''
        '65180'
        ''
        '')
      (
        'Database handle owned by a different session'
        ''
        '65222'
        ''
        'Toinen sessio omista tietokannan kahvan')
      (
        'Database name missing'
        ''
        '65218'
        ''
        'Tietokanna nimi puuttuu')
      (
        'Dataset not in edit or insert mode'
        ''
        '65271'
        ''
        'Muokkaus ei ole p‰‰ll‰')
      (
        'DataSource cannot be changed'
        ''
        '65269'
        ''
        'DataSource:a ei voi muuttaa')
      (
        'Date'
        ''
        '65149'
        ''
        '')
      (
        'Date/Time'
        ''
        '65150'
        ''
        '')
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
        'Default size'
        ''
        '65187'
        ''
        '')
      (
        'Del'
        ''
        '65316'
        ''
        '')
      (
        'Detail'
        ''
        '65153'
        ''
        '')
      (
        'Detail count'
        ''
        '65121'
        ''
        '')
      (
        'Detail no'
        ''
        '65122'
        ''
        '')
      (
        'DetailBand'
        ''
        '65164'
        ''
        '')
      (
        'Disk full'
        ''
        '65534'
        ''
        'Levy on t‰ynn‰')
      (
        'divide'
        ''
        '65089'
        ''
        'Jaa')
      (
        'Division by zero'
        ''
        '65504'
        ''
        'Nollalla jako')
      (
        'Division by Zero'
        ''
        '65085'
        ''
        'Nollalla jako')
      (
        'Docked control must have a name'
        ''
        '65300'
        ''
        'Kiinitetyll‰ kontrollilla t‰ytyy olla nimi')
      (
        'Down'
        ''
        '65314'
        ''
        'Alas')
      (
        'Duplicate database name '#39'%s'#39
        ''
        '65247'
        ''
        'Tietokantanimi '#39'%s'#39' ei ole yksiselitteinen')
      (
        'Duplicate field name '#39'%s'#39
        ''
        '65309'
        ''
        'Kaksi samaa kent‰n nime‰ '#39'%s'#39)
      (
        'Duplicate session name '#39'%s'#39
        ''
        '65216'
        ''
        'Sessionimi '#39'%s'#39' ei ole yksiselitteinen')
      (
        'E size sheet'
        ''
        '65181'
        ''
        '')
      (
        'End'
        ''
        '65341'
        ''
        'loppu')
      (
        'English'
        ''
        ''
        ''
        'englanti')
      (
        'Enhanced Metafiles'
        ''
        '65363'
        ''
        'Parannetut Metatiedostot')
      (
        'Enter'
        ''
        '65337'
        ''
        '')
      (
        'Enter %d. parameter for %s'
        ''
        '65080'
        ''
        '')
      (
        'Envelope #10 4 1/8 x 9 1/2'
        ''
        '65175'
        ''
        '')
      (
        'Envelope #11 4 1/2 x 10 3/8'
        ''
        '65176'
        ''
        '')
      (
        'Envelope #12 4 \276 x 11'
        ''
        '65177'
        ''
        '')
      (
        'Envelope #14 4 \276 x 11'
        ''
        '65178'
        ''
        '')
      (
        'Envelope #9 3 7/8 x 8 7/8'
        ''
        '65174'
        ''
        '')
      (
        'Error'
        ''
        '65352'
        ''
        'Virhe')
      (
        'Error creating cursor handle'
        ''
        '65224'
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
        'Error in expression : %s'
        ''
        '65099'
        ''
        '')
      (
        'Error reading %s%s%s: %s'
        ''
        '65411'
        ''
        'Virhe lukiessa %s%s%s: %s')
      (
        'Error removing control from dock tree'
        ''
        '65301'
        ''
        'Kontrollia ei voitu poistaa kiinnityspuusta')
      (
        'ERROR: '
        ''
        '65081'
        ''
        '')
      (
        'Esc'
        ''
        '65336'
        ''
        '')
      (
        'Evaluator not prepared'
        ''
        '65074'
        ''
        '')
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
        'Poikkeus turvallisessa kutsussa')
      (
        'Execute not supported: %s'
        ''
        '65237'
        ''
        'Ruorotusta ei tueta: %s')
      (
        'Executive7 1/2 x 10 in'
        ''
        '65194'
        ''
        '')
      (
        'Expression'
        ''
        '65147'
        ''
        'Lauseke')
      (
        'Expression expected but %s found'
        ''
        '65249'
        ''
        'Lauseketta odotettiin, mutta %s saatiin')
      (
        'Expression is not an aggregate expression'
        ''
        '65258'
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
        '65208'
        ''
        'Sarkainkontrollia ei voitu tyhj‰t‰')
      (
        'Failed to delete tab at index %d'
        ''
        '65209'
        ''
        'Sarkainta ei pystytty poistamaan indeksist‰ %d')
      (
        'Failed to get data for '#39'%s'#39
        ''
        '65298'
        ''
        'Tietoa ei voitu saada '#39'%s'#39':ta')
      (
        'Failed to get object at index %d'
        ''
        '65211'
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
        '65210'
        ''
        'Sarkainta ei pystytty hakemaan indeksist‰ %d')
      (
        'Failed to set object at index %d'
        ''
        '65213'
        ''
        'Oliota ei pystytty asettamaan indeksiin %d')
      (
        'Failed to set tab "%s" at index %d'
        ''
        '65212'
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
        '65073'
        ''
        'ep‰tosi')
      (
        'False'
        ''
        '65263'
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
        '65292'
        ''
        #39'%s'#39'-kentt‰ ei voi olla laskettu- tai hakukentt‰')
      (
        'Field '#39'%s'#39' cannot be modified'
        ''
        '65293'
        ''
        '"%s"-kentt‰‰ voidaan vain lukea')
      (
        'Field '#39'%s'#39' cannot be used in a filter expression'
        ''
        '65250'
        ''
        #39'%s'#39'-kentt‰‰ ei voi k‰ytt‰‰ suotimen lausekkeessa')
      (
        'Field '#39'%s'#39' has no dataset'
        ''
        '65291'
        ''
        #39'%s'#39'-kent‰ll‰ ei ole tiedostoa')
      (
        'Field '#39'%s'#39' is not indexed and cannot be modified'
        ''
        '65295'
        ''
        #39'%s'#39'-kentt‰ ei ole indeksoitu eik‰ sit‰ voi muokata')
      (
        
          'Field '#39'%s'#39' is not the correct type of calculated field to be use' +
          'd in an aggregate, use an internalcalc'
        ''
        '65238'
        ''
        
          #39'%s'#39'-kentt‰ ei ole oikean tyyppinen laskettu kentt‰, jotta sit‰ ' +
          'voitaisiin k‰ytt‰‰ tyypinmuutokseen - k‰yt‰ sis‰ist‰ laskentaa')
      (
        'Field '#39'%s'#39' is of an unknown type'
        ''
        '65307'
        ''
        #39'%s'#39'-kentt‰ll‰ on tuntematon tyyppi')
      (
        'Field '#39'%s'#39' is of an unsupported type'
        ''
        '65235'
        ''
        #39'%s'#39'-kentt‰ on tukematonta tyyppi‰')
      (
        'Field %s is of unknown type'
        ''
        '65095'
        ''
        '')
      (
        'Field '#39'%s'#39' must have a value'
        ''
        '65290'
        ''
        #39'%s'#39'-kent‰ll‰ t‰ytyy olla arvo')
      (
        'Field '#39'%s'#39' not found'
        ''
        '65310'
        ''
        '%0:s: "%1:s"-kentt‰‰ ei lˆydy')
      (
        'Field index out of range'
        ''
        '65294'
        ''
        'Kent‰n indeksi on rajojen ulkopuolella')
      (
        'Field name missing'
        ''
        '65308'
        ''
        'Kent‰n nimi puuttuu')
      (
        'File access denied'
        ''
        '65532'
        ''
        'Tietoston k‰sittely ei ole mahdollista')
      (
        'File does not exist'
        ''
        '65125'
        ''
        '')
      (
        'File load error'
        ''
        '65348'
        ''
        'Tiedoston latausvirhe')
      (
        'File not found'
        ''
        '65529'
        ''
        'Tiedostoa ei lˆytynyt')
      (
        'Filter expression incorrectly terminated'
        ''
        '65274'
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
        'First page'
        ''
        ''
        ''
        'Ensimm‰inen sivu')
      (
        'Fixed column count must be less than column count'
        ''
        '65369'
        ''
        
          'Kiinteiden sarakkeiden m‰‰r‰n on oltava v‰hemm‰n kuin v‰hemm‰n k' +
          'uin sarakkeiden kokonaism‰‰r‰n')
      (
        'Fixed row count must be less than row count'
        ''
        '65370'
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
        'Folio 8 1/2 x 13 in'
        ''
        '65169'
        ''
        '')
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
        'Formats numeric <N> using the mask in <F>'
        ''
        '65116'
        ''
        '')
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
        'Grid index out of range'
        ''
        '65368'
        ''
        'Taulukon indeksi on rajojen ulkopuolella')
      (
        'Grid too large for operation'
        ''
        '65366'
        ''
        'Taulukko on liian suuri operaatiolle')
      (
        'Group Footer'
        ''
        '65157'
        ''
        '')
      (
        'Group Header'
        ''
        '65156'
        ''
        '')
      (
        'GroupFooterBand'
        ''
        '65136'
        ''
        '')
      (
        'GroupHeaderBand'
        ''
        '65167'
        ''
        '')
      (
        'GroupIndex cannot be less than a previous menu item'#39's GroupIndex'
        ''
        '65380'
        ''
        
          'GroupIndex ei voi olla v‰hemm‰n kuin edellisen valikon GroupInde' +
          'x')
      (
        'Home'
        ''
        '65342'
        ''
        '')
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
        '65364'
        ''
        'Ikonit')
      (
        'Illegal call to NewPage'
        ''
        '65145'
        ''
        '')
      (
        'Illegal character in numeric contant "%s"'
        ''
        '65096'
        ''
        '')
      (
        'IN predicate list may not be empty'
        ''
        '65261'
        ''
        'IN-predikaattilista ei voi olla tyhj‰')
      (
        'Incorrectly formed filter expression'
        ''
        '65253'
        ''
        'V‰‰rin muotoiltu suodinlauseke')
      (
        'Increments for each iteration'
        ''
        '65135'
        ''
        '')
      (
        'Index '#39'%s'#39' not found'
        ''
        '65266'
        ''
        #39'%s'#39'-indeksi‰ ei lˆydy')
      (
        'Index does not exist. Index: %s'
        ''
        '65200'
        ''
        'Indeksi‰ ei ole olemassa. Indeksi: %s')
      (
        'Information'
        ''
        '65353'
        ''
        'Tiedotus')
      (
        'Ins'
        ''
        '65315'
        ''
        '')
      (
        'Integer division of <X> by <Y>'
        ''
        '65134'
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
        '65204'
        ''
        'Aliasnimi %s on v‰‰r‰')
      (
        'Invalid argument to date encode'
        ''
        '65526'
        ''
        'V‰‰r‰t arvot p‰iv‰m‰‰r‰n koodauksessa')
      (
        'Invalid argument to SQRT function'
        ''
        '65087'
        ''
        '')
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
        '65305'
        ''
        'V‰‰r‰ kent‰n koko')
      (
        'Invalid FieldKind'
        ''
        '65306'
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
        '65277'
        ''
        'V‰‰r‰ suodinlausekkeen merkki: '#39'%s'#39)
      (
        'Invalid floating point operation'
        ''
        '65507'
        ''
        'V‰‰r‰ luikulukuoperaatio')
      (
        'Invalid format or value specified'
        ''
        '65086'
        ''
        '')
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
        '65215'
        ''
        'V‰‰r‰ indeksi')
      (
        'Invalid input value'
        ''
        '65344'
        ''
        'V‰‰r‰ syˆtt‰arvo')
      (
        'Invalid input value.  Use escape key to abandon changes'
        ''
        '65345'
        ''
        'V‰‰r‰ syˆttˆarvo. K‰yt‰ Esc-n‰pp‰int‰ peruaksesi muutokset')
      (
        'Invalid numeric input'
        ''
        '65535'
        ''
        'V‰‰r‰ numeerinen syˆttˆ')
      (
        'Invalid operation on TOleGraphic'
        ''
        '65417'
        ''
        'V‰‰r‰ operaatio TOleGraphic:lle')
      (
        'Invalid outline index'
        ''
        '65346'
        ''
        'V‰‰r‰ outline-indeksi')
      (
        'Invalid owner'
        ''
        '65185'
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
        '65372'
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
        '65347'
        ''
        'V‰‰r‰ valinta')
      (
        'Invalid session name %s'
        ''
        '65217'
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
        '65262'
        ''
        'Avainsanan v‰‰r‰ k‰yttˆ')
      (
        'Invalid use of NOT'
        ''
        '65056'
        ''
        '')
      (
        'Invalid value for current item'
        ''
        '65375'
        ''
        'Nykyisell‰ j‰senell‰ on v‰‰r‰ arvo')
      (
        'Invalid value for field '#39'%s'#39
        ''
        '65280'
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
        '65287'
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
        'Last page'
        ''
        ''
        ''
        'Viimeinen sivu')
      (
        'Ledger 17 x 11 in'
        ''
        '65191'
        ''
        '')
      (
        'Left'
        ''
        '65343'
        ''
        'Vasen')
      (
        'Legal 8 1/2 x 14 in'
        ''
        '65192'
        ''
        '')
      (
        'Letter 8 1/2 x 11 in'
        ''
        '65188'
        ''
        '')
      (
        'Letter Small 8 1/2 x 11 in'
        ''
        '65189'
        ''
        '')
      (
        'Line too long'
        ''
        '65349'
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
        '65304'
        ''
        'Listassa ei voi olla kahdennettuja ($0%x)')
      (
        'List index out of bounds (%d)'
        ''
        '65429'
        ''
        'Listan indeksi on rajojen ulkopuolella (%d)')
      (
        'Load report'
        ''
        '65142'
        ''
        '')
      (
        'Load Report'
        ''
        ''
        ''
        'Lataa raportti')
      (
        'Lookup information for field '#39'%s'#39' is incomplete'
        ''
        '65268'
        ''
        #39'%s'#39'-kent‰n katsontatiedot ovat ep‰t‰ydellisi‰')
      (
        'Ma&ximize'
        ''
        ''
        ''
        '&Suurennus')
      (
        'Makes the first character upper case and the rest lower case'
        ''
        '65115'
        ''
        '')
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
        'Maximum outline depth exceeded'
        ''
        '65350'
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
        '65299'
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
        'Metafile is not valid'
        ''
        '65415'
        ''
        'Metafile ei ole oikea')
      (
        'Metafiles'
        ''
        '65362'
        ''
        'Metatiedostot')
      (
        'Method '#39'%s'#39' not supported by automation object'
        ''
        '65242'
        ''
        'OLE-olio ei tue '#39'%s'#39'-metodia')
      (
        'Mi&nimize'
        ''
        ''
        ''
        '&Pienennys')
      (
        'Missing %s'
        ''
        '65097'
        ''
        '')
      (
        'Missing argument for %s'
        ''
        '65083'
        ''
        '')
      (
        'Missing DataSetField property'
        ''
        '65202'
        ''
        'DataSetField-ominaisuus puuttuu')
      (
        'Missing TableName property'
        ''
        '65201'
        ''
        'Tietueita ei voi selvitt‰‰.  Taulun nime‰ ei lˆydy.')
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
        '65214'
        ''
        
          'MultiLine:n on oltava tosi, kun TabPosition on tpLeft tai tpRigh' +
          't')
      (
        'Multilingual Report'
        'TMainForm'
        ''
        ''
        'Monikielinen raportti')
      (
        'multiply'
        ''
        '65088'
        ''
        'Kerro')
      (
        'N&o to All'
        ''
        '65332'
        ''
        '&Ei kaikkiin')
      (
        'Name'
        ''
        '65075'
        ''
        'Nimi')
      (
        'Name:'
        'TQRLabelsForm'
        'QRLabel1'
        ''
        'Nimi:')
      (
        'Nested dataset must inherit from %s'
        ''
        '65273'
        ''
        'Sis‰kk‰isten tiedostojen pit‰‰ olla peritty %s:st‰')
      (
        'New Zealand'
        ''
        ''
        ''
        'Uusi-Seelanti')
      (
        'Next page'
        ''
        ''
        ''
        'Seuraava sivu')
      (
        'No argument for format '#39'%s'#39
        ''
        '65489'
        ''
        #39'%s'#39'-muodossa ei ole argumenttia')
      (
        'No index for fields '#39'%s'#39
        ''
        '65265'
        ''
        #39'%s'#39'-kentille ei ole indeksi‰')
      (
        'No SQL statement available'
        ''
        '65226'
        ''
        'Tyhj‰ SQL-lause')
      (
        'No value for parameter '#39'%s'#39
        ''
        '65227'
        ''
        #39'%s'#39'-parametrilla ei ole arvoa')
      (
        'none'
        ''
        '65124'
        ''
        'Tyhj‰')
      (
        'Not enough timers available'
        ''
        '65406'
        ''
        'Ajanottajia ei ole tarpeeksi')
      (
        'Not in cached update mode'
        ''
        '65203'
        ''
        'Ei ole v‰limuistip‰ivitystilassa')
      (
        'Note 8 1/2 x 11 in'
        ''
        '65173'
        ''
        '')
      (
        'nothing'
        ''
        '65254'
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
        '65251'
        ''
        'NULL on sallittu vain '#39'='#39':n ja '#39'<>'#39':n kanssa')
      (
        'numeric'
        ''
        '65092'
        ''
        '')
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
        'of'
        ''
        '65144'
        ''
        'of')
      (
        'OK'
        ''
        ''
        ''
        'OK')
      (
        'OK'
        ''
        '65357'
        ''
        'OK')
      (
        'OK'
        ''
        '65383'
        ''
        'OK')
      (
        'OLE error %.8x'
        ''
        '65241'
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
        '65256'
        ''
        
          'Operaatio ei voi sekoittaa yhdistetty‰ arvoa tietueesta saatuun ' +
          'arvoon')
      (
        'Operation not allowed on sorted string list'
        ''
        '65432'
        ''
        'Tapahtuma ei ole mahdollinen lajitetuille listoille.')
      (
        'Operation not supported on selected printer'
        ''
        '65326'
        ''
        'Valittu tulostin ei tue valittua toimintoa')
      (
        'Operator %s is not compatible with %s expressions'
        ''
        '65094'
        ''
        '')
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
        '65419'
        ''
        'J‰rjestelm‰resurssit ovat loppu')
      (
        'Outline index not found'
        ''
        '65373'
        ''
        'Outline:n indeksi‰ ei lˆytynyt')
      (
        'Overlay'
        ''
        '65160'
        ''
        '')
      (
        'OverlayBand'
        ''
        '65139'
        ''
        '')
      (
        'Page'
        ''
        '65143'
        ''
        'Sivu')
      (
        'Page '
        'TMainForm'
        'QRSysData1'
        ''
        'Sivu')
      (
        'Page Footer'
        ''
        '65154'
        ''
        '')
      (
        'Page Header'
        ''
        '65152'
        ''
        '')
      (
        'Page#'
        ''
        '65151'
        ''
        '')
      (
        'PageFooterBand'
        ''
        '65165'
        ''
        '')
      (
        'PageHeaderBand'
        ''
        '65163'
        ''
        '')
      (
        'Parameter '#39'%s'#39' not found'
        ''
        '65233'
        ''
        #39'%s'#39'-parametria ei lˆytynyt')
      (
        'Parent must be expanded'
        ''
        '65374'
        ''
        'Is‰nt‰ t‰ytyy olla laajennettu')
      (
        'Person #%d:'
        ''
        ''
        ''
        'Henkilˆ #%d:')
      (
        'Person:'
        'TMainForm'
        'QRLabel1'
        ''
        'Henkilˆ:')
      (
        'PgDn'
        ''
        '65340'
        ''
        '')
      (
        'PgUp'
        ''
        '65339'
        ''
        '')
      (
        'Previous page'
        ''
        ''
        ''
        'Edellinen sivu')
      (
        'Print'
        ''
        ''
        ''
        'Tulosta')
      (
        'Print Preview'
        ''
        ''
        ''
        'Tulostuksen esikatselu')
      (
        'Printer index out of range'
        ''
        '65377'
        ''
        'Tulostimen indeksi on rajojen ulkopuolella')
      (
        'Printer is not currently printing'
        ''
        '65407'
        ''
        'Tulostin ei ole tulostamassa')
      (
        'Printer selected is not valid'
        ''
        '65378'
        ''
        'Valittu tulostin ei ole oikea')
      (
        'Printer setup'
        ''
        ''
        ''
        'Kirjotinasetukset')
      (
        'Printing in progress'
        ''
        '65376'
        ''
        'Tulostus k‰ynniss‰')
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
        'QRPrinter not ready'
        ''
        '65146'
        ''
        '')
      (
        'Quarto 215 x 275 mm'
        ''
        '65170'
        ''
        '')
      (
        'QuickReport file'
        ''
        '65127'
        ''
        '')
      (
        'QuSoft AS'
        ''
        '65123'
        ''
        '')
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
        '65239'
        ''
        'Toinen k‰ytt‰j‰ on muuttanut tietuetta')
      (
        'Record not found'
        ''
        '65240'
        ''
        'Tietuetta ei lˆytynyt')
      (
        'Recursive calls not allowed'
        ''
        '65100'
        ''
        '')
      (
        'ReferenceTableName not specified for field '#39'%s'#39
        ''
        '65225'
        ''
        'ReferenceTableName:‰ ei ole m‰‰ritelty '#39'%s'#39'-kent‰lle')
      (
        'Report title'
        ''
        '65120'
        ''
        '')
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
        '%s-resurssia ei lˆydy')
      (
        'Return current date as a string'
        ''
        '65131'
        ''
        '')
      (
        'Return current time as a string'
        ''
        '65130'
        ''
        '')
      (
        'Returns <X> or <Y> depending on the boolean expression <Exp>'
        ''
        '65128'
        ''
        '')
      (
        'Returns a substring of string X'
        ''
        '65133'
        ''
        '')
      (
        'Returns square root of <X>'
        ''
        '65110'
        ''
        '')
      (
        'Returns the average of numeric <X>'
        ''
        '65106'
        ''
        '')
      (
        'Returns the data type of <Exp>'
        ''
        '65111'
        ''
        '')
      (
        'Returns the fractional part of <X>'
        ''
        '65109'
        ''
        '')
      (
        'Returns the highest <X>'
        ''
        '65104'
        ''
        '')
      (
        'Returns the integer part of <X>'
        ''
        '65108'
        ''
        '')
      (
        'Returns the lowest <X>'
        ''
        '65105'
        ''
        '')
      (
        'Right'
        ''
        '65313'
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
        'Save report'
        ''
        '65141'
        ''
        '')
      (
        'Save Report'
        ''
        ''
        ''
        'Talleta raportti')
      (
        'Select Language'
        ''
        ''
        ''
        'Valitse kieli')
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
        '65219'
        ''
        'Sessionimi puuttuu')
      (
        'Shift+'
        ''
        '65317'
        ''
        'Vaihto+')
      (
        'Size mismatch for field '#39'%s'#39', expecting: %d actual: %d'
        ''
        '65286'
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
        '65338'
        ''
        '')
      (
        'SQL not supported: %s'
        ''
        '65236'
        ''
        'SQL:‰‰ ei tueta: %s')
      (
        'Stack overflow'
        ''
        '65514'
        ''
        'Pinon ylivuoto')
      (
        'Statement 5 1/2 x 8 1/2 in'
        ''
        '65193'
        ''
        '')
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
        'string'
        ''
        '65091'
        ''
        '')
      (
        'String list does not allow duplicates'
        ''
        '65433'
        ''
        'Merkkijonolistalla ei voi olla kahdennettuja arvoja.')
      (
        'Sub Detail'
        ''
        '65158'
        ''
        '')
      (
        'SubDetailBand'
        ''
        '65137'
        ''
        '')
      (
        'Sub-menu is not in menu'
        ''
        '65405'
        ''
        'Alivalikko ei ole valikossa')
      (
        'subtract'
        ''
        '65119'
        ''
        'V‰henn‰')
      (
        'Summary'
        ''
        '65155'
        ''
        '')
      (
        'SummaryBand'
        ''
        '65166'
        ''
        '')
      (
        'Sums the numeric <X>'
        ''
        '65132'
        ''
        '')
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
        '65335'
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
        'Tabloid 11 x 17 in'
        ''
        '65190'
        ''
        '')
      (
        'Test'
        'TQRLabelsForm'
        ''
        ''
        'Testaus')
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
        '65207'
        ''
        
          'Paikallistn tietokantojen tapahtuman eristystaso on oltava "lika' +
          'inen luku"')
      (
        'There are no errors. The result is : '
        ''
        '65082'
        ''
        '')
      (
        'There is no default printer currently selected'
        ''
        '65327'
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
        'Time'
        ''
        '65148'
        ''
        'Time')
      (
        'Title'
        ''
        '65183'
        ''
        'Otsikko')
      (
        'TitleBand'
        ''
        '65162'
        ''
        '')
      (
        'Too many arguments'
        ''
        '65101'
        ''
        '')
      (
        'Too many open files'
        ''
        '65531'
        ''
        'Liian monta avoinna olevaa tiedostoa')
      (
        'Too many rows or columns deleted'
        ''
        '65367'
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
        '65072'
        ''
        'tosi')
      (
        'True'
        ''
        '65232'
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
        'Type mismatch for field '#39'%s'#39', expecting: %s actual: %s'
        ''
        '65285'
        ''
        #39'%s'#39'-kent‰n tyyppi ei t‰sm‰‰, oletettiin: %s, on: %s')
      (
        'Type mismatch in expression'
        ''
        '65255'
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
        '65184'
        ''
        'J‰sent‰ ei voitu lis‰t‰')
      (
        'Unable to load bind parameters'
        ''
        '65234'
        ''
        'Sidontaparametrej‰ ei voitu ladata')
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
        'Unknown function : %s'
        ''
        '65098'
        ''
        '')
      (
        'Unknown type'
        ''
        '65103'
        ''
        '')
      (
        'Unsupported clipboard format'
        ''
        '65418'
        ''
        'Leikekirjaformaattia ei tueta')
      (
        'Unterminated field name'
        ''
        '65275'
        ''
        'Kent‰ nime‰ ei ole p‰‰tetty')
      (
        'Unterminated string constant'
        ''
        '65276'
        ''
        'Merkkijonovakiota ei ole p‰‰tetty')
      (
        'Untitled Application'
        ''
        '65206'
        ''
        '(nimetˆn)')
      (
        'Up'
        ''
        '65312'
        ''
        'Ylˆs')
      (
        'Value must be between %d and %d'
        ''
        '65320'
        ''
        'Arvon pit‰‰ olla %d ja %d v‰lill‰')
      (
        'Value of field '#39'%s'#39' is out of range'
        ''
        '65288'
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
        '65243'
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
        '65351'
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
        'Kirjoita')
      (
        'Wrong arguments for %s'
        ''
        '65102'
        ''
        '')
      (
        'Yes to &All'
        ''
        '65333'
        ''
        '&Kyll‰ kaikkiin')
      (
        'Zimbabwe'
        ''
        ''
        ''
        'Zimbabwe')
      (
        'Zoom to fit'
        ''
        ''
        ''
        'Aseta kohdalleen')
      (
        'Zoom to width'
        ''
        ''
        ''
        'Aseta leveys'))
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
