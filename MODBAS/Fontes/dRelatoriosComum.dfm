inherited dtmRelatoriosComum: TdtmRelatoriosComum
  Left = 265
  Top = 216
  Width = 227
  Height = 141
  Caption = 'dtmRelatoriosComum'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 29
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
    Left = 28
    Top = 64
  end
  inherited qryExemplo: TwwQuery
    Left = 21
    Top = 64
  end
  inherited rpExemplo: TppReport
    Left = 25
    Top = 64
  end
  object rpCartaComun: TppReport
    AutoStop = False
    DataPipeline = ppCartaComun
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Cartas ou Comunicados'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 4350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 136
    Top = 49
    Version = '5.5'
    mmColumnWidth = 197300
    object rpCartaComunHdrBnd6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object rpCartaComunDbTxtEMPRESA: TppDBText
        UserName = 'rpCartaComunDbTxtEMPRESA'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppCartaComun
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10583
        mmTop = 3175
        mmWidth = 17198
        BandType = 0
      end
    end
    object rpCartaComunDtlBnd: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object rpCartaComunMemTEXTO: TppMemo
        UserName = 'rpCartaComunMemTEXTO'
        Caption = 'rpCartaComunMemTEXTO'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 26194
        mmLeft = 10583
        mmTop = 794
        mmWidth = 176742
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object rpCartaComunFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object rpCartaComunDbTxtEMPRESA2: TppDBText
        UserName = 'rpCartaComunDbTxtEMPRESA2'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppCartaComun
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10583
        mmTop = 3175
        mmWidth = 17198
        BandType = 8
      end
    end
    object rpCartaComunSmryBnd: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 794
      mmPrintPosition = 0
    end
    object rpCartaComunGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppCartaComun
      NewPage = True
      UserName = 'rpCartaComunGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpCartaComunGrpHdrNOME: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 53711
        mmPrintPosition = 0
        object rpCartaComunLabel1: TppLabel
          UserName = 'rpCartaComunLabel1'
          Caption = 'A'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 10583
          mmTop = 10848
          mmWidth = 2381
          BandType = 3
          GroupNo = 0
        end
        object rpCartaComunDbTxtNOME: TppDBText
          UserName = 'rpCartaComunDbTxtNOME'
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = ppCartaComun
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 10583
          mmTop = 16404
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object rpCartaComunDbTxtENDERECO: TppDBText
          UserName = 'rpCartaComunDbTxtENDERECO'
          AutoSize = True
          DataField = 'ENDERECO'
          DataPipeline = ppCartaComun
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 10583
          mmTop = 21167
          mmWidth = 19844
          BandType = 3
          GroupNo = 0
        end
        object rpCartaComunDbTxtBAIRRO: TppDBText
          UserName = 'rpCartaComunDbTxtBAIRRO'
          AutoSize = True
          DataField = 'BAIRRO'
          DataPipeline = ppCartaComun
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 10583
          mmTop = 25929
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object rpCartaComunDbTxtCEPCID: TppDBText
          UserName = 'rpCartaComunDbTxtCEPCID'
          AutoSize = True
          DataField = 'CEPCID'
          DataPipeline = ppCartaComun
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 10583
          mmTop = 30692
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object rpCartaComunLabel2: TppLabel
          UserName = 'rpCartaComunLabel2'
          Caption = 'Assunto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 10583
          mmTop = 41010
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object rpCartaComunDbTxtASSUNTO: TppDBText
          UserName = 'rpCartaComunDbTxtASSUNTO'
          AutoSize = True
          DataField = 'ASSUNTO'
          DataPipeline = ppCartaComun
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 30956
          mmTop = 41010
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object rpCartaComunLblDATA: TppLabel
          UserName = 'rpCartaComunLblDATA'
          Caption = 'rpCartaComunLblDATA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 10583
          mmTop = 1852
          mmWidth = 37306
          BandType = 3
          GroupNo = 0
        end
      end
      object rpCartaComunGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppCartaComun: TppBDEPipeline
    DataSource = dsCartaComun
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'CartaComun'
    Left = 136
    Top = 37
  end
  object dsCartaComun: TwwDataSource
    DataSet = qryCartaComun
    Left = 136
    Top = 25
  end
  object qryCartaComun: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ('#39'REFER'#39') AS EMPRESA,'
      '  DECODE(P.TIPO, '#39'F'#39', P.NOME, P.RAZAOSOCIAL) AS NOME, P.TIPO,'
      
        '  RTRIM(E.LOGRADOURO) ||'#39', '#39'|| E.NUMERO || DECODE(RTRIM(E.COMPLE' +
        'MENTO),'
      '    NULL, '#39#39', '#39' - '#39' || RTRIM(E.COMPLEMENTO)) AS ENDERECO,'
      '  E.BAIRRO,'
      '  (RTRIM(SUBSTR(E.CEP,1,5)) ||'#39'-'#39'|| RTRIM(SUBSTR(E.CEP,6,3)) ||'
      '    '#39' '#39' || CI.NOME || '#39' - '#39' || ES.CODESTADO) AS CEPCID,'
      '  CARTA.DATACARTA, CARTA.ASSUNTO, CARTA.TEXTO'
      'FROM'
      
        '  PESSOA P, PESSOAFISICA PEFIS, ENDPESS E, CIDADES CI, ESTADO ES' +
        ', CARTA'
      'WHERE'
      '  (P.IDPESSOA         = 10329) AND'
      '  (CARTA.NUMCARTA     = 1) AND'
      '  (P.IDPESSOA         = PEFIS.IDPESSOA(+)) AND'
      '  (P.IDENDRESIDENCIAL = E.IDENDERECO(+))   AND'
      '  (E.IDCIDADES        = CI.IDCIDADES(+))   AND'
      '  (CI.IDESTADO        = ES.IDESTADO(+))')
    ValidateWithMask = True
    Left = 136
    Top = 13
  end
  object dsgnRelatorios: TppDesigner
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
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 25
    Top = 13
  end
end
