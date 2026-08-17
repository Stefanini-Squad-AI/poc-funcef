inherited dtmRelConfereEnvioFolhaAnal: TdtmRelConfereEnvioFolhaAnal
  Left = 56
  Top = 482
  Width = 241
  Height = 176
  Caption = 'dtmRelConfereEnvioFolhaAnal'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 32
    Top = 56
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
    Top = 68
  end
  inherited qryExemplo: TwwQuery
    Left = 32
    Top = 80
  end
  inherited rpExemplo: TppReport
    Left = 32
    Top = 8
  end
  object pplConfereEnvioFolhaAnal: TppBDEPipeline
    DataSource = dsConfereEnvioFolhaAnal
    OpenDataSource = False
    UserName = 'lExemplo1'
    Left = 136
    Top = 56
    object pplConfereEnvioFolhaAnalppField1: TppField
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplConfereEnvioFolhaAnalppField2: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplConfereEnvioFolhaAnalppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplConfereEnvioFolhaAnalppField4: TppField
      FieldAlias = 'IDRUBRICA'
      FieldName = 'IDRUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplConfereEnvioFolhaAnalppField5: TppField
      FieldAlias = 'ITEDESCRICAO'
      FieldName = 'ITEDESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplConfereEnvioFolhaAnalppField6: TppField
      FieldAlias = 'HMEVLRPREVISTO'
      FieldName = 'HMEVLRPREVISTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplConfereEnvioFolhaAnalppField7: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
  end
  object dsConfereEnvioFolhaAnal: TwwDataSource
    DataSet = qryConfereEnvioFolhaAnal
    Left = 136
    Top = 68
  end
  object qryConfereEnvioFolhaAnal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDCONTRATOEMPTMO,'
      '   CON.MATRICULA,'
      '   CON.NOME,'
      '   HME.IDRUBRICA,'
      '   HME.ITEDESCRICAO,'
      '   SUM(HME.HMEVLRPREVISTO) AS HMEVLRPREVISTO,'
      '   SUM(TMP.VALOR) AS VALOR'
      'FROM'
      '   VW_MOVEP HME,'
      '   TMPDESC  TMP,'
      '   VWCONTRATOEP CON'
      'WHERE'
      '    TMP.IDDESCONTO = HME.IDCONTRATOEMPTMO'
      'AND TMP.IDPROVENTO = HME.IDRUBRICA'
      'AND TMP.MESREFERENCIA = '#39'2002/02'#39
      'AND TMP.MESCOBRANCA = '#39'2002/02'#39
      'AND HME.HMEANOCOBRANCA = 2002'
      'AND HME.HMEMESCOBRANCA = 2'
      'AND HME.FLGENVIO IS NULL'
      'AND ((HME.HMECENTRALIZA = 1) OR (HME.HMEDESTACADO = 1))'
      'AND CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO'
      'GROUP BY'
      '   HME.IDCONTRATOEMPTMO,'
      '   HME.IDRUBRICA,'
      '   CON.MATRICULA,'
      '   CON.NOME,'
      '   HME.ITEDESCRICAO'
      '')
    ValidateWithMask = True
    Left = 136
    Top = 80
    object qryConfereEnvioFolhaAnalIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.VW_MOVEP.IDCONTRATOEMPTMO'
    end
    object qryConfereEnvioFolhaAnalMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS.VWCONTRATOEP.MATRICULA'
      Size = 13
    end
    object qryConfereEnvioFolhaAnalNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.VWCONTRATOEP.NOME'
      Size = 60
    end
    object qryConfereEnvioFolhaAnalIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
      Origin = 'BASEDADOS.VW_MOVEP.IDRUBRICA'
    end
    object qryConfereEnvioFolhaAnalITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Origin = 'BASEDADOS.VW_MOVEP.ITEDESCRICAO'
      Size = 40
    end
    object qryConfereEnvioFolhaAnalHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      Origin = 'BASEDADOS.VW_MOVEP.HMEVLRPREVISTO'
    end
    object qryConfereEnvioFolhaAnalVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'BASEDADOS.TMPDESC.VALOR'
    end
  end
  object rptConfereEnvioFolhaAnal: TppReport
    AutoStop = False
    DataPipeline = pplConfereEnvioFolhaAnal
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
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
    Left = 136
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23548
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Conferência de Envio para Folha (analítico por Contrato)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8731
        mmWidth = 183621
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
        mmLeft = 0
        mmTop = 794
        mmWidth = 183621
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
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLine1: TppLine
        OnPrint = ppLine1Print
        UserName = 'Line1'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 5292
        mmLeft = 0
        mmTop = 0
        mmWidth = 183542
        BandType = 4
      end
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 5292
        mmLeft = 0
        mmTop = 0
        mmWidth = 183542
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplConfereEnvioFolhaAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 144992
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'ITEDESCRICAO'
        DataPipeline = pplConfereEnvioFolhaAnal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 6615
        mmTop = 794
        mmWidth = 89959
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VALOR'
        DataPipeline = pplConfereEnvioFolhaAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 165100
        mmTop = 1058
        mmWidth = 16140
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
        mmTop = 265
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
        mmTop = 1588
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
        mmTop = 1058
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
        mmLeft = 157427
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 26988
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 7144
        mmLeft = 72231
        mmTop = 6615
        mmWidth = 111390
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
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplConfereEnvioFolhaAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 144992
        mmTop = 8467
        mmWidth = 14023
        BandType = 7
      end
      object ppDBCalc31: TppDBCalc
        UserName = 'DBCalc31'
        DataField = 'VALOR'
        DataPipeline = pplConfereEnvioFolhaAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 165100
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
        mmLeft = 52917
        mmTop = 8731
        mmWidth = 17992
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDCONTRATOEMPTMO'
      DataPipeline = pplConfereEnvioFolhaAnal
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 12171
          mmLeft = 0
          mmTop = 0
          mmWidth = 183542
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 11377
          mmWidth = 183542
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Vlr. EP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 146844
          mmTop = 5821
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Valor Folha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 162719
          mmTop = 5821
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'NOME'
          DataPipeline = pplConfereEnvioFolhaAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 34131
          mmTop = 5821
          mmWidth = 77258
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplConfereEnvioFolhaAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 2381
          mmTop = 5821
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'MATRICULA'
          DataPipeline = pplConfereEnvioFolhaAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 17992
          mmTop = 5821
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 2381
          mmTop = 794
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 17992
          mmTop = 794
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 34131
          mmTop = 794
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object rptContratosAdminAnalShape1: TppShape
          UserName = 'rptContratosAdminAnalShape1'
          mmHeight = 5556
          mmLeft = 72231
          mmTop = 1852
          mmWidth = 111390
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'HMEVLRPREVISTO'
          DataPipeline = pplConfereEnvioFolhaAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 144992
          mmTop = 3175
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc25: TppDBCalc
          UserName = 'DBCalc25'
          DataField = 'VALOR'
          DataPipeline = pplConfereEnvioFolhaAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 165100
          mmTop = 2910
          mmWidth = 16140
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
          mmTop = 529
          mmWidth = 183542
          BandType = 5
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Total do Contrato:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 44186
          mmTop = 3175
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
