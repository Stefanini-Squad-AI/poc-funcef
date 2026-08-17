object dtmRelatorioEtiqAltCTPS: TdtmRelatorioEtiqAltCTPS
  Left = 109
  Top = 270
  Width = 543
  Height = 104
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object dsgnEtiquetasAltCTPS: TppDesigner
    Caption = 'Alteração do Layout de Etiquetas de Atualização de CTPS'
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000033333300003333330000000000000003BBBBBB3003BBBBBB30000
      00000000003BBBBBB3003BBBBBB30000000000000003BBBB3003BBBBBB300000
      000000000003BBBB3003BBBBB3000000000000000003BBBB3003BBBB30000000
      000000000003BBBBB33BBBBB30000000000000000003BBBBBBBBBBB300000000
      000000000003BBBBBBBBBBB300000000000000700003BBBB333BBBBB30000000
      000000800003BBBB3003BBBBB30000000000F8F00003BBBB3003BBBBB3000000
      008F8F800003BBBB3003BBBBB3000070F8F877F80003BBBB333BBBBBB300007F
      8F00F08F003BBBBBBBBBBBBB3000007800FFF048003BBBBBBBBBBBB300000000
      FFFFF08F8003333333333330000070FFFFCCF804F07000000000000000007FFF
      CCFFFF0F8F0000000000000000007FCCFFFCCF074807000000000000000078FF
      FCCFFFF08F80700000000000000007FCCFFFCCF044F8070000000000000007FF
      FFCCFFFF0F8F8000000000000000078FCCFFFCCF07F77000000000000000007F
      FFFCCFFFF07000000000000000000078FCCFFFCCFF0700000000000000000007
      FFFFCCFFFF80000000000000000000078FCCFFFF877000000000000000000000
      7FFFFF8770000000000000000000000007FF8770000000000000000000000000
      007770000000000000000000000000000000000000000000000000000000FFFE
      0781FFFC0300FFFC0300FFFE0601FFFE0603FFFE0607FFFE0007FFFE000FFFFE
      000FFFDE0007FF0E0603FC0E0603F00E0603C0060003C0040007C004000FC002
      001F0001FFFF0001FFFF0000FFFF00007FFF80003FFF80003FFF80007FFFC001
      FFFFC000FFFFE000FFFFE001FFFFF007FFFFF81FFFFFFC7FFFFFFFFFFFFF}
    Position = poScreenCenter
    ShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage, scShape, scLine, scBarCode, scTeeChart, scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage, scDBBarCode, scDBTeeChart, scRegion]
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.SQLType = sqBDELocal
    Report = rpEtiquetasAltCTPS
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 460
    Top = 13
  end
  object rpEtiquetasAltCTPS: TppReport
    AutoStop = False
    Columns = 3
    ColumnPositions.Strings = (
      '6350'
      '101116'
      '195882')
    DataPipeline = ppEtiquetasAltCTPS
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Emissão de Etiquetas'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 4350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.Format = ftASCII
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 352
    Top = 13
    Version = '5.5'
    mmColumnWidth = 94766
    object rpEtiquetasColHdrBnd1: TppColumnHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpEtiquetasDtlBnd1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object EtiquetasAltCTPSDBTxt1: TppDBText
        UserName = 'EtiquetasAltCTPSDBTxt1'
        DataField = 'DATA'
        DataPipeline = ppEtiquetasAltCTPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 26723
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object EtiquetasAltCTPSDBTxt3: TppDBText
        UserName = 'EtiquetasAltCTPSDBTxt3'
        DataField = 'NOVAFUNCAO'
        DataPipeline = ppEtiquetasAltCTPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 5556
        mmWidth = 51594
        BandType = 4
      end
      object EtiquetasAltCTPSDBTxt4: TppDBText
        UserName = 'EtiquetasAltCTPSDBTxt4'
        DataField = 'CBO'
        DataPipeline = ppEtiquetasAltCTPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 13494
        mmTop = 10054
        mmWidth = 9790
        BandType = 4
      end
      object EtiquetasAltCTPSDBTxt5: TppDBText
        UserName = 'EtiquetasAltCTPSDBTxt5'
        DataField = 'MOTIVO'
        DataPipeline = ppEtiquetasAltCTPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 5821
        mmTop = 10054
        mmWidth = 70644
        BandType = 4
      end
      object rpEtiquetasAltCTPSLbl1: TppLabel
        UserName = 'rpEtiquetasAltCTPSLbl1'
        Caption = 'Aumentado em:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 5821
        mmTop = 1058
        mmWidth = 19844
        BandType = 4
      end
      object rpEtiquetasAltCTPSDBTxt2: TppDBText
        UserName = 'rpEtiquetasAltCTPSDBTxt2'
        DataField = 'NOVOSALARIO'
        DataPipeline = ppEtiquetasAltCTPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 59267
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object rpEtiquetasAltCTPSLbl2: TppLabel
        UserName = 'rpEtiquetasAltCTPSLbl2'
        AutoSize = False
        Caption = 'para R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 47361
        mmTop = 1058
        mmWidth = 10583
        BandType = 4
      end
      object rpEtiquetasAltCTPSLbl3: TppLabel
        UserName = 'rpEtiquetasAltCTPSLbl3'
        Caption = 'Na função de:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 5821
        mmTop = 5556
        mmWidth = 17992
        BandType = 4
      end
      object rpEtiquetasAltCTPSLbl4: TppLabel
        UserName = 'rpEtiquetasAltCTPSLbl4'
        Caption = 'CBO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 5821
        mmTop = 10054
        mmWidth = 6615
        BandType = 4
      end
      object rpEtiquetasAltCTPSLine1: TppLine
        UserName = 'rpEtiquetasAltCTPSLine1'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 9790
        mmTop = 21696
        mmWidth = 55563
        BandType = 4
      end
      object rpEtiquetasAltCTPSLbl6: TppLabel
        UserName = 'rpEtiquetasAltCTPSLbl6'
        Caption = 'Assinatura do Empregador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 20638
        mmTop = 22490
        mmWidth = 34131
        BandType = 4
      end
    end
    object rpEtiquetasColFootBnd1: TppColumnFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpEtiquetasSmryBnd1: TppSummaryBand
      AfterPrint = rpEtiquetasSmryBnd1AfterPrint
      mmBottomOffset = 0
      mmHeight = 529
      mmPrintPosition = 0
    end
  end
  object ppEtiquetasAltCTPS: TppBDEPipeline
    DataSource = dsEtiquetasAltCTPS
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'EtiquetasAltCTPS'
    Left = 248
    Top = 13
    object ppEtiquetasAltCTPSppField1: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppEtiquetasAltCTPSppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'NOVOSALARIO'
      FieldName = 'NOVOSALARIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppEtiquetasAltCTPSppField3: TppField
      FieldAlias = 'NOVAFUNCAO'
      FieldName = 'NOVAFUNCAO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppEtiquetasAltCTPSppField4: TppField
      FieldAlias = 'MOTIVO'
      FieldName = 'MOTIVO'
      FieldLength = 89
      DisplayWidth = 89
      Position = 3
    end
    object ppEtiquetasAltCTPSppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'CBO'
      FieldName = 'CBO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
  object dsEtiquetasAltCTPS: TwwDataSource
    DataSet = qryEtiquetasAltCTPS
    Left = 144
    Top = 13
  end
  object qryEtiquetasAltCTPS: TwwQuery
    BeforeOpen = qryEtiquetasAltCTPSBeforeOpen
    AfterOpen = qryEtiquetasAltCTPSAfterOpen
    AfterScroll = qryEtiquetasAltCTPSAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TO_CHAR(H.DATAALTERFUNC,'#39'DD/MM/YYYY'#39') AS DATA,'
      '  H.SALARIO    AS NOVOSALARIO,'
      
        '  DECODE(F.IDCARGO,C.IDCARGO,'#39'A mesma'#39',C.TITULO) AS NOVAFUNCAO, ' +
        ' '
      
        '  '#39'                        Por motivo de: '#39' || MO.DESCRICAO AS M' +
        'OTIVO,'
      '  C.CBO'
      'FROM'
      '  EVOLFUNC H, FUNCIONARIO F, MOTIVO MO, CARGO C'
      'WHERE'
      '  (MO.GRUPOMOTIVO IN ('#39'A'#39','#39'D'#39'))      AND'
      '  (H.IDPESSOA      = 10329) AND'
      '  (H.IDPESSOA      = F.IDPESSOA)     AND'
      '  (H.IDMOTIVO      = MO.IDMOTIVO(+)) AND'
      '  (H.IDCARGO       = C.IDCARGO(+))')
    ValidateWithMask = True
    Left = 40
    Top = 13
  end
end
