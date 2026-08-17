inherited dtmRelCadCaf: TdtmRelCadCaf
  Left = 330
  Top = 50
  Width = 426
  Height = 570
  Color = clHighlightText
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 352
    Top = 104
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
    Left = 352
    Top = 56
  end
  inherited qryExemplo: TwwQuery
    Left = 352
    Top = 8
  end
  inherited rpExemplo: TppReport
    Left = 354
    Top = 152
    inherited HeaderBand1: TppHeaderBand
      inherited Line1: TppLine [0]
      end
      inherited LblEmpresa: TppLabel [1]
      end
      inherited Label11: TppLabel [2]
        mmHeight = 5292
        mmLeft = 79640
        mmTop = 8996
        mmWidth = 37835
      end
    end
  end
  object qryBem: TwwQuery
    BeforeOpen = qryBemBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT B.PLACA, B.DESBEM, B.DATAULTDEP, B.DATAINICIODEP, B.IDNOT' +
        'A, B.COMPLNOTA,'
      
        '       B.NUMSERIE, B.REGISTRO, B.CONTROLE, B.TAXADEP, CC.NOME AS' +
        ' DESCCCUSTO,'
      
        '       L.NOME AS DESCLOCAL, PR.NOME AS NOMERESP, G.NOME AS DESCG' +
        'RUPO,'
      
        '       C.DESCCONJUNTO, B.DTAINCLUSAO, NVL(B.VALHISTORICO,0) AS V' +
        'ALHISTORICO,'
      
        '       PF.NOME AS NOMEFORN, B.IDOPCIONAL, CB.DESCRICAO AS DESCCL' +
        'ASSE,'
      '       S.DESCSITUACAO, BAIXA.DATABAIXA,'
      
        '       (SB.VALORG + SB.REAVVALORG + SB.ULTREAVVALORG)    AS VALO' +
        'RG0,'
      
        '       (SB.CMBEM + SB.REAVCMBEM + SB.ULTREAVCMBEM)       AS CMBE' +
        'M0,'
      
        '       (SB.DEPLANC + SB.REAVDEPLANC + SB.ULTREAVDEPLANC) AS DEPL' +
        'ANC0,'
      
        '       (SB.CMDEP + SB.REAVCMDEP + SB.ULTREAVCMDEP)       AS CMDE' +
        'P0,'
      '       (SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP +'
      '        SB.REAVVALORG + SB.REAVCMBEM -'
      '        SB.REAVDEPLANC - SB.REAVCMDEP +'
      '        SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '        SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)             AS VALC' +
        'TB0'
      ''
      'FROM BEM         B, GRUPO       G,'
      '     CLASSEDEBEM CB,'
      '     CONJUNTO    C,'
      '     LOCALIZACAO L,'
      '     CENTCUST    CC,'
      '     PESSOA      PR,'
      '     PESSOA      PF,'
      '     SITUACAO    S,'
      ''
      
        '     (SELECT HM.IDPESSOA, HM.IDBEM, HM.DATAMOVIMENTACAO AS DATAB' +
        'AIXA'
      '      FROM   HISTORICOMOVIMENTACAO HM'
      '      WHERE  (HM.IDTIPOMOVIMENTACAO = 06)'
      '        AND  (HM.DATAMOVIMENTACAO <= :PDATASLD)) BAIXA,'
      ''
      '     (SELECT SCB.IDBEM, SCB.DATASLDBEM,'
      '             SCB.VALORG,  SCB.REAVVALORG,  SCB.ULTREAVVALORG,'
      '             SCB.CMBEM,   SCB.REAVCMBEM,   SCB.ULTREAVCMBEM,'
      '             SCB.DEPLANC, SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,'
      '             SCB.CMDEP,   SCB.REAVCMDEP,   SCB.ULTREAVCMDEP'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :PDATASLD)'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE (SCB.DATASLDBEM = DTAMAX.DATA)'
      '        AND (SCB.IDBEM = DTAMAX.IDBEM) ) SB'
      ''
      'WHERE (B.DATAINICIODEP <= :PDATASLD)'
      '  AND (G.FLGIMOVEL = 0)'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '  AND (B.IDPESSOA       = :PIDPESSOA)'
      '  AND (B.IDCONJUNTO     = C.IDCONJUNTO(+))'
      '  AND (B.IDGRUPO        = G.IDGRUPO(+))'
      '  AND (C.IDLOCALIZACAO  = L.IDLOCALIZACAO(+))'
      '  AND (C.IDRESPONSAVEL  = PR.IDPESSOA(+))'
      '  AND (B.IDFORNSERV     = PF.IDPESSOA(+))'
      '  AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '  AND (L.IDEMPRESA      = CC.IDEMPRESA(+))'
      '  AND (B.IDCLASSEBEM    = CB.IDCLASSEBEM(+))'
      '  AND (B.IDSITUACAO     = S.IDSITUACAO(+))'
      '  AND (B.IDBEM          = SB.IDBEM(+))'
      '  AND (B.IDBEM          = BAIXA.IDBEM(+))'
      'ORDER BY B.PLACA'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 24
    Top = 8
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryBemPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryBemDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object qryBemDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
    end
    object qryBemIDNOTA: TStringField
      FieldName = 'IDNOTA'
      FixedChar = True
      Size = 18
    end
    object qryBemCOMPLNOTA: TStringField
      FieldName = 'COMPLNOTA'
      FixedChar = True
      Size = 5
    end
    object qryBemNUMSERIE: TStringField
      FieldName = 'NUMSERIE'
      FixedChar = True
    end
    object qryBemREGISTRO: TStringField
      FieldName = 'REGISTRO'
      FixedChar = True
      Size = 1
    end
    object qryBemCONTROLE: TStringField
      FieldName = 'CONTROLE'
      FixedChar = True
      Size = 1
    end
    object qryBemTAXADEP: TFloatField
      FieldName = 'TAXADEP'
    end
    object qryBemDESCCCUSTO: TStringField
      FieldName = 'DESCCCUSTO'
      Size = 30
    end
    object qryBemDESCLOCAL: TStringField
      FieldName = 'DESCLOCAL'
      Size = 60
    end
    object qryBemNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Size = 60
    end
    object qryBemDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryBemDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object qryBemDTAINCLUSAO: TDateTimeField
      FieldName = 'DTAINCLUSAO'
    end
    object qryBemVALHISTORICO: TFloatField
      FieldName = 'VALHISTORICO'
    end
    object qryBemNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      Size = 60
    end
    object qryBemIDOPCIONAL: TStringField
      FieldName = 'IDOPCIONAL'
      Size = 30
    end
    object qryBemDESCCLASSE: TStringField
      FieldName = 'DESCCLASSE'
      Size = 60
    end
    object qryBemDESCSITUACAO: TStringField
      FieldName = 'DESCSITUACAO'
      Size = 45
    end
    object qryBemVALORG0: TFloatField
      FieldName = 'VALORG0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemCMBEM0: TFloatField
      FieldName = 'CMBEM0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemDEPLANC0: TFloatField
      FieldName = 'DEPLANC0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemCMDEP0: TFloatField
      FieldName = 'CMDEP0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemVALCTB0: TFloatField
      FieldName = 'VALCTB0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemDATABAIXA: TDateTimeField
      FieldName = 'DATABAIXA'
    end
  end
  object dsBem: TwwDataSource
    DataSet = qryBem
    Left = 104
    Top = 8
  end
  object ppBem: TppBDEPipeline
    DataSource = dsBem
    UserName = 'Bem'
    Left = 184
    Top = 8
    object ppBemppField1: TppField
      FieldAlias = 'PLACA'
      FieldName = 'PLACA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBemppField2: TppField
      FieldAlias = 'DESBEM'
      FieldName = 'DESBEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBemppField3: TppField
      FieldAlias = 'DATAULTDEP'
      FieldName = 'DATAULTDEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBemppField4: TppField
      FieldAlias = 'DATAINICIODEP'
      FieldName = 'DATAINICIODEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBemppField5: TppField
      FieldAlias = 'IDNOTA'
      FieldName = 'IDNOTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBemppField6: TppField
      FieldAlias = 'COMPLNOTA'
      FieldName = 'COMPLNOTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBemppField7: TppField
      FieldAlias = 'NUMSERIE'
      FieldName = 'NUMSERIE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBemppField8: TppField
      FieldAlias = 'REGISTRO'
      FieldName = 'REGISTRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBemppField9: TppField
      FieldAlias = 'CONTROLE'
      FieldName = 'CONTROLE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBemppField10: TppField
      FieldAlias = 'TAXADEP'
      FieldName = 'TAXADEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppBemppField11: TppField
      FieldAlias = 'DESCCCUSTO'
      FieldName = 'DESCCCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppBemppField12: TppField
      FieldAlias = 'DESCLOCAL'
      FieldName = 'DESCLOCAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppBemppField13: TppField
      FieldAlias = 'NOMERESP'
      FieldName = 'NOMERESP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppBemppField14: TppField
      FieldAlias = 'DESCGRUPO'
      FieldName = 'DESCGRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppBemppField15: TppField
      FieldAlias = 'DESCCONJUNTO'
      FieldName = 'DESCCONJUNTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppBemppField16: TppField
      FieldAlias = 'DTAINCLUSAO'
      FieldName = 'DTAINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppBemppField17: TppField
      FieldAlias = 'VALHISTORICO'
      FieldName = 'VALHISTORICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppBemppField18: TppField
      FieldAlias = 'NOMEFORN'
      FieldName = 'NOMEFORN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppBemppField19: TppField
      FieldAlias = 'IDOPCIONAL'
      FieldName = 'IDOPCIONAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppBemppField20: TppField
      FieldAlias = 'DESCCLASSE'
      FieldName = 'DESCCLASSE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppBemppField21: TppField
      FieldAlias = 'DESCSITUACAO'
      FieldName = 'DESCSITUACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppBemppField22: TppField
      FieldAlias = 'VALORG0'
      FieldName = 'VALORG0'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppBemppField23: TppField
      FieldAlias = 'CMBEM0'
      FieldName = 'CMBEM0'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppBemppField24: TppField
      FieldAlias = 'DEPLANC0'
      FieldName = 'DEPLANC0'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppBemppField25: TppField
      FieldAlias = 'CMDEP0'
      FieldName = 'CMDEP0'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppBemppField26: TppField
      FieldAlias = 'VALCTB0'
      FieldName = 'VALCTB0'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppBemppField27: TppField
      FieldAlias = 'DATABAIXA'
      FieldName = 'DATABAIXA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
  end
  object rpBem: TppReport
    AutoStop = False
    DataPipeline = ppBem
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 264
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 19579
      mmPrintPosition = 0
      object rpBemCabec: TppLabel
        UserName = 'rpBemCabec'
        Caption = 'Cadastro Patrimonial de Bens em '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 107686
        mmTop = 9790
        mmWidth = 68792
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel2'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127265
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object rpBemLine3: TppLine
        UserName = 'rpBemLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 18256
        mmWidth = 284427
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object rpBemLabel1: TppLabel
        UserName = 'rpBemLabel1'
        Caption = 'Placa '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 4498
        mmWidth = 8202
        BandType = 4
      end
      object rpBemLabel2: TppLabel
        UserName = 'rpBemLabel2'
        Caption = 'Conjunto '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 121444
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
      object rpBemDBText2: TppDBText
        UserName = 'rpBemDBText2'
        DataField = 'DESCCONJUNTO'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 136261
        mmTop = 529
        mmWidth = 147902
        BandType = 4
      end
      object rpBemLabel3: TppLabel
        UserName = 'rpBemLabel3'
        Caption = 'Descrição '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 35719
        mmTop = 4498
        mmWidth = 15081
        BandType = 4
      end
      object rpBemDBText3: TppDBText
        UserName = 'rpBemDBText3'
        DataField = 'DESBEM'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 51858
        mmTop = 4498
        mmWidth = 232569
        BandType = 4
      end
      object rpBemLabel4: TppLabel
        UserName = 'rpBemLabel4'
        Caption = 'Localização '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 8467
        mmWidth = 17463
        BandType = 4
      end
      object rpBemDBText4: TppDBText
        UserName = 'rpBemDBText4'
        DataField = 'DESCLOCAL'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 18256
        mmTop = 8467
        mmWidth = 65881
        BandType = 4
      end
      object rpBemLabel5: TppLabel
        UserName = 'rpBemLabel5'
        Caption = 'Responsável '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 85196
        mmTop = 8467
        mmWidth = 19579
        BandType = 4
      end
      object rpBemDBText5: TppDBText
        UserName = 'rpBemDBText5'
        DataField = 'NOMERESP'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 8467
        mmWidth = 69586
        BandType = 4
      end
      object rpBemLabel6: TppLabel
        UserName = 'rpBemLabel6'
        Caption = 'Grupo '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 0
        mmLeft = 0
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object rpBemDBText6: TppDBText
        UserName = 'rpBemDBText6'
        DataField = 'DESCGRUPO'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10848
        mmTop = 529
        mmWidth = 103188
        BandType = 4
      end
      object rpBemLabel7: TppLabel
        UserName = 'rpBemLabel7'
        Caption = 'Grupo '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 529
        mmWidth = 9790
        BandType = 4
      end
      object rpBemLabel8: TppLabel
        UserName = 'rpBemLabel8'
        Caption = 'Fornecedor '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 176213
        mmTop = 8467
        mmWidth = 17727
        BandType = 4
      end
      object rpBemDBText7: TppDBText
        UserName = 'rpBemDBText7'
        DataField = 'NOMEFORN'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 194734
        mmTop = 8467
        mmWidth = 89429
        BandType = 4
      end
      object rpBemLabel9: TppLabel
        UserName = 'rpBemLabel9'
        Caption = 'Entrada em '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 141552
        mmTop = 12435
        mmWidth = 17198
        BandType = 4
      end
      object rpBemDBText8: TppDBText
        UserName = 'rpBemDBText8'
        DataField = 'DTAINCLUSAO'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 159279
        mmTop = 12435
        mmWidth = 15875
        BandType = 4
      end
      object rpBemLabel10: TppLabel
        UserName = 'rpBemLabel10'
        Caption = 'Documento '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 176213
        mmTop = 12435
        mmWidth = 17463
        BandType = 4
      end
      object rpBemDBText9: TppDBText
        UserName = 'rpBemDBText9'
        DataField = 'IDNOTA'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 194734
        mmTop = 12435
        mmWidth = 25135
        BandType = 4
      end
      object rpBemDBText10: TppDBText
        UserName = 'rpBemDBText10'
        DataField = 'COMPLNOTA'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 220398
        mmTop = 12435
        mmWidth = 17198
        BandType = 4
      end
      object rpBemDBText11: TppDBText
        UserName = 'rpBemDBText11'
        DataField = 'VALHISTORICO'
        DataPipeline = ppBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 259557
        mmTop = 12435
        mmWidth = 24606
        BandType = 4
      end
      object rpBemLabel11: TppLabel
        UserName = 'rpBemLabel11'
        Caption = 'Valor Histórico '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 237861
        mmTop = 12435
        mmWidth = 22225
        BandType = 4
      end
      object rpBemLabel12: TppLabel
        UserName = 'rpBemLabel12'
        Caption = 'Nº Série'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 85196
        mmTop = 16404
        mmWidth = 11377
        BandType = 4
      end
      object rpBemDBText12: TppDBText
        UserName = 'rpBemDBText12'
        DataField = 'NUMSERIE'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 16404
        mmWidth = 24342
        BandType = 4
      end
      object rpBemLabel13: TppLabel
        UserName = 'rpBemLabel13'
        Caption = 'Classe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 12435
        mmWidth = 10054
        BandType = 4
      end
      object rpBemDBText13: TppDBText
        UserName = 'rpBemDBText13'
        DataField = 'DESCCLASSE'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 18256
        mmTop = 12435
        mmWidth = 65881
        BandType = 4
      end
      object rpBemLabel14: TppLabel
        UserName = 'rpBemLabel14'
        Caption = 'Valor Patrimonial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 21960
        mmWidth = 24871
        BandType = 4
      end
      object rpBemLabel15: TppLabel
        UserName = 'rpBemLabel15'
        Caption = 'Corr. Monetária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 52123
        mmTop = 21960
        mmWidth = 22754
        BandType = 4
      end
      object rpBemLabel16: TppLabel
        UserName = 'rpBemLabel16'
        Caption = 'Depreciação Acum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 111125
        mmTop = 21960
        mmWidth = 27781
        BandType = 4
      end
      object rpBemLabel17: TppLabel
        UserName = 'rpBemLabel17'
        Caption = 'Corr.Monet.Depreciação '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 21960
        mmWidth = 35983
        BandType = 4
      end
      object rpBemLabel18: TppLabel
        UserName = 'rpBemLabel18'
        Caption = 'Valor Contábil '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 237332
        mmTop = 21960
        mmWidth = 21167
        BandType = 4
      end
      object rpBemDBText14: TppDBText
        UserName = 'rpBemDBText14'
        DataField = 'VALORG0'
        DataPipeline = ppBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 25665
        mmTop = 21960
        mmWidth = 24871
        BandType = 4
      end
      object rpBemDBText15: TppDBText
        UserName = 'rpBemDBText15'
        DataField = 'CMBEM0'
        DataPipeline = ppBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 75406
        mmTop = 21960
        mmWidth = 24871
        BandType = 4
      end
      object rpBemDBText16: TppDBText
        UserName = 'rpBemDBText16'
        DataField = 'DEPLANC0'
        DataPipeline = ppBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 139700
        mmTop = 21960
        mmWidth = 24871
        BandType = 4
      end
      object rpBemDBText17: TppDBText
        UserName = 'rpBemDBText17'
        DataField = 'CMDEP0'
        DataPipeline = ppBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 203200
        mmTop = 21960
        mmWidth = 24871
        BandType = 4
      end
      object rpBemDBText18: TppDBText
        UserName = 'rpBemDBText18'
        DataField = 'VALCTB0'
        DataPipeline = ppBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 259028
        mmTop = 21960
        mmWidth = 24871
        BandType = 4
      end
      object rpBemLabel19: TppLabel
        UserName = 'rpBemLabel19'
        Caption = 'Taxa de Depreciação '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 176213
        mmTop = 16404
        mmWidth = 30427
        BandType = 4
      end
      object rpBemDBText19: TppDBText
        UserName = 'rpBemDBText19'
        DataField = 'TAXADEP'
        DataPipeline = ppBem
        DisplayFormat = '#,0.000000;(#,0.000000)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 207698
        mmTop = 16404
        mmWidth = 15346
        BandType = 4
      end
      object rpBemLabel20: TppLabel
        UserName = 'rpBemLabel20'
        Caption = '% a.a.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 223309
        mmTop = 16404
        mmWidth = 7938
        BandType = 4
      end
      object rpBemLabel21: TppLabel
        UserName = 'rpBemLabel21'
        Caption = 'Situação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 85196
        mmTop = 12435
        mmWidth = 12171
        BandType = 4
      end
      object rpBemDBText20: TppDBText
        UserName = 'rpBemDBText20'
        DataField = 'DESCSITUACAO'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 12435
        mmWidth = 32544
        BandType = 4
      end
      object rpBemLabel22: TppLabel
        UserName = 'rpBemLabel22'
        Caption = 'Controle'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 16404
        mmWidth = 12700
        BandType = 4
      end
      object rpBemLabel23: TppLabel
        OnPrint = rpBemLabel23Print
        UserName = 'rpBemLabel23'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 18256
        mmTop = 16404
        mmWidth = 6085
        BandType = 4
      end
      object rpBemLine2: TppLine
        UserName = 'rpBemLine2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26458
        mmWidth = 284427
        BandType = 4
      end
      object rpBemLine1: TppLine
        UserName = 'rpBemLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 20902
        mmWidth = 284427
        BandType = 4
      end
      object rpBemCalc1: TppVariable
        OnPrint = rpBemCalc1Print
        UserName = 'rpBemCalc1'
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 10848
        mmTop = 4498
        mmWidth = 15081
        BandType = 4
      end
      object rpBemDataBaixa: TppVariable
        OnPrint = rpBemDataBaixaPrint
        UserName = 'rpBemDataBaixa'
        AutoSize = False
        CalcOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 45773
        mmTop = 16404
        mmWidth = 38365
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 1
        mmHeight = 1058
        mmLeft = 0
        mmTop = 529
        mmWidth = 284427
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel3'
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
        mmWidth = 33867
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 114829
        mmTop = 1323
        mmWidth = 54504
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 258498
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object qryCadGrupo: TwwQuery
    BeforeOpen = qryCadGrupoBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT G.CLASSE, G.NOME, G.TIPO, G.DEPRECIACAO, G.FLGIMOVEL, G.I' +
        'DGRUPO,'
      '       CC.CODCENTROCUSTO, CC.NOME AS DESCCC'
      'FROM GRUPO G,'
      '     GRUPOBEMXCC GXCC,'
      '     CENTCUST CC'
      'WHERE (G.IDGRUPO           = GXCC.IDGRUPO(+))'
      '  AND (GXCC.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '  AND (GXCC.IDEMPRESA      = CC.IDEMPRESA(+))'
      'ORDER BY CLASSE')
    ValidateWithMask = True
    Left = 24
    Top = 56
    object qryCadGrupoCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
    object qryCadGrupoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryCadGrupoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'GRUPO.TIPO'
      Size = 1
    end
    object qryCadGrupoDEPRECIACAO: TFloatField
      FieldName = 'DEPRECIACAO'
      Origin = 'GRUPO.DEPRECIACAO'
    end
    object qryCadGrupoFLGIMOVEL: TFloatField
      FieldName = 'FLGIMOVEL'
      Origin = 'GRUPO.FLGIMOVEL'
    end
    object qryCadGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
    object qryCadGrupoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Size = 10
    end
    object qryCadGrupoDESCCC: TStringField
      FieldName = 'DESCCC'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
  end
  object dsCadGrupo: TwwDataSource
    DataSet = qryCadGrupo
    Left = 104
    Top = 56
  end
  object ppCadGrupo: TppBDEPipeline
    DataSource = dsCadGrupo
    UserName = 'CadGrupo'
    Left = 184
    Top = 56
  end
  object rpCadGrupo: TppReport
    AutoStop = False
    DataPipeline = ppCadGrupo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 264
    Top = 56
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand13: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Cadastro de Grupos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 78052
        mmTop = 8996
        mmWidth = 41010
        BandType = 0
      end
      object ppLabel89: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel89'
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
      object rpCadGrupoLabel1: TppLabel
        UserName = 'rpCadGrupoLabel1'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 17198
        mmWidth = 11906
        BandType = 0
      end
      object rpCadGrupoLabel2: TppLabel
        UserName = 'rpCadGrupoLabel2'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 26723
        mmTop = 17198
        mmWidth = 16404
        BandType = 0
      end
      object rpCadGrupoLabel3: TppLabel
        UserName = 'rpCadGrupoLabel3'
        Caption = 'Sintético / Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 169863
        mmTop = 17198
        mmWidth = 27517
        BandType = 0
      end
      object rpCadGrupoLine1: TppLine
        UserName = 'rpCadGrupoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 16404
        mmWidth = 197379
        BandType = 0
      end
      object rpCadGrupoLabel4: TppLabel
        UserName = 'rpCadGrupoLabel4'
        Caption = 'Centros de Custo Associados'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 22754
        mmWidth = 50006
        BandType = 0
      end
      object rpCadGrupoLine2: TppLine
        UserName = 'rpCadGrupoLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 26988
        mmWidth = 197379
        BandType = 0
      end
    end
    object ppDetailBand13: TppDetailBand
      BeforePrint = ppDetailBand13BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object rpCadGrupoDBText1: TppDBText
        UserName = 'rpCadGrupoDBText1'
        DataField = 'DESCCC'
        DataPipeline = ppCadGrupo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 26723
        mmTop = 0
        mmWidth = 167482
        BandType = 4
      end
      object rpCadGrupoCODCENTROCUSTO: TppVariable
        OnPrint = rpCadGrupoCODCENTROCUSTOPrint
        UserName = 'rpCadGrupoCODCENTROCUSTO1'
        CalcOrder = 0
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 42333
        BandType = 4
      end
    end
    object ppFooterBand13: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLine21: TppLine
        UserName = 'ppLine21'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 265
        mmWidth = 197379
        BandType = 8
      end
      object ppLabel90: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel90'
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
        mmWidth = 55563
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
        mmLeft = 71438
        mmTop = 1323
        mmWidth = 54504
        BandType = 8
      end
      object ppCalc26: TppSystemVariable
        UserName = 'Calc26'
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
    object rpCadGrupoGroup1: TppGroup
      BreakName = 'CLASSE'
      DataPipeline = ppCadGrupo
      UserName = 'rpCadGrupoGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpCadGrupoGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object rpCadGrupoDBText2: TppDBText
          UserName = 'rpCadGrupoDBText2'
          DataField = 'NOME'
          DataPipeline = ppCadGrupo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 26723
          mmTop = 0
          mmWidth = 143140
          BandType = 3
          GroupNo = 0
        end
        object rpCadGrupoDBText3: TppDBText
          UserName = 'rpCadGrupoDBText3'
          DataField = 'TIPO'
          DataPipeline = ppCadGrupo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 177007
          mmTop = 0
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpCadGrupoLine3: TppLine
          UserName = 'rpCadGrupoLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 4498
          mmWidth = 197379
          BandType = 3
          GroupNo = 0
        end
        object rpCadGrupoCODGRUPO: TppVariable
          OnPrint = rpCadGrupoCODGRUPOPrint
          UserName = 'rpCadGrupoCODGRUPO1'
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
          mmWidth = 42333
          BandType = 3
          GroupNo = 0
        end
      end
      object rpCadGrupoGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 265
        mmPrintPosition = 0
        object rpCadGrupoLine4: TppLine
          UserName = 'rpCadGrupoLine4'
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
  object rpCadClasse: TppReport
    AutoStop = False
    DataPipeline = ppCadClasse
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 264
    Top = 104
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
        OnPrint = LblEmpresaPrint
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
      BeforePrint = ppDetailBand6BeforePrint
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
        OnPrint = rpCadClasseCODGRUPOPrint
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
        mmWidth = 33867
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
        OnPrint = LblSistemaPrint
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
          OnPrint = rpCadClasseCODCLASSEPrint
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
          mmWidth = 43921
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
  object ppCadClasse: TppBDEPipeline
    DataSource = dsCadClasse
    UserName = 'CadClasse'
    Left = 184
    Top = 104
  end
  object dsCadClasse: TwwDataSource
    DataSet = qryCadClasse
    Left = 104
    Top = 104
  end
  object qryCadClasse: TwwQuery
    BeforeOpen = qryCadClasseBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CB.CODHIERARQ AS CLASSE,'
      '       CB.DESCRICAO  AS NOME,'
      '       CB.ANASINT    AS TIPO,'
      '       G.CLASSE      AS CODGRUPO,'
      '       G.NOME        AS DESCGRUPO'
      'FROM CLASSEDEBEM CB,'
      '     CLASSEXGRUPO CXB,'
      '     GRUPO G'
      'WHERE (CB.IDCLASSEBEM = CXB.IDCLASSEBEM(+))'
      '  AND (CXB.IDGRUPO    = G.IDGRUPO(+))'
      'ORDER BY CODHIERARQ')
    ValidateWithMask = True
    Left = 24
    Top = 104
    object qryCadClasseCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = '"CM.CLASSEDEBEM".CODHIERARQ'
      Size = 15
    end
    object qryCadClasseNOME: TStringField
      FieldName = 'NOME'
      Origin = '"CM.CLASSEDEBEM".DESCRICAO'
      Size = 60
    end
    object qryCadClasseTIPO: TStringField
      FieldName = 'TIPO'
      Origin = '"CM.CLASSEDEBEM".ANASINT'
      Size = 1
    end
    object qryCadClasseCODGRUPO: TStringField
      FieldName = 'CODGRUPO'
      Size = 15
    end
    object qryCadClasseDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
  end
  object qryCadLocal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT L.NOME AS DESCLOCAL,'
      '       L.CODCENTROCUSTO,'
      '       L.ENDERECO,       '
      '       CC.NOME AS DESCCCUSTO,'
      '       PR.NOME AS NOMERESP,'
      '       TA.DESCTIPOAREA'
      'FROM   LOCALIZACAO L,'
      '       CENTCUST    CC,'
      '       PESSOA      PR,'
      '       TIPOAREA    TA'
      'WHERE (L.IDRESPONSAVEL  = PR.IDPESSOA(+))'
      '  AND (L.IDEMPRESA      = CC.IDEMPRESA(+))'
      '  AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '  AND (L.IDTIPOAREA     = TA.IDTIPOAREA(+))'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 24
    Top = 152
    object qryCadLocalDESCLOCAL: TStringField
      FieldName = 'DESCLOCAL'
      Size = 60
    end
    object qryCadLocalCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryCadLocalENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 120
    end
    object qryCadLocalDESCCCUSTO: TStringField
      FieldName = 'DESCCCUSTO'
      Size = 30
    end
    object qryCadLocalNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Size = 60
    end
    object qryCadLocalDESCTIPOAREA: TStringField
      FieldName = 'DESCTIPOAREA'
      Size = 30
    end
  end
  object dsCadLocal: TwwDataSource
    DataSet = qryCadLocal
    Left = 104
    Top = 152
  end
  object ppCadLocal: TppBDEPipeline
    DataSource = dsCadLocal
    UserName = 'CadLocal'
    Left = 184
    Top = 152
  end
  object rpCadLocal: TppReport
    AutoStop = False
    DataPipeline = ppCadLocal
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 264
    Top = 152
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand14: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29369
      mmPrintPosition = 0
      object ppLabel91: TppLabel
        UserName = 'ppLabel91'
        Caption = 'Cadastro de Localizações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 115888
        mmTop = 8731
        mmWidth = 52388
        BandType = 0
      end
      object ppLine24: TppLine
        UserName = 'ppLine24'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19050
        mmWidth = 284427
        BandType = 0
      end
      object ppLabel92: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel92'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127265
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object rpCadLocalLabel1: TppLabel
        UserName = 'rpCadLocalLabel1'
        Caption = 'Localização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 19844
        mmWidth = 16669
        BandType = 0
      end
      object rpCadLocalLabel2: TppLabel
        UserName = 'rpCadLocalLabel2'
        Caption = 'Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 82286
        mmTop = 19844
        mmWidth = 18785
        BandType = 0
      end
      object rpCadLocalLabel3: TppLabel
        UserName = 'rpCadLocalLabel3'
        Caption = 'Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 185209
        mmTop = 19844
        mmWidth = 24077
        BandType = 0
      end
      object rpCadLocalLabel5: TppLabel
        UserName = 'rpCadLocalLabel5'
        Caption = 'Tipo de Área'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 51594
        mmTop = 19844
        mmWidth = 18521
        BandType = 0
      end
      object ppLine25: TppLine
        UserName = 'ppLine25'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 28310
        mmWidth = 284427
        BandType = 0
      end
      object rpCadLocalLabel6: TppLabel
        UserName = 'rpCadLocalLabel6'
        Caption = 'Endereço'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 24077
        mmWidth = 13758
        BandType = 0
      end
    end
    object ppDetailBand14: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object rpCadLocalDBText1: TppDBText
        UserName = 'rpCadLocalDBText1'
        DataField = 'DESCLOCAL'
        DataPipeline = ppCadLocal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 529
        mmWidth = 50271
        BandType = 4
      end
      object rpCadLocalDBText2: TppDBText
        UserName = 'rpCadLocalDBText2'
        DataField = 'NOMERESP'
        DataPipeline = ppCadLocal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 82021
        mmTop = 529
        mmWidth = 102129
        BandType = 4
      end
      object rpCadLocalDBText3: TppDBText
        UserName = 'rpCadLocalDBText3'
        DataField = 'CODCENTROCUSTO'
        DataPipeline = ppCadLocal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 185209
        mmTop = 529
        mmWidth = 24077
        BandType = 4
      end
      object rpCadLocalDBText4: TppDBText
        UserName = 'rpCadLocalDBText4'
        DataField = 'DESCCCUSTO'
        DataPipeline = ppCadLocal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 210344
        mmTop = 529
        mmWidth = 73819
        BandType = 4
      end
      object rpCadLocalDBText5: TppDBText
        UserName = 'rpCadLocalDBText5'
        DataField = 'DESCTIPOAREA'
        DataPipeline = ppCadLocal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 51594
        mmTop = 529
        mmWidth = 29633
        BandType = 4
      end
      object rpCadLocalDBText6: TppDBText
        UserName = 'rpCadLocalDBText6'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppCadLocal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 5027
        mmWidth = 15610
        BandType = 4
      end
      object rpCadLocalLine1: TppLine
        UserName = 'rpCadLocalLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 9525
        mmWidth = 284427
        BandType = 4
      end
    end
    object ppFooterBand14: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine26: TppLine
        UserName = 'ppLine26'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284427
        BandType = 8
      end
      object ppLabel96: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel96'
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
        mmWidth = 35983
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
        mmLeft = 114829
        mmTop = 1323
        mmWidth = 54504
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
        mmLeft = 258234
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object rpCadTipArea: TppReport
    AutoStop = False
    DataPipeline = ppCadTipArea
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
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
    Left = 264
    Top = 200
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand15: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel97: TppLabel
        UserName = 'ppLabel97'
        Caption = 'Cadastro de Tipos de Áreas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 71438
        mmTop = 8996
        mmWidth = 56356
        BandType = 0
      end
      object ppLine27: TppLine
        UserName = 'ppLine27'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19050
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel98: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel98'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel100: TppLabel
        UserName = 'ppLabel100'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 19844
        mmWidth = 14288
        BandType = 0
      end
      object ppLine28: TppLine
        UserName = 'ppLine28'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24077
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand15: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppDBText58: TppDBText
        UserName = 'ppDBText58'
        DataField = 'DESCTIPOAREA'
        DataPipeline = ppCadTipArea
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 5027
        mmTop = 794
        mmWidth = 191559
        BandType = 4
      end
    end
    object ppFooterBand15: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine29: TppLine
        UserName = 'ppLine29'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel102: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel102'
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
        mmWidth = 35983
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
        mmLeft = 71438
        mmTop = 1323
        mmWidth = 54504
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
        mmLeft = 171450
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object ppCadTipArea: TppBDEPipeline
    DataSource = dsCadTipArea
    UserName = 'CadTipArea'
    Left = 184
    Top = 200
  end
  object dsCadTipArea: TwwDataSource
    DataSet = qryCadTipArea
    Left = 104
    Top = 200
  end
  object qryCadTipArea: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCTIPOAREA'
      'FROM TIPOAREA'
      'ORDER BY DESCTIPOAREA')
    ValidateWithMask = True
    Left = 24
    Top = 200
    object qryCadTipAreaDESCTIPOAREA: TStringField
      FieldName = 'DESCTIPOAREA'
      Origin = 'TIPOAREA.DESCTIPOAREA'
      Size = 30
    end
  end
  object qryCadTipMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOMOVIMENTACAO, DESCTIPOMOVIMENTACAO'
      'FROM TIPOMOVIMENTACAO'
      'ORDER BY DESCTIPOMOVIMENTACAO')
    ValidateWithMask = True
    Left = 24
    Top = 248
    object qryCadTipMovIDTIPOMOVIMENTACAO: TFloatField
      FieldName = 'IDTIPOMOVIMENTACAO'
    end
    object qryCadTipMovDESCTIPOMOVIMENTACAO: TStringField
      FieldName = 'DESCTIPOMOVIMENTACAO'
      Size = 40
    end
  end
  object dsCadTipMov: TwwDataSource
    DataSet = qryCadTipMov
    Left = 104
    Top = 248
  end
  object ppCadTipMov: TppBDEPipeline
    DataSource = dsCadTipMov
    UserName = 'CadTipMov'
    Left = 184
    Top = 248
  end
  object rpCadTipMov: TppReport
    AutoStop = False
    DataPipeline = ppCadTipMov
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
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
    Left = 264
    Top = 248
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel20: TppLabel
        UserName = 'ppLabel20'
        Caption = 'Cadastro de Tipos de Movimentações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 60325
        mmTop = 8731
        mmWidth = 76465
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'ppLine7'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19050
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel21: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel21'
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
      object ppLabel22: TppLabel
        UserName = 'ppLabel22'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5292
        mmTop = 19844
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'ppLabel23'
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
      object ppLine8: TppLine
        UserName = 'ppLine8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24077
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText13: TppDBText
        UserName = 'ppDBText13'
        DataField = 'IDTIPOMOVIMENTACAO'
        DataPipeline = ppCadTipMov
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 6879
        mmTop = 0
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'ppDBText14'
        DataField = 'DESCTIPOMOVIMENTACAO'
        DataPipeline = ppCadTipMov
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 27517
        mmTop = 0
        mmWidth = 141288
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine9: TppLine
        UserName = 'ppLine9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel25: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel25'
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
        mmWidth = 35983
        BandType = 8
      end
      object ppCalc7: TppSystemVariable
        UserName = 'Calc7'
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
      object ppCalc8: TppSystemVariable
        UserName = 'Calc8'
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
  end
  object qryCadConj: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT C.IDCONJUNTO,C.DESCCONJUNTO,L.NOME AS NOMELOCAL,P.NOME AS' +
        ' NOMERESP,'
      
        '       RD.CODCENTROCUSTO,CC.NOME AS DESCCENTROCUSTO,RD.PARTICIPA' +
        'CAO'
      'FROM RATEIODEPRECIACAO RD,'
      '     CONJUNTO C,'
      '     LOCALIZACAO L,'
      '     PESSOA P,'
      '     CENTCUST CC'
      'WHERE (C.IDPESSOA        = :PIDPESSOA)'
      ''
      ''
      '  AND (RD.IDCONJUNTO     = C.IDCONJUNTO)'
      '  AND (RD.CODCENTROCUSTO = CC.CODCENTROCUSTO)'
      '  AND (RD.IDEMPRESA      = CC.IDEMPRESA)'
      '  AND (C.IDLOCALIZACAO   = L.IDLOCALIZACAO)'
      '  AND (C.IDRESPONSAVEL   = P.IDPESSOA)'
      'ORDER BY C.IDCONJUNTO'
      '   ')
    ValidateWithMask = True
    Left = 24
    Top = 296
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCadConjIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Origin = 'CONJUNTO.IDCONJUNTO'
    end
    object qryCadConjDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Origin = 'CONJUNTO.DESCCONJUNTO'
      Size = 200
    end
    object qryCadConjNOMELOCAL: TStringField
      FieldName = 'NOMELOCAL'
      Origin = 'LOCALIZACAO.NOME'
      Size = 60
    end
    object qryCadConjNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryCadConjCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'RATEIODEPRECIACAO.CODCENTROCUSTO'
      Size = 10
    end
    object qryCadConjDESCCENTROCUSTO: TStringField
      FieldName = 'DESCCENTROCUSTO'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object qryCadConjPARTICIPACAO: TFloatField
      FieldName = 'PARTICIPACAO'
      Origin = 'RATEIODEPRECIACAO.PARTICIPACAO'
    end
  end
  object dsCadConj: TwwDataSource
    DataSet = qryCadConj
    Left = 104
    Top = 296
  end
  object ppCadConj: TppBDEPipeline
    DataSource = dsCadConj
    UserName = 'CadConj'
    Left = 184
    Top = 296
  end
  object rpCadConj: TppReport
    AutoStop = False
    DataPipeline = ppCadConj
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 12000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 264
    Top = 296
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17992
      mmPrintPosition = 0
      object ppLabel26: TppLabel
        UserName = 'ppLabel26'
        Caption = 'Cadastro de Conjuntos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 75142
        mmTop = 8731
        mmWidth = 46831
        BandType = 0
      end
      object ppLabel27: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel27'
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
      object rpCadConjLine2: TppLine
        UserName = 'rpCadConjLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197379
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object rpCadConjDBText3: TppDBText
        UserName = 'rpCadConjDBText3'
        DataField = 'CODCENTROCUSTO'
        DataPipeline = ppCadConj
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 21167
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object rpCadConjDBText4: TppDBText
        UserName = 'rpCadConjDBText4'
        AutoSize = True
        DataField = 'DESCCENTROCUSTO'
        DataPipeline = ppCadConj
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42598
        mmTop = 529
        mmWidth = 29633
        BandType = 4
      end
      object rpCadConjDBText5: TppDBText
        UserName = 'rpCadConjDBText5'
        DataField = 'PARTICIPACAO'
        DataPipeline = ppCadConj
        DisplayFormat = '0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 176742
        mmTop = 265
        mmWidth = 12700
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine12: TppLine
        UserName = 'ppLine12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197379
        BandType = 8
      end
      object ppLabel31: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel31'
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
        mmWidth = 35983
        BandType = 8
      end
      object ppCalc9: TppSystemVariable
        UserName = 'Calc9'
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
      object ppCalc10: TppSystemVariable
        UserName = 'ppCalc101'
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
    object rpCadConjGroup1: TppGroup
      BreakName = 'IDCONJUNTO'
      DataPipeline = ppCadConj
      UserName = 'rpCadConjGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpCadConjGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 16669
        mmPrintPosition = 0
        object rpCadConjLabel1: TppLabel
          UserName = 'rpCadConjLabel1'
          Caption = 'Conjunto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 265
          mmTop = 529
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object rpCadConjLabel2: TppLabel
          UserName = 'rpCadConjLabel2'
          Caption = 'Localização'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 265
          mmTop = 3969
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object rpCadConjLabel3: TppLabel
          UserName = 'rpCadConjLabel3'
          Caption = 'Responsável'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 265
          mmTop = 7408
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object ppDBText17: TppDBText
          UserName = 'ppDBText17'
          DataField = 'DESCCONJUNTO'
          DataPipeline = ppCadConj
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 21167
          mmTop = 529
          mmWidth = 174361
          BandType = 3
          GroupNo = 0
        end
        object rpCadConjDBText1: TppDBText
          UserName = 'rpCadConjDBText1'
          DataField = 'NOMELOCAL'
          DataPipeline = ppCadConj
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 21167
          mmTop = 3969
          mmWidth = 174361
          BandType = 3
          GroupNo = 0
        end
        object rpCadConjDBText2: TppDBText
          UserName = 'rpCadConjDBText2'
          DataField = 'NOMERESP'
          DataPipeline = ppCadConj
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 21167
          mmTop = 7408
          mmWidth = 156104
          BandType = 3
          GroupNo = 0
        end
        object rpCadConjLine1: TppLine
          UserName = 'rpCadConjLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 11642
          mmWidth = 197379
          BandType = 3
          GroupNo = 0
        end
        object rpCadConjLabel4: TppLabel
          UserName = 'rpCadConjLabel4'
          Caption = 'Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 21167
          mmTop = 12435
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object rpCadConjLabel6: TppLabel
          UserName = 'rpCadConjLabel6'
          Caption = 'Participação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 173832
          mmTop = 12435
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object rpCadConjDBText6: TppDBText
          UserName = 'rpCadConjDBText6'
          DataField = 'IDCONJUNTO'
          DataPipeline = ppCadConj
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 178330
          mmTop = 7408
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
      end
      object rpCadConjGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 1852
        mmPrintPosition = 0
        object ppLine11: TppLine
          UserName = 'ppLine11'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 794
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryConjxBens: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT C.IDCONJUNTO,C.DESCCONJUNTO,L.NOME AS NOMELOCAL,P.NOME AS' +
        ' NOMERESP,'
      '       B.PLACA,B.DESBEM'
      'FROM BEM B,'
      '     CONJUNTO C,'
      '     LOCALIZACAO L,'
      '     PESSOA P'
      'WHERE (C.IDPESSOA        = :PIDPESSOA)'
      ''
      ''
      '  AND (B.IDCONJUNTO      = C.IDCONJUNTO)'
      '  AND (C.IDLOCALIZACAO   = L.IDLOCALIZACAO)'
      '  AND (C.IDRESPONSAVEL   = P.IDPESSOA)'
      'ORDER BY C.IDCONJUNTO'
      '   ')
    ValidateWithMask = True
    Left = 24
    Top = 344
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryConjxBensIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Origin = '"CM.CONJUNTO".IDCONJUNTO'
    end
    object qryConjxBensDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Origin = '"CM.CONJUNTO".DESCCONJUNTO'
      Size = 200
    end
    object qryConjxBensNOMELOCAL: TStringField
      FieldName = 'NOMELOCAL'
      Origin = '"CM.LOCALIZACAO".NOME'
      Size = 60
    end
    object qryConjxBensNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
    object qryConjxBensPLACA: TFloatField
      FieldName = 'PLACA'
      Origin = 'BEM.PLACA'
    end
    object qryConjxBensDESBEM: TStringField
      FieldName = 'DESBEM'
      Origin = 'BEM.DESBEM'
      Size = 200
    end
  end
  object dsConjxBens: TwwDataSource
    DataSet = qryConjxBens
    Left = 104
    Top = 344
  end
  object ppConjxBens: TppBDEPipeline
    DataSource = dsConjxBens
    UserName = 'ConjxBens'
    Left = 184
    Top = 344
  end
  object rpConjxBens: TppReport
    AutoStop = False
    DataPipeline = ppConjxBens
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 12000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 264
    Top = 344
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand18: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17992
      mmPrintPosition = 0
      object ppLabel28: TppLabel
        UserName = 'ppLabel28'
        Caption = 'Cadastro de Conjuntos - Bens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 68263
        mmTop = 8996
        mmWidth = 60854
        BandType = 0
      end
      object ppLabel29: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel29'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'ppLine10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197379
        BandType = 0
      end
    end
    object ppDetailBand18: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'ppDBText2'
        AutoSize = True
        DataField = 'PLACA'
        DataPipeline = ppConjxBens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 21167
        mmTop = 529
        mmWidth = 9260
        BandType = 4
      end
      object rpConjxBensDBText1: TppDBText
        UserName = 'rpConjxBensDBText1'
        AutoSize = True
        DataField = 'DESBEM'
        DataPipeline = ppConjxBens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 46831
        mmTop = 529
        mmWidth = 11906
        BandType = 4
      end
    end
    object ppFooterBand18: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine37: TppLine
        UserName = 'ppLine37'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197379
        BandType = 8
      end
      object ppLabel30: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel30'
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
        mmWidth = 35983
        BandType = 8
      end
      object ppCalc35: TppSystemVariable
        UserName = 'Calc35'
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
      object ppCalc36: TppSystemVariable
        UserName = 'Calc36'
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
    object ppGroup1: TppGroup
      BreakName = 'IDCONJUNTO'
      DataPipeline = ppConjxBens
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 16404
        mmPrintPosition = 0
        object ppLabel43: TppLabel
          UserName = 'ppLabel43'
          Caption = 'Conjunto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 265
          mmTop = 265
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object ppLabel44: TppLabel
          UserName = 'ppLabel44'
          Caption = 'Localização'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 265
          mmTop = 3969
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppLabel45: TppLabel
          UserName = 'ppLabel45'
          Caption = 'Responsável'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 265
          mmTop = 7673
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object ppDBText18: TppDBText
          UserName = 'ppDBText18'
          DataField = 'DESCCONJUNTO'
          DataPipeline = ppConjxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 21167
          mmTop = 265
          mmWidth = 174361
          BandType = 3
          GroupNo = 0
        end
        object ppDBText22: TppDBText
          UserName = 'ppDBText22'
          DataField = 'NOMELOCAL'
          DataPipeline = ppConjxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 21167
          mmTop = 3969
          mmWidth = 174361
          BandType = 3
          GroupNo = 0
        end
        object ppDBText23: TppDBText
          UserName = 'ppDBText23'
          DataField = 'NOMERESP'
          DataPipeline = ppConjxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 21167
          mmTop = 7673
          mmWidth = 155840
          BandType = 3
          GroupNo = 0
        end
        object ppLine38: TppLine
          UserName = 'ppLine38'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 11906
          mmWidth = 197379
          BandType = 3
          GroupNo = 0
        end
        object ppLabel46: TppLabel
          UserName = 'ppLabel46'
          Caption = 'Placa '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 20902
          mmTop = 12700
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLabel47: TppLabel
          UserName = 'ppLabel47'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 46831
          mmTop = 12700
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object rpConjxBensDBText2: TppDBText
          UserName = 'rpConjxBensDBText2'
          DataField = 'IDCONJUNTO'
          DataPipeline = ppConjxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 178330
          mmTop = 7673
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 1852
        mmPrintPosition = 0
        object ppLine39: TppLine
          UserName = 'ppLine39'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 794
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryCentCust: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 24
    Top = 392
  end
  object dscentcust: TwwDataSource
    DataSet = qryCentCust
    Left = 104
    Top = 392
  end
  object ppCentCust: TppBDEPipeline
    DataSource = dscentcust
    UserName = 'CentCust'
    Left = 184
    Top = 392
  end
  object rpcentcust: TppReport
    AutoStop = False
    DataPipeline = ppCentCust
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
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
    Left = 264
    Top = 392
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object ppLabel8: TppLabel
        UserName = 'ppLabel8'
        Caption = 'Relatório de Bens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 80433
        mmTop = 8731
        mmWidth = 36248
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'ppLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel12: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel12'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'ppLabel13'
        Caption = 'Placa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 182034
        mmTop = 16933
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'ppLabel14'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 63500
        mmTop = 16933
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'ppLabel15'
        Caption = 'Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 110067
        mmTop = 16933
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'ppLabel16'
        Caption = 'Localização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 150284
        mmTop = 16933
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'ppLabel17'
        Caption = 'Cent.Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 16933
        mmWidth = 16404
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'ppDBText1'
        DataField = 'DESBEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 63500
        mmTop = 0
        mmWidth = 43127
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'ppDBText8'
        DataField = 'PLACA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 182034
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'ppDBText9'
        DataField = 'LOCNOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 150284
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'ppDBText10'
        DataField = 'CENTNOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 14817
        mmTop = 0
        mmWidth = 43921
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'ppDBText11'
        DataField = 'PESSNOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 110067
        mmTop = 0
        mmWidth = 38894
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'ppDBText12'
        DataField = 'CODCENTROCUSTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'ppLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel18: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel18'
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
        mmTop = 3704
        mmWidth = 197909
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
        mmLeft = 3175
        mmTop = 3704
        mmWidth = 197380
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
        mmLeft = 172244
        mmTop = 3440
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object qryParamCAFxContab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT TMG.IDGRUPO,G.NOME AS DESCGRUPO,G.CLASSE,TMG.IDTIPOMOVIME' +
        'NTACAO,'
      
        '       TM.DESCTIPOMOVIMENTACAO,CTMG.PLANO,CTMG.PLACONTA,PC.PLANO' +
        'ME,'
      '       CTMG.TIPOLANCAMENTO AS DEBCRED,'
      '       CTMG.CODCENTROCUSTO, CC.NOME AS NOMECCUSTO'
      'FROM   TIPOSMOVIMENTOGRUPOS TMG,'
      '       CONTASTIPOSMOVIMENTOGRUPOS CTMG,'
      '       TIPOMOVIMENTACAO TM,'
      '       GRUPO G,'
      '       PLANOCONTA PC,'
      '       CENTCUST CC'
      'WHERE (TMG.IDPESSOA           = :IDPESSOA)'
      ''
      '  AND (TMG.IDPESSOA           = CTMG.IDPESSOA(+))'
      '  AND (TMG.IDGRUPO            = CTMG.IDGRUPO(+))'
      '  AND (TMG.IDTIPOMOVIMENTACAO = CTMG.IDTIPOMOVIMENTACAO(+))'
      '  AND (TMG.IDGRUPO            = G.IDGRUPO)'
      '  AND (TMG.IDTIPOMOVIMENTACAO = TM.IDTIPOMOVIMENTACAO)'
      '  AND (CTMG.PLANO             = PC.PLANO)'
      '  AND (CTMG.PLACONTA          = PC.PLACONTA)'
      '  AND (CTMG.CODCENTROCUSTO    = CC.CODCENTROCUSTO(+))'
      '  AND (CTMG.IDEMPRESA         = CC.IDEMPRESA(+))'
      
        'ORDER BY G.CLASSE,TMG.IDTIPOMOVIMENTACAO,CTMG.TIPOLANCAMENTO DES' +
        'C,CTMG.CODCENTROCUSTO'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 65
    Top = 480
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamCAFxContabIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryParamCAFxContabDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryParamCAFxContabCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 15
    end
    object qryParamCAFxContabIDTIPOMOVIMENTACAO: TFloatField
      FieldName = 'IDTIPOMOVIMENTACAO'
    end
    object qryParamCAFxContabDESCTIPOMOVIMENTACAO: TStringField
      FieldName = 'DESCTIPOMOVIMENTACAO'
      Size = 40
    end
    object qryParamCAFxContabPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryParamCAFxContabPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Size = 18
    end
    object qryParamCAFxContabPLANOME: TStringField
      FieldName = 'PLANOME'
      Size = 40
    end
    object qryParamCAFxContabDEBCRED: TStringField
      FieldName = 'DEBCRED'
      Size = 1
    end
    object qryParamCAFxContabCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryParamCAFxContabNOMECCUSTO: TStringField
      FieldName = 'NOMECCUSTO'
      Size = 30
    end
  end
  object dsParamCAFxContab: TwwDataSource
    DataSet = qryParamCAFxContab
    Left = 64
    Top = 467
  end
  object ppParamCAFxContab: TppBDEPipeline
    DataSource = dsParamCAFxContab
    UserName = 'ParamCAFxContab'
    Left = 64
    Top = 453
  end
  object rpParamCAFxContab: TppReport
    AutoStop = False
    DataPipeline = ppParamCAFxContab
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
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
    Left = 64
    Top = 440
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21167
      mmPrintPosition = 0
      object ppLabel85: TppLabel
        UserName = 'ppLabel85'
        Caption = 'Parâmetros da Integração Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 65352
        mmTop = 8731
        mmWidth = 70379
        BandType = 0
      end
      object ppLabel87: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel87'
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
      object rpCtaMovGrpPlanoConta: TppLabel
        UserName = 'rpCtaMovGrpPlanoConta'
        Caption = 'Plano de Contas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 84667
        mmTop = 15081
        mmWidth = 28046
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object rpCtaMovGrpDBText4: TppDBText
        UserName = 'rpCtaMovGrpDBText4'
        DataField = 'PLACONTA'
        DataPipeline = ppParamCAFxContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 794
        mmWidth = 42069
        BandType = 4
      end
      object rpCtaMovGrpDBText5: TppDBText
        UserName = 'rpCtaMovGrpDBText5'
        DataField = 'PLANOME'
        DataPipeline = ppParamCAFxContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 794
        mmWidth = 111125
        BandType = 4
      end
      object rpCtaMovGrpDBText6: TppDBText
        UserName = 'rpCtaMovGrpDBText6'
        DataField = 'DEBCRED'
        DataPipeline = ppParamCAFxContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 155840
        mmTop = 794
        mmWidth = 9525
        BandType = 4
      end
      object rpCtaMovGrpDBText7: TppDBText
        UserName = 'rpCtaMovGrpDBText7'
        DataField = 'CODCENTROCUSTO'
        DataPipeline = ppParamCAFxContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 169334
        mmTop = 794
        mmWidth = 28310
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppLine23: TppLine
        UserName = 'ppLine23'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel88: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel88'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 2381
        mmWidth = 35719
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
        mmLeft = 75142
        mmTop = 2646
        mmWidth = 46831
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
        mmLeft = 171450
        mmTop = 2646
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpCtaMovGrpGroup2: TppGroup
      BreakName = 'IDGRUPO'
      DataPipeline = ppParamCAFxContab
      UserName = 'rpCtaMovGrpGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpCtaMovGrpGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object rpCtaMovGrpLabel1: TppLabel
          UserName = 'rpCtaMovGrpLabel1'
          Caption = 'Grupo '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 0
          mmTop = 1588
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object rpCtaMovGrpDBText2: TppDBText
          UserName = 'rpCtaMovGrpDBText2'
          DataField = 'CLASSE'
          DataPipeline = ppParamCAFxContab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 15081
          mmTop = 1588
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object rpCtaMovGrpDBText1: TppDBText
          UserName = 'rpCtaMovGrpDBText1'
          DataField = 'DESCGRUPO'
          DataPipeline = ppParamCAFxContab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 44186
          mmTop = 1588
          mmWidth = 153194
          BandType = 3
          GroupNo = 0
        end
        object rpCtaMovGrpLine2: TppLine
          UserName = 'rpCtaMovGrpLine2'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2
          mmHeight = 1323
          mmLeft = 0
          mmTop = 7144
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object rpCtaMovGrpLine1: TppLine
          UserName = 'rpCtaMovGrpLine1'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2
          mmHeight = 1323
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object rpCtaMovGrpGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpCtaMovGrpGroup1: TppGroup
      BreakName = 'IDTIPOMOVIMENTACAO'
      DataPipeline = ppParamCAFxContab
      UserName = 'rpCtaMovGrpGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpCtaMovGrpGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object rpCtaMovGrpLabel2: TppLabel
          UserName = 'rpCtaMovGrpLabel2'
          AutoSize = False
          Caption = 'Movimento '
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1058
          mmWidth = 20638
          BandType = 3
          GroupNo = 1
        end
        object rpCtaMovGrpDBText3: TppDBText
          UserName = 'rpCtaMovGrpDBText3'
          Color = clSilver
          DataField = 'DESCTIPOMOVIMENTACAO'
          DataPipeline = ppParamCAFxContab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          mmHeight = 4233
          mmLeft = 20638
          mmTop = 1058
          mmWidth = 176742
          BandType = 3
          GroupNo = 1
        end
        object rpCtaMovGrpLabel3: TppLabel
          UserName = 'rpCtaMovGrpLabel3'
          Caption = 'Conta Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 6879
          mmWidth = 24871
          BandType = 3
          GroupNo = 1
        end
        object rpCtaMovGrpLabel5: TppLabel
          UserName = 'rpCtaMovGrpLabel5'
          Caption = 'D/C'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 157692
          mmTop = 6879
          mmWidth = 6085
          BandType = 3
          GroupNo = 1
        end
        object rpCtaMovGrpLabel4: TppLabel
          UserName = 'rpCtaMovGrpLabel4'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 43392
          mmTop = 6879
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 169598
          mmTop = 6615
          mmWidth = 27781
          BandType = 3
          GroupNo = 1
        end
      end
      object rpCtaMovGrpGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
