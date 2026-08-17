inherited rptCAFMovPatGrp: TrptCAFMovPatGrp
  Left = 224
  Top = 206
  Width = 329
  Height = 208
  Caption = 'Movimento Patrimonial por Grupo Contábil'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Movimento Patrimonial por Grupo Contábil'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Data Inicial'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = True
      end
      item
        Caption = 'Data Final'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = True
      end
      item
        Caption = 'Grupo Inicial'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CLASSE, NOME, IDGRUPO'
          'FROM GRUPO'
          'WHERE TIPO = '#39'A'#39
          'ORDER BY CLASSE')
        LookupSettings.Chave = 'IDGRUPO'
        LookupSettings.Display = 'NOME|CLASSE'
        LookupSettings.Descricao = 'Grupo Contábil|Código'
        LookupSettings.Tamanho = '40|10'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
      end
      item
        Caption = 'Grupo Final'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CLASSE, NOME, IDGRUPO'
          'FROM GRUPO'
          'WHERE TIPO = '#39'A'#39
          'ORDER BY CLASSE')
        LookupSettings.Chave = 'IDGRUPO'
        LookupSettings.Display = 'NOME|CLASSE'
        LookupSettings.Descricao = 'Grupo Contábil|Código'
        LookupSettings.Tamanho = '40|10'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
      end>
    Formheight = 172
    Left = 28
  end
  inherited DevRptCM: TExtraOptions
    Left = 152
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    DataBaseName = 'BaseDados'
    Report = rpMovPatGrp
    Left = 91
  end
  object updMovPatGrp: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPO'
      'set'
      '  CLASSE = :CLASSE,'
      '  DESCGRUPO = :DESCGRUPO,'
      '  S_A = :S_A,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  VALCTB = :VALCTB'
      'where'
      '  CLASSE = :OLD_CLASSE')
    InsertSQL.Strings = (
      'insert into GRUPO'
      
        '  (CLASSE, DESCGRUPO, S_A, VALORG, CMBEM, DEPLANC, CMDEP, VALCTB' +
        ')'
      'values'
      
        '  (:CLASSE, :DESCGRUPO, :S_A, :VALORG, :CMBEM, :DEPLANC, :CMDEP,' +
        ' :VALCTB)')
    DeleteSQL.Strings = (
      'delete from GRUPO'
      'where'
      '  CLASSE = :OLD_CLASSE')
    Left = 224
    Top = 56
  end
  object qryMovPatGrp: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CLASSE,'
      '       NOME AS DESCGRUPO,'
      '       TIPO AS S_A,'
      '       (0)  AS SLDANT,'
      '       (0)  AS DEBITOS,'
      '       (0)  AS CREDITOS,'
      '       (0)  AS SLDATU'
      'FROM GRUPO'
      'WHERE (CLASSE IS NULL)'
      'ORDER BY CLASSE'
      '')
    UpdateObject = updMovPatGrp
    ValidateWithMask = True
    Left = 224
    Top = 44
    object qryMovPatGrpCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 15
    end
    object qryMovPatGrpDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryMovPatGrpS_A: TStringField
      FieldName = 'S_A'
      Size = 1
    end
    object qryMovPatGrpSLDANT: TFloatField
      FieldName = 'SLDANT'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryMovPatGrpDEBITOS: TFloatField
      FieldName = 'DEBITOS'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryMovPatGrpCREDITOS: TFloatField
      FieldName = 'CREDITOS'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryMovPatGrpSLDATU: TFloatField
      FieldName = 'SLDATU'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
  end
  object dsMovPatGrp: TwwDataSource
    DataSet = qryMovPatGrp
    Left = 225
    Top = 32
  end
  object ppMovPatGrp: TppBDEPipeline
    DataSource = dsMovPatGrp
    UserName = 'MovPatGrp'
    Left = 225
    Top = 20
  end
  object rpMovPatGrp: TppReport
    AutoStop = False
    DataPipeline = ppMovPatGrp
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 226
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand10: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34396
      mmPrintPosition = 0
      object ppLabel69: TppLabel
        UserName = 'ppLabel69'
        AutoSize = False
        Caption = 'Movimento Patrimonial por Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 56356
        mmTop = 7673
        mmWidth = 84402
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'ppLine19'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26194
        mmWidth = 197379
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'ppLabel70'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 794
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'ppLabel71'
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 27517
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'ppLabel72'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 17992
        mmTop = 27517
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'ppLabel73'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 88106
        mmTop = 27517
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'ppLabel74'
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 98954
        mmTop = 27517
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'ppLabel75'
        Caption = 'Débitos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 134938
        mmTop = 27517
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'ppLabel76'
        Caption = 'Créditos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 159544
        mmTop = 27517
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'ppLabel77'
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 179652
        mmTop = 27517
        mmWidth = 17727
        BandType = 0
      end
      object pplbldata1: TppLabel
        UserName = 'pplbldata1'
        Caption = 'Movimentação de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 59002
        mmTop = 14817
        mmWidth = 31750
        BandType = 0
      end
      object rbLabel80: TppLabel
        UserName = 'rbLabel80'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 91811
        mmTop = 14817
        mmWidth = 21167
        BandType = 0
      end
      object rpMovPatGrpLine1: TppLine
        UserName = 'rpMovPatGrpLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 32544
        mmWidth = 197379
        BandType = 0
      end
      object rbLabel82: TppLabel
        UserName = 'rbLabel82'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 117740
        mmTop = 14817
        mmWidth = 21167
        BandType = 0
      end
      object rpMovPatGrpLabel1: TppLabel
        UserName = 'rpMovPatGrpLabel1'
        Caption = 'à'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 114300
        mmTop = 14817
        mmWidth = 2117
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rbdbeClasse: TppDBText
        UserName = 'rbdbeClasse'
        DataField = 'CLASSE'
        DataPipeline = ppMovPatGrp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'ppDBText48'
        DataField = 'DESCGRUPO'
        DataPipeline = ppMovPatGrp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17992
        mmTop = 529
        mmWidth = 68792
        BandType = 4
      end
      object ppDBText49: TppDBText
        UserName = 'ppDBText49'
        BlankWhenZero = True
        DataField = 'SLDANT'
        DataPipeline = ppMovPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 95515
        mmTop = 529
        mmWidth = 25135
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'ppDBText50'
        BlankWhenZero = True
        DataField = 'DEBITOS'
        DataPipeline = ppMovPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 121179
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'ppDBText51'
        BlankWhenZero = True
        DataField = 'CREDITOS'
        DataPipeline = ppMovPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 146844
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'ppDBText52'
        BlankWhenZero = True
        DataField = 'SLDATU'
        DataPipeline = ppMovPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 171980
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText54: TppDBText
        UserName = 'ppDBText54'
        DataField = 'S_A'
        DataPipeline = ppMovPatGrp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 87577
        mmTop = 529
        mmWidth = 7408
        BandType = 4
      end
    end
    object ppFooterBand10: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLine20: TppLine
        UserName = 'ppLine20'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197379
        BandType = 8
      end
      object ppLabel81: TppLabel
        UserName = 'ppLabel81'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2910
        mmWidth = 31750
        BandType = 8
      end
      object ppCalc19: TppSystemVariable
        UserName = 'Calc19'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 79111
        mmTop = 2910
        mmWidth = 39158
        BandType = 8
      end
      object ppCalc20: TppSystemVariable
        UserName = 'ppCalc201'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171186
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object qryGrpAnaliticos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT G.CLASSE,G.NOME AS DESCGRUPO,G.TIPO,'
      '       (('
      
        '       (DECODE(BEMANT.VALBEMANT,              NULL,0,BEMANT.VALB' +
        'EMANT) +'
      
        '        DECODE(REAVANT.VALREAVANT,            NULL,0,REAVANT.VAL' +
        'REAVANT) +'
      
        '        DECODE(ACRESANT.VALACRESANT,          NULL,0,ACRESANT.VA' +
        'LACRESANT) +'
      
        '        DECODE(CMBEMANT.VALCMBEMANT,          NULL,0,CMBEMANT.VA' +
        'LCMBEMANT) +'
      
        '        DECODE(CMREAVANT.VALCMREAVANT,        NULL,0,CMREAVANT.V' +
        'ALCMREAVANT) +'
      
        '        DECODE(CMACRESANT.VALCMACRESANT,      NULL,0,CMACRESANT.' +
        'VALCMACRESANT) ) -'
      ''
      
        '       (DECODE(DEPBEMANT.VALDEPBEMANT,        NULL,0,DEPBEMANT.V' +
        'ALDEPBEMANT) +'
      
        '        DECODE(DEPREAVANT.VALDEPREAVANT,      NULL,0,DEPREAVANT.' +
        'VALDEPREAVANT) +'
      
        '        DECODE(DEPACRESANT.VALDEPACRESANT,    NULL,0,DEPACRESANT' +
        '.VALDEPACRESANT) +'
      
        '        DECODE(CMDEPBEMANT.VALCMDEPBEMANT,    NULL,0,CMDEPBEMANT' +
        '.VALCMDEPBEMANT) +'
      
        '        DECODE(CMDEPREAVANT.VALCMDEPREAVANT,  NULL,0,CMDEPREAVAN' +
        'T.VALCMDEPREAVANT) +'
      
        '        DECODE(CMDEPACRESANT.VALCMDEPACRESANT,NULL,0,CMDEPACRESA' +
        'NT.VALCMDEPACRESANT) )'
      '       ) -'
      '       ('
      
        '       (DECODE(BXBEMANT.BXVALBEMANT,          NULL,0,BXBEMANT.BX' +
        'VALBEMANT) +'
      
        '        DECODE(BXREAVANT.BXVALREAVANT,        NULL,0,BXREAVANT.B' +
        'XVALREAVANT) +'
      
        '        DECODE(BXACRESANT.BXVALACRESANT,      NULL,0,BXACRESANT.' +
        'BXVALACRESANT) +'
      
        '        DECODE(BXCMBEMANT.BXVALCMBEMANT,      NULL,0,BXCMBEMANT.' +
        'BXVALCMBEMANT) +'
      
        '        DECODE(BXCMREAVANT.BXVALCMREAVANT,    NULL,0,BXCMREAVANT' +
        '.BXVALCMREAVANT) +'
      
        '        DECODE(BXCMACRESANT.BXVALCMACRESANT,  NULL,0,BXCMACRESAN' +
        'T.BXVALCMACRESANT) ) -'
      ''
      
        '       (DECODE(BXDEPBEMANT.BXVALDEPBEMANT,    NULL,0,BXDEPBEMANT' +
        '.BXVALDEPBEMANT) +'
      
        '        DECODE(BXDEPREAVANT.BXVALDEPREAVANT,  NULL,0,BXDEPREAVAN' +
        'T.BXVALDEPREAVANT) +'
      
        '        DECODE(BXDEPACRESANT.BXVALDEPACRESANT,NULL,0,BXDEPACRESA' +
        'NT.BXVALDEPACRESANT) +'
      
        '        DECODE(BXCMDEPBEMANT.BXVALCMDEPBEMANT,NULL,0,BXCMDEPBEMA' +
        'NT.BXVALCMDEPBEMANT) +'
      
        '        DECODE(BXCMDEPREAVANT.BXVALCMDEPREAVANT,NULL,0,BXCMDEPRE' +
        'AVANT.BXVALCMDEPREAVANT) +'
      
        '        DECODE(BXCMDEPACRESANT.BXVALCMDEPACRESANT,NULL,0,BXCMDEP' +
        'ACRESANT.BXVALCMDEPACRESANT) )'
      '       )) AS SLDANT,'
      '        ('
      
        '        DECODE(BEMATU.VALBEMATU,                      NULL,0,BEM' +
        'ATU.VALBEMATU) +'
      
        '        DECODE(ACRESATU.VALACRESATU,                  NULL,0,ACR' +
        'ESATU.VALACRESATU) +'
      
        '        DECODE(CMBEMATU.VALCMBEMATU,                  NULL,0,CMB' +
        'EMATU.VALCMBEMATU) +'
      
        '        DECODE(CMACRESATU.VALCMACRESATU,              NULL,0,CMA' +
        'CRESATU.VALCMACRESATU) +'
      
        '        DECODE(BXDEPBEMATU.BXVALDEPBEMATU,            NULL,0,BXD' +
        'EPBEMATU.BXVALDEPBEMATU) +'
      
        '        DECODE(BXDEPACRESATU.BXVALDEPACRESATU,        NULL,0,BXD' +
        'EPACRESATU.BXVALDEPACRESATU) +'
      
        '        DECODE(BXCMDEPBEMATU.BXVALCMDEPBEMATU,        NULL,0,BXC' +
        'MDEPBEMATU.BXVALCMDEPBEMATU) +'
      
        '        DECODE(BXCMDEPACRESATU.BXVALCMDEPACRESATU,    NULL,0,BXC' +
        'MDEPACRESATU.BXVALCMDEPACRESATU) +'
      
        '        DECODE(REAVPOSATU.VALREAVPOSATU,              NULL,0,REA' +
        'VPOSATU.VALREAVPOSATU) +'
      
        '        DECODE(CMREAVPOSATU.VALCMREAVPOSATU,          NULL,0,CMR' +
        'EAVPOSATU.VALCMREAVPOSATU) +'
      
        '        DECODE(DEPREAVNEGATU.VALDEPREAVNEGATU,        NULL,0,DEP' +
        'REAVNEGATU.VALDEPREAVNEGATU) +'
      
        '        DECODE(CMDEPREAVNEGATU.VALCMDEPREAVNEGATU,    NULL,0,CMD' +
        'EPREAVNEGATU.VALCMDEPREAVNEGATU) +'
      
        '        DECODE(BXREAVNEGATU.BXVALREAVNEGATU,          NULL,0,BXR' +
        'EAVNEGATU.BXVALREAVNEGATU) +'
      
        '        DECODE(BXCMREAVNEGATU.BXVALCMREAVNEGATU,      NULL,0,BXC' +
        'MREAVNEGATU.BXVALCMREAVNEGATU) +'
      
        '        DECODE(BXDEPREAVPOSATU.BXVALDEPREAVPOSATU,    NULL,0,BXD' +
        'EPREAVPOSATU.BXVALDEPREAVPOSATU) +'
      
        '        DECODE(BXCMDEPREAVPOSATU.BXVALCMDEPREAVPOSATU,NULL,0,BXC' +
        'MDEPREAVPOSATU.BXVALCMDEPREAVPOSATU)'
      '        ) AS DEBITOS,'
      '        ('
      
        '        DECODE(BXBEMATU.BXVALBEMATU,                  NULL,0,BXB' +
        'EMATU.BXVALBEMATU) +'
      
        '        DECODE(BXACRESATU.BXVALACRESATU,              NULL,0,BXA' +
        'CRESATU.BXVALACRESATU) +'
      
        '        DECODE(BXCMBEMATU.BXVALCMBEMATU,              NULL,0,BXC' +
        'MBEMATU.BXVALCMBEMATU) +'
      
        '        DECODE(BXCMACRESATU.BXVALCMACRESATU,          NULL,0,BXC' +
        'MACRESATU.BXVALCMACRESATU) +'
      
        '        DECODE(DEPBEMATU.VALDEPBEMATU,                NULL,0,DEP' +
        'BEMATU.VALDEPBEMATU) +'
      
        '        DECODE(DEPACRESATU.VALDEPACRESATU,            NULL,0,DEP' +
        'ACRESATU.VALDEPACRESATU) +'
      
        '        DECODE(CMDEPBEMATU.VALCMDEPBEMATU,            NULL,0,CMD' +
        'EPBEMATU.VALCMDEPBEMATU) +'
      
        '        DECODE(CMDEPACRESATU.VALCMDEPACRESATU,        NULL,0,CMD' +
        'EPACRESATU.VALCMDEPACRESATU) +'
      
        '        DECODE(REAVNEGATU.VALREAVNEGATU,              NULL,0,REA' +
        'VNEGATU.VALREAVNEGATU) +'
      
        '        DECODE(CMREAVNEGATU.VALCMREAVNEGATU,          NULL,0,CMR' +
        'EAVNEGATU.VALCMREAVNEGATU) +'
      
        '        DECODE(DEPREAVPOSATU.VALDEPREAVPOSATU,        NULL,0,DEP' +
        'REAVPOSATU.VALDEPREAVPOSATU) +'
      
        '        DECODE(CMDEPREAVPOSATU.VALCMDEPREAVPOSATU,    NULL,0,CMD' +
        'EPREAVPOSATU.VALCMDEPREAVPOSATU) +'
      
        '        DECODE(BXREAVPOSATU.BXVALREAVPOSATU,          NULL,0,BXR' +
        'EAVPOSATU.BXVALREAVPOSATU) +'
      
        '        DECODE(BXCMREAVPOSATU.BXVALCMREAVPOSATU,      NULL,0,BXC' +
        'MREAVPOSATU.BXVALCMREAVPOSATU) +'
      
        '        DECODE(BXDEPREAVNEGATU.BXVALDEPREAVNEGATU,    NULL,0,BXD' +
        'EPREAVNEGATU.BXVALDEPREAVNEGATU) +'
      
        '        DECODE(BXCMDEPREAVNEGATU.BXVALCMDEPREAVNEGATU,NULL,0,BXC' +
        'MDEPREAVNEGATU.BXVALCMDEPREAVNEGATU)'
      '        ) AS CREDITOS, B.PLACA'
      ''
      'FROM BEM B, GRUPO G,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALBEMANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (01,41))'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BEMANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALREAVANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (08,32,45))'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) REAVANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALACRESANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (09,49))'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ACRESANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALCMBEMANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (15,42))'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMBEMANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALCMREAVANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMREAVANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALCMACRESANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (34,50))'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMACRESANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALDEPBEMANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (14,17,43))'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPBEMANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALDEPREAVANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (18,33,47))'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPREAVANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALDEPACRESANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (35,51))'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPACRESANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALCMDEPBEMANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (21,44))'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPBEMANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALCMDEPREAVANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (19,48))'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPREAVANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALCMDEPACRESANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (36,52))'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPACRESANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALBEMANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 6)'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXBEMANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALREAVANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 20)'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXREAVANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALACRESANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 37)'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXACRESANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALCMBEMANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 25)'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMBEMANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALCMREAVANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 28)'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMREAVANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALCMACRESANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 38)'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMACRESANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALDEPBEMANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 24)'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPBEMANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALDEPREAVANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 27)'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPREAVANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALDEPACRESANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 39)'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPACRESANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALCMDEPBEMANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 26)'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPBEMANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALCMDEPREAVANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 29)'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPREAVANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALCMDEPACRESANT'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 40)'
      '      AND  (HM.DATAMOVIMENTACAO < :PDATAMOVINI)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPACRESANT,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (01,41))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BEMATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALREAVPOSATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (08,32,45))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (VM.VALOFI > 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) REAVPOSATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALREAVNEGATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (08,32,45))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (VM.VALOFI < 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) REAVNEGATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALACRESATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (09,49))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ACRESATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALCMBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (15,42))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMBEMATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALCMREAVPOSATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (VM.VALOFI > 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMREAVPOSATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALCMREAVNEGATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (VM.VALOFI < 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMREAVNEGATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALCMACRESATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (34,50))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMACRESATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALDEPBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (14,17,43))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPBEMATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALDEPREAVPOSATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (18,33,47))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (VM.VALOFI > 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPREAVPOSATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALDEPREAVNEGATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (18,33,47))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (VM.VALOFI < 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPREAVNEGATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALDEPACRESATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (35,51))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPACRESATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALCMDEPBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (21,44))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPBEMATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALCMDEPREAVPOSATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (19,48))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (VM.VALOFI > 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPREAVPOSATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALCMDEPREAVNEGATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (19,48))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (VM.VALOFI < 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPREAVNEGATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS VALCMDEPACRESATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (36,52))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPACRESATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 6)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXBEMATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALREAVPOSATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 20)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (VM.VALOFI > 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXREAVPOSATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALREAVNEGATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 20)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (VM.VALOFI < 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXREAVNEGATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALACRESATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 37)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXACRESATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALCMBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 25)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMBEMATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALCMREAVPOSATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 28)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (VM.VALOFI > 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMREAVPOSATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALCMREAVNEGATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 28)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (VM.VALOFI < 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMREAVNEGATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALCMACRESATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 38)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMACRESATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALDEPBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 24)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPBEMATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALDEPREAVPOSATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 27)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (VM.VALOFI > 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPREAVPOSATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALDEPREAVNEGATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 27)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (VM.VALOFI < 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPREAVNEGATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALDEPACRESATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 39)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPACRESATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALCMDEPBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 26)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPBEMATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALCMDEPREAVPOSATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 29)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (VM.VALOFI > 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPREAVPOSATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALCMDEPREAVNEGATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 29)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (VM.VALOFI < 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPREAVNEGATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(DECODE(VM.VALOFI,NULL,0,VM' +
        '.VALOFI)) AS BXVALCMDEPACRESATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 40)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) AND (HM.DATAMO' +
        'VIMENTACAO <= :PDATAMOVFIM))'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPACRESATU'
      ''
      
        'WHERE ((B.DATAINICIODEP <= :PDATAMOVFIM) OR (B.DATAINICIODEP IS ' +
        'NULL))'
      '     '
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (B.IDBEM = BEMANT.IDBEM(+))'
      '  AND (B.IDBEM = REAVANT.IDBEM(+))'
      '  AND (B.IDBEM = ACRESANT.IDBEM(+))'
      '  AND (B.IDBEM = CMBEMANT.IDBEM(+))'
      '  AND (B.IDBEM = DEPBEMANT.IDBEM(+))'
      '  AND (B.IDBEM = CMREAVANT.IDBEM(+))'
      '  AND (B.IDBEM = DEPREAVANT.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPBEMANT.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPREAVANT.IDBEM(+))'
      '  AND (B.IDBEM = CMACRESANT.IDBEM(+))'
      '  AND (B.IDBEM = DEPACRESANT.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPACRESANT.IDBEM(+))'
      '  AND (B.IDBEM = BXBEMANT.IDBEM(+))'
      '  AND (B.IDBEM = BXREAVANT.IDBEM(+))'
      '  AND (B.IDBEM = BXACRESANT.IDBEM(+))'
      '  AND (B.IDBEM = BXCMBEMANT.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPBEMANT.IDBEM(+))'
      '  AND (B.IDBEM = BXCMREAVANT.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPREAVANT.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPBEMANT.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPREAVANT.IDBEM(+))'
      '  AND (B.IDBEM = BXCMACRESANT.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPACRESANT.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPACRESANT.IDBEM(+))'
      '  AND (B.IDBEM = BEMATU.IDBEM(+))'
      '  AND (B.IDBEM = REAVPOSATU.IDBEM(+))'
      '  AND (B.IDBEM = REAVNEGATU.IDBEM(+))'
      '  AND (B.IDBEM = ACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = CMBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = DEPBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = CMREAVPOSATU.IDBEM(+))'
      '  AND (B.IDBEM = CMREAVNEGATU.IDBEM(+))'
      '  AND (B.IDBEM = DEPREAVPOSATU.IDBEM(+))'
      '  AND (B.IDBEM = DEPREAVNEGATU.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPREAVPOSATU.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPREAVNEGATU.IDBEM(+))'
      '  AND (B.IDBEM = CMACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = DEPACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = BXBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = BXREAVPOSATU.IDBEM(+))'
      '  AND (B.IDBEM = BXREAVNEGATU.IDBEM(+))'
      '  AND (B.IDBEM = BXACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = BXCMBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = BXCMREAVPOSATU.IDBEM(+))'
      '  AND (B.IDBEM = BXCMREAVNEGATU.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPREAVPOSATU.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPREAVNEGATU.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPREAVPOSATU.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPREAVNEGATU.IDBEM(+))'
      '  AND (B.IDBEM = BXCMACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPACRESATU.IDBEM(+))'
      ''
      'ORDER BY G.CLASSE'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 40
    Top = 64
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end>
    object qryGrpAnaliticosCLASSE: TStringField
      FieldName = 'CLASSE'
      FixedChar = True
      Size = 15
    end
    object qryGrpAnaliticosDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryGrpAnaliticosTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object qryGrpAnaliticosSLDANT: TFloatField
      FieldName = 'SLDANT'
    end
    object qryGrpAnaliticosDEBITOS: TFloatField
      FieldName = 'DEBITOS'
    end
    object qryGrpAnaliticosCREDITOS: TFloatField
      FieldName = 'CREDITOS'
    end
    object qryGrpAnaliticosPLACA: TFloatField
      FieldName = 'PLACA'
    end
  end
  object qryGrpSinteticos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CLASSE, NOME'
      'FROM GRUPO'
      'WHERE (TIPO = '#39'S'#39')'
      'ORDER BY CLASSE'
      ''
      '')
    ValidateWithMask = True
    Left = 128
    Top = 64
    object qryGrpSinteticosCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
    object qryGrpSinteticosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
  end
  object qryParamCaf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MASCCODGRUPO, IDPESSOA'
      'FROM    PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDPESSOA)')
    ValidateWithMask = True
    Left = 40
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamCafMASCCODGRUPO: TStringField
      FieldName = 'MASCCODGRUPO'
      Origin = '"CM.PARAMETROSCAFMANUT".MASCCODGRUPO'
    end
    object qryParamCafIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.PARAMETROSCAFMANUT".IDPESSOA'
    end
  end
  object qryMovPatGrp1: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CLASSE,'
      '       NOME AS DESCGRUPO,'
      '       TIPO AS S_A,'
      '       (0)  AS SLDANT,'
      '       (0)  AS DEBITOS,'
      '       (0)  AS CREDITOS,'
      '       (0)  AS SLDATU'
      'FROM GRUPO'
      'ORDER BY CLASSE')
    UpdateObject = updMovPatGrp1
    ValidateWithMask = True
    Left = 128
    Top = 120
    object qryMovPatGrp1CLASSE: TStringField
      FieldName = 'CLASSE'
      FixedChar = True
      Size = 15
    end
    object qryMovPatGrp1DESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryMovPatGrp1S_A: TStringField
      FieldName = 'S_A'
      FixedChar = True
      Size = 1
    end
    object qryMovPatGrp1SLDANT: TFloatField
      FieldName = 'SLDANT'
    end
    object qryMovPatGrp1DEBITOS: TFloatField
      FieldName = 'DEBITOS'
    end
    object qryMovPatGrp1CREDITOS: TFloatField
      FieldName = 'CREDITOS'
    end
    object qryMovPatGrp1SLDATU: TFloatField
      FieldName = 'SLDATU'
    end
  end
  object updMovPatGrp1: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPO'
      'set'
      '  DESCGRUPO = :DESCGRUPO,'
      '  S_A = :S_A,'
      '  SLDANT = :SLDANT,'
      '  DEBITOS = :DEBITOS,'
      '  CREDITOS = :CREDITOS,'
      '  SLDATU = :SLDATU'
      'where'
      '  CLASSE = :OLD_CLASSE')
    InsertSQL.Strings = (
      'insert into GRUPO'
      '  (CLASSE, DESCGRUPO, S_A, SLDANT, DEBITOS, CREDITOS, SLDATU)'
      'values'
      
        '  (:CLASSE, :DESCGRUPO, :S_A, :SLDANT, :DEBITOS, :CREDITOS, :SLD' +
        'ATU)')
    DeleteSQL.Strings = (
      'delete from GRUPO'
      'where'
      '  CLASSE = :OLD_CLASSE')
    Left = 208
    Top = 120
  end
end
