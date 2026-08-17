inherited DMRelContOpe: TDMRelContOpe
  Left = 364
  Top = 196
  Width = 327
  Height = 211
  Caption = 'DMRelContOpe'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 173
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
    Left = 111
  end
  inherited qryExemplo: TwwQuery
    Left = 42
  end
  inherited rpExemplo: TppReport
    Left = 242
    DataPipelineName = 'pplExemplo'
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 173
    Top = 72
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 111
    Top = 72
  end
  object qry: TwwQuery
    AfterOpen = qryAfterOpen
    AfterScroll = qryAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'Plano/Patrocinadora: '#39'||PP.PLANPRVCONTABPATRO as PLANPRV' +
        'CONTABPATRO,'
      
        '       E.SIGLAEMISSOR || '#39' - '#39' || TO_CHAR(A.DATAOPERACAO, '#39'DD/MM' +
        '/YYYY'#39') AS CONTRATO,'
      
        '       T.DESCTIPOOPERACAO, O.DATAOPERACAO, O.DATALIQUIDACAO, O.O' +
        'BSERVACAO, O.IDOPERCONTACOES,'
      '       O.VLROPERACAO, O.QUANTIDADE,'
      '       NVL((SELECT H1.SLDVLRCONTACOES'
      '            FROM HISTCONTACOES H1'
      '            WHERE H1.IDOPERCONTACOESAP = O.IDOPERCONTACOESAP'
      '              AND H1.DATAHISTCONTACOES ='
      '                     (SELECT MAX(H2.DATAHISTCONTACOES)'
      '                      FROM HISTCONTACOES H2'
      
        '                      WHERE H2.IDOPERCONTACOESAP = O.IDOPERCONTA' +
        'COESAP'
      
        '                        AND H2.DATAHISTCONTACOES < O.DATAOPERACA' +
        'O )),0) AS SLDANT,'
      '       NVL((SELECT H1.SLDPROVPERDA'
      '            FROM HISTCONTACOES H1'
      '            WHERE H1.IDOPERCONTACOESAP = O.IDOPERCONTACOESAP'
      '              AND H1.DATAHISTCONTACOES ='
      '                     (SELECT MAX(H2.DATAHISTCONTACOES)'
      '                      FROM HISTCONTACOES H2'
      
        '                      WHERE H2.IDOPERCONTACOESAP = O.IDOPERCONTA' +
        'COESAP'
      
        '                        AND H2.DATAHISTCONTACOES < O.DATAOPERACA' +
        'O )),0) AS SLDPPANT,'
      
        '       NVL(H.VLRPROVPERDA,0) AS VLRPROVPERDA, NVL(O.VLRLUCPREJ,0' +
        ') AS VLRLUCPREJ,'
      '       E.SIGLAEMISSOR AS GRUPO'
      ''
      ''
      
        'FROM OPERCONTACOES O, EMISSOR E, TIPOOPERACAO T, HISTCONTACOES H' +
        ','
      '     (SELECT O2.DATAOPERACAO, O2.IDOPERCONTACOES'
      '      FROM OPERCONTACOES O2'
      
        '      WHERE ((:IDOPERCONTACOES IS NULL) OR (O2.IDOPERCONTACOES =' +
        ' :IDOPERCONTACOES))'
      
        '        AND ((:IDOPERCONTACOES IS NULL) OR (O2.IDOPERCONTACOESAP' +
        ' = :IDOPERCONTACOES))) A,'
      '        VWPLANPREVCTBPATR PP'
      ''
      
        'WHERE ((:IDOPERCONTACOES IS NULL) OR (O.IDOPERCONTACOESAP = :IDO' +
        'PERCONTACOES))'
      '  AND O.IDEMISSOR = E.IDEMISSOR'
      '  AND O.IDTIPOOPERACAO = T.IDTIPOOPERACAO'
      '  AND O.IDOPERCONTACOESAP = A.IDOPERCONTACOES'
      '  AND O.IDOPERCONTACOES = H.IDOPERCONTACOES(+)'
      '  AND O.DATAOPERACAO = H.DATAHISTCONTACOES(+)'
      '  AND O.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      ''
      'ORDER BY PLANPRVCONTABPATRO,GRUPO, DATAOPERACAO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 34
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end>
    object qryCONTRATO: TStringField
      FieldName = 'CONTRATO'
      Size = 28
    end
    object qryDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryDATALIQUIDACAO: TDateTimeField
      FieldName = 'DATALIQUIDACAO'
    end
    object qryVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object qrySLDANT: TFloatField
      FieldName = 'SLDANT'
    end
    object qrySLDPPANT: TFloatField
      FieldName = 'SLDPPANT'
    end
    object qryVLRPROVPERDA: TFloatField
      FieldName = 'VLRPROVPERDA'
    end
    object qryVLRLUCPREJ: TFloatField
      FieldName = 'VLRLUCPREJ'
    end
    object qryGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 23
    end
    object qryOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 500
    end
    object qryIDOPERCONTACOES: TFloatField
      FieldName = 'IDOPERCONTACOES'
    end
    object qryPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
  end
  object rpt: TppReport
    AutoStop = False
    DataPipeline = ppl
    OnStartPage = rptStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Operações de Contrato de Ações'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 242
    Top = 72
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppl'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26723
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Operações de Contrato de Ações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 55563
        BandType = 0
      end
      object ppLabel2: TppLabel
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
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object lblContrato: TppLabel
        UserName = 'lblContrato'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 14552
        mmWidth = 11906
        BandType = 0
      end
      object ppDBImage1: TppDBImage
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
      object ppShape2: TppShape
        UserName = 'shpGrupoContrato2'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 7408
        mmLeft = 0
        mmTop = 18785
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Data Operação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 794
        mmTop = 18785
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Saldo Liq. Anterior'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7144
        mmLeft = 139171
        mmTop = 18785
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Saldo Prov. Perda Anterior'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7144
        mmLeft = 168275
        mmTop = 18785
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Valor da Operação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 236803
        mmTop = 18785
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Quantidade da Operação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7144
        mmLeft = 200819
        mmTop = 18785
        mmWidth = 23019
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Prov. Perda Baixada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 6879
        mmLeft = 262203
        mmTop = 18785
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Data Liquidação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 22490
        mmTop = 18785
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Tipo de Operação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 44186
        mmTop = 22490
        mmWidth = 23813
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = ppl
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 166952
        mmTop = 14552
        mmWidth = 117475
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object DATAOPERACAO: TppDBText
        UserName = 'dbDATAOPERACAO'
        DataField = 'DATAOPERACAO'
        DataPipeline = ppl
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 794
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object SLDANT: TppDBText
        UserName = 'dbSLDANT'
        DataField = 'SLDANT'
        DataPipeline = ppl
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 135467
        mmTop = 0
        mmWidth = 23283
        BandType = 4
      end
      object SLDPPANT: TppDBText
        UserName = 'dbSLDPPANT'
        DataField = 'SLDPPANT'
        DataPipeline = ppl
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 168805
        mmTop = 0
        mmWidth = 21696
        BandType = 4
      end
      object VLROPERACAO: TppDBText
        UserName = 'dbVLROPERACAO'
        DataField = 'VLROPERACAO'
        DataPipeline = ppl
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 227807
        mmTop = 0
        mmWidth = 26458
        BandType = 4
      end
      object QUANTIDADE: TppDBText
        UserName = 'dbQUANTIDADE'
        DataField = 'QUANTIDADE'
        DataPipeline = ppl
        DisplayFormat = '###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 202407
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object VLRPROVPERDA: TppDBText
        UserName = 'dbVLRPROVPERDA'
        DataField = 'VLRPROVPERDA'
        DataPipeline = ppl
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 260086
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object DATALIQUIDACAO: TppDBText
        UserName = 'dbDATALIQUIDACAO'
        DataField = 'DATAOPERACAO'
        DataPipeline = ppl
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 22490
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object DESCTIPOOPERACAO: TppDBText
        UserName = 'dbDESCTIPOOPERACAO'
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = ppl
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 44186
        mmTop = 0
        mmWidth = 83873
        BandType = 4
      end
      object srptOperacao: TppSubReport
        OnPrint = srptOperacaoPrint
        UserName = 'srptOperacao'
        DrillDownComponent = DATAOPERACAO
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplDetalhe'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 3704
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplDetalhe
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Operações de Contrato de Ações'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 136
          Top = 80
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplDetalhe'
          object cabOperacoes: TppHeaderBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppShape3: TppShape
              UserName = 'Shape1'
              Brush.Color = clSilver
              Pen.Style = psClear
              mmHeight = 4498
              mmLeft = 44450
              mmTop = 0
              mmWidth = 239978
              BandType = 0
            end
            object ppLabel3: TppLabel
              UserName = 'Label1'
              Caption = 'Observação:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 44715
              mmTop = 529
              mmWidth = 20373
              BandType = 0
            end
          end
          object ppDetailBand2: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppDBMemo1: TppDBMemo
              UserName = 'DBMemo1'
              CharWrap = False
              DataField = 'OBSERVACAO'
              DataPipeline = pplDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Stretch = True
              TextAlignment = taFullJustified
              Transparent = True
              DataPipelineName = 'pplDetalhe'
              mmHeight = 3704
              mmLeft = 44715
              mmTop = 265
              mmWidth = 237861
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppLine1: TppLine
              UserName = 'Line3'
              Weight = 0.75
              mmHeight = 3969
              mmLeft = 44450
              mmTop = 1058
              mmWidth = 238125
              BandType = 7
            end
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 284163
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel5: TppLabel
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
        mmWidth = 284163
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
        mmLeft = 258234
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'GRUPO'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object shpGrupoContrato: TppShape
          OnPrint = shpGrupoContratoPrint
          UserName = 'shpGrupoContrato'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 3969
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'CONTRATO'
          DataPipeline = ppl
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 18256
          mmTop = 0
          mmWidth = 124090
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label1'
          Caption = 'Contrato:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 794
          mmTop = 0
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 2117
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'shpDetalhe1'
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 2117
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object QryDetalhe: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      
        'SELECT '#39'Plano/Patrocinadora: '#39'||PP.PLANPRVCONTABPATRO as PLANPRV' +
        'CONTABPATRO,'
      
        '       E.SIGLAEMISSOR || '#39' - '#39' || TO_CHAR(A.DATAOPERACAO, '#39'DD/MM' +
        '/YYYY'#39') AS CONTRATO,'
      
        '       T.DESCTIPOOPERACAO, O.DATAOPERACAO, O.DATALIQUIDACAO, O.O' +
        'BSERVACAO, o.IDOPERCONTACOES,'
      '       O.VLROPERACAO, O.QUANTIDADE,'
      '       NVL((SELECT H1.SLDVLRCONTACOES'
      '            FROM HISTCONTACOES H1'
      '            WHERE H1.IDOPERCONTACOESAP = O.IDOPERCONTACOESAP'
      '              AND H1.DATAHISTCONTACOES ='
      '                     (SELECT MAX(H2.DATAHISTCONTACOES)'
      '                      FROM HISTCONTACOES H2'
      
        '                      WHERE H2.IDOPERCONTACOESAP = O.IDOPERCONTA' +
        'COESAP'
      
        '                        AND H2.DATAHISTCONTACOES < O.DATAOPERACA' +
        'O )),0) AS SLDANT,'
      '       NVL((SELECT H1.SLDPROVPERDA'
      '            FROM HISTCONTACOES H1'
      '            WHERE H1.IDOPERCONTACOESAP = O.IDOPERCONTACOESAP'
      '              AND H1.DATAHISTCONTACOES ='
      '                     (SELECT MAX(H2.DATAHISTCONTACOES)'
      '                      FROM HISTCONTACOES H2'
      
        '                      WHERE H2.IDOPERCONTACOESAP = O.IDOPERCONTA' +
        'COESAP'
      
        '                        AND H2.DATAHISTCONTACOES < O.DATAOPERACA' +
        'O )),0) AS SLDPPANT,'
      
        '       NVL(H.VLRPROVPERDA,0) AS VLRPROVPERDA, NVL(O.VLRLUCPREJ,0' +
        ') AS VLRLUCPREJ,'
      '       E.SIGLAEMISSOR AS GRUPO'
      ''
      ''
      
        'FROM OPERCONTACOES O, EMISSOR E, TIPOOPERACAO T, HISTCONTACOES H' +
        ','
      '     (SELECT O2.DATAOPERACAO, O2.IDOPERCONTACOES'
      '      FROM OPERCONTACOES O2'
      
        '      WHERE ((:IDOPERCONTACOES IS NULL) OR (O2.IDOPERCONTACOES =' +
        ' :IDOPERCONTACOES))'
      
        '        AND ((:IDOPERCONTACOES IS NULL) OR (O2.IDOPERCONTACOESAP' +
        ' = :IDOPERCONTACOES))) A,'
      '      VWPLANPREVCTBPATR PP'
      ''
      
        'WHERE ((:IDOPERCONTACOES IS NULL) OR (O.IDOPERCONTACOESAP = :IDO' +
        'PERCONTACOES))'
      '  AND O.IDEMISSOR = E.IDEMISSOR'
      '  AND O.IDTIPOOPERACAO = T.IDTIPOOPERACAO'
      '  AND O.IDOPERCONTACOESAP = A.IDOPERCONTACOES'
      '  AND O.IDOPERCONTACOES = H.IDOPERCONTACOES(+)'
      '  AND O.DATAOPERACAO = H.DATAHISTCONTACOES(+)'
      '  AND O.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      ''
      'ORDER BY PLANPRVCONTABPATRO,GRUPO, DATAOPERACAO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 34
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end>
    object StringField1: TStringField
      FieldName = 'CONTRATO'
      Size = 28
    end
    object StringField2: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATALIQUIDACAO'
    end
    object FloatField1: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object FloatField2: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object FloatField3: TFloatField
      FieldName = 'SLDANT'
    end
    object FloatField4: TFloatField
      FieldName = 'SLDPPANT'
    end
    object FloatField5: TFloatField
      FieldName = 'VLRPROVPERDA'
    end
    object FloatField6: TFloatField
      FieldName = 'VLRLUCPREJ'
    end
    object StringField3: TStringField
      FieldName = 'GRUPO'
      Size = 23
    end
    object QryDetalheOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 500
    end
    object QryDetalheIDOPERCONTACOES: TFloatField
      FieldName = 'IDOPERCONTACOES'
    end
    object QryDetalhePLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 134
    end
  end
  object DtsDetalhe: TwwDataSource
    AutoEdit = False
    DataSet = QryDetalhe
    Left = 111
    Top = 120
  end
  object pplDetalhe: TppBDEPipeline
    DataSource = DtsDetalhe
    UserName = 'pplDetalhe'
    Left = 173
    Top = 120
  end
end
