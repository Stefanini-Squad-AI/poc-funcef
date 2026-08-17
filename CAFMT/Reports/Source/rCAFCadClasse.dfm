inherited RptCAFCadClasse: TRptCAFCadClasse
  Left = 507
  Top = 141
  Width = 274
  Height = 141
  Caption = 'RptCAFCadClasse'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Cadastro de Classificação de Bens'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Código de Classificação Inicial'
        Controle = tcEdit
        TipodeDado = tdString
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
        MostraComboCompara = True
        Required = False
      end
      item
        Caption = 'Código de Classificação Final'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'True'
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
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 130
    Left = 20
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    DataBaseName = 'Basedados'
    Report = rpCadClasse
  end
  object qryCadClasse: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CB.CODHIERARQ AS CLASSE,'
      '   CB.DESCRICAO  AS NOME,'
      '   CB.ANASINT    AS TIPO,'
      '   G.CLASSE      AS CODGRUPO,'
      '   G.NOME        AS DESCGRUPO'
      'FROM'
      '   CLASSEDEBEM CB,'
      '   CLASSEXGRUPO CXB,'
      '   GRUPO G'
      'WHERE'
      ''
      '      (CB.IDCLASSEBEM = CXB.IDCLASSEBEM(+))'
      '  AND (CXB.IDGRUPO    = G.IDGRUPO(+))'
      'ORDER BY CB.CODHIERARQ')
    ValidateWithMask = True
    Left = 209
    Top = 46
    object qryCadClasseCLASSE: TStringField
      FieldName = 'CLASSE'
      FixedChar = True
      Size = 15
    end
    object qryCadClasseNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryCadClasseTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object qryCadClasseCODGRUPO: TStringField
      FieldName = 'CODGRUPO'
      FixedChar = True
      Size = 15
    end
    object qryCadClasseDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
  end
  object dsCadClasse: TwwDataSource
    DataSet = qryCadClasse
    Left = 210
    Top = 34
  end
  object ppCadClasse: TppBDEPipeline
    DataSource = dsCadClasse
    UserName = 'CadClasse'
    Left = 210
    Top = 21
  end
  object rpCadClasse: TppReport
    AutoStop = False
    DataPipeline = ppCadClasse
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 0
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 210
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30692
      mmPrintPosition = 0
      object ppLabel32: TppLabel
        UserName = 'ppLabel32'
        Caption = 'Cadastro de Classes de Bens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 68792
        mmTop = 8996
        mmWidth = 59531
        BandType = 0
      end
      object ppLine30: TppLine
        UserName = 'ppLine30'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19050
        mmWidth = 197379
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'ppLabel33'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84667
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'ppLabel34'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 19844
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'ppLabel35'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 27517
        mmTop = 19844
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'ppLabel36'
        Caption = 'S / A'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 185473
        mmTop = 19579
        mmWidth = 6350
        BandType = 0
      end
      object ppLine31: TppLine
        UserName = 'ppLine31'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 29633
        mmWidth = 197379
        BandType = 0
      end
      object rpCadClasseLabel1: TppLabel
        UserName = 'rpCadClasseLabel1'
        Caption = 'Grupos Contábeis Associados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 25135
        mmWidth = 50006
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object rpCadClasseDBText1: TppDBText
        UserName = 'rpCadClasseDBText1'
        DataField = 'DESCGRUPO'
        DataPipeline = ppCadClasse
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 27517
        mmTop = 0
        mmWidth = 165100
        BandType = 4
      end
      object rpCadClasseCODGRUPO: TppVariable
        UserName = 'rpCadClasseCODGRUPO1'
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 26723
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLine32: TppLine
        UserName = 'ppLine32'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197379
        BandType = 8
      end
      object ppLabel37: TppLabel
        UserName = 'ppLabel37'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1323
        mmWidth = 63500
        BandType = 8
      end
      object ppCalc11: TppSystemVariable
        UserName = 'Calc11'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 71438
        mmTop = 1323
        mmWidth = 54504
        BandType = 8
      end
      object ppCalc12: TppSystemVariable
        UserName = 'Calc12'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpCadClasseGroup1: TppGroup
      BreakName = 'CLASSE'
      DataPipeline = ppCadClasse
      UserName = 'rpCadClasseGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpCadClasseGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppDBText20: TppDBText
          UserName = 'ppDBText20'
          DataField = 'NOME'
          DataPipeline = ppCadClasse
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 27517
          mmTop = 0
          mmWidth = 149754
          BandType = 3
          GroupNo = 0
        end
        object ppDBText21: TppDBText
          UserName = 'ppDBText21'
          DataField = 'TIPO'
          DataPipeline = ppCadClasse
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 180182
          mmTop = 0
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpCadClasseLine1: TppLine
          UserName = 'rpCadClasseLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 4233
          mmWidth = 197379
          BandType = 3
          GroupNo = 0
        end
        object rpCadClasseCODCLASSE: TppVariable
          UserName = 'rpCadClasseCODCLASSE1'
          CalcOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 0
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
        end
      end
      object rpCadClasseGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 265
        mmPrintPosition = 0
        object rpCadClasseLine2: TppLine
          UserName = 'rpCadClasseLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryParamCaf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOEDAOFICIAL,MOEDAFISCAL,MOEDAGERENCIAL,NUMDIASANO,'
      '       MASCCODGRUPO,ALUGUELINTERNO,GERARREQMAT,'
      '       DATAULTDEP,DATARECALCDEP,DTAULTALUG,SEQBEMEMP,'
      '       EDITACODBEM,EDITACODGRUPO,SISTEMAS,DATAINICIAL,'
      '       ULTTXTCONTAB,FLGCALCCM,FLGTIPOCALC,MASCARACLASSE,'
      '       INTEGRACONTAB,INTEGRACAP,INTEGRACAR,PLANOVIGENTE,'
      '       FLGREAVAL,TIPOPERCTB,FLGREMOVEPLANCTB,ATIVPROJETO,'
      '       PROXIMAPLACA,FLGCLSDESBEM,DIGMASCPLACA,PATROPADRAO,'
      '       PLANPREVPADRAO'
      'FROM   PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDPESSOA)')
    ValidateWithMask = True
    Left = 24
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamCafMOEDAOFICIAL: TFloatField
      FieldName = 'MOEDAOFICIAL'
      Origin = 'PARAMETROSCAFMANUT.MOEDAOFICIAL'
    end
    object qryParamCafMOEDAFISCAL: TFloatField
      FieldName = 'MOEDAFISCAL'
      Origin = 'PARAMETROSCAFMANUT.MOEDAFISCAL'
    end
    object qryParamCafMOEDAGERENCIAL: TFloatField
      FieldName = 'MOEDAGERENCIAL'
      Origin = 'PARAMETROSCAFMANUT.MOEDAGERENCIAL'
    end
    object qryParamCafNUMDIASANO: TFloatField
      FieldName = 'NUMDIASANO'
      Origin = 'PARAMETROSCAFMANUT.NUMDIASANO'
    end
    object qryParamCafMASCCODGRUPO: TStringField
      FieldName = 'MASCCODGRUPO'
      Origin = 'PARAMETROSCAFMANUT.MASCCODGRUPO'
    end
    object qryParamCafALUGUELINTERNO: TFloatField
      FieldName = 'ALUGUELINTERNO'
      Origin = 'PARAMETROSCAFMANUT.ALUGUELINTERNO'
    end
    object qryParamCafGERARREQMAT: TFloatField
      FieldName = 'GERARREQMAT'
      Origin = 'PARAMETROSCAFMANUT.GERARREQMAT'
    end
    object qryParamCafDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
      Origin = 'PARAMETROSCAFMANUT.DATAULTDEP'
    end
    object qryParamCafDATARECALCDEP: TDateTimeField
      FieldName = 'DATARECALCDEP'
      Origin = 'PARAMETROSCAFMANUT.DATARECALCDEP'
    end
    object qryParamCafDTAULTALUG: TDateTimeField
      FieldName = 'DTAULTALUG'
      Origin = 'PARAMETROSCAFMANUT.DTAULTALUG'
    end
    object qryParamCafSEQBEMEMP: TFloatField
      FieldName = 'SEQBEMEMP'
      Origin = 'PARAMETROSCAFMANUT.SEQBEMEMP'
    end
    object qryParamCafEDITACODBEM: TFloatField
      FieldName = 'EDITACODBEM'
      Origin = 'PARAMETROSCAFMANUT.EDITACODBEM'
    end
    object qryParamCafEDITACODGRUPO: TFloatField
      FieldName = 'EDITACODGRUPO'
      Origin = 'PARAMETROSCAFMANUT.EDITACODGRUPO'
    end
    object qryParamCafSISTEMAS: TStringField
      FieldName = 'SISTEMAS'
      Origin = 'PARAMETROSCAFMANUT.SISTEMAS'
      Size = 8
    end
    object qryParamCafDATAINICIAL: TDateTimeField
      FieldName = 'DATAINICIAL'
      Origin = 'PARAMETROSCAFMANUT.DATAINICIAL'
    end
    object qryParamCafULTTXTCONTAB: TDateTimeField
      FieldName = 'ULTTXTCONTAB'
      Origin = 'PARAMETROSCAFMANUT.ULTTXTCONTAB'
    end
    object qryParamCafFLGCALCCM: TFloatField
      FieldName = 'FLGCALCCM'
      Origin = 'PARAMETROSCAFMANUT.FLGCALCCM'
    end
    object qryParamCafFLGTIPOCALC: TStringField
      FieldName = 'FLGTIPOCALC'
      Origin = 'PARAMETROSCAFMANUT.FLGTIPOCALC'
      Size = 1
    end
    object qryParamCafMASCARACLASSE: TStringField
      FieldName = 'MASCARACLASSE'
      Origin = 'PARAMETROSCAFMANUT.MASCARACLASSE'
      Size = 15
    end
    object qryParamCafINTEGRACONTAB: TStringField
      FieldName = 'INTEGRACONTAB'
      Origin = 'PARAMETROSCAFMANUT.INTEGRACONTAB'
      Size = 1
    end
    object qryParamCafINTEGRACAP: TStringField
      FieldName = 'INTEGRACAP'
      Origin = 'PARAMETROSCAFMANUT.INTEGRACAP'
      Size = 1
    end
    object qryParamCafINTEGRACAR: TStringField
      FieldName = 'INTEGRACAR'
      Origin = 'PARAMETROSCAFMANUT.INTEGRACAR'
      Size = 1
    end
    object qryParamCafPLANOVIGENTE: TFloatField
      FieldName = 'PLANOVIGENTE'
    end
    object qryParamCafFLGREAVAL: TStringField
      FieldName = 'FLGREAVAL'
      Size = 1
    end
    object qryParamCafTIPOPERCTB: TStringField
      FieldName = 'TIPOPERCTB'
      Size = 2
    end
    object qryParamCafFLGREMOVEPLANCTB: TStringField
      FieldName = 'FLGREMOVEPLANCTB'
      Origin = '"CM.PARAMETROSCAFMANUT".FLGREMOVEPLANCTB'
      Size = 1
    end
    object qryParamCafATIVPROJETO: TFloatField
      FieldName = 'ATIVPROJETO'
    end
    object qryParamCafPROXIMAPLACA: TFloatField
      FieldName = 'PROXIMAPLACA'
      Origin = '"CM.PARAMETROSCAFMANUT".PROXIMAPLACA'
    end
    object qryParamCafFLGCLSDESBEM: TFloatField
      FieldName = 'FLGCLSDESBEM'
      Origin = '"CM.PARAMETROSCAFMANUT".FLGCLSDESBEM'
    end
    object qryParamCafDIGMASCPLACA: TFloatField
      FieldName = 'DIGMASCPLACA'
    end
    object qryParamCafPATROPADRAO: TFloatField
      FieldName = 'PATROPADRAO'
    end
    object qryParamCafPLANPREVPADRAO: TFloatField
      FieldName = 'PLANPREVPADRAO'
    end
  end
end
