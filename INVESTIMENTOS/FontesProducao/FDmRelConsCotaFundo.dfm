inherited DmRelConsCotaFundo: TDmRelConsCotaFundo
  Left = 386
  Top = 184
  Height = 187
  Caption = 'DmRelConsCotaFundo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 160
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
    Left = 96
  end
  inherited qryExemplo: TwwQuery
    Left = 32
  end
  inherited rpExemplo: TppReport
    Left = 216
    DataPipelineName = 'pplExemplo'
  end
  object QryCotaFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM COTAFUNDO CF, FUNDOINVEST FI, TIPOFUNDOINVEST TF'
      'WHERE'
      
        '         ((:IDFUNDOINVEST IS NULL) OR (CF.IDFUNDOINVEST = :IDFUN' +
        'DOINVEST))'
      
        '    AND ((:DATAINI IS NULL) OR (CF.DATACOTA BETWEEN TO_DATE(:DAT' +
        'AINI ,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DATAFIM ,'#39'DD/MM/YYYY'#39')))'
      
        '    AND ((:IDTIPOINVEST IS NULL) or (TF.IDTIPOINVEST = :IDTIPOIN' +
        'VEST))'
      '    AND (FI.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      '    AND (FI.IDFUNDOINVEST     = CF.IDFUNDOINVEST)'
      'ORDER BY FI.DESCFUNDOINVEST, CF.DATACOTA DESC'
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
      ''
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
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
  end
  object rptCotaFundo: TppReport
    AutoStop = False
    DataPipeline = pplCotaFundo
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
    Left = 224
    Top = 80
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCotaFundo'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 19050
      mmPrintPosition = 0
      object ppLabel7: TppLabel
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
        mmWidth = 17198
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
        mmLeft = 58473
        mmTop = 14023
        mmWidth = 1852
        BandType = 0
      end
      object lblDtFin: TppLabel
        UserName = 'LPeriodo3'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 61913
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
        DataPipeline = pplCotaFundo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCotaFundo'
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLRCOTA'
        DataPipeline = pplCotaFundo
        DisplayFormat = '###,###,###0.000000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotaFundo'
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 794
        mmWidth = 26458
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
      DataPipeline = pplCotaFundo
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCotaFundo'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10848
        mmPrintPosition = 0
        object shpPosFundosCab: TppShape
          UserName = 'shpPosFundosCab'
          Brush.Color = clSilver
          mmHeight = 4763
          mmLeft = 265
          mmTop = 6085
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
          mmHeight = 3175
          mmLeft = 2910
          mmTop = 6879
          mmWidth = 5821
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DESCFUNDOINVEST'
          DataPipeline = pplCotaFundo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplCotaFundo'
          mmHeight = 3440
          mmLeft = 15081
          mmTop = 2117
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
          Transparent = True
          mmHeight = 3440
          mmLeft = 35719
          mmTop = 6879
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
          mmLeft = 2910
          mmTop = 2117
          mmWidth = 10583
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
  object pplCotaFundo: TppBDEPipeline
    DataSource = DsCotaFundo
    UserName = 'pplCotaFundo'
    Left = 160
    Top = 80
    object pplCotaFundoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFUNDOINVEST'
      FieldName = 'IDFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplCotaFundoppField2: TppField
      FieldAlias = 'DATACOTA'
      FieldName = 'DATACOTA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object pplCotaFundoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOTA'
      FieldName = 'VLRCOTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplCotaFundoppField4: TppField
      FieldAlias = 'TRGDTINCLUSAO'
      FieldName = 'TRGDTINCLUSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object pplCotaFundoppField5: TppField
      FieldAlias = 'TRGUSERINCLUSAO'
      FieldName = 'TRGUSERINCLUSAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 4
    end
    object pplCotaFundoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOCOTA'
      FieldName = 'IDTIPOCOTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplCotaFundoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCOTAFUNDO'
      FieldName = 'IDCOTAFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplCotaFundoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFUNDOINVEST_1'
      FieldName = 'IDFUNDOINVEST_1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplCotaFundoppField9: TppField
      FieldAlias = 'DESCFUNDOINVEST'
      FieldName = 'DESCFUNDOINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object pplCotaFundoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGESTORCARTEIRA'
      FieldName = 'IDGESTORCARTEIRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplCotaFundoppField11: TppField
      FieldAlias = 'TRGDTINCLUSAO_1'
      FieldName = 'TRGDTINCLUSAO_1'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 10
    end
    object pplCotaFundoppField12: TppField
      FieldAlias = 'TRGUSERINCLUSAO_1'
      FieldName = 'TRGUSERINCLUSAO_1'
      FieldLength = 30
      DisplayWidth = 30
      Position = 11
    end
    object pplCotaFundoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOECODIGO'
      FieldName = 'MOECODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplCotaFundoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplCotaFundoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOFUNDOINVEST'
      FieldName = 'IDTIPOFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplCotaFundoppField16: TppField
      FieldAlias = 'CNPJFUNDO'
      FieldName = 'CNPJFUNDO'
      FieldLength = 25
      DisplayWidth = 25
      Position = 15
    end
    object pplCotaFundoppField17: TppField
      FieldAlias = 'STAEXCLUSIVO'
      FieldName = 'STAEXCLUSIVO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object pplCotaFundoppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'PZOCARENCIA'
      FieldName = 'PZOCARENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplCotaFundoppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'PZOANIVERSARIO'
      FieldName = 'PZOANIVERSARIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplCotaFundoppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'PZOLIQAPLIC'
      FieldName = 'PZOLIQAPLIC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplCotaFundoppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'PZOLIQRESG'
      FieldName = 'PZOLIQRESG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplCotaFundoppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDDECQTD'
      FieldName = 'QTDDECQTD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplCotaFundoppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDDECVALOR'
      FieldName = 'QTDDECVALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplCotaFundoppField24: TppField
      FieldAlias = 'STAFUNDO'
      FieldName = 'STAFUNDO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object pplCotaFundoppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'PZOAMORTIZACAO'
      FieldName = 'PZOAMORTIZACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplCotaFundoppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCTXPERFORM'
      FieldName = 'PERCTXPERFORM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplCotaFundoppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCTXADM'
      FieldName = 'PERCTXADM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplCotaFundoppField28: TppField
      FieldAlias = 'CODFUNCETIP'
      FieldName = 'CODFUNCETIP'
      FieldLength = 30
      DisplayWidth = 30
      Position = 27
    end
    object pplCotaFundoppField29: TppField
      FieldAlias = 'STAPROVISIONAIR'
      FieldName = 'STAPROVISIONAIR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 28
    end
    object pplCotaFundoppField30: TppField
      FieldAlias = 'STAPROVISIONAIOF'
      FieldName = 'STAPROVISIONAIOF'
      FieldLength = 1
      DisplayWidth = 1
      Position = 29
    end
    object pplCotaFundoppField31: TppField
      FieldAlias = 'CONTRCETIP'
      FieldName = 'CONTRCETIP'
      FieldLength = 30
      DisplayWidth = 30
      Position = 30
    end
    object pplCotaFundoppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCATEGORIAFUNDO'
      FieldName = 'IDCATEGORIAFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object pplCotaFundoppField33: TppField
      FieldAlias = 'DATAINICIOFUNDO'
      FieldName = 'DATAINICIOFUNDO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 32
    end
    object pplCotaFundoppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'PZOCOTAPLIC'
      FieldName = 'PZOCOTAPLIC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object pplCotaFundoppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'PZOCOTRESG'
      FieldName = 'PZOCOTRESG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object pplCotaFundoppField36: TppField
      FieldAlias = 'DATACOTIZACAO'
      FieldName = 'DATACOTIZACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 35
    end
    object pplCotaFundoppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDREGRA'
      FieldName = 'IDREGRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object pplCotaFundoppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOTAINICIAL'
      FieldName = 'VLRCOTAINICIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 37
    end
    object pplCotaFundoppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOECORCOTA'
      FieldName = 'MOECORCOTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object pplCotaFundoppField40: TppField
      FieldAlias = 'STAVERCOTA'
      FieldName = 'STAVERCOTA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 39
    end
    object pplCotaFundoppField41: TppField
      FieldAlias = 'DATAINIAPLIC'
      FieldName = 'DATAINIAPLIC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 40
    end
    object pplCotaFundoppField42: TppField
      FieldAlias = 'DTAVIGENCIA'
      FieldName = 'DTAVIGENCIA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 41
    end
    object pplCotaFundoppField43: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRASPC'
      FieldName = 'IDCARTEIRASPC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 42
    end
    object pplCotaFundoppField44: TppField
      FieldAlias = 'DTAINIPROC'
      FieldName = 'DTAINIPROC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 43
    end
  end
  object DsCotaFundo: TwwDataSource
    AutoEdit = False
    DataSet = QryCotaFundo
    Left = 96
    Top = 80
  end
end
