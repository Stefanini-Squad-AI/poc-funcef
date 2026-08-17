inherited DmRelConsCotaIntegrFundo: TDmRelConsCotaIntegrFundo
  Left = 416
  Top = 186
  Caption = 'DmRelConsCotaIntegrFundo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
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
  inherited rpExemplo: TppReport
    DataPipelineName = 'pplExemplo'
  end
  object QryCotaIntegrFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM COTAINTEGRFUNDO CF, FUNDOINVEST FI, TIPOCOTA TC'
      'WHERE'
      
        '     ((:IDFUNDOINVEST IS NULL) OR (CF.IDFUNDOINVEST = :IDFUNDOIN' +
        'VEST))'
      
        'AND (((:DATAINI IS NULL) OR (:DATAFIM IS NULL)) OR (CF.DATACOTA ' +
        'BETWEEN TO_DATE(:DATAINI ,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DATAFIM ,'#39'D' +
        'D/MM/YYYY'#39')))'
      'AND  ((:IDTIPOCOTA IS NULL) OR (CF.IDTIPOCOTA = :IDTIPOCOTA))'
      'AND (FI.IDFUNDOINVEST = CF.IDFUNDOINVEST)'
      'AND (TC.IDTIPOCOTA(+) = CF.IDTIPOCOTA)'
      'ORDER BY FI.DESCFUNDOINVEST, TC.DESCTIPOCOTA, CF.DATACOTA  DESC '
      ' ')
    ValidateWithMask = True
    Left = 38
    Top = 83
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
  end
  object DsCotaIntegrFundo: TwwDataSource
    AutoEdit = False
    DataSet = QryCotaIntegrFundo
    Left = 34
    Top = 139
  end
  object pplCotaIntegrFundo: TppBDEPipeline
    DataSource = DsCotaIntegrFundo
    UserName = 'lCotaIntegrFundo'
    Left = 146
    Top = 83
    object pplCotaIntegrFundoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFUNDOINVEST'
      FieldName = 'IDFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplCotaIntegrFundoppField2: TppField
      FieldAlias = 'DATACOTA'
      FieldName = 'DATACOTA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object pplCotaIntegrFundoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOTA'
      FieldName = 'VLRCOTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplCotaIntegrFundoppField4: TppField
      FieldAlias = 'TRGDTINCLUSAO'
      FieldName = 'TRGDTINCLUSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object pplCotaIntegrFundoppField5: TppField
      FieldAlias = 'TRGUSERINCLUSAO'
      FieldName = 'TRGUSERINCLUSAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 4
    end
    object pplCotaIntegrFundoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOCOTA'
      FieldName = 'IDTIPOCOTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplCotaIntegrFundoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCOTAINTEGRFUNDO'
      FieldName = 'IDCOTAINTEGRFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplCotaIntegrFundoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFUNDOINVEST_1'
      FieldName = 'IDFUNDOINVEST_1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplCotaIntegrFundoppField9: TppField
      FieldAlias = 'DESCFUNDOINVEST'
      FieldName = 'DESCFUNDOINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object pplCotaIntegrFundoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGESTORCARTEIRA'
      FieldName = 'IDGESTORCARTEIRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplCotaIntegrFundoppField11: TppField
      FieldAlias = 'TRGDTINCLUSAO_1'
      FieldName = 'TRGDTINCLUSAO_1'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 10
    end
    object pplCotaIntegrFundoppField12: TppField
      FieldAlias = 'TRGUSERINCLUSAO_1'
      FieldName = 'TRGUSERINCLUSAO_1'
      FieldLength = 30
      DisplayWidth = 30
      Position = 11
    end
    object pplCotaIntegrFundoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOECODIGO'
      FieldName = 'MOECODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplCotaIntegrFundoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplCotaIntegrFundoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOFUNDOINVEST'
      FieldName = 'IDTIPOFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplCotaIntegrFundoppField16: TppField
      FieldAlias = 'CNPJFUNDO'
      FieldName = 'CNPJFUNDO'
      FieldLength = 25
      DisplayWidth = 25
      Position = 15
    end
    object pplCotaIntegrFundoppField17: TppField
      FieldAlias = 'STAEXCLUSIVO'
      FieldName = 'STAEXCLUSIVO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object pplCotaIntegrFundoppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'PZOCARENCIA'
      FieldName = 'PZOCARENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplCotaIntegrFundoppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'PZOANIVERSARIO'
      FieldName = 'PZOANIVERSARIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplCotaIntegrFundoppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'PZOLIQAPLIC'
      FieldName = 'PZOLIQAPLIC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplCotaIntegrFundoppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'PZOLIQRESG'
      FieldName = 'PZOLIQRESG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplCotaIntegrFundoppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDDECQTD'
      FieldName = 'QTDDECQTD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplCotaIntegrFundoppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDDECVALOR'
      FieldName = 'QTDDECVALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplCotaIntegrFundoppField24: TppField
      FieldAlias = 'STAFUNDO'
      FieldName = 'STAFUNDO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object pplCotaIntegrFundoppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'PZOAMORTIZACAO'
      FieldName = 'PZOAMORTIZACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplCotaIntegrFundoppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCTXPERFORM'
      FieldName = 'PERCTXPERFORM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplCotaIntegrFundoppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCTXADM'
      FieldName = 'PERCTXADM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplCotaIntegrFundoppField28: TppField
      FieldAlias = 'CODFUNCETIP'
      FieldName = 'CODFUNCETIP'
      FieldLength = 30
      DisplayWidth = 30
      Position = 27
    end
    object pplCotaIntegrFundoppField29: TppField
      FieldAlias = 'STAPROVISIONAIR'
      FieldName = 'STAPROVISIONAIR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 28
    end
    object pplCotaIntegrFundoppField30: TppField
      FieldAlias = 'STAPROVISIONAIOF'
      FieldName = 'STAPROVISIONAIOF'
      FieldLength = 1
      DisplayWidth = 1
      Position = 29
    end
    object pplCotaIntegrFundoppField31: TppField
      FieldAlias = 'CONTRCETIP'
      FieldName = 'CONTRCETIP'
      FieldLength = 30
      DisplayWidth = 30
      Position = 30
    end
    object pplCotaIntegrFundoppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCATEGORIAFUNDO'
      FieldName = 'IDCATEGORIAFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object pplCotaIntegrFundoppField33: TppField
      FieldAlias = 'DATAINICIOFUNDO'
      FieldName = 'DATAINICIOFUNDO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 32
    end
    object pplCotaIntegrFundoppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'PZOCOTAPLIC'
      FieldName = 'PZOCOTAPLIC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object pplCotaIntegrFundoppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'PZOCOTRESG'
      FieldName = 'PZOCOTRESG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object pplCotaIntegrFundoppField36: TppField
      FieldAlias = 'DATACOTIZACAO'
      FieldName = 'DATACOTIZACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 35
    end
    object pplCotaIntegrFundoppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDREGRA'
      FieldName = 'IDREGRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object pplCotaIntegrFundoppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOTAINICIAL'
      FieldName = 'VLRCOTAINICIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 37
    end
    object pplCotaIntegrFundoppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOECORCOTA'
      FieldName = 'MOECORCOTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object pplCotaIntegrFundoppField40: TppField
      FieldAlias = 'STAVERCOTA'
      FieldName = 'STAVERCOTA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 39
    end
    object pplCotaIntegrFundoppField41: TppField
      FieldAlias = 'DATAINIAPLIC'
      FieldName = 'DATAINIAPLIC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 40
    end
    object pplCotaIntegrFundoppField42: TppField
      FieldAlias = 'DTAVIGENCIA'
      FieldName = 'DTAVIGENCIA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 41
    end
    object pplCotaIntegrFundoppField43: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRASPC'
      FieldName = 'IDCARTEIRASPC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 42
    end
    object pplCotaIntegrFundoppField44: TppField
      FieldAlias = 'DTAINIPROC'
      FieldName = 'DTAINIPROC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 43
    end
    object pplCotaIntegrFundoppField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDTOTINTEGRALIZA'
      FieldName = 'QTDTOTINTEGRALIZA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 44
    end
    object pplCotaIntegrFundoppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOCOTA_1'
      FieldName = 'IDTIPOCOTA_1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object pplCotaIntegrFundoppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCLASSIFANBID'
      FieldName = 'IDCLASSIFANBID'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 46
    end
    object pplCotaIntegrFundoppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDADMFDOINVEST'
      FieldName = 'IDADMFDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 47
    end
    object pplCotaIntegrFundoppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCUSTODIANTE'
      FieldName = 'IDCUSTODIANTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 48
    end
    object pplCotaIntegrFundoppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODANBID'
      FieldName = 'CODANBID'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 49
    end
    object pplCotaIntegrFundoppField51: TppField
      FieldAlias = 'CODISIN'
      FieldName = 'CODISIN'
      FieldLength = 14
      DisplayWidth = 14
      Position = 50
    end
    object pplCotaIntegrFundoppField52: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRISCOFUNDOINVES'
      FieldName = 'IDRISCOFUNDOINVES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 51
    end
    object pplCotaIntegrFundoppField53: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOCOTA_2'
      FieldName = 'IDTIPOCOTA_2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 52
    end
    object pplCotaIntegrFundoppField54: TppField
      FieldAlias = 'DESCTIPOCOTA'
      FieldName = 'DESCTIPOCOTA'
      FieldLength = 40
      DisplayWidth = 40
      Position = 53
    end
  end
  object rptCotaIntegrFundo: TppReport
    AutoStop = False
    DataPipeline = pplCotaIntegrFundo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Consulta de Cotas dos Fundos de Investimentos'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 222
    Top = 83
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCotaIntegrFundo'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 19315
      mmPrintPosition = 0
      object lblTitle: TppLabel
        UserName = 'Label11'
        Caption = 'Consulta de Cotas dos Fundos de Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 81492
        BandType = 0
      end
      object ppLabel8: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'LCarteira'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 183092
        mmTop = 14023
        mmWidth = 11906
        BandType = 0
      end
      object ppPeriodo: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Periodo : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 13758
        BandType = 0
      end
      object ppDBImage10: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmOperComum.pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object lblDtIni: TppLabel
        UserName = 'LPeriodo1'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 40217
        mmTop = 14023
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'LPeriodo2'
        Caption = 'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 58738
        mmTop = 14023
        mmWidth = 1852
        BandType = 0
      end
      object lblDtFinal: TppLabel
        UserName = 'LPeriodo3'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 62177
        mmTop = 14023
        mmWidth = 16933
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object shpAmortCotasFnd: TppShape
        OnPrint = shpAmortCotasFndPrint
        UserName = 'RpConsCartRendVarShape2'
        Brush.Color = 14935011
        Pen.Style = psClear
        ReprintOnOverFlow = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 197910
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DATACOTA'
        DataPipeline = pplCotaIntegrFundo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCotaIntegrFundo'
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLRCOTA'
        DataPipeline = pplCotaIntegrFundo
        DisplayFormat = '###,###,###0.000000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotaIntegrFundo'
        mmHeight = 3175
        mmLeft = 89165
        mmTop = 529
        mmWidth = 26458
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DESCTIPOCOTA'
        DataPipeline = pplCotaIntegrFundo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCotaIntegrFundo'
        mmHeight = 3175
        mmLeft = 25665
        mmTop = 529
        mmWidth = 44715
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel72: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'Calc1'
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
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCFUNDOINVEST'
      DataPipeline = pplCotaIntegrFundo
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCotaIntegrFundo'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object shpPosFundosCab: TppShape
          UserName = 'shpPosFundosCab'
          Brush.Color = clSilver
          mmHeight = 4763
          mmLeft = 265
          mmTop = 5821
          mmWidth = 197115
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 2910
          mmTop = 6615
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DESCFUNDOINVEST'
          DataPipeline = pplCotaIntegrFundo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplCotaIntegrFundo'
          mmHeight = 3440
          mmLeft = 18785
          mmTop = 1852
          mmWidth = 124884
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Cota'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 109273
          mmTop = 6615
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
        object lblFundo: TppLabel
          UserName = 'lblFundo'
          Caption = 'Fundo :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 3175
          mmTop = 1852
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Tipo de Cota'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 25665
          mmTop = 6615
          mmWidth = 17145
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
