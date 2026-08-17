inherited dtmRelParcGerSint: TdtmRelParcGerSint
  Left = 342
  Top = 319
  Width = 193
  Height = 172
  Caption = 'dtmRelParcGerSint'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 32
    Top = 64
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
    Left = 32
    Top = 77
  end
  inherited qryExemplo: TwwQuery
    Left = 32
    Top = 88
  end
  inherited rpExemplo: TppReport
    Left = 32
    DataPipelineName = 'pplExemplo'
  end
  object pplParcGerSint: TppBDEPipeline
    DataSource = dsParcGerSint
    UserName = 'lExemplo1'
    Left = 120
    Top = 64
  end
  object dsParcGerSint: TwwDataSource
    DataSet = qryParcGerSint
    Left = 120
    Top = 76
  end
  object qryParcGerSint: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TE.DESCTIPOEMPTMO,'
      '       TCE.TCEDESCRICAO,'
      '       PLA.NOME AS PLANO,'
      '       PE.NOME AS PATRO,'
      '       ITE.ITEDESCRICAO AS ITEM,'
      '       HST.HMECENTRALIZA,'
      '       SUM(HST.HMEVLRPREVISTO) AS TOTAL,'
      
        '       DECODE(HMECENTRALIZA,1,COUNT(HST.IDCONTRATOEMPTMO),0) AS ' +
        'TOTCONTRATO,'
      
        '       DECODE(HMECENTRALIZA,1,SUM(HST.HMEVLRPREVISTO),0) AS TOTA' +
        'LPARCELA'
      
        'FROM   HISTMOVEMPTMO HST, CONTRATOEMPTMO CTE, ITEMEMPTMO ITE, TI' +
        'POEMPTMO TE, TIPOCONTREMPTMO TCE,'
      '       PLANPREV PLA, PATRO PAT, PESSOA PE'
      'WHERE  (HST.IDCONTRATOEMPTMO = CTE.IDCONTRATOEMPTMO)'
      'AND    (HST.IDITEMEMPTMO = ITE.IDITEMEMPTMO)'
      'AND    (HST.HMETIPOMOV = 1)'
      'AND    (( HST.FLGESTORNADO IS NULL) OR (HST.FLGESTORNADO = 0))'
      'AND    (HST.HMESEQCOBRANCA = 1)'
      'AND    (HST.HMEANOCOMPETENCIA = 2002)'
      'AND    (HST.HMEMESCOMPETENCIA = 1)'
      'AND    (CTE.IDPATRO = PAT.IDPESSOA)'
      'AND    (PE.IDPESSOA = PAT.IDPESSOA)'
      'AND    (CTE.IDPLANOPREV = PLA.IDPLANOPREV)'
      'AND    (CTE.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO)'
      'AND    (TCE.IDTIPOEMPTMO = TE.IDTIPOEMPTMO)'
      'GROUP BY'
      '       PE.NOME,'
      '       PLA.NOME,'
      '       TE.DESCTIPOEMPTMO,'
      '       TCE.TCEDESCRICAO,'
      '       ITE.ITEDESCRICAO,'
      '       HST.HMECENTRALIZA'
      
        'ORDER BY TE.DESCTIPOEMPTMO, TCE.TCEDESCRICAO, PLA.NOME, PE.NOME,' +
        ' HST.HMECENTRALIZA DESC, ITE.ITEDESCRICAO DESC'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 120
    Top = 88
    object qryParcGerSintDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryParcGerSintTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryParcGerSintPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object qryParcGerSintPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryParcGerSintITEM: TStringField
      FieldName = 'ITEM'
      Size = 40
    end
    object qryParcGerSintHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryParcGerSintTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object qryParcGerSintTOTCONTRATO: TFloatField
      FieldName = 'TOTCONTRATO'
    end
    object qryParcGerSintTOTALPARCELA: TFloatField
      FieldName = 'TOTALPARCELA'
    end
  end
  object rptParcGerSint: TppReport
    AutoStop = False
    DataPipeline = pplParcGerSint
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
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
    Left = 122
    Top = 16
    Version = '7.04'
    mmColumnWidth = 197380
    DataPipelineName = 'pplParcGerSint'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Parcelas Geradas no Mês (Sintético)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 25929
        mmTop = 8731
        mmWidth = 131763
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
        mmLeft = 25929
        mmTop = 794
        mmWidth = 131498
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Mês/Ano:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 18521
        mmWidth = 17992
        BandType = 0
      end
      object rptContratosAdminAnal_lblAdministradora: TppLabel
        OnPrint = rptContratosAdminAnal_lblAdministradoraPrint
        UserName = 'rptContratosAdminAnal_lblAdministradora'
        Caption = 'Janeiro/2002'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 19579
        mmTop = 18521
        mmWidth = 20373
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object rptContrato: TppShape
        OnPrint = rptContratoPrint
        UserName = 'rptContrato'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 183542
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'ITEM'
        DataPipeline = pplParcGerSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParcGerSint'
        mmHeight = 3440
        mmLeft = 13494
        mmTop = 529
        mmWidth = 46567
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        BlankWhenZero = True
        DataField = 'TOTCONTRATO'
        DataPipeline = pplParcGerSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParcGerSint'
        mmHeight = 3175
        mmLeft = 88900
        mmTop = 529
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'TOTAL'
        DataPipeline = pplParcGerSint
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParcGerSint'
        mmHeight = 3175
        mmLeft = 100542
        mmTop = 529
        mmWidth = 20373
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
        mmTop = 1852
        mmWidth = 183542
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
        mmHeight = 3175
        mmLeft = 265
        mmTop = 3175
        mmWidth = 23019
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
        mmHeight = 3704
        mmLeft = 44186
        mmTop = 3440
        mmWidth = 94986
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
        mmHeight = 3704
        mmLeft = 156634
        mmTop = 3440
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 20902
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 6615
        mmLeft = 83344
        mmTop = 6615
        mmWidth = 38894
        BandType = 7
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 3704
        mmWidth = 183542
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'TOTCONTRATO'
        DataPipeline = pplParcGerSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParcGerSint'
        mmHeight = 3175
        mmLeft = 88900
        mmTop = 8202
        mmWidth = 10054
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        DataField = 'TOTALQUI'
        DataPipeline = pplParcGerSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParcGerSint'
        mmHeight = 3175
        mmLeft = 203994
        mmTop = 8467
        mmWidth = 7408
        BandType = 7
      end
      object ppDBCalc15: TppDBCalc
        UserName = 'DBCalc15'
        DataField = 'TOTALQUM'
        DataPipeline = pplParcGerSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParcGerSint'
        mmHeight = 3175
        mmLeft = 235480
        mmTop = 8467
        mmWidth = 7408
        BandType = 7
      end
      object ppDBCalc31: TppDBCalc
        UserName = 'DBCalc31'
        DataField = 'TOTALPARCELA'
        DataPipeline = pplParcGerSint
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParcGerSint'
        mmHeight = 3175
        mmLeft = 100542
        mmTop = 8202
        mmWidth = 16140
        BandType = 7
      end
      object ppDBCalc35: TppDBCalc
        UserName = 'DBCalc35'
        DataField = 'VLRQUITACAO'
        DataPipeline = pplParcGerSint
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParcGerSint'
        mmHeight = 3175
        mmLeft = 212196
        mmTop = 8467
        mmWidth = 16140
        BandType = 7
      end
      object ppDBCalc36: TppDBCalc
        UserName = 'DBCalc301'
        DataField = 'VLRQUITMORT'
        DataPipeline = pplParcGerSint
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParcGerSint'
        mmHeight = 3175
        mmLeft = 243417
        mmTop = 8467
        mmWidth = 16140
        BandType = 7
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 66411
        mmTop = 8202
        mmWidth = 15610
        BandType = 7
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'DESCTIPOEMPTMO'
      DataPipeline = pplParcGerSint
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplParcGerSint'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppDBText17: TppDBText
          UserName = 'DBText17'
          DataField = 'DESCTIPOEMPTMO'
          DataPipeline = pplParcGerSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplParcGerSint'
          mmHeight = 3969
          mmLeft = 265
          mmTop = 1058
          mmWidth = 77258
          BandType = 3
          GroupNo = 0
        end
        object ppLine8: TppLine
          UserName = 'Line8'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 183542
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'Shape5'
          mmHeight = 4763
          mmLeft = 83344
          mmTop = 1588
          mmWidth = 42333
          BandType = 5
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Total do Tipo de Empréstimo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 42863
          mmTop = 1852
          mmWidth = 39158
          BandType = 5
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 265
          mmWidth = 183542
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'TOTCONTRATO'
          DataPipeline = pplParcGerSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplParcGerSint'
          mmHeight = 3175
          mmLeft = 88900
          mmTop = 2381
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'TOTALPARCELA'
          DataPipeline = pplParcGerSint
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplParcGerSint'
          mmHeight = 3175
          mmLeft = 100542
          mmTop = 2381
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'TCEDESCRICAO'
      DataPipeline = pplParcGerSint
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplParcGerSint'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 183542
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'TCEDESCRICAO'
          DataPipeline = pplParcGerSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplParcGerSint'
          mmHeight = 3969
          mmLeft = 2381
          mmTop = 1852
          mmWidth = 77258
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object rptContratosAdminAnalShape1: TppShape
          UserName = 'rptContratosAdminAnalShape1'
          mmHeight = 4763
          mmLeft = 83344
          mmTop = 1323
          mmWidth = 42333
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'TOTCONTRATO'
          DataPipeline = pplParcGerSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplParcGerSint'
          mmHeight = 3175
          mmLeft = 88900
          mmTop = 2117
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc25: TppDBCalc
          UserName = 'DBCalc25'
          DataField = 'TOTALPARCELA'
          DataPipeline = pplParcGerSint
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplParcGerSint'
          mmHeight = 3175
          mmLeft = 100542
          mmTop = 2117
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 265
          mmWidth = 183542
          BandType = 5
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Total do Tipo de Contrato:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 47096
          mmTop = 2117
          mmWidth = 34925
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'PLANO'
      DataPipeline = pplParcGerSint
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplParcGerSint'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'PLANO'
          DataPipeline = pplParcGerSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          DataPipelineName = 'pplParcGerSint'
          mmHeight = 3969
          mmLeft = 4233
          mmTop = 1058
          mmWidth = 79640
          BandType = 3
          GroupNo = 1
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 183542
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppShape3: TppShape
          UserName = 'Shape3'
          mmHeight = 4763
          mmLeft = 83344
          mmTop = 1323
          mmWidth = 42333
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'TOTCONTRATO'
          DataPipeline = pplParcGerSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplParcGerSint'
          mmHeight = 3175
          mmLeft = 88900
          mmTop = 2117
          mmWidth = 10054
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc16'
          DataField = 'TOTALPARCELA'
          DataPipeline = pplParcGerSint
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplParcGerSint'
          mmHeight = 3175
          mmLeft = 100542
          mmTop = 2117
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 265
          mmWidth = 183542
          BandType = 5
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label1'
          Caption = 'Total do Plano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 61913
          mmTop = 1852
          mmWidth = 20108
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'PATRO'
      DataPipeline = pplParcGerSint
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplParcGerSint'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 0
          mmTop = 1058
          mmWidth = 183542
          BandType = 3
          GroupNo = 3
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Parcelas do Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 90223
          mmTop = 1852
          mmWidth = 26194
          BandType = 3
          GroupNo = 3
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'PATRO'
          DataPipeline = pplParcGerSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplParcGerSint'
          mmHeight = 3969
          mmLeft = 6879
          mmTop = 1323
          mmWidth = 79640
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppShape4: TppShape
          UserName = 'Shape4'
          mmHeight = 5027
          mmLeft = 83344
          mmTop = 265
          mmWidth = 42333
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc37: TppDBCalc
          UserName = 'DBCalc37'
          DataField = 'TOTCONTRATO'
          DataPipeline = pplParcGerSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplParcGerSint'
          mmHeight = 3175
          mmLeft = 88900
          mmTop = 1323
          mmWidth = 10054
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc38: TppDBCalc
          UserName = 'DBCalc38'
          DataField = 'TOTALPARCELA'
          DataPipeline = pplParcGerSint
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplParcGerSint'
          mmHeight = 3175
          mmLeft = 100542
          mmTop = 1323
          mmWidth = 20373
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
end
