inherited dtmRelContratoDuplicidade: TdtmRelContratoDuplicidade
  Left = 330
  Top = 227
  Width = 235
  Height = 157
  Caption = 'dtmRelContratoDuplicidade'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 24
    Top = 56
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
    Left = 24
    Top = 80
  end
  inherited rpExemplo: TppReport
    Left = 24
    Top = 8
    DataPipelineName = 'pplExemplo'
    inherited HeaderBand1: TppHeaderBand
      inherited LblEmpresa: TppLabel [1]
      end
      inherited Line1: TppLine [2]
        mmTop = 16670
      end
    end
  end
  object qryContratoDuplicidade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.IDCONTRATOEMPTMO,'
      '   DEP.MATRICULA,'
      '   DECODE(CON.FLGSITUACAO,'#39'A'#39','#39'Ativo'#39','
      '                          '#39'P'#39','#39'Pendente'#39','
      '                          '#39'E'#39','#39'Encerrado'#39','
      '                          '#39'K'#39','#39'Em quitação'#39','
      '                          '#39'Q'#39','#39'Quitado'#39','
      '                          '#39'C'#39','#39'Cancelado'#39') AS FLGSITUACAO,'
      '   MUT.NOME,'
      '   CON.DATACREDITO,'
      '   DECODE(HME.FLGBAIXADO, NULL, '#39'Sim'#39', '#39'Não'#39') AS PAGO,'
      '   DECODE(HME.FLGENVIO, NULL, '#39'Sim'#39', '#39'Não'#39') AS ENVIADO,'
      '   HME.HMEDATAVENCTO,'
      '   ABS(HME.HMEVLRPREVISTO) AS HMEVLRPREVISTO'
      'FROM '
      '   HISTMOVEMPTMO       HME, '
      '   PESSOA              MUT, '
      '   DEPENTIT            DEP, '
      '   CONTRATOEMPTMO      CON,'
      '   TIPOEMPTMO          TEP,'
      '   TIPOCONTREMPTMO     TCE'
      'WHERE '
      '       CON.FLGSITUACAO          NOT IN ('#39'C'#39', '#39'Q'#39', '#39'E'#39')'
      
        '   AND HME.HMEDATAVENCTO        BETWEEN TO_DATE('#39'01/12/2004'#39', '#39'D' +
        'D/MM/YYYY'#39') AND TO_DATE('#39'31/12/2004'#39', '#39'DD/MM/YYYY'#39')'
      '   AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1) '
      '   AND NVL(HME.FLGESTORNADO, 0) = 0 '
      '   AND NVL(HME.FLGABONADO, 0)   = 0 '
      '   AND NVL(HME.FLGQUITADO, 0)   = 0 '
      '   AND HME.HMETIPOMOV           = 0 '
      '   AND CON.IDCONTRATOEMPTMO     = HME.IDCONTRATOEMPTMO '
      '   AND CON.IDBENEF              = MUT.IDPESSOA '
      '   AND CON.IDBENEF              = DEP.IDPESSOA '
      '   AND CON.IDPESSOA             = DEP.IDTITULAR '
      '   AND TCE.IDTIPOCONTREMPTMO    = CON.IDTIPOCONTREMPTMO'
      '   AND TEP.IDTIPOEMPTMO         = TCE.IDTIPOEMPTMO'
      '   AND '
      '      EXISTS ('
      '              SELECT CEP.IDCONTRATOEMPTMO'
      '              FROM   CONTRATOEMPTMO CEP'
      '              WHERE'
      '                    CEP.IDBENEF            = CON.IDBENEF'
      '                AND CEP.IDPESSOA           = CON.IDPESSOA'
      
        '                AND CEP.IDCONTRATOEMPTMO  <> CON.IDCONTRATOEMPTM' +
        'O'
      
        '                AND (CEP.IDCONTRQUITACAO   IS NULL OR CEP.IDCONT' +
        'RQUITACAO <> CON.IDCONTRATOEMPTMO)'
      
        '                AND CEP.FLGSITUACAO        NOT IN ('#39'C'#39', '#39'Q'#39', '#39'E'#39 +
        ')'
      '             )'
      'ORDER BY'
      '  MUT.NOME'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 128
    Top = 56
    object qryContratoDuplicidadeIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratoDuplicidadeMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryContratoDuplicidadeFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      Size = 11
    end
    object qryContratoDuplicidadeNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryContratoDuplicidadeDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryContratoDuplicidadePAGO: TStringField
      FieldName = 'PAGO'
      Size = 3
    end
    object qryContratoDuplicidadeENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 3
    end
    object qryContratoDuplicidadeHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryContratoDuplicidadeHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
  object pplContratoDuplicidade: TppBDEPipeline
    DataSource = dtsContratoDuplicidade
    CloseDataSource = True
    UserName = 'lContratoDuplicidade'
    Left = 128
    Top = 68
  end
  object dtsContratoDuplicidade: TwwDataSource
    DataSet = qryContratoDuplicidade
    Left = 128
    Top = 80
  end
  object rptContratoDuplicidade: TppReport
    AutoStop = False
    DataPipeline = pplContratoDuplicidade
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'EP - Valores a Creditar'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13229
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 13229
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
    Left = 128
    Top = 16
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplContratoDuplicidade'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 55298
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Contratos em Duplicidade'
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
        mmLeft = 0
        mmTop = 1588
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Período de Datas:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 265
        mmTop = 18521
        mmWidth = 25665
        BandType = 0
      end
      object rptContratoDuplicidade_lblDataIni: TppLabel
        UserName = 'rptContratoDuplicidade_lblDataIni'
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 29104
        mmTop = 18521
        mmWidth = 14023
        BandType = 0
      end
      object rptContratoDuplicidade_lblDataFim: TppLabel
        UserName = 'rptValCred_DataIni1'
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 49477
        mmTop = 18521
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label9'
        Caption = '  a  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 43921
        mmTop = 18521
        mmWidth = 4498
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label8'
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 6615
        mmTop = 50800
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label10'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 34131
        mmTop = 50800
        mmWidth = 7938
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 54769
        mmWidth = 196770
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
        mmTop = 32279
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
        mmLeft = 114300
        mmTop = 32279
        mmWidth = 12700
        BandType = 0
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
        mmTop = 32279
        mmWidth = 76200
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
        mmLeft = 127529
        mmTop = 32279
        mmWidth = 69321
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
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
        mmTop = 27252
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
        mmLeft = 105040
        mmTop = 27252
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
        mmTop = 27252
        mmWidth = 73819
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
        mmLeft = 127529
        mmTop = 27252
        mmWidth = 69321
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppShape1: TppShape
        OnPrint = ppShape1Print
        UserName = 'Shape1'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 196770
        BandType = 4
      end
      object ppLine1: TppLine
        OnPrint = ppLine1Print
        UserName = 'Line1'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 196770
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplContratoDuplicidade
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContratoDuplicidade'
        mmHeight = 3175
        mmLeft = 16404
        mmTop = 529
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'PAGO'
        DataPipeline = pplContratoDuplicidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplContratoDuplicidade'
        mmHeight = 3440
        mmLeft = 188384
        mmTop = 794
        mmWidth = 6879
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'ENVIADO'
        DataPipeline = pplContratoDuplicidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplContratoDuplicidade'
        mmHeight = 3440
        mmLeft = 171186
        mmTop = 794
        mmWidth = 7673
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'FLGSITUACAO'
        DataPipeline = pplContratoDuplicidade
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContratoDuplicidade'
        mmHeight = 3175
        mmLeft = 41010
        mmTop = 794
        mmWidth = 33867
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DATACREDITO'
        DataPipeline = pplContratoDuplicidade
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContratoDuplicidade'
        mmHeight = 3175
        mmLeft = 81492
        mmTop = 1058
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'HMEDATAVENCTO'
        DataPipeline = pplContratoDuplicidade
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContratoDuplicidade'
        mmHeight = 3175
        mmLeft = 117211
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplContratoDuplicidade
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContratoDuplicidade'
        mmHeight = 3175
        mmLeft = 141023
        mmTop = 794
        mmWidth = 21431
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 529
        mmWidth = 196770
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
        mmLeft = 2117
        mmTop = 1852
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
        mmHeight = 3175
        mmLeft = 89429
        mmTop = 1852
        mmWidth = 17463
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
        mmHeight = 3175
        mmLeft = 169334
        mmTop = 1852
        mmWidth = 25400
        BandType = 8
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'MATRICULA'
      DataPipeline = pplContratoDuplicidade
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContratoDuplicidade'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11113
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'MATRICULA'
          DataPipeline = pplContratoDuplicidade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplContratoDuplicidade'
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 2381
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          DataField = 'NOME'
          DataPipeline = pplContratoDuplicidade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplContratoDuplicidade'
          mmHeight = 3969
          mmLeft = 34131
          mmTop = 2381
          mmWidth = 74877
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          Caption = 'Contrato'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 25135
          mmTop = 6879
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Situação'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 41010
          mmTop = 6879
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Data de Crédito'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 81492
          mmTop = 6879
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label2'
          Caption = 'Vencimento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 117211
          mmTop = 6879
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label3'
          Caption = 'Valor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 153988
          mmTop = 6879
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label4'
          Caption = 'Enviado'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 171186
          mmTop = 6879
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label7'
          Caption = 'Pago'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 188384
          mmTop = 6879
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 10583
          mmWidth = 196770
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
