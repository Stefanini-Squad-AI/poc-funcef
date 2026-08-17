inherited dtmRelAnaliseContabil: TdtmRelAnaliseContabil
  Left = 321
  Top = 261
  Width = 180
  Height = 171
  Caption = 'dtmRelAnaliseContabil'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 24
    Top = 80
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplExemploppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
  end
  inherited dsExemplo: TwwDataSource
    Left = 24
    Top = 68
  end
  inherited qryExemplo: TwwQuery
    Left = 24
    Top = 56
  end
  inherited rpExemplo: TppReport
    Left = 24
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object pplAnaliseContabil: TppBDEPipeline
    DataSource = dsAnaliseContabil
    UserName = 'lExemplo1'
    Left = 112
    Top = 80
    object pplAnaliseContabilppField1: TppField
      FieldAlias = 'CONTABAIXA'
      FieldName = 'CONTABAIXA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplAnaliseContabilppField2: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplAnaliseContabilppField3: TppField
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplAnaliseContabilppField4: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplAnaliseContabilppField5: TppField
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplAnaliseContabilppField6: TppField
      FieldAlias = 'HMEPARCELA'
      FieldName = 'HMEPARCELA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplAnaliseContabilppField7: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplAnaliseContabilppField8: TppField
      FieldAlias = 'PLNDATDIA'
      FieldName = 'PLNDATDIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplAnaliseContabilppField9: TppField
      FieldAlias = 'PLNPLANIL'
      FieldName = 'PLNPLANIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplAnaliseContabilppField10: TppField
      FieldAlias = 'COMPETENCIA'
      FieldName = 'COMPETENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplAnaliseContabilppField11: TppField
      FieldAlias = 'HMEDATAPREVISTA'
      FieldName = 'HMEDATAPREVISTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
  end
  object dsAnaliseContabil: TwwDataSource
    DataSet = qryAnaliseContabil
    Left = 112
    Top = 68
  end
  object qryAnaliseContabil: TwwQuery
    BeforeOpen = qryAnaliseContabilBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    ITC.CONTABAIXA,'
      '    CNT.MATRICULA,'
      '    CNT.IDCONTRATOEMPTMO,'
      '    CNT.NOME,'
      '    HST.PLNCODIGO,'
      '    HST.PLNDATDIA,'
      '    HST.PLNPLANIL,'
      '    HME.HMEPARCELA,'
      '    HME.HMEVLRPREVISTO AS VALOR,'
      '    '#39'07/2002'#39' AS COMPETENCIA,'
      '    HME.HMEDATAPREVISTA,'
      '    '#39' '#39' AS ITEDESCRICAO'
      'FROM'
      '    VWCONTRATOEP CNT,'
      '    HISTMOVEMPTMO HME,'
      '    ITEMXTIPOCONTR ITC,'
      '    TIPOCONTREMPTMO TCE,'
      '    TIPOEMPTMO TEP,'
      '    (SELECT'
      
        '         DISTINCT HME.IDCONTRATOEMPTMO, HME.IDITEMCENTRALIZA, HM' +
        'E.PLNCODIGO, PLA.PLNDATDIA, HME.HMEPARCELA,'
      '         PLA.PLNPLANIL'
      '     FROM '
      '         HISTMOVEMPTMO HME, '
      '         PLANILHA PLA '
      '     WHERE '
      '         HME.PLNCODIGO IS NOT NULL '
      '     AND (HME.HMECENTRALIZA = 0 OR HMEDESTACADO = 0) '
      '     AND PLA.PLNDATDIA <= '#39'31/07/2002'#39
      '     AND PLA.PLNCODIGO      = HME.PLNCODIGO '
      '     ) HST '
      'WHERE '
      '    TEP.IDEMPRESAPROP        = 1'
      
        'AND (HME.HMEDATAEFETIVA   IS NULL OR HME.HMEDATAEFETIVA > HST.PL' +
        'NDATDIA) '
      'AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1) '
      
        'AND CNT.IDPATRO             IN (42904, 1, 42908, 2113, 2002, 429' +
        '06, 2003, 42902, 42905, 42907) '
      'AND CNT.IDPLANOPREV          IN (4, 6, 7) '
      'AND HST.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO '
      'AND HST.IDITEMCENTRALIZA  = HME.IDITEMEMPTMO '
      'AND HST.HMEPARCELA        = HME.HMEPARCELA'
      'AND HME.IDCONTRATOEMPTMO  = CNT.IDCONTRATOEMPTMO '
      'AND ITC.IDTIPOCONTREMPTMO = CNT.IDTIPOCONTREMPTMO '
      'AND ITC.IDITEMEMPTMO      = HME.IDITEMEMPTMO '
      'AND TCE.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO'
      'AND TEP.IDTIPOEMPTMO      = TCE.IDTIPOEMPTMO'
      'ORDER BY '
      '    ITC.CONTABAIXA, HST.PLNCODIGO, CNT.IDCONTRATOEMPTMO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 112
    Top = 56
    object qryAnaliseContabilCONTABAIXA: TStringField
      FieldName = 'CONTABAIXA'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.CONTABAIXA'
      FixedChar = True
      Size = 18
    end
    object qryAnaliseContabilMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS.VWCONTRATOEP.MATRICULA'
      Size = 13
    end
    object qryAnaliseContabilIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDCONTRATOEMPTMO'
    end
    object qryAnaliseContabilNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.VWCONTRATOEP.NOME'
      Size = 60
    end
    object qryAnaliseContabilPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.PLNCODIGO'
    end
    object qryAnaliseContabilHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEPARCELA'
    end
    object qryAnaliseContabilVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEVLRPREVISTO'
    end
    object qryAnaliseContabilPLNDATDIA: TDateTimeField
      FieldName = 'PLNDATDIA'
      Origin = 'BASEDADOS.PLANILHA.PLNDATDIA'
    end
    object qryAnaliseContabilPLNPLANIL: TFloatField
      FieldName = 'PLNPLANIL'
    end
    object qryAnaliseContabilCOMPETENCIA: TStringField
      FieldName = 'COMPETENCIA'
      FixedChar = True
      Size = 7
    end
    object qryAnaliseContabilHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryAnaliseContabilITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      FixedChar = True
      Size = 30
    end
  end
  object rptAnaliseContabil: TppReport
    AutoStop = False
    DataPipeline = pplAnaliseContabil
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Análise Contábil'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 112
    Top = 8
    Version = '7.04'
    mmColumnWidth = 183542
    DataPipelineName = 'pplAnaliseContabil'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 43392
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Análise Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 36777
        mmTop = 8731
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 36777
        mmTop = 794
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Data Cobrança:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 4763
        mmTop = 18521
        mmWidth = 22754
        BandType = 0
      end
      object rptDividas_lblDataRef: TppLabel
        OnPrint = rptDividas_lblDataRefPrint
        UserName = 'rptDividas_lblDataRef'
        Caption = 'Janeiro/2002'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 28840
        mmTop = 18521
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Patrocinadoras:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 31485
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = 'Planos:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 153459
        mmTop = 31485
        mmWidth = 12700
        BandType = 0
      end
      object ppMemo2: TppMemo
        UserName = 'Memo2'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 38894
        mmWidth = 283898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memPatro: TppRichText
        UserName = 'memPatro'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todas >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 25929
        mmTop = 31485
        mmWidth = 105040
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object memPlano: TppRichText
        UserName = 'memPlano'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todos >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 165894
        mmTop = 31485
        mmWidth = 105040
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ShiftRelativeTo = memPlano
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 38894
        mmWidth = 283898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        AutoSize = False
        Caption = 'Tipo Empréstimo:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 26458
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = 'Tipo Contrato:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 144198
        mmTop = 26458
        mmWidth = 21960
        BandType = 0
      end
      object lblTipoEmptmo: TppLabel
        UserName = 'lblTipoEmptmo'
        AutoSize = False
        Caption = ' < todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 28310
        mmTop = 26458
        mmWidth = 102659
        BandType = 0
      end
      object lblTipoContr: TppLabel
        UserName = 'lblTipoContr'
        AutoSize = False
        Caption = ' < todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165894
        mmTop = 26458
        mmWidth = 105040
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Color = clNone
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppLine3: TppLine
        OnPrint = ppLine3Print
        UserName = 'Line3'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplAnaliseContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnaliseContabil'
        mmHeight = 3175
        mmLeft = 7408
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME'
        DataPipeline = pplAnaliseContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnaliseContabil'
        mmHeight = 3175
        mmLeft = 47361
        mmTop = 794
        mmWidth = 80433
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'MATRICULA'
        DataPipeline = pplAnaliseContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnaliseContabil'
        mmHeight = 3175
        mmLeft = 29898
        mmTop = 794
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'HMEPARCELA'
        DataPipeline = pplAnaliseContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnaliseContabil'
        mmHeight = 3175
        mmLeft = 232040
        mmTop = 794
        mmWidth = 12171
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VALOR'
        DataPipeline = pplAnaliseContabil
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnaliseContabil'
        mmHeight = 3175
        mmLeft = 246328
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'ITEDESCRICAO'
        DataPipeline = pplAnaliseContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnaliseContabil'
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 794
        mmWidth = 56092
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'HMEDATAPREVISTA'
        DataPipeline = pplAnaliseContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnaliseContabil'
        mmHeight = 3175
        mmLeft = 208757
        mmTop = 794
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'COMPETENCIA'
        DataPipeline = pplAnaliseContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnaliseContabil'
        mmHeight = 3175
        mmLeft = 186796
        mmTop = 794
        mmWidth = 17727
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 270542
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 2117
        mmWidth = 23813
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 126207
        mmTop = 2117
        mmWidth = 18256
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 243682
        mmTop = 2117
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 20902
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape4'
        Pen.Width = 2
        mmHeight = 5821
        mmLeft = 3704
        mmTop = 4233
        mmWidth = 33602
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label2'
        Caption = 'Total Geral:  '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 198702
        mmTop = 5292
        mmWidth = 16933
        BandType = 7
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 5821
        mmLeft = 216430
        mmTop = 4233
        mmWidth = 53181
        BandType = 7
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'VALOR'
        DataPipeline = pplAnaliseContabil
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnaliseContabil'
        mmHeight = 3440
        mmLeft = 246328
        mmTop = 5292
        mmWidth = 19315
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplAnaliseContabil
        DisplayFormat = '#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pplAnaliseContabil'
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 5292
        mmWidth = 15346
        BandType = 7
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Contratos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 21167
        mmTop = 5292
        mmWidth = 14288
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CONTABAIXA'
      DataPipeline = pplAnaliseContabil
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAnaliseContabil'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'Shape5'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 6615
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          DataField = 'CONTABAIXA'
          DataPipeline = pplAnaliseContabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAnaliseContabil'
          mmHeight = 3704
          mmLeft = 24342
          mmTop = 794
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Conta Baixa:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 3440
          mmTop = 794
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 794
          mmLeft = 0
          mmTop = 5027
          mmWidth = 270542
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object ppLine7: TppLine
          UserName = 'Line7'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 529
          mmLeft = 0
          mmTop = 794
          mmWidth = 270542
          BandType = 5
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Total da Conta:  '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 193940
          mmTop = 3440
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object ppShape7: TppShape
          UserName = 'Shape7'
          Pen.Width = 2
          mmHeight = 5821
          mmLeft = 216430
          mmTop = 2381
          mmWidth = 53181
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'VALOR'
          DataPipeline = pplAnaliseContabil
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnaliseContabil'
          mmHeight = 3440
          mmLeft = 246328
          mmTop = 3440
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'PLNCODIGO'
      DataPipeline = pplAnaliseContabil
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAnaliseContabil'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object ppShape6: TppShape
          UserName = 'Shape6'
          Brush.Color = 14408667
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 12171
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'Planilha:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 9525
          mmTop = 1058
          mmWidth = 13494
          BandType = 3
          GroupNo = 1
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          DataField = 'PLNCODIGO'
          DataPipeline = pplAnaliseContabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAnaliseContabil'
          mmHeight = 3969
          mmLeft = 73819
          mmTop = 1058
          mmWidth = 23813
          BandType = 3
          GroupNo = 1
        end
        object ppLabel19: TppLabel
          UserName = 'Label19'
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 112713
          mmTop = 1058
          mmWidth = 7938
          BandType = 3
          GroupNo = 1
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'PLNDATDIA'
          DataPipeline = pplAnaliseContabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAnaliseContabil'
          mmHeight = 3969
          mmLeft = 121444
          mmTop = 1058
          mmWidth = 23813
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          Caption = 'Nº Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 11113
          mmTop = 6350
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Beneficiário(a)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 47361
          mmTop = 6350
          mmWidth = 19579
          BandType = 3
          GroupNo = 1
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 29898
          mmTop = 6350
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 231775
          mmTop = 6350
          mmWidth = 10054
          BandType = 3
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 258763
          mmTop = 6350
          mmWidth = 6879
          BandType = 3
          GroupNo = 1
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 794
          mmLeft = 0
          mmTop = 10583
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'PLNPLANIL'
          DataPipeline = pplAnaliseContabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAnaliseContabil'
          mmHeight = 3969
          mmLeft = 24077
          mmTop = 1058
          mmWidth = 23813
          BandType = 3
          GroupNo = 1
        end
        object ppLabel11: TppLabel
          UserName = 'Label3'
          Caption = 'Código:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 60325
          mmTop = 1058
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Descrição do Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 129646
          mmTop = 6350
          mmWidth = 24342
          BandType = 3
          GroupNo = 1
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Data Prevista'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 208757
          mmTop = 6350
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Competência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 186796
          mmTop = 6350
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 529
          mmLeft = 0
          mmTop = 265
          mmWidth = 270542
          BandType = 5
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Total da Planilha:  '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 190500
          mmTop = 2381
          mmWidth = 25135
          BandType = 5
          GroupNo = 1
        end
        object ppShape1: TppShape
          UserName = 'Shape1'
          Pen.Width = 2
          mmHeight = 5821
          mmLeft = 216430
          mmTop = 1323
          mmWidth = 53181
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALOR'
          DataPipeline = pplAnaliseContabil
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnaliseContabil'
          mmHeight = 3440
          mmLeft = 246328
          mmTop = 2646
          mmWidth = 19315
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
end
