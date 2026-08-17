inherited dtmRelQuitacaoComSaldoDevedor: TdtmRelQuitacaoComSaldoDevedor
  Left = 411
  Top = 251
  Width = 289
  Height = 166
  Caption = 'dtmRelQuitacaoComSaldoDevedor'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 32
    Top = 88
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
    Top = 72
  end
  inherited qryExemplo: TwwQuery
    Left = 32
    Top = 56
  end
  inherited rpExemplo: TppReport
    Left = 32
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object pplQuitacaoComSaldoDevedor: TppBDEPipeline
    DataSource = dsQuitacaoComSaldoDevedor
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 136
    Top = 88
    object pplQuitacaoComSaldoDevedorppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplQuitacaoComSaldoDevedorppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplQuitacaoComSaldoDevedorppField3: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 2
    end
    object pplQuitacaoComSaldoDevedorppField4: TppField
      FieldAlias = 'HMEDATAPREVISTA'
      FieldName = 'HMEDATAPREVISTA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object pplQuitacaoComSaldoDevedorppField5: TppField
      FieldAlias = 'SIT_CONTRATO'
      FieldName = 'SIT_CONTRATO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object pplQuitacaoComSaldoDevedorppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDODEV'
      FieldName = 'SALDODEV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplQuitacaoComSaldoDevedorppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORDEV'
      FieldName = 'VALORDEV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object dsQuitacaoComSaldoDevedor: TwwDataSource
    DataSet = qryQuitacaoComSaldoDevedor
    Left = 136
    Top = 72
  end
  object rptQuitacaoComSaldoDevedor: TppReport
    AutoStop = False
    DataPipeline = pplQuitacaoComSaldoDevedor
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Quitações Não Efetivadas'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 296863
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
    Left = 136
    Top = 8
    Version = '7.04'
    mmColumnWidth = 183622
    DataPipelineName = 'pplQuitacaoComSaldoDevedor'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26723
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Quitações Com Saldo Devedor ou Valores em Aberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 11113
        mmTop = 8731
        mmWidth = 150813
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
        mmLeft = 11113
        mmTop = 794
        mmWidth = 150813
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
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 183622
        BandType = 4
      end
      object ppLine3: TppLine
        OnPrint = ppLine3Print
        UserName = 'Line3'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 183622
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VALORDEV'
        DataPipeline = pplQuitacaoComSaldoDevedor
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplQuitacaoComSaldoDevedor'
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 529
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'SALDODEV'
        DataPipeline = pplQuitacaoComSaldoDevedor
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplQuitacaoComSaldoDevedor'
        mmHeight = 3440
        mmLeft = 143934
        mmTop = 529
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME'
        DataPipeline = pplQuitacaoComSaldoDevedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplQuitacaoComSaldoDevedor'
        mmHeight = 3440
        mmLeft = 65352
        mmTop = 529
        mmWidth = 77523
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplQuitacaoComSaldoDevedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplQuitacaoComSaldoDevedor'
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 529
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'MATRICULA'
        DataPipeline = pplQuitacaoComSaldoDevedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplQuitacaoComSaldoDevedor'
        mmHeight = 3440
        mmLeft = 48154
        mmTop = 529
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'SIT_CONTRATO'
        DataPipeline = pplQuitacaoComSaldoDevedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplQuitacaoComSaldoDevedor'
        mmHeight = 3440
        mmLeft = 28310
        mmTop = 529
        mmWidth = 17992
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 183622
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
        mmLeft = 36777
        mmTop = 3175
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
        mmLeft = 156898
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'HMEDATAPREVISTA'
      DataPipeline = pplQuitacaoComSaldoDevedor
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplQuitacaoComSaldoDevedor'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11642
        mmPrintPosition = 0
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 1058
          mmTop = 6879
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 48154
          mmTop = 6879
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Mutuário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 65352
          mmTop = 6879
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Saldo Dev.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 147373
          mmTop = 6879
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label101'
          Caption = 'Vlr. Aberto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 166423
          mmTop = 6879
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 10848
          mmWidth = 183622
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Situação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 28310
          mmTop = 6879
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label1'
          Caption = 'Data de Quitação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 794
          mmTop = 1058
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'HMEDATAPREVISTA'
          DataPipeline = pplQuitacaoComSaldoDevedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplQuitacaoComSaldoDevedor'
          mmHeight = 3440
          mmLeft = 26194
          mmTop = 1058
          mmWidth = 17992
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
  object qryQuitacaoComSaldoDevedor: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '    HME.IDCONTRATOEMPTMO,'
      '    PES.NOME,'
      '    DEP.MATRICULA,'
      '    HME.HMEDATAPREVISTA,'
      '    DECODE(CON.FLGSITUACAO, '#39'A'#39', '#39'ATIVO'#39','
      '                            '#39'E'#39', '#39'ENCERRADO'#39','
      '                            '#39'J'#39', '#39'EM COBRANÇA JURÍDICA'#39','
      '                            '#39'K'#39', '#39'EM QUITAÇÃO'#39','
      '                            '#39'Q'#39', '#39'QUITADO'#39','
      '                            '#39'R'#39', '#39'RENOVADO'#39','
      '                            '#39'C'#39','#39'CANCELADO'#39') AS SIT_CONTRATO,'
      '    0 AS SALDODEV,'
      '    0 AS VALORDEV'
      'FROM'
      '    HISTMOVEMPTMO HME,'
      '    CONTRATOEMPTMO CON,'
      '    DEPENTIT DEP,'
      '    PESSOA PES'
      'WHERE'
      '    CON.IDCONTRATOEMPTMO    = HME.IDCONTRATOEMPTMO'
      'AND HME.HMEDATAPREVISTA BETWEEN SYSDATE-1 AND SYSDATE'
      'AND HME.HMETIPOMOV          = 3'
      'AND NVL(HME.FLGESTORNADO,0) = 0'
      'AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      'AND CON.IDPATRO            IN (1,91008)'
      'AND CON.IDPLANOPREV        IN (2,19,66,74)'
      'AND DEP.IDTITULAR           = CON.IDPESSOA'
      'AND DEP.IDPESSOA            = CON.IDBENEF'
      'AND PES.IDPESSOA            = CON.IDBENEF'
      'AND 1 = 0'
      'ORDER BY'
      '    HME.HMEDATAPREVISTA, HME.IDCONTRATOEMPTMO')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 136
    Top = 56
    object qryQuitacaoComSaldoDevedorIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryQuitacaoComSaldoDevedorNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryQuitacaoComSaldoDevedorMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryQuitacaoComSaldoDevedorHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryQuitacaoComSaldoDevedorSIT_CONTRATO: TStringField
      FieldName = 'SIT_CONTRATO'
    end
    object qryQuitacaoComSaldoDevedorSALDODEV: TFloatField
      FieldName = 'SALDODEV'
    end
    object qryQuitacaoComSaldoDevedorVALORDEV: TFloatField
      FieldName = 'VALORDEV'
    end
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVEMPTMO'
      'set'
      '  SALDODEV = :SALDODEV,'
      '  VALORDEV = :VALORDEV'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    InsertSQL.Strings = (
      'insert into HISTMOVEMPTMO'
      '  (IDCONTRATOEMPTMO, NOME, MATRICULA, HMEDATAPREVISTA, '
      'SIT_CONTRATO, SALDODEV, '
      '   VALORDEV)'
      'values'
      '  (:IDCONTRATOEMPTMO, :NOME, :MATRICULA, :HMEDATAPREVISTA, '
      ':SIT_CONTRATO, '
      '   :SALDODEV, :VALORDEV)')
    DeleteSQL.Strings = (
      'delete from HISTMOVEMPTMO'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    Left = 240
    Top = 48
  end
end
