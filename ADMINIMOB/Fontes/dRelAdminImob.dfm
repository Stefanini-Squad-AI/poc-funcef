inherited dtmRelAdminImob: TdtmRelAdminImob
  Left = 193
  Top = 107
  Width = 667
  Height = 509
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 24
    Top = 80
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
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
    SQL.Strings = (
      'SELECT P.NOME, P.RAZAOSOCIAL FROM'
      'PESSOA P, '
      'EMPRESAPROP E '
      'WHERE  1=2 AND P.IDPESSOA = E.IDPESSOA'
      'AND P.IDPESSOA = :PIDPESSOA')
    Left = 24
    Top = 56
  end
  inherited rpExemplo: TppReport
    Left = 24
    Top = 8
    DataPipelineName = 'pplExemplo'
    inherited FooterBand1: TppFooterBand
      inherited Calc1: TppSystemVariable [1]
      end
      inherited Calc2: TppSystemVariable
        mmLeft = 69056
        mmTop = 2910
        mmWidth = 70644
      end
      inherited LblSistema: TppLabel [3]
        mmLeft = 529
        mmTop = 2910
        mmWidth = 64294
      end
    end
  end
  object pplAlugueisEventos: TppBDEPipeline
    DataSource = dsAlugueisEventos
    UserName = 'lAlugueisEventos'
    Left = 112
    Top = 80
  end
  object dsAlugueisEventos: TwwDataSource
    DataSet = qryAlugueisEventos
    Left = 112
    Top = 68
  end
  object qryAlugueisEventos: TwwQuery
    OnCalcFields = qryAlugueisEventosCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IM.IDIMOVELMESTRE,'
      '   IM.IMONOME AS NOME_MESTRE,'
      ''
      '   C.IDCONTRATOIMOVEL,'
      '   C.CONNUMERO, C.CONNOME, C.IDLOCATARIO,'
      ''
      '   C.CONDATAINICIO, C.CONDATAFIM, C.CONDATACARENCIA,'
      '   C.CONDATADENUNCIA, C.CONDATAAVDENUNCIA,'
      '   C.CONDATAREAJUSTE, C.CONPROXREAJUSTE,'
      '   C.CONDATARENEGOC, C.CONDATAAVRENEGOC,'
      '   C.CONDATAFIANCAFIM, C.CONDATAFIANCAAV,'
      ''
      '   PL.RAZAOSOCIAL AS LOCATARIO_RS, PL.NOME AS LOCATARIO_NF,'
      
        '   PA.RAZAOSOCIAL AS ADMINISTRADORA_RS, PA.NOME AS ADMINISTRADOR' +
        'A_NF'
      ''
      'FROM'
      '   PESSOA PL, PESSOA PA,'
      '   CONTRATOIMOVEL C,'
      ''
      '   ('
      '   SELECT'
      
        '      IM.IDIMOVELMESTRE, IM.IDIMOVEL, CX.IDCONTRATOIMOVEL, IM.IM' +
        'ONOME'
      '   FROM'
      '      CONTRATOXIMOVEL CX, IMOVEL I, IMOVEL IM'
      '   WHERE'
      '      ( CX.IDIMOVEL = I.IDIMOVEL )'
      '      AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   GROUP BY'
      
        '      IM.IDIMOVELMESTRE, IM.IDIMOVEL, CX.IDCONTRATOIMOVEL, IM.IM' +
        'ONOME'
      '   ) IM'
      ''
      'WHERE'
      '   1=2 AND ( C.IDLOCATARIO = PL.IDPESSOA(+) )'
      '   AND ( C.IDADMINIMOVEL = PA.IDPESSOA(+) )'
      '   AND ( C.IDCONTRATOIMOVEL  = IM.IDCONTRATOIMOVEL )'
      ''
      'ORDER BY'
      '   IM.IMONOME, C.CONNUMERO, C.CONNOME'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 112
    Top = 56
    object qryAlugueisEventosCONTRATOEXTENSO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CONTRATOEXTENSO'
      Size = 100
      Calculated = True
    end
    object qryAlugueisEventosJan: TStringField
      DisplayWidth = 600
      FieldKind = fkCalculated
      FieldName = 'Jan'
      Size = 600
      Calculated = True
    end
    object qryAlugueisEventosFev: TStringField
      DisplayWidth = 600
      FieldKind = fkCalculated
      FieldName = 'Fev'
      Size = 600
      Calculated = True
    end
    object qryAlugueisEventosMar: TStringField
      DisplayWidth = 600
      FieldKind = fkCalculated
      FieldName = 'Mar'
      Size = 600
      Calculated = True
    end
    object qryAlugueisEventosAbr: TStringField
      DisplayWidth = 600
      FieldKind = fkCalculated
      FieldName = 'Abr'
      Size = 600
      Calculated = True
    end
    object qryAlugueisEventosMai: TStringField
      DisplayWidth = 600
      FieldKind = fkCalculated
      FieldName = 'Mai'
      Size = 600
      Calculated = True
    end
    object qryAlugueisEventosJun: TStringField
      DisplayWidth = 600
      FieldKind = fkCalculated
      FieldName = 'Jun'
      Size = 600
      Calculated = True
    end
    object qryAlugueisEventosJul: TStringField
      DisplayWidth = 600
      FieldKind = fkCalculated
      FieldName = 'Jul'
      Size = 600
      Calculated = True
    end
    object qryAlugueisEventosAgo: TStringField
      DisplayWidth = 600
      FieldKind = fkCalculated
      FieldName = 'Ago'
      Size = 600
      Calculated = True
    end
    object qryAlugueisEventosSet: TStringField
      DisplayWidth = 600
      FieldKind = fkCalculated
      FieldName = 'Set'
      Size = 600
      Calculated = True
    end
    object qryAlugueisEventosOut: TStringField
      DisplayWidth = 600
      FieldKind = fkCalculated
      FieldName = 'Out'
      Size = 600
      Calculated = True
    end
    object qryAlugueisEventosNov: TStringField
      DisplayWidth = 600
      FieldKind = fkCalculated
      FieldName = 'Nov'
      Size = 600
      Calculated = True
    end
    object qryAlugueisEventosDez: TStringField
      DisplayWidth = 600
      FieldKind = fkCalculated
      FieldName = 'Dez'
      Size = 600
      Calculated = True
    end
    object qryAlugueisEventosIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object qryAlugueisEventosNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object qryAlugueisEventosIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryAlugueisEventosCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryAlugueisEventosCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object qryAlugueisEventosIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
    end
    object qryAlugueisEventosCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
    end
    object qryAlugueisEventosCONDATAFIM: TDateTimeField
      FieldName = 'CONDATAFIM'
    end
    object qryAlugueisEventosCONDATACARENCIA: TDateTimeField
      FieldName = 'CONDATACARENCIA'
    end
    object qryAlugueisEventosCONDATADENUNCIA: TDateTimeField
      FieldName = 'CONDATADENUNCIA'
    end
    object qryAlugueisEventosCONDATAAVDENUNCIA: TDateTimeField
      FieldName = 'CONDATAAVDENUNCIA'
    end
    object qryAlugueisEventosCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
    end
    object qryAlugueisEventosCONPROXREAJUSTE: TDateTimeField
      FieldName = 'CONPROXREAJUSTE'
    end
    object qryAlugueisEventosCONDATARENEGOC: TDateTimeField
      FieldName = 'CONDATARENEGOC'
    end
    object qryAlugueisEventosCONDATAAVRENEGOC: TDateTimeField
      FieldName = 'CONDATAAVRENEGOC'
    end
    object qryAlugueisEventosCONDATAFIANCAFIM: TDateTimeField
      FieldName = 'CONDATAFIANCAFIM'
    end
    object qryAlugueisEventosCONDATAFIANCAAV: TDateTimeField
      FieldName = 'CONDATAFIANCAAV'
    end
    object qryAlugueisEventosLOCATARIO_RS: TStringField
      FieldName = 'LOCATARIO_RS'
      Size = 60
    end
    object qryAlugueisEventosLOCATARIO_NF: TStringField
      FieldName = 'LOCATARIO_NF'
      Size = 60
    end
    object qryAlugueisEventosADMINISTRADORA_RS: TStringField
      FieldName = 'ADMINISTRADORA_RS'
      Size = 60
    end
    object qryAlugueisEventosADMINISTRADORA_NF: TStringField
      FieldName = 'ADMINISTRADORA_NF'
      Size = 60
    end
  end
  object rptAlugueisEventos: TppReport
    AutoStop = False
    DataPipeline = pplAlugueisEventos
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
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
    mmColumnWidth = 197300
    DataPipelineName = 'pplAlugueisEventos'
    object ppHeaderBand3: TppHeaderBand
      AfterPrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
      BeforePrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
      mmBottomOffset = 40
      mmHeight = 30427
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        UserName = 'ppLabel9'
        AutoSize = False
        Caption = 'Eventos Contratuais por Imóvel Mestre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 36513
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel13: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel13'
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
        mmLeft = 36513
        mmTop = 1588
        mmWidth = 197380
        BandType = 0
      end
      object rptAlugueisEventosLabel17: TppLabel
        UserName = 'rptAlugueisEventosLabel17'
        Caption = 'Administradora:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 22754
        mmWidth = 25929
        BandType = 0
      end
      object rptAlugueisEventos_lblAdministradora: TppLabel
        UserName = 'rptAlugueisEventos_lblAdministradora'
        Caption = 'rptAlugueisEventos_lblAdministradora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 25665
        mmTop = 22754
        mmWidth = 46038
        BandType = 0
      end
      object rptAlugueisEventosLabel14: TppLabel
        UserName = 'rptAlugueisEventosLabel14'
        AutoSize = False
        Caption = 'Ano:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 8996
        mmTop = 18256
        mmWidth = 16933
        BandType = 0
      end
      object rptAlugueisEventos_lblAno: TppLabel
        UserName = 'rptAlugueisEventos_lblAno'
        Caption = '0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 25665
        mmTop = 18256
        mmWidth = 6350
        BandType = 0
      end
      object ppLogoEventos: TppImage
        UserName = 'ppLogoEventos'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 18256
      mmPrintPosition = 0
      object rptAlugueisEventosShape1: TppShape
        OnPrint = rptContratosAdminSint_FundoBandaDetalhePrint
        UserName = 'rptAlugueisEventosShape1'
        Brush.Color = 13040076
        ParentHeight = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 18256
        mmLeft = 2117
        mmTop = 0
        mmWidth = 268817
        BandType = 4
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'ppDBMemo2'
        CharWrap = True
        DataField = 'CONTRATOEXTENSO'
        DataPipeline = pplAlugueisEventos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplAlugueisEventos'
        mmHeight = 15875
        mmLeft = 2117
        mmTop = 794
        mmWidth = 40746
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptAlugueisEventos_Separador: TppLine
        OnPrint = rptContratosAdminSint_SeparadorPrint
        UserName = 'rptAlugueisEventos_Separador'
        Visible = False
        Weight = 0.75
        mmHeight = 529
        mmLeft = 2117
        mmTop = 0
        mmWidth = 268553
        BandType = 4
      end
      object rptAlugueisEventosDBText13: TppDBText
        UserName = 'rptAlugueisEventosDBText13'
        DataField = 'CONDATAINICIO'
        DataPipeline = pplAlugueisEventos
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAlugueisEventos'
        mmHeight = 2646
        mmLeft = 44715
        mmTop = 794
        mmWidth = 11113
        BandType = 4
      end
      object rptAlugueisEventosLabel15: TppLabel
        UserName = 'rptAlugueisEventosLabel15'
        Caption = ' a '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 55563
        mmTop = 794
        mmWidth = 2117
        BandType = 4
      end
      object rptAlugueisEventosDBText16: TppDBText
        UserName = 'rptAlugueisEventosDBText16'
        DataField = 'CONDATAFIM'
        DataPipeline = pplAlugueisEventos
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAlugueisEventos'
        mmHeight = 2646
        mmLeft = 57415
        mmTop = 794
        mmWidth = 11113
        BandType = 4
      end
      object rptAlugueisEventosDBMemo1: TppDBMemo
        UserName = 'rptAlugueisEventosDBMemo1'
        CharWrap = True
        DataField = 'Jan'
        DataPipeline = pplAlugueisEventos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Stretch = True
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAlugueisEventos'
        mmHeight = 15875
        mmLeft = 70379
        mmTop = 794
        mmWidth = 16933
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptAlugueisEventosDBMemo2: TppDBMemo
        UserName = 'rptAlugueisEventosDBMemo2'
        CharWrap = True
        DataField = 'Fev'
        DataPipeline = pplAlugueisEventos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Stretch = True
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAlugueisEventos'
        mmHeight = 15875
        mmLeft = 87048
        mmTop = 794
        mmWidth = 16933
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptAlugueisEventosDBMemo3: TppDBMemo
        UserName = 'rptAlugueisEventosDBMemo3'
        CharWrap = True
        DataField = 'Mar'
        DataPipeline = pplAlugueisEventos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Stretch = True
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAlugueisEventos'
        mmHeight = 15875
        mmLeft = 103717
        mmTop = 794
        mmWidth = 16933
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptAlugueisEventosDBMemo4: TppDBMemo
        UserName = 'rptAlugueisEventosDBMemo4'
        CharWrap = True
        DataField = 'Abr'
        DataPipeline = pplAlugueisEventos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Stretch = True
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAlugueisEventos'
        mmHeight = 15875
        mmLeft = 120386
        mmTop = 794
        mmWidth = 16933
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptAlugueisEventosDBMemo5: TppDBMemo
        UserName = 'rptAlugueisEventosDBMemo5'
        CharWrap = True
        DataField = 'Mai'
        DataPipeline = pplAlugueisEventos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Stretch = True
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAlugueisEventos'
        mmHeight = 15875
        mmLeft = 137054
        mmTop = 794
        mmWidth = 16933
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptAlugueisEventosDBMemo6: TppDBMemo
        UserName = 'rptAlugueisEventosDBMemo6'
        CharWrap = True
        DataField = 'Jun'
        DataPipeline = pplAlugueisEventos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Stretch = True
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAlugueisEventos'
        mmHeight = 15875
        mmLeft = 153723
        mmTop = 794
        mmWidth = 16933
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptAlugueisEventosDBMemo7: TppDBMemo
        UserName = 'rptAlugueisEventosDBMemo7'
        CharWrap = True
        DataField = 'Jul'
        DataPipeline = pplAlugueisEventos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Stretch = True
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAlugueisEventos'
        mmHeight = 15875
        mmLeft = 170392
        mmTop = 794
        mmWidth = 16933
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptAlugueisEventosDBMemo8: TppDBMemo
        UserName = 'rptAlugueisEventosDBMemo8'
        CharWrap = True
        DataField = 'Ago'
        DataPipeline = pplAlugueisEventos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Stretch = True
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAlugueisEventos'
        mmHeight = 15875
        mmLeft = 187061
        mmTop = 794
        mmWidth = 16933
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptAlugueisEventosDBMemo9: TppDBMemo
        UserName = 'rptAlugueisEventosDBMemo9'
        CharWrap = True
        DataField = 'Set'
        DataPipeline = pplAlugueisEventos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Stretch = True
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAlugueisEventos'
        mmHeight = 15875
        mmLeft = 203730
        mmTop = 794
        mmWidth = 16933
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptAlugueisEventosDBMemo10: TppDBMemo
        UserName = 'rptAlugueisEventosDBMemo10'
        CharWrap = True
        DataField = 'Out'
        DataPipeline = pplAlugueisEventos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Stretch = True
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAlugueisEventos'
        mmHeight = 15875
        mmLeft = 220398
        mmTop = 794
        mmWidth = 16933
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptAlugueisEventosDBMemo11: TppDBMemo
        UserName = 'rptAlugueisEventosDBMemo11'
        CharWrap = True
        DataField = 'Nov'
        DataPipeline = pplAlugueisEventos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Stretch = True
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAlugueisEventos'
        mmHeight = 15875
        mmLeft = 237067
        mmTop = 794
        mmWidth = 16933
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptAlugueisEventosDBMemo12: TppDBMemo
        UserName = 'rptAlugueisEventosDBMemo12'
        CharWrap = True
        DataField = 'Dez'
        DataPipeline = pplAlugueisEventos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Stretch = True
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAlugueisEventos'
        mmHeight = 15875
        mmLeft = 253736
        mmTop = 794
        mmWidth = 16933
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand3: TppFooterBand
      AfterPrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
      BeforePrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
      mmBottomOffset = 40
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'ppLine6'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 270670
        BandType = 8
      end
      object ppLabel16: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel16'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc5: TppSystemVariable
        UserName = 'Calc5'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 113506
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc6: TppSystemVariable
        UserName = 'Calc6'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 235215
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'NOME_MESTRE'
      DataPipeline = pplAlugueisEventos
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAlugueisEventos'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        AfterPrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
        BeforePrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
        mmBottomOffset = 40
        mmHeight = 16404
        mmPrintPosition = 0
        object ppLabel17: TppLabel
          UserName = 'ppLabel17'
          Caption = 'Imóvel Mestre:  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 0
          mmTop = 7673
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'ppDBText8'
          DataField = 'NOME_MESTRE'
          DataPipeline = pplAlugueisEventos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAlugueisEventos'
          mmHeight = 3175
          mmLeft = 18256
          mmTop = 7673
          mmWidth = 95250
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'ppLabel19'
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 2117
          mmTop = 12965
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object rptAlugueisEventos_LinhaTitulo: TppLine
          OnPrint = rptAlugueisEventos_LinhaTituloPrint
          UserName = 'rptAlugueisEventos_LinhaTitulo'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 2117
          mmTop = 15875
          mmWidth = 268553
          BandType = 3
          GroupNo = 0
        end
        object rptAlugueisEventosLine2: TppLine
          UserName = 'rptAlugueisEventosLine2'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 10848
          mmWidth = 270670
          BandType = 3
          GroupNo = 0
        end
        object rptAlugueisEventosLabel1: TppLabel
          UserName = 'rptAlugueisEventosLabel1'
          AutoSize = False
          Caption = 'JAN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 70379
          mmTop = 12965
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object rptAlugueisEventosLabel2: TppLabel
          UserName = 'rptAlugueisEventosLabel2'
          AutoSize = False
          Caption = 'FEV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 87048
          mmTop = 12965
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object rptAlugueisEventosLabel3: TppLabel
          UserName = 'rptAlugueisEventosLabel3'
          AutoSize = False
          Caption = 'MAR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 103717
          mmTop = 12965
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object rptAlugueisEventosLabel4: TppLabel
          UserName = 'rptAlugueisEventosLabel4'
          AutoSize = False
          Caption = 'ABR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 120386
          mmTop = 12965
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object rptAlugueisEventosLabel5: TppLabel
          UserName = 'rptAlugueisEventosLabel5'
          AutoSize = False
          Caption = 'AGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 187061
          mmTop = 12965
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object rptAlugueisEventosLabel6: TppLabel
          UserName = 'rptAlugueisEventosLabel6'
          AutoSize = False
          Caption = 'JUL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 170392
          mmTop = 12965
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object rptAlugueisEventosLabel7: TppLabel
          UserName = 'rptAlugueisEventosLabel7'
          AutoSize = False
          Caption = 'JUN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 153723
          mmTop = 12965
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object rptAlugueisEventosLabel8: TppLabel
          UserName = 'rptAlugueisEventosLabel8'
          AutoSize = False
          Caption = 'MAI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 137054
          mmTop = 12965
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object rptAlugueisEventosLabel9: TppLabel
          UserName = 'rptAlugueisEventosLabel9'
          AutoSize = False
          Caption = 'DEZ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 253736
          mmTop = 12965
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object rptAlugueisEventosLabel10: TppLabel
          UserName = 'rptAlugueisEventosLabel10'
          AutoSize = False
          Caption = 'NOV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 237067
          mmTop = 12965
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object rptAlugueisEventosLabel11: TppLabel
          UserName = 'rptAlugueisEventosLabel11'
          AutoSize = False
          Caption = 'OUT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 220398
          mmTop = 12965
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object rptAlugueisEventosLabel13: TppLabel
          UserName = 'rptAlugueisEventosLabel13'
          AutoSize = False
          Caption = 'SET'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 203730
          mmTop = 12965
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object rptAlugueisEventosLabel12: TppLabel
          UserName = 'rptAlugueisEventosLabel12'
          Caption = 'Vigência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 44715
          mmTop = 12965
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        AfterPrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
        BeforePrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
        mmBottomOffset = 40
        mmHeight = 2646
        mmPrintPosition = 0
        object rptAlugueisEventosLine1: TppLine
          OnPrint = rptAlugueisEventos_LinhaTituloPrint
          UserName = 'rptAlugueisEventosLine1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 2117
          mmTop = 0
          mmWidth = 268553
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryQuadroImoveis: TwwQuery
    OnCalcFields = qryQuadroImoveisCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IM.IMONOME AS NOMEMESTRE,'
      '   IM.IMOLOGRADOURO, IM.IMONUMERO, IM.IMOBAIRRO, IM.IMOCEP,'
      '   CI.NOME AS DSC_CIDADE, CI.UF AS DSC_UF,'
      '   I.IMONOME AS NOMEIMOVEL,IM.IDIMOVEL AS IDMESTRE,'
      '   I.FLGSTATUSOCUPACAO, I.IDIMOVEL, I.IMOAREAGERENCIAL,'
      '   C.IDCONTRATOIMOVEL, C.CONDATAINICIO, C.CONDATAFIM,'
      ''
      '   DECODE(C.IDLOCATARIO, NULL, '#39'VAGO'#39', PL.NOME) AS LOCATARIO,'
      ''
      
        '   DECODE(CX.CIMVLRAJUSTADO, NULL, 0, CX.CIMVLRAJUSTADO)  AS ALU' +
        'GUEL,'
      ''
      '   DECODE(NVL(CX.FLGRATEIO,0), 0, I.IMOAREAGERENCIAL,'
      '      DECODE(NVL(CX.CIMPERCENTRATEIO,0), 0, 0,'
      
        '            (I.IMOAREAGERENCIAL * CX.CIMPERCENTRATEIO / 100) )) ' +
        'AS AREA_OCUPADA,'
      ''
      '   DECODE(CX.CIMVLRAJUSTADO, NULL, 0,'
      '      DECODE(NVL(I.IMOAREAGERENCIAL,0), 0, 0,'
      
        '         DECODE(NVL(CX.FLGRATEIO,0), 0, (CX.CIMVLRAJUSTADO / I.I' +
        'MOAREAGERENCIAL),'
      '            DECODE(NVL(CX.CIMPERCENTRATEIO,0), 0, 0,'
      
        '                  (CX.CIMVLRAJUSTADO / (I.IMOAREAGERENCIAL * CX.' +
        'CIMPERCENTRATEIO / 100)) )))) AS ALUGUELM2'
      ''
      'FROM'
      '   PESSOA PL, CIDADES CI,'
      '   IMOVEL I, IMOVEL IM, CONTRATOIMOVEL C,'
      '   CONTRATOXIMOVEL CX'
      ''
      'WHERE'
      '   1=2 AND ( IM.FLGTIPOIMOVEL = 0 )'
      ''
      
        '   AND ( (CX.CIMDTFIM IS NOT NULL AND SYSDATE BETWEEN CX.CIMDTIN' +
        'I AND CX.CIMDTFIM ) OR'
      '         (CX.CIMDTFIM IS NULL AND SYSDATE >= CX.CIMDTINI ) )'
      ''
      '   AND ( I.IDPESSOA = :PIDPESSOA )'
      
        '   AND ((:PIDIMOVELMESTRE IS NULL) OR (I.IDIMOVELMESTRE = :PIDIM' +
        'OVELMESTRE) )'
      '   AND ((:PFLGAREA IS NULL) OR (NVL(I.IMOAREAGERENCIAL,0) > 0))'
      '   AND ((:PFLGALUG IS NULL) OR (NVL(CX.CIMVLRAJUSTADO,0)  > 0))'
      '   AND ( I.FLGTIPOIMOVEL = 1 )'
      '   AND ( C.FLGSTATUS = '#39'V'#39' )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( I.IDIMOVEL = CX.IDIMOVEL )'
      '   AND ( IM.IDCIDADES = CI.IDCIDADES(+) )'
      '   AND ( CX.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      '   AND ( C.IDLOCATARIO = PL.IDPESSOA(+) )'
      ''
      'ORDER BY'
      '   NOMEMESTRE, NOMEIMOVEL'
      ''
      ''
      ''
      ''
      ' '
      ''
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGAREA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGALUG'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldKind = fkCalculated
      FieldName = 'EnderecoExtenso'
      Size = 120
      Calculated = True
    end
    object StringField2: TStringField
      FieldKind = fkCalculated
      FieldName = 'Ocupacao'
      Size = 12
      Calculated = True
    end
    object qryQuadroImoveisDataReferencia: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'DataReferencia'
      Calculated = True
    end
    object qryQuadroImoveisNOMEMESTRE: TStringField
      FieldName = 'NOMEMESTRE'
      Size = 60
    end
    object qryQuadroImoveisIMONUMERO: TStringField
      FieldName = 'IMONUMERO'
      Size = 8
    end
    object qryQuadroImoveisIMOBAIRRO: TStringField
      FieldName = 'IMOBAIRRO'
    end
    object qryQuadroImoveisIMOCEP: TStringField
      FieldName = 'IMOCEP'
      Size = 8
    end
    object qryQuadroImoveisNOMEIMOVEL: TStringField
      FieldName = 'NOMEIMOVEL'
      Size = 60
    end
    object qryQuadroImoveisIDMESTRE: TFloatField
      FieldName = 'IDMESTRE'
    end
    object qryQuadroImoveisFLGSTATUSOCUPACAO: TStringField
      FieldName = 'FLGSTATUSOCUPACAO'
      Size = 1
    end
    object qryQuadroImoveisIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryQuadroImoveisIMOAREAGERENCIAL: TFloatField
      FieldName = 'IMOAREAGERENCIAL'
    end
    object qryQuadroImoveisIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryQuadroImoveisCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
    end
    object qryQuadroImoveisCONDATAFIM: TDateTimeField
      FieldName = 'CONDATAFIM'
    end
    object qryQuadroImoveisLOCATARIO: TStringField
      FieldName = 'LOCATARIO'
      Size = 60
    end
    object qryQuadroImoveisALUGUEL: TFloatField
      FieldName = 'ALUGUEL'
    end
    object qryQuadroImoveisAREA_OCUPADA: TFloatField
      FieldName = 'AREA_OCUPADA'
    end
    object qryQuadroImoveisALUGUELM2: TFloatField
      FieldName = 'ALUGUELM2'
    end
    object qryQuadroImoveisIMOLOGRADOURO: TStringField
      FieldName = 'IMOLOGRADOURO'
      Size = 80
    end
    object qryQuadroImoveisDSC_CIDADE: TStringField
      FieldName = 'DSC_CIDADE'
      Size = 50
    end
    object qryQuadroImoveisDSC_UF: TStringField
      FieldName = 'DSC_UF'
      FixedChar = True
      Size = 3
    end
  end
  object dsQuadroImoveis: TwwDataSource
    DataSet = qryQuadroImoveis
    Left = 216
    Top = 68
  end
  object pplQuadroImoveis: TppBDEPipeline
    DataSource = dsQuadroImoveis
    UserName = 'lQuadroImoveis'
    Left = 216
    Top = 80
    object pplQuadroImoveisppField1: TppField
      FieldAlias = 'EnderecoExtenso'
      FieldName = 'EnderecoExtenso'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplQuadroImoveisppField2: TppField
      FieldAlias = 'Ocupacao'
      FieldName = 'Ocupacao'
      FieldLength = 12
      DisplayWidth = 12
      Position = 1
    end
    object pplQuadroImoveisppField3: TppField
      FieldAlias = 'DataReferencia'
      FieldName = 'DataReferencia'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object pplQuadroImoveisppField4: TppField
      FieldAlias = 'NOMEMESTRE'
      FieldName = 'NOMEMESTRE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplQuadroImoveisppField5: TppField
      FieldAlias = 'IMONUMERO'
      FieldName = 'IMONUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 4
    end
    object pplQuadroImoveisppField6: TppField
      FieldAlias = 'IMOBAIRRO'
      FieldName = 'IMOBAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object pplQuadroImoveisppField7: TppField
      FieldAlias = 'IMOCEP'
      FieldName = 'IMOCEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 6
    end
    object pplQuadroImoveisppField8: TppField
      FieldAlias = 'NOMEIMOVEL'
      FieldName = 'NOMEIMOVEL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object pplQuadroImoveisppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDMESTRE'
      FieldName = 'IDMESTRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplQuadroImoveisppField10: TppField
      FieldAlias = 'FLGSTATUSOCUPACAO'
      FieldName = 'FLGSTATUSOCUPACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object pplQuadroImoveisppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplQuadroImoveisppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOAREAGERENCIAL'
      FieldName = 'IMOAREAGERENCIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplQuadroImoveisppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplQuadroImoveisppField14: TppField
      FieldAlias = 'CONDATAINICIO'
      FieldName = 'CONDATAINICIO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 13
    end
    object pplQuadroImoveisppField15: TppField
      FieldAlias = 'CONDATAFIM'
      FieldName = 'CONDATAFIM'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 14
    end
    object pplQuadroImoveisppField16: TppField
      FieldAlias = 'LOCATARIO'
      FieldName = 'LOCATARIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 15
    end
    object pplQuadroImoveisppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'ALUGUEL'
      FieldName = 'ALUGUEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplQuadroImoveisppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'AREA_OCUPADA'
      FieldName = 'AREA_OCUPADA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplQuadroImoveisppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'ALUGUELM2'
      FieldName = 'ALUGUELM2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplQuadroImoveisppField20: TppField
      FieldAlias = 'IMOLOGRADOURO'
      FieldName = 'IMOLOGRADOURO'
      FieldLength = 80
      DisplayWidth = 80
      Position = 19
    end
    object pplQuadroImoveisppField21: TppField
      FieldAlias = 'DSC_CIDADE'
      FieldName = 'DSC_CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 20
    end
    object pplQuadroImoveisppField22: TppField
      FieldAlias = 'DSC_UF'
      FieldName = 'DSC_UF'
      FieldLength = 3
      DisplayWidth = 3
      Position = 21
    end
  end
  object rptQuadroImoveis: TppReport
    AutoStop = False
    DataPipeline = pplQuadroImoveis
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13229
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 13229
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
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
    Left = 216
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplQuadroImoveis'
    object ppHeaderBand2: TppHeaderBand
      AfterPrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
      BeforePrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
      mmBottomOffset = 40
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        AutoSize = False
        Caption = 'Quadro de Aluguéis por m2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 43127
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel5: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel5'
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
        mmLeft = 43127
        mmTop = 1588
        mmWidth = 197380
        BandType = 0
      end
      object ppLogoQuadroAluguel: TppImage
        UserName = 'ppLogoQuadroAluguel'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 20108
      mmPrintPosition = 0
      object rptQuadroImoveis_FundoBandaDetalhe: TppShape
        OnPrint = rptContratosAdminSint_FundoBandaDetalhePrint
        UserName = 'rptQuadroImoveis_FundoBandaDetalhe'
        Brush.Color = 13040076
        ParentHeight = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 20108
        mmLeft = 4233
        mmTop = 0
        mmWidth = 279930
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'ppDBText2'
        DataField = 'IMOAREAGERENCIAL'
        DataPipeline = pplQuadroImoveis
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplQuadroImoveis'
        mmHeight = 3704
        mmLeft = 203994
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppReport1DBMemo1: TppDBMemo
        UserName = 'ppReport1DBMemo1'
        CharWrap = False
        DataField = 'NOMEIMOVEL'
        DataPipeline = pplQuadroImoveis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplQuadroImoveis'
        mmHeight = 15875
        mmLeft = 4233
        mmTop = 794
        mmWidth = 60854
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppReport1DBText1: TppDBText
        UserName = 'ppReport1DBText1'
        DataField = 'CONDATAINICIO'
        DataPipeline = pplQuadroImoveis
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplQuadroImoveis'
        mmHeight = 3704
        mmLeft = 138907
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppReport1DBMemo2: TppDBMemo
        UserName = 'ppReport1DBMemo2'
        CharWrap = False
        DataField = 'LOCATARIO'
        DataPipeline = pplQuadroImoveis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplQuadroImoveis'
        mmHeight = 15875
        mmLeft = 66940
        mmTop = 794
        mmWidth = 70115
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptQuadroImoveis_Separador: TppLine
        OnPrint = rptContratosAdminSint_SeparadorPrint
        UserName = 'rptQuadroImoveis_Separador'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 4233
        mmTop = 0
        mmWidth = 279665
        BandType = 4
      end
      object rptQuadroImoveisDBText1: TppDBText
        UserName = 'rptQuadroImoveisDBText1'
        DataField = 'CONDATAFIM'
        DataPipeline = pplQuadroImoveis
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplQuadroImoveis'
        mmHeight = 3704
        mmLeft = 158221
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object rptQuadroImoveisLabel2: TppLabel
        UserName = 'rptQuadroImoveisLabel2'
        AutoSize = False
        Caption = ' a '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 154517
        mmTop = 794
        mmWidth = 3175
        BandType = 4
      end
      object rptQuadroImoveisDBText2: TppDBText
        UserName = 'rptQuadroImoveisDBText2'
        DataField = 'AREA_OCUPADA'
        DataPipeline = pplQuadroImoveis
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplQuadroImoveis'
        mmHeight = 3704
        mmLeft = 230717
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object rptQuadroImoveisDBText3: TppDBText
        UserName = 'rptQuadroImoveisDBText3'
        DataField = 'ALUGUELM2'
        DataPipeline = pplQuadroImoveis
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplQuadroImoveis'
        mmHeight = 3704
        mmLeft = 258763
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object rptQuadroImoveisLabel8: TppLabel
        UserName = 'rptQuadroImoveisLabel8'
        Caption = 'm2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 246592
        mmTop = 794
        mmWidth = 3704
        BandType = 4
      end
      object rptQuadroImoveisLabel9: TppLabel
        UserName = 'rptQuadroImoveisLabel9'
        Caption = 'm2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 219869
        mmTop = 794
        mmWidth = 3704
        BandType = 4
      end
      object rptQuadroImoveisDBText4: TppDBText
        UserName = 'rptQuadroImoveisDBText4'
        DataField = 'ALUGUEL'
        DataPipeline = pplQuadroImoveis
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplQuadroImoveis'
        mmHeight = 3704
        mmLeft = 175155
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 40
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'ppLine1'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 283898
        BandType = 8
      end
      object ppLabel7: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel7'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc3: TppSystemVariable
        UserName = 'Calc3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 120121
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc4: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 248444
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NOMEMESTRE'
      DataPipeline = pplQuadroImoveis
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplQuadroImoveis'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        AfterPrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
        BeforePrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
        mmBottomOffset = 40
        mmHeight = 17992
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'ppLine3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 8202
          mmWidth = 283898
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'ppLabel8'
          Caption = 'Imóvel Mestre:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 529
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'ppDBText5'
          AutoSize = True
          DataField = 'NOMEMESTRE'
          DataPipeline = pplQuadroImoveis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplQuadroImoveis'
          mmHeight = 3175
          mmLeft = 24077
          mmTop = 529
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object rptQuadroImoveis_LinhaTitulo: TppLine
          OnPrint = rptQuadroImoveis_LinhaTituloPrint
          UserName = 'rptQuadroImoveis_LinhaTitulo'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 4233
          mmTop = 17463
          mmWidth = 279665
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'ppDBText6'
          AutoSize = True
          DataField = 'EnderecoExtenso'
          DataPipeline = pplQuadroImoveis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplQuadroImoveis'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 4498
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'ppLabel10'
          Caption = 'Imóvel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 4233
          mmTop = 13758
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'ppLabel11'
          Caption = 'Locatário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 66940
          mmTop = 13758
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'ppLabel12'
          Caption = 'Área Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 209815
          mmTop = 13758
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppReport1Label1: TppLabel
          UserName = 'ppReport1Label1'
          Caption = 'Vigência do Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 138907
          mmTop = 13758
          mmWidth = 30427
          BandType = 3
          GroupNo = 0
        end
        object rptQuadroImoveisLabel3: TppLabel
          UserName = 'rptQuadroImoveisLabel3'
          AutoSize = False
          Caption = 'Área'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 235215
          mmTop = 10319
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object rptQuadroImoveisLabel4: TppLabel
          UserName = 'rptQuadroImoveisLabel4'
          AutoSize = False
          Caption = 'Ocupada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 235215
          mmTop = 13758
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object rptQuadroImoveisLabel5: TppLabel
          UserName = 'rptQuadroImoveisLabel5'
          AutoSize = False
          Caption = 'Aluguel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 258763
          mmTop = 10319
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object rptQuadroImoveisLabel6: TppLabel
          UserName = 'rptQuadroImoveisLabel6'
          AutoSize = False
          Caption = 'por m2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 258763
          mmTop = 13758
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object rptQuadroImoveisLabel12: TppLabel
          UserName = 'rptQuadroImoveisLabel12'
          AutoSize = False
          Caption = 'Contratual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 175419
          mmTop = 13758
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object rptQuadroImoveisLabel13: TppLabel
          UserName = 'rptQuadroImoveisLabel13'
          AutoSize = False
          Caption = 'Aluguel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 183621
          mmTop = 10319
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        AfterPrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
        BeforePrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
        mmBottomOffset = 40
        mmHeight = 15081
        mmPrintPosition = 0
        object rptQuadroImoveisShape1: TppShape
          UserName = 'rptQuadroImoveisShape1'
          Pen.Width = 2
          mmHeight = 6085
          mmLeft = 174096
          mmTop = 3175
          mmWidth = 110331
          BandType = 5
          GroupNo = 0
        end
        object rptQuadroImoveisLine2: TppLine
          UserName = 'rptQuadroImoveisLine2'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 4233
          mmTop = 0
          mmWidth = 279665
          BandType = 5
          GroupNo = 0
        end
        object rptQuadroImoveisLabel7: TppLabel
          UserName = 'rptQuadroImoveisLabel7'
          Caption = 'Total do Imóvel Mestre:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 137584
          mmTop = 4233
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object rptQuadroImoveisDBCalc1: TppDBCalc
          UserName = 'rptQuadroImoveisDBCalc1'
          DataField = 'IMOAREAGERENCIAL'
          DataPipeline = pplQuadroImoveis
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplQuadroImoveis'
          mmHeight = 3704
          mmLeft = 203994
          mmTop = 4233
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rptQuadroImoveisDBCalc2: TppDBCalc
          UserName = 'rptQuadroImoveisDBCalc2'
          DataField = 'AREA_OCUPADA'
          DataPipeline = pplQuadroImoveis
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplQuadroImoveis'
          mmHeight = 3704
          mmLeft = 230717
          mmTop = 4233
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rptQuadroImoveisDBCalc4: TppDBCalc
          UserName = 'rptQuadroImoveisDBCalc4'
          DataField = 'ALUGUELM2'
          DataPipeline = pplQuadroImoveis
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcAverage
          DataPipelineName = 'pplQuadroImoveis'
          mmHeight = 3704
          mmLeft = 258763
          mmTop = 4233
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rptQuadroImoveisLabel10: TppLabel
          UserName = 'rptQuadroImoveisLabel10'
          Caption = 'm2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 246592
          mmTop = 4233
          mmWidth = 3704
          BandType = 5
          GroupNo = 0
        end
        object rptQuadroImoveisLabel11: TppLabel
          UserName = 'rptQuadroImoveisLabel11'
          Caption = 'm2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 219869
          mmTop = 4233
          mmWidth = 3704
          BandType = 5
          GroupNo = 0
        end
        object rptQuadroImoveisDBCalc5: TppDBCalc
          UserName = 'rptQuadroImoveisDBCalc5'
          DataField = 'ALUGUEL'
          DataPipeline = pplQuadroImoveis
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplQuadroImoveis'
          mmHeight = 3704
          mmLeft = 175155
          mmTop = 4233
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryContratosAdminSint: TwwQuery
    OnCalcFields = qryContratosAdminSintCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATOIMOVEL,'
      '   C.CONNUMERO AS NUMERO_CONTRATO,'
      '   C.CONNOME AS NOME_CONTRATO,'
      '   C.CONINDICEREAJUSTE,'
      '   C.IDLOCATARIO, C.IDADMINIMOVEL, C.CONTAXAADMIN,'
      ''
      '   C.CONDATAINICIO, C.CONDATAFIM,'
      ''
      '   C.CONDIAVENCIMENTO AS VENCTO_ALUGUEL,'
      '   C.FLGTIPODIAVENC AS TIPO_DIA,'
      ''
      '   C.CONDIASTOLERANCIA,'
      '   C.CONVLRAJUSTADO AS VALOR_ALUGUEL,'
      ''
      '   C.CONDATARENEGOC AS DATA_REVISAO,'
      '   C.CONDATAREAJUSTE AS DATA_ULTIMO_REAJUSTE,'
      '   C.CONPROXREAJUSTE AS DATA_PROX_REAJUSTE,'
      '   C.CONDATADENUNCIA AS DATA_DENUNCIA,'
      '   C.CONDATAFIANCAFIM AS DATA_FIM_FIANCA,'
      '   C.CONDATAAVDENUNCIA,'
      '   C.CONDATAAVRENEGOC,'
      ''
      '   M.MOESIGLA AS INDICE_REAJUSTE,'
      ''
      '   SA.AREA_TOTAL,'
      
        '   (DECODE(SA.AREA_TOTAL, 0, 0, (C.CONVLRAJUSTADO / SA.AREA_TOTA' +
        'L))) AS ALUGUEL_M2,'
      ''
      '   PL.RAZAOSOCIAL AS LOCATARIO_RS,'
      '   PL.NOME AS LOCATARIO_NF,'
      '   PA.RAZAOSOCIAL AS ADMINISTRADORA_RS,'
      '   PA.NOME AS ADMINISTRADORA_NF,'
      '   PR.NOME AS RESPONSAVEL_NF,'
      ''
      '   EC.LOGRADOURO, EC.NUMERO, EC.COMPLEMENTO,'
      '   EC.BAIRRO, EC.CEP,'
      '   CID.NOME AS NOME_CIDADE, CID.UF,'
      '   PAIS.NOMEPAIS,'
      ''
      '   M.MSGDESCRICAO'
      ''
      'FROM'
      '   PESSOA PL, PESSOA PA, PESSOA PR,'
      '   CONTRATOIMOVEL C, MOEDA M,'
      '   ENDPESS EC, CIDADES CID, PAIS,'
      '   MSGBOLETO M,'
      ''
      '   ('
      '   SELECT'
      '      CX.IDCONTRATOIMOVEL,'
      ''
      '      SUM(DECODE(CX.FLGRATEIO, 0, I.IMOAREAGERENCIAL,'
      '         DECODE(CX.CIMPERCENTRATEIO, 0, 0,'
      '            DECODE(I.IMOAREAGERENCIAL, NULL, 0,'
      '               I.IMOAREAGERENCIAL * CX.CIMPERCENTRATEIO / 100'
      '            )'
      '         )'
      '      )) AS AREA_TOTAL'
      ''
      '   FROM'
      '      CONTRATOXIMOVEL CX, IMOVEL I'
      '   WHERE'
      '      ( CX.IDIMOVEL = I.IDIMOVEL )'
      '   GROUP BY'
      '      CX.IDCONTRATOIMOVEL'
      '   ) SA'
      ''
      'WHERE'
      '    1=2 AND  ( C.IDPESSOA =:EMPRESAPROP )'
      '   AND ( C.FLGSTATUS = '#39'V'#39' )'
      '   AND ( C.IDLOCATARIO = PL.IDPESSOA )'
      '   AND ( C.IDADMINIMOVEL = PA.IDPESSOA(+) )'
      '   AND ( C.CONINDICEREAJUSTE = M.MOECODIGO(+) )'
      '   AND ( C.IDCONTRATOIMOVEL = SA.IDCONTRATOIMOVEL )'
      '   AND ( C.IDRESPONSAVEL = PR.IDPESSOA(+) )'
      '   AND ( PL.IDENDCOBRANCA = EC.IDENDERECO(+) )'
      '   AND ( PL.IDPESSOA = EC.IDPESSOA(+) )'
      '   AND ( EC.IDCIDADES = CID.IDCIDADES(+) )'
      '   AND ( EC.IDPAIS = PAIS.IDPAIS(+) )'
      '   AND ( C.IDMSGBOLETO = M.IDMSGBOLETO(+) )'
      ''
      'ORDER BY'
      '   C.CONNUMERO, C.CONNOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 448
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryContratosAdminSintContratoExtenso: TStringField
      FieldKind = fkCalculated
      FieldName = 'ContratoExtenso'
      Size = 130
      Calculated = True
    end
    object qryContratosAdminSintIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryContratosAdminSintNUMERO_CONTRATO: TStringField
      FieldName = 'NUMERO_CONTRATO'
    end
    object qryContratosAdminSintNOME_CONTRATO: TStringField
      FieldName = 'NOME_CONTRATO'
      Size = 60
    end
    object qryContratosAdminSintCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
    end
    object qryContratosAdminSintIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
    end
    object qryContratosAdminSintIDADMINIMOVEL: TFloatField
      FieldName = 'IDADMINIMOVEL'
    end
    object qryContratosAdminSintCONTAXAADMIN: TFloatField
      FieldName = 'CONTAXAADMIN'
    end
    object qryContratosAdminSintCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
    end
    object qryContratosAdminSintCONDATAFIM: TDateTimeField
      FieldName = 'CONDATAFIM'
    end
    object qryContratosAdminSintVENCTO_ALUGUEL: TFloatField
      FieldName = 'VENCTO_ALUGUEL'
    end
    object qryContratosAdminSintTIPO_DIA: TStringField
      FieldName = 'TIPO_DIA'
      Size = 1
    end
    object qryContratosAdminSintDATA_REVISAO: TDateTimeField
      FieldName = 'DATA_REVISAO'
    end
    object qryContratosAdminSintDATA_PROX_REAJUSTE: TDateTimeField
      FieldName = 'DATA_PROX_REAJUSTE'
    end
    object qryContratosAdminSintDATA_DENUNCIA: TDateTimeField
      FieldName = 'DATA_DENUNCIA'
    end
    object qryContratosAdminSintCONDATAAVDENUNCIA: TDateTimeField
      FieldName = 'CONDATAAVDENUNCIA'
    end
    object qryContratosAdminSintCONDATAAVRENEGOC: TDateTimeField
      FieldName = 'CONDATAAVRENEGOC'
    end
    object qryContratosAdminSintAREA_TOTAL: TFloatField
      FieldName = 'AREA_TOTAL'
    end
    object qryContratosAdminSintALUGUEL_M2: TFloatField
      FieldName = 'ALUGUEL_M2'
    end
    object qryContratosAdminSintLOCATARIO_RS: TStringField
      FieldName = 'LOCATARIO_RS'
      Size = 60
    end
    object qryContratosAdminSintLOCATARIO_NF: TStringField
      FieldName = 'LOCATARIO_NF'
      Size = 60
    end
    object qryContratosAdminSintADMINISTRADORA_RS: TStringField
      FieldName = 'ADMINISTRADORA_RS'
      Size = 60
    end
    object qryContratosAdminSintADMINISTRADORA_NF: TStringField
      FieldName = 'ADMINISTRADORA_NF'
      Size = 60
    end
    object qryContratosAdminSintDATA_FIM_FIANCA: TDateTimeField
      FieldName = 'DATA_FIM_FIANCA'
    end
    object qryContratosAdminSintRESPONSAVEL_NF: TStringField
      FieldName = 'RESPONSAVEL_NF'
      Size = 60
    end
    object qryContratosAdminSintCONDIASTOLERANCIA: TFloatField
      FieldName = 'CONDIASTOLERANCIA'
    end
    object qryContratosAdminSintVALOR_ALUGUEL: TFloatField
      FieldName = 'VALOR_ALUGUEL'
    end
    object qryContratosAdminSintINDICE_REAJUSTE: TStringField
      FieldName = 'INDICE_REAJUSTE'
      Size = 10
    end
    object qryContratosAdminSintLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qryContratosAdminSintNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object qryContratosAdminSintCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qryContratosAdminSintBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryContratosAdminSintCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryContratosAdminSintNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      Size = 50
    end
    object qryContratosAdminSintNOMEPAIS: TStringField
      FieldName = 'NOMEPAIS'
      Size = 30
    end
    object qryContratosAdminSintMSGDESCRICAO: TStringField
      FieldName = 'MSGDESCRICAO'
      Size = 60
    end
    object qryContratosAdminSintDATA_ULTIMO_REAJUSTE: TDateTimeField
      FieldName = 'DATA_ULTIMO_REAJUSTE'
    end
  end
  object dsContratosAdminSint: TwwDataSource
    DataSet = qryContratosAdminSint
    Left = 448
    Top = 68
  end
  object pplContratosAdminSint: TppBDEPipeline
    DataSource = dsContratosAdminSint
    UserName = 'lContratosAdminSint'
    Left = 448
    Top = 80
    object pplContratosAdminSintppField1: TppField
      FieldAlias = 'ContratoExtenso'
      FieldName = 'ContratoExtenso'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField2: TppField
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField3: TppField
      FieldAlias = 'NUMERO_CONTRATO'
      FieldName = 'NUMERO_CONTRATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField4: TppField
      FieldAlias = 'NOME_CONTRATO'
      FieldName = 'NOME_CONTRATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField5: TppField
      FieldAlias = 'CONINDICEREAJUSTE'
      FieldName = 'CONINDICEREAJUSTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField6: TppField
      FieldAlias = 'IDLOCATARIO'
      FieldName = 'IDLOCATARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField7: TppField
      FieldAlias = 'IDADMINIMOVEL'
      FieldName = 'IDADMINIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField8: TppField
      FieldAlias = 'CONTAXAADMIN'
      FieldName = 'CONTAXAADMIN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField9: TppField
      FieldAlias = 'CONDATAINICIO'
      FieldName = 'CONDATAINICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField10: TppField
      FieldAlias = 'CONDATAFIM'
      FieldName = 'CONDATAFIM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField11: TppField
      FieldAlias = 'VENCTO_ALUGUEL'
      FieldName = 'VENCTO_ALUGUEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField12: TppField
      FieldAlias = 'TIPO_DIA'
      FieldName = 'TIPO_DIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField13: TppField
      FieldAlias = 'DATA_REVISAO'
      FieldName = 'DATA_REVISAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField14: TppField
      FieldAlias = 'DATA_PROX_REAJUSTE'
      FieldName = 'DATA_PROX_REAJUSTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField15: TppField
      FieldAlias = 'DATA_DENUNCIA'
      FieldName = 'DATA_DENUNCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField16: TppField
      FieldAlias = 'CONDATAAVDENUNCIA'
      FieldName = 'CONDATAAVDENUNCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField17: TppField
      FieldAlias = 'CONDATAAVRENEGOC'
      FieldName = 'CONDATAAVRENEGOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField18: TppField
      FieldAlias = 'AREA_TOTAL'
      FieldName = 'AREA_TOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField19: TppField
      FieldAlias = 'ALUGUEL_M2'
      FieldName = 'ALUGUEL_M2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField20: TppField
      FieldAlias = 'LOCATARIO_RS'
      FieldName = 'LOCATARIO_RS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField21: TppField
      FieldAlias = 'LOCATARIO_NF'
      FieldName = 'LOCATARIO_NF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField22: TppField
      FieldAlias = 'ADMINISTRADORA_RS'
      FieldName = 'ADMINISTRADORA_RS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField23: TppField
      FieldAlias = 'ADMINISTRADORA_NF'
      FieldName = 'ADMINISTRADORA_NF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField24: TppField
      FieldAlias = 'DATA_FIM_FIANCA'
      FieldName = 'DATA_FIM_FIANCA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField25: TppField
      FieldAlias = 'RESPONSAVEL_NF'
      FieldName = 'RESPONSAVEL_NF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField26: TppField
      FieldAlias = 'CONDIASTOLERANCIA'
      FieldName = 'CONDIASTOLERANCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField27: TppField
      FieldAlias = 'VALOR_ALUGUEL'
      FieldName = 'VALOR_ALUGUEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField28: TppField
      FieldAlias = 'INDICE_REAJUSTE'
      FieldName = 'INDICE_REAJUSTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField29: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField30: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField31: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField32: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField33: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField34: TppField
      FieldAlias = 'NOME_CIDADE'
      FieldName = 'NOME_CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField35: TppField
      FieldAlias = 'NOMEPAIS'
      FieldName = 'NOMEPAIS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField36: TppField
      FieldAlias = 'MSGDESCRICAO'
      FieldName = 'MSGDESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object pplContratosAdminSintppField37: TppField
      FieldAlias = 'DATA_ULTIMO_REAJUSTE'
      FieldName = 'DATA_ULTIMO_REAJUSTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
  end
  object rptContratosAdminSint: TppReport
    AutoStop = False
    DataPipeline = pplContratosAdminSint
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
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
    Left = 448
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplContratosAdminSint'
    object rptContratosAdminSint_CabecalhoRelat: TppHeaderBand
      AfterPrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
      BeforePrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
      mmBottomOffset = 40
      mmHeight = 38100
      mmPrintPosition = 0
      object ppLabel105: TppLabel
        UserName = 'ppLabel105'
        AutoSize = False
        Caption = 'Contratos (Sintético)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 39158
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel106: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel106'
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
        mmLeft = 39158
        mmTop = 1588
        mmWidth = 197380
        BandType = 0
      end
      object rptContratosLocatarioLabel3: TppLabel
        UserName = 'rptContratosLocatarioLabel3'
        Caption = 'Administradora:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 17992
        mmWidth = 25135
        BandType = 0
      end
      object rptContratosAdminSint_lblAdministradora: TppLabel
        UserName = 'rptContratosAdminSint_lblAdministradora'
        Caption = 'Administradora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 27517
        mmTop = 17992
        mmWidth = 19050
        BandType = 0
      end
      object rptContratosAdminSintLabel1: TppLabel
        UserName = 'rptContratosAdminSintLabel1'
        AutoSize = False
        Caption = 'Área'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 210873
        mmTop = 32015
        mmWidth = 15081
        BandType = 0
      end
      object rptContratosAdminSintLabel3: TppLabel
        UserName = 'rptContratosAdminSintLabel3'
        Caption = 'Contratual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 194734
        mmTop = 34660
        mmWidth = 12171
        BandType = 0
      end
      object rptContratosAdminSintLabel4: TppLabel
        UserName = 'rptContratosAdminSintLabel4'
        Caption = 'Aluguel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 197909
        mmTop = 32015
        mmWidth = 8996
        BandType = 0
      end
      object rptContratosAdminSintLabel5: TppLabel
        UserName = 'rptContratosAdminSintLabel5'
        Caption = 'Índice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 242359
        mmTop = 32015
        mmWidth = 7408
        BandType = 0
      end
      object rptContratosAdminSintLabel6: TppLabel
        UserName = 'rptContratosAdminSintLabel6'
        Caption = 'Reajuste'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 242359
        mmTop = 34660
        mmWidth = 10319
        BandType = 0
      end
      object rptContratosAdminSintLabel7: TppLabel
        UserName = 'rptContratosAdminSintLabel7'
        AutoSize = False
        Caption = 'Ocupada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 210873
        mmTop = 34660
        mmWidth = 15081
        BandType = 0
      end
      object rptContratosAdminSintLabel8: TppLabel
        UserName = 'rptContratosAdminSintLabel8'
        Caption = 'Aluguel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 229394
        mmTop = 32015
        mmWidth = 8996
        BandType = 0
      end
      object rptContratosAdminSintLabel9: TppLabel
        UserName = 'rptContratosAdminSintLabel9'
        Caption = 'por m2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 230188
        mmTop = 34660
        mmWidth = 8467
        BandType = 0
      end
      object rptContratosAdminSintLabel10: TppLabel
        UserName = 'rptContratosAdminSintLabel10'
        Caption = 'Admin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 135202
        mmTop = 34660
        mmWidth = 7408
        BandType = 0
      end
      object rptContratosAdminSintLabel11: TppLabel
        UserName = 'rptContratosAdminSintLabel11'
        Caption = 'Taxa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 137319
        mmTop = 32015
        mmWidth = 5292
        BandType = 0
      end
      object rptContratosAdminSintLabel12: TppLabel
        UserName = 'rptContratosAdminSintLabel12'
        Caption = 'Reajuste'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 255853
        mmTop = 34660
        mmWidth = 10319
        BandType = 0
      end
      object rptContratosAdminSintLabel13: TppLabel
        UserName = 'rptContratosAdminSintLabel13'
        Caption = 'Próximo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 255853
        mmTop = 32015
        mmWidth = 9790
        BandType = 0
      end
      object rptContratosAdminSintLabel14: TppLabel
        UserName = 'rptContratosAdminSintLabel14'
        Caption = 'Aluguel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 181240
        mmTop = 34660
        mmWidth = 8996
        BandType = 0
      end
      object rptContratosAdminSintLabel15: TppLabel
        UserName = 'rptContratosAdminSintLabel15'
        Caption = 'Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 183886
        mmTop = 32015
        mmWidth = 3969
        BandType = 0
      end
      object rptContratosAdminSint_LinhaTitulo: TppLine
        UserName = 'rptContratosAdminSint_LinhaTitulo'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 37571
        mmWidth = 270670
        BandType = 0
      end
      object rptContratosAdminSintLabel16: TppLabel
        UserName = 'rptContratosAdminSintLabel16'
        Caption = 'Vigência do Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 147638
        mmTop = 34660
        mmWidth = 25665
        BandType = 0
      end
      object rptContratosAdminSintLabel17: TppLabel
        UserName = 'rptContratosAdminSintLabel17'
        Caption = 'Administradora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 81492
        mmTop = 34660
        mmWidth = 18256
        BandType = 0
      end
      object rptContratosAdminSintLabel18: TppLabel
        UserName = 'rptContratosAdminSintLabel18'
        Caption = 'Nome do Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 20902
        mmTop = 34660
        mmWidth = 22225
        BandType = 0
      end
      object rptContratosAdminSintLabel19: TppLabel
        UserName = 'rptContratosAdminSintLabel19'
        Caption = 'Nº Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 34660
        mmWidth = 14023
        BandType = 0
      end
      object rptContratosAdminSintLabel23: TppLabel
        UserName = 'rptContratosAdminSintLabel23'
        Caption = 'Responsável:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 22490
        mmWidth = 21167
        BandType = 0
      end
      object rptContratosAdminSint_lblResponsavel: TppLabel
        UserName = 'rptContratosAdminSint_lblResponsavel'
        Caption = 'Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 27517
        mmTop = 22490
        mmWidth = 16404
        BandType = 0
      end
      object rptContratosAdminSintLabel24: TppLabel
        UserName = 'rptContratosAdminSintLabel24'
        Caption = 'Status dos Contratos:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 195263
        mmTop = 17992
        mmWidth = 31221
        BandType = 0
      end
      object rptContratosAdminSint_lblStatus: TppLabel
        UserName = 'rptContratosAdminSint_lblStatus'
        Caption = 'Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 228336
        mmTop = 17992
        mmWidth = 16404
        BandType = 0
      end
      object rptContratosAdminSintLabel26: TppLabel
        UserName = 'rptContratosAdminSintLabel26'
        Caption = ' Reajuste:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 211932
        mmTop = 22490
        mmWidth = 15081
        BandType = 0
      end
      object rptContratosAdminSint_lblReajuste: TppLabel
        UserName = 'rptContratosAdminSint_lblReajuste'
        Caption = 'Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 228336
        mmTop = 22490
        mmWidth = 16404
        BandType = 0
      end
      object rptContratosAdminSint_lblFolha: TppLabel
        UserName = 'rptContratosAdminSint_lblFolha'
        Caption = 'Apenas Contratos que geram Folha em Fevereiro/2001'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 97367
        mmTop = 22490
        mmWidth = 69321
        BandType = 0
      end
      object rptContratosAdminSint_lblFim: TppLabel
        UserName = 'rptContratosAdminSint_lblFim'
        Caption = 'Apenas Contratos com término em Fevereiro/2001'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 100277
        mmTop = 17992
        mmWidth = 63765
        BandType = 0
      end
      object ppLogoContratosSint: TppImage
        UserName = 'ppLogoContratosSint'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'Label71'
        Caption = 'Tipo de Contrato:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 0
        mmTop = 26988
        mmWidth = 27517
        BandType = 0
      end
      object rptContratosAdminSint_lblTipoContrato: TppLabel
        UserName = 'rptContratosAdminSint_lblTipoContrato'
        Caption = 'Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 27517
        mmTop = 26988
        mmWidth = 16404
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 17992
      mmPrintPosition = 0
      object rptContratosAdminSint_FundoBandaDetalhe: TppShape
        OnPrint = rptContratosAdminSint_FundoBandaDetalhePrint
        UserName = 'rptContratosAdminSint_FundoBandaDetalhe'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 17992
        mmLeft = 0
        mmTop = 0
        mmWidth = 270670
        BandType = 4
      end
      object rptContratosAdminSint_Separador: TppLine
        OnPrint = rptContratosAdminSint_SeparadorPrint
        UserName = 'rptContratosAdminSint_Separador'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 270670
        BandType = 4
      end
      object rptContratosAdminSintDBText1: TppDBText
        UserName = 'rptContratosAdminSintDBText1'
        DataField = 'CONDATAINICIO'
        DataPipeline = pplContratosAdminSint
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContratosAdminSint'
        mmHeight = 3175
        mmLeft = 147638
        mmTop = 794
        mmWidth = 14552
        BandType = 4
      end
      object rptContratosAdminSintDBText2: TppDBText
        UserName = 'rptContratosAdminSintDBText2'
        DataField = 'CONDATAFIM'
        DataPipeline = pplContratosAdminSint
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContratosAdminSint'
        mmHeight = 3175
        mmLeft = 165894
        mmTop = 794
        mmWidth = 14552
        BandType = 4
      end
      object rptContratosAdminSintLabel20: TppLabel
        UserName = 'rptContratosAdminSintLabel20'
        AutoSize = False
        Caption = ' a '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 162454
        mmTop = 794
        mmWidth = 3175
        BandType = 4
      end
      object rptContratosAdminSintDBText3: TppDBText
        UserName = 'rptContratosAdminSintDBText3'
        DataField = 'VALOR_ALUGUEL'
        DataPipeline = pplContratosAdminSint
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContratosAdminSint'
        mmHeight = 3175
        mmLeft = 188913
        mmTop = 794
        mmWidth = 17992
        BandType = 4
      end
      object rptContratosAdminSintDBMemo1: TppDBMemo
        UserName = 'rptContratosAdminSintDBMemo1'
        CharWrap = False
        DataField = 'ADMINISTRADORA_NF'
        DataPipeline = pplContratosAdminSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplContratosAdminSint'
        mmHeight = 15875
        mmLeft = 81492
        mmTop = 794
        mmWidth = 47890
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptContratosAdminSintDBMemo2: TppDBMemo
        UserName = 'rptContratosAdminSintDBMemo2'
        CharWrap = False
        DataField = 'NUMERO_CONTRATO'
        DataPipeline = pplContratosAdminSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplContratosAdminSint'
        mmHeight = 15875
        mmLeft = 0
        mmTop = 794
        mmWidth = 20108
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptContratosAdminSintDBMemo3: TppDBMemo
        UserName = 'rptContratosAdminSintDBMemo3'
        CharWrap = False
        DataField = 'NOME_CONTRATO'
        DataPipeline = pplContratosAdminSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplContratosAdminSint'
        mmHeight = 15875
        mmLeft = 20902
        mmTop = 794
        mmWidth = 59796
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptContratosAdminSintDBText4: TppDBText
        UserName = 'rptContratosAdminSintDBText4'
        DataField = 'CONTAXAADMIN'
        DataPipeline = pplContratosAdminSint
        DisplayFormat = '##0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContratosAdminSint'
        mmHeight = 3175
        mmLeft = 130175
        mmTop = 794
        mmWidth = 12435
        BandType = 4
      end
      object rptContratosAdminSintDBText5: TppDBText
        UserName = 'rptContratosAdminSintDBText5'
        DataField = 'VENCTO_ALUGUEL'
        DataPipeline = pplContratosAdminSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplContratosAdminSint'
        mmHeight = 3175
        mmLeft = 182298
        mmTop = 794
        mmWidth = 6879
        BandType = 4
      end
      object rptContratosAdminSintDBText6: TppDBText
        UserName = 'rptContratosAdminSintDBText6'
        DataField = 'AREA_TOTAL'
        DataPipeline = pplContratosAdminSint
        DisplayFormat = '###,##0.00 m2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContratosAdminSint'
        mmHeight = 3175
        mmLeft = 208757
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object rptContratosAdminSintDBText7: TppDBText
        UserName = 'rptContratosAdminSintDBText7'
        DataField = 'ALUGUEL_M2'
        DataPipeline = pplContratosAdminSint
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContratosAdminSint'
        mmHeight = 3175
        mmLeft = 228865
        mmTop = 794
        mmWidth = 9790
        BandType = 4
      end
      object rptContratosAdminSintDBText8: TppDBText
        UserName = 'rptContratosAdminSintDBText8'
        DataField = 'INDICE_REAJUSTE'
        DataPipeline = pplContratosAdminSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContratosAdminSint'
        mmHeight = 3175
        mmLeft = 242359
        mmTop = 794
        mmWidth = 12700
        BandType = 4
      end
      object rptContratosAdminSintDBText9: TppDBText
        UserName = 'rptContratosAdminSintDBText9'
        DataField = 'DATA_PROX_REAJUSTE'
        DataPipeline = pplContratosAdminSint
        DisplayFormat = 'DD/MM/YYYY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContratosAdminSint'
        mmHeight = 3175
        mmLeft = 255853
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      AfterPrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
      BeforePrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
      mmBottomOffset = 40
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine37: TppLine
        UserName = 'ppLine37'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 270670
        BandType = 8
      end
      object ppLabel112: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel112'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc23: TppSystemVariable
        UserName = 'Calc23'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 113506
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc24: TppSystemVariable
        UserName = 'Calc24'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 235215
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
    object rptContratosAdminSintSummaryBand1: TppSummaryBand
      mmBottomOffset = 40
      mmHeight = 25135
      mmPrintPosition = 0
      object rptContratosAdminSintShape1: TppShape
        UserName = 'rptContratosAdminSintShape1'
        Pen.Width = 2
        mmHeight = 5292
        mmLeft = 129117
        mmTop = 5292
        mmWidth = 14817
        BandType = 7
      end
      object rptContratosAdminSintLine1: TppLine
        UserName = 'rptContratosAdminSintLine1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 2646
        mmWidth = 270670
        BandType = 7
      end
      object rptContratosAdminSintLabel2: TppLabel
        UserName = 'rptContratosAdminSintLabel2'
        Caption = 'Total do Imóvel Mestre:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 158221
        mmTop = 6350
        mmWidth = 29898
        BandType = 7
      end
      object rptContratosAdminSintShape2: TppShape
        UserName = 'rptContratosAdminSintShape2'
        Pen.Width = 2
        mmHeight = 5556
        mmLeft = 187855
        mmTop = 5292
        mmWidth = 52123
        BandType = 7
      end
      object rptContratosAdminSintDBCalc1: TppDBCalc
        UserName = 'rptContratosAdminSintDBCalc1'
        DataField = 'VALOR_ALUGUEL'
        DataPipeline = pplContratosAdminSint
        DisplayFormat = '###,###,###,###,###,##0.00;(###,###,###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContratosAdminSint'
        mmHeight = 3175
        mmLeft = 188913
        mmTop = 6350
        mmWidth = 17992
        BandType = 7
      end
      object rptContratosAdminSintDBCalc2: TppDBCalc
        UserName = 'rptContratosAdminSintDBCalc2'
        DataField = 'AREA_TOTAL'
        DataPipeline = pplContratosAdminSint
        DisplayFormat = '###,##0.00 m2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContratosAdminSint'
        mmHeight = 3175
        mmLeft = 208757
        mmTop = 6350
        mmWidth = 17198
        BandType = 7
      end
      object rptContratosAdminSintDBCalc3: TppDBCalc
        UserName = 'rptContratosAdminSintDBCalc3'
        DataField = 'ALUGUEL_M2'
        DataPipeline = pplContratosAdminSint
        DisplayFormat = '###,###,###,###,###,##0.00;(###,###,###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcAverage
        DataPipelineName = 'pplContratosAdminSint'
        mmHeight = 3175
        mmLeft = 228865
        mmTop = 6350
        mmWidth = 9790
        BandType = 7
      end
      object rptContratosAdminSintDBCalc4: TppDBCalc
        UserName = 'rptContratosAdminSintDBCalc4'
        DataField = 'CONTAXAADMIN'
        DataPipeline = pplContratosAdminSint
        DisplayFormat = '##0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcAverage
        DataPipelineName = 'pplContratosAdminSint'
        mmHeight = 2910
        mmLeft = 130175
        mmTop = 6350
        mmWidth = 12435
        BandType = 7
      end
      object rptContratosAdminSintLabel21: TppLabel
        UserName = 'rptContratosAdminSintLabel21'
        Caption = 'Tx. Média:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 115094
        mmTop = 6350
        mmWidth = 14288
        BandType = 7
      end
      object rptContratosAdminSintDBCalc5: TppDBCalc
        UserName = 'rptContratosAdminSintDBCalc5'
        DataField = 'NOME_CONTRATO'
        DataPipeline = pplContratosAdminSint
        DisplayFormat = '###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pplContratosAdminSint'
        mmHeight = 3175
        mmLeft = 45244
        mmTop = 6350
        mmWidth = 17198
        BandType = 7
      end
      object rptContratosAdminSintLabel22: TppLabel
        UserName = 'rptContratosAdminSintLabel22'
        Caption = 'Total de Contratos:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 20902
        mmTop = 6350
        mmWidth = 24606
        BandType = 7
      end
    end
  end
  object qryListagemImovel: TwwQuery
    OnCalcFields = qryListagemImovelCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IM.IDIMOVEL AS IDMESTRE, '
      '   '#39' teste '#39' AS NOMEMESTRE,'
      '   IM.IMOLOGRADOURO, IM.IMONUMERO, IM.IMOBAIRRO, IM.IMOCEP,'
      '   CID.NOME AS DSC_CIDADE, CID.UF AS DSC_UF,'
      ''
      '   I.IMONOME AS NOMEIMOVEL, I.IMOMATRICULA, I.IMOCODIGO,'
      '   I.FLGSTATUSOCUPACAO, I.IDIMOVEL, I.IMOAREA,'
      ''
      '   I.IMOVLRCOMPRA, I.IMODATACOMPRA, I.IMOMOEDACOMPRA,'
      '   I.IMOVLRREAVAL, I.IMODATAREAVAL, I.IMOMOEDAREAVAL,'
      '   I.IMOVLRMERCADO, I.IMODATAMERCADO, I.IMOMOEDAMERCADO,'
      ''
      '   M.MOESIGLA AS MOEDA_COMPRA,'
      '   MR.MOESIGLA AS MOEDA_REAVAL,'
      '   T.DESCTIPOIMOVEL AS TIPO_IMOVEL,'
      ''
      '   I.IMOVAGAS,'
      '   I.IMOFRACAOIDEAL,'
      ''
      '   I.IMOAREACOMUM, I.IMOAREATOTAL, I.IMOAREAGERENCIAL,'
      ''
      
        '   DECODE(I.FLGSTATUSOCUPACAO, NULL, '#39'VAGO'#39', DECODE(I.FLGSTATUSO' +
        'CUPACAO, '#39'O'#39', '#39'Ocupado'#39', '#39'VAGO'#39')) AS OCUPACAO_IMOVEL'
      ''
      ',   0 AS CUSTO_CONTABIL'
      ''
      'FROM'
      
        '   IMOVEL I, IMOVEL IM, TIPOIMOVEL T, MOEDA M, CIDADES CID, MOED' +
        'A MR'
      ''
      'WHERE'
      '   1=2 AND (I.IDPESSOA =:PIDPESSOA )'
      
        '   AND ( (:PIDIMOVELMESTRE IS NULL) OR (I.IDIMOVELMESTRE =:PIDIM' +
        'OVELMESTRE) )'
      
        '   AND ( (:PCODTIPIMOVEL IS NULL) OR (I.CODTIPIMOVEL =:PCODTIPIM' +
        'OVEL) )'
      
        '   AND ( (:PFLGSTATUSOCUPACAO IS NULL) OR ((:PFLGSTATUSOCUPACAO ' +
        'IS NOT NULL) AND (I.FLGSTATUSOCUPACAO =:PFLGSTATUSOCUPACAO)) )'
      '   AND ( (:PIMOAREA IS NULL) OR (I.IMOAREA > 0) )'
      '   AND ( (:PIMOVLRCOMPRA IS NULL) OR (I.IMOVLRCOMPRA <> 0) )'
      '   AND ( (:PFLGATIVO IS NULL) OR (I.FLGATIVO = 1) )'
      ''
      '   AND ( IM.FLGTIPOIMOVEL = 0 )'
      '   AND ( I.FLGTIPOIMOVEL = 1 )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL(+) )'
      '   AND ( IM.IDCIDADES = CID.IDCIDADES(+) )'
      '   AND ( I.CODTIPIMOVEL = T.CODTIPIMOVEL(+) )'
      '   AND ( I.IMOMOEDACOMPRA = M.MOECODIGO (+) )'
      '   AND ( I.IMOMOEDAREAVAL = MR.MOECODIGO (+) )'
      'ORDER BY   '
      '  NOMEIMOVEL'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 40
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGSTATUSOCUPACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGSTATUSOCUPACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGSTATUSOCUPACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIMOAREA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIMOVLRCOMPRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGATIVO'
        ParamType = ptUnknown
      end>
    object StringField15: TStringField
      FieldKind = fkCalculated
      FieldName = 'EnderecoExtenso'
      Size = 120
      Calculated = True
    end
    object StringField18: TStringField
      FieldKind = fkCalculated
      FieldName = 'Ocupacao'
      Size = 12
      Calculated = True
    end
    object DateTimeField5: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'DataReferencia'
      Calculated = True
    end
    object qryListagemImovelIDMESTRE: TFloatField
      FieldName = 'IDMESTRE'
    end
    object qryListagemImovelNOMEMESTRE: TStringField
      FieldName = 'NOMEMESTRE'
      Size = 60
    end
    object qryListagemImovelIMONUMERO: TStringField
      FieldName = 'IMONUMERO'
      Size = 8
    end
    object qryListagemImovelIMOBAIRRO: TStringField
      FieldName = 'IMOBAIRRO'
    end
    object qryListagemImovelIMOCEP: TStringField
      FieldName = 'IMOCEP'
      Size = 8
    end
    object qryListagemImovelNOMEIMOVEL: TStringField
      FieldName = 'NOMEIMOVEL'
      Size = 60
    end
    object qryListagemImovelIMOMATRICULA: TStringField
      FieldName = 'IMOMATRICULA'
    end
    object qryListagemImovelFLGSTATUSOCUPACAO: TStringField
      FieldName = 'FLGSTATUSOCUPACAO'
      Size = 1
    end
    object qryListagemImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryListagemImovelIMOAREA: TFloatField
      FieldName = 'IMOAREA'
    end
    object qryListagemImovelTIPO_IMOVEL: TStringField
      FieldName = 'TIPO_IMOVEL'
      Size = 25
    end
    object qryListagemImovelOCUPACAO_IMOVEL: TStringField
      FieldName = 'OCUPACAO_IMOVEL'
      Size = 7
    end
    object qryListagemImovelIMOVLRCOMPRA: TFloatField
      FieldName = 'IMOVLRCOMPRA'
    end
    object qryListagemImovelIMODATACOMPRA: TDateTimeField
      FieldName = 'IMODATACOMPRA'
    end
    object qryListagemImovelIMOMOEDACOMPRA: TFloatField
      FieldName = 'IMOMOEDACOMPRA'
    end
    object qryListagemImovelMOEDA_COMPRA: TStringField
      FieldName = 'MOEDA_COMPRA'
      Size = 10
    end
    object qryListagemImovelIMOLOGRADOURO: TStringField
      FieldName = 'IMOLOGRADOURO'
      Size = 80
    end
    object qryListagemImovelIMOVLRREAVAL: TFloatField
      FieldName = 'IMOVLRREAVAL'
    end
    object qryListagemImovelIMODATAREAVAL: TDateTimeField
      FieldName = 'IMODATAREAVAL'
    end
    object qryListagemImovelIMOMOEDAREAVAL: TFloatField
      FieldName = 'IMOMOEDAREAVAL'
    end
    object qryListagemImovelIMOVLRMERCADO: TFloatField
      FieldName = 'IMOVLRMERCADO'
    end
    object qryListagemImovelIMODATAMERCADO: TDateTimeField
      FieldName = 'IMODATAMERCADO'
    end
    object qryListagemImovelIMOMOEDAMERCADO: TFloatField
      FieldName = 'IMOMOEDAMERCADO'
    end
    object qryListagemImovelIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object qryListagemImovelDSC_CIDADE: TStringField
      FieldName = 'DSC_CIDADE'
      Size = 50
    end
    object qryListagemImovelDSC_UF: TStringField
      FieldName = 'DSC_UF'
      FixedChar = True
      Size = 3
    end
    object qryListagemImovelIMOVAGAS: TFloatField
      FieldName = 'IMOVAGAS'
    end
    object qryListagemImovelIMOFRACAOIDEAL: TFloatField
      FieldName = 'IMOFRACAOIDEAL'
    end
    object qryListagemImovelMOEDA_REAVAL: TStringField
      FieldName = 'MOEDA_REAVAL'
      Size = 10
    end
    object qryListagemImovelIMOAREACOMUM: TFloatField
      FieldName = 'IMOAREACOMUM'
    end
    object qryListagemImovelIMOAREATOTAL: TFloatField
      FieldName = 'IMOAREATOTAL'
    end
    object qryListagemImovelIMOAREAGERENCIAL: TFloatField
      FieldName = 'IMOAREAGERENCIAL'
    end
  end
  object dsListagemImovel: TwwDataSource
    DataSet = qryListagemImovel
    Left = 40
    Top = 204
  end
  object pplListagemImovel: TppBDEPipeline
    DataSource = dsListagemImovel
    UserName = 'lListagemImovel'
    Left = 48
    Top = 232
    object pplListagemImovelppField1: TppField
      FieldAlias = 'EnderecoExtenso'
      FieldName = 'EnderecoExtenso'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplListagemImovelppField2: TppField
      FieldAlias = 'Ocupacao'
      FieldName = 'Ocupacao'
      FieldLength = 12
      DisplayWidth = 12
      Position = 1
    end
    object pplListagemImovelppField3: TppField
      FieldAlias = 'DataReferencia'
      FieldName = 'DataReferencia'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object pplListagemImovelppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDMESTRE'
      FieldName = 'IDMESTRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplListagemImovelppField5: TppField
      FieldAlias = 'NOMEMESTRE'
      FieldName = 'NOMEMESTRE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplListagemImovelppField6: TppField
      FieldAlias = 'IMONUMERO'
      FieldName = 'IMONUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 5
    end
    object pplListagemImovelppField7: TppField
      FieldAlias = 'IMOBAIRRO'
      FieldName = 'IMOBAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object pplListagemImovelppField8: TppField
      FieldAlias = 'IMOCEP'
      FieldName = 'IMOCEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 7
    end
    object pplListagemImovelppField9: TppField
      FieldAlias = 'NOMEIMOVEL'
      FieldName = 'NOMEIMOVEL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object pplListagemImovelppField10: TppField
      FieldAlias = 'IMOMATRICULA'
      FieldName = 'IMOMATRICULA'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object pplListagemImovelppField11: TppField
      FieldAlias = 'FLGSTATUSOCUPACAO'
      FieldName = 'FLGSTATUSOCUPACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 10
    end
    object pplListagemImovelppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplListagemImovelppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOAREA'
      FieldName = 'IMOAREA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplListagemImovelppField14: TppField
      FieldAlias = 'TIPO_IMOVEL'
      FieldName = 'TIPO_IMOVEL'
      FieldLength = 25
      DisplayWidth = 25
      Position = 13
    end
    object pplListagemImovelppField15: TppField
      FieldAlias = 'OCUPACAO_IMOVEL'
      FieldName = 'OCUPACAO_IMOVEL'
      FieldLength = 7
      DisplayWidth = 7
      Position = 14
    end
    object pplListagemImovelppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOVLRCOMPRA'
      FieldName = 'IMOVLRCOMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplListagemImovelppField17: TppField
      FieldAlias = 'IMODATACOMPRA'
      FieldName = 'IMODATACOMPRA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 16
    end
    object pplListagemImovelppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOMOEDACOMPRA'
      FieldName = 'IMOMOEDACOMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplListagemImovelppField19: TppField
      FieldAlias = 'MOEDA_COMPRA'
      FieldName = 'MOEDA_COMPRA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 18
    end
    object pplListagemImovelppField20: TppField
      FieldAlias = 'IMOLOGRADOURO'
      FieldName = 'IMOLOGRADOURO'
      FieldLength = 80
      DisplayWidth = 80
      Position = 19
    end
    object pplListagemImovelppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOVLRREAVAL'
      FieldName = 'IMOVLRREAVAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplListagemImovelppField22: TppField
      FieldAlias = 'IMODATAREAVAL'
      FieldName = 'IMODATAREAVAL'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 21
    end
    object pplListagemImovelppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOMOEDAREAVAL'
      FieldName = 'IMOMOEDAREAVAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplListagemImovelppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOVLRMERCADO'
      FieldName = 'IMOVLRMERCADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplListagemImovelppField25: TppField
      FieldAlias = 'IMODATAMERCADO'
      FieldName = 'IMODATAMERCADO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 24
    end
    object pplListagemImovelppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOMOEDAMERCADO'
      FieldName = 'IMOMOEDAMERCADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplListagemImovelppField27: TppField
      FieldAlias = 'IMOCODIGO'
      FieldName = 'IMOCODIGO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 26
    end
    object pplListagemImovelppField28: TppField
      FieldAlias = 'DSC_CIDADE'
      FieldName = 'DSC_CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 27
    end
    object pplListagemImovelppField29: TppField
      FieldAlias = 'DSC_UF'
      FieldName = 'DSC_UF'
      FieldLength = 3
      DisplayWidth = 3
      Position = 28
    end
    object pplListagemImovelppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOVAGAS'
      FieldName = 'IMOVAGAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object pplListagemImovelppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOFRACAOIDEAL'
      FieldName = 'IMOFRACAOIDEAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object pplListagemImovelppField32: TppField
      FieldAlias = 'MOEDA_REAVAL'
      FieldName = 'MOEDA_REAVAL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 31
    end
    object pplListagemImovelppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOAREACOMUM'
      FieldName = 'IMOAREACOMUM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object pplListagemImovelppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOAREATOTAL'
      FieldName = 'IMOAREATOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object pplListagemImovelppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOAREAGERENCIAL'
      FieldName = 'IMOAREAGERENCIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
  end
  object rptListagemImovel: TppReport
    AutoStop = False
    DataPipeline = pplListagemImovel
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
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
    Left = 40
    Top = 144
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplListagemImovel'
    object ppHeaderBand14: TppHeaderBand
      mmBottomOffset = 40
      mmHeight = 19050
      mmPrintPosition = 0
      object ppLabel129: TppLabel
        UserName = 'ppLabel129'
        AutoSize = False
        Caption = 'Listagem de Imóveis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 16669
        mmTop = 8731
        mmWidth = 253471
        BandType = 0
      end
      object ppLabel130: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel130'
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
        mmLeft = 16669
        mmTop = 1588
        mmWidth = 253471
        BandType = 0
      end
      object ppLogoTipo: TppImage
        UserName = 'ppLogoTipo'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
    end
    object rptListagemImovel_bndImovel: TppDetailBand
      BeforePrint = rptListagemImovel_bndImovelBeforePrint
      BeforeGenerate = rptListagemImovel_bndImovelBeforeGenerate
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 17463
      mmPrintPosition = 0
      object ppDBText48: TppDBText
        UserName = 'ppDBText48'
        DataField = 'IMOAREA'
        DataPipeline = pplListagemImovel
        DisplayFormat = '###,###,##0.00 m2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 3175
        mmLeft = 147373
        mmTop = 1323
        mmWidth = 16933
        BandType = 4
      end
      object ppDBMemo16: TppDBMemo
        UserName = 'ppDBMemo16'
        CharWrap = False
        DataField = 'NOMEIMOVEL'
        DataPipeline = pplListagemImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 15875
        mmLeft = 41010
        mmTop = 1588
        mmWidth = 47096
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText50: TppDBText
        UserName = 'ppDBText50'
        DataField = 'OCUPACAO_IMOVEL'
        DataPipeline = pplListagemImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 2910
        mmLeft = 258763
        mmTop = 1588
        mmWidth = 11906
        BandType = 4
      end
      object rptListagemImovelDBText4: TppDBText
        UserName = 'rptListagemImovelDBText4'
        DataField = 'IMOVLRCOMPRA'
        DataPipeline = pplListagemImovel
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 3175
        mmLeft = 183357
        mmTop = 1323
        mmWidth = 22225
        BandType = 4
      end
      object rptListagemImovelDBText5: TppDBText
        UserName = 'rptListagemImovelDBText5'
        DataField = 'IMODATACOMPRA'
        DataPipeline = pplListagemImovel
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 3175
        mmLeft = 167746
        mmTop = 1323
        mmWidth = 15346
        BandType = 4
      end
      object rptListagemImovelDBText6: TppDBText
        UserName = 'rptListagemImovelDBText6'
        DataField = 'MOEDA_COMPRA'
        DataPipeline = pplListagemImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 3175
        mmLeft = 206375
        mmTop = 1323
        mmWidth = 4763
        BandType = 4
      end
      object rptListagemImovelDBMemo1: TppDBMemo
        UserName = 'rptListagemImovelDBMemo1'
        CharWrap = False
        DataField = 'IMOMATRICULA'
        DataPipeline = pplListagemImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 15875
        mmLeft = 0
        mmTop = 1588
        mmWidth = 25135
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptListagemImovelDBMemo2: TppDBMemo
        UserName = 'rptListagemImovelDBMemo2'
        CharWrap = False
        DataField = 'TIPO_IMOVEL'
        DataPipeline = pplListagemImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 15875
        mmLeft = 88636
        mmTop = 1588
        mmWidth = 30956
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptListagemImovelDBMemo4: TppDBMemo
        UserName = 'rptListagemImovelDBMemo4'
        CharWrap = False
        DataField = 'IMOCODIGO'
        DataPipeline = pplListagemImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 15875
        mmLeft = 25665
        mmTop = 1588
        mmWidth = 14552
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'IMOFRACAOIDEAL'
        DataPipeline = pplListagemImovel
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 2910
        mmLeft = 120386
        mmTop = 1588
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'IMOVAGAS'
        DataPipeline = pplListagemImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 2910
        mmLeft = 136261
        mmTop = 1588
        mmWidth = 9260
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'IMODATAREAVAL'
        DataPipeline = pplListagemImovel
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 3175
        mmLeft = 214048
        mmTop = 1323
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'IMOVLRREAVAL'
        DataPipeline = pplListagemImovel
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 3175
        mmLeft = 229659
        mmTop = 1323
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'MOEDA_REAVAL'
        DataPipeline = pplListagemImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 3175
        mmLeft = 252942
        mmTop = 1323
        mmWidth = 4763
        BandType = 4
      end
    end
    object ppFooterBand14: TppFooterBand
      mmBottomOffset = 40
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine41: TppLine
        UserName = 'ppLine41'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 270670
        BandType = 8
      end
      object ppLabel136: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel136'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc27: TppSystemVariable
        UserName = 'Calc27'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 113506
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc28: TppSystemVariable
        UserName = 'Calc28'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 235480
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
    object ppGroup11: TppGroup
      BreakName = 'NOMEMESTRE'
      DataPipeline = pplListagemImovel
      OutlineSettings.CreateNode = True
      UserName = 'Group11'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplListagemImovel'
      object ppGroupHeaderBand11: TppGroupHeaderBand
        mmBottomOffset = 40
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLine42: TppLine
          UserName = 'ppLine42'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 794
          mmLeft = 0
          mmTop = 4498
          mmWidth = 270670
          BandType = 3
          GroupNo = 0
        end
        object ppLabel137: TppLabel
          UserName = 'ppLabel137'
          Caption = 'Imóvel Mestre:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppDBText58: TppDBText
          UserName = 'ppDBText58'
          AutoSize = True
          DataField = 'NOMEMESTRE'
          DataPipeline = pplListagemImovel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplListagemImovel'
          mmHeight = 4233
          mmLeft = 26194
          mmTop = 0
          mmWidth = 24606
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand11: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 40
        mmHeight = 30956
        mmPrintPosition = 0
        object ppShape3: TppShape
          UserName = 'ppShape3'
          Pen.Width = 2
          mmHeight = 5556
          mmLeft = 123296
          mmTop = 3175
          mmWidth = 137054
          BandType = 5
          GroupNo = 0
        end
        object ppLine44: TppLine
          UserName = 'ppLine44'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 4233
          mmTop = 1058
          mmWidth = 266436
          BandType = 5
          GroupNo = 0
        end
        object ppLabel150: TppLabel
          UserName = 'ppLabel150'
          Caption = 'Totais do Imóvel Mestre:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 92604
          mmTop = 4763
          mmWidth = 30692
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'ppDBCalc5'
          DataField = 'IMOAREA'
          DataPipeline = pplListagemImovel
          DisplayFormat = '###,###,##0.00 m2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplListagemImovel'
          mmHeight = 3175
          mmLeft = 124354
          mmTop = 4233
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'ppDBCalc7'
          DataField = 'CUSTO_CONTABIL'
          DataPipeline = pplListagemImovel
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplListagemImovel'
          mmHeight = 3175
          mmLeft = 235744
          mmTop = 4233
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object rptListagemImovelLabel8: TppLabel
          UserName = 'rptListagemImovelLabel8'
          Caption = 'Total de Imóveis:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 12700
          mmTop = 4763
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object rptListagemImovelDBCalc1: TppDBCalc
          UserName = 'rptListagemImovelDBCalc1'
          DataField = 'NOMEIMOVEL'
          DataPipeline = pplListagemImovel
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup11
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplListagemImovel'
          mmHeight = 3175
          mmLeft = 34925
          mmTop = 4498
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'IMOVLRREAVAL'
          DataPipeline = pplListagemImovel
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplListagemImovel'
          mmHeight = 3175
          mmLeft = 200290
          mmTop = 4233
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'IMOVLRCOMPRA'
          DataPipeline = pplListagemImovel
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplListagemImovel'
          mmHeight = 3175
          mmLeft = 156369
          mmTop = 4233
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
        end
        object ppSubReport3: TppSubReport
          OnPrint = ppSubReport3Print
          UserName = 'SubReport3'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentPrinterSetup = False
          ParentWidth = False
          TraverseAllData = False
          DataPipelineName = 'pplSegImoveis'
          mmHeight = 4233
          mmLeft = 0
          mmTop = 12700
          mmWidth = 270140
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport3: TppChildReport
            AutoStop = False
            DataPipeline = pplSegImoveis
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.Orientation = poLandscape
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6615
            PrinterSetup.mmMarginLeft = 13229
            PrinterSetup.mmMarginRight = 13229
            PrinterSetup.mmMarginTop = 6615
            PrinterSetup.mmPaperHeight = 210080
            PrinterSetup.mmPaperWidth = 297128
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Left = 320
            Top = 232
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplSegImoveis'
            object ppTitleBand3: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 11377
              mmPrintPosition = 0
              object ppLabel74: TppLabel
                UserName = 'Label74'
                Caption = 'Resumo de Segragação -  Por Imóvel Mestre'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 2910
                mmLeft = 0
                mmTop = 2381
                mmWidth = 52652
                BandType = 1
              end
              object ppLabel73: TppLabel
                UserName = 'Label73'
                Caption = 'Patrocinador'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 2910
                mmLeft = 0
                mmTop = 8467
                mmWidth = 20108
                BandType = 1
              end
              object ppLabel75: TppLabel
                UserName = 'Label75'
                Caption = 'Plano Previdenciário'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 2910
                mmLeft = 24342
                mmTop = 8467
                mmWidth = 30163
                BandType = 1
              end
              object ppLabel76: TppLabel
                UserName = 'Label76'
                Caption = '%'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 77788
                mmTop = 8467
                mmWidth = 2117
                BandType = 1
              end
              object ppLabel77: TppLabel
                UserName = 'Label77'
                Caption = 'Valor Aquisição'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 82550
                mmTop = 8467
                mmWidth = 26723
                BandType = 1
              end
              object ppLabel78: TppLabel
                UserName = 'Label78'
                Caption = 'Valor Atualizado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 110861
                mmTop = 8467
                mmWidth = 28310
                BandType = 1
              end
            end
            object ppDetailBand7: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object ppDBText41: TppDBText
                UserName = 'DBText41'
                DataField = 'PATROCINADORA'
                DataPipeline = pplSegImoveis
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplSegImoveis'
                mmHeight = 3969
                mmLeft = 0
                mmTop = 0
                mmWidth = 21960
                BandType = 4
              end
              object ppDBText44: TppDBText
                UserName = 'DBText44'
                DataField = 'PLANOPREV'
                DataPipeline = pplSegImoveis
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplSegImoveis'
                mmHeight = 3979
                mmLeft = 24342
                mmTop = 0
                mmWidth = 40217
                BandType = 4
              end
              object ppDBText45: TppDBText
                UserName = 'DBText45'
                DataField = 'PERCENTRATEIO'
                DataPipeline = pplSegImoveis
                DisplayFormat = '###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplSegImoveis'
                mmHeight = 3969
                mmLeft = 67733
                mmTop = 0
                mmWidth = 12171
                BandType = 4
              end
              object ppDBText46: TppDBText
                UserName = 'DBText46'
                OnGetText = ppDBText46GetText
                DataField = 'VALOR_AQ'
                DataPipeline = pplSegImoveis
                DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplSegImoveis'
                mmHeight = 3979
                mmLeft = 82550
                mmTop = 265
                mmWidth = 26723
                BandType = 4
              end
              object ppDBText47: TppDBText
                UserName = 'DBText47'
                OnGetText = ppDBText47GetText
                DataField = 'VALOR_ULT_AQ'
                DataPipeline = pplSegImoveis
                DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplSegImoveis'
                mmHeight = 3969
                mmLeft = 110861
                mmTop = 0
                mmWidth = 27781
                BandType = 4
              end
            end
            object ppSummaryBand3: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object raCodeModule2: TraCodeModule
              ProgramStream = {00}
            end
          end
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'NOMEMESTRE'
      DataPipeline = pplListagemImovel
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplListagemImovel'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object ppSubReport2: TppSubReport
          UserName = 'SubReport2'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplCompSocietaria'
          mmHeight = 4233
          mmLeft = 0
          mmTop = 3969
          mmWidth = 270670
          BandType = 3
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = pplCompSocietaria
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.Orientation = poLandscape
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6615
            PrinterSetup.mmMarginLeft = 13229
            PrinterSetup.mmMarginRight = 13229
            PrinterSetup.mmMarginTop = 6615
            PrinterSetup.mmPaperHeight = 210080
            PrinterSetup.mmPaperWidth = 297128
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Left = 280
            Top = 192
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplCompSocietaria'
            object ppTitleBand2: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 6879
              mmPrintPosition = 0
              object ppLabel14: TppLabel
                UserName = 'Label14'
                Caption = 'Composição Societária:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold, fsItalic]
                Transparent = True
                mmHeight = 2910
                mmLeft = 0
                mmTop = 3440
                mmWidth = 27781
                BandType = 1
              end
              object ppLine2: TppLine
                UserName = 'Line1'
                ParentWidth = True
                Weight = 0.75
                mmHeight = 265
                mmLeft = 0
                mmTop = 6615
                mmWidth = 270670
                BandType = 1
              end
            end
            object ppDetailBand4: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 3175
              mmPrintPosition = 0
              object ppDBText11: TppDBText
                UserName = 'DBText11'
                DataField = 'PERCENTUAL'
                DataPipeline = pplCompSocietaria
                DisplayFormat = '###,###,##0.00 %'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplCompSocietaria'
                mmHeight = 2910
                mmLeft = 79640
                mmTop = 265
                mmWidth = 17198
                BandType = 4
              end
              object ppDBText12: TppDBText
                UserName = 'DBText12'
                DataField = 'NOME'
                DataPipeline = pplCompSocietaria
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplCompSocietaria'
                mmHeight = 2910
                mmLeft = 0
                mmTop = 265
                mmWidth = 79111
                BandType = 4
              end
            end
            object ppSummaryBand2: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
        object ppDBText59: TppDBText
          UserName = 'ppDBText59'
          AutoSize = True
          DataField = 'EnderecoExtenso'
          DataPipeline = pplListagemImovel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplListagemImovel'
          mmHeight = 3175
          mmLeft = 265
          mmTop = 265
          mmWidth = 22225
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 265
        mmPrintPosition = 0
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'NOMEMESTRE'
      DataPipeline = pplListagemImovel
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplListagemImovel'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object rptListagemImovelLabel1: TppLabel
          UserName = 'rptListagemImovelLabel1'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 265
          mmTop = 4498
          mmWidth = 10848
          BandType = 3
          GroupNo = 2
        end
        object rptListagemImovelLabel7: TppLabel
          UserName = 'rptListagemImovelLabel7'
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 25929
          mmTop = 4498
          mmWidth = 8467
          BandType = 3
          GroupNo = 2
        end
        object ppLabel138: TppLabel
          UserName = 'ppLabel138'
          Caption = 'Nome do Imóvel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 41275
          mmTop = 4498
          mmWidth = 19315
          BandType = 3
          GroupNo = 2
        end
        object rptListagemImovelLabel2: TppLabel
          UserName = 'rptListagemImovelLabel2'
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 88636
          mmTop = 4498
          mmWidth = 5027
          BandType = 3
          GroupNo = 2
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Fração Ideal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 120915
          mmTop = 4498
          mmWidth = 13494
          BandType = 3
          GroupNo = 2
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Nº Vagas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 135996
          mmTop = 4498
          mmWidth = 10319
          BandType = 3
          GroupNo = 2
        end
        object rptListagemImovelLabel3: TppLabel
          UserName = 'rptListagemImovelLabel3'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 177007
          mmTop = 4233
          mmWidth = 5292
          BandType = 3
          GroupNo = 2
        end
        object rptListagemImovelLabel4: TppLabel
          UserName = 'rptListagemImovelLabel4'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 199496
          mmTop = 4233
          mmWidth = 6085
          BandType = 3
          GroupNo = 2
        end
        object rptListagemImovelLabel9: TppLabel
          UserName = 'rptListagemImovelLabel9'
          Caption = 'Aquisição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 184944
          mmTop = 0
          mmWidth = 11642
          BandType = 3
          GroupNo = 2
        end
        object rptListagemImovelLine1: TppLine
          UserName = 'rptListagemImovelLine1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 168275
          mmTop = 3175
          mmWidth = 42069
          BandType = 3
          GroupNo = 2
        end
        object ppLabel143: TppLabel
          UserName = 'ppLabel143'
          AutoSize = False
          Caption = 'Área Útil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 151871
          mmTop = 4498
          mmWidth = 12435
          BandType = 3
          GroupNo = 2
        end
        object ppLine43: TppLine
          UserName = 'ppLine43'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 794
          mmTop = 7144
          mmWidth = 269876
          BandType = 3
          GroupNo = 2
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Ult. Reavaliação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 227542
          mmTop = 0
          mmWidth = 18785
          BandType = 3
          GroupNo = 2
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 214578
          mmTop = 3175
          mmWidth = 41804
          BandType = 3
          GroupNo = 2
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 222780
          mmTop = 4233
          mmWidth = 5292
          BandType = 3
          GroupNo = 2
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 246063
          mmTop = 4233
          mmWidth = 6085
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryContratosAdminAnal: TwwQuery
    OnCalcFields = qryContratosAdminAnalCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATOIMOVEL,'
      '   C.CONNUMERO, C.CONNOME,'
      '   C.CONDATAINICIO, C.CONDATAFIM,'
      '   C.CONVLRAJUSTADO, C.CONINDICEREAJUSTE,'
      '   C.IDLOCATARIO, C.IDADMINIMOVEL, C.CONTAXAADMIN,'
      ''
      '   CX.IDIMOVEL, CX.CIMVLRAJUSTADO, CX.CIMDESCRICAO,'
      '   CX.FLGRATEIO, CX.CIMPERCENTRATEIO,'
      ''
      '   I.IMOCODIGO AS CODIGO_IMOVEL,'
      ''
      '   IM.IMONOME AS NOME_MESTRE, I.IMONOME AS NOME_IMOVEL,'
      '   (IM.IMONOME||'#39' - '#39'||I.IMONOME) AS IMOVEL_EXTENSO,'
      ''
      '   DECODE(CX.FLGRATEIO, NULL, I.IMOAREAGERENCIAL, '
      '      DECODE(CX.FLGRATEIO, 0, I.IMOAREAGERENCIAL, '
      '         DECODE(CX.CIMPERCENTRATEIO, 0, 0, '
      '            DECODE(I.IMOAREAGERENCIAL, NULL, 0, '
      '               I.IMOAREAGERENCIAL * CX.CIMPERCENTRATEIO / 100 '
      '            ) '
      '         )'
      '      )'
      '   ) AS AREA_OCUPADA,'
      ''
      
        '   DECODE(CX.CIMVLRAJUSTADO, NULL, 0, CX.CIMVLRAJUSTADO) AS ALUG' +
        'UEL,'
      ''
      '   DECODE(CX.CIMVLRAJUSTADO, NULL, 0,'
      '      DECODE(I.IMOAREAGERENCIAL, NULL, 0,'
      '         DECODE(I.IMOAREAGERENCIAL, 0, 0,'
      
        '            DECODE(CX.FLGRATEIO, NULL, (CX.CIMVLRAJUSTADO / I.IM' +
        'OAREAGERENCIAL),'
      
        '               DECODE(CX.FLGRATEIO, 0, (CX.CIMVLRAJUSTADO / I.IM' +
        'OAREAGERENCIAL),'
      '                  DECODE(CX.CIMPERCENTRATEIO, NULL, 0,'
      '                     DECODE(CX.CIMPERCENTRATEIO, 0, 0,'
      
        '                        (CX.CIMVLRAJUSTADO / (I.IMOAREAGERENCIAL' +
        ' * CX.CIMPERCENTRATEIO / 100))'
      '                     )'
      '                  )'
      '               )'
      '            )'
      '         ) '
      '      ) '
      '   ) AS ALUGUELM2, '
      ''
      '   M.MOESIGLA,'
      ''
      '   PL.RAZAOSOCIAL AS LOCATARIO_RS,'
      '   PL.NOME AS LOCATARIO_NF,'
      '   PA.RAZAOSOCIAL AS ADMINISTRADORA_RS,'
      '   PA.NOME AS ADMINISTRADORA_NF'
      'FROM'
      '   CONTRATOIMOVEL C, CONTRATOXIMOVEL CX,'
      '   MOEDA M, PESSOA PL, PESSOA PA,'
      '   IMOVEL I, IMOVEL IM'
      'WHERE'
      '   1=2 AND ( C.FLGSTATUS = '#39'V'#39' )'
      '   AND ( I.FLGTIPOIMOVEL = 1 )'
      '   AND ( IM.FLGTIPOIMOVEL = 0 )'
      '   AND ( C.IDLOCATARIO = PL.IDPESSOA )'
      '   AND ( C.IDADMINIMOVEL = PA.IDPESSOA(+) )'
      '   AND ( C.CONINDICEREAJUSTE = M.MOECODIGO(+) )'
      '   AND ( C.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL )'
      '   AND ( CX.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      'ORDER BY'
      '   C.CONNUMERO, C.CONNOME'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 328
    Top = 56
    object StringField5: TStringField
      FieldKind = fkCalculated
      FieldName = 'ContratoExtenso'
      Size = 130
      Calculated = True
    end
    object qryContratosAdminAnal_DESCRICAO_IMOVEL: TStringField
      FieldKind = fkCalculated
      FieldName = '_DESCRICAO_IMOVEL'
      Size = 195
      Calculated = True
    end
    object qryContratosAdminAnal_RATEIO: TStringField
      FieldKind = fkCalculated
      FieldName = '_RATEIO'
      Size = 7
      Calculated = True
    end
    object FloatField1: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object StringField6: TStringField
      FieldName = 'CONNUMERO'
    end
    object StringField7: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'CONDATAINICIO'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'CONDATAFIM'
    end
    object FloatField2: TFloatField
      FieldName = 'CONVLRAJUSTADO'
    end
    object FloatField3: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
    end
    object FloatField4: TFloatField
      FieldName = 'IDLOCATARIO'
    end
    object FloatField5: TFloatField
      FieldName = 'IDADMINIMOVEL'
    end
    object StringField8: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object StringField9: TStringField
      FieldName = 'LOCATARIO_RS'
      Size = 60
    end
    object StringField10: TStringField
      FieldName = 'LOCATARIO_NF'
      Size = 60
    end
    object StringField11: TStringField
      FieldName = 'ADMINISTRADORA_RS'
      Size = 60
    end
    object StringField12: TStringField
      FieldName = 'ADMINISTRADORA_NF'
      Size = 60
    end
    object FloatField54: TFloatField
      FieldName = 'CONTAXAADMIN'
    end
    object qryContratosAdminAnalIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryContratosAdminAnalCIMVLRAJUSTADO: TFloatField
      FieldName = 'CIMVLRAJUSTADO'
    end
    object qryContratosAdminAnalCIMDESCRICAO: TStringField
      FieldName = 'CIMDESCRICAO'
      Size = 60
    end
    object qryContratosAdminAnalAREA_OCUPADA: TFloatField
      FieldName = 'AREA_OCUPADA'
    end
    object qryContratosAdminAnalALUGUEL: TFloatField
      FieldName = 'ALUGUEL'
    end
    object qryContratosAdminAnalALUGUELM2: TFloatField
      FieldName = 'ALUGUELM2'
    end
    object qryContratosAdminAnalFLGRATEIO: TFloatField
      FieldName = 'FLGRATEIO'
    end
    object qryContratosAdminAnalCIMPERCENTRATEIO: TFloatField
      FieldName = 'CIMPERCENTRATEIO'
      DisplayFormat = '##0,00 %'
    end
    object qryContratosAdminAnalNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object qryContratosAdminAnalNOME_IMOVEL: TStringField
      FieldName = 'NOME_IMOVEL'
      Size = 60
    end
    object qryContratosAdminAnalIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryContratosAdminAnalCODIGO_IMOVEL: TStringField
      FieldName = 'CODIGO_IMOVEL'
      Size = 15
    end
  end
  object dsContratosAdminAnal: TwwDataSource
    DataSet = qryContratosAdminAnal
    Left = 328
    Top = 68
  end
  object pplContratosAdminAnal: TppBDEPipeline
    DataSource = dsContratosAdminAnal
    UserName = 'lContratosAdminAnal'
    Left = 328
    Top = 80
  end
  object rptContratosAdminAnal: TppReport
    AutoStop = False
    DataPipeline = pplContratosAdminAnal
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 11906
    PrinterSetup.mmMarginLeft = 9260
    PrinterSetup.mmMarginRight = 9260
    PrinterSetup.mmMarginTop = 11906
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
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
    Left = 328
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplContratosAdminAnal'
    object ppHeaderBand13: TppHeaderBand
      mmBottomOffset = 40
      mmHeight = 34660
      mmPrintPosition = 0
      object ppLabel64: TppLabel
        UserName = 'ppLabel64'
        AutoSize = False
        Caption = 'Contratos (analítico)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8731
        mmWidth = 191559
        BandType = 0
      end
      object ppLabel65: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel65'
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
        mmLeft = 0
        mmTop = 1588
        mmWidth = 191559
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Administradora:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 20902
        mmWidth = 25400
        BandType = 0
      end
      object rptContratosAdminAnal_lblAdministradora: TppLabel
        UserName = 'rptContratosAdminAnal_lblAdministradora'
        Caption = 'Administradora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 20902
        mmWidth = 19315
        BandType = 0
      end
      object rptContratosAdminAnal_lblAluguelImovel: TppLabel
        UserName = 'rptContratosAdminAnal_lblAluguelImovel'
        Caption = 'Apenas Imóveis que possuem Aluguel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 29898
        mmWidth = 48683
        BandType = 0
      end
      object rptContratosAdminAnalLabel6: TppLabel
        UserName = 'rptContratosAdminAnalLabel6'
        Caption = 'Responsável:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 3969
        mmTop = 25400
        mmWidth = 21167
        BandType = 0
      end
      object rptContratosAdminAnal_lblResponsavel: TppLabel
        UserName = 'rptContratosAdminAnal_lblResponsavel'
        Caption = 'Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 25135
        mmTop = 25400
        mmWidth = 16669
        BandType = 0
      end
      object ppLogoContratosAnal: TppImage
        UserName = 'ppLogoContratosAnal'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label70'
        AutoSize = False
        Caption = 'Tipo de Contrato:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 152400
        mmTop = 20902
        mmWidth = 25231
        BandType = 0
      end
      object rptContratosAdminAnal_lblTipoContrato: TppLabel
        UserName = 'rptContratosAdminAnal_lblAdministradora1'
        AutoSize = False
        Caption = '< Todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 178330
        mmTop = 20902
        mmWidth = 12785
        BandType = 0
      end
    end
    object rptContratosAdminAnal_bndImovel: TppDetailBand
      BeforePrint = rptContratosAdminAnal_bndImovelBeforePrint
      BeforeGenerate = rptContratosAdminAnal_bndImovelBeforeGenerate
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
      object ppLine35: TppLine
        UserName = 'ppLine35'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 4233
        mmTop = 0
        mmWidth = 187855
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'ppDBText22'
        DataField = 'AREA_OCUPADA'
        DataPipeline = pplContratosAdminAnal
        DisplayFormat = '###,##0.00 m2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContratosAdminAnal'
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 794
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'ppDBText23'
        DataField = 'ALUGUELM2'
        DataPipeline = pplContratosAdminAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContratosAdminAnal'
        mmHeight = 3704
        mmLeft = 175684
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object rptContratosAdminAnalDBMemo1: TppDBMemo
        UserName = 'rptContratosAdminAnalDBMemo1'
        CharWrap = True
        DataField = '_DESCRICAO_IMOVEL'
        DataPipeline = pplContratosAdminAnal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplContratosAdminAnal'
        mmHeight = 15875
        mmLeft = 31750
        mmTop = 794
        mmWidth = 81492
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptContratosAdminAnalDBText1: TppDBText
        UserName = 'rptContratosAdminAnalDBText1'
        DataField = 'CIMVLRAJUSTADO'
        DataPipeline = pplContratosAdminAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContratosAdminAnal'
        mmHeight = 3704
        mmLeft = 114036
        mmTop = 794
        mmWidth = 22490
        BandType = 4
      end
      object rptContratosAdminAnalDBText2: TppDBText
        UserName = 'rptContratosAdminAnalDBText2'
        DataField = 'CIMPERCENTRATEIO'
        DataPipeline = pplContratosAdminAnal
        DisplayFormat = '##0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContratosAdminAnal'
        mmHeight = 3704
        mmLeft = 138377
        mmTop = 794
        mmWidth = 14288
        BandType = 4
      end
      object ppDBMemo8: TppDBMemo
        UserName = 'DBMemo8'
        CharWrap = True
        DataField = 'CODIGO_IMOVEL'
        DataPipeline = pplContratosAdminAnal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplContratosAdminAnal'
        mmHeight = 15875
        mmLeft = 4763
        mmTop = 794
        mmWidth = 25929
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand13: TppFooterBand
      mmBottomOffset = 40
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine38: TppLine
        UserName = 'ppLine38'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 191560
        BandType = 8
      end
      object ppLabel177: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel177'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc25: TppSystemVariable
        UserName = 'Calc25'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 74083
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object rptContratosAdminAnalCalc1: TppSystemVariable
        UserName = 'rptContratosAdminAnalCalc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 155311
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
    object rptContratosAdminAnalGroup1: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplContratosAdminAnal
      OutlineSettings.CreateNode = True
      UserName = 'rptContratosAdminAnalGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 13229
      DataPipelineName = 'pplContratosAdminAnal'
      object rptContratosAdminAnalGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 36777
        mmPrintPosition = 0
        object ppLine34: TppLine
          UserName = 'ppLine34'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 5821
          mmLeft = 0
          mmTop = 8996
          mmWidth = 191560
          BandType = 3
          GroupNo = 0
        end
        object rptContratosAdminAnalLabel1: TppLabel
          UserName = 'rptContratosAdminAnalLabel1'
          ShiftWithParent = True
          AutoSize = False
          Caption = 'Área'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 159809
          mmTop = 29104
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object rptContratosAdminAnalLabel2: TppLabel
          UserName = 'rptContratosAdminAnalLabel2'
          Caption = 'Vigência do Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 155840
          mmTop = 5292
          mmWidth = 30427
          BandType = 3
          GroupNo = 0
        end
        object rptContratosAdminAnalLabel7: TppLabel
          UserName = 'rptContratosAdminAnalLabel7'
          ShiftWithParent = True
          AutoSize = False
          Caption = 'Ocupada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 159809
          mmTop = 32544
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object rptContratosAdminAnalLabel8: TppLabel
          UserName = 'rptContratosAdminAnalLabel8'
          ShiftWithParent = True
          AutoSize = False
          Caption = 'Aluguel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 175684
          mmTop = 29104
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object rptContratosAdminAnalLabel9: TppLabel
          UserName = 'rptContratosAdminAnalLabel9'
          ShiftWithParent = True
          AutoSize = False
          Caption = 'por m2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 175684
          mmTop = 32544
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object rptContratosAdminAnalLabel12: TppLabel
          UserName = 'rptContratosAdminAnalLabel12'
          Caption = 'Administradora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 84667
          mmTop = 5292
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object rptContratosAdminAnalLabel13: TppLabel
          UserName = 'rptContratosAdminAnalLabel13'
          Caption = 'Nº Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 5292
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object rptContratosAdminAnalLabel14: TppLabel
          UserName = 'rptContratosAdminAnalLabel14'
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 25400
          mmTop = 5292
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemo14: TppDBMemo
          UserName = 'ppDBMemo14'
          CharWrap = False
          DataField = 'CONNUMERO'
          DataPipeline = pplContratosAdminAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          DataPipelineName = 'pplContratosAdminAnal'
          mmHeight = 15875
          mmLeft = 0
          mmTop = 10054
          mmWidth = 24606
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 40
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBMemo15: TppDBMemo
          UserName = 'ppDBMemo15'
          CharWrap = False
          DataField = 'CONNOME'
          DataPipeline = pplContratosAdminAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          DataPipelineName = 'pplContratosAdminAnal'
          mmHeight = 15875
          mmLeft = 25400
          mmTop = 10054
          mmWidth = 58473
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 40
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBMemo13: TppDBMemo
          UserName = 'ppDBMemo13'
          CharWrap = False
          DataField = 'ADMINISTRADORA_NF'
          DataPipeline = pplContratosAdminAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          DataPipelineName = 'pplContratosAdminAnal'
          mmHeight = 15875
          mmLeft = 84667
          mmTop = 10054
          mmWidth = 69321
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 40
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBText17: TppDBText
          UserName = 'ppDBText17'
          DataField = 'CONDATAINICIO'
          DataPipeline = pplContratosAdminAnal
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplContratosAdminAnal'
          mmHeight = 3704
          mmLeft = 155840
          mmTop = 10054
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel128: TppLabel
          UserName = 'ppLabel128'
          AutoSize = False
          Caption = ' a '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 171715
          mmTop = 10054
          mmWidth = 3175
          BandType = 3
          GroupNo = 0
        end
        object ppDBText18: TppDBText
          UserName = 'ppDBText18'
          DataField = 'CONDATAFIM'
          DataPipeline = pplContratosAdminAnal
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplContratosAdminAnal'
          mmHeight = 3704
          mmLeft = 175155
          mmTop = 10054
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object rptContratosAdminAnalLine1: TppLine
          UserName = 'rptContratosAdminAnalLine1'
          ShiftWithParent = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 4233
          mmTop = 36248
          mmWidth = 187855
          BandType = 3
          GroupNo = 0
        end
        object rptContratosAdminAnalLabel16: TppLabel
          UserName = 'rptContratosAdminAnalLabel16'
          ShiftWithParent = True
          Caption = 'Imóvel (Descrição)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 31750
          mmTop = 32279
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
        end
        object rptContratosAdminAnalLine4: TppLine
          UserName = 'rptContratosAdminAnalLine4'
          ParentWidth = True
          ShiftWithParent = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 26723
          mmWidth = 191560
          BandType = 3
          GroupNo = 0
        end
        object rptContratosAdminAnalLabel4: TppLabel
          UserName = 'rptContratosAdminAnalLabel4'
          ShiftWithParent = True
          Caption = 'Aluguel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 125413
          mmTop = 32544
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object rptContratosAdminAnalLabel5: TppLabel
          UserName = 'rptContratosAdminAnalLabel5'
          ShiftWithParent = True
          Caption = 'Rateio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 143669
          mmTop = 32544
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object ppLabel53: TppLabel
          UserName = 'Label53'
          ShiftWithParent = True
          Caption = 'Imóvel (Código)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 4763
          mmTop = 32279
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
      end
      object rptContratosAdminAnalGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 10583
        mmHeight = 11642
        mmPrintPosition = 0
        object rptContratosAdminAnalShape1: TppShape
          UserName = 'rptContratosAdminAnalShape1'
          Pen.Width = 2
          mmHeight = 5556
          mmLeft = 114036
          mmTop = 3440
          mmWidth = 78052
          BandType = 5
          GroupNo = 0
        end
        object rptContratosAdminAnalLine3: TppLine
          UserName = 'rptContratosAdminAnalLine3'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 4233
          mmTop = 265
          mmWidth = 187855
          BandType = 5
          GroupNo = 0
        end
        object rptContratosAdminAnalDBCalc1: TppDBCalc
          UserName = 'rptContratosAdminAnalDBCalc1'
          DataField = 'ALUGUELM2'
          DataPipeline = pplContratosAdminAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptContratosAdminAnalGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcAverage
          DataPipelineName = 'pplContratosAdminAnal'
          mmHeight = 3704
          mmLeft = 175684
          mmTop = 4233
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rptContratosAdminAnalDBCalc2: TppDBCalc
          UserName = 'rptContratosAdminAnalDBCalc2'
          DataField = 'AREA_OCUPADA'
          DataPipeline = pplContratosAdminAnal
          DisplayFormat = '###,##0.00 m2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptContratosAdminAnalGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContratosAdminAnal'
          mmHeight = 3704
          mmLeft = 153459
          mmTop = 4233
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object rptContratosAdminAnalDBCalc3: TppDBCalc
          UserName = 'rptContratosAdminAnalDBCalc3'
          DataField = 'CIMVLRAJUSTADO'
          DataPipeline = pplContratosAdminAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptContratosAdminAnalGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContratosAdminAnal'
          mmHeight = 3704
          mmLeft = 115094
          mmTop = 4233
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object rptContratosAdminAnalLabel3: TppLabel
          UserName = 'rptContratosAdminAnalLabel3'
          Caption = 'Total do Contrato:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 85990
          mmTop = 4233
          mmWidth = 28310
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryListagemContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATOIMOVEL, C.CONNUMERO, C.CONNOME,'
      '   C.CONDATAINICIO, C.CONDATAFIM,'
      '   C.CONVLRAJUSTADO, C.CONINDICEREAJUSTE,'
      '   C.IDLOCATARIO, C.IDADMINIMOVEL, C.CONTAXAADMIN,'
      '   C.CONPROXREAJUSTE, C.FLGCOMPETALUGUEL,'
      '   C.CONDATACARENCIA, C.CONDATAREAJUSTE,'
      '   C.CODPORTFORMA, C.IDTIPOCUSTORECIMO,'
      '   C.CONDATAFIANCAINI, C.CONDATAFIANCAFIM,'
      ''
      
        '   (DECODE(C.FLGCOMPETALUGUEL, '#39'A'#39', '#39'mês anterior'#39', DECODE(C.FLG' +
        'COMPETALUGUEL, '#39'C'#39', '#39'mês corrente'#39', '#39'mês posterior'#39'))) AS COMPET' +
        'ENCIA,'
      
        '   (DECODE(C.FLGTIPODIAVENC, '#39'U'#39', C.CONDIAVENCIMENTO||'#39'o. dia út' +
        'il'#39','#39'dia '#39'||C.CONDIAVENCIMENTO)) AS VENCIMENTO,'
      
        '   (C.CONDIASTOLERANCIA||DECODE(FLGTIPODIATOLERA, '#39'U'#39', '#39' dias út' +
        'eis'#39', '#39' dias'#39')) AS TOLERANCIA,'
      ''
      
        '   (DECODE (C.FLGFIANCA, '#39'A'#39','#39'Fiador'#39', '#39'F'#39','#39'Fiança Bancária'#39', '#39'S' +
        #39','#39'Outra'#39', '#39'O'#39','#39'Seguro-Fiança'#39', '#39'N'#39','#39'Não há'#39', Null) ) AS FIANCA,'
      ''
      '   C.CONOBSFIANCA,'
      ''
      '   P.DESCRICAO AS PORTADOR_FORMA, T.DESCCUSTORECIMO,'
      ''
      '   M.MOESIGLA,'
      ''
      '   PL.RAZAOSOCIAL AS LOCATARIO_RS,'
      '   PL.NOME AS LOCATARIO_NF,'
      '   PA.RAZAOSOCIAL AS ADMINISTRADORA_RS,'
      '   PA.NOME AS ADMINISTRADORA_NF,'
      
        '   DECODE(C.FLGSTATUS, '#39'R'#39', '#39'Rescindido'#39', '#39'V'#39', '#39'Vigente'#39', '#39'Encer' +
        'rado'#39') AS STATUS,'
      '   TC.SIGLA'
      ''
      'FROM'
      '   PESSOA PL, PESSOA PA,'
      '   CONTRATOIMOVEL C, MOEDA M,'
      '   PORTADORFORMA P, TIPOCUSTORECIMOV T,'
      '   TIPOCONTRIMOB TC'
      ''
      'WHERE'
      '   ( C.IDPESSOA = 1 )'
      '   AND ( C.FLGSTATUS = '#39'V'#39' )'
      '   AND ( C.IDLOCATARIO = PL.IDPESSOA )'
      '   AND ( C.IDADMINIMOVEL = PA.IDPESSOA(+) )'
      '   AND ( C.CONINDICEREAJUSTE = M.MOECODIGO(+) )'
      '   AND ( C.CODPORTFORMA = P.CODPORTFORMA(+) )'
      '   AND ( C.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO(+) )'
      '   AND ( C.IDTIPOCONTRIMOB = TC.IDTIPOCONTRIMOB(+) )'
      ''
      'ORDER BY'
      '   C.CONNUMERO, C.CONNOME'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 192
    object qryListagemContratoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryListagemContratoCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryListagemContratoCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object qryListagemContratoCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
    end
    object qryListagemContratoCONDATAFIM: TDateTimeField
      FieldName = 'CONDATAFIM'
    end
    object qryListagemContratoCONVLRAJUSTADO: TFloatField
      FieldName = 'CONVLRAJUSTADO'
    end
    object qryListagemContratoCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
    end
    object qryListagemContratoIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
    end
    object qryListagemContratoIDADMINIMOVEL: TFloatField
      FieldName = 'IDADMINIMOVEL'
    end
    object qryListagemContratoCONTAXAADMIN: TFloatField
      FieldName = 'CONTAXAADMIN'
    end
    object qryListagemContratoCONPROXREAJUSTE: TDateTimeField
      FieldName = 'CONPROXREAJUSTE'
    end
    object qryListagemContratoFLGCOMPETALUGUEL: TStringField
      FieldName = 'FLGCOMPETALUGUEL'
      Size = 1
    end
    object qryListagemContratoCONDATACARENCIA: TDateTimeField
      FieldName = 'CONDATACARENCIA'
    end
    object qryListagemContratoCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
    end
    object qryListagemContratoCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object qryListagemContratoIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
    end
    object qryListagemContratoCOMPETENCIA: TStringField
      FieldName = 'COMPETENCIA'
      Size = 13
    end
    object qryListagemContratoVENCIMENTO: TStringField
      FieldName = 'VENCIMENTO'
      Size = 51
    end
    object qryListagemContratoTOLERANCIA: TStringField
      FieldName = 'TOLERANCIA'
      Size = 51
    end
    object qryListagemContratoPORTADOR_FORMA: TStringField
      FieldName = 'PORTADOR_FORMA'
      Size = 50
    end
    object qryListagemContratoDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object qryListagemContratoMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryListagemContratoLOCATARIO_RS: TStringField
      FieldName = 'LOCATARIO_RS'
      Size = 60
    end
    object qryListagemContratoLOCATARIO_NF: TStringField
      FieldName = 'LOCATARIO_NF'
      Size = 60
    end
    object qryListagemContratoADMINISTRADORA_RS: TStringField
      FieldName = 'ADMINISTRADORA_RS'
      Size = 60
    end
    object qryListagemContratoADMINISTRADORA_NF: TStringField
      FieldName = 'ADMINISTRADORA_NF'
      Size = 60
    end
    object qryListagemContratoCONDATAFIANCAINI: TDateTimeField
      FieldName = 'CONDATAFIANCAINI'
    end
    object qryListagemContratoCONDATAFIANCAFIM: TDateTimeField
      FieldName = 'CONDATAFIANCAFIM'
    end
    object qryListagemContratoSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 10
    end
    object qryListagemContratoFIANCA: TStringField
      FieldName = 'FIANCA'
      Size = 15
    end
    object qryListagemContratoCONOBSFIANCA: TMemoField
      FieldName = 'CONOBSFIANCA'
      BlobType = ftMemo
      Size = 2000
    end
    object qryListagemContratoSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 5
    end
  end
  object dsListagemContrato: TwwDataSource
    DataSet = qryListagemContrato
    Left = 144
    Top = 204
  end
  object pplListagemContrato: TppBDEPipeline
    DataSource = dsListagemContrato
    UserName = 'lListagemContrato'
    Left = 144
    Top = 216
  end
  object rptListagemContrato: TppReport
    AutoStop = False
    DataPipeline = pplListagemContrato
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
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
    Left = 144
    Top = 144
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplListagemContrato'
    object ppHeaderBand15: TppHeaderBand
      mmBottomOffset = 40
      mmHeight = 22225
      mmPrintPosition = 0
      object ppLabel148: TppLabel
        UserName = 'ppLabel148'
        AutoSize = False
        Caption = 'Listagem de Contratos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel149: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel149'
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
        mmLeft = 0
        mmTop = 1588
        mmWidth = 197115
        BandType = 0
      end
      object ppLabel162: TppLabel
        UserName = 'ppLabel162'
        Caption = 'Administradora:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 4233
        mmTop = 17992
        mmWidth = 25135
        BandType = 0
      end
      object rptListagemContratos_lblAdministradora: TppLabel
        UserName = 'rptListagemContratos_lblAdministradora'
        Caption = 'Administradora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 29104
        mmTop = 17992
        mmWidth = 19315
        BandType = 0
      end
      object ppLogoLstContratos: TppImage
        UserName = 'ppLogoLstContratos'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'Label72'
        AutoSize = False
        Caption = 'Tipo de Contrato:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 161925
        mmTop = 18256
        mmWidth = 26723
        BandType = 0
      end
      object rptListagemContratos_lblTipoContrato: TppLabel
        UserName = 'rptListagemContratos_lblAdministradora1'
        AutoSize = False
        Caption = 'Administradora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 188648
        mmTop = 18256
        mmWidth = 8202
        BandType = 0
      end
    end
    object ppDetailBand15: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 42863
      mmPrintPosition = 0
      object rptListagemContratoLine1: TppLine
        UserName = 'rptListagemContratoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 7673
        mmWidth = 197380
        BandType = 4
      end
      object ppDBText60: TppDBText
        UserName = 'ppDBText60'
        DataField = 'CONDATAINICIO'
        DataPipeline = pplListagemContrato
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemContrato'
        mmHeight = 3704
        mmLeft = 139965
        mmTop = 8467
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'ppDBText61'
        DataField = 'CONDATAFIM'
        DataPipeline = pplListagemContrato
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListagemContrato'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 8467
        mmWidth = 15081
        BandType = 4
      end
      object ppLabel166: TppLabel
        UserName = 'ppLabel166'
        AutoSize = False
        Caption = ' a '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 155311
        mmTop = 8467
        mmWidth = 3175
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'ppDBText62'
        DataField = 'CONVLRAJUSTADO'
        DataPipeline = pplListagemContrato
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListagemContrato'
        mmHeight = 3704
        mmLeft = 175684
        mmTop = 8467
        mmWidth = 17992
        BandType = 4
      end
      object ppDBMemo18: TppDBMemo
        UserName = 'ppDBMemo18'
        CharWrap = False
        DataField = 'LOCATARIO_RS'
        DataPipeline = pplListagemContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplListagemContrato'
        mmHeight = 12965
        mmLeft = 84667
        mmTop = 8467
        mmWidth = 53446
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo19: TppDBMemo
        UserName = 'ppDBMemo19'
        CharWrap = False
        DataField = 'CONNUMERO'
        DataPipeline = pplListagemContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplListagemContrato'
        mmHeight = 12965
        mmLeft = 4233
        mmTop = 8467
        mmWidth = 23548
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText63: TppDBText
        UserName = 'ppDBText63'
        ShiftWithParent = True
        DataField = 'MOESIGLA'
        DataPipeline = pplListagemContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemContrato'
        mmHeight = 3704
        mmLeft = 166423
        mmTop = 35190
        mmWidth = 15346
        BandType = 4
      end
      object ppDBMemo21: TppDBMemo
        UserName = 'ppDBMemo21'
        CharWrap = False
        DataField = 'CONNOME'
        DataPipeline = pplListagemContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplListagemContrato'
        mmHeight = 12965
        mmLeft = 29369
        mmTop = 8467
        mmWidth = 53446
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptListagemContratosLabel1: TppLabel
        UserName = 'rptListagemContratosLabel1'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Caption = 'Último Reajuste: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3440
        mmLeft = 139965
        mmTop = 27252
        mmWidth = 23283
        BandType = 4
      end
      object rptListagemContratosLabel2: TppLabel
        UserName = 'rptListagemContratosLabel2'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Caption = 'Próx. Reajuste: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 139965
        mmTop = 31221
        mmWidth = 22490
        BandType = 4
      end
      object rptListagemContratosLabel3: TppLabel
        UserName = 'rptListagemContratosLabel3'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Caption = 'Fim Carência: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3440
        mmLeft = 139965
        mmTop = 23283
        mmWidth = 19579
        BandType = 4
      end
      object rptListagemContratosLabel4: TppLabel
        UserName = 'rptListagemContratosLabel4'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Caption = 'Dia Vencimento: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 5292
        mmTop = 23283
        mmWidth = 23019
        BandType = 4
      end
      object rptListagemContratosLabel5: TppLabel
        UserName = 'rptListagemContratosLabel5'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Caption = 'Tolerância: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 5292
        mmTop = 27252
        mmWidth = 15875
        BandType = 4
      end
      object rptListagemContratosLabel6: TppLabel
        UserName = 'rptListagemContratosLabel6'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Caption = 'Tipo de Receita: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 5292
        mmTop = 31221
        mmWidth = 22754
        BandType = 4
      end
      object rptListagemContratosLabel7: TppLabel
        UserName = 'rptListagemContratosLabel7'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Caption = 'Competência: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 71173
        mmTop = 27252
        mmWidth = 19579
        BandType = 4
      end
      object rptListagemContratosLabel8: TppLabel
        UserName = 'rptListagemContratosLabel8'
        ShiftWithParent = True
        AutoSize = False
        Caption = 'Forma Cobrança: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 5292
        mmTop = 35190
        mmWidth = 24342
        BandType = 4
      end
      object rptListagemContratosDBText1: TppDBText
        UserName = 'rptListagemContratosDBText1'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        DataField = 'CONDATAREAJUSTE'
        DataPipeline = pplListagemContrato
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemContrato'
        mmHeight = 3704
        mmLeft = 166423
        mmTop = 27252
        mmWidth = 15346
        BandType = 4
      end
      object rptListagemContratosDBText2: TppDBText
        UserName = 'rptListagemContratosDBText2'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        DataField = 'CONPROXREAJUSTE'
        DataPipeline = pplListagemContrato
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemContrato'
        mmHeight = 3704
        mmLeft = 166423
        mmTop = 31221
        mmWidth = 15346
        BandType = 4
      end
      object rptListagemContratosDBText3: TppDBText
        UserName = 'rptListagemContratosDBText3'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        DataField = 'CONDATACARENCIA'
        DataPipeline = pplListagemContrato
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemContrato'
        mmHeight = 3704
        mmLeft = 166423
        mmTop = 23283
        mmWidth = 15346
        BandType = 4
      end
      object ppLabel157: TppLabel
        UserName = 'ppLabel157'
        ShiftWithParent = True
        AutoSize = False
        Caption = 'Índice Reajuste: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 139965
        mmTop = 35190
        mmWidth = 22490
        BandType = 4
      end
      object ppLine45: TppLine
        UserName = 'ppLine45'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 7144
        mmWidth = 197380
        BandType = 4
      end
      object ppLabel152: TppLabel
        UserName = 'ppLabel152'
        Caption = 'Nº Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 4233
        mmTop = 3440
        mmWidth = 16404
        BandType = 4
      end
      object ppLabel153: TppLabel
        UserName = 'ppLabel153'
        Caption = 'Vigência do Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 139965
        mmTop = 3440
        mmWidth = 30427
        BandType = 4
      end
      object ppLabel154: TppLabel
        UserName = 'ppLabel154'
        AutoSize = False
        Caption = 'Contratual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 175684
        mmTop = 3440
        mmWidth = 17992
        BandType = 4
      end
      object ppLabel155: TppLabel
        UserName = 'ppLabel155'
        Caption = 'Aluguel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182563
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppLabel158: TppLabel
        UserName = 'ppLabel158'
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 29369
        mmTop = 3440
        mmWidth = 12700
        BandType = 4
      end
      object rptListagemContratosDBText4: TppDBText
        UserName = 'rptListagemContratosDBText4'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        AutoSize = True
        DataField = 'COMPETENCIA'
        DataPipeline = pplListagemContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemContrato'
        mmHeight = 3260
        mmLeft = 92869
        mmTop = 27252
        mmWidth = 20786
        BandType = 4
      end
      object rptListagemContratosDBText5: TppDBText
        UserName = 'rptListagemContratosDBText5'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        AutoSize = True
        DataField = 'VENCIMENTO'
        DataPipeline = pplListagemContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemContrato'
        mmHeight = 3260
        mmLeft = 31485
        mmTop = 23283
        mmWidth = 18881
        BandType = 4
      end
      object rptListagemContratosDBText6: TppDBText
        UserName = 'rptListagemContratosDBText6'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        AutoSize = True
        DataField = 'TOLERANCIA'
        DataPipeline = pplListagemContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemContrato'
        mmHeight = 3260
        mmLeft = 31485
        mmTop = 27252
        mmWidth = 18119
        BandType = 4
      end
      object rptListagemContratosDBText7: TppDBText
        UserName = 'rptListagemContratosDBText7'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        DataField = 'DESCCUSTORECIMO'
        DataPipeline = pplListagemContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemContrato'
        mmHeight = 3704
        mmLeft = 31485
        mmTop = 31221
        mmWidth = 106627
        BandType = 4
      end
      object rptListagemContratosDBText8: TppDBText
        UserName = 'rptListagemContratosDBText8'
        ShiftWithParent = True
        DataField = 'PORTADOR_FORMA'
        DataPipeline = pplListagemContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemContrato'
        mmHeight = 3704
        mmLeft = 31485
        mmTop = 35190
        mmWidth = 106627
        BandType = 4
      end
      object rptListagemContratoLabel1: TppLabel
        UserName = 'rptListagemContratoLabel1'
        Caption = 'Locatário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 84667
        mmTop = 3440
        mmWidth = 13494
        BandType = 4
      end
      object rptListagemContratoLabel2: TppLabel
        UserName = 'rptListagemContratoLabel2'
        ShiftWithParent = True
        AutoSize = False
        Caption = 'Fiança: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 5292
        mmTop = 39158
        mmWidth = 10848
        BandType = 4
      end
      object rptListagemContratoLabel3: TppLabel
        UserName = 'rptListagemContratoLabel3'
        ShiftWithParent = True
        AutoSize = False
        Caption = 'Início: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 71173
        mmTop = 39158
        mmWidth = 9790
        BandType = 4
      end
      object rptListagemContratoLabel4: TppLabel
        UserName = 'rptListagemContratoLabel4'
        ShiftWithParent = True
        AutoSize = False
        Caption = 'Término: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 98161
        mmTop = 39158
        mmWidth = 13758
        BandType = 4
      end
      object rptListagemContratoDBText2: TppDBText
        UserName = 'rptListagemContratoDBText2'
        ShiftWithParent = True
        DataField = 'CONDATAFIANCAFIM'
        DataPipeline = pplListagemContrato
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemContrato'
        mmHeight = 3704
        mmLeft = 112184
        mmTop = 39158
        mmWidth = 15081
        BandType = 4
      end
      object rptListagemContratoDBText3: TppDBText
        UserName = 'rptListagemContratoDBText3'
        ShiftWithParent = True
        DataField = 'CONDATAFIANCAINI'
        DataPipeline = pplListagemContrato
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemContrato'
        mmHeight = 3704
        mmLeft = 81227
        mmTop = 39158
        mmWidth = 15081
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Caption = 'Situação: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 71173
        mmTop = 23283
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        AutoSize = True
        DataField = 'STATUS'
        DataPipeline = pplListagemContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemContrato'
        mmHeight = 3260
        mmLeft = 92869
        mmTop = 23283
        mmWidth = 11218
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        ShiftWithParent = True
        DataField = 'FIANCA'
        DataPipeline = pplListagemContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemContrato'
        mmHeight = 3440
        mmLeft = 31485
        mmTop = 39158
        mmWidth = 29369
        BandType = 4
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        ShiftWithParent = True
        AutoSize = False
        Caption = 'Tipo de Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 140229
        mmTop = 39158
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        ShiftWithParent = True
        DataField = 'SIGLA'
        DataPipeline = pplListagemContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemContrato'
        mmHeight = 3704
        mmLeft = 166423
        mmTop = 39158
        mmWidth = 15346
        BandType = 4
      end
    end
    object ppFooterBand15: TppFooterBand
      mmBottomOffset = 40
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine47: TppLine
        UserName = 'ppLine47'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel167: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel167'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc29: TppSystemVariable
        UserName = 'Calc29'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 76994
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc30: TppSystemVariable
        UserName = 'ppCalc301'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 161132
        mmTop = 2910
        mmWidth = 35454
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplListagemContrato
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplListagemContrato'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppSubReport1: TppSubReport
          UserName = 'SubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplFiador'
          mmHeight = 4498
          mmLeft = 0
          mmTop = 0
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = pplFiador
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297128
            PrinterSetup.mmPaperWidth = 210080
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Left = 376
            Top = 168
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplFiador'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDetailBand1: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 3969
              mmPrintPosition = 0
              object ppDBText1: TppDBText
                UserName = 'DBText1'
                DataField = 'DSC_FIADOR'
                DataPipeline = pplFiador
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplFiador'
                mmHeight = 3704
                mmLeft = 31750
                mmTop = 265
                mmWidth = 87842
                BandType = 4
              end
              object ppDBText4: TppDBText
                UserName = 'DBText2'
                DataField = 'FISICA_JURIDICA'
                DataPipeline = pplFiador
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplFiador'
                mmHeight = 3704
                mmLeft = 120386
                mmTop = 265
                mmWidth = 25400
                BandType = 4
              end
              object lblFiador: TppLabel
                UserName = 'lblFiador'
                Caption = 'Fiadores:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 5292
                mmTop = 0
                mmWidth = 12435
                BandType = 4
              end
            end
            object ppSummaryBand1: TppSummaryBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 27781
              mmPrintPosition = 0
              object ppLabel1: TppLabel
                UserName = 'Label1'
                Caption = 'Observação:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 5292
                mmTop = 529
                mmWidth = 17198
                BandType = 7
              end
              object ppDBRichText1: TppDBRichText
                UserName = 'DBRichText1'
                DataField = 'CONOBSFIANCA'
                DataPipeline = pplListagemContrato
                ParentDataPipeline = False
                Stretch = True
                Transparent = True
                DataPipelineName = 'pplListagemContrato'
                mmHeight = 23548
                mmLeft = 5027
                mmTop = 4233
                mmWidth = 170392
                BandType = 7
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
              end
            end
            object raCodeModule1: TraCodeModule
              ProgramStream = {
                01060D54726156617250726F6772616D094368696C645479706502110B50726F
                6772616D4E616D6506095661726961626C65730B50726F6772616D5479706507
                0B747450726F63656475726506536F75726365064170726F6365647572652056
                61726961626C65733B0D0A7661720D0A20202062466961646F72203A20426F6F
                6C65616E3B0D0A626567696E0D0A0D0A656E643B0D0A0001060F547261457665
                6E7448616E646C65720B50726F6772616D4E616D65060F5469746C6541667465
                725072696E740B50726F6772616D54797065070B747450726F63656475726506
                536F75726365063D70726F636564757265205469746C6541667465725072696E
                743B0D0A626567696E0D0A202062466961646F72203A3D20547275653B0D0A65
                6E643B0D0A0D436F6D706F6E656E744E616D6506055469746C65094576656E74
                4E616D65060A41667465725072696E74074576656E74494402170001060F5472
                614576656E7448616E646C65720B50726F6772616D4E616D6506114465746169
                6C4265666F72655072696E740B50726F6772616D54797065070B747450726F63
                656475726506536F75726365068870726F6365647572652044657461696C4265
                666F72655072696E743B0D0A626567696E0D0A202069662062466961646F7220
                7468656E200D0A202020202020206C626C466961646F722E56697369626C6520
                3A3D20547275650D0A2020656C7365206C626C466961646F722E56697369626C
                65203A3D2046616C73653B2020200D0A656E643B0D0A0D436F6D706F6E656E74
                4E616D65060644657461696C094576656E744E616D65060B4265666F72655072
                696E74074576656E74494402180001060F5472614576656E7448616E646C6572
                0B50726F6772616D4E616D65061044657461696C41667465725072696E740B50
                726F6772616D54797065070B747450726F63656475726506536F75726365063F
                70726F6365647572652044657461696C41667465725072696E743B0D0A626567
                696E0D0A202062466961646F72203A3D2046616C73653B0D0A656E643B0D0A0D
                436F6D706F6E656E744E616D65060644657461696C094576656E744E616D6506
                0A41667465725072696E74074576656E74494402170000}
            end
          end
        end
      end
    end
  end
  object qryContratoXImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CX.IDCONTRATOIMOVEL, CX.IDIMOVEL,'
      '   CX.FLGRATEIO, CX.CIMPERCENTRATEIO,'
      '   CX.CIMDESCRICAO'
      'FROM'
      '   CONTRATOXIMOVEL CX'
      'WHERE'
      '   1=2 AND CX.IDCONTRATOIMOVEL =:CONTRATO')
    ValidateWithMask = True
    Left = 456
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end>
    object qryContratoXImovelIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'CONTRATOXIMOVEL.IDCONTRATOIMOVEL'
    end
    object qryContratoXImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'CONTRATOXIMOVEL.IDIMOVEL'
    end
    object qryContratoXImovelFLGRATEIO: TFloatField
      FieldName = 'FLGRATEIO'
      Origin = 'CONTRATOXIMOVEL.FLGRATEIO'
    end
    object qryContratoXImovelCIMPERCENTRATEIO: TFloatField
      FieldName = 'CIMPERCENTRATEIO'
      Origin = 'CONTRATOXIMOVEL.CIMPERCENTRATEIO'
    end
    object qryContratoXImovelCIMDESCRICAO: TStringField
      FieldName = 'CIMDESCRICAO'
      Origin = 'CONTRATOXIMOVEL.CIMDESCRICAO'
      Size = 60
    end
  end
  object qryListagemProposta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   P.IDPROPOSTA, P.IDEMPRESAPROP,'
      ''
      '   P.PRODATA, P.PRONOME, P.PRODESCRICAO,'
      '   P.PROVLROM, P.PROVLR, P.PROTIR, P.PROPAYBACK,'
      '   P.PROCONDICOES, P.PROAPRESENTADA, P.PRONUMERO,'
      ''
      '   PP.NOME AS NF_PROPRIETARIO, '
      '   PP.RAZAOSOCIAL AS RS_PROPRIETARIO,'
      '   (PP.NOME||'#39', '#39'||PP.RAZAOSOCIAL) AS COMPLETO_PROPRIETARIO,'
      '   PR.NOME AS NF_RESPONSAVEL,'
      '   TI.DESCTIPOIMOVEL AS TIPO_IMOVEL,'
      '   M.MOESIGLA'
      'FROM'
      '   PESSOA PP, PESSOA PR,'
      '   PROPOSTANOVONEGOC P,'
      '   TIPOIMOVEL TI, MOEDA M'
      'WHERE'
      
        '   1=2 AND ( ( :PCODTIPIMOVEL IS NULL ) OR ( P.CODTIPIMOVEL = :P' +
        'CODTIPIMOVEL ) )'
      
        '   AND ( ( :PDATAINI IS NULL ) OR ( P.PRODATA BETWEEN :PDATAINI ' +
        'AND :PDATAFIM ) )'
      '   AND ( P.IDPROPRIETARIOUH = PP.IDPESSOA(+) )'
      '   AND ( P.IDRESPONSAVEL = PR.IDPESSOA(+) )'
      '   AND ( P.CODTIPIMOVEL = TI.CODTIPIMOVEL(+) )'
      '   AND ( P.MOECODIGO = M.MOECODIGO )'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 256
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptUnknown
      end>
    object qryListagemPropostaIDPROPOSTA: TFloatField
      FieldName = 'IDPROPOSTA'
    end
    object qryListagemPropostaIDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
    end
    object qryListagemPropostaPRODATA: TDateTimeField
      FieldName = 'PRODATA'
    end
    object qryListagemPropostaPRONOME: TStringField
      FieldName = 'PRONOME'
      Size = 60
    end
    object qryListagemPropostaPRODESCRICAO: TMemoField
      FieldName = 'PRODESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryListagemPropostaPROVLROM: TFloatField
      FieldName = 'PROVLROM'
    end
    object qryListagemPropostaPROVLR: TFloatField
      FieldName = 'PROVLR'
    end
    object qryListagemPropostaPROTIR: TFloatField
      FieldName = 'PROTIR'
    end
    object qryListagemPropostaPROPAYBACK: TFloatField
      FieldName = 'PROPAYBACK'
    end
    object qryListagemPropostaPROCONDICOES: TMemoField
      FieldName = 'PROCONDICOES'
      BlobType = ftMemo
      Size = 2000
    end
    object qryListagemPropostaPROAPRESENTADA: TStringField
      FieldName = 'PROAPRESENTADA'
      Size = 60
    end
    object qryListagemPropostaPRONUMERO: TStringField
      FieldName = 'PRONUMERO'
    end
    object qryListagemPropostaNF_PROPRIETARIO: TStringField
      FieldName = 'NF_PROPRIETARIO'
      Size = 60
    end
    object qryListagemPropostaRS_PROPRIETARIO: TStringField
      FieldName = 'RS_PROPRIETARIO'
      Size = 60
    end
    object qryListagemPropostaNF_RESPONSAVEL: TStringField
      FieldName = 'NF_RESPONSAVEL'
      Size = 60
    end
    object qryListagemPropostaTIPO_IMOVEL: TStringField
      FieldName = 'TIPO_IMOVEL'
      Size = 25
    end
    object qryListagemPropostaMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryListagemPropostaCOMPLETO_PROPRIETARIO: TStringField
      FieldName = 'COMPLETO_PROPRIETARIO'
      Size = 122
    end
  end
  object dsListagemProposta: TwwDataSource
    DataSet = qryListagemProposta
    Left = 256
    Top = 204
  end
  object pplListagemProposta: TppBDEPipeline
    DataSource = dsListagemProposta
    UserName = 'lListagemProposta'
    Left = 256
    Top = 216
  end
  object rptListagemProposta: TppReport
    AutoStop = False
    DataPipeline = pplListagemProposta
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
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
    Left = 256
    Top = 144
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplListagemProposta'
    object ppHeaderBand27: TppHeaderBand
      mmBottomOffset = 40
      mmHeight = 36777
      mmPrintPosition = 0
      object ppLabel268: TppLabel
        UserName = 'ppLabel268'
        AutoSize = False
        Caption = 'Listagem de Propostas de Novos Negócios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8731
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel272: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel272'
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
        mmLeft = 0
        mmTop = 1588
        mmWidth = 196850
        BandType = 0
      end
      object rptListagemPropostaLabel9: TppLabel
        UserName = 'rptListagemPropostaLabel9'
        Caption = 'Período de Datas: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 21960
        mmWidth = 26194
        BandType = 0
      end
      object rptListagemProposta_lblData: TppLabel
        UserName = 'rptListagemProposta_lblData'
        Caption = 'rptListagemProposta_lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 29369
        mmTop = 22225
        mmWidth = 36513
        BandType = 0
      end
      object rptListagemPropostaLabel13: TppLabel
        UserName = 'rptListagemPropostaLabel13'
        Caption = 'Segmento: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 12171
        mmTop = 27252
        mmWidth = 16669
        BandType = 0
      end
      object rptListagemProposta_lblSegmento: TppLabel
        UserName = 'rptListagemProposta_lblSegmento'
        Caption = 'rptListagemProposta_lblSegmento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 29369
        mmTop = 27252
        mmWidth = 43392
        BandType = 0
      end
      object rptListagemPropostalblStatus: TppLabel
        UserName = 'rptListagemPropostalblStatus'
        Caption = '                                                     '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 152400
        mmTop = 27252
        mmWidth = 42598
        BandType = 0
      end
      object ppLogoLstPropostas: TppImage
        UserName = 'ppLogoLstPropostas'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand27: TppDetailBand
      mmBottomOffset = 40
      mmHeight = 38894
      mmPrintPosition = 0
      object rptListagemPropostaShape1: TppShape
        UserName = 'rptListagemPropostaShape1'
        mmHeight = 27252
        mmLeft = 1058
        mmTop = 1852
        mmWidth = 194998
        BandType = 4
      end
      object ppDBText108: TppDBText
        UserName = 'ppDBText108'
        DataField = 'PRODATA'
        DataPipeline = pplListagemProposta
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3704
        mmLeft = 178859
        mmTop = 3175
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel281: TppLabel
        UserName = 'ppLabel281'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Caption = 'Payback: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        mmHeight = 3704
        mmLeft = 142875
        mmTop = 16933
        mmWidth = 13494
        BandType = 4
      end
      object ppLabel283: TppLabel
        UserName = 'ppLabel283'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Caption = 'Valor: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        mmHeight = 3704
        mmLeft = 147109
        mmTop = 12700
        mmWidth = 9260
        BandType = 4
      end
      object ppLabel284: TppLabel
        UserName = 'ppLabel284'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Caption = 'Proponente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 10054
        mmTop = 13494
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText115: TppDBText
        UserName = 'ppDBText115'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        DataField = 'PROVLROM'
        DataPipeline = pplListagemProposta
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 12700
        mmWidth = 23548
        BandType = 4
      end
      object ppLabel294: TppLabel
        UserName = 'ppLabel294'
        Caption = 'Proposta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 14023
        mmTop = 9260
        mmWidth = 14023
        BandType = 4
      end
      object rptListagemPropostaLabel1: TppLabel
        UserName = 'rptListagemPropostaLabel1'
        Caption = 'Nº Proposta:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 3175
        mmWidth = 19315
        BandType = 4
      end
      object rptListagemPropostaLabel2: TppLabel
        UserName = 'rptListagemPropostaLabel2'
        Caption = 'Data:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 3175
        mmWidth = 8467
        BandType = 4
      end
      object rptListagemPropostaDBText1: TppDBText
        UserName = 'rptListagemPropostaDBText1'
        ReprintOnOverFlow = True
        DataField = 'PROAPRESENTADA'
        DataPipeline = pplListagemProposta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3704
        mmLeft = 29898
        mmTop = 19579
        mmWidth = 110067
        BandType = 4
      end
      object rptListagemPropostaDBText2: TppDBText
        UserName = 'rptListagemPropostaDBText2'
        ReprintOnOverFlow = True
        DataField = 'PRONOME'
        DataPipeline = pplListagemProposta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3704
        mmLeft = 29898
        mmTop = 9260
        mmWidth = 110067
        BandType = 4
      end
      object rptListagemPropostaLabel4: TppLabel
        UserName = 'rptListagemPropostaLabel4'
        Caption = 'Apresentada por:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 19579
        mmWidth = 25400
        BandType = 4
      end
      object rptListagemPropostaLine1: TppLine
        UserName = 'rptListagemPropostaLine1'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 1323
        mmTop = 7673
        mmWidth = 194469
        BandType = 4
      end
      object rptListagemPropostaDBText3: TppDBText
        UserName = 'rptListagemPropostaDBText3'
        ReprintOnOverFlow = True
        AutoSize = True
        DataField = 'PRONUMERO'
        DataPipeline = pplListagemProposta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3175
        mmLeft = 21696
        mmTop = 3175
        mmWidth = 18785
        BandType = 4
      end
      object rptListagemPropostaDBText4: TppDBText
        UserName = 'rptListagemPropostaDBText4'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        DataField = 'MOESIGLA'
        DataPipeline = pplListagemProposta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3704
        mmLeft = 181505
        mmTop = 12700
        mmWidth = 13494
        BandType = 4
      end
      object rptListagemPropostaLabel5: TppLabel
        UserName = 'rptListagemPropostaLabel5'
        Caption = 'meses'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 181505
        mmTop = 16933
        mmWidth = 8467
        BandType = 4
      end
      object rptListagemPropostaLabel6: TppLabel
        UserName = 'rptListagemPropostaLabel6'
        Caption = 'Segmento:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 86519
        mmTop = 3175
        mmWidth = 17463
        BandType = 4
      end
      object rptListagemPropostaDBText5: TppDBText
        UserName = 'rptListagemPropostaDBText5'
        ReprintOnOverFlow = True
        AutoSize = True
        DataField = 'TIPO_IMOVEL'
        DataPipeline = pplListagemProposta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3175
        mmLeft = 103717
        mmTop = 3175
        mmWidth = 19050
        BandType = 4
      end
      object rptListagemPropostaLabel7: TppLabel
        UserName = 'rptListagemPropostaLabel7'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Caption = 'Responsável:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 23813
        mmWidth = 19579
        BandType = 4
      end
      object rptListagemPropostaDBText6: TppDBText
        UserName = 'rptListagemPropostaDBText6'
        ReprintOnOverFlow = True
        DataField = 'NF_RESPONSAVEL'
        DataPipeline = pplListagemProposta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3704
        mmLeft = 29898
        mmTop = 23813
        mmWidth = 110067
        BandType = 4
      end
      object rptListagemPropostaDBText7: TppDBText
        UserName = 'rptListagemPropostaDBText7'
        ReprintOnOverFlow = True
        DataField = 'RS_PROPRIETARIO'
        DataPipeline = pplListagemProposta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3704
        mmLeft = 29898
        mmTop = 13494
        mmWidth = 110067
        BandType = 4
      end
      object rptListagemPropostaLabel3: TppLabel
        UserName = 'rptListagemPropostaLabel3'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 181505
        mmTop = 21167
        mmWidth = 2646
        BandType = 4
      end
      object rptListagemPropostaDBText8: TppDBText
        UserName = 'rptListagemPropostaDBText8'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        DataField = 'PROPAYBACK'
        DataPipeline = pplListagemProposta
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 16933
        mmWidth = 23548
        BandType = 4
      end
      object rptListagemPropostaDBText9: TppDBText
        UserName = 'rptListagemPropostaDBText9'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        DataField = 'PROTIR'
        DataPipeline = pplListagemProposta
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 21167
        mmWidth = 23548
        BandType = 4
      end
      object rptListagemPropostaLabel8: TppLabel
        UserName = 'rptListagemPropostaLabel8'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Caption = 'T.I.R.: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        mmHeight = 3704
        mmLeft = 147902
        mmTop = 21167
        mmWidth = 8467
        BandType = 4
      end
      object rptListagemPropostaLine2: TppLine
        UserName = 'rptListagemPropostaLine2'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 19050
        mmLeft = 141023
        mmTop = 8996
        mmWidth = 265
        BandType = 4
      end
    end
    object ppFooterBand27: TppFooterBand
      mmBottomOffset = 40
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine99: TppLine
        UserName = 'ppLine99'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 196850
        BandType = 8
      end
      object ppLabel299: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel299'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc52: TppSystemVariable
        UserName = 'Calc52'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 76994
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc53: TppSystemVariable
        UserName = 'Calc53'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 160602
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
  end
  object rptContratosMestre: TppReport
    AutoStop = False
    DataPipeline = pplContratosMestre
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
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
    Left = 456
    Top = 144
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplContratosMestre'
    object rptContratosMestre_CabecalhoRelat: TppHeaderBand
      AfterPrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
      BeforePrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
      mmBottomOffset = 40
      mmHeight = 39423
      mmPrintPosition = 0
      object ppLabel31: TppLabel
        UserName = 'ppLabel31'
        AutoSize = False
        Caption = 'Contratos por Imóvel Mestre (sintético)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 36513
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel33: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel33'
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
        mmLeft = 36513
        mmTop = 1588
        mmWidth = 197380
        BandType = 0
      end
      object rptContratosMestre_lblAdministradora: TppLabel
        UserName = 'rptContratosMestre_lblAdministradora'
        Caption = 'rptContratosMestre_lblAdministradora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 22490
        mmTop = 21167
        mmWidth = 41275
        BandType = 0
      end
      object rptContrImoMestreLabel4: TppLabel
        UserName = 'rptContrImoMestreLabel4'
        Caption = 'Administradora: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2921
        mmLeft = 3196
        mmTop = 21167
        mmWidth = 19558
        BandType = 0
      end
      object rptContratosMestreLabel2: TppLabel
        UserName = 'rptContratosMestreLabel2'
        AutoSize = False
        Caption = 'Área'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 210873
        mmTop = 33073
        mmWidth = 15081
        BandType = 0
      end
      object rptContratosMestreLabel3: TppLabel
        UserName = 'rptContratosMestreLabel3'
        Caption = 'Contratual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 194205
        mmTop = 35719
        mmWidth = 12700
        BandType = 0
      end
      object rptContratosMestreLabel4: TppLabel
        UserName = 'rptContratosMestreLabel4'
        Caption = 'Aluguel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 197909
        mmTop = 33073
        mmWidth = 8996
        BandType = 0
      end
      object rptContratosMestreLabel5: TppLabel
        UserName = 'rptContratosMestreLabel5'
        Caption = 'Índice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 242359
        mmTop = 33073
        mmWidth = 7408
        BandType = 0
      end
      object rptContratosMestreLabel6: TppLabel
        UserName = 'rptContratosMestreLabel6'
        Caption = 'Reajuste'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 242359
        mmTop = 35719
        mmWidth = 10319
        BandType = 0
      end
      object rptContratosMestreLabel7: TppLabel
        UserName = 'rptContratosMestreLabel7'
        AutoSize = False
        Caption = 'Ocupada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 210873
        mmTop = 35719
        mmWidth = 15081
        BandType = 0
      end
      object rptContratosMestreLabel8: TppLabel
        UserName = 'rptContratosMestreLabel8'
        Caption = 'Aluguel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 229394
        mmTop = 33073
        mmWidth = 8996
        BandType = 0
      end
      object rptContratosMestreLabel9: TppLabel
        UserName = 'rptContratosMestreLabel9'
        Caption = 'por m2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 230188
        mmTop = 35719
        mmWidth = 8467
        BandType = 0
      end
      object rptContratosMestreLabel10: TppLabel
        UserName = 'rptContratosMestreLabel10'
        Caption = 'Admin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 135202
        mmTop = 35719
        mmWidth = 7408
        BandType = 0
      end
      object rptContratosMestreLabel11: TppLabel
        UserName = 'rptContratosMestreLabel11'
        Caption = 'Taxa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 137319
        mmTop = 33073
        mmWidth = 5292
        BandType = 0
      end
      object rptContratosMestreLabel12: TppLabel
        UserName = 'rptContratosMestreLabel12'
        Caption = 'Reajuste'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 255853
        mmTop = 35719
        mmWidth = 10319
        BandType = 0
      end
      object rptContratosMestreLabel13: TppLabel
        UserName = 'rptContratosMestreLabel13'
        Caption = 'Próximo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 255853
        mmTop = 33073
        mmWidth = 9790
        BandType = 0
      end
      object rptContratosMestreLabel14: TppLabel
        UserName = 'rptContratosMestreLabel14'
        Caption = 'Aluguel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 181240
        mmTop = 35719
        mmWidth = 8996
        BandType = 0
      end
      object rptContratosMestreLabel15: TppLabel
        UserName = 'rptContratosMestreLabel15'
        Caption = 'Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 183886
        mmTop = 33073
        mmWidth = 3969
        BandType = 0
      end
      object rptContratosMestreLine1: TppLine
        UserName = 'rptContratosMestreLine1'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 38629
        mmWidth = 270670
        BandType = 0
      end
      object rptContratosMestreLabel16: TppLabel
        UserName = 'rptContratosMestreLabel16'
        Caption = 'Vigência do Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 147638
        mmTop = 35719
        mmWidth = 25665
        BandType = 0
      end
      object rptContratosMestreLabel17: TppLabel
        UserName = 'rptContratosMestreLabel17'
        Caption = 'Administradora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 81492
        mmTop = 35719
        mmWidth = 18256
        BandType = 0
      end
      object rptContratosMestreLabel18: TppLabel
        UserName = 'rptContratosMestreLabel18'
        Caption = 'Nome do Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 20902
        mmTop = 35719
        mmWidth = 22225
        BandType = 0
      end
      object rptContratosMestreLabel19: TppLabel
        UserName = 'rptContratosMestreLabel19'
        Caption = 'Nº Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 35719
        mmWidth = 14023
        BandType = 0
      end
      object rptFolhaAluguelLabel3: TppLabel
        UserName = 'rptFolhaAluguelLabel3'
        Caption = 'Responsável: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2921
        mmLeft = 6382
        mmTop = 25135
        mmWidth = 16510
        BandType = 0
      end
      object rptContratosMestre_lblResponsavel: TppLabel
        UserName = 'rptContratosMestre_lblResponsavel'
        Caption = 'Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 22490
        mmTop = 25135
        mmWidth = 14552
        BandType = 0
      end
      object rptContratosMestreLabel21: TppLabel
        UserName = 'rptContratosMestreLabel21'
        Caption = 'Status dos Contratos:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 200819
        mmTop = 21431
        mmWidth = 27781
        BandType = 0
      end
      object rptContratosMestre_lblStatus: TppLabel
        UserName = 'rptContratosMestre_lblStatus'
        Caption = 'Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 228336
        mmTop = 21431
        mmWidth = 14552
        BandType = 0
      end
      object rptContratosMestreLabel22: TppLabel
        UserName = 'rptContratosMestreLabel22'
        Caption = ' Reajuste:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 215636
        mmTop = 25135
        mmWidth = 12965
        BandType = 0
      end
      object rptContratosMestre_lblReajuste: TppLabel
        UserName = 'rptContratosMestre_lblReajuste'
        Caption = 'Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 228336
        mmTop = 25135
        mmWidth = 14552
        BandType = 0
      end
      object rptContratosMestre_lblFolha: TppLabel
        UserName = 'rptContratosMestre_lblFolha'
        Caption = 'Apenas Contratos que geram Folha em Fevereiro/2001'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 100542
        mmTop = 25135
        mmWidth = 60854
        BandType = 0
      end
      object rptContratosMestre_lblFim: TppLabel
        UserName = 'rptContratosMestre_lblFim'
        Caption = 'Apenas Contratos com término em Fevereiro/2001'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 102923
        mmTop = 21167
        mmWidth = 56092
        BandType = 0
      end
      object ppLogoLstContratosIM: TppImage
        UserName = 'ppLogoLstContratosIM'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'Label69'
        Caption = 'Tipo de Contrato: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2921
        mmLeft = 1758
        mmTop = 29104
        mmWidth = 20997
        BandType = 0
      end
      object rptContratosMestre_lblTipoContrato: TppLabel
        UserName = 'rptContratosMestre_lblResponsavel1'
        Caption = 'Tipo de Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 22754
        mmTop = 29104
        mmWidth = 18203
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 18785
      mmPrintPosition = 0
      object rptContratosMestre_FundoBandaDetalhe: TppShape
        OnPrint = rptContratosAdminSint_FundoBandaDetalhePrint
        UserName = 'rptContratosMestre_FundoBandaDetalhe'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 18785
        mmLeft = 0
        mmTop = 0
        mmWidth = 270670
        BandType = 4
      end
      object rptContratosMestreLine2: TppLine
        OnPrint = rptContratosAdminSint_SeparadorPrint
        UserName = 'rptContratosMestreLine2'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 18785
        mmLeft = 0
        mmTop = 0
        mmWidth = 270670
        BandType = 4
      end
      object rptContratosMestreDBMemo1: TppDBMemo
        UserName = 'rptContratosMestreDBMemo1'
        CharWrap = False
        DataField = 'NUMERO_CONTRATO'
        DataPipeline = pplContratosMestre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplContratosMestre'
        mmHeight = 15875
        mmLeft = 0
        mmTop = 794
        mmWidth = 20108
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptContratosMestreDBMemo2: TppDBMemo
        UserName = 'rptContratosMestreDBMemo2'
        CharWrap = False
        DataField = 'NOME_CONTRATO'
        DataPipeline = pplContratosMestre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplContratosMestre'
        mmHeight = 15875
        mmLeft = 20902
        mmTop = 794
        mmWidth = 59796
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptContratosMestreDBMemo3: TppDBMemo
        UserName = 'rptContratosMestreDBMemo3'
        CharWrap = False
        DataField = 'ADMINISTRADORA_NF'
        DataPipeline = pplContratosMestre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplContratosMestre'
        mmHeight = 15875
        mmLeft = 81492
        mmTop = 794
        mmWidth = 47890
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptContratosMestreDBText1: TppDBText
        UserName = 'rptContratosMestreDBText1'
        DataField = 'CONTAXAADMIN'
        DataPipeline = pplContratosMestre
        DisplayFormat = '##0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContratosMestre'
        mmHeight = 3175
        mmLeft = 130175
        mmTop = 794
        mmWidth = 12435
        BandType = 4
      end
      object rptContratosMestreLabel20: TppLabel
        UserName = 'rptContratosMestreLabel20'
        AutoSize = False
        Caption = ' a '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 162454
        mmTop = 794
        mmWidth = 3175
        BandType = 4
      end
      object rptContratosMestreDBText2: TppDBText
        UserName = 'rptContratosMestreDBText2'
        DataField = 'CONDATAINICIO'
        DataPipeline = pplContratosMestre
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContratosMestre'
        mmHeight = 3175
        mmLeft = 147638
        mmTop = 794
        mmWidth = 14552
        BandType = 4
      end
      object rptContratosMestreDBText3: TppDBText
        UserName = 'rptContratosMestreDBText3'
        DataField = 'CONDATAFIM'
        DataPipeline = pplContratosMestre
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContratosMestre'
        mmHeight = 3175
        mmLeft = 165894
        mmTop = 794
        mmWidth = 14552
        BandType = 4
      end
      object rptContratosMestreDBText4: TppDBText
        UserName = 'rptContratosMestreDBText4'
        DataField = 'VENCTO_ALUGUEL'
        DataPipeline = pplContratosMestre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplContratosMestre'
        mmHeight = 3175
        mmLeft = 182298
        mmTop = 794
        mmWidth = 6879
        BandType = 4
      end
      object rptContratosMestreDBText5: TppDBText
        UserName = 'rptContratosMestreDBText5'
        DataField = 'VALOR_ALUGUEL'
        DataPipeline = pplContratosMestre
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContratosMestre'
        mmHeight = 3175
        mmLeft = 188913
        mmTop = 794
        mmWidth = 17992
        BandType = 4
      end
      object rptContratosMestreDBText6: TppDBText
        UserName = 'rptContratosMestreDBText6'
        DataField = 'DATA_PROX_REAJUSTE'
        DataPipeline = pplContratosMestre
        DisplayFormat = 'DD/MM/YYYY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContratosMestre'
        mmHeight = 3175
        mmLeft = 255853
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object rptContratosMestreDBText7: TppDBText
        UserName = 'rptContratosMestreDBText7'
        DataField = 'INDICE_REAJUSTE'
        DataPipeline = pplContratosMestre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContratosMestre'
        mmHeight = 3175
        mmLeft = 242359
        mmTop = 794
        mmWidth = 12700
        BandType = 4
      end
      object rptContratosMestreDBText8: TppDBText
        UserName = 'rptContratosMestreDBText8'
        DataField = 'ALUGUEL_M2'
        DataPipeline = pplContratosMestre
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContratosMestre'
        mmHeight = 3175
        mmLeft = 228865
        mmTop = 794
        mmWidth = 9790
        BandType = 4
      end
      object rptContratosMestreDBText9: TppDBText
        UserName = 'rptContratosMestreDBText9'
        DataField = 'AREA_TOTAL'
        DataPipeline = pplContratosMestre
        DisplayFormat = '###,##0.00 m2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContratosMestre'
        mmHeight = 3175
        mmLeft = 208757
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      AfterPrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
      BeforePrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
      mmBottomOffset = 40
      mmHeight = 16933
      mmPrintPosition = 0
      object rptContrImoMestreLine4: TppLine
        UserName = 'rptContrImoMestreLine4'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 6085
        mmWidth = 270670
        BandType = 8
      end
      object rptContrImoMestreLabel11: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'rptContrImoMestreLabel11'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 7408
        mmWidth = 65617
        BandType = 8
      end
      object rptContrImoMestreCalc1: TppSystemVariable
        UserName = 'rptContrImoMestreCalc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 244475
        mmTop = 7408
        mmWidth = 26194
        BandType = 8
      end
      object rptContrImoMestreCalc2: TppSystemVariable
        UserName = 'rptContrImoMestreCalc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 113506
        mmTop = 7408
        mmWidth = 43392
        BandType = 8
      end
    end
    object rptContrImoMestreGroup2: TppGroup
      BreakName = 'NOME_MESTRE'
      DataPipeline = pplContratosMestre
      OutlineSettings.CreateNode = True
      UserName = 'rptContrImoMestreGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContratosMestre'
      object rptContratosMestre_CabecalhoGrupo: TppGroupHeaderBand
        AfterPrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
        BeforePrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
        mmBottomOffset = 40
        mmHeight = 11642
        mmPrintPosition = 0
        object rptContratosMestre_LinhaTitulo: TppLine
          UserName = 'rptContratosMestre_LinhaTitulo'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 11113
          mmWidth = 270670
          BandType = 3
          GroupNo = 0
        end
        object rptContrImoMestreLabel1: TppLabel
          UserName = 'rptContrImoMestreLabel1'
          Caption = 'Imóvel Mestre:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 0
          mmTop = 3704
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object rptContrImoMestreLabel2: TppLabel
          UserName = 'rptContrImoMestreLabel2'
          Caption = 'Endereço:  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 0
          mmTop = 7408
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object rptContrImoMestreDBText1: TppDBText
          UserName = 'rptContrImoMestreDBText1'
          AutoSize = True
          DataField = 'NOME_MESTRE'
          DataPipeline = pplContratosMestre
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplContratosMestre'
          mmHeight = 2910
          mmLeft = 19050
          mmTop = 3704
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object rptContrImoMestreDBText2: TppDBText
          UserName = 'rptContrImoMestreDBText2'
          AutoSize = True
          DataField = 'END_EXTENSO'
          DataPipeline = pplContratosMestre
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplContratosMestre'
          mmHeight = 2910
          mmLeft = 19050
          mmTop = 7408
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
      end
      object rptContrImoMestreGroupFooterBand2: TppGroupFooterBand
        AfterPrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
        BeforePrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
        mmBottomOffset = 40
        mmHeight = 16669
        mmPrintPosition = 0
        object rptContratosMestreShape1: TppShape
          UserName = 'rptContratosMestreShape1'
          Pen.Width = 2
          mmHeight = 5292
          mmLeft = 129117
          mmTop = 2646
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
        object rptContrImoMestreLine3: TppLine
          UserName = 'rptContrImoMestreLine3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 270670
          BandType = 5
          GroupNo = 0
        end
        object rptContrImoMestreLabel9: TppLabel
          UserName = 'rptContrImoMestreLabel9'
          Caption = 'Total do Imóvel Mestre:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 158221
          mmTop = 3704
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object rptContrImoMestreShape1: TppShape
          UserName = 'rptContrImoMestreShape1'
          Pen.Width = 2
          mmHeight = 5556
          mmLeft = 187855
          mmTop = 2646
          mmWidth = 52123
          BandType = 5
          GroupNo = 0
        end
        object rptContrImoMestreDBCalc3: TppDBCalc
          UserName = 'rptContrImoMestreDBCalc3'
          DataField = 'VALOR_ALUGUEL'
          DataPipeline = pplContratosMestre
          DisplayFormat = '###,###,###,###,###,##0.00;(###,###,###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = rptContrImoMestreGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContratosMestre'
          mmHeight = 3175
          mmLeft = 188913
          mmTop = 3704
          mmWidth = 17992
          BandType = 5
          GroupNo = 0
        end
        object rptContrImoMestreDBCalc4: TppDBCalc
          UserName = 'rptContrImoMestreDBCalc4'
          DataField = 'AREA_TOTAL'
          DataPipeline = pplContratosMestre
          DisplayFormat = '###,##0.00 m2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rptContrImoMestreGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContratosMestre'
          mmHeight = 3175
          mmLeft = 208757
          mmTop = 3704
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rptContrImoMestreDBCalc5: TppDBCalc
          UserName = 'rptContrImoMestreDBCalc5'
          DataField = 'ALUGUEL_M2'
          DataPipeline = pplContratosMestre
          DisplayFormat = '###,###,###,###,###,##0.00;(###,###,###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcAverage
          DataPipelineName = 'pplContratosMestre'
          mmHeight = 3175
          mmLeft = 228865
          mmTop = 3704
          mmWidth = 9790
          BandType = 5
          GroupNo = 0
        end
        object rptContratosMestreDBCalc1: TppDBCalc
          UserName = 'rptContratosMestreDBCalc1'
          DataField = 'CONTAXAADMIN'
          DataPipeline = pplContratosMestre
          DisplayFormat = '##0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = rptContrImoMestreGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcAverage
          DataPipelineName = 'pplContratosMestre'
          mmHeight = 2910
          mmLeft = 130175
          mmTop = 3704
          mmWidth = 12435
          BandType = 5
          GroupNo = 0
        end
        object rptContratosMestreLabel1: TppLabel
          UserName = 'rptContratosMestreLabel1'
          Caption = 'Tx. Média:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 115094
          mmTop = 3704
          mmWidth = 14288
          BandType = 5
          GroupNo = 0
        end
        object rptFolhaAluguelDBCalc2: TppDBCalc
          UserName = 'rptFolhaAluguelDBCalc2'
          DataField = 'NOME_CONTRATO'
          DataPipeline = pplContratosMestre
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rptContrImoMestreGroup2
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplContratosMestre'
          mmHeight = 3175
          mmLeft = 45244
          mmTop = 4763
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rptFolhaAluguelLabel4: TppLabel
          UserName = 'rptFolhaAluguelLabel4'
          Caption = 'Total de Contratos:  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 20902
          mmTop = 4763
          mmWidth = 24606
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryContratosMestre: TwwQuery
    OnCalcFields = qryContratosMestreCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IM.IDIMOVELMESTRE, IM.IMONOME NOME_MESTRE,'
      ''
      '   IM.IMOLOGRADOURO, IM.IMONUMERO,'
      '   IM.IMOCOMPLEMENTO, IM.IMOBAIRRO, IM.DSC_CIDADE, IM.DSC_UF,'
      '   IM.IMOCEP,'
      ''
      '   IM.AREA_TOTAL,'
      
        '   (DECODE(IM.AREA_TOTAL, 0, 0, (C.CONVLRAJUSTADO / IM.AREA_TOTA' +
        'L))) AS ALUGUEL_M2,'
      ''
      '   C.IDCONTRATOIMOVEL,'
      '   C.CONNUMERO AS NUMERO_CONTRATO,'
      '   C.CONNOME AS NOME_CONTRATO,'
      '   C.CONINDICEREAJUSTE,'
      '   C.IDLOCATARIO, C.IDADMINIMOVEL, C.CONTAXAADMIN,'
      ''
      '   C.CONDATAINICIO, C.CONDATAFIM,'
      ''
      '   C.CONDIAVENCIMENTO AS VENCTO_ALUGUEL,'
      '   C.FLGTIPODIAVENC AS TIPO_DIA,'
      ''
      '   C.CONDIASTOLERANCIA,'
      '   C.CONVLRAJUSTADO AS VALOR_ALUGUEL,'
      ''
      '   C.CONDATARENEGOC AS DATA_REVISAO,'
      '   C.CONDATAREAJUSTE AS DATA_ULTIMO_REAJUSTE,'
      '   C.CONPROXREAJUSTE AS DATA_PROX_REAJUSTE,'
      '   C.CONDATADENUNCIA AS DATA_DENUNCIA,'
      '   C.CONDATAFIANCAFIM AS DATA_FIM_FIANCA,'
      '   C.CONDATAAVDENUNCIA,'
      '   C.CONDATAAVRENEGOC,'
      ''
      '   M.MOESIGLA AS INDICE_REAJUSTE,'
      ''
      '   PL.RAZAOSOCIAL AS LOCATARIO_RS,'
      '   PL.NOME AS LOCATARIO_NF,'
      '   PA.RAZAOSOCIAL AS ADMINISTRADORA_RS,'
      '   PA.NOME AS ADMINISTRADORA_NF,'
      '   PR.NOME AS RESPONSAVEL_NF,'
      ''
      '   EC.LOGRADOURO, EC.NUMERO, EC.COMPLEMENTO,'
      '   EC.BAIRRO, EC.CEP,'
      '   CID.NOME AS NOME_CIDADE, CID.UF,'
      '   PAIS.NOMEPAIS,'
      ''
      '   M.MSGDESCRICAO'
      ''
      'FROM'
      '   PESSOA PL, PESSOA PA, PESSOA PR,'
      '   CONTRATOIMOVEL C, MOEDA M,'
      '   ENDPESS EC, CIDADES CID, PAIS,'
      '   MSGBOLETO M,'
      ''
      '   ('
      '   SELECT'
      '      IM.IDIMOVELMESTRE,'
      '      IM.IDIMOVEL, CX.IDCONTRATOIMOVEL,'
      '      IM.IMONOME, IM.IMOLOGRADOURO, IM.IMONUMERO,'
      
        '      IM.IMOCOMPLEMENTO, IM.IMOBAIRRO, CIM.NOME AS DSC_CIDADE, C' +
        'IM.UF AS DSC_UF,'
      '      IM.IMOCEP,'
      ''
      
        '      SUM(DECODE(CX.FLGRATEIO, 0, I.IMOAREAGERENCIAL, DECODE(CX.' +
        'CIMPERCENTRATEIO, 0, 0, DECODE(I.IMOAREAGERENCIAL, NULL, 0, I.IM' +
        'OAREAGERENCIAL * CX.CIMPERCENTRATEIO / 100)))) AS AREA_TOTAL'
      '   FROM'
      '      CONTRATOXIMOVEL CX, IMOVEL I, IMOVEL IM, CIDADES CIM'
      '   WHERE'
      '      ( CX.IDIMOVEL = I.IDIMOVEL )'
      '      AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '      AND ( I.IDCIDADES = CIM.IDCIDADES(+) )'
      '   GROUP BY'
      '      IM.IDIMOVELMESTRE,'
      '      IM.IDIMOVEL, CX.IDCONTRATOIMOVEL,'
      '      IM.IMONOME, IM.IMOLOGRADOURO, IM.IMONUMERO,'
      '      IM.IMOCOMPLEMENTO, IM.IMOBAIRRO, CIM.NOME, CIM.UF,'
      '      IM.IMOCEP'
      '   ) IM'
      ''
      'WHERE'
      '   1=2 AND ( C.FLGSTATUS = '#39'V'#39' )'
      '   AND ( C.IDLOCATARIO = PL.IDPESSOA(+) )'
      '   AND ( C.IDADMINIMOVEL = PA.IDPESSOA(+) )'
      '   AND ( C.CONINDICEREAJUSTE = M.MOECODIGO(+) )'
      '   AND ( C.IDCONTRATOIMOVEL = IM.IDCONTRATOIMOVEL )'
      '   AND ( C.IDRESPONSAVEL = PR.IDPESSOA(+) )'
      '   AND ( PL.IDENDCOBRANCA = EC.IDENDERECO(+) )'
      '   AND ( PL.IDPESSOA = EC.IDPESSOA(+) )'
      '   AND ( EC.IDCIDADES = CID.IDCIDADES(+) )'
      '   AND ( EC.IDPAIS = PAIS.IDPAIS(+) )'
      '   AND ( C.IDMSGBOLETO = M.IDMSGBOLETO(+) )'
      ''
      'ORDER BY'
      '   IM.IMONOME, C.CONNUMERO, C.CONNOME'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 456
    Top = 192
    object qryContratosMestreEND_EXTENSO: TStringField
      FieldKind = fkCalculated
      FieldName = 'END_EXTENSO'
      Size = 400
      Calculated = True
    end
    object qryContratosMestreNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object qryContratosMestreIMONUMERO: TStringField
      FieldName = 'IMONUMERO'
      Size = 8
    end
    object qryContratosMestreIMOCOMPLEMENTO: TStringField
      FieldName = 'IMOCOMPLEMENTO'
    end
    object qryContratosMestreIMOBAIRRO: TStringField
      FieldName = 'IMOBAIRRO'
    end
    object qryContratosMestreIMOCEP: TStringField
      FieldName = 'IMOCEP'
      Size = 8
    end
    object qryContratosMestreAREA_TOTAL: TFloatField
      FieldName = 'AREA_TOTAL'
    end
    object qryContratosMestreALUGUEL_M2: TFloatField
      FieldName = 'ALUGUEL_M2'
    end
    object qryContratosMestreIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryContratosMestreNUMERO_CONTRATO: TStringField
      FieldName = 'NUMERO_CONTRATO'
    end
    object qryContratosMestreNOME_CONTRATO: TStringField
      FieldName = 'NOME_CONTRATO'
      Size = 60
    end
    object qryContratosMestreCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
    end
    object qryContratosMestreIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
    end
    object qryContratosMestreIDADMINIMOVEL: TFloatField
      FieldName = 'IDADMINIMOVEL'
    end
    object qryContratosMestreCONTAXAADMIN: TFloatField
      FieldName = 'CONTAXAADMIN'
    end
    object qryContratosMestreCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
    end
    object qryContratosMestreCONDATAFIM: TDateTimeField
      FieldName = 'CONDATAFIM'
    end
    object qryContratosMestreVENCTO_ALUGUEL: TFloatField
      FieldName = 'VENCTO_ALUGUEL'
    end
    object qryContratosMestreTIPO_DIA: TStringField
      FieldName = 'TIPO_DIA'
      Size = 1
    end
    object qryContratosMestreDATA_REVISAO: TDateTimeField
      FieldName = 'DATA_REVISAO'
    end
    object qryContratosMestreDATA_PROX_REAJUSTE: TDateTimeField
      FieldName = 'DATA_PROX_REAJUSTE'
    end
    object qryContratosMestreDATA_DENUNCIA: TDateTimeField
      FieldName = 'DATA_DENUNCIA'
    end
    object qryContratosMestreCONDATAAVDENUNCIA: TDateTimeField
      FieldName = 'CONDATAAVDENUNCIA'
    end
    object qryContratosMestreCONDATAAVRENEGOC: TDateTimeField
      FieldName = 'CONDATAAVRENEGOC'
    end
    object qryContratosMestreLOCATARIO_RS: TStringField
      FieldName = 'LOCATARIO_RS'
      Size = 60
    end
    object qryContratosMestreLOCATARIO_NF: TStringField
      FieldName = 'LOCATARIO_NF'
      Size = 60
    end
    object qryContratosMestreADMINISTRADORA_RS: TStringField
      FieldName = 'ADMINISTRADORA_RS'
      Size = 60
    end
    object qryContratosMestreADMINISTRADORA_NF: TStringField
      FieldName = 'ADMINISTRADORA_NF'
      Size = 60
    end
    object qryContratosMestreDATA_FIM_FIANCA: TDateTimeField
      FieldName = 'DATA_FIM_FIANCA'
    end
    object qryContratosMestreIMOLOGRADOURO: TStringField
      FieldName = 'IMOLOGRADOURO'
      Size = 80
    end
    object qryContratosMestreRESPONSAVEL_NF: TStringField
      FieldName = 'RESPONSAVEL_NF'
      Size = 60
    end
    object qryContratosMestreCONDIASTOLERANCIA: TFloatField
      FieldName = 'CONDIASTOLERANCIA'
    end
    object qryContratosMestreVALOR_ALUGUEL: TFloatField
      FieldName = 'VALOR_ALUGUEL'
    end
    object qryContratosMestreINDICE_REAJUSTE: TStringField
      FieldName = 'INDICE_REAJUSTE'
      Size = 10
    end
    object qryContratosMestreLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qryContratosMestreNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object qryContratosMestreCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qryContratosMestreBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryContratosMestreCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryContratosMestreNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      Size = 50
    end
    object qryContratosMestreNOMEPAIS: TStringField
      FieldName = 'NOMEPAIS'
      Size = 30
    end
    object qryContratosMestreMSGDESCRICAO: TStringField
      FieldName = 'MSGDESCRICAO'
      Size = 60
    end
    object qryContratosMestreDATA_ULTIMO_REAJUSTE: TDateTimeField
      FieldName = 'DATA_ULTIMO_REAJUSTE'
    end
    object qryContratosMestreDSC_CIDADE: TStringField
      FieldName = 'DSC_CIDADE'
      Size = 50
    end
    object qryContratosMestreDSC_UF: TStringField
      FieldName = 'DSC_UF'
      FixedChar = True
      Size = 3
    end
  end
  object dsContratosMestre: TwwDataSource
    DataSet = qryContratosMestre
    Left = 456
    Top = 204
  end
  object pplContratosMestre: TppBDEPipeline
    DataSource = dsContratosMestre
    UserName = 'lContratosMestre'
    Left = 456
    Top = 216
  end
  object qryFiador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT AC.IDCONTRATOIMOVEL, AC.IDAVALISTA, '
      
        '       DECODE(P.TIPO, '#39'J'#39', '#39'Pessoa Jurídica'#39', '#39'Pessoa Física'#39') A' +
        'S FISICA_JURIDICA,'
      '       DECODE(P.TIPO, '#39'J'#39', '
      
        '         DECODE(P.RAZAOSOCIAL,NULL, P.NOME, P.RAZAOSOCIAL) , P.N' +
        'OME ) AS DSC_FIADOR'
      '  FROM AVALISTAXCONTRATO AC,       '
      '       AVALISTA A,'
      '       PESSOA P'
      ' WHERE AC.IDAVALISTA = A.IDAVALISTA             '
      '   AND A.IDAVALISTA  = P.IDPESSOA       ')
    ValidateWithMask = True
    Left = 360
    Top = 275
    object qryFiadorIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryFiadorIDAVALISTA: TFloatField
      FieldName = 'IDAVALISTA'
    end
    object qryFiadorFISICA_JURIDICA: TStringField
      FieldName = 'FISICA_JURIDICA'
      Size = 15
    end
    object qryFiadorDSC_FIADOR: TStringField
      FieldName = 'DSC_FIADOR'
      Size = 60
    end
  end
  object dsFiador: TwwDataSource
    DataSet = qryFiador
    Left = 360
    Top = 287
  end
  object pplFiador: TppBDEPipeline
    DataSource = dsFiador
    SkipWhenNoRecords = False
    UserName = 'lFiador'
    Left = 360
    Top = 299
    MasterDataPipelineName = 'pplListagemContrato'
    object pplFiadorppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplFiadorppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDAVALISTA'
      FieldName = 'IDAVALISTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplFiadorppField3: TppField
      FieldAlias = 'FISICA_JURIDICA'
      FieldName = 'FISICA_JURIDICA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 2
    end
    object pplFiadorppField4: TppField
      FieldAlias = 'DSC_FIADOR'
      FieldName = 'DSC_FIADOR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object TppMasterFieldLink
      MasterFieldName = 'IDCONTRATOIMOVEL'
      DetailFieldName = 'IDCONTRATOIMOVEL'
      DetailSortOrder = soAscending
    end
  end
  object qryCompSocietaria: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsListagemImovel
    SQL.Strings = (
      'SELECT IP.*,'
      '       P.NOME'
      '  FROM IMOVELXPROP IP, PESSOA P'
      ' WHERE IDIMOVEL = :IDMESTRE'
      '   AND IDPESSOA = IDPROPRIETARIOUH'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 257
    Top = 276
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDMESTRE'
        ParamType = ptUnknown
      end>
    object qryCompSocietariaIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'BASEDADOS.IMOVELXPROP.IDIMOVEL'
    end
    object qryCompSocietariaIDPROPRIETARIOUH: TFloatField
      FieldName = 'IDPROPRIETARIOUH'
      Origin = 'BASEDADOS.IMOVELXPROP.IDPROPRIETARIOUH'
    end
    object qryCompSocietariaPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      Origin = 'BASEDADOS.IMOVELXPROP.PERCENTUAL'
    end
    object qryCompSocietariaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
  object pplCompSocietaria: TppBDEPipeline
    DataSource = dsCompSocietaria
    SkipWhenNoRecords = False
    UserName = 'lCompSocietaria'
    Left = 257
    Top = 288
    MasterDataPipelineName = 'pplListagemImovel'
    object pplCompSocietariappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplCompSocietariappField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPROPRIETARIOUH'
      FieldName = 'IDPROPRIETARIOUH'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplCompSocietariappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTUAL'
      FieldName = 'PERCENTUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplCompSocietariappField4: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object TppMasterFieldLink
      MasterFieldName = 'IDMESTRE'
      DetailFieldName = 'IDIMOVEL'
      DetailSortOrder = soAscending
    end
  end
  object dsCompSocietaria: TwwDataSource
    DataSet = qryCompSocietaria
    Left = 257
    Top = 302
  end
  object qryReceitaM2: TwwQuery
    OnCalcFields = qryReceitaM2CalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IM.IMONOME AS NOMEMESTRE,'
      '       IM.IMOLOGRADOURO, IM.IMONUMERO, IM.IMOBAIRRO, IM.IMOCEP,'
      '       CI.NOME    AS DSC_CIDADE, CI.UF      AS DSC_UF,'
      '       I.IMONOME  AS NOMEIMOVEL,IM.IDIMOVEL AS IDMESTRE,'
      '       I.IDIMOVEL, I.IMOAREAGERENCIAL,'
      '       C.IDCONTRATOIMOVEL, C.CONDATAINICIO, C.CONDATAFIM,'
      
        '       DECODE(RE.IDCONTRATOIMOVEL, NULL, '#39'NÃO DEFINIDO'#39', PL.NOME' +
        ') AS LOCATARIO,'
      '       RE.TOT_IMOVEL,'
      
        '       ROUND((RE.TOT_ALTERADOR / RE.TOT_CONTRATO) * RE.TOT_IMOVE' +
        'L,2) AS TOT_ALTIMOVEL,'
      
        '       ROUND((RE.TOT_IMOVEL + ((RE.TOT_ALTERADOR / RE.TOT_CONTRA' +
        'TO) * RE.TOT_IMOVEL)),2) AS TOT_RECEITA,'
      ''
      '       DECODE(NVL(CX.FLGRATEIO,0), 0, I.IMOAREAGERENCIAL,'
      '          DECODE(NVL(CX.CIMPERCENTRATEIO,0), 0, 0,'
      
        '                (I.IMOAREAGERENCIAL * CX.CIMPERCENTRATEIO / 100)' +
        ' )) AS AREA_OCUPADA,'
      ''
      '      ROUND( DECODE(NVL(I.IMOAREAGERENCIAL,0), 0, 0,'
      
        '             DECODE(NVL(CX.FLGRATEIO,0), 0, ((RE.TOT_IMOVEL + ((' +
        'RE.TOT_ALTERADOR / RE.TOT_CONTRATO) * RE.TOT_IMOVEL)) / I.IMOARE' +
        'AGERENCIAL),'
      '             DECODE(NVL(CX.CIMPERCENTRATEIO,0), 0, 0,'
      
        '                  ((RE.TOT_IMOVEL + ((RE.TOT_ALTERADOR / RE.TOT_' +
        'CONTRATO) * RE.TOT_IMOVEL)) / (I.IMOAREAGERENCIAL * CX.CIMPERCEN' +
        'TRATEIO / 100)) ))),2) AS ALUGUELM2'
      'FROM'
      '   PESSOA PL, CIDADES CI,'
      '   IMOVEL I, IMOVEL IM, CONTRATOIMOVEL C,'
      '   CONTRATOXIMOVEL CX,'
      '   ('
      '    SELECT LI.IDCONTRATOIMOVEL,'
      '           LI.IDIMOVEL,'
      '           LI.VLRLANCRECEB AS TOT_IMOVEL,'
      '           SUM( DECODE(RTRIM(LD.OPERACAO), '#39'1'#39', LD.VALOR, 0) +'
      
        '                DECODE(RTRIM(LD.OPERACAO), '#39'2'#39', LD.VALOR, 0) ) A' +
        'S TOT_CONTRATO,'
      
        '           SUM( DECODE(RTRIM(LD.OPERACAO), '#39'4'#39', DECODE(LD.DEBCRE' +
        ', '#39'D'#39', 0, LD.VALOR * -1), 0)'
      '               ) AS TOT_ALTERADOR'
      
        '      FROM DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL LI, IM' +
        'OVEL I'
      '     WHERE ( D.RECPAG = '#39'R'#39' )'
      '       AND ( LI.IDPESSOA = :PIDPESSOA )'
      
        '       AND ((:PMESCOMPETENCIA IS NULL) OR (LI.MESCOMPETENCIA = :' +
        'PMESCOMPETENCIA ))'
      
        '       AND ((:PANOCOMPETENCIA IS NULL) OR (LI.ANOCOMPETENCIA = :' +
        'PANOCOMPETENCIA ))'
      
        '       AND ((:PIDIMOVELMESTRE IS NULL) OR (I.IDIMOVELMESTRE = :P' +
        'IDIMOVELMESTRE) )'
      '       AND ((:PIDFORCLI IS NULL) OR (D.IDFORCLI = :PIDFORCLI) )'
      
        '       AND ((:PCODTIPOIMOVEL IS NULL) OR (I.CODTIPIMOVEL = :PCOD' +
        'TIPOIMOVEL) )'
      
        '       AND ((:PFLGAREA IS NULL) OR (NVL(I.IMOAREAGERENCIAL,0) > ' +
        '0))'
      '       AND ( LI.IDIMOVEL = I.IDIMOVEL )'
      '       AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO(+) )'
      '       AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO(+) )'
      '     GROUP BY LI.IDCONTRATOIMOVEL, LI.IDIMOVEL, LI.VLRLANCRECEB'
      '   ) RE'
      ''
      'WHERE  ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( IM.IDCIDADES = CI.IDCIDADES(+) )'
      '   AND ( CX.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      '   AND ( RE.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL(+) )'
      '   AND ( RE.IDIMOVEL         = CX.IDIMOVEL(+) )'
      '   AND ( RE.IDIMOVEL         = I.IDIMOVEL )'
      '   AND ( C.IDLOCATARIO = PL.IDPESSOA(+) )'
      ''
      'ORDER BY'
      '   NOMEMESTRE, NOMEIMOVEL'
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 355
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
        Value = '2'
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
        Value = '2'
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
        Value = '2004'
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDFORCLI'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDFORCLI'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODTIPOIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODTIPOIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGAREA'
        ParamType = ptUnknown
      end>
    object StringField3: TStringField
      FieldKind = fkCalculated
      FieldName = 'EnderecoExtenso'
      Size = 120
      Calculated = True
    end
    object DateTimeField1: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'DataReferencia'
      Calculated = True
    end
    object qryReceitaM2NOMEMESTRE: TStringField
      FieldName = 'NOMEMESTRE'
      Size = 60
    end
    object qryReceitaM2IMOLOGRADOURO: TStringField
      FieldName = 'IMOLOGRADOURO'
      Size = 80
    end
    object qryReceitaM2IMONUMERO: TStringField
      FieldName = 'IMONUMERO'
      Size = 8
    end
    object qryReceitaM2IMOBAIRRO: TStringField
      FieldName = 'IMOBAIRRO'
    end
    object qryReceitaM2IMOCEP: TStringField
      FieldName = 'IMOCEP'
      Size = 8
    end
    object qryReceitaM2DSC_CIDADE: TStringField
      FieldName = 'DSC_CIDADE'
      Size = 50
    end
    object qryReceitaM2DSC_UF: TStringField
      FieldName = 'DSC_UF'
      FixedChar = True
      Size = 3
    end
    object qryReceitaM2NOMEIMOVEL: TStringField
      FieldName = 'NOMEIMOVEL'
      Size = 60
    end
    object qryReceitaM2IDMESTRE: TFloatField
      FieldName = 'IDMESTRE'
    end
    object qryReceitaM2IDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryReceitaM2IMOAREAGERENCIAL: TFloatField
      FieldName = 'IMOAREAGERENCIAL'
    end
    object qryReceitaM2IDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryReceitaM2CONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
    end
    object qryReceitaM2CONDATAFIM: TDateTimeField
      FieldName = 'CONDATAFIM'
    end
    object qryReceitaM2LOCATARIO: TStringField
      FieldName = 'LOCATARIO'
      Size = 60
    end
    object qryReceitaM2TOT_RECEITA: TFloatField
      FieldName = 'TOT_RECEITA'
    end
    object qryReceitaM2AREA_OCUPADA: TFloatField
      FieldName = 'AREA_OCUPADA'
    end
    object qryReceitaM2ALUGUELM2: TFloatField
      FieldName = 'ALUGUELM2'
    end
    object qryReceitaM2TOT_IMOVEL: TFloatField
      FieldName = 'TOT_IMOVEL'
    end
    object qryReceitaM2TOT_ALTIMOVEL: TFloatField
      FieldName = 'TOT_ALTIMOVEL'
    end
  end
  object dsReceitaM2: TwwDataSource
    DataSet = qryReceitaM2
    Left = 355
    Top = 204
  end
  object pplReceitaM2: TppBDEPipeline
    DataSource = dsReceitaM2
    UserName = 'lQuadroImoveis1'
    Left = 355
    Top = 216
  end
  object rptReceitaM2: TppReport
    AutoStop = False
    DataPipeline = pplReceitaM2
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13229
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 13229
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
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
    Left = 355
    Top = 144
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplReceitaM2'
    object ppHeaderBand1: TppHeaderBand
      AfterPrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
      BeforePrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
      mmBottomOffset = 40
      mmHeight = 24871
      mmPrintPosition = 0
      object ppLabel21: TppLabel
        UserName = 'ppLabel4'
        AutoSize = False
        Caption = 'Receitas de Locação por m2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 2117
        mmTop = 8731
        mmWidth = 278871
        BandType = 0
      end
      object ppLabel22: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel5'
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
        mmLeft = 1323
        mmTop = 1588
        mmWidth = 281253
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'rptQuadroImoveisLabel14'
        Caption = 'Referência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 17992
        mmWidth = 21167
        BandType = 0
      end
      object rptReceitaM2_lblCompetencia: TppLabel
        UserName = 'rptReceitaM2_lblCompetencia'
        Caption = 'rptReceitaM2_lblCompetencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 21960
        mmTop = 18256
        mmWidth = 47096
        BandType = 0
      end
      object ppLogoReceitaM2: TppImage
        UserName = 'ppLogoReceitaM2'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 794
        mmLeft = 0
        mmTop = 23548
        mmWidth = 283898
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 16669
      mmPrintPosition = 0
      object ppShape1: TppShape
        OnPrint = rptContratosAdminSint_FundoBandaDetalhePrint
        UserName = 'rptQuadroImoveis_FundoBandaDetalhe'
        Brush.Color = 13040076
        ParentHeight = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 16669
        mmLeft = 4233
        mmTop = 0
        mmWidth = 279930
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'ppReport1DBMemo1'
        CharWrap = False
        DataField = 'NOMEIMOVEL'
        DataPipeline = pplReceitaM2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplReceitaM2'
        mmHeight = 15875
        mmLeft = 4233
        mmTop = 794
        mmWidth = 51329
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText19: TppDBText
        UserName = 'ppReport1DBText1'
        DataField = 'CONDATAINICIO'
        DataPipeline = pplReceitaM2
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReceitaM2'
        mmHeight = 3704
        mmLeft = 127000
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'ppReport1DBMemo2'
        CharWrap = False
        DataField = 'LOCATARIO'
        DataPipeline = pplReceitaM2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplReceitaM2'
        mmHeight = 15875
        mmLeft = 56092
        mmTop = 794
        mmWidth = 70115
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine5: TppLine
        OnPrint = rptContratosAdminSint_SeparadorPrint
        UserName = 'rptQuadroImoveis_Separador'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 4233
        mmTop = 0
        mmWidth = 279665
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'rptQuadroImoveisDBText1'
        DataField = 'CONDATAFIM'
        DataPipeline = pplReceitaM2
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplReceitaM2'
        mmHeight = 3704
        mmLeft = 146315
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppLabel26: TppLabel
        UserName = 'rptQuadroImoveisLabel2'
        AutoSize = False
        Caption = ' a '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 142611
        mmTop = 794
        mmWidth = 3175
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'rptQuadroImoveisDBText2'
        DataField = 'AREA_OCUPADA'
        DataPipeline = pplReceitaM2
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplReceitaM2'
        mmHeight = 3704
        mmLeft = 243946
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'rptQuadroImoveisDBText3'
        DataField = 'ALUGUELM2'
        DataPipeline = pplReceitaM2
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplReceitaM2'
        mmHeight = 3704
        mmLeft = 267230
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppLabel27: TppLabel
        UserName = 'rptQuadroImoveisLabel8'
        Caption = 'm2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 259557
        mmTop = 794
        mmWidth = 3969
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'rptQuadroImoveisDBText4'
        DataField = 'TOT_IMOVEL'
        DataPipeline = pplReceitaM2
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplReceitaM2'
        mmHeight = 3704
        mmLeft = 162984
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'TOT_ALTIMOVEL'
        DataPipeline = pplReceitaM2
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplReceitaM2'
        mmHeight = 3704
        mmLeft = 189177
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'TOT_RECEITA'
        DataPipeline = pplReceitaM2
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplReceitaM2'
        mmHeight = 3704
        mmLeft = 215371
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 40
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'ppLine1'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 283898
        BandType = 8
      end
      object ppLabel29: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel7'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 120121
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 248444
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'NOMEMESTRE'
      DataPipeline = pplReceitaM2
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplReceitaM2'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        AfterPrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
        BeforePrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
        mmBottomOffset = 40
        mmHeight = 17992
        mmPrintPosition = 0
        object ppLine8: TppLine
          UserName = 'ppLine3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 8202
          mmWidth = 283898
          BandType = 3
          GroupNo = 0
        end
        object ppLabel30: TppLabel
          UserName = 'ppLabel8'
          Caption = 'Imóvel Mestre:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 529
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppDBText27: TppDBText
          UserName = 'ppDBText5'
          AutoSize = True
          DataField = 'NOMEMESTRE'
          DataPipeline = pplReceitaM2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplReceitaM2'
          mmHeight = 3260
          mmLeft = 24077
          mmTop = 529
          mmWidth = 22564
          BandType = 3
          GroupNo = 0
        end
        object ppLine9: TppLine
          OnPrint = rptQuadroImoveis_LinhaTituloPrint
          UserName = 'rptQuadroImoveis_LinhaTitulo'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 4233
          mmTop = 17463
          mmWidth = 279665
          BandType = 3
          GroupNo = 0
        end
        object ppDBText28: TppDBText
          UserName = 'ppDBText6'
          AutoSize = True
          DataField = 'EnderecoExtenso'
          DataPipeline = pplReceitaM2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplReceitaM2'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 4498
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel32: TppLabel
          UserName = 'ppLabel10'
          Caption = 'Imóvel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 4233
          mmTop = 13758
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel34: TppLabel
          UserName = 'ppLabel11'
          Caption = 'Locatário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 56092
          mmTop = 13758
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppLabel36: TppLabel
          UserName = 'ppReport1Label1'
          Caption = 'Vigência do Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 127000
          mmTop = 13758
          mmWidth = 28575
          BandType = 3
          GroupNo = 0
        end
        object ppLabel38: TppLabel
          UserName = 'rptQuadroImoveisLabel3'
          AutoSize = False
          Caption = 'Área'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 248444
          mmTop = 10319
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel39: TppLabel
          UserName = 'rptQuadroImoveisLabel4'
          AutoSize = False
          Caption = 'Ocupada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 248444
          mmTop = 13758
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel40: TppLabel
          UserName = 'rptQuadroImoveisLabel5'
          AutoSize = False
          Caption = 'Aluguel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 267230
          mmTop = 10319
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel41: TppLabel
          UserName = 'rptQuadroImoveisLabel6'
          AutoSize = False
          Caption = 'por m2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 267230
          mmTop = 13758
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel42: TppLabel
          UserName = 'rptQuadroImoveisLabel12'
          AutoSize = False
          Caption = 'Contratual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 163248
          mmTop = 13758
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object ppLabel43: TppLabel
          UserName = 'rptQuadroImoveisLabel13'
          AutoSize = False
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 171450
          mmTop = 10319
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          AutoSize = False
          Caption = 'Alteradores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 189442
          mmTop = 10319
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object ppLabel28: TppLabel
          UserName = 'Label28'
          AutoSize = False
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 223838
          mmTop = 10319
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel35: TppLabel
          UserName = 'Label35'
          AutoSize = False
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 215636
          mmTop = 13758
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object ppLabel46: TppLabel
          UserName = 'Label46'
          AutoSize = False
          Caption = 'de Descontos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 189442
          mmTop = 13758
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        AfterPrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
        BeforePrint = rptContratosAdminSint_CabecalhoRelatAfterPrint
        mmBottomOffset = 40
        mmHeight = 12700
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'rptQuadroImoveisShape1'
          Pen.Width = 2
          mmHeight = 6085
          mmLeft = 155840
          mmTop = 3175
          mmWidth = 128588
          BandType = 5
          GroupNo = 0
        end
        object ppLine10: TppLine
          UserName = 'rptQuadroImoveisLine2'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 4233
          mmTop = 0
          mmWidth = 279665
          BandType = 5
          GroupNo = 0
        end
        object ppLabel44: TppLabel
          UserName = 'rptQuadroImoveisLabel7'
          Caption = 'Total do Imóvel Mestre:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 120915
          mmTop = 4233
          mmWidth = 34131
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'rptQuadroImoveisDBCalc2'
          DataField = 'AREA_OCUPADA'
          DataPipeline = pplReceitaM2
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplReceitaM2'
          mmHeight = 3704
          mmLeft = 243946
          mmTop = 4233
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'rptQuadroImoveisDBCalc4'
          DataField = 'ALUGUELM2'
          DataPipeline = pplReceitaM2
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcAverage
          DataPipelineName = 'pplReceitaM2'
          mmHeight = 3704
          mmLeft = 267230
          mmTop = 4233
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppLabel45: TppLabel
          UserName = 'rptQuadroImoveisLabel10'
          Caption = 'm2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 259557
          mmTop = 4233
          mmWidth = 3969
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'rptQuadroImoveisDBCalc5'
          DataField = 'TOT_IMOVEL'
          DataPipeline = pplReceitaM2
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplReceitaM2'
          mmHeight = 3704
          mmLeft = 162984
          mmTop = 4233
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'TOT_ALTIMOVEL'
          DataPipeline = pplReceitaM2
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplReceitaM2'
          mmHeight = 3704
          mmLeft = 189177
          mmTop = 4233
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'TOT_RECEITA'
          DataPipeline = pplReceitaM2
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplReceitaM2'
          mmHeight = 3704
          mmLeft = 215371
          mmTop = 4233
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplReceitaM2
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplReceitaM2'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppShape5: TppShape
          OnPrint = rptContratosAdminSint_FundoBandaDetalhePrint
          UserName = 'rptQuadroImoveis_FundoBandaDetalhe1'
          Brush.Color = 13040076
          ParentHeight = True
          Pen.Style = psClear
          ReprintOnOverFlow = True
          ShiftWithParent = True
          mmHeight = 6085
          mmLeft = 4233
          mmTop = 0
          mmWidth = 279930
          BandType = 5
          GroupNo = 1
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'Total do Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 120915
          mmTop = 1323
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object TppRegion
          UserName = 'Region1'
          Brush.Style = bsClear
          Transparent = True
          mmHeight = 6085
          mmLeft = 155840
          mmTop = 0
          mmWidth = 128588
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppDBCalc12: TppDBCalc
            UserName = 'DBCalc12'
            DataField = 'TOT_IMOVEL'
            DataPipeline = pplReceitaM2
            DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup7
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplReceitaM2'
            mmHeight = 3704
            mmLeft = 162984
            mmTop = 1323
            mmWidth = 23548
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc13: TppDBCalc
            UserName = 'DBCalc13'
            DataField = 'TOT_ALTIMOVEL'
            DataPipeline = pplReceitaM2
            DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup7
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplReceitaM2'
            mmHeight = 3704
            mmLeft = 189177
            mmTop = 1323
            mmWidth = 23548
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc14: TppDBCalc
            UserName = 'DBCalc14'
            DataField = 'TOT_RECEITA'
            DataPipeline = pplReceitaM2
            DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup7
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplReceitaM2'
            mmHeight = 3704
            mmLeft = 215371
            mmTop = 1323
            mmWidth = 23548
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc10: TppDBCalc
            UserName = 'DBCalc10'
            DataField = 'AREA_OCUPADA'
            DataPipeline = pplReceitaM2
            DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup7
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplReceitaM2'
            mmHeight = 3704
            mmLeft = 243946
            mmTop = 1323
            mmWidth = 15081
            BandType = 5
            GroupNo = 1
          end
          object ppLabel37: TppLabel
            UserName = 'rptQuadroImoveisLabel101'
            Caption = 'm2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3704
            mmLeft = 259821
            mmTop = 1323
            mmWidth = 3704
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc11: TppDBCalc
            UserName = 'DBCalc11'
            DataField = 'ALUGUELM2'
            DataPipeline = pplReceitaM2
            DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup7
            TextAlignment = taRightJustified
            Transparent = True
            DBCalcType = dcAverage
            DataPipelineName = 'pplReceitaM2'
            mmHeight = 3704
            mmLeft = 267230
            mmTop = 1323
            mmWidth = 15081
            BandType = 5
            GroupNo = 1
          end
        end
      end
    end
  end
  object qryListagemImovelSeg: TwwQuery
    OnCalcFields = qryListagemImovelSegCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IM.IDIMOVEL AS IDMESTRE, IM.IMONOME AS NOMEMESTRE,'
      '   IM.IMOLOGRADOURO, IM.IMONUMERO, IM.IMOBAIRRO, IM.IMOCEP,'
      '   CID.NOME AS DSC_CIDADE, CID.UF AS DSC_UF,'
      ''
      '   I.IMONOME AS NOMEIMOVEL, I.IMOMATRICULA, I.IMOCODIGO,'
      '   I.FLGSTATUSOCUPACAO, I.IDIMOVEL, I.IMOAREA,'
      ''
      '   I.IMOVLRCOMPRA, I.IMODATACOMPRA, I.IMOMOEDACOMPRA,'
      '   I.IMOVLRREAVAL, I.IMODATAREAVAL, I.IMOMOEDAREAVAL,'
      '   I.IMOVLRMERCADO, I.IMODATAMERCADO, I.IMOMOEDAMERCADO,'
      ''
      '   M.MOESIGLA AS MOEDA_COMPRA,'
      '   MR.MOESIGLA AS MOEDA_REAVAL,'
      '   T.DESCTIPOIMOVEL AS TIPO_IMOVEL,'
      ''
      '   I.IMOVAGAS,'
      '   I.IMOFRACAOIDEAL,'
      ''
      
        '   DECODE(I.FLGSTATUSOCUPACAO, NULL, '#39'VAGO'#39', DECODE(I.FLGSTATUSO' +
        'CUPACAO, '#39'O'#39', '#39'Ocupado'#39', '#39'VAGO'#39')) AS OCUPACAO_IMOVEL,'
      
        '   DECODE(I.IDCARTEIRASPC, NULL, CT2.DESCARTEIRASPC, CT1.DESCART' +
        'EIRASPC) AS DESC_SPC,'
      ''
      '   DECODE(:pSEGMENTO, 0, DESCTIPOIMOVEL,'
      
        '                      1, DECODE(I.IDCARTEIRASPC, NULL, CT2.DESCA' +
        'RTEIRASPC, CT1.DESCARTEIRASPC)) AS TIPO_IMOVEL_GRUPO,'
      ''
      
        '   DECODE(:pSEGMENTO, 0, DECODE(I.IDCARTEIRASPC, NULL, CT2.DESCA' +
        'RTEIRASPC, CT1.DESCARTEIRASPC),'
      '                      1, DESCTIPOIMOVEL) AS TIPO_IMOVEL_QUEBRA'
      ''
      'FROM'
      
        '   IMOVEL I, IMOVEL IM, TIPOIMOVEL T, MOEDA M, CIDADES CID, MOED' +
        'A MR, CARTEIRASPC CT1, CARTEIRASPC CT2'
      ''
      'WHERE'
      '   1=2 AND (I.IDPESSOA =:PIDPESSOA )'
      
        '   AND ( (:PIDIMOVELMESTRE IS NULL) OR (I.IDIMOVELMESTRE =:PIDIM' +
        'OVELMESTRE) )'
      
        '   AND ( (:PCODTIPIMOVEL IS NULL)   OR (I.CODTIPIMOVEL =:PCODTIP' +
        'IMOVEL) )'
      
        '   AND ( (:PIDCARTEIRASPC IS NULL)  OR (I.IDCARTEIRASPC IS NULL ' +
        'AND T.IDCARTEIRASPC =:PIDCARTEIRASPC)'
      
        '                                    OR (I.IDCARTEIRASPC =:PIDCAR' +
        'TEIRASPC) )'
      
        '   AND ( (:PFLGSTATUSOCUPACAO IS NULL) OR ((:PFLGSTATUSOCUPACAO ' +
        'IS NOT NULL) AND (I.FLGSTATUSOCUPACAO =:PFLGSTATUSOCUPACAO)) )'
      '   AND ( (:PIMOAREA IS NULL) OR (I.IMOAREA > 0) )'
      '   AND ( (:PIMOVLRCOMPRA IS NULL) OR (I.IMOVLRCOMPRA <> 0) )'
      '   AND ( (:PFLGATIVO IS NULL) OR (I.FLGATIVO = 1) )'
      ''
      '   AND ( IM.FLGTIPOIMOVEL = 0 )'
      '   AND ( I.FLGTIPOIMOVEL  = 1 )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL(+) )'
      '   AND ( IM.IDCIDADES     = CID.IDCIDADES(+) )'
      '   AND ( I.CODTIPIMOVEL   = T.CODTIPIMOVEL(+) )'
      '   AND ( I.IMOMOEDACOMPRA = M.MOECODIGO (+) )'
      '   AND ( I.IMOMOEDAREAVAL = MR.MOECODIGO (+) )'
      '   AND ( I.IDCARTEIRASPC  = CT1.IDCARTEIRASPC (+) )'
      '   AND ( T.IDCARTEIRASPC  = CT2.IDCARTEIRASPC (+) )'
      ''
      
        'ORDER BY DECODE(:pSEGMENTO, 0, DESCTIPOIMOVEL || NOMEMESTRE || N' +
        'OMEIMOVEL,'
      
        '                            1, DESC_SPC || NOMEMESTRE || NOMEIMO' +
        'VEL)'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 456
    Top = 367
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pSEGMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pSEGMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCARTEIRASPC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCARTEIRASPC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCARTEIRASPC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGSTATUSOCUPACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGSTATUSOCUPACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGSTATUSOCUPACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIMOAREA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIMOVLRCOMPRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pSEGMENTO'
        ParamType = ptUnknown
      end>
    object StringField4: TStringField
      FieldKind = fkCalculated
      FieldName = 'EnderecoExtenso'
      Size = 120
      Calculated = True
    end
    object StringField13: TStringField
      FieldKind = fkCalculated
      FieldName = 'Ocupacao'
      Size = 12
      Calculated = True
    end
    object DateTimeField4: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'DataReferencia'
      Calculated = True
    end
    object FloatField6: TFloatField
      FieldName = 'IDMESTRE'
    end
    object StringField14: TStringField
      FieldName = 'NOMEMESTRE'
      Size = 60
    end
    object StringField16: TStringField
      FieldName = 'IMONUMERO'
      Size = 8
    end
    object StringField17: TStringField
      FieldName = 'IMOBAIRRO'
    end
    object StringField19: TStringField
      FieldName = 'IMOCEP'
      Size = 8
    end
    object StringField20: TStringField
      FieldName = 'NOMEIMOVEL'
      Size = 60
    end
    object StringField21: TStringField
      FieldName = 'IMOMATRICULA'
    end
    object StringField22: TStringField
      FieldName = 'FLGSTATUSOCUPACAO'
      Size = 1
    end
    object FloatField7: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object FloatField8: TFloatField
      FieldName = 'IMOAREA'
    end
    object StringField23: TStringField
      FieldName = 'TIPO_IMOVEL'
      Size = 25
    end
    object StringField24: TStringField
      FieldName = 'OCUPACAO_IMOVEL'
      Size = 7
    end
    object FloatField9: TFloatField
      FieldName = 'IMOVLRCOMPRA'
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'IMODATACOMPRA'
    end
    object FloatField10: TFloatField
      FieldName = 'IMOMOEDACOMPRA'
    end
    object StringField25: TStringField
      FieldName = 'MOEDA_COMPRA'
      Size = 10
    end
    object StringField26: TStringField
      FieldName = 'IMOLOGRADOURO'
      Size = 80
    end
    object FloatField11: TFloatField
      FieldName = 'IMOVLRREAVAL'
    end
    object DateTimeField7: TDateTimeField
      FieldName = 'IMODATAREAVAL'
    end
    object FloatField12: TFloatField
      FieldName = 'IMOMOEDAREAVAL'
    end
    object FloatField13: TFloatField
      FieldName = 'IMOVLRMERCADO'
    end
    object DateTimeField8: TDateTimeField
      FieldName = 'IMODATAMERCADO'
    end
    object FloatField14: TFloatField
      FieldName = 'IMOMOEDAMERCADO'
    end
    object StringField27: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object StringField28: TStringField
      FieldName = 'DSC_CIDADE'
      Size = 50
    end
    object StringField29: TStringField
      FieldName = 'DSC_UF'
      FixedChar = True
      Size = 3
    end
    object FloatField15: TFloatField
      FieldName = 'IMOVAGAS'
    end
    object FloatField16: TFloatField
      FieldName = 'IMOFRACAOIDEAL'
    end
    object StringField30: TStringField
      FieldName = 'MOEDA_REAVAL'
      Size = 10
    end
    object qryListagemImovelSegDESC_SPC: TStringField
      FieldName = 'DESC_SPC'
      Size = 60
    end
    object qryListagemImovelSegTIPO_IMOVEL_GRUPO: TStringField
      FieldName = 'TIPO_IMOVEL_GRUPO'
      Size = 60
    end
    object qryListagemImovelSegTIPO_IMOVEL_QUEBRA: TStringField
      FieldName = 'TIPO_IMOVEL_QUEBRA'
      Size = 60
    end
  end
  object dsListagemImovelSeg: TwwDataSource
    DataSet = qryListagemImovelSeg
    Left = 456
    Top = 392
  end
  object pplListagemImovelSeg: TppBDEPipeline
    DataSource = dsListagemImovelSeg
    UserName = 'lListagemImovel1'
    Left = 456
    Top = 410
    object pplListagemImovelSegppField1: TppField
      FieldAlias = 'EnderecoExtenso'
      FieldName = 'EnderecoExtenso'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplListagemImovelSegppField2: TppField
      FieldAlias = 'Ocupacao'
      FieldName = 'Ocupacao'
      FieldLength = 12
      DisplayWidth = 12
      Position = 1
    end
    object pplListagemImovelSegppField3: TppField
      FieldAlias = 'DataReferencia'
      FieldName = 'DataReferencia'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object pplListagemImovelSegppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDMESTRE'
      FieldName = 'IDMESTRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplListagemImovelSegppField5: TppField
      FieldAlias = 'NOMEMESTRE'
      FieldName = 'NOMEMESTRE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplListagemImovelSegppField6: TppField
      FieldAlias = 'IMONUMERO'
      FieldName = 'IMONUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 5
    end
    object pplListagemImovelSegppField7: TppField
      FieldAlias = 'IMOBAIRRO'
      FieldName = 'IMOBAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object pplListagemImovelSegppField8: TppField
      FieldAlias = 'IMOCEP'
      FieldName = 'IMOCEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 7
    end
    object pplListagemImovelSegppField9: TppField
      FieldAlias = 'NOMEIMOVEL'
      FieldName = 'NOMEIMOVEL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object pplListagemImovelSegppField10: TppField
      FieldAlias = 'IMOMATRICULA'
      FieldName = 'IMOMATRICULA'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object pplListagemImovelSegppField11: TppField
      FieldAlias = 'FLGSTATUSOCUPACAO'
      FieldName = 'FLGSTATUSOCUPACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 10
    end
    object pplListagemImovelSegppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplListagemImovelSegppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOAREA'
      FieldName = 'IMOAREA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplListagemImovelSegppField14: TppField
      FieldAlias = 'TIPO_IMOVEL'
      FieldName = 'TIPO_IMOVEL'
      FieldLength = 25
      DisplayWidth = 25
      Position = 13
    end
    object pplListagemImovelSegppField15: TppField
      FieldAlias = 'OCUPACAO_IMOVEL'
      FieldName = 'OCUPACAO_IMOVEL'
      FieldLength = 7
      DisplayWidth = 7
      Position = 14
    end
    object pplListagemImovelSegppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOVLRCOMPRA'
      FieldName = 'IMOVLRCOMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplListagemImovelSegppField17: TppField
      FieldAlias = 'IMODATACOMPRA'
      FieldName = 'IMODATACOMPRA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 16
    end
    object pplListagemImovelSegppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOMOEDACOMPRA'
      FieldName = 'IMOMOEDACOMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplListagemImovelSegppField19: TppField
      FieldAlias = 'MOEDA_COMPRA'
      FieldName = 'MOEDA_COMPRA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 18
    end
    object pplListagemImovelSegppField20: TppField
      FieldAlias = 'IMOLOGRADOURO'
      FieldName = 'IMOLOGRADOURO'
      FieldLength = 80
      DisplayWidth = 80
      Position = 19
    end
    object pplListagemImovelSegppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOVLRREAVAL'
      FieldName = 'IMOVLRREAVAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplListagemImovelSegppField22: TppField
      FieldAlias = 'IMODATAREAVAL'
      FieldName = 'IMODATAREAVAL'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 21
    end
    object pplListagemImovelSegppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOMOEDAREAVAL'
      FieldName = 'IMOMOEDAREAVAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplListagemImovelSegppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOVLRMERCADO'
      FieldName = 'IMOVLRMERCADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplListagemImovelSegppField25: TppField
      FieldAlias = 'IMODATAMERCADO'
      FieldName = 'IMODATAMERCADO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 24
    end
    object pplListagemImovelSegppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOMOEDAMERCADO'
      FieldName = 'IMOMOEDAMERCADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplListagemImovelSegppField27: TppField
      FieldAlias = 'IMOCODIGO'
      FieldName = 'IMOCODIGO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 26
    end
    object pplListagemImovelSegppField28: TppField
      FieldAlias = 'DSC_CIDADE'
      FieldName = 'DSC_CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 27
    end
    object pplListagemImovelSegppField29: TppField
      FieldAlias = 'DSC_UF'
      FieldName = 'DSC_UF'
      FieldLength = 3
      DisplayWidth = 3
      Position = 28
    end
    object pplListagemImovelSegppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOVAGAS'
      FieldName = 'IMOVAGAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object pplListagemImovelSegppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOFRACAOIDEAL'
      FieldName = 'IMOFRACAOIDEAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object pplListagemImovelSegppField32: TppField
      FieldAlias = 'MOEDA_REAVAL'
      FieldName = 'MOEDA_REAVAL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 31
    end
    object pplListagemImovelSegppField33: TppField
      FieldAlias = 'DESC_SPC'
      FieldName = 'DESC_SPC'
      FieldLength = 60
      DisplayWidth = 60
      Position = 32
    end
    object pplListagemImovelSegppField34: TppField
      FieldAlias = 'TIPO_IMOVEL_GRUPO'
      FieldName = 'TIPO_IMOVEL_GRUPO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 33
    end
    object pplListagemImovelSegppField35: TppField
      FieldAlias = 'TIPO_IMOVEL_QUEBRA'
      FieldName = 'TIPO_IMOVEL_QUEBRA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 34
    end
  end
  object rptListagemImovelSeg: TppReport
    AutoStop = False
    DataPipeline = pplListagemImovelSeg
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
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
    Left = 457
    Top = 331
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplListagemImovelSeg'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 40
      mmHeight = 19050
      mmPrintPosition = 0
      object ppLabel47: TppLabel
        UserName = 'ppLabel129'
        AutoSize = False
        Caption = 'Listagem de Imóveis por Segmento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 16669
        mmTop = 8731
        mmWidth = 253471
        BandType = 0
      end
      object ppLabel48: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel130'
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
        mmLeft = 16669
        mmTop = 1588
        mmWidth = 253471
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'ppLogoTipo'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      BeforePrint = rptListagemImovel_bndImovelBeforePrint
      BeforeGenerate = rptListagemImovel_bndImovelBeforeGenerate
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 17463
      mmPrintPosition = 0
      object ppDBText29: TppDBText
        UserName = 'ppDBText48'
        DataField = 'IMOAREA'
        DataPipeline = pplListagemImovelSeg
        DisplayFormat = '###,###,##0.00 m2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListagemImovelSeg'
        mmHeight = 3175
        mmLeft = 147373
        mmTop = 1323
        mmWidth = 16933
        BandType = 4
      end
      object ppDBMemo4: TppDBMemo
        UserName = 'ppDBMemo16'
        CharWrap = False
        DataField = 'NOMEIMOVEL'
        DataPipeline = pplListagemImovelSeg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplListagemImovelSeg'
        mmHeight = 15875
        mmLeft = 41010
        mmTop = 1588
        mmWidth = 47096
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText30: TppDBText
        UserName = 'ppDBText50'
        DataField = 'OCUPACAO_IMOVEL'
        DataPipeline = pplListagemImovelSeg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplListagemImovelSeg'
        mmHeight = 2910
        mmLeft = 258763
        mmTop = 1588
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'rptListagemImovelDBText4'
        DataField = 'IMOVLRCOMPRA'
        DataPipeline = pplListagemImovelSeg
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListagemImovelSeg'
        mmHeight = 3175
        mmLeft = 183357
        mmTop = 1323
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'rptListagemImovelDBText5'
        DataField = 'IMODATACOMPRA'
        DataPipeline = pplListagemImovelSeg
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplListagemImovelSeg'
        mmHeight = 3175
        mmLeft = 167746
        mmTop = 1323
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'rptListagemImovelDBText6'
        DataField = 'MOEDA_COMPRA'
        DataPipeline = pplListagemImovelSeg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemImovelSeg'
        mmHeight = 3175
        mmLeft = 206375
        mmTop = 1323
        mmWidth = 4763
        BandType = 4
      end
      object ppDBMemo5: TppDBMemo
        UserName = 'rptListagemImovelDBMemo1'
        CharWrap = False
        DataField = 'IMOMATRICULA'
        DataPipeline = pplListagemImovelSeg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplListagemImovelSeg'
        mmHeight = 15875
        mmLeft = 0
        mmTop = 1588
        mmWidth = 25135
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo6: TppDBMemo
        UserName = 'rptListagemImovelDBMemo2'
        CharWrap = False
        DataField = 'TIPO_IMOVEL_QUEBRA'
        DataPipeline = pplListagemImovelSeg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplListagemImovelSeg'
        mmHeight = 15875
        mmLeft = 88636
        mmTop = 1588
        mmWidth = 30956
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo7: TppDBMemo
        UserName = 'rptListagemImovelDBMemo4'
        CharWrap = False
        DataField = 'IMOCODIGO'
        DataPipeline = pplListagemImovelSeg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplListagemImovelSeg'
        mmHeight = 15875
        mmLeft = 25665
        mmTop = 1588
        mmWidth = 14552
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText34: TppDBText
        UserName = 'DBText9'
        DataField = 'IMOFRACAOIDEAL'
        DataPipeline = pplListagemImovelSeg
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListagemImovelSeg'
        mmHeight = 2910
        mmLeft = 120386
        mmTop = 1588
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText10'
        DataField = 'IMOVAGAS'
        DataPipeline = pplListagemImovelSeg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplListagemImovelSeg'
        mmHeight = 2910
        mmLeft = 136261
        mmTop = 1588
        mmWidth = 9260
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText13'
        DataField = 'IMODATAREAVAL'
        DataPipeline = pplListagemImovelSeg
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplListagemImovelSeg'
        mmHeight = 3175
        mmLeft = 214048
        mmTop = 1323
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText14'
        DataField = 'IMOVLRREAVAL'
        DataPipeline = pplListagemImovelSeg
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListagemImovelSeg'
        mmHeight = 3175
        mmLeft = 229659
        mmTop = 1323
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText15'
        DataField = 'MOEDA_REAVAL'
        DataPipeline = pplListagemImovelSeg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemImovelSeg'
        mmHeight = 3175
        mmLeft = 252942
        mmTop = 1323
        mmWidth = 4763
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 40
      mmHeight = 19844
      mmPrintPosition = 0
      object ppLine12: TppLine
        UserName = 'ppLine41'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 270670
        BandType = 8
      end
      object ppLabel49: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel136'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'Calc27'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 113506
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'Calc28'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 235480
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
    object ppSummaryBand4: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object pplblTotalizador: TppRegion
        UserName = 'lblTotalizador'
        mmHeight = 8467
        mmLeft = 10848
        mmTop = 4233
        mmWidth = 70115
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel79: TppLabel
          UserName = 'Label79'
          Caption = 'Total de imóveis Consultados :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 12435
          mmTop = 6614
          mmWidth = 45508
          BandType = 7
        end
        object pplblTotal: TppLabel
          UserName = 'lblTotal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 62971
          mmTop = 6614
          mmWidth = 13229
          BandType = 7
        end
      end
    end
    object ppGroup12: TppGroup
      BreakName = 'TIPO_IMOVEL_GRUPO'
      DataPipeline = pplListagemImovelSeg
      OutlineSettings.CreateNode = True
      UserName = 'Group12'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplListagemImovelSeg'
      object ppGroupHeaderBand12: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object ppLGerencial_SPC0: TppLabel
          UserName = 'ppLGerencial_SPC0'
          Caption = 'Segmento Gerencial : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 2910
          mmWidth = 37042
          BandType = 3
          GroupNo = 0
        end
        object ppDBText43: TppDBText
          UserName = 'DBText43'
          AutoSize = True
          DataField = 'TIPO_IMOVEL_GRUPO'
          DataPipeline = pplListagemImovelSeg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplListagemImovelSeg'
          mmHeight = 3969
          mmLeft = 37835
          mmTop = 2910
          mmWidth = 38365
          BandType = 3
          GroupNo = 0
        end
        object ppLine15: TppLine
          UserName = 'Line15'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 794
          mmLeft = 0
          mmTop = 7938
          mmWidth = 270670
          BandType = 3
          GroupNo = 0
        end
        object ppLine19: TppLine
          UserName = 'Line19'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 794
          mmLeft = 0
          mmTop = 1323
          mmWidth = 270670
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand12: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'NOMEMESTRE'
      DataPipeline = pplListagemImovelSeg
      OutlineSettings.CreateNode = True
      UserName = 'Group11'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplListagemImovelSeg'
      object ppGroupHeaderBand8: TppGroupHeaderBand
        mmBottomOffset = 40
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLine13: TppLine
          UserName = 'ppLine42'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 794
          mmLeft = 0
          mmTop = 4498
          mmWidth = 270670
          BandType = 3
          GroupNo = 0
        end
        object ppLabel50: TppLabel
          UserName = 'ppLabel137'
          Caption = 'Imóvel Mestre:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 27517
          BandType = 3
          GroupNo = 0
        end
        object ppDBText39: TppDBText
          UserName = 'ppDBText58'
          AutoSize = True
          DataField = 'NOMEMESTRE'
          DataPipeline = pplListagemImovelSeg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplListagemImovelSeg'
          mmHeight = 3969
          mmLeft = 26194
          mmTop = 0
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        mmBottomOffset = 40
        mmHeight = 15081
        mmPrintPosition = 0
        object ppShape4: TppShape
          UserName = 'ppShape3'
          Pen.Width = 2
          mmHeight = 5556
          mmLeft = 123296
          mmTop = 3175
          mmWidth = 137054
          BandType = 5
          GroupNo = 0
        end
        object ppLine14: TppLine
          UserName = 'ppLine44'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 4233
          mmTop = 1058
          mmWidth = 266436
          BandType = 5
          GroupNo = 0
        end
        object ppLabel51: TppLabel
          UserName = 'ppLabel150'
          Caption = 'Totais do Imóvel Mestre:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 92604
          mmTop = 4763
          mmWidth = 30692
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'ppDBCalc5'
          DataField = 'IMOAREA'
          DataPipeline = pplListagemImovelSeg
          DisplayFormat = '###,###,##0.00 m2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplListagemImovelSeg'
          mmHeight = 3175
          mmLeft = 124354
          mmTop = 4233
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'ppDBCalc7'
          DataField = 'CUSTO_CONTABIL'
          DataPipeline = pplListagemImovelSeg
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplListagemImovelSeg'
          mmHeight = 3175
          mmLeft = 235744
          mmTop = 4233
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object ppLabel52: TppLabel
          UserName = 'rptListagemImovelLabel8'
          Caption = 'Total de Imóveis:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 12700
          mmTop = 4763
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'rptListagemImovelDBCalc1'
          DataField = 'NOMEIMOVEL'
          DataPipeline = pplListagemImovelSeg
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup8
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplListagemImovelSeg'
          mmHeight = 3175
          mmLeft = 34925
          mmTop = 4498
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc18: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'IMOVLRREAVAL'
          DataPipeline = pplListagemImovelSeg
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplListagemImovelSeg'
          mmHeight = 3175
          mmLeft = 200290
          mmTop = 4233
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc19: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'IMOVLRCOMPRA'
          DataPipeline = pplListagemImovelSeg
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplListagemImovelSeg'
          mmHeight = 3175
          mmLeft = 156369
          mmTop = 4233
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'NOMEMESTRE'
      DataPipeline = pplListagemImovelSeg
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplListagemImovelSeg'
      object ppGroupHeaderBand9: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppDBText42: TppDBText
          UserName = 'ppDBText59'
          AutoSize = True
          DataField = 'EnderecoExtenso'
          DataPipeline = pplListagemImovelSeg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplListagemImovelSeg'
          mmHeight = 3175
          mmLeft = 265
          mmTop = 265
          mmWidth = 22225
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 1058
        mmPrintPosition = 0
      end
    end
    object ppGroup10: TppGroup
      BreakName = 'NOMEMESTRE'
      DataPipeline = pplListagemImovelSeg
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplListagemImovelSeg'
      object ppGroupHeaderBand10: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppLabel54: TppLabel
          UserName = 'rptListagemImovelLabel1'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 265
          mmTop = 4498
          mmWidth = 10848
          BandType = 3
          GroupNo = 2
        end
        object ppLabel55: TppLabel
          UserName = 'rptListagemImovelLabel7'
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 25929
          mmTop = 4498
          mmWidth = 8467
          BandType = 3
          GroupNo = 2
        end
        object ppLabel56: TppLabel
          UserName = 'ppLabel138'
          Caption = 'Nome do Imóvel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 41275
          mmTop = 4498
          mmWidth = 19315
          BandType = 3
          GroupNo = 2
        end
        object ppLGerencial_SPC1: TppLabel
          UserName = 'rptListagemImovelLabel2'
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 88636
          mmTop = 4498
          mmWidth = 5027
          BandType = 3
          GroupNo = 2
        end
        object ppLabel58: TppLabel
          UserName = 'Label2'
          Caption = 'Fração Ideal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 120915
          mmTop = 4498
          mmWidth = 13494
          BandType = 3
          GroupNo = 2
        end
        object ppLabel59: TppLabel
          UserName = 'Label3'
          Caption = 'Nº Vagas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 135996
          mmTop = 4498
          mmWidth = 10319
          BandType = 3
          GroupNo = 2
        end
        object ppLabel60: TppLabel
          UserName = 'rptListagemImovelLabel3'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 177007
          mmTop = 4233
          mmWidth = 5292
          BandType = 3
          GroupNo = 2
        end
        object ppLabel61: TppLabel
          UserName = 'rptListagemImovelLabel4'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 199496
          mmTop = 4233
          mmWidth = 6085
          BandType = 3
          GroupNo = 2
        end
        object ppLabel62: TppLabel
          UserName = 'rptListagemImovelLabel9'
          Caption = 'Aquisição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 184944
          mmTop = 0
          mmWidth = 11642
          BandType = 3
          GroupNo = 2
        end
        object ppLine16: TppLine
          UserName = 'rptListagemImovelLine1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 168275
          mmTop = 3175
          mmWidth = 42069
          BandType = 3
          GroupNo = 2
        end
        object ppLabel63: TppLabel
          UserName = 'ppLabel143'
          AutoSize = False
          Caption = 'Área Útil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 151871
          mmTop = 4498
          mmWidth = 12435
          BandType = 3
          GroupNo = 2
        end
        object ppLine17: TppLine
          UserName = 'ppLine43'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 794
          mmTop = 7144
          mmWidth = 269876
          BandType = 3
          GroupNo = 2
        end
        object ppLabel66: TppLabel
          UserName = 'Label15'
          Caption = 'Ult. Reavaliação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 227542
          mmTop = 0
          mmWidth = 18785
          BandType = 3
          GroupNo = 2
        end
        object ppLine18: TppLine
          UserName = 'Line4'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 214578
          mmTop = 3175
          mmWidth = 41804
          BandType = 3
          GroupNo = 2
        end
        object ppLabel67: TppLabel
          UserName = 'Label18'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 222780
          mmTop = 4233
          mmWidth = 5292
          BandType = 3
          GroupNo = 2
        end
        object ppLabel68: TppLabel
          UserName = 'Label20'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 246063
          mmTop = 4233
          mmWidth = 6085
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand10: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object sqlSegImoveis: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '               '#39'                                                ' +
        '            '#39' AS NOMEMESTRE,'
      '               0 AS IDIMOVELMESTRE,'
      
        '               '#39'                                                ' +
        '            '#39' AS PATROCINADORA,'
      
        '               '#39'                                                ' +
        '            '#39' AS PLANOPREV,'
      '               0.00000 AS PERCENTRATEIO,'
      '               0.00000 AS VALOR_AQ,'
      '               0.00000 AS VALOR_ULT_AQ'
      '       FROM'
      '               DUAL'
      '       WHERE'
      '               1 = 2'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsSegImoveis
    Left = 40
    Top = 272
  end
  object cdsSegImoveis: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 288
    Data = {
      210100009619E0BD01000000180000000700000000000300000021010A4E4F4D
      454D455354524501004900000002000753554254595045020049000A00466978
      65644368617200055749445448020002003C000E4944494D4F56454C4D455354
      524508000400000000000D504154524F43494E41444F52410100490000000200
      0753554254595045020049000A00466978656443686172000557494454480200
      02003C0009504C414E4F50524556010049000000020007535542545950450200
      49000A0046697865644368617200055749445448020002003C000D5045524345
      4E5452415445494F08000400000000000856414C4F525F415108000400000000
      000C56414C4F525F554C545F415108000400000000000100044C434944040001
      0009080000}
    object cdsSegImoveisNOMEMESTRE: TStringField
      FieldName = 'NOMEMESTRE'
      FixedChar = True
      Size = 60
    end
    object cdsSegImoveisIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object cdsSegImoveisPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      FixedChar = True
      Size = 60
    end
    object cdsSegImoveisPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      FixedChar = True
      Size = 60
    end
    object cdsSegImoveisPERCENTRATEIO: TFloatField
      FieldName = 'PERCENTRATEIO'
    end
    object cdsSegImoveisVALOR_AQ: TFloatField
      FieldName = 'VALOR_AQ'
    end
    object cdsSegImoveisVALOR_ULT_AQ: TFloatField
      FieldName = 'VALOR_ULT_AQ'
    end
  end
  object dsSegImoveis: TDataSource
    DataSet = cdsSegImoveis
    Left = 40
    Top = 304
  end
  object pplSegImoveis: TppBDEPipeline
    DataSource = dsSegImoveis
    UserName = 'lListagemImovel2'
    Left = 40
    Top = 320
    object pplSegImoveisppField1: TppField
      FieldAlias = 'NOMEMESTRE'
      FieldName = 'NOMEMESTRE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplSegImoveisppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVELMESTRE'
      FieldName = 'IDIMOVELMESTRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplSegImoveisppField3: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplSegImoveisppField4: TppField
      FieldAlias = 'PLANOPREV'
      FieldName = 'PLANOPREV'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplSegImoveisppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTRATEIO'
      FieldName = 'PERCENTRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplSegImoveisppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_AQ'
      FieldName = 'VALOR_AQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplSegImoveisppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_ULT_AQ'
      FieldName = 'VALOR_ULT_AQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
end
